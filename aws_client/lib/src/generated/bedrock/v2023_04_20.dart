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

  /// Creates a batch deletion job. A model evaluation job can only be deleted
  /// if it has following status <code>FAILED</code>, <code>COMPLETED</code>,
  /// and <code>STOPPED</code>. You can request up to 25 model evaluation jobs
  /// be deleted in a single request.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobIdentifiers] :
  /// An array of model evaluation job ARNs to be deleted.
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

  /// API operation for creating and managing Amazon Bedrock automatic model
  /// evaluation jobs and model evaluation jobs that use human workers. To learn
  /// more about the requirements for creating a model evaluation job see, <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation.html">Model
  /// evaluation</a>.
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
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/guardrails.html">Guardrails
  /// for Amazon Bedrock</a> in the <i>Amazon Bedrock User Guide</i>.
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
  /// Parameter [contextualGroundingPolicyConfig] :
  /// The contextual grounding policy configuration used to create a guardrail.
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
    GuardrailContextualGroundingPolicyConfig? contextualGroundingPolicyConfig,
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
      if (contextualGroundingPolicyConfig != null)
        'contextualGroundingPolicyConfig': contextualGroundingPolicyConfig,
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

  /// Copies a model to another region so that it can be used there. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/copy-model.html">Copy
  /// models to be used in other regions</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
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
        'customizationType': customizationType.value,
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

  /// Creates a model import job to import model that you have customized in
  /// other environments, such as Amazon SageMaker. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a>
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
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
  /// Parameter [tags] :
  /// Any tags to associate with the batch inference job. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// Amazon Bedrock resources</a>.
  ///
  /// Parameter [timeoutDurationInHours] :
  /// The number of hours after which to force the batch inference job to time
  /// out.
  Future<CreateModelInvocationJobResponse> createModelInvocationJob({
    required ModelInvocationJobInputDataConfig inputDataConfig,
    required String jobName,
    required String modelId,
    required ModelInvocationJobOutputDataConfig outputDataConfig,
    required String roleArn,
    String? clientRequestToken,
    List<Tag>? tags,
    int? timeoutDurationInHours,
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
      if (tags != null) 'tags': tags,
      if (timeoutDurationInHours != null)
        'timeoutDurationInHours': timeoutDurationInHours,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/model-invocation-job',
      exceptionFnMap: _exceptionFns,
    );
    return CreateModelInvocationJobResponse.fromJson(response);
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

  /// Deletes a custom model that you created earlier. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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

  /// Deletes a custom model that you imported earlier. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-evaluation.html">Model
  /// evaluation</a>.
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

  /// Gets properties associated with a customized model you imported.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Gets information about an inference profile. For more information, see the
  /// Amazon Bedrock User Guide.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [inferenceProfileIdentifier] :
  /// The unique identifier of the inference profile.
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

  /// Retrieves information about a model copy job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/copy-model.html">Copy
  /// models to be used in other regions</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Retrieves the properties associated with a model-customization job,
  /// including the status of the job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/custom-models.html">Custom
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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

  /// Retrieves the properties associated with import model job, including the
  /// status of the job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Gets details about a batch inference job. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-manage.html#batch-inference-view">View
  /// details about a batch inference job</a>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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

  /// Lists Amazon Bedrock foundation models that you can use. You can filter
  /// the results with the request parameters. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/foundation-models.html">Foundation
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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

  /// Returns a list of models you've imported. You can filter the results to
  /// return based on one or more criteria. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Returns a list of inference profiles that you can use.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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
  Future<ListInferenceProfilesResponse> listInferenceProfiles({
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
      requestUri: '/inference-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListInferenceProfilesResponse.fromJson(response);
  }

  /// Returns a list of model copy jobs that you have submitted. You can filter
  /// the jobs to return based on one or more criteria. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/copy-model.html">Copy
  /// models to be used in other regions</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Returns a list of import jobs you've submitted. You can filter the results
  /// to return based on one or more criteria. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-customization-import-model.html">Import
  /// a customized model</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Lists all batch inference jobs in the account. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-manage.html#batch-inference-view">View
  /// details about a batch inference job</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Lists the Provisioned Throughputs in the account. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/prov-throughput.html">Provisioned
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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

  /// List the tags associated with the specified resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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
  /// models</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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

  /// Stops a batch inference job. You're only charged for tokens that were
  /// already processed. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/batch-inference-manage.html#batch-inference-stop">Stop
  /// a batch inference job</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
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

  /// Associate tags with a resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/tagging.html">Tagging
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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
  /// resources</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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
  /// The unique identifier of the guardrail. This can be an ID or the ARN.
  ///
  /// Parameter [name] :
  /// A name for the guardrail.
  ///
  /// Parameter [contentPolicyConfig] :
  /// The content policy to configure for the guardrail.
  ///
  /// Parameter [contextualGroundingPolicyConfig] :
  /// The contextual grounding policy configuration used to update a guardrail.
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
    GuardrailContextualGroundingPolicyConfig? contextualGroundingPolicyConfig,
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
      if (contextualGroundingPolicyConfig != null)
        'contextualGroundingPolicyConfig': contextualGroundingPolicyConfig,
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
  /// Throughput</a> in the <a
  /// href="https://docs.aws.amazon.com/bedrock/latest/userguide/what-is-service.html">Amazon
  /// Bedrock User Guide</a>.
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
          .nonNulls
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

/// A JSON array that provides the status of the model evaluation jobs being
/// deleted.
class BatchDeleteEvaluationJobError {
  /// A HTTP status code of the model evaluation job being deleted.
  final String code;

  /// The ARN of the model evaluation job being deleted.
  final String jobIdentifier;

  /// A status message about the model evaluation job deletion.
  final String? message;

  BatchDeleteEvaluationJobError({
    required this.code,
    required this.jobIdentifier,
    this.message,
  });

  factory BatchDeleteEvaluationJobError.fromJson(Map<String, dynamic> json) {
    return BatchDeleteEvaluationJobError(
      code: json['code'] as String,
      jobIdentifier: json['jobIdentifier'] as String,
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

/// An array of model evaluation jobs to be deleted, and their associated
/// statuses.
class BatchDeleteEvaluationJobItem {
  /// The ARN of model evaluation job to be deleted.
  final String jobIdentifier;

  /// The status of the job's deletion.
  final EvaluationJobStatus jobStatus;

  BatchDeleteEvaluationJobItem({
    required this.jobIdentifier,
    required this.jobStatus,
  });

  factory BatchDeleteEvaluationJobItem.fromJson(Map<String, dynamic> json) {
    return BatchDeleteEvaluationJobItem(
      jobIdentifier: json['jobIdentifier'] as String,
      jobStatus: EvaluationJobStatus.fromString((json['jobStatus'] as String)),
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

class BatchDeleteEvaluationJobResponse {
  /// A JSON object containing the HTTP status codes and the ARNs of model
  /// evaluation jobs that failed to be deleted.
  final List<BatchDeleteEvaluationJobError> errors;

  /// The list of model evaluation jobs to be deleted.
  final List<BatchDeleteEvaluationJobItem> evaluationJobs;

  BatchDeleteEvaluationJobResponse({
    required this.errors,
    required this.evaluationJobs,
  });

  factory BatchDeleteEvaluationJobResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteEvaluationJobResponse(
      errors: (json['errors'] as List)
          .nonNulls
          .map((e) =>
              BatchDeleteEvaluationJobError.fromJson(e as Map<String, dynamic>))
          .toList(),
      evaluationJobs: (json['evaluationJobs'] as List)
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
  oneMonth('OneMonth'),
  sixMonths('SixMonths'),
  ;

  final String value;

  const CommitmentDuration(this.value);

  static CommitmentDuration fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum CommitmentDuration'));
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

class CreateModelCopyJobResponse {
  /// The Amazon Resource Name (ARN) of the model copy job.
  final String jobArn;

  CreateModelCopyJobResponse({
    required this.jobArn,
  });

  factory CreateModelCopyJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelCopyJobResponse(
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

class CreateModelImportJobResponse {
  /// The Amazon Resource Name (ARN) of the model import job.
  final String jobArn;

  CreateModelImportJobResponse({
    required this.jobArn,
  });

  factory CreateModelImportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelImportJobResponse(
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

class CreateModelInvocationJobResponse {
  /// The Amazon Resource Name (ARN) of the batch inference job.
  final String jobArn;

  CreateModelInvocationJobResponse({
    required this.jobArn,
  });

  factory CreateModelInvocationJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateModelInvocationJobResponse(
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

  /// The unique identifier of the account that owns the model.
  final String? ownerAccountId;

  CustomModelSummary({
    required this.baseModelArn,
    required this.baseModelName,
    required this.creationTime,
    required this.modelArn,
    required this.modelName,
    this.customizationType,
    this.ownerAccountId,
  });

  factory CustomModelSummary.fromJson(Map<String, dynamic> json) {
    return CustomModelSummary(
      baseModelArn: json['baseModelArn'] as String,
      baseModelName: json['baseModelName'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      modelArn: json['modelArn'] as String,
      modelName: json['modelName'] as String,
      customizationType: (json['customizationType'] as String?)
          ?.let(CustomizationType.fromString),
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
    final ownerAccountId = this.ownerAccountId;
    return {
      'baseModelArn': baseModelArn,
      'baseModelName': baseModelName,
      'creationTime': iso8601ToJson(creationTime),
      'modelArn': modelArn,
      'modelName': modelName,
      if (customizationType != null)
        'customizationType': customizationType.value,
      if (ownerAccountId != null) 'ownerAccountId': ownerAccountId,
    };
  }
}

enum CustomizationType {
  fineTuning('FINE_TUNING'),
  continuedPreTraining('CONTINUED_PRE_TRAINING'),
  ;

  final String value;

  const CustomizationType(this.value);

  static CustomizationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum CustomizationType'));
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

class DeleteImportedModelResponse {
  DeleteImportedModelResponse();

  factory DeleteImportedModelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteImportedModelResponse();
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
/// href="https://docs.aws.amazon.com/bedrock/latest/userguide/model-parameters.html">Inference
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
          .nonNulls
          .map((e) => e as String)
          .toList(),
      taskType: EvaluationTaskType.fromString((json['taskType'] as String)),
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
          ?.nonNulls
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
  inProgress('InProgress'),
  completed('Completed'),
  failed('Failed'),
  stopping('Stopping'),
  stopped('Stopped'),
  deleting('Deleting'),
  ;

  final String value;

  const EvaluationJobStatus(this.value);

  static EvaluationJobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum EvaluationJobStatus'));
}

enum EvaluationJobType {
  human('Human'),
  automated('Automated'),
  ;

  final String value;

  const EvaluationJobType(this.value);

  static EvaluationJobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EvaluationJobType'));
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
          .nonNulls
          .map((e) => EvaluationTaskType.fromString((e as String)))
          .toList(),
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      jobType: EvaluationJobType.fromString((json['jobType'] as String)),
      modelIdentifiers: (json['modelIdentifiers'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: EvaluationJobStatus.fromString((json['status'] as String)),
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
      'evaluationTaskTypes': evaluationTaskTypes.map((e) => e.value).toList(),
      'jobArn': jobArn,
      'jobName': jobName,
      'jobType': jobType.value,
      'modelIdentifiers': modelIdentifiers,
      'status': status.value,
    };
  }
}

enum EvaluationTaskType {
  summarization('Summarization'),
  classification('Classification'),
  questionAndAnswer('QuestionAndAnswer'),
  generation('Generation'),
  custom('Custom'),
  ;

  final String value;

  const EvaluationTaskType(this.value);

  static EvaluationTaskType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum EvaluationTaskType'));
}

enum FineTuningJobStatus {
  inProgress('InProgress'),
  completed('Completed'),
  failed('Failed'),
  stopping('Stopping'),
  stopped('Stopped'),
  ;

  final String value;

  const FineTuningJobStatus(this.value);

  static FineTuningJobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum FineTuningJobStatus'));
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
class FoundationModelLifecycle {
  /// Specifies whether a model version is available (<code>ACTIVE</code>) or
  /// deprecated (<code>LEGACY</code>.
  final FoundationModelLifecycleStatus status;

  FoundationModelLifecycle({
    required this.status,
  });

  factory FoundationModelLifecycle.fromJson(Map<String, dynamic> json) {
    return FoundationModelLifecycle(
      status:
          FoundationModelLifecycleStatus.fromString((json['status'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      'status': status.value,
    };
  }
}

enum FoundationModelLifecycleStatus {
  active('ACTIVE'),
  legacy('LEGACY'),
  ;

  final String value;

  const FoundationModelLifecycleStatus(this.value);

  static FoundationModelLifecycleStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum FoundationModelLifecycleStatus'));
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
      customizationType: (json['customizationType'] as String?)
          ?.let(CustomizationType.fromString),
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
          ?.nonNulls
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
        'customizationType': customizationType.value,
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
      jobType: EvaluationJobType.fromString((json['jobType'] as String)),
      outputDataConfig: EvaluationOutputDataConfig.fromJson(
          json['outputDataConfig'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      status: EvaluationJobStatus.fromString((json['status'] as String)),
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

  /// The content policy that was configured for the guardrail.
  final GuardrailContentPolicy? contentPolicy;

  /// The contextual grounding policy used in the guardrail.
  final GuardrailContextualGroundingPolicy? contextualGroundingPolicy;

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
    this.contextualGroundingPolicy,
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
      status: GuardrailStatus.fromString((json['status'] as String)),
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      version: json['version'] as String,
      contentPolicy: json['contentPolicy'] != null
          ? GuardrailContentPolicy.fromJson(
              json['contentPolicy'] as Map<String, dynamic>)
          : null,
      contextualGroundingPolicy: json['contextualGroundingPolicy'] != null
          ? GuardrailContextualGroundingPolicy.fromJson(
              json['contextualGroundingPolicy'] as Map<String, dynamic>)
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
    final contentPolicy = this.contentPolicy;
    final contextualGroundingPolicy = this.contextualGroundingPolicy;
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
      if (contentPolicy != null) 'contentPolicy': contentPolicy,
      if (contextualGroundingPolicy != null)
        'contextualGroundingPolicy': contextualGroundingPolicy,
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

class GetImportedModelResponse {
  /// Creation time of the imported model.
  final DateTime? creationTime;

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
    final jobArn = this.jobArn;
    final jobName = this.jobName;
    final modelArchitecture = this.modelArchitecture;
    final modelArn = this.modelArn;
    final modelDataSource = this.modelDataSource;
    final modelKmsKeyArn = this.modelKmsKeyArn;
    final modelName = this.modelName;
    return {
      if (creationTime != null) 'creationTime': iso8601ToJson(creationTime),
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
  /// inference profile is available to use.
  final InferenceProfileStatus status;

  /// The type of the inference profile. <code>SYSTEM_DEFINED</code> means that
  /// the inference profile is defined by Amazon Bedrock.
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
      inferenceProfileArn: json['inferenceProfileArn'] as String,
      inferenceProfileId: json['inferenceProfileId'] as String,
      inferenceProfileName: json['inferenceProfileName'] as String,
      models: (json['models'] as List)
          .nonNulls
          .map((e) => InferenceProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: InferenceProfileStatus.fromString((json['status'] as String)),
      type: InferenceProfileType.fromString((json['type'] as String)),
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
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      jobArn: json['jobArn'] as String,
      sourceAccountId: json['sourceAccountId'] as String,
      sourceModelArn: json['sourceModelArn'] as String,
      status: ModelCopyJobStatus.fromString((json['status'] as String)),
      targetModelArn: json['targetModelArn'] as String,
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
      customizationType: (json['customizationType'] as String?)
          ?.let(CustomizationType.fromString),
      endTime: timeStampFromJson(json['endTime']),
      failureMessage: json['failureMessage'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      outputModelArn: json['outputModelArn'] as String?,
      outputModelKmsKeyArn: json['outputModelKmsKeyArn'] as String?,
      status: (json['status'] as String?)
          ?.let(ModelCustomizationJobStatus.fromString),
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
        'customizationType': customizationType.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (outputModelArn != null) 'outputModelArn': outputModelArn,
      if (outputModelKmsKeyArn != null)
        'outputModelKmsKeyArn': outputModelKmsKeyArn,
      if (status != null) 'status': status.value,
      if (trainingMetrics != null) 'trainingMetrics': trainingMetrics,
      if (validationMetrics != null) 'validationMetrics': validationMetrics,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

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

  /// The time at which the batch inference job times or timed out.
  final DateTime? jobExpirationTime;

  /// The name of the batch inference job.
  final String? jobName;

  /// The time at which the batch inference job was last modified.
  final DateTime? lastModifiedTime;

  /// If the batch inference job failed, this field contains a message describing
  /// why the job failed.
  final String? message;

  /// The status of the batch inference job.
  final ModelInvocationJobStatus? status;

  /// The number of hours after which batch inference job was set to time out.
  final int? timeoutDurationInHours;

  GetModelInvocationJobResponse({
    required this.inputDataConfig,
    required this.jobArn,
    required this.modelId,
    required this.outputDataConfig,
    required this.roleArn,
    required this.submitTime,
    this.clientRequestToken,
    this.endTime,
    this.jobExpirationTime,
    this.jobName,
    this.lastModifiedTime,
    this.message,
    this.status,
    this.timeoutDurationInHours,
  });

  factory GetModelInvocationJobResponse.fromJson(Map<String, dynamic> json) {
    return GetModelInvocationJobResponse(
      inputDataConfig: ModelInvocationJobInputDataConfig.fromJson(
          json['inputDataConfig'] as Map<String, dynamic>),
      jobArn: json['jobArn'] as String,
      modelId: json['modelId'] as String,
      outputDataConfig: ModelInvocationJobOutputDataConfig.fromJson(
          json['outputDataConfig'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      submitTime: nonNullableTimeStampFromJson(json['submitTime'] as Object),
      clientRequestToken: json['clientRequestToken'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      jobExpirationTime: timeStampFromJson(json['jobExpirationTime']),
      jobName: json['jobName'] as String?,
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      message: json['message'] as String?,
      status:
          (json['status'] as String?)?.let(ModelInvocationJobStatus.fromString),
      timeoutDurationInHours: json['timeoutDurationInHours'] as int?,
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
    final jobExpirationTime = this.jobExpirationTime;
    final jobName = this.jobName;
    final lastModifiedTime = this.lastModifiedTime;
    final message = this.message;
    final status = this.status;
    final timeoutDurationInHours = this.timeoutDurationInHours;
    return {
      'inputDataConfig': inputDataConfig,
      'jobArn': jobArn,
      'modelId': modelId,
      'outputDataConfig': outputDataConfig,
      'roleArn': roleArn,
      'submitTime': iso8601ToJson(submitTime),
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (jobExpirationTime != null)
        'jobExpirationTime': iso8601ToJson(jobExpirationTime),
      if (jobName != null) 'jobName': jobName,
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (message != null) 'message': message,
      if (status != null) 'status': status.value,
      if (timeoutDurationInHours != null)
        'timeoutDurationInHours': timeoutDurationInHours,
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
      status: ProvisionedModelStatus.fromString((json['status'] as String)),
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
          GuardrailFilterStrength.fromString((json['inputStrength'] as String)),
      outputStrength: GuardrailFilterStrength.fromString(
          (json['outputStrength'] as String)),
      type: GuardrailContentFilterType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final inputStrength = this.inputStrength;
    final outputStrength = this.outputStrength;
    final type = this.type;
    return {
      'inputStrength': inputStrength.value,
      'outputStrength': outputStrength.value,
      'type': type.value,
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
      'inputStrength': inputStrength.value,
      'outputStrength': outputStrength.value,
      'type': type.value,
    };
  }
}

enum GuardrailContentFilterType {
  sexual('SEXUAL'),
  violence('VIOLENCE'),
  hate('HATE'),
  insults('INSULTS'),
  misconduct('MISCONDUCT'),
  promptAttack('PROMPT_ATTACK'),
  ;

  final String value;

  const GuardrailContentFilterType(this.value);

  static GuardrailContentFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContentFilterType'));
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
          ?.nonNulls
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

/// The details for the guardrails contextual grounding filter.
class GuardrailContextualGroundingFilter {
  /// The threshold details for the guardrails contextual grounding filter.
  final double threshold;

  /// The filter type details for the guardrails contextual grounding filter.
  final GuardrailContextualGroundingFilterType type;

  GuardrailContextualGroundingFilter({
    required this.threshold,
    required this.type,
  });

  factory GuardrailContextualGroundingFilter.fromJson(
      Map<String, dynamic> json) {
    return GuardrailContextualGroundingFilter(
      threshold: json['threshold'] as double,
      type: GuardrailContextualGroundingFilterType.fromString(
          (json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final threshold = this.threshold;
    final type = this.type;
    return {
      'threshold': threshold,
      'type': type.value,
    };
  }
}

/// The filter configuration details for the guardrails contextual grounding
/// filter.
class GuardrailContextualGroundingFilterConfig {
  /// The threshold details for the guardrails contextual grounding filter.
  final double threshold;

  /// The filter details for the guardrails contextual grounding filter.
  final GuardrailContextualGroundingFilterType type;

  GuardrailContextualGroundingFilterConfig({
    required this.threshold,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final threshold = this.threshold;
    final type = this.type;
    return {
      'threshold': threshold,
      'type': type.value,
    };
  }
}

enum GuardrailContextualGroundingFilterType {
  grounding('GROUNDING'),
  relevance('RELEVANCE'),
  ;

  final String value;

  const GuardrailContextualGroundingFilterType(this.value);

  static GuardrailContextualGroundingFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailContextualGroundingFilterType'));
}

/// The details for the guardrails contextual grounding policy.
class GuardrailContextualGroundingPolicy {
  /// The filter details for the guardrails contextual grounding policy.
  final List<GuardrailContextualGroundingFilter> filters;

  GuardrailContextualGroundingPolicy({
    required this.filters,
  });

  factory GuardrailContextualGroundingPolicy.fromJson(
      Map<String, dynamic> json) {
    return GuardrailContextualGroundingPolicy(
      filters: (json['filters'] as List)
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

/// The policy configuration details for the guardrails contextual grounding
/// policy.
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

enum GuardrailFilterStrength {
  none('NONE'),
  low('LOW'),
  medium('MEDIUM'),
  high('HIGH'),
  ;

  final String value;

  const GuardrailFilterStrength(this.value);

  static GuardrailFilterStrength fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailFilterStrength'));
}

/// The managed word list that was configured for the guardrail. (This is a list
/// of words that are pre-defined and managed by guardrails only.)
class GuardrailManagedWords {
  /// ManagedWords$type The managed word type that was configured for the
  /// guardrail. (For now, we only offer profanity word list)
  final GuardrailManagedWordsType type;

  GuardrailManagedWords({
    required this.type,
  });

  factory GuardrailManagedWords.fromJson(Map<String, dynamic> json) {
    return GuardrailManagedWords(
      type: GuardrailManagedWordsType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.value,
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
      'type': type.value,
    };
  }
}

enum GuardrailManagedWordsType {
  profanity('PROFANITY'),
  ;

  final String value;

  const GuardrailManagedWordsType(this.value);

  static GuardrailManagedWordsType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailManagedWordsType'));
}

/// The PII entity configured for the guardrail.
class GuardrailPiiEntity {
  /// The configured guardrail action when PII entity is detected.
  final GuardrailSensitiveInformationAction action;

  /// The type of PII entity. For exampvle, Social Security Number.
  final GuardrailPiiEntityType type;

  GuardrailPiiEntity({
    required this.action,
    required this.type,
  });

  factory GuardrailPiiEntity.fromJson(Map<String, dynamic> json) {
    return GuardrailPiiEntity(
      action: GuardrailSensitiveInformationAction.fromString(
          (json['action'] as String)),
      type: GuardrailPiiEntityType.fromString((json['type'] as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final type = this.type;
    return {
      'action': action.value,
      'type': type.value,
    };
  }
}

/// The PII entity to configure for the guardrail.
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
  /// in the phrase "I am 40 years old," Guarrails recognizes "40 years" as an
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
  /// <b>REDIT_DEBIT_CARD_CVV</b>
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

  GuardrailPiiEntityConfig({
    required this.action,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final action = this.action;
    final type = this.type;
    return {
      'action': action.value,
      'type': type.value,
    };
  }
}

enum GuardrailPiiEntityType {
  address('ADDRESS'),
  age('AGE'),
  awsAccessKey('AWS_ACCESS_KEY'),
  awsSecretKey('AWS_SECRET_KEY'),
  caHealthNumber('CA_HEALTH_NUMBER'),
  caSocialInsuranceNumber('CA_SOCIAL_INSURANCE_NUMBER'),
  creditDebitCardCvv('CREDIT_DEBIT_CARD_CVV'),
  creditDebitCardExpiry('CREDIT_DEBIT_CARD_EXPIRY'),
  creditDebitCardNumber('CREDIT_DEBIT_CARD_NUMBER'),
  driverId('DRIVER_ID'),
  email('EMAIL'),
  internationalBankAccountNumber('INTERNATIONAL_BANK_ACCOUNT_NUMBER'),
  ipAddress('IP_ADDRESS'),
  licensePlate('LICENSE_PLATE'),
  macAddress('MAC_ADDRESS'),
  name('NAME'),
  password('PASSWORD'),
  phone('PHONE'),
  pin('PIN'),
  swiftCode('SWIFT_CODE'),
  ukNationalHealthServiceNumber('UK_NATIONAL_HEALTH_SERVICE_NUMBER'),
  ukNationalInsuranceNumber('UK_NATIONAL_INSURANCE_NUMBER'),
  ukUniqueTaxpayerReferenceNumber('UK_UNIQUE_TAXPAYER_REFERENCE_NUMBER'),
  url('URL'),
  username('USERNAME'),
  usBankAccountNumber('US_BANK_ACCOUNT_NUMBER'),
  usBankRoutingNumber('US_BANK_ROUTING_NUMBER'),
  usIndividualTaxIdentificationNumber(
      'US_INDIVIDUAL_TAX_IDENTIFICATION_NUMBER'),
  usPassportNumber('US_PASSPORT_NUMBER'),
  usSocialSecurityNumber('US_SOCIAL_SECURITY_NUMBER'),
  vehicleIdentificationNumber('VEHICLE_IDENTIFICATION_NUMBER'),
  ;

  final String value;

  const GuardrailPiiEntityType(this.value);

  static GuardrailPiiEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailPiiEntityType'));
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
      action: GuardrailSensitiveInformationAction.fromString(
          (json['action'] as String)),
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
      'action': action.value,
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
      'action': action.value,
      'name': name,
      'pattern': pattern,
      if (description != null) 'description': description,
    };
  }
}

enum GuardrailSensitiveInformationAction {
  block('BLOCK'),
  anonymize('ANONYMIZE'),
  ;

  final String value;

  const GuardrailSensitiveInformationAction(this.value);

  static GuardrailSensitiveInformationAction fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum GuardrailSensitiveInformationAction'));
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
  creating('CREATING'),
  updating('UPDATING'),
  versioning('VERSIONING'),
  ready('READY'),
  failed('FAILED'),
  deleting('DELETING'),
  ;

  final String value;

  const GuardrailStatus(this.value);

  static GuardrailStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum GuardrailStatus'));
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
      status: GuardrailStatus.fromString((json['status'] as String)),
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
      'status': status.value,
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.let(GuardrailTopicType.fromString),
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
      if (type != null) 'type': type.value,
    };
  }
}

/// Details about topics for the guardrail to identify and deny.
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
      'type': type.value,
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
          .nonNulls
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
  deny('DENY'),
  ;

  final String value;

  const GuardrailTopicType(this.value);

  static GuardrailTopicType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum GuardrailTopicType'));
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

/// Information about tne imported model.
class ImportedModelSummary {
  /// Creation time of the imported model.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the imported model.
  final String modelArn;

  /// Name of the imported model.
  final String modelName;

  ImportedModelSummary({
    required this.creationTime,
    required this.modelArn,
    required this.modelName,
  });

  factory ImportedModelSummary.fromJson(Map<String, dynamic> json) {
    return ImportedModelSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      modelArn: json['modelArn'] as String,
      modelName: json['modelName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final modelArn = this.modelArn;
    final modelName = this.modelName;
    return {
      'creationTime': iso8601ToJson(creationTime),
      'modelArn': modelArn,
      'modelName': modelName,
    };
  }
}

/// Contains information about a model.
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

enum InferenceProfileStatus {
  active('ACTIVE'),
  ;

  final String value;

  const InferenceProfileStatus(this.value);

  static InferenceProfileStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum InferenceProfileStatus'));
}

/// Contains information about an inference profile.
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
  /// inference profile is available to use.
  final InferenceProfileStatus status;

  /// The type of the inference profile. <code>SYSTEM_DEFINED</code> means that
  /// the inference profile is defined by Amazon Bedrock.
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
      inferenceProfileArn: json['inferenceProfileArn'] as String,
      inferenceProfileId: json['inferenceProfileId'] as String,
      inferenceProfileName: json['inferenceProfileName'] as String,
      models: (json['models'] as List)
          .nonNulls
          .map((e) => InferenceProfileModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: InferenceProfileStatus.fromString((json['status'] as String)),
      type: InferenceProfileType.fromString((json['type'] as String)),
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

enum InferenceProfileType {
  systemDefined('SYSTEM_DEFINED'),
  ;

  final String value;

  const InferenceProfileType(this.value);

  static InferenceProfileType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum InferenceProfileType'));
}

enum InferenceType {
  onDemand('ON_DEMAND'),
  provisioned('PROVISIONED'),
  ;

  final String value;

  const InferenceType(this.value);

  static InferenceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum InferenceType'));
}

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

enum ModelCopyJobStatus {
  inProgress('InProgress'),
  completed('Completed'),
  failed('Failed'),
  ;

  final String value;

  const ModelCopyJobStatus(this.value);

  static ModelCopyJobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ModelCopyJobStatus'));
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
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      jobArn: json['jobArn'] as String,
      sourceAccountId: json['sourceAccountId'] as String,
      sourceModelArn: json['sourceModelArn'] as String,
      status: ModelCopyJobStatus.fromString((json['status'] as String)),
      targetModelArn: json['targetModelArn'] as String,
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

enum ModelCustomization {
  fineTuning('FINE_TUNING'),
  continuedPreTraining('CONTINUED_PRE_TRAINING'),
  ;

  final String value;

  const ModelCustomization(this.value);

  static ModelCustomization fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ModelCustomization'));
}

enum ModelCustomizationJobStatus {
  inProgress('InProgress'),
  completed('Completed'),
  failed('Failed'),
  stopping('Stopping'),
  stopped('Stopped'),
  ;

  final String value;

  const ModelCustomizationJobStatus(this.value);

  static ModelCustomizationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ModelCustomizationJobStatus'));
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
      status:
          ModelCustomizationJobStatus.fromString((json['status'] as String)),
      customModelArn: json['customModelArn'] as String?,
      customModelName: json['customModelName'] as String?,
      customizationType: (json['customizationType'] as String?)
          ?.let(CustomizationType.fromString),
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
      'status': status.value,
      if (customModelArn != null) 'customModelArn': customModelArn,
      if (customModelName != null) 'customModelName': customModelName,
      if (customizationType != null)
        'customizationType': customizationType.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
    };
  }
}

/// Data source for the imported model.
class ModelDataSource {
  /// The Amazon S3 data source of the imported model.
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

enum ModelImportJobStatus {
  inProgress('InProgress'),
  completed('Completed'),
  failed('Failed'),
  ;

  final String value;

  const ModelImportJobStatus(this.value);

  static ModelImportJobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ModelImportJobStatus'));
}

/// Information about the import job.
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
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      status: ModelImportJobStatus.fromString((json['status'] as String)),
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

/// Details about the location of the input to the batch inference job.
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

/// Contains the configuration of the S3 location of the output data.
class ModelInvocationJobS3InputDataConfig {
  /// The S3 location of the input data.
  final String s3Uri;

  /// The format of the input data.
  final S3InputFormat? s3InputFormat;

  ModelInvocationJobS3InputDataConfig({
    required this.s3Uri,
    this.s3InputFormat,
  });

  factory ModelInvocationJobS3InputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return ModelInvocationJobS3InputDataConfig(
      s3Uri: json['s3Uri'] as String,
      s3InputFormat:
          (json['s3InputFormat'] as String?)?.let(S3InputFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final s3InputFormat = this.s3InputFormat;
    return {
      's3Uri': s3Uri,
      if (s3InputFormat != null) 's3InputFormat': s3InputFormat.value,
    };
  }
}

/// Contains the configuration of the S3 location of the output data.
class ModelInvocationJobS3OutputDataConfig {
  /// The S3 location of the output data.
  final String s3Uri;

  /// The unique identifier of the key that encrypts the S3 location of the output
  /// data.
  final String? s3EncryptionKeyId;

  ModelInvocationJobS3OutputDataConfig({
    required this.s3Uri,
    this.s3EncryptionKeyId,
  });

  factory ModelInvocationJobS3OutputDataConfig.fromJson(
      Map<String, dynamic> json) {
    return ModelInvocationJobS3OutputDataConfig(
      s3Uri: json['s3Uri'] as String,
      s3EncryptionKeyId: json['s3EncryptionKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final s3EncryptionKeyId = this.s3EncryptionKeyId;
    return {
      's3Uri': s3Uri,
      if (s3EncryptionKeyId != null) 's3EncryptionKeyId': s3EncryptionKeyId,
    };
  }
}

enum ModelInvocationJobStatus {
  submitted('Submitted'),
  inProgress('InProgress'),
  completed('Completed'),
  failed('Failed'),
  stopping('Stopping'),
  stopped('Stopped'),
  partiallyCompleted('PartiallyCompleted'),
  expired('Expired'),
  validating('Validating'),
  scheduled('Scheduled'),
  ;

  final String value;

  const ModelInvocationJobStatus(this.value);

  static ModelInvocationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ModelInvocationJobStatus'));
}

/// A summary of a batch inference job.
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

  /// The time at which the batch inference job times or timed out.
  final DateTime? jobExpirationTime;

  /// The time at which the batch inference job was last modified.
  final DateTime? lastModifiedTime;

  /// If the batch inference job failed, this field contains a message describing
  /// why the job failed.
  final String? message;

  /// The status of the batch inference job.
  final ModelInvocationJobStatus? status;

  /// The number of hours after which the batch inference job was set to time out.
  final int? timeoutDurationInHours;

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
    this.jobExpirationTime,
    this.lastModifiedTime,
    this.message,
    this.status,
    this.timeoutDurationInHours,
  });

  factory ModelInvocationJobSummary.fromJson(Map<String, dynamic> json) {
    return ModelInvocationJobSummary(
      inputDataConfig: ModelInvocationJobInputDataConfig.fromJson(
          json['inputDataConfig'] as Map<String, dynamic>),
      jobArn: json['jobArn'] as String,
      jobName: json['jobName'] as String,
      modelId: json['modelId'] as String,
      outputDataConfig: ModelInvocationJobOutputDataConfig.fromJson(
          json['outputDataConfig'] as Map<String, dynamic>),
      roleArn: json['roleArn'] as String,
      submitTime: nonNullableTimeStampFromJson(json['submitTime'] as Object),
      clientRequestToken: json['clientRequestToken'] as String?,
      endTime: timeStampFromJson(json['endTime']),
      jobExpirationTime: timeStampFromJson(json['jobExpirationTime']),
      lastModifiedTime: timeStampFromJson(json['lastModifiedTime']),
      message: json['message'] as String?,
      status:
          (json['status'] as String?)?.let(ModelInvocationJobStatus.fromString),
      timeoutDurationInHours: json['timeoutDurationInHours'] as int?,
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
    final jobExpirationTime = this.jobExpirationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final message = this.message;
    final status = this.status;
    final timeoutDurationInHours = this.timeoutDurationInHours;
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
      if (jobExpirationTime != null)
        'jobExpirationTime': iso8601ToJson(jobExpirationTime),
      if (lastModifiedTime != null)
        'lastModifiedTime': iso8601ToJson(lastModifiedTime),
      if (message != null) 'message': message,
      if (status != null) 'status': status.value,
      if (timeoutDurationInHours != null)
        'timeoutDurationInHours': timeoutDurationInHours,
    };
  }
}

enum ModelModality {
  text('TEXT'),
  image('IMAGE'),
  embedding('EMBEDDING'),
  ;

  final String value;

  const ModelModality(this.value);

  static ModelModality fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ModelModality'));
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
  creating('Creating'),
  inService('InService'),
  updating('Updating'),
  failed('Failed'),
  ;

  final String value;

  const ProvisionedModelStatus(this.value);

  static ProvisionedModelStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ProvisionedModelStatus'));
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
      status: ProvisionedModelStatus.fromString((json['status'] as String)),
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

/// The Amazon S3 data source of the imported job.
class S3DataSource {
  /// The URI of the Amazon S3 data source.
  final String s3Uri;

  S3DataSource({
    required this.s3Uri,
  });

  factory S3DataSource.fromJson(Map<String, dynamic> json) {
    return S3DataSource(
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

enum S3InputFormat {
  jsonl('JSONL'),
  ;

  final String value;

  const S3InputFormat(this.value);

  static S3InputFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum S3InputFormat'));
}

enum SortByProvisionedModels {
  creationTime('CreationTime'),
  ;

  final String value;

  const SortByProvisionedModels(this.value);

  static SortByProvisionedModels fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SortByProvisionedModels'));
}

enum SortJobsBy {
  creationTime('CreationTime'),
  ;

  final String value;

  const SortJobsBy(this.value);

  static SortJobsBy fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortJobsBy'));
}

enum SortModelsBy {
  creationTime('CreationTime'),
  ;

  final String value;

  const SortModelsBy(this.value);

  static SortModelsBy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SortModelsBy'));
}

enum SortOrder {
  ascending('Ascending'),
  descending('Descending'),
  ;

  final String value;

  const SortOrder(this.value);

  static SortOrder fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SortOrder'));
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

class StopModelInvocationJobResponse {
  StopModelInvocationJobResponse();

  factory StopModelInvocationJobResponse.fromJson(Map<String, dynamic> _) {
    return StopModelInvocationJobResponse();
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
          .nonNulls
          .map((e) => e as String)
          .toList(),
      subnetIds:
          (json['subnetIds'] as List).nonNulls.map((e) => e as String).toList(),
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
