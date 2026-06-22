// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2023_04_20.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Describes the API operations for creating, managing, fine-turning, and
/// evaluating Amazon Bedrock models.
class Bedrock {
  final _s.RestJsonProtocol _protocol;
  factory Bedrock({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'bedrock',
    );
    return Bedrock._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Bedrock._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Deletes one or more advanced prompt optimization jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifiers] :
  /// A list of advanced prompt optimization job identifiers (ARNs or IDs) to
  /// delete.
  Future<BatchDeleteAdvancedPromptOptimizationJobResponse>
      batchDeleteAdvancedPromptOptimizationJob({
    required List<String> jobIdentifiers,
  }) async {
    final $payload = <String, dynamic>{
      'jobIdentifiers': jobIdentifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/advanced-prompt-optimization-job/batch-delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteAdvancedPromptOptimizationJobResponse.fromJson(response);
  }

  /// Creates an advanced prompt optimization job. The job optimizes your prompt
  /// templates for specific models using your evaluation dataset and criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputConfig] :
  /// Specifies the S3 location of your JSONL input file containing prompt
  /// templates and evaluation samples.
  ///
  /// Parameter [jobName] :
  /// A name for the advanced prompt optimization job.
  ///
  /// Parameter [modelConfigurations] :
  /// A list of model configurations specifying the target models for prompt
  /// optimization. You can specify up to 5 models.
  ///
  /// Parameter [outputConfig] :
  /// Specifies the S3 location where optimization results will be stored.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request but does not return an error.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The Amazon Resource Name (ARN) of the KMS key used for encrypting the
  /// output data. If not specified, the output is encrypted with an
  /// Amazon-owned KMS key.
  ///
  /// Parameter [jobDescription] :
  /// A description of the advanced prompt optimization job.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the advanced prompt optimization job.
  Future<CreateAdvancedPromptOptimizationJobResponse>
      createAdvancedPromptOptimizationJob({
    required AdvancedPromptOptimizationInputConfig inputConfig,
    required String jobName,
    required List<ModelConfiguration> modelConfigurations,
    required AdvancedPromptOptimizationOutputConfig outputConfig,
    String? clientToken,
    String? encryptionKeyArn,
    String? jobDescription,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'inputConfig': inputConfig,
      'jobName': jobName,
      'modelConfigurations': modelConfigurations,
      'outputConfig': outputConfig,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (jobDescription != null) 'jobDescription': jobDescription,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/advanced-prompt-optimization-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAdvancedPromptOptimizationJobResponse.fromJson(response);
  }

  /// Gets information about an advanced prompt optimization job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// The ARN or ID of the advanced prompt optimization job.
  Future<GetAdvancedPromptOptimizationJobResponse>
      getAdvancedPromptOptimizationJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/advanced-prompt-optimization-jobs/${Uri.encodeComponent(jobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAdvancedPromptOptimizationJobResponse.fromJson(response);
  }

  /// Lists the advanced prompt optimization jobs in your account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token in a subsequent request to
  /// get the next set of results.
  ///
  /// Parameter [sortBy] :
  /// The field to sort the results by.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the results.
  Future<ListAdvancedPromptOptimizationJobsResponse>
      listAdvancedPromptOptimizationJobs({
    int? maxResults,
    String? nextToken,
    SortJobsBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/advanced-prompt-optimization-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAdvancedPromptOptimizationJobsResponse.fromJson(response);
  }

  /// Stops an advanced prompt optimization job that is in progress.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// The ARN or ID of the advanced prompt optimization job to stop.
  Future<void> stopAdvancedPromptOptimizationJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/advanced-prompt-optimization-jobs/${Uri.encodeComponent(jobIdentifier)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get usecase for model access.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetUseCaseForModelAccessResponse> getUseCaseForModelAccess() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/use-case-for-model-access',
      exceptionFnMap: _exceptionFns,
    );
    return GetUseCaseForModelAccessResponse.fromJson(response);
  }

  /// Put usecase for model access.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [formData] :
  /// Put customer profile Request.
  Future<void> putUseCaseForModelAccess({
    required Uint8List formData,
  }) async {
    final $payload = <String, dynamic>{
      'formData': base64Encode(formData),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/use-case-for-model-access',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an Automated Reasoning policy for Amazon Bedrock Guardrails.
  /// Automated Reasoning policies use mathematical techniques to detect
  /// hallucinations, suggest corrections, and highlight unstated assumptions in
  /// the responses of your GenAI application.
  ///
  /// To create a policy, you upload a source document that describes the rules
  /// that you're encoding. Automated Reasoning extracts important concepts from
  /// the source document that will become variables in the policy and infers
  /// policy rules.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// A unique name for the Automated Reasoning policy. The name must be between
  /// 1 and 63 characters and can contain letters, numbers, hyphens, and
  /// underscores.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than once. If this token matches a previous request, Amazon
  /// Bedrock ignores the request but doesn't return an error.
  ///
  /// Parameter [description] :
  /// A description of the Automated Reasoning policy. Use this to provide
  /// context about the policy's purpose and the types of validations it
  /// performs.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier of the KMS key to use for encrypting the automated
  /// reasoning policy and its associated artifacts. If you don't specify a KMS
  /// key, Amazon Bedrock uses an KMS managed key for encryption. For enhanced
  /// security and control, you can specify a customer managed KMS key.
  ///
  /// Parameter [policyDefinition] :
  /// The policy definition that contains the formal logic rules, variables, and
  /// custom variable types used to validate foundation model responses in your
  /// application.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the Automated Reasoning policy. Tags help
  /// you organize and manage your policies.
  Future<CreateAutomatedReasoningPolicyResponse>
      createAutomatedReasoningPolicy({
    required String name,
    String? clientRequestToken,
    String? description,
    String? kmsKeyId,
    AutomatedReasoningPolicyDefinition? policyDefinition,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (policyDefinition != null) 'policyDefinition': policyDefinition,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/automated-reasoning-policies',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAutomatedReasoningPolicyResponse.fromJson(response);
  }

  /// Retrieves details about an Automated Reasoning policy or policy version.
  /// Returns information including the policy definition, metadata, and
  /// timestamps.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy to
  /// retrieve. Can be either the unversioned ARN for the draft policy or an ARN
  /// for a specific policy version.
  Future<GetAutomatedReasoningPolicyResponse> getAutomatedReasoningPolicy({
    required String policyArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAutomatedReasoningPolicyResponse.fromJson(response);
  }

  /// Updates an existing Automated Reasoning policy with new rules, variables,
  /// or configuration. This creates a new version of the policy while
  /// preserving the previous version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy to
  /// update. This must be the ARN of a draft policy.
  ///
  /// Parameter [policyDefinition] :
  /// The updated policy definition containing the formal logic rules,
  /// variables, and types.
  ///
  /// Parameter [description] :
  /// The updated description for the Automated Reasoning policy.
  ///
  /// Parameter [name] :
  /// The updated name for the Automated Reasoning policy.
  Future<UpdateAutomatedReasoningPolicyResponse>
      updateAutomatedReasoningPolicy({
    required String policyArn,
    required AutomatedReasoningPolicyDefinition policyDefinition,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'policyDefinition': policyDefinition,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAutomatedReasoningPolicyResponse.fromJson(response);
  }

  /// Deletes an Automated Reasoning policy or policy version. This operation is
  /// idempotent. If you delete a policy more than once, each call succeeds.
  /// Deleting a policy removes it permanently and cannot be undone.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy to
  /// delete.
  ///
  /// Parameter [force] :
  /// Specifies whether to force delete the automated reasoning policy even if
  /// it has active resources. When <code>false</code>, Amazon Bedrock validates
  /// if all artifacts have been deleted (e.g. policy version, test case, test
  /// result) for a policy before deletion. When <code>true</code>, Amazon
  /// Bedrock will delete the policy and all its artifacts without validation.
  /// Default is <code>false</code>.
  Future<void> deleteAutomatedReasoningPolicy({
    required String policyArn,
    bool? force,
  }) async {
    final $query = <String, List<String>>{
      if (force != null) 'force': [force.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all Automated Reasoning policies in your account, with optional
  /// filtering by policy ARN. This helps you manage and discover existing
  /// policies.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of policies to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request to retrieve the next page of
  /// results.
  ///
  /// Parameter [policyArn] :
  /// Optional filter to list only the policy versions with the specified Amazon
  /// Resource Name (ARN). If not provided, the DRAFT versions for all policies
  /// are listed.
  Future<ListAutomatedReasoningPoliciesResponse>
      listAutomatedReasoningPolicies({
    int? maxResults,
    String? nextToken,
    String? policyArn,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (policyArn != null) 'policyArn': [policyArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/automated-reasoning-policies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAutomatedReasoningPoliciesResponse.fromJson(response);
  }

  /// Cancels a running Automated Reasoning policy build workflow. This stops
  /// the policy generation process and prevents further processing of the
  /// source documents.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowId] :
  /// The unique identifier of the build workflow to cancel. You can get this ID
  /// from the StartAutomatedReasoningPolicyBuildWorkflow response or by listing
  /// build workflows.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy whose
  /// build workflow you want to cancel.
  Future<void> cancelAutomatedReasoningPolicyBuildWorkflow({
    required String buildWorkflowId,
    required String policyArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a test for an Automated Reasoning policy. Tests validate that your
  /// policy works as expected by providing sample inputs and expected outcomes.
  /// Use tests to verify policy behavior before deploying to production.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [expectedAggregatedFindingsResult] :
  /// The expected result of the Automated Reasoning check. Valid values
  /// include: , TOO_COMPLEX, and NO_TRANSLATIONS.
  ///
  /// <ul>
  /// <li>
  /// <code>VALID</code> - The claims are true. The claims are implied by the
  /// premises and the Automated Reasoning policy. Given the Automated Reasoning
  /// policy and premises, it is not possible for these claims to be false. In
  /// other words, there are no alternative answers that are true that
  /// contradict the claims.
  /// </li>
  /// <li>
  /// <code>INVALID</code> - The claims are false. The claims are not implied by
  /// the premises and Automated Reasoning policy. Furthermore, there exists
  /// different claims that are consistent with the premises and Automated
  /// Reasoning policy.
  /// </li>
  /// <li>
  /// <code>SATISFIABLE</code> - The claims can be true or false. It depends on
  /// what assumptions are made for the claim to be implied from the premises
  /// and Automated Reasoning policy rules. In this situation, different
  /// assumptions can make input claims false and alternative claims true.
  /// </li>
  /// <li>
  /// <code>IMPOSSIBLE</code> - Automated Reasoning can’t make a statement about
  /// the claims. This can happen if the premises are logically incorrect, or if
  /// there is a conflict within the Automated Reasoning policy itself.
  /// </li>
  /// <li>
  /// <code>TRANSLATION_AMBIGUOUS</code> - Detected an ambiguity in the
  /// translation meant it would be unsound to continue with validity checking.
  /// Additional context or follow-up questions might be needed to get
  /// translation to succeed.
  /// </li>
  /// <li>
  /// <code>TOO_COMPLEX</code> - The input contains too much information for
  /// Automated Reasoning to process within its latency limits.
  /// </li>
  /// <li>
  /// <code>NO_TRANSLATIONS</code> - Identifies that some or all of the input
  /// prompt wasn't translated into logic. This can happen if the input isn't
  /// relevant to the Automated Reasoning policy, or if the policy doesn't have
  /// variables to model relevant input. If Automated Reasoning can't translate
  /// anything, you get a single <code>NO_TRANSLATIONS</code> finding. You might
  /// also see a <code>NO_TRANSLATIONS</code> (along with other findings) if
  /// some part of the validation isn't translated.
  /// </li>
  /// </ul>
  ///
  /// Parameter [guardContent] :
  /// The output content that's validated by the Automated Reasoning policy.
  /// This represents the foundation model response that will be checked for
  /// accuracy.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy for which
  /// to create the test.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error.
  ///
  /// Parameter [confidenceThreshold] :
  /// The minimum confidence level for logic validation. Content that meets the
  /// threshold is considered a high-confidence finding that can be validated.
  ///
  /// Parameter [queryContent] :
  /// The input query or prompt that generated the content. This provides
  /// context for the validation.
  Future<CreateAutomatedReasoningPolicyTestCaseResponse>
      createAutomatedReasoningPolicyTestCase({
    required AutomatedReasoningCheckResult expectedAggregatedFindingsResult,
    required String guardContent,
    required String policyArn,
    String? clientRequestToken,
    double? confidenceThreshold,
    String? queryContent,
  }) async {
    _s.validateNumRange(
      'confidenceThreshold',
      confidenceThreshold,
      0,
      1,
    );
    final $payload = <String, dynamic>{
      'expectedAggregatedFindingsResult':
          expectedAggregatedFindingsResult.value,
      'guardContent': guardContent,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (confidenceThreshold != null)
        'confidenceThreshold': _s.encodeJsonDouble(confidenceThreshold),
      if (queryContent != null) 'queryContent': queryContent,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/test-cases',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAutomatedReasoningPolicyTestCaseResponse.fromJson(response);
  }

  /// Creates a new version of an existing Automated Reasoning policy. This
  /// allows you to iterate on your policy rules while maintaining previous
  /// versions for rollback or comparison purposes.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lastUpdatedDefinitionHash] :
  /// The hash of the current policy definition used as a concurrency token to
  /// ensure the policy hasn't been modified since you last retrieved it.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy for which
  /// to create a version.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the policy version.
  Future<CreateAutomatedReasoningPolicyVersionResponse>
      createAutomatedReasoningPolicyVersion({
    required String lastUpdatedDefinitionHash,
    required String policyArn,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'lastUpdatedDefinitionHash': lastUpdatedDefinitionHash,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/versions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAutomatedReasoningPolicyVersionResponse.fromJson(response);
  }

  /// Deletes an Automated Reasoning policy build workflow and its associated
  /// artifacts. This permanently removes the workflow history and any generated
  /// assets.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowId] :
  /// The unique identifier of the build workflow to delete.
  ///
  /// Parameter [lastUpdatedAt] :
  /// The timestamp when the build workflow was last updated. This is used for
  /// optimistic concurrency control to prevent accidental deletion of workflows
  /// that have been modified.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy whose
  /// build workflow you want to delete.
  Future<void> deleteAutomatedReasoningPolicyBuildWorkflow({
    required String buildWorkflowId,
    required DateTime lastUpdatedAt,
    required String policyArn,
  }) async {
    final $query = <String, List<String>>{
      'updatedAt': [_s.iso8601ToJson(lastUpdatedAt).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Automated Reasoning policy test. This operation is idempotent;
  /// if you delete a test more than once, each call succeeds.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lastUpdatedAt] :
  /// The timestamp when the test was last updated. This is used as a
  /// concurrency token to prevent conflicting modifications.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy that
  /// contains the test.
  ///
  /// Parameter [testCaseId] :
  /// The unique identifier of the test to delete.
  Future<void> deleteAutomatedReasoningPolicyTestCase({
    required DateTime lastUpdatedAt,
    required String policyArn,
    required String testCaseId,
  }) async {
    final $query = <String, List<String>>{
      'updatedAt': [_s.iso8601ToJson(lastUpdatedAt).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/test-cases/${Uri.encodeComponent(testCaseId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Exports the policy definition for an Automated Reasoning policy version.
  /// Returns the complete policy definition including rules, variables, and
  /// custom variable types in a structured format.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy to
  /// export. Can be either the unversioned ARN for the draft policy or a
  /// versioned ARN for a specific policy version.
  Future<ExportAutomatedReasoningPolicyVersionResponse>
      exportAutomatedReasoningPolicyVersion({
    required String policyArn,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/export',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ExportAutomatedReasoningPolicyVersionResponse(
      policyDefinition: AutomatedReasoningPolicyDefinition.fromJson($json),
    );
  }

  /// Retrieves the current annotations for an Automated Reasoning policy build
  /// workflow. Annotations contain corrections to the rules, variables and
  /// types to be applied to the policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowId] :
  /// The unique identifier of the build workflow whose annotations you want to
  /// retrieve.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy whose
  /// annotations you want to retrieve.
  Future<GetAutomatedReasoningPolicyAnnotationsResponse>
      getAutomatedReasoningPolicyAnnotations({
    required String buildWorkflowId,
    required String policyArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}/annotations',
      exceptionFnMap: _exceptionFns,
    );
    return GetAutomatedReasoningPolicyAnnotationsResponse.fromJson(response);
  }

  /// Retrieves detailed information about an Automated Reasoning policy build
  /// workflow, including its status, configuration, and metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowId] :
  /// The unique identifier of the build workflow to retrieve.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy whose
  /// build workflow you want to retrieve.
  Future<GetAutomatedReasoningPolicyBuildWorkflowResponse>
      getAutomatedReasoningPolicyBuildWorkflow({
    required String buildWorkflowId,
    required String policyArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAutomatedReasoningPolicyBuildWorkflowResponse.fromJson(response);
  }

  /// Retrieves the resulting assets from a completed Automated Reasoning policy
  /// build workflow, including build logs, quality reports, and generated
  /// policy artifacts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [assetType] :
  /// The type of asset to retrieve (e.g., BUILD_LOG, QUALITY_REPORT,
  /// POLICY_DEFINITION, GENERATED_TEST_CASES, POLICY_SCENARIOS,
  /// FIDELITY_REPORT, ASSET_MANIFEST, SOURCE_DOCUMENT).
  ///
  /// Parameter [buildWorkflowId] :
  /// The unique identifier of the build workflow whose result assets you want
  /// to retrieve.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy whose
  /// build workflow assets you want to retrieve.
  ///
  /// Parameter [assetId] :
  /// The unique identifier of the specific asset to retrieve when multiple
  /// assets of the same type exist. This is required when retrieving
  /// SOURCE_DOCUMENT assets, as multiple source documents may have been used in
  /// the workflow. The asset ID can be obtained from the asset manifest.
  Future<GetAutomatedReasoningPolicyBuildWorkflowResultAssetsResponse>
      getAutomatedReasoningPolicyBuildWorkflowResultAssets({
    required AutomatedReasoningPolicyBuildResultAssetType assetType,
    required String buildWorkflowId,
    required String policyArn,
    String? assetId,
  }) async {
    final $query = <String, List<String>>{
      'assetType': [assetType.value],
      if (assetId != null) 'assetId': [assetId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}/result-assets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetAutomatedReasoningPolicyBuildWorkflowResultAssetsResponse
        .fromJson(response);
  }

  /// Retrieves the next test scenario for validating an Automated Reasoning
  /// policy. This is used during the interactive policy refinement process to
  /// test policy behavior.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowId] :
  /// The unique identifier of the build workflow associated with the test
  /// scenarios.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy for which
  /// you want to get the next test scenario.
  Future<GetAutomatedReasoningPolicyNextScenarioResponse>
      getAutomatedReasoningPolicyNextScenario({
    required String buildWorkflowId,
    required String policyArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}/scenarios',
      exceptionFnMap: _exceptionFns,
    );
    return GetAutomatedReasoningPolicyNextScenarioResponse.fromJson(response);
  }

  /// Retrieves details about a specific Automated Reasoning policy test.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy that
  /// contains the test.
  ///
  /// Parameter [testCaseId] :
  /// The unique identifier of the test to retrieve.
  Future<GetAutomatedReasoningPolicyTestCaseResponse>
      getAutomatedReasoningPolicyTestCase({
    required String policyArn,
    required String testCaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/test-cases/${Uri.encodeComponent(testCaseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAutomatedReasoningPolicyTestCaseResponse.fromJson(response);
  }

  /// Retrieves the test result for a specific Automated Reasoning policy test.
  /// Returns detailed validation findings and execution status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowId] :
  /// The build workflow identifier. The build workflow must display a
  /// <code>COMPLETED</code> status to get results.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy.
  ///
  /// Parameter [testCaseId] :
  /// The unique identifier of the test for which to retrieve results.
  Future<GetAutomatedReasoningPolicyTestResultResponse>
      getAutomatedReasoningPolicyTestResult({
    required String buildWorkflowId,
    required String policyArn,
    required String testCaseId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}/test-cases/${Uri.encodeComponent(testCaseId)}/test-results',
      exceptionFnMap: _exceptionFns,
    );
    return GetAutomatedReasoningPolicyTestResultResponse.fromJson(response);
  }

  /// Lists all build workflows for an Automated Reasoning policy, showing the
  /// history of policy creation and modification attempts.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy whose
  /// build workflows you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of build workflows to return in a single response.
  /// Valid range is 1-100.
  ///
  /// Parameter [nextToken] :
  /// A pagination token from a previous request to continue listing build
  /// workflows from where the previous request left off.
  Future<ListAutomatedReasoningPolicyBuildWorkflowsResponse>
      listAutomatedReasoningPolicyBuildWorkflows({
    required String policyArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAutomatedReasoningPolicyBuildWorkflowsResponse.fromJson(
        response);
  }

  /// Lists tests for an Automated Reasoning policy. We recommend using
  /// pagination to ensure that the operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy for which
  /// to list tests.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tests to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous request to retrieve the next page of
  /// results.
  Future<ListAutomatedReasoningPolicyTestCasesResponse>
      listAutomatedReasoningPolicyTestCases({
    required String policyArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/test-cases',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAutomatedReasoningPolicyTestCasesResponse.fromJson(response);
  }

  /// Lists test results for an Automated Reasoning policy, showing how the
  /// policy performed against various test scenarios and validation checks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowId] :
  /// The unique identifier of the build workflow whose test results you want to
  /// list.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy whose
  /// test results you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of test results to return in a single response. Valid
  /// range is 1-100.
  ///
  /// Parameter [nextToken] :
  /// A pagination token from a previous request to continue listing test
  /// results from where the previous request left off.
  Future<ListAutomatedReasoningPolicyTestResultsResponse>
      listAutomatedReasoningPolicyTestResults({
    required String buildWorkflowId,
    required String policyArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}/test-results',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAutomatedReasoningPolicyTestResultsResponse.fromJson(response);
  }

  /// Starts a new build workflow for an Automated Reasoning policy. This
  /// initiates the process of analyzing source documents and generating policy
  /// rules, variables, and types.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowType] :
  /// The type of build workflow to start (e.g., DOCUMENT_INGESTION for
  /// processing new documents, POLICY_REPAIR for fixing existing policies).
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy for which
  /// to start the build workflow.
  ///
  /// Parameter [sourceContent] :
  /// The source content for the build workflow, such as documents to analyze or
  /// repair instructions for existing policies.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than once. If this token matches a previous request, Amazon
  /// Bedrock ignores the request but doesn't return an error.
  Future<StartAutomatedReasoningPolicyBuildWorkflowResponse>
      startAutomatedReasoningPolicyBuildWorkflow({
    required AutomatedReasoningPolicyBuildWorkflowType buildWorkflowType,
    required String policyArn,
    required AutomatedReasoningPolicyBuildWorkflowSource sourceContent,
    String? clientRequestToken,
  }) async {
    final headers = <String, String>{
      if (clientRequestToken != null)
        'x-amz-client-token': clientRequestToken.toString(),
    };
    final response = await _protocol.send(
      payload: sourceContent,
      method: 'POST',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowType.value)}/start',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return StartAutomatedReasoningPolicyBuildWorkflowResponse.fromJson(
        response);
  }

  /// Initiates a test workflow to validate Automated Reasoning policy tests.
  /// The workflow executes the specified tests against the policy and generates
  /// validation results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [buildWorkflowId] :
  /// The build workflow identifier. The build workflow must show a
  /// <code>COMPLETED</code> status before running tests.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy to test.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request but doesn't return an error.
  ///
  /// Parameter [testCaseIds] :
  /// The list of test identifiers to run. If not provided, all tests for the
  /// policy are run.
  Future<StartAutomatedReasoningPolicyTestWorkflowResponse>
      startAutomatedReasoningPolicyTestWorkflow({
    required String buildWorkflowId,
    required String policyArn,
    String? clientRequestToken,
    List<String>? testCaseIds,
  }) async {
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (testCaseIds != null) 'testCaseIds': testCaseIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}/test-workflows',
      exceptionFnMap: _exceptionFns,
    );
    return StartAutomatedReasoningPolicyTestWorkflowResponse.fromJson(response);
  }

  /// Updates the annotations for an Automated Reasoning policy build workflow.
  /// This allows you to modify extracted rules, variables, and types before
  /// finalizing the policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [annotations] :
  /// The updated annotations containing modified rules, variables, and types
  /// for the policy.
  ///
  /// Parameter [buildWorkflowId] :
  /// The unique identifier of the build workflow whose annotations you want to
  /// update.
  ///
  /// Parameter [lastUpdatedAnnotationSetHash] :
  /// The hash value of the annotation set that you're updating. This is used
  /// for optimistic concurrency control to prevent conflicting updates.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy whose
  /// annotations you want to update.
  Future<UpdateAutomatedReasoningPolicyAnnotationsResponse>
      updateAutomatedReasoningPolicyAnnotations({
    required List<AutomatedReasoningPolicyAnnotation> annotations,
    required String buildWorkflowId,
    required String lastUpdatedAnnotationSetHash,
    required String policyArn,
  }) async {
    final $payload = <String, dynamic>{
      'annotations': annotations,
      'lastUpdatedAnnotationSetHash': lastUpdatedAnnotationSetHash,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/build-workflows/${Uri.encodeComponent(buildWorkflowId)}/annotations',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAutomatedReasoningPolicyAnnotationsResponse.fromJson(response);
  }

  /// Updates an existing Automated Reasoning policy test. You can modify the
  /// content, query, expected result, and confidence threshold.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [expectedAggregatedFindingsResult] :
  /// The updated expected result of the Automated Reasoning check.
  ///
  /// Parameter [guardContent] :
  /// The updated content to be validated by the Automated Reasoning policy.
  ///
  /// Parameter [lastUpdatedAt] :
  /// The timestamp when the test was last updated. This is used as a
  /// concurrency token to prevent conflicting modifications.
  ///
  /// Parameter [policyArn] :
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy that
  /// contains the test.
  ///
  /// Parameter [testCaseId] :
  /// The unique identifier of the test to update.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error.
  ///
  /// Parameter [confidenceThreshold] :
  /// The updated minimum confidence level for logic validation. If null is
  /// provided, the threshold will be removed.
  ///
  /// Parameter [queryContent] :
  /// The updated input query or prompt that generated the content.
  Future<UpdateAutomatedReasoningPolicyTestCaseResponse>
      updateAutomatedReasoningPolicyTestCase({
    required AutomatedReasoningCheckResult expectedAggregatedFindingsResult,
    required String guardContent,
    required DateTime lastUpdatedAt,
    required String policyArn,
    required String testCaseId,
    String? clientRequestToken,
    double? confidenceThreshold,
    String? queryContent,
  }) async {
    _s.validateNumRange(
      'confidenceThreshold',
      confidenceThreshold,
      0,
      1,
    );
    final $payload = <String, dynamic>{
      'expectedAggregatedFindingsResult':
          expectedAggregatedFindingsResult.value,
      'guardContent': guardContent,
      'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (confidenceThreshold != null)
        'confidenceThreshold': _s.encodeJsonDouble(confidenceThreshold),
      if (queryContent != null) 'queryContent': queryContent,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/automated-reasoning-policies/${Uri.encodeComponent(policyArn)}/test-cases/${Uri.encodeComponent(testCaseId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAutomatedReasoningPolicyTestCaseResponse.fromJson(response);
  }

  /// Creates an endpoint for a model from Amazon Bedrock Marketplace. The
  /// endpoint is hosted by Amazon SageMaker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointConfig] :
  /// The configuration for the endpoint, including the number and type of
  /// instances to use.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint. This name must be unique within your Amazon Web
  /// Services account and region.
  ///
  /// Parameter [modelSourceIdentifier] :
  /// The ARN of the model from Amazon Bedrock Marketplace that you want to
  /// deploy to the endpoint.
  ///
  /// Parameter [acceptEula] :
  /// Indicates whether you accept the end-user license agreement (EULA) for the
  /// model. Set to <code>true</code> to accept the EULA.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. This token is listed as not required because
  /// Amazon Web Services SDKs automatically generate it for you and set this
  /// parameter. If you're not using the Amazon Web Services SDK or the CLI, you
  /// must provide this token or the action will fail.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs to apply to the underlying Amazon SageMaker
  /// endpoint. You can use these tags to organize and identify your Amazon Web
  /// Services resources.
  Future<CreateMarketplaceModelEndpointResponse>
      createMarketplaceModelEndpoint({
    required EndpointConfig endpointConfig,
    required String endpointName,
    required String modelSourceIdentifier,
    bool? acceptEula,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'endpointConfig': endpointConfig,
      'endpointName': endpointName,
      'modelSourceIdentifier': modelSourceIdentifier,
      if (acceptEula != null) 'acceptEula': acceptEula,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/marketplace-model/endpoints',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMarketplaceModelEndpointResponse.fromJson(response);
  }

  /// Deletes an endpoint for a model from Amazon Bedrock Marketplace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) of the endpoint you want to delete.
  Future<void> deleteMarketplaceModelEndpoint({
    required String endpointArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/marketplace-model/endpoints/${Uri.encodeComponent(endpointArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters an endpoint for a model from Amazon Bedrock Marketplace. This
  /// operation removes the endpoint's association with Amazon Bedrock but does
  /// not delete the underlying Amazon SageMaker endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) of the endpoint you want to deregister.
  Future<void> deregisterMarketplaceModelEndpoint({
    required String endpointArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/marketplace-model/endpoints/${Uri.encodeComponent(endpointArn)}/registration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves details about a specific endpoint for a model from Amazon
  /// Bedrock Marketplace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) of the endpoint you want to get information
  /// about.
  Future<GetMarketplaceModelEndpointResponse> getMarketplaceModelEndpoint({
    required String endpointArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/marketplace-model/endpoints/${Uri.encodeComponent(endpointArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMarketplaceModelEndpointResponse.fromJson(response);
  }

  /// Lists the endpoints for models from Amazon Bedrock Marketplace in your
  /// Amazon Web Services account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. If more results
  /// are available, the operation returns a <code>NextToken</code> value.
  ///
  /// Parameter [modelSourceEquals] :
  /// If specified, only endpoints for the given model source identifier are
  /// returned.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. You receive this token from a
  /// previous <code>ListMarketplaceModelEndpoints</code> call.
  Future<ListMarketplaceModelEndpointsResponse> listMarketplaceModelEndpoints({
    int? maxResults,
    String? modelSourceEquals,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (modelSourceEquals != null)
        'modelSourceIdentifier': [modelSourceEquals],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/marketplace-model/endpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMarketplaceModelEndpointsResponse.fromJson(response);
  }

  /// Registers an existing Amazon SageMaker endpoint with Amazon Bedrock
  /// Marketplace, allowing it to be used with Amazon Bedrock APIs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointIdentifier] :
  /// The ARN of the Amazon SageMaker endpoint you want to register with Amazon
  /// Bedrock Marketplace.
  ///
  /// Parameter [modelSourceIdentifier] :
  /// The ARN of the model from Amazon Bedrock Marketplace that is deployed on
  /// the endpoint.
  Future<RegisterMarketplaceModelEndpointResponse>
      registerMarketplaceModelEndpoint({
    required String endpointIdentifier,
    required String modelSourceIdentifier,
  }) async {
    final $payload = <String, dynamic>{
      'modelSourceIdentifier': modelSourceIdentifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/marketplace-model/endpoints/${Uri.encodeComponent(endpointIdentifier)}/registration',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterMarketplaceModelEndpointResponse.fromJson(response);
  }

  /// Updates the configuration of an existing endpoint for a model from Amazon
  /// Bedrock Marketplace.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endpointArn] :
  /// The Amazon Resource Name (ARN) of the endpoint you want to update.
  ///
  /// Parameter [endpointConfig] :
  /// The new configuration for the endpoint, including the number and type of
  /// instances to use.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request. This token is listed as not required because
  /// Amazon Web Services SDKs automatically generate it for you and set this
  /// parameter. If you're not using the Amazon Web Services SDK or the CLI, you
  /// must provide this token or the action will fail.
  Future<UpdateMarketplaceModelEndpointResponse>
      updateMarketplaceModelEndpoint({
    required String endpointArn,
    required EndpointConfig endpointConfig,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'endpointConfig': endpointConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/marketplace-model/endpoints/${Uri.encodeComponent(endpointArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMarketplaceModelEndpointResponse.fromJson(response);
  }

  /// Deploys a custom model for on-demand inference in Amazon Bedrock. After
  /// you deploy your custom model, you use the deployment's Amazon Resource
  /// Name (ARN) as the <code>modelId</code> parameter when you submit prompts
  /// and generate responses with model inference.
  ///
  /// For more information about setting up on-demand inference for custom
  /// models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-use.html">Set
  /// up inference for a custom model</a>.
  ///
  /// The following actions are related to the
  /// <code>CreateCustomModelDeployment</code> operation:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetCustomModelDeployment.html">GetCustomModelDeployment</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_ListCustomModelDeployments.html">ListCustomModelDeployments</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_DeleteCustomModelDeployment.html">DeleteCustomModelDeployment</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelArn] :
  /// The Amazon Resource Name (ARN) of the custom model to deploy for on-demand
  /// inference. The custom model must be in the <code>Active</code> state.
  ///
  /// Parameter [modelDeploymentName] :
  /// The name for the custom model deployment. The name must be unique within
  /// your Amazon Web Services account and Region.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [description] :
  /// A description for the custom model deployment to help you identify its
  /// purpose.
  ///
  /// Parameter [tags] :
  /// Tags to assign to the custom model deployment. You can use tags to
  /// organize and track your Amazon Web Services resources for cost allocation
  /// and management purposes.
  Future<CreateCustomModelDeploymentResponse> createCustomModelDeployment({
    required String modelArn,
    required String modelDeploymentName,
    String? clientRequestToken,
    String? description,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'modelArn': modelArn,
      'modelDeploymentName': modelDeploymentName,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/model-customization/custom-model-deployments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomModelDeploymentResponse.fromJson(response);
  }

  /// Deletes a custom model deployment. This operation stops the deployment and
  /// removes it from your account. After deletion, the deployment ARN can no
  /// longer be used for inference requests.
  ///
  /// The following actions are related to the
  /// <code>DeleteCustomModelDeployment</code> operation:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateCustomModelDeployment.html">CreateCustomModelDeployment</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetCustomModelDeployment.html">GetCustomModelDeployment</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_ListCustomModelDeployments.html">ListCustomModelDeployments</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [customModelDeploymentIdentifier] :
  /// The Amazon Resource Name (ARN) or name of the custom model deployment to
  /// delete.
  Future<void> deleteCustomModelDeployment({
    required String customModelDeploymentIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/model-customization/custom-model-deployments/${Uri.encodeComponent(customModelDeploymentIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about a custom model deployment, including its
  /// status, configuration, and metadata. Use this operation to monitor the
  /// deployment status and retrieve details needed for inference requests.
  ///
  /// The following actions are related to the
  /// <code>GetCustomModelDeployment</code> operation:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateCustomModelDeployment.html">CreateCustomModelDeployment</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_ListCustomModelDeployments.html">ListCustomModelDeployments</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_DeleteCustomModelDeployment.html">DeleteCustomModelDeployment</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [customModelDeploymentIdentifier] :
  /// The Amazon Resource Name (ARN) or name of the custom model deployment to
  /// retrieve information about.
  Future<GetCustomModelDeploymentResponse> getCustomModelDeployment({
    required String customModelDeploymentIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/model-customization/custom-model-deployments/${Uri.encodeComponent(customModelDeploymentIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCustomModelDeploymentResponse.fromJson(response);
  }

  /// Lists custom model deployments in your account. You can filter the results
  /// by creation time, name, status, and associated model. Use this operation
  /// to manage and monitor your custom model deployments.
  ///
  /// We recommend using pagination to ensure that the operation returns quickly
  /// and successfully.
  ///
  /// The following actions are related to the
  /// <code>ListCustomModelDeployments</code> operation:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateCustomModelDeployment.html">CreateCustomModelDeployment</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetCustomModelDeployment.html">GetCustomModelDeployment</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_DeleteCustomModelDeployment.html">DeleteCustomModelDeployment</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [createdAfter] :
  /// Filters deployments created after the specified date and time.
  ///
  /// Parameter [createdBefore] :
  /// Filters deployments created before the specified date and time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [modelArnEquals] :
  /// Filters deployments by the Amazon Resource Name (ARN) of the associated
  /// custom model.
  ///
  /// Parameter [nameContains] :
  /// Filters deployments whose names contain the specified string.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results. Use this token to retrieve
  /// additional results when the response is truncated.
  ///
  /// Parameter [sortBy] :
  /// The field to sort the results by. The only supported value is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the results. Valid values are <code>Ascending</code>
  /// and <code>Descending</code>. Default is <code>Descending</code>.
  ///
  /// Parameter [statusEquals] :
  /// Filters deployments by status. Valid values are <code>CREATING</code>,
  /// <code>ACTIVE</code>, and <code>FAILED</code>.
  Future<ListCustomModelDeploymentsResponse> listCustomModelDeployments({
    DateTime? createdAfter,
    DateTime? createdBefore,
    int? maxResults,
    String? modelArnEquals,
    String? nameContains,
    String? nextToken,
    SortModelsBy? sortBy,
    SortOrder? sortOrder,
    CustomModelDeploymentStatus? statusEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (createdAfter != null)
        'createdAfter': [_s.iso8601ToJson(createdAfter).toString()],
      if (createdBefore != null)
        'createdBefore': [_s.iso8601ToJson(createdBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (modelArnEquals != null) 'modelArnEquals': [modelArnEquals],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
      if (statusEquals != null) 'statusEquals': [statusEquals.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/model-customization/custom-model-deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomModelDeploymentsResponse.fromJson(response);
  }

  /// Updates a custom model deployment with a new custom model. This allows you
  /// to deploy updated models without creating new deployment endpoints.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [customModelDeploymentIdentifier] :
  /// Identifier of the custom model deployment to update with the new custom
  /// model.
  ///
  /// Parameter [modelArn] :
  /// ARN of the new custom model to deploy. This replaces the currently
  /// deployed model.
  Future<UpdateCustomModelDeploymentResponse> updateCustomModelDeployment({
    required String customModelDeploymentIdentifier,
    required String modelArn,
  }) async {
    final $payload = <String, dynamic>{
      'modelArn': modelArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/model-customization/custom-model-deployments/${Uri.encodeComponent(customModelDeploymentIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateCustomModelDeploymentResponse.fromJson(response);
  }

  /// Creates a new custom model in Amazon Bedrock. After the model is active,
  /// you can use it for inference.
  ///
  /// You can provide the model data source in one of the following ways:
  ///
  /// <ul>
  /// <li>
  /// <code>customModelDataSource</code> — Specify a SageMaker AI model package
  /// ARN. Amazon Bedrock resolves the model package to retrieve the model
  /// artifacts. This is the preferred method for new SageMaker AI training
  /// outputs.
  /// </li>
  /// <li>
  /// <code>modelSourceConfig</code> — Specify an Amazon S3 URI pointing to the
  /// Amazon-managed Amazon S3 bucket containing your model artifacts.
  /// </li>
  /// </ul>
  /// To use the model for inference, you must purchase Provisioned Throughput
  /// for it. You can't use On-demand inference with these custom models. For
  /// more information about Provisioned Throughput, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a>.
  ///
  /// The model appears in <code>ListCustomModels</code> with a
  /// <code>customizationType</code> of <code>imported</code>. To track the
  /// status of the new model, you use the <code>GetCustomModel</code> API
  /// operation. The model can be in the following states:
  ///
  /// <ul>
  /// <li>
  /// <code>Creating</code> - Initial state during validation and registration
  /// </li>
  /// <li>
  /// <code>Active</code> - Model is ready for use in inference
  /// </li>
  /// <li>
  /// <code>Failed</code> - Creation process encountered an error
  /// </li>
  /// </ul>
  /// <b>Related APIs</b>
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetCustomModel.html">GetCustomModel</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_ListCustomModels.html">ListCustomModels</a>
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_DeleteCustomModel.html">DeleteCustomModel</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelName] :
  /// A unique name for the custom model.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [customModelDataSource] :
  /// The data source for the custom model. Use this field to specify a
  /// SageMaker AI model package ARN as the source for your custom model. Amazon
  /// Bedrock resolves the model package to retrieve the model artifacts.
  ///
  /// You can specify either <code>customModelDataSource</code> or
  /// <code>modelSourceConfig</code>, but not both.
  ///
  /// Parameter [modelKmsKeyArn] :
  /// The Amazon Resource Name (ARN) of the customer managed KMS key to encrypt
  /// the custom model. If you don't provide a KMS key, Amazon Bedrock uses an
  /// Amazon Web Services-managed KMS key to encrypt the model.
  ///
  /// If you provide a customer managed KMS key, your Amazon Bedrock service
  /// role must have permissions to use it. For more information see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/encryption-import-model.html">Encryption
  /// of imported models</a>.
  ///
  /// Parameter [modelSourceConfig] :
  /// The data source for the model. The Amazon S3 URI in the model source must
  /// be for the Amazon-managed Amazon S3 bucket containing your model
  /// artifacts.
  ///
  /// Parameter [modelTags] :
  /// A list of key-value pairs to associate with the custom model resource. You
  /// can use these tags to organize and identify your resources.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM service role that Amazon Bedrock
  /// assumes to perform tasks on your behalf. This role must have permissions
  /// to access the Amazon S3 bucket containing your model artifacts and the KMS
  /// key (if specified). For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-import-iam-role.html">Setting
  /// up an IAM service role for importing models</a> in the Amazon Bedrock User
  /// Guide.
  ///
  /// This field is required when you use <code>modelSourceConfig</code> with an
  /// Amazon S3 data source. It is not required when you use
  /// <code>customModelDataSource</code> with a model package ARN, because
  /// Amazon Bedrock uses its own credentials to access the model artifacts.
  Future<CreateCustomModelResponse> createCustomModel({
    required String modelName,
    String? clientRequestToken,
    CustomModelDataSource? customModelDataSource,
    String? modelKmsKeyArn,
    ModelDataSource? modelSourceConfig,
    List<Tag>? modelTags,
    String? roleArn,
  }) async {
    final $payload = <String, dynamic>{
      'modelName': modelName,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (customModelDataSource != null)
        'customModelDataSource': customModelDataSource,
      if (modelKmsKeyArn != null) 'modelKmsKeyArn': modelKmsKeyArn,
      if (modelSourceConfig != null) 'modelSourceConfig': modelSourceConfig,
      if (modelTags != null) 'modelTags': modelTags,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/custom-models/create-custom-model',
      exceptionFnMap: _exceptionFns,
    );
    return CreateCustomModelResponse.fromJson(response);
  }

  /// Deletes a custom model that you created earlier. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelIdentifier] :
  /// Name of the model to delete.
  Future<void> deleteCustomModel({
    required String modelIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/custom-models/${Uri.encodeComponent(modelIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get the properties associated with a Amazon Bedrock custom model that you
  /// have created. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelIdentifier] :
  /// Name or Amazon Resource Name (ARN) of the custom model.
  Future<GetCustomModelResponse> getCustomModel({
    required String modelIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/custom-models/${Uri.encodeComponent(modelIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetCustomModelResponse.fromJson(response);
  }

  /// Returns a list of the custom models that you have created with the
  /// <code>CreateModelCustomizationJob</code> operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [baseModelArnEquals] :
  /// Return custom models only if the base model Amazon Resource Name (ARN)
  /// matches this parameter.
  ///
  /// Parameter [creationTimeAfter] :
  /// Return custom models created after the specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// Return custom models created before the specified time.
  ///
  /// Parameter [foundationModelArnEquals] :
  /// Return custom models only if the foundation model Amazon Resource Name
  /// (ARN) matches this parameter.
  ///
  /// Parameter [isOwned] :
  /// Return custom models depending on if the current account owns them
  /// (<code>true</code>) or if they were shared with the current account
  /// (<code>false</code>).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [modelStatus] :
  /// The status of them model to filter results by. Possible values include:
  ///
  /// <ul>
  /// <li>
  /// <code>Creating</code> - Include only models that are currently being
  /// created and validated.
  /// </li>
  /// <li>
  /// <code>Active</code> - Include only models that have been successfully
  /// created and are ready for use.
  /// </li>
  /// <li>
  /// <code>Failed</code> - Include only models where the creation process
  /// failed.
  /// </li>
  /// </ul>
  /// If you don't specify a status, the API returns models in all states.
  ///
  /// Parameter [nameContains] :
  /// Return custom models only if the job name contains these characters.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  ///
  /// Parameter [sortBy] :
  /// The field to sort by in the returned list of models.
  ///
  /// Parameter [sortOrder] :
  /// The sort order of the results.
  Future<ListCustomModelsResponse> listCustomModels({
    String? baseModelArnEquals,
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    String? foundationModelArnEquals,
    bool? isOwned,
    int? maxResults,
    ModelStatus? modelStatus,
    String? nameContains,
    String? nextToken,
    SortModelsBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (baseModelArnEquals != null)
        'baseModelArnEquals': [baseModelArnEquals],
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (foundationModelArnEquals != null)
        'foundationModelArnEquals': [foundationModelArnEquals],
      if (isOwned != null) 'isOwned': [isOwned.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (modelStatus != null) 'modelStatus': [modelStatus.value],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/custom-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListCustomModelsResponse.fromJson(response);
  }

  /// Deletes the account-level enforced guardrail configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [configId] :
  /// Unique ID for the account enforced configuration.
  Future<void> deleteEnforcedGuardrailConfiguration({
    required String configId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/enforcedGuardrailsConfiguration/${Uri.encodeComponent(configId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the account-level enforced guardrail configurations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [nextToken] :
  /// Opaque continuation token of previous paginated response.
  Future<ListEnforcedGuardrailsConfigurationResponse>
      listEnforcedGuardrailsConfiguration({
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/enforcedGuardrailsConfiguration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnforcedGuardrailsConfigurationResponse.fromJson(response);
  }

  /// Sets the account-level enforced guardrail configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [guardrailInferenceConfig] :
  /// Account-level enforced guardrail input configuration.
  ///
  /// Parameter [configId] :
  /// Unique ID for the account enforced configuration.
  Future<PutEnforcedGuardrailConfigurationResponse>
      putEnforcedGuardrailConfiguration({
    required AccountEnforcedGuardrailInferenceInputConfiguration
        guardrailInferenceConfig,
    String? configId,
  }) async {
    final $payload = <String, dynamic>{
      'guardrailInferenceConfig': guardrailInferenceConfig,
      if (configId != null) 'configId': configId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/enforcedGuardrailsConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return PutEnforcedGuardrailConfigurationResponse.fromJson(response);
  }

  /// Deletes a batch of evaluation jobs. An evaluation job can only be deleted
  /// if it has following status <code>FAILED</code>, <code>COMPLETED</code>,
  /// and <code>STOPPED</code>. You can request up to 25 model evaluation jobs
  /// be deleted in a single request.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifiers] :
  /// A list of one or more evaluation job Amazon Resource Names (ARNs) you want
  /// to delete.
  Future<BatchDeleteEvaluationJobResponse> batchDeleteEvaluationJob({
    required List<String> jobIdentifiers,
  }) async {
    final $payload = <String, dynamic>{
      'jobIdentifiers': jobIdentifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/evaluation-jobs/batch-delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteEvaluationJobResponse.fromJson(response);
  }

  /// Creates an evaluation job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [evaluationConfig] :
  /// Contains the configuration details of either an automated or human-based
  /// evaluation job.
  ///
  /// Parameter [inferenceConfig] :
  /// Contains the configuration details of the inference model for the
  /// evaluation job.
  ///
  /// For model evaluation jobs, automated jobs support a single model or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
  /// profile</a>, and jobs that use human workers support two models or
  /// inference profiles.
  ///
  /// Parameter [jobName] :
  /// A name for the evaluation job. Names must unique with your Amazon Web
  /// Services account, and your account's Amazon Web Services region.
  ///
  /// Parameter [outputDataConfig] :
  /// Contains the configuration details of the Amazon S3 bucket for storing the
  /// results of the evaluation job.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM service role that Amazon Bedrock
  /// can assume to perform tasks on your behalf. To learn more about the
  /// required permissions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation-security.html">Required
  /// permissions for model evaluations</a>.
  ///
  /// Parameter [applicationType] :
  /// Specifies whether the evaluation job is for evaluating a model or
  /// evaluating a knowledge base (retrieval and response generation).
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [customerEncryptionKeyId] :
  /// Specify your customer managed encryption key Amazon Resource Name (ARN)
  /// that will be used to encrypt your evaluation job.
  ///
  /// Parameter [jobDescription] :
  /// A description of the evaluation job.
  ///
  /// Parameter [jobTags] :
  /// Tags to attach to the model evaluation job.
  Future<CreateEvaluationJobResponse> createEvaluationJob({
    required EvaluationConfig evaluationConfig,
    required EvaluationInferenceConfig inferenceConfig,
    required String jobName,
    required EvaluationOutputDataConfig outputDataConfig,
    required String roleArn,
    ApplicationType? applicationType,
    String? clientRequestToken,
    String? customerEncryptionKeyId,
    String? jobDescription,
    List<Tag>? jobTags,
  }) async {
    final $payload = <String, dynamic>{
      'evaluationConfig': evaluationConfig,
      'inferenceConfig': inferenceConfig,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      if (applicationType != null) 'applicationType': applicationType.value,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (customerEncryptionKeyId != null)
        'customerEncryptionKeyId': customerEncryptionKeyId,
      if (jobDescription != null) 'jobDescription': jobDescription,
      if (jobTags != null) 'jobTags': jobTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/evaluation-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEvaluationJobResponse.fromJson(response);
  }

  /// Gets information about an evaluation job, such as the status of the job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// The Amazon Resource Name (ARN) of the evaluation job you want get
  /// information on.
  Future<GetEvaluationJobResponse> getEvaluationJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/evaluation-jobs/${Uri.encodeComponent(jobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEvaluationJobResponse.fromJson(response);
  }

  /// Lists all existing evaluation jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationTypeEquals] :
  /// A filter to only list evaluation jobs that are either model evaluations or
  /// knowledge base evaluations.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter to only list evaluation jobs created after a specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter to only list evaluation jobs created before a specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nameContains] :
  /// A filter to only list evaluation jobs that contain a specified string in
  /// the job name.
  ///
  /// Parameter [nextToken] :
  /// Continuation token from the previous response, for Amazon Bedrock to list
  /// the next set of results.
  ///
  /// Parameter [sortBy] :
  /// Specifies a creation time to sort the list of evaluation jobs by when they
  /// were created.
  ///
  /// Parameter [sortOrder] :
  /// Specifies whether to sort the list of evaluation jobs by either ascending
  /// or descending order.
  ///
  /// Parameter [statusEquals] :
  /// A filter to only list evaluation jobs that are of a certain status.
  Future<ListEvaluationJobsResponse> listEvaluationJobs({
    ApplicationType? applicationTypeEquals,
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    int? maxResults,
    String? nameContains,
    String? nextToken,
    SortJobsBy? sortBy,
    SortOrder? sortOrder,
    EvaluationJobStatus? statusEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (applicationTypeEquals != null)
        'applicationTypeEquals': [applicationTypeEquals.value],
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
      if (statusEquals != null) 'statusEquals': [statusEquals.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/evaluation-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEvaluationJobsResponse.fromJson(response);
  }

  /// Stops an evaluation job that is current being created or running.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// The Amazon Resource Name (ARN) of the evaluation job you want to stop.
  Future<void> stopEvaluationJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/evaluation-job/${Uri.encodeComponent(jobIdentifier)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a guardrail to block topics and to implement safeguards for your
  /// generative AI applications.
  ///
  /// You can configure the following policies in a guardrail to avoid
  /// undesirable and harmful content, filter out denied topics and words, and
  /// remove sensitive information for privacy protection.
  ///
  /// <ul>
  /// <li>
  /// <b>Content filters</b> - Adjust filter strengths to block input prompts or
  /// model responses containing harmful content.
  /// </li>
  /// <li>
  /// <b>Denied topics</b> - Define a set of topics that are undesirable in the
  /// context of your application. These topics will be blocked if detected in
  /// user queries or model responses.
  /// </li>
  /// <li>
  /// <b>Word filters</b> - Configure filters to block undesirable words,
  /// phrases, and profanity. Such words can include offensive terms, competitor
  /// names etc.
  /// </li>
  /// <li>
  /// <b>Sensitive information filters</b> - Block or mask sensitive information
  /// such as personally identifiable information (PII) or custom regex in user
  /// inputs and model responses.
  /// </li>
  /// </ul>
  /// In addition to the above policies, you can also configure the messages to
  /// be returned to the user if a user input or model response is in violation
  /// of the policies defined in the guardrail.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails.html">Amazon
  /// Bedrock Guardrails</a> in the <i>Amazon Bedrock User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blockedInputMessaging] :
  /// The message to return when the guardrail blocks a prompt.
  ///
  /// Parameter [blockedOutputsMessaging] :
  /// The message to return when the guardrail blocks a model response.
  ///
  /// Parameter [name] :
  /// The name to give the guardrail.
  ///
  /// Parameter [automatedReasoningPolicyConfig] :
  /// Optional configuration for integrating Automated Reasoning policies with
  /// the new guardrail.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than once. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// Parameter [contentPolicyConfig] :
  /// The content filter policies to configure for the guardrail.
  ///
  /// Parameter [contextualGroundingPolicyConfig] :
  /// The contextual grounding policy configuration used to create a guardrail.
  ///
  /// Parameter [crossRegionConfig] :
  /// The system-defined guardrail profile that you're using with your
  /// guardrail. Guardrail profiles define the destination Amazon Web Services
  /// Regions where guardrail inference requests can be automatically routed.
  ///
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// Parameter [description] :
  /// A description of the guardrail.
  ///
  /// Parameter [kmsKeyId] :
  /// The ARN of the KMS key that you use to encrypt the guardrail.
  ///
  /// Parameter [sensitiveInformationPolicyConfig] :
  /// The sensitive information policy to configure for the guardrail.
  ///
  /// Parameter [tags] :
  /// The tags that you want to attach to the guardrail.
  ///
  /// Parameter [topicPolicyConfig] :
  /// The topic policies to configure for the guardrail.
  ///
  /// Parameter [wordPolicyConfig] :
  /// The word policy you configure for the guardrail.
  Future<CreateGuardrailResponse> createGuardrail({
    required String blockedInputMessaging,
    required String blockedOutputsMessaging,
    required String name,
    GuardrailAutomatedReasoningPolicyConfig? automatedReasoningPolicyConfig,
    String? clientRequestToken,
    GuardrailContentPolicyConfig? contentPolicyConfig,
    GuardrailContextualGroundingPolicyConfig? contextualGroundingPolicyConfig,
    GuardrailCrossRegionConfig? crossRegionConfig,
    String? description,
    String? kmsKeyId,
    GuardrailSensitiveInformationPolicyConfig? sensitiveInformationPolicyConfig,
    List<Tag>? tags,
    GuardrailTopicPolicyConfig? topicPolicyConfig,
    GuardrailWordPolicyConfig? wordPolicyConfig,
  }) async {
    final $payload = <String, dynamic>{
      'blockedInputMessaging': blockedInputMessaging,
      'blockedOutputsMessaging': blockedOutputsMessaging,
      'name': name,
      if (automatedReasoningPolicyConfig != null)
        'automatedReasoningPolicyConfig': automatedReasoningPolicyConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (contentPolicyConfig != null)
        'contentPolicyConfig': contentPolicyConfig,
      if (contextualGroundingPolicyConfig != null)
        'contextualGroundingPolicyConfig': contextualGroundingPolicyConfig,
      if (crossRegionConfig != null) 'crossRegionConfig': crossRegionConfig,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (sensitiveInformationPolicyConfig != null)
        'sensitiveInformationPolicyConfig': sensitiveInformationPolicyConfig,
      if (tags != null) 'tags': tags,
      if (topicPolicyConfig != null) 'topicPolicyConfig': topicPolicyConfig,
      if (wordPolicyConfig != null) 'wordPolicyConfig': wordPolicyConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/guardrails',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGuardrailResponse.fromJson(response);
  }

  /// Gets details about a guardrail. If you don't specify a version, the
  /// response returns details for the <code>DRAFT</code> version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail for which to get details. This can
  /// be an ID or the ARN.
  ///
  /// Parameter [guardrailVersion] :
  /// The version of the guardrail for which to get details. If you don't
  /// specify a version, the response returns details for the <code>DRAFT</code>
  /// version.
  Future<GetGuardrailResponse> getGuardrail({
    required String guardrailIdentifier,
    String? guardrailVersion,
  }) async {
    final $query = <String, List<String>>{
      if (guardrailVersion != null) 'guardrailVersion': [guardrailVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/guardrails/${Uri.encodeComponent(guardrailIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetGuardrailResponse.fromJson(response);
  }

  /// Updates a guardrail with the values you specify.
  ///
  /// <ul>
  /// <li>
  /// Specify a <code>name</code> and optional <code>description</code>.
  /// </li>
  /// <li>
  /// Specify messages for when the guardrail successfully blocks a prompt or a
  /// model response in the <code>blockedInputMessaging</code> and
  /// <code>blockedOutputsMessaging</code> fields.
  /// </li>
  /// <li>
  /// Specify topics for the guardrail to deny in the
  /// <code>topicPolicyConfig</code> object. Each <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GuardrailTopicConfig.html">GuardrailTopicConfig</a>
  /// object in the <code>topicsConfig</code> list pertains to one topic.
  ///
  /// <ul>
  /// <li>
  /// Give a <code>name</code> and <code>description</code> so that the
  /// guardrail can properly identify the topic.
  /// </li>
  /// <li>
  /// Specify <code>DENY</code> in the <code>type</code> field.
  /// </li>
  /// <li>
  /// (Optional) Provide up to five prompts that you would categorize as
  /// belonging to the topic in the <code>examples</code> list.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Specify filter strengths for the harmful categories defined in Amazon
  /// Bedrock in the <code>contentPolicyConfig</code> object. Each <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GuardrailContentFilterConfig.html">GuardrailContentFilterConfig</a>
  /// object in the <code>filtersConfig</code> list pertains to a harmful
  /// category. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-content-filters">Content
  /// filters</a>. For more information about the fields in a content filter,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GuardrailContentFilterConfig.html">GuardrailContentFilterConfig</a>.
  ///
  /// <ul>
  /// <li>
  /// Specify the category in the <code>type</code> field.
  /// </li>
  /// <li>
  /// Specify the strength of the filter for prompts in the
  /// <code>inputStrength</code> field and for model responses in the
  /// <code>strength</code> field of the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GuardrailContentFilterConfig.html">GuardrailContentFilterConfig</a>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// (Optional) For security, include the ARN of a KMS key in the
  /// <code>kmsKeyId</code> field.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [blockedInputMessaging] :
  /// The message to return when the guardrail blocks a prompt.
  ///
  /// Parameter [blockedOutputsMessaging] :
  /// The message to return when the guardrail blocks a model response.
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail. This can be an ID or the ARN.
  ///
  /// Parameter [name] :
  /// A name for the guardrail.
  ///
  /// Parameter [automatedReasoningPolicyConfig] :
  /// Updated configuration for Automated Reasoning policies associated with the
  /// guardrail.
  ///
  /// Parameter [contentPolicyConfig] :
  /// The content policy to configure for the guardrail.
  ///
  /// Parameter [contextualGroundingPolicyConfig] :
  /// The contextual grounding policy configuration used to update a guardrail.
  ///
  /// Parameter [crossRegionConfig] :
  /// The system-defined guardrail profile that you're using with your
  /// guardrail. Guardrail profiles define the destination Amazon Web Services
  /// Regions where guardrail inference requests can be automatically routed.
  ///
  /// For more information, see the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// Parameter [description] :
  /// A description of the guardrail.
  ///
  /// Parameter [kmsKeyId] :
  /// The ARN of the KMS key with which to encrypt the guardrail.
  ///
  /// Parameter [sensitiveInformationPolicyConfig] :
  /// The sensitive information policy to configure for the guardrail.
  ///
  /// Parameter [topicPolicyConfig] :
  /// The topic policy to configure for the guardrail.
  ///
  /// Parameter [wordPolicyConfig] :
  /// The word policy to configure for the guardrail.
  Future<UpdateGuardrailResponse> updateGuardrail({
    required String blockedInputMessaging,
    required String blockedOutputsMessaging,
    required String guardrailIdentifier,
    required String name,
    GuardrailAutomatedReasoningPolicyConfig? automatedReasoningPolicyConfig,
    GuardrailContentPolicyConfig? contentPolicyConfig,
    GuardrailContextualGroundingPolicyConfig? contextualGroundingPolicyConfig,
    GuardrailCrossRegionConfig? crossRegionConfig,
    String? description,
    String? kmsKeyId,
    GuardrailSensitiveInformationPolicyConfig? sensitiveInformationPolicyConfig,
    GuardrailTopicPolicyConfig? topicPolicyConfig,
    GuardrailWordPolicyConfig? wordPolicyConfig,
  }) async {
    final $payload = <String, dynamic>{
      'blockedInputMessaging': blockedInputMessaging,
      'blockedOutputsMessaging': blockedOutputsMessaging,
      'name': name,
      if (automatedReasoningPolicyConfig != null)
        'automatedReasoningPolicyConfig': automatedReasoningPolicyConfig,
      if (contentPolicyConfig != null)
        'contentPolicyConfig': contentPolicyConfig,
      if (contextualGroundingPolicyConfig != null)
        'contextualGroundingPolicyConfig': contextualGroundingPolicyConfig,
      if (crossRegionConfig != null) 'crossRegionConfig': crossRegionConfig,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (sensitiveInformationPolicyConfig != null)
        'sensitiveInformationPolicyConfig': sensitiveInformationPolicyConfig,
      if (topicPolicyConfig != null) 'topicPolicyConfig': topicPolicyConfig,
      if (wordPolicyConfig != null) 'wordPolicyConfig': wordPolicyConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/guardrails/${Uri.encodeComponent(guardrailIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGuardrailResponse.fromJson(response);
  }

  /// Deletes a guardrail.
  ///
  /// <ul>
  /// <li>
  /// To delete a guardrail, only specify the ARN of the guardrail in the
  /// <code>guardrailIdentifier</code> field. If you delete a guardrail, all of
  /// its versions will be deleted.
  /// </li>
  /// <li>
  /// To delete a version of a guardrail, specify the ARN of the guardrail in
  /// the <code>guardrailIdentifier</code> field and the version in the
  /// <code>guardrailVersion</code> field.
  /// </li>
  /// </ul>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail. This can be an ID or the ARN.
  ///
  /// Parameter [guardrailVersion] :
  /// The version of the guardrail.
  Future<void> deleteGuardrail({
    required String guardrailIdentifier,
    String? guardrailVersion,
  }) async {
    final $query = <String, List<String>>{
      if (guardrailVersion != null) 'guardrailVersion': [guardrailVersion],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/guardrails/${Uri.encodeComponent(guardrailIdentifier)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists details about all the guardrails in an account. To list the
  /// <code>DRAFT</code> version of all your guardrails, don't specify the
  /// <code>guardrailIdentifier</code> field. To list all versions of a
  /// guardrail, specify the ARN of the guardrail in the
  /// <code>guardrailIdentifier</code> field.
  ///
  /// You can set the maximum number of results to return in a response in the
  /// <code>maxResults</code> field. If there are more results than the number
  /// you set, the response returns a <code>nextToken</code> that you can send
  /// in another <code>ListGuardrails</code> request to see the next batch of
  /// results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail. This can be an ID or the ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// If there are more results than were returned in the response, the response
  /// returns a <code>nextToken</code> that you can send in another
  /// <code>ListGuardrails</code> request to see the next batch of results.
  Future<ListGuardrailsResponse> listGuardrails({
    String? guardrailIdentifier,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (guardrailIdentifier != null)
        'guardrailIdentifier': [guardrailIdentifier],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/guardrails',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGuardrailsResponse.fromJson(response);
  }

  /// Creates a version of the guardrail. Use this API to create a snapshot of
  /// the guardrail when you are satisfied with a configuration, or to compare
  /// the configuration with another version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail. This can be an ID or the ARN.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than once. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// Parameter [description] :
  /// A description of the guardrail version.
  Future<CreateGuardrailVersionResponse> createGuardrailVersion({
    required String guardrailIdentifier,
    String? clientRequestToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/guardrails/${Uri.encodeComponent(guardrailIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGuardrailVersionResponse.fromJson(response);
  }

  /// Creates an application inference profile to track metrics and costs when
  /// invoking a model. To create an application inference profile for a
  /// foundation model in one region, specify the ARN of the model in that
  /// region. To create an application inference profile for a foundation model
  /// across multiple regions, specify the ARN of the system-defined inference
  /// profile that contains the regions that you want to route requests to. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">Increase
  /// throughput and resilience with cross-region inference in Amazon
  /// Bedrock</a>. in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inferenceProfileName] :
  /// A name for the inference profile.
  ///
  /// Parameter [modelSource] :
  /// The foundation model or system-defined inference profile that the
  /// inference profile will track metrics and costs for.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [description] :
  /// A description for the inference profile.
  ///
  /// Parameter [tags] :
  /// An array of objects, each of which contains a tag and its value. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Tagging
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  Future<CreateInferenceProfileResponse> createInferenceProfile({
    required String inferenceProfileName,
    required InferenceProfileModelSource modelSource,
    String? clientRequestToken,
    String? description,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'inferenceProfileName': inferenceProfileName,
      'modelSource': modelSource,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/inference-profiles',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInferenceProfileResponse.fromJson(response);
  }

  /// Gets information about an inference profile. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">Increase
  /// throughput and resilience with cross-region inference in Amazon
  /// Bedrock</a>. in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inferenceProfileIdentifier] :
  /// The ID or Amazon Resource Name (ARN) of the inference profile.
  Future<GetInferenceProfileResponse> getInferenceProfile({
    required String inferenceProfileIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/inference-profiles/${Uri.encodeComponent(inferenceProfileIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetInferenceProfileResponse.fromJson(response);
  }

  /// Deletes an application inference profile. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">Increase
  /// throughput and resilience with cross-region inference in Amazon
  /// Bedrock</a>. in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inferenceProfileIdentifier] :
  /// The Amazon Resource Name (ARN) or ID of the application inference profile
  /// to delete.
  Future<void> deleteInferenceProfile({
    required String inferenceProfileIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/inference-profiles/${Uri.encodeComponent(inferenceProfileIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of inference profiles that you can use. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">Increase
  /// throughput and resilience with cross-region inference in Amazon
  /// Bedrock</a>. in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  ///
  /// Parameter [typeEquals] :
  /// Filters for inference profiles that match the type you specify.
  ///
  /// <ul>
  /// <li>
  /// <code>SYSTEM_DEFINED</code> – The inference profile is defined by Amazon
  /// Bedrock. You can route inference requests across regions with these
  /// inference profiles.
  /// </li>
  /// <li>
  /// <code>APPLICATION</code> – The inference profile was created by a user.
  /// This type of inference profile can track metrics and costs when invoking
  /// the model in it. The inference profile may route requests to one or
  /// multiple regions.
  /// </li>
  /// </ul>
  Future<ListInferenceProfilesResponse> listInferenceProfiles({
    int? maxResults,
    String? nextToken,
    InferenceProfileType? typeEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (typeEquals != null) 'type': [typeEquals.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/inference-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInferenceProfilesResponse.fromJson(response);
  }

  /// Delete the invocation logging.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<void> deleteModelInvocationLoggingConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/logging/modelinvocations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get the current configuration values for model invocation logging.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  Future<GetModelInvocationLoggingConfigurationResponse>
      getModelInvocationLoggingConfiguration() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/logging/modelinvocations',
      exceptionFnMap: _exceptionFns,
    );
    return GetModelInvocationLoggingConfigurationResponse.fromJson(response);
  }

  /// Set the configuration values for model invocation logging.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [loggingConfig] :
  /// The logging configuration values to set.
  Future<void> putModelInvocationLoggingConfiguration({
    required LoggingConfig loggingConfig,
  }) async {
    final $payload = <String, dynamic>{
      'loggingConfig': loggingConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/logging/modelinvocations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Copies a model to another region so that it can be used there. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/copy-model.html">Copy
  /// models to be used in other regions</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [sourceModelArn] :
  /// The Amazon Resource Name (ARN) of the model to be copied.
  ///
  /// Parameter [targetModelName] :
  /// A name for the copied model.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [modelKmsKeyId] :
  /// The ARN of the KMS key that you use to encrypt the model copy.
  ///
  /// Parameter [targetModelTags] :
  /// Tags to associate with the target model. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tag
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  Future<CreateModelCopyJobResponse> createModelCopyJob({
    required String sourceModelArn,
    required String targetModelName,
    String? clientRequestToken,
    String? modelKmsKeyId,
    List<Tag>? targetModelTags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceModelArn': sourceModelArn,
      'targetModelName': targetModelName,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (modelKmsKeyId != null) 'modelKmsKeyId': modelKmsKeyId,
      if (targetModelTags != null) 'targetModelTags': targetModelTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/model-copy-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateModelCopyJobResponse.fromJson(response);
  }

  /// Retrieves information about a model copy job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/copy-model.html">Copy
  /// models to be used in other regions</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobArn] :
  /// The Amazon Resource Name (ARN) of the model copy job.
  Future<GetModelCopyJobResponse> getModelCopyJob({
    required String jobArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/model-copy-jobs/${Uri.encodeComponent(jobArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetModelCopyJobResponse.fromJson(response);
  }

  /// Returns a list of model copy jobs that you have submitted. You can filter
  /// the jobs to return based on one or more criteria. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/copy-model.html">Copy
  /// models to be used in other regions</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [creationTimeAfter] :
  /// Filters for model copy jobs created after the specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// Filters for model copy jobs created before the specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  ///
  /// Parameter [sortBy] :
  /// The field to sort by in the returned list of model copy jobs.
  ///
  /// Parameter [sortOrder] :
  /// Specifies whether to sort the results in ascending or descending order.
  ///
  /// Parameter [sourceAccountEquals] :
  /// Filters for model copy jobs in which the account that the source model
  /// belongs to is equal to the value that you specify.
  ///
  /// Parameter [sourceModelArnEquals] :
  /// Filters for model copy jobs in which the Amazon Resource Name (ARN) of the
  /// source model to is equal to the value that you specify.
  ///
  /// Parameter [statusEquals] :
  /// Filters for model copy jobs whose status matches the value that you
  /// specify.
  ///
  /// Parameter [targetModelNameContains] :
  /// Filters for model copy jobs in which the name of the copied model contains
  /// the string that you specify.
  Future<ListModelCopyJobsResponse> listModelCopyJobs({
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    int? maxResults,
    String? nextToken,
    SortJobsBy? sortBy,
    SortOrder? sortOrder,
    String? sourceAccountEquals,
    String? sourceModelArnEquals,
    ModelCopyJobStatus? statusEquals,
    String? targetModelNameContains,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
      if (sourceAccountEquals != null)
        'sourceAccountEquals': [sourceAccountEquals],
      if (sourceModelArnEquals != null)
        'sourceModelArnEquals': [sourceModelArnEquals],
      if (statusEquals != null) 'statusEquals': [statusEquals.value],
      if (targetModelNameContains != null)
        'outputModelNameContains': [targetModelNameContains],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/model-copy-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListModelCopyJobsResponse.fromJson(response);
  }

  /// Creates a model import job to import model that you have customized in
  /// other environments, such as Amazon SageMaker. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [importedModelName] :
  /// The name of the imported model.
  ///
  /// Parameter [jobName] :
  /// The name of the import job.
  ///
  /// Parameter [modelDataSource] :
  /// The data source for the imported model.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the model import job.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [importedModelKmsKeyId] :
  /// The imported model is encrypted at rest using this key.
  ///
  /// Parameter [importedModelTags] :
  /// Tags to attach to the imported model.
  ///
  /// Parameter [jobTags] :
  /// Tags to attach to this import job.
  ///
  /// Parameter [vpcConfig] :
  /// VPC configuration parameters for the private Virtual Private Cloud (VPC)
  /// that contains the resources you are using for the import job.
  Future<CreateModelImportJobResponse> createModelImportJob({
    required String importedModelName,
    required String jobName,
    required ModelDataSource modelDataSource,
    required String roleArn,
    String? clientRequestToken,
    String? importedModelKmsKeyId,
    List<Tag>? importedModelTags,
    List<Tag>? jobTags,
    VpcConfig? vpcConfig,
  }) async {
    final $payload = <String, dynamic>{
      'importedModelName': importedModelName,
      'jobName': jobName,
      'modelDataSource': modelDataSource,
      'roleArn': roleArn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (importedModelKmsKeyId != null)
        'importedModelKmsKeyId': importedModelKmsKeyId,
      if (importedModelTags != null) 'importedModelTags': importedModelTags,
      if (jobTags != null) 'jobTags': jobTags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/model-import-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateModelImportJobResponse.fromJson(response);
  }

  /// Deletes a custom model that you imported earlier. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelIdentifier] :
  /// Name of the imported model to delete.
  Future<void> deleteImportedModel({
    required String modelIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/imported-models/${Uri.encodeComponent(modelIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets properties associated with a customized model you imported.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelIdentifier] :
  /// Name or Amazon Resource Name (ARN) of the imported model.
  Future<GetImportedModelResponse> getImportedModel({
    required String modelIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/imported-models/${Uri.encodeComponent(modelIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetImportedModelResponse.fromJson(response);
  }

  /// Retrieves the properties associated with import model job, including the
  /// status of the job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// The identifier of the import job.
  Future<GetModelImportJobResponse> getModelImportJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/model-import-jobs/${Uri.encodeComponent(jobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetModelImportJobResponse.fromJson(response);
  }

  /// Returns a list of models you've imported. You can filter the results to
  /// return based on one or more criteria. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [creationTimeAfter] :
  /// Return imported models that were created after the specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// Return imported models that created before the specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nameContains] :
  /// Return imported models only if the model name contains these characters.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  ///
  /// Parameter [sortBy] :
  /// The field to sort by in the returned list of imported models.
  ///
  /// Parameter [sortOrder] :
  /// Specifies whetehr to sort the results in ascending or descending order.
  Future<ListImportedModelsResponse> listImportedModels({
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    int? maxResults,
    String? nameContains,
    String? nextToken,
    SortModelsBy? sortBy,
    SortOrder? sortOrder,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/imported-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListImportedModelsResponse.fromJson(response);
  }

  /// Returns a list of import jobs you've submitted. You can filter the results
  /// to return based on one or more criteria. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [creationTimeAfter] :
  /// Return import jobs that were created after the specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// Return import jobs that were created before the specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nameContains] :
  /// Return imported jobs only if the job name contains these characters.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  ///
  /// Parameter [sortBy] :
  /// The field to sort by in the returned list of imported jobs.
  ///
  /// Parameter [sortOrder] :
  /// Specifies whether to sort the results in ascending or descending order.
  ///
  /// Parameter [statusEquals] :
  /// Return imported jobs with the specified status.
  Future<ListModelImportJobsResponse> listModelImportJobs({
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    int? maxResults,
    String? nameContains,
    String? nextToken,
    SortJobsBy? sortBy,
    SortOrder? sortOrder,
    ModelImportJobStatus? statusEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
      if (statusEquals != null) 'statusEquals': [statusEquals.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/model-import-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListModelImportJobsResponse.fromJson(response);
  }

  /// Creates a batch inference job to invoke a model on multiple prompts.
  /// Format your data according to <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-data">Format
  /// your inference data</a> and upload it to an Amazon S3 bucket. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference.html">Process
  /// multiple prompts with batch inference</a>.
  ///
  /// The response returns a <code>jobArn</code> that you can use to stop or get
  /// details about the job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputDataConfig] :
  /// Details about the location of the input to the batch inference job.
  ///
  /// Parameter [jobName] :
  /// A name to give the batch inference job.
  ///
  /// Parameter [modelId] :
  /// The unique identifier of the foundation model to use for the batch
  /// inference job.
  ///
  /// Parameter [outputDataConfig] :
  /// Details about the location of the output of the batch inference job.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the service role with permissions to
  /// carry out and manage batch inference. You can use the console to create a
  /// default service role or follow the steps at <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-iam-sr.html">Create
  /// a service role for batch inference</a>.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [modelInvocationType] :
  /// The invocation endpoint for ModelInvocationJob
  ///
  /// Parameter [tags] :
  /// Any tags to associate with the batch inference job. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// Amazon Bedrock resources</a>.
  ///
  /// Parameter [timeoutDurationInHours] :
  /// The number of hours after which to force the batch inference job to time
  /// out.
  ///
  /// Parameter [vpcConfig] :
  /// The configuration of the Virtual Private Cloud (VPC) for the data in the
  /// batch inference job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-vpc">Protect
  /// batch inference jobs using a VPC</a>.
  Future<CreateModelInvocationJobResponse> createModelInvocationJob({
    required ModelInvocationJobInputDataConfig inputDataConfig,
    required String jobName,
    required String modelId,
    required ModelInvocationJobOutputDataConfig outputDataConfig,
    required String roleArn,
    String? clientRequestToken,
    ModelInvocationType? modelInvocationType,
    List<Tag>? tags,
    int? timeoutDurationInHours,
    VpcConfig? vpcConfig,
  }) async {
    _s.validateNumRange(
      'timeoutDurationInHours',
      timeoutDurationInHours,
      24,
      168,
    );
    final $payload = <String, dynamic>{
      'inputDataConfig': inputDataConfig,
      'jobName': jobName,
      'modelId': modelId,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (modelInvocationType != null)
        'modelInvocationType': modelInvocationType.value,
      if (tags != null) 'tags': tags,
      if (timeoutDurationInHours != null)
        'timeoutDurationInHours': timeoutDurationInHours,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/model-invocation-job',
      exceptionFnMap: _exceptionFns,
    );
    return CreateModelInvocationJobResponse.fromJson(response);
  }

  /// Gets details about a batch inference job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-monitor">Monitor
  /// batch inference jobs</a>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// The Amazon Resource Name (ARN) of the batch inference job.
  Future<GetModelInvocationJobResponse> getModelInvocationJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/model-invocation-job/${Uri.encodeComponent(jobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetModelInvocationJobResponse.fromJson(response);
  }

  /// Lists all batch inference jobs in the account. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-view.html">View
  /// details about a batch inference job</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. If there are more results than
  /// the number that you specify, a <code>nextToken</code> value is returned.
  /// Use the <code>nextToken</code> in a request to return the next batch of
  /// results.
  ///
  /// Parameter [nameContains] :
  /// Specify a string to filter for batch inference jobs whose names contain
  /// the string.
  ///
  /// Parameter [nextToken] :
  /// If there were more results than the value you specified in the
  /// <code>maxResults</code> field in a previous
  /// <code>ListModelInvocationJobs</code> request, the response would have
  /// returned a <code>nextToken</code> value. To see the next batch of results,
  /// send the <code>nextToken</code> value in another request.
  ///
  /// Parameter [sortBy] :
  /// An attribute by which to sort the results.
  ///
  /// Parameter [sortOrder] :
  /// Specifies whether to sort the results by ascending or descending order.
  ///
  /// Parameter [statusEquals] :
  /// Specify a status to filter for batch inference jobs whose statuses match
  /// the string you specify.
  ///
  /// The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// Submitted – This job has been submitted to a queue for validation.
  /// </li>
  /// <li>
  /// Validating – This job is being validated for the requirements described in
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-data.html">Format
  /// and upload your batch inference data</a>. The criteria include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Your IAM service role has access to the Amazon S3 buckets containing your
  /// files.
  /// </li>
  /// <li>
  /// Your files are .jsonl files and each individual record is a JSON object in
  /// the correct format. Note that validation doesn't check if the
  /// <code>modelInput</code> value matches the request body for the model.
  /// </li>
  /// <li>
  /// Your files fulfill the requirements for file size and number of records.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/quotas.html">Quotas
  /// for Amazon Bedrock</a>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Scheduled – This job has been validated and is now in a queue. The job
  /// will automatically start when it reaches its turn.
  /// </li>
  /// <li>
  /// Expired – This job timed out because it was scheduled but didn't begin
  /// before the set timeout duration. Submit a new job request.
  /// </li>
  /// <li>
  /// InProgress – This job has begun. You can start viewing the results in the
  /// output S3 location.
  /// </li>
  /// <li>
  /// Completed – This job has successfully completed. View the output files in
  /// the output S3 location.
  /// </li>
  /// <li>
  /// PartiallyCompleted – This job has partially completed. Not all of your
  /// records could be processed in time. View the output files in the output S3
  /// location.
  /// </li>
  /// <li>
  /// Failed – This job has failed. Check the failure message for any further
  /// details. For further assistance, reach out to the <a
  /// href="https://console.aws.amazon.com/support/home/">Amazon Web Services
  /// Support Center</a>.
  /// </li>
  /// <li>
  /// Stopped – This job was stopped by a user.
  /// </li>
  /// <li>
  /// Stopping – This job is being stopped by a user.
  /// </li>
  /// </ul>
  ///
  /// Parameter [submitTimeAfter] :
  /// Specify a time to filter for batch inference jobs that were submitted
  /// after the time you specify.
  ///
  /// Parameter [submitTimeBefore] :
  /// Specify a time to filter for batch inference jobs that were submitted
  /// before the time you specify.
  Future<ListModelInvocationJobsResponse> listModelInvocationJobs({
    int? maxResults,
    String? nameContains,
    String? nextToken,
    SortJobsBy? sortBy,
    SortOrder? sortOrder,
    ModelInvocationJobStatus? statusEquals,
    DateTime? submitTimeAfter,
    DateTime? submitTimeBefore,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
      if (statusEquals != null) 'statusEquals': [statusEquals.value],
      if (submitTimeAfter != null)
        'submitTimeAfter': [_s.iso8601ToJson(submitTimeAfter).toString()],
      if (submitTimeBefore != null)
        'submitTimeBefore': [_s.iso8601ToJson(submitTimeBefore).toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/model-invocation-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListModelInvocationJobsResponse.fromJson(response);
  }

  /// Stops a batch inference job. You're only charged for tokens that were
  /// already processed. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-stop.html">Stop
  /// a batch inference job</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// The Amazon Resource Name (ARN) of the batch inference job to stop.
  Future<void> stopModelInvocationJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/model-invocation-job/${Uri.encodeComponent(jobIdentifier)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get details about a Amazon Bedrock foundation model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelIdentifier] :
  /// The model identifier.
  Future<GetFoundationModelResponse> getFoundationModel({
    required String modelIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/foundation-models/${Uri.encodeComponent(modelIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFoundationModelResponse.fromJson(response);
  }

  /// Lists Amazon Bedrock foundation models that you can use. You can filter
  /// the results with the request parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/foundation-models.html">Foundation
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [byCustomizationType] :
  /// Return models that support the customization type that you specify. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// Parameter [byInferenceType] :
  /// Return models that support the inference type that you specify. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// Parameter [byOutputModality] :
  /// Return models that support the output modality that you specify.
  ///
  /// Parameter [byProvider] :
  /// Return models belonging to the model provider that you specify.
  Future<ListFoundationModelsResponse> listFoundationModels({
    ModelCustomization? byCustomizationType,
    InferenceType? byInferenceType,
    ModelModality? byOutputModality,
    String? byProvider,
  }) async {
    final $query = <String, List<String>>{
      if (byCustomizationType != null)
        'byCustomizationType': [byCustomizationType.value],
      if (byInferenceType != null) 'byInferenceType': [byInferenceType.value],
      if (byOutputModality != null)
        'byOutputModality': [byOutputModality.value],
      if (byProvider != null) 'byProvider': [byProvider],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/foundation-models',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFoundationModelsResponse.fromJson(response);
  }

  /// Creates a prompt router that manages the routing of requests between
  /// multiple foundation models based on the routing criteria.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [fallbackModel] :
  /// The default model to use when the routing criteria is not met.
  ///
  /// Parameter [models] :
  /// A list of foundation models that the prompt router can route requests to.
  /// At least one model must be specified.
  ///
  /// Parameter [promptRouterName] :
  /// The name of the prompt router. The name must be unique within your Amazon
  /// Web Services account in the current region.
  ///
  /// Parameter [routingCriteria] :
  /// The criteria, which is the response quality difference, used to determine
  /// how incoming requests are routed to different models.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier that you provide to ensure idempotency
  /// of your requests. If not specified, the Amazon Web Services SDK
  /// automatically generates one for you.
  ///
  /// Parameter [description] :
  /// An optional description of the prompt router to help identify its purpose.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs to apply to this resource as tags. You can use
  /// tags to categorize and manage your Amazon Web Services resources.
  Future<CreatePromptRouterResponse> createPromptRouter({
    required PromptRouterTargetModel fallbackModel,
    required List<PromptRouterTargetModel> models,
    required String promptRouterName,
    required RoutingCriteria routingCriteria,
    String? clientRequestToken,
    String? description,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'fallbackModel': fallbackModel,
      'models': models,
      'promptRouterName': promptRouterName,
      'routingCriteria': routingCriteria,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/prompt-routers',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePromptRouterResponse.fromJson(response);
  }

  /// Retrieves details about a prompt router.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [promptRouterArn] :
  /// The prompt router's ARN
  Future<GetPromptRouterResponse> getPromptRouter({
    required String promptRouterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prompt-routers/${Uri.encodeComponent(promptRouterArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPromptRouterResponse.fromJson(response);
  }

  /// Deletes a specified prompt router. This action cannot be undone.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [promptRouterArn] :
  /// The Amazon Resource Name (ARN) of the prompt router to delete.
  Future<void> deletePromptRouter({
    required String promptRouterArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/prompt-routers/${Uri.encodeComponent(promptRouterArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a list of prompt routers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of prompt routers to return in one page of results.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  ///
  /// Parameter [type] :
  /// The type of the prompt routers, such as whether it's default or custom.
  Future<ListPromptRoutersResponse> listPromptRouters({
    int? maxResults,
    String? nextToken,
    PromptRouterType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (type != null) 'type': [type.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/prompt-routers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPromptRoutersResponse.fromJson(response);
  }

  /// Creates dedicated throughput for a base or custom model with the model
  /// units and for the duration that you specify. For pricing details, see <a
  /// href="http://aws.amazon.com/bedrock/pricing/">Amazon Bedrock Pricing</a>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// The Amazon Resource Name (ARN) or name of the model to associate with this
  /// Provisioned Throughput. For a list of models for which you can purchase
  /// Provisioned Throughput, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-ids.html#prov-throughput-models">Amazon
  /// Bedrock model IDs for purchasing Provisioned Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// Parameter [modelUnits] :
  /// Number of model units to allocate. A model unit delivers a specific
  /// throughput level for the specified model. The throughput level of a model
  /// unit specifies the total number of input and output tokens that it can
  /// process and generate within a span of one minute. By default, your account
  /// has no model units for purchasing Provisioned Throughputs with commitment.
  /// You must first visit the <a
  /// href="https://console.aws.amazon.com/support/home#/case/create?issueType=service-limit-increase">Amazon
  /// Web Services support center</a> to request MUs.
  ///
  /// For model unit quotas, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/quotas.html#prov-thru-quotas">Provisioned
  /// Throughput quotas</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// For more information about what an MU specifies, contact your Amazon Web
  /// Services account manager.
  ///
  /// Parameter [provisionedModelName] :
  /// The name for this Provisioned Throughput.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the Amazon S3 User Guide.
  ///
  /// Parameter [commitmentDuration] :
  /// The commitment duration requested for the Provisioned Throughput. Billing
  /// occurs hourly and is discounted for longer commitment terms. To request a
  /// no-commit Provisioned Throughput, omit this field.
  ///
  /// Custom models support all levels of commitment. To see which base models
  /// support no commitment, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/pt-supported.html">Supported
  /// regions and models for Provisioned Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>
  ///
  /// Parameter [tags] :
  /// Tags to associate with this Provisioned Throughput.
  Future<CreateProvisionedModelThroughputResponse>
      createProvisionedModelThroughput({
    required String modelId,
    required int modelUnits,
    required String provisionedModelName,
    String? clientRequestToken,
    CommitmentDuration? commitmentDuration,
    List<Tag>? tags,
  }) async {
    _s.validateNumRange(
      'modelUnits',
      modelUnits,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'modelId': modelId,
      'modelUnits': modelUnits,
      'provisionedModelName': provisionedModelName,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (commitmentDuration != null)
        'commitmentDuration': commitmentDuration.value,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/provisioned-model-throughput',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProvisionedModelThroughputResponse.fromJson(response);
  }

  /// Deletes a Provisioned Throughput. You can't delete a Provisioned
  /// Throughput before the commitment term is over. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [provisionedModelId] :
  /// The Amazon Resource Name (ARN) or name of the Provisioned Throughput.
  Future<void> deleteProvisionedModelThroughput({
    required String provisionedModelId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/provisioned-model-throughput/${Uri.encodeComponent(provisionedModelId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns details for a Provisioned Throughput. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [provisionedModelId] :
  /// The Amazon Resource Name (ARN) or name of the Provisioned Throughput.
  Future<GetProvisionedModelThroughputResponse> getProvisionedModelThroughput({
    required String provisionedModelId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/provisioned-model-throughput/${Uri.encodeComponent(provisionedModelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProvisionedModelThroughputResponse.fromJson(response);
  }

  /// Lists the Provisioned Throughputs in the account. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns Provisioned Throughputs created after the specified
  /// time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns Provisioned Throughputs created before the specified
  /// time.
  ///
  /// Parameter [maxResults] :
  /// THe maximum number of results to return in the response. If there are more
  /// results than the number you specified, the response returns a
  /// <code>nextToken</code> value. To see the next batch of results, send the
  /// <code>nextToken</code> value in another list request.
  ///
  /// Parameter [modelArnEquals] :
  /// A filter that returns Provisioned Throughputs whose model Amazon Resource
  /// Name (ARN) is equal to the value that you specify.
  ///
  /// Parameter [nameContains] :
  /// A filter that returns Provisioned Throughputs if their name contains the
  /// expression that you specify.
  ///
  /// Parameter [nextToken] :
  /// If there are more results than the number you specified in the
  /// <code>maxResults</code> field, the response returns a
  /// <code>nextToken</code> value. To see the next batch of results, specify
  /// the <code>nextToken</code> value in this field.
  ///
  /// Parameter [sortBy] :
  /// The field by which to sort the returned list of Provisioned Throughputs.
  ///
  /// Parameter [sortOrder] :
  /// The sort order of the results.
  ///
  /// Parameter [statusEquals] :
  /// A filter that returns Provisioned Throughputs if their statuses matches
  /// the value that you specify.
  Future<ListProvisionedModelThroughputsResponse>
      listProvisionedModelThroughputs({
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    int? maxResults,
    String? modelArnEquals,
    String? nameContains,
    String? nextToken,
    SortByProvisionedModels? sortBy,
    SortOrder? sortOrder,
    ProvisionedModelStatus? statusEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (modelArnEquals != null) 'modelArnEquals': [modelArnEquals],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
      if (statusEquals != null) 'statusEquals': [statusEquals.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/provisioned-model-throughputs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProvisionedModelThroughputsResponse.fromJson(response);
  }

  /// Updates the name or associated model for a Provisioned Throughput. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [provisionedModelId] :
  /// The Amazon Resource Name (ARN) or name of the Provisioned Throughput to
  /// update.
  ///
  /// Parameter [desiredModelId] :
  /// The Amazon Resource Name (ARN) of the new model to associate with this
  /// Provisioned Throughput. You can't specify this field if this Provisioned
  /// Throughput is associated with a base model.
  ///
  /// If this Provisioned Throughput is associated with a custom model, you can
  /// specify one of the following options:
  ///
  /// <ul>
  /// <li>
  /// The base model from which the custom model was customized.
  /// </li>
  /// <li>
  /// Another custom model that was customized from the same base model as the
  /// custom model.
  /// </li>
  /// </ul>
  ///
  /// Parameter [desiredProvisionedModelName] :
  /// The new name for this Provisioned Throughput.
  Future<void> updateProvisionedModelThroughput({
    required String provisionedModelId,
    String? desiredModelId,
    String? desiredProvisionedModelName,
  }) async {
    final $payload = <String, dynamic>{
      if (desiredModelId != null) 'desiredModelId': desiredModelId,
      if (desiredProvisionedModelName != null)
        'desiredProvisionedModelName': desiredProvisionedModelName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/provisioned-model-throughput/${Uri.encodeComponent(provisionedModelId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a previously created Bedrock resource policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Bedrock resource to which this resource policy applies.
  Future<void> deleteResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/resource-policy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the resource policy document for a Bedrock resource
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Bedrock resource to which this resource policy applies.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/resource-policy/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Adds a resource policy for a Bedrock resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Bedrock resource to which this resource policy applies.
  ///
  /// Parameter [resourcePolicy] :
  /// The JSON string representing the Bedrock resource policy.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String resourceArn,
    required String resourcePolicy,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'resourcePolicy': resourcePolicy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/resource-policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePolicyResponse.fromJson(response);
  }

  /// Request a model access agreement for the specified model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// Model Id of the model for the access request.
  ///
  /// Parameter [offerToken] :
  /// An offer token encapsulates the information for an offer.
  Future<CreateFoundationModelAgreementResponse>
      createFoundationModelAgreement({
    required String modelId,
    required String offerToken,
  }) async {
    final $payload = <String, dynamic>{
      'modelId': modelId,
      'offerToken': offerToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/create-foundation-model-agreement',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFoundationModelAgreementResponse.fromJson(response);
  }

  /// Delete the model access agreement for the specified model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// Model Id of the model access to delete.
  Future<void> deleteFoundationModelAgreement({
    required String modelId,
  }) async {
    final $payload = <String, dynamic>{
      'modelId': modelId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-foundation-model-agreement',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get information about the Foundation model availability.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// The model Id of the foundation model.
  Future<GetFoundationModelAvailabilityResponse>
      getFoundationModelAvailability({
    required String modelId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/foundation-model-availability/${Uri.encodeComponent(modelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFoundationModelAvailabilityResponse.fromJson(response);
  }

  /// Get the offers associated with the specified model.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [modelId] :
  /// Model Id of the foundation model.
  ///
  /// Parameter [offerType] :
  /// Type of offer associated with the model.
  Future<ListFoundationModelAgreementOffersResponse>
      listFoundationModelAgreementOffers({
    required String modelId,
    OfferType? offerType,
  }) async {
    final $query = <String, List<String>>{
      if (offerType != null) 'offerType': [offerType.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/list-foundation-model-agreement-offers/${Uri.encodeComponent(modelId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFoundationModelAgreementOffersResponse.fromJson(response);
  }

  /// List the tags associated with the specified resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Tagging
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final $payload = <String, dynamic>{
      'resourceARN': resourceARN,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Associate tags with a resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Tagging
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource to tag.
  ///
  /// Parameter [tags] :
  /// Tags to associate with the resource.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'resourceARN': resourceARN,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove one or more tags from a resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Tagging
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// Tag keys of the tags to remove from the resource.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'resourceARN': resourceARN,
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a fine-tuning job to customize a base model.
  ///
  /// You specify the base foundation model and the location of the training
  /// data. After the model-customization job completes successfully, your
  /// custom model resource will be ready to use. Amazon Bedrock returns
  /// validation loss metrics and output generations after the job completes.
  ///
  /// For information on the format of training and validation data, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-prepare.html">Prepare
  /// the datasets</a>.
  ///
  /// Model-customization jobs are asynchronous and the completion time depends
  /// on the base model and the training/validation data size. To monitor a job,
  /// use the <code>GetModelCustomizationJob</code> operation to retrieve the
  /// job status.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [TooManyTagsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [baseModelIdentifier] :
  /// Name of the base model.
  ///
  /// Parameter [customModelName] :
  /// A name for the resulting custom model.
  ///
  /// Parameter [jobName] :
  /// A name for the fine-tuning job.
  ///
  /// Parameter [outputDataConfig] :
  /// S3 location for the output data.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM service role that Amazon Bedrock
  /// can assume to perform tasks on your behalf. For example, during model
  /// training, Amazon Bedrock needs your permission to read input data from an
  /// S3 bucket, write model artifacts to an S3 bucket. To pass this role to
  /// Amazon Bedrock, the caller of this API must have the
  /// <code>iam:PassRole</code> permission.
  ///
  /// Parameter [trainingDataConfig] :
  /// Information about the training dataset.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique, case-sensitive identifier to ensure that the API request
  /// completes no more than one time. If this token matches a previous request,
  /// Amazon Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  ///
  /// Parameter [customModelKmsKeyId] :
  /// The custom model is encrypted at rest using this key.
  ///
  /// Parameter [customModelTags] :
  /// Tags to attach to the resulting custom model.
  ///
  /// Parameter [customizationConfig] :
  /// The customization configuration for the model customization job.
  ///
  /// Parameter [customizationType] :
  /// The customization type.
  ///
  /// Parameter [hyperParameters] :
  /// Parameters related to tuning the model. For details on the format for
  /// different models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models-hp.html">Custom
  /// model hyperparameters</a>.
  ///
  /// Parameter [jobTags] :
  /// Tags to attach to the job.
  ///
  /// Parameter [validationDataConfig] :
  /// Information about the validation dataset.
  ///
  /// Parameter [vpcConfig] :
  /// The configuration of the Virtual Private Cloud (VPC) that contains the
  /// resources that you're using for this job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/vpc-model-customization.html">Protect
  /// your model customization jobs using a VPC</a>.
  Future<CreateModelCustomizationJobResponse> createModelCustomizationJob({
    required String baseModelIdentifier,
    required String customModelName,
    required String jobName,
    required OutputDataConfig outputDataConfig,
    required String roleArn,
    required TrainingDataConfig trainingDataConfig,
    String? clientRequestToken,
    String? customModelKmsKeyId,
    List<Tag>? customModelTags,
    CustomizationConfig? customizationConfig,
    CustomizationType? customizationType,
    Map<String, String>? hyperParameters,
    List<Tag>? jobTags,
    ValidationDataConfig? validationDataConfig,
    VpcConfig? vpcConfig,
  }) async {
    final $payload = <String, dynamic>{
      'baseModelIdentifier': baseModelIdentifier,
      'customModelName': customModelName,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'trainingDataConfig': trainingDataConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (customModelKmsKeyId != null)
        'customModelKmsKeyId': customModelKmsKeyId,
      if (customModelTags != null) 'customModelTags': customModelTags,
      if (customizationConfig != null)
        'customizationConfig': customizationConfig,
      if (customizationType != null)
        'customizationType': customizationType.value,
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
      if (jobTags != null) 'jobTags': jobTags,
      if (validationDataConfig != null)
        'validationDataConfig': validationDataConfig,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/model-customization-jobs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateModelCustomizationJobResponse.fromJson(response);
  }

  /// Retrieves the properties associated with a model-customization job,
  /// including the status of the job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// Identifier for the customization job.
  Future<GetModelCustomizationJobResponse> getModelCustomizationJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/model-customization-jobs/${Uri.encodeComponent(jobIdentifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetModelCustomizationJobResponse.fromJson(response);
  }

  /// Returns a list of model customization jobs that you have submitted. You
  /// can filter the jobs to return based on one or more criteria.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [creationTimeAfter] :
  /// Return customization jobs created after the specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// Return customization jobs created before the specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response. If the total
  /// number of results is greater than this value, use the token returned in
  /// the response in the <code>nextToken</code> field when making another
  /// request to return the next batch of results.
  ///
  /// Parameter [nameContains] :
  /// Return customization jobs only if the job name contains these characters.
  ///
  /// Parameter [nextToken] :
  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  ///
  /// Parameter [sortBy] :
  /// The field to sort by in the returned list of jobs.
  ///
  /// Parameter [sortOrder] :
  /// The sort order of the results.
  ///
  /// Parameter [statusEquals] :
  /// Return customization jobs with the specified status.
  Future<ListModelCustomizationJobsResponse> listModelCustomizationJobs({
    DateTime? creationTimeAfter,
    DateTime? creationTimeBefore,
    int? maxResults,
    String? nameContains,
    String? nextToken,
    SortJobsBy? sortBy,
    SortOrder? sortOrder,
    FineTuningJobStatus? statusEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.value],
      if (sortOrder != null) 'sortOrder': [sortOrder.value],
      if (statusEquals != null) 'statusEquals': [statusEquals.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/model-customization-jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListModelCustomizationJobsResponse.fromJson(response);
  }

  /// Stops an active model customization job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobIdentifier] :
  /// Job identifier of the job to stop.
  Future<void> stopModelCustomizationJob({
    required String jobIdentifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/model-customization-jobs/${Uri.encodeComponent(jobIdentifier)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// Batch Delete Advanced Prompt Optimization Jobs Response
///
/// @nodoc
class BatchDeleteAdvancedPromptOptimizationJobResponse {
  /// A list of successfully deleted advanced prompt optimization jobs.
  final List<BatchDeleteAdvancedPromptOptimizationJobItem>
      advancedPromptOptimizationJobs;

  /// A list of errors encountered during batch deletion.
  final List<BatchDeleteAdvancedPromptOptimizationJobError> errors;

  BatchDeleteAdvancedPromptOptimizationJobResponse({
    required this.advancedPromptOptimizationJobs,
    required this.errors,
  });

  factory BatchDeleteAdvancedPromptOptimizationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteAdvancedPromptOptimizationJobResponse(
      advancedPromptOptimizationJobs:
          ((json['advancedPromptOptimizationJobs'] as List?) ?? const [])
              .nonNulls
              .map((e) => BatchDeleteAdvancedPromptOptimizationJobItem.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchDeleteAdvancedPromptOptimizationJobError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final advancedPromptOptimizationJobs = this.advancedPromptOptimizationJobs;
    final errors = this.errors;
    return {
      'advancedPromptOptimizationJobs': advancedPromptOptimizationJobs,
      'errors': errors,
    };
  }
}

/// Create Advanced Prompt Optimization Job Response
///
/// @nodoc
class CreateAdvancedPromptOptimizationJobResponse {
  /// The Amazon Resource Name (ARN) of the created advanced prompt optimization
  /// job.
  final String jobArn;

  CreateAdvancedPromptOptimizationJobResponse({
    required this.jobArn,
  });

  factory CreateAdvancedPromptOptimizationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAdvancedPromptOptimizationJobResponse(
      jobArn: (json['jobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

/// Get Advanced Prompt Optimization Job Response
///
/// @nodoc
class GetAdvancedPromptOptimizationJobResponse {
  /// The time at which the advanced prompt optimization job was created.
  final DateTime creationTime;

  /// The input data configuration for the optimization job.
  final AdvancedPromptOptimizationInputConfig inputConfig;

  /// The Amazon Resource Name (ARN) of the advanced prompt optimization job.
  final String jobArn;

  /// The name of the advanced prompt optimization job.
  final String jobName;

  /// The status of the advanced prompt optimization job.
  final AdvancedPromptOptimizationJobStatus jobStatus;

  /// The model configurations used in the optimization job.
  final List<ModelConfiguration> modelConfigurations;

  /// The output data configuration for the optimization job.
  final AdvancedPromptOptimizationOutputConfig outputConfig;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the output
  /// data.
  final String? encryptionKeyArn;

  /// If the job failed, a message describing the reason for the failure.
  final String? failureMessage;

  /// The description of the advanced prompt optimization job.
  final String? jobDescription;

  /// The time at which the advanced prompt optimization job was last modified.
  final DateTime? lastModifiedTime;

  GetAdvancedPromptOptimizationJobResponse({
    required this.creationTime,
    required this.inputConfig,
    required this.jobArn,
    required this.jobName,
    required this.jobStatus,
    required this.modelConfigurations,
    required this.outputConfig,
    this.encryptionKeyArn,
    this.failureMessage,
    this.jobDescription,
    this.lastModifiedTime,
  });

  factory GetAdvancedPromptOptimizationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAdvancedPromptOptimizationJobResponse(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      inputConfig: AdvancedPromptOptimizationInputConfig.fromJson(
          (json['inputConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      jobStatus: AdvancedPromptOptimizationJobStatus.fromString(
          (json['jobStatus'] as String?) ?? ''),
      modelConfigurations: ((json['modelConfigurations'] as List?) ?? const [])
          .nonNulls
          .map((e) => ModelConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      outputConfig: AdvancedPromptOptimizationOutputConfig.fromJson(
          (json['outputConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      encryptionKeyArn: json['encryptionKeyArn'] as String?,
      failureMessage: json['failureMessage'] as String?,
      jobDescription: json['jobDescription'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final inputConfig = this.inputConfig;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final modelConfigurations = this.modelConfigurations;
    final outputConfig = this.outputConfig;
    final encryptionKeyArn = this.encryptionKeyArn;
    final failureMessage = this.failureMessage;
    final jobDescription = this.jobDescription;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'inputConfig': inputConfig,
      'jobArn': jobArn,
      'jobName': jobName,
      'jobStatus': jobStatus.value,
      'modelConfigurations': modelConfigurations,
      'outputConfig': outputConfig,
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (jobDescription != null) 'jobDescription': jobDescription,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

/// List Advanced Prompt Optimization Jobs Response
///
/// @nodoc
class ListAdvancedPromptOptimizationJobsResponse {
  /// A list of advanced prompt optimization job summaries.
  final List<AdvancedPromptOptimizationJobSummary>? jobSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token in a subsequent request to get
  /// the next set of results.
  final String? nextToken;

  ListAdvancedPromptOptimizationJobsResponse({
    this.jobSummaries,
    this.nextToken,
  });

  factory ListAdvancedPromptOptimizationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAdvancedPromptOptimizationJobsResponse(
      jobSummaries: (json['jobSummaries'] as List?)
          ?.nonNulls
          .map((e) => AdvancedPromptOptimizationJobSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummaries = this.jobSummaries;
    final nextToken = this.nextToken;
    return {
      if (jobSummaries != null) 'jobSummaries': jobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Stop Advanced Prompt Optimization Job Response
///
/// @nodoc
class StopAdvancedPromptOptimizationJobResponse {
  StopAdvancedPromptOptimizationJobResponse();

  factory StopAdvancedPromptOptimizationJobResponse.fromJson(
      Map<String, dynamic> _) {
    return StopAdvancedPromptOptimizationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetUseCaseForModelAccessResponse {
  /// Get customer profile Response.
  final Uint8List formData;

  GetUseCaseForModelAccessResponse({
    required this.formData,
  });

  factory GetUseCaseForModelAccessResponse.fromJson(Map<String, dynamic> json) {
    return GetUseCaseForModelAccessResponse(
      formData: _s.decodeUint8List((json['formData'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final formData = this.formData;
    return {
      'formData': base64Encode(formData),
    };
  }
}

/// @nodoc
class PutUseCaseForModelAccessResponse {
  PutUseCaseForModelAccessResponse();

  factory PutUseCaseForModelAccessResponse.fromJson(Map<String, dynamic> _) {
    return PutUseCaseForModelAccessResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateAutomatedReasoningPolicyResponse {
  /// The timestamp when the policy was created.
  final DateTime createdAt;

  /// The name of the Automated Reasoning policy.
  final String name;

  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy that you
  /// created.
  final String policyArn;

  /// The timestamp when the policy was last updated.
  final DateTime updatedAt;

  /// The version number of the newly created Automated Reasoning policy. The
  /// initial version is always DRAFT.
  final String version;

  /// The hash of the policy definition. This is used as a concurrency token for
  /// creating policy versions that you can use in your application.
  final String? definitionHash;

  /// The description of the Automated Reasoning policy.
  final String? description;

  CreateAutomatedReasoningPolicyResponse({
    required this.createdAt,
    required this.name,
    required this.policyArn,
    required this.updatedAt,
    required this.version,
    this.definitionHash,
    this.description,
  });

  factory CreateAutomatedReasoningPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAutomatedReasoningPolicyResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
      definitionHash: json['definitionHash'] as String?,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final policyArn = this.policyArn;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final definitionHash = this.definitionHash;
    final description = this.description;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'policyArn': policyArn,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (definitionHash != null) 'definitionHash': definitionHash,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class GetAutomatedReasoningPolicyResponse {
  /// The hash of the policy definition used as a concurrency token.
  final String definitionHash;

  /// The name of the policy.
  final String name;

  /// The Amazon Resource Name (ARN) of the policy.
  final String policyArn;

  /// The unique identifier of the policy.
  final String policyId;

  /// The timestamp when the policy was last updated.
  final DateTime updatedAt;

  /// The version of the policy.
  final String version;

  /// The timestamp when the policy was created.
  final DateTime? createdAt;

  /// The description of the policy.
  final String? description;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the automated
  /// reasoning policy and its associated artifacts. If a KMS key is not provided
  /// during the initial CreateAutomatedReasoningPolicyRequest, the kmsKeyArn
  /// won't be included in the GetAutomatedReasoningPolicyResponse.
  final String? kmsKeyArn;

  GetAutomatedReasoningPolicyResponse({
    required this.definitionHash,
    required this.name,
    required this.policyArn,
    required this.policyId,
    required this.updatedAt,
    required this.version,
    this.createdAt,
    this.description,
    this.kmsKeyArn,
  });

  factory GetAutomatedReasoningPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutomatedReasoningPolicyResponse(
      definitionHash: (json['definitionHash'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      policyId: (json['policyId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final definitionHash = this.definitionHash;
    final name = this.name;
    final policyArn = this.policyArn;
    final policyId = this.policyId;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final createdAt = this.createdAt;
    final description = this.description;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'definitionHash': definitionHash,
      'name': name,
      'policyArn': policyArn,
      'policyId': policyId,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

/// @nodoc
class UpdateAutomatedReasoningPolicyResponse {
  /// The hash of the updated policy definition.
  final String definitionHash;

  /// The updated name of the policy.
  final String name;

  /// The Amazon Resource Name (ARN) of the updated policy.
  final String policyArn;

  /// The timestamp when the policy was last updated.
  final DateTime updatedAt;

  UpdateAutomatedReasoningPolicyResponse({
    required this.definitionHash,
    required this.name,
    required this.policyArn,
    required this.updatedAt,
  });

  factory UpdateAutomatedReasoningPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAutomatedReasoningPolicyResponse(
      definitionHash: (json['definitionHash'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final definitionHash = this.definitionHash;
    final name = this.name;
    final policyArn = this.policyArn;
    final updatedAt = this.updatedAt;
    return {
      'definitionHash': definitionHash,
      'name': name,
      'policyArn': policyArn,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class DeleteAutomatedReasoningPolicyResponse {
  DeleteAutomatedReasoningPolicyResponse();

  factory DeleteAutomatedReasoningPolicyResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAutomatedReasoningPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListAutomatedReasoningPoliciesResponse {
  /// A list of Automated Reasoning policy summaries.
  final List<AutomatedReasoningPolicySummary> automatedReasoningPolicySummaries;

  /// The pagination token to use in a subsequent request to retrieve the next
  /// page of results.
  final String? nextToken;

  ListAutomatedReasoningPoliciesResponse({
    required this.automatedReasoningPolicySummaries,
    this.nextToken,
  });

  factory ListAutomatedReasoningPoliciesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAutomatedReasoningPoliciesResponse(
      automatedReasoningPolicySummaries:
          ((json['automatedReasoningPolicySummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) => AutomatedReasoningPolicySummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automatedReasoningPolicySummaries =
        this.automatedReasoningPolicySummaries;
    final nextToken = this.nextToken;
    return {
      'automatedReasoningPolicySummaries': automatedReasoningPolicySummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CancelAutomatedReasoningPolicyBuildWorkflowResponse {
  CancelAutomatedReasoningPolicyBuildWorkflowResponse();

  factory CancelAutomatedReasoningPolicyBuildWorkflowResponse.fromJson(
      Map<String, dynamic> _) {
    return CancelAutomatedReasoningPolicyBuildWorkflowResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateAutomatedReasoningPolicyTestCaseResponse {
  /// The Amazon Resource Name (ARN) of the policy for which the test was created.
  final String policyArn;

  /// The unique identifier of the created test.
  final String testCaseId;

  CreateAutomatedReasoningPolicyTestCaseResponse({
    required this.policyArn,
    required this.testCaseId,
  });

  factory CreateAutomatedReasoningPolicyTestCaseResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAutomatedReasoningPolicyTestCaseResponse(
      policyArn: (json['policyArn'] as String?) ?? '',
      testCaseId: (json['testCaseId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final testCaseId = this.testCaseId;
    return {
      'policyArn': policyArn,
      'testCaseId': testCaseId,
    };
  }
}

/// @nodoc
class CreateAutomatedReasoningPolicyVersionResponse {
  /// The timestamp when the policy version was created.
  final DateTime createdAt;

  /// The hash of the policy definition for this version.
  final String definitionHash;

  /// The name of the policy version.
  final String name;

  /// The versioned Amazon Resource Name (ARN) of the policy version.
  final String policyArn;

  /// The version number of the policy version.
  final String version;

  /// The description of the policy version.
  final String? description;

  CreateAutomatedReasoningPolicyVersionResponse({
    required this.createdAt,
    required this.definitionHash,
    required this.name,
    required this.policyArn,
    required this.version,
    this.description,
  });

  factory CreateAutomatedReasoningPolicyVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAutomatedReasoningPolicyVersionResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      definitionHash: (json['definitionHash'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final definitionHash = this.definitionHash;
    final name = this.name;
    final policyArn = this.policyArn;
    final version = this.version;
    final description = this.description;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'definitionHash': definitionHash,
      'name': name,
      'policyArn': policyArn,
      'version': version,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class DeleteAutomatedReasoningPolicyBuildWorkflowResponse {
  DeleteAutomatedReasoningPolicyBuildWorkflowResponse();

  factory DeleteAutomatedReasoningPolicyBuildWorkflowResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAutomatedReasoningPolicyBuildWorkflowResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteAutomatedReasoningPolicyTestCaseResponse {
  DeleteAutomatedReasoningPolicyTestCaseResponse();

  factory DeleteAutomatedReasoningPolicyTestCaseResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAutomatedReasoningPolicyTestCaseResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ExportAutomatedReasoningPolicyVersionResponse {
  /// The exported policy definition containing the formal logic rules, variables,
  /// and custom variable types.
  final AutomatedReasoningPolicyDefinition policyDefinition;

  ExportAutomatedReasoningPolicyVersionResponse({
    required this.policyDefinition,
  });

  Map<String, dynamic> toJson() {
    final policyDefinition = this.policyDefinition;
    return {
      'policyDefinition': policyDefinition,
    };
  }
}

/// @nodoc
class GetAutomatedReasoningPolicyAnnotationsResponse {
  /// A hash value representing the current state of the annotations. This is used
  /// for optimistic concurrency control when updating annotations.
  final String annotationSetHash;

  /// The current set of annotations containing rules, variables, and types
  /// extracted from the source documents. These can be modified before finalizing
  /// the policy.
  final List<AutomatedReasoningPolicyAnnotation> annotations;

  /// The unique identifier of the build workflow.
  final String buildWorkflowId;

  /// The name of the Automated Reasoning policy.
  final String name;

  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy.
  final String policyArn;

  /// The timestamp when the annotations were last updated.
  final DateTime updatedAt;

  GetAutomatedReasoningPolicyAnnotationsResponse({
    required this.annotationSetHash,
    required this.annotations,
    required this.buildWorkflowId,
    required this.name,
    required this.policyArn,
    required this.updatedAt,
  });

  factory GetAutomatedReasoningPolicyAnnotationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutomatedReasoningPolicyAnnotationsResponse(
      annotationSetHash: (json['annotationSetHash'] as String?) ?? '',
      annotations: ((json['annotations'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyAnnotation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      buildWorkflowId: (json['buildWorkflowId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final annotationSetHash = this.annotationSetHash;
    final annotations = this.annotations;
    final buildWorkflowId = this.buildWorkflowId;
    final name = this.name;
    final policyArn = this.policyArn;
    final updatedAt = this.updatedAt;
    return {
      'annotationSetHash': annotationSetHash,
      'annotations': annotations,
      'buildWorkflowId': buildWorkflowId,
      'name': name,
      'policyArn': policyArn,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class GetAutomatedReasoningPolicyBuildWorkflowResponse {
  /// The unique identifier of the build workflow.
  final String buildWorkflowId;

  /// The type of build workflow being executed (e.g., DOCUMENT_INGESTION,
  /// POLICY_REPAIR).
  final AutomatedReasoningPolicyBuildWorkflowType buildWorkflowType;

  /// The timestamp when the build workflow was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy.
  final String policyArn;

  /// The current status of the build workflow (e.g., RUNNING, COMPLETED, FAILED,
  /// CANCELLED).
  final AutomatedReasoningPolicyBuildWorkflowStatus status;

  /// The timestamp when the build workflow was last updated.
  final DateTime updatedAt;

  /// The content type of the source document (e.g., text/plain, application/pdf).
  final AutomatedReasoningPolicyBuildDocumentContentType? documentContentType;

  /// A detailed description of the document's content and how it should be used
  /// in the policy generation process.
  final String? documentDescription;

  /// The name of the source document used in the build workflow.
  final String? documentName;

  GetAutomatedReasoningPolicyBuildWorkflowResponse({
    required this.buildWorkflowId,
    required this.buildWorkflowType,
    required this.createdAt,
    required this.policyArn,
    required this.status,
    required this.updatedAt,
    this.documentContentType,
    this.documentDescription,
    this.documentName,
  });

  factory GetAutomatedReasoningPolicyBuildWorkflowResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutomatedReasoningPolicyBuildWorkflowResponse(
      buildWorkflowId: (json['buildWorkflowId'] as String?) ?? '',
      buildWorkflowType: AutomatedReasoningPolicyBuildWorkflowType.fromString(
          (json['buildWorkflowType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      policyArn: (json['policyArn'] as String?) ?? '',
      status: AutomatedReasoningPolicyBuildWorkflowStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      documentContentType: (json['documentContentType'] as String?)
          ?.let(AutomatedReasoningPolicyBuildDocumentContentType.fromString),
      documentDescription: json['documentDescription'] as String?,
      documentName: json['documentName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final buildWorkflowId = this.buildWorkflowId;
    final buildWorkflowType = this.buildWorkflowType;
    final createdAt = this.createdAt;
    final policyArn = this.policyArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final documentContentType = this.documentContentType;
    final documentDescription = this.documentDescription;
    final documentName = this.documentName;
    return {
      'buildWorkflowId': buildWorkflowId,
      'buildWorkflowType': buildWorkflowType.value,
      'createdAt': iso8601ToJson(createdAt),
      'policyArn': policyArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (documentContentType != null)
        'documentContentType': documentContentType.value,
      if (documentDescription != null)
        'documentDescription': documentDescription,
      if (documentName != null) 'documentName': documentName,
    };
  }
}

/// @nodoc
class GetAutomatedReasoningPolicyBuildWorkflowResultAssetsResponse {
  /// The unique identifier of the build workflow.
  final String buildWorkflowId;

  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy.
  final String policyArn;

  /// The requested build workflow asset. This is a union type that returns only
  /// one of the available asset types (logs, reports, or generated artifacts)
  /// based on the specific asset type requested in the API call.
  final AutomatedReasoningPolicyBuildResultAssets? buildWorkflowAssets;

  GetAutomatedReasoningPolicyBuildWorkflowResultAssetsResponse({
    required this.buildWorkflowId,
    required this.policyArn,
    this.buildWorkflowAssets,
  });

  factory GetAutomatedReasoningPolicyBuildWorkflowResultAssetsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutomatedReasoningPolicyBuildWorkflowResultAssetsResponse(
      buildWorkflowId: (json['buildWorkflowId'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      buildWorkflowAssets: json['buildWorkflowAssets'] != null
          ? AutomatedReasoningPolicyBuildResultAssets.fromJson(
              json['buildWorkflowAssets'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final buildWorkflowId = this.buildWorkflowId;
    final policyArn = this.policyArn;
    final buildWorkflowAssets = this.buildWorkflowAssets;
    return {
      'buildWorkflowId': buildWorkflowId,
      'policyArn': policyArn,
      if (buildWorkflowAssets != null)
        'buildWorkflowAssets': buildWorkflowAssets,
    };
  }
}

/// @nodoc
class GetAutomatedReasoningPolicyNextScenarioResponse {
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy.
  final String policyArn;

  /// The next test scenario to validate, including the test expression and
  /// expected results.
  final AutomatedReasoningPolicyScenario? scenario;

  GetAutomatedReasoningPolicyNextScenarioResponse({
    required this.policyArn,
    this.scenario,
  });

  factory GetAutomatedReasoningPolicyNextScenarioResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutomatedReasoningPolicyNextScenarioResponse(
      policyArn: (json['policyArn'] as String?) ?? '',
      scenario: json['scenario'] != null
          ? AutomatedReasoningPolicyScenario.fromJson(
              json['scenario'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final scenario = this.scenario;
    return {
      'policyArn': policyArn,
      if (scenario != null) 'scenario': scenario,
    };
  }
}

/// @nodoc
class GetAutomatedReasoningPolicyTestCaseResponse {
  /// The Amazon Resource Name (ARN) of the policy that contains the test.
  final String policyArn;

  /// The test details including the content, query, expected result, and
  /// metadata.
  final AutomatedReasoningPolicyTestCase testCase;

  GetAutomatedReasoningPolicyTestCaseResponse({
    required this.policyArn,
    required this.testCase,
  });

  factory GetAutomatedReasoningPolicyTestCaseResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutomatedReasoningPolicyTestCaseResponse(
      policyArn: (json['policyArn'] as String?) ?? '',
      testCase: AutomatedReasoningPolicyTestCase.fromJson(
          (json['testCase'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final testCase = this.testCase;
    return {
      'policyArn': policyArn,
      'testCase': testCase,
    };
  }
}

/// @nodoc
class GetAutomatedReasoningPolicyTestResultResponse {
  /// The test result containing validation findings, execution status, and
  /// detailed analysis.
  final AutomatedReasoningPolicyTestResult testResult;

  GetAutomatedReasoningPolicyTestResultResponse({
    required this.testResult,
  });

  factory GetAutomatedReasoningPolicyTestResultResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAutomatedReasoningPolicyTestResultResponse(
      testResult: AutomatedReasoningPolicyTestResult.fromJson(
          (json['testResult'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final testResult = this.testResult;
    return {
      'testResult': testResult,
    };
  }
}

/// @nodoc
class ListAutomatedReasoningPolicyBuildWorkflowsResponse {
  /// A list of build workflow summaries, each containing key information about a
  /// build workflow including its status and timestamps.
  final List<AutomatedReasoningPolicyBuildWorkflowSummary>
      automatedReasoningPolicyBuildWorkflowSummaries;

  /// A pagination token to use in subsequent requests to retrieve additional
  /// build workflows.
  final String? nextToken;

  ListAutomatedReasoningPolicyBuildWorkflowsResponse({
    required this.automatedReasoningPolicyBuildWorkflowSummaries,
    this.nextToken,
  });

  factory ListAutomatedReasoningPolicyBuildWorkflowsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAutomatedReasoningPolicyBuildWorkflowsResponse(
      automatedReasoningPolicyBuildWorkflowSummaries:
          ((json['automatedReasoningPolicyBuildWorkflowSummaries'] as List?) ??
                  const [])
              .nonNulls
              .map((e) => AutomatedReasoningPolicyBuildWorkflowSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final automatedReasoningPolicyBuildWorkflowSummaries =
        this.automatedReasoningPolicyBuildWorkflowSummaries;
    final nextToken = this.nextToken;
    return {
      'automatedReasoningPolicyBuildWorkflowSummaries':
          automatedReasoningPolicyBuildWorkflowSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListAutomatedReasoningPolicyTestCasesResponse {
  /// A list of tests for the specified policy.
  final List<AutomatedReasoningPolicyTestCase> testCases;

  /// The pagination token to use in a subsequent request to retrieve the next
  /// page of results.
  final String? nextToken;

  ListAutomatedReasoningPolicyTestCasesResponse({
    required this.testCases,
    this.nextToken,
  });

  factory ListAutomatedReasoningPolicyTestCasesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAutomatedReasoningPolicyTestCasesResponse(
      testCases: ((json['testCases'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyTestCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testCases = this.testCases;
    final nextToken = this.nextToken;
    return {
      'testCases': testCases,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListAutomatedReasoningPolicyTestResultsResponse {
  /// A list of test results, each containing information about how the policy
  /// performed on specific test scenarios.
  final List<AutomatedReasoningPolicyTestResult> testResults;

  /// A pagination token to use in subsequent requests to retrieve additional test
  /// results.
  final String? nextToken;

  ListAutomatedReasoningPolicyTestResultsResponse({
    required this.testResults,
    this.nextToken,
  });

  factory ListAutomatedReasoningPolicyTestResultsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAutomatedReasoningPolicyTestResultsResponse(
      testResults: ((json['testResults'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyTestResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final testResults = this.testResults;
    final nextToken = this.nextToken;
    return {
      'testResults': testResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StartAutomatedReasoningPolicyBuildWorkflowResponse {
  /// The unique identifier of the newly started build workflow. Use this ID to
  /// track the workflow's progress and retrieve its results.
  final String buildWorkflowId;

  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy.
  final String policyArn;

  StartAutomatedReasoningPolicyBuildWorkflowResponse({
    required this.buildWorkflowId,
    required this.policyArn,
  });

  factory StartAutomatedReasoningPolicyBuildWorkflowResponse.fromJson(
      Map<String, dynamic> json) {
    return StartAutomatedReasoningPolicyBuildWorkflowResponse(
      buildWorkflowId: (json['buildWorkflowId'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final buildWorkflowId = this.buildWorkflowId;
    final policyArn = this.policyArn;
    return {
      'buildWorkflowId': buildWorkflowId,
      'policyArn': policyArn,
    };
  }
}

/// @nodoc
class StartAutomatedReasoningPolicyTestWorkflowResponse {
  /// The Amazon Resource Name (ARN) of the policy for which the test workflow was
  /// started.
  final String policyArn;

  StartAutomatedReasoningPolicyTestWorkflowResponse({
    required this.policyArn,
  });

  factory StartAutomatedReasoningPolicyTestWorkflowResponse.fromJson(
      Map<String, dynamic> json) {
    return StartAutomatedReasoningPolicyTestWorkflowResponse(
      policyArn: (json['policyArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    return {
      'policyArn': policyArn,
    };
  }
}

/// @nodoc
class UpdateAutomatedReasoningPolicyAnnotationsResponse {
  /// The new hash value representing the updated state of the annotations.
  final String annotationSetHash;

  /// The unique identifier of the build workflow.
  final String buildWorkflowId;

  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy.
  final String policyArn;

  /// The timestamp when the annotations were updated.
  final DateTime updatedAt;

  UpdateAutomatedReasoningPolicyAnnotationsResponse({
    required this.annotationSetHash,
    required this.buildWorkflowId,
    required this.policyArn,
    required this.updatedAt,
  });

  factory UpdateAutomatedReasoningPolicyAnnotationsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAutomatedReasoningPolicyAnnotationsResponse(
      annotationSetHash: (json['annotationSetHash'] as String?) ?? '',
      buildWorkflowId: (json['buildWorkflowId'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final annotationSetHash = this.annotationSetHash;
    final buildWorkflowId = this.buildWorkflowId;
    final policyArn = this.policyArn;
    final updatedAt = this.updatedAt;
    return {
      'annotationSetHash': annotationSetHash,
      'buildWorkflowId': buildWorkflowId,
      'policyArn': policyArn,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class UpdateAutomatedReasoningPolicyTestCaseResponse {
  /// The Amazon Resource Name (ARN) of the policy that contains the updated test.
  final String policyArn;

  /// The unique identifier of the updated test.
  final String testCaseId;

  UpdateAutomatedReasoningPolicyTestCaseResponse({
    required this.policyArn,
    required this.testCaseId,
  });

  factory UpdateAutomatedReasoningPolicyTestCaseResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAutomatedReasoningPolicyTestCaseResponse(
      policyArn: (json['policyArn'] as String?) ?? '',
      testCaseId: (json['testCaseId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final testCaseId = this.testCaseId;
    return {
      'policyArn': policyArn,
      'testCaseId': testCaseId,
    };
  }
}

/// @nodoc
class CreateMarketplaceModelEndpointResponse {
  /// Details about the created endpoint.
  final MarketplaceModelEndpoint marketplaceModelEndpoint;

  CreateMarketplaceModelEndpointResponse({
    required this.marketplaceModelEndpoint,
  });

  factory CreateMarketplaceModelEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMarketplaceModelEndpointResponse(
      marketplaceModelEndpoint: MarketplaceModelEndpoint.fromJson(
          (json['marketplaceModelEndpoint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final marketplaceModelEndpoint = this.marketplaceModelEndpoint;
    return {
      'marketplaceModelEndpoint': marketplaceModelEndpoint,
    };
  }
}

/// @nodoc
class DeleteMarketplaceModelEndpointResponse {
  DeleteMarketplaceModelEndpointResponse();

  factory DeleteMarketplaceModelEndpointResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteMarketplaceModelEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeregisterMarketplaceModelEndpointResponse {
  DeregisterMarketplaceModelEndpointResponse();

  factory DeregisterMarketplaceModelEndpointResponse.fromJson(
      Map<String, dynamic> _) {
    return DeregisterMarketplaceModelEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetMarketplaceModelEndpointResponse {
  /// Details about the requested endpoint.
  final MarketplaceModelEndpoint? marketplaceModelEndpoint;

  GetMarketplaceModelEndpointResponse({
    this.marketplaceModelEndpoint,
  });

  factory GetMarketplaceModelEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMarketplaceModelEndpointResponse(
      marketplaceModelEndpoint: json['marketplaceModelEndpoint'] != null
          ? MarketplaceModelEndpoint.fromJson(
              json['marketplaceModelEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final marketplaceModelEndpoint = this.marketplaceModelEndpoint;
    return {
      if (marketplaceModelEndpoint != null)
        'marketplaceModelEndpoint': marketplaceModelEndpoint,
    };
  }
}

/// @nodoc
class ListMarketplaceModelEndpointsResponse {
  /// An array of endpoint summaries.
  final List<MarketplaceModelEndpointSummary>? marketplaceModelEndpoints;

  /// The token for the next set of results. Use this token to get the next set of
  /// results.
  final String? nextToken;

  ListMarketplaceModelEndpointsResponse({
    this.marketplaceModelEndpoints,
    this.nextToken,
  });

  factory ListMarketplaceModelEndpointsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMarketplaceModelEndpointsResponse(
      marketplaceModelEndpoints: (json['marketplaceModelEndpoints'] as List?)
          ?.nonNulls
          .map((e) => MarketplaceModelEndpointSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final marketplaceModelEndpoints = this.marketplaceModelEndpoints;
    final nextToken = this.nextToken;
    return {
      if (marketplaceModelEndpoints != null)
        'marketplaceModelEndpoints': marketplaceModelEndpoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class RegisterMarketplaceModelEndpointResponse {
  /// Details about the registered endpoint.
  final MarketplaceModelEndpoint marketplaceModelEndpoint;

  RegisterMarketplaceModelEndpointResponse({
    required this.marketplaceModelEndpoint,
  });

  factory RegisterMarketplaceModelEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterMarketplaceModelEndpointResponse(
      marketplaceModelEndpoint: MarketplaceModelEndpoint.fromJson(
          (json['marketplaceModelEndpoint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final marketplaceModelEndpoint = this.marketplaceModelEndpoint;
    return {
      'marketplaceModelEndpoint': marketplaceModelEndpoint,
    };
  }
}

/// @nodoc
class UpdateMarketplaceModelEndpointResponse {
  /// Details about the updated endpoint.
  final MarketplaceModelEndpoint marketplaceModelEndpoint;

  UpdateMarketplaceModelEndpointResponse({
    required this.marketplaceModelEndpoint,
  });

  factory UpdateMarketplaceModelEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateMarketplaceModelEndpointResponse(
      marketplaceModelEndpoint: MarketplaceModelEndpoint.fromJson(
          (json['marketplaceModelEndpoint'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final marketplaceModelEndpoint = this.marketplaceModelEndpoint;
    return {
      'marketplaceModelEndpoint': marketplaceModelEndpoint,
    };
  }
}

/// @nodoc
class CreateCustomModelDeploymentResponse {
  /// The Amazon Resource Name (ARN) of the custom model deployment. Use this ARN
  /// as the <code>modelId</code> parameter when invoking the model with the
  /// <code>InvokeModel</code> or <code>Converse</code> operations.
  final String customModelDeploymentArn;

  CreateCustomModelDeploymentResponse({
    required this.customModelDeploymentArn,
  });

  factory CreateCustomModelDeploymentResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCustomModelDeploymentResponse(
      customModelDeploymentArn:
          (json['customModelDeploymentArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final customModelDeploymentArn = this.customModelDeploymentArn;
    return {
      'customModelDeploymentArn': customModelDeploymentArn,
    };
  }
}

/// @nodoc
class DeleteCustomModelDeploymentResponse {
  DeleteCustomModelDeploymentResponse();

  factory DeleteCustomModelDeploymentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomModelDeploymentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetCustomModelDeploymentResponse {
  /// The date and time when the custom model deployment was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the custom model deployment.
  final String customModelDeploymentArn;

  /// The Amazon Resource Name (ARN) of the custom model associated with this
  /// deployment.
  final String modelArn;

  /// The name of the custom model deployment.
  final String modelDeploymentName;

  /// The status of the custom model deployment. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATING</code> - The deployment is being set up and prepared for
  /// inference.
  /// </li>
  /// <li>
  /// <code>ACTIVE</code> - The deployment is ready and available for inference
  /// requests.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The deployment failed to be created or became
  /// unavailable.
  /// </li>
  /// </ul>
  final CustomModelDeploymentStatus status;

  /// The description of the custom model deployment.
  final String? description;

  /// If the deployment status is <code>FAILED</code>, this field contains a
  /// message describing the failure reason.
  final String? failureMessage;

  /// The date and time when the custom model deployment was last updated.
  final DateTime? lastUpdatedAt;

  /// Details about any pending or completed updates to the custom model
  /// deployment, including the new model ARN and update status.
  final CustomModelDeploymentUpdateDetails? updateDetails;

  GetCustomModelDeploymentResponse({
    required this.createdAt,
    required this.customModelDeploymentArn,
    required this.modelArn,
    required this.modelDeploymentName,
    required this.status,
    this.description,
    this.failureMessage,
    this.lastUpdatedAt,
    this.updateDetails,
  });

  factory GetCustomModelDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return GetCustomModelDeploymentResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      customModelDeploymentArn:
          (json['customModelDeploymentArn'] as String?) ?? '',
      modelArn: (json['modelArn'] as String?) ?? '',
      modelDeploymentName: (json['modelDeploymentName'] as String?) ?? '',
      status: CustomModelDeploymentStatus.fromString(
          (json['status'] as String?) ?? ''),
      description: json['description'] as String?,
      failureMessage: json['failureMessage'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      updateDetails: json['updateDetails'] != null
          ? CustomModelDeploymentUpdateDetails.fromJson(
              json['updateDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final customModelDeploymentArn = this.customModelDeploymentArn;
    final modelArn = this.modelArn;
    final modelDeploymentName = this.modelDeploymentName;
    final status = this.status;
    final description = this.description;
    final failureMessage = this.failureMessage;
    final lastUpdatedAt = this.lastUpdatedAt;
    final updateDetails = this.updateDetails;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'customModelDeploymentArn': customModelDeploymentArn,
      'modelArn': modelArn,
      'modelDeploymentName': modelDeploymentName,
      'status': status.value,
      if (description != null) 'description': description,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
      if (updateDetails != null) 'updateDetails': updateDetails,
    };
  }
}

/// @nodoc
class ListCustomModelDeploymentsResponse {
  /// A list of custom model deployment summaries.
  final List<CustomModelDeploymentSummary>? modelDeploymentSummaries;

  /// The token for the next set of results. This value is null when there are no
  /// more results to return.
  final String? nextToken;

  ListCustomModelDeploymentsResponse({
    this.modelDeploymentSummaries,
    this.nextToken,
  });

  factory ListCustomModelDeploymentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCustomModelDeploymentsResponse(
      modelDeploymentSummaries: (json['modelDeploymentSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              CustomModelDeploymentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelDeploymentSummaries = this.modelDeploymentSummaries;
    final nextToken = this.nextToken;
    return {
      if (modelDeploymentSummaries != null)
        'modelDeploymentSummaries': modelDeploymentSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class UpdateCustomModelDeploymentResponse {
  /// ARN of the custom model deployment being updated.
  final String customModelDeploymentArn;

  UpdateCustomModelDeploymentResponse({
    required this.customModelDeploymentArn,
  });

  factory UpdateCustomModelDeploymentResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCustomModelDeploymentResponse(
      customModelDeploymentArn:
          (json['customModelDeploymentArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final customModelDeploymentArn = this.customModelDeploymentArn;
    return {
      'customModelDeploymentArn': customModelDeploymentArn,
    };
  }
}

/// @nodoc
class CreateCustomModelResponse {
  /// The Amazon Resource Name (ARN) of the new custom model.
  final String modelArn;

  CreateCustomModelResponse({
    required this.modelArn,
  });

  factory CreateCustomModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateCustomModelResponse(
      modelArn: (json['modelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    return {
      'modelArn': modelArn,
    };
  }
}

/// @nodoc
class DeleteCustomModelResponse {
  DeleteCustomModelResponse();

  factory DeleteCustomModelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomModelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetCustomModelResponse {
  /// Creation time of the model.
  final DateTime creationTime;

  /// Amazon Resource Name (ARN) associated with this model.
  final String modelArn;

  /// Model name associated with this model.
  final String modelName;

  /// Amazon Resource Name (ARN) of the base model.
  final String? baseModelArn;

  /// The customization configuration for the custom model.
  final CustomizationConfig? customizationConfig;

  /// The type of model customization.
  final CustomizationType? customizationType;

  /// A failure message for any issues that occurred when creating the custom
  /// model. This is included for only a failed CreateCustomModel operation.
  final String? failureMessage;

  /// Hyperparameter values associated with this model. For details on the format
  /// for different models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models-hp.html">Custom
  /// model hyperparameters</a>.
  final Map<String, String>? hyperParameters;

  /// Job Amazon Resource Name (ARN) associated with this model. For models that
  /// you create with the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateCustomModel.html">CreateCustomModel</a>
  /// API operation, this is <code>NULL</code>.
  final String? jobArn;

  /// Job name associated with this model.
  final String? jobName;

  /// The custom model is encrypted at rest using this key.
  final String? modelKmsKeyArn;

  /// The current status of the custom model. Possible values include:
  ///
  /// <ul>
  /// <li>
  /// <code>Creating</code> - The model is being created and validated.
  /// </li>
  /// <li>
  /// <code>Active</code> - The model has been successfully created and is ready
  /// for use.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The model creation process failed. Check the
  /// <code>failureMessage</code> field for details.
  /// </li>
  /// </ul>
  final ModelStatus? modelStatus;

  /// Output data configuration associated with this custom model.
  final OutputDataConfig? outputDataConfig;

  /// Contains information about the training dataset.
  final TrainingDataConfig? trainingDataConfig;

  /// Contains training metrics from the job creation.
  final TrainingMetrics? trainingMetrics;

  /// Contains information about the validation dataset.
  final ValidationDataConfig? validationDataConfig;

  /// The validation metrics from the job creation.
  final List<ValidatorMetric>? validationMetrics;

  GetCustomModelResponse({
    required this.creationTime,
    required this.modelArn,
    required this.modelName,
    this.baseModelArn,
    this.customizationConfig,
    this.customizationType,
    this.failureMessage,
    this.hyperParameters,
    this.jobArn,
    this.jobName,
    this.modelKmsKeyArn,
    this.modelStatus,
    this.outputDataConfig,
    this.trainingDataConfig,
    this.trainingMetrics,
    this.validationDataConfig,
    this.validationMetrics,
  });

  factory GetCustomModelResponse.fromJson(Map<String, dynamic> json) {
    return GetCustomModelResponse(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      modelArn: (json['modelArn'] as String?) ?? '',
      modelName: (json['modelName'] as String?) ?? '',
      baseModelArn: json['baseModelArn'] as String?,
      customizationConfig: json['customizationConfig'] != null
          ? CustomizationConfig.fromJson(
              json['customizationConfig'] as Map<String, dynamic>)
          : null,
      customizationType: (json['customizationType'] as String?)
          ?.let(CustomizationType.fromString),
      failureMessage: json['failureMessage'] as String?,
      hyperParameters: (json['hyperParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      jobArn: json['jobArn'] as String?,
      jobName: json['jobName'] as String?,
      modelKmsKeyArn: json['modelKmsKeyArn'] as String?,
      modelStatus:
          (json['modelStatus'] as String?)?.let(ModelStatus.fromString),
      outputDataConfig: json['outputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['outputDataConfig'] as Map<String, dynamic>)
          : null,
      trainingDataConfig: json['trainingDataConfig'] != null
          ? TrainingDataConfig.fromJson(
              json['trainingDataConfig'] as Map<String, dynamic>)
          : null,
      trainingMetrics: json['trainingMetrics'] != null
          ? TrainingMetrics.fromJson(
              json['trainingMetrics'] as Map<String, dynamic>)
          : null,
      validationDataConfig: json['validationDataConfig'] != null
          ? ValidationDataConfig.fromJson(
              json['validationDataConfig'] as Map<String, dynamic>)
          : null,
      validationMetrics: (json['validationMetrics'] as List?)
          ?.nonNulls
          .map((e) => ValidatorMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final baseModelArn = this.baseModelArn;
    final customizationConfig = this.customizationConfig;
    final customizationType = this.customizationType;
    final failureMessage = this.failureMessage;
    final hyperParameters = this.hyperParameters;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final modelKmsKeyArn = this.modelKmsKeyArn;
    final modelStatus = this.modelStatus;
    final outputDataConfig = this.outputDataConfig;
    final trainingDataConfig = this.trainingDataConfig;
    final trainingMetrics = this.trainingMetrics;
    final validationDataConfig = this.validationDataConfig;
    final validationMetrics = this.validationMetrics;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'modelArn': modelArn,
      'modelName': modelName,
      if (baseModelArn != null) 'baseModelArn': baseModelArn,
      if (customizationConfig != null)
        'customizationConfig': customizationConfig,
      if (customizationType != null)
        'customizationType': customizationType.value,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
      if (jobArn != null) 'jobArn': jobArn,
      if (jobName != null) 'jobName': jobName,
      if (modelKmsKeyArn != null) 'modelKmsKeyArn': modelKmsKeyArn,
      if (modelStatus != null) 'modelStatus': modelStatus.value,
      if (outputDataConfig != null) 'outputDataConfig': outputDataConfig,
      if (trainingDataConfig != null) 'trainingDataConfig': trainingDataConfig,
      if (trainingMetrics != null) 'trainingMetrics': trainingMetrics,
      if (validationDataConfig != null)
        'validationDataConfig': validationDataConfig,
      if (validationMetrics != null) 'validationMetrics': validationMetrics,
    };
  }
}

/// @nodoc
class ListCustomModelsResponse {
  /// Model summaries.
  final List<CustomModelSummary>? modelSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListCustomModelsResponse({
    this.modelSummaries,
    this.nextToken,
  });

  factory ListCustomModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListCustomModelsResponse(
      modelSummaries: (json['modelSummaries'] as List?)
          ?.nonNulls
          .map((e) => CustomModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelSummaries = this.modelSummaries;
    final nextToken = this.nextToken;
    return {
      if (modelSummaries != null) 'modelSummaries': modelSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class DeleteEnforcedGuardrailConfigurationResponse {
  DeleteEnforcedGuardrailConfigurationResponse();

  factory DeleteEnforcedGuardrailConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteEnforcedGuardrailConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListEnforcedGuardrailsConfigurationResponse {
  /// Array of AccountEnforcedGuardrailOutputConfiguration objects.
  final List<AccountEnforcedGuardrailOutputConfiguration> guardrailsConfig;

  /// Opaque continuation token of previous paginated response.
  final String? nextToken;

  ListEnforcedGuardrailsConfigurationResponse({
    required this.guardrailsConfig,
    this.nextToken,
  });

  factory ListEnforcedGuardrailsConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEnforcedGuardrailsConfigurationResponse(
      guardrailsConfig: ((json['guardrailsConfig'] as List?) ?? const [])
          .nonNulls
          .map((e) => AccountEnforcedGuardrailOutputConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrailsConfig = this.guardrailsConfig;
    final nextToken = this.nextToken;
    return {
      'guardrailsConfig': guardrailsConfig,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class PutEnforcedGuardrailConfigurationResponse {
  /// Unique ID for the account enforced configuration.
  final String? configId;

  /// Timestamp.
  final DateTime? updatedAt;

  /// The ARN of the role used to update the configuration.
  final String? updatedBy;

  PutEnforcedGuardrailConfigurationResponse({
    this.configId,
    this.updatedAt,
    this.updatedBy,
  });

  factory PutEnforcedGuardrailConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutEnforcedGuardrailConfigurationResponse(
      configId: json['configId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configId = this.configId;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      if (configId != null) 'configId': configId,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// @nodoc
class BatchDeleteEvaluationJobResponse {
  /// A JSON object containing the HTTP status codes and the ARNs of evaluation
  /// jobs that failed to be deleted.
  final List<BatchDeleteEvaluationJobError> errors;

  /// The list of evaluation jobs for deletion.
  final List<BatchDeleteEvaluationJobItem> evaluationJobs;

  BatchDeleteEvaluationJobResponse({
    required this.errors,
    required this.evaluationJobs,
  });

  factory BatchDeleteEvaluationJobResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteEvaluationJobResponse(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchDeleteEvaluationJobError.fromJson(e as Map<String, dynamic>))
          .toList(),
      evaluationJobs: ((json['evaluationJobs'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              BatchDeleteEvaluationJobItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final evaluationJobs = this.evaluationJobs;
    return {
      'errors': errors,
      'evaluationJobs': evaluationJobs,
    };
  }
}

/// @nodoc
class CreateEvaluationJobResponse {
  /// The Amazon Resource Name (ARN) of the evaluation job.
  final String jobArn;

  CreateEvaluationJobResponse({
    required this.jobArn,
  });

  factory CreateEvaluationJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateEvaluationJobResponse(
      jobArn: (json['jobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

/// @nodoc
class GetEvaluationJobResponse {
  /// The time the evaluation job was created.
  final DateTime creationTime;

  /// Contains the configuration details of either an automated or human-based
  /// evaluation job.
  final EvaluationConfig evaluationConfig;

  /// Contains the configuration details of the inference model used for the
  /// evaluation job.
  final EvaluationInferenceConfig inferenceConfig;

  /// The Amazon Resource Name (ARN) of the evaluation job.
  final String jobArn;

  /// The name for the evaluation job.
  final String jobName;

  /// Specifies whether the evaluation job is automated or human-based.
  final EvaluationJobType jobType;

  /// Contains the configuration details of the Amazon S3 bucket for storing the
  /// results of the evaluation job.
  final EvaluationOutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) of the IAM service role used in the
  /// evaluation job.
  final String roleArn;

  /// The current status of the evaluation job.
  final EvaluationJobStatus status;

  /// Specifies whether the evaluation job is for evaluating a model or evaluating
  /// a knowledge base (retrieval and response generation).
  final ApplicationType? applicationType;

  /// The Amazon Resource Name (ARN) of the customer managed encryption key
  /// specified when the evaluation job was created.
  final String? customerEncryptionKeyId;

  /// A list of strings that specify why the evaluation job failed to create.
  final List<String>? failureMessages;

  /// The description of the evaluation job.
  final String? jobDescription;

  /// The time the evaluation job was last modified.
  final DateTime? lastModifiedTime;

  GetEvaluationJobResponse({
    required this.creationTime,
    required this.evaluationConfig,
    required this.inferenceConfig,
    required this.jobArn,
    required this.jobName,
    required this.jobType,
    required this.outputDataConfig,
    required this.roleArn,
    required this.status,
    this.applicationType,
    this.customerEncryptionKeyId,
    this.failureMessages,
    this.jobDescription,
    this.lastModifiedTime,
  });

  factory GetEvaluationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetEvaluationJobResponse(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      evaluationConfig: EvaluationConfig.fromJson(
          (json['evaluationConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      inferenceConfig: EvaluationInferenceConfig.fromJson(
          (json['inferenceConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      jobType: EvaluationJobType.fromString((json['jobType'] as String?) ?? ''),
      outputDataConfig: EvaluationOutputDataConfig.fromJson(
          (json['outputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
      status: EvaluationJobStatus.fromString((json['status'] as String?) ?? ''),
      applicationType:
          (json['applicationType'] as String?)?.let(ApplicationType.fromString),
      customerEncryptionKeyId: json['customerEncryptionKeyId'] as String?,
      failureMessages: (json['failureMessages'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      jobDescription: json['jobDescription'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final evaluationConfig = this.evaluationConfig;
    final inferenceConfig = this.inferenceConfig;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final jobType = this.jobType;
    final outputDataConfig = this.outputDataConfig;
    final roleArn = this.roleArn;
    final status = this.status;
    final applicationType = this.applicationType;
    final customerEncryptionKeyId = this.customerEncryptionKeyId;
    final failureMessages = this.failureMessages;
    final jobDescription = this.jobDescription;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'evaluationConfig': evaluationConfig,
      'inferenceConfig': inferenceConfig,
      'jobArn': jobArn,
      'jobName': jobName,
      'jobType': jobType.value,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'status': status.value,
      if (applicationType != null) 'applicationType': applicationType.value,
      if (customerEncryptionKeyId != null)
        'customerEncryptionKeyId': customerEncryptionKeyId,
      if (failureMessages != null) 'failureMessages': failureMessages,
      if (jobDescription != null) 'jobDescription': jobDescription,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

/// @nodoc
class ListEvaluationJobsResponse {
  /// A list of summaries of the evaluation jobs.
  final List<EvaluationSummary>? jobSummaries;

  /// Continuation token from the previous response, for Amazon Bedrock to list
  /// the next set of results.
  final String? nextToken;

  ListEvaluationJobsResponse({
    this.jobSummaries,
    this.nextToken,
  });

  factory ListEvaluationJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListEvaluationJobsResponse(
      jobSummaries: (json['jobSummaries'] as List?)
          ?.nonNulls
          .map((e) => EvaluationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobSummaries = this.jobSummaries;
    final nextToken = this.nextToken;
    return {
      if (jobSummaries != null) 'jobSummaries': jobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StopEvaluationJobResponse {
  StopEvaluationJobResponse();

  factory StopEvaluationJobResponse.fromJson(Map<String, dynamic> _) {
    return StopEvaluationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateGuardrailResponse {
  /// The time at which the guardrail was created.
  final DateTime createdAt;

  /// The ARN of the guardrail.
  final String guardrailArn;

  /// The unique identifier of the guardrail that was created.
  final String guardrailId;

  /// The version of the guardrail that was created. This value will always be
  /// <code>DRAFT</code>.
  final String version;

  CreateGuardrailResponse({
    required this.createdAt,
    required this.guardrailArn,
    required this.guardrailId,
    required this.version,
  });

  factory CreateGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return CreateGuardrailResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      guardrailArn: (json['guardrailArn'] as String?) ?? '',
      guardrailId: (json['guardrailId'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final guardrailArn = this.guardrailArn;
    final guardrailId = this.guardrailId;
    final version = this.version;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'guardrailArn': guardrailArn,
      'guardrailId': guardrailId,
      'version': version,
    };
  }
}

/// @nodoc
class GetGuardrailResponse {
  /// The message that the guardrail returns when it blocks a prompt.
  final String blockedInputMessaging;

  /// The message that the guardrail returns when it blocks a model response.
  final String blockedOutputsMessaging;

  /// The date and time at which the guardrail was created.
  final DateTime createdAt;

  /// The ARN of the guardrail.
  final String guardrailArn;

  /// The unique identifier of the guardrail.
  final String guardrailId;

  /// The name of the guardrail.
  final String name;

  /// The status of the guardrail.
  final GuardrailStatus status;

  /// The date and time at which the guardrail was updated.
  final DateTime updatedAt;

  /// The version of the guardrail.
  final String version;

  /// The current Automated Reasoning policy configuration for the guardrail, if
  /// any is configured.
  final GuardrailAutomatedReasoningPolicy? automatedReasoningPolicy;

  /// The content policy that was configured for the guardrail.
  final GuardrailContentPolicy? contentPolicy;

  /// The contextual grounding policy used in the guardrail.
  final GuardrailContextualGroundingPolicy? contextualGroundingPolicy;

  /// Details about the system-defined guardrail profile that you're using with
  /// your guardrail, including the guardrail profile ID and Amazon Resource Name
  /// (ARN).
  final GuardrailCrossRegionDetails? crossRegionDetails;

  /// The description of the guardrail.
  final String? description;

  /// Appears if the <code>status</code> of the guardrail is <code>FAILED</code>.
  /// A list of recommendations to carry out before retrying the request.
  final List<String>? failureRecommendations;

  /// The ARN of the KMS key that encrypts the guardrail.
  final String? kmsKeyArn;

  /// The sensitive information policy that was configured for the guardrail.
  final GuardrailSensitiveInformationPolicy? sensitiveInformationPolicy;

  /// Appears if the <code>status</code> is <code>FAILED</code>. A list of reasons
  /// for why the guardrail failed to be created, updated, versioned, or deleted.
  final List<String>? statusReasons;

  /// The topic policy that was configured for the guardrail.
  final GuardrailTopicPolicy? topicPolicy;

  /// The word policy that was configured for the guardrail.
  final GuardrailWordPolicy? wordPolicy;

  GetGuardrailResponse({
    required this.blockedInputMessaging,
    required this.blockedOutputsMessaging,
    required this.createdAt,
    required this.guardrailArn,
    required this.guardrailId,
    required this.name,
    required this.status,
    required this.updatedAt,
    required this.version,
    this.automatedReasoningPolicy,
    this.contentPolicy,
    this.contextualGroundingPolicy,
    this.crossRegionDetails,
    this.description,
    this.failureRecommendations,
    this.kmsKeyArn,
    this.sensitiveInformationPolicy,
    this.statusReasons,
    this.topicPolicy,
    this.wordPolicy,
  });

  factory GetGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return GetGuardrailResponse(
      blockedInputMessaging: (json['blockedInputMessaging'] as String?) ?? '',
      blockedOutputsMessaging:
          (json['blockedOutputsMessaging'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      guardrailArn: (json['guardrailArn'] as String?) ?? '',
      guardrailId: (json['guardrailId'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: GuardrailStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
      automatedReasoningPolicy: json['automatedReasoningPolicy'] != null
          ? GuardrailAutomatedReasoningPolicy.fromJson(
              json['automatedReasoningPolicy'] as Map<String, dynamic>)
          : null,
      contentPolicy: json['contentPolicy'] != null
          ? GuardrailContentPolicy.fromJson(
              json['contentPolicy'] as Map<String, dynamic>)
          : null,
      contextualGroundingPolicy: json['contextualGroundingPolicy'] != null
          ? GuardrailContextualGroundingPolicy.fromJson(
              json['contextualGroundingPolicy'] as Map<String, dynamic>)
          : null,
      crossRegionDetails: json['crossRegionDetails'] != null
          ? GuardrailCrossRegionDetails.fromJson(
              json['crossRegionDetails'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      failureRecommendations: (json['failureRecommendations'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
      sensitiveInformationPolicy: json['sensitiveInformationPolicy'] != null
          ? GuardrailSensitiveInformationPolicy.fromJson(
              json['sensitiveInformationPolicy'] as Map<String, dynamic>)
          : null,
      statusReasons: (json['statusReasons'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      topicPolicy: json['topicPolicy'] != null
          ? GuardrailTopicPolicy.fromJson(
              json['topicPolicy'] as Map<String, dynamic>)
          : null,
      wordPolicy: json['wordPolicy'] != null
          ? GuardrailWordPolicy.fromJson(
              json['wordPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final blockedInputMessaging = this.blockedInputMessaging;
    final blockedOutputsMessaging = this.blockedOutputsMessaging;
    final createdAt = this.createdAt;
    final guardrailArn = this.guardrailArn;
    final guardrailId = this.guardrailId;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final automatedReasoningPolicy = this.automatedReasoningPolicy;
    final contentPolicy = this.contentPolicy;
    final contextualGroundingPolicy = this.contextualGroundingPolicy;
    final crossRegionDetails = this.crossRegionDetails;
    final description = this.description;
    final failureRecommendations = this.failureRecommendations;
    final kmsKeyArn = this.kmsKeyArn;
    final sensitiveInformationPolicy = this.sensitiveInformationPolicy;
    final statusReasons = this.statusReasons;
    final topicPolicy = this.topicPolicy;
    final wordPolicy = this.wordPolicy;
    return {
      'blockedInputMessaging': blockedInputMessaging,
      'blockedOutputsMessaging': blockedOutputsMessaging,
      'createdAt': iso8601ToJson(createdAt),
      'guardrailArn': guardrailArn,
      'guardrailId': guardrailId,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (automatedReasoningPolicy != null)
        'automatedReasoningPolicy': automatedReasoningPolicy,
      if (contentPolicy != null) 'contentPolicy': contentPolicy,
      if (contextualGroundingPolicy != null)
        'contextualGroundingPolicy': contextualGroundingPolicy,
      if (crossRegionDetails != null) 'crossRegionDetails': crossRegionDetails,
      if (description != null) 'description': description,
      if (failureRecommendations != null)
        'failureRecommendations': failureRecommendations,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (sensitiveInformationPolicy != null)
        'sensitiveInformationPolicy': sensitiveInformationPolicy,
      if (statusReasons != null) 'statusReasons': statusReasons,
      if (topicPolicy != null) 'topicPolicy': topicPolicy,
      if (wordPolicy != null) 'wordPolicy': wordPolicy,
    };
  }
}

/// @nodoc
class UpdateGuardrailResponse {
  /// The ARN of the guardrail.
  final String guardrailArn;

  /// The unique identifier of the guardrail
  final String guardrailId;

  /// The date and time at which the guardrail was updated.
  final DateTime updatedAt;

  /// The version of the guardrail.
  final String version;

  UpdateGuardrailResponse({
    required this.guardrailArn,
    required this.guardrailId,
    required this.updatedAt,
    required this.version,
  });

  factory UpdateGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGuardrailResponse(
      guardrailArn: (json['guardrailArn'] as String?) ?? '',
      guardrailId: (json['guardrailId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final guardrailArn = this.guardrailArn;
    final guardrailId = this.guardrailId;
    final updatedAt = this.updatedAt;
    final version = this.version;
    return {
      'guardrailArn': guardrailArn,
      'guardrailId': guardrailId,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
    };
  }
}

/// @nodoc
class DeleteGuardrailResponse {
  DeleteGuardrailResponse();

  factory DeleteGuardrailResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGuardrailResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListGuardrailsResponse {
  /// A list of objects, each of which contains details about a guardrail.
  final List<GuardrailSummary> guardrails;

  /// If there are more results than were returned in the response, the response
  /// returns a <code>nextToken</code> that you can send in another
  /// <code>ListGuardrails</code> request to see the next batch of results.
  final String? nextToken;

  ListGuardrailsResponse({
    required this.guardrails,
    this.nextToken,
  });

  factory ListGuardrailsResponse.fromJson(Map<String, dynamic> json) {
    return ListGuardrailsResponse(
      guardrails: ((json['guardrails'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuardrailSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrails = this.guardrails;
    final nextToken = this.nextToken;
    return {
      'guardrails': guardrails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateGuardrailVersionResponse {
  /// The unique identifier of the guardrail.
  final String guardrailId;

  /// The number of the version of the guardrail.
  final String version;

  CreateGuardrailVersionResponse({
    required this.guardrailId,
    required this.version,
  });

  factory CreateGuardrailVersionResponse.fromJson(Map<String, dynamic> json) {
    return CreateGuardrailVersionResponse(
      guardrailId: (json['guardrailId'] as String?) ?? '',
      version: (json['version'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final guardrailId = this.guardrailId;
    final version = this.version;
    return {
      'guardrailId': guardrailId,
      'version': version,
    };
  }
}

/// @nodoc
class CreateInferenceProfileResponse {
  /// The ARN of the inference profile that you created.
  final String inferenceProfileArn;

  /// The status of the inference profile. <code>ACTIVE</code> means that the
  /// inference profile is ready to be used.
  final InferenceProfileStatus? status;

  CreateInferenceProfileResponse({
    required this.inferenceProfileArn,
    this.status,
  });

  factory CreateInferenceProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateInferenceProfileResponse(
      inferenceProfileArn: (json['inferenceProfileArn'] as String?) ?? '',
      status:
          (json['status'] as String?)?.let(InferenceProfileStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceProfileArn = this.inferenceProfileArn;
    final status = this.status;
    return {
      'inferenceProfileArn': inferenceProfileArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class GetInferenceProfileResponse {
  /// The Amazon Resource Name (ARN) of the inference profile.
  final String inferenceProfileArn;

  /// The unique identifier of the inference profile.
  final String inferenceProfileId;

  /// The name of the inference profile.
  final String inferenceProfileName;

  /// A list of information about each model in the inference profile.
  final List<InferenceProfileModel> models;

  /// The status of the inference profile. <code>ACTIVE</code> means that the
  /// inference profile is ready to be used.
  final InferenceProfileStatus status;

  /// The type of the inference profile. The following types are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>SYSTEM_DEFINED</code> – The inference profile is defined by Amazon
  /// Bedrock. You can route inference requests across regions with these
  /// inference profiles.
  /// </li>
  /// <li>
  /// <code>APPLICATION</code> – The inference profile was created by a user. This
  /// type of inference profile can track metrics and costs when invoking the
  /// model in it. The inference profile may route requests to one or multiple
  /// regions.
  /// </li>
  /// </ul>
  final InferenceProfileType type;

  /// The time at which the inference profile was created.
  final DateTime? createdAt;

  /// The description of the inference profile.
  final String? description;

  /// The time at which the inference profile was last updated.
  final DateTime? updatedAt;

  GetInferenceProfileResponse({
    required this.inferenceProfileArn,
    required this.inferenceProfileId,
    required this.inferenceProfileName,
    required this.models,
    required this.status,
    required this.type,
    this.createdAt,
    this.description,
    this.updatedAt,
  });

  factory GetInferenceProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetInferenceProfileResponse(
      inferenceProfileArn: (json['inferenceProfileArn'] as String?) ?? '',
      inferenceProfileId: (json['inferenceProfileId'] as String?) ?? '',
      inferenceProfileName: (json['inferenceProfileName'] as String?) ?? '',
      models: ((json['models'] as List?) ?? const [])
          .nonNulls
          .map((e) => InferenceProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          InferenceProfileStatus.fromString((json['status'] as String?) ?? ''),
      type: InferenceProfileType.fromString((json['type'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceProfileArn = this.inferenceProfileArn;
    final inferenceProfileId = this.inferenceProfileId;
    final inferenceProfileName = this.inferenceProfileName;
    final models = this.models;
    final status = this.status;
    final type = this.type;
    final createdAt = this.createdAt;
    final description = this.description;
    final updatedAt = this.updatedAt;
    return {
      'inferenceProfileArn': inferenceProfileArn,
      'inferenceProfileId': inferenceProfileId,
      'inferenceProfileName': inferenceProfileName,
      'models': models,
      'status': status.value,
      'type': type.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class DeleteInferenceProfileResponse {
  DeleteInferenceProfileResponse();

  factory DeleteInferenceProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteInferenceProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListInferenceProfilesResponse {
  /// A list of information about each inference profile that you can use.
  final List<InferenceProfileSummary>? inferenceProfileSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListInferenceProfilesResponse({
    this.inferenceProfileSummaries,
    this.nextToken,
  });

  factory ListInferenceProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListInferenceProfilesResponse(
      inferenceProfileSummaries: (json['inferenceProfileSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              InferenceProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceProfileSummaries = this.inferenceProfileSummaries;
    final nextToken = this.nextToken;
    return {
      if (inferenceProfileSummaries != null)
        'inferenceProfileSummaries': inferenceProfileSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class DeleteModelInvocationLoggingConfigurationResponse {
  DeleteModelInvocationLoggingConfigurationResponse();

  factory DeleteModelInvocationLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteModelInvocationLoggingConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetModelInvocationLoggingConfigurationResponse {
  /// The current configuration values.
  final LoggingConfig? loggingConfig;

  GetModelInvocationLoggingConfigurationResponse({
    this.loggingConfig,
  });

  factory GetModelInvocationLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetModelInvocationLoggingConfigurationResponse(
      loggingConfig: json['loggingConfig'] != null
          ? LoggingConfig.fromJson(
              json['loggingConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfig = this.loggingConfig;
    return {
      if (loggingConfig != null) 'loggingConfig': loggingConfig,
    };
  }
}

/// @nodoc
class PutModelInvocationLoggingConfigurationResponse {
  PutModelInvocationLoggingConfigurationResponse();

  factory PutModelInvocationLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return PutModelInvocationLoggingConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateModelCopyJobResponse {
  /// The Amazon Resource Name (ARN) of the model copy job.
  final String jobArn;

  CreateModelCopyJobResponse({
    required this.jobArn,
  });

  factory CreateModelCopyJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelCopyJobResponse(
      jobArn: (json['jobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

/// @nodoc
class GetModelCopyJobResponse {
  /// The time at which the model copy job was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the model copy job.
  final String jobArn;

  /// The unique identifier of the account that the model being copied originated
  /// from.
  final String sourceAccountId;

  /// The Amazon Resource Name (ARN) of the original model being copied.
  final String sourceModelArn;

  /// The status of the model copy job.
  final ModelCopyJobStatus status;

  /// The Amazon Resource Name (ARN) of the copied model.
  final String targetModelArn;

  /// An error message for why the model copy job failed.
  final String? failureMessage;

  /// The name of the original model being copied.
  final String? sourceModelName;

  /// The Amazon Resource Name (ARN) of the KMS key encrypting the copied model.
  final String? targetModelKmsKeyArn;

  /// The name of the copied model.
  final String? targetModelName;

  /// The tags associated with the copied model.
  final List<Tag>? targetModelTags;

  GetModelCopyJobResponse({
    required this.creationTime,
    required this.jobArn,
    required this.sourceAccountId,
    required this.sourceModelArn,
    required this.status,
    required this.targetModelArn,
    this.failureMessage,
    this.sourceModelName,
    this.targetModelKmsKeyArn,
    this.targetModelName,
    this.targetModelTags,
  });

  factory GetModelCopyJobResponse.fromJson(Map<String, dynamic> json) {
    return GetModelCopyJobResponse(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      jobArn: (json['jobArn'] as String?) ?? '',
      sourceAccountId: (json['sourceAccountId'] as String?) ?? '',
      sourceModelArn: (json['sourceModelArn'] as String?) ?? '',
      status: ModelCopyJobStatus.fromString((json['status'] as String?) ?? ''),
      targetModelArn: (json['targetModelArn'] as String?) ?? '',
      failureMessage: json['failureMessage'] as String?,
      sourceModelName: json['sourceModelName'] as String?,
      targetModelKmsKeyArn: json['targetModelKmsKeyArn'] as String?,
      targetModelName: json['targetModelName'] as String?,
      targetModelTags: (json['targetModelTags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final jobArn = this.jobArn;
    final sourceAccountId = this.sourceAccountId;
    final sourceModelArn = this.sourceModelArn;
    final status = this.status;
    final targetModelArn = this.targetModelArn;
    final failureMessage = this.failureMessage;
    final sourceModelName = this.sourceModelName;
    final targetModelKmsKeyArn = this.targetModelKmsKeyArn;
    final targetModelName = this.targetModelName;
    final targetModelTags = this.targetModelTags;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'jobArn': jobArn,
      'sourceAccountId': sourceAccountId,
      'sourceModelArn': sourceModelArn,
      'status': status.value,
      'targetModelArn': targetModelArn,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (sourceModelName != null) 'sourceModelName': sourceModelName,
      if (targetModelKmsKeyArn != null)
        'targetModelKmsKeyArn': targetModelKmsKeyArn,
      if (targetModelName != null) 'targetModelName': targetModelName,
      if (targetModelTags != null) 'targetModelTags': targetModelTags,
    };
  }
}

/// @nodoc
class ListModelCopyJobsResponse {
  /// A list of information about each model copy job.
  final List<ModelCopyJobSummary>? modelCopyJobSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListModelCopyJobsResponse({
    this.modelCopyJobSummaries,
    this.nextToken,
  });

  factory ListModelCopyJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelCopyJobsResponse(
      modelCopyJobSummaries: (json['modelCopyJobSummaries'] as List?)
          ?.nonNulls
          .map((e) => ModelCopyJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelCopyJobSummaries = this.modelCopyJobSummaries;
    final nextToken = this.nextToken;
    return {
      if (modelCopyJobSummaries != null)
        'modelCopyJobSummaries': modelCopyJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateModelImportJobResponse {
  /// The Amazon Resource Name (ARN) of the model import job.
  final String jobArn;

  CreateModelImportJobResponse({
    required this.jobArn,
  });

  factory CreateModelImportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelImportJobResponse(
      jobArn: (json['jobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

/// @nodoc
class DeleteImportedModelResponse {
  DeleteImportedModelResponse();

  factory DeleteImportedModelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteImportedModelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetImportedModelResponse {
  /// Creation time of the imported model.
  final DateTime? creationTime;

  /// Information about the hardware utilization for a single copy of the model.
  final CustomModelUnits? customModelUnits;

  /// Specifies if the imported model supports converse.
  final bool? instructSupported;

  /// Job Amazon Resource Name (ARN) associated with the imported model.
  final String? jobArn;

  /// Job name associated with the imported model.
  final String? jobName;

  /// The architecture of the imported model.
  final String? modelArchitecture;

  /// The Amazon Resource Name (ARN) associated with this imported model.
  final String? modelArn;

  /// The data source for this imported model.
  final ModelDataSource? modelDataSource;

  /// The imported model is encrypted at rest using this key.
  final String? modelKmsKeyArn;

  /// The name of the imported model.
  final String? modelName;

  GetImportedModelResponse({
    this.creationTime,
    this.customModelUnits,
    this.instructSupported,
    this.jobArn,
    this.jobName,
    this.modelArchitecture,
    this.modelArn,
    this.modelDataSource,
    this.modelKmsKeyArn,
    this.modelName,
  });

  factory GetImportedModelResponse.fromJson(Map<String, dynamic> json) {
    return GetImportedModelResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      customModelUnits: json['customModelUnits'] != null
          ? CustomModelUnits.fromJson(
              json['customModelUnits'] as Map<String, dynamic>)
          : null,
      instructSupported: json['instructSupported'] as bool?,
      jobArn: json['jobArn'] as String?,
      jobName: json['jobName'] as String?,
      modelArchitecture: json['modelArchitecture'] as String?,
      modelArn: json['modelArn'] as String?,
      modelDataSource: json['modelDataSource'] != null
          ? ModelDataSource.fromJson(
              json['modelDataSource'] as Map<String, dynamic>)
          : null,
      modelKmsKeyArn: json['modelKmsKeyArn'] as String?,
      modelName: json['modelName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final customModelUnits = this.customModelUnits;
    final instructSupported = this.instructSupported;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final modelArchitecture = this.modelArchitecture;
    final modelArn = this.modelArn;
    final modelDataSource = this.modelDataSource;
    final modelKmsKeyArn = this.modelKmsKeyArn;
    final modelName = this.modelName;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (customModelUnits != null) 'customModelUnits': customModelUnits,
      if (instructSupported != null) 'instructSupported': instructSupported,
      if (jobArn != null) 'jobArn': jobArn,
      if (jobName != null) 'jobName': jobName,
      if (modelArchitecture != null) 'modelArchitecture': modelArchitecture,
      if (modelArn != null) 'modelArn': modelArn,
      if (modelDataSource != null) 'modelDataSource': modelDataSource,
      if (modelKmsKeyArn != null) 'modelKmsKeyArn': modelKmsKeyArn,
      if (modelName != null) 'modelName': modelName,
    };
  }
}

/// @nodoc
class GetModelImportJobResponse {
  /// The time the resource was created.
  final DateTime? creationTime;

  /// Time that the resource transitioned to terminal state.
  final DateTime? endTime;

  /// Information about why the import job failed.
  final String? failureMessage;

  /// The Amazon Resource Name (ARN) of the imported model.
  final String? importedModelArn;

  /// The imported model is encrypted at rest using this key.
  final String? importedModelKmsKeyArn;

  /// The name of the imported model.
  final String? importedModelName;

  /// The Amazon Resource Name (ARN) of the import job.
  final String? jobArn;

  /// The name of the import job.
  final String? jobName;

  /// Time the resource was last modified.
  final DateTime? lastModifiedTime;

  /// The data source for the imported model.
  final ModelDataSource? modelDataSource;

  /// The Amazon Resource Name (ARN) of the IAM role associated with this job.
  final String? roleArn;

  /// The status of the job. A successful job transitions from in-progress to
  /// completed when the imported model is ready to use. If the job failed, the
  /// failure message contains information about why the job failed.
  final ModelImportJobStatus? status;

  /// The Virtual Private Cloud (VPC) configuration of the import model job.
  final VpcConfig? vpcConfig;

  GetModelImportJobResponse({
    this.creationTime,
    this.endTime,
    this.failureMessage,
    this.importedModelArn,
    this.importedModelKmsKeyArn,
    this.importedModelName,
    this.jobArn,
    this.jobName,
    this.lastModifiedTime,
    this.modelDataSource,
    this.roleArn,
    this.status,
    this.vpcConfig,
  });

  factory GetModelImportJobResponse.fromJson(Map<String, dynamic> json) {
    return GetModelImportJobResponse(
      creationTime: timeStampFromJson(json['creationTime']),
      endTime: timeStampFromJson(json['endTime']),
      failureMessage: json['failureMessage'] as String?,
      importedModelArn: json['importedModelArn'] as String?,
      importedModelKmsKeyArn: json['importedModelKmsKeyArn'] as String?,
      importedModelName: json['importedModelName'] as String?,
      jobArn: json['jobArn'] as String?,
      jobName: json['jobName'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      modelDataSource: json['modelDataSource'] != null
          ? ModelDataSource.fromJson(
              json['modelDataSource'] as Map<String, dynamic>)
          : null,
      roleArn: json['roleArn'] as String?,
      status: (json['status'] as String?)?.let(ModelImportJobStatus.fromString),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final endTime = this.endTime;
    final failureMessage = this.failureMessage;
    final importedModelArn = this.importedModelArn;
    final importedModelKmsKeyArn = this.importedModelKmsKeyArn;
    final importedModelName = this.importedModelName;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final lastModifiedTime = this.lastModifiedTime;
    final modelDataSource = this.modelDataSource;
    final roleArn = this.roleArn;
    final status = this.status;
    final vpcConfig = this.vpcConfig;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (importedModelArn != null) 'importedModelArn': importedModelArn,
      if (importedModelKmsKeyArn != null)
        'importedModelKmsKeyArn': importedModelKmsKeyArn,
      if (importedModelName != null) 'importedModelName': importedModelName,
      if (jobArn != null) 'jobArn': jobArn,
      if (jobName != null) 'jobName': jobName,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (modelDataSource != null) 'modelDataSource': modelDataSource,
      if (roleArn != null) 'roleArn': roleArn,
      if (status != null) 'status': status.value,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// @nodoc
class ListImportedModelsResponse {
  /// Model summaries.
  final List<ImportedModelSummary>? modelSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListImportedModelsResponse({
    this.modelSummaries,
    this.nextToken,
  });

  factory ListImportedModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportedModelsResponse(
      modelSummaries: (json['modelSummaries'] as List?)
          ?.nonNulls
          .map((e) => ImportedModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelSummaries = this.modelSummaries;
    final nextToken = this.nextToken;
    return {
      if (modelSummaries != null) 'modelSummaries': modelSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListModelImportJobsResponse {
  /// Import job summaries.
  final List<ModelImportJobSummary>? modelImportJobSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, enter the token returned in the
  /// <code>nextToken</code> field in the response in this field to return the
  /// next batch of results.
  final String? nextToken;

  ListModelImportJobsResponse({
    this.modelImportJobSummaries,
    this.nextToken,
  });

  factory ListModelImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelImportJobsResponse(
      modelImportJobSummaries: (json['modelImportJobSummaries'] as List?)
          ?.nonNulls
          .map((e) => ModelImportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelImportJobSummaries = this.modelImportJobSummaries;
    final nextToken = this.nextToken;
    return {
      if (modelImportJobSummaries != null)
        'modelImportJobSummaries': modelImportJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateModelInvocationJobResponse {
  /// The Amazon Resource Name (ARN) of the batch inference job.
  final String jobArn;

  CreateModelInvocationJobResponse({
    required this.jobArn,
  });

  factory CreateModelInvocationJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelInvocationJobResponse(
      jobArn: (json['jobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

/// @nodoc
class GetModelInvocationJobResponse {
  /// Details about the location of the input to the batch inference job.
  final ModelInvocationJobInputDataConfig inputDataConfig;

  /// The Amazon Resource Name (ARN) of the batch inference job.
  final String jobArn;

  /// The unique identifier of the foundation model used for model inference.
  final String modelId;

  /// Details about the location of the output of the batch inference job.
  final ModelInvocationJobOutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) of the service role with permissions to carry
  /// out and manage batch inference. You can use the console to create a default
  /// service role or follow the steps at <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-iam-sr.html">Create
  /// a service role for batch inference</a>.
  final String roleArn;

  /// The time at which the batch inference job was submitted.
  final DateTime submitTime;

  /// A unique, case-sensitive identifier to ensure that the API request completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  final String? clientRequestToken;

  /// The time at which the batch inference job ended.
  final DateTime? endTime;

  /// The number of records that failed to process in the batch inference job.
  final int? errorRecordCount;

  /// The time at which the batch inference job times or timed out.
  final DateTime? jobExpirationTime;

  /// The name of the batch inference job.
  final String? jobName;

  /// The time at which the batch inference job was last modified.
  final DateTime? lastModifiedTime;

  /// If the batch inference job failed, this field contains a message describing
  /// why the job failed.
  final String? message;

  /// The invocation endpoint for ModelInvocationJob
  final ModelInvocationType? modelInvocationType;

  /// The number of records that have been processed in the batch inference job.
  final int? processedRecordCount;

  /// The status of the batch inference job.
  ///
  /// The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// Submitted – This job has been submitted to a queue for validation.
  /// </li>
  /// <li>
  /// Validating – This job is being validated for the requirements described in
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-data.html">Format
  /// and upload your batch inference data</a>. The criteria include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Your IAM service role has access to the Amazon S3 buckets containing your
  /// files.
  /// </li>
  /// <li>
  /// Your files are .jsonl files and each individual record is a JSON object in
  /// the correct format. Note that validation doesn't check if the
  /// <code>modelInput</code> value matches the request body for the model.
  /// </li>
  /// <li>
  /// Your files fulfill the requirements for file size and number of records. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/quotas.html">Quotas
  /// for Amazon Bedrock</a>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Scheduled – This job has been validated and is now in a queue. The job will
  /// automatically start when it reaches its turn.
  /// </li>
  /// <li>
  /// Expired – This job timed out because it was scheduled but didn't begin
  /// before the set timeout duration. Submit a new job request.
  /// </li>
  /// <li>
  /// InProgress – This job has begun. You can start viewing the results in the
  /// output S3 location.
  /// </li>
  /// <li>
  /// Completed – This job has successfully completed. View the output files in
  /// the output S3 location.
  /// </li>
  /// <li>
  /// PartiallyCompleted – This job has partially completed. Not all of your
  /// records could be processed in time. View the output files in the output S3
  /// location.
  /// </li>
  /// <li>
  /// Failed – This job has failed. Check the failure message for any further
  /// details. For further assistance, reach out to the <a
  /// href="https://console.aws.amazon.com/support/home/">Amazon Web Services
  /// Support Center</a>.
  /// </li>
  /// <li>
  /// Stopped – This job was stopped by a user.
  /// </li>
  /// <li>
  /// Stopping – This job is being stopped by a user.
  /// </li>
  /// </ul>
  final ModelInvocationJobStatus? status;

  /// The number of records that were successfully processed in the batch
  /// inference job.
  final int? successRecordCount;

  /// The number of hours after which batch inference job was set to time out.
  final int? timeoutDurationInHours;

  /// The total number of records in the batch inference job.
  final int? totalRecordCount;

  /// The configuration of the Virtual Private Cloud (VPC) for the data in the
  /// batch inference job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-vpc">Protect
  /// batch inference jobs using a VPC</a>.
  final VpcConfig? vpcConfig;

  GetModelInvocationJobResponse({
    required this.inputDataConfig,
    required this.jobArn,
    required this.modelId,
    required this.outputDataConfig,
    required this.roleArn,
    required this.submitTime,
    this.clientRequestToken,
    this.endTime,
    this.errorRecordCount,
    this.jobExpirationTime,
    this.jobName,
    this.lastModifiedTime,
    this.message,
    this.modelInvocationType,
    this.processedRecordCount,
    this.status,
    this.successRecordCount,
    this.timeoutDurationInHours,
    this.totalRecordCount,
    this.vpcConfig,
  });

  factory GetModelInvocationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetModelInvocationJobResponse(
      inputDataConfig: ModelInvocationJobInputDataConfig.fromJson(
          (json['inputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobArn: (json['jobArn'] as String?) ?? '',
      modelId: (json['modelId'] as String?) ?? '',
      outputDataConfig: ModelInvocationJobOutputDataConfig.fromJson(
          (json['outputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
      submitTime: nonNullableTimeStampFromJson(json['submitTime'] ?? 0),
      clientRequestToken: json['clientRequestToken'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      errorRecordCount: json['errorRecordCount'] as int?,
      jobExpirationTime: timeStampFromJson(json['jobExpirationTime']),
      jobName: json['jobName'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      message: json['message'] as String?,
      modelInvocationType: (json['modelInvocationType'] as String?)
          ?.let(ModelInvocationType.fromString),
      processedRecordCount: json['processedRecordCount'] as int?,
      status:
          (json['status'] as String?)?.let(ModelInvocationJobStatus.fromString),
      successRecordCount: json['successRecordCount'] as int?,
      timeoutDurationInHours: json['timeoutDurationInHours'] as int?,
      totalRecordCount: json['totalRecordCount'] as int?,
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final modelId = this.modelId;
    final outputDataConfig = this.outputDataConfig;
    final roleArn = this.roleArn;
    final submitTime = this.submitTime;
    final clientRequestToken = this.clientRequestToken;
    final endTime = this.endTime;
    final errorRecordCount = this.errorRecordCount;
    final jobExpirationTime = this.jobExpirationTime;
    final jobName = this.jobName;
    final lastModifiedTime = this.lastModifiedTime;
    final message = this.message;
    final modelInvocationType = this.modelInvocationType;
    final processedRecordCount = this.processedRecordCount;
    final status = this.status;
    final successRecordCount = this.successRecordCount;
    final timeoutDurationInHours = this.timeoutDurationInHours;
    final totalRecordCount = this.totalRecordCount;
    final vpcConfig = this.vpcConfig;
    return {
      'inputDataConfig': inputDataConfig,
      'jobArn': jobArn,
      'modelId': modelId,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'submitTime': iso8601ToJson(submitTime),
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (errorRecordCount != null) 'errorRecordCount': errorRecordCount,
      if (jobExpirationTime != null)
        'jobExpirationTime': iso8601ToJson(jobExpirationTime),
      if (jobName != null) 'jobName': jobName,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (message != null) 'message': message,
      if (modelInvocationType != null)
        'modelInvocationType': modelInvocationType.value,
      if (processedRecordCount != null)
        'processedRecordCount': processedRecordCount,
      if (status != null) 'status': status.value,
      if (successRecordCount != null) 'successRecordCount': successRecordCount,
      if (timeoutDurationInHours != null)
        'timeoutDurationInHours': timeoutDurationInHours,
      if (totalRecordCount != null) 'totalRecordCount': totalRecordCount,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// @nodoc
class ListModelInvocationJobsResponse {
  /// A list of items, each of which contains a summary about a batch inference
  /// job.
  final List<ModelInvocationJobSummary>? invocationJobSummaries;

  /// If there are more results than can fit in the response, a
  /// <code>nextToken</code> is returned. Use the <code>nextToken</code> in a
  /// request to return the next batch of results.
  final String? nextToken;

  ListModelInvocationJobsResponse({
    this.invocationJobSummaries,
    this.nextToken,
  });

  factory ListModelInvocationJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListModelInvocationJobsResponse(
      invocationJobSummaries: (json['invocationJobSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              ModelInvocationJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationJobSummaries = this.invocationJobSummaries;
    final nextToken = this.nextToken;
    return {
      if (invocationJobSummaries != null)
        'invocationJobSummaries': invocationJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StopModelInvocationJobResponse {
  StopModelInvocationJobResponse();

  factory StopModelInvocationJobResponse.fromJson(Map<String, dynamic> _) {
    return StopModelInvocationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetFoundationModelResponse {
  /// Information about the foundation model.
  final FoundationModelDetails? modelDetails;

  GetFoundationModelResponse({
    this.modelDetails,
  });

  factory GetFoundationModelResponse.fromJson(Map<String, dynamic> json) {
    return GetFoundationModelResponse(
      modelDetails: json['modelDetails'] != null
          ? FoundationModelDetails.fromJson(
              json['modelDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelDetails = this.modelDetails;
    return {
      if (modelDetails != null) 'modelDetails': modelDetails,
    };
  }
}

/// @nodoc
class ListFoundationModelsResponse {
  /// A list of Amazon Bedrock foundation models.
  final List<FoundationModelSummary>? modelSummaries;

  ListFoundationModelsResponse({
    this.modelSummaries,
  });

  factory ListFoundationModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListFoundationModelsResponse(
      modelSummaries: (json['modelSummaries'] as List?)
          ?.nonNulls
          .map(
              (e) => FoundationModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelSummaries = this.modelSummaries;
    return {
      if (modelSummaries != null) 'modelSummaries': modelSummaries,
    };
  }
}

/// @nodoc
class CreatePromptRouterResponse {
  /// The Amazon Resource Name (ARN) that uniquely identifies the prompt router.
  final String? promptRouterArn;

  CreatePromptRouterResponse({
    this.promptRouterArn,
  });

  factory CreatePromptRouterResponse.fromJson(Map<String, dynamic> json) {
    return CreatePromptRouterResponse(
      promptRouterArn: json['promptRouterArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final promptRouterArn = this.promptRouterArn;
    return {
      if (promptRouterArn != null) 'promptRouterArn': promptRouterArn,
    };
  }
}

/// @nodoc
class GetPromptRouterResponse {
  /// The router's fallback model.
  final PromptRouterTargetModel fallbackModel;

  /// The router's models.
  final List<PromptRouterTargetModel> models;

  /// The prompt router's ARN
  final String promptRouterArn;

  /// The router's name.
  final String promptRouterName;

  /// The router's routing criteria.
  final RoutingCriteria routingCriteria;

  /// The router's status.
  final PromptRouterStatus status;

  /// The router's type.
  final PromptRouterType type;

  /// When the router was created.
  final DateTime? createdAt;

  /// The router's description.
  final String? description;

  /// When the router was updated.
  final DateTime? updatedAt;

  GetPromptRouterResponse({
    required this.fallbackModel,
    required this.models,
    required this.promptRouterArn,
    required this.promptRouterName,
    required this.routingCriteria,
    required this.status,
    required this.type,
    this.createdAt,
    this.description,
    this.updatedAt,
  });

  factory GetPromptRouterResponse.fromJson(Map<String, dynamic> json) {
    return GetPromptRouterResponse(
      fallbackModel: PromptRouterTargetModel.fromJson(
          (json['fallbackModel'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      models: ((json['models'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              PromptRouterTargetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      promptRouterArn: (json['promptRouterArn'] as String?) ?? '',
      promptRouterName: (json['promptRouterName'] as String?) ?? '',
      routingCriteria: RoutingCriteria.fromJson(
          (json['routingCriteria'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: PromptRouterStatus.fromString((json['status'] as String?) ?? ''),
      type: PromptRouterType.fromString((json['type'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackModel = this.fallbackModel;
    final models = this.models;
    final promptRouterArn = this.promptRouterArn;
    final promptRouterName = this.promptRouterName;
    final routingCriteria = this.routingCriteria;
    final status = this.status;
    final type = this.type;
    final createdAt = this.createdAt;
    final description = this.description;
    final updatedAt = this.updatedAt;
    return {
      'fallbackModel': fallbackModel,
      'models': models,
      'promptRouterArn': promptRouterArn,
      'promptRouterName': promptRouterName,
      'routingCriteria': routingCriteria,
      'status': status.value,
      'type': type.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class DeletePromptRouterResponse {
  DeletePromptRouterResponse();

  factory DeletePromptRouterResponse.fromJson(Map<String, dynamic> _) {
    return DeletePromptRouterResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListPromptRoutersResponse {
  /// Specify the pagination token from a previous request to retrieve the next
  /// page of results.
  final String? nextToken;

  /// A list of prompt router summaries.
  final List<PromptRouterSummary>? promptRouterSummaries;

  ListPromptRoutersResponse({
    this.nextToken,
    this.promptRouterSummaries,
  });

  factory ListPromptRoutersResponse.fromJson(Map<String, dynamic> json) {
    return ListPromptRoutersResponse(
      nextToken: json['nextToken'] as String?,
      promptRouterSummaries: (json['promptRouterSummaries'] as List?)
          ?.nonNulls
          .map((e) => PromptRouterSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final promptRouterSummaries = this.promptRouterSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (promptRouterSummaries != null)
        'promptRouterSummaries': promptRouterSummaries,
    };
  }
}

/// @nodoc
class CreateProvisionedModelThroughputResponse {
  /// The Amazon Resource Name (ARN) for this Provisioned Throughput.
  final String provisionedModelArn;

  CreateProvisionedModelThroughputResponse({
    required this.provisionedModelArn,
  });

  factory CreateProvisionedModelThroughputResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateProvisionedModelThroughputResponse(
      provisionedModelArn: (json['provisionedModelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedModelArn = this.provisionedModelArn;
    return {
      'provisionedModelArn': provisionedModelArn,
    };
  }
}

/// @nodoc
class DeleteProvisionedModelThroughputResponse {
  DeleteProvisionedModelThroughputResponse();

  factory DeleteProvisionedModelThroughputResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteProvisionedModelThroughputResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetProvisionedModelThroughputResponse {
  /// The timestamp of the creation time for this Provisioned Throughput.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the model requested to be associated to
  /// this Provisioned Throughput. This value differs from the
  /// <code>modelArn</code> if updating hasn't completed.
  final String desiredModelArn;

  /// The number of model units that was requested for this Provisioned
  /// Throughput.
  final int desiredModelUnits;

  /// The Amazon Resource Name (ARN) of the base model for which the Provisioned
  /// Throughput was created, or of the base model that the custom model for which
  /// the Provisioned Throughput was created was customized.
  final String foundationModelArn;

  /// The timestamp of the last time that this Provisioned Throughput was
  /// modified.
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the model associated with this Provisioned
  /// Throughput.
  final String modelArn;

  /// The number of model units allocated to this Provisioned Throughput.
  final int modelUnits;

  /// The Amazon Resource Name (ARN) of the Provisioned Throughput.
  final String provisionedModelArn;

  /// The name of the Provisioned Throughput.
  final String provisionedModelName;

  /// The status of the Provisioned Throughput.
  final ProvisionedModelStatus status;

  /// Commitment duration of the Provisioned Throughput.
  final CommitmentDuration? commitmentDuration;

  /// The timestamp for when the commitment term for the Provisioned Throughput
  /// expires.
  final DateTime? commitmentExpirationTime;

  /// A failure message for any issues that occurred during creation, updating, or
  /// deletion of the Provisioned Throughput.
  final String? failureMessage;

  GetProvisionedModelThroughputResponse({
    required this.creationTime,
    required this.desiredModelArn,
    required this.desiredModelUnits,
    required this.foundationModelArn,
    required this.lastModifiedTime,
    required this.modelArn,
    required this.modelUnits,
    required this.provisionedModelArn,
    required this.provisionedModelName,
    required this.status,
    this.commitmentDuration,
    this.commitmentExpirationTime,
    this.failureMessage,
  });

  factory GetProvisionedModelThroughputResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProvisionedModelThroughputResponse(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      desiredModelArn: (json['desiredModelArn'] as String?) ?? '',
      desiredModelUnits: (json['desiredModelUnits'] as int?) ?? 0,
      foundationModelArn: (json['foundationModelArn'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      modelArn: (json['modelArn'] as String?) ?? '',
      modelUnits: (json['modelUnits'] as int?) ?? 0,
      provisionedModelArn: (json['provisionedModelArn'] as String?) ?? '',
      provisionedModelName: (json['provisionedModelName'] as String?) ?? '',
      status:
          ProvisionedModelStatus.fromString((json['status'] as String?) ?? ''),
      commitmentDuration: (json['commitmentDuration'] as String?)
          ?.let(CommitmentDuration.fromString),
      commitmentExpirationTime:
          timeStampFromJson(json['commitmentExpirationTime']),
      failureMessage: json['failureMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final desiredModelArn = this.desiredModelArn;
    final desiredModelUnits = this.desiredModelUnits;
    final foundationModelArn = this.foundationModelArn;
    final lastModifiedTime = this.lastModifiedTime;
    final modelArn = this.modelArn;
    final modelUnits = this.modelUnits;
    final provisionedModelArn = this.provisionedModelArn;
    final provisionedModelName = this.provisionedModelName;
    final status = this.status;
    final commitmentDuration = this.commitmentDuration;
    final commitmentExpirationTime = this.commitmentExpirationTime;
    final failureMessage = this.failureMessage;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'desiredModelArn': desiredModelArn,
      'desiredModelUnits': desiredModelUnits,
      'foundationModelArn': foundationModelArn,
      'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      'modelArn': modelArn,
      'modelUnits': modelUnits,
      'provisionedModelArn': provisionedModelArn,
      'provisionedModelName': provisionedModelName,
      'status': status.value,
      if (commitmentDuration != null)
        'commitmentDuration': commitmentDuration.value,
      if (commitmentExpirationTime != null)
        'commitmentExpirationTime': iso8601ToJson(commitmentExpirationTime),
      if (failureMessage != null) 'failureMessage': failureMessage,
    };
  }
}

/// @nodoc
class ListProvisionedModelThroughputsResponse {
  /// If there are more results than the number you specified in the
  /// <code>maxResults</code> field, this value is returned. To see the next batch
  /// of results, include this value in the <code>nextToken</code> field in
  /// another list request.
  final String? nextToken;

  /// A list of summaries, one for each Provisioned Throughput in the response.
  final List<ProvisionedModelSummary>? provisionedModelSummaries;

  ListProvisionedModelThroughputsResponse({
    this.nextToken,
    this.provisionedModelSummaries,
  });

  factory ListProvisionedModelThroughputsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProvisionedModelThroughputsResponse(
      nextToken: json['nextToken'] as String?,
      provisionedModelSummaries: (json['provisionedModelSummaries'] as List?)
          ?.nonNulls
          .map((e) =>
              ProvisionedModelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final provisionedModelSummaries = this.provisionedModelSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (provisionedModelSummaries != null)
        'provisionedModelSummaries': provisionedModelSummaries,
    };
  }
}

/// @nodoc
class UpdateProvisionedModelThroughputResponse {
  UpdateProvisionedModelThroughputResponse();

  factory UpdateProvisionedModelThroughputResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateProvisionedModelThroughputResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteResourcePolicyResponse {
  DeleteResourcePolicyResponse();

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetResourcePolicyResponse {
  /// The JSON string representing the Bedrock resource policy.
  final String? resourcePolicy;

  GetResourcePolicyResponse({
    this.resourcePolicy,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      resourcePolicy: json['resourcePolicy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourcePolicy != null) 'resourcePolicy': resourcePolicy,
    };
  }
}

/// @nodoc
class PutResourcePolicyResponse {
  /// The ARN of the Bedrock resource to which this resource policy applies.
  final String? resourceArn;

  PutResourcePolicyResponse({
    this.resourceArn,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
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

/// @nodoc
class CreateFoundationModelAgreementResponse {
  /// Model Id of the model for the access request.
  final String modelId;

  CreateFoundationModelAgreementResponse({
    required this.modelId,
  });

  factory CreateFoundationModelAgreementResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateFoundationModelAgreementResponse(
      modelId: (json['modelId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    return {
      'modelId': modelId,
    };
  }
}

/// @nodoc
class DeleteFoundationModelAgreementResponse {
  DeleteFoundationModelAgreementResponse();

  factory DeleteFoundationModelAgreementResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteFoundationModelAgreementResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetFoundationModelAvailabilityResponse {
  /// Agreement availability.
  final AgreementAvailability agreementAvailability;

  /// Authorization status.
  final AuthorizationStatus authorizationStatus;

  /// Entitlement availability.
  final EntitlementAvailability entitlementAvailability;

  /// The model Id of the foundation model.
  final String modelId;

  /// Region availability.
  final RegionAvailability regionAvailability;

  GetFoundationModelAvailabilityResponse({
    required this.agreementAvailability,
    required this.authorizationStatus,
    required this.entitlementAvailability,
    required this.modelId,
    required this.regionAvailability,
  });

  factory GetFoundationModelAvailabilityResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFoundationModelAvailabilityResponse(
      agreementAvailability: AgreementAvailability.fromJson(
          (json['agreementAvailability'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      authorizationStatus: AuthorizationStatus.fromString(
          (json['authorizationStatus'] as String?) ?? ''),
      entitlementAvailability: EntitlementAvailability.fromString(
          (json['entitlementAvailability'] as String?) ?? ''),
      modelId: (json['modelId'] as String?) ?? '',
      regionAvailability: RegionAvailability.fromString(
          (json['regionAvailability'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final agreementAvailability = this.agreementAvailability;
    final authorizationStatus = this.authorizationStatus;
    final entitlementAvailability = this.entitlementAvailability;
    final modelId = this.modelId;
    final regionAvailability = this.regionAvailability;
    return {
      'agreementAvailability': agreementAvailability,
      'authorizationStatus': authorizationStatus.value,
      'entitlementAvailability': entitlementAvailability.value,
      'modelId': modelId,
      'regionAvailability': regionAvailability.value,
    };
  }
}

/// @nodoc
class ListFoundationModelAgreementOffersResponse {
  /// Model Id of the foundation model.
  final String modelId;

  /// List of the offers associated with the specified model.
  final List<Offer> offers;

  ListFoundationModelAgreementOffersResponse({
    required this.modelId,
    required this.offers,
  });

  factory ListFoundationModelAgreementOffersResponse.fromJson(
      Map<String, dynamic> json) {
    return ListFoundationModelAgreementOffersResponse(
      modelId: (json['modelId'] as String?) ?? '',
      offers: ((json['offers'] as List?) ?? const [])
          .nonNulls
          .map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final offers = this.offers;
    return {
      'modelId': modelId,
      'offers': offers,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// An array of the tags associated with this resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
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
class CreateModelCustomizationJobResponse {
  /// Amazon Resource Name (ARN) of the fine tuning job
  final String jobArn;

  CreateModelCustomizationJobResponse({
    required this.jobArn,
  });

  factory CreateModelCustomizationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateModelCustomizationJobResponse(
      jobArn: (json['jobArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

/// @nodoc
class GetModelCustomizationJobResponse {
  /// Amazon Resource Name (ARN) of the base model.
  final String baseModelArn;

  /// Time that the resource was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the customization job.
  final String jobArn;

  /// The name of the customization job.
  final String jobName;

  /// Output data configuration
  final OutputDataConfig outputDataConfig;

  /// The name of the output model.
  final String outputModelName;

  /// The Amazon Resource Name (ARN) of the IAM role.
  final String roleArn;

  /// Contains information about the training dataset.
  final TrainingDataConfig trainingDataConfig;

  /// Contains information about the validation dataset.
  final ValidationDataConfig validationDataConfig;

  /// The token that you specified in the <code>CreateCustomizationJob</code>
  /// request.
  final String? clientRequestToken;

  /// The customization configuration for the model customization job.
  final CustomizationConfig? customizationConfig;

  /// The type of model customization.
  final CustomizationType? customizationType;

  /// Time that the resource transitioned to terminal state.
  final DateTime? endTime;

  /// Information about why the job failed.
  final String? failureMessage;

  /// The hyperparameter values for the job. For details on the format for
  /// different models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models-hp.html">Custom
  /// model hyperparameters</a>.
  final Map<String, String>? hyperParameters;

  /// Time that the resource was last modified.
  final DateTime? lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the output model.
  final String? outputModelArn;

  /// The custom model is encrypted at rest using this key.
  final String? outputModelKmsKeyArn;

  /// The status of the job. A successful job transitions from in-progress to
  /// completed when the output model is ready to use. If the job failed, the
  /// failure message contains information about why the job failed.
  final ModelCustomizationJobStatus? status;

  /// For a Distillation job, the details about the statuses of the sub-tasks of
  /// the customization job.
  final StatusDetails? statusDetails;

  /// Contains training metrics from the job creation.
  final TrainingMetrics? trainingMetrics;

  /// The loss metric for each validator that you provided in the createjob
  /// request.
  final List<ValidatorMetric>? validationMetrics;

  /// VPC configuration for the custom model job.
  final VpcConfig? vpcConfig;

  GetModelCustomizationJobResponse({
    required this.baseModelArn,
    required this.creationTime,
    required this.jobArn,
    required this.jobName,
    required this.outputDataConfig,
    required this.outputModelName,
    required this.roleArn,
    required this.trainingDataConfig,
    required this.validationDataConfig,
    this.clientRequestToken,
    this.customizationConfig,
    this.customizationType,
    this.endTime,
    this.failureMessage,
    this.hyperParameters,
    this.lastModifiedTime,
    this.outputModelArn,
    this.outputModelKmsKeyArn,
    this.status,
    this.statusDetails,
    this.trainingMetrics,
    this.validationMetrics,
    this.vpcConfig,
  });

  factory GetModelCustomizationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetModelCustomizationJobResponse(
      baseModelArn: (json['baseModelArn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      outputDataConfig: OutputDataConfig.fromJson(
          (json['outputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      outputModelName: (json['outputModelName'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      trainingDataConfig: TrainingDataConfig.fromJson(
          (json['trainingDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      validationDataConfig: ValidationDataConfig.fromJson(
          (json['validationDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      clientRequestToken: json['clientRequestToken'] as String?,
      customizationConfig: json['customizationConfig'] != null
          ? CustomizationConfig.fromJson(
              json['customizationConfig'] as Map<String, dynamic>)
          : null,
      customizationType: (json['customizationType'] as String?)
          ?.let(CustomizationType.fromString),
      endTime: timeStampFromJson(json['endTime']),
      failureMessage: json['failureMessage'] as String?,
      hyperParameters: (json['hyperParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      outputModelArn: json['outputModelArn'] as String?,
      outputModelKmsKeyArn: json['outputModelKmsKeyArn'] as String?,
      status: (json['status'] as String?)
          ?.let(ModelCustomizationJobStatus.fromString),
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
      trainingMetrics: json['trainingMetrics'] != null
          ? TrainingMetrics.fromJson(
              json['trainingMetrics'] as Map<String, dynamic>)
          : null,
      validationMetrics: (json['validationMetrics'] as List?)
          ?.nonNulls
          .map((e) => ValidatorMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final baseModelArn = this.baseModelArn;
    final creationTime = this.creationTime;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final outputDataConfig = this.outputDataConfig;
    final outputModelName = this.outputModelName;
    final roleArn = this.roleArn;
    final trainingDataConfig = this.trainingDataConfig;
    final validationDataConfig = this.validationDataConfig;
    final clientRequestToken = this.clientRequestToken;
    final customizationConfig = this.customizationConfig;
    final customizationType = this.customizationType;
    final endTime = this.endTime;
    final failureMessage = this.failureMessage;
    final hyperParameters = this.hyperParameters;
    final lastModifiedTime = this.lastModifiedTime;
    final outputModelArn = this.outputModelArn;
    final outputModelKmsKeyArn = this.outputModelKmsKeyArn;
    final status = this.status;
    final statusDetails = this.statusDetails;
    final trainingMetrics = this.trainingMetrics;
    final validationMetrics = this.validationMetrics;
    final vpcConfig = this.vpcConfig;
    return {
      'baseModelArn': baseModelArn,
      'creationTime': iso8601ToJson(creationTime),
      'jobArn': jobArn,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'outputModelName': outputModelName,
      'roleArn': roleArn,
      'trainingDataConfig': trainingDataConfig,
      'validationDataConfig': validationDataConfig,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (customizationConfig != null)
        'customizationConfig': customizationConfig,
      if (customizationType != null)
        'customizationType': customizationType.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (outputModelArn != null) 'outputModelArn': outputModelArn,
      if (outputModelKmsKeyArn != null)
        'outputModelKmsKeyArn': outputModelKmsKeyArn,
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
      if (trainingMetrics != null) 'trainingMetrics': trainingMetrics,
      if (validationMetrics != null) 'validationMetrics': validationMetrics,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// @nodoc
class ListModelCustomizationJobsResponse {
  /// Job summaries.
  final List<ModelCustomizationJobSummary>? modelCustomizationJobSummaries;

  /// If the total number of results is greater than the <code>maxResults</code>
  /// value provided in the request, use this token when making another request in
  /// the <code>nextToken</code> field to return the next batch of results.
  final String? nextToken;

  ListModelCustomizationJobsResponse({
    this.modelCustomizationJobSummaries,
    this.nextToken,
  });

  factory ListModelCustomizationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListModelCustomizationJobsResponse(
      modelCustomizationJobSummaries: (json['modelCustomizationJobSummaries']
              as List?)
          ?.nonNulls
          .map((e) =>
              ModelCustomizationJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelCustomizationJobSummaries = this.modelCustomizationJobSummaries;
    final nextToken = this.nextToken;
    return {
      if (modelCustomizationJobSummaries != null)
        'modelCustomizationJobSummaries': modelCustomizationJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class StopModelCustomizationJobResponse {
  StopModelCustomizationJobResponse();

  factory StopModelCustomizationJobResponse.fromJson(Map<String, dynamic> _) {
    return StopModelCustomizationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about one customization job
///
/// @nodoc
class ModelCustomizationJobSummary {
  /// Amazon Resource Name (ARN) of the base model.
  final String baseModelArn;

  /// Creation time of the custom model.
  final DateTime creationTime;

  /// Amazon Resource Name (ARN) of the customization job.
  final String jobArn;

  /// Name of the customization job.
  final String jobName;

  /// Status of the customization job.
  final ModelCustomizationJobStatus status;

  /// Amazon Resource Name (ARN) of the custom model.
  final String? customModelArn;

  /// Name of the custom model.
  final String? customModelName;

  /// Specifies whether to carry out continued pre-training of a model or whether
  /// to fine-tune it. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a>.
  final CustomizationType? customizationType;

  /// Time that the customization job ended.
  final DateTime? endTime;

  /// Time that the customization job was last modified.
  final DateTime? lastModifiedTime;

  /// Details about the status of the data processing sub-task of the job.
  final StatusDetails? statusDetails;

  ModelCustomizationJobSummary({
    required this.baseModelArn,
    required this.creationTime,
    required this.jobArn,
    required this.jobName,
    required this.status,
    this.customModelArn,
    this.customModelName,
    this.customizationType,
    this.endTime,
    this.lastModifiedTime,
    this.statusDetails,
  });

  factory ModelCustomizationJobSummary.fromJson(Map<String, dynamic> json) {
    return ModelCustomizationJobSummary(
      baseModelArn: (json['baseModelArn'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      status: ModelCustomizationJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      customModelArn: json['customModelArn'] as String?,
      customModelName: json['customModelName'] as String?,
      customizationType: (json['customizationType'] as String?)
          ?.let(CustomizationType.fromString),
      endTime: timeStampFromJson(json['endTime']),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      statusDetails: json['statusDetails'] != null
          ? StatusDetails.fromJson(
              json['statusDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final baseModelArn = this.baseModelArn;
    final creationTime = this.creationTime;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final status = this.status;
    final customModelArn = this.customModelArn;
    final customModelName = this.customModelName;
    final customizationType = this.customizationType;
    final endTime = this.endTime;
    final lastModifiedTime = this.lastModifiedTime;
    final statusDetails = this.statusDetails;
    return {
      'baseModelArn': baseModelArn,
      'creationTime': iso8601ToJson(creationTime),
      'jobArn': jobArn,
      'jobName': jobName,
      'status': status.value,
      if (customModelArn != null) 'customModelArn': customModelArn,
      if (customModelName != null) 'customModelName': customModelName,
      if (customizationType != null)
        'customizationType': customizationType.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

/// @nodoc
class ModelCustomizationJobStatus {
  static const inProgress = ModelCustomizationJobStatus._('InProgress');
  static const completed = ModelCustomizationJobStatus._('Completed');
  static const failed = ModelCustomizationJobStatus._('Failed');
  static const stopping = ModelCustomizationJobStatus._('Stopping');
  static const stopped = ModelCustomizationJobStatus._('Stopped');

  final String value;

  const ModelCustomizationJobStatus._(this.value);

  static const values = [inProgress, completed, failed, stopping, stopped];

  static ModelCustomizationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ModelCustomizationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ModelCustomizationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// For a Distillation job, the status details for sub-tasks of the job.
/// Possible statuses for each sub-task include the following:
///
/// <ul>
/// <li>
/// NotStarted
/// </li>
/// <li>
/// InProgress
/// </li>
/// <li>
/// Completed
/// </li>
/// <li>
/// Stopping
/// </li>
/// <li>
/// Stopped
/// </li>
/// <li>
/// Failed
/// </li>
/// </ul>
///
/// @nodoc
class StatusDetails {
  /// The status details for the data processing sub-task of the job.
  final DataProcessingDetails? dataProcessingDetails;

  /// The status details for the training sub-task of the job.
  final TrainingDetails? trainingDetails;

  /// The status details for the validation sub-task of the job.
  final ValidationDetails? validationDetails;

  StatusDetails({
    this.dataProcessingDetails,
    this.trainingDetails,
    this.validationDetails,
  });

  factory StatusDetails.fromJson(Map<String, dynamic> json) {
    return StatusDetails(
      dataProcessingDetails: json['dataProcessingDetails'] != null
          ? DataProcessingDetails.fromJson(
              json['dataProcessingDetails'] as Map<String, dynamic>)
          : null,
      trainingDetails: json['trainingDetails'] != null
          ? TrainingDetails.fromJson(
              json['trainingDetails'] as Map<String, dynamic>)
          : null,
      validationDetails: json['validationDetails'] != null
          ? ValidationDetails.fromJson(
              json['validationDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dataProcessingDetails = this.dataProcessingDetails;
    final trainingDetails = this.trainingDetails;
    final validationDetails = this.validationDetails;
    return {
      if (dataProcessingDetails != null)
        'dataProcessingDetails': dataProcessingDetails,
      if (trainingDetails != null) 'trainingDetails': trainingDetails,
      if (validationDetails != null) 'validationDetails': validationDetails,
    };
  }
}

/// @nodoc
class CustomizationType {
  static const fineTuning = CustomizationType._('FINE_TUNING');
  static const continuedPreTraining =
      CustomizationType._('CONTINUED_PRE_TRAINING');
  static const distillation = CustomizationType._('DISTILLATION');
  static const reinforcementFineTuning =
      CustomizationType._('REINFORCEMENT_FINE_TUNING');
  static const imported = CustomizationType._('IMPORTED');

  final String value;

  const CustomizationType._(this.value);

  static const values = [
    fineTuning,
    continuedPreTraining,
    distillation,
    reinforcementFineTuning,
    imported
  ];

  static CustomizationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomizationType._(value));

  @override
  bool operator ==(other) => other is CustomizationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// For a Distillation job, the status details for the validation sub-task of
/// the job.
///
/// @nodoc
class ValidationDetails {
  /// The start time of the validation sub-task of the job.
  final DateTime? creationTime;

  /// The latest update to the validation sub-task of the job.
  final DateTime? lastModifiedTime;

  /// The status of the validation sub-task of the job.
  final JobStatusDetails? status;

  ValidationDetails({
    this.creationTime,
    this.lastModifiedTime,
    this.status,
  });

  factory ValidationDetails.fromJson(Map<String, dynamic> json) {
    return ValidationDetails(
      creationTime: timeStampFromJson(json['creationTime']),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      status: (json['status'] as String?)?.let(JobStatusDetails.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (status != null) 'status': status.value,
    };
  }
}

/// For a Distillation job, the status details for the data processing sub-task
/// of the job.
///
/// @nodoc
class DataProcessingDetails {
  /// The start time of the data processing sub-task of the job.
  final DateTime? creationTime;

  /// The latest update to the data processing sub-task of the job.
  final DateTime? lastModifiedTime;

  /// The status of the data processing sub-task of the job.
  final JobStatusDetails? status;

  DataProcessingDetails({
    this.creationTime,
    this.lastModifiedTime,
    this.status,
  });

  factory DataProcessingDetails.fromJson(Map<String, dynamic> json) {
    return DataProcessingDetails(
      creationTime: timeStampFromJson(json['creationTime']),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      status: (json['status'] as String?)?.let(JobStatusDetails.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (status != null) 'status': status.value,
    };
  }
}

/// For a Distillation job, the status details for the training sub-task of the
/// job.
///
/// @nodoc
class TrainingDetails {
  /// The start time of the training sub-task of the job.
  final DateTime? creationTime;

  /// The latest update to the training sub-task of the job.
  final DateTime? lastModifiedTime;

  /// The status of the training sub-task of the job.
  final JobStatusDetails? status;

  TrainingDetails({
    this.creationTime,
    this.lastModifiedTime,
    this.status,
  });

  factory TrainingDetails.fromJson(Map<String, dynamic> json) {
    return TrainingDetails(
      creationTime: timeStampFromJson(json['creationTime']),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      status: (json['status'] as String?)?.let(JobStatusDetails.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final status = this.status;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class JobStatusDetails {
  static const inProgress = JobStatusDetails._('InProgress');
  static const completed = JobStatusDetails._('Completed');
  static const stopping = JobStatusDetails._('Stopping');
  static const stopped = JobStatusDetails._('Stopped');
  static const failed = JobStatusDetails._('Failed');
  static const notStarted = JobStatusDetails._('NotStarted');

  final String value;

  const JobStatusDetails._(this.value);

  static const values = [
    inProgress,
    completed,
    stopping,
    stopped,
    failed,
    notStarted
  ];

  static JobStatusDetails fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => JobStatusDetails._(value));

  @override
  bool operator ==(other) => other is JobStatusDetails && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FineTuningJobStatus {
  static const inProgress = FineTuningJobStatus._('InProgress');
  static const completed = FineTuningJobStatus._('Completed');
  static const failed = FineTuningJobStatus._('Failed');
  static const stopping = FineTuningJobStatus._('Stopping');
  static const stopped = FineTuningJobStatus._('Stopped');

  final String value;

  const FineTuningJobStatus._(this.value);

  static const values = [inProgress, completed, failed, stopping, stopped];

  static FineTuningJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FineTuningJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is FineTuningJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SortJobsBy {
  static const creationTime = SortJobsBy._('CreationTime');

  final String value;

  const SortJobsBy._(this.value);

  static const values = [creationTime];

  static SortJobsBy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortJobsBy._(value));

  @override
  bool operator ==(other) => other is SortJobsBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SortOrder {
  static const ascending = SortOrder._('Ascending');
  static const descending = SortOrder._('Descending');

  final String value;

  const SortOrder._(this.value);

  static const values = [ascending, descending];

  static SortOrder fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortOrder._(value));

  @override
  bool operator ==(other) => other is SortOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// S3 Location of the training data.
///
/// @nodoc
class TrainingDataConfig {
  /// Settings for using invocation logs to customize a model.
  final InvocationLogsConfig? invocationLogsConfig;

  /// The S3 URI where the training data is stored.
  final String? s3Uri;

  TrainingDataConfig({
    this.invocationLogsConfig,
    this.s3Uri,
  });

  factory TrainingDataConfig.fromJson(Map<String, dynamic> json) {
    return TrainingDataConfig(
      invocationLogsConfig: json['invocationLogsConfig'] != null
          ? InvocationLogsConfig.fromJson(
              json['invocationLogsConfig'] as Map<String, dynamic>)
          : null,
      s3Uri: json['s3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationLogsConfig = this.invocationLogsConfig;
    final s3Uri = this.s3Uri;
    return {
      if (invocationLogsConfig != null)
        'invocationLogsConfig': invocationLogsConfig,
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// Array of up to 10 validators.
///
/// @nodoc
class ValidationDataConfig {
  /// Information about the validators.
  final List<Validator> validators;

  ValidationDataConfig({
    required this.validators,
  });

  factory ValidationDataConfig.fromJson(Map<String, dynamic> json) {
    return ValidationDataConfig(
      validators: ((json['validators'] as List?) ?? const [])
          .nonNulls
          .map((e) => Validator.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final validators = this.validators;
    return {
      'validators': validators,
    };
  }
}

/// S3 Location of the output data.
///
/// @nodoc
class OutputDataConfig {
  /// The S3 URI where the output data is stored.
  final String s3Uri;

  OutputDataConfig({
    required this.s3Uri,
  });

  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
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

/// Metrics associated with the custom job.
///
/// @nodoc
class TrainingMetrics {
  /// Loss metric associated with the custom job.
  final double? trainingLoss;

  TrainingMetrics({
    this.trainingLoss,
  });

  factory TrainingMetrics.fromJson(Map<String, dynamic> json) {
    return TrainingMetrics(
      trainingLoss: _s.parseJsonDouble(json['trainingLoss']),
    );
  }

  Map<String, dynamic> toJson() {
    final trainingLoss = this.trainingLoss;
    return {
      if (trainingLoss != null)
        'trainingLoss': _s.encodeJsonDouble(trainingLoss),
    };
  }
}

/// The configuration of a virtual private cloud (VPC). For more information,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/usingVPC.html">Protect
/// your data using Amazon Virtual Private Cloud and Amazon Web Services
/// PrivateLink</a>.
///
/// @nodoc
class VpcConfig {
  /// An array of IDs for each security group in the VPC to use.
  final List<String> securityGroupIds;

  /// An array of IDs for each subnet in the VPC to use.
  final List<String> subnetIds;

  VpcConfig({
    required this.securityGroupIds,
    required this.subnetIds,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupIds: ((json['securityGroupIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds: ((json['subnetIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
    };
  }
}

/// A model customization configuration
///
/// @nodoc
class CustomizationConfig {
  /// The Distillation configuration for the custom model.
  final DistillationConfig? distillationConfig;

  /// Configuration settings for reinforcement fine-tuning (RFT) model
  /// customization, including grader configuration and hyperparameters.
  final RFTConfig? rftConfig;

  CustomizationConfig({
    this.distillationConfig,
    this.rftConfig,
  });

  factory CustomizationConfig.fromJson(Map<String, dynamic> json) {
    return CustomizationConfig(
      distillationConfig: json['distillationConfig'] != null
          ? DistillationConfig.fromJson(
              json['distillationConfig'] as Map<String, dynamic>)
          : null,
      rftConfig: json['rftConfig'] != null
          ? RFTConfig.fromJson(json['rftConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final distillationConfig = this.distillationConfig;
    final rftConfig = this.rftConfig;
    return {
      if (distillationConfig != null) 'distillationConfig': distillationConfig,
      if (rftConfig != null) 'rftConfig': rftConfig,
    };
  }
}

/// Settings for distilling a foundation model into a smaller and more efficient
/// model.
///
/// @nodoc
class DistillationConfig {
  /// The teacher model configuration.
  final TeacherModelConfig teacherModelConfig;

  DistillationConfig({
    required this.teacherModelConfig,
  });

  factory DistillationConfig.fromJson(Map<String, dynamic> json) {
    return DistillationConfig(
      teacherModelConfig: TeacherModelConfig.fromJson(
          (json['teacherModelConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final teacherModelConfig = this.teacherModelConfig;
    return {
      'teacherModelConfig': teacherModelConfig,
    };
  }
}

/// Configuration settings for reinforcement fine-tuning (RFT), including grader
/// configuration and training hyperparameters.
///
/// @nodoc
class RFTConfig {
  /// Configuration for the grader that evaluates model responses and provides
  /// reward signals during RFT training.
  final GraderConfig? graderConfig;

  /// Hyperparameters that control the reinforcement fine-tuning training process,
  /// including learning rate, batch size, and epoch count.
  final RFTHyperParameters? hyperParameters;

  RFTConfig({
    this.graderConfig,
    this.hyperParameters,
  });

  factory RFTConfig.fromJson(Map<String, dynamic> json) {
    return RFTConfig(
      graderConfig: json['graderConfig'] != null
          ? GraderConfig.fromJson(json['graderConfig'] as Map<String, dynamic>)
          : null,
      hyperParameters: json['hyperParameters'] != null
          ? RFTHyperParameters.fromJson(
              json['hyperParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final graderConfig = this.graderConfig;
    final hyperParameters = this.hyperParameters;
    return {
      if (graderConfig != null) 'graderConfig': graderConfig,
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
    };
  }
}

/// Configuration for the grader used in reinforcement fine-tuning to evaluate
/// model responses and provide reward signals.
///
/// @nodoc
class GraderConfig {
  /// Configuration for using an AWS Lambda function as the grader for evaluating
  /// model responses and provide reward signals in reinforcement fine-tuning.
  final LambdaGraderConfig? lambdaGrader;

  GraderConfig({
    this.lambdaGrader,
  });

  factory GraderConfig.fromJson(Map<String, dynamic> json) {
    return GraderConfig(
      lambdaGrader: json['lambdaGrader'] != null
          ? LambdaGraderConfig.fromJson(
              json['lambdaGrader'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaGrader = this.lambdaGrader;
    return {
      if (lambdaGrader != null) 'lambdaGrader': lambdaGrader,
    };
  }
}

/// Hyperparameters for controlling the reinforcement fine-tuning training
/// process, including learning settings and evaluation intervals.
///
/// @nodoc
class RFTHyperParameters {
  /// Number of training samples processed in each batch during reinforcement
  /// fine-tuning (RFT) training. Larger batches may improve training stability.
  final int? batchSize;

  /// Number of training epochs to run during reinforcement fine-tuning. Higher
  /// values may improve performance but increase training time.
  final int? epochCount;

  /// Interval between evaluation runs during RFT training, measured in training
  /// steps. More frequent evaluation provides better monitoring.
  final int? evalInterval;

  /// Maximum number of tokens the model can generate in response to each prompt
  /// during RFT training.
  final int? inferenceMaxTokens;

  /// Learning rate for the reinforcement fine-tuning. Controls how quickly the
  /// model adapts to reward signals.
  final double? learningRate;

  /// Maximum length of input prompts during RFT training, measured in tokens.
  /// Longer prompts allow more context but increase memory usage and
  /// training-time.
  final int? maxPromptLength;

  /// Level of reasoning effort applied during RFT training. Higher values may
  /// improve response quality but increase training time.
  final ReasoningEffort? reasoningEffort;

  /// Number of response samples generated per prompt during RFT training. More
  /// samples provide better reward signal estimation.
  final int? trainingSamplePerPrompt;

  RFTHyperParameters({
    this.batchSize,
    this.epochCount,
    this.evalInterval,
    this.inferenceMaxTokens,
    this.learningRate,
    this.maxPromptLength,
    this.reasoningEffort,
    this.trainingSamplePerPrompt,
  });

  factory RFTHyperParameters.fromJson(Map<String, dynamic> json) {
    return RFTHyperParameters(
      batchSize: json['batchSize'] as int?,
      epochCount: json['epochCount'] as int?,
      evalInterval: json['evalInterval'] as int?,
      inferenceMaxTokens: json['inferenceMaxTokens'] as int?,
      learningRate: _s.parseJsonDouble(json['learningRate']),
      maxPromptLength: json['maxPromptLength'] as int?,
      reasoningEffort:
          (json['reasoningEffort'] as String?)?.let(ReasoningEffort.fromString),
      trainingSamplePerPrompt: json['trainingSamplePerPrompt'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchSize = this.batchSize;
    final epochCount = this.epochCount;
    final evalInterval = this.evalInterval;
    final inferenceMaxTokens = this.inferenceMaxTokens;
    final learningRate = this.learningRate;
    final maxPromptLength = this.maxPromptLength;
    final reasoningEffort = this.reasoningEffort;
    final trainingSamplePerPrompt = this.trainingSamplePerPrompt;
    return {
      if (batchSize != null) 'batchSize': batchSize,
      if (epochCount != null) 'epochCount': epochCount,
      if (evalInterval != null) 'evalInterval': evalInterval,
      if (inferenceMaxTokens != null) 'inferenceMaxTokens': inferenceMaxTokens,
      if (learningRate != null)
        'learningRate': _s.encodeJsonDouble(learningRate),
      if (maxPromptLength != null) 'maxPromptLength': maxPromptLength,
      if (reasoningEffort != null) 'reasoningEffort': reasoningEffort.value,
      if (trainingSamplePerPrompt != null)
        'trainingSamplePerPrompt': trainingSamplePerPrompt,
    };
  }
}

/// @nodoc
class ReasoningEffort {
  static const low = ReasoningEffort._('low');
  static const medium = ReasoningEffort._('medium');
  static const high = ReasoningEffort._('high');

  final String value;

  const ReasoningEffort._(this.value);

  static const values = [low, medium, high];

  static ReasoningEffort fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReasoningEffort._(value));

  @override
  bool operator ==(other) => other is ReasoningEffort && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for using an AWS Lambda function to grade model responses
/// during reinforcement fine-tuning training.
///
/// @nodoc
class LambdaGraderConfig {
  /// ARN of the AWS Lambda function that will evaluate model responses and return
  /// reward scores for RFT training.
  final String lambdaArn;

  LambdaGraderConfig({
    required this.lambdaArn,
  });

  factory LambdaGraderConfig.fromJson(Map<String, dynamic> json) {
    return LambdaGraderConfig(
      lambdaArn: (json['lambdaArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      'lambdaArn': lambdaArn,
    };
  }
}

/// Details about a teacher model used for model customization.
///
/// @nodoc
class TeacherModelConfig {
  /// The identifier of the teacher model.
  final String teacherModelIdentifier;

  /// The maximum number of tokens requested when the customization job invokes
  /// the teacher model.
  final int? maxResponseLengthForInference;

  TeacherModelConfig({
    required this.teacherModelIdentifier,
    this.maxResponseLengthForInference,
  });

  factory TeacherModelConfig.fromJson(Map<String, dynamic> json) {
    return TeacherModelConfig(
      teacherModelIdentifier: (json['teacherModelIdentifier'] as String?) ?? '',
      maxResponseLengthForInference:
          json['maxResponseLengthForInference'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final teacherModelIdentifier = this.teacherModelIdentifier;
    final maxResponseLengthForInference = this.maxResponseLengthForInference;
    return {
      'teacherModelIdentifier': teacherModelIdentifier,
      if (maxResponseLengthForInference != null)
        'maxResponseLengthForInference': maxResponseLengthForInference,
    };
  }
}

/// The metric for the validator.
///
/// @nodoc
class ValidatorMetric {
  /// The validation loss associated with this validator.
  final double? validationLoss;

  ValidatorMetric({
    this.validationLoss,
  });

  factory ValidatorMetric.fromJson(Map<String, dynamic> json) {
    return ValidatorMetric(
      validationLoss: _s.parseJsonDouble(json['validationLoss']),
    );
  }

  Map<String, dynamic> toJson() {
    final validationLoss = this.validationLoss;
    return {
      if (validationLoss != null)
        'validationLoss': _s.encodeJsonDouble(validationLoss),
    };
  }
}

/// Information about a validator.
///
/// @nodoc
class Validator {
  /// The S3 URI where the validation data is stored.
  final String s3Uri;

  Validator({
    required this.s3Uri,
  });

  factory Validator.fromJson(Map<String, dynamic> json) {
    return Validator(
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

/// Settings for using invocation logs to customize a model.
///
/// @nodoc
class InvocationLogsConfig {
  /// The source of the invocation logs.
  final InvocationLogSource invocationLogSource;

  /// Rules for filtering invocation logs based on request metadata.
  final RequestMetadataFilters? requestMetadataFilters;

  /// Whether to use the model's response for training, or just the prompt. The
  /// default value is <code>False</code>.
  final bool? usePromptResponse;

  InvocationLogsConfig({
    required this.invocationLogSource,
    this.requestMetadataFilters,
    this.usePromptResponse,
  });

  factory InvocationLogsConfig.fromJson(Map<String, dynamic> json) {
    return InvocationLogsConfig(
      invocationLogSource: InvocationLogSource.fromJson(
          (json['invocationLogSource'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      requestMetadataFilters: json['requestMetadataFilters'] != null
          ? RequestMetadataFilters.fromJson(
              json['requestMetadataFilters'] as Map<String, dynamic>)
          : null,
      usePromptResponse: json['usePromptResponse'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationLogSource = this.invocationLogSource;
    final requestMetadataFilters = this.requestMetadataFilters;
    final usePromptResponse = this.usePromptResponse;
    return {
      'invocationLogSource': invocationLogSource,
      if (requestMetadataFilters != null)
        'requestMetadataFilters': requestMetadataFilters,
      if (usePromptResponse != null) 'usePromptResponse': usePromptResponse,
    };
  }
}

/// A storage location for invocation logs.
///
/// @nodoc
class InvocationLogSource {
  /// The URI of an invocation log in a bucket.
  final String? s3Uri;

  InvocationLogSource({
    this.s3Uri,
  });

  factory InvocationLogSource.fromJson(Map<String, dynamic> json) {
    return InvocationLogSource(
      s3Uri: json['s3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// Rules for filtering invocation logs. A filter can be a mapping of a metadata
/// key to a value that it should or should not equal (a base filter), or a list
/// of base filters that are all applied with <code>AND</code> or
/// <code>OR</code> logical operators
///
/// @nodoc
class RequestMetadataFilters {
  /// Include results where all of the based filters match.
  final List<RequestMetadataBaseFilters>? andAll;

  /// Include results where the key equals the value.
  final Map<String, String>? equals;

  /// Include results where the key does not equal the value.
  final Map<String, String>? notEquals;

  /// Include results where any of the base filters match.
  final List<RequestMetadataBaseFilters>? orAll;

  RequestMetadataFilters({
    this.andAll,
    this.equals,
    this.notEquals,
    this.orAll,
  });

  factory RequestMetadataFilters.fromJson(Map<String, dynamic> json) {
    return RequestMetadataFilters(
      andAll: (json['andAll'] as List?)
          ?.nonNulls
          .map((e) =>
              RequestMetadataBaseFilters.fromJson(e as Map<String, dynamic>))
          .toList(),
      equals: (json['equals'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      notEquals: (json['notEquals'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      orAll: (json['orAll'] as List?)
          ?.nonNulls
          .map((e) =>
              RequestMetadataBaseFilters.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final andAll = this.andAll;
    final equals = this.equals;
    final notEquals = this.notEquals;
    final orAll = this.orAll;
    return {
      if (andAll != null) 'andAll': andAll,
      if (equals != null) 'equals': equals,
      if (notEquals != null) 'notEquals': notEquals,
      if (orAll != null) 'orAll': orAll,
    };
  }
}

/// A mapping of a metadata key to a value that it should or should not equal.
///
/// @nodoc
class RequestMetadataBaseFilters {
  /// Include results where the key equals the value.
  final Map<String, String>? equals;

  /// Include results where the key does not equal the value.
  final Map<String, String>? notEquals;

  RequestMetadataBaseFilters({
    this.equals,
    this.notEquals,
  });

  factory RequestMetadataBaseFilters.fromJson(Map<String, dynamic> json) {
    return RequestMetadataBaseFilters(
      equals: (json['equals'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      notEquals: (json['notEquals'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final equals = this.equals;
    final notEquals = this.notEquals;
    return {
      if (equals != null) 'equals': equals,
      if (notEquals != null) 'notEquals': notEquals,
    };
  }
}

/// Definition of the key/value pair for a tag.
///
/// @nodoc
class Tag {
  /// Key for the tag.
  final String key;

  /// Value for the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['key'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
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

/// An offer dictates usage terms for the model.
///
/// @nodoc
class Offer {
  /// Offer token.
  final String offerToken;

  /// Details about the terms of the offer.
  final TermDetails termDetails;

  /// Offer Id for a model offer.
  final String? offerId;

  Offer({
    required this.offerToken,
    required this.termDetails,
    this.offerId,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      offerToken: (json['offerToken'] as String?) ?? '',
      termDetails: TermDetails.fromJson(
          (json['termDetails'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      offerId: json['offerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final offerToken = this.offerToken;
    final termDetails = this.termDetails;
    final offerId = this.offerId;
    return {
      'offerToken': offerToken,
      'termDetails': termDetails,
      if (offerId != null) 'offerId': offerId,
    };
  }
}

/// Describes the usage terms of an offer.
///
/// @nodoc
class TermDetails {
  /// Describes the legal terms.
  final LegalTerm legalTerm;

  /// Describes the support terms.
  final SupportTerm supportTerm;
  final PricingTerm usageBasedPricingTerm;

  /// Describes the validity terms.
  final ValidityTerm? validityTerm;

  TermDetails({
    required this.legalTerm,
    required this.supportTerm,
    required this.usageBasedPricingTerm,
    this.validityTerm,
  });

  factory TermDetails.fromJson(Map<String, dynamic> json) {
    return TermDetails(
      legalTerm: LegalTerm.fromJson(
          (json['legalTerm'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      supportTerm: SupportTerm.fromJson(
          (json['supportTerm'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      usageBasedPricingTerm: PricingTerm.fromJson(
          (json['usageBasedPricingTerm'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      validityTerm: json['validityTerm'] != null
          ? ValidityTerm.fromJson(json['validityTerm'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final legalTerm = this.legalTerm;
    final supportTerm = this.supportTerm;
    final usageBasedPricingTerm = this.usageBasedPricingTerm;
    final validityTerm = this.validityTerm;
    return {
      'legalTerm': legalTerm,
      'supportTerm': supportTerm,
      'usageBasedPricingTerm': usageBasedPricingTerm,
      if (validityTerm != null) 'validityTerm': validityTerm,
    };
  }
}

/// Describes the usage-based pricing term.
///
/// @nodoc
class PricingTerm {
  /// Describes a usage price for each dimension.
  final List<DimensionalPriceRate> rateCard;

  PricingTerm({
    required this.rateCard,
  });

  factory PricingTerm.fromJson(Map<String, dynamic> json) {
    return PricingTerm(
      rateCard: ((json['rateCard'] as List?) ?? const [])
          .nonNulls
          .map((e) => DimensionalPriceRate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rateCard = this.rateCard;
    return {
      'rateCard': rateCard,
    };
  }
}

/// The legal term of the agreement.
///
/// @nodoc
class LegalTerm {
  /// URL to the legal term document.
  final String? url;

  LegalTerm({
    this.url,
  });

  factory LegalTerm.fromJson(Map<String, dynamic> json) {
    return LegalTerm(
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    return {
      if (url != null) 'url': url,
    };
  }
}

/// Describes a support term.
///
/// @nodoc
class SupportTerm {
  /// Describes the refund policy.
  final String? refundPolicyDescription;

  SupportTerm({
    this.refundPolicyDescription,
  });

  factory SupportTerm.fromJson(Map<String, dynamic> json) {
    return SupportTerm(
      refundPolicyDescription: json['refundPolicyDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final refundPolicyDescription = this.refundPolicyDescription;
    return {
      if (refundPolicyDescription != null)
        'refundPolicyDescription': refundPolicyDescription,
    };
  }
}

/// Describes the validity terms.
///
/// @nodoc
class ValidityTerm {
  /// Describes the agreement duration.
  final String? agreementDuration;

  ValidityTerm({
    this.agreementDuration,
  });

  factory ValidityTerm.fromJson(Map<String, dynamic> json) {
    return ValidityTerm(
      agreementDuration: json['agreementDuration'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final agreementDuration = this.agreementDuration;
    return {
      if (agreementDuration != null) 'agreementDuration': agreementDuration,
    };
  }
}

/// Dimensional price rate.
///
/// @nodoc
class DimensionalPriceRate {
  /// Description of the price rate.
  final String? description;

  /// Dimension for the price rate.
  final String? dimension;

  /// Single-dimensional rate information.
  final String? price;

  /// Unit associated with the price.
  final String? unit;

  DimensionalPriceRate({
    this.description,
    this.dimension,
    this.price,
    this.unit,
  });

  factory DimensionalPriceRate.fromJson(Map<String, dynamic> json) {
    return DimensionalPriceRate(
      description: json['description'] as String?,
      dimension: json['dimension'] as String?,
      price: json['price'] as String?,
      unit: json['unit'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final dimension = this.dimension;
    final price = this.price;
    final unit = this.unit;
    return {
      if (description != null) 'description': description,
      if (dimension != null) 'dimension': dimension,
      if (price != null) 'price': price,
      if (unit != null) 'unit': unit,
    };
  }
}

/// @nodoc
class OfferType {
  static const all = OfferType._('ALL');
  static const public = OfferType._('PUBLIC');

  final String value;

  const OfferType._(this.value);

  static const values = [all, public];

  static OfferType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OfferType._(value));

  @override
  bool operator ==(other) => other is OfferType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the agreement availability
///
/// @nodoc
class AgreementAvailability {
  /// Status of the agreement.
  final AgreementStatus status;

  /// Error message.
  final String? errorMessage;

  AgreementAvailability({
    required this.status,
    this.errorMessage,
  });

  factory AgreementAvailability.fromJson(Map<String, dynamic> json) {
    return AgreementAvailability(
      status: AgreementStatus.fromString((json['status'] as String?) ?? ''),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final errorMessage = this.errorMessage;
    return {
      'status': status.value,
      if (errorMessage != null) 'errorMessage': errorMessage,
    };
  }
}

/// @nodoc
class AuthorizationStatus {
  static const authorized = AuthorizationStatus._('AUTHORIZED');
  static const notAuthorized = AuthorizationStatus._('NOT_AUTHORIZED');

  final String value;

  const AuthorizationStatus._(this.value);

  static const values = [authorized, notAuthorized];

  static AuthorizationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthorizationStatus._(value));

  @override
  bool operator ==(other) =>
      other is AuthorizationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EntitlementAvailability {
  static const available = EntitlementAvailability._('AVAILABLE');
  static const notAvailable = EntitlementAvailability._('NOT_AVAILABLE');

  final String value;

  const EntitlementAvailability._(this.value);

  static const values = [available, notAvailable];

  static EntitlementAvailability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EntitlementAvailability._(value));

  @override
  bool operator ==(other) =>
      other is EntitlementAvailability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RegionAvailability {
  static const available = RegionAvailability._('AVAILABLE');
  static const notAvailable = RegionAvailability._('NOT_AVAILABLE');

  final String value;

  const RegionAvailability._(this.value);

  static const values = [available, notAvailable];

  static RegionAvailability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegionAvailability._(value));

  @override
  bool operator ==(other) =>
      other is RegionAvailability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AgreementStatus {
  static const available = AgreementStatus._('AVAILABLE');
  static const pending = AgreementStatus._('PENDING');
  static const notAvailable = AgreementStatus._('NOT_AVAILABLE');
  static const error = AgreementStatus._('ERROR');

  final String value;

  const AgreementStatus._(this.value);

  static const values = [available, pending, notAvailable, error];

  static AgreementStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgreementStatus._(value));

  @override
  bool operator ==(other) => other is AgreementStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of information about a Provisioned Throughput.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_ListProvisionedModelThroughputs.html#API_ListProvisionedModelThroughputs_ResponseSyntax">ListProvisionedThroughputs
/// response</a>
/// </li>
/// </ul>
///
/// @nodoc
class ProvisionedModelSummary {
  /// The time that the Provisioned Throughput was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the model requested to be associated to
  /// this Provisioned Throughput. This value differs from the
  /// <code>modelArn</code> if updating hasn't completed.
  final String desiredModelArn;

  /// The number of model units that was requested to be allocated to the
  /// Provisioned Throughput.
  final int desiredModelUnits;

  /// The Amazon Resource Name (ARN) of the base model for which the Provisioned
  /// Throughput was created, or of the base model that the custom model for which
  /// the Provisioned Throughput was created was customized.
  final String foundationModelArn;

  /// The time that the Provisioned Throughput was last modified.
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the model associated with the Provisioned
  /// Throughput.
  final String modelArn;

  /// The number of model units allocated to the Provisioned Throughput.
  final int modelUnits;

  /// The Amazon Resource Name (ARN) of the Provisioned Throughput.
  final String provisionedModelArn;

  /// The name of the Provisioned Throughput.
  final String provisionedModelName;

  /// The status of the Provisioned Throughput.
  final ProvisionedModelStatus status;

  /// The duration for which the Provisioned Throughput was committed.
  final CommitmentDuration? commitmentDuration;

  /// The timestamp for when the commitment term of the Provisioned Throughput
  /// expires.
  final DateTime? commitmentExpirationTime;

  ProvisionedModelSummary({
    required this.creationTime,
    required this.desiredModelArn,
    required this.desiredModelUnits,
    required this.foundationModelArn,
    required this.lastModifiedTime,
    required this.modelArn,
    required this.modelUnits,
    required this.provisionedModelArn,
    required this.provisionedModelName,
    required this.status,
    this.commitmentDuration,
    this.commitmentExpirationTime,
  });

  factory ProvisionedModelSummary.fromJson(Map<String, dynamic> json) {
    return ProvisionedModelSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      desiredModelArn: (json['desiredModelArn'] as String?) ?? '',
      desiredModelUnits: (json['desiredModelUnits'] as int?) ?? 0,
      foundationModelArn: (json['foundationModelArn'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] ?? 0),
      modelArn: (json['modelArn'] as String?) ?? '',
      modelUnits: (json['modelUnits'] as int?) ?? 0,
      provisionedModelArn: (json['provisionedModelArn'] as String?) ?? '',
      provisionedModelName: (json['provisionedModelName'] as String?) ?? '',
      status:
          ProvisionedModelStatus.fromString((json['status'] as String?) ?? ''),
      commitmentDuration: (json['commitmentDuration'] as String?)
          ?.let(CommitmentDuration.fromString),
      commitmentExpirationTime:
          timeStampFromJson(json['commitmentExpirationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final desiredModelArn = this.desiredModelArn;
    final desiredModelUnits = this.desiredModelUnits;
    final foundationModelArn = this.foundationModelArn;
    final lastModifiedTime = this.lastModifiedTime;
    final modelArn = this.modelArn;
    final modelUnits = this.modelUnits;
    final provisionedModelArn = this.provisionedModelArn;
    final provisionedModelName = this.provisionedModelName;
    final status = this.status;
    final commitmentDuration = this.commitmentDuration;
    final commitmentExpirationTime = this.commitmentExpirationTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'desiredModelArn': desiredModelArn,
      'desiredModelUnits': desiredModelUnits,
      'foundationModelArn': foundationModelArn,
      'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      'modelArn': modelArn,
      'modelUnits': modelUnits,
      'provisionedModelArn': provisionedModelArn,
      'provisionedModelName': provisionedModelName,
      'status': status.value,
      if (commitmentDuration != null)
        'commitmentDuration': commitmentDuration.value,
      if (commitmentExpirationTime != null)
        'commitmentExpirationTime': iso8601ToJson(commitmentExpirationTime),
    };
  }
}

/// @nodoc
class ProvisionedModelStatus {
  static const creating = ProvisionedModelStatus._('Creating');
  static const inService = ProvisionedModelStatus._('InService');
  static const updating = ProvisionedModelStatus._('Updating');
  static const failed = ProvisionedModelStatus._('Failed');

  final String value;

  const ProvisionedModelStatus._(this.value);

  static const values = [creating, inService, updating, failed];

  static ProvisionedModelStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ProvisionedModelStatus._(value));

  @override
  bool operator ==(other) =>
      other is ProvisionedModelStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CommitmentDuration {
  static const oneMonth = CommitmentDuration._('OneMonth');
  static const sixMonths = CommitmentDuration._('SixMonths');

  final String value;

  const CommitmentDuration._(this.value);

  static const values = [oneMonth, sixMonths];

  static CommitmentDuration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CommitmentDuration._(value));

  @override
  bool operator ==(other) =>
      other is CommitmentDuration && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SortByProvisionedModels {
  static const creationTime = SortByProvisionedModels._('CreationTime');

  final String value;

  const SortByProvisionedModels._(this.value);

  static const values = [creationTime];

  static SortByProvisionedModels fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SortByProvisionedModels._(value));

  @override
  bool operator ==(other) =>
      other is SortByProvisionedModels && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a prompt router.
///
/// @nodoc
class PromptRouterSummary {
  /// The router's fallback model.
  final PromptRouterTargetModel fallbackModel;

  /// The router's models.
  final List<PromptRouterTargetModel> models;

  /// The router's ARN.
  final String promptRouterArn;

  /// The router's name.
  final String promptRouterName;

  /// The router's routing criteria.
  final RoutingCriteria routingCriteria;

  /// The router's status.
  final PromptRouterStatus status;

  /// The summary's type.
  final PromptRouterType type;

  /// When the router was created.
  final DateTime? createdAt;

  /// The router's description.
  final String? description;

  /// When the router was updated.
  final DateTime? updatedAt;

  PromptRouterSummary({
    required this.fallbackModel,
    required this.models,
    required this.promptRouterArn,
    required this.promptRouterName,
    required this.routingCriteria,
    required this.status,
    required this.type,
    this.createdAt,
    this.description,
    this.updatedAt,
  });

  factory PromptRouterSummary.fromJson(Map<String, dynamic> json) {
    return PromptRouterSummary(
      fallbackModel: PromptRouterTargetModel.fromJson(
          (json['fallbackModel'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      models: ((json['models'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              PromptRouterTargetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      promptRouterArn: (json['promptRouterArn'] as String?) ?? '',
      promptRouterName: (json['promptRouterName'] as String?) ?? '',
      routingCriteria: RoutingCriteria.fromJson(
          (json['routingCriteria'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      status: PromptRouterStatus.fromString((json['status'] as String?) ?? ''),
      type: PromptRouterType.fromString((json['type'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final fallbackModel = this.fallbackModel;
    final models = this.models;
    final promptRouterArn = this.promptRouterArn;
    final promptRouterName = this.promptRouterName;
    final routingCriteria = this.routingCriteria;
    final status = this.status;
    final type = this.type;
    final createdAt = this.createdAt;
    final description = this.description;
    final updatedAt = this.updatedAt;
    return {
      'fallbackModel': fallbackModel,
      'models': models,
      'promptRouterArn': promptRouterArn,
      'promptRouterName': promptRouterName,
      'routingCriteria': routingCriteria,
      'status': status.value,
      'type': type.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Routing criteria for a prompt router.
///
/// @nodoc
class RoutingCriteria {
  /// The criteria's response quality difference.
  final double responseQualityDifference;

  RoutingCriteria({
    required this.responseQualityDifference,
  });

  factory RoutingCriteria.fromJson(Map<String, dynamic> json) {
    return RoutingCriteria(
      responseQualityDifference:
          _s.parseJsonDouble(json['responseQualityDifference']) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final responseQualityDifference = this.responseQualityDifference;
    return {
      'responseQualityDifference':
          _s.encodeJsonDouble(responseQualityDifference),
    };
  }
}

/// The target model for a prompt router.
///
/// @nodoc
class PromptRouterTargetModel {
  /// The target model's ARN.
  final String modelArn;

  PromptRouterTargetModel({
    required this.modelArn,
  });

  factory PromptRouterTargetModel.fromJson(Map<String, dynamic> json) {
    return PromptRouterTargetModel(
      modelArn: (json['modelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    return {
      'modelArn': modelArn,
    };
  }
}

/// @nodoc
class PromptRouterStatus {
  static const available = PromptRouterStatus._('AVAILABLE');

  final String value;

  const PromptRouterStatus._(this.value);

  static const values = [available];

  static PromptRouterStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PromptRouterStatus._(value));

  @override
  bool operator ==(other) =>
      other is PromptRouterStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PromptRouterType {
  static const custom = PromptRouterType._('custom');
  static const $default = PromptRouterType._('default');

  final String value;

  const PromptRouterType._(this.value);

  static const values = [custom, $default];

  static PromptRouterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PromptRouterType._(value));

  @override
  bool operator ==(other) => other is PromptRouterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information for a foundation model.
///
/// @nodoc
class FoundationModelSummary {
  /// The Amazon Resource Name (ARN) of the foundation model.
  final String modelArn;

  /// The model ID of the foundation model.
  final String modelId;

  /// Whether the model supports fine-tuning or continual pre-training.
  final List<ModelCustomization>? customizationsSupported;

  /// The inference types that the model supports.
  final List<InferenceType>? inferenceTypesSupported;

  /// The input modalities that the model supports.
  final List<ModelModality>? inputModalities;

  /// Contains details about whether a model version is available or deprecated.
  final FoundationModelLifecycle? modelLifecycle;

  /// The name of the model.
  final String? modelName;

  /// The output modalities that the model supports.
  final List<ModelModality>? outputModalities;

  /// The model's provider name.
  final String? providerName;

  /// Indicates whether the model supports streaming.
  final bool? responseStreamingSupported;

  FoundationModelSummary({
    required this.modelArn,
    required this.modelId,
    this.customizationsSupported,
    this.inferenceTypesSupported,
    this.inputModalities,
    this.modelLifecycle,
    this.modelName,
    this.outputModalities,
    this.providerName,
    this.responseStreamingSupported,
  });

  factory FoundationModelSummary.fromJson(Map<String, dynamic> json) {
    return FoundationModelSummary(
      modelArn: (json['modelArn'] as String?) ?? '',
      modelId: (json['modelId'] as String?) ?? '',
      customizationsSupported: (json['customizationsSupported'] as List?)
          ?.nonNulls
          .map((e) => ModelCustomization.fromString((e as String)))
          .toList(),
      inferenceTypesSupported: (json['inferenceTypesSupported'] as List?)
          ?.nonNulls
          .map((e) => InferenceType.fromString((e as String)))
          .toList(),
      inputModalities: (json['inputModalities'] as List?)
          ?.nonNulls
          .map((e) => ModelModality.fromString((e as String)))
          .toList(),
      modelLifecycle: json['modelLifecycle'] != null
          ? FoundationModelLifecycle.fromJson(
              json['modelLifecycle'] as Map<String, dynamic>)
          : null,
      modelName: json['modelName'] as String?,
      outputModalities: (json['outputModalities'] as List?)
          ?.nonNulls
          .map((e) => ModelModality.fromString((e as String)))
          .toList(),
      providerName: json['providerName'] as String?,
      responseStreamingSupported: json['responseStreamingSupported'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final modelId = this.modelId;
    final customizationsSupported = this.customizationsSupported;
    final inferenceTypesSupported = this.inferenceTypesSupported;
    final inputModalities = this.inputModalities;
    final modelLifecycle = this.modelLifecycle;
    final modelName = this.modelName;
    final outputModalities = this.outputModalities;
    final providerName = this.providerName;
    final responseStreamingSupported = this.responseStreamingSupported;
    return {
      'modelArn': modelArn,
      'modelId': modelId,
      if (customizationsSupported != null)
        'customizationsSupported':
            customizationsSupported.map((e) => e.value).toList(),
      if (inferenceTypesSupported != null)
        'inferenceTypesSupported':
            inferenceTypesSupported.map((e) => e.value).toList(),
      if (inputModalities != null)
        'inputModalities': inputModalities.map((e) => e.value).toList(),
      if (modelLifecycle != null) 'modelLifecycle': modelLifecycle,
      if (modelName != null) 'modelName': modelName,
      if (outputModalities != null)
        'outputModalities': outputModalities.map((e) => e.value).toList(),
      if (providerName != null) 'providerName': providerName,
      if (responseStreamingSupported != null)
        'responseStreamingSupported': responseStreamingSupported,
    };
  }
}

/// Details about whether a model version is available or deprecated.
///
/// @nodoc
class FoundationModelLifecycle {
  /// Specifies whether a model version is available (<code>ACTIVE</code>) or
  /// deprecated (<code>LEGACY</code>.
  final FoundationModelLifecycleStatus status;

  /// Time when the model is no longer available for use
  final DateTime? endOfLifeTime;

  /// Time when the model enters legacy state. Models in legacy state can still be
  /// used, but users should plan to transition to an Active model before the end
  /// of life time
  final DateTime? legacyTime;

  /// Public extended access portion of the legacy period, when users should
  /// expect higher pricing
  final DateTime? publicExtendedAccessTime;

  /// Launch time when the model first becomes available
  final DateTime? startOfLifeTime;

  FoundationModelLifecycle({
    required this.status,
    this.endOfLifeTime,
    this.legacyTime,
    this.publicExtendedAccessTime,
    this.startOfLifeTime,
  });

  factory FoundationModelLifecycle.fromJson(Map<String, dynamic> json) {
    return FoundationModelLifecycle(
      status: FoundationModelLifecycleStatus.fromString(
          (json['status'] as String?) ?? ''),
      endOfLifeTime: timeStampFromJson(json['endOfLifeTime']),
      legacyTime: timeStampFromJson(json['legacyTime']),
      publicExtendedAccessTime:
          timeStampFromJson(json['publicExtendedAccessTime']),
      startOfLifeTime: timeStampFromJson(json['startOfLifeTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final endOfLifeTime = this.endOfLifeTime;
    final legacyTime = this.legacyTime;
    final publicExtendedAccessTime = this.publicExtendedAccessTime;
    final startOfLifeTime = this.startOfLifeTime;
    return {
      'status': status.value,
      if (endOfLifeTime != null) 'endOfLifeTime': iso8601ToJson(endOfLifeTime),
      if (legacyTime != null) 'legacyTime': iso8601ToJson(legacyTime),
      if (publicExtendedAccessTime != null)
        'publicExtendedAccessTime': iso8601ToJson(publicExtendedAccessTime),
      if (startOfLifeTime != null)
        'startOfLifeTime': iso8601ToJson(startOfLifeTime),
    };
  }
}

/// @nodoc
class FoundationModelLifecycleStatus {
  static const active = FoundationModelLifecycleStatus._('ACTIVE');
  static const legacy = FoundationModelLifecycleStatus._('LEGACY');

  final String value;

  const FoundationModelLifecycleStatus._(this.value);

  static const values = [active, legacy];

  static FoundationModelLifecycleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FoundationModelLifecycleStatus._(value));

  @override
  bool operator ==(other) =>
      other is FoundationModelLifecycleStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InferenceType {
  static const onDemand = InferenceType._('ON_DEMAND');
  static const provisioned = InferenceType._('PROVISIONED');

  final String value;

  const InferenceType._(this.value);

  static const values = [onDemand, provisioned];

  static InferenceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InferenceType._(value));

  @override
  bool operator ==(other) => other is InferenceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ModelCustomization {
  static const fineTuning = ModelCustomization._('FINE_TUNING');
  static const continuedPreTraining =
      ModelCustomization._('CONTINUED_PRE_TRAINING');
  static const distillation = ModelCustomization._('DISTILLATION');

  final String value;

  const ModelCustomization._(this.value);

  static const values = [fineTuning, continuedPreTraining, distillation];

  static ModelCustomization fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ModelCustomization._(value));

  @override
  bool operator ==(other) =>
      other is ModelCustomization && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ModelModality {
  static const text = ModelModality._('TEXT');
  static const image = ModelModality._('IMAGE');
  static const embedding = ModelModality._('EMBEDDING');

  final String value;

  const ModelModality._(this.value);

  static const values = [text, image, embedding];

  static ModelModality fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ModelModality._(value));

  @override
  bool operator ==(other) => other is ModelModality && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a foundation model.
///
/// @nodoc
class FoundationModelDetails {
  /// The model Amazon Resource Name (ARN).
  final String modelArn;

  /// The model identifier.
  final String modelId;

  /// The customization that the model supports.
  final List<ModelCustomization>? customizationsSupported;

  /// The inference types that the model supports.
  final List<InferenceType>? inferenceTypesSupported;

  /// The input modalities that the model supports.
  final List<ModelModality>? inputModalities;

  /// Contains details about whether a model version is available or deprecated
  final FoundationModelLifecycle? modelLifecycle;

  /// The model name.
  final String? modelName;

  /// The output modalities that the model supports.
  final List<ModelModality>? outputModalities;

  /// The model's provider name.
  final String? providerName;

  /// Indicates whether the model supports streaming.
  final bool? responseStreamingSupported;

  FoundationModelDetails({
    required this.modelArn,
    required this.modelId,
    this.customizationsSupported,
    this.inferenceTypesSupported,
    this.inputModalities,
    this.modelLifecycle,
    this.modelName,
    this.outputModalities,
    this.providerName,
    this.responseStreamingSupported,
  });

  factory FoundationModelDetails.fromJson(Map<String, dynamic> json) {
    return FoundationModelDetails(
      modelArn: (json['modelArn'] as String?) ?? '',
      modelId: (json['modelId'] as String?) ?? '',
      customizationsSupported: (json['customizationsSupported'] as List?)
          ?.nonNulls
          .map((e) => ModelCustomization.fromString((e as String)))
          .toList(),
      inferenceTypesSupported: (json['inferenceTypesSupported'] as List?)
          ?.nonNulls
          .map((e) => InferenceType.fromString((e as String)))
          .toList(),
      inputModalities: (json['inputModalities'] as List?)
          ?.nonNulls
          .map((e) => ModelModality.fromString((e as String)))
          .toList(),
      modelLifecycle: json['modelLifecycle'] != null
          ? FoundationModelLifecycle.fromJson(
              json['modelLifecycle'] as Map<String, dynamic>)
          : null,
      modelName: json['modelName'] as String?,
      outputModalities: (json['outputModalities'] as List?)
          ?.nonNulls
          .map((e) => ModelModality.fromString((e as String)))
          .toList(),
      providerName: json['providerName'] as String?,
      responseStreamingSupported: json['responseStreamingSupported'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final modelId = this.modelId;
    final customizationsSupported = this.customizationsSupported;
    final inferenceTypesSupported = this.inferenceTypesSupported;
    final inputModalities = this.inputModalities;
    final modelLifecycle = this.modelLifecycle;
    final modelName = this.modelName;
    final outputModalities = this.outputModalities;
    final providerName = this.providerName;
    final responseStreamingSupported = this.responseStreamingSupported;
    return {
      'modelArn': modelArn,
      'modelId': modelId,
      if (customizationsSupported != null)
        'customizationsSupported':
            customizationsSupported.map((e) => e.value).toList(),
      if (inferenceTypesSupported != null)
        'inferenceTypesSupported':
            inferenceTypesSupported.map((e) => e.value).toList(),
      if (inputModalities != null)
        'inputModalities': inputModalities.map((e) => e.value).toList(),
      if (modelLifecycle != null) 'modelLifecycle': modelLifecycle,
      if (modelName != null) 'modelName': modelName,
      if (outputModalities != null)
        'outputModalities': outputModalities.map((e) => e.value).toList(),
      if (providerName != null) 'providerName': providerName,
      if (responseStreamingSupported != null)
        'responseStreamingSupported': responseStreamingSupported,
    };
  }
}

/// A summary of a batch inference job.
///
/// @nodoc
class ModelInvocationJobSummary {
  /// Details about the location of the input to the batch inference job.
  final ModelInvocationJobInputDataConfig inputDataConfig;

  /// The Amazon Resource Name (ARN) of the batch inference job.
  final String jobArn;

  /// The name of the batch inference job.
  final String jobName;

  /// The unique identifier of the foundation model used for model inference.
  final String modelId;

  /// Details about the location of the output of the batch inference job.
  final ModelInvocationJobOutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) of the service role with permissions to carry
  /// out and manage batch inference. You can use the console to create a default
  /// service role or follow the steps at <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-iam-sr.html">Create
  /// a service role for batch inference</a>.
  final String roleArn;

  /// The time at which the batch inference job was submitted.
  final DateTime submitTime;

  /// A unique, case-sensitive identifier to ensure that the API request completes
  /// no more than one time. If this token matches a previous request, Amazon
  /// Bedrock ignores the request, but does not return an error. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a>.
  final String? clientRequestToken;

  /// The time at which the batch inference job ended.
  final DateTime? endTime;

  /// The number of records that failed to process in the batch inference job.
  final int? errorRecordCount;

  /// The time at which the batch inference job times or timed out.
  final DateTime? jobExpirationTime;

  /// The time at which the batch inference job was last modified.
  final DateTime? lastModifiedTime;

  /// If the batch inference job failed, this field contains a message describing
  /// why the job failed.
  final String? message;

  /// The invocation endpoint for ModelInvocationJob
  final ModelInvocationType? modelInvocationType;

  /// The number of records that have been processed in the batch inference job.
  final int? processedRecordCount;

  /// The status of the batch inference job.
  ///
  /// The following statuses are possible:
  ///
  /// <ul>
  /// <li>
  /// Submitted – This job has been submitted to a queue for validation.
  /// </li>
  /// <li>
  /// Validating – This job is being validated for the requirements described in
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-data.html">Format
  /// and upload your batch inference data</a>. The criteria include the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// Your IAM service role has access to the Amazon S3 buckets containing your
  /// files.
  /// </li>
  /// <li>
  /// Your files are .jsonl files and each individual record is a JSON object in
  /// the correct format. Note that validation doesn't check if the
  /// <code>modelInput</code> value matches the request body for the model.
  /// </li>
  /// <li>
  /// Your files fulfill the requirements for file size and number of records. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/quotas.html">Quotas
  /// for Amazon Bedrock</a>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Scheduled – This job has been validated and is now in a queue. The job will
  /// automatically start when it reaches its turn.
  /// </li>
  /// <li>
  /// Expired – This job timed out because it was scheduled but didn't begin
  /// before the set timeout duration. Submit a new job request.
  /// </li>
  /// <li>
  /// InProgress – This job has begun. You can start viewing the results in the
  /// output S3 location.
  /// </li>
  /// <li>
  /// Completed – This job has successfully completed. View the output files in
  /// the output S3 location.
  /// </li>
  /// <li>
  /// PartiallyCompleted – This job has partially completed. Not all of your
  /// records could be processed in time. View the output files in the output S3
  /// location.
  /// </li>
  /// <li>
  /// Failed – This job has failed. Check the failure message for any further
  /// details. For further assistance, reach out to the <a
  /// href="https://console.aws.amazon.com/support/home/">Amazon Web Services
  /// Support Center</a>.
  /// </li>
  /// <li>
  /// Stopped – This job was stopped by a user.
  /// </li>
  /// <li>
  /// Stopping – This job is being stopped by a user.
  /// </li>
  /// </ul>
  final ModelInvocationJobStatus? status;

  /// The number of records that were successfully processed in the batch
  /// inference job.
  final int? successRecordCount;

  /// The number of hours after which the batch inference job was set to time out.
  final int? timeoutDurationInHours;

  /// The total number of records in the batch inference job.
  final int? totalRecordCount;

  /// The configuration of the Virtual Private Cloud (VPC) for the data in the
  /// batch inference job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-vpc">Protect
  /// batch inference jobs using a VPC</a>.
  final VpcConfig? vpcConfig;

  ModelInvocationJobSummary({
    required this.inputDataConfig,
    required this.jobArn,
    required this.jobName,
    required this.modelId,
    required this.outputDataConfig,
    required this.roleArn,
    required this.submitTime,
    this.clientRequestToken,
    this.endTime,
    this.errorRecordCount,
    this.jobExpirationTime,
    this.lastModifiedTime,
    this.message,
    this.modelInvocationType,
    this.processedRecordCount,
    this.status,
    this.successRecordCount,
    this.timeoutDurationInHours,
    this.totalRecordCount,
    this.vpcConfig,
  });

  factory ModelInvocationJobSummary.fromJson(Map<String, dynamic> json) {
    return ModelInvocationJobSummary(
      inputDataConfig: ModelInvocationJobInputDataConfig.fromJson(
          (json['inputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      modelId: (json['modelId'] as String?) ?? '',
      outputDataConfig: ModelInvocationJobOutputDataConfig.fromJson(
          (json['outputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      roleArn: (json['roleArn'] as String?) ?? '',
      submitTime: nonNullableTimeStampFromJson(json['submitTime'] ?? 0),
      clientRequestToken: json['clientRequestToken'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      errorRecordCount: json['errorRecordCount'] as int?,
      jobExpirationTime: timeStampFromJson(json['jobExpirationTime']),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      message: json['message'] as String?,
      modelInvocationType: (json['modelInvocationType'] as String?)
          ?.let(ModelInvocationType.fromString),
      processedRecordCount: json['processedRecordCount'] as int?,
      status:
          (json['status'] as String?)?.let(ModelInvocationJobStatus.fromString),
      successRecordCount: json['successRecordCount'] as int?,
      timeoutDurationInHours: json['timeoutDurationInHours'] as int?,
      totalRecordCount: json['totalRecordCount'] as int?,
      vpcConfig: json['vpcConfig'] != null
          ? VpcConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final inputDataConfig = this.inputDataConfig;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final modelId = this.modelId;
    final outputDataConfig = this.outputDataConfig;
    final roleArn = this.roleArn;
    final submitTime = this.submitTime;
    final clientRequestToken = this.clientRequestToken;
    final endTime = this.endTime;
    final errorRecordCount = this.errorRecordCount;
    final jobExpirationTime = this.jobExpirationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final message = this.message;
    final modelInvocationType = this.modelInvocationType;
    final processedRecordCount = this.processedRecordCount;
    final status = this.status;
    final successRecordCount = this.successRecordCount;
    final timeoutDurationInHours = this.timeoutDurationInHours;
    final totalRecordCount = this.totalRecordCount;
    final vpcConfig = this.vpcConfig;
    return {
      'inputDataConfig': inputDataConfig,
      'jobArn': jobArn,
      'jobName': jobName,
      'modelId': modelId,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'submitTime': iso8601ToJson(submitTime),
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (errorRecordCount != null) 'errorRecordCount': errorRecordCount,
      if (jobExpirationTime != null)
        'jobExpirationTime': iso8601ToJson(jobExpirationTime),
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (message != null) 'message': message,
      if (modelInvocationType != null)
        'modelInvocationType': modelInvocationType.value,
      if (processedRecordCount != null)
        'processedRecordCount': processedRecordCount,
      if (status != null) 'status': status.value,
      if (successRecordCount != null) 'successRecordCount': successRecordCount,
      if (timeoutDurationInHours != null)
        'timeoutDurationInHours': timeoutDurationInHours,
      if (totalRecordCount != null) 'totalRecordCount': totalRecordCount,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

/// @nodoc
class ModelInvocationJobStatus {
  static const submitted = ModelInvocationJobStatus._('Submitted');
  static const inProgress = ModelInvocationJobStatus._('InProgress');
  static const completed = ModelInvocationJobStatus._('Completed');
  static const failed = ModelInvocationJobStatus._('Failed');
  static const stopping = ModelInvocationJobStatus._('Stopping');
  static const stopped = ModelInvocationJobStatus._('Stopped');
  static const partiallyCompleted =
      ModelInvocationJobStatus._('PartiallyCompleted');
  static const expired = ModelInvocationJobStatus._('Expired');
  static const validating = ModelInvocationJobStatus._('Validating');
  static const scheduled = ModelInvocationJobStatus._('Scheduled');

  final String value;

  const ModelInvocationJobStatus._(this.value);

  static const values = [
    submitted,
    inProgress,
    completed,
    failed,
    stopping,
    stopped,
    partiallyCompleted,
    expired,
    validating,
    scheduled
  ];

  static ModelInvocationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ModelInvocationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ModelInvocationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the location of the input to the batch inference job.
///
/// @nodoc
class ModelInvocationJobInputDataConfig {
  /// Contains the configuration of the S3 location of the input data.
  final ModelInvocationJobS3InputDataConfig? s3InputDataConfig;

  ModelInvocationJobInputDataConfig({
    this.s3InputDataConfig,
  });

  factory ModelInvocationJobInputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return ModelInvocationJobInputDataConfig(
      s3InputDataConfig: json['s3InputDataConfig'] != null
          ? ModelInvocationJobS3InputDataConfig.fromJson(
              json['s3InputDataConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3InputDataConfig = this.s3InputDataConfig;
    return {
      if (s3InputDataConfig != null) 's3InputDataConfig': s3InputDataConfig,
    };
  }
}

/// Contains the configuration of the S3 location of the output data.
///
/// @nodoc
class ModelInvocationJobOutputDataConfig {
  /// Contains the configuration of the S3 location of the output data.
  final ModelInvocationJobS3OutputDataConfig? s3OutputDataConfig;

  ModelInvocationJobOutputDataConfig({
    this.s3OutputDataConfig,
  });

  factory ModelInvocationJobOutputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return ModelInvocationJobOutputDataConfig(
      s3OutputDataConfig: json['s3OutputDataConfig'] != null
          ? ModelInvocationJobS3OutputDataConfig.fromJson(
              json['s3OutputDataConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3OutputDataConfig = this.s3OutputDataConfig;
    return {
      if (s3OutputDataConfig != null) 's3OutputDataConfig': s3OutputDataConfig,
    };
  }
}

/// @nodoc
class ModelInvocationType {
  static const invokeModel = ModelInvocationType._('InvokeModel');
  static const converse = ModelInvocationType._('Converse');

  final String value;

  const ModelInvocationType._(this.value);

  static const values = [invokeModel, converse];

  static ModelInvocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ModelInvocationType._(value));

  @override
  bool operator ==(other) =>
      other is ModelInvocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the configuration of the S3 location of the output data.
///
/// @nodoc
class ModelInvocationJobS3OutputDataConfig {
  /// The S3 location of the output data.
  final String s3Uri;

  /// The ID of the Amazon Web Services account that owns the S3 bucket containing
  /// the output data.
  final String? s3BucketOwner;

  /// The unique identifier of the key that encrypts the S3 location of the output
  /// data.
  final String? s3EncryptionKeyId;

  ModelInvocationJobS3OutputDataConfig({
    required this.s3Uri,
    this.s3BucketOwner,
    this.s3EncryptionKeyId,
  });

  factory ModelInvocationJobS3OutputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return ModelInvocationJobS3OutputDataConfig(
      s3Uri: (json['s3Uri'] as String?) ?? '',
      s3BucketOwner: json['s3BucketOwner'] as String?,
      s3EncryptionKeyId: json['s3EncryptionKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final s3BucketOwner = this.s3BucketOwner;
    final s3EncryptionKeyId = this.s3EncryptionKeyId;
    return {
      's3Uri': s3Uri,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
      if (s3EncryptionKeyId != null) 's3EncryptionKeyId': s3EncryptionKeyId,
    };
  }
}

/// Contains the configuration of the S3 location of the input data.
///
/// @nodoc
class ModelInvocationJobS3InputDataConfig {
  /// The S3 location of the input data.
  final String s3Uri;

  /// The ID of the Amazon Web Services account that owns the S3 bucket containing
  /// the input data.
  final String? s3BucketOwner;

  /// The format of the input data.
  final S3InputFormat? s3InputFormat;

  ModelInvocationJobS3InputDataConfig({
    required this.s3Uri,
    this.s3BucketOwner,
    this.s3InputFormat,
  });

  factory ModelInvocationJobS3InputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return ModelInvocationJobS3InputDataConfig(
      s3Uri: (json['s3Uri'] as String?) ?? '',
      s3BucketOwner: json['s3BucketOwner'] as String?,
      s3InputFormat:
          (json['s3InputFormat'] as String?)?.let(S3InputFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final s3BucketOwner = this.s3BucketOwner;
    final s3InputFormat = this.s3InputFormat;
    return {
      's3Uri': s3Uri,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
      if (s3InputFormat != null) 's3InputFormat': s3InputFormat.value,
    };
  }
}

/// @nodoc
class S3InputFormat {
  static const jsonl = S3InputFormat._('JSONL');

  final String value;

  const S3InputFormat._(this.value);

  static const values = [jsonl];

  static S3InputFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => S3InputFormat._(value));

  @override
  bool operator ==(other) => other is S3InputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the import job.
///
/// @nodoc
class ModelImportJobSummary {
  /// The time import job was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the import job.
  final String jobArn;

  /// The name of the import job.
  final String jobName;

  /// The status of the imported job.
  final ModelImportJobStatus status;

  /// The time when import job ended.
  final DateTime? endTime;

  /// The Amazon resource Name (ARN) of the imported model.
  final String? importedModelArn;

  /// The name of the imported model.
  final String? importedModelName;

  /// The time when the import job was last modified.
  final DateTime? lastModifiedTime;

  ModelImportJobSummary({
    required this.creationTime,
    required this.jobArn,
    required this.jobName,
    required this.status,
    this.endTime,
    this.importedModelArn,
    this.importedModelName,
    this.lastModifiedTime,
  });

  factory ModelImportJobSummary.fromJson(Map<String, dynamic> json) {
    return ModelImportJobSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      status:
          ModelImportJobStatus.fromString((json['status'] as String?) ?? ''),
      endTime: timeStampFromJson(json['endTime']),
      importedModelArn: json['importedModelArn'] as String?,
      importedModelName: json['importedModelName'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final status = this.status;
    final endTime = this.endTime;
    final importedModelArn = this.importedModelArn;
    final importedModelName = this.importedModelName;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'jobArn': jobArn,
      'jobName': jobName,
      'status': status.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (importedModelArn != null) 'importedModelArn': importedModelArn,
      if (importedModelName != null) 'importedModelName': importedModelName,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

/// @nodoc
class ModelImportJobStatus {
  static const inProgress = ModelImportJobStatus._('InProgress');
  static const completed = ModelImportJobStatus._('Completed');
  static const failed = ModelImportJobStatus._('Failed');

  final String value;

  const ModelImportJobStatus._(this.value);

  static const values = [inProgress, completed, failed];

  static ModelImportJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ModelImportJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ModelImportJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the imported model.
///
/// @nodoc
class ImportedModelSummary {
  /// Creation time of the imported model.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the imported model.
  final String modelArn;

  /// Name of the imported model.
  final String modelName;

  /// Specifies if the imported model supports converse.
  final bool? instructSupported;

  /// The architecture of the imported model.
  final String? modelArchitecture;

  ImportedModelSummary({
    required this.creationTime,
    required this.modelArn,
    required this.modelName,
    this.instructSupported,
    this.modelArchitecture,
  });

  factory ImportedModelSummary.fromJson(Map<String, dynamic> json) {
    return ImportedModelSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      modelArn: (json['modelArn'] as String?) ?? '',
      modelName: (json['modelName'] as String?) ?? '',
      instructSupported: json['instructSupported'] as bool?,
      modelArchitecture: json['modelArchitecture'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final instructSupported = this.instructSupported;
    final modelArchitecture = this.modelArchitecture;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'modelArn': modelArn,
      'modelName': modelName,
      if (instructSupported != null) 'instructSupported': instructSupported,
      if (modelArchitecture != null) 'modelArchitecture': modelArchitecture,
    };
  }
}

/// @nodoc
class SortModelsBy {
  static const creationTime = SortModelsBy._('CreationTime');

  final String value;

  const SortModelsBy._(this.value);

  static const values = [creationTime];

  static SortModelsBy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SortModelsBy._(value));

  @override
  bool operator ==(other) => other is SortModelsBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data source of the model to import.
///
/// @nodoc
class ModelDataSource {
  /// The Amazon S3 data source of the model to import.
  final S3DataSource? s3DataSource;

  ModelDataSource({
    this.s3DataSource,
  });

  factory ModelDataSource.fromJson(Map<String, dynamic> json) {
    return ModelDataSource(
      s3DataSource: json['s3DataSource'] != null
          ? S3DataSource.fromJson(json['s3DataSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3DataSource = this.s3DataSource;
    return {
      if (s3DataSource != null) 's3DataSource': s3DataSource,
    };
  }
}

/// The Amazon S3 data source of the model to import.
///
/// @nodoc
class S3DataSource {
  /// The URI of the Amazon S3 data source.
  final String s3Uri;

  S3DataSource({
    required this.s3Uri,
  });

  factory S3DataSource.fromJson(Map<String, dynamic> json) {
    return S3DataSource(
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

/// A <code>CustomModelUnit</code> (CMU) is an abstract view of the hardware
/// utilization that Amazon Bedrock needs to host a single copy of your custom
/// model. A model copy represents a single instance of your imported model that
/// is ready to serve inference requests. Amazon Bedrock determines the number
/// of custom model units that a model copy needs when you import the custom
/// model.
///
/// You can use <code>CustomModelUnits</code> to estimate the cost of running
/// your custom model. For more information, see Calculate the cost of running a
/// custom model in the Amazon Bedrock user guide.
///
/// @nodoc
class CustomModelUnits {
  /// The number of custom model units used to host a model copy.
  final int? customModelUnitsPerModelCopy;

  /// The version of the custom model unit. Use to determine the billing rate for
  /// the custom model unit.
  final String? customModelUnitsVersion;

  CustomModelUnits({
    this.customModelUnitsPerModelCopy,
    this.customModelUnitsVersion,
  });

  factory CustomModelUnits.fromJson(Map<String, dynamic> json) {
    return CustomModelUnits(
      customModelUnitsPerModelCopy:
          json['customModelUnitsPerModelCopy'] as int?,
      customModelUnitsVersion: json['customModelUnitsVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final customModelUnitsPerModelCopy = this.customModelUnitsPerModelCopy;
    final customModelUnitsVersion = this.customModelUnitsVersion;
    return {
      if (customModelUnitsPerModelCopy != null)
        'customModelUnitsPerModelCopy': customModelUnitsPerModelCopy,
      if (customModelUnitsVersion != null)
        'customModelUnitsVersion': customModelUnitsVersion,
    };
  }
}

/// Contains details about each model copy job.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_ListModelCopyJobs.html#API_ListModelCopyJobs_ResponseSyntax">ListModelCopyJobs
/// response</a>
/// </li>
/// </ul>
///
/// @nodoc
class ModelCopyJobSummary {
  /// The time that the model copy job was created.
  final DateTime creationTime;

  /// The Amazon Resoource Name (ARN) of the model copy job.
  final String jobArn;

  /// The unique identifier of the account that the model being copied originated
  /// from.
  final String sourceAccountId;

  /// The Amazon Resource Name (ARN) of the original model being copied.
  final String sourceModelArn;

  /// The status of the model copy job.
  final ModelCopyJobStatus status;

  /// The Amazon Resource Name (ARN) of the copied model.
  final String targetModelArn;

  /// If a model fails to be copied, a message describing why the job failed is
  /// included here.
  final String? failureMessage;

  /// The name of the original model being copied.
  final String? sourceModelName;

  /// The Amazon Resource Name (ARN) of the KMS key used to encrypt the copied
  /// model.
  final String? targetModelKmsKeyArn;

  /// The name of the copied model.
  final String? targetModelName;

  /// Tags associated with the copied model.
  final List<Tag>? targetModelTags;

  ModelCopyJobSummary({
    required this.creationTime,
    required this.jobArn,
    required this.sourceAccountId,
    required this.sourceModelArn,
    required this.status,
    required this.targetModelArn,
    this.failureMessage,
    this.sourceModelName,
    this.targetModelKmsKeyArn,
    this.targetModelName,
    this.targetModelTags,
  });

  factory ModelCopyJobSummary.fromJson(Map<String, dynamic> json) {
    return ModelCopyJobSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      jobArn: (json['jobArn'] as String?) ?? '',
      sourceAccountId: (json['sourceAccountId'] as String?) ?? '',
      sourceModelArn: (json['sourceModelArn'] as String?) ?? '',
      status: ModelCopyJobStatus.fromString((json['status'] as String?) ?? ''),
      targetModelArn: (json['targetModelArn'] as String?) ?? '',
      failureMessage: json['failureMessage'] as String?,
      sourceModelName: json['sourceModelName'] as String?,
      targetModelKmsKeyArn: json['targetModelKmsKeyArn'] as String?,
      targetModelName: json['targetModelName'] as String?,
      targetModelTags: (json['targetModelTags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final jobArn = this.jobArn;
    final sourceAccountId = this.sourceAccountId;
    final sourceModelArn = this.sourceModelArn;
    final status = this.status;
    final targetModelArn = this.targetModelArn;
    final failureMessage = this.failureMessage;
    final sourceModelName = this.sourceModelName;
    final targetModelKmsKeyArn = this.targetModelKmsKeyArn;
    final targetModelName = this.targetModelName;
    final targetModelTags = this.targetModelTags;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'jobArn': jobArn,
      'sourceAccountId': sourceAccountId,
      'sourceModelArn': sourceModelArn,
      'status': status.value,
      'targetModelArn': targetModelArn,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (sourceModelName != null) 'sourceModelName': sourceModelName,
      if (targetModelKmsKeyArn != null)
        'targetModelKmsKeyArn': targetModelKmsKeyArn,
      if (targetModelName != null) 'targetModelName': targetModelName,
      if (targetModelTags != null) 'targetModelTags': targetModelTags,
    };
  }
}

/// @nodoc
class ModelCopyJobStatus {
  static const inProgress = ModelCopyJobStatus._('InProgress');
  static const completed = ModelCopyJobStatus._('Completed');
  static const failed = ModelCopyJobStatus._('Failed');

  final String value;

  const ModelCopyJobStatus._(this.value);

  static const values = [inProgress, completed, failed];

  static ModelCopyJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ModelCopyJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is ModelCopyJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration fields for invocation logging.
///
/// @nodoc
class LoggingConfig {
  /// Set to include audio data in the log delivery.
  final bool? audioDataDeliveryEnabled;

  /// CloudWatch logging configuration.
  final CloudWatchConfig? cloudWatchConfig;

  /// Set to include embeddings data in the log delivery.
  final bool? embeddingDataDeliveryEnabled;

  /// Set to include image data in the log delivery.
  final bool? imageDataDeliveryEnabled;

  /// S3 configuration for storing log data.
  final S3Config? s3Config;

  /// Set to include text data in the log delivery.
  final bool? textDataDeliveryEnabled;

  /// Set to include video data in the log delivery.
  final bool? videoDataDeliveryEnabled;

  LoggingConfig({
    this.audioDataDeliveryEnabled,
    this.cloudWatchConfig,
    this.embeddingDataDeliveryEnabled,
    this.imageDataDeliveryEnabled,
    this.s3Config,
    this.textDataDeliveryEnabled,
    this.videoDataDeliveryEnabled,
  });

  factory LoggingConfig.fromJson(Map<String, dynamic> json) {
    return LoggingConfig(
      audioDataDeliveryEnabled: json['audioDataDeliveryEnabled'] as bool?,
      cloudWatchConfig: json['cloudWatchConfig'] != null
          ? CloudWatchConfig.fromJson(
              json['cloudWatchConfig'] as Map<String, dynamic>)
          : null,
      embeddingDataDeliveryEnabled:
          json['embeddingDataDeliveryEnabled'] as bool?,
      imageDataDeliveryEnabled: json['imageDataDeliveryEnabled'] as bool?,
      s3Config: json['s3Config'] != null
          ? S3Config.fromJson(json['s3Config'] as Map<String, dynamic>)
          : null,
      textDataDeliveryEnabled: json['textDataDeliveryEnabled'] as bool?,
      videoDataDeliveryEnabled: json['videoDataDeliveryEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioDataDeliveryEnabled = this.audioDataDeliveryEnabled;
    final cloudWatchConfig = this.cloudWatchConfig;
    final embeddingDataDeliveryEnabled = this.embeddingDataDeliveryEnabled;
    final imageDataDeliveryEnabled = this.imageDataDeliveryEnabled;
    final s3Config = this.s3Config;
    final textDataDeliveryEnabled = this.textDataDeliveryEnabled;
    final videoDataDeliveryEnabled = this.videoDataDeliveryEnabled;
    return {
      if (audioDataDeliveryEnabled != null)
        'audioDataDeliveryEnabled': audioDataDeliveryEnabled,
      if (cloudWatchConfig != null) 'cloudWatchConfig': cloudWatchConfig,
      if (embeddingDataDeliveryEnabled != null)
        'embeddingDataDeliveryEnabled': embeddingDataDeliveryEnabled,
      if (imageDataDeliveryEnabled != null)
        'imageDataDeliveryEnabled': imageDataDeliveryEnabled,
      if (s3Config != null) 's3Config': s3Config,
      if (textDataDeliveryEnabled != null)
        'textDataDeliveryEnabled': textDataDeliveryEnabled,
      if (videoDataDeliveryEnabled != null)
        'videoDataDeliveryEnabled': videoDataDeliveryEnabled,
    };
  }
}

/// CloudWatch logging configuration.
///
/// @nodoc
class CloudWatchConfig {
  /// The log group name.
  final String logGroupName;

  /// The role Amazon Resource Name (ARN).
  final String roleArn;

  /// S3 configuration for delivering a large amount of data.
  final S3Config? largeDataDeliveryS3Config;

  CloudWatchConfig({
    required this.logGroupName,
    required this.roleArn,
    this.largeDataDeliveryS3Config,
  });

  factory CloudWatchConfig.fromJson(Map<String, dynamic> json) {
    return CloudWatchConfig(
      logGroupName: (json['logGroupName'] as String?) ?? '',
      roleArn: (json['roleArn'] as String?) ?? '',
      largeDataDeliveryS3Config: json['largeDataDeliveryS3Config'] != null
          ? S3Config.fromJson(
              json['largeDataDeliveryS3Config'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    final roleArn = this.roleArn;
    final largeDataDeliveryS3Config = this.largeDataDeliveryS3Config;
    return {
      'logGroupName': logGroupName,
      'roleArn': roleArn,
      if (largeDataDeliveryS3Config != null)
        'largeDataDeliveryS3Config': largeDataDeliveryS3Config,
    };
  }
}

/// S3 configuration for storing log data.
///
/// @nodoc
class S3Config {
  /// S3 bucket name.
  final String bucketName;

  /// S3 prefix.
  final String? keyPrefix;

  S3Config({
    required this.bucketName,
    this.keyPrefix,
  });

  factory S3Config.fromJson(Map<String, dynamic> json) {
    return S3Config(
      bucketName: (json['bucketName'] as String?) ?? '',
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final keyPrefix = this.keyPrefix;
    return {
      'bucketName': bucketName,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// Contains information about an inference profile.
///
/// @nodoc
class InferenceProfileSummary {
  /// The Amazon Resource Name (ARN) of the inference profile.
  final String inferenceProfileArn;

  /// The unique identifier of the inference profile.
  final String inferenceProfileId;

  /// The name of the inference profile.
  final String inferenceProfileName;

  /// A list of information about each model in the inference profile.
  final List<InferenceProfileModel> models;

  /// The status of the inference profile. <code>ACTIVE</code> means that the
  /// inference profile is ready to be used.
  final InferenceProfileStatus status;

  /// The type of the inference profile. The following types are possible:
  ///
  /// <ul>
  /// <li>
  /// <code>SYSTEM_DEFINED</code> – The inference profile is defined by Amazon
  /// Bedrock. You can route inference requests across regions with these
  /// inference profiles.
  /// </li>
  /// <li>
  /// <code>APPLICATION</code> – The inference profile was created by a user. This
  /// type of inference profile can track metrics and costs when invoking the
  /// model in it. The inference profile may route requests to one or multiple
  /// regions.
  /// </li>
  /// </ul>
  final InferenceProfileType type;

  /// The time at which the inference profile was created.
  final DateTime? createdAt;

  /// The description of the inference profile.
  final String? description;

  /// The time at which the inference profile was last updated.
  final DateTime? updatedAt;

  InferenceProfileSummary({
    required this.inferenceProfileArn,
    required this.inferenceProfileId,
    required this.inferenceProfileName,
    required this.models,
    required this.status,
    required this.type,
    this.createdAt,
    this.description,
    this.updatedAt,
  });

  factory InferenceProfileSummary.fromJson(Map<String, dynamic> json) {
    return InferenceProfileSummary(
      inferenceProfileArn: (json['inferenceProfileArn'] as String?) ?? '',
      inferenceProfileId: (json['inferenceProfileId'] as String?) ?? '',
      inferenceProfileName: (json['inferenceProfileName'] as String?) ?? '',
      models: ((json['models'] as List?) ?? const [])
          .nonNulls
          .map((e) => InferenceProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status:
          InferenceProfileStatus.fromString((json['status'] as String?) ?? ''),
      type: InferenceProfileType.fromString((json['type'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceProfileArn = this.inferenceProfileArn;
    final inferenceProfileId = this.inferenceProfileId;
    final inferenceProfileName = this.inferenceProfileName;
    final models = this.models;
    final status = this.status;
    final type = this.type;
    final createdAt = this.createdAt;
    final description = this.description;
    final updatedAt = this.updatedAt;
    return {
      'inferenceProfileArn': inferenceProfileArn,
      'inferenceProfileId': inferenceProfileId,
      'inferenceProfileName': inferenceProfileName,
      'models': models,
      'status': status.value,
      'type': type.value,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class InferenceProfileStatus {
  static const active = InferenceProfileStatus._('ACTIVE');

  final String value;

  const InferenceProfileStatus._(this.value);

  static const values = [active];

  static InferenceProfileStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InferenceProfileStatus._(value));

  @override
  bool operator ==(other) =>
      other is InferenceProfileStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class InferenceProfileType {
  static const systemDefined = InferenceProfileType._('SYSTEM_DEFINED');
  static const application = InferenceProfileType._('APPLICATION');

  final String value;

  const InferenceProfileType._(this.value);

  static const values = [systemDefined, application];

  static InferenceProfileType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InferenceProfileType._(value));

  @override
  bool operator ==(other) =>
      other is InferenceProfileType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about a model.
///
/// @nodoc
class InferenceProfileModel {
  /// The Amazon Resource Name (ARN) of the model.
  final String? modelArn;

  InferenceProfileModel({
    this.modelArn,
  });

  factory InferenceProfileModel.fromJson(Map<String, dynamic> json) {
    return InferenceProfileModel(
      modelArn: json['modelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    return {
      if (modelArn != null) 'modelArn': modelArn,
    };
  }
}

/// Contains information about the model or system-defined inference profile
/// that is the source for an inference profile..
///
/// @nodoc
class InferenceProfileModelSource {
  /// The ARN of the model or system-defined inference profile that is the source
  /// for the inference profile.
  final String? copyFrom;

  InferenceProfileModelSource({
    this.copyFrom,
  });

  Map<String, dynamic> toJson() {
    final copyFrom = this.copyFrom;
    return {
      if (copyFrom != null) 'copyFrom': copyFrom,
    };
  }
}

/// Contains details about a guardrail.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_ListGuardrails.html#API_ListGuardrails_ResponseSyntax">ListGuardrails
/// response body</a>
/// </li>
/// </ul>
///
/// @nodoc
class GuardrailSummary {
  /// The ARN of the guardrail.
  final String arn;

  /// The date and time at which the guardrail was created.
  final DateTime createdAt;

  /// The unique identifier of the guardrail.
  final String id;

  /// The name of the guardrail.
  final String name;

  /// The status of the guardrail.
  final GuardrailStatus status;

  /// The date and time at which the guardrail was last updated.
  final DateTime updatedAt;

  /// The version of the guardrail.
  final String version;

  /// Details about the system-defined guardrail profile that you're using with
  /// your guardrail, including the guardrail profile ID and Amazon Resource Name
  /// (ARN).
  final GuardrailCrossRegionDetails? crossRegionDetails;

  /// A description of the guardrail.
  final String? description;

  GuardrailSummary({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.name,
    required this.status,
    required this.updatedAt,
    required this.version,
    this.crossRegionDetails,
    this.description,
  });

  factory GuardrailSummary.fromJson(Map<String, dynamic> json) {
    return GuardrailSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      id: (json['id'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      status: GuardrailStatus.fromString((json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
      crossRegionDetails: json['crossRegionDetails'] != null
          ? GuardrailCrossRegionDetails.fromJson(
              json['crossRegionDetails'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final crossRegionDetails = this.crossRegionDetails;
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (crossRegionDetails != null) 'crossRegionDetails': crossRegionDetails,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class GuardrailStatus {
  static const creating = GuardrailStatus._('CREATING');
  static const updating = GuardrailStatus._('UPDATING');
  static const versioning = GuardrailStatus._('VERSIONING');
  static const ready = GuardrailStatus._('READY');
  static const failed = GuardrailStatus._('FAILED');
  static const deleting = GuardrailStatus._('DELETING');

  final String value;

  const GuardrailStatus._(this.value);

  static const values = [
    creating,
    updating,
    versioning,
    ready,
    failed,
    deleting
  ];

  static GuardrailStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailStatus._(value));

  @override
  bool operator ==(other) => other is GuardrailStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about the system-defined guardrail profile that you're
/// using with your guardrail for cross-Region inference.
///
/// For more information, see the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region.html">Amazon
/// Bedrock User Guide</a>.
///
/// @nodoc
class GuardrailCrossRegionDetails {
  /// The Amazon Resource Name (ARN) of the guardrail profile that you're using
  /// with your guardrail.
  final String? guardrailProfileArn;

  /// The ID of the guardrail profile that your guardrail is using. Profile
  /// availability depends on your current Amazon Web Services Region. For more
  /// information, see the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region-support.html">Amazon
  /// Bedrock User Guide</a>.
  final String? guardrailProfileId;

  GuardrailCrossRegionDetails({
    this.guardrailProfileArn,
    this.guardrailProfileId,
  });

  factory GuardrailCrossRegionDetails.fromJson(Map<String, dynamic> json) {
    return GuardrailCrossRegionDetails(
      guardrailProfileArn: json['guardrailProfileArn'] as String?,
      guardrailProfileId: json['guardrailProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final guardrailProfileArn = this.guardrailProfileArn;
    final guardrailProfileId = this.guardrailProfileId;
    return {
      if (guardrailProfileArn != null)
        'guardrailProfileArn': guardrailProfileArn,
      if (guardrailProfileId != null) 'guardrailProfileId': guardrailProfileId,
    };
  }
}

/// Contains details about topics that the guardrail should identify and deny.
///
/// @nodoc
class GuardrailTopicPolicyConfig {
  /// A list of policies related to topics that the guardrail should deny.
  final List<GuardrailTopicConfig> topicsConfig;

  /// The tier that your guardrail uses for denied topic filters.
  final GuardrailTopicsTierConfig? tierConfig;

  GuardrailTopicPolicyConfig({
    required this.topicsConfig,
    this.tierConfig,
  });

  Map<String, dynamic> toJson() {
    final topicsConfig = this.topicsConfig;
    final tierConfig = this.tierConfig;
    return {
      'topicsConfig': topicsConfig,
      if (tierConfig != null) 'tierConfig': tierConfig,
    };
  }
}

/// Contains details about how to handle harmful content.
///
/// @nodoc
class GuardrailContentPolicyConfig {
  /// Contains the type of the content filter and how strongly it should apply to
  /// prompts and model responses.
  final List<GuardrailContentFilterConfig> filtersConfig;

  /// The tier that your guardrail uses for content filters.
  final GuardrailContentFiltersTierConfig? tierConfig;

  GuardrailContentPolicyConfig({
    required this.filtersConfig,
    this.tierConfig,
  });

  Map<String, dynamic> toJson() {
    final filtersConfig = this.filtersConfig;
    final tierConfig = this.tierConfig;
    return {
      'filtersConfig': filtersConfig,
      if (tierConfig != null) 'tierConfig': tierConfig,
    };
  }
}

/// Contains details about the word policy to configured for the guardrail.
///
/// @nodoc
class GuardrailWordPolicyConfig {
  /// A list of managed words to configure for the guardrail.
  final List<GuardrailManagedWordsConfig>? managedWordListsConfig;

  /// A list of words to configure for the guardrail.
  final List<GuardrailWordConfig>? wordsConfig;

  GuardrailWordPolicyConfig({
    this.managedWordListsConfig,
    this.wordsConfig,
  });

  Map<String, dynamic> toJson() {
    final managedWordListsConfig = this.managedWordListsConfig;
    final wordsConfig = this.wordsConfig;
    return {
      if (managedWordListsConfig != null)
        'managedWordListsConfig': managedWordListsConfig,
      if (wordsConfig != null) 'wordsConfig': wordsConfig,
    };
  }
}

/// Contains details about PII entities and regular expressions to configure for
/// the guardrail.
///
/// @nodoc
class GuardrailSensitiveInformationPolicyConfig {
  /// A list of PII entities to configure to the guardrail.
  final List<GuardrailPiiEntityConfig>? piiEntitiesConfig;

  /// A list of regular expressions to configure to the guardrail.
  final List<GuardrailRegexConfig>? regexesConfig;

  GuardrailSensitiveInformationPolicyConfig({
    this.piiEntitiesConfig,
    this.regexesConfig,
  });

  Map<String, dynamic> toJson() {
    final piiEntitiesConfig = this.piiEntitiesConfig;
    final regexesConfig = this.regexesConfig;
    return {
      if (piiEntitiesConfig != null) 'piiEntitiesConfig': piiEntitiesConfig,
      if (regexesConfig != null) 'regexesConfig': regexesConfig,
    };
  }
}

/// The policy configuration details for the guardrails contextual grounding
/// policy.
///
/// @nodoc
class GuardrailContextualGroundingPolicyConfig {
  /// The filter configuration details for the guardrails contextual grounding
  /// policy.
  final List<GuardrailContextualGroundingFilterConfig> filtersConfig;

  GuardrailContextualGroundingPolicyConfig({
    required this.filtersConfig,
  });

  Map<String, dynamic> toJson() {
    final filtersConfig = this.filtersConfig;
    return {
      'filtersConfig': filtersConfig,
    };
  }
}

/// Configuration settings for integrating Automated Reasoning policies with
/// Amazon Bedrock Guardrails.
///
/// @nodoc
class GuardrailAutomatedReasoningPolicyConfig {
  /// The list of Automated Reasoning policy ARNs to include in the guardrail
  /// configuration.
  final List<String> policies;

  /// The confidence threshold for triggering guardrail actions based on Automated
  /// Reasoning policy violations.
  final double? confidenceThreshold;

  GuardrailAutomatedReasoningPolicyConfig({
    required this.policies,
    this.confidenceThreshold,
  });

  Map<String, dynamic> toJson() {
    final policies = this.policies;
    final confidenceThreshold = this.confidenceThreshold;
    return {
      'policies': policies,
      if (confidenceThreshold != null)
        'confidenceThreshold': _s.encodeJsonDouble(confidenceThreshold),
    };
  }
}

/// The system-defined guardrail profile that you're using with your guardrail.
/// Guardrail profiles define the destination Amazon Web Services Regions where
/// guardrail inference requests can be automatically routed. Using guardrail
/// profiles helps maintain guardrail performance and reliability when demand
/// increases.
///
/// For more information, see the <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region.html">Amazon
/// Bedrock User Guide</a>.
///
/// @nodoc
class GuardrailCrossRegionConfig {
  /// The ID or Amazon Resource Name (ARN) of the guardrail profile that your
  /// guardrail is using. Guardrail profile availability depends on your current
  /// Amazon Web Services Region. For more information, see the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region-support.html">Amazon
  /// Bedrock User Guide</a>.
  final String guardrailProfileIdentifier;

  GuardrailCrossRegionConfig({
    required this.guardrailProfileIdentifier,
  });

  Map<String, dynamic> toJson() {
    final guardrailProfileIdentifier = this.guardrailProfileIdentifier;
    return {
      'guardrailProfileIdentifier': guardrailProfileIdentifier,
    };
  }
}

/// The filter configuration details for the guardrails contextual grounding
/// filter.
///
/// @nodoc
class GuardrailContextualGroundingFilterConfig {
  /// The threshold details for the guardrails contextual grounding filter.
  final double threshold;

  /// The filter details for the guardrails contextual grounding filter.
  final GuardrailContextualGroundingFilterType type;

  /// Specifies the action to take when content fails the contextual grounding
  /// evaluation. Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailContextualGroundingAction? action;

  /// Specifies whether to enable contextual grounding evaluation. When disabled,
  /// you aren't charged for the evaluation. The evaluation doesn't appear in the
  /// response.
  final bool? enabled;

  GuardrailContextualGroundingFilterConfig({
    required this.threshold,
    required this.type,
    this.action,
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final threshold = this.threshold;
    final type = this.type;
    final action = this.action;
    final enabled = this.enabled;
    return {
      'threshold': _s.encodeJsonDouble(threshold),
      'type': type.value,
      if (action != null) 'action': action.value,
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// @nodoc
class GuardrailContextualGroundingFilterType {
  static const grounding =
      GuardrailContextualGroundingFilterType._('GROUNDING');
  static const relevance =
      GuardrailContextualGroundingFilterType._('RELEVANCE');

  final String value;

  const GuardrailContextualGroundingFilterType._(this.value);

  static const values = [grounding, relevance];

  static GuardrailContextualGroundingFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContextualGroundingFilterType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContextualGroundingFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GuardrailContextualGroundingAction {
  static const block = GuardrailContextualGroundingAction._('BLOCK');
  static const none = GuardrailContextualGroundingAction._('NONE');

  final String value;

  const GuardrailContextualGroundingAction._(this.value);

  static const values = [block, none];

  static GuardrailContextualGroundingAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContextualGroundingAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContextualGroundingAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The regular expression to configure for the guardrail.
///
/// @nodoc
class GuardrailRegexConfig {
  /// The guardrail action to configure when matching regular expression is
  /// detected.
  final GuardrailSensitiveInformationAction action;

  /// The name of the regular expression to configure for the guardrail.
  final String name;

  /// The regular expression pattern to configure for the guardrail.
  final String pattern;

  /// The description of the regular expression to configure for the guardrail.
  final String? description;

  /// Specifies the action to take when harmful content is detected in the input.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailSensitiveInformationAction? inputAction;

  /// Specifies whether to enable guardrail evaluation on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// Specifies the action to take when harmful content is detected in the output.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailSensitiveInformationAction? outputAction;

  /// Specifies whether to enable guardrail evaluation on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailRegexConfig({
    required this.action,
    required this.name,
    required this.pattern,
    this.description,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final pattern = this.pattern;
    final description = this.description;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'action': action.value,
      'name': name,
      'pattern': pattern,
      if (description != null) 'description': description,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// @nodoc
class GuardrailSensitiveInformationAction {
  static const block = GuardrailSensitiveInformationAction._('BLOCK');
  static const anonymize = GuardrailSensitiveInformationAction._('ANONYMIZE');
  static const none = GuardrailSensitiveInformationAction._('NONE');

  final String value;

  const GuardrailSensitiveInformationAction._(this.value);

  static const values = [block, anonymize, none];

  static GuardrailSensitiveInformationAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailSensitiveInformationAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailSensitiveInformationAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The PII entity to configure for the guardrail.
///
/// @nodoc
class GuardrailPiiEntityConfig {
  /// Configure guardrail action when the PII entity is detected.
  final GuardrailSensitiveInformationAction action;

  /// Configure guardrail type when the PII entity is detected.
  ///
  /// The following PIIs are used to block or mask sensitive information:
  ///
  /// <ul>
  /// <li>
  /// <b>General</b>
  ///
  /// <ul>
  /// <li>
  /// <b>ADDRESS</b>
  ///
  /// A physical address, such as "100 Main Street, Anytown, USA" or "Suite #12,
  /// Building 123". An address can include information such as the street,
  /// building, location, city, state, country, county, zip code, precinct, and
  /// neighborhood.
  /// </li>
  /// <li>
  /// <b>AGE</b>
  ///
  /// An individual's age, including the quantity and unit of time. For example,
  /// in the phrase "I am 40 years old," Guardrails recognizes "40 years" as an
  /// age.
  /// </li>
  /// <li>
  /// <b>NAME</b>
  ///
  /// An individual's name. This entity type does not include titles, such as Dr.,
  /// Mr., Mrs., or Miss. guardrails doesn't apply this entity type to names that
  /// are part of organizations or addresses. For example, guardrails recognizes
  /// the "John Doe Organization" as an organization, and it recognizes "Jane Doe
  /// Street" as an address.
  /// </li>
  /// <li>
  /// <b>EMAIL</b>
  ///
  /// An email address, such as <i>marymajor@email.com</i>.
  /// </li>
  /// <li>
  /// <b>PHONE</b>
  ///
  /// A phone number. This entity type also includes fax and pager numbers.
  /// </li>
  /// <li>
  /// <b>USERNAME</b>
  ///
  /// A user name that identifies an account, such as a login name, screen name,
  /// nick name, or handle.
  /// </li>
  /// <li>
  /// <b>PASSWORD</b>
  ///
  /// An alphanumeric string that is used as a password, such as
  /// "*<i>very20special#pass*</i>".
  /// </li>
  /// <li>
  /// <b>DRIVER_ID</b>
  ///
  /// The number assigned to a driver's license, which is an official document
  /// permitting an individual to operate one or more motorized vehicles on a
  /// public road. A driver's license number consists of alphanumeric characters.
  /// </li>
  /// <li>
  /// <b>LICENSE_PLATE</b>
  ///
  /// A license plate for a vehicle is issued by the state or country where the
  /// vehicle is registered. The format for passenger vehicles is typically five
  /// to eight digits, consisting of upper-case letters and numbers. The format
  /// varies depending on the location of the issuing state or country.
  /// </li>
  /// <li>
  /// <b>VEHICLE_IDENTIFICATION_NUMBER</b>
  ///
  /// A Vehicle Identification Number (VIN) uniquely identifies a vehicle. VIN
  /// content and format are defined in the <i>ISO 3779</i> specification. Each
  /// country has specific codes and formats for VINs.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Finance</b>
  ///
  /// <ul>
  /// <li>
  /// <b>CREDIT_DEBIT_CARD_CVV</b>
  ///
  /// A three-digit card verification code (CVV) that is present on VISA,
  /// MasterCard, and Discover credit and debit cards. For American Express credit
  /// or debit cards, the CVV is a four-digit numeric code.
  /// </li>
  /// <li>
  /// <b>CREDIT_DEBIT_CARD_EXPIRY</b>
  ///
  /// The expiration date for a credit or debit card. This number is usually four
  /// digits long and is often formatted as <i>month/year</i> or <i>MM/YY</i>.
  /// Guardrails recognizes expiration dates such as <i>01/21</i>, <i>01/2021</i>,
  /// and <i>Jan 2021</i>.
  /// </li>
  /// <li>
  /// <b>CREDIT_DEBIT_CARD_NUMBER</b>
  ///
  /// The number for a credit or debit card. These numbers can vary from 13 to 16
  /// digits in length. However, Amazon Comprehend also recognizes credit or debit
  /// card numbers when only the last four digits are present.
  /// </li>
  /// <li>
  /// <b>PIN</b>
  ///
  /// A four-digit personal identification number (PIN) with which you can access
  /// your bank account.
  /// </li>
  /// <li>
  /// <b>INTERNATIONAL_BANK_ACCOUNT_NUMBER</b>
  ///
  /// An International Bank Account Number has specific formats in each country.
  /// For more information, see <a
  /// href="https://www.iban.com/structure">www.iban.com/structure</a>.
  /// </li>
  /// <li>
  /// <b>SWIFT_CODE</b>
  ///
  /// A SWIFT code is a standard format of Bank Identifier Code (BIC) used to
  /// specify a particular bank or branch. Banks use these codes for money
  /// transfers such as international wire transfers.
  ///
  /// SWIFT codes consist of eight or 11 characters. The 11-digit codes refer to
  /// specific branches, while eight-digit codes (or 11-digit codes ending in
  /// 'XXX') refer to the head or primary office.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>IT</b>
  ///
  /// <ul>
  /// <li>
  /// <b>IP_ADDRESS</b>
  ///
  /// An IPv4 address, such as <i>198.51.100.0</i>.
  /// </li>
  /// <li>
  /// <b>MAC_ADDRESS</b>
  ///
  /// A <i>media access control</i> (MAC) address is a unique identifier assigned
  /// to a network interface controller (NIC).
  /// </li>
  /// <li>
  /// <b>URL</b>
  ///
  /// A web address, such as <i>www.example.com</i>.
  /// </li>
  /// <li>
  /// <b>AWS_ACCESS_KEY</b>
  ///
  /// A unique identifier that's associated with a secret access key; you use the
  /// access key ID and secret access key to sign programmatic Amazon Web Services
  /// requests cryptographically.
  /// </li>
  /// <li>
  /// <b>AWS_SECRET_KEY</b>
  ///
  /// A unique identifier that's associated with an access key. You use the access
  /// key ID and secret access key to sign programmatic Amazon Web Services
  /// requests cryptographically.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>USA specific</b>
  ///
  /// <ul>
  /// <li>
  /// <b>US_BANK_ACCOUNT_NUMBER</b>
  ///
  /// A US bank account number, which is typically 10 to 12 digits long.
  /// </li>
  /// <li>
  /// <b>US_BANK_ROUTING_NUMBER</b>
  ///
  /// A US bank account routing number. These are typically nine digits long,
  /// </li>
  /// <li>
  /// <b>US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER</b>
  ///
  /// A US Individual Taxpayer Identification Number (ITIN) is a nine-digit number
  /// that starts with a "9" and contain a "7" or "8" as the fourth digit. An ITIN
  /// can be formatted with a space or a dash after the third and forth digits.
  /// </li>
  /// <li>
  /// <b>US_PASSPORT_NUMBER</b>
  ///
  /// A US passport number. Passport numbers range from six to nine alphanumeric
  /// characters.
  /// </li>
  /// <li>
  /// <b>US_SOCIAL_SECURITY_NUMBER</b>
  ///
  /// A US Social Security Number (SSN) is a nine-digit number that is issued to
  /// US citizens, permanent residents, and temporary working residents.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Canada specific</b>
  ///
  /// <ul>
  /// <li>
  /// <b>CA_HEALTH_NUMBER</b>
  ///
  /// A Canadian Health Service Number is a 10-digit unique identifier, required
  /// for individuals to access healthcare benefits.
  /// </li>
  /// <li>
  /// <b>CA_SOCIAL_INSURANCE_NUMBER</b>
  ///
  /// A Canadian Social Insurance Number (SIN) is a nine-digit unique identifier,
  /// required for individuals to access government programs and benefits.
  ///
  /// The SIN is formatted as three groups of three digits, such as
  /// <i>123-456-789</i>. A SIN can be validated through a simple check-digit
  /// process called the <a
  /// href="https://www.wikipedia.org/wiki/Luhn_algorithm">Luhn algorithm</a>.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>UK Specific</b>
  ///
  /// <ul>
  /// <li>
  /// <b>UK_NATIONAL_HEALTH_SERVICE_NUMBER</b>
  ///
  /// A UK National Health Service Number is a 10-17 digit number, such as <i>485
  /// 777 3456</i>. The current system formats the 10-digit number with spaces
  /// after the third and sixth digits. The final digit is an error-detecting
  /// checksum.
  /// </li>
  /// <li>
  /// <b>UK_NATIONAL_INSURANCE_NUMBER</b>
  ///
  /// A UK National Insurance Number (NINO) provides individuals with access to
  /// National Insurance (social security) benefits. It is also used for some
  /// purposes in the UK tax system.
  ///
  /// The number is nine digits long and starts with two letters, followed by six
  /// numbers and one letter. A NINO can be formatted with a space or a dash after
  /// the two letters and after the second, forth, and sixth digits.
  /// </li>
  /// <li>
  /// <b>UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER</b>
  ///
  /// A UK Unique Taxpayer Reference (UTR) is a 10-digit number that identifies a
  /// taxpayer or a business.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <b>Custom</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Regex filter</b> - You can use a regular expressions to define patterns
  /// for a guardrail to recognize and act upon such as serial number, booking ID
  /// etc..
  /// </li>
  /// </ul> </li>
  /// </ul>
  final GuardrailPiiEntityType type;

  /// Specifies the action to take when harmful content is detected in the input.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>ANONYMIZE</code> – Mask the content and replace it with identifier
  /// tags.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailSensitiveInformationAction? inputAction;

  /// Specifies whether to enable guardrail evaluation on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// Specifies the action to take when harmful content is detected in the output.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>ANONYMIZE</code> – Mask the content and replace it with identifier
  /// tags.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailSensitiveInformationAction? outputAction;

  /// Specifies whether to enable guardrail evaluation on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailPiiEntityConfig({
    required this.action,
    required this.type,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final type = this.type;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'action': action.value,
      'type': type.value,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// @nodoc
class GuardrailPiiEntityType {
  static const address = GuardrailPiiEntityType._('ADDRESS');
  static const age = GuardrailPiiEntityType._('AGE');
  static const awsAccessKey = GuardrailPiiEntityType._('AWS_ACCESS_KEY');
  static const awsSecretKey = GuardrailPiiEntityType._('AWS_SECRET_KEY');
  static const caHealthNumber = GuardrailPiiEntityType._('CA_HEALTH_NUMBER');
  static const caSocialInsuranceNumber =
      GuardrailPiiEntityType._('CA_SOCIAL_INSURANCE_NUMBER');
  static const creditDebitCardCvv =
      GuardrailPiiEntityType._('CREDIT_DEBIT_CARD_CVV');
  static const creditDebitCardExpiry =
      GuardrailPiiEntityType._('CREDIT_DEBIT_CARD_EXPIRY');
  static const creditDebitCardNumber =
      GuardrailPiiEntityType._('CREDIT_DEBIT_CARD_NUMBER');
  static const driverId = GuardrailPiiEntityType._('DRIVER_ID');
  static const email = GuardrailPiiEntityType._('EMAIL');
  static const internationalBankAccountNumber =
      GuardrailPiiEntityType._('INTERNATIONAL_BANK_ACCOUNT_NUMBER');
  static const ipAddress = GuardrailPiiEntityType._('IP_ADDRESS');
  static const licensePlate = GuardrailPiiEntityType._('LICENSE_PLATE');
  static const macAddress = GuardrailPiiEntityType._('MAC_ADDRESS');
  static const name = GuardrailPiiEntityType._('NAME');
  static const password = GuardrailPiiEntityType._('PASSWORD');
  static const phone = GuardrailPiiEntityType._('PHONE');
  static const pin = GuardrailPiiEntityType._('PIN');
  static const swiftCode = GuardrailPiiEntityType._('SWIFT_CODE');
  static const ukNationalHealthServiceNumber =
      GuardrailPiiEntityType._('UK_NATIONAL_HEALTH_SERVICE_NUMBER');
  static const ukNationalInsuranceNumber =
      GuardrailPiiEntityType._('UK_NATIONAL_INSURANCE_NUMBER');
  static const ukUniqueTaxpayerReferenceNumber =
      GuardrailPiiEntityType._('UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER');
  static const url = GuardrailPiiEntityType._('URL');
  static const username = GuardrailPiiEntityType._('USERNAME');
  static const usBankAccountNumber =
      GuardrailPiiEntityType._('US_BANK_ACCOUNT_NUMBER');
  static const usBankRoutingNumber =
      GuardrailPiiEntityType._('US_BANK_ROUTING_NUMBER');
  static const usIndividualTaxIdentificationNumber =
      GuardrailPiiEntityType._('US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER');
  static const usPassportNumber =
      GuardrailPiiEntityType._('US_PASSPORT_NUMBER');
  static const usSocialSecurityNumber =
      GuardrailPiiEntityType._('US_SOCIAL_SECURITY_NUMBER');
  static const vehicleIdentificationNumber =
      GuardrailPiiEntityType._('VEHICLE_IDENTIFICATION_NUMBER');

  final String value;

  const GuardrailPiiEntityType._(this.value);

  static const values = [
    address,
    age,
    awsAccessKey,
    awsSecretKey,
    caHealthNumber,
    caSocialInsuranceNumber,
    creditDebitCardCvv,
    creditDebitCardExpiry,
    creditDebitCardNumber,
    driverId,
    email,
    internationalBankAccountNumber,
    ipAddress,
    licensePlate,
    macAddress,
    name,
    password,
    phone,
    pin,
    swiftCode,
    ukNationalHealthServiceNumber,
    ukNationalInsuranceNumber,
    ukUniqueTaxpayerReferenceNumber,
    url,
    username,
    usBankAccountNumber,
    usBankRoutingNumber,
    usIndividualTaxIdentificationNumber,
    usPassportNumber,
    usSocialSecurityNumber,
    vehicleIdentificationNumber
  ];

  static GuardrailPiiEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailPiiEntityType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailPiiEntityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The managed word list to configure for the guardrail.
///
/// @nodoc
class GuardrailManagedWordsConfig {
  /// The managed word type to configure for the guardrail.
  final GuardrailManagedWordsType type;

  /// Specifies the action to take when harmful content is detected in the input.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailWordAction? inputAction;

  /// Specifies whether to enable guardrail evaluation on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// Specifies the action to take when harmful content is detected in the output.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailWordAction? outputAction;

  /// Specifies whether to enable guardrail evaluation on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailManagedWordsConfig({
    required this.type,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'type': type.value,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// @nodoc
class GuardrailManagedWordsType {
  static const profanity = GuardrailManagedWordsType._('PROFANITY');

  final String value;

  const GuardrailManagedWordsType._(this.value);

  static const values = [profanity];

  static GuardrailManagedWordsType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailManagedWordsType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailManagedWordsType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GuardrailWordAction {
  static const block = GuardrailWordAction._('BLOCK');
  static const none = GuardrailWordAction._('NONE');

  final String value;

  const GuardrailWordAction._(this.value);

  static const values = [block, none];

  static GuardrailWordAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailWordAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailWordAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A word to configure for the guardrail.
///
/// @nodoc
class GuardrailWordConfig {
  /// Text of the word configured for the guardrail to block.
  final String text;

  /// Specifies the action to take when harmful content is detected in the input.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailWordAction? inputAction;

  /// Specifies whether to enable guardrail evaluation on the intput. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// Specifies the action to take when harmful content is detected in the output.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailWordAction? outputAction;

  /// Specifies whether to enable guardrail evaluation on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailWordConfig({
    required this.text,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'text': text,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// The tier that your guardrail uses for content filters. Consider using a tier
/// that balances performance, accuracy, and compatibility with your existing
/// generative AI workflows.
///
/// @nodoc
class GuardrailContentFiltersTierConfig {
  /// The tier that your guardrail uses for content filters. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>CLASSIC</code> tier – Provides established guardrails functionality
  /// supporting English, French, and Spanish languages.
  /// </li>
  /// <li>
  /// <code>STANDARD</code> tier – Provides a more robust solution than the
  /// <code>CLASSIC</code> tier and has more comprehensive language support. This
  /// tier requires that your guardrail use <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region.html">cross-Region
  /// inference</a>.
  /// </li>
  /// </ul>
  final GuardrailContentFiltersTierName tierName;

  GuardrailContentFiltersTierConfig({
    required this.tierName,
  });

  Map<String, dynamic> toJson() {
    final tierName = this.tierName;
    return {
      'tierName': tierName.value,
    };
  }
}

/// @nodoc
class GuardrailContentFiltersTierName {
  static const classic = GuardrailContentFiltersTierName._('CLASSIC');
  static const standard = GuardrailContentFiltersTierName._('STANDARD');

  final String value;

  const GuardrailContentFiltersTierName._(this.value);

  static const values = [classic, standard];

  static GuardrailContentFiltersTierName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentFiltersTierName._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentFiltersTierName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains filter strengths for harmful content. Guardrails support the
/// following content filters to detect and filter harmful user inputs and
/// FM-generated outputs.
///
/// <ul>
/// <li>
/// <b>Hate</b> – Describes language or a statement that discriminates,
/// criticizes, insults, denounces, or dehumanizes a person or group on the
/// basis of an identity (such as race, ethnicity, gender, religion, sexual
/// orientation, ability, and national origin).
/// </li>
/// <li>
/// <b>Insults</b> – Describes language or a statement that includes demeaning,
/// humiliating, mocking, insulting, or belittling language. This type of
/// language is also labeled as bullying.
/// </li>
/// <li>
/// <b>Sexual</b> – Describes language or a statement that indicates sexual
/// interest, activity, or arousal using direct or indirect references to body
/// parts, physical traits, or sex.
/// </li>
/// <li>
/// <b>Violence</b> – Describes language or a statement that includes
/// glorification of or threats to inflict physical pain, hurt, or injury toward
/// a person, group or thing.
/// </li>
/// </ul>
/// Content filtering depends on the confidence classification of user inputs
/// and FM responses across each of the four harmful categories. All input and
/// output statements are classified into one of four confidence levels (NONE,
/// LOW, MEDIUM, HIGH) for each harmful category. For example, if a statement is
/// classified as <i>Hate</i> with HIGH confidence, the likelihood of the
/// statement representing hateful content is high. A single statement can be
/// classified across multiple categories with varying confidence levels. For
/// example, a single statement can be classified as <i>Hate</i> with HIGH
/// confidence, <i>Insults</i> with LOW confidence, <i>Sexual</i> with NONE
/// confidence, and <i>Violence</i> with MEDIUM confidence.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-filters.html">Guardrails
/// content filters</a>.
///
/// @nodoc
class GuardrailContentFilterConfig {
  /// The strength of the content filter to apply to prompts. As you increase the
  /// filter strength, the likelihood of filtering harmful content increases and
  /// the probability of seeing harmful content in your application reduces.
  final GuardrailFilterStrength inputStrength;

  /// The strength of the content filter to apply to model responses. As you
  /// increase the filter strength, the likelihood of filtering harmful content
  /// increases and the probability of seeing harmful content in your application
  /// reduces.
  final GuardrailFilterStrength outputStrength;

  /// The harmful category that the content filter is applied to.
  final GuardrailContentFilterType type;

  /// Specifies the action to take when harmful content is detected. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailContentFilterAction? inputAction;

  /// Specifies whether to enable guardrail evaluation on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// The input modalities selected for the guardrail content filter
  /// configuration.
  final List<GuardrailModality>? inputModalities;

  /// Specifies the action to take when harmful content is detected in the output.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailContentFilterAction? outputAction;

  /// Specifies whether to enable guardrail evaluation on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  /// The output modalities selected for the guardrail content filter
  /// configuration.
  final List<GuardrailModality>? outputModalities;

  GuardrailContentFilterConfig({
    required this.inputStrength,
    required this.outputStrength,
    required this.type,
    this.inputAction,
    this.inputEnabled,
    this.inputModalities,
    this.outputAction,
    this.outputEnabled,
    this.outputModalities,
  });

  Map<String, dynamic> toJson() {
    final inputStrength = this.inputStrength;
    final outputStrength = this.outputStrength;
    final type = this.type;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final inputModalities = this.inputModalities;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    final outputModalities = this.outputModalities;
    return {
      'inputStrength': inputStrength.value,
      'outputStrength': outputStrength.value,
      'type': type.value,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (inputModalities != null)
        'inputModalities': inputModalities.map((e) => e.value).toList(),
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
      if (outputModalities != null)
        'outputModalities': outputModalities.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class GuardrailContentFilterType {
  static const sexual = GuardrailContentFilterType._('SEXUAL');
  static const violence = GuardrailContentFilterType._('VIOLENCE');
  static const hate = GuardrailContentFilterType._('HATE');
  static const insults = GuardrailContentFilterType._('INSULTS');
  static const misconduct = GuardrailContentFilterType._('MISCONDUCT');
  static const promptAttack = GuardrailContentFilterType._('PROMPT_ATTACK');

  final String value;

  const GuardrailContentFilterType._(this.value);

  static const values = [
    sexual,
    violence,
    hate,
    insults,
    misconduct,
    promptAttack
  ];

  static GuardrailContentFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentFilterType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GuardrailFilterStrength {
  static const none = GuardrailFilterStrength._('NONE');
  static const low = GuardrailFilterStrength._('LOW');
  static const medium = GuardrailFilterStrength._('MEDIUM');
  static const high = GuardrailFilterStrength._('HIGH');

  final String value;

  const GuardrailFilterStrength._(this.value);

  static const values = [none, low, medium, high];

  static GuardrailFilterStrength fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailFilterStrength._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailFilterStrength && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GuardrailContentFilterAction {
  static const block = GuardrailContentFilterAction._('BLOCK');
  static const none = GuardrailContentFilterAction._('NONE');

  final String value;

  const GuardrailContentFilterAction._(this.value);

  static const values = [block, none];

  static GuardrailContentFilterAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailContentFilterAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailContentFilterAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GuardrailModality {
  static const text = GuardrailModality._('TEXT');
  static const image = GuardrailModality._('IMAGE');

  final String value;

  const GuardrailModality._(this.value);

  static const values = [text, image];

  static GuardrailModality fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailModality._(value));

  @override
  bool operator ==(other) => other is GuardrailModality && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The tier that your guardrail uses for denied topic filters. Consider using a
/// tier that balances performance, accuracy, and compatibility with your
/// existing generative AI workflows.
///
/// @nodoc
class GuardrailTopicsTierConfig {
  /// The tier that your guardrail uses for denied topic filters. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <code>CLASSIC</code> tier – Provides established guardrails functionality
  /// supporting English, French, and Spanish languages.
  /// </li>
  /// <li>
  /// <code>STANDARD</code> tier – Provides a more robust solution than the
  /// <code>CLASSIC</code> tier and has more comprehensive language support. This
  /// tier requires that your guardrail use <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region.html">cross-Region
  /// inference</a>.
  /// </li>
  /// </ul>
  final GuardrailTopicsTierName tierName;

  GuardrailTopicsTierConfig({
    required this.tierName,
  });

  Map<String, dynamic> toJson() {
    final tierName = this.tierName;
    return {
      'tierName': tierName.value,
    };
  }
}

/// @nodoc
class GuardrailTopicsTierName {
  static const classic = GuardrailTopicsTierName._('CLASSIC');
  static const standard = GuardrailTopicsTierName._('STANDARD');

  final String value;

  const GuardrailTopicsTierName._(this.value);

  static const values = [classic, standard];

  static GuardrailTopicsTierName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailTopicsTierName._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailTopicsTierName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about topics for the guardrail to identify and deny.
///
/// @nodoc
class GuardrailTopicConfig {
  /// A definition of the topic to deny.
  final String definition;

  /// The name of the topic to deny.
  final String name;

  /// Specifies to deny the topic.
  final GuardrailTopicType type;

  /// A list of prompts, each of which is an example of a prompt that can be
  /// categorized as belonging to the topic.
  final List<String>? examples;

  /// Specifies the action to take when harmful content is detected in the input.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailTopicAction? inputAction;

  /// Specifies whether to enable guardrail evaluation on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// Specifies the action to take when harmful content is detected in the output.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailTopicAction? outputAction;

  /// Specifies whether to enable guardrail evaluation on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailTopicConfig({
    required this.definition,
    required this.name,
    required this.type,
    this.examples,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final name = this.name;
    final type = this.type;
    final examples = this.examples;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'definition': definition,
      'name': name,
      'type': type.value,
      if (examples != null) 'examples': examples,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// @nodoc
class GuardrailTopicType {
  static const deny = GuardrailTopicType._('DENY');

  final String value;

  const GuardrailTopicType._(this.value);

  static const values = [deny];

  static GuardrailTopicType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailTopicType._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailTopicType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class GuardrailTopicAction {
  static const block = GuardrailTopicAction._('BLOCK');
  static const none = GuardrailTopicAction._('NONE');

  final String value;

  const GuardrailTopicAction._(this.value);

  static const values = [block, none];

  static GuardrailTopicAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => GuardrailTopicAction._(value));

  @override
  bool operator ==(other) =>
      other is GuardrailTopicAction && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about topics that the guardrail should identify and deny.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetGuardrail.html#API_GetGuardrail_ResponseSyntax">GetGuardrail
/// response body</a>
/// </li>
/// </ul>
///
/// @nodoc
class GuardrailTopicPolicy {
  /// A list of policies related to topics that the guardrail should deny.
  final List<GuardrailTopic> topics;

  /// The tier that your guardrail uses for denied topic filters.
  final GuardrailTopicsTier? tier;

  GuardrailTopicPolicy({
    required this.topics,
    this.tier,
  });

  factory GuardrailTopicPolicy.fromJson(Map<String, dynamic> json) {
    return GuardrailTopicPolicy(
      topics: ((json['topics'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuardrailTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
      tier: json['tier'] != null
          ? GuardrailTopicsTier.fromJson(json['tier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final topics = this.topics;
    final tier = this.tier;
    return {
      'topics': topics,
      if (tier != null) 'tier': tier,
    };
  }
}

/// Contains details about how to handle harmful content.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetGuardrail.html#API_GetGuardrail_ResponseSyntax">GetGuardrail
/// response body</a>
/// </li>
/// </ul>
///
/// @nodoc
class GuardrailContentPolicy {
  /// Contains the type of the content filter and how strongly it should apply to
  /// prompts and model responses.
  final List<GuardrailContentFilter>? filters;

  /// The tier that your guardrail uses for content filters.
  final GuardrailContentFiltersTier? tier;

  GuardrailContentPolicy({
    this.filters,
    this.tier,
  });

  factory GuardrailContentPolicy.fromJson(Map<String, dynamic> json) {
    return GuardrailContentPolicy(
      filters: (json['filters'] as List?)
          ?.nonNulls
          .map(
              (e) => GuardrailContentFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      tier: json['tier'] != null
          ? GuardrailContentFiltersTier.fromJson(
              json['tier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final tier = this.tier;
    return {
      if (filters != null) 'filters': filters,
      if (tier != null) 'tier': tier,
    };
  }
}

/// Contains details about the word policy configured for the guardrail.
///
/// @nodoc
class GuardrailWordPolicy {
  /// A list of managed words configured for the guardrail.
  final List<GuardrailManagedWords>? managedWordLists;

  /// A list of words configured for the guardrail.
  final List<GuardrailWord>? words;

  GuardrailWordPolicy({
    this.managedWordLists,
    this.words,
  });

  factory GuardrailWordPolicy.fromJson(Map<String, dynamic> json) {
    return GuardrailWordPolicy(
      managedWordLists: (json['managedWordLists'] as List?)
          ?.nonNulls
          .map((e) => GuardrailManagedWords.fromJson(e as Map<String, dynamic>))
          .toList(),
      words: (json['words'] as List?)
          ?.nonNulls
          .map((e) => GuardrailWord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final managedWordLists = this.managedWordLists;
    final words = this.words;
    return {
      if (managedWordLists != null) 'managedWordLists': managedWordLists,
      if (words != null) 'words': words,
    };
  }
}

/// Contains details about PII entities and regular expressions configured for
/// the guardrail.
///
/// @nodoc
class GuardrailSensitiveInformationPolicy {
  /// The list of PII entities configured for the guardrail.
  final List<GuardrailPiiEntity>? piiEntities;

  /// The list of regular expressions configured for the guardrail.
  final List<GuardrailRegex>? regexes;

  GuardrailSensitiveInformationPolicy({
    this.piiEntities,
    this.regexes,
  });

  factory GuardrailSensitiveInformationPolicy.fromJson(
      Map<String, dynamic> json) {
    return GuardrailSensitiveInformationPolicy(
      piiEntities: (json['piiEntities'] as List?)
          ?.nonNulls
          .map((e) => GuardrailPiiEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      regexes: (json['regexes'] as List?)
          ?.nonNulls
          .map((e) => GuardrailRegex.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final piiEntities = this.piiEntities;
    final regexes = this.regexes;
    return {
      if (piiEntities != null) 'piiEntities': piiEntities,
      if (regexes != null) 'regexes': regexes,
    };
  }
}

/// The details for the guardrails contextual grounding policy.
///
/// @nodoc
class GuardrailContextualGroundingPolicy {
  /// The filter details for the guardrails contextual grounding policy.
  final List<GuardrailContextualGroundingFilter> filters;

  GuardrailContextualGroundingPolicy({
    required this.filters,
  });

  factory GuardrailContextualGroundingPolicy.fromJson(
      Map<String, dynamic> json) {
    return GuardrailContextualGroundingPolicy(
      filters: ((json['filters'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuardrailContextualGroundingFilter.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      'filters': filters,
    };
  }
}

/// Represents the configuration of Automated Reasoning policies within a Amazon
/// Bedrock Guardrail, including the policies to apply and confidence
/// thresholds.
///
/// @nodoc
class GuardrailAutomatedReasoningPolicy {
  /// The list of Automated Reasoning policy ARNs that should be applied as part
  /// of this guardrail configuration.
  final List<String> policies;

  /// The minimum confidence level required for Automated Reasoning policy
  /// violations to trigger guardrail actions. Values range from 0.0 to 1.0.
  final double? confidenceThreshold;

  GuardrailAutomatedReasoningPolicy({
    required this.policies,
    this.confidenceThreshold,
  });

  factory GuardrailAutomatedReasoningPolicy.fromJson(
      Map<String, dynamic> json) {
    return GuardrailAutomatedReasoningPolicy(
      policies: ((json['policies'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      confidenceThreshold: _s.parseJsonDouble(json['confidenceThreshold']),
    );
  }

  Map<String, dynamic> toJson() {
    final policies = this.policies;
    final confidenceThreshold = this.confidenceThreshold;
    return {
      'policies': policies,
      if (confidenceThreshold != null)
        'confidenceThreshold': _s.encodeJsonDouble(confidenceThreshold),
    };
  }
}

/// The details for the guardrails contextual grounding filter.
///
/// @nodoc
class GuardrailContextualGroundingFilter {
  /// The threshold details for the guardrails contextual grounding filter.
  final double threshold;

  /// The filter type details for the guardrails contextual grounding filter.
  final GuardrailContextualGroundingFilterType type;

  /// The action to take when content fails the contextual grounding evaluation.
  /// Supported values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailContextualGroundingAction? action;

  /// Indicates whether contextual grounding is enabled for evaluation. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? enabled;

  GuardrailContextualGroundingFilter({
    required this.threshold,
    required this.type,
    this.action,
    this.enabled,
  });

  factory GuardrailContextualGroundingFilter.fromJson(
      Map<String, dynamic> json) {
    return GuardrailContextualGroundingFilter(
      threshold: _s.parseJsonDouble(json['threshold']) ?? 0,
      type: GuardrailContextualGroundingFilterType.fromString(
          (json['type'] as String?) ?? ''),
      action: (json['action'] as String?)
          ?.let(GuardrailContextualGroundingAction.fromString),
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final threshold = this.threshold;
    final type = this.type;
    final action = this.action;
    final enabled = this.enabled;
    return {
      'threshold': _s.encodeJsonDouble(threshold),
      'type': type.value,
      if (action != null) 'action': action.value,
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// The regular expression configured for the guardrail.
///
/// @nodoc
class GuardrailRegex {
  /// The action taken when a match to the regular expression is detected.
  final GuardrailSensitiveInformationAction action;

  /// The name of the regular expression for the guardrail.
  final String name;

  /// The pattern of the regular expression configured for the guardrail.
  final String pattern;

  /// The description of the regular expression for the guardrail.
  final String? description;

  /// The action to take when harmful content is detected in the input. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailSensitiveInformationAction? inputAction;

  /// Indicates whether guardrail evaluation is enabled on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// The action to take when harmful content is detected in the output. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailSensitiveInformationAction? outputAction;

  /// Indicates whether guardrail evaluation is enabled on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailRegex({
    required this.action,
    required this.name,
    required this.pattern,
    this.description,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  factory GuardrailRegex.fromJson(Map<String, dynamic> json) {
    return GuardrailRegex(
      action: GuardrailSensitiveInformationAction.fromString(
          (json['action'] as String?) ?? ''),
      name: (json['name'] as String?) ?? '',
      pattern: (json['pattern'] as String?) ?? '',
      description: json['description'] as String?,
      inputAction: (json['inputAction'] as String?)
          ?.let(GuardrailSensitiveInformationAction.fromString),
      inputEnabled: json['inputEnabled'] as bool?,
      outputAction: (json['outputAction'] as String?)
          ?.let(GuardrailSensitiveInformationAction.fromString),
      outputEnabled: json['outputEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final pattern = this.pattern;
    final description = this.description;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'action': action.value,
      'name': name,
      'pattern': pattern,
      if (description != null) 'description': description,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// The PII entity configured for the guardrail.
///
/// @nodoc
class GuardrailPiiEntity {
  /// The configured guardrail action when PII entity is detected.
  final GuardrailSensitiveInformationAction action;

  /// The type of PII entity. For example, Social Security Number.
  final GuardrailPiiEntityType type;

  /// The action to take when harmful content is detected in the input. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>ANONYMIZE</code> – Mask the content and replace it with identifier
  /// tags.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailSensitiveInformationAction? inputAction;

  /// Indicates whether guardrail evaluation is enabled on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// The action to take when harmful content is detected in the output. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>ANONYMIZE</code> – Mask the content and replace it with identifier
  /// tags.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailSensitiveInformationAction? outputAction;

  /// Indicates whether guardrail evaluation is enabled on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailPiiEntity({
    required this.action,
    required this.type,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  factory GuardrailPiiEntity.fromJson(Map<String, dynamic> json) {
    return GuardrailPiiEntity(
      action: GuardrailSensitiveInformationAction.fromString(
          (json['action'] as String?) ?? ''),
      type: GuardrailPiiEntityType.fromString((json['type'] as String?) ?? ''),
      inputAction: (json['inputAction'] as String?)
          ?.let(GuardrailSensitiveInformationAction.fromString),
      inputEnabled: json['inputEnabled'] as bool?,
      outputAction: (json['outputAction'] as String?)
          ?.let(GuardrailSensitiveInformationAction.fromString),
      outputEnabled: json['outputEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final type = this.type;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'action': action.value,
      'type': type.value,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// The managed word list that was configured for the guardrail. (This is a list
/// of words that are pre-defined and managed by guardrails only.)
///
/// @nodoc
class GuardrailManagedWords {
  /// ManagedWords$type The managed word type that was configured for the
  /// guardrail. (For now, we only offer profanity word list)
  final GuardrailManagedWordsType type;

  /// The action to take when harmful content is detected in the input. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailWordAction? inputAction;

  /// Indicates whether guardrail evaluation is enabled on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// The action to take when harmful content is detected in the output. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailWordAction? outputAction;

  /// Indicates whether guardrail evaluation is enabled on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailManagedWords({
    required this.type,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  factory GuardrailManagedWords.fromJson(Map<String, dynamic> json) {
    return GuardrailManagedWords(
      type:
          GuardrailManagedWordsType.fromString((json['type'] as String?) ?? ''),
      inputAction:
          (json['inputAction'] as String?)?.let(GuardrailWordAction.fromString),
      inputEnabled: json['inputEnabled'] as bool?,
      outputAction: (json['outputAction'] as String?)
          ?.let(GuardrailWordAction.fromString),
      outputEnabled: json['outputEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'type': type.value,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// A word configured for the guardrail.
///
/// @nodoc
class GuardrailWord {
  /// Text of the word configured for the guardrail to block.
  final String text;

  /// The action to take when harmful content is detected in the input. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailWordAction? inputAction;

  /// Indicates whether guardrail evaluation is enabled on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// The action to take when harmful content is detected in the output. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailWordAction? outputAction;

  /// Indicates whether guardrail evaluation is enabled on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  GuardrailWord({
    required this.text,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
  });

  factory GuardrailWord.fromJson(Map<String, dynamic> json) {
    return GuardrailWord(
      text: (json['text'] as String?) ?? '',
      inputAction:
          (json['inputAction'] as String?)?.let(GuardrailWordAction.fromString),
      inputEnabled: json['inputEnabled'] as bool?,
      outputAction: (json['outputAction'] as String?)
          ?.let(GuardrailWordAction.fromString),
      outputEnabled: json['outputEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    return {
      'text': text,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
    };
  }
}

/// The tier that your guardrail uses for content filters.
///
/// @nodoc
class GuardrailContentFiltersTier {
  /// The tier that your guardrail uses for content filters. Valid values include:
  ///
  /// <ul>
  /// <li>
  /// <code>CLASSIC</code> tier – Provides established guardrails functionality
  /// supporting English, French, and Spanish languages.
  /// </li>
  /// <li>
  /// <code>STANDARD</code> tier – Provides a more robust solution than the
  /// <code>CLASSIC</code> tier and has more comprehensive language support. This
  /// tier requires that your guardrail use <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region.html">cross-Region
  /// inference</a>.
  /// </li>
  /// </ul>
  final GuardrailContentFiltersTierName tierName;

  GuardrailContentFiltersTier({
    required this.tierName,
  });

  factory GuardrailContentFiltersTier.fromJson(Map<String, dynamic> json) {
    return GuardrailContentFiltersTier(
      tierName: GuardrailContentFiltersTierName.fromString(
          (json['tierName'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final tierName = this.tierName;
    return {
      'tierName': tierName.value,
    };
  }
}

/// Contains filter strengths for harmful content. Guardrails support the
/// following content filters to detect and filter harmful user inputs and
/// FM-generated outputs.
///
/// <ul>
/// <li>
/// <b>Hate</b> – Describes language or a statement that discriminates,
/// criticizes, insults, denounces, or dehumanizes a person or group on the
/// basis of an identity (such as race, ethnicity, gender, religion, sexual
/// orientation, ability, and national origin).
/// </li>
/// <li>
/// <b>Insults</b> – Describes language or a statement that includes demeaning,
/// humiliating, mocking, insulting, or belittling language. This type of
/// language is also labeled as bullying.
/// </li>
/// <li>
/// <b>Sexual</b> – Describes language or a statement that indicates sexual
/// interest, activity, or arousal using direct or indirect references to body
/// parts, physical traits, or sex.
/// </li>
/// <li>
/// <b>Violence</b> – Describes language or a statement that includes
/// glorification of or threats to inflict physical pain, hurt, or injury toward
/// a person, group or thing.
/// </li>
/// </ul>
/// Content filtering depends on the confidence classification of user inputs
/// and FM responses across each of the four harmful categories. All input and
/// output statements are classified into one of four confidence levels (NONE,
/// LOW, MEDIUM, HIGH) for each harmful category. For example, if a statement is
/// classified as <i>Hate</i> with HIGH confidence, the likelihood of the
/// statement representing hateful content is high. A single statement can be
/// classified across multiple categories with varying confidence levels. For
/// example, a single statement can be classified as <i>Hate</i> with HIGH
/// confidence, <i>Insults</i> with LOW confidence, <i>Sexual</i> with NONE
/// confidence, and <i>Violence</i> with MEDIUM confidence.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-filters.html">Guardrails
/// content filters</a>.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetGuardrail.html#API_GetGuardrail_ResponseSyntax">GetGuardrail
/// response body</a>
/// </li>
/// </ul>
///
/// @nodoc
class GuardrailContentFilter {
  /// The strength of the content filter to apply to prompts. As you increase the
  /// filter strength, the likelihood of filtering harmful content increases and
  /// the probability of seeing harmful content in your application reduces.
  final GuardrailFilterStrength inputStrength;

  /// The strength of the content filter to apply to model responses. As you
  /// increase the filter strength, the likelihood of filtering harmful content
  /// increases and the probability of seeing harmful content in your application
  /// reduces.
  final GuardrailFilterStrength outputStrength;

  /// The harmful category that the content filter is applied to.
  final GuardrailContentFilterType type;

  /// The action to take when harmful content is detected in the input. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailContentFilterAction? inputAction;

  /// Indicates whether guardrail evaluation is enabled on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// The input modalities selected for the guardrail content filter.
  final List<GuardrailModality>? inputModalities;

  /// The action to take when harmful content is detected in the output. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailContentFilterAction? outputAction;

  /// Indicates whether guardrail evaluation is enabled on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  /// The output modalities selected for the guardrail content filter.
  final List<GuardrailModality>? outputModalities;

  GuardrailContentFilter({
    required this.inputStrength,
    required this.outputStrength,
    required this.type,
    this.inputAction,
    this.inputEnabled,
    this.inputModalities,
    this.outputAction,
    this.outputEnabled,
    this.outputModalities,
  });

  factory GuardrailContentFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailContentFilter(
      inputStrength: GuardrailFilterStrength.fromString(
          (json['inputStrength'] as String?) ?? ''),
      outputStrength: GuardrailFilterStrength.fromString(
          (json['outputStrength'] as String?) ?? ''),
      type: GuardrailContentFilterType.fromString(
          (json['type'] as String?) ?? ''),
      inputAction: (json['inputAction'] as String?)
          ?.let(GuardrailContentFilterAction.fromString),
      inputEnabled: json['inputEnabled'] as bool?,
      inputModalities: (json['inputModalities'] as List?)
          ?.nonNulls
          .map((e) => GuardrailModality.fromString((e as String)))
          .toList(),
      outputAction: (json['outputAction'] as String?)
          ?.let(GuardrailContentFilterAction.fromString),
      outputEnabled: json['outputEnabled'] as bool?,
      outputModalities: (json['outputModalities'] as List?)
          ?.nonNulls
          .map((e) => GuardrailModality.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputStrength = this.inputStrength;
    final outputStrength = this.outputStrength;
    final type = this.type;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final inputModalities = this.inputModalities;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    final outputModalities = this.outputModalities;
    return {
      'inputStrength': inputStrength.value,
      'outputStrength': outputStrength.value,
      'type': type.value,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (inputModalities != null)
        'inputModalities': inputModalities.map((e) => e.value).toList(),
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
      if (outputModalities != null)
        'outputModalities': outputModalities.map((e) => e.value).toList(),
    };
  }
}

/// The tier that your guardrail uses for denied topic filters.
///
/// @nodoc
class GuardrailTopicsTier {
  /// The tier that your guardrail uses for denied topic filters. Valid values
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <code>CLASSIC</code> tier – Provides established guardrails functionality
  /// supporting English, French, and Spanish languages.
  /// </li>
  /// <li>
  /// <code>STANDARD</code> tier – Provides a more robust solution than the
  /// <code>CLASSIC</code> tier and has more comprehensive language support. This
  /// tier requires that your guardrail use <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-cross-region.html">cross-Region
  /// inference</a>.
  /// </li>
  /// </ul>
  final GuardrailTopicsTierName tierName;

  GuardrailTopicsTier({
    required this.tierName,
  });

  factory GuardrailTopicsTier.fromJson(Map<String, dynamic> json) {
    return GuardrailTopicsTier(
      tierName: GuardrailTopicsTierName.fromString(
          (json['tierName'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final tierName = this.tierName;
    return {
      'tierName': tierName.value,
    };
  }
}

/// Details about topics for the guardrail to identify and deny.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_GetGuardrail.html#API_GetGuardrail_ResponseSyntax">GetGuardrail
/// response body</a>
/// </li>
/// </ul>
///
/// @nodoc
class GuardrailTopic {
  /// A definition of the topic to deny.
  final String definition;

  /// The name of the topic to deny.
  final String name;

  /// A list of prompts, each of which is an example of a prompt that can be
  /// categorized as belonging to the topic.
  final List<String>? examples;

  /// The action to take when harmful content is detected in the input. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailTopicAction? inputAction;

  /// Indicates whether guardrail evaluation is enabled on the input. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? inputEnabled;

  /// The action to take when harmful content is detected in the output. Supported
  /// values include:
  ///
  /// <ul>
  /// <li>
  /// <code>BLOCK</code> – Block the content and replace it with blocked
  /// messaging.
  /// </li>
  /// <li>
  /// <code>NONE</code> – Take no action but return detection information in the
  /// trace response.
  /// </li>
  /// </ul>
  final GuardrailTopicAction? outputAction;

  /// Indicates whether guardrail evaluation is enabled on the output. When
  /// disabled, you aren't charged for the evaluation. The evaluation doesn't
  /// appear in the response.
  final bool? outputEnabled;

  /// Specifies to deny the topic.
  final GuardrailTopicType? type;

  GuardrailTopic({
    required this.definition,
    required this.name,
    this.examples,
    this.inputAction,
    this.inputEnabled,
    this.outputAction,
    this.outputEnabled,
    this.type,
  });

  factory GuardrailTopic.fromJson(Map<String, dynamic> json) {
    return GuardrailTopic(
      definition: (json['definition'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      examples: (json['examples'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      inputAction: (json['inputAction'] as String?)
          ?.let(GuardrailTopicAction.fromString),
      inputEnabled: json['inputEnabled'] as bool?,
      outputAction: (json['outputAction'] as String?)
          ?.let(GuardrailTopicAction.fromString),
      outputEnabled: json['outputEnabled'] as bool?,
      type: (json['type'] as String?)?.let(GuardrailTopicType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final name = this.name;
    final examples = this.examples;
    final inputAction = this.inputAction;
    final inputEnabled = this.inputEnabled;
    final outputAction = this.outputAction;
    final outputEnabled = this.outputEnabled;
    final type = this.type;
    return {
      'definition': definition,
      'name': name,
      if (examples != null) 'examples': examples,
      if (inputAction != null) 'inputAction': inputAction.value,
      if (inputEnabled != null) 'inputEnabled': inputEnabled,
      if (outputAction != null) 'outputAction': outputAction.value,
      if (outputEnabled != null) 'outputEnabled': outputEnabled,
      if (type != null) 'type': type.value,
    };
  }
}

/// Summary information of an evaluation job.
///
/// @nodoc
class EvaluationSummary {
  /// The time the evaluation job was created.
  final DateTime creationTime;

  /// The type of task for model evaluation.
  final List<EvaluationTaskType> evaluationTaskTypes;

  /// The Amazon Resource Name (ARN) of the evaluation job.
  final String jobArn;

  /// The name for the evaluation job.
  final String jobName;

  /// Specifies whether the evaluation job is automated or human-based.
  final EvaluationJobType jobType;

  /// The current status of the evaluation job.
  final EvaluationJobStatus status;

  /// Specifies whether the evaluation job is for evaluating a model or evaluating
  /// a knowledge base (retrieval and response generation).
  final ApplicationType? applicationType;

  /// The Amazon Resource Names (ARNs) of the models used to compute custom
  /// metrics in an Amazon Bedrock evaluation job.
  final List<String>? customMetricsEvaluatorModelIdentifiers;

  /// The Amazon Resource Names (ARNs) of the models used to compute the metrics
  /// for a knowledge base evaluation job.
  final List<String>? evaluatorModelIdentifiers;

  /// Identifies the models, Knowledge Bases, or other RAG sources evaluated in a
  /// model or Knowledge Base evaluation job.
  final EvaluationInferenceConfigSummary? inferenceConfigSummary;

  /// The Amazon Resource Names (ARNs) of the model(s) used for the evaluation
  /// job.
  final List<String>? modelIdentifiers;

  /// The Amazon Resource Names (ARNs) of the knowledge base resources used for a
  /// knowledge base evaluation job.
  final List<String>? ragIdentifiers;

  EvaluationSummary({
    required this.creationTime,
    required this.evaluationTaskTypes,
    required this.jobArn,
    required this.jobName,
    required this.jobType,
    required this.status,
    this.applicationType,
    this.customMetricsEvaluatorModelIdentifiers,
    this.evaluatorModelIdentifiers,
    this.inferenceConfigSummary,
    this.modelIdentifiers,
    this.ragIdentifiers,
  });

  factory EvaluationSummary.fromJson(Map<String, dynamic> json) {
    return EvaluationSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      evaluationTaskTypes: ((json['evaluationTaskTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => EvaluationTaskType.fromString((e as String)))
          .toList(),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      jobType: EvaluationJobType.fromString((json['jobType'] as String?) ?? ''),
      status: EvaluationJobStatus.fromString((json['status'] as String?) ?? ''),
      applicationType:
          (json['applicationType'] as String?)?.let(ApplicationType.fromString),
      customMetricsEvaluatorModelIdentifiers:
          (json['customMetricsEvaluatorModelIdentifiers'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      evaluatorModelIdentifiers: (json['evaluatorModelIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      inferenceConfigSummary: json['inferenceConfigSummary'] != null
          ? EvaluationInferenceConfigSummary.fromJson(
              json['inferenceConfigSummary'] as Map<String, dynamic>)
          : null,
      modelIdentifiers: (json['modelIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      ragIdentifiers: (json['ragIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final evaluationTaskTypes = this.evaluationTaskTypes;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final jobType = this.jobType;
    final status = this.status;
    final applicationType = this.applicationType;
    final customMetricsEvaluatorModelIdentifiers =
        this.customMetricsEvaluatorModelIdentifiers;
    final evaluatorModelIdentifiers = this.evaluatorModelIdentifiers;
    final inferenceConfigSummary = this.inferenceConfigSummary;
    final modelIdentifiers = this.modelIdentifiers;
    final ragIdentifiers = this.ragIdentifiers;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'evaluationTaskTypes': evaluationTaskTypes.map((e) => e.value).toList(),
      'jobArn': jobArn,
      'jobName': jobName,
      'jobType': jobType.value,
      'status': status.value,
      if (applicationType != null) 'applicationType': applicationType.value,
      if (customMetricsEvaluatorModelIdentifiers != null)
        'customMetricsEvaluatorModelIdentifiers':
            customMetricsEvaluatorModelIdentifiers,
      if (evaluatorModelIdentifiers != null)
        'evaluatorModelIdentifiers': evaluatorModelIdentifiers,
      if (inferenceConfigSummary != null)
        'inferenceConfigSummary': inferenceConfigSummary,
      if (modelIdentifiers != null) 'modelIdentifiers': modelIdentifiers,
      if (ragIdentifiers != null) 'ragIdentifiers': ragIdentifiers,
    };
  }
}

/// @nodoc
class EvaluationJobStatus {
  static const inProgress = EvaluationJobStatus._('InProgress');
  static const completed = EvaluationJobStatus._('Completed');
  static const failed = EvaluationJobStatus._('Failed');
  static const stopping = EvaluationJobStatus._('Stopping');
  static const stopped = EvaluationJobStatus._('Stopped');
  static const deleting = EvaluationJobStatus._('Deleting');

  final String value;

  const EvaluationJobStatus._(this.value);

  static const values = [
    inProgress,
    completed,
    failed,
    stopping,
    stopped,
    deleting
  ];

  static EvaluationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EvaluationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is EvaluationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EvaluationJobType {
  static const human = EvaluationJobType._('Human');
  static const automated = EvaluationJobType._('Automated');

  final String value;

  const EvaluationJobType._(this.value);

  static const values = [human, automated];

  static EvaluationJobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EvaluationJobType._(value));

  @override
  bool operator ==(other) => other is EvaluationJobType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Identifies the models, Knowledge Bases, or other RAG sources evaluated in a
/// model or Knowledge Base evaluation job.
///
/// @nodoc
class EvaluationInferenceConfigSummary {
  /// A summary of the models used in an Amazon Bedrock model evaluation job.
  /// These resources can be models in Amazon Bedrock or models outside of Amazon
  /// Bedrock that you use to generate your own inference response data.
  final EvaluationModelConfigSummary? modelConfigSummary;

  /// A summary of the RAG resources used in an Amazon Bedrock Knowledge Base
  /// evaluation job. These resources can be Knowledge Bases in Amazon Bedrock or
  /// RAG sources outside of Amazon Bedrock that you use to generate your own
  /// inference response data.
  final EvaluationRagConfigSummary? ragConfigSummary;

  EvaluationInferenceConfigSummary({
    this.modelConfigSummary,
    this.ragConfigSummary,
  });

  factory EvaluationInferenceConfigSummary.fromJson(Map<String, dynamic> json) {
    return EvaluationInferenceConfigSummary(
      modelConfigSummary: json['modelConfigSummary'] != null
          ? EvaluationModelConfigSummary.fromJson(
              json['modelConfigSummary'] as Map<String, dynamic>)
          : null,
      ragConfigSummary: json['ragConfigSummary'] != null
          ? EvaluationRagConfigSummary.fromJson(
              json['ragConfigSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelConfigSummary = this.modelConfigSummary;
    final ragConfigSummary = this.ragConfigSummary;
    return {
      if (modelConfigSummary != null) 'modelConfigSummary': modelConfigSummary,
      if (ragConfigSummary != null) 'ragConfigSummary': ragConfigSummary,
    };
  }
}

/// @nodoc
class ApplicationType {
  static const modelEvaluation = ApplicationType._('ModelEvaluation');
  static const ragEvaluation = ApplicationType._('RagEvaluation');

  final String value;

  const ApplicationType._(this.value);

  static const values = [modelEvaluation, ragEvaluation];

  static ApplicationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationType._(value));

  @override
  bool operator ==(other) => other is ApplicationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of the models used in an Amazon Bedrock model evaluation job.
/// These resources can be models in Amazon Bedrock or models outside of Amazon
/// Bedrock that you use to generate your own inference response data.
///
/// @nodoc
class EvaluationModelConfigSummary {
  /// The Amazon Resource Names (ARNs) of the models used for the evaluation job.
  final List<String>? bedrockModelIdentifiers;

  /// A label that identifies the models used for a model evaluation job where you
  /// provide your own inference response data.
  final List<String>? precomputedInferenceSourceIdentifiers;

  EvaluationModelConfigSummary({
    this.bedrockModelIdentifiers,
    this.precomputedInferenceSourceIdentifiers,
  });

  factory EvaluationModelConfigSummary.fromJson(Map<String, dynamic> json) {
    return EvaluationModelConfigSummary(
      bedrockModelIdentifiers: (json['bedrockModelIdentifiers'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      precomputedInferenceSourceIdentifiers:
          (json['precomputedInferenceSourceIdentifiers'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockModelIdentifiers = this.bedrockModelIdentifiers;
    final precomputedInferenceSourceIdentifiers =
        this.precomputedInferenceSourceIdentifiers;
    return {
      if (bedrockModelIdentifiers != null)
        'bedrockModelIdentifiers': bedrockModelIdentifiers,
      if (precomputedInferenceSourceIdentifiers != null)
        'precomputedInferenceSourceIdentifiers':
            precomputedInferenceSourceIdentifiers,
    };
  }
}

/// A summary of the RAG resources used in an Amazon Bedrock Knowledge Base
/// evaluation job. These resources can be Knowledge Bases in Amazon Bedrock or
/// RAG sources outside of Amazon Bedrock that you use to generate your own
/// inference response data.
///
/// @nodoc
class EvaluationRagConfigSummary {
  /// The Amazon Resource Names (ARNs) of the Knowledge Base resources used for a
  /// Knowledge Base evaluation job where Amazon Bedrock invokes the Knowledge
  /// Base for you.
  final List<String>? bedrockKnowledgeBaseIdentifiers;

  /// A label that identifies the RAG sources used for a Knowledge Base evaluation
  /// job where you provide your own inference response data.
  final List<String>? precomputedRagSourceIdentifiers;

  EvaluationRagConfigSummary({
    this.bedrockKnowledgeBaseIdentifiers,
    this.precomputedRagSourceIdentifiers,
  });

  factory EvaluationRagConfigSummary.fromJson(Map<String, dynamic> json) {
    return EvaluationRagConfigSummary(
      bedrockKnowledgeBaseIdentifiers:
          (json['bedrockKnowledgeBaseIdentifiers'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      precomputedRagSourceIdentifiers:
          (json['precomputedRagSourceIdentifiers'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockKnowledgeBaseIdentifiers =
        this.bedrockKnowledgeBaseIdentifiers;
    final precomputedRagSourceIdentifiers =
        this.precomputedRagSourceIdentifiers;
    return {
      if (bedrockKnowledgeBaseIdentifiers != null)
        'bedrockKnowledgeBaseIdentifiers': bedrockKnowledgeBaseIdentifiers,
      if (precomputedRagSourceIdentifiers != null)
        'precomputedRagSourceIdentifiers': precomputedRagSourceIdentifiers,
    };
  }
}

/// @nodoc
class EvaluationTaskType {
  static const summarization = EvaluationTaskType._('Summarization');
  static const classification = EvaluationTaskType._('Classification');
  static const questionAndAnswer = EvaluationTaskType._('QuestionAndAnswer');
  static const generation = EvaluationTaskType._('Generation');
  static const custom = EvaluationTaskType._('Custom');

  final String value;

  const EvaluationTaskType._(this.value);

  static const values = [
    summarization,
    classification,
    questionAndAnswer,
    generation,
    custom
  ];

  static EvaluationTaskType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EvaluationTaskType._(value));

  @override
  bool operator ==(other) =>
      other is EvaluationTaskType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration details of either an automated or human-based evaluation
/// job.
///
/// @nodoc
class EvaluationConfig {
  /// Contains the configuration details of an automated evaluation job that
  /// computes metrics.
  final AutomatedEvaluationConfig? automated;

  /// Contains the configuration details of an evaluation job that uses human
  /// workers.
  final HumanEvaluationConfig? human;

  EvaluationConfig({
    this.automated,
    this.human,
  });

  factory EvaluationConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationConfig(
      automated: json['automated'] != null
          ? AutomatedEvaluationConfig.fromJson(
              json['automated'] as Map<String, dynamic>)
          : null,
      human: json['human'] != null
          ? HumanEvaluationConfig.fromJson(
              json['human'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final automated = this.automated;
    final human = this.human;
    return {
      if (automated != null) 'automated': automated,
      if (human != null) 'human': human,
    };
  }
}

/// The configuration details of the inference model for an evaluation job.
///
/// For automated model evaluation jobs, only a single model is supported.
///
/// For human-based model evaluation jobs, your annotator can compare the
/// responses for up to two different models.
///
/// @nodoc
class EvaluationInferenceConfig {
  /// Specifies the inference models.
  final List<EvaluationModelConfig>? models;

  /// Contains the configuration details of the inference for a knowledge base
  /// evaluation job, including either the retrieval only configuration or the
  /// retrieval with response generation configuration.
  final List<RAGConfig>? ragConfigs;

  EvaluationInferenceConfig({
    this.models,
    this.ragConfigs,
  });

  factory EvaluationInferenceConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationInferenceConfig(
      models: (json['models'] as List?)
          ?.nonNulls
          .map((e) => EvaluationModelConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      ragConfigs: (json['ragConfigs'] as List?)
          ?.nonNulls
          .map((e) => RAGConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final models = this.models;
    final ragConfigs = this.ragConfigs;
    return {
      if (models != null) 'models': models,
      if (ragConfigs != null) 'ragConfigs': ragConfigs,
    };
  }
}

/// The Amazon S3 location where the results of your evaluation job are saved.
///
/// @nodoc
class EvaluationOutputDataConfig {
  /// The Amazon S3 URI where the results of the evaluation job are saved.
  final String s3Uri;

  EvaluationOutputDataConfig({
    required this.s3Uri,
  });

  factory EvaluationOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationOutputDataConfig(
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

/// Contains configuration details for retrieval of information and response
/// generation.
///
/// @nodoc
class RAGConfig {
  /// Contains configuration details for knowledge base retrieval and response
  /// generation.
  final KnowledgeBaseConfig? knowledgeBaseConfig;

  /// Contains configuration details about the RAG source used to generate
  /// inference response data for a Knowledge Base evaluation job.
  final EvaluationPrecomputedRagSourceConfig? precomputedRagSourceConfig;

  RAGConfig({
    this.knowledgeBaseConfig,
    this.precomputedRagSourceConfig,
  });

  factory RAGConfig.fromJson(Map<String, dynamic> json) {
    return RAGConfig(
      knowledgeBaseConfig: json['knowledgeBaseConfig'] != null
          ? KnowledgeBaseConfig.fromJson(
              json['knowledgeBaseConfig'] as Map<String, dynamic>)
          : null,
      precomputedRagSourceConfig: json['precomputedRagSourceConfig'] != null
          ? EvaluationPrecomputedRagSourceConfig.fromJson(
              json['precomputedRagSourceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseConfig = this.knowledgeBaseConfig;
    final precomputedRagSourceConfig = this.precomputedRagSourceConfig;
    return {
      if (knowledgeBaseConfig != null)
        'knowledgeBaseConfig': knowledgeBaseConfig,
      if (precomputedRagSourceConfig != null)
        'precomputedRagSourceConfig': precomputedRagSourceConfig,
    };
  }
}

/// The configuration details for retrieving information from a knowledge base
/// and generating responses.
///
/// @nodoc
class KnowledgeBaseConfig {
  /// Contains configuration details for retrieving information from a knowledge
  /// base and generating responses.
  final RetrieveAndGenerateConfiguration? retrieveAndGenerateConfig;

  /// Contains configuration details for retrieving information from a knowledge
  /// base.
  final RetrieveConfig? retrieveConfig;

  KnowledgeBaseConfig({
    this.retrieveAndGenerateConfig,
    this.retrieveConfig,
  });

  factory KnowledgeBaseConfig.fromJson(Map<String, dynamic> json) {
    return KnowledgeBaseConfig(
      retrieveAndGenerateConfig: json['retrieveAndGenerateConfig'] != null
          ? RetrieveAndGenerateConfiguration.fromJson(
              json['retrieveAndGenerateConfig'] as Map<String, dynamic>)
          : null,
      retrieveConfig: json['retrieveConfig'] != null
          ? RetrieveConfig.fromJson(
              json['retrieveConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final retrieveAndGenerateConfig = this.retrieveAndGenerateConfig;
    final retrieveConfig = this.retrieveConfig;
    return {
      if (retrieveAndGenerateConfig != null)
        'retrieveAndGenerateConfig': retrieveAndGenerateConfig,
      if (retrieveConfig != null) 'retrieveConfig': retrieveConfig,
    };
  }
}

/// A summary of a RAG source used for a Knowledge Base evaluation job where you
/// provide your own inference response data.
///
/// @nodoc
class EvaluationPrecomputedRagSourceConfig {
  /// A summary of a RAG source used for a retrieve-and-generate Knowledge Base
  /// evaluation job where you provide your own inference response data.
  final EvaluationPrecomputedRetrieveAndGenerateSourceConfig?
      retrieveAndGenerateSourceConfig;

  /// A summary of a RAG source used for a retrieve-only Knowledge Base evaluation
  /// job where you provide your own inference response data.
  final EvaluationPrecomputedRetrieveSourceConfig? retrieveSourceConfig;

  EvaluationPrecomputedRagSourceConfig({
    this.retrieveAndGenerateSourceConfig,
    this.retrieveSourceConfig,
  });

  factory EvaluationPrecomputedRagSourceConfig.fromJson(
      Map<String, dynamic> json) {
    return EvaluationPrecomputedRagSourceConfig(
      retrieveAndGenerateSourceConfig:
          json['retrieveAndGenerateSourceConfig'] != null
              ? EvaluationPrecomputedRetrieveAndGenerateSourceConfig.fromJson(
                  json['retrieveAndGenerateSourceConfig']
                      as Map<String, dynamic>)
              : null,
      retrieveSourceConfig: json['retrieveSourceConfig'] != null
          ? EvaluationPrecomputedRetrieveSourceConfig.fromJson(
              json['retrieveSourceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final retrieveAndGenerateSourceConfig =
        this.retrieveAndGenerateSourceConfig;
    final retrieveSourceConfig = this.retrieveSourceConfig;
    return {
      if (retrieveAndGenerateSourceConfig != null)
        'retrieveAndGenerateSourceConfig': retrieveAndGenerateSourceConfig,
      if (retrieveSourceConfig != null)
        'retrieveSourceConfig': retrieveSourceConfig,
    };
  }
}

/// A summary of a RAG source used for a retrieve-only Knowledge Base evaluation
/// job where you provide your own inference response data.
///
/// @nodoc
class EvaluationPrecomputedRetrieveSourceConfig {
  /// A label that identifies the RAG source used for a retrieve-only Knowledge
  /// Base evaluation job where you provide your own inference response data.
  final String ragSourceIdentifier;

  EvaluationPrecomputedRetrieveSourceConfig({
    required this.ragSourceIdentifier,
  });

  factory EvaluationPrecomputedRetrieveSourceConfig.fromJson(
      Map<String, dynamic> json) {
    return EvaluationPrecomputedRetrieveSourceConfig(
      ragSourceIdentifier: (json['ragSourceIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final ragSourceIdentifier = this.ragSourceIdentifier;
    return {
      'ragSourceIdentifier': ragSourceIdentifier,
    };
  }
}

/// A summary of a RAG source used for a retrieve-and-generate Knowledge Base
/// evaluation job where you provide your own inference response data.
///
/// @nodoc
class EvaluationPrecomputedRetrieveAndGenerateSourceConfig {
  /// A label that identifies the RAG source used for a retrieve-and-generate
  /// Knowledge Base evaluation job where you provide your own inference response
  /// data.
  final String ragSourceIdentifier;

  EvaluationPrecomputedRetrieveAndGenerateSourceConfig({
    required this.ragSourceIdentifier,
  });

  factory EvaluationPrecomputedRetrieveAndGenerateSourceConfig.fromJson(
      Map<String, dynamic> json) {
    return EvaluationPrecomputedRetrieveAndGenerateSourceConfig(
      ragSourceIdentifier: (json['ragSourceIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final ragSourceIdentifier = this.ragSourceIdentifier;
    return {
      'ragSourceIdentifier': ragSourceIdentifier,
    };
  }
}

/// The configuration details for retrieving information from a knowledge base.
///
/// @nodoc
class RetrieveConfig {
  /// The unique identifier of the knowledge base.
  final String knowledgeBaseId;

  /// Contains configuration details for knowledge base retrieval.
  final KnowledgeBaseRetrievalConfiguration knowledgeBaseRetrievalConfiguration;

  RetrieveConfig({
    required this.knowledgeBaseId,
    required this.knowledgeBaseRetrievalConfiguration,
  });

  factory RetrieveConfig.fromJson(Map<String, dynamic> json) {
    return RetrieveConfig(
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      knowledgeBaseRetrievalConfiguration:
          KnowledgeBaseRetrievalConfiguration.fromJson(
              (json['knowledgeBaseRetrievalConfiguration']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final knowledgeBaseRetrievalConfiguration =
        this.knowledgeBaseRetrievalConfiguration;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'knowledgeBaseRetrievalConfiguration':
          knowledgeBaseRetrievalConfiguration,
    };
  }
}

/// Contains configuration details for a knowledge base retrieval and response
/// generation.
///
/// @nodoc
class RetrieveAndGenerateConfiguration {
  /// The type of resource that contains your data for retrieving information and
  /// generating responses.
  ///
  /// If you choose to use <code>EXTERNAL_SOURCES</code>, then currently only
  /// Claude 3 Sonnet models for knowledge bases are supported.
  final RetrieveAndGenerateType type;

  /// The configuration for the external source wrapper object in the
  /// <code>retrieveAndGenerate</code> function.
  final ExternalSourcesRetrieveAndGenerateConfiguration?
      externalSourcesConfiguration;

  /// Contains configuration details for the knowledge base retrieval and response
  /// generation.
  final KnowledgeBaseRetrieveAndGenerateConfiguration?
      knowledgeBaseConfiguration;

  RetrieveAndGenerateConfiguration({
    required this.type,
    this.externalSourcesConfiguration,
    this.knowledgeBaseConfiguration,
  });

  factory RetrieveAndGenerateConfiguration.fromJson(Map<String, dynamic> json) {
    return RetrieveAndGenerateConfiguration(
      type: RetrieveAndGenerateType.fromString((json['type'] as String?) ?? ''),
      externalSourcesConfiguration: json['externalSourcesConfiguration'] != null
          ? ExternalSourcesRetrieveAndGenerateConfiguration.fromJson(
              json['externalSourcesConfiguration'] as Map<String, dynamic>)
          : null,
      knowledgeBaseConfiguration: json['knowledgeBaseConfiguration'] != null
          ? KnowledgeBaseRetrieveAndGenerateConfiguration.fromJson(
              json['knowledgeBaseConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final externalSourcesConfiguration = this.externalSourcesConfiguration;
    final knowledgeBaseConfiguration = this.knowledgeBaseConfiguration;
    return {
      'type': type.value,
      if (externalSourcesConfiguration != null)
        'externalSourcesConfiguration': externalSourcesConfiguration,
      if (knowledgeBaseConfiguration != null)
        'knowledgeBaseConfiguration': knowledgeBaseConfiguration,
    };
  }
}

/// @nodoc
class RetrieveAndGenerateType {
  static const knowledgeBase = RetrieveAndGenerateType._('KNOWLEDGE_BASE');
  static const externalSources = RetrieveAndGenerateType._('EXTERNAL_SOURCES');

  final String value;

  const RetrieveAndGenerateType._(this.value);

  static const values = [knowledgeBase, externalSources];

  static RetrieveAndGenerateType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RetrieveAndGenerateType._(value));

  @override
  bool operator ==(other) =>
      other is RetrieveAndGenerateType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configuration details for retrieving information from a knowledge
/// base and generating responses.
///
/// @nodoc
class KnowledgeBaseRetrieveAndGenerateConfiguration {
  /// The unique identifier of the knowledge base.
  final String knowledgeBaseId;

  /// The Amazon Resource Name (ARN) of the foundation model or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
  /// profile</a> used to generate responses.
  final String modelArn;

  /// Contains configurations details for response generation based on retrieved
  /// text chunks.
  final GenerationConfiguration? generationConfiguration;

  /// Contains configuration details for the model to process the prompt prior to
  /// retrieval and response generation.
  final OrchestrationConfiguration? orchestrationConfiguration;

  /// Contains configuration details for retrieving text chunks.
  final KnowledgeBaseRetrievalConfiguration? retrievalConfiguration;

  KnowledgeBaseRetrieveAndGenerateConfiguration({
    required this.knowledgeBaseId,
    required this.modelArn,
    this.generationConfiguration,
    this.orchestrationConfiguration,
    this.retrievalConfiguration,
  });

  factory KnowledgeBaseRetrieveAndGenerateConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KnowledgeBaseRetrieveAndGenerateConfiguration(
      knowledgeBaseId: (json['knowledgeBaseId'] as String?) ?? '',
      modelArn: (json['modelArn'] as String?) ?? '',
      generationConfiguration: json['generationConfiguration'] != null
          ? GenerationConfiguration.fromJson(
              json['generationConfiguration'] as Map<String, dynamic>)
          : null,
      orchestrationConfiguration: json['orchestrationConfiguration'] != null
          ? OrchestrationConfiguration.fromJson(
              json['orchestrationConfiguration'] as Map<String, dynamic>)
          : null,
      retrievalConfiguration: json['retrievalConfiguration'] != null
          ? KnowledgeBaseRetrievalConfiguration.fromJson(
              json['retrievalConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final knowledgeBaseId = this.knowledgeBaseId;
    final modelArn = this.modelArn;
    final generationConfiguration = this.generationConfiguration;
    final orchestrationConfiguration = this.orchestrationConfiguration;
    final retrievalConfiguration = this.retrievalConfiguration;
    return {
      'knowledgeBaseId': knowledgeBaseId,
      'modelArn': modelArn,
      if (generationConfiguration != null)
        'generationConfiguration': generationConfiguration,
      if (orchestrationConfiguration != null)
        'orchestrationConfiguration': orchestrationConfiguration,
      if (retrievalConfiguration != null)
        'retrievalConfiguration': retrievalConfiguration,
    };
  }
}

/// The configuration of the external source wrapper object in the
/// <code>retrieveAndGenerate</code> function.
///
/// @nodoc
class ExternalSourcesRetrieveAndGenerateConfiguration {
  /// The Amazon Resource Name (ARN) of the foundation model or <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
  /// profile</a> used to generate responses.
  final String modelArn;

  /// The document for the external source wrapper object in the
  /// <code>retrieveAndGenerate</code> function.
  final List<ExternalSource> sources;

  /// Contains configurations details for response generation based on retrieved
  /// text chunks.
  final ExternalSourcesGenerationConfiguration? generationConfiguration;

  ExternalSourcesRetrieveAndGenerateConfiguration({
    required this.modelArn,
    required this.sources,
    this.generationConfiguration,
  });

  factory ExternalSourcesRetrieveAndGenerateConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ExternalSourcesRetrieveAndGenerateConfiguration(
      modelArn: (json['modelArn'] as String?) ?? '',
      sources: ((json['sources'] as List?) ?? const [])
          .nonNulls
          .map((e) => ExternalSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      generationConfiguration: json['generationConfiguration'] != null
          ? ExternalSourcesGenerationConfiguration.fromJson(
              json['generationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final sources = this.sources;
    final generationConfiguration = this.generationConfiguration;
    return {
      'modelArn': modelArn,
      'sources': sources,
      if (generationConfiguration != null)
        'generationConfiguration': generationConfiguration,
    };
  }
}

/// The response generation configuration of the external source wrapper object.
///
/// @nodoc
class ExternalSourcesGenerationConfiguration {
  /// Additional model parameters and their corresponding values not included in
  /// the text inference configuration for an external source. Takes in custom
  /// model parameters specific to the language model being used.
  final Map<String, Object>? additionalModelRequestFields;

  /// Configuration details for the guardrail.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Configuration details for inference when using
  /// <code>RetrieveAndGenerate</code> to generate responses while using an
  /// external source.
  final KbInferenceConfig? kbInferenceConfig;

  /// Contains the template for the prompt for the external source wrapper object.
  final PromptTemplate? promptTemplate;

  ExternalSourcesGenerationConfiguration({
    this.additionalModelRequestFields,
    this.guardrailConfiguration,
    this.kbInferenceConfig,
    this.promptTemplate,
  });

  factory ExternalSourcesGenerationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ExternalSourcesGenerationConfiguration(
      additionalModelRequestFields:
          (json['additionalModelRequestFields'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as Object)),
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
      kbInferenceConfig: json['kbInferenceConfig'] != null
          ? KbInferenceConfig.fromJson(
              json['kbInferenceConfig'] as Map<String, dynamic>)
          : null,
      promptTemplate: json['promptTemplate'] != null
          ? PromptTemplate.fromJson(
              json['promptTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final guardrailConfiguration = this.guardrailConfiguration;
    final kbInferenceConfig = this.kbInferenceConfig;
    final promptTemplate = this.promptTemplate;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (kbInferenceConfig != null) 'kbInferenceConfig': kbInferenceConfig,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
    };
  }
}

/// The template for the prompt that's sent to the model for response
/// generation.
///
/// @nodoc
class PromptTemplate {
  /// The template for the prompt that's sent to the model for response
  /// generation. You can include prompt placeholders, which become replaced
  /// before the prompt is sent to the model to provide instructions and context
  /// to the model. In addition, you can include XML tags to delineate meaningful
  /// sections of the prompt template.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-test-config.html">Knowledge
  /// base prompt template</a> and <a
  /// href="https://docs.anthropic.com/en/docs/build-with-claude/prompt-engineering/use-xml-tags">Use
  /// XML tags with Anthropic Claude models</a>.
  final String? textPromptTemplate;

  PromptTemplate({
    this.textPromptTemplate,
  });

  factory PromptTemplate.fromJson(Map<String, dynamic> json) {
    return PromptTemplate(
      textPromptTemplate: json['textPromptTemplate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final textPromptTemplate = this.textPromptTemplate;
    return {
      if (textPromptTemplate != null) 'textPromptTemplate': textPromptTemplate,
    };
  }
}

/// The configuration details for the guardrail.
///
/// @nodoc
class GuardrailConfiguration {
  /// The unique identifier for the guardrail.
  final String guardrailId;

  /// The version of the guardrail.
  final String guardrailVersion;

  GuardrailConfiguration({
    required this.guardrailId,
    required this.guardrailVersion,
  });

  factory GuardrailConfiguration.fromJson(Map<String, dynamic> json) {
    return GuardrailConfiguration(
      guardrailId: (json['guardrailId'] as String?) ?? '',
      guardrailVersion: (json['guardrailVersion'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final guardrailId = this.guardrailId;
    final guardrailVersion = this.guardrailVersion;
    return {
      'guardrailId': guardrailId,
      'guardrailVersion': guardrailVersion,
    };
  }
}

/// Contains configuration details of the inference for knowledge base retrieval
/// and response generation.
///
/// @nodoc
class KbInferenceConfig {
  /// Contains configuration details for text generation using a language model
  /// via the <code>RetrieveAndGenerate</code> function.
  final TextInferenceConfig? textInferenceConfig;

  KbInferenceConfig({
    this.textInferenceConfig,
  });

  factory KbInferenceConfig.fromJson(Map<String, dynamic> json) {
    return KbInferenceConfig(
      textInferenceConfig: json['textInferenceConfig'] != null
          ? TextInferenceConfig.fromJson(
              json['textInferenceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final textInferenceConfig = this.textInferenceConfig;
    return {
      if (textInferenceConfig != null)
        'textInferenceConfig': textInferenceConfig,
    };
  }
}

/// The configuration details for text generation using a language model via the
/// <code>RetrieveAndGenerate</code> function.
///
/// @nodoc
class TextInferenceConfig {
  /// The maximum number of tokens to generate in the output text. Do not use the
  /// minimum of 0 or the maximum of 65536. The limit values described here are
  /// arbitrary values, for actual values consult the limits defined by your
  /// specific model.
  final int? maxTokens;

  /// A list of sequences of characters that, if generated, will cause the model
  /// to stop generating further tokens. Do not use a minimum length of 1 or a
  /// maximum length of 1000. The limit values described here are arbitrary
  /// values, for actual values consult the limits defined by your specific model.
  final List<String>? stopSequences;

  /// Controls the random-ness of text generated by the language model,
  /// influencing how much the model sticks to the most predictable next words
  /// versus exploring more surprising options. A lower temperature value (e.g.
  /// 0.2 or 0.3) makes model outputs more deterministic or predictable, while a
  /// higher temperature (e.g. 0.8 or 0.9) makes the outputs more creative or
  /// unpredictable.
  final double? temperature;

  /// A probability distribution threshold which controls what the model considers
  /// for the set of possible next tokens. The model will only consider the top p%
  /// of the probability distribution when generating the next token.
  final double? topP;

  TextInferenceConfig({
    this.maxTokens,
    this.stopSequences,
    this.temperature,
    this.topP,
  });

  factory TextInferenceConfig.fromJson(Map<String, dynamic> json) {
    return TextInferenceConfig(
      maxTokens: json['maxTokens'] as int?,
      stopSequences: (json['stopSequences'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      temperature: _s.parseJsonDouble(json['temperature']),
      topP: _s.parseJsonDouble(json['topP']),
    );
  }

  Map<String, dynamic> toJson() {
    final maxTokens = this.maxTokens;
    final stopSequences = this.stopSequences;
    final temperature = this.temperature;
    final topP = this.topP;
    return {
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (stopSequences != null) 'stopSequences': stopSequences,
      if (temperature != null) 'temperature': _s.encodeJsonDouble(temperature),
      if (topP != null) 'topP': _s.encodeJsonDouble(topP),
    };
  }
}

/// The unique external source of the content contained in the wrapper object.
///
/// @nodoc
class ExternalSource {
  /// The source type of the external source wrapper object.
  final ExternalSourceType sourceType;

  /// The identifier, content type, and data of the external source wrapper
  /// object.
  final ByteContentDoc? byteContent;

  /// The S3 location of the external source wrapper object.
  final S3ObjectDoc? s3Location;

  ExternalSource({
    required this.sourceType,
    this.byteContent,
    this.s3Location,
  });

  factory ExternalSource.fromJson(Map<String, dynamic> json) {
    return ExternalSource(
      sourceType:
          ExternalSourceType.fromString((json['sourceType'] as String?) ?? ''),
      byteContent: json['byteContent'] != null
          ? ByteContentDoc.fromJson(json['byteContent'] as Map<String, dynamic>)
          : null,
      s3Location: json['s3Location'] != null
          ? S3ObjectDoc.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceType = this.sourceType;
    final byteContent = this.byteContent;
    final s3Location = this.s3Location;
    return {
      'sourceType': sourceType.value,
      if (byteContent != null) 'byteContent': byteContent,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// @nodoc
class ExternalSourceType {
  static const s3 = ExternalSourceType._('S3');
  static const byteContent = ExternalSourceType._('BYTE_CONTENT');

  final String value;

  const ExternalSourceType._(this.value);

  static const values = [s3, byteContent];

  static ExternalSourceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExternalSourceType._(value));

  @override
  bool operator ==(other) =>
      other is ExternalSourceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The unique wrapper object of the document from the S3 location.
///
/// @nodoc
class S3ObjectDoc {
  /// The S3 URI location for the wrapper object of the document.
  final String uri;

  S3ObjectDoc({
    required this.uri,
  });

  factory S3ObjectDoc.fromJson(Map<String, dynamic> json) {
    return S3ObjectDoc(
      uri: (json['uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      'uri': uri,
    };
  }
}

/// Contains the document contained in the wrapper object, along with its
/// attributes/fields.
///
/// @nodoc
class ByteContentDoc {
  /// The MIME type of the document contained in the wrapper object.
  final String contentType;

  /// The byte value of the file to upload, encoded as a Base-64 string.
  final Uint8List data;

  /// The file name of the document contained in the wrapper object.
  final String identifier;

  ByteContentDoc({
    required this.contentType,
    required this.data,
    required this.identifier,
  });

  factory ByteContentDoc.fromJson(Map<String, dynamic> json) {
    return ByteContentDoc(
      contentType: (json['contentType'] as String?) ?? '',
      data: _s.decodeUint8List((json['data'] as String?) ?? ''),
      identifier: (json['identifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final data = this.data;
    final identifier = this.identifier;
    return {
      'contentType': contentType,
      'data': base64Encode(data),
      'identifier': identifier,
    };
  }
}

/// Contains configuration details for retrieving information from a knowledge
/// base.
///
/// @nodoc
class KnowledgeBaseRetrievalConfiguration {
  /// Contains configuration details for returning the results from the vector
  /// search.
  final KnowledgeBaseVectorSearchConfiguration vectorSearchConfiguration;

  KnowledgeBaseRetrievalConfiguration({
    required this.vectorSearchConfiguration,
  });

  factory KnowledgeBaseRetrievalConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KnowledgeBaseRetrievalConfiguration(
      vectorSearchConfiguration:
          KnowledgeBaseVectorSearchConfiguration.fromJson(
              (json['vectorSearchConfiguration'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final vectorSearchConfiguration = this.vectorSearchConfiguration;
    return {
      'vectorSearchConfiguration': vectorSearchConfiguration,
    };
  }
}

/// The configuration details for response generation based on retrieved text
/// chunks.
///
/// @nodoc
class GenerationConfiguration {
  /// Additional model parameters and corresponding values not included in the
  /// <code>textInferenceConfig</code> structure for a knowledge base. This allows
  /// you to provide custom model parameters specific to the language model being
  /// used.
  final Map<String, Object>? additionalModelRequestFields;

  /// Contains configuration details for the guardrail.
  final GuardrailConfiguration? guardrailConfiguration;

  /// Contains configuration details for inference for knowledge base retrieval
  /// and response generation.
  final KbInferenceConfig? kbInferenceConfig;

  /// Contains the template for the prompt that's sent to the model for response
  /// generation.
  final PromptTemplate? promptTemplate;

  GenerationConfiguration({
    this.additionalModelRequestFields,
    this.guardrailConfiguration,
    this.kbInferenceConfig,
    this.promptTemplate,
  });

  factory GenerationConfiguration.fromJson(Map<String, dynamic> json) {
    return GenerationConfiguration(
      additionalModelRequestFields:
          (json['additionalModelRequestFields'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as Object)),
      guardrailConfiguration: json['guardrailConfiguration'] != null
          ? GuardrailConfiguration.fromJson(
              json['guardrailConfiguration'] as Map<String, dynamic>)
          : null,
      kbInferenceConfig: json['kbInferenceConfig'] != null
          ? KbInferenceConfig.fromJson(
              json['kbInferenceConfig'] as Map<String, dynamic>)
          : null,
      promptTemplate: json['promptTemplate'] != null
          ? PromptTemplate.fromJson(
              json['promptTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final guardrailConfiguration = this.guardrailConfiguration;
    final kbInferenceConfig = this.kbInferenceConfig;
    final promptTemplate = this.promptTemplate;
    return {
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (guardrailConfiguration != null)
        'guardrailConfiguration': guardrailConfiguration,
      if (kbInferenceConfig != null) 'kbInferenceConfig': kbInferenceConfig,
      if (promptTemplate != null) 'promptTemplate': promptTemplate,
    };
  }
}

/// The configuration details for the model to process the prompt prior to
/// retrieval and response generation.
///
/// @nodoc
class OrchestrationConfiguration {
  /// Contains configuration details for transforming the prompt.
  final QueryTransformationConfiguration queryTransformationConfiguration;

  OrchestrationConfiguration({
    required this.queryTransformationConfiguration,
  });

  factory OrchestrationConfiguration.fromJson(Map<String, dynamic> json) {
    return OrchestrationConfiguration(
      queryTransformationConfiguration:
          QueryTransformationConfiguration.fromJson(
              (json['queryTransformationConfiguration']
                      as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final queryTransformationConfiguration =
        this.queryTransformationConfiguration;
    return {
      'queryTransformationConfiguration': queryTransformationConfiguration,
    };
  }
}

/// The configuration details for transforming the prompt.
///
/// @nodoc
class QueryTransformationConfiguration {
  /// The type of transformation to apply to the prompt.
  final QueryTransformationType type;

  QueryTransformationConfiguration({
    required this.type,
  });

  factory QueryTransformationConfiguration.fromJson(Map<String, dynamic> json) {
    return QueryTransformationConfiguration(
      type: QueryTransformationType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
    };
  }
}

/// @nodoc
class QueryTransformationType {
  static const queryDecomposition =
      QueryTransformationType._('QUERY_DECOMPOSITION');

  final String value;

  const QueryTransformationType._(this.value);

  static const values = [queryDecomposition];

  static QueryTransformationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => QueryTransformationType._(value));

  @override
  bool operator ==(other) =>
      other is QueryTransformationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration details for returning the results from the knowledge base
/// vector search.
///
/// @nodoc
class KnowledgeBaseVectorSearchConfiguration {
  /// Specifies the filters to use on the metadata fields in the knowledge base
  /// data sources before returning results.
  final RetrievalFilter? filter;

  /// Configuration for implicit filtering in Knowledge Base vector searches. This
  /// allows the system to automatically apply filters based on the query context
  /// without requiring explicit filter expressions.
  final ImplicitFilterConfiguration? implicitFilterConfiguration;

  /// The number of text chunks to retrieve; the number of results to return.
  final int? numberOfResults;

  /// By default, Amazon Bedrock decides a search strategy for you. If you're
  /// using an Amazon OpenSearch Serverless vector store that contains a
  /// filterable text field, you can specify whether to query the knowledge base
  /// with a <code>HYBRID</code> search using both vector embeddings and raw text,
  /// or <code>SEMANTIC</code> search using only vector embeddings. For other
  /// vector store configurations, only <code>SEMANTIC</code> search is available.
  final SearchType? overrideSearchType;

  /// Configuration for reranking search results in Knowledge Base vector
  /// searches. Reranking improves search relevance by reordering initial vector
  /// search results using more sophisticated relevance models.
  final VectorSearchRerankingConfiguration? rerankingConfiguration;

  KnowledgeBaseVectorSearchConfiguration({
    this.filter,
    this.implicitFilterConfiguration,
    this.numberOfResults,
    this.overrideSearchType,
    this.rerankingConfiguration,
  });

  factory KnowledgeBaseVectorSearchConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KnowledgeBaseVectorSearchConfiguration(
      filter: json['filter'] != null
          ? RetrievalFilter.fromJson(json['filter'] as Map<String, dynamic>)
          : null,
      implicitFilterConfiguration: json['implicitFilterConfiguration'] != null
          ? ImplicitFilterConfiguration.fromJson(
              json['implicitFilterConfiguration'] as Map<String, dynamic>)
          : null,
      numberOfResults: json['numberOfResults'] as int?,
      overrideSearchType:
          (json['overrideSearchType'] as String?)?.let(SearchType.fromString),
      rerankingConfiguration: json['rerankingConfiguration'] != null
          ? VectorSearchRerankingConfiguration.fromJson(
              json['rerankingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final implicitFilterConfiguration = this.implicitFilterConfiguration;
    final numberOfResults = this.numberOfResults;
    final overrideSearchType = this.overrideSearchType;
    final rerankingConfiguration = this.rerankingConfiguration;
    return {
      if (filter != null) 'filter': filter,
      if (implicitFilterConfiguration != null)
        'implicitFilterConfiguration': implicitFilterConfiguration,
      if (numberOfResults != null) 'numberOfResults': numberOfResults,
      if (overrideSearchType != null)
        'overrideSearchType': overrideSearchType.value,
      if (rerankingConfiguration != null)
        'rerankingConfiguration': rerankingConfiguration,
    };
  }
}

/// @nodoc
class SearchType {
  static const hybrid = SearchType._('HYBRID');
  static const semantic = SearchType._('SEMANTIC');

  final String value;

  const SearchType._(this.value);

  static const values = [hybrid, semantic];

  static SearchType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SearchType._(value));

  @override
  bool operator ==(other) => other is SearchType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the filters to use on the metadata attributes/fields in the
/// knowledge base data sources before returning results.
///
/// @nodoc
class RetrievalFilter {
  /// Knowledge base data sources are returned if their metadata attributes
  /// fulfill all the filter conditions inside this list.
  final List<RetrievalFilter>? andAll;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value matches the value in
  /// this object.
  ///
  /// The following example would return data sources with an animal attribute
  /// whose value is 'cat': <code>"equals": { "key": "animal", "value": "cat"
  /// }</code>
  final FilterAttribute? equals;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value is greater than the
  /// value in this object.
  ///
  /// The following example would return data sources with an year attribute whose
  /// value is greater than '1989': <code>"greaterThan": { "key": "year", "value":
  /// 1989 }</code>
  final FilterAttribute? greaterThan;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value is greater than or
  /// equal to the value in this object.
  ///
  /// The following example would return data sources with an year attribute whose
  /// value is greater than or equal to '1989': <code>"greaterThanOrEquals": {
  /// "key": "year", "value": 1989 }</code>
  final FilterAttribute? greaterThanOrEquals;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value is in the list
  /// specified in the value in this object.
  ///
  /// The following example would return data sources with an animal attribute
  /// that is either 'cat' or 'dog': <code>"in": { "key": "animal", "value":
  /// \["cat", "dog"\] }</code>
  final FilterAttribute? inValue;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value is less than the value
  /// in this object.
  ///
  /// The following example would return data sources with an year attribute whose
  /// value is less than to '1989': <code>"lessThan": { "key": "year", "value":
  /// 1989 }</code>
  final FilterAttribute? lessThan;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value is less than or equal
  /// to the value in this object.
  ///
  /// The following example would return data sources with an year attribute whose
  /// value is less than or equal to '1989': <code>"lessThanOrEquals": { "key":
  /// "year", "value": 1989 }</code>
  final FilterAttribute? lessThanOrEquals;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value is a list that contains
  /// the value as one of its members.
  ///
  /// The following example would return data sources with an animals attribute
  /// that is a list containing a cat member (for example, <code>\["dog",
  /// "cat"\]</code>): <code>"listContains": { "key": "animals", "value": "cat"
  /// }</code>
  final FilterAttribute? listContains;

  /// Knowledge base data sources that contain a metadata attribute whose name
  /// matches the key and whose value doesn't match the value in this object are
  /// returned.
  ///
  /// The following example would return data sources that don't contain an animal
  /// attribute whose value is 'cat': <code>"notEquals": { "key": "animal",
  /// "value": "cat" }</code>
  final FilterAttribute? notEquals;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value isn't in the list
  /// specified in the value in this object.
  ///
  /// The following example would return data sources whose animal attribute is
  /// neither 'cat' nor 'dog': <code>"notIn": { "key": "animal", "value": \["cat",
  /// "dog"\] }</code>
  final FilterAttribute? notIn;

  /// Knowledge base data sources are returned if their metadata attributes
  /// fulfill at least one of the filter conditions inside this list.
  final List<RetrievalFilter>? orAll;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value starts with the value
  /// in this object. This filter is currently only supported for Amazon
  /// OpenSearch Serverless vector stores.
  ///
  /// The following example would return data sources with an animal attribute
  /// starts with 'ca' (for example, 'cat' or 'camel'). <code>"startsWith": {
  /// "key": "animal", "value": "ca" }</code>
  final FilterAttribute? startsWith;

  /// Knowledge base data sources are returned if they contain a metadata
  /// attribute whose name matches the key and whose value is one of the
  /// following:
  ///
  /// A string that contains the value as a substring. The following example would
  /// return data sources with an animal attribute that contains the substring at
  /// (for example, 'cat'): <code>"stringContains": { "key": "animal", "value":
  /// "at" }</code>
  ///
  /// A list with a member that contains the value as a substring. The following
  /// example would return data sources with an animals attribute that is a list
  /// containing a member that contains the substring at (for example,
  /// <code>\["dog", "cat"\]</code>): <code>"stringContains": { "key": "animals",
  /// "value": "at" }</code>
  final FilterAttribute? stringContains;

  RetrievalFilter({
    this.andAll,
    this.equals,
    this.greaterThan,
    this.greaterThanOrEquals,
    this.inValue,
    this.lessThan,
    this.lessThanOrEquals,
    this.listContains,
    this.notEquals,
    this.notIn,
    this.orAll,
    this.startsWith,
    this.stringContains,
  });

  factory RetrievalFilter.fromJson(Map<String, dynamic> json) {
    return RetrievalFilter(
      andAll: (json['andAll'] as List?)
          ?.nonNulls
          .map((e) => RetrievalFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      equals: json['equals'] != null
          ? FilterAttribute.fromJson(json['equals'] as Map<String, dynamic>)
          : null,
      greaterThan: json['greaterThan'] != null
          ? FilterAttribute.fromJson(
              json['greaterThan'] as Map<String, dynamic>)
          : null,
      greaterThanOrEquals: json['greaterThanOrEquals'] != null
          ? FilterAttribute.fromJson(
              json['greaterThanOrEquals'] as Map<String, dynamic>)
          : null,
      inValue: json['in'] != null
          ? FilterAttribute.fromJson(json['in'] as Map<String, dynamic>)
          : null,
      lessThan: json['lessThan'] != null
          ? FilterAttribute.fromJson(json['lessThan'] as Map<String, dynamic>)
          : null,
      lessThanOrEquals: json['lessThanOrEquals'] != null
          ? FilterAttribute.fromJson(
              json['lessThanOrEquals'] as Map<String, dynamic>)
          : null,
      listContains: json['listContains'] != null
          ? FilterAttribute.fromJson(
              json['listContains'] as Map<String, dynamic>)
          : null,
      notEquals: json['notEquals'] != null
          ? FilterAttribute.fromJson(json['notEquals'] as Map<String, dynamic>)
          : null,
      notIn: json['notIn'] != null
          ? FilterAttribute.fromJson(json['notIn'] as Map<String, dynamic>)
          : null,
      orAll: (json['orAll'] as List?)
          ?.nonNulls
          .map((e) => RetrievalFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      startsWith: json['startsWith'] != null
          ? FilterAttribute.fromJson(json['startsWith'] as Map<String, dynamic>)
          : null,
      stringContains: json['stringContains'] != null
          ? FilterAttribute.fromJson(
              json['stringContains'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final andAll = this.andAll;
    final equals = this.equals;
    final greaterThan = this.greaterThan;
    final greaterThanOrEquals = this.greaterThanOrEquals;
    final inValue = this.inValue;
    final lessThan = this.lessThan;
    final lessThanOrEquals = this.lessThanOrEquals;
    final listContains = this.listContains;
    final notEquals = this.notEquals;
    final notIn = this.notIn;
    final orAll = this.orAll;
    final startsWith = this.startsWith;
    final stringContains = this.stringContains;
    return {
      if (andAll != null) 'andAll': andAll,
      if (equals != null) 'equals': equals,
      if (greaterThan != null) 'greaterThan': greaterThan,
      if (greaterThanOrEquals != null)
        'greaterThanOrEquals': greaterThanOrEquals,
      if (inValue != null) 'in': inValue,
      if (lessThan != null) 'lessThan': lessThan,
      if (lessThanOrEquals != null) 'lessThanOrEquals': lessThanOrEquals,
      if (listContains != null) 'listContains': listContains,
      if (notEquals != null) 'notEquals': notEquals,
      if (notIn != null) 'notIn': notIn,
      if (orAll != null) 'orAll': orAll,
      if (startsWith != null) 'startsWith': startsWith,
      if (stringContains != null) 'stringContains': stringContains,
    };
  }
}

/// Configuration for implicit filtering in Knowledge Base vector searches.
/// Implicit filtering allows you to automatically filter search results based
/// on metadata attributes without requiring explicit filter expressions in each
/// query.
///
/// @nodoc
class ImplicitFilterConfiguration {
  /// A list of metadata attribute schemas that define the structure and
  /// properties of metadata fields used for implicit filtering. Each attribute
  /// defines a key, type, and optional description.
  final List<MetadataAttributeSchema> metadataAttributes;

  /// The Amazon Resource Name (ARN) of the foundation model used for implicit
  /// filtering. This model processes the query to extract relevant filtering
  /// criteria.
  final String modelArn;

  ImplicitFilterConfiguration({
    required this.metadataAttributes,
    required this.modelArn,
  });

  factory ImplicitFilterConfiguration.fromJson(Map<String, dynamic> json) {
    return ImplicitFilterConfiguration(
      metadataAttributes: ((json['metadataAttributes'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              MetadataAttributeSchema.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelArn: (json['modelArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final metadataAttributes = this.metadataAttributes;
    final modelArn = this.modelArn;
    return {
      'metadataAttributes': metadataAttributes,
      'modelArn': modelArn,
    };
  }
}

/// Configuration for reranking vector search results to improve relevance.
/// Reranking applies additional relevance models to reorder the initial vector
/// search results based on more sophisticated criteria.
///
/// @nodoc
class VectorSearchRerankingConfiguration {
  /// The type of reranking to apply to vector search results. Currently, the only
  /// supported value is BEDROCK, which uses Amazon Bedrock foundation models for
  /// reranking.
  final VectorSearchRerankingConfigurationType type;

  /// Configuration for using Amazon Bedrock foundation models to rerank search
  /// results. This is required when the reranking type is set to BEDROCK.
  final VectorSearchBedrockRerankingConfiguration?
      bedrockRerankingConfiguration;

  VectorSearchRerankingConfiguration({
    required this.type,
    this.bedrockRerankingConfiguration,
  });

  factory VectorSearchRerankingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VectorSearchRerankingConfiguration(
      type: VectorSearchRerankingConfigurationType.fromString(
          (json['type'] as String?) ?? ''),
      bedrockRerankingConfiguration:
          json['bedrockRerankingConfiguration'] != null
              ? VectorSearchBedrockRerankingConfiguration.fromJson(
                  json['bedrockRerankingConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final bedrockRerankingConfiguration = this.bedrockRerankingConfiguration;
    return {
      'type': type.value,
      if (bedrockRerankingConfiguration != null)
        'bedrockRerankingConfiguration': bedrockRerankingConfiguration,
    };
  }
}

/// @nodoc
class VectorSearchRerankingConfigurationType {
  static const bedrockRerankingModel =
      VectorSearchRerankingConfigurationType._('BEDROCK_RERANKING_MODEL');

  final String value;

  const VectorSearchRerankingConfigurationType._(this.value);

  static const values = [bedrockRerankingModel];

  static VectorSearchRerankingConfigurationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VectorSearchRerankingConfigurationType._(value));

  @override
  bool operator ==(other) =>
      other is VectorSearchRerankingConfigurationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for using Amazon Bedrock foundation models to rerank Knowledge
/// Base vector search results. This enables more sophisticated relevance
/// ranking using large language models.
///
/// @nodoc
class VectorSearchBedrockRerankingConfiguration {
  /// Configuration for the Amazon Bedrock foundation model used for reranking.
  /// This includes the model ARN and any additional request fields required by
  /// the model.
  final VectorSearchBedrockRerankingModelConfiguration modelConfiguration;

  /// Configuration for how document metadata should be used during the reranking
  /// process. This determines which metadata fields are included when reordering
  /// search results.
  final MetadataConfigurationForReranking? metadataConfiguration;

  /// The maximum number of results to rerank. This limits how many of the initial
  /// vector search results will be processed by the reranking model. A smaller
  /// number improves performance but may exclude potentially relevant results.
  final int? numberOfRerankedResults;

  VectorSearchBedrockRerankingConfiguration({
    required this.modelConfiguration,
    this.metadataConfiguration,
    this.numberOfRerankedResults,
  });

  factory VectorSearchBedrockRerankingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VectorSearchBedrockRerankingConfiguration(
      modelConfiguration:
          VectorSearchBedrockRerankingModelConfiguration.fromJson(
              (json['modelConfiguration'] as Map<String, dynamic>?) ??
                  const <String, dynamic>{}),
      metadataConfiguration: json['metadataConfiguration'] != null
          ? MetadataConfigurationForReranking.fromJson(
              json['metadataConfiguration'] as Map<String, dynamic>)
          : null,
      numberOfRerankedResults: json['numberOfRerankedResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final modelConfiguration = this.modelConfiguration;
    final metadataConfiguration = this.metadataConfiguration;
    final numberOfRerankedResults = this.numberOfRerankedResults;
    return {
      'modelConfiguration': modelConfiguration,
      if (metadataConfiguration != null)
        'metadataConfiguration': metadataConfiguration,
      if (numberOfRerankedResults != null)
        'numberOfRerankedResults': numberOfRerankedResults,
    };
  }
}

/// Configuration for the Amazon Bedrock foundation model used for reranking
/// vector search results. This specifies which model to use and any additional
/// parameters required by the model.
///
/// @nodoc
class VectorSearchBedrockRerankingModelConfiguration {
  /// The Amazon Resource Name (ARN) of the foundation model to use for reranking.
  /// This model processes the query and search results to determine a more
  /// relevant ordering.
  final String modelArn;

  /// A list of additional fields to include in the model request during
  /// reranking. These fields provide extra context or configuration options
  /// specific to the selected foundation model.
  final Map<String, Object>? additionalModelRequestFields;

  VectorSearchBedrockRerankingModelConfiguration({
    required this.modelArn,
    this.additionalModelRequestFields,
  });

  factory VectorSearchBedrockRerankingModelConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VectorSearchBedrockRerankingModelConfiguration(
      modelArn: (json['modelArn'] as String?) ?? '',
      additionalModelRequestFields:
          (json['additionalModelRequestFields'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as Object)),
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final additionalModelRequestFields = this.additionalModelRequestFields;
    return {
      'modelArn': modelArn,
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
    };
  }
}

/// Configuration for how metadata should be used during the reranking process
/// in Knowledge Base vector searches. This determines which metadata fields are
/// included or excluded when reordering search results.
///
/// @nodoc
class MetadataConfigurationForReranking {
  /// The mode for selecting which metadata fields to include in the reranking
  /// process. Valid values are ALL (use all available metadata fields) or
  /// SELECTIVE (use only specified fields).
  final RerankingMetadataSelectionMode selectionMode;

  /// Configuration for selective mode, which allows you to explicitly include or
  /// exclude specific metadata fields during reranking. This is only used when
  /// selectionMode is set to SELECTIVE.
  final RerankingMetadataSelectiveModeConfiguration? selectiveModeConfiguration;

  MetadataConfigurationForReranking({
    required this.selectionMode,
    this.selectiveModeConfiguration,
  });

  factory MetadataConfigurationForReranking.fromJson(
      Map<String, dynamic> json) {
    return MetadataConfigurationForReranking(
      selectionMode: RerankingMetadataSelectionMode.fromString(
          (json['selectionMode'] as String?) ?? ''),
      selectiveModeConfiguration: json['selectiveModeConfiguration'] != null
          ? RerankingMetadataSelectiveModeConfiguration.fromJson(
              json['selectiveModeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final selectionMode = this.selectionMode;
    final selectiveModeConfiguration = this.selectiveModeConfiguration;
    return {
      'selectionMode': selectionMode.value,
      if (selectiveModeConfiguration != null)
        'selectiveModeConfiguration': selectiveModeConfiguration,
    };
  }
}

/// @nodoc
class RerankingMetadataSelectionMode {
  static const selective = RerankingMetadataSelectionMode._('SELECTIVE');
  static const all = RerankingMetadataSelectionMode._('ALL');

  final String value;

  const RerankingMetadataSelectionMode._(this.value);

  static const values = [selective, all];

  static RerankingMetadataSelectionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RerankingMetadataSelectionMode._(value));

  @override
  bool operator ==(other) =>
      other is RerankingMetadataSelectionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for selectively including or excluding metadata fields during
/// the reranking process. This allows you to control which metadata attributes
/// are considered when reordering search results.
///
/// @nodoc
class RerankingMetadataSelectiveModeConfiguration {
  /// A list of metadata field names to explicitly exclude from the reranking
  /// process. All metadata fields except these will be considered when reordering
  /// search results. This parameter cannot be used together with fieldsToInclude.
  final List<FieldForReranking>? fieldsToExclude;

  /// A list of metadata field names to explicitly include in the reranking
  /// process. Only these fields will be considered when reordering search
  /// results. This parameter cannot be used together with fieldsToExclude.
  final List<FieldForReranking>? fieldsToInclude;

  RerankingMetadataSelectiveModeConfiguration({
    this.fieldsToExclude,
    this.fieldsToInclude,
  });

  factory RerankingMetadataSelectiveModeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return RerankingMetadataSelectiveModeConfiguration(
      fieldsToExclude: (json['fieldsToExclude'] as List?)
          ?.nonNulls
          .map((e) => FieldForReranking.fromJson(e as Map<String, dynamic>))
          .toList(),
      fieldsToInclude: (json['fieldsToInclude'] as List?)
          ?.nonNulls
          .map((e) => FieldForReranking.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fieldsToExclude = this.fieldsToExclude;
    final fieldsToInclude = this.fieldsToInclude;
    return {
      if (fieldsToExclude != null) 'fieldsToExclude': fieldsToExclude,
      if (fieldsToInclude != null) 'fieldsToInclude': fieldsToInclude,
    };
  }
}

/// Specifies a field to be used during the reranking process in a Knowledge
/// Base vector search. This structure identifies metadata fields that should be
/// considered when reordering search results to improve relevance.
///
/// @nodoc
class FieldForReranking {
  /// The name of the metadata field to be used during the reranking process.
  final String fieldName;

  FieldForReranking({
    required this.fieldName,
  });

  factory FieldForReranking.fromJson(Map<String, dynamic> json) {
    return FieldForReranking(
      fieldName: (json['fieldName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final fieldName = this.fieldName;
    return {
      'fieldName': fieldName,
    };
  }
}

/// Defines the schema for a metadata attribute used in Knowledge Base vector
/// searches. Metadata attributes provide additional context for documents and
/// can be used for filtering and reranking search results.
///
/// @nodoc
class MetadataAttributeSchema {
  /// An optional description of the metadata attribute that provides additional
  /// context about its purpose and usage.
  final String description;

  /// The unique identifier for the metadata attribute. This key is used to
  /// reference the attribute in filter expressions and reranking configurations.
  final String key;

  /// The data type of the metadata attribute. The type determines how the
  /// attribute can be used in filter expressions and reranking.
  final AttributeType type;

  MetadataAttributeSchema({
    required this.description,
    required this.key,
    required this.type,
  });

  factory MetadataAttributeSchema.fromJson(Map<String, dynamic> json) {
    return MetadataAttributeSchema(
      description: (json['description'] as String?) ?? '',
      key: (json['key'] as String?) ?? '',
      type: AttributeType.fromString((json['type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final key = this.key;
    final type = this.type;
    return {
      'description': description,
      'key': key,
      'type': type.value,
    };
  }
}

/// @nodoc
class AttributeType {
  static const string = AttributeType._('STRING');
  static const number = AttributeType._('NUMBER');
  static const boolean = AttributeType._('BOOLEAN');
  static const stringList = AttributeType._('STRING_LIST');

  final String value;

  const AttributeType._(this.value);

  static const values = [string, number, boolean, stringList];

  static AttributeType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AttributeType._(value));

  @override
  bool operator ==(other) => other is AttributeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the name of the metadata attribute/field to apply filters. You
/// must match the name of the attribute/field in your data source/document
/// metadata.
///
/// @nodoc
class FilterAttribute {
  /// The name of metadata attribute/field, which must match the name in your data
  /// source/document metadata.
  final String key;

  /// The value of the metadata attribute/field.
  final Object value;

  FilterAttribute({
    required this.key,
    required this.value,
  });

  factory FilterAttribute.fromJson(Map<String, dynamic> json) {
    return FilterAttribute(
      key: (json['key'] as String?) ?? '',
      value: json['value'] as Object,
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

/// Defines the models used in the model evaluation job.
///
/// @nodoc
class EvaluationModelConfig {
  /// Defines the Amazon Bedrock model or inference profile and inference
  /// parameters you want used.
  final EvaluationBedrockModel? bedrockModel;

  /// Defines the model used to generate inference response data for a model
  /// evaluation job where you provide your own inference response data.
  final EvaluationPrecomputedInferenceSource? precomputedInferenceSource;

  EvaluationModelConfig({
    this.bedrockModel,
    this.precomputedInferenceSource,
  });

  factory EvaluationModelConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationModelConfig(
      bedrockModel: json['bedrockModel'] != null
          ? EvaluationBedrockModel.fromJson(
              json['bedrockModel'] as Map<String, dynamic>)
          : null,
      precomputedInferenceSource: json['precomputedInferenceSource'] != null
          ? EvaluationPrecomputedInferenceSource.fromJson(
              json['precomputedInferenceSource'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockModel = this.bedrockModel;
    final precomputedInferenceSource = this.precomputedInferenceSource;
    return {
      if (bedrockModel != null) 'bedrockModel': bedrockModel,
      if (precomputedInferenceSource != null)
        'precomputedInferenceSource': precomputedInferenceSource,
    };
  }
}

/// Contains the ARN of the Amazon Bedrock model or <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/cross-region-inference.html">inference
/// profile</a> specified in your evaluation job. Each Amazon Bedrock model
/// supports different <code>inferenceParams</code>. To learn more about
/// supported inference parameters for Amazon Bedrock models, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
/// parameters for foundation models</a>.
///
/// The <code>inferenceParams</code> are specified using JSON. To successfully
/// insert JSON as string make sure that all quotations are properly escaped.
/// For example, <code>"temperature":"0.25"</code> key value pair would need to
/// be formatted as <code>\"temperature\":\"0.25\"</code> to successfully
/// accepted in the request.
///
/// @nodoc
class EvaluationBedrockModel {
  /// The ARN of the Amazon Bedrock model or inference profile specified.
  final String modelIdentifier;

  /// Each Amazon Bedrock support different inference parameters that change how
  /// the model behaves during inference.
  final String? inferenceParams;

  /// Specifies performance settings for the model or inference profile.
  final PerformanceConfiguration? performanceConfig;

  EvaluationBedrockModel({
    required this.modelIdentifier,
    this.inferenceParams,
    this.performanceConfig,
  });

  factory EvaluationBedrockModel.fromJson(Map<String, dynamic> json) {
    return EvaluationBedrockModel(
      modelIdentifier: (json['modelIdentifier'] as String?) ?? '',
      inferenceParams: json['inferenceParams'] as String?,
      performanceConfig: json['performanceConfig'] != null
          ? PerformanceConfiguration.fromJson(
              json['performanceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelIdentifier = this.modelIdentifier;
    final inferenceParams = this.inferenceParams;
    final performanceConfig = this.performanceConfig;
    return {
      'modelIdentifier': modelIdentifier,
      if (inferenceParams != null) 'inferenceParams': inferenceParams,
      if (performanceConfig != null) 'performanceConfig': performanceConfig,
    };
  }
}

/// A summary of a model used for a model evaluation job where you provide your
/// own inference response data.
///
/// @nodoc
class EvaluationPrecomputedInferenceSource {
  /// A label that identifies a model used in a model evaluation job where you
  /// provide your own inference response data.
  final String inferenceSourceIdentifier;

  EvaluationPrecomputedInferenceSource({
    required this.inferenceSourceIdentifier,
  });

  factory EvaluationPrecomputedInferenceSource.fromJson(
      Map<String, dynamic> json) {
    return EvaluationPrecomputedInferenceSource(
      inferenceSourceIdentifier:
          (json['inferenceSourceIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceSourceIdentifier = this.inferenceSourceIdentifier;
    return {
      'inferenceSourceIdentifier': inferenceSourceIdentifier,
    };
  }
}

/// Contains performance settings for a model.
///
/// @nodoc
class PerformanceConfiguration {
  /// Specifies whether to use the latency-optimized or standard version of a
  /// model or inference profile.
  final PerformanceConfigLatency? latency;

  PerformanceConfiguration({
    this.latency,
  });

  factory PerformanceConfiguration.fromJson(Map<String, dynamic> json) {
    return PerformanceConfiguration(
      latency: (json['latency'] as String?)
          ?.let(PerformanceConfigLatency.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final latency = this.latency;
    return {
      if (latency != null) 'latency': latency.value,
    };
  }
}

/// @nodoc
class PerformanceConfigLatency {
  static const standard = PerformanceConfigLatency._('standard');
  static const optimized = PerformanceConfigLatency._('optimized');

  final String value;

  const PerformanceConfigLatency._(this.value);

  static const values = [standard, optimized];

  static PerformanceConfigLatency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PerformanceConfigLatency._(value));

  @override
  bool operator ==(other) =>
      other is PerformanceConfigLatency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration details of an automated evaluation job. The
/// <code>EvaluationDatasetMetricConfig</code> object is used to specify the
/// prompt datasets, task type, and metric names.
///
/// @nodoc
class AutomatedEvaluationConfig {
  /// Configuration details of the prompt datasets and metrics you want to use for
  /// your evaluation job.
  final List<EvaluationDatasetMetricConfig> datasetMetricConfigs;

  /// Defines the configuration of custom metrics to be used in an evaluation job.
  final AutomatedEvaluationCustomMetricConfig? customMetricConfig;

  /// Contains the evaluator model configuration details.
  /// <code>EvaluatorModelConfig</code> is required for evaluation jobs that use a
  /// knowledge base or in model evaluation job that use a model as judge. This
  /// model computes all evaluation related metrics.
  final EvaluatorModelConfig? evaluatorModelConfig;

  AutomatedEvaluationConfig({
    required this.datasetMetricConfigs,
    this.customMetricConfig,
    this.evaluatorModelConfig,
  });

  factory AutomatedEvaluationConfig.fromJson(Map<String, dynamic> json) {
    return AutomatedEvaluationConfig(
      datasetMetricConfigs: ((json['datasetMetricConfigs'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              EvaluationDatasetMetricConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      customMetricConfig: json['customMetricConfig'] != null
          ? AutomatedEvaluationCustomMetricConfig.fromJson(
              json['customMetricConfig'] as Map<String, dynamic>)
          : null,
      evaluatorModelConfig: json['evaluatorModelConfig'] != null
          ? EvaluatorModelConfig.fromJson(
              json['evaluatorModelConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetMetricConfigs = this.datasetMetricConfigs;
    final customMetricConfig = this.customMetricConfig;
    final evaluatorModelConfig = this.evaluatorModelConfig;
    return {
      'datasetMetricConfigs': datasetMetricConfigs,
      if (customMetricConfig != null) 'customMetricConfig': customMetricConfig,
      if (evaluatorModelConfig != null)
        'evaluatorModelConfig': evaluatorModelConfig,
    };
  }
}

/// Specifies the custom metrics, how tasks will be rated, the flow definition
/// ARN, and your custom prompt datasets. Model evaluation jobs use human
/// workers <i>only</i> support the use of custom prompt datasets. To learn more
/// about custom prompt datasets and the required format, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation-prompt-datasets-custom.html">Custom
/// prompt datasets</a>.
///
/// When you create custom metrics in <code>HumanEvaluationCustomMetric</code>
/// you must specify the metric's <code>name</code>. The list of
/// <code>names</code> specified in the <code>HumanEvaluationCustomMetric</code>
/// array, must match the <code>metricNames</code> array of strings specified in
/// <code>EvaluationDatasetMetricConfig</code>. For example, if in the
/// <code>HumanEvaluationCustomMetric</code> array your specified the names
/// <code>"accuracy", "toxicity", "readability"</code> as custom metrics
/// <i>then</i> the <code>metricNames</code> array would need to look like the
/// following <code>\["accuracy", "toxicity", "readability"\]</code> in
/// <code>EvaluationDatasetMetricConfig</code>.
///
/// @nodoc
class HumanEvaluationConfig {
  /// Use to specify the metrics, task, and prompt dataset to be used in your
  /// model evaluation job.
  final List<EvaluationDatasetMetricConfig> datasetMetricConfigs;

  /// A <code>HumanEvaluationCustomMetric</code> object. It contains the names the
  /// metrics, how the metrics are to be evaluated, an optional description.
  final List<HumanEvaluationCustomMetric>? customMetrics;

  /// The parameters of the human workflow.
  final HumanWorkflowConfig? humanWorkflowConfig;

  HumanEvaluationConfig({
    required this.datasetMetricConfigs,
    this.customMetrics,
    this.humanWorkflowConfig,
  });

  factory HumanEvaluationConfig.fromJson(Map<String, dynamic> json) {
    return HumanEvaluationConfig(
      datasetMetricConfigs: ((json['datasetMetricConfigs'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              EvaluationDatasetMetricConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      customMetrics: (json['customMetrics'] as List?)
          ?.nonNulls
          .map((e) =>
              HumanEvaluationCustomMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      humanWorkflowConfig: json['humanWorkflowConfig'] != null
          ? HumanWorkflowConfig.fromJson(
              json['humanWorkflowConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datasetMetricConfigs = this.datasetMetricConfigs;
    final customMetrics = this.customMetrics;
    final humanWorkflowConfig = this.humanWorkflowConfig;
    return {
      'datasetMetricConfigs': datasetMetricConfigs,
      if (customMetrics != null) 'customMetrics': customMetrics,
      if (humanWorkflowConfig != null)
        'humanWorkflowConfig': humanWorkflowConfig,
    };
  }
}

/// Contains <code>SageMakerFlowDefinition</code> object. The object is used to
/// specify the prompt dataset, task type, rating method and metric names.
///
/// @nodoc
class HumanWorkflowConfig {
  /// The Amazon Resource Number (ARN) for the flow definition
  final String flowDefinitionArn;

  /// Instructions for the flow definition
  final String? instructions;

  HumanWorkflowConfig({
    required this.flowDefinitionArn,
    this.instructions,
  });

  factory HumanWorkflowConfig.fromJson(Map<String, dynamic> json) {
    return HumanWorkflowConfig(
      flowDefinitionArn: (json['flowDefinitionArn'] as String?) ?? '',
      instructions: json['instructions'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowDefinitionArn = this.flowDefinitionArn;
    final instructions = this.instructions;
    return {
      'flowDefinitionArn': flowDefinitionArn,
      if (instructions != null) 'instructions': instructions,
    };
  }
}

/// Defines the prompt datasets, built-in metric names and custom metric names,
/// and the task type.
///
/// @nodoc
class EvaluationDatasetMetricConfig {
  /// Specifies the prompt dataset.
  final EvaluationDataset dataset;

  /// The names of the metrics you want to use for your evaluation job.
  ///
  /// For knowledge base evaluation jobs that evaluate retrieval only, valid
  /// values are "<code>Builtin.ContextRelevance</code>",
  /// "<code>Builtin.ContextCoverage</code>".
  ///
  /// For knowledge base evaluation jobs that evaluate retrieval with response
  /// generation, valid values are "<code>Builtin.Correctness</code>",
  /// "<code>Builtin.Completeness</code>", "<code>Builtin.Helpfulness</code>",
  /// "<code>Builtin.LogicalCoherence</code>",
  /// "<code>Builtin.Faithfulness</code>", "<code>Builtin.Harmfulness</code>",
  /// "<code>Builtin.Stereotyping</code>", "<code>Builtin.Refusal</code>".
  ///
  /// For automated model evaluation jobs, valid values are
  /// "<code>Builtin.Accuracy</code>", "<code>Builtin.Robustness</code>", and
  /// "<code>Builtin.Toxicity</code>". In model evaluation jobs that use a LLM as
  /// judge you can specify "<code>Builtin.Correctness</code>",
  /// "<code>Builtin.Completeness"</code>, "<code>Builtin.Faithfulness"</code>,
  /// "<code>Builtin.Helpfulness</code>", "<code>Builtin.Coherence</code>",
  /// "<code>Builtin.Relevance</code>",
  /// "<code>Builtin.FollowingInstructions</code>",
  /// "<code>Builtin.ProfessionalStyleAndTone</code>", You can also specify the
  /// following responsible AI related metrics only for model evaluation job that
  /// use a LLM as judge "<code>Builtin.Harmfulness</code>",
  /// "<code>Builtin.Stereotyping</code>", and "<code>Builtin.Refusal</code>".
  ///
  /// For human-based model evaluation jobs, the list of strings must match the
  /// <code>name</code> parameter specified in
  /// <code>HumanEvaluationCustomMetric</code>.
  final List<String> metricNames;

  /// The the type of task you want to evaluate for your evaluation job. This
  /// applies only to model evaluation jobs and is ignored for knowledge base
  /// evaluation jobs.
  final EvaluationTaskType taskType;

  EvaluationDatasetMetricConfig({
    required this.dataset,
    required this.metricNames,
    required this.taskType,
  });

  factory EvaluationDatasetMetricConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationDatasetMetricConfig(
      dataset: EvaluationDataset.fromJson(
          (json['dataset'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      metricNames: ((json['metricNames'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      taskType:
          EvaluationTaskType.fromString((json['taskType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    final metricNames = this.metricNames;
    final taskType = this.taskType;
    return {
      'dataset': dataset,
      'metricNames': metricNames,
      'taskType': taskType.value,
    };
  }
}

/// Used to specify the name of a built-in prompt dataset and optionally, the
/// Amazon S3 bucket where a custom prompt dataset is saved.
///
/// @nodoc
class EvaluationDataset {
  /// Used to specify supported built-in prompt datasets. Valid values are
  /// <code>Builtin.Bold</code>, <code>Builtin.BoolQ</code>,
  /// <code>Builtin.NaturalQuestions</code>, <code>Builtin.Gigaword</code>,
  /// <code>Builtin.RealToxicityPrompts</code>, <code>Builtin.TriviaQA</code>,
  /// <code>Builtin.T-Rex</code>,
  /// <code>Builtin.WomensEcommerceClothingReviews</code> and
  /// <code>Builtin.Wikitext2</code>.
  final String name;

  /// For custom prompt datasets, you must specify the location in Amazon S3 where
  /// the prompt dataset is saved.
  final EvaluationDatasetLocation? datasetLocation;

  EvaluationDataset({
    required this.name,
    this.datasetLocation,
  });

  factory EvaluationDataset.fromJson(Map<String, dynamic> json) {
    return EvaluationDataset(
      name: (json['name'] as String?) ?? '',
      datasetLocation: json['datasetLocation'] != null
          ? EvaluationDatasetLocation.fromJson(
              json['datasetLocation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final datasetLocation = this.datasetLocation;
    return {
      'name': name,
      if (datasetLocation != null) 'datasetLocation': datasetLocation,
    };
  }
}

/// The location in Amazon S3 where your prompt dataset is stored.
///
/// @nodoc
class EvaluationDatasetLocation {
  /// The S3 URI of the S3 bucket specified in the job.
  final String? s3Uri;

  EvaluationDatasetLocation({
    this.s3Uri,
  });

  factory EvaluationDatasetLocation.fromJson(Map<String, dynamic> json) {
    return EvaluationDatasetLocation(
      s3Uri: json['s3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      if (s3Uri != null) 's3Uri': s3Uri,
    };
  }
}

/// In a model evaluation job that uses human workers you must define the name
/// of the metric, and how you want that metric rated <code>ratingMethod</code>,
/// and an optional description of the metric.
///
/// @nodoc
class HumanEvaluationCustomMetric {
  /// The name of the metric. Your human evaluators will see this name in the
  /// evaluation UI.
  final String name;

  /// Choose how you want your human workers to evaluation your model. Valid
  /// values for rating methods are <code>ThumbsUpDown</code>,
  /// <code>IndividualLikertScale</code>,<code>ComparisonLikertScale</code>,
  /// <code>ComparisonChoice</code>, and <code>ComparisonRank</code>
  final String ratingMethod;

  /// An optional description of the metric. Use this parameter to provide more
  /// details about the metric.
  final String? description;

  HumanEvaluationCustomMetric({
    required this.name,
    required this.ratingMethod,
    this.description,
  });

  factory HumanEvaluationCustomMetric.fromJson(Map<String, dynamic> json) {
    return HumanEvaluationCustomMetric(
      name: (json['name'] as String?) ?? '',
      ratingMethod: (json['ratingMethod'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final ratingMethod = this.ratingMethod;
    final description = this.description;
    return {
      'name': name,
      'ratingMethod': ratingMethod,
      if (description != null) 'description': description,
    };
  }
}

/// Specifies the model configuration for the evaluator model.
/// <code>EvaluatorModelConfig</code> is required for evaluation jobs that use a
/// knowledge base or in model evaluation job that use a model as judge. This
/// model computes all evaluation related metrics.
///
/// @nodoc
class EvaluatorModelConfig {
  /// The evaluator model used in knowledge base evaluation job or in model
  /// evaluation job that use a model as judge. This model computes all evaluation
  /// related metrics.
  final List<BedrockEvaluatorModel>? bedrockEvaluatorModels;

  EvaluatorModelConfig({
    this.bedrockEvaluatorModels,
  });

  factory EvaluatorModelConfig.fromJson(Map<String, dynamic> json) {
    return EvaluatorModelConfig(
      bedrockEvaluatorModels: (json['bedrockEvaluatorModels'] as List?)
          ?.nonNulls
          .map((e) => BedrockEvaluatorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockEvaluatorModels = this.bedrockEvaluatorModels;
    return {
      if (bedrockEvaluatorModels != null)
        'bedrockEvaluatorModels': bedrockEvaluatorModels,
    };
  }
}

/// Defines the configuration of custom metrics to be used in an evaluation job.
/// To learn more about using custom metrics in Amazon Bedrock evaluation jobs,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation-custom-metrics-prompt-formats.html">Create
/// a prompt for a custom metrics (LLM-as-a-judge model evaluations)</a> and <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-evaluation-custom-metrics-prompt-formats.html">Create
/// a prompt for a custom metrics (RAG evaluations)</a>.
///
/// @nodoc
class AutomatedEvaluationCustomMetricConfig {
  /// Defines a list of custom metrics to be used in an Amazon Bedrock evaluation
  /// job.
  final List<AutomatedEvaluationCustomMetricSource> customMetrics;

  /// Configuration of the evaluator model you want to use to evaluate custom
  /// metrics in an Amazon Bedrock evaluation job.
  final CustomMetricEvaluatorModelConfig evaluatorModelConfig;

  AutomatedEvaluationCustomMetricConfig({
    required this.customMetrics,
    required this.evaluatorModelConfig,
  });

  factory AutomatedEvaluationCustomMetricConfig.fromJson(
      Map<String, dynamic> json) {
    return AutomatedEvaluationCustomMetricConfig(
      customMetrics: ((json['customMetrics'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedEvaluationCustomMetricSource.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      evaluatorModelConfig: CustomMetricEvaluatorModelConfig.fromJson(
          (json['evaluatorModelConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final customMetrics = this.customMetrics;
    final evaluatorModelConfig = this.evaluatorModelConfig;
    return {
      'customMetrics': customMetrics,
      'evaluatorModelConfig': evaluatorModelConfig,
    };
  }
}

/// Configuration of the evaluator model you want to use to evaluate custom
/// metrics in an Amazon Bedrock evaluation job.
///
/// @nodoc
class CustomMetricEvaluatorModelConfig {
  /// Defines the model you want to evaluate custom metrics in an Amazon Bedrock
  /// evaluation job.
  final List<CustomMetricBedrockEvaluatorModel> bedrockEvaluatorModels;

  CustomMetricEvaluatorModelConfig({
    required this.bedrockEvaluatorModels,
  });

  factory CustomMetricEvaluatorModelConfig.fromJson(Map<String, dynamic> json) {
    return CustomMetricEvaluatorModelConfig(
      bedrockEvaluatorModels:
          ((json['bedrockEvaluatorModels'] as List?) ?? const [])
              .nonNulls
              .map((e) => CustomMetricBedrockEvaluatorModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockEvaluatorModels = this.bedrockEvaluatorModels;
    return {
      'bedrockEvaluatorModels': bedrockEvaluatorModels,
    };
  }
}

/// Defines the model you want to evaluate custom metrics in an Amazon Bedrock
/// evaluation job.
///
/// @nodoc
class CustomMetricBedrockEvaluatorModel {
  /// The Amazon Resource Name (ARN) of the evaluator model for custom metrics.
  /// For a list of supported evaluator models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/evaluation-judge.html">Evaluate
  /// model performance using another LLM as a judge</a> and <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/evaluation-kb.html">Evaluate
  /// the performance of RAG sources using Amazon Bedrock evaluations</a>.
  final String modelIdentifier;

  CustomMetricBedrockEvaluatorModel({
    required this.modelIdentifier,
  });

  factory CustomMetricBedrockEvaluatorModel.fromJson(
      Map<String, dynamic> json) {
    return CustomMetricBedrockEvaluatorModel(
      modelIdentifier: (json['modelIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final modelIdentifier = this.modelIdentifier;
    return {
      'modelIdentifier': modelIdentifier,
    };
  }
}

/// An array item definining a single custom metric for use in an Amazon Bedrock
/// evaluation job.
///
/// @nodoc
class AutomatedEvaluationCustomMetricSource {
  /// The definition of a custom metric for use in an Amazon Bedrock evaluation
  /// job.
  final CustomMetricDefinition? customMetricDefinition;

  AutomatedEvaluationCustomMetricSource({
    this.customMetricDefinition,
  });

  factory AutomatedEvaluationCustomMetricSource.fromJson(
      Map<String, dynamic> json) {
    return AutomatedEvaluationCustomMetricSource(
      customMetricDefinition: json['customMetricDefinition'] != null
          ? CustomMetricDefinition.fromJson(
              json['customMetricDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customMetricDefinition = this.customMetricDefinition;
    return {
      if (customMetricDefinition != null)
        'customMetricDefinition': customMetricDefinition,
    };
  }
}

/// The definition of a custom metric for use in an Amazon Bedrock evaluation
/// job. A custom metric definition includes a metric name, prompt
/// (instructions) and optionally, a rating scale. Your prompt must include a
/// task description and input variables. The required input variables are
/// different for model-as-a-judge and RAG evaluations.
///
/// For more information about how to define a custom metric in Amazon Bedrock,
/// see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation-custom-metrics-prompt-formats.html">Create
/// a prompt for a custom metrics (LLM-as-a-judge model evaluations)</a> and <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/kb-evaluation-custom-metrics-prompt-formats.html">Create
/// a prompt for a custom metrics (RAG evaluations)</a>.
///
/// @nodoc
class CustomMetricDefinition {
  /// The prompt for a custom metric that instructs the evaluator model how to
  /// rate the model or RAG source under evaluation.
  final String instructions;

  /// The name for a custom metric. Names must be unique in your Amazon Web
  /// Services region.
  final String name;

  /// Defines the rating scale to be used for a custom metric. We recommend that
  /// you always define a ratings scale when creating a custom metric. If you
  /// don't define a scale, Amazon Bedrock won't be able to visually display the
  /// results of the evaluation in the console or calculate average values of
  /// numerical scores. For more information on specifying a rating scale, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation-custom-metrics-prompt-formats.html#model-evaluation-custom-metrics-prompt-formats-schema">Specifying
  /// an output schema (rating scale)</a>.
  final List<RatingScaleItem>? ratingScale;

  CustomMetricDefinition({
    required this.instructions,
    required this.name,
    this.ratingScale,
  });

  factory CustomMetricDefinition.fromJson(Map<String, dynamic> json) {
    return CustomMetricDefinition(
      instructions: (json['instructions'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      ratingScale: (json['ratingScale'] as List?)
          ?.nonNulls
          .map((e) => RatingScaleItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final instructions = this.instructions;
    final name = this.name;
    final ratingScale = this.ratingScale;
    return {
      'instructions': instructions,
      'name': name,
      if (ratingScale != null) 'ratingScale': ratingScale,
    };
  }
}

/// Defines the value and corresponding definition for one rating in a custom
/// metric rating scale.
///
/// @nodoc
class RatingScaleItem {
  /// Defines the definition for one rating in a custom metric rating scale.
  final String definition;

  /// Defines the value for one rating in a custom metric rating scale.
  final RatingScaleItemValue value;

  RatingScaleItem({
    required this.definition,
    required this.value,
  });

  factory RatingScaleItem.fromJson(Map<String, dynamic> json) {
    return RatingScaleItem(
      definition: (json['definition'] as String?) ?? '',
      value: RatingScaleItemValue.fromJson(
          (json['value'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final value = this.value;
    return {
      'definition': definition,
      'value': value,
    };
  }
}

/// Defines the value for one rating in a custom metric rating scale.
///
/// @nodoc
class RatingScaleItemValue {
  /// A floating point number representing the value for a rating in a custom
  /// metric rating scale.
  final double? floatValue;

  /// A string representing the value for a rating in a custom metric rating
  /// scale.
  final String? stringValue;

  RatingScaleItemValue({
    this.floatValue,
    this.stringValue,
  });

  factory RatingScaleItemValue.fromJson(Map<String, dynamic> json) {
    return RatingScaleItemValue(
      floatValue: _s.parseJsonDouble(json['floatValue']),
      stringValue: json['stringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final floatValue = this.floatValue;
    final stringValue = this.stringValue;
    return {
      if (floatValue != null) 'floatValue': _s.encodeJsonDouble(floatValue),
      if (stringValue != null) 'stringValue': stringValue,
    };
  }
}

/// The evaluator model used in knowledge base evaluation job or in model
/// evaluation job that use a model as judge. This model computes all evaluation
/// related metrics.
///
/// @nodoc
class BedrockEvaluatorModel {
  /// The Amazon Resource Name (ARN) of the evaluator model used used in knowledge
  /// base evaluation job or in model evaluation job that use a model as judge.
  final String modelIdentifier;

  BedrockEvaluatorModel({
    required this.modelIdentifier,
  });

  factory BedrockEvaluatorModel.fromJson(Map<String, dynamic> json) {
    return BedrockEvaluatorModel(
      modelIdentifier: (json['modelIdentifier'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final modelIdentifier = this.modelIdentifier;
    return {
      'modelIdentifier': modelIdentifier,
    };
  }
}

/// An evaluation job for deletion, and it’s current status.
///
/// @nodoc
class BatchDeleteEvaluationJobItem {
  /// The Amazon Resource Name (ARN) of the evaluation job for deletion.
  final String jobIdentifier;

  /// The status of the evaluation job for deletion.
  final EvaluationJobStatus jobStatus;

  BatchDeleteEvaluationJobItem({
    required this.jobIdentifier,
    required this.jobStatus,
  });

  factory BatchDeleteEvaluationJobItem.fromJson(Map<String, dynamic> json) {
    return BatchDeleteEvaluationJobItem(
      jobIdentifier: (json['jobIdentifier'] as String?) ?? '',
      jobStatus:
          EvaluationJobStatus.fromString((json['jobStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final jobIdentifier = this.jobIdentifier;
    final jobStatus = this.jobStatus;
    return {
      'jobIdentifier': jobIdentifier,
      'jobStatus': jobStatus.value,
    };
  }
}

/// A JSON array that provides the status of the evaluation jobs being deleted.
///
/// @nodoc
class BatchDeleteEvaluationJobError {
  /// A HTTP status code of the evaluation job being deleted.
  final String code;

  /// The ARN of the evaluation job being deleted.
  final String jobIdentifier;

  /// A status message about the evaluation job deletion.
  final String? message;

  BatchDeleteEvaluationJobError({
    required this.code,
    required this.jobIdentifier,
    this.message,
  });

  factory BatchDeleteEvaluationJobError.fromJson(Map<String, dynamic> json) {
    return BatchDeleteEvaluationJobError(
      code: (json['code'] as String?) ?? '',
      jobIdentifier: (json['jobIdentifier'] as String?) ?? '',
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final jobIdentifier = this.jobIdentifier;
    final message = this.message;
    return {
      'code': code,
      'jobIdentifier': jobIdentifier,
      if (message != null) 'message': message,
    };
  }
}

/// Account-level enforced guardrail input configuration.
///
/// @nodoc
class AccountEnforcedGuardrailInferenceInputConfiguration {
  /// Identifier for the guardrail, could be the ID or the ARN.
  final String guardrailIdentifier;

  /// Numerical guardrail version.
  final String guardrailVersion;

  /// Model-specific information for the enforced guardrail configuration. If not
  /// present, the configuration is enforced on all models
  final ModelEnforcement? modelEnforcement;

  /// Selective content guarding controls for enforced guardrails.
  final SelectiveContentGuarding? selectiveContentGuarding;

  AccountEnforcedGuardrailInferenceInputConfiguration({
    required this.guardrailIdentifier,
    required this.guardrailVersion,
    this.modelEnforcement,
    this.selectiveContentGuarding,
  });

  Map<String, dynamic> toJson() {
    final guardrailIdentifier = this.guardrailIdentifier;
    final guardrailVersion = this.guardrailVersion;
    final modelEnforcement = this.modelEnforcement;
    final selectiveContentGuarding = this.selectiveContentGuarding;
    return {
      'guardrailIdentifier': guardrailIdentifier,
      'guardrailVersion': guardrailVersion,
      if (modelEnforcement != null) 'modelEnforcement': modelEnforcement,
      if (selectiveContentGuarding != null)
        'selectiveContentGuarding': selectiveContentGuarding,
    };
  }
}

/// Selective content guarding controls for enforced guardrails.
///
/// @nodoc
class SelectiveContentGuarding {
  /// Selective guarding mode for user messages.
  final SelectiveGuardingMode? messages;

  /// Selective guarding mode for system prompts."
  final SelectiveGuardingMode? system;

  SelectiveContentGuarding({
    this.messages,
    this.system,
  });

  factory SelectiveContentGuarding.fromJson(Map<String, dynamic> json) {
    return SelectiveContentGuarding(
      messages:
          (json['messages'] as String?)?.let(SelectiveGuardingMode.fromString),
      system:
          (json['system'] as String?)?.let(SelectiveGuardingMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final messages = this.messages;
    final system = this.system;
    return {
      if (messages != null) 'messages': messages.value,
      if (system != null) 'system': system.value,
    };
  }
}

/// Model-specific information for the enforced guardrail configuration.
///
/// @nodoc
class ModelEnforcement {
  /// Models to exclude from enforcement of the guardrail.
  final List<String> excludedModels;

  /// Models to enforce the guardrail on.
  final List<String> includedModels;

  ModelEnforcement({
    required this.excludedModels,
    required this.includedModels,
  });

  factory ModelEnforcement.fromJson(Map<String, dynamic> json) {
    return ModelEnforcement(
      excludedModels: ((json['excludedModels'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      includedModels: ((json['includedModels'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludedModels = this.excludedModels;
    final includedModels = this.includedModels;
    return {
      'excludedModels': excludedModels,
      'includedModels': includedModels,
    };
  }
}

/// @nodoc
class SelectiveGuardingMode {
  static const selective = SelectiveGuardingMode._('SELECTIVE');
  static const comprehensive = SelectiveGuardingMode._('COMPREHENSIVE');

  final String value;

  const SelectiveGuardingMode._(this.value);

  static const values = [selective, comprehensive];

  static SelectiveGuardingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SelectiveGuardingMode._(value));

  @override
  bool operator ==(other) =>
      other is SelectiveGuardingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Account enforced guardrail output configuration.
///
/// @nodoc
class AccountEnforcedGuardrailOutputConfiguration {
  /// Unique ID for the account enforced configuration.
  final String? configId;

  /// Timestamp.
  final DateTime? createdAt;

  /// The ARN of the role used to update the configuration.
  final String? createdBy;

  /// ARN representation for the guardrail.
  final String? guardrailArn;

  /// Unique ID for the guardrail.
  final String? guardrailId;

  /// Numerical guardrail version.
  final String? guardrailVersion;

  /// Whether to honor or ignore input tags at runtime.
  final InputTags? inputTags;

  /// Model-specific information for the enforced guardrail configuration.
  final ModelEnforcement? modelEnforcement;

  /// Configuration owner type.
  final ConfigurationOwner? owner;

  /// Selective content guarding controls for enforced guardrails.
  final SelectiveContentGuarding? selectiveContentGuarding;

  /// Timestamp.
  final DateTime? updatedAt;

  /// The ARN of the role used to update the configuration.
  final String? updatedBy;

  AccountEnforcedGuardrailOutputConfiguration({
    this.configId,
    this.createdAt,
    this.createdBy,
    this.guardrailArn,
    this.guardrailId,
    this.guardrailVersion,
    this.inputTags,
    this.modelEnforcement,
    this.owner,
    this.selectiveContentGuarding,
    this.updatedAt,
    this.updatedBy,
  });

  factory AccountEnforcedGuardrailOutputConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AccountEnforcedGuardrailOutputConfiguration(
      configId: json['configId'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      guardrailArn: json['guardrailArn'] as String?,
      guardrailId: json['guardrailId'] as String?,
      guardrailVersion: json['guardrailVersion'] as String?,
      inputTags: (json['inputTags'] as String?)?.let(InputTags.fromString),
      modelEnforcement: json['modelEnforcement'] != null
          ? ModelEnforcement.fromJson(
              json['modelEnforcement'] as Map<String, dynamic>)
          : null,
      owner: (json['owner'] as String?)?.let(ConfigurationOwner.fromString),
      selectiveContentGuarding: json['selectiveContentGuarding'] != null
          ? SelectiveContentGuarding.fromJson(
              json['selectiveContentGuarding'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configId = this.configId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final guardrailArn = this.guardrailArn;
    final guardrailId = this.guardrailId;
    final guardrailVersion = this.guardrailVersion;
    final inputTags = this.inputTags;
    final modelEnforcement = this.modelEnforcement;
    final owner = this.owner;
    final selectiveContentGuarding = this.selectiveContentGuarding;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      if (configId != null) 'configId': configId,
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (guardrailArn != null) 'guardrailArn': guardrailArn,
      if (guardrailId != null) 'guardrailId': guardrailId,
      if (guardrailVersion != null) 'guardrailVersion': guardrailVersion,
      if (inputTags != null) 'inputTags': inputTags.value,
      if (modelEnforcement != null) 'modelEnforcement': modelEnforcement,
      if (owner != null) 'owner': owner.value,
      if (selectiveContentGuarding != null)
        'selectiveContentGuarding': selectiveContentGuarding,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// @nodoc
class InputTags {
  static const honor = InputTags._('HONOR');
  static const ignore = InputTags._('IGNORE');

  final String value;

  const InputTags._(this.value);

  static const values = [honor, ignore];

  static InputTags fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InputTags._(value));

  @override
  bool operator ==(other) => other is InputTags && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ConfigurationOwner {
  static const account = ConfigurationOwner._('ACCOUNT');

  final String value;

  const ConfigurationOwner._(this.value);

  static const values = [account];

  static ConfigurationOwner fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationOwner._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationOwner && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information for a custom model.
///
/// @nodoc
class CustomModelSummary {
  /// The base model Amazon Resource Name (ARN).
  final String baseModelArn;

  /// The base model name.
  final String baseModelName;

  /// Creation time of the model.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the custom model.
  final String modelArn;

  /// The name of the custom model.
  final String modelName;

  /// Specifies whether to carry out continued pre-training of a model or whether
  /// to fine-tune it. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a>.
  final CustomizationType? customizationType;

  /// The current status of the custom model. Possible values include:
  ///
  /// <ul>
  /// <li>
  /// <code>Creating</code> - The model is being created and validated.
  /// </li>
  /// <li>
  /// <code>Active</code> - The model has been successfully created and is ready
  /// for use.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The model creation process failed.
  /// </li>
  /// </ul>
  final ModelStatus? modelStatus;

  /// The unique identifier of the account that owns the model.
  final String? ownerAccountId;

  CustomModelSummary({
    required this.baseModelArn,
    required this.baseModelName,
    required this.creationTime,
    required this.modelArn,
    required this.modelName,
    this.customizationType,
    this.modelStatus,
    this.ownerAccountId,
  });

  factory CustomModelSummary.fromJson(Map<String, dynamic> json) {
    return CustomModelSummary(
      baseModelArn: (json['baseModelArn'] as String?) ?? '',
      baseModelName: (json['baseModelName'] as String?) ?? '',
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      modelArn: (json['modelArn'] as String?) ?? '',
      modelName: (json['modelName'] as String?) ?? '',
      customizationType: (json['customizationType'] as String?)
          ?.let(CustomizationType.fromString),
      modelStatus:
          (json['modelStatus'] as String?)?.let(ModelStatus.fromString),
      ownerAccountId: json['ownerAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseModelArn = this.baseModelArn;
    final baseModelName = this.baseModelName;
    final creationTime = this.creationTime;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final customizationType = this.customizationType;
    final modelStatus = this.modelStatus;
    final ownerAccountId = this.ownerAccountId;
    return {
      'baseModelArn': baseModelArn,
      'baseModelName': baseModelName,
      'creationTime': iso8601ToJson(creationTime),
      'modelArn': modelArn,
      'modelName': modelName,
      if (customizationType != null)
        'customizationType': customizationType.value,
      if (modelStatus != null) 'modelStatus': modelStatus.value,
      if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
    };
  }
}

/// @nodoc
class ModelStatus {
  static const active = ModelStatus._('Active');
  static const creating = ModelStatus._('Creating');
  static const failed = ModelStatus._('Failed');

  final String value;

  const ModelStatus._(this.value);

  static const values = [active, creating, failed];

  static ModelStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ModelStatus._(value));

  @override
  bool operator ==(other) => other is ModelStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The data source for a custom model. This is a union type that supports the
/// following member:
///
/// <ul>
/// <li>
/// <code>modelPackageArnDataSource</code> — Specifies a SageMaker AI model
/// package as the data source.
/// </li>
/// </ul>
///
/// @nodoc
class CustomModelDataSource {
  /// A SageMaker AI model package ARN as the data source for the custom model.
  /// When you specify a model package ARN, Amazon Bedrock resolves the model
  /// package to retrieve the model artifacts.
  final ModelPackageArnDataSource? modelPackageArnDataSource;

  CustomModelDataSource({
    this.modelPackageArnDataSource,
  });

  Map<String, dynamic> toJson() {
    final modelPackageArnDataSource = this.modelPackageArnDataSource;
    return {
      if (modelPackageArnDataSource != null)
        'modelPackageArnDataSource': modelPackageArnDataSource,
    };
  }
}

/// Contains the Amazon Resource Name (ARN) of a SageMaker AI model package to
/// use as the data source for a custom model.
///
/// @nodoc
class ModelPackageArnDataSource {
  /// The Amazon Resource Name (ARN) of the SageMaker AI model package. The ARN
  /// must be for a model package of <code>restricted</code> type.
  ///
  /// To use a model package ARN, you must have the
  /// <code>sagemaker:DescribeModelPackage</code> and
  /// <code>sagemaker:AccessModelPackageData</code> permissions on the model
  /// package resource.
  final String modelPackageArn;

  ModelPackageArnDataSource({
    required this.modelPackageArn,
  });

  Map<String, dynamic> toJson() {
    final modelPackageArn = this.modelPackageArn;
    return {
      'modelPackageArn': modelPackageArn,
    };
  }
}

/// Contains summary information about a custom model deployment, including its
/// ARN, name, status, and associated custom model.
///
/// @nodoc
class CustomModelDeploymentSummary {
  /// The date and time when the custom model deployment was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the custom model deployment.
  final String customModelDeploymentArn;

  /// The name of the custom model deployment.
  final String customModelDeploymentName;

  /// The Amazon Resource Name (ARN) of the custom model associated with this
  /// deployment.
  final String modelArn;

  /// The status of the custom model deployment. Possible values are
  /// <code>CREATING</code>, <code>ACTIVE</code>, and <code>FAILED</code>.
  final CustomModelDeploymentStatus status;

  /// If the deployment status is <code>FAILED</code>, this field contains a
  /// message describing the failure reason.
  final String? failureMessage;

  /// The date and time when the custom model deployment was last modified.
  final DateTime? lastUpdatedAt;

  CustomModelDeploymentSummary({
    required this.createdAt,
    required this.customModelDeploymentArn,
    required this.customModelDeploymentName,
    required this.modelArn,
    required this.status,
    this.failureMessage,
    this.lastUpdatedAt,
  });

  factory CustomModelDeploymentSummary.fromJson(Map<String, dynamic> json) {
    return CustomModelDeploymentSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      customModelDeploymentArn:
          (json['customModelDeploymentArn'] as String?) ?? '',
      customModelDeploymentName:
          (json['customModelDeploymentName'] as String?) ?? '',
      modelArn: (json['modelArn'] as String?) ?? '',
      status: CustomModelDeploymentStatus.fromString(
          (json['status'] as String?) ?? ''),
      failureMessage: json['failureMessage'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final customModelDeploymentArn = this.customModelDeploymentArn;
    final customModelDeploymentName = this.customModelDeploymentName;
    final modelArn = this.modelArn;
    final status = this.status;
    final failureMessage = this.failureMessage;
    final lastUpdatedAt = this.lastUpdatedAt;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'customModelDeploymentArn': customModelDeploymentArn,
      'customModelDeploymentName': customModelDeploymentName,
      'modelArn': modelArn,
      'status': status.value,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastUpdatedAt != null) 'lastUpdatedAt': iso8601ToJson(lastUpdatedAt),
    };
  }
}

/// @nodoc
class CustomModelDeploymentStatus {
  static const creating = CustomModelDeploymentStatus._('Creating');
  static const active = CustomModelDeploymentStatus._('Active');
  static const failed = CustomModelDeploymentStatus._('Failed');

  final String value;

  const CustomModelDeploymentStatus._(this.value);

  static const values = [creating, active, failed];

  static CustomModelDeploymentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomModelDeploymentStatus._(value));

  @override
  bool operator ==(other) =>
      other is CustomModelDeploymentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about an update to a custom model deployment, including the new
/// custom model resource ARN and current update status.
///
/// @nodoc
class CustomModelDeploymentUpdateDetails {
  /// ARN of the new custom model being deployed as part of the update.
  final String modelArn;

  /// Current status of the deployment update.
  final CustomModelDeploymentUpdateStatus updateStatus;

  CustomModelDeploymentUpdateDetails({
    required this.modelArn,
    required this.updateStatus,
  });

  factory CustomModelDeploymentUpdateDetails.fromJson(
      Map<String, dynamic> json) {
    return CustomModelDeploymentUpdateDetails(
      modelArn: (json['modelArn'] as String?) ?? '',
      updateStatus: CustomModelDeploymentUpdateStatus.fromString(
          (json['updateStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final modelArn = this.modelArn;
    final updateStatus = this.updateStatus;
    return {
      'modelArn': modelArn,
      'updateStatus': updateStatus.value,
    };
  }
}

/// @nodoc
class CustomModelDeploymentUpdateStatus {
  static const updating = CustomModelDeploymentUpdateStatus._('Updating');
  static const updateCompleted =
      CustomModelDeploymentUpdateStatus._('UpdateCompleted');
  static const updateFailed =
      CustomModelDeploymentUpdateStatus._('UpdateFailed');

  final String value;

  const CustomModelDeploymentUpdateStatus._(this.value);

  static const values = [updating, updateCompleted, updateFailed];

  static CustomModelDeploymentUpdateStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomModelDeploymentUpdateStatus._(value));

  @override
  bool operator ==(other) =>
      other is CustomModelDeploymentUpdateStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about an endpoint for a model from Amazon Bedrock
/// Marketplace.
///
/// @nodoc
class MarketplaceModelEndpoint {
  /// The timestamp when the endpoint was registered.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the endpoint.
  final String endpointArn;

  /// The configuration of the endpoint, including the number and type of
  /// instances used.
  final EndpointConfig endpointConfig;

  /// The current status of the endpoint (e.g., Creating, InService, Updating,
  /// Failed).
  final String endpointStatus;

  /// The ARN of the model from Amazon Bedrock Marketplace that is deployed on
  /// this endpoint.
  final String modelSourceIdentifier;

  /// The timestamp when the endpoint was last updated.
  final DateTime updatedAt;

  /// Additional information about the endpoint status, if available.
  final String? endpointStatusMessage;

  /// The overall status of the endpoint in Amazon Bedrock Marketplace (e.g.,
  /// ACTIVE, INACTIVE).
  final Status? status;

  /// Additional information about the overall status, if available.
  final String? statusMessage;

  MarketplaceModelEndpoint({
    required this.createdAt,
    required this.endpointArn,
    required this.endpointConfig,
    required this.endpointStatus,
    required this.modelSourceIdentifier,
    required this.updatedAt,
    this.endpointStatusMessage,
    this.status,
    this.statusMessage,
  });

  factory MarketplaceModelEndpoint.fromJson(Map<String, dynamic> json) {
    return MarketplaceModelEndpoint(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      endpointArn: (json['endpointArn'] as String?) ?? '',
      endpointConfig: EndpointConfig.fromJson(
          (json['endpointConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      endpointStatus: (json['endpointStatus'] as String?) ?? '',
      modelSourceIdentifier: (json['modelSourceIdentifier'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      endpointStatusMessage: json['endpointStatusMessage'] as String?,
      status: (json['status'] as String?)?.let(Status.fromString),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endpointArn = this.endpointArn;
    final endpointConfig = this.endpointConfig;
    final endpointStatus = this.endpointStatus;
    final modelSourceIdentifier = this.modelSourceIdentifier;
    final updatedAt = this.updatedAt;
    final endpointStatusMessage = this.endpointStatusMessage;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'endpointArn': endpointArn,
      'endpointConfig': endpointConfig,
      'endpointStatus': endpointStatus,
      'modelSourceIdentifier': modelSourceIdentifier,
      'updatedAt': iso8601ToJson(updatedAt),
      if (endpointStatusMessage != null)
        'endpointStatusMessage': endpointStatusMessage,
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
class Status {
  static const registered = Status._('REGISTERED');
  static const incompatibleEndpoint = Status._('INCOMPATIBLE_ENDPOINT');

  final String value;

  const Status._(this.value);

  static const values = [registered, incompatibleEndpoint];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies the configuration for the endpoint.
///
/// @nodoc
class EndpointConfig {
  /// The configuration specific to Amazon SageMaker for the endpoint.
  final SageMakerEndpoint? sageMaker;

  EndpointConfig({
    this.sageMaker,
  });

  factory EndpointConfig.fromJson(Map<String, dynamic> json) {
    return EndpointConfig(
      sageMaker: json['sageMaker'] != null
          ? SageMakerEndpoint.fromJson(
              json['sageMaker'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sageMaker = this.sageMaker;
    return {
      if (sageMaker != null) 'sageMaker': sageMaker,
    };
  }
}

/// Specifies the configuration for a Amazon SageMaker endpoint.
///
/// @nodoc
class SageMakerEndpoint {
  /// The ARN of the IAM role that Amazon SageMaker can assume to access model
  /// artifacts and docker image for deployment on Amazon EC2 compute instances or
  /// for batch transform jobs.
  final String executionRole;

  /// The number of Amazon EC2 compute instances to deploy for initial endpoint
  /// creation.
  final int initialInstanceCount;

  /// The Amazon EC2 compute instance type to deploy for hosting the model.
  final String instanceType;

  /// The Amazon Web Services KMS key that Amazon SageMaker uses to encrypt data
  /// on the storage volume attached to the Amazon EC2 compute instance that hosts
  /// the endpoint.
  final String? kmsEncryptionKey;

  /// The VPC configuration for the endpoint.
  final VpcConfig? vpc;

  SageMakerEndpoint({
    required this.executionRole,
    required this.initialInstanceCount,
    required this.instanceType,
    this.kmsEncryptionKey,
    this.vpc,
  });

  factory SageMakerEndpoint.fromJson(Map<String, dynamic> json) {
    return SageMakerEndpoint(
      executionRole: (json['executionRole'] as String?) ?? '',
      initialInstanceCount: (json['initialInstanceCount'] as int?) ?? 0,
      instanceType: (json['instanceType'] as String?) ?? '',
      kmsEncryptionKey: json['kmsEncryptionKey'] as String?,
      vpc: json['vpc'] != null
          ? VpcConfig.fromJson(json['vpc'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final executionRole = this.executionRole;
    final initialInstanceCount = this.initialInstanceCount;
    final instanceType = this.instanceType;
    final kmsEncryptionKey = this.kmsEncryptionKey;
    final vpc = this.vpc;
    return {
      'executionRole': executionRole,
      'initialInstanceCount': initialInstanceCount,
      'instanceType': instanceType,
      if (kmsEncryptionKey != null) 'kmsEncryptionKey': kmsEncryptionKey,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Provides a summary of an endpoint for a model from Amazon Bedrock
/// Marketplace.
///
/// @nodoc
class MarketplaceModelEndpointSummary {
  /// The timestamp when the endpoint was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the endpoint.
  final String endpointArn;

  /// The ARN of the model from Amazon Bedrock Marketplace that is deployed on
  /// this endpoint.
  final String modelSourceIdentifier;

  /// The timestamp when the endpoint was last updated.
  final DateTime updatedAt;

  /// The overall status of the endpoint in Amazon Bedrock Marketplace.
  final Status? status;

  /// Additional information about the overall status, if available.
  final String? statusMessage;

  MarketplaceModelEndpointSummary({
    required this.createdAt,
    required this.endpointArn,
    required this.modelSourceIdentifier,
    required this.updatedAt,
    this.status,
    this.statusMessage,
  });

  factory MarketplaceModelEndpointSummary.fromJson(Map<String, dynamic> json) {
    return MarketplaceModelEndpointSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      endpointArn: (json['endpointArn'] as String?) ?? '',
      modelSourceIdentifier: (json['modelSourceIdentifier'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      status: (json['status'] as String?)?.let(Status.fromString),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endpointArn = this.endpointArn;
    final modelSourceIdentifier = this.modelSourceIdentifier;
    final updatedAt = this.updatedAt;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'endpointArn': endpointArn,
      'modelSourceIdentifier': modelSourceIdentifier,
      'updatedAt': iso8601ToJson(updatedAt),
      if (status != null) 'status': status.value,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

/// @nodoc
class AutomatedReasoningCheckResult {
  static const valid = AutomatedReasoningCheckResult._('VALID');
  static const invalid = AutomatedReasoningCheckResult._('INVALID');
  static const satisfiable = AutomatedReasoningCheckResult._('SATISFIABLE');
  static const impossible = AutomatedReasoningCheckResult._('IMPOSSIBLE');
  static const translationAmbiguous =
      AutomatedReasoningCheckResult._('TRANSLATION_AMBIGUOUS');
  static const tooComplex = AutomatedReasoningCheckResult._('TOO_COMPLEX');
  static const noTranslation =
      AutomatedReasoningCheckResult._('NO_TRANSLATION');

  final String value;

  const AutomatedReasoningCheckResult._(this.value);

  static const values = [
    valid,
    invalid,
    satisfiable,
    impossible,
    translationAmbiguous,
    tooComplex,
    noTranslation
  ];

  static AutomatedReasoningCheckResult fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningCheckResult._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningCheckResult && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the various operations that can be performed on an Automated
/// Reasoning policy, including adding, updating, and deleting rules, variables,
/// and types.
///
/// @nodoc
class AutomatedReasoningPolicyAnnotation {
  /// An operation to add a new logical rule to the policy using formal
  /// mathematical expressions.
  final AutomatedReasoningPolicyAddRuleAnnotation? addRule;

  /// An operation to add a new rule by converting natural language descriptions
  /// into formal logical expressions.
  final AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation?
      addRuleFromNaturalLanguage;

  /// An operation to add a new custom type to the policy, defining a set of
  /// possible values for policy variables.
  final AutomatedReasoningPolicyAddTypeAnnotation? addType;

  /// An operation to add a new variable to the policy, which can be used in rule
  /// expressions to represent dynamic values.
  final AutomatedReasoningPolicyAddVariableAnnotation? addVariable;

  /// An operation to remove a rule from the policy.
  final AutomatedReasoningPolicyDeleteRuleAnnotation? deleteRule;

  /// An operation to remove a custom type from the policy. The type must not be
  /// referenced by any variables or rules.
  final AutomatedReasoningPolicyDeleteTypeAnnotation? deleteType;

  /// An operation to remove a variable from the policy. The variable must not be
  /// referenced by any rules.
  final AutomatedReasoningPolicyDeleteVariableAnnotation? deleteVariable;

  /// An operation to process and incorporate new content into the policy,
  /// extracting additional rules and concepts.
  final AutomatedReasoningPolicyIngestContentAnnotation? ingestContent;

  /// An operation to update the policy based on feedback about how specific rules
  /// performed during testing or validation.
  final AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation?
      updateFromRulesFeedback;

  /// An operation to update the policy based on feedback about how it performed
  /// on specific test scenarios.
  final AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation?
      updateFromScenarioFeedback;

  /// An operation to modify an existing rule in the policy, such as changing its
  /// logical expression or conditions.
  final AutomatedReasoningPolicyUpdateRuleAnnotation? updateRule;

  /// An operation to modify an existing custom type in the policy, such as
  /// changing its name, description, or allowed values.
  final AutomatedReasoningPolicyUpdateTypeAnnotation? updateType;

  /// An operation to modify an existing variable in the policy, such as changing
  /// its name, type, or description.
  final AutomatedReasoningPolicyUpdateVariableAnnotation? updateVariable;

  AutomatedReasoningPolicyAnnotation({
    this.addRule,
    this.addRuleFromNaturalLanguage,
    this.addType,
    this.addVariable,
    this.deleteRule,
    this.deleteType,
    this.deleteVariable,
    this.ingestContent,
    this.updateFromRulesFeedback,
    this.updateFromScenarioFeedback,
    this.updateRule,
    this.updateType,
    this.updateVariable,
  });

  factory AutomatedReasoningPolicyAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAnnotation(
      addRule: json['addRule'] != null
          ? AutomatedReasoningPolicyAddRuleAnnotation.fromJson(
              json['addRule'] as Map<String, dynamic>)
          : null,
      addRuleFromNaturalLanguage: json['addRuleFromNaturalLanguage'] != null
          ? AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation
              .fromJson(
                  json['addRuleFromNaturalLanguage'] as Map<String, dynamic>)
          : null,
      addType: json['addType'] != null
          ? AutomatedReasoningPolicyAddTypeAnnotation.fromJson(
              json['addType'] as Map<String, dynamic>)
          : null,
      addVariable: json['addVariable'] != null
          ? AutomatedReasoningPolicyAddVariableAnnotation.fromJson(
              json['addVariable'] as Map<String, dynamic>)
          : null,
      deleteRule: json['deleteRule'] != null
          ? AutomatedReasoningPolicyDeleteRuleAnnotation.fromJson(
              json['deleteRule'] as Map<String, dynamic>)
          : null,
      deleteType: json['deleteType'] != null
          ? AutomatedReasoningPolicyDeleteTypeAnnotation.fromJson(
              json['deleteType'] as Map<String, dynamic>)
          : null,
      deleteVariable: json['deleteVariable'] != null
          ? AutomatedReasoningPolicyDeleteVariableAnnotation.fromJson(
              json['deleteVariable'] as Map<String, dynamic>)
          : null,
      ingestContent: json['ingestContent'] != null
          ? AutomatedReasoningPolicyIngestContentAnnotation.fromJson(
              json['ingestContent'] as Map<String, dynamic>)
          : null,
      updateFromRulesFeedback: json['updateFromRulesFeedback'] != null
          ? AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation.fromJson(
              json['updateFromRulesFeedback'] as Map<String, dynamic>)
          : null,
      updateFromScenarioFeedback: json['updateFromScenarioFeedback'] != null
          ? AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation
              .fromJson(
                  json['updateFromScenarioFeedback'] as Map<String, dynamic>)
          : null,
      updateRule: json['updateRule'] != null
          ? AutomatedReasoningPolicyUpdateRuleAnnotation.fromJson(
              json['updateRule'] as Map<String, dynamic>)
          : null,
      updateType: json['updateType'] != null
          ? AutomatedReasoningPolicyUpdateTypeAnnotation.fromJson(
              json['updateType'] as Map<String, dynamic>)
          : null,
      updateVariable: json['updateVariable'] != null
          ? AutomatedReasoningPolicyUpdateVariableAnnotation.fromJson(
              json['updateVariable'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addRule = this.addRule;
    final addRuleFromNaturalLanguage = this.addRuleFromNaturalLanguage;
    final addType = this.addType;
    final addVariable = this.addVariable;
    final deleteRule = this.deleteRule;
    final deleteType = this.deleteType;
    final deleteVariable = this.deleteVariable;
    final ingestContent = this.ingestContent;
    final updateFromRulesFeedback = this.updateFromRulesFeedback;
    final updateFromScenarioFeedback = this.updateFromScenarioFeedback;
    final updateRule = this.updateRule;
    final updateType = this.updateType;
    final updateVariable = this.updateVariable;
    return {
      if (addRule != null) 'addRule': addRule,
      if (addRuleFromNaturalLanguage != null)
        'addRuleFromNaturalLanguage': addRuleFromNaturalLanguage,
      if (addType != null) 'addType': addType,
      if (addVariable != null) 'addVariable': addVariable,
      if (deleteRule != null) 'deleteRule': deleteRule,
      if (deleteType != null) 'deleteType': deleteType,
      if (deleteVariable != null) 'deleteVariable': deleteVariable,
      if (ingestContent != null) 'ingestContent': ingestContent,
      if (updateFromRulesFeedback != null)
        'updateFromRulesFeedback': updateFromRulesFeedback,
      if (updateFromScenarioFeedback != null)
        'updateFromScenarioFeedback': updateFromScenarioFeedback,
      if (updateRule != null) 'updateRule': updateRule,
      if (updateType != null) 'updateType': updateType,
      if (updateVariable != null) 'updateVariable': updateVariable,
    };
  }
}

/// An annotation for adding a new custom type to an Automated Reasoning policy,
/// defining a set of possible values for variables.
///
/// @nodoc
class AutomatedReasoningPolicyAddTypeAnnotation {
  /// A description of what the custom type represents and how it should be used
  /// in the policy.
  final String description;

  /// The name of the new custom type. This name will be used to reference the
  /// type in variable definitions and rules.
  final String name;

  /// The list of possible values that variables of this type can take, each with
  /// its own description and identifier.
  final List<AutomatedReasoningPolicyDefinitionTypeValue> values;

  AutomatedReasoningPolicyAddTypeAnnotation({
    required this.description,
    required this.name,
    required this.values,
  });

  factory AutomatedReasoningPolicyAddTypeAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAddTypeAnnotation(
      description: (json['description'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyDefinitionTypeValue.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final values = this.values;
    return {
      'description': description,
      'name': name,
      'values': values,
    };
  }
}

/// An annotation for modifying an existing custom type in an Automated
/// Reasoning policy.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateTypeAnnotation {
  /// The current name of the custom type to update.
  final String name;

  /// The updated list of values for the custom type, which can include additions,
  /// modifications, or removals.
  final List<AutomatedReasoningPolicyTypeValueAnnotation> values;

  /// The new description for the custom type, replacing the previous description.
  final String? description;

  /// The new name for the custom type, if you want to rename it. If not provided,
  /// the name remains unchanged.
  final String? newName;

  AutomatedReasoningPolicyUpdateTypeAnnotation({
    required this.name,
    required this.values,
    this.description,
    this.newName,
  });

  factory AutomatedReasoningPolicyUpdateTypeAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateTypeAnnotation(
      name: (json['name'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyTypeValueAnnotation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      newName: json['newName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final description = this.description;
    final newName = this.newName;
    return {
      'name': name,
      'values': values,
      if (description != null) 'description': description,
      if (newName != null) 'newName': newName,
    };
  }
}

/// An annotation for removing a custom type from an Automated Reasoning policy.
///
/// @nodoc
class AutomatedReasoningPolicyDeleteTypeAnnotation {
  /// The name of the custom type to delete from the policy. The type must not be
  /// referenced by any variables or rules.
  final String name;

  AutomatedReasoningPolicyDeleteTypeAnnotation({
    required this.name,
  });

  factory AutomatedReasoningPolicyDeleteTypeAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDeleteTypeAnnotation(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// An annotation for adding a new variable to an Automated Reasoning policy,
/// which can be used in rule expressions.
///
/// @nodoc
class AutomatedReasoningPolicyAddVariableAnnotation {
  /// A description of what the variable represents and how it should be used in
  /// rules.
  final String description;

  /// The name of the new variable. This name will be used to reference the
  /// variable in rule expressions.
  final String name;

  /// The type of the variable, which can be a built-in type (like string or
  /// number) or a custom type defined in the policy.
  final String type;

  AutomatedReasoningPolicyAddVariableAnnotation({
    required this.description,
    required this.name,
    required this.type,
  });

  factory AutomatedReasoningPolicyAddVariableAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAddVariableAnnotation(
      description: (json['description'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final type = this.type;
    return {
      'description': description,
      'name': name,
      'type': type,
    };
  }
}

/// An annotation for modifying an existing variable in an Automated Reasoning
/// policy.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateVariableAnnotation {
  /// The current name of the variable to update.
  final String name;

  /// The new description for the variable, replacing the previous description.
  final String? description;

  /// The new name for the variable, if you want to rename it. If not provided,
  /// the name remains unchanged.
  final String? newName;

  AutomatedReasoningPolicyUpdateVariableAnnotation({
    required this.name,
    this.description,
    this.newName,
  });

  factory AutomatedReasoningPolicyUpdateVariableAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateVariableAnnotation(
      name: (json['name'] as String?) ?? '',
      description: json['description'] as String?,
      newName: json['newName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final description = this.description;
    final newName = this.newName;
    return {
      'name': name,
      if (description != null) 'description': description,
      if (newName != null) 'newName': newName,
    };
  }
}

/// An annotation for removing a variable from an Automated Reasoning policy.
///
/// @nodoc
class AutomatedReasoningPolicyDeleteVariableAnnotation {
  /// The name of the variable to delete from the policy. The variable must not be
  /// referenced by any rules.
  final String name;

  AutomatedReasoningPolicyDeleteVariableAnnotation({
    required this.name,
  });

  factory AutomatedReasoningPolicyDeleteVariableAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDeleteVariableAnnotation(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// An annotation for adding a new rule to an Automated Reasoning policy using a
/// formal logical expression.
///
/// @nodoc
class AutomatedReasoningPolicyAddRuleAnnotation {
  /// The formal logical expression that defines the rule, using mathematical
  /// notation and referencing policy variables and types.
  final String expression;

  AutomatedReasoningPolicyAddRuleAnnotation({
    required this.expression,
  });

  factory AutomatedReasoningPolicyAddRuleAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAddRuleAnnotation(
      expression: (json['expression'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    return {
      'expression': expression,
    };
  }
}

/// An annotation for modifying an existing rule in an Automated Reasoning
/// policy.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateRuleAnnotation {
  /// The new formal logical expression for the rule, replacing the previous
  /// expression.
  final String expression;

  /// The unique identifier of the rule to update.
  final String ruleId;

  AutomatedReasoningPolicyUpdateRuleAnnotation({
    required this.expression,
    required this.ruleId,
  });

  factory AutomatedReasoningPolicyUpdateRuleAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateRuleAnnotation(
      expression: (json['expression'] as String?) ?? '',
      ruleId: (json['ruleId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final ruleId = this.ruleId;
    return {
      'expression': expression,
      'ruleId': ruleId,
    };
  }
}

/// An annotation for removing a rule from an Automated Reasoning policy.
///
/// @nodoc
class AutomatedReasoningPolicyDeleteRuleAnnotation {
  /// The unique identifier of the rule to delete from the policy.
  final String ruleId;

  AutomatedReasoningPolicyDeleteRuleAnnotation({
    required this.ruleId,
  });

  factory AutomatedReasoningPolicyDeleteRuleAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDeleteRuleAnnotation(
      ruleId: (json['ruleId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final ruleId = this.ruleId;
    return {
      'ruleId': ruleId,
    };
  }
}

/// An annotation for adding a new rule to the policy by converting a natural
/// language description into a formal logical expression.
///
/// @nodoc
class AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation {
  /// The natural language description of the rule that should be converted into a
  /// formal logical expression.
  final String naturalLanguage;

  AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation({
    required this.naturalLanguage,
  });

  factory AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAddRuleFromNaturalLanguageAnnotation(
      naturalLanguage: (json['naturalLanguage'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final naturalLanguage = this.naturalLanguage;
    return {
      'naturalLanguage': naturalLanguage,
    };
  }
}

/// An annotation for updating the policy based on feedback about how specific
/// rules performed during testing or real-world usage.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation {
  /// The feedback information about rule performance, including suggestions for
  /// improvements or corrections.
  final String feedback;

  /// The list of rule identifiers that the feedback applies to.
  final List<String>? ruleIds;

  AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation({
    required this.feedback,
    this.ruleIds,
  });

  factory AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateFromRuleFeedbackAnnotation(
      feedback: (json['feedback'] as String?) ?? '',
      ruleIds:
          (json['ruleIds'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final feedback = this.feedback;
    final ruleIds = this.ruleIds;
    return {
      'feedback': feedback,
      if (ruleIds != null) 'ruleIds': ruleIds,
    };
  }
}

/// An annotation for updating the policy based on feedback about how it
/// performed on specific test scenarios.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation {
  /// The logical expression that defines the test scenario that generated this
  /// feedback.
  final String scenarioExpression;

  /// The feedback information about scenario performance, including any issues or
  /// improvements identified.
  final String? feedback;

  /// The list of rule identifiers that were involved in the scenario being
  /// evaluated.
  final List<String>? ruleIds;

  AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation({
    required this.scenarioExpression,
    this.feedback,
    this.ruleIds,
  });

  factory AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateFromScenarioFeedbackAnnotation(
      scenarioExpression: (json['scenarioExpression'] as String?) ?? '',
      feedback: json['feedback'] as String?,
      ruleIds:
          (json['ruleIds'] as List?)?.nonNulls.map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final scenarioExpression = this.scenarioExpression;
    final feedback = this.feedback;
    final ruleIds = this.ruleIds;
    return {
      'scenarioExpression': scenarioExpression,
      if (feedback != null) 'feedback': feedback,
      if (ruleIds != null) 'ruleIds': ruleIds,
    };
  }
}

/// An annotation for processing and incorporating new content into an Automated
/// Reasoning policy.
///
/// @nodoc
class AutomatedReasoningPolicyIngestContentAnnotation {
  /// The new content to be analyzed and incorporated into the policy, such as
  /// additional documents or rule descriptions.
  final String content;

  AutomatedReasoningPolicyIngestContentAnnotation({
    required this.content,
  });

  factory AutomatedReasoningPolicyIngestContentAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyIngestContentAnnotation(
      content: (json['content'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    return {
      'content': content,
    };
  }
}

/// An annotation for managing values within custom types, including adding,
/// updating, or removing specific type values.
///
/// @nodoc
class AutomatedReasoningPolicyTypeValueAnnotation {
  /// An operation to add a new value to an existing custom type.
  final AutomatedReasoningPolicyAddTypeValue? addTypeValue;

  /// An operation to remove a value from an existing custom type.
  final AutomatedReasoningPolicyDeleteTypeValue? deleteTypeValue;

  /// An operation to modify an existing value within a custom type.
  final AutomatedReasoningPolicyUpdateTypeValue? updateTypeValue;

  AutomatedReasoningPolicyTypeValueAnnotation({
    this.addTypeValue,
    this.deleteTypeValue,
    this.updateTypeValue,
  });

  factory AutomatedReasoningPolicyTypeValueAnnotation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyTypeValueAnnotation(
      addTypeValue: json['addTypeValue'] != null
          ? AutomatedReasoningPolicyAddTypeValue.fromJson(
              json['addTypeValue'] as Map<String, dynamic>)
          : null,
      deleteTypeValue: json['deleteTypeValue'] != null
          ? AutomatedReasoningPolicyDeleteTypeValue.fromJson(
              json['deleteTypeValue'] as Map<String, dynamic>)
          : null,
      updateTypeValue: json['updateTypeValue'] != null
          ? AutomatedReasoningPolicyUpdateTypeValue.fromJson(
              json['updateTypeValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addTypeValue = this.addTypeValue;
    final deleteTypeValue = this.deleteTypeValue;
    final updateTypeValue = this.updateTypeValue;
    return {
      if (addTypeValue != null) 'addTypeValue': addTypeValue,
      if (deleteTypeValue != null) 'deleteTypeValue': deleteTypeValue,
      if (updateTypeValue != null) 'updateTypeValue': updateTypeValue,
    };
  }
}

/// Represents a single value that can be added to an existing custom type in
/// the policy.
///
/// @nodoc
class AutomatedReasoningPolicyAddTypeValue {
  /// The identifier or name of the new value to add to the type.
  final String value;

  /// A description of what this new type value represents and when it should be
  /// used.
  final String? description;

  AutomatedReasoningPolicyAddTypeValue({
    required this.value,
    this.description,
  });

  factory AutomatedReasoningPolicyAddTypeValue.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAddTypeValue(
      value: (json['value'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final description = this.description;
    return {
      'value': value,
      if (description != null) 'description': description,
    };
  }
}

/// Represents a modification to a value within an existing custom type.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateTypeValue {
  /// The current identifier or name of the type value to update.
  final String value;

  /// The new description for the type value, replacing the previous description.
  final String? description;

  /// The new identifier or name for the type value, if you want to rename it.
  final String? newValue;

  AutomatedReasoningPolicyUpdateTypeValue({
    required this.value,
    this.description,
    this.newValue,
  });

  factory AutomatedReasoningPolicyUpdateTypeValue.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateTypeValue(
      value: (json['value'] as String?) ?? '',
      description: json['description'] as String?,
      newValue: json['newValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final description = this.description;
    final newValue = this.newValue;
    return {
      'value': value,
      if (description != null) 'description': description,
      if (newValue != null) 'newValue': newValue,
    };
  }
}

/// Represents a value to be removed from an existing custom type in the policy.
///
/// @nodoc
class AutomatedReasoningPolicyDeleteTypeValue {
  /// The identifier or name of the value to remove from the type.
  final String value;

  AutomatedReasoningPolicyDeleteTypeValue({
    required this.value,
  });

  factory AutomatedReasoningPolicyDeleteTypeValue.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDeleteTypeValue(
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': value,
    };
  }
}

/// Represents a single value within a custom type definition, including its
/// identifier and description.
///
/// @nodoc
class AutomatedReasoningPolicyDefinitionTypeValue {
  /// The actual value or identifier for this type value.
  final String value;

  /// A human-readable description explaining what this type value represents and
  /// when it should be used.
  final String? description;

  AutomatedReasoningPolicyDefinitionTypeValue({
    required this.value,
    this.description,
  });

  factory AutomatedReasoningPolicyDefinitionTypeValue.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDefinitionTypeValue(
      value: (json['value'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    final description = this.description;
    return {
      'value': value,
      if (description != null) 'description': description,
    };
  }
}

/// @nodoc
class AutomatedReasoningPolicyBuildWorkflowType {
  static const ingestContent =
      AutomatedReasoningPolicyBuildWorkflowType._('INGEST_CONTENT');
  static const refinePolicy =
      AutomatedReasoningPolicyBuildWorkflowType._('REFINE_POLICY');
  static const importPolicy =
      AutomatedReasoningPolicyBuildWorkflowType._('IMPORT_POLICY');
  static const generateFidelityReport =
      AutomatedReasoningPolicyBuildWorkflowType._('GENERATE_FIDELITY_REPORT');
  static const generatePolicyScenarios =
      AutomatedReasoningPolicyBuildWorkflowType._('GENERATE_POLICY_SCENARIOS');
  static const resolvePolicyAmbiguities =
      AutomatedReasoningPolicyBuildWorkflowType._('RESOLVE_POLICY_AMBIGUITIES');
  static const iterativelyRefinePolicy =
      AutomatedReasoningPolicyBuildWorkflowType._('ITERATIVELY_REFINE_POLICY');

  final String value;

  const AutomatedReasoningPolicyBuildWorkflowType._(this.value);

  static const values = [
    ingestContent,
    refinePolicy,
    importPolicy,
    generateFidelityReport,
    generatePolicyScenarios,
    resolvePolicyAmbiguities,
    iterativelyRefinePolicy
  ];

  static AutomatedReasoningPolicyBuildWorkflowType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningPolicyBuildWorkflowType._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningPolicyBuildWorkflowType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines the source content for a policy build workflow, which can include
/// documents, repair instructions, or other input materials.
///
/// @nodoc
class AutomatedReasoningPolicyBuildWorkflowSource {
  /// An existing policy definition that serves as the starting point for the
  /// build workflow, typically used in policy repair or update scenarios.
  final AutomatedReasoningPolicyDefinition? policyDefinition;

  /// The actual content to be processed in the build workflow, such as documents
  /// to analyze or repair instructions to apply.
  final AutomatedReasoningPolicyWorkflowTypeContent? workflowContent;

  AutomatedReasoningPolicyBuildWorkflowSource({
    this.policyDefinition,
    this.workflowContent,
  });

  Map<String, dynamic> toJson() {
    final policyDefinition = this.policyDefinition;
    final workflowContent = this.workflowContent;
    return {
      if (policyDefinition != null) 'policyDefinition': policyDefinition,
      if (workflowContent != null) 'workflowContent': workflowContent,
    };
  }
}

/// Contains the formal logic rules, variables, and custom variable types that
/// define an Automated Reasoning policy. The policy definition specifies the
/// constraints used to validate foundation model responses for accuracy and
/// logical consistency.
///
/// @nodoc
class AutomatedReasoningPolicyDefinition {
  /// The formal logic rules extracted from the source document. Rules define the
  /// logical constraints that determine whether model responses are valid,
  /// invalid, or satisfiable.
  final List<AutomatedReasoningPolicyDefinitionRule>? rules;

  /// The custom user-defined vairable types used in the policy. Types are
  /// enum-based variable types that provide additional context beyond the
  /// predefined variable types.
  final List<AutomatedReasoningPolicyDefinitionType>? types;

  /// The variables that represent concepts in the policy. Variables can have
  /// values assigned when translating natural language into formal logic. Their
  /// descriptions are crucial for accurate translation.
  final List<AutomatedReasoningPolicyDefinitionVariable>? variables;

  /// The version of the policy definition format.
  final String? version;

  AutomatedReasoningPolicyDefinition({
    this.rules,
    this.types,
    this.variables,
    this.version,
  });

  factory AutomatedReasoningPolicyDefinition.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDefinition(
      rules: (json['rules'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningPolicyDefinitionRule.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      types: (json['types'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningPolicyDefinitionType.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      variables: (json['variables'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningPolicyDefinitionVariable.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    final types = this.types;
    final variables = this.variables;
    final version = this.version;
    return {
      if (rules != null) 'rules': rules,
      if (types != null) 'types': types,
      if (variables != null) 'variables': variables,
      if (version != null) 'version': version,
    };
  }
}

/// Defines the content and configuration for different types of policy build
/// workflows.
///
/// @nodoc
class AutomatedReasoningPolicyWorkflowTypeContent {
  /// The list of documents to be processed in a document ingestion workflow.
  final List<AutomatedReasoningPolicyBuildWorkflowDocument>? documents;

  /// The content configuration for generating a fidelity report workflow. This
  /// can include source documents to analyze or an existing fidelity report to
  /// update with a new policy definition.
  final AutomatedReasoningPolicyGenerateFidelityReportContent?
      generateFidelityReportContent;

  /// Content configuration to start an iterative policy refinement workflow that
  /// uses generative AI to automatically make changes to the policy based on test
  /// results and the optional feedback provided.
  final AutomatedReasoningPolicyIterativeRefinementContent?
      iterativeRefinementContent;

  /// The assets and instructions needed for a policy repair workflow, including
  /// repair annotations and guidance.
  final AutomatedReasoningPolicyBuildWorkflowRepairContent? policyRepairAssets;

  AutomatedReasoningPolicyWorkflowTypeContent({
    this.documents,
    this.generateFidelityReportContent,
    this.iterativeRefinementContent,
    this.policyRepairAssets,
  });

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    final generateFidelityReportContent = this.generateFidelityReportContent;
    final iterativeRefinementContent = this.iterativeRefinementContent;
    final policyRepairAssets = this.policyRepairAssets;
    return {
      if (documents != null) 'documents': documents,
      if (generateFidelityReportContent != null)
        'generateFidelityReportContent': generateFidelityReportContent,
      if (iterativeRefinementContent != null)
        'iterativeRefinementContent': iterativeRefinementContent,
      if (policyRepairAssets != null) 'policyRepairAssets': policyRepairAssets,
    };
  }
}

/// Contains content and instructions for repairing or improving an existing
/// Automated Reasoning policy.
///
/// @nodoc
class AutomatedReasoningPolicyBuildWorkflowRepairContent {
  /// Specific annotations or modifications to apply during the policy repair
  /// process, such as rule corrections or variable updates.
  final List<AutomatedReasoningPolicyAnnotation> annotations;

  AutomatedReasoningPolicyBuildWorkflowRepairContent({
    required this.annotations,
  });

  Map<String, dynamic> toJson() {
    final annotations = this.annotations;
    return {
      'annotations': annotations,
    };
  }
}

/// Configuration for generating a fidelity report, which can either analyze new
/// documents or update an existing fidelity report with a new policy
/// definition.
///
/// @nodoc
class AutomatedReasoningPolicyGenerateFidelityReportContent {
  /// Source documents to analyze for generating a new fidelity report. The
  /// documents will be processed to create atomic statements and grounding
  /// information.
  final List<AutomatedReasoningPolicyBuildWorkflowDocument>? documents;

  AutomatedReasoningPolicyGenerateFidelityReportContent({
    this.documents,
  });

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    return {
      if (documents != null) 'documents': documents,
    };
  }
}

/// Configuration for an iterative policy refinement workflow, including source
/// documents to process and optional feedback to guide the refinement.
///
/// @nodoc
class AutomatedReasoningPolicyIterativeRefinementContent {
  /// Source documents used for iterative policy refinement. These documents
  /// provide context for refining the policy definition.
  final List<AutomatedReasoningPolicyBuildWorkflowDocument> documents;

  /// Optional feedback to guide the iterative refinement workflow. Provide
  /// specific instructions or constraints for policy refinement.
  final String? feedback;

  AutomatedReasoningPolicyIterativeRefinementContent({
    required this.documents,
    this.feedback,
  });

  Map<String, dynamic> toJson() {
    final documents = this.documents;
    final feedback = this.feedback;
    return {
      'documents': documents,
      if (feedback != null) 'feedback': feedback,
    };
  }
}

/// Represents a source document used in the policy build workflow, containing
/// the content and metadata needed for policy generation.
///
/// @nodoc
class AutomatedReasoningPolicyBuildWorkflowDocument {
  /// The actual content of the source document that will be analyzed to extract
  /// policy rules and concepts.
  final Uint8List document;

  /// The MIME type of the document content (e.g., text/plain, application/pdf,
  /// text/markdown).
  final AutomatedReasoningPolicyBuildDocumentContentType documentContentType;

  /// A descriptive name for the document that helps identify its purpose and
  /// content.
  final String documentName;

  /// A detailed description of the document's content and how it should be used
  /// in the policy generation process.
  final String? documentDescription;

  AutomatedReasoningPolicyBuildWorkflowDocument({
    required this.document,
    required this.documentContentType,
    required this.documentName,
    this.documentDescription,
  });

  Map<String, dynamic> toJson() {
    final document = this.document;
    final documentContentType = this.documentContentType;
    final documentName = this.documentName;
    final documentDescription = this.documentDescription;
    return {
      'document': base64Encode(document),
      'documentContentType': documentContentType.value,
      'documentName': documentName,
      if (documentDescription != null)
        'documentDescription': documentDescription,
    };
  }
}

/// @nodoc
class AutomatedReasoningPolicyBuildDocumentContentType {
  static const pdf = AutomatedReasoningPolicyBuildDocumentContentType._('pdf');
  static const txt = AutomatedReasoningPolicyBuildDocumentContentType._('txt');

  final String value;

  const AutomatedReasoningPolicyBuildDocumentContentType._(this.value);

  static const values = [pdf, txt];

  static AutomatedReasoningPolicyBuildDocumentContentType fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              AutomatedReasoningPolicyBuildDocumentContentType._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningPolicyBuildDocumentContentType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a variable in an Automated Reasoning policy. Variables represent
/// concepts that can have values assigned during natural language translation.
///
/// @nodoc
class AutomatedReasoningPolicyDefinitionVariable {
  /// The description of the variable that explains what it represents and how
  /// users might refer to it. Clear and comprehensive descriptions are essential
  /// for accurate natural language translation.
  final String description;

  /// The name of the variable. Use descriptive names that clearly indicate the
  /// concept being represented.
  final String name;

  /// The data type of the variable. Valid types include bool, int, real, enum,
  /// and custom types that you can provide.
  final String type;

  AutomatedReasoningPolicyDefinitionVariable({
    required this.description,
    required this.name,
    required this.type,
  });

  factory AutomatedReasoningPolicyDefinitionVariable.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDefinitionVariable(
      description: (json['description'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final name = this.name;
    final type = this.type;
    return {
      'description': description,
      'name': name,
      'type': type,
    };
  }
}

/// Represents a formal logic rule in an Automated Reasoning policy. For
/// example, rules can be expressed as if-then statements that define logical
/// constraints.
///
/// @nodoc
class AutomatedReasoningPolicyDefinitionRule {
  /// The formal logic expression of the rule.
  final String expression;

  /// The unique identifier of the rule within the policy.
  final String id;

  /// The human-readable form of the rule expression, often in natural language or
  /// simplified notation.
  final String? alternateExpression;

  AutomatedReasoningPolicyDefinitionRule({
    required this.expression,
    required this.id,
    this.alternateExpression,
  });

  factory AutomatedReasoningPolicyDefinitionRule.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDefinitionRule(
      expression: (json['expression'] as String?) ?? '',
      id: (json['id'] as String?) ?? '',
      alternateExpression: json['alternateExpression'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expression = this.expression;
    final id = this.id;
    final alternateExpression = this.alternateExpression;
    return {
      'expression': expression,
      'id': id,
      if (alternateExpression != null)
        'alternateExpression': alternateExpression,
    };
  }
}

/// Represents a custom user-defined viarble type in an Automated Reasoning
/// policy. Types are enum-based and provide additional context beyond
/// predefined variable types.
///
/// @nodoc
class AutomatedReasoningPolicyDefinitionType {
  /// The name of the custom type.
  final String name;

  /// The possible values for this enum-based type, each with its own description.
  final List<AutomatedReasoningPolicyDefinitionTypeValue> values;

  /// The description of what the custom type represents.
  final String? description;

  AutomatedReasoningPolicyDefinitionType({
    required this.name,
    required this.values,
    this.description,
  });

  factory AutomatedReasoningPolicyDefinitionType.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDefinitionType(
      name: (json['name'] as String?) ?? '',
      values: ((json['values'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyDefinitionTypeValue.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    final description = this.description;
    return {
      'name': name,
      'values': values,
      if (description != null) 'description': description,
    };
  }
}

/// Contains the results of testing an Automated Reasoning policy against
/// various scenarios and validation checks.
///
/// @nodoc
class AutomatedReasoningPolicyTestResult {
  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy that was
  /// tested.
  final String policyArn;

  /// The test case that was executed, including the input content, expected
  /// results, and configuration parameters used during validation.
  final AutomatedReasoningPolicyTestCase testCase;

  /// The overall status of the test run (e.g., COMPLETED, FAILED, IN_PROGRESS).
  final AutomatedReasoningPolicyTestRunStatus testRunStatus;

  /// The timestamp when the test results were last updated.
  final DateTime updatedAt;

  /// A summary of all test findings, aggregated to provide an overall assessment
  /// of policy quality and correctness.
  final AutomatedReasoningCheckResult? aggregatedTestFindingsResult;

  /// Detailed findings from the test run, including any issues, violations, or
  /// unexpected behaviors discovered.
  final List<AutomatedReasoningCheckFinding>? testFindings;

  /// The overall result of the test run, indicating whether the policy passed or
  /// failed validation.
  final AutomatedReasoningPolicyTestRunResult? testRunResult;

  AutomatedReasoningPolicyTestResult({
    required this.policyArn,
    required this.testCase,
    required this.testRunStatus,
    required this.updatedAt,
    this.aggregatedTestFindingsResult,
    this.testFindings,
    this.testRunResult,
  });

  factory AutomatedReasoningPolicyTestResult.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyTestResult(
      policyArn: (json['policyArn'] as String?) ?? '',
      testCase: AutomatedReasoningPolicyTestCase.fromJson(
          (json['testCase'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      testRunStatus: AutomatedReasoningPolicyTestRunStatus.fromString(
          (json['testRunStatus'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      aggregatedTestFindingsResult:
          (json['aggregatedTestFindingsResult'] as String?)
              ?.let(AutomatedReasoningCheckResult.fromString),
      testFindings: (json['testFindings'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningCheckFinding.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      testRunResult: (json['testRunResult'] as String?)
          ?.let(AutomatedReasoningPolicyTestRunResult.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final policyArn = this.policyArn;
    final testCase = this.testCase;
    final testRunStatus = this.testRunStatus;
    final updatedAt = this.updatedAt;
    final aggregatedTestFindingsResult = this.aggregatedTestFindingsResult;
    final testFindings = this.testFindings;
    final testRunResult = this.testRunResult;
    return {
      'policyArn': policyArn,
      'testCase': testCase,
      'testRunStatus': testRunStatus.value,
      'updatedAt': iso8601ToJson(updatedAt),
      if (aggregatedTestFindingsResult != null)
        'aggregatedTestFindingsResult': aggregatedTestFindingsResult.value,
      if (testFindings != null) 'testFindings': testFindings,
      if (testRunResult != null) 'testRunResult': testRunResult.value,
    };
  }
}

/// Represents a test for validating an Automated Reasoning policy. tests
/// contain sample inputs and expected outcomes to verify policy behavior.
///
/// @nodoc
class AutomatedReasoningPolicyTestCase {
  /// The timestamp when the test was created.
  final DateTime createdAt;

  /// The output content to be validated by the policy, typically representing a
  /// foundation model response.
  final String guardContent;

  /// The unique identifier of the test.
  final String testCaseId;

  /// The timestamp when the test was last updated.
  final DateTime updatedAt;

  /// The minimum confidence level for logic validation. Content meeting this
  /// threshold is considered high-confidence and can be validated.
  final double? confidenceThreshold;

  /// The expected result of the Automated Reasoning check for this test.
  final AutomatedReasoningCheckResult? expectedAggregatedFindingsResult;

  /// The input query or prompt that generated the content. This provides context
  /// for the validation.
  final String? queryContent;

  AutomatedReasoningPolicyTestCase({
    required this.createdAt,
    required this.guardContent,
    required this.testCaseId,
    required this.updatedAt,
    this.confidenceThreshold,
    this.expectedAggregatedFindingsResult,
    this.queryContent,
  });

  factory AutomatedReasoningPolicyTestCase.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningPolicyTestCase(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      guardContent: (json['guardContent'] as String?) ?? '',
      testCaseId: (json['testCaseId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      confidenceThreshold: _s.parseJsonDouble(json['confidenceThreshold']),
      expectedAggregatedFindingsResult:
          (json['expectedAggregatedFindingsResult'] as String?)
              ?.let(AutomatedReasoningCheckResult.fromString),
      queryContent: json['queryContent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final guardContent = this.guardContent;
    final testCaseId = this.testCaseId;
    final updatedAt = this.updatedAt;
    final confidenceThreshold = this.confidenceThreshold;
    final expectedAggregatedFindingsResult =
        this.expectedAggregatedFindingsResult;
    final queryContent = this.queryContent;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'guardContent': guardContent,
      'testCaseId': testCaseId,
      'updatedAt': iso8601ToJson(updatedAt),
      if (confidenceThreshold != null)
        'confidenceThreshold': _s.encodeJsonDouble(confidenceThreshold),
      if (expectedAggregatedFindingsResult != null)
        'expectedAggregatedFindingsResult':
            expectedAggregatedFindingsResult.value,
      if (queryContent != null) 'queryContent': queryContent,
    };
  }
}

/// @nodoc
class AutomatedReasoningPolicyTestRunStatus {
  static const notStarted =
      AutomatedReasoningPolicyTestRunStatus._('NOT_STARTED');
  static const scheduled = AutomatedReasoningPolicyTestRunStatus._('SCHEDULED');
  static const inProgress =
      AutomatedReasoningPolicyTestRunStatus._('IN_PROGRESS');
  static const completed = AutomatedReasoningPolicyTestRunStatus._('COMPLETED');
  static const failed = AutomatedReasoningPolicyTestRunStatus._('FAILED');

  final String value;

  const AutomatedReasoningPolicyTestRunStatus._(this.value);

  static const values = [notStarted, scheduled, inProgress, completed, failed];

  static AutomatedReasoningPolicyTestRunStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningPolicyTestRunStatus._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningPolicyTestRunStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AutomatedReasoningPolicyTestRunResult {
  static const passed = AutomatedReasoningPolicyTestRunResult._('PASSED');
  static const failed = AutomatedReasoningPolicyTestRunResult._('FAILED');

  final String value;

  const AutomatedReasoningPolicyTestRunResult._(this.value);

  static const values = [passed, failed];

  static AutomatedReasoningPolicyTestRunResult fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningPolicyTestRunResult._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningPolicyTestRunResult && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the result of an Automated Reasoning validation check, indicating
/// whether the content is logically valid, invalid, or falls into other
/// categories based on the policy rules.
///
/// @nodoc
class AutomatedReasoningCheckFinding {
  /// Indicates that Automated Reasoning cannot make a statement about the claims.
  /// This can happen if the premises are logically incorrect, or if there is a
  /// conflict within the Automated Reasoning policy itself.
  final AutomatedReasoningCheckImpossibleFinding? impossible;

  /// Indicates that the claims are false. The claims are not implied by the
  /// premises and Automated Reasoning policy. Furthermore, there exist different
  /// claims that are consistent with the premises and Automated Reasoning policy.
  final AutomatedReasoningCheckInvalidFinding? invalid;

  /// Identifies that some or all of the input prompt wasn't translated into
  /// logic. This can happen if the input isn't relevant to the Automated
  /// Reasoning policy, or if the policy doesn't have variables to model relevant
  /// input.
  final AutomatedReasoningCheckNoTranslationsFinding? noTranslations;

  /// Indicates that the claims can be true or false. It depends on what
  /// assumptions are made for the claim to be implied from the premises and
  /// Automated Reasoning policy rules. In this situation, different assumptions
  /// can make input claims false and alternative claims true.
  final AutomatedReasoningCheckSatisfiableFinding? satisfiable;

  /// Indicates that the input contains too much information for Automated
  /// Reasoning to process within its latency limits.
  final AutomatedReasoningCheckTooComplexFinding? tooComplex;

  /// Indicates that an ambiguity was detected in the translation, making it
  /// unsound to continue with validity checking. Additional context or follow-up
  /// questions might be needed to get translation to succeed.
  final AutomatedReasoningCheckTranslationAmbiguousFinding?
      translationAmbiguous;

  /// Indicates that the claims are true. The claims are implied by the premises
  /// and the Automated Reasoning policy. Given the Automated Reasoning policy and
  /// premises, it is not possible for these claims to be false.
  final AutomatedReasoningCheckValidFinding? valid;

  AutomatedReasoningCheckFinding({
    this.impossible,
    this.invalid,
    this.noTranslations,
    this.satisfiable,
    this.tooComplex,
    this.translationAmbiguous,
    this.valid,
  });

  factory AutomatedReasoningCheckFinding.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningCheckFinding(
      impossible: json['impossible'] != null
          ? AutomatedReasoningCheckImpossibleFinding.fromJson(
              json['impossible'] as Map<String, dynamic>)
          : null,
      invalid: json['invalid'] != null
          ? AutomatedReasoningCheckInvalidFinding.fromJson(
              json['invalid'] as Map<String, dynamic>)
          : null,
      noTranslations: json['noTranslations'] != null
          ? AutomatedReasoningCheckNoTranslationsFinding.fromJson(
              json['noTranslations'] as Map<String, dynamic>)
          : null,
      satisfiable: json['satisfiable'] != null
          ? AutomatedReasoningCheckSatisfiableFinding.fromJson(
              json['satisfiable'] as Map<String, dynamic>)
          : null,
      tooComplex: json['tooComplex'] != null
          ? AutomatedReasoningCheckTooComplexFinding.fromJson(
              json['tooComplex'] as Map<String, dynamic>)
          : null,
      translationAmbiguous: json['translationAmbiguous'] != null
          ? AutomatedReasoningCheckTranslationAmbiguousFinding.fromJson(
              json['translationAmbiguous'] as Map<String, dynamic>)
          : null,
      valid: json['valid'] != null
          ? AutomatedReasoningCheckValidFinding.fromJson(
              json['valid'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final impossible = this.impossible;
    final invalid = this.invalid;
    final noTranslations = this.noTranslations;
    final satisfiable = this.satisfiable;
    final tooComplex = this.tooComplex;
    final translationAmbiguous = this.translationAmbiguous;
    final valid = this.valid;
    return {
      if (impossible != null) 'impossible': impossible,
      if (invalid != null) 'invalid': invalid,
      if (noTranslations != null) 'noTranslations': noTranslations,
      if (satisfiable != null) 'satisfiable': satisfiable,
      if (tooComplex != null) 'tooComplex': tooComplex,
      if (translationAmbiguous != null)
        'translationAmbiguous': translationAmbiguous,
      if (valid != null) 'valid': valid,
    };
  }
}

/// Indicates that the claims are definitively true and logically implied by the
/// premises, with no possible alternative interpretations.
///
/// @nodoc
class AutomatedReasoningCheckValidFinding {
  /// An example scenario demonstrating how the claims are logically true.
  final AutomatedReasoningCheckScenario? claimsTrueScenario;

  /// Indication of a logic issue with the translation without needing to consider
  /// the automated reasoning policy rules.
  final AutomatedReasoningCheckLogicWarning? logicWarning;

  /// The automated reasoning policy rules that support why this result is
  /// considered valid.
  final List<AutomatedReasoningCheckRule>? supportingRules;

  /// The logical translation of the input that this finding validates.
  final AutomatedReasoningCheckTranslation? translation;

  AutomatedReasoningCheckValidFinding({
    this.claimsTrueScenario,
    this.logicWarning,
    this.supportingRules,
    this.translation,
  });

  factory AutomatedReasoningCheckValidFinding.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckValidFinding(
      claimsTrueScenario: json['claimsTrueScenario'] != null
          ? AutomatedReasoningCheckScenario.fromJson(
              json['claimsTrueScenario'] as Map<String, dynamic>)
          : null,
      logicWarning: json['logicWarning'] != null
          ? AutomatedReasoningCheckLogicWarning.fromJson(
              json['logicWarning'] as Map<String, dynamic>)
          : null,
      supportingRules: (json['supportingRules'] as List?)
          ?.nonNulls
          .map((e) =>
              AutomatedReasoningCheckRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      translation: json['translation'] != null
          ? AutomatedReasoningCheckTranslation.fromJson(
              json['translation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final claimsTrueScenario = this.claimsTrueScenario;
    final logicWarning = this.logicWarning;
    final supportingRules = this.supportingRules;
    final translation = this.translation;
    return {
      if (claimsTrueScenario != null) 'claimsTrueScenario': claimsTrueScenario,
      if (logicWarning != null) 'logicWarning': logicWarning,
      if (supportingRules != null) 'supportingRules': supportingRules,
      if (translation != null) 'translation': translation,
    };
  }
}

/// Indicates that the claims are logically false and contradictory to the
/// established rules or premises.
///
/// @nodoc
class AutomatedReasoningCheckInvalidFinding {
  /// The automated reasoning policy rules that contradict the claims in the
  /// input.
  final List<AutomatedReasoningCheckRule>? contradictingRules;

  /// Indication of a logic issue with the translation without needing to consider
  /// the automated reasoning policy rules.
  final AutomatedReasoningCheckLogicWarning? logicWarning;

  /// The logical translation of the input that this finding invalidates.
  final AutomatedReasoningCheckTranslation? translation;

  AutomatedReasoningCheckInvalidFinding({
    this.contradictingRules,
    this.logicWarning,
    this.translation,
  });

  factory AutomatedReasoningCheckInvalidFinding.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckInvalidFinding(
      contradictingRules: (json['contradictingRules'] as List?)
          ?.nonNulls
          .map((e) =>
              AutomatedReasoningCheckRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      logicWarning: json['logicWarning'] != null
          ? AutomatedReasoningCheckLogicWarning.fromJson(
              json['logicWarning'] as Map<String, dynamic>)
          : null,
      translation: json['translation'] != null
          ? AutomatedReasoningCheckTranslation.fromJson(
              json['translation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contradictingRules = this.contradictingRules;
    final logicWarning = this.logicWarning;
    final translation = this.translation;
    return {
      if (contradictingRules != null) 'contradictingRules': contradictingRules,
      if (logicWarning != null) 'logicWarning': logicWarning,
      if (translation != null) 'translation': translation,
    };
  }
}

/// Indicates that the claims could be either true or false depending on
/// additional assumptions not provided in the input.
///
/// @nodoc
class AutomatedReasoningCheckSatisfiableFinding {
  /// An example scenario demonstrating how the claims could be logically false.
  final AutomatedReasoningCheckScenario? claimsFalseScenario;

  /// An example scenario demonstrating how the claims could be logically true.
  final AutomatedReasoningCheckScenario? claimsTrueScenario;

  /// Indication of a logic issue with the translation without needing to consider
  /// the automated reasoning policy rules.
  final AutomatedReasoningCheckLogicWarning? logicWarning;

  /// The logical translation of the input that this finding evaluates.
  final AutomatedReasoningCheckTranslation? translation;

  AutomatedReasoningCheckSatisfiableFinding({
    this.claimsFalseScenario,
    this.claimsTrueScenario,
    this.logicWarning,
    this.translation,
  });

  factory AutomatedReasoningCheckSatisfiableFinding.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckSatisfiableFinding(
      claimsFalseScenario: json['claimsFalseScenario'] != null
          ? AutomatedReasoningCheckScenario.fromJson(
              json['claimsFalseScenario'] as Map<String, dynamic>)
          : null,
      claimsTrueScenario: json['claimsTrueScenario'] != null
          ? AutomatedReasoningCheckScenario.fromJson(
              json['claimsTrueScenario'] as Map<String, dynamic>)
          : null,
      logicWarning: json['logicWarning'] != null
          ? AutomatedReasoningCheckLogicWarning.fromJson(
              json['logicWarning'] as Map<String, dynamic>)
          : null,
      translation: json['translation'] != null
          ? AutomatedReasoningCheckTranslation.fromJson(
              json['translation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final claimsFalseScenario = this.claimsFalseScenario;
    final claimsTrueScenario = this.claimsTrueScenario;
    final logicWarning = this.logicWarning;
    final translation = this.translation;
    return {
      if (claimsFalseScenario != null)
        'claimsFalseScenario': claimsFalseScenario,
      if (claimsTrueScenario != null) 'claimsTrueScenario': claimsTrueScenario,
      if (logicWarning != null) 'logicWarning': logicWarning,
      if (translation != null) 'translation': translation,
    };
  }
}

/// Indicates that no valid claims can be made due to logical contradictions in
/// the premises or rules.
///
/// @nodoc
class AutomatedReasoningCheckImpossibleFinding {
  /// The automated reasoning policy rules that contradict the claims and/or
  /// premises in the input.
  final List<AutomatedReasoningCheckRule>? contradictingRules;

  /// Indication of a logic issue with the translation without needing to consider
  /// the automated reasoning policy rules.
  final AutomatedReasoningCheckLogicWarning? logicWarning;

  /// The logical translation of the input that this finding evaluates.
  final AutomatedReasoningCheckTranslation? translation;

  AutomatedReasoningCheckImpossibleFinding({
    this.contradictingRules,
    this.logicWarning,
    this.translation,
  });

  factory AutomatedReasoningCheckImpossibleFinding.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckImpossibleFinding(
      contradictingRules: (json['contradictingRules'] as List?)
          ?.nonNulls
          .map((e) =>
              AutomatedReasoningCheckRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      logicWarning: json['logicWarning'] != null
          ? AutomatedReasoningCheckLogicWarning.fromJson(
              json['logicWarning'] as Map<String, dynamic>)
          : null,
      translation: json['translation'] != null
          ? AutomatedReasoningCheckTranslation.fromJson(
              json['translation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contradictingRules = this.contradictingRules;
    final logicWarning = this.logicWarning;
    final translation = this.translation;
    return {
      if (contradictingRules != null) 'contradictingRules': contradictingRules,
      if (logicWarning != null) 'logicWarning': logicWarning,
      if (translation != null) 'translation': translation,
    };
  }
}

/// Indicates that the input has multiple valid logical interpretations,
/// requiring additional context or clarification.
///
/// @nodoc
class AutomatedReasoningCheckTranslationAmbiguousFinding {
  /// Scenarios showing how the different translation options differ in meaning.
  final List<AutomatedReasoningCheckScenario>? differenceScenarios;

  /// Different logical interpretations that were detected during translation of
  /// the input.
  final List<AutomatedReasoningCheckTranslationOption>? options;

  AutomatedReasoningCheckTranslationAmbiguousFinding({
    this.differenceScenarios,
    this.options,
  });

  factory AutomatedReasoningCheckTranslationAmbiguousFinding.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckTranslationAmbiguousFinding(
      differenceScenarios: (json['differenceScenarios'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningCheckScenario.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      options: (json['options'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningCheckTranslationOption.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final differenceScenarios = this.differenceScenarios;
    final options = this.options;
    return {
      if (differenceScenarios != null)
        'differenceScenarios': differenceScenarios,
      if (options != null) 'options': options,
    };
  }
}

/// Indicates that the input exceeds the processing capacity due to the volume
/// or complexity of the logical information.
///
/// @nodoc
class AutomatedReasoningCheckTooComplexFinding {
  AutomatedReasoningCheckTooComplexFinding();

  factory AutomatedReasoningCheckTooComplexFinding.fromJson(
      Map<String, dynamic> _) {
    return AutomatedReasoningCheckTooComplexFinding();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Indicates that no relevant logical information could be extracted from the
/// input for validation.
///
/// @nodoc
class AutomatedReasoningCheckNoTranslationsFinding {
  AutomatedReasoningCheckNoTranslationsFinding();

  factory AutomatedReasoningCheckNoTranslationsFinding.fromJson(
      Map<String, dynamic> _) {
    return AutomatedReasoningCheckNoTranslationsFinding();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a logical scenario where claims can be evaluated as true or
/// false, containing specific logical assignments.
///
/// @nodoc
class AutomatedReasoningCheckScenario {
  /// List of logical assignments and statements that define this scenario.
  final List<AutomatedReasoningLogicStatement>? statements;

  AutomatedReasoningCheckScenario({
    this.statements,
  });

  factory AutomatedReasoningCheckScenario.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningCheckScenario(
      statements: (json['statements'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningLogicStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final statements = this.statements;
    return {
      if (statements != null) 'statements': statements,
    };
  }
}

/// Represents a logical statement that can be expressed both in formal logic
/// notation and natural language, providing dual representations for better
/// understanding and validation.
///
/// @nodoc
class AutomatedReasoningLogicStatement {
  /// The formal logic representation of the statement using mathematical notation
  /// and logical operators.
  final String logic;

  /// The natural language representation of the logical statement, providing a
  /// human-readable interpretation of the formal logic.
  final String? naturalLanguage;

  AutomatedReasoningLogicStatement({
    required this.logic,
    this.naturalLanguage,
  });

  factory AutomatedReasoningLogicStatement.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningLogicStatement(
      logic: (json['logic'] as String?) ?? '',
      naturalLanguage: json['naturalLanguage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logic = this.logic;
    final naturalLanguage = this.naturalLanguage;
    return {
      'logic': logic,
      if (naturalLanguage != null) 'naturalLanguage': naturalLanguage,
    };
  }
}

/// Represents one possible logical interpretation of ambiguous input content.
///
/// @nodoc
class AutomatedReasoningCheckTranslationOption {
  /// Different logical interpretations that were detected during translation of
  /// the input.
  final List<AutomatedReasoningCheckTranslation>? translations;

  AutomatedReasoningCheckTranslationOption({
    this.translations,
  });

  factory AutomatedReasoningCheckTranslationOption.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckTranslationOption(
      translations: (json['translations'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningCheckTranslation.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final translations = this.translations;
    return {
      if (translations != null) 'translations': translations,
    };
  }
}

/// Contains the logical translation of natural language input into formal
/// logical statements, including premises, claims, and confidence scores.
///
/// @nodoc
class AutomatedReasoningCheckTranslation {
  /// The logical statements that are being validated against the premises and
  /// policy rules.
  final List<AutomatedReasoningLogicStatement> claims;

  /// A confidence score between 0 and 1 indicating how certain the system is
  /// about the logical translation.
  final double confidence;

  /// The logical statements that serve as the foundation or assumptions for the
  /// claims.
  final List<AutomatedReasoningLogicStatement>? premises;

  /// References to portions of the original input text that correspond to the
  /// claims but could not be fully translated.
  final List<AutomatedReasoningCheckInputTextReference>? untranslatedClaims;

  /// References to portions of the original input text that correspond to the
  /// premises but could not be fully translated.
  final List<AutomatedReasoningCheckInputTextReference>? untranslatedPremises;

  AutomatedReasoningCheckTranslation({
    required this.claims,
    required this.confidence,
    this.premises,
    this.untranslatedClaims,
    this.untranslatedPremises,
  });

  factory AutomatedReasoningCheckTranslation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckTranslation(
      claims: ((json['claims'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningLogicStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      confidence: _s.parseJsonDouble(json['confidence']) ?? 0,
      premises: (json['premises'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningLogicStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      untranslatedClaims: (json['untranslatedClaims'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningCheckInputTextReference.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      untranslatedPremises: (json['untranslatedPremises'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningCheckInputTextReference.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final claims = this.claims;
    final confidence = this.confidence;
    final premises = this.premises;
    final untranslatedClaims = this.untranslatedClaims;
    final untranslatedPremises = this.untranslatedPremises;
    return {
      'claims': claims,
      'confidence': _s.encodeJsonDouble(confidence),
      if (premises != null) 'premises': premises,
      if (untranslatedClaims != null) 'untranslatedClaims': untranslatedClaims,
      if (untranslatedPremises != null)
        'untranslatedPremises': untranslatedPremises,
    };
  }
}

/// References a portion of the original input text that corresponds to logical
/// elements.
///
/// @nodoc
class AutomatedReasoningCheckInputTextReference {
  /// The specific text from the original input that this reference points to.
  final String? text;

  AutomatedReasoningCheckInputTextReference({
    this.text,
  });

  factory AutomatedReasoningCheckInputTextReference.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckInputTextReference(
      text: json['text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'text': text,
    };
  }
}

/// Identifies logical issues in the translated statements that exist
/// independent of any policy rules, such as statements that are always true or
/// always false.
///
/// @nodoc
class AutomatedReasoningCheckLogicWarning {
  /// The logical statements that are validated while assuming the policy and
  /// premises.
  final List<AutomatedReasoningLogicStatement>? claims;

  /// The logical statements that serve as premises under which the claims are
  /// validated.
  final List<AutomatedReasoningLogicStatement>? premises;

  /// The category of the detected logical issue, such as statements that are
  /// always true or always false.
  final AutomatedReasoningCheckLogicWarningType? type;

  AutomatedReasoningCheckLogicWarning({
    this.claims,
    this.premises,
    this.type,
  });

  factory AutomatedReasoningCheckLogicWarning.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningCheckLogicWarning(
      claims: (json['claims'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningLogicStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      premises: (json['premises'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningLogicStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)
          ?.let(AutomatedReasoningCheckLogicWarningType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final claims = this.claims;
    final premises = this.premises;
    final type = this.type;
    return {
      if (claims != null) 'claims': claims,
      if (premises != null) 'premises': premises,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class AutomatedReasoningCheckLogicWarningType {
  static const alwaysTrue =
      AutomatedReasoningCheckLogicWarningType._('ALWAYS_TRUE');
  static const alwaysFalse =
      AutomatedReasoningCheckLogicWarningType._('ALWAYS_FALSE');

  final String value;

  const AutomatedReasoningCheckLogicWarningType._(this.value);

  static const values = [alwaysTrue, alwaysFalse];

  static AutomatedReasoningCheckLogicWarningType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningCheckLogicWarningType._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningCheckLogicWarningType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// References a specific automated reasoning policy rule that was applied
/// during evaluation.
///
/// @nodoc
class AutomatedReasoningCheckRule {
  /// The unique identifier of the automated reasoning rule.
  final String? id;

  /// The ARN of the automated reasoning policy version that contains this rule.
  final String? policyVersionArn;

  AutomatedReasoningCheckRule({
    this.id,
    this.policyVersionArn,
  });

  factory AutomatedReasoningCheckRule.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningCheckRule(
      id: json['id'] as String?,
      policyVersionArn: json['policyVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final policyVersionArn = this.policyVersionArn;
    return {
      if (id != null) 'id': id,
      if (policyVersionArn != null) 'policyVersionArn': policyVersionArn,
    };
  }
}

/// Provides a summary of a policy build workflow, including its current status,
/// timing information, and key identifiers.
///
/// @nodoc
class AutomatedReasoningPolicyBuildWorkflowSummary {
  /// The unique identifier of the build workflow.
  final String buildWorkflowId;

  /// The type of build workflow (e.g., DOCUMENT_INGESTION, POLICY_REPAIR).
  final AutomatedReasoningPolicyBuildWorkflowType buildWorkflowType;

  /// The timestamp when the build workflow was created.
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the Automated Reasoning policy associated
  /// with this build workflow.
  final String policyArn;

  /// The current status of the build workflow (e.g., RUNNING, COMPLETED, FAILED,
  /// CANCELLED).
  final AutomatedReasoningPolicyBuildWorkflowStatus status;

  /// The timestamp when the build workflow was last updated.
  final DateTime updatedAt;

  AutomatedReasoningPolicyBuildWorkflowSummary({
    required this.buildWorkflowId,
    required this.buildWorkflowType,
    required this.createdAt,
    required this.policyArn,
    required this.status,
    required this.updatedAt,
  });

  factory AutomatedReasoningPolicyBuildWorkflowSummary.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildWorkflowSummary(
      buildWorkflowId: (json['buildWorkflowId'] as String?) ?? '',
      buildWorkflowType: AutomatedReasoningPolicyBuildWorkflowType.fromString(
          (json['buildWorkflowType'] as String?) ?? ''),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      policyArn: (json['policyArn'] as String?) ?? '',
      status: AutomatedReasoningPolicyBuildWorkflowStatus.fromString(
          (json['status'] as String?) ?? ''),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final buildWorkflowId = this.buildWorkflowId;
    final buildWorkflowType = this.buildWorkflowType;
    final createdAt = this.createdAt;
    final policyArn = this.policyArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      'buildWorkflowId': buildWorkflowId,
      'buildWorkflowType': buildWorkflowType.value,
      'createdAt': iso8601ToJson(createdAt),
      'policyArn': policyArn,
      'status': status.value,
      'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// @nodoc
class AutomatedReasoningPolicyBuildWorkflowStatus {
  static const scheduled =
      AutomatedReasoningPolicyBuildWorkflowStatus._('SCHEDULED');
  static const cancelRequested =
      AutomatedReasoningPolicyBuildWorkflowStatus._('CANCEL_REQUESTED');
  static const preprocessing =
      AutomatedReasoningPolicyBuildWorkflowStatus._('PREPROCESSING');
  static const building =
      AutomatedReasoningPolicyBuildWorkflowStatus._('BUILDING');
  static const testing =
      AutomatedReasoningPolicyBuildWorkflowStatus._('TESTING');
  static const completed =
      AutomatedReasoningPolicyBuildWorkflowStatus._('COMPLETED');
  static const failed = AutomatedReasoningPolicyBuildWorkflowStatus._('FAILED');
  static const cancelled =
      AutomatedReasoningPolicyBuildWorkflowStatus._('CANCELLED');

  final String value;

  const AutomatedReasoningPolicyBuildWorkflowStatus._(this.value);

  static const values = [
    scheduled,
    cancelRequested,
    preprocessing,
    building,
    testing,
    completed,
    failed,
    cancelled
  ];

  static AutomatedReasoningPolicyBuildWorkflowStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningPolicyBuildWorkflowStatus._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningPolicyBuildWorkflowStatus &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a test scenario used to validate an Automated Reasoning policy,
/// including the test conditions and expected outcomes.
///
/// @nodoc
class AutomatedReasoningPolicyScenario {
  /// An alternative way to express the same test scenario, used for validation
  /// and comparison purposes.
  final String alternateExpression;

  /// The expected outcome when this scenario is evaluated against the policy
  /// (e.g., PASS, FAIL, VIOLATION).
  final AutomatedReasoningCheckResult expectedResult;

  /// The logical expression or condition that defines this test scenario.
  final String expression;

  /// The list of rule identifiers that are expected to be triggered or evaluated
  /// by this test scenario.
  final List<String> ruleIds;

  AutomatedReasoningPolicyScenario({
    required this.alternateExpression,
    required this.expectedResult,
    required this.expression,
    required this.ruleIds,
  });

  factory AutomatedReasoningPolicyScenario.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningPolicyScenario(
      alternateExpression: (json['alternateExpression'] as String?) ?? '',
      expectedResult: AutomatedReasoningCheckResult.fromString(
          (json['expectedResult'] as String?) ?? ''),
      expression: (json['expression'] as String?) ?? '',
      ruleIds: ((json['ruleIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final alternateExpression = this.alternateExpression;
    final expectedResult = this.expectedResult;
    final expression = this.expression;
    final ruleIds = this.ruleIds;
    return {
      'alternateExpression': alternateExpression,
      'expectedResult': expectedResult.value,
      'expression': expression,
      'ruleIds': ruleIds,
    };
  }
}

/// Contains the various assets generated during a policy build workflow,
/// including logs, quality reports, test cases, and the final policy
/// definition.
///
/// @nodoc
class AutomatedReasoningPolicyBuildResultAssets {
  /// A manifest listing all available artifacts produced by the build workflow.
  /// This provides a catalog of all assets that can be retrieved, including their
  /// types, names, and identifiers.
  final AutomatedReasoningPolicyBuildResultAssetManifest? assetManifest;

  /// The complete build log containing detailed information about each step in
  /// the policy generation process.
  final AutomatedReasoningPolicyBuildLog? buildLog;

  /// A source document that was used as input during the build workflow. This
  /// allows you to retrieve the original documents that were processed to
  /// generate the policy.
  final AutomatedReasoningPolicySourceDocument? document;

  /// A comprehensive fidelity report that measures how accurately the generated
  /// policy represents the source documents. The report includes coverage and
  /// accuracy scores, along with detailed grounding information for rules and
  /// variables.
  final AutomatedReasoningPolicyFidelityReport? fidelityReport;

  /// A comprehensive test suite generated by the build workflow, providing
  /// validation capabilities for automated reasoning policies.
  final AutomatedReasoningPolicyGeneratedTestCases? generatedTestCases;

  /// The complete policy definition generated by the build workflow, containing
  /// all rules, variables, and custom types extracted from the source documents.
  final AutomatedReasoningPolicyDefinition? policyDefinition;

  /// An entity encompassing all the policy scenarios generated by the build
  /// workflow, which can be used to validate an Automated Reasoning policy.
  final AutomatedReasoningPolicyScenarios? policyScenarios;

  /// A comprehensive report analyzing the quality of the generated policy,
  /// including metrics about rule coverage, potential conflicts, and unused
  /// elements.
  final AutomatedReasoningPolicyDefinitionQualityReport? qualityReport;

  AutomatedReasoningPolicyBuildResultAssets({
    this.assetManifest,
    this.buildLog,
    this.document,
    this.fidelityReport,
    this.generatedTestCases,
    this.policyDefinition,
    this.policyScenarios,
    this.qualityReport,
  });

  factory AutomatedReasoningPolicyBuildResultAssets.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildResultAssets(
      assetManifest: json['assetManifest'] != null
          ? AutomatedReasoningPolicyBuildResultAssetManifest.fromJson(
              json['assetManifest'] as Map<String, dynamic>)
          : null,
      buildLog: json['buildLog'] != null
          ? AutomatedReasoningPolicyBuildLog.fromJson(
              json['buildLog'] as Map<String, dynamic>)
          : null,
      document: json['document'] != null
          ? AutomatedReasoningPolicySourceDocument.fromJson(
              json['document'] as Map<String, dynamic>)
          : null,
      fidelityReport: json['fidelityReport'] != null
          ? AutomatedReasoningPolicyFidelityReport.fromJson(
              json['fidelityReport'] as Map<String, dynamic>)
          : null,
      generatedTestCases: json['generatedTestCases'] != null
          ? AutomatedReasoningPolicyGeneratedTestCases.fromJson(
              json['generatedTestCases'] as Map<String, dynamic>)
          : null,
      policyDefinition: json['policyDefinition'] != null
          ? AutomatedReasoningPolicyDefinition.fromJson(
              json['policyDefinition'] as Map<String, dynamic>)
          : null,
      policyScenarios: json['policyScenarios'] != null
          ? AutomatedReasoningPolicyScenarios.fromJson(
              json['policyScenarios'] as Map<String, dynamic>)
          : null,
      qualityReport: json['qualityReport'] != null
          ? AutomatedReasoningPolicyDefinitionQualityReport.fromJson(
              json['qualityReport'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final assetManifest = this.assetManifest;
    final buildLog = this.buildLog;
    final document = this.document;
    final fidelityReport = this.fidelityReport;
    final generatedTestCases = this.generatedTestCases;
    final policyDefinition = this.policyDefinition;
    final policyScenarios = this.policyScenarios;
    final qualityReport = this.qualityReport;
    return {
      if (assetManifest != null) 'assetManifest': assetManifest,
      if (buildLog != null) 'buildLog': buildLog,
      if (document != null) 'document': document,
      if (fidelityReport != null) 'fidelityReport': fidelityReport,
      if (generatedTestCases != null) 'generatedTestCases': generatedTestCases,
      if (policyDefinition != null) 'policyDefinition': policyDefinition,
      if (policyScenarios != null) 'policyScenarios': policyScenarios,
      if (qualityReport != null) 'qualityReport': qualityReport,
    };
  }
}

/// Provides a comprehensive analysis of the quality and completeness of an
/// Automated Reasoning policy definition, highlighting potential issues and
/// optimization opportunities.
///
/// @nodoc
class AutomatedReasoningPolicyDefinitionQualityReport {
  /// A list of rules that may conflict with each other, potentially leading to
  /// inconsistent policy behavior.
  final List<String> conflictingRules;

  /// Groups of rules that operate on completely separate sets of variables,
  /// indicating the policy may be addressing multiple unrelated concerns.
  final List<AutomatedReasoningPolicyDisjointRuleSet> disjointRuleSets;

  /// The total number of rules defined in the policy.
  final int ruleCount;

  /// The total number of custom types defined in the policy.
  final int typeCount;

  /// A list of type values that are defined but never used in any rules,
  /// indicating potential cleanup opportunities.
  final List<AutomatedReasoningPolicyDefinitionTypeValuePair> unusedTypeValues;

  /// A list of custom types that are defined but not referenced by any variables
  /// or rules, suggesting they may be unnecessary.
  final List<String> unusedTypes;

  /// A list of variables that are defined but not referenced by any rules,
  /// suggesting they may be unnecessary.
  final List<String> unusedVariables;

  /// The total number of variables defined in the policy.
  final int variableCount;

  AutomatedReasoningPolicyDefinitionQualityReport({
    required this.conflictingRules,
    required this.disjointRuleSets,
    required this.ruleCount,
    required this.typeCount,
    required this.unusedTypeValues,
    required this.unusedTypes,
    required this.unusedVariables,
    required this.variableCount,
  });

  factory AutomatedReasoningPolicyDefinitionQualityReport.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDefinitionQualityReport(
      conflictingRules: ((json['conflictingRules'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      disjointRuleSets: ((json['disjointRuleSets'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyDisjointRuleSet.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      ruleCount: (json['ruleCount'] as int?) ?? 0,
      typeCount: (json['typeCount'] as int?) ?? 0,
      unusedTypeValues: ((json['unusedTypeValues'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyDefinitionTypeValuePair.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      unusedTypes: ((json['unusedTypes'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      unusedVariables: ((json['unusedVariables'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      variableCount: (json['variableCount'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final conflictingRules = this.conflictingRules;
    final disjointRuleSets = this.disjointRuleSets;
    final ruleCount = this.ruleCount;
    final typeCount = this.typeCount;
    final unusedTypeValues = this.unusedTypeValues;
    final unusedTypes = this.unusedTypes;
    final unusedVariables = this.unusedVariables;
    final variableCount = this.variableCount;
    return {
      'conflictingRules': conflictingRules,
      'disjointRuleSets': disjointRuleSets,
      'ruleCount': ruleCount,
      'typeCount': typeCount,
      'unusedTypeValues': unusedTypeValues,
      'unusedTypes': unusedTypes,
      'unusedVariables': unusedVariables,
      'variableCount': variableCount,
    };
  }
}

/// Contains detailed logging information about the policy build process,
/// including steps taken, decisions made, and any issues encountered.
///
/// @nodoc
class AutomatedReasoningPolicyBuildLog {
  /// A list of log entries documenting each step in the policy build process,
  /// including timestamps, status, and detailed messages.
  final List<AutomatedReasoningPolicyBuildLogEntry> entries;

  AutomatedReasoningPolicyBuildLog({
    required this.entries,
  });

  factory AutomatedReasoningPolicyBuildLog.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildLog(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyBuildLogEntry.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// Contains a comprehensive test suite generated by the build workflow,
/// providing validation capabilities for automated reasoning policies.
///
/// @nodoc
class AutomatedReasoningPolicyGeneratedTestCases {
  /// Represents a collection of generated test cases.
  final List<AutomatedReasoningPolicyGeneratedTestCase> generatedTestCases;

  AutomatedReasoningPolicyGeneratedTestCases({
    required this.generatedTestCases,
  });

  factory AutomatedReasoningPolicyGeneratedTestCases.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyGeneratedTestCases(
      generatedTestCases: ((json['generatedTestCases'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyGeneratedTestCase.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final generatedTestCases = this.generatedTestCases;
    return {
      'generatedTestCases': generatedTestCases,
    };
  }
}

/// Contains a comprehensive entity encompassing all the scenarios generated by
/// the build workflow, which can be used to validate an Automated Reasoning
/// policy.
///
/// @nodoc
class AutomatedReasoningPolicyScenarios {
  /// Represents a collection of generated policy scenarios.
  final List<AutomatedReasoningPolicyScenario> policyScenarios;

  AutomatedReasoningPolicyScenarios({
    required this.policyScenarios,
  });

  factory AutomatedReasoningPolicyScenarios.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyScenarios(
      policyScenarios: ((json['policyScenarios'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyScenario.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyScenarios = this.policyScenarios;
    return {
      'policyScenarios': policyScenarios,
    };
  }
}

/// A catalog of all artifacts produced by a build workflow, providing a
/// comprehensive list of available assets including their types and
/// identifiers.
///
/// @nodoc
class AutomatedReasoningPolicyBuildResultAssetManifest {
  /// The list of asset entries in the manifest, each describing an available
  /// artifact that can be retrieved.
  final List<AutomatedReasoningPolicyBuildResultAssetManifestEntry> entries;

  AutomatedReasoningPolicyBuildResultAssetManifest({
    required this.entries,
  });

  factory AutomatedReasoningPolicyBuildResultAssetManifest.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildResultAssetManifest(
      entries: ((json['entries'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              AutomatedReasoningPolicyBuildResultAssetManifestEntry.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entries = this.entries;
    return {
      'entries': entries,
    };
  }
}

/// Represents a source document that was processed during a build workflow.
/// Contains the document content, metadata, and a hash for verification.
///
/// @nodoc
class AutomatedReasoningPolicySourceDocument {
  /// The raw content of the source document as a binary blob.
  final Uint8List document;

  /// The MIME type of the document (e.g., application/pdf, text/plain).
  final AutomatedReasoningPolicyBuildDocumentContentType documentContentType;

  /// A SHA-256 hash of the document content, used for verification and integrity
  /// checking.
  final String documentHash;

  /// The name of the source document for identification purposes.
  final String documentName;

  /// An optional description providing context about the document's content and
  /// purpose.
  final String? documentDescription;

  AutomatedReasoningPolicySourceDocument({
    required this.document,
    required this.documentContentType,
    required this.documentHash,
    required this.documentName,
    this.documentDescription,
  });

  factory AutomatedReasoningPolicySourceDocument.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicySourceDocument(
      document: _s.decodeUint8List((json['document'] as String?) ?? ''),
      documentContentType:
          AutomatedReasoningPolicyBuildDocumentContentType.fromString(
              (json['documentContentType'] as String?) ?? ''),
      documentHash: (json['documentHash'] as String?) ?? '',
      documentName: (json['documentName'] as String?) ?? '',
      documentDescription: json['documentDescription'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    final documentContentType = this.documentContentType;
    final documentHash = this.documentHash;
    final documentName = this.documentName;
    final documentDescription = this.documentDescription;
    return {
      'document': base64Encode(document),
      'documentContentType': documentContentType.value,
      'documentHash': documentHash,
      'documentName': documentName,
      if (documentDescription != null)
        'documentDescription': documentDescription,
    };
  }
}

/// A comprehensive analysis report that measures how accurately a generated
/// policy represents the source documents. The report includes coverage and
/// accuracy scores, detailed grounding information linking policy elements to
/// source statements, and annotated document content.
///
/// @nodoc
class AutomatedReasoningPolicyFidelityReport {
  /// A score from 0.0 to 1.0 indicating how accurate the policy rules are
  /// relative to the source documents. A higher score means the policy rules more
  /// faithfully represent the source material.
  final double accuracyScore;

  /// A score from 0.0 to 1.0 indicating how well the policy covers the statements
  /// in the source documents. A higher score means more of the source content is
  /// represented in the policy.
  final double coverageScore;

  /// A list of source documents with their content broken down into atomic
  /// statements and annotated with line numbers for precise referencing.
  final List<AutomatedReasoningPolicyReportSourceDocument> documentSources;

  /// A mapping from rule identifiers to detailed fidelity reports for each rule,
  /// showing which source statements ground each rule and how accurate it is.
  final Map<String, AutomatedReasoningPolicyRuleReport> ruleReports;

  /// A mapping from variable names to detailed fidelity reports for each
  /// variable, showing which source statements ground each variable and how
  /// accurate it is.
  final Map<String, AutomatedReasoningPolicyVariableReport> variableReports;

  AutomatedReasoningPolicyFidelityReport({
    required this.accuracyScore,
    required this.coverageScore,
    required this.documentSources,
    required this.ruleReports,
    required this.variableReports,
  });

  factory AutomatedReasoningPolicyFidelityReport.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyFidelityReport(
      accuracyScore: _s.parseJsonDouble(json['accuracyScore']) ?? 0,
      coverageScore: _s.parseJsonDouble(json['coverageScore']) ?? 0,
      documentSources: ((json['documentSources'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyReportSourceDocument.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      ruleReports: ((json['ruleReports'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k,
              AutomatedReasoningPolicyRuleReport.fromJson(
                  e as Map<String, dynamic>))),
      variableReports: ((json['variableReports'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              k,
              AutomatedReasoningPolicyVariableReport.fromJson(
                  e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final accuracyScore = this.accuracyScore;
    final coverageScore = this.coverageScore;
    final documentSources = this.documentSources;
    final ruleReports = this.ruleReports;
    final variableReports = this.variableReports;
    return {
      'accuracyScore': _s.encodeJsonDouble(accuracyScore),
      'coverageScore': _s.encodeJsonDouble(coverageScore),
      'documentSources': documentSources,
      'ruleReports': ruleReports,
      'variableReports': variableReports,
    };
  }
}

/// Represents a source document that was analyzed during fidelity report
/// generation, including the document's metadata and its content broken down
/// into atomic statements.
///
/// @nodoc
class AutomatedReasoningPolicyReportSourceDocument {
  /// The list of atomic statements extracted from this document, representing the
  /// fundamental units of meaning used for grounding.
  final List<AutomatedReasoningPolicyAtomicStatement> atomicStatements;

  /// The document's content organized into annotated chunks with line number
  /// information for precise referencing.
  final List<AutomatedReasoningPolicyAnnotatedChunk> documentContent;

  /// A SHA-256 hash of the document content, used for verification and ensuring
  /// the document hasn't changed since analysis.
  final String documentHash;

  /// A unique identifier for this document within the fidelity report.
  final String documentId;

  /// The name of the source document that was analyzed.
  final String documentName;

  AutomatedReasoningPolicyReportSourceDocument({
    required this.atomicStatements,
    required this.documentContent,
    required this.documentHash,
    required this.documentId,
    required this.documentName,
  });

  factory AutomatedReasoningPolicyReportSourceDocument.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyReportSourceDocument(
      atomicStatements: ((json['atomicStatements'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyAtomicStatement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      documentContent: ((json['documentContent'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyAnnotatedChunk.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      documentHash: (json['documentHash'] as String?) ?? '',
      documentId: (json['documentId'] as String?) ?? '',
      documentName: (json['documentName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final atomicStatements = this.atomicStatements;
    final documentContent = this.documentContent;
    final documentHash = this.documentHash;
    final documentId = this.documentId;
    final documentName = this.documentName;
    return {
      'atomicStatements': atomicStatements,
      'documentContent': documentContent,
      'documentHash': documentHash,
      'documentId': documentId,
      'documentName': documentName,
    };
  }
}

/// Represents a portion of a source document with line number annotations.
/// Chunks help organize document content for easier navigation and reference.
///
/// @nodoc
class AutomatedReasoningPolicyAnnotatedChunk {
  /// The lines of text contained within this chunk, each annotated with its line
  /// number.
  final List<AutomatedReasoningPolicyAnnotatedContent> content;

  /// The page number where this chunk begins, if the document is divided into
  /// pages.
  final int? pageNumber;

  AutomatedReasoningPolicyAnnotatedChunk({
    required this.content,
    this.pageNumber,
  });

  factory AutomatedReasoningPolicyAnnotatedChunk.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAnnotatedChunk(
      content: ((json['content'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyAnnotatedContent.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      pageNumber: json['pageNumber'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final pageNumber = this.pageNumber;
    return {
      'content': content,
      if (pageNumber != null) 'pageNumber': pageNumber,
    };
  }
}

/// Represents a content element within an annotated chunk. This union type
/// allows for different types of content elements to be included in document
/// chunks, such as individual lines of text with their line numbers.
///
/// @nodoc
class AutomatedReasoningPolicyAnnotatedContent {
  /// An annotated line of text from the source document, including both the line
  /// number and the text content.
  final AutomatedReasoningPolicyAnnotatedLine? line;

  AutomatedReasoningPolicyAnnotatedContent({
    this.line,
  });

  factory AutomatedReasoningPolicyAnnotatedContent.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAnnotatedContent(
      line: json['line'] != null
          ? AutomatedReasoningPolicyAnnotatedLine.fromJson(
              json['line'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final line = this.line;
    return {
      if (line != null) 'line': line,
    };
  }
}

/// Represents a single line of text from a source document, annotated with its
/// line number for precise referencing.
///
/// @nodoc
class AutomatedReasoningPolicyAnnotatedLine {
  /// The line number of this text within the source document.
  final int? lineNumber;

  /// The actual text content of this line from the source document.
  final String? lineText;

  AutomatedReasoningPolicyAnnotatedLine({
    this.lineNumber,
    this.lineText,
  });

  factory AutomatedReasoningPolicyAnnotatedLine.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAnnotatedLine(
      lineNumber: json['lineNumber'] as int?,
      lineText: json['lineText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lineNumber = this.lineNumber;
    final lineText = this.lineText;
    return {
      if (lineNumber != null) 'lineNumber': lineNumber,
      if (lineText != null) 'lineText': lineText,
    };
  }
}

/// Represents a single, indivisible statement extracted from a source document.
/// Atomic statements are the fundamental units used to ground policy rules and
/// variables to their source material.
///
/// @nodoc
class AutomatedReasoningPolicyAtomicStatement {
  /// A unique identifier for this atomic statement within the fidelity report.
  final String id;

  /// Information about where this statement appears in the source document,
  /// including line numbers.
  final AutomatedReasoningPolicyStatementLocation location;

  /// The actual text content of the atomic statement as extracted from the source
  /// document.
  final String text;

  AutomatedReasoningPolicyAtomicStatement({
    required this.id,
    required this.location,
    required this.text,
  });

  factory AutomatedReasoningPolicyAtomicStatement.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAtomicStatement(
      id: (json['id'] as String?) ?? '',
      location: AutomatedReasoningPolicyStatementLocation.fromJson(
          (json['location'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      text: (json['text'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final location = this.location;
    final text = this.text;
    return {
      'id': id,
      'location': location,
      'text': text,
    };
  }
}

/// Describes the location of a statement within a source document using line
/// numbers.
///
/// @nodoc
class AutomatedReasoningPolicyStatementLocation {
  /// The line numbers in the source document where this statement appears.
  final List<int> lines;

  AutomatedReasoningPolicyStatementLocation({
    required this.lines,
  });

  factory AutomatedReasoningPolicyStatementLocation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyStatementLocation(
      lines: ((json['lines'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as int)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lines = this.lines;
    return {
      'lines': lines,
    };
  }
}

/// Provides detailed fidelity analysis for a specific policy variable,
/// including which source document statements support it and how accurate the
/// variable definition is.
///
/// @nodoc
class AutomatedReasoningPolicyVariableReport {
  /// The name of the policy variable being analyzed in this report.
  final String policyVariable;

  /// A textual explanation of the accuracy score, describing why the variable
  /// received this particular accuracy rating.
  final String? accuracyJustification;

  /// A score from 0.0 to 1.0 indicating how accurately this variable represents
  /// concepts from the source material.
  final double? accuracyScore;

  /// Explanations describing how the source statements support and justify this
  /// specific variable definition.
  final List<String>? groundingJustifications;

  /// References to statements from the source documents that provide the basis or
  /// justification for this variable.
  final List<AutomatedReasoningPolicyStatementReference>? groundingStatements;

  AutomatedReasoningPolicyVariableReport({
    required this.policyVariable,
    this.accuracyJustification,
    this.accuracyScore,
    this.groundingJustifications,
    this.groundingStatements,
  });

  factory AutomatedReasoningPolicyVariableReport.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyVariableReport(
      policyVariable: (json['policyVariable'] as String?) ?? '',
      accuracyJustification: json['accuracyJustification'] as String?,
      accuracyScore: _s.parseJsonDouble(json['accuracyScore']),
      groundingJustifications: (json['groundingJustifications'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      groundingStatements: (json['groundingStatements'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningPolicyStatementReference.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final policyVariable = this.policyVariable;
    final accuracyJustification = this.accuracyJustification;
    final accuracyScore = this.accuracyScore;
    final groundingJustifications = this.groundingJustifications;
    final groundingStatements = this.groundingStatements;
    return {
      'policyVariable': policyVariable,
      if (accuracyJustification != null)
        'accuracyJustification': accuracyJustification,
      if (accuracyScore != null)
        'accuracyScore': _s.encodeJsonDouble(accuracyScore),
      if (groundingJustifications != null)
        'groundingJustifications': groundingJustifications,
      if (groundingStatements != null)
        'groundingStatements': groundingStatements,
    };
  }
}

/// References a specific atomic statement within a source document, used to
/// link policy elements back to their source material.
///
/// @nodoc
class AutomatedReasoningPolicyStatementReference {
  /// The unique identifier of the document containing the referenced statement.
  final String documentId;

  /// The unique identifier of the specific atomic statement being referenced.
  final String statementId;

  AutomatedReasoningPolicyStatementReference({
    required this.documentId,
    required this.statementId,
  });

  factory AutomatedReasoningPolicyStatementReference.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyStatementReference(
      documentId: (json['documentId'] as String?) ?? '',
      statementId: (json['statementId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final documentId = this.documentId;
    final statementId = this.statementId;
    return {
      'documentId': documentId,
      'statementId': statementId,
    };
  }
}

/// Provides detailed fidelity analysis for a specific policy rule, including
/// which source document statements support it and how accurate the rule is.
///
/// @nodoc
class AutomatedReasoningPolicyRuleReport {
  /// The identifier of the policy rule being analyzed in this report.
  final String rule;

  /// A textual explanation of the accuracy score, describing why the rule
  /// received this particular accuracy rating.
  final String? accuracyJustification;

  /// A score from 0.0 to 1.0 indicating how accurately this rule represents the
  /// source material.
  final double? accuracyScore;

  /// Explanations describing how the source statements support and justify this
  /// specific rule.
  final List<String>? groundingJustifications;

  /// References to statements from the source documents that provide the basis or
  /// justification for this rule.
  final List<AutomatedReasoningPolicyStatementReference>? groundingStatements;

  AutomatedReasoningPolicyRuleReport({
    required this.rule,
    this.accuracyJustification,
    this.accuracyScore,
    this.groundingJustifications,
    this.groundingStatements,
  });

  factory AutomatedReasoningPolicyRuleReport.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyRuleReport(
      rule: (json['rule'] as String?) ?? '',
      accuracyJustification: json['accuracyJustification'] as String?,
      accuracyScore: _s.parseJsonDouble(json['accuracyScore']),
      groundingJustifications: (json['groundingJustifications'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      groundingStatements: (json['groundingStatements'] as List?)
          ?.nonNulls
          .map((e) => AutomatedReasoningPolicyStatementReference.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    final accuracyJustification = this.accuracyJustification;
    final accuracyScore = this.accuracyScore;
    final groundingJustifications = this.groundingJustifications;
    final groundingStatements = this.groundingStatements;
    return {
      'rule': rule,
      if (accuracyJustification != null)
        'accuracyJustification': accuracyJustification,
      if (accuracyScore != null)
        'accuracyScore': _s.encodeJsonDouble(accuracyScore),
      if (groundingJustifications != null)
        'groundingJustifications': groundingJustifications,
      if (groundingStatements != null)
        'groundingStatements': groundingStatements,
    };
  }
}

/// Represents a single entry in the asset manifest, describing one artifact
/// produced by the build workflow.
///
/// @nodoc
class AutomatedReasoningPolicyBuildResultAssetManifestEntry {
  /// The type of asset (e.g., BUILD_LOG, QUALITY_REPORT, POLICY_DEFINITION,
  /// GENERATED_TEST_CASES, POLICY_SCENARIOS, FIDELITY_REPORT, ASSET_MANIFEST,
  /// SOURCE_DOCUMENT).
  final AutomatedReasoningPolicyBuildResultAssetType assetType;

  /// A unique identifier for the asset, if applicable. Use this ID when
  /// requesting specific assets through the API.
  final String? assetId;

  /// A human-readable name for the asset, if applicable. This helps identify
  /// specific documents or reports within the workflow results.
  final String? assetName;

  AutomatedReasoningPolicyBuildResultAssetManifestEntry({
    required this.assetType,
    this.assetId,
    this.assetName,
  });

  factory AutomatedReasoningPolicyBuildResultAssetManifestEntry.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildResultAssetManifestEntry(
      assetType: AutomatedReasoningPolicyBuildResultAssetType.fromString(
          (json['assetType'] as String?) ?? ''),
      assetId: json['assetId'] as String?,
      assetName: json['assetName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assetType = this.assetType;
    final assetId = this.assetId;
    final assetName = this.assetName;
    return {
      'assetType': assetType.value,
      if (assetId != null) 'assetId': assetId,
      if (assetName != null) 'assetName': assetName,
    };
  }
}

/// @nodoc
class AutomatedReasoningPolicyBuildResultAssetType {
  static const buildLog =
      AutomatedReasoningPolicyBuildResultAssetType._('BUILD_LOG');
  static const qualityReport =
      AutomatedReasoningPolicyBuildResultAssetType._('QUALITY_REPORT');
  static const policyDefinition =
      AutomatedReasoningPolicyBuildResultAssetType._('POLICY_DEFINITION');
  static const generatedTestCases =
      AutomatedReasoningPolicyBuildResultAssetType._('GENERATED_TEST_CASES');
  static const policyScenarios =
      AutomatedReasoningPolicyBuildResultAssetType._('POLICY_SCENARIOS');
  static const fidelityReport =
      AutomatedReasoningPolicyBuildResultAssetType._('FIDELITY_REPORT');
  static const assetManifest =
      AutomatedReasoningPolicyBuildResultAssetType._('ASSET_MANIFEST');
  static const sourceDocument =
      AutomatedReasoningPolicyBuildResultAssetType._('SOURCE_DOCUMENT');

  final String value;

  const AutomatedReasoningPolicyBuildResultAssetType._(this.value);

  static const values = [
    buildLog,
    qualityReport,
    policyDefinition,
    generatedTestCases,
    policyScenarios,
    fidelityReport,
    assetManifest,
    sourceDocument
  ];

  static AutomatedReasoningPolicyBuildResultAssetType fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningPolicyBuildResultAssetType._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningPolicyBuildResultAssetType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a generated test case, consisting of query content, guard
/// content, and expected results.
///
/// @nodoc
class AutomatedReasoningPolicyGeneratedTestCase {
  /// The expected results of the generated test case. Possible values include:
  ///
  /// <ul>
  /// <li>
  /// <code>VALID</code> - The claims are true. The claims are implied by the
  /// premises and the Automated Reasoning policy. Given the Automated Reasoning
  /// policy and premises, it is not possible for these claims to be false. In
  /// other words, there are no alternative answers that are true that contradict
  /// the claims.
  /// </li>
  /// <li>
  /// <code>INVALID</code> - The claims are false. The claims are not implied by
  /// the premises and Automated Reasoning policy. Furthermore, there exists
  /// different claims that are consistent with the premises and Automated
  /// Reasoning policy.
  /// </li>
  /// <li>
  /// <code>SATISFIABLE</code> - The claims can be true or false. It depends on
  /// what assumptions are made for the claim to be implied from the premises and
  /// Automated Reasoning policy rules. In this situation, different assumptions
  /// can make input claims false and alternative claims true.
  /// </li>
  /// <li>
  /// <code>IMPOSSIBLE</code> - Automated Reasoning can’t make a statement about
  /// the claims. This can happen if the premises are logically incorrect, or if
  /// there is a conflict within the Automated Reasoning policy itself.
  /// </li>
  /// </ul>
  final AutomatedReasoningCheckResult expectedAggregatedFindingsResult;

  /// The output content that's validated by the Automated Reasoning policy. This
  /// represents the foundation model response that will be checked for accuracy.
  final String guardContent;

  /// The input query or prompt that generated the content. This provides context
  /// for the validation.
  final String queryContent;

  AutomatedReasoningPolicyGeneratedTestCase({
    required this.expectedAggregatedFindingsResult,
    required this.guardContent,
    required this.queryContent,
  });

  factory AutomatedReasoningPolicyGeneratedTestCase.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyGeneratedTestCase(
      expectedAggregatedFindingsResult:
          AutomatedReasoningCheckResult.fromString(
              (json['expectedAggregatedFindingsResult'] as String?) ?? ''),
      guardContent: (json['guardContent'] as String?) ?? '',
      queryContent: (json['queryContent'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final expectedAggregatedFindingsResult =
        this.expectedAggregatedFindingsResult;
    final guardContent = this.guardContent;
    final queryContent = this.queryContent;
    return {
      'expectedAggregatedFindingsResult':
          expectedAggregatedFindingsResult.value,
      'guardContent': guardContent,
      'queryContent': queryContent,
    };
  }
}

/// Represents a single entry in the policy build log, containing information
/// about a specific step or event in the build process.
///
/// @nodoc
class AutomatedReasoningPolicyBuildLogEntry {
  /// The annotation or operation that was being processed when this log entry was
  /// created.
  final AutomatedReasoningPolicyAnnotation annotation;

  /// Detailed information about the specific build steps that were executed,
  /// including any sub-operations or transformations.
  final List<AutomatedReasoningPolicyBuildStep> buildSteps;

  /// The status of the build step (e.g., SUCCESS, FAILED, IN_PROGRESS).
  final AutomatedReasoningPolicyAnnotationStatus status;

  AutomatedReasoningPolicyBuildLogEntry({
    required this.annotation,
    required this.buildSteps,
    required this.status,
  });

  factory AutomatedReasoningPolicyBuildLogEntry.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildLogEntry(
      annotation: AutomatedReasoningPolicyAnnotation.fromJson(
          (json['annotation'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      buildSteps: ((json['buildSteps'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyBuildStep.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      status: AutomatedReasoningPolicyAnnotationStatus.fromString(
          (json['status'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final annotation = this.annotation;
    final buildSteps = this.buildSteps;
    final status = this.status;
    return {
      'annotation': annotation,
      'buildSteps': buildSteps,
      'status': status.value,
    };
  }
}

/// @nodoc
class AutomatedReasoningPolicyAnnotationStatus {
  static const applied = AutomatedReasoningPolicyAnnotationStatus._('APPLIED');
  static const failed = AutomatedReasoningPolicyAnnotationStatus._('FAILED');

  final String value;

  const AutomatedReasoningPolicyAnnotationStatus._(this.value);

  static const values = [applied, failed];

  static AutomatedReasoningPolicyAnnotationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningPolicyAnnotationStatus._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningPolicyAnnotationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a single step in the policy build process, containing context
/// about what was being processed and any messages or results.
///
/// @nodoc
class AutomatedReasoningPolicyBuildStep {
  /// Contextual information about what was being processed during this build
  /// step, such as the type of operation or the source material being analyzed.
  final AutomatedReasoningPolicyBuildStepContext context;

  /// A list of messages generated during this build step, including informational
  /// messages, warnings, and error details.
  final List<AutomatedReasoningPolicyBuildStepMessage> messages;

  /// Reference to the previous element or step in the build process, helping to
  /// trace the sequence of operations.
  final AutomatedReasoningPolicyDefinitionElement? priorElement;

  AutomatedReasoningPolicyBuildStep({
    required this.context,
    required this.messages,
    this.priorElement,
  });

  factory AutomatedReasoningPolicyBuildStep.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildStep(
      context: AutomatedReasoningPolicyBuildStepContext.fromJson(
          (json['context'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      messages: ((json['messages'] as List?) ?? const [])
          .nonNulls
          .map((e) => AutomatedReasoningPolicyBuildStepMessage.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      priorElement: json['priorElement'] != null
          ? AutomatedReasoningPolicyDefinitionElement.fromJson(
              json['priorElement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final context = this.context;
    final messages = this.messages;
    final priorElement = this.priorElement;
    return {
      'context': context,
      'messages': messages,
      if (priorElement != null) 'priorElement': priorElement,
    };
  }
}

/// Provides context about what type of operation was being performed during a
/// build step.
///
/// @nodoc
class AutomatedReasoningPolicyBuildStepContext {
  /// Indicates that this build step involved modifying the policy structure, such
  /// as adding or updating rules, variables, or types.
  final AutomatedReasoningPolicyMutation? mutation;

  /// Indicates that this build step was part of the planning phase, where the
  /// system determines what operations to perform.
  final AutomatedReasoningPolicyPlanning? planning;

  AutomatedReasoningPolicyBuildStepContext({
    this.mutation,
    this.planning,
  });

  factory AutomatedReasoningPolicyBuildStepContext.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildStepContext(
      mutation: json['mutation'] != null
          ? AutomatedReasoningPolicyMutation.fromJson(
              json['mutation'] as Map<String, dynamic>)
          : null,
      planning: json['planning'] != null
          ? AutomatedReasoningPolicyPlanning.fromJson(
              json['planning'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mutation = this.mutation;
    final planning = this.planning;
    return {
      if (mutation != null) 'mutation': mutation,
      if (planning != null) 'planning': planning,
    };
  }
}

/// Represents a single element in an Automated Reasoning policy definition,
/// such as a rule, variable, or type definition.
///
/// @nodoc
class AutomatedReasoningPolicyDefinitionElement {
  /// A rule element within the policy definition that contains a formal logical
  /// expression used for validation.
  final AutomatedReasoningPolicyDefinitionRule? policyDefinitionRule;

  /// A custom type element within the policy definition that defines a set of
  /// possible values for variables.
  final AutomatedReasoningPolicyDefinitionType? policyDefinitionType;

  /// A variable element within the policy definition that represents a concept
  /// used in logical expressions and rules.
  final AutomatedReasoningPolicyDefinitionVariable? policyDefinitionVariable;

  AutomatedReasoningPolicyDefinitionElement({
    this.policyDefinitionRule,
    this.policyDefinitionType,
    this.policyDefinitionVariable,
  });

  factory AutomatedReasoningPolicyDefinitionElement.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDefinitionElement(
      policyDefinitionRule: json['policyDefinitionRule'] != null
          ? AutomatedReasoningPolicyDefinitionRule.fromJson(
              json['policyDefinitionRule'] as Map<String, dynamic>)
          : null,
      policyDefinitionType: json['policyDefinitionType'] != null
          ? AutomatedReasoningPolicyDefinitionType.fromJson(
              json['policyDefinitionType'] as Map<String, dynamic>)
          : null,
      policyDefinitionVariable: json['policyDefinitionVariable'] != null
          ? AutomatedReasoningPolicyDefinitionVariable.fromJson(
              json['policyDefinitionVariable'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final policyDefinitionRule = this.policyDefinitionRule;
    final policyDefinitionType = this.policyDefinitionType;
    final policyDefinitionVariable = this.policyDefinitionVariable;
    return {
      if (policyDefinitionRule != null)
        'policyDefinitionRule': policyDefinitionRule,
      if (policyDefinitionType != null)
        'policyDefinitionType': policyDefinitionType,
      if (policyDefinitionVariable != null)
        'policyDefinitionVariable': policyDefinitionVariable,
    };
  }
}

/// Represents a message generated during a build step, providing information
/// about what happened or any issues encountered.
///
/// @nodoc
class AutomatedReasoningPolicyBuildStepMessage {
  /// The content of the message, describing what occurred during the build step.
  final String message;

  /// The type of message (e.g., INFO, WARNING, ERROR) indicating its severity and
  /// purpose.
  final AutomatedReasoningPolicyBuildMessageType messageType;

  AutomatedReasoningPolicyBuildStepMessage({
    required this.message,
    required this.messageType,
  });

  factory AutomatedReasoningPolicyBuildStepMessage.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyBuildStepMessage(
      message: (json['message'] as String?) ?? '',
      messageType: AutomatedReasoningPolicyBuildMessageType.fromString(
          (json['messageType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final messageType = this.messageType;
    return {
      'message': message,
      'messageType': messageType.value,
    };
  }
}

/// @nodoc
class AutomatedReasoningPolicyBuildMessageType {
  static const info = AutomatedReasoningPolicyBuildMessageType._('INFO');
  static const warning = AutomatedReasoningPolicyBuildMessageType._('WARNING');
  static const error = AutomatedReasoningPolicyBuildMessageType._('ERROR');

  final String value;

  const AutomatedReasoningPolicyBuildMessageType._(this.value);

  static const values = [info, warning, error];

  static AutomatedReasoningPolicyBuildMessageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AutomatedReasoningPolicyBuildMessageType._(value));

  @override
  bool operator ==(other) =>
      other is AutomatedReasoningPolicyBuildMessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the planning phase of policy build workflow, where the system
/// analyzes source content and determines what operations to perform.
///
/// @nodoc
class AutomatedReasoningPolicyPlanning {
  AutomatedReasoningPolicyPlanning();

  factory AutomatedReasoningPolicyPlanning.fromJson(Map<String, dynamic> _) {
    return AutomatedReasoningPolicyPlanning();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A container for various mutation operations that can be applied to an
/// Automated Reasoning policy, including adding, updating, and deleting policy
/// elements.
///
/// @nodoc
class AutomatedReasoningPolicyMutation {
  /// A mutation to add a new rule to the policy.
  final AutomatedReasoningPolicyAddRuleMutation? addRule;

  /// A mutation to add a new custom type to the policy.
  final AutomatedReasoningPolicyAddTypeMutation? addType;

  /// A mutation to add a new variable to the policy.
  final AutomatedReasoningPolicyAddVariableMutation? addVariable;

  /// A mutation to remove a rule from the policy.
  final AutomatedReasoningPolicyDeleteRuleMutation? deleteRule;

  /// A mutation to remove a custom type from the policy.
  final AutomatedReasoningPolicyDeleteTypeMutation? deleteType;

  /// A mutation to remove a variable from the policy.
  final AutomatedReasoningPolicyDeleteVariableMutation? deleteVariable;

  /// A mutation to modify an existing rule in the policy.
  final AutomatedReasoningPolicyUpdateRuleMutation? updateRule;

  /// A mutation to modify an existing custom type in the policy.
  final AutomatedReasoningPolicyUpdateTypeMutation? updateType;

  /// A mutation to modify an existing variable in the policy.
  final AutomatedReasoningPolicyUpdateVariableMutation? updateVariable;

  AutomatedReasoningPolicyMutation({
    this.addRule,
    this.addType,
    this.addVariable,
    this.deleteRule,
    this.deleteType,
    this.deleteVariable,
    this.updateRule,
    this.updateType,
    this.updateVariable,
  });

  factory AutomatedReasoningPolicyMutation.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningPolicyMutation(
      addRule: json['addRule'] != null
          ? AutomatedReasoningPolicyAddRuleMutation.fromJson(
              json['addRule'] as Map<String, dynamic>)
          : null,
      addType: json['addType'] != null
          ? AutomatedReasoningPolicyAddTypeMutation.fromJson(
              json['addType'] as Map<String, dynamic>)
          : null,
      addVariable: json['addVariable'] != null
          ? AutomatedReasoningPolicyAddVariableMutation.fromJson(
              json['addVariable'] as Map<String, dynamic>)
          : null,
      deleteRule: json['deleteRule'] != null
          ? AutomatedReasoningPolicyDeleteRuleMutation.fromJson(
              json['deleteRule'] as Map<String, dynamic>)
          : null,
      deleteType: json['deleteType'] != null
          ? AutomatedReasoningPolicyDeleteTypeMutation.fromJson(
              json['deleteType'] as Map<String, dynamic>)
          : null,
      deleteVariable: json['deleteVariable'] != null
          ? AutomatedReasoningPolicyDeleteVariableMutation.fromJson(
              json['deleteVariable'] as Map<String, dynamic>)
          : null,
      updateRule: json['updateRule'] != null
          ? AutomatedReasoningPolicyUpdateRuleMutation.fromJson(
              json['updateRule'] as Map<String, dynamic>)
          : null,
      updateType: json['updateType'] != null
          ? AutomatedReasoningPolicyUpdateTypeMutation.fromJson(
              json['updateType'] as Map<String, dynamic>)
          : null,
      updateVariable: json['updateVariable'] != null
          ? AutomatedReasoningPolicyUpdateVariableMutation.fromJson(
              json['updateVariable'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final addRule = this.addRule;
    final addType = this.addType;
    final addVariable = this.addVariable;
    final deleteRule = this.deleteRule;
    final deleteType = this.deleteType;
    final deleteVariable = this.deleteVariable;
    final updateRule = this.updateRule;
    final updateType = this.updateType;
    final updateVariable = this.updateVariable;
    return {
      if (addRule != null) 'addRule': addRule,
      if (addType != null) 'addType': addType,
      if (addVariable != null) 'addVariable': addVariable,
      if (deleteRule != null) 'deleteRule': deleteRule,
      if (deleteType != null) 'deleteType': deleteType,
      if (deleteVariable != null) 'deleteVariable': deleteVariable,
      if (updateRule != null) 'updateRule': updateRule,
      if (updateType != null) 'updateType': updateType,
      if (updateVariable != null) 'updateVariable': updateVariable,
    };
  }
}

/// A mutation operation that adds a new custom type to the policy definition
/// during the build process.
///
/// @nodoc
class AutomatedReasoningPolicyAddTypeMutation {
  /// The type definition that specifies the name, description, and possible
  /// values for the new custom type being added to the policy.
  final AutomatedReasoningPolicyDefinitionType type;

  AutomatedReasoningPolicyAddTypeMutation({
    required this.type,
  });

  factory AutomatedReasoningPolicyAddTypeMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAddTypeMutation(
      type: AutomatedReasoningPolicyDefinitionType.fromJson(
          (json['type'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type,
    };
  }
}

/// A mutation operation that modifies an existing custom type in the policy
/// definition during the build process.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateTypeMutation {
  /// The updated type definition containing the modified name, description, or
  /// values for the existing custom type.
  final AutomatedReasoningPolicyDefinitionType type;

  AutomatedReasoningPolicyUpdateTypeMutation({
    required this.type,
  });

  factory AutomatedReasoningPolicyUpdateTypeMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateTypeMutation(
      type: AutomatedReasoningPolicyDefinitionType.fromJson(
          (json['type'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type,
    };
  }
}

/// A mutation operation that removes a custom type from the policy definition
/// during the build process.
///
/// @nodoc
class AutomatedReasoningPolicyDeleteTypeMutation {
  /// The name of the custom type to delete.
  final String name;

  AutomatedReasoningPolicyDeleteTypeMutation({
    required this.name,
  });

  factory AutomatedReasoningPolicyDeleteTypeMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDeleteTypeMutation(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// A mutation operation that adds a new variable to the policy definition
/// during the build process.
///
/// @nodoc
class AutomatedReasoningPolicyAddVariableMutation {
  /// The variable definition that specifies the name, type, and description for
  /// the new variable being added to the policy.
  final AutomatedReasoningPolicyDefinitionVariable variable;

  AutomatedReasoningPolicyAddVariableMutation({
    required this.variable,
  });

  factory AutomatedReasoningPolicyAddVariableMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAddVariableMutation(
      variable: AutomatedReasoningPolicyDefinitionVariable.fromJson(
          (json['variable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final variable = this.variable;
    return {
      'variable': variable,
    };
  }
}

/// A mutation operation that modifies an existing variable in the policy
/// definition during the build process.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateVariableMutation {
  /// The updated variable definition containing the modified name, type, or
  /// description for the existing variable.
  final AutomatedReasoningPolicyDefinitionVariable variable;

  AutomatedReasoningPolicyUpdateVariableMutation({
    required this.variable,
  });

  factory AutomatedReasoningPolicyUpdateVariableMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateVariableMutation(
      variable: AutomatedReasoningPolicyDefinitionVariable.fromJson(
          (json['variable'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final variable = this.variable;
    return {
      'variable': variable,
    };
  }
}

/// A mutation operation that removes a variable from the policy definition
/// during the build process.
///
/// @nodoc
class AutomatedReasoningPolicyDeleteVariableMutation {
  /// The name of the variable to delete.
  final String name;

  AutomatedReasoningPolicyDeleteVariableMutation({
    required this.name,
  });

  factory AutomatedReasoningPolicyDeleteVariableMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDeleteVariableMutation(
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      'name': name,
    };
  }
}

/// A mutation operation that adds a new rule to the policy definition during
/// the build process.
///
/// @nodoc
class AutomatedReasoningPolicyAddRuleMutation {
  /// The rule definition that specifies the formal logical expression and
  /// metadata for the new rule being added to the policy.
  final AutomatedReasoningPolicyDefinitionRule rule;

  AutomatedReasoningPolicyAddRuleMutation({
    required this.rule,
  });

  factory AutomatedReasoningPolicyAddRuleMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyAddRuleMutation(
      rule: AutomatedReasoningPolicyDefinitionRule.fromJson(
          (json['rule'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    return {
      'rule': rule,
    };
  }
}

/// A mutation operation that modifies an existing rule in the policy definition
/// during the build process.
///
/// @nodoc
class AutomatedReasoningPolicyUpdateRuleMutation {
  /// The updated rule definition containing the modified formal logical
  /// expression and any changed metadata for the existing rule.
  final AutomatedReasoningPolicyDefinitionRule rule;

  AutomatedReasoningPolicyUpdateRuleMutation({
    required this.rule,
  });

  factory AutomatedReasoningPolicyUpdateRuleMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyUpdateRuleMutation(
      rule: AutomatedReasoningPolicyDefinitionRule.fromJson(
          (json['rule'] as Map<String, dynamic>?) ?? const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final rule = this.rule;
    return {
      'rule': rule,
    };
  }
}

/// A mutation operation that removes a rule from the policy definition during
/// the build process.
///
/// @nodoc
class AutomatedReasoningPolicyDeleteRuleMutation {
  /// The unique identifier of the rule to delete.
  final String id;

  AutomatedReasoningPolicyDeleteRuleMutation({
    required this.id,
  });

  factory AutomatedReasoningPolicyDeleteRuleMutation.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDeleteRuleMutation(
      id: (json['id'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'id': id,
    };
  }
}

/// Represents a set of rules that operate on completely separate variables,
/// indicating they address different concerns or domains within the policy.
///
/// @nodoc
class AutomatedReasoningPolicyDisjointRuleSet {
  /// The list of rules that form this disjoint set, all operating on the same set
  /// of variables.
  final List<String> rules;

  /// The set of variables that are used by the rules in this disjoint set.
  final List<String> variables;

  AutomatedReasoningPolicyDisjointRuleSet({
    required this.rules,
    required this.variables,
  });

  factory AutomatedReasoningPolicyDisjointRuleSet.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDisjointRuleSet(
      rules: ((json['rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      variables: ((json['variables'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    final variables = this.variables;
    return {
      'rules': rules,
      'variables': variables,
    };
  }
}

/// Associates a type name with a specific value name, used for referencing type
/// values in rules and other policy elements.
///
/// @nodoc
class AutomatedReasoningPolicyDefinitionTypeValuePair {
  /// The name of the custom type that contains the referenced value.
  final String typeName;

  /// The name of the specific value within the type.
  final String valueName;

  AutomatedReasoningPolicyDefinitionTypeValuePair({
    required this.typeName,
    required this.valueName,
  });

  factory AutomatedReasoningPolicyDefinitionTypeValuePair.fromJson(
      Map<String, dynamic> json) {
    return AutomatedReasoningPolicyDefinitionTypeValuePair(
      typeName: (json['typeName'] as String?) ?? '',
      valueName: (json['valueName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final typeName = this.typeName;
    final valueName = this.valueName;
    return {
      'typeName': typeName,
      'valueName': valueName,
    };
  }
}

/// Contains summary information about an Automated Reasoning policy, including
/// metadata and timestamps.
///
/// @nodoc
class AutomatedReasoningPolicySummary {
  /// The timestamp when the policy was created.
  final DateTime createdAt;

  /// The name of the policy.
  final String name;

  /// The Amazon Resource Name (ARN) of the policy.
  final String policyArn;

  /// The unique identifier of the policy.
  final String policyId;

  /// The timestamp when the policy was last updated.
  final DateTime updatedAt;

  /// The version of the policy.
  final String version;

  /// The description of the policy.
  final String? description;

  AutomatedReasoningPolicySummary({
    required this.createdAt,
    required this.name,
    required this.policyArn,
    required this.policyId,
    required this.updatedAt,
    required this.version,
    this.description,
  });

  factory AutomatedReasoningPolicySummary.fromJson(Map<String, dynamic> json) {
    return AutomatedReasoningPolicySummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      policyArn: (json['policyArn'] as String?) ?? '',
      policyId: (json['policyId'] as String?) ?? '',
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] ?? 0),
      version: (json['version'] as String?) ?? '',
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final name = this.name;
    final policyArn = this.policyArn;
    final policyId = this.policyId;
    final updatedAt = this.updatedAt;
    final version = this.version;
    final description = this.description;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'policyArn': policyArn,
      'policyId': policyId,
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (description != null) 'description': description,
    };
  }
}

/// Contains a summary of an advanced prompt optimization job.
///
/// @nodoc
class AdvancedPromptOptimizationJobSummary {
  /// The time at which the job was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the job.
  final String jobArn;

  /// The name of the job.
  final String jobName;

  /// The status of the job.
  final AdvancedPromptOptimizationJobStatus jobStatus;

  /// The time at which the job was last modified.
  final DateTime? lastModifiedTime;

  AdvancedPromptOptimizationJobSummary({
    required this.creationTime,
    required this.jobArn,
    required this.jobName,
    required this.jobStatus,
    this.lastModifiedTime,
  });

  factory AdvancedPromptOptimizationJobSummary.fromJson(
      Map<String, dynamic> json) {
    return AdvancedPromptOptimizationJobSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      jobArn: (json['jobArn'] as String?) ?? '',
      jobName: (json['jobName'] as String?) ?? '',
      jobStatus: AdvancedPromptOptimizationJobStatus.fromString(
          (json['jobStatus'] as String?) ?? ''),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final lastModifiedTime = this.lastModifiedTime;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'jobArn': jobArn,
      'jobName': jobName,
      'jobStatus': jobStatus.value,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

/// The status of an advanced prompt optimization job.
///
/// @nodoc
class AdvancedPromptOptimizationJobStatus {
  static const inProgress = AdvancedPromptOptimizationJobStatus._('InProgress');
  static const completed = AdvancedPromptOptimizationJobStatus._('Completed');
  static const failed = AdvancedPromptOptimizationJobStatus._('Failed');
  static const partiallyCompleted =
      AdvancedPromptOptimizationJobStatus._('PartiallyCompleted');
  static const stopping = AdvancedPromptOptimizationJobStatus._('Stopping');
  static const stopped = AdvancedPromptOptimizationJobStatus._('Stopped');
  static const deleting = AdvancedPromptOptimizationJobStatus._('Deleting');

  final String value;

  const AdvancedPromptOptimizationJobStatus._(this.value);

  static const values = [
    inProgress,
    completed,
    failed,
    partiallyCompleted,
    stopping,
    stopped,
    deleting
  ];

  static AdvancedPromptOptimizationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AdvancedPromptOptimizationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is AdvancedPromptOptimizationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains the input data configuration for an advanced prompt optimization
/// job.
///
/// @nodoc
class AdvancedPromptOptimizationInputConfig {
  /// The S3 URI of the JSONL input file containing prompt templates and
  /// evaluation samples.
  final String s3Uri;

  AdvancedPromptOptimizationInputConfig({
    required this.s3Uri,
  });

  factory AdvancedPromptOptimizationInputConfig.fromJson(
      Map<String, dynamic> json) {
    return AdvancedPromptOptimizationInputConfig(
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

/// Contains the output data configuration for an advanced prompt optimization
/// job.
///
/// @nodoc
class AdvancedPromptOptimizationOutputConfig {
  /// The S3 URI prefix where the optimization results will be written.
  final String s3Uri;

  AdvancedPromptOptimizationOutputConfig({
    required this.s3Uri,
  });

  factory AdvancedPromptOptimizationOutputConfig.fromJson(
      Map<String, dynamic> json) {
    return AdvancedPromptOptimizationOutputConfig(
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

/// Contains the configuration for a model used in an advanced prompt
/// optimization job, including the model ID and inference parameters.
///
/// @nodoc
class ModelConfiguration {
  /// The ID of the model to use for optimization.
  final String modelId;

  /// Additional model request fields. Use this to pass model-specific parameters
  /// that are not included in the standard inference configuration.
  final Map<String, Object>? additionalModelRequestFields;

  /// The inference configuration for the model, including parameters such as
  /// maximum tokens, temperature, and top-p.
  final InferenceConfiguration? inferenceConfig;

  ModelConfiguration({
    required this.modelId,
    this.additionalModelRequestFields,
    this.inferenceConfig,
  });

  factory ModelConfiguration.fromJson(Map<String, dynamic> json) {
    return ModelConfiguration(
      modelId: (json['modelId'] as String?) ?? '',
      additionalModelRequestFields:
          (json['additionalModelRequestFields'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as Object)),
      inferenceConfig: json['inferenceConfig'] != null
          ? InferenceConfiguration.fromJson(
              json['inferenceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final modelId = this.modelId;
    final additionalModelRequestFields = this.additionalModelRequestFields;
    final inferenceConfig = this.inferenceConfig;
    return {
      'modelId': modelId,
      if (additionalModelRequestFields != null)
        'additionalModelRequestFields': additionalModelRequestFields,
      if (inferenceConfig != null) 'inferenceConfig': inferenceConfig,
    };
  }
}

/// Base inference parameters to pass to a model. For more information, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
/// parameters for foundation models</a>.
///
/// @nodoc
class InferenceConfiguration {
  /// The maximum number of tokens to allow in the generated response. The default
  /// value is the maximum allowed value for the model that you are using.
  final int? maxTokens;

  /// A list of stop sequences. A stop sequence is a sequence of characters that
  /// causes the model to stop generating the response.
  final List<String>? stopSequences;

  /// The likelihood of the model selecting higher-probability options while
  /// generating a response. A lower value makes the model more likely to choose
  /// higher-probability options, while a higher value makes the model more likely
  /// to choose lower-probability options.
  final double? temperature;

  /// The percentage of most-likely candidates that the model considers for the
  /// next token. For example, if you choose a value of 0.8 for <code>topP</code>,
  /// the model selects from the top 80% of the probability distribution of tokens
  /// that could be next in the sequence.
  final double? topP;

  InferenceConfiguration({
    this.maxTokens,
    this.stopSequences,
    this.temperature,
    this.topP,
  });

  factory InferenceConfiguration.fromJson(Map<String, dynamic> json) {
    return InferenceConfiguration(
      maxTokens: json['maxTokens'] as int?,
      stopSequences: (json['stopSequences'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      temperature: _s.parseJsonDouble(json['temperature']),
      topP: _s.parseJsonDouble(json['topP']),
    );
  }

  Map<String, dynamic> toJson() {
    final maxTokens = this.maxTokens;
    final stopSequences = this.stopSequences;
    final temperature = this.temperature;
    final topP = this.topP;
    return {
      if (maxTokens != null) 'maxTokens': maxTokens,
      if (stopSequences != null) 'stopSequences': stopSequences,
      if (temperature != null) 'temperature': _s.encodeJsonDouble(temperature),
      if (topP != null) 'topP': _s.encodeJsonDouble(topP),
    };
  }
}

/// Contains information about a successfully deleted advanced prompt
/// optimization job.
///
/// @nodoc
class BatchDeleteAdvancedPromptOptimizationJobItem {
  /// The identifier of the deleted job.
  final String jobIdentifier;

  /// The status of the deleted job.
  final AdvancedPromptOptimizationJobStatus jobStatus;

  BatchDeleteAdvancedPromptOptimizationJobItem({
    required this.jobIdentifier,
    required this.jobStatus,
  });

  factory BatchDeleteAdvancedPromptOptimizationJobItem.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteAdvancedPromptOptimizationJobItem(
      jobIdentifier: (json['jobIdentifier'] as String?) ?? '',
      jobStatus: AdvancedPromptOptimizationJobStatus.fromString(
          (json['jobStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final jobIdentifier = this.jobIdentifier;
    final jobStatus = this.jobStatus;
    return {
      'jobIdentifier': jobIdentifier,
      'jobStatus': jobStatus.value,
    };
  }
}

/// Contains information about an error that occurred when deleting an advanced
/// prompt optimization job.
///
/// @nodoc
class BatchDeleteAdvancedPromptOptimizationJobError {
  /// The error code for the deletion failure.
  final String code;

  /// The identifier of the job that could not be deleted.
  final String jobIdentifier;

  /// A message describing the error.
  final String? message;

  BatchDeleteAdvancedPromptOptimizationJobError({
    required this.code,
    required this.jobIdentifier,
    this.message,
  });

  factory BatchDeleteAdvancedPromptOptimizationJobError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteAdvancedPromptOptimizationJobError(
      code: (json['code'] as String?) ?? '',
      jobIdentifier: (json['jobIdentifier'] as String?) ?? '',
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final jobIdentifier = this.jobIdentifier;
    final message = this.message;
    return {
      'code': code,
      'jobIdentifier': jobIdentifier,
      if (message != null) 'message': message,
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
class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
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
class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
