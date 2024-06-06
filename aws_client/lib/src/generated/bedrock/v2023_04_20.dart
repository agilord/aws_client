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

/// Describes the API operations for creating, managing, fine-turning, and
/// evaluating Amazon Bedrock models.
class Bedrock {
  final _s.RestJsonProtocol _protocol;
  Bedrock({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'bedrock',
            signingName: 'bedrock',
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

  /// API operation for creating and managing Amazon Bedrock automatic model
  /// evaluation jobs and model evaluation jobs that use human workers. To learn
  /// more about the requirements for creating a model evaluation job see, <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation.html">Model
  /// evaluations</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [evaluationConfig] :
  /// Specifies whether the model evaluation job is automatic or uses human
  /// worker.
  ///
  /// Parameter [inferenceConfig] :
  /// Specify the models you want to use in your model evaluation job. Automatic
  /// model evaluation jobs support a single model, and model evaluation job
  /// that use human workers support two models.
  ///
  /// Parameter [jobName] :
  /// The name of the model evaluation job. Model evaluation job names must
  /// unique with your AWS account, and your account's AWS region.
  ///
  /// Parameter [outputDataConfig] :
  /// An object that defines where the results of model evaluation job will be
  /// saved in Amazon S3.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM service role that Amazon Bedrock
  /// can assume to perform tasks on your behalf. The service role must have
  /// Amazon Bedrock as the service principal, and provide access to any Amazon
  /// S3 buckets specified in the <code>EvaluationConfig</code> object. To pass
  /// this role to Amazon Bedrock, the caller of this API must have the
  /// <code>iam:PassRole</code> permission. To learn more about the required
  /// permissions, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation-security.html">Required
  /// permissions</a>.
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
  /// Specify your customer managed key ARN that will be used to encrypt your
  /// model evaluation job.
  ///
  /// Parameter [jobDescription] :
  /// A description of the model evaluation job.
  ///
  /// Parameter [jobTags] :
  /// Tags to attach to the model evaluation job.
  Future<CreateEvaluationJobResponse> createEvaluationJob({
    required EvaluationConfig evaluationConfig,
    required EvaluationInferenceConfig inferenceConfig,
    required String jobName,
    required EvaluationOutputDataConfig outputDataConfig,
    required String roleArn,
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

  /// Creates a guardrail to block topics and to filter out harmful content.
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
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-filters">Content
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
  /// <li>
  /// (Optional) Attach any tags to the guardrail in the <code>tags</code>
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging">Tag
  /// resources</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [TooManyTagsException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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
    String? clientRequestToken,
    GuardrailContentPolicyConfig? contentPolicyConfig,
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
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (contentPolicyConfig != null)
        'contentPolicyConfig': contentPolicyConfig,
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

  /// Creates a version of the guardrail. Use this API to create a snapshot of
  /// the guardrail when you are satisfied with a configuration, or to compare
  /// the configuration with another version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail.
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
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [TooManyTagsException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [baseModelIdentifier] :
  /// Name of the base model.
  ///
  /// Parameter [customModelName] :
  /// A name for the resulting custom model.
  ///
  /// Parameter [hyperParameters] :
  /// Parameters related to tuning the model. For details on the format for
  /// different models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models-hp.html">Custom
  /// model hyperparameters</a>.
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
  /// Parameter [customizationType] :
  /// The customization type.
  ///
  /// Parameter [jobTags] :
  /// Tags to attach to the job.
  ///
  /// Parameter [validationDataConfig] :
  /// Information about the validation dataset.
  ///
  /// Parameter [vpcConfig] :
  /// VPC configuration (optional). Configuration parameters for the private
  /// Virtual Private Cloud (VPC) that contains the resources you are using for
  /// this job.
  Future<CreateModelCustomizationJobResponse> createModelCustomizationJob({
    required String baseModelIdentifier,
    required String customModelName,
    required Map<String, String> hyperParameters,
    required String jobName,
    required OutputDataConfig outputDataConfig,
    required String roleArn,
    required TrainingDataConfig trainingDataConfig,
    String? clientRequestToken,
    String? customModelKmsKeyId,
    List<Tag>? customModelTags,
    CustomizationType? customizationType,
    List<Tag>? jobTags,
    ValidationDataConfig? validationDataConfig,
    VpcConfig? vpcConfig,
  }) async {
    final $payload = <String, dynamic>{
      'baseModelIdentifier': baseModelIdentifier,
      'customModelName': customModelName,
      'hyperParameters': hyperParameters,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'trainingDataConfig': trainingDataConfig,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (customModelKmsKeyId != null)
        'customModelKmsKeyId': customModelKmsKeyId,
      if (customModelTags != null) 'customModelTags': customModelTags,
      if (customizationType != null)
        'customizationType': customizationType.toValue(),
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

  /// Creates dedicated throughput for a base or custom model with the model
  /// units and for the duration that you specify. For pricing details, see <a
  /// href="http://aws.amazon.com/bedrock/pricing/">Amazon Bedrock Pricing</a>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [TooManyTagsException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [modelId] :
  /// The Amazon Resource Name (ARN) or name of the model to associate with this
  /// Provisioned Throughput. For a list of models for which you can purchase
  /// Provisioned Throughput, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-ids.html#prov-throughput-models">Amazon
  /// Bedrock model IDs for purchasing Provisioned Throughput</a> in the Amazon
  /// Bedrock User Guide.
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
  /// Throughput quotas</a> in the Amazon Bedrock User Guide.
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
  /// regions and models for Provisioned Throughput</a> in the Amazon Bedrock
  /// User Guide
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
        'commitmentDuration': commitmentDuration.toValue(),
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

  /// Deletes a custom model that you created earlier. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail.
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

  /// Deletes a Provisioned Throughput. You can't delete a Provisioned
  /// Throughput before the commitment term is over. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Get the properties associated with a Amazon Bedrock custom model that you
  /// have created.For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Retrieves the properties associated with a model evaluation job, including
  /// the status of the job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/latest/userguide/model-evaluation.html">Model
  /// evaluations</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobIdentifier] :
  /// The Amazon Resource Name (ARN) of the model evaluation job.
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

  /// Get details about a Amazon Bedrock foundation model.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Gets details about a guardrail. If you don't specify a version, the
  /// response returns details for the <code>DRAFT</code> version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail for which to get details.
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

  /// Retrieves the properties associated with a model-customization job,
  /// including the status of the job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Returns details for a Provisioned Throughput. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Returns a list of the custom models that you have created with the
  /// <code>CreateModelCustomizationJob</code> operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// Parameter [maxResults] :
  /// Maximum number of results to return in the response.
  ///
  /// Parameter [nameContains] :
  /// Return custom models only if the job name contains these characters.
  ///
  /// Parameter [nextToken] :
  /// Continuation token from the previous response, for Amazon Bedrock to list
  /// the next set of results.
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
      if (baseModelArnEquals != null)
        'baseModelArnEquals': [baseModelArnEquals],
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (foundationModelArnEquals != null)
        'foundationModelArnEquals': [foundationModelArnEquals],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
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

  /// Lists model evaluation jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that includes model evaluation jobs created after the time
  /// specified.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that includes model evaluation jobs created prior to the time
  /// specified.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nameContains] :
  /// Query parameter string for model evaluation job names.
  ///
  /// Parameter [nextToken] :
  /// Continuation token from the previous response, for Amazon Bedrock to list
  /// the next set of results.
  ///
  /// Parameter [sortBy] :
  /// Allows you to sort model evaluation jobs by when they were created.
  ///
  /// Parameter [sortOrder] :
  /// How you want the order of jobs sorted.
  ///
  /// Parameter [statusEquals] :
  /// Only return jobs where the status condition is met.
  Future<ListEvaluationJobsResponse> listEvaluationJobs({
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
      if (creationTimeAfter != null)
        'creationTimeAfter': [_s.iso8601ToJson(creationTimeAfter).toString()],
      if (creationTimeBefore != null)
        'creationTimeBefore': [_s.iso8601ToJson(creationTimeBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameContains != null) 'nameContains': [nameContains],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
      if (statusEquals != null) 'statusEquals': [statusEquals.toValue()],
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

  /// Lists Amazon Bedrock foundation models that you can use. You can filter
  /// the results with the request parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/foundation-models.html">Foundation
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [byCustomizationType] :
  /// Return models that support the customization type that you specify. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// Parameter [byInferenceType] :
  /// Return models that support the inference type that you specify. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the Amazon Bedrock User Guide.
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
        'byCustomizationType': [byCustomizationType.toValue()],
      if (byInferenceType != null)
        'byInferenceType': [byInferenceType.toValue()],
      if (byOutputModality != null)
        'byOutputModality': [byOutputModality.toValue()],
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail.
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

  /// Returns a list of model customization jobs that you have submitted. You
  /// can filter the jobs to return based on one or more criteria.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [creationTimeAfter] :
  /// Return customization jobs created after the specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// Return customization jobs created before the specified time.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in the response.
  ///
  /// Parameter [nameContains] :
  /// Return customization jobs only if the job name contains these characters.
  ///
  /// Parameter [nextToken] :
  /// Continuation token from the previous response, for Amazon Bedrock to list
  /// the next set of results.
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
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
      if (statusEquals != null) 'statusEquals': [statusEquals.toValue()],
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

  /// Lists the Provisioned Throughputs in the account. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
      if (sortBy != null) 'sortBy': [sortBy.toValue()],
      if (sortOrder != null) 'sortOrder': [sortOrder.toValue()],
      if (statusEquals != null) 'statusEquals': [statusEquals.toValue()],
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

  /// List the tags associated with the specified resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Set the configuration values for model invocation logging.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Stops an in progress model evaluation job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobIdentifier] :
  /// The ARN of the model evaluation job you want to stop.
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

  /// Stops an active model customization job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Associate tags with a resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [TooManyTagsException].
  /// May throw [ThrottlingException].
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
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails-filters">Content
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
  /// <li>
  /// (Optional) Attach any tags to the guardrail in the <code>tags</code>
  /// object. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging">Tag
  /// resources</a>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [blockedInputMessaging] :
  /// The message to return when the guardrail blocks a prompt.
  ///
  /// Parameter [blockedOutputsMessaging] :
  /// The message to return when the guardrail blocks a model response.
  ///
  /// Parameter [guardrailIdentifier] :
  /// The unique identifier of the guardrail
  ///
  /// Parameter [name] :
  /// A name for the guardrail.
  ///
  /// Parameter [contentPolicyConfig] :
  /// The content policy to configure for the guardrail.
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
    GuardrailContentPolicyConfig? contentPolicyConfig,
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
      if (contentPolicyConfig != null)
        'contentPolicyConfig': contentPolicyConfig,
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

  /// Updates the name or associated model for a Provisioned Throughput. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
}

/// Use to specify a automatic model evaluation job. The
/// <code>EvaluationDatasetMetricConfig</code> object is used to specify the
/// prompt datasets, task type, and metric names.
class AutomatedEvaluationConfig {
  /// Specifies the required elements for an automatic model evaluation job.
  final List<EvaluationDatasetMetricConfig> datasetMetricConfigs;

  AutomatedEvaluationConfig({
    required this.datasetMetricConfigs,
  });

  factory AutomatedEvaluationConfig.fromJson(Map<String, dynamic> json) {
    return AutomatedEvaluationConfig(
      datasetMetricConfigs: (json['datasetMetricConfigs'] as List)
          .whereNotNull()
          .map((e) =>
              EvaluationDatasetMetricConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final datasetMetricConfigs = this.datasetMetricConfigs;
    return {
      'datasetMetricConfigs': datasetMetricConfigs,
    };
  }
}

/// CloudWatch logging configuration.
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
      logGroupName: json['logGroupName'] as String,
      roleArn: json['roleArn'] as String,
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

enum CommitmentDuration {
  oneMonth,
  sixMonths,
}

extension CommitmentDurationValueExtension on CommitmentDuration {
  String toValue() {
    switch (this) {
      case CommitmentDuration.oneMonth:
        return 'OneMonth';
      case CommitmentDuration.sixMonths:
        return 'SixMonths';
    }
  }
}

extension CommitmentDurationFromString on String {
  CommitmentDuration toCommitmentDuration() {
    switch (this) {
      case 'OneMonth':
        return CommitmentDuration.oneMonth;
      case 'SixMonths':
        return CommitmentDuration.sixMonths;
    }
    throw Exception('$this is not known in enum CommitmentDuration');
  }
}

class CreateEvaluationJobResponse {
  /// The ARN of the model evaluation job.
  final String jobArn;

  CreateEvaluationJobResponse({
    required this.jobArn,
  });

  factory CreateEvaluationJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateEvaluationJobResponse(
      jobArn: json['jobArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

class CreateGuardrailResponse {
  /// The time at which the guardrail was created.
  final DateTime createdAt;

  /// The ARN of the guardrail that was created.
  final String guardrailArn;

  /// The unique identifier of the guardrail that was created.
  final String guardrailId;

  /// The version of the guardrail that was created. This value should be 1.
  final String version;

  CreateGuardrailResponse({
    required this.createdAt,
    required this.guardrailArn,
    required this.guardrailId,
    required this.version,
  });

  factory CreateGuardrailResponse.fromJson(Map<String, dynamic> json) {
    return CreateGuardrailResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      guardrailArn: json['guardrailArn'] as String,
      guardrailId: json['guardrailId'] as String,
      version: json['version'] as String,
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
      guardrailId: json['guardrailId'] as String,
      version: json['version'] as String,
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

class CreateModelCustomizationJobResponse {
  /// Amazon Resource Name (ARN) of the fine tuning job
  final String jobArn;

  CreateModelCustomizationJobResponse({
    required this.jobArn,
  });

  factory CreateModelCustomizationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateModelCustomizationJobResponse(
      jobArn: json['jobArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobArn = this.jobArn;
    return {
      'jobArn': jobArn,
    };
  }
}

class CreateProvisionedModelThroughputResponse {
  /// The Amazon Resource Name (ARN) for this Provisioned Throughput.
  final String provisionedModelArn;

  CreateProvisionedModelThroughputResponse({
    required this.provisionedModelArn,
  });

  factory CreateProvisionedModelThroughputResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateProvisionedModelThroughputResponse(
      provisionedModelArn: json['provisionedModelArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final provisionedModelArn = this.provisionedModelArn;
    return {
      'provisionedModelArn': provisionedModelArn,
    };
  }
}

/// Summary information for a custom model.
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

  CustomModelSummary({
    required this.baseModelArn,
    required this.baseModelName,
    required this.creationTime,
    required this.modelArn,
    required this.modelName,
    this.customizationType,
  });

  factory CustomModelSummary.fromJson(Map<String, dynamic> json) {
    return CustomModelSummary(
      baseModelArn: json['baseModelArn'] as String,
      baseModelName: json['baseModelName'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      modelArn: json['modelArn'] as String,
      modelName: json['modelName'] as String,
      customizationType:
          (json['customizationType'] as String?)?.toCustomizationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final baseModelArn = this.baseModelArn;
    final baseModelName = this.baseModelName;
    final creationTime = this.creationTime;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final customizationType = this.customizationType;
    return {
      'baseModelArn': baseModelArn,
      'baseModelName': baseModelName,
      'creationTime': iso8601ToJson(creationTime),
      'modelArn': modelArn,
      'modelName': modelName,
      if (customizationType != null)
        'customizationType': customizationType.toValue(),
    };
  }
}

enum CustomizationType {
  fineTuning,
  continuedPreTraining,
}

extension CustomizationTypeValueExtension on CustomizationType {
  String toValue() {
    switch (this) {
      case CustomizationType.fineTuning:
        return 'FINE_TUNING';
      case CustomizationType.continuedPreTraining:
        return 'CONTINUED_PRE_TRAINING';
    }
  }
}

extension CustomizationTypeFromString on String {
  CustomizationType toCustomizationType() {
    switch (this) {
      case 'FINE_TUNING':
        return CustomizationType.fineTuning;
      case 'CONTINUED_PRE_TRAINING':
        return CustomizationType.continuedPreTraining;
    }
    throw Exception('$this is not known in enum CustomizationType');
  }
}

class DeleteCustomModelResponse {
  DeleteCustomModelResponse();

  factory DeleteCustomModelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCustomModelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteGuardrailResponse {
  DeleteGuardrailResponse();

  factory DeleteGuardrailResponse.fromJson(Map<String, dynamic> _) {
    return DeleteGuardrailResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

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

/// Contains the ARN of the Amazon Bedrock models specified in your model
/// evaluation job. Each Amazon Bedrock model supports different
/// <code>inferenceParams</code>. To learn more about supported inference
/// parameters for Amazon Bedrock models, see <a
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation-prompt-datasets-custom.html">Inference
/// parameters for foundation models</a>.
///
/// The <code>inferenceParams</code> are specified using JSON. To successfully
/// insert JSON as string make sure that all quotations are properly escaped.
/// For example, <code>"temperature":"0.25"</code> key value pair would need to
/// be formatted as <code>\"temperature\":\"0.25\"</code> to successfully
/// accepted in the request.
class EvaluationBedrockModel {
  /// Each Amazon Bedrock support different inference parameters that change how
  /// the model behaves during inference.
  final String inferenceParams;

  /// The ARN of the Amazon Bedrock model specified.
  final String modelIdentifier;

  EvaluationBedrockModel({
    required this.inferenceParams,
    required this.modelIdentifier,
  });

  factory EvaluationBedrockModel.fromJson(Map<String, dynamic> json) {
    return EvaluationBedrockModel(
      inferenceParams: json['inferenceParams'] as String,
      modelIdentifier: json['modelIdentifier'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final inferenceParams = this.inferenceParams;
    final modelIdentifier = this.modelIdentifier;
    return {
      'inferenceParams': inferenceParams,
      'modelIdentifier': modelIdentifier,
    };
  }
}

/// Used to specify either a <code>AutomatedEvaluationConfig</code> or
/// <code>HumanEvaluationConfig</code> object.
class EvaluationConfig {
  /// Used to specify an automated model evaluation job. See
  /// <code>AutomatedEvaluationConfig</code> to view the required parameters.
  final AutomatedEvaluationConfig? automated;

  /// Used to specify a model evaluation job that uses human workers.See
  /// <code>HumanEvaluationConfig</code> to view the required parameters.
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

/// Used to specify the name of a built-in prompt dataset and optionally, the
/// Amazon S3 bucket where a custom prompt dataset is saved.
class EvaluationDataset {
  /// Used to specify supported built-in prompt datasets. Valid values are
  /// <code>Builtin.Bold</code>, <code>Builtin.BoolQ</code>,
  /// <code>Builtin.NaturalQuestions</code>, <code>Builtin.Gigaword</code>,
  /// <code>Builtin.RealToxicityPrompts</code>, <code>Builtin.TriviaQa</code>,
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
      name: json['name'] as String,
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

/// Defines the built-in prompt datasets, built-in metric names and custom
/// metric names, and the task type.
class EvaluationDatasetMetricConfig {
  /// Specifies the prompt dataset.
  final EvaluationDataset dataset;

  /// The names of the metrics used. For automated model evaluation jobs valid
  /// values are <code>"Builtin.Accuracy"</code>,
  /// <code>"Builtin.Robustness"</code>, and <code>"Builtin.Toxicity"</code>. In
  /// human-based model evaluation jobs the array of strings must match the
  /// <code>name</code> parameter specified in
  /// <code>HumanEvaluationCustomMetric</code>.
  final List<String> metricNames;

  /// The task type you want the model to carry out.
  final EvaluationTaskType taskType;

  EvaluationDatasetMetricConfig({
    required this.dataset,
    required this.metricNames,
    required this.taskType,
  });

  factory EvaluationDatasetMetricConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationDatasetMetricConfig(
      dataset:
          EvaluationDataset.fromJson(json['dataset'] as Map<String, dynamic>),
      metricNames: (json['metricNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      taskType: (json['taskType'] as String).toEvaluationTaskType(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataset = this.dataset;
    final metricNames = this.metricNames;
    final taskType = this.taskType;
    return {
      'dataset': dataset,
      'metricNames': metricNames,
      'taskType': taskType.toValue(),
    };
  }
}

/// Used to define the models you want used in your model evaluation job.
/// Automated model evaluation jobs support only a single model. In a
/// human-based model evaluation job, your annotator can compare the responses
/// for up to two different models.
class EvaluationInferenceConfig {
  /// Used to specify the models.
  final List<EvaluationModelConfig>? models;

  EvaluationInferenceConfig({
    this.models,
  });

  factory EvaluationInferenceConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationInferenceConfig(
      models: (json['models'] as List?)
          ?.whereNotNull()
          .map((e) => EvaluationModelConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final models = this.models;
    return {
      if (models != null) 'models': models,
    };
  }
}

enum EvaluationJobStatus {
  inProgress,
  completed,
  failed,
  stopping,
  stopped,
}

extension EvaluationJobStatusValueExtension on EvaluationJobStatus {
  String toValue() {
    switch (this) {
      case EvaluationJobStatus.inProgress:
        return 'InProgress';
      case EvaluationJobStatus.completed:
        return 'Completed';
      case EvaluationJobStatus.failed:
        return 'Failed';
      case EvaluationJobStatus.stopping:
        return 'Stopping';
      case EvaluationJobStatus.stopped:
        return 'Stopped';
    }
  }
}

extension EvaluationJobStatusFromString on String {
  EvaluationJobStatus toEvaluationJobStatus() {
    switch (this) {
      case 'InProgress':
        return EvaluationJobStatus.inProgress;
      case 'Completed':
        return EvaluationJobStatus.completed;
      case 'Failed':
        return EvaluationJobStatus.failed;
      case 'Stopping':
        return EvaluationJobStatus.stopping;
      case 'Stopped':
        return EvaluationJobStatus.stopped;
    }
    throw Exception('$this is not known in enum EvaluationJobStatus');
  }
}

enum EvaluationJobType {
  human,
  automated,
}

extension EvaluationJobTypeValueExtension on EvaluationJobType {
  String toValue() {
    switch (this) {
      case EvaluationJobType.human:
        return 'Human';
      case EvaluationJobType.automated:
        return 'Automated';
    }
  }
}

extension EvaluationJobTypeFromString on String {
  EvaluationJobType toEvaluationJobType() {
    switch (this) {
      case 'Human':
        return EvaluationJobType.human;
      case 'Automated':
        return EvaluationJobType.automated;
    }
    throw Exception('$this is not known in enum EvaluationJobType');
  }
}

/// Defines the models used in the model evaluation job.
class EvaluationModelConfig {
  /// Defines the Amazon Bedrock model and inference parameters you want used.
  final EvaluationBedrockModel? bedrockModel;

  EvaluationModelConfig({
    this.bedrockModel,
  });

  factory EvaluationModelConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationModelConfig(
      bedrockModel: json['bedrockModel'] != null
          ? EvaluationBedrockModel.fromJson(
              json['bedrockModel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bedrockModel = this.bedrockModel;
    return {
      if (bedrockModel != null) 'bedrockModel': bedrockModel,
    };
  }
}

/// The Amazon S3 location where the results of your model evaluation job are
/// saved.
class EvaluationOutputDataConfig {
  /// The Amazon S3 URI where the results of model evaluation job are saved.
  final String s3Uri;

  EvaluationOutputDataConfig({
    required this.s3Uri,
  });

  factory EvaluationOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return EvaluationOutputDataConfig(
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

/// A summary of the model evaluation job.
class EvaluationSummary {
  /// When the model evaluation job was created.
  final DateTime creationTime;

  /// What task type was used in the model evaluation job.
  final List<EvaluationTaskType> evaluationTaskTypes;

  /// The Amazon Resource Name (ARN) of the model evaluation job.
  final String jobArn;

  /// The name of the model evaluation job.
  final String jobName;

  /// The type, either human or automatic, of model evaluation job.
  final EvaluationJobType jobType;

  /// The Amazon Resource Names (ARNs) of the model(s) used in the model
  /// evaluation job.
  final List<String> modelIdentifiers;

  /// The current status of the model evaluation job.
  final EvaluationJobStatus status;

  EvaluationSummary({
    required this.creationTime,
    required this.evaluationTaskTypes,
    required this.jobArn,
    required this.jobName,
    required this.jobType,
    required this.modelIdentifiers,
    required this.status,
  });

  factory EvaluationSummary.fromJson(Map<String, dynamic> json) {
    return EvaluationSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      evaluationTaskTypes: (json['evaluationTaskTypes'] as List)
          .whereNotNull()
          .map((e) => (e as String).toEvaluationTaskType())
          .toList(),
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      jobType: (json['jobType'] as String).toEvaluationJobType(),
      modelIdentifiers: (json['modelIdentifiers'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String).toEvaluationJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final evaluationTaskTypes = this.evaluationTaskTypes;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final jobType = this.jobType;
    final modelIdentifiers = this.modelIdentifiers;
    final status = this.status;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'evaluationTaskTypes':
          evaluationTaskTypes.map((e) => e.toValue()).toList(),
      'jobArn': jobArn,
      'jobName': jobName,
      'jobType': jobType.toValue(),
      'modelIdentifiers': modelIdentifiers,
      'status': status.toValue(),
    };
  }
}

enum EvaluationTaskType {
  summarization,
  classification,
  questionAndAnswer,
  generation,
  custom,
}

extension EvaluationTaskTypeValueExtension on EvaluationTaskType {
  String toValue() {
    switch (this) {
      case EvaluationTaskType.summarization:
        return 'Summarization';
      case EvaluationTaskType.classification:
        return 'Classification';
      case EvaluationTaskType.questionAndAnswer:
        return 'QuestionAndAnswer';
      case EvaluationTaskType.generation:
        return 'Generation';
      case EvaluationTaskType.custom:
        return 'Custom';
    }
  }
}

extension EvaluationTaskTypeFromString on String {
  EvaluationTaskType toEvaluationTaskType() {
    switch (this) {
      case 'Summarization':
        return EvaluationTaskType.summarization;
      case 'Classification':
        return EvaluationTaskType.classification;
      case 'QuestionAndAnswer':
        return EvaluationTaskType.questionAndAnswer;
      case 'Generation':
        return EvaluationTaskType.generation;
      case 'Custom':
        return EvaluationTaskType.custom;
    }
    throw Exception('$this is not known in enum EvaluationTaskType');
  }
}

enum FineTuningJobStatus {
  inProgress,
  completed,
  failed,
  stopping,
  stopped,
}

extension FineTuningJobStatusValueExtension on FineTuningJobStatus {
  String toValue() {
    switch (this) {
      case FineTuningJobStatus.inProgress:
        return 'InProgress';
      case FineTuningJobStatus.completed:
        return 'Completed';
      case FineTuningJobStatus.failed:
        return 'Failed';
      case FineTuningJobStatus.stopping:
        return 'Stopping';
      case FineTuningJobStatus.stopped:
        return 'Stopped';
    }
  }
}

extension FineTuningJobStatusFromString on String {
  FineTuningJobStatus toFineTuningJobStatus() {
    switch (this) {
      case 'InProgress':
        return FineTuningJobStatus.inProgress;
      case 'Completed':
        return FineTuningJobStatus.completed;
      case 'Failed':
        return FineTuningJobStatus.failed;
      case 'Stopping':
        return FineTuningJobStatus.stopping;
      case 'Stopped':
        return FineTuningJobStatus.stopped;
    }
    throw Exception('$this is not known in enum FineTuningJobStatus');
  }
}

/// Information about a foundation model.
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
      modelArn: json['modelArn'] as String,
      modelId: json['modelId'] as String,
      customizationsSupported: (json['customizationsSupported'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toModelCustomization())
          .toList(),
      inferenceTypesSupported: (json['inferenceTypesSupported'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInferenceType())
          .toList(),
      inputModalities: (json['inputModalities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toModelModality())
          .toList(),
      modelLifecycle: json['modelLifecycle'] != null
          ? FoundationModelLifecycle.fromJson(
              json['modelLifecycle'] as Map<String, dynamic>)
          : null,
      modelName: json['modelName'] as String?,
      outputModalities: (json['outputModalities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toModelModality())
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
            customizationsSupported.map((e) => e.toValue()).toList(),
      if (inferenceTypesSupported != null)
        'inferenceTypesSupported':
            inferenceTypesSupported.map((e) => e.toValue()).toList(),
      if (inputModalities != null)
        'inputModalities': inputModalities.map((e) => e.toValue()).toList(),
      if (modelLifecycle != null) 'modelLifecycle': modelLifecycle,
      if (modelName != null) 'modelName': modelName,
      if (outputModalities != null)
        'outputModalities': outputModalities.map((e) => e.toValue()).toList(),
      if (providerName != null) 'providerName': providerName,
      if (responseStreamingSupported != null)
        'responseStreamingSupported': responseStreamingSupported,
    };
  }
}

/// Details about whether a model version is available or deprecated.
class FoundationModelLifecycle {
  /// Specifies whether a model version is available (<code>ACTIVE</code>) or
  /// deprecated (<code>LEGACY</code>.
  final FoundationModelLifecycleStatus status;

  FoundationModelLifecycle({
    required this.status,
  });

  factory FoundationModelLifecycle.fromJson(Map<String, dynamic> json) {
    return FoundationModelLifecycle(
      status: (json['status'] as String).toFoundationModelLifecycleStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.toValue(),
    };
  }
}

enum FoundationModelLifecycleStatus {
  active,
  legacy,
}

extension FoundationModelLifecycleStatusValueExtension
    on FoundationModelLifecycleStatus {
  String toValue() {
    switch (this) {
      case FoundationModelLifecycleStatus.active:
        return 'ACTIVE';
      case FoundationModelLifecycleStatus.legacy:
        return 'LEGACY';
    }
  }
}

extension FoundationModelLifecycleStatusFromString on String {
  FoundationModelLifecycleStatus toFoundationModelLifecycleStatus() {
    switch (this) {
      case 'ACTIVE':
        return FoundationModelLifecycleStatus.active;
      case 'LEGACY':
        return FoundationModelLifecycleStatus.legacy;
    }
    throw Exception(
        '$this is not known in enum FoundationModelLifecycleStatus');
  }
}

/// Summary information for a foundation model.
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
      modelArn: json['modelArn'] as String,
      modelId: json['modelId'] as String,
      customizationsSupported: (json['customizationsSupported'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toModelCustomization())
          .toList(),
      inferenceTypesSupported: (json['inferenceTypesSupported'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInferenceType())
          .toList(),
      inputModalities: (json['inputModalities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toModelModality())
          .toList(),
      modelLifecycle: json['modelLifecycle'] != null
          ? FoundationModelLifecycle.fromJson(
              json['modelLifecycle'] as Map<String, dynamic>)
          : null,
      modelName: json['modelName'] as String?,
      outputModalities: (json['outputModalities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toModelModality())
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
            customizationsSupported.map((e) => e.toValue()).toList(),
      if (inferenceTypesSupported != null)
        'inferenceTypesSupported':
            inferenceTypesSupported.map((e) => e.toValue()).toList(),
      if (inputModalities != null)
        'inputModalities': inputModalities.map((e) => e.toValue()).toList(),
      if (modelLifecycle != null) 'modelLifecycle': modelLifecycle,
      if (modelName != null) 'modelName': modelName,
      if (outputModalities != null)
        'outputModalities': outputModalities.map((e) => e.toValue()).toList(),
      if (providerName != null) 'providerName': providerName,
      if (responseStreamingSupported != null)
        'responseStreamingSupported': responseStreamingSupported,
    };
  }
}

class GetCustomModelResponse {
  /// Amazon Resource Name (ARN) of the base model.
  final String baseModelArn;

  /// Creation time of the model.
  final DateTime creationTime;

  /// Job Amazon Resource Name (ARN) associated with this model.
  final String jobArn;

  /// Amazon Resource Name (ARN) associated with this model.
  final String modelArn;

  /// Model name associated with this model.
  final String modelName;

  /// Output data configuration associated with this custom model.
  final OutputDataConfig outputDataConfig;

  /// Contains information about the training dataset.
  final TrainingDataConfig trainingDataConfig;

  /// The type of model customization.
  final CustomizationType? customizationType;

  /// Hyperparameter values associated with this model. For details on the format
  /// for different models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models-hp.html">Custom
  /// model hyperparameters</a>.
  final Map<String, String>? hyperParameters;

  /// Job name associated with this model.
  final String? jobName;

  /// The custom model is encrypted at rest using this key.
  final String? modelKmsKeyArn;

  /// Contains training metrics from the job creation.
  final TrainingMetrics? trainingMetrics;

  /// Contains information about the validation dataset.
  final ValidationDataConfig? validationDataConfig;

  /// The validation metrics from the job creation.
  final List<ValidatorMetric>? validationMetrics;

  GetCustomModelResponse({
    required this.baseModelArn,
    required this.creationTime,
    required this.jobArn,
    required this.modelArn,
    required this.modelName,
    required this.outputDataConfig,
    required this.trainingDataConfig,
    this.customizationType,
    this.hyperParameters,
    this.jobName,
    this.modelKmsKeyArn,
    this.trainingMetrics,
    this.validationDataConfig,
    this.validationMetrics,
  });

  factory GetCustomModelResponse.fromJson(Map<String, dynamic> json) {
    return GetCustomModelResponse(
      baseModelArn: json['baseModelArn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      jobArn: json['jobArn'] as String,
      modelArn: json['modelArn'] as String,
      modelName: json['modelName'] as String,
      outputDataConfig: OutputDataConfig.fromJson(
          json['outputDataConfig'] as Map<String, dynamic>),
      trainingDataConfig: TrainingDataConfig.fromJson(
          json['trainingDataConfig'] as Map<String, dynamic>),
      customizationType:
          (json['customizationType'] as String?)?.toCustomizationType(),
      hyperParameters: (json['hyperParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      jobName: json['jobName'] as String?,
      modelKmsKeyArn: json['modelKmsKeyArn'] as String?,
      trainingMetrics: json['trainingMetrics'] != null
          ? TrainingMetrics.fromJson(
              json['trainingMetrics'] as Map<String, dynamic>)
          : null,
      validationDataConfig: json['validationDataConfig'] != null
          ? ValidationDataConfig.fromJson(
              json['validationDataConfig'] as Map<String, dynamic>)
          : null,
      validationMetrics: (json['validationMetrics'] as List?)
          ?.whereNotNull()
          .map((e) => ValidatorMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final baseModelArn = this.baseModelArn;
    final creationTime = this.creationTime;
    final jobArn = this.jobArn;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    final outputDataConfig = this.outputDataConfig;
    final trainingDataConfig = this.trainingDataConfig;
    final customizationType = this.customizationType;
    final hyperParameters = this.hyperParameters;
    final jobName = this.jobName;
    final modelKmsKeyArn = this.modelKmsKeyArn;
    final trainingMetrics = this.trainingMetrics;
    final validationDataConfig = this.validationDataConfig;
    final validationMetrics = this.validationMetrics;
    return {
      'baseModelArn': baseModelArn,
      'creationTime': iso8601ToJson(creationTime),
      'jobArn': jobArn,
      'modelArn': modelArn,
      'modelName': modelName,
      'outputDataConfig': outputDataConfig,
      'trainingDataConfig': trainingDataConfig,
      if (customizationType != null)
        'customizationType': customizationType.toValue(),
      if (hyperParameters != null) 'hyperParameters': hyperParameters,
      if (jobName != null) 'jobName': jobName,
      if (modelKmsKeyArn != null) 'modelKmsKeyArn': modelKmsKeyArn,
      if (trainingMetrics != null) 'trainingMetrics': trainingMetrics,
      if (validationDataConfig != null)
        'validationDataConfig': validationDataConfig,
      if (validationMetrics != null) 'validationMetrics': validationMetrics,
    };
  }
}

class GetEvaluationJobResponse {
  /// When the model evaluation job was created.
  final DateTime creationTime;

  /// Contains details about the type of model evaluation job, the metrics used,
  /// the task type selected, the datasets used, and any custom metrics you
  /// defined.
  final EvaluationConfig evaluationConfig;

  /// Details about the models you specified in your model evaluation job.
  final EvaluationInferenceConfig inferenceConfig;

  /// The Amazon Resource Name (ARN) of the model evaluation job.
  final String jobArn;

  /// The name of the model evaluation job.
  final String jobName;

  /// The type of model evaluation job.
  final EvaluationJobType jobType;

  /// Amazon S3 location for where output data is saved.
  final EvaluationOutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) of the IAM service role used in the model
  /// evaluation job.
  final String roleArn;

  /// The status of the model evaluation job.
  final EvaluationJobStatus status;

  /// The Amazon Resource Name (ARN) of the customer managed key specified when
  /// the model evaluation job was created.
  final String? customerEncryptionKeyId;

  /// An array of strings the specify why the model evaluation job has failed.
  final List<String>? failureMessages;

  /// The description of the model evaluation job.
  final String? jobDescription;

  /// When the model evaluation job was last modified.
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
    this.customerEncryptionKeyId,
    this.failureMessages,
    this.jobDescription,
    this.lastModifiedTime,
  });

  factory GetEvaluationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetEvaluationJobResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      evaluationConfig: EvaluationConfig.fromJson(
          json['evaluationConfig'] as Map<String, dynamic>),
      inferenceConfig: EvaluationInferenceConfig.fromJson(
          json['inferenceConfig'] as Map<String, dynamic>),
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      jobType: (json['jobType'] as String).toEvaluationJobType(),
      outputDataConfig: EvaluationOutputDataConfig.fromJson(
          json['outputDataConfig'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toEvaluationJobStatus(),
      customerEncryptionKeyId: json['customerEncryptionKeyId'] as String?,
      failureMessages: (json['failureMessages'] as List?)
          ?.whereNotNull()
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
      'jobType': jobType.toValue(),
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'status': status.toValue(),
      if (customerEncryptionKeyId != null)
        'customerEncryptionKeyId': customerEncryptionKeyId,
      if (failureMessages != null) 'failureMessages': failureMessages,
      if (jobDescription != null) 'jobDescription': jobDescription,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

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

class GetGuardrailResponse {
  /// The message that the guardrail returns when it blocks a prompt.
  final String blockedInputMessaging;

  /// The message that the guardrail returns when it blocks a model response.
  final String blockedOutputsMessaging;

  /// The date and time at which the guardrail was created.
  final DateTime createdAt;

  /// The ARN of the guardrail that was created.
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

  /// The content policy that was configured for the guardrail.
  final GuardrailContentPolicy? contentPolicy;

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
    this.contentPolicy,
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
      blockedInputMessaging: json['blockedInputMessaging'] as String,
      blockedOutputsMessaging: json['blockedOutputsMessaging'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      guardrailArn: json['guardrailArn'] as String,
      guardrailId: json['guardrailId'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toGuardrailStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      contentPolicy: json['contentPolicy'] != null
          ? GuardrailContentPolicy.fromJson(
              json['contentPolicy'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      failureRecommendations: (json['failureRecommendations'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      kmsKeyArn: json['kmsKeyArn'] as String?,
      sensitiveInformationPolicy: json['sensitiveInformationPolicy'] != null
          ? GuardrailSensitiveInformationPolicy.fromJson(
              json['sensitiveInformationPolicy'] as Map<String, dynamic>)
          : null,
      statusReasons: (json['statusReasons'] as List?)
          ?.whereNotNull()
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
    final contentPolicy = this.contentPolicy;
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
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (contentPolicy != null) 'contentPolicy': contentPolicy,
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

class GetModelCustomizationJobResponse {
  /// Amazon Resource Name (ARN) of the base model.
  final String baseModelArn;

  /// Time that the resource was created.
  final DateTime creationTime;

  /// The hyperparameter values for the job. For details on the format for
  /// different models, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models-hp.html">Custom
  /// model hyperparameters</a>.
  final Map<String, String> hyperParameters;

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

  /// The type of model customization.
  final CustomizationType? customizationType;

  /// Time that the resource transitioned to terminal state.
  final DateTime? endTime;

  /// Information about why the job failed.
  final String? failureMessage;

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
    required this.hyperParameters,
    required this.jobArn,
    required this.jobName,
    required this.outputDataConfig,
    required this.outputModelName,
    required this.roleArn,
    required this.trainingDataConfig,
    required this.validationDataConfig,
    this.clientRequestToken,
    this.customizationType,
    this.endTime,
    this.failureMessage,
    this.lastModifiedTime,
    this.outputModelArn,
    this.outputModelKmsKeyArn,
    this.status,
    this.trainingMetrics,
    this.validationMetrics,
    this.vpcConfig,
  });

  factory GetModelCustomizationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetModelCustomizationJobResponse(
      baseModelArn: json['baseModelArn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      hyperParameters: (json['hyperParameters'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      outputDataConfig: OutputDataConfig.fromJson(
          json['outputDataConfig'] as Map<String, dynamic>),
      outputModelName: json['outputModelName'] as String,
      roleArn: json['roleArn'] as String,
      trainingDataConfig: TrainingDataConfig.fromJson(
          json['trainingDataConfig'] as Map<String, dynamic>),
      validationDataConfig: ValidationDataConfig.fromJson(
          json['validationDataConfig'] as Map<String, dynamic>),
      clientRequestToken: json['clientRequestToken'] as String?,
      customizationType:
          (json['customizationType'] as String?)?.toCustomizationType(),
      endTime: timeStampFromJson(json['endTime']),
      failureMessage: json['failureMessage'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      outputModelArn: json['outputModelArn'] as String?,
      outputModelKmsKeyArn: json['outputModelKmsKeyArn'] as String?,
      status: (json['status'] as String?)?.toModelCustomizationJobStatus(),
      trainingMetrics: json['trainingMetrics'] != null
          ? TrainingMetrics.fromJson(
              json['trainingMetrics'] as Map<String, dynamic>)
          : null,
      validationMetrics: (json['validationMetrics'] as List?)
          ?.whereNotNull()
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
    final hyperParameters = this.hyperParameters;
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final outputDataConfig = this.outputDataConfig;
    final outputModelName = this.outputModelName;
    final roleArn = this.roleArn;
    final trainingDataConfig = this.trainingDataConfig;
    final validationDataConfig = this.validationDataConfig;
    final clientRequestToken = this.clientRequestToken;
    final customizationType = this.customizationType;
    final endTime = this.endTime;
    final failureMessage = this.failureMessage;
    final lastModifiedTime = this.lastModifiedTime;
    final outputModelArn = this.outputModelArn;
    final outputModelKmsKeyArn = this.outputModelKmsKeyArn;
    final status = this.status;
    final trainingMetrics = this.trainingMetrics;
    final validationMetrics = this.validationMetrics;
    final vpcConfig = this.vpcConfig;
    return {
      'baseModelArn': baseModelArn,
      'creationTime': iso8601ToJson(creationTime),
      'hyperParameters': hyperParameters,
      'jobArn': jobArn,
      'jobName': jobName,
      'outputDataConfig': outputDataConfig,
      'outputModelName': outputModelName,
      'roleArn': roleArn,
      'trainingDataConfig': trainingDataConfig,
      'validationDataConfig': validationDataConfig,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (customizationType != null)
        'customizationType': customizationType.toValue(),
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (outputModelArn != null) 'outputModelArn': outputModelArn,
      if (outputModelKmsKeyArn != null)
        'outputModelKmsKeyArn': outputModelKmsKeyArn,
      if (status != null) 'status': status.toValue(),
      if (trainingMetrics != null) 'trainingMetrics': trainingMetrics,
      if (validationMetrics != null) 'validationMetrics': validationMetrics,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

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
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      desiredModelArn: json['desiredModelArn'] as String,
      desiredModelUnits: json['desiredModelUnits'] as int,
      foundationModelArn: json['foundationModelArn'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      modelArn: json['modelArn'] as String,
      modelUnits: json['modelUnits'] as int,
      provisionedModelArn: json['provisionedModelArn'] as String,
      provisionedModelName: json['provisionedModelName'] as String,
      status: (json['status'] as String).toProvisionedModelStatus(),
      commitmentDuration:
          (json['commitmentDuration'] as String?)?.toCommitmentDuration(),
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
      'status': status.toValue(),
      if (commitmentDuration != null)
        'commitmentDuration': commitmentDuration.toValue(),
      if (commitmentExpirationTime != null)
        'commitmentExpirationTime': iso8601ToJson(commitmentExpirationTime),
      if (failureMessage != null) 'failureMessage': failureMessage,
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

  GuardrailContentFilter({
    required this.inputStrength,
    required this.outputStrength,
    required this.type,
  });

  factory GuardrailContentFilter.fromJson(Map<String, dynamic> json) {
    return GuardrailContentFilter(
      inputStrength:
          (json['inputStrength'] as String).toGuardrailFilterStrength(),
      outputStrength:
          (json['outputStrength'] as String).toGuardrailFilterStrength(),
      type: (json['type'] as String).toGuardrailContentFilterType(),
    );
  }

  Map<String, dynamic> toJson() {
    final inputStrength = this.inputStrength;
    final outputStrength = this.outputStrength;
    final type = this.type;
    return {
      'inputStrength': inputStrength.toValue(),
      'outputStrength': outputStrength.toValue(),
      'type': type.toValue(),
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
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateGuardrail.html#API_CreateGuardrail_RequestSyntax">CreateGuardrail
/// request body</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_UpdateGuardrail.html#API_UpdateGuardrail_RequestSyntax">UpdateGuardrail
/// request body</a>
/// </li>
/// </ul>
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

  GuardrailContentFilterConfig({
    required this.inputStrength,
    required this.outputStrength,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final inputStrength = this.inputStrength;
    final outputStrength = this.outputStrength;
    final type = this.type;
    return {
      'inputStrength': inputStrength.toValue(),
      'outputStrength': outputStrength.toValue(),
      'type': type.toValue(),
    };
  }
}

enum GuardrailContentFilterType {
  sexual,
  violence,
  hate,
  insults,
  misconduct,
  promptAttack,
}

extension GuardrailContentFilterTypeValueExtension
    on GuardrailContentFilterType {
  String toValue() {
    switch (this) {
      case GuardrailContentFilterType.sexual:
        return 'SEXUAL';
      case GuardrailContentFilterType.violence:
        return 'VIOLENCE';
      case GuardrailContentFilterType.hate:
        return 'HATE';
      case GuardrailContentFilterType.insults:
        return 'INSULTS';
      case GuardrailContentFilterType.misconduct:
        return 'MISCONDUCT';
      case GuardrailContentFilterType.promptAttack:
        return 'PROMPT_ATTACK';
    }
  }
}

extension GuardrailContentFilterTypeFromString on String {
  GuardrailContentFilterType toGuardrailContentFilterType() {
    switch (this) {
      case 'SEXUAL':
        return GuardrailContentFilterType.sexual;
      case 'VIOLENCE':
        return GuardrailContentFilterType.violence;
      case 'HATE':
        return GuardrailContentFilterType.hate;
      case 'INSULTS':
        return GuardrailContentFilterType.insults;
      case 'MISCONDUCT':
        return GuardrailContentFilterType.misconduct;
      case 'PROMPT_ATTACK':
        return GuardrailContentFilterType.promptAttack;
    }
    throw Exception('$this is not known in enum GuardrailContentFilterType');
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
class GuardrailContentPolicy {
  /// Contains the type of the content filter and how strongly it should apply to
  /// prompts and model responses.
  final List<GuardrailContentFilter>? filters;

  GuardrailContentPolicy({
    this.filters,
  });

  factory GuardrailContentPolicy.fromJson(Map<String, dynamic> json) {
    return GuardrailContentPolicy(
      filters: (json['filters'] as List?)
          ?.whereNotNull()
          .map(
              (e) => GuardrailContentFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    return {
      if (filters != null) 'filters': filters,
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
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateGuardrail.html#API_CreateGuardrail_RequestSyntax">CreateGuardrail
/// request body</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_UpdateGuardrail.html#API_UpdateGuardrail_RequestSyntax">UpdateGuardrail
/// request body</a>
/// </li>
/// </ul>
class GuardrailContentPolicyConfig {
  /// Contains the type of the content filter and how strongly it should apply to
  /// prompts and model responses.
  final List<GuardrailContentFilterConfig> filtersConfig;

  GuardrailContentPolicyConfig({
    required this.filtersConfig,
  });

  Map<String, dynamic> toJson() {
    final filtersConfig = this.filtersConfig;
    return {
      'filtersConfig': filtersConfig,
    };
  }
}

enum GuardrailFilterStrength {
  none,
  low,
  medium,
  high,
}

extension GuardrailFilterStrengthValueExtension on GuardrailFilterStrength {
  String toValue() {
    switch (this) {
      case GuardrailFilterStrength.none:
        return 'NONE';
      case GuardrailFilterStrength.low:
        return 'LOW';
      case GuardrailFilterStrength.medium:
        return 'MEDIUM';
      case GuardrailFilterStrength.high:
        return 'HIGH';
    }
  }
}

extension GuardrailFilterStrengthFromString on String {
  GuardrailFilterStrength toGuardrailFilterStrength() {
    switch (this) {
      case 'NONE':
        return GuardrailFilterStrength.none;
      case 'LOW':
        return GuardrailFilterStrength.low;
      case 'MEDIUM':
        return GuardrailFilterStrength.medium;
      case 'HIGH':
        return GuardrailFilterStrength.high;
    }
    throw Exception('$this is not known in enum GuardrailFilterStrength');
  }
}

/// The managed word list that was configured for the guardrail. (This is a list
/// of words that are pre-defined and managed by Guardrails only.)
class GuardrailManagedWords {
  /// ManagedWords$type The managed word type that was configured for the
  /// guardrail. (For now, we only offer profanity word list)
  final GuardrailManagedWordsType type;

  GuardrailManagedWords({
    required this.type,
  });

  factory GuardrailManagedWords.fromJson(Map<String, dynamic> json) {
    return GuardrailManagedWords(
      type: (json['type'] as String).toGuardrailManagedWordsType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.toValue(),
    };
  }
}

/// The managed word list to configure for the guardrail.
class GuardrailManagedWordsConfig {
  /// The managed word type to configure for the guardrail.
  final GuardrailManagedWordsType type;

  GuardrailManagedWordsConfig({
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.toValue(),
    };
  }
}

enum GuardrailManagedWordsType {
  profanity,
}

extension GuardrailManagedWordsTypeValueExtension on GuardrailManagedWordsType {
  String toValue() {
    switch (this) {
      case GuardrailManagedWordsType.profanity:
        return 'PROFANITY';
    }
  }
}

extension GuardrailManagedWordsTypeFromString on String {
  GuardrailManagedWordsType toGuardrailManagedWordsType() {
    switch (this) {
      case 'PROFANITY':
        return GuardrailManagedWordsType.profanity;
    }
    throw Exception('$this is not known in enum GuardrailManagedWordsType');
  }
}

/// The PII entity configured for the guardrail.
class GuardrailPiiEntity {
  /// The configured guardrail action when PII entity is detected.
  final GuardrailSensitiveInformationAction action;

  /// The type of PII entity. For example, Social Security Number.
  final GuardrailPiiEntityType type;

  GuardrailPiiEntity({
    required this.action,
    required this.type,
  });

  factory GuardrailPiiEntity.fromJson(Map<String, dynamic> json) {
    return GuardrailPiiEntity(
      action:
          (json['action'] as String).toGuardrailSensitiveInformationAction(),
      type: (json['type'] as String).toGuardrailPiiEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final type = this.type;
    return {
      'action': action.toValue(),
      'type': type.toValue(),
    };
  }
}

/// The PII entity to configure for the guardrail.
class GuardrailPiiEntityConfig {
  /// Configure guardrail action when the PII entity is detected.
  final GuardrailSensitiveInformationAction action;

  /// Configure guardrail type when the PII entity is detected.
  final GuardrailPiiEntityType type;

  GuardrailPiiEntityConfig({
    required this.action,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final type = this.type;
    return {
      'action': action.toValue(),
      'type': type.toValue(),
    };
  }
}

enum GuardrailPiiEntityType {
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
  vehicleIdentificationNumber,
}

extension GuardrailPiiEntityTypeValueExtension on GuardrailPiiEntityType {
  String toValue() {
    switch (this) {
      case GuardrailPiiEntityType.address:
        return 'ADDRESS';
      case GuardrailPiiEntityType.age:
        return 'AGE';
      case GuardrailPiiEntityType.awsAccessKey:
        return 'AWS_ACCESS_KEY';
      case GuardrailPiiEntityType.awsSecretKey:
        return 'AWS_SECRET_KEY';
      case GuardrailPiiEntityType.caHealthNumber:
        return 'CA_HEALTH_NUMBER';
      case GuardrailPiiEntityType.caSocialInsuranceNumber:
        return 'CA_SOCIAL_INSURANCE_NUMBER';
      case GuardrailPiiEntityType.creditDebitCardCvv:
        return 'CREDIT_DEBIT_CARD_CVV';
      case GuardrailPiiEntityType.creditDebitCardExpiry:
        return 'CREDIT_DEBIT_CARD_EXPIRY';
      case GuardrailPiiEntityType.creditDebitCardNumber:
        return 'CREDIT_DEBIT_CARD_NUMBER';
      case GuardrailPiiEntityType.driverId:
        return 'DRIVER_ID';
      case GuardrailPiiEntityType.email:
        return 'EMAIL';
      case GuardrailPiiEntityType.internationalBankAccountNumber:
        return 'INTERNATIONAL_BANK_ACCOUNT_NUMBER';
      case GuardrailPiiEntityType.ipAddress:
        return 'IP_ADDRESS';
      case GuardrailPiiEntityType.licensePlate:
        return 'LICENSE_PLATE';
      case GuardrailPiiEntityType.macAddress:
        return 'MAC_ADDRESS';
      case GuardrailPiiEntityType.name:
        return 'NAME';
      case GuardrailPiiEntityType.password:
        return 'PASSWORD';
      case GuardrailPiiEntityType.phone:
        return 'PHONE';
      case GuardrailPiiEntityType.pin:
        return 'PIN';
      case GuardrailPiiEntityType.swiftCode:
        return 'SWIFT_CODE';
      case GuardrailPiiEntityType.ukNationalHealthServiceNumber:
        return 'UK_NATIONAL_HEALTH_SERVICE_NUMBER';
      case GuardrailPiiEntityType.ukNationalInsuranceNumber:
        return 'UK_NATIONAL_INSURANCE_NUMBER';
      case GuardrailPiiEntityType.ukUniqueTaxpayerReferenceNumber:
        return 'UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER';
      case GuardrailPiiEntityType.url:
        return 'URL';
      case GuardrailPiiEntityType.username:
        return 'USERNAME';
      case GuardrailPiiEntityType.usBankAccountNumber:
        return 'US_BANK_ACCOUNT_NUMBER';
      case GuardrailPiiEntityType.usBankRoutingNumber:
        return 'US_BANK_ROUTING_NUMBER';
      case GuardrailPiiEntityType.usIndividualTaxIdentificationNumber:
        return 'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER';
      case GuardrailPiiEntityType.usPassportNumber:
        return 'US_PASSPORT_NUMBER';
      case GuardrailPiiEntityType.usSocialSecurityNumber:
        return 'US_SOCIAL_SECURITY_NUMBER';
      case GuardrailPiiEntityType.vehicleIdentificationNumber:
        return 'VEHICLE_IDENTIFICATION_NUMBER';
    }
  }
}

extension GuardrailPiiEntityTypeFromString on String {
  GuardrailPiiEntityType toGuardrailPiiEntityType() {
    switch (this) {
      case 'ADDRESS':
        return GuardrailPiiEntityType.address;
      case 'AGE':
        return GuardrailPiiEntityType.age;
      case 'AWS_ACCESS_KEY':
        return GuardrailPiiEntityType.awsAccessKey;
      case 'AWS_SECRET_KEY':
        return GuardrailPiiEntityType.awsSecretKey;
      case 'CA_HEALTH_NUMBER':
        return GuardrailPiiEntityType.caHealthNumber;
      case 'CA_SOCIAL_INSURANCE_NUMBER':
        return GuardrailPiiEntityType.caSocialInsuranceNumber;
      case 'CREDIT_DEBIT_CARD_CVV':
        return GuardrailPiiEntityType.creditDebitCardCvv;
      case 'CREDIT_DEBIT_CARD_EXPIRY':
        return GuardrailPiiEntityType.creditDebitCardExpiry;
      case 'CREDIT_DEBIT_CARD_NUMBER':
        return GuardrailPiiEntityType.creditDebitCardNumber;
      case 'DRIVER_ID':
        return GuardrailPiiEntityType.driverId;
      case 'EMAIL':
        return GuardrailPiiEntityType.email;
      case 'INTERNATIONAL_BANK_ACCOUNT_NUMBER':
        return GuardrailPiiEntityType.internationalBankAccountNumber;
      case 'IP_ADDRESS':
        return GuardrailPiiEntityType.ipAddress;
      case 'LICENSE_PLATE':
        return GuardrailPiiEntityType.licensePlate;
      case 'MAC_ADDRESS':
        return GuardrailPiiEntityType.macAddress;
      case 'NAME':
        return GuardrailPiiEntityType.name;
      case 'PASSWORD':
        return GuardrailPiiEntityType.password;
      case 'PHONE':
        return GuardrailPiiEntityType.phone;
      case 'PIN':
        return GuardrailPiiEntityType.pin;
      case 'SWIFT_CODE':
        return GuardrailPiiEntityType.swiftCode;
      case 'UK_NATIONAL_HEALTH_SERVICE_NUMBER':
        return GuardrailPiiEntityType.ukNationalHealthServiceNumber;
      case 'UK_NATIONAL_INSURANCE_NUMBER':
        return GuardrailPiiEntityType.ukNationalInsuranceNumber;
      case 'UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER':
        return GuardrailPiiEntityType.ukUniqueTaxpayerReferenceNumber;
      case 'URL':
        return GuardrailPiiEntityType.url;
      case 'USERNAME':
        return GuardrailPiiEntityType.username;
      case 'US_BANK_ACCOUNT_NUMBER':
        return GuardrailPiiEntityType.usBankAccountNumber;
      case 'US_BANK_ROUTING_NUMBER':
        return GuardrailPiiEntityType.usBankRoutingNumber;
      case 'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER':
        return GuardrailPiiEntityType.usIndividualTaxIdentificationNumber;
      case 'US_PASSPORT_NUMBER':
        return GuardrailPiiEntityType.usPassportNumber;
      case 'US_SOCIAL_SECURITY_NUMBER':
        return GuardrailPiiEntityType.usSocialSecurityNumber;
      case 'VEHICLE_IDENTIFICATION_NUMBER':
        return GuardrailPiiEntityType.vehicleIdentificationNumber;
    }
    throw Exception('$this is not known in enum GuardrailPiiEntityType');
  }
}

/// The regular expression configured for the guardrail.
class GuardrailRegex {
  /// The action taken when a match to the regular expression is detected.
  final GuardrailSensitiveInformationAction action;

  /// The name of the regular expression for the guardrail.
  final String name;

  /// The pattern of the regular expression configured for the guardrail.
  final String pattern;

  /// The description of the regular expression for the guardrail.
  final String? description;

  GuardrailRegex({
    required this.action,
    required this.name,
    required this.pattern,
    this.description,
  });

  factory GuardrailRegex.fromJson(Map<String, dynamic> json) {
    return GuardrailRegex(
      action:
          (json['action'] as String).toGuardrailSensitiveInformationAction(),
      name: json['name'] as String,
      pattern: json['pattern'] as String,
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final pattern = this.pattern;
    final description = this.description;
    return {
      'action': action.toValue(),
      'name': name,
      'pattern': pattern,
      if (description != null) 'description': description,
    };
  }
}

/// The regular expression to configure for the guardrail.
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

  GuardrailRegexConfig({
    required this.action,
    required this.name,
    required this.pattern,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final name = this.name;
    final pattern = this.pattern;
    final description = this.description;
    return {
      'action': action.toValue(),
      'name': name,
      'pattern': pattern,
      if (description != null) 'description': description,
    };
  }
}

enum GuardrailSensitiveInformationAction {
  block,
  anonymize,
}

extension GuardrailSensitiveInformationActionValueExtension
    on GuardrailSensitiveInformationAction {
  String toValue() {
    switch (this) {
      case GuardrailSensitiveInformationAction.block:
        return 'BLOCK';
      case GuardrailSensitiveInformationAction.anonymize:
        return 'ANONYMIZE';
    }
  }
}

extension GuardrailSensitiveInformationActionFromString on String {
  GuardrailSensitiveInformationAction toGuardrailSensitiveInformationAction() {
    switch (this) {
      case 'BLOCK':
        return GuardrailSensitiveInformationAction.block;
      case 'ANONYMIZE':
        return GuardrailSensitiveInformationAction.anonymize;
    }
    throw Exception(
        '$this is not known in enum GuardrailSensitiveInformationAction');
  }
}

/// Contains details about PII entities and regular expressions configured for
/// the guardrail.
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
          ?.whereNotNull()
          .map((e) => GuardrailPiiEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      regexes: (json['regexes'] as List?)
          ?.whereNotNull()
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

/// Contains details about PII entities and regular expressions to configure for
/// the guardrail.
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

enum GuardrailStatus {
  creating,
  updating,
  versioning,
  ready,
  failed,
  deleting,
}

extension GuardrailStatusValueExtension on GuardrailStatus {
  String toValue() {
    switch (this) {
      case GuardrailStatus.creating:
        return 'CREATING';
      case GuardrailStatus.updating:
        return 'UPDATING';
      case GuardrailStatus.versioning:
        return 'VERSIONING';
      case GuardrailStatus.ready:
        return 'READY';
      case GuardrailStatus.failed:
        return 'FAILED';
      case GuardrailStatus.deleting:
        return 'DELETING';
    }
  }
}

extension GuardrailStatusFromString on String {
  GuardrailStatus toGuardrailStatus() {
    switch (this) {
      case 'CREATING':
        return GuardrailStatus.creating;
      case 'UPDATING':
        return GuardrailStatus.updating;
      case 'VERSIONING':
        return GuardrailStatus.versioning;
      case 'READY':
        return GuardrailStatus.ready;
      case 'FAILED':
        return GuardrailStatus.failed;
      case 'DELETING':
        return GuardrailStatus.deleting;
    }
    throw Exception('$this is not known in enum GuardrailStatus');
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
    this.description,
  });

  factory GuardrailSummary.fromJson(Map<String, dynamic> json) {
    return GuardrailSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toGuardrailStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
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
    final description = this.description;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'id': id,
      'name': name,
      'status': status.toValue(),
      'updatedAt': iso8601ToJson(updatedAt),
      'version': version,
      if (description != null) 'description': description,
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
class GuardrailTopic {
  /// A definition of the topic to deny.
  final String definition;

  /// The name of the topic to deny.
  final String name;

  /// A list of prompts, each of which is an example of a prompt that can be
  /// categorized as belonging to the topic.
  final List<String>? examples;

  /// Specifies to deny the topic.
  final GuardrailTopicType? type;

  GuardrailTopic({
    required this.definition,
    required this.name,
    this.examples,
    this.type,
  });

  factory GuardrailTopic.fromJson(Map<String, dynamic> json) {
    return GuardrailTopic(
      definition: json['definition'] as String,
      name: json['name'] as String,
      examples: (json['examples'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.toGuardrailTopicType(),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final name = this.name;
    final examples = this.examples;
    final type = this.type;
    return {
      'definition': definition,
      'name': name,
      if (examples != null) 'examples': examples,
      if (type != null) 'type': type.toValue(),
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
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateGuardrail.html#API_CreateGuardrail_RequestSyntax">CreateGuardrail
/// request body</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_UpdateGuardrail.html#API_UpdateGuardrail_RequestSyntax">UpdateGuardrail
/// request body</a>
/// </li>
/// </ul>
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

  GuardrailTopicConfig({
    required this.definition,
    required this.name,
    required this.type,
    this.examples,
  });

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final name = this.name;
    final type = this.type;
    final examples = this.examples;
    return {
      'definition': definition,
      'name': name,
      'type': type.toValue(),
      if (examples != null) 'examples': examples,
    };
  }
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
class GuardrailTopicPolicy {
  /// A list of policies related to topics that the guardrail should deny.
  final List<GuardrailTopic> topics;

  GuardrailTopicPolicy({
    required this.topics,
  });

  factory GuardrailTopicPolicy.fromJson(Map<String, dynamic> json) {
    return GuardrailTopicPolicy(
      topics: (json['topics'] as List)
          .whereNotNull()
          .map((e) => GuardrailTopic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final topics = this.topics;
    return {
      'topics': topics,
    };
  }
}

/// Contains details about topics that the guardrail should identify and deny.
///
/// This data type is used in the following API operations:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_CreateGuardrail.html#API_CreateGuardrail_RequestSyntax">CreateGuardrail
/// request body</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/bedrock/latest/APIReference/API_UpdateGuardrail.html#API_UpdateGuardrail_RequestSyntax">UpdateGuardrail
/// request body</a>
/// </li>
/// </ul>
class GuardrailTopicPolicyConfig {
  /// A list of policies related to topics that the guardrail should deny.
  final List<GuardrailTopicConfig> topicsConfig;

  GuardrailTopicPolicyConfig({
    required this.topicsConfig,
  });

  Map<String, dynamic> toJson() {
    final topicsConfig = this.topicsConfig;
    return {
      'topicsConfig': topicsConfig,
    };
  }
}

enum GuardrailTopicType {
  deny,
}

extension GuardrailTopicTypeValueExtension on GuardrailTopicType {
  String toValue() {
    switch (this) {
      case GuardrailTopicType.deny:
        return 'DENY';
    }
  }
}

extension GuardrailTopicTypeFromString on String {
  GuardrailTopicType toGuardrailTopicType() {
    switch (this) {
      case 'DENY':
        return GuardrailTopicType.deny;
    }
    throw Exception('$this is not known in enum GuardrailTopicType');
  }
}

/// A word configured for the guardrail.
class GuardrailWord {
  /// Text of the word configured for the guardrail to block.
  final String text;

  GuardrailWord({
    required this.text,
  });

  factory GuardrailWord.fromJson(Map<String, dynamic> json) {
    return GuardrailWord(
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// A word to configure for the guardrail.
class GuardrailWordConfig {
  /// Text of the word configured for the guardrail to block.
  final String text;

  GuardrailWordConfig({
    required this.text,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      'text': text,
    };
  }
}

/// Contains details about the word policy configured for the guardrail.
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
          ?.whereNotNull()
          .map((e) => GuardrailManagedWords.fromJson(e as Map<String, dynamic>))
          .toList(),
      words: (json['words'] as List?)
          ?.whereNotNull()
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

/// Contains details about the word policy to configured for the guardrail.
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
/// following <code>["accuracy", "toxicity", "readability"]</code> in
/// <code>EvaluationDatasetMetricConfig</code>.
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
      datasetMetricConfigs: (json['datasetMetricConfigs'] as List)
          .whereNotNull()
          .map((e) =>
              EvaluationDatasetMetricConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      customMetrics: (json['customMetrics'] as List?)
          ?.whereNotNull()
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

/// In a model evaluation job that uses human workers you must define the name
/// of the metric, and how you want that metric rated <code>ratingMethod</code>,
/// and an optional description of the metric.
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
      name: json['name'] as String,
      ratingMethod: json['ratingMethod'] as String,
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

/// Contains <code>SageMakerFlowDefinition</code> object. The object is used to
/// specify the prompt dataset, task type, rating method and metric names.
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
      flowDefinitionArn: json['flowDefinitionArn'] as String,
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

enum InferenceType {
  onDemand,
  provisioned,
}

extension InferenceTypeValueExtension on InferenceType {
  String toValue() {
    switch (this) {
      case InferenceType.onDemand:
        return 'ON_DEMAND';
      case InferenceType.provisioned:
        return 'PROVISIONED';
    }
  }
}

extension InferenceTypeFromString on String {
  InferenceType toInferenceType() {
    switch (this) {
      case 'ON_DEMAND':
        return InferenceType.onDemand;
      case 'PROVISIONED':
        return InferenceType.provisioned;
    }
    throw Exception('$this is not known in enum InferenceType');
  }
}

class ListCustomModelsResponse {
  /// Model summaries.
  final List<CustomModelSummary>? modelSummaries;

  /// Continuation token for the next request to list the next set of results.
  final String? nextToken;

  ListCustomModelsResponse({
    this.modelSummaries,
    this.nextToken,
  });

  factory ListCustomModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListCustomModelsResponse(
      modelSummaries: (json['modelSummaries'] as List?)
          ?.whereNotNull()
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

class ListEvaluationJobsResponse {
  /// A summary of the model evaluation jobs.
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
          ?.whereNotNull()
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

class ListFoundationModelsResponse {
  /// A list of Amazon Bedrock foundation models.
  final List<FoundationModelSummary>? modelSummaries;

  ListFoundationModelsResponse({
    this.modelSummaries,
  });

  factory ListFoundationModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListFoundationModelsResponse(
      modelSummaries: (json['modelSummaries'] as List?)
          ?.whereNotNull()
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
      guardrails: (json['guardrails'] as List)
          .whereNotNull()
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

class ListModelCustomizationJobsResponse {
  /// Job summaries.
  final List<ModelCustomizationJobSummary>? modelCustomizationJobSummaries;

  /// Page continuation token to use in the next request.
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
          ?.whereNotNull()
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
          ?.whereNotNull()
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

class ListTagsForResourceResponse {
  /// An array of the tags associated with this resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
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

/// Configuration fields for invocation logging.
class LoggingConfig {
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

  LoggingConfig({
    this.cloudWatchConfig,
    this.embeddingDataDeliveryEnabled,
    this.imageDataDeliveryEnabled,
    this.s3Config,
    this.textDataDeliveryEnabled,
  });

  factory LoggingConfig.fromJson(Map<String, dynamic> json) {
    return LoggingConfig(
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
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchConfig = this.cloudWatchConfig;
    final embeddingDataDeliveryEnabled = this.embeddingDataDeliveryEnabled;
    final imageDataDeliveryEnabled = this.imageDataDeliveryEnabled;
    final s3Config = this.s3Config;
    final textDataDeliveryEnabled = this.textDataDeliveryEnabled;
    return {
      if (cloudWatchConfig != null) 'cloudWatchConfig': cloudWatchConfig,
      if (embeddingDataDeliveryEnabled != null)
        'embeddingDataDeliveryEnabled': embeddingDataDeliveryEnabled,
      if (imageDataDeliveryEnabled != null)
        'imageDataDeliveryEnabled': imageDataDeliveryEnabled,
      if (s3Config != null) 's3Config': s3Config,
      if (textDataDeliveryEnabled != null)
        'textDataDeliveryEnabled': textDataDeliveryEnabled,
    };
  }
}

enum ModelCustomization {
  fineTuning,
  continuedPreTraining,
}

extension ModelCustomizationValueExtension on ModelCustomization {
  String toValue() {
    switch (this) {
      case ModelCustomization.fineTuning:
        return 'FINE_TUNING';
      case ModelCustomization.continuedPreTraining:
        return 'CONTINUED_PRE_TRAINING';
    }
  }
}

extension ModelCustomizationFromString on String {
  ModelCustomization toModelCustomization() {
    switch (this) {
      case 'FINE_TUNING':
        return ModelCustomization.fineTuning;
      case 'CONTINUED_PRE_TRAINING':
        return ModelCustomization.continuedPreTraining;
    }
    throw Exception('$this is not known in enum ModelCustomization');
  }
}

enum ModelCustomizationJobStatus {
  inProgress,
  completed,
  failed,
  stopping,
  stopped,
}

extension ModelCustomizationJobStatusValueExtension
    on ModelCustomizationJobStatus {
  String toValue() {
    switch (this) {
      case ModelCustomizationJobStatus.inProgress:
        return 'InProgress';
      case ModelCustomizationJobStatus.completed:
        return 'Completed';
      case ModelCustomizationJobStatus.failed:
        return 'Failed';
      case ModelCustomizationJobStatus.stopping:
        return 'Stopping';
      case ModelCustomizationJobStatus.stopped:
        return 'Stopped';
    }
  }
}

extension ModelCustomizationJobStatusFromString on String {
  ModelCustomizationJobStatus toModelCustomizationJobStatus() {
    switch (this) {
      case 'InProgress':
        return ModelCustomizationJobStatus.inProgress;
      case 'Completed':
        return ModelCustomizationJobStatus.completed;
      case 'Failed':
        return ModelCustomizationJobStatus.failed;
      case 'Stopping':
        return ModelCustomizationJobStatus.stopping;
      case 'Stopped':
        return ModelCustomizationJobStatus.stopped;
    }
    throw Exception('$this is not known in enum ModelCustomizationJobStatus');
  }
}

/// Information about one customization job
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
  });

  factory ModelCustomizationJobSummary.fromJson(Map<String, dynamic> json) {
    return ModelCustomizationJobSummary(
      baseModelArn: json['baseModelArn'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      status: (json['status'] as String).toModelCustomizationJobStatus(),
      customModelArn: json['customModelArn'] as String?,
      customModelName: json['customModelName'] as String?,
      customizationType:
          (json['customizationType'] as String?)?.toCustomizationType(),
      endTime: timeStampFromJson(json['endTime']),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
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
    return {
      'baseModelArn': baseModelArn,
      'creationTime': iso8601ToJson(creationTime),
      'jobArn': jobArn,
      'jobName': jobName,
      'status': status.toValue(),
      if (customModelArn != null) 'customModelArn': customModelArn,
      if (customModelName != null) 'customModelName': customModelName,
      if (customizationType != null)
        'customizationType': customizationType.toValue(),
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

enum ModelModality {
  text,
  image,
  embedding,
}

extension ModelModalityValueExtension on ModelModality {
  String toValue() {
    switch (this) {
      case ModelModality.text:
        return 'TEXT';
      case ModelModality.image:
        return 'IMAGE';
      case ModelModality.embedding:
        return 'EMBEDDING';
    }
  }
}

extension ModelModalityFromString on String {
  ModelModality toModelModality() {
    switch (this) {
      case 'TEXT':
        return ModelModality.text;
      case 'IMAGE':
        return ModelModality.image;
      case 'EMBEDDING':
        return ModelModality.embedding;
    }
    throw Exception('$this is not known in enum ModelModality');
  }
}

/// S3 Location of the output data.
class OutputDataConfig {
  /// The S3 URI where the output data is stored.
  final String s3Uri;

  OutputDataConfig({
    required this.s3Uri,
  });

  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
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

enum ProvisionedModelStatus {
  creating,
  inService,
  updating,
  failed,
}

extension ProvisionedModelStatusValueExtension on ProvisionedModelStatus {
  String toValue() {
    switch (this) {
      case ProvisionedModelStatus.creating:
        return 'Creating';
      case ProvisionedModelStatus.inService:
        return 'InService';
      case ProvisionedModelStatus.updating:
        return 'Updating';
      case ProvisionedModelStatus.failed:
        return 'Failed';
    }
  }
}

extension ProvisionedModelStatusFromString on String {
  ProvisionedModelStatus toProvisionedModelStatus() {
    switch (this) {
      case 'Creating':
        return ProvisionedModelStatus.creating;
      case 'InService':
        return ProvisionedModelStatus.inService;
      case 'Updating':
        return ProvisionedModelStatus.updating;
      case 'Failed':
        return ProvisionedModelStatus.failed;
    }
    throw Exception('$this is not known in enum ProvisionedModelStatus');
  }
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
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      desiredModelArn: json['desiredModelArn'] as String,
      desiredModelUnits: json['desiredModelUnits'] as int,
      foundationModelArn: json['foundationModelArn'] as String,
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['lastModifiedTime'] as Object),
      modelArn: json['modelArn'] as String,
      modelUnits: json['modelUnits'] as int,
      provisionedModelArn: json['provisionedModelArn'] as String,
      provisionedModelName: json['provisionedModelName'] as String,
      status: (json['status'] as String).toProvisionedModelStatus(),
      commitmentDuration:
          (json['commitmentDuration'] as String?)?.toCommitmentDuration(),
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
      'status': status.toValue(),
      if (commitmentDuration != null)
        'commitmentDuration': commitmentDuration.toValue(),
      if (commitmentExpirationTime != null)
        'commitmentExpirationTime': iso8601ToJson(commitmentExpirationTime),
    };
  }
}

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

/// S3 configuration for storing log data.
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
      bucketName: json['bucketName'] as String,
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

enum SortByProvisionedModels {
  creationTime,
}

extension SortByProvisionedModelsValueExtension on SortByProvisionedModels {
  String toValue() {
    switch (this) {
      case SortByProvisionedModels.creationTime:
        return 'CreationTime';
    }
  }
}

extension SortByProvisionedModelsFromString on String {
  SortByProvisionedModels toSortByProvisionedModels() {
    switch (this) {
      case 'CreationTime':
        return SortByProvisionedModels.creationTime;
    }
    throw Exception('$this is not known in enum SortByProvisionedModels');
  }
}

enum SortJobsBy {
  creationTime,
}

extension SortJobsByValueExtension on SortJobsBy {
  String toValue() {
    switch (this) {
      case SortJobsBy.creationTime:
        return 'CreationTime';
    }
  }
}

extension SortJobsByFromString on String {
  SortJobsBy toSortJobsBy() {
    switch (this) {
      case 'CreationTime':
        return SortJobsBy.creationTime;
    }
    throw Exception('$this is not known in enum SortJobsBy');
  }
}

enum SortModelsBy {
  creationTime,
}

extension SortModelsByValueExtension on SortModelsBy {
  String toValue() {
    switch (this) {
      case SortModelsBy.creationTime:
        return 'CreationTime';
    }
  }
}

extension SortModelsByFromString on String {
  SortModelsBy toSortModelsBy() {
    switch (this) {
      case 'CreationTime':
        return SortModelsBy.creationTime;
    }
    throw Exception('$this is not known in enum SortModelsBy');
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'Ascending';
      case SortOrder.descending:
        return 'Descending';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'Ascending':
        return SortOrder.ascending;
      case 'Descending':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

class StopEvaluationJobResponse {
  StopEvaluationJobResponse();

  factory StopEvaluationJobResponse.fromJson(Map<String, dynamic> _) {
    return StopEvaluationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopModelCustomizationJobResponse {
  StopModelCustomizationJobResponse();

  factory StopModelCustomizationJobResponse.fromJson(Map<String, dynamic> _) {
    return StopModelCustomizationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Definition of the key/value pair for a tag.
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// S3 Location of the training data.
class TrainingDataConfig {
  /// The S3 URI where the training data is stored.
  final String s3Uri;

  TrainingDataConfig({
    required this.s3Uri,
  });

  factory TrainingDataConfig.fromJson(Map<String, dynamic> json) {
    return TrainingDataConfig(
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

/// Metrics associated with the custom job.
class TrainingMetrics {
  /// Loss metric associated with the custom job.
  final double? trainingLoss;

  TrainingMetrics({
    this.trainingLoss,
  });

  factory TrainingMetrics.fromJson(Map<String, dynamic> json) {
    return TrainingMetrics(
      trainingLoss: json['trainingLoss'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final trainingLoss = this.trainingLoss;
    return {
      if (trainingLoss != null) 'trainingLoss': trainingLoss,
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

class UpdateGuardrailResponse {
  /// The ARN of the guardrail that was created.
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
      guardrailArn: json['guardrailArn'] as String,
      guardrailId: json['guardrailId'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
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

/// Array of up to 10 validators.
class ValidationDataConfig {
  /// Information about the validators.
  final List<Validator> validators;

  ValidationDataConfig({
    required this.validators,
  });

  factory ValidationDataConfig.fromJson(Map<String, dynamic> json) {
    return ValidationDataConfig(
      validators: (json['validators'] as List)
          .whereNotNull()
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

/// Information about a validator.
class Validator {
  /// The S3 URI where the validation data is stored.
  final String s3Uri;

  Validator({
    required this.s3Uri,
  });

  factory Validator.fromJson(Map<String, dynamic> json) {
    return Validator(
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

/// The metric for the validator.
class ValidatorMetric {
  /// The validation loss associated with this validator.
  final double? validationLoss;

  ValidatorMetric({
    this.validationLoss,
  });

  factory ValidatorMetric.fromJson(Map<String, dynamic> json) {
    return ValidatorMetric(
      validationLoss: json['validationLoss'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final validationLoss = this.validationLoss;
    return {
      if (validationLoss != null) 'validationLoss': validationLoss,
    };
  }
}

/// VPC configuration.
class VpcConfig {
  /// VPC configuration security group Ids.
  final List<String> securityGroupIds;

  /// VPC configuration subnets.
  final List<String> subnetIds;

  VpcConfig({
    required this.securityGroupIds,
    required this.subnetIds,
  });

  factory VpcConfig.fromJson(Map<String, dynamic> json) {
    return VpcConfig(
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
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

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
