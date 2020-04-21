// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822fromJson,
        rfc822toJson,
        iso8601fromJson,
        iso8601toJson,
        unixFromJson,
        unixToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'sagemaker-2017-07-24.g.dart';

/// Provides APIs for creating and managing Amazon SageMaker resources.
///
/// Other Resources:
///
/// <ul>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/whatis.html#first-time-user">Amazon
/// SageMaker Developer Guide</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/augmented-ai/2019-11-07/APIReference/Welcome.html">Amazon
/// Augmented AI Runtime API Reference</a>
/// </li>
/// </ul>
class SageMaker {
  final _s.JsonProtocol _protocol;
  SageMaker({
    @_s.required String region,
    @_s.required _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'api.sagemaker',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Adds or overwrites one or more tags for the specified Amazon SageMaker
  /// resource. You can add tags to notebook instances, training jobs,
  /// hyperparameter tuning jobs, batch transform jobs, models, labeling jobs,
  /// work teams, endpoint configurations, and endpoints.
  ///
  /// Each tag consists of a key and an optional value. Tag keys must be unique
  /// per resource. For more information about tags, see For more information,
  /// see <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS
  /// Tagging Strategies</a>.
  /// <note>
  /// Tags that you add to a hyperparameter tuning job by calling this API are
  /// also added to any training jobs that the hyperparameter tuning job
  /// launches after you call this API, but not to training jobs that the
  /// hyperparameter tuning job launched before you called this API. To make
  /// sure that the tags associated with a hyperparameter tuning job are also
  /// added to all training jobs that the hyperparameter tuning job launches,
  /// add the tags when you first create the tuning job by specifying them in
  /// the <code>Tags</code> parameter of <a>CreateHyperParameterTuningJob</a>
  /// </note>
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// An array of <code>Tag</code> objects. Each tag is a key-value pair. Only
  /// the <code>key</code> parameter is required. If you don't specify a value,
  /// Amazon SageMaker sets the value to an empty string.
  Future<AddTagsOutput> addTags({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:.*''',
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.AddTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );

    return AddTagsOutput.fromJson(jsonResponse.body);
  }

  /// Associates a trial component with a trial. A trial component can be
  /// associated with multiple trials. To disassociate a trial component from a
  /// trial, call the <a>DisassociateTrialComponent</a> API.
  ///
  /// May throw [ResourceNotFound].
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [trialComponentName] :
  /// The name of the component to associated with the trial.
  ///
  /// Parameter [trialName] :
  /// The name of the trial to associate with.
  Future<AssociateTrialComponentResponse> associateTrialComponent({
    @_s.required String trialComponentName,
    @_s.required String trialName,
  }) async {
    ArgumentError.checkNotNull(trialComponentName, 'trialComponentName');
    _s.validateStringLength(
      'trialComponentName',
      trialComponentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialComponentName',
      trialComponentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(trialName, 'trialName');
    _s.validateStringLength(
      'trialName',
      trialName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialName',
      trialName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.AssociateTrialComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialComponentName': trialComponentName,
        'TrialName': trialName,
      },
    );

    return AssociateTrialComponentResponse.fromJson(jsonResponse.body);
  }

  /// Create a machine learning algorithm that you can use in Amazon SageMaker
  /// and list in the AWS Marketplace.
  ///
  /// Parameter [algorithmName] :
  /// The name of the algorithm.
  ///
  /// Parameter [trainingSpecification] :
  /// Specifies details about training jobs run by this algorithm, including the
  /// following:
  ///
  /// <ul>
  /// <li>
  /// The Amazon ECR path of the container and the version digest of the
  /// algorithm.
  /// </li>
  /// <li>
  /// The hyperparameters that the algorithm supports.
  /// </li>
  /// <li>
  /// The instance types that the algorithm supports for training.
  /// </li>
  /// <li>
  /// Whether the algorithm supports distributed training.
  /// </li>
  /// <li>
  /// The metrics that the algorithm emits to Amazon CloudWatch.
  /// </li>
  /// <li>
  /// Which metrics that the algorithm emits can be used as the objective metric
  /// for hyperparameter tuning jobs.
  /// </li>
  /// <li>
  /// The input channels that the algorithm supports for training data. For
  /// example, an algorithm might support <code>train</code>,
  /// <code>validation</code>, and <code>test</code> channels.
  /// </li>
  /// </ul>
  ///
  /// Parameter [algorithmDescription] :
  /// A description of the algorithm.
  ///
  /// Parameter [certifyForMarketplace] :
  /// Whether to certify the algorithm so that it can be listed in AWS
  /// Marketplace.
  ///
  /// Parameter [inferenceSpecification] :
  /// Specifies details about inference jobs that the algorithm runs, including
  /// the following:
  ///
  /// <ul>
  /// <li>
  /// The Amazon ECR paths of containers that contain the inference code and
  /// model artifacts.
  /// </li>
  /// <li>
  /// The instance types that the algorithm supports for transform jobs and
  /// real-time endpoints used for inference.
  /// </li>
  /// <li>
  /// The input and output content formats that the algorithm supports for
  /// inference.
  /// </li>
  /// </ul>
  ///
  /// Parameter [validationSpecification] :
  /// Specifies configurations for one or more training jobs and that Amazon
  /// SageMaker runs to test the algorithm's training code and, optionally, one
  /// or more batch transform jobs that Amazon SageMaker runs to test the
  /// algorithm's inference code.
  Future<CreateAlgorithmOutput> createAlgorithm({
    @_s.required String algorithmName,
    @_s.required TrainingSpecification trainingSpecification,
    String algorithmDescription,
    bool certifyForMarketplace,
    InferenceSpecification inferenceSpecification,
    AlgorithmValidationSpecification validationSpecification,
  }) async {
    ArgumentError.checkNotNull(algorithmName, 'algorithmName');
    _s.validateStringLength(
      'algorithmName',
      algorithmName,
      1,
      63,
    );
    _s.validateStringPattern(
      'algorithmName',
      algorithmName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    ArgumentError.checkNotNull(trainingSpecification, 'trainingSpecification');
    if (algorithmDescription != null) {
      _s.validateStringLength(
        'algorithmDescription',
        algorithmDescription,
        0,
        1024,
      );
    }
    if (algorithmDescription != null) {
      _s.validateStringPattern(
        'algorithmDescription',
        algorithmDescription,
        r'''[\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateAlgorithm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AlgorithmName': algorithmName,
        'TrainingSpecification': trainingSpecification,
        'AlgorithmDescription': algorithmDescription,
        'CertifyForMarketplace': certifyForMarketplace,
        'InferenceSpecification': inferenceSpecification,
        'ValidationSpecification': validationSpecification,
      },
    );

    return CreateAlgorithmOutput.fromJson(jsonResponse.body);
  }

  /// Creates a running App for the specified UserProfile. Supported Apps are
  /// JupyterServer and KernelGateway. This operation is automatically invoked
  /// by Amazon SageMaker Amazon SageMaker Studio (Studio) upon access to the
  /// associated Studio Domain, and when new kernel configurations are selected
  /// by the user. A user may have multiple Apps active simultaneously. Apps
  /// will automatically terminate and be deleted when stopped from within
  /// Studio, or when the DeleteApp API is manually called. UserProfiles are
  /// limited to 5 concurrently running Apps at a time.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceInUse].
  ///
  /// Parameter [appName] :
  /// The name of the app.
  ///
  /// Parameter [appType] :
  /// The type of app.
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [userProfileName] :
  /// The user profile name.
  ///
  /// Parameter [resourceSpec] :
  /// The instance type and quantity.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a key and an optional value. Tag keys must be unique
  /// per resource.
  Future<CreateAppResponse> createApp({
    @_s.required String appName,
    @_s.required AppType appType,
    @_s.required String domainId,
    @_s.required String userProfileName,
    ResourceSpec resourceSpec,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(appName, 'appName');
    _s.validateStringLength(
      'appName',
      appName,
      0,
      63,
    );
    _s.validateStringPattern(
      'appName',
      appName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(appType, 'appType');
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    ArgumentError.checkNotNull(userProfileName, 'userProfileName');
    _s.validateStringLength(
      'userProfileName',
      userProfileName,
      0,
      63,
    );
    _s.validateStringPattern(
      'userProfileName',
      userProfileName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppName': appName,
        'AppType': appType,
        'DomainId': domainId,
        'UserProfileName': userProfileName,
        'ResourceSpec': resourceSpec,
        'Tags': tags,
      },
    );

    return CreateAppResponse.fromJson(jsonResponse.body);
  }

  /// Creates an AutoPilot job.
  ///
  /// After you run an AutoPilot job, you can find the best performing model by
  /// calling , and then deploy that model by following the steps described in
  /// <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html">Step
  /// 6.1: Deploy the Model to Amazon SageMaker Hosting Services</a>.
  ///
  /// For information about how to use AutoPilot, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/autopilot-automate-model-development.html">Use
  /// AutoPilot to Automate Model Development</a>.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [autoMLJobName] :
  /// Identifies an AutoPilot job. Must be unique to your account and is
  /// case-insensitive.
  ///
  /// Parameter [inputDataConfig] :
  /// Similar to InputDataConfig supported by Tuning. Format(s) supported: CSV.
  /// Minimum of 1000 rows.
  ///
  /// Parameter [outputDataConfig] :
  /// Similar to OutputDataConfig supported by Tuning. Format(s) supported: CSV.
  ///
  /// Parameter [roleArn] :
  /// The ARN of the role that will be used to access the data.
  ///
  /// Parameter [autoMLJobConfig] :
  /// Contains CompletionCriteria and SecurityConfig.
  ///
  /// Parameter [autoMLJobObjective] :
  /// Defines the job's objective. You provide a MetricName and AutoML will
  /// infer minimize or maximize. If this is not provided, the most commonly
  /// used ObjectiveMetric for problem type will be selected.
  ///
  /// Parameter [generateCandidateDefinitionsOnly] :
  /// This will generate possible candidates without training a model. A
  /// candidate is a combination of data preprocessors, algorithms, and
  /// algorithm parameter settings.
  ///
  /// Parameter [problemType] :
  /// Defines the kind of preprocessing and algorithms intended for the
  /// candidates. Options include: BinaryClassification,
  /// MulticlassClassification, and Regression.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a key and an optional value. Tag keys must be unique
  /// per resource.
  Future<CreateAutoMLJobResponse> createAutoMLJob({
    @_s.required String autoMLJobName,
    @_s.required List<AutoMLChannel> inputDataConfig,
    @_s.required AutoMLOutputDataConfig outputDataConfig,
    @_s.required String roleArn,
    AutoMLJobConfig autoMLJobConfig,
    AutoMLJobObjective autoMLJobObjective,
    bool generateCandidateDefinitionsOnly,
    ProblemType problemType,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(autoMLJobName, 'autoMLJobName');
    _s.validateStringLength(
      'autoMLJobName',
      autoMLJobName,
      1,
      32,
    );
    _s.validateStringPattern(
      'autoMLJobName',
      autoMLJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateAutoMLJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoMLJobName': autoMLJobName,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'RoleArn': roleArn,
        'AutoMLJobConfig': autoMLJobConfig,
        'AutoMLJobObjective': autoMLJobObjective,
        'GenerateCandidateDefinitionsOnly': generateCandidateDefinitionsOnly,
        'ProblemType': problemType,
        'Tags': tags,
      },
    );

    return CreateAutoMLJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a Git repository as a resource in your Amazon SageMaker account.
  /// You can associate the repository with notebook instances so that you can
  /// use Git source control for the notebooks you create. The Git repository is
  /// a resource in your Amazon SageMaker account, so it can be associated with
  /// more than one notebook instance, and it persists independently from the
  /// lifecycle of any notebook instances it is associated with.
  ///
  /// The repository can be hosted either in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository.
  ///
  /// Parameter [codeRepositoryName] :
  /// The name of the Git repository. The name must have 1 to 63 characters.
  /// Valid characters are a-z, A-Z, 0-9, and - (hyphen).
  ///
  /// Parameter [gitConfig] :
  /// Specifies details about the repository, including the URL where the
  /// repository is located, the default branch, and credentials to use to
  /// access the repository.
  Future<CreateCodeRepositoryOutput> createCodeRepository({
    @_s.required String codeRepositoryName,
    @_s.required GitConfig gitConfig,
  }) async {
    ArgumentError.checkNotNull(codeRepositoryName, 'codeRepositoryName');
    _s.validateStringLength(
      'codeRepositoryName',
      codeRepositoryName,
      1,
      63,
    );
    _s.validateStringPattern(
      'codeRepositoryName',
      codeRepositoryName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    ArgumentError.checkNotNull(gitConfig, 'gitConfig');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateCodeRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CodeRepositoryName': codeRepositoryName,
        'GitConfig': gitConfig,
      },
    );

    return CreateCodeRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Starts a model compilation job. After the model has been compiled, Amazon
  /// SageMaker saves the resulting model artifacts to an Amazon Simple Storage
  /// Service (Amazon S3) bucket that you specify.
  ///
  /// If you choose to host your model using Amazon SageMaker hosting services,
  /// you can use the resulting model artifacts as part of the model. You can
  /// also use the artifacts with AWS IoT Greengrass. In that case, deploy them
  /// as an ML resource.
  ///
  /// In the request body, you provide the following:
  ///
  /// <ul>
  /// <li>
  /// A name for the compilation job
  /// </li>
  /// <li>
  /// Information about the input model artifacts
  /// </li>
  /// <li>
  /// The output location for the compiled model and the device (target) that
  /// the model runs on
  /// </li>
  /// <li>
  /// <code>The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker
  /// assumes to perform the model compilation job</code>
  /// </li>
  /// </ul>
  /// You can also provide a <code>Tag</code> to track the model compilation
  /// job's resource use and costs. The response body contains the
  /// <code>CompilationJobArn</code> for the compiled job.
  ///
  /// To stop a model compilation job, use <a>StopCompilationJob</a>. To get
  /// information about a particular model compilation job, use
  /// <a>DescribeCompilationJob</a>. To get information about multiple model
  /// compilation jobs, use <a>ListCompilationJobs</a>.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [compilationJobName] :
  /// A name for the model compilation job. The name must be unique within the
  /// AWS Region and within your AWS account.
  ///
  /// Parameter [inputConfig] :
  /// Provides information about the location of input model artifacts, the name
  /// and shape of the expected data inputs, and the framework in which the
  /// model was trained.
  ///
  /// Parameter [outputConfig] :
  /// Provides information about the output location for the compiled model and
  /// the target device the model runs on.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that enables Amazon
  /// SageMaker to perform tasks on your behalf.
  ///
  /// During model compilation, Amazon SageMaker needs your permission to:
  ///
  /// <ul>
  /// <li>
  /// Read input data from an S3 bucket
  /// </li>
  /// <li>
  /// Write model artifacts to an S3 bucket
  /// </li>
  /// <li>
  /// Write logs to Amazon CloudWatch Logs
  /// </li>
  /// <li>
  /// Publish metrics to Amazon CloudWatch
  /// </li>
  /// </ul>
  /// You grant permissions for all of these tasks to an IAM role. To pass this
  /// role to Amazon SageMaker, the caller of this API must have the
  /// <code>iam:PassRole</code> permission. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon
  /// SageMaker Roles.</a>
  ///
  /// Parameter [stoppingCondition] :
  /// Specifies a limit to how long a model compilation job can run. When the
  /// job reaches the time limit, Amazon SageMaker ends the compilation job. Use
  /// this API to cap model training costs.
  Future<CreateCompilationJobResponse> createCompilationJob({
    @_s.required String compilationJobName,
    @_s.required InputConfig inputConfig,
    @_s.required OutputConfig outputConfig,
    @_s.required String roleArn,
    @_s.required StoppingCondition stoppingCondition,
  }) async {
    ArgumentError.checkNotNull(compilationJobName, 'compilationJobName');
    _s.validateStringLength(
      'compilationJobName',
      compilationJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'compilationJobName',
      compilationJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    ArgumentError.checkNotNull(inputConfig, 'inputConfig');
    ArgumentError.checkNotNull(outputConfig, 'outputConfig');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    ArgumentError.checkNotNull(stoppingCondition, 'stoppingCondition');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateCompilationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CompilationJobName': compilationJobName,
        'InputConfig': inputConfig,
        'OutputConfig': outputConfig,
        'RoleArn': roleArn,
        'StoppingCondition': stoppingCondition,
      },
    );

    return CreateCompilationJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a Domain for Amazon SageMaker Amazon SageMaker Studio (Studio),
  /// which can be accessed by end-users in a web browser. A Domain has an
  /// associated directory, list of authorized users, and a variety of security,
  /// application, policies, and Amazon Virtual Private Cloud configurations. An
  /// AWS account is limited to one Domain, per region. Users within a domain
  /// can share notebook files and other artifacts with each other. When a
  /// Domain is created, an Amazon Elastic File System (EFS) is also created for
  /// use by all of the users within the Domain. Each user receives a private
  /// home directory within the EFS for notebooks, Git repositories, and data
  /// files.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceInUse].
  ///
  /// Parameter [authMode] :
  /// The mode of authentication that member use to access the domain.
  ///
  /// Parameter [defaultUserSettings] :
  /// The default user settings.
  ///
  /// Parameter [domainName] :
  /// A name for the domain.
  ///
  /// Parameter [subnetIds] :
  /// Security setting to limit to a set of subnets.
  ///
  /// Parameter [vpcId] :
  /// Security setting to limit the domain's communication to a Amazon Virtual
  /// Private Cloud.
  ///
  /// Parameter [homeEfsFileSystemKmsKeyId] :
  /// The AWS Key Management Service encryption key ID.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a key and an optional value. Tag keys must be unique
  /// per resource.
  Future<CreateDomainResponse> createDomain({
    @_s.required AuthMode authMode,
    @_s.required UserSettings defaultUserSettings,
    @_s.required String domainName,
    @_s.required List<String> subnetIds,
    @_s.required String vpcId,
    String homeEfsFileSystemKmsKeyId,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(authMode, 'authMode');
    ArgumentError.checkNotNull(defaultUserSettings, 'defaultUserSettings');
    ArgumentError.checkNotNull(domainName, 'domainName');
    _s.validateStringLength(
      'domainName',
      domainName,
      0,
      63,
    );
    _s.validateStringPattern(
      'domainName',
      domainName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    ArgumentError.checkNotNull(vpcId, 'vpcId');
    _s.validateStringLength(
      'vpcId',
      vpcId,
      0,
      32,
    );
    _s.validateStringPattern(
      'vpcId',
      vpcId,
      r'''[-0-9a-zA-Z]+''',
    );
    if (homeEfsFileSystemKmsKeyId != null) {
      _s.validateStringLength(
        'homeEfsFileSystemKmsKeyId',
        homeEfsFileSystemKmsKeyId,
        0,
        2048,
      );
    }
    if (homeEfsFileSystemKmsKeyId != null) {
      _s.validateStringPattern(
        'homeEfsFileSystemKmsKeyId',
        homeEfsFileSystemKmsKeyId,
        r'''.*''',
      );
    }
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AuthMode': authMode,
        'DefaultUserSettings': defaultUserSettings,
        'DomainName': domainName,
        'SubnetIds': subnetIds,
        'VpcId': vpcId,
        'HomeEfsFileSystemKmsKeyId': homeEfsFileSystemKmsKeyId,
        'Tags': tags,
      },
    );

    return CreateDomainResponse.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint using the endpoint configuration specified in the
  /// request. Amazon SageMaker uses the endpoint to provision resources and
  /// deploy models. You create the endpoint configuration with the
  /// <a>CreateEndpointConfig</a> API.
  ///
  /// Use this API to deploy models using Amazon SageMaker hosting services.
  ///
  /// For an example that calls this method when deploying a model to Amazon
  /// SageMaker hosting services, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy
  /// the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto
  /// 3)).</a>
  /// <note>
  /// You must not delete an <code>EndpointConfig</code> that is in use by an
  /// endpoint that is live or while the <code>UpdateEndpoint</code> or
  /// <code>CreateEndpoint</code> operations are being performed on the
  /// endpoint. To update an endpoint, you must create a new
  /// <code>EndpointConfig</code>.
  /// </note>
  /// The endpoint name must be unique within an AWS Region in your AWS account.
  ///
  /// When it receives the request, Amazon SageMaker creates the endpoint,
  /// launches the resources (ML compute instances), and deploys the model(s) on
  /// them.
  ///
  /// When Amazon SageMaker receives the request, it sets the endpoint status to
  /// <code>Creating</code>. After it creates the endpoint, it sets the status
  /// to <code>InService</code>. Amazon SageMaker can then process incoming
  /// requests for inferences. To check the status of an endpoint, use the
  /// <a>DescribeEndpoint</a> API.
  ///
  /// If any of the models hosted at this endpoint get model data from an Amazon
  /// S3 location, Amazon SageMaker uses AWS Security Token Service to download
  /// model artifacts from the S3 path you provided. AWS STS is activated in
  /// your IAM user account by default. If you previously deactivated AWS STS
  /// for a region, you need to reactivate AWS STS for that region. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and
  /// Access Management User Guide</i>.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [endpointConfigName] :
  /// The name of an endpoint configuration. For more information, see
  /// <a>CreateEndpointConfig</a>.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint. The name must be unique within an AWS Region in
  /// your AWS account.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a>in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  Future<CreateEndpointOutput> createEndpoint({
    @_s.required String endpointConfigName,
    @_s.required String endpointName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(endpointConfigName, 'endpointConfigName');
    _s.validateStringLength(
      'endpointConfigName',
      endpointConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointConfigName',
      endpointConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    _s.validateStringLength(
      'endpointName',
      endpointName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointName',
      endpointName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointConfigName': endpointConfigName,
        'EndpointName': endpointName,
        'Tags': tags,
      },
    );

    return CreateEndpointOutput.fromJson(jsonResponse.body);
  }

  /// Creates an endpoint configuration that Amazon SageMaker hosting services
  /// uses to deploy models. In the configuration, you identify one or more
  /// models, created using the <code>CreateModel</code> API, to deploy and the
  /// resources that you want Amazon SageMaker to provision. Then you call the
  /// <a>CreateEndpoint</a> API.
  /// <note>
  /// Use this API if you want to use Amazon SageMaker hosting services to
  /// deploy models into production.
  /// </note>
  /// In the request, you define a <code>ProductionVariant</code>, for each
  /// model that you want to deploy. Each <code>ProductionVariant</code>
  /// parameter also describes the resources that you want Amazon SageMaker to
  /// provision. This includes the number and type of ML compute instances to
  /// deploy.
  ///
  /// If you are hosting multiple models, you also assign a
  /// <code>VariantWeight</code> to specify how much traffic you want to
  /// allocate to each model. For example, suppose that you want to host two
  /// models, A and B, and you assign traffic weight 2 for model A and 1 for
  /// model B. Amazon SageMaker distributes two-thirds of the traffic to Model
  /// A, and one-third to model B.
  ///
  /// For an example that calls this method when deploying a model to Amazon
  /// SageMaker hosting services, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy
  /// the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto
  /// 3)).</a>
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [endpointConfigName] :
  /// The name of the endpoint configuration. You specify this name in a
  /// <a>CreateEndpoint</a> request.
  ///
  /// Parameter [productionVariants] :
  /// An list of <code>ProductionVariant</code> objects, one for each model that
  /// you want to host at this endpoint.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Resource Name (ARN) of a AWS Key Management Service key that
  /// Amazon SageMaker uses to encrypt data on the storage volume attached to
  /// the ML compute instance that hosts the endpoint.
  ///
  /// The KmsKeyId can be any of the following formats:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias name ARN:
  /// <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// The KMS key policy must grant permission to the IAM role that you specify
  /// in your <code>CreateEndpoint</code>, <code>UpdateEndpoint</code> requests.
  /// For more information, refer to the AWS Key Management Service section<a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">
  /// Using Key Policies in AWS KMS </a>
  /// <note>
  /// Certain Nitro-based instances include local storage, dependent on the
  /// instance type. Local storage volumes are encrypted using a hardware module
  /// on the instance. You can't request a <code>KmsKeyId</code> when using an
  /// instance type with local storage. If any of the models that you specify in
  /// the <code>ProductionVariants</code> parameter use nitro-based instances
  /// with local storage, do not specify a value for the <code>KmsKeyId</code>
  /// parameter. If you specify a value for <code>KmsKeyId</code> when using any
  /// nitro-based instances with local storage, the call to
  /// <code>CreateEndpointConfig</code> fails.
  ///
  /// For a list of instance types that support local instance storage, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes">Instance
  /// Store Volumes</a>.
  ///
  /// For more information about local instance storage encryption, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ssd-instance-store.html">SSD
  /// Instance Store Volumes</a>.
  /// </note>
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a> in the <i> AWS Billing and Cost Management User
  /// Guide</i>.
  Future<CreateEndpointConfigOutput> createEndpointConfig({
    @_s.required String endpointConfigName,
    @_s.required List<ProductionVariant> productionVariants,
    DataCaptureConfig dataCaptureConfig,
    String kmsKeyId,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(endpointConfigName, 'endpointConfigName');
    _s.validateStringLength(
      'endpointConfigName',
      endpointConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointConfigName',
      endpointConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(productionVariants, 'productionVariants');
    if (kmsKeyId != null) {
      _s.validateStringLength(
        'kmsKeyId',
        kmsKeyId,
        0,
        2048,
      );
    }
    if (kmsKeyId != null) {
      _s.validateStringPattern(
        'kmsKeyId',
        kmsKeyId,
        r'''.*''',
      );
    }
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateEndpointConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointConfigName': endpointConfigName,
        'ProductionVariants': productionVariants,
        'DataCaptureConfig': dataCaptureConfig,
        'KmsKeyId': kmsKeyId,
        'Tags': tags,
      },
    );

    return CreateEndpointConfigOutput.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon SageMaker <i>experiment</i>. An experiment is a
  /// collection of <i>trials</i> that are observed, compared and evaluated as a
  /// group. A trial is a set of steps, called <i>trial components</i>, that
  /// produce a machine learning model.
  ///
  /// The goal of an experiment is to determine the components that produce the
  /// best model. Multiple trials are performed, each one isolating and
  /// measuring the impact of a change to one or more inputs, while keeping the
  /// remaining inputs constant.
  ///
  /// When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK,
  /// all experiments, trials, and trial components are automatically tracked,
  /// logged, and indexed. When you use the AWS SDK for Python (Boto), you must
  /// use the logging APIs provided by the SDK.
  ///
  /// You can add tags to experiments, trials, trial components and then use the
  /// <a>Search</a> API to search for the tags.
  ///
  /// To add a description to an experiment, specify the optional
  /// <code>Description</code> parameter. To add a description later, or to
  /// change the description, call the <a>UpdateExperiment</a> API.
  ///
  /// To get a list of all your experiments, call the <a>ListExperiments</a>
  /// API. To view an experiment's properties, call the
  /// <a>DescribeExperiment</a> API. To get a list of all the trials associated
  /// with an experiment, call the <a>ListTrials</a> API. To create a trial call
  /// the <a>CreateTrial</a> API.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [experimentName] :
  /// The name of the experiment. The name must be unique in your AWS account
  /// and is not case-sensitive.
  ///
  /// Parameter [description] :
  /// The description of the experiment.
  ///
  /// Parameter [displayName] :
  /// The name of the experiment as displayed. The name doesn't need to be
  /// unique. If you don't specify <code>DisplayName</code>, the value in
  /// <code>ExperimentName</code> is displayed.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the experiment. You can use <a>Search</a>
  /// API to search on the tags.
  Future<CreateExperimentResponse> createExperiment({
    @_s.required String experimentName,
    String description,
    String displayName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(experimentName, 'experimentName');
    _s.validateStringLength(
      'experimentName',
      experimentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'experimentName',
      experimentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (description != null) {
      _s.validateStringLength(
        'description',
        description,
        0,
        3072,
      );
    }
    if (description != null) {
      _s.validateStringPattern(
        'description',
        description,
        r'''.*''',
      );
    }
    if (displayName != null) {
      _s.validateStringLength(
        'displayName',
        displayName,
        1,
        82,
      );
    }
    if (displayName != null) {
      _s.validateStringPattern(
        'displayName',
        displayName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateExperiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExperimentName': experimentName,
        'Description': description,
        'DisplayName': displayName,
        'Tags': tags,
      },
    );

    return CreateExperimentResponse.fromJson(jsonResponse.body);
  }

  /// Creates a flow definition.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceInUse].
  ///
  /// Parameter [flowDefinitionName] :
  /// The name of your flow definition.
  ///
  /// Parameter [humanLoopConfig] :
  /// An object containing information about the tasks the human reviewers will
  /// perform.
  ///
  /// Parameter [outputConfig] :
  /// An object containing information about where the human review results will
  /// be uploaded.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the role needed to call other services
  /// on your behalf. For example,
  /// <code>arn:aws:iam::1234567890:role/service-role/AmazonSageMaker-ExecutionRole-20180111T151298</code>.
  ///
  /// Parameter [humanLoopActivationConfig] :
  /// An object containing information about the events that trigger a human
  /// workflow.
  ///
  /// Parameter [humanLoopRequestSource] :
  /// Container for configuring the source of human task requests. Use to
  /// specify if Amazon Rekognition or Amazon Textract is used as an integration
  /// source.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs that contain metadata to help you categorize
  /// and organize a flow definition. Each tag consists of a key and a value,
  /// both of which you define.
  Future<CreateFlowDefinitionResponse> createFlowDefinition({
    @_s.required String flowDefinitionName,
    @_s.required HumanLoopConfig humanLoopConfig,
    @_s.required FlowDefinitionOutputConfig outputConfig,
    @_s.required String roleArn,
    HumanLoopActivationConfig humanLoopActivationConfig,
    HumanLoopRequestSource humanLoopRequestSource,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(flowDefinitionName, 'flowDefinitionName');
    _s.validateStringLength(
      'flowDefinitionName',
      flowDefinitionName,
      1,
      63,
    );
    _s.validateStringPattern(
      'flowDefinitionName',
      flowDefinitionName,
      r'''^[a-z0-9](-*[a-z0-9])*''',
    );
    ArgumentError.checkNotNull(humanLoopConfig, 'humanLoopConfig');
    ArgumentError.checkNotNull(outputConfig, 'outputConfig');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateFlowDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlowDefinitionName': flowDefinitionName,
        'HumanLoopConfig': humanLoopConfig,
        'OutputConfig': outputConfig,
        'RoleArn': roleArn,
        'HumanLoopActivationConfig': humanLoopActivationConfig,
        'HumanLoopRequestSource': humanLoopRequestSource,
        'Tags': tags,
      },
    );

    return CreateFlowDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Defines the settings you will use for the human review workflow user
  /// interface. Reviewers will see a three-panel interface with an instruction
  /// area, the item to review, and an input area.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceInUse].
  ///
  /// Parameter [humanTaskUiName] :
  /// The name of the user interface you are creating.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs that contain metadata to help you categorize
  /// and organize a human review workflow user interface. Each tag consists of
  /// a key and a value, both of which you define.
  Future<CreateHumanTaskUiResponse> createHumanTaskUi({
    @_s.required String humanTaskUiName,
    @_s.required UiTemplate uiTemplate,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(humanTaskUiName, 'humanTaskUiName');
    _s.validateStringLength(
      'humanTaskUiName',
      humanTaskUiName,
      1,
      63,
    );
    _s.validateStringPattern(
      'humanTaskUiName',
      humanTaskUiName,
      r'''^[a-z0-9](-*[a-z0-9])*''',
    );
    ArgumentError.checkNotNull(uiTemplate, 'uiTemplate');
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateHumanTaskUi'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HumanTaskUiName': humanTaskUiName,
        'UiTemplate': uiTemplate,
        'Tags': tags,
      },
    );

    return CreateHumanTaskUiResponse.fromJson(jsonResponse.body);
  }

  /// Starts a hyperparameter tuning job. A hyperparameter tuning job finds the
  /// best version of a model by running many training jobs on your dataset
  /// using the algorithm you choose and values for hyperparameters within
  /// ranges that you specify. It then chooses the hyperparameter values that
  /// result in a model that performs the best, as measured by an objective
  /// metric that you choose.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [hyperParameterTuningJobConfig] :
  /// The <a>HyperParameterTuningJobConfig</a> object that describes the tuning
  /// job, including the search strategy, the objective metric used to evaluate
  /// training jobs, ranges of parameters to search, and resource limits for the
  /// tuning job. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html">How
  /// Hyperparameter Tuning Works</a>.
  ///
  /// Parameter [hyperParameterTuningJobName] :
  /// The name of the tuning job. This name is the prefix for the names of all
  /// training jobs that this tuning job launches. The name must be unique
  /// within the same AWS account and AWS Region. The name must have { } to { }
  /// characters. Valid characters are a-z, A-Z, 0-9, and : + = @ _ % -
  /// (hyphen). The name is not case sensitive.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs. You can use tags to categorize your AWS
  /// resources in different ways, for example, by purpose, owner, or
  /// environment. For more information, see <a
  /// href="https://aws.amazon.com/answers/account-management/aws-tagging-strategies/">AWS
  /// Tagging Strategies</a>.
  ///
  /// Tags that you specify for the tuning job are also added to all training
  /// jobs that the tuning job launches.
  ///
  /// Parameter [trainingJobDefinition] :
  /// The <a>HyperParameterTrainingJobDefinition</a> object that describes the
  /// training jobs that this tuning job launches, including static
  /// hyperparameters, input data configuration, output data configuration,
  /// resource configuration, and stopping condition.
  ///
  /// Parameter [trainingJobDefinitions] :
  /// <p/>
  ///
  /// Parameter [warmStartConfig] :
  /// Specifies the configuration for starting the hyperparameter tuning job
  /// using one or more previous tuning jobs as a starting point. The results of
  /// previous tuning jobs are used to inform which combinations of
  /// hyperparameters to search over in the new tuning job.
  ///
  /// All training jobs launched by the new hyperparameter tuning job are
  /// evaluated by using the objective metric. If you specify
  /// <code>IDENTICAL_DATA_AND_ALGORITHM</code> as the
  /// <code>WarmStartType</code> value for the warm start configuration, the
  /// training job that performs the best in the new tuning job is compared to
  /// the best training jobs from the parent tuning jobs. From these, the
  /// training job that performs the best as measured by the objective metric is
  /// returned as the overall best training job.
  /// <note>
  /// All training jobs launched by parent hyperparameter tuning jobs and the
  /// new hyperparameter tuning jobs count against the limit of training jobs
  /// for the tuning job.
  /// </note>
  Future<CreateHyperParameterTuningJobResponse> createHyperParameterTuningJob({
    @_s.required HyperParameterTuningJobConfig hyperParameterTuningJobConfig,
    @_s.required String hyperParameterTuningJobName,
    List<Tag> tags,
    HyperParameterTrainingJobDefinition trainingJobDefinition,
    List<HyperParameterTrainingJobDefinition> trainingJobDefinitions,
    HyperParameterTuningJobWarmStartConfig warmStartConfig,
  }) async {
    ArgumentError.checkNotNull(
        hyperParameterTuningJobConfig, 'hyperParameterTuningJobConfig');
    ArgumentError.checkNotNull(
        hyperParameterTuningJobName, 'hyperParameterTuningJobName');
    _s.validateStringLength(
      'hyperParameterTuningJobName',
      hyperParameterTuningJobName,
      1,
      32,
    );
    _s.validateStringPattern(
      'hyperParameterTuningJobName',
      hyperParameterTuningJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (tags != null) {}
    if (trainingJobDefinitions != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateHyperParameterTuningJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HyperParameterTuningJobConfig': hyperParameterTuningJobConfig,
        'HyperParameterTuningJobName': hyperParameterTuningJobName,
        'Tags': tags,
        'TrainingJobDefinition': trainingJobDefinition,
        'TrainingJobDefinitions': trainingJobDefinitions,
        'WarmStartConfig': warmStartConfig,
      },
    );

    return CreateHyperParameterTuningJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a job that uses workers to label the data objects in your input
  /// dataset. You can use the labeled data to train machine learning models.
  ///
  /// You can select your workforce from one of three providers:
  ///
  /// <ul>
  /// <li>
  /// A private workforce that you create. It can include employees,
  /// contractors, and outside experts. Use a private workforce when want the
  /// data to stay within your organization or when a specific set of skills is
  /// required.
  /// </li>
  /// <li>
  /// One or more vendors that you select from the AWS Marketplace. Vendors
  /// provide expertise in specific areas.
  /// </li>
  /// <li>
  /// The Amazon Mechanical Turk workforce. This is the largest workforce, but
  /// it should only be used for public data or data that has been stripped of
  /// any personally identifiable information.
  /// </li>
  /// </ul>
  /// You can also use <i>automated data labeling</i> to reduce the number of
  /// data objects that need to be labeled by a human. Automated data labeling
  /// uses <i>active learning</i> to determine if a data object can be labeled
  /// by machine or if it needs to be sent to a human worker. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-automated-labeling.html">Using
  /// Automated Data Labeling</a>.
  ///
  /// The data objects to be labeled are contained in an Amazon S3 bucket. You
  /// create a <i>manifest file</i> that describes the location of each object.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-data.html">Using
  /// Input and Output Data</a>.
  ///
  /// The output can be used as the manifest file for another labeling job or as
  /// training data for your machine learning models.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [humanTaskConfig] :
  /// Configures the labeling task and how it is presented to workers;
  /// including, but not limited to price, keywords, and batch size (task
  /// count).
  ///
  /// Parameter [inputConfig] :
  /// Input data for the labeling job, such as the Amazon S3 location of the
  /// data objects and the location of the manifest file that describes the data
  /// objects.
  ///
  /// Parameter [labelAttributeName] :
  /// The attribute name to use for the label in the output manifest file. This
  /// is the key for the key/value pair formed with the label that a worker
  /// assigns to the object. The name can't end with "-metadata". If you are
  /// running a semantic segmentation labeling job, the attribute name must end
  /// with "-ref". If you are running any other kind of labeling job, the
  /// attribute name must not end with "-ref".
  ///
  /// Parameter [labelingJobName] :
  /// The name of the labeling job. This name is used to identify the job in a
  /// list of labeling jobs.
  ///
  /// Parameter [outputConfig] :
  /// The location of the output data and the AWS Key Management Service key ID
  /// for the key used to encrypt the output data, if any.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Number (ARN) that Amazon SageMaker assumes to perform
  /// tasks on your behalf during data labeling. You must grant this role the
  /// necessary permissions so that Amazon SageMaker can successfully complete
  /// data labeling.
  ///
  /// Parameter [labelCategoryConfigS3Uri] :
  /// The S3 URL of the file that defines the categories used to label the data
  /// objects.
  ///
  /// The file is a JSON structure in the following format:
  ///
  /// <code>{</code>
  ///
  /// <code> "document-version": "2018-11-28"</code>
  ///
  /// <code> "labels": [</code>
  ///
  /// <code> {</code>
  ///
  /// <code> "label": "<i>label 1</i>"</code>
  ///
  /// <code> },</code>
  ///
  /// <code> {</code>
  ///
  /// <code> "label": "<i>label 2</i>"</code>
  ///
  /// <code> },</code>
  ///
  /// <code> ...</code>
  ///
  /// <code> {</code>
  ///
  /// <code> "label": "<i>label n</i>"</code>
  ///
  /// <code> }</code>
  ///
  /// <code> ]</code>
  ///
  /// <code>}</code>
  ///
  /// Parameter [labelingJobAlgorithmsConfig] :
  /// Configures the information required to perform automated data labeling.
  ///
  /// Parameter [stoppingConditions] :
  /// A set of conditions for stopping the labeling job. If any of the
  /// conditions are met, the job is automatically stopped. You can use these
  /// conditions to control the cost of data labeling.
  ///
  /// Parameter [tags] :
  /// An array of key/value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  Future<CreateLabelingJobResponse> createLabelingJob({
    @_s.required HumanTaskConfig humanTaskConfig,
    @_s.required LabelingJobInputConfig inputConfig,
    @_s.required String labelAttributeName,
    @_s.required String labelingJobName,
    @_s.required LabelingJobOutputConfig outputConfig,
    @_s.required String roleArn,
    String labelCategoryConfigS3Uri,
    LabelingJobAlgorithmsConfig labelingJobAlgorithmsConfig,
    LabelingJobStoppingConditions stoppingConditions,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(humanTaskConfig, 'humanTaskConfig');
    ArgumentError.checkNotNull(inputConfig, 'inputConfig');
    ArgumentError.checkNotNull(labelAttributeName, 'labelAttributeName');
    _s.validateStringLength(
      'labelAttributeName',
      labelAttributeName,
      1,
      127,
    );
    _s.validateStringPattern(
      'labelAttributeName',
      labelAttributeName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(labelingJobName, 'labelingJobName');
    _s.validateStringLength(
      'labelingJobName',
      labelingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'labelingJobName',
      labelingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(outputConfig, 'outputConfig');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    if (labelCategoryConfigS3Uri != null) {
      _s.validateStringLength(
        'labelCategoryConfigS3Uri',
        labelCategoryConfigS3Uri,
        0,
        1024,
      );
    }
    if (labelCategoryConfigS3Uri != null) {
      _s.validateStringPattern(
        'labelCategoryConfigS3Uri',
        labelCategoryConfigS3Uri,
        r'''^(https|s3)://([^/]+)/?(.*)$''',
      );
    }
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateLabelingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HumanTaskConfig': humanTaskConfig,
        'InputConfig': inputConfig,
        'LabelAttributeName': labelAttributeName,
        'LabelingJobName': labelingJobName,
        'OutputConfig': outputConfig,
        'RoleArn': roleArn,
        'LabelCategoryConfigS3Uri': labelCategoryConfigS3Uri,
        'LabelingJobAlgorithmsConfig': labelingJobAlgorithmsConfig,
        'StoppingConditions': stoppingConditions,
        'Tags': tags,
      },
    );

    return CreateLabelingJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates a model in Amazon SageMaker. In the request, you name the model
  /// and describe a primary container. For the primary container, you specify
  /// the Docker image that contains inference code, artifacts (from prior
  /// training), and a custom environment map that the inference code uses when
  /// you deploy the model for predictions.
  ///
  /// Use this API to create a model if you want to use Amazon SageMaker hosting
  /// services or run a batch transform job.
  ///
  /// To host your model, you create an endpoint configuration with the
  /// <code>CreateEndpointConfig</code> API, and then create an endpoint with
  /// the <code>CreateEndpoint</code> API. Amazon SageMaker then deploys all of
  /// the containers that you defined for the model in the hosting environment.
  ///
  /// For an example that calls this method when deploying a model to Amazon
  /// SageMaker hosting services, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/ex1-deploy-model.html#ex1-deploy-model-boto">Deploy
  /// the Model to Amazon SageMaker Hosting Services (AWS SDK for Python (Boto
  /// 3)).</a>
  ///
  /// To run a batch transform using your model, you start a job with the
  /// <code>CreateTransformJob</code> API. Amazon SageMaker uses your model and
  /// your dataset to get inferences which are then saved to a specified S3
  /// location.
  ///
  /// In the <code>CreateModel</code> request, you must define a container with
  /// the <code>PrimaryContainer</code> parameter.
  ///
  /// In the request, you also provide an IAM role that Amazon SageMaker can
  /// assume to access model artifacts and docker image for deployment on ML
  /// compute hosting instances or for batch transform jobs. In addition, you
  /// also use the IAM role to manage permissions the inference code needs. For
  /// example, if the inference code access any other AWS resources, you grant
  /// necessary permissions via this role.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [executionRoleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker can
  /// assume to access model artifacts and docker image for deployment on ML
  /// compute instances or for batch transform jobs. Deploying on ML compute
  /// instances is part of model hosting. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon
  /// SageMaker Roles</a>.
  /// <note>
  /// To be able to pass this role to Amazon SageMaker, the caller of this API
  /// must have the <code>iam:PassRole</code> permission.
  /// </note>
  ///
  /// Parameter [modelName] :
  /// The name of the new model.
  ///
  /// Parameter [containers] :
  /// Specifies the containers in the inference pipeline.
  ///
  /// Parameter [enableNetworkIsolation] :
  /// Isolates the model container. No inbound or outbound network calls can be
  /// made to or from the model container.
  ///
  /// Parameter [primaryContainer] :
  /// The location of the primary docker image containing inference code,
  /// associated artifacts, and custom environment map that the inference code
  /// uses when the model is deployed for predictions.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  ///
  /// Parameter [vpcConfig] :
  /// A <a>VpcConfig</a> object that specifies the VPC that you want your model
  /// to connect to. Control access to and from your model container by
  /// configuring the VPC. <code>VpcConfig</code> is used in hosting services
  /// and in batch transform. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html">Protect
  /// Endpoints by Using an Amazon Virtual Private Cloud</a> and <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-vpc.html">Protect
  /// Data in Batch Transform Jobs by Using an Amazon Virtual Private Cloud</a>.
  Future<CreateModelOutput> createModel({
    @_s.required String executionRoleArn,
    @_s.required String modelName,
    List<ContainerDefinition> containers,
    bool enableNetworkIsolation,
    ContainerDefinition primaryContainer,
    List<Tag> tags,
    VpcConfig vpcConfig,
  }) async {
    ArgumentError.checkNotNull(executionRoleArn, 'executionRoleArn');
    _s.validateStringLength(
      'executionRoleArn',
      executionRoleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'executionRoleArn',
      executionRoleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    ArgumentError.checkNotNull(modelName, 'modelName');
    _s.validateStringLength(
      'modelName',
      modelName,
      0,
      63,
    );
    _s.validateStringPattern(
      'modelName',
      modelName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (containers != null) {}
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExecutionRoleArn': executionRoleArn,
        'ModelName': modelName,
        'Containers': containers,
        'EnableNetworkIsolation': enableNetworkIsolation,
        'PrimaryContainer': primaryContainer,
        'Tags': tags,
        'VpcConfig': vpcConfig,
      },
    );

    return CreateModelOutput.fromJson(jsonResponse.body);
  }

  /// Creates a model package that you can use to create Amazon SageMaker models
  /// or list on AWS Marketplace. Buyers can subscribe to model packages listed
  /// on AWS Marketplace to create models in Amazon SageMaker.
  ///
  /// To create a model package by specifying a Docker container that contains
  /// your inference code and the Amazon S3 location of your model artifacts,
  /// provide values for <code>InferenceSpecification</code>. To create a model
  /// from an algorithm resource that you created or subscribed to in AWS
  /// Marketplace, provide a value for
  /// <code>SourceAlgorithmSpecification</code>.
  ///
  /// Parameter [modelPackageName] :
  /// The name of the model package. The name must have 1 to 63 characters.
  /// Valid characters are a-z, A-Z, 0-9, and - (hyphen).
  ///
  /// Parameter [certifyForMarketplace] :
  /// Whether to certify the model package for listing on AWS Marketplace.
  ///
  /// Parameter [inferenceSpecification] :
  /// Specifies details about inference jobs that can be run with models based
  /// on this model package, including the following:
  ///
  /// <ul>
  /// <li>
  /// The Amazon ECR paths of containers that contain the inference code and
  /// model artifacts.
  /// </li>
  /// <li>
  /// The instance types that the model package supports for transform jobs and
  /// real-time endpoints used for inference.
  /// </li>
  /// <li>
  /// The input and output content formats that the model package supports for
  /// inference.
  /// </li>
  /// </ul>
  ///
  /// Parameter [modelPackageDescription] :
  /// A description of the model package.
  ///
  /// Parameter [sourceAlgorithmSpecification] :
  /// Details about the algorithm that was used to create the model package.
  ///
  /// Parameter [validationSpecification] :
  /// Specifies configurations for one or more transform jobs that Amazon
  /// SageMaker runs to test the model package.
  Future<CreateModelPackageOutput> createModelPackage({
    @_s.required String modelPackageName,
    bool certifyForMarketplace,
    InferenceSpecification inferenceSpecification,
    String modelPackageDescription,
    SourceAlgorithmSpecification sourceAlgorithmSpecification,
    ModelPackageValidationSpecification validationSpecification,
  }) async {
    ArgumentError.checkNotNull(modelPackageName, 'modelPackageName');
    _s.validateStringLength(
      'modelPackageName',
      modelPackageName,
      1,
      63,
    );
    _s.validateStringPattern(
      'modelPackageName',
      modelPackageName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    if (modelPackageDescription != null) {
      _s.validateStringLength(
        'modelPackageDescription',
        modelPackageDescription,
        0,
        1024,
      );
    }
    if (modelPackageDescription != null) {
      _s.validateStringPattern(
        'modelPackageDescription',
        modelPackageDescription,
        r'''[\p{L}\p{M}\p{Z}\p{S}\p{N}\p{P}]*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateModelPackage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelPackageName': modelPackageName,
        'CertifyForMarketplace': certifyForMarketplace,
        'InferenceSpecification': inferenceSpecification,
        'ModelPackageDescription': modelPackageDescription,
        'SourceAlgorithmSpecification': sourceAlgorithmSpecification,
        'ValidationSpecification': validationSpecification,
      },
    );

    return CreateModelPackageOutput.fromJson(jsonResponse.body);
  }

  /// Creates a schedule that regularly starts Amazon SageMaker Processing Jobs
  /// to monitor the data captured for an Amazon SageMaker Endoint.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceInUse].
  ///
  /// Parameter [monitoringScheduleConfig] :
  /// The configuration object that specifies the monitoring schedule and
  /// defines the monitoring job.
  ///
  /// Parameter [monitoringScheduleName] :
  /// The name of the monitoring schedule. The name must be unique within an AWS
  /// Region within an AWS account.
  ///
  /// Parameter [tags] :
  /// (Optional) An array of key-value pairs. For more information, see <a
  /// href="
  /// https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  Future<CreateMonitoringScheduleResponse> createMonitoringSchedule({
    @_s.required MonitoringScheduleConfig monitoringScheduleConfig,
    @_s.required String monitoringScheduleName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(
        monitoringScheduleConfig, 'monitoringScheduleConfig');
    ArgumentError.checkNotNull(
        monitoringScheduleName, 'monitoringScheduleName');
    _s.validateStringLength(
      'monitoringScheduleName',
      monitoringScheduleName,
      1,
      63,
    );
    _s.validateStringPattern(
      'monitoringScheduleName',
      monitoringScheduleName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateMonitoringSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitoringScheduleConfig': monitoringScheduleConfig,
        'MonitoringScheduleName': monitoringScheduleName,
        'Tags': tags,
      },
    );

    return CreateMonitoringScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon SageMaker notebook instance. A notebook instance is a
  /// machine learning (ML) compute instance running on a Jupyter notebook.
  ///
  /// In a <code>CreateNotebookInstance</code> request, specify the type of ML
  /// compute instance that you want to run. Amazon SageMaker launches the
  /// instance, installs common libraries that you can use to explore datasets
  /// for model training, and attaches an ML storage volume to the notebook
  /// instance.
  ///
  /// Amazon SageMaker also provides a set of example notebooks. Each notebook
  /// demonstrates how to use Amazon SageMaker with a specific algorithm or with
  /// a machine learning framework.
  ///
  /// After receiving the request, Amazon SageMaker does the following:
  /// <ol>
  /// <li>
  /// Creates a network interface in the Amazon SageMaker VPC.
  /// </li>
  /// <li>
  /// (Option) If you specified <code>SubnetId</code>, Amazon SageMaker creates
  /// a network interface in your own VPC, which is inferred from the subnet ID
  /// that you provide in the input. When creating this network interface,
  /// Amazon SageMaker attaches the security group that you specified in the
  /// request to the network interface that it creates in your VPC.
  /// </li>
  /// <li>
  /// Launches an EC2 instance of the type specified in the request in the
  /// Amazon SageMaker VPC. If you specified <code>SubnetId</code> of your VPC,
  /// Amazon SageMaker specifies both network interfaces when launching this
  /// instance. This enables inbound traffic from your own VPC to the notebook
  /// instance, assuming that the security groups allow it.
  /// </li> </ol>
  /// After creating the notebook instance, Amazon SageMaker returns its Amazon
  /// Resource Name (ARN). You can't change the name of a notebook instance
  /// after you create it.
  ///
  /// After Amazon SageMaker creates the notebook instance, you can connect to
  /// the Jupyter server and work in Jupyter notebooks. For example, you can
  /// write code to explore a dataset that you can use for model training, train
  /// a model, host models by creating Amazon SageMaker endpoints, and validate
  /// hosted models.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How
  /// It Works</a>.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [instanceType] :
  /// The type of ML compute instance to launch for the notebook instance.
  ///
  /// Parameter [notebookInstanceName] :
  /// The name of the new notebook instance.
  ///
  /// Parameter [roleArn] :
  /// When you send any requests to AWS resources from the notebook instance,
  /// Amazon SageMaker assumes this role to perform tasks on your behalf. You
  /// must grant this role necessary permissions so Amazon SageMaker can perform
  /// these tasks. The policy must allow the Amazon SageMaker service principal
  /// (sagemaker.amazonaws.com) permissions to assume this role. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon
  /// SageMaker Roles</a>.
  /// <note>
  /// To be able to pass this role to Amazon SageMaker, the caller of this API
  /// must have the <code>iam:PassRole</code> permission.
  /// </note>
  ///
  /// Parameter [acceleratorTypes] :
  /// A list of Elastic Inference (EI) instance types to associate with this
  /// notebook instance. Currently, only one instance type can be associated
  /// with a notebook instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html">Using
  /// Elastic Inference in Amazon SageMaker</a>.
  ///
  /// Parameter [additionalCodeRepositories] :
  /// An array of up to three Git repositories to associate with the notebook
  /// instance. These can be either the names of Git repositories stored as
  /// resources in your account, or the URL of Git repositories in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository. These repositories are
  /// cloned at the same level as the default repository of your notebook
  /// instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating
  /// Git Repositories with Amazon SageMaker Notebook Instances</a>.
  ///
  /// Parameter [defaultCodeRepository] :
  /// A Git repository to associate with the notebook instance as its default
  /// code repository. This can be either the name of a Git repository stored as
  /// a resource in your account, or the URL of a Git repository in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository. When you open a notebook
  /// instance, it opens in the directory that contains this repository. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating
  /// Git Repositories with Amazon SageMaker Notebook Instances</a>.
  ///
  /// Parameter [directInternetAccess] :
  /// Sets whether Amazon SageMaker provides internet access to the notebook
  /// instance. If you set this to <code>Disabled</code> this notebook instance
  /// will be able to access resources only in your VPC, and will not be able to
  /// connect to Amazon SageMaker training and endpoint services unless your
  /// configure a NAT Gateway in your VPC.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access">Notebook
  /// Instances Are Internet-Enabled by Default</a>. You can set the value of
  /// this parameter to <code>Disabled</code> only if you set a value for the
  /// <code>SubnetId</code> parameter.
  ///
  /// Parameter [kmsKeyId] :
  /// The Amazon Resource Name (ARN) of a AWS Key Management Service key that
  /// Amazon SageMaker uses to encrypt data on the storage volume attached to
  /// your notebook instance. The KMS key you provide must be enabled. For
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kms/latest/developerguide/enabling-keys.html">Enabling
  /// and Disabling Keys</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  ///
  /// Parameter [lifecycleConfigName] :
  /// The name of a lifecycle configuration to associate with the notebook
  /// instance. For information about lifestyle configurations, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step
  /// 2.1: (Optional) Customize a Notebook Instance</a>.
  ///
  /// Parameter [rootAccess] :
  /// Whether root access is enabled or disabled for users of the notebook
  /// instance. The default value is <code>Enabled</code>.
  /// <note>
  /// Lifecycle configurations need root access to be able to set up a notebook
  /// instance. Because of this, lifecycle configurations associated with a
  /// notebook instance always run with root access even if you disable root
  /// access for users.
  /// </note>
  ///
  /// Parameter [securityGroupIds] :
  /// The VPC security group IDs, in the form sg-xxxxxxxx. The security groups
  /// must be for the same VPC as specified in the subnet.
  ///
  /// Parameter [subnetId] :
  /// The ID of the subnet in a VPC to which you would like to have a
  /// connectivity from your ML compute instance.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the notebook instance. You can add tags
  /// later by using the <code>CreateTags</code> API.
  ///
  /// Parameter [volumeSizeInGB] :
  /// The size, in GB, of the ML storage volume to attach to the notebook
  /// instance. The default value is 5 GB.
  Future<CreateNotebookInstanceOutput> createNotebookInstance({
    @_s.required InstanceType instanceType,
    @_s.required String notebookInstanceName,
    @_s.required String roleArn,
    List<String> acceleratorTypes,
    List<String> additionalCodeRepositories,
    String defaultCodeRepository,
    DirectInternetAccess directInternetAccess,
    String kmsKeyId,
    String lifecycleConfigName,
    RootAccess rootAccess,
    List<String> securityGroupIds,
    String subnetId,
    List<Tag> tags,
    int volumeSizeInGB,
  }) async {
    ArgumentError.checkNotNull(instanceType, 'instanceType');
    ArgumentError.checkNotNull(notebookInstanceName, 'notebookInstanceName');
    _s.validateStringLength(
      'notebookInstanceName',
      notebookInstanceName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceName',
      notebookInstanceName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    if (additionalCodeRepositories != null) {}
    if (defaultCodeRepository != null) {
      _s.validateStringLength(
        'defaultCodeRepository',
        defaultCodeRepository,
        1,
        1024,
      );
    }
    if (defaultCodeRepository != null) {
      _s.validateStringPattern(
        'defaultCodeRepository',
        defaultCodeRepository,
        r'''^https://([^/]+)/?(.*)$|^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (kmsKeyId != null) {
      _s.validateStringLength(
        'kmsKeyId',
        kmsKeyId,
        0,
        2048,
      );
    }
    if (kmsKeyId != null) {
      _s.validateStringPattern(
        'kmsKeyId',
        kmsKeyId,
        r'''.*''',
      );
    }
    if (lifecycleConfigName != null) {
      _s.validateStringLength(
        'lifecycleConfigName',
        lifecycleConfigName,
        0,
        63,
      );
    }
    if (lifecycleConfigName != null) {
      _s.validateStringPattern(
        'lifecycleConfigName',
        lifecycleConfigName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (securityGroupIds != null) {}
    if (subnetId != null) {
      _s.validateStringLength(
        'subnetId',
        subnetId,
        0,
        32,
      );
    }
    if (subnetId != null) {
      _s.validateStringPattern(
        'subnetId',
        subnetId,
        r'''[-0-9a-zA-Z]+''',
      );
    }
    if (tags != null) {}
    if (volumeSizeInGB != null) {
      _s.validateNumRange(
        'volumeSizeInGB',
        volumeSizeInGB,
        5,
        16384,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateNotebookInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InstanceType': instanceType,
        'NotebookInstanceName': notebookInstanceName,
        'RoleArn': roleArn,
        'AcceleratorTypes': acceleratorTypes,
        'AdditionalCodeRepositories': additionalCodeRepositories,
        'DefaultCodeRepository': defaultCodeRepository,
        'DirectInternetAccess': directInternetAccess,
        'KmsKeyId': kmsKeyId,
        'LifecycleConfigName': lifecycleConfigName,
        'RootAccess': rootAccess,
        'SecurityGroupIds': securityGroupIds,
        'SubnetId': subnetId,
        'Tags': tags,
        'VolumeSizeInGB': volumeSizeInGB,
      },
    );

    return CreateNotebookInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Creates a lifecycle configuration that you can associate with a notebook
  /// instance. A <i>lifecycle configuration</i> is a collection of shell
  /// scripts that run when you create or start a notebook instance.
  ///
  /// Each lifecycle configuration script has a limit of 16384 characters.
  ///
  /// The value of the <code>$PATH</code> environment variable that is available
  /// to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.
  ///
  /// View CloudWatch Logs for notebook instance lifecycle configurations in log
  /// group <code>/aws/sagemaker/NotebookInstances</code> in log stream
  /// <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.
  ///
  /// Lifecycle configuration scripts cannot run for longer than 5 minutes. If a
  /// script runs for longer than 5 minutes, it fails and the notebook instance
  /// is not created or started.
  ///
  /// For information about notebook instance lifestyle configurations, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step
  /// 2.1: (Optional) Customize a Notebook Instance</a>.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [notebookInstanceLifecycleConfigName] :
  /// The name of the lifecycle configuration.
  ///
  /// Parameter [onCreate] :
  /// A shell script that runs only once, when you create a notebook instance.
  /// The shell script must be a base64-encoded string.
  ///
  /// Parameter [onStart] :
  /// A shell script that runs every time you start a notebook instance,
  /// including when you create the notebook instance. The shell script must be
  /// a base64-encoded string.
  Future<CreateNotebookInstanceLifecycleConfigOutput>
      createNotebookInstanceLifecycleConfig({
    @_s.required String notebookInstanceLifecycleConfigName,
    List<NotebookInstanceLifecycleHook> onCreate,
    List<NotebookInstanceLifecycleHook> onStart,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceLifecycleConfigName,
        'notebookInstanceLifecycleConfigName');
    _s.validateStringLength(
      'notebookInstanceLifecycleConfigName',
      notebookInstanceLifecycleConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceLifecycleConfigName',
      notebookInstanceLifecycleConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (onCreate != null) {}
    if (onStart != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateNotebookInstanceLifecycleConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceLifecycleConfigName':
            notebookInstanceLifecycleConfigName,
        'OnCreate': onCreate,
        'OnStart': onStart,
      },
    );

    return CreateNotebookInstanceLifecycleConfigOutput.fromJson(
        jsonResponse.body);
  }

  /// Creates a URL for a specified UserProfile in a Domain. When accessed in a
  /// web browser, the user will be automatically signed in to Amazon SageMaker
  /// Amazon SageMaker Studio (Studio), and granted access to all of the Apps
  /// and files associated with that Amazon Elastic File System (EFS). This
  /// operation can only be called when AuthMode equals IAM.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [userProfileName] :
  /// The name of the UserProfile to sign-in as.
  ///
  /// Parameter [sessionExpirationDurationInSeconds] :
  /// The session expiration duration in seconds.
  Future<CreatePresignedDomainUrlResponse> createPresignedDomainUrl({
    @_s.required String domainId,
    @_s.required String userProfileName,
    int sessionExpirationDurationInSeconds,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    ArgumentError.checkNotNull(userProfileName, 'userProfileName');
    _s.validateStringLength(
      'userProfileName',
      userProfileName,
      0,
      63,
    );
    _s.validateStringPattern(
      'userProfileName',
      userProfileName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (sessionExpirationDurationInSeconds != null) {
      _s.validateNumRange(
        'sessionExpirationDurationInSeconds',
        sessionExpirationDurationInSeconds,
        1800,
        43200,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreatePresignedDomainUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'UserProfileName': userProfileName,
        'SessionExpirationDurationInSeconds':
            sessionExpirationDurationInSeconds,
      },
    );

    return CreatePresignedDomainUrlResponse.fromJson(jsonResponse.body);
  }

  /// Returns a URL that you can use to connect to the Jupyter server from a
  /// notebook instance. In the Amazon SageMaker console, when you choose
  /// <code>Open</code> next to a notebook instance, Amazon SageMaker opens a
  /// new tab showing the Jupyter server home page from the notebook instance.
  /// The console uses this API to get the URL and show the page.
  ///
  /// IAM authorization policies for this API are also enforced for every HTTP
  /// request and WebSocket frame that attempts to connect to the notebook
  /// instance.For example, you can restrict access to this API and to the URL
  /// that it returns to a list of IP addresses that you specify. Use the
  /// <code>NotIpAddress</code> condition operator and the
  /// <code>aws:SourceIP</code> condition context key to specify the list of IP
  /// addresses that you want to have access to the notebook instance. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/security_iam_id-based-policy-examples.html#nbi-ip-filter">Limit
  /// Access to a Notebook Instance by IP Address</a>.
  /// <note>
  /// The URL that you get from a call to
  /// <a>CreatePresignedNotebookInstanceUrl</a> is valid only for 5 minutes. If
  /// you try to use the URL after the 5-minute limit expires, you are directed
  /// to the AWS console sign-in page.
  /// </note>
  ///
  /// Parameter [notebookInstanceName] :
  /// The name of the notebook instance.
  ///
  /// Parameter [sessionExpirationDurationInSeconds] :
  /// The duration of the session, in seconds. The default is 12 hours.
  Future<CreatePresignedNotebookInstanceUrlOutput>
      createPresignedNotebookInstanceUrl({
    @_s.required String notebookInstanceName,
    int sessionExpirationDurationInSeconds,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceName, 'notebookInstanceName');
    _s.validateStringLength(
      'notebookInstanceName',
      notebookInstanceName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceName',
      notebookInstanceName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (sessionExpirationDurationInSeconds != null) {
      _s.validateNumRange(
        'sessionExpirationDurationInSeconds',
        sessionExpirationDurationInSeconds,
        1800,
        43200,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreatePresignedNotebookInstanceUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceName': notebookInstanceName,
        'SessionExpirationDurationInSeconds':
            sessionExpirationDurationInSeconds,
      },
    );

    return CreatePresignedNotebookInstanceUrlOutput.fromJson(jsonResponse.body);
  }

  /// Creates a processing job.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [appSpecification] :
  /// Configures the processing job to run a specified Docker container image.
  ///
  /// Parameter [processingJobName] :
  /// The name of the processing job. The name must be unique within an AWS
  /// Region in the AWS account.
  ///
  /// Parameter [processingResources] :
  /// Identifies the resources, ML compute instances, and ML storage volumes to
  /// deploy for a processing job. In distributed training, you specify more
  /// than one instance.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can
  /// assume to perform tasks on your behalf.
  ///
  /// Parameter [environment] :
  /// Sets the environment variables in the Docker container.
  ///
  /// Parameter [networkConfig] :
  /// Networking options for a processing job.
  ///
  /// Parameter [processingInputs] :
  /// For each input, data is downloaded from S3 into the processing container
  /// before the processing job begins running if "S3InputMode" is set to
  /// <code>File</code>.
  ///
  /// Parameter [processingOutputConfig] :
  /// Output configuration for the processing job.
  ///
  /// Parameter [stoppingCondition] :
  /// The time limit for how long the processing job is allowed to run.
  ///
  /// Parameter [tags] :
  /// (Optional) An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  Future<CreateProcessingJobResponse> createProcessingJob({
    @_s.required AppSpecification appSpecification,
    @_s.required String processingJobName,
    @_s.required ProcessingResources processingResources,
    @_s.required String roleArn,
    Map<String, String> environment,
    ExperimentConfig experimentConfig,
    NetworkConfig networkConfig,
    List<ProcessingInput> processingInputs,
    ProcessingOutputConfig processingOutputConfig,
    ProcessingStoppingCondition stoppingCondition,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(appSpecification, 'appSpecification');
    ArgumentError.checkNotNull(processingJobName, 'processingJobName');
    _s.validateStringLength(
      'processingJobName',
      processingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'processingJobName',
      processingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(processingResources, 'processingResources');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    if (environment != null) {}
    if (processingInputs != null) {}
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateProcessingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppSpecification': appSpecification,
        'ProcessingJobName': processingJobName,
        'ProcessingResources': processingResources,
        'RoleArn': roleArn,
        'Environment': environment,
        'ExperimentConfig': experimentConfig,
        'NetworkConfig': networkConfig,
        'ProcessingInputs': processingInputs,
        'ProcessingOutputConfig': processingOutputConfig,
        'StoppingCondition': stoppingCondition,
        'Tags': tags,
      },
    );

    return CreateProcessingJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts a model training job. After training completes, Amazon SageMaker
  /// saves the resulting model artifacts to an Amazon S3 location that you
  /// specify.
  ///
  /// If you choose to host your model using Amazon SageMaker hosting services,
  /// you can use the resulting model artifacts as part of the model. You can
  /// also use the artifacts in a machine learning service other than Amazon
  /// SageMaker, provided that you know how to use them for inferences.
  ///
  /// In the request body, you provide the following:
  ///
  /// <ul>
  /// <li>
  /// <code>AlgorithmSpecification</code> - Identifies the training algorithm to
  /// use.
  /// </li>
  /// <li>
  /// <code>HyperParameters</code> - Specify these algorithm-specific parameters
  /// to enable the estimation of model parameters during training.
  /// Hyperparameters can be tuned to optimize this learning process. For a list
  /// of hyperparameters for each training algorithm provided by Amazon
  /// SageMaker, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>.
  /// </li>
  /// <li>
  /// <code>InputDataConfig</code> - Describes the training dataset and the
  /// Amazon S3, EFS, or FSx location where it is stored.
  /// </li>
  /// <li>
  /// <code>OutputDataConfig</code> - Identifies the Amazon S3 bucket where you
  /// want Amazon SageMaker to save the results of model training.
  /// <p/> </li>
  /// <li>
  /// <code>ResourceConfig</code> - Identifies the resources, ML compute
  /// instances, and ML storage volumes to deploy for model training. In
  /// distributed training, you specify more than one instance.
  /// </li>
  /// <li>
  /// <code>EnableManagedSpotTraining</code> - Optimize the cost of training
  /// machine learning models by up to 80% by using Amazon EC2 Spot instances.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed
  /// Spot Training</a>.
  /// </li>
  /// <li>
  /// <code>RoleARN</code> - The Amazon Resource Number (ARN) that Amazon
  /// SageMaker assumes to perform tasks on your behalf during model training.
  /// You must grant this role the necessary permissions so that Amazon
  /// SageMaker can successfully complete model training.
  /// </li>
  /// <li>
  /// <code>StoppingCondition</code> - To help cap training costs, use
  /// <code>MaxRuntimeInSeconds</code> to set a time limit for training. Use
  /// <code>MaxWaitTimeInSeconds</code> to specify how long you are willing to
  /// wait for a managed spot training job to complete.
  /// </li>
  /// </ul>
  /// For more information about Amazon SageMaker, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/how-it-works.html">How
  /// It Works</a>.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [algorithmSpecification] :
  /// The registry path of the Docker image that contains the training algorithm
  /// and algorithm-specific metadata, including the input mode. For more
  /// information about algorithms provided by Amazon SageMaker, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>.
  /// For information about providing your own algorithms, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using
  /// Your Own Algorithms with Amazon SageMaker</a>.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies the path to the S3 location where you want to store model
  /// artifacts. Amazon SageMaker creates subfolders for the artifacts.
  ///
  /// Parameter [resourceConfig] :
  /// The resources, including the ML compute instances and ML storage volumes,
  /// to use for model training.
  ///
  /// ML storage volumes store model artifacts and incremental states. Training
  /// algorithms might also use ML storage volumes for scratch space. If you
  /// want Amazon SageMaker to use the ML storage volume to store the training
  /// data, choose <code>File</code> as the <code>TrainingInputMode</code> in
  /// the algorithm specification. For distributed training algorithms, specify
  /// an instance count greater than 1.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can
  /// assume to perform tasks on your behalf.
  ///
  /// During model training, Amazon SageMaker needs your permission to read
  /// input data from an S3 bucket, download a Docker image that contains
  /// training code, write model artifacts to an S3 bucket, write logs to Amazon
  /// CloudWatch Logs, and publish metrics to Amazon CloudWatch. You grant
  /// permissions for all of these tasks to an IAM role. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon
  /// SageMaker Roles</a>.
  /// <note>
  /// To be able to pass this role to Amazon SageMaker, the caller of this API
  /// must have the <code>iam:PassRole</code> permission.
  /// </note>
  ///
  /// Parameter [stoppingCondition] :
  /// Specifies a limit to how long a model training job can run. When the job
  /// reaches the time limit, Amazon SageMaker ends the training job. Use this
  /// API to cap model training costs.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the
  /// <code>SIGTERM</code> signal, which delays job termination for 120 seconds.
  /// Algorithms can use this 120-second window to save the model artifacts, so
  /// the results of training are not lost.
  ///
  /// Parameter [trainingJobName] :
  /// The name of the training job. The name must be unique within an AWS Region
  /// in an AWS account.
  ///
  /// Parameter [checkpointConfig] :
  /// Contains information about the output location for managed spot training
  /// checkpoint data.
  ///
  /// Parameter [debugRuleConfigurations] :
  /// Configuration information for debugging rules.
  ///
  /// Parameter [enableInterContainerTrafficEncryption] :
  /// To encrypt all communications between ML compute instances in distributed
  /// training, choose <code>True</code>. Encryption provides greater security
  /// for distributed training, but training might take longer. How long it
  /// takes depends on the amount of communication between compute instances,
  /// especially if you use a deep learning algorithm in distributed training.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-encrypt.html">Protect
  /// Communications Between ML Compute Instances in a Distributed Training
  /// Job</a>.
  ///
  /// Parameter [enableManagedSpotTraining] :
  /// To train models using managed spot training, choose <code>True</code>.
  /// Managed spot training provides a fully managed and scalable infrastructure
  /// for training machine learning models. this option is useful when training
  /// jobs can be interrupted and when there is flexibility when the training
  /// job is run.
  ///
  /// The complete and intermediate results of jobs are stored in an Amazon S3
  /// bucket, and can be used as a starting point to train models incrementally.
  /// Amazon SageMaker provides metrics and logs in CloudWatch. They can be used
  /// to see when managed spot training jobs are running, interrupted, resumed,
  /// or completed.
  ///
  /// Parameter [enableNetworkIsolation] :
  /// Isolates the training container. No inbound or outbound network calls can
  /// be made, except for calls between peers within a training cluster for
  /// distributed training. If you enable network isolation for training jobs
  /// that are configured to use a VPC, Amazon SageMaker downloads and uploads
  /// customer data and model artifacts through the specified VPC, but the
  /// training container does not have network access.
  ///
  /// Parameter [hyperParameters] :
  /// Algorithm-specific parameters that influence the quality of the model. You
  /// set hyperparameters before you start the learning process. For a list of
  /// hyperparameters for each training algorithm provided by Amazon SageMaker,
  /// see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>.
  ///
  /// You can specify a maximum of 100 hyperparameters. Each hyperparameter is a
  /// key-value pair. Each key and value is limited to 256 characters, as
  /// specified by the <code>Length Constraint</code>.
  ///
  /// Parameter [inputDataConfig] :
  /// An array of <code>Channel</code> objects. Each channel is a named input
  /// source. <code>InputDataConfig</code> describes the input data and its
  /// location.
  ///
  /// Algorithms can accept input data from one or more channels. For example,
  /// an algorithm might have two channels of input data,
  /// <code>training_data</code> and <code>validation_data</code>. The
  /// configuration for each channel provides the S3, EFS, or FSx location where
  /// the input data is stored. It also provides information about the stored
  /// data: the MIME type, compression method, and whether the data is wrapped
  /// in RecordIO format.
  ///
  /// Depending on the input mode that the algorithm supports, Amazon SageMaker
  /// either copies input data files from an S3 bucket to a local directory in
  /// the Docker container, or makes it available as input streams. For example,
  /// if you specify an EFS location, input data files will be made available as
  /// input streams. They do not need to be downloaded.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  ///
  /// Parameter [vpcConfig] :
  /// A <a>VpcConfig</a> object that specifies the VPC that you want your
  /// training job to connect to. Control access to and from your training
  /// container by configuring the VPC. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect
  /// Training Jobs by Using an Amazon Virtual Private Cloud</a>.
  Future<CreateTrainingJobResponse> createTrainingJob({
    @_s.required AlgorithmSpecification algorithmSpecification,
    @_s.required OutputDataConfig outputDataConfig,
    @_s.required ResourceConfig resourceConfig,
    @_s.required String roleArn,
    @_s.required StoppingCondition stoppingCondition,
    @_s.required String trainingJobName,
    CheckpointConfig checkpointConfig,
    DebugHookConfig debugHookConfig,
    List<DebugRuleConfiguration> debugRuleConfigurations,
    bool enableInterContainerTrafficEncryption,
    bool enableManagedSpotTraining,
    bool enableNetworkIsolation,
    ExperimentConfig experimentConfig,
    Map<String, String> hyperParameters,
    List<Channel> inputDataConfig,
    List<Tag> tags,
    TensorBoardOutputConfig tensorBoardOutputConfig,
    VpcConfig vpcConfig,
  }) async {
    ArgumentError.checkNotNull(
        algorithmSpecification, 'algorithmSpecification');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    ArgumentError.checkNotNull(resourceConfig, 'resourceConfig');
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    ArgumentError.checkNotNull(stoppingCondition, 'stoppingCondition');
    ArgumentError.checkNotNull(trainingJobName, 'trainingJobName');
    _s.validateStringLength(
      'trainingJobName',
      trainingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'trainingJobName',
      trainingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (debugRuleConfigurations != null) {}
    if (hyperParameters != null) {}
    if (inputDataConfig != null) {}
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateTrainingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AlgorithmSpecification': algorithmSpecification,
        'OutputDataConfig': outputDataConfig,
        'ResourceConfig': resourceConfig,
        'RoleArn': roleArn,
        'StoppingCondition': stoppingCondition,
        'TrainingJobName': trainingJobName,
        'CheckpointConfig': checkpointConfig,
        'DebugHookConfig': debugHookConfig,
        'DebugRuleConfigurations': debugRuleConfigurations,
        'EnableInterContainerTrafficEncryption':
            enableInterContainerTrafficEncryption,
        'EnableManagedSpotTraining': enableManagedSpotTraining,
        'EnableNetworkIsolation': enableNetworkIsolation,
        'ExperimentConfig': experimentConfig,
        'HyperParameters': hyperParameters,
        'InputDataConfig': inputDataConfig,
        'Tags': tags,
        'TensorBoardOutputConfig': tensorBoardOutputConfig,
        'VpcConfig': vpcConfig,
      },
    );

    return CreateTrainingJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts a transform job. A transform job uses a trained model to get
  /// inferences on a dataset and saves these results to an Amazon S3 location
  /// that you specify.
  ///
  /// To perform batch transformations, you create a transform job and use the
  /// data that you have readily available.
  ///
  /// In the request body, you provide the following:
  ///
  /// <ul>
  /// <li>
  /// <code>TransformJobName</code> - Identifies the transform job. The name
  /// must be unique within an AWS Region in an AWS account.
  /// </li>
  /// <li>
  /// <code>ModelName</code> - Identifies the model to use.
  /// <code>ModelName</code> must be the name of an existing Amazon SageMaker
  /// model in the same AWS Region and AWS account. For information on creating
  /// a model, see <a>CreateModel</a>.
  /// </li>
  /// <li>
  /// <code>TransformInput</code> - Describes the dataset to be transformed and
  /// the Amazon S3 location where it is stored.
  /// </li>
  /// <li>
  /// <code>TransformOutput</code> - Identifies the Amazon S3 location where you
  /// want Amazon SageMaker to save the results from the transform job.
  /// </li>
  /// <li>
  /// <code>TransformResources</code> - Identifies the ML compute instances for
  /// the transform job.
  /// </li>
  /// </ul>
  /// For more information about how batch transformation works, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform.html">Batch
  /// Transform</a>.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [modelName] :
  /// The name of the model that you want to use for the transform job.
  /// <code>ModelName</code> must be the name of an existing Amazon SageMaker
  /// model within an AWS Region in an AWS account.
  ///
  /// Parameter [transformInput] :
  /// Describes the input source and the way the transform job consumes it.
  ///
  /// Parameter [transformJobName] :
  /// The name of the transform job. The name must be unique within an AWS
  /// Region in an AWS account.
  ///
  /// Parameter [transformOutput] :
  /// Describes the results of the transform job.
  ///
  /// Parameter [transformResources] :
  /// Describes the resources, including ML instance types and ML instance
  /// count, to use for the transform job.
  ///
  /// Parameter [batchStrategy] :
  /// Specifies the number of records to include in a mini-batch for an HTTP
  /// inference request. A <i>record</i> <i/> is a single unit of input data
  /// that inference can be made on. For example, a single line in a CSV file is
  /// a record.
  ///
  /// To enable the batch strategy, you must set the <code>SplitType</code>
  /// property to <code>Line</code>, <code>RecordIO</code>, or
  /// <code>TFRecord</code>.
  ///
  /// To use only one record when making an HTTP invocation request to a
  /// container, set <code>BatchStrategy</code> to <code>SingleRecord</code> and
  /// <code>SplitType</code> to <code>Line</code>.
  ///
  /// To fit as many records in a mini-batch as can fit within the
  /// <code>MaxPayloadInMB</code> limit, set <code>BatchStrategy</code> to
  /// <code>MultiRecord</code> and <code>SplitType</code> to <code>Line</code>.
  ///
  /// Parameter [dataProcessing] :
  /// The data structure used to specify the data to be used for inference in a
  /// batch transform job and to associate the data that is relevant to the
  /// prediction results in the output. The input filter provided allows you to
  /// exclude input data that is not needed for inference in a batch transform
  /// job. The output filter provided allows you to include input data relevant
  /// to interpreting the predictions in the output from the job. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html">Associate
  /// Prediction Results with their Corresponding Input Records</a>.
  ///
  /// Parameter [environment] :
  /// The environment variables to set in the Docker container. We support up to
  /// 16 key and values entries in the map.
  ///
  /// Parameter [maxConcurrentTransforms] :
  /// The maximum number of parallel requests that can be sent to each instance
  /// in a transform job. If <code>MaxConcurrentTransforms</code> is set to
  /// <code>0</code> or left unset, Amazon SageMaker checks the optional
  /// execution-parameters to determine the settings for your chosen algorithm.
  /// If the execution-parameters endpoint is not enabled, the default value is
  /// <code>1</code>. For more information on execution-parameters, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms-batch-code.html#your-algorithms-batch-code-how-containe-serves-requests">How
  /// Containers Serve Requests</a>. For built-in algorithms, you don't need to
  /// set a value for <code>MaxConcurrentTransforms</code>.
  ///
  /// Parameter [maxPayloadInMB] :
  /// The maximum allowed size of the payload, in MB. A <i>payload</i> is the
  /// data portion of a record (without metadata). The value in
  /// <code>MaxPayloadInMB</code> must be greater than, or equal to, the size of
  /// a single record. To estimate the size of a record in MB, divide the size
  /// of your dataset by the number of records. To ensure that the records fit
  /// within the maximum payload size, we recommend using a slightly larger
  /// value. The default value is <code>6</code> MB.
  ///
  /// For cases where the payload might be arbitrarily large and is transmitted
  /// using HTTP chunked encoding, set the value to <code>0</code>. This feature
  /// works only in supported algorithms. Currently, Amazon SageMaker built-in
  /// algorithms do not support HTTP chunked encoding.
  ///
  /// Parameter [tags] :
  /// (Optional) An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  Future<CreateTransformJobResponse> createTransformJob({
    @_s.required String modelName,
    @_s.required TransformInput transformInput,
    @_s.required String transformJobName,
    @_s.required TransformOutput transformOutput,
    @_s.required TransformResources transformResources,
    BatchStrategy batchStrategy,
    DataProcessing dataProcessing,
    Map<String, String> environment,
    ExperimentConfig experimentConfig,
    int maxConcurrentTransforms,
    int maxPayloadInMB,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    _s.validateStringLength(
      'modelName',
      modelName,
      0,
      63,
    );
    _s.validateStringPattern(
      'modelName',
      modelName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(transformInput, 'transformInput');
    ArgumentError.checkNotNull(transformJobName, 'transformJobName');
    _s.validateStringLength(
      'transformJobName',
      transformJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'transformJobName',
      transformJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(transformOutput, 'transformOutput');
    ArgumentError.checkNotNull(transformResources, 'transformResources');
    if (environment != null) {}
    if (maxConcurrentTransforms != null) {
      _s.validateNumRange(
        'maxConcurrentTransforms',
        maxConcurrentTransforms,
        0,
        1152921504606846976,
      );
    }
    if (maxPayloadInMB != null) {
      _s.validateNumRange(
        'maxPayloadInMB',
        maxPayloadInMB,
        0,
        1152921504606846976,
      );
    }
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateTransformJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
        'TransformInput': transformInput,
        'TransformJobName': transformJobName,
        'TransformOutput': transformOutput,
        'TransformResources': transformResources,
        'BatchStrategy': batchStrategy,
        'DataProcessing': dataProcessing,
        'Environment': environment,
        'ExperimentConfig': experimentConfig,
        'MaxConcurrentTransforms': maxConcurrentTransforms,
        'MaxPayloadInMB': maxPayloadInMB,
        'Tags': tags,
      },
    );

    return CreateTransformJobResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon SageMaker <i>trial</i>. A trial is a set of steps called
  /// <i>trial components</i> that produce a machine learning model. A trial is
  /// part of a single Amazon SageMaker <i>experiment</i>.
  ///
  /// When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK,
  /// all experiments, trials, and trial components are automatically tracked,
  /// logged, and indexed. When you use the AWS SDK for Python (Boto), you must
  /// use the logging APIs provided by the SDK.
  ///
  /// You can add tags to a trial and then use the <a>Search</a> API to search
  /// for the tags.
  ///
  /// To get a list of all your trials, call the <a>ListTrials</a> API. To view
  /// a trial's properties, call the <a>DescribeTrial</a> API. To create a trial
  /// component, call the <a>CreateTrialComponent</a> API.
  ///
  /// May throw [ResourceNotFound].
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [experimentName] :
  /// The name of the experiment to associate the trial with.
  ///
  /// Parameter [trialName] :
  /// The name of the trial. The name must be unique in your AWS account and is
  /// not case-sensitive.
  ///
  /// Parameter [displayName] :
  /// The name of the trial as displayed. The name doesn't need to be unique. If
  /// <code>DisplayName</code> isn't specified, <code>TrialName</code> is
  /// displayed.
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the trial. You can use <a>Search</a> API
  /// to search on the tags.
  Future<CreateTrialResponse> createTrial({
    @_s.required String experimentName,
    @_s.required String trialName,
    String displayName,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(experimentName, 'experimentName');
    _s.validateStringLength(
      'experimentName',
      experimentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'experimentName',
      experimentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(trialName, 'trialName');
    _s.validateStringLength(
      'trialName',
      trialName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialName',
      trialName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (displayName != null) {
      _s.validateStringLength(
        'displayName',
        displayName,
        1,
        82,
      );
    }
    if (displayName != null) {
      _s.validateStringPattern(
        'displayName',
        displayName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateTrial'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExperimentName': experimentName,
        'TrialName': trialName,
        'DisplayName': displayName,
        'Tags': tags,
      },
    );

    return CreateTrialResponse.fromJson(jsonResponse.body);
  }

  /// Creates a <i>trial component</i>, which is a stage of a machine learning
  /// <i>trial</i>. A trial is composed of one or more trial components. A trial
  /// component can be used in multiple trials.
  ///
  /// Trial components include pre-processing jobs, training jobs, and batch
  /// transform jobs.
  ///
  /// When you use Amazon SageMaker Studio or the Amazon SageMaker Python SDK,
  /// all experiments, trials, and trial components are automatically tracked,
  /// logged, and indexed. When you use the AWS SDK for Python (Boto), you must
  /// use the logging APIs provided by the SDK.
  ///
  /// You can add tags to a trial component and then use the <a>Search</a> API
  /// to search for the tags.
  /// <note>
  /// <code>CreateTrialComponent</code> can only be invoked from within an
  /// Amazon SageMaker managed environment. This includes Amazon SageMaker
  /// training jobs, processing jobs, transform jobs, and Amazon SageMaker
  /// notebooks. A call to <code>CreateTrialComponent</code> from outside one of
  /// these environments results in an error.
  /// </note>
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [trialComponentName] :
  /// The name of the component. The name must be unique in your AWS account and
  /// is not case-sensitive.
  ///
  /// Parameter [displayName] :
  /// The name of the component as displayed. The name doesn't need to be
  /// unique. If <code>DisplayName</code> isn't specified,
  /// <code>TrialComponentName</code> is displayed.
  ///
  /// Parameter [endTime] :
  /// When the component ended.
  ///
  /// Parameter [inputArtifacts] :
  /// The input artifacts for the component. Examples of input artifacts are
  /// datasets, algorithms, hyperparameters, source code, and instance types.
  ///
  /// Parameter [outputArtifacts] :
  /// The output artifacts for the component. Examples of output artifacts are
  /// metrics, snapshots, logs, and images.
  ///
  /// Parameter [parameters] :
  /// The hyperparameters for the component.
  ///
  /// Parameter [startTime] :
  /// When the component started.
  ///
  /// Parameter [status] :
  /// The status of the component. States include:
  ///
  /// <ul>
  /// <li>
  /// InProgress
  /// </li>
  /// <li>
  /// Completed
  /// </li>
  /// <li>
  /// Failed
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A list of tags to associate with the component. You can use <a>Search</a>
  /// API to search on the tags.
  Future<CreateTrialComponentResponse> createTrialComponent({
    @_s.required String trialComponentName,
    String displayName,
    DateTime endTime,
    Map<String, TrialComponentArtifact> inputArtifacts,
    Map<String, TrialComponentArtifact> outputArtifacts,
    Map<String, TrialComponentParameterValue> parameters,
    DateTime startTime,
    TrialComponentStatus status,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(trialComponentName, 'trialComponentName');
    _s.validateStringLength(
      'trialComponentName',
      trialComponentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialComponentName',
      trialComponentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (displayName != null) {
      _s.validateStringLength(
        'displayName',
        displayName,
        1,
        82,
      );
    }
    if (displayName != null) {
      _s.validateStringPattern(
        'displayName',
        displayName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (inputArtifacts != null) {}
    if (outputArtifacts != null) {}
    if (parameters != null) {}
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateTrialComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialComponentName': trialComponentName,
        'DisplayName': displayName,
        'EndTime': endTime,
        'InputArtifacts': inputArtifacts,
        'OutputArtifacts': outputArtifacts,
        'Parameters': parameters,
        'StartTime': startTime,
        'Status': status,
        'Tags': tags,
      },
    );

    return CreateTrialComponentResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new user profile. A user profile represents a single user within
  /// a Domain, and is the main way to reference a "person" for the purposes of
  /// sharing, reporting and other user-oriented features. This entity is
  /// created during on-boarding. If an administrator invites a person by email
  /// or imports them from SSO, a new UserProfile is automatically created. This
  /// entity is the primary holder of settings for an individual user and has a
  /// reference to the user's private Amazon Elastic File System (EFS) home
  /// directory.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceInUse].
  ///
  /// Parameter [domainId] :
  /// The ID of the associated Domain.
  ///
  /// Parameter [userProfileName] :
  /// A name for the UserProfile.
  ///
  /// Parameter [singleSignOnUserIdentifier] :
  /// A specifier for the type of value specified in SingleSignOnUserValue.
  /// Currently, the only supported value is "UserName". If the Domain's
  /// AuthMode is SSO, this field is required. If the Domain's AuthMode is not
  /// SSO, this field cannot be specified.
  ///
  /// Parameter [singleSignOnUserValue] :
  /// The username of the associated AWS Single Sign-On User for this
  /// UserProfile. If the Domain's AuthMode is SSO, this field is required, and
  /// must match a valid username of a user in your directory. If the Domain's
  /// AuthMode is not SSO, this field cannot be specified.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a key and an optional value. Tag keys must be unique
  /// per resource.
  ///
  /// Parameter [userSettings] :
  /// A collection of settings.
  Future<CreateUserProfileResponse> createUserProfile({
    @_s.required String domainId,
    @_s.required String userProfileName,
    String singleSignOnUserIdentifier,
    String singleSignOnUserValue,
    List<Tag> tags,
    UserSettings userSettings,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    ArgumentError.checkNotNull(userProfileName, 'userProfileName');
    _s.validateStringLength(
      'userProfileName',
      userProfileName,
      0,
      63,
    );
    _s.validateStringPattern(
      'userProfileName',
      userProfileName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (singleSignOnUserIdentifier != null) {
      _s.validateStringPattern(
        'singleSignOnUserIdentifier',
        singleSignOnUserIdentifier,
        r'''UserName''',
      );
    }
    if (singleSignOnUserValue != null) {
      _s.validateStringLength(
        'singleSignOnUserValue',
        singleSignOnUserValue,
        0,
        256,
      );
    }
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'UserProfileName': userProfileName,
        'SingleSignOnUserIdentifier': singleSignOnUserIdentifier,
        'SingleSignOnUserValue': singleSignOnUserValue,
        'Tags': tags,
        'UserSettings': userSettings,
      },
    );

    return CreateUserProfileResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new work team for labeling your data. A work team is defined by
  /// one or more Amazon Cognito user pools. You must first create the user
  /// pools before you can create a work team.
  ///
  /// You cannot create more than 25 work teams in an account and region.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [description] :
  /// A description of the work team.
  ///
  /// Parameter [memberDefinitions] :
  /// A list of <code>MemberDefinition</code> objects that contains objects that
  /// identify the Amazon Cognito user pool that makes up the work team. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/cognito/latest/developerguide/cognito-user-identity-pools.html">Amazon
  /// Cognito User Pools</a>.
  ///
  /// All of the <code>CognitoMemberDefinition</code> objects that make up the
  /// member definition must have the same <code>ClientId</code> and
  /// <code>UserPool</code> values.
  ///
  /// Parameter [workteamName] :
  /// The name of the work team. Use this name to identify the work team.
  ///
  /// Parameter [notificationConfiguration] :
  /// Configures notification of workers regarding available or expiring work
  /// items.
  ///
  /// Parameter [tags] :
  /// An array of key-value pairs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-resource-tags.html">Resource
  /// Tag</a> and <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a> in the <i> AWS Billing and Cost Management User
  /// Guide</i>.
  Future<CreateWorkteamResponse> createWorkteam({
    @_s.required String description,
    @_s.required List<MemberDefinition> memberDefinitions,
    @_s.required String workteamName,
    NotificationConfiguration notificationConfiguration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(description, 'description');
    _s.validateStringLength(
      'description',
      description,
      1,
      200,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''.+''',
    );
    ArgumentError.checkNotNull(memberDefinitions, 'memberDefinitions');
    ArgumentError.checkNotNull(workteamName, 'workteamName');
    _s.validateStringLength(
      'workteamName',
      workteamName,
      1,
      63,
    );
    _s.validateStringPattern(
      'workteamName',
      workteamName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (tags != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.CreateWorkteam'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Description': description,
        'MemberDefinitions': memberDefinitions,
        'WorkteamName': workteamName,
        'NotificationConfiguration': notificationConfiguration,
        'Tags': tags,
      },
    );

    return CreateWorkteamResponse.fromJson(jsonResponse.body);
  }

  /// Removes the specified algorithm from your account.
  ///
  /// Parameter [algorithmName] :
  /// The name of the algorithm to delete.
  Future<void> deleteAlgorithm({
    @_s.required String algorithmName,
  }) async {
    ArgumentError.checkNotNull(algorithmName, 'algorithmName');
    _s.validateStringLength(
      'algorithmName',
      algorithmName,
      1,
      63,
    );
    _s.validateStringPattern(
      'algorithmName',
      algorithmName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteAlgorithm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AlgorithmName': algorithmName,
      },
    );
  }

  /// Used to stop and delete an app.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [appName] :
  /// The name of the app.
  ///
  /// Parameter [appType] :
  /// The type of app.
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [userProfileName] :
  /// The user profile name.
  Future<void> deleteApp({
    @_s.required String appName,
    @_s.required AppType appType,
    @_s.required String domainId,
    @_s.required String userProfileName,
  }) async {
    ArgumentError.checkNotNull(appName, 'appName');
    _s.validateStringLength(
      'appName',
      appName,
      0,
      63,
    );
    _s.validateStringPattern(
      'appName',
      appName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(appType, 'appType');
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    ArgumentError.checkNotNull(userProfileName, 'userProfileName');
    _s.validateStringLength(
      'userProfileName',
      userProfileName,
      0,
      63,
    );
    _s.validateStringPattern(
      'userProfileName',
      userProfileName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppName': appName,
        'AppType': appType,
        'DomainId': domainId,
        'UserProfileName': userProfileName,
      },
    );
  }

  /// Deletes the specified Git repository from your account.
  ///
  /// Parameter [codeRepositoryName] :
  /// The name of the Git repository to delete.
  Future<void> deleteCodeRepository({
    @_s.required String codeRepositoryName,
  }) async {
    ArgumentError.checkNotNull(codeRepositoryName, 'codeRepositoryName');
    _s.validateStringLength(
      'codeRepositoryName',
      codeRepositoryName,
      1,
      63,
    );
    _s.validateStringPattern(
      'codeRepositoryName',
      codeRepositoryName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteCodeRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CodeRepositoryName': codeRepositoryName,
      },
    );
  }

  /// Used to delete a domain. If you on-boarded with IAM mode, you will need to
  /// delete your domain to on-board again using SSO. Use with caution. All of
  /// the members of the domain will lose access to their EFS volume, including
  /// data, notebooks, and other artifacts.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [retentionPolicy] :
  /// The retention policy for this domain, which specifies which resources will
  /// be retained after the Domain is deleted. By default, all resources are
  /// retained (not automatically deleted).
  Future<void> deleteDomain({
    @_s.required String domainId,
    RetentionPolicy retentionPolicy,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'RetentionPolicy': retentionPolicy,
      },
    );
  }

  /// Deletes an endpoint. Amazon SageMaker frees up all of the resources that
  /// were deployed when the endpoint was created.
  ///
  /// Amazon SageMaker retires any custom KMS key grants associated with the
  /// endpoint, meaning you don't need to use the <a
  /// href="http://docs.aws.amazon.com/kms/latest/APIReference/API_RevokeGrant.html">RevokeGrant</a>
  /// API call.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint that you want to delete.
  Future<void> deleteEndpoint({
    @_s.required String endpointName,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    _s.validateStringLength(
      'endpointName',
      endpointName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointName',
      endpointName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointName': endpointName,
      },
    );
  }

  /// Deletes an endpoint configuration. The <code>DeleteEndpointConfig</code>
  /// API deletes only the specified configuration. It does not delete endpoints
  /// created using the configuration.
  ///
  /// Parameter [endpointConfigName] :
  /// The name of the endpoint configuration that you want to delete.
  Future<void> deleteEndpointConfig({
    @_s.required String endpointConfigName,
  }) async {
    ArgumentError.checkNotNull(endpointConfigName, 'endpointConfigName');
    _s.validateStringLength(
      'endpointConfigName',
      endpointConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointConfigName',
      endpointConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteEndpointConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointConfigName': endpointConfigName,
      },
    );
  }

  /// Deletes an Amazon SageMaker experiment. All trials associated with the
  /// experiment must be deleted first. Use the <a>ListTrials</a> API to get a
  /// list of the trials associated with the experiment.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [experimentName] :
  /// The name of the experiment to delete.
  Future<DeleteExperimentResponse> deleteExperiment({
    @_s.required String experimentName,
  }) async {
    ArgumentError.checkNotNull(experimentName, 'experimentName');
    _s.validateStringLength(
      'experimentName',
      experimentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'experimentName',
      experimentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteExperiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExperimentName': experimentName,
      },
    );

    return DeleteExperimentResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified flow definition.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [flowDefinitionName] :
  /// The name of the flow definition you are deleting.
  Future<void> deleteFlowDefinition({
    @_s.required String flowDefinitionName,
  }) async {
    ArgumentError.checkNotNull(flowDefinitionName, 'flowDefinitionName');
    _s.validateStringLength(
      'flowDefinitionName',
      flowDefinitionName,
      1,
      63,
    );
    _s.validateStringPattern(
      'flowDefinitionName',
      flowDefinitionName,
      r'''^[a-z0-9](-*[a-z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteFlowDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlowDefinitionName': flowDefinitionName,
      },
    );

    return DeleteFlowDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a model. The <code>DeleteModel</code> API deletes only the model
  /// entry that was created in Amazon SageMaker when you called the
  /// <a>CreateModel</a> API. It does not delete model artifacts, inference
  /// code, or the IAM role that you specified when creating the model.
  ///
  /// Parameter [modelName] :
  /// The name of the model to delete.
  Future<void> deleteModel({
    @_s.required String modelName,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    _s.validateStringLength(
      'modelName',
      modelName,
      0,
      63,
    );
    _s.validateStringPattern(
      'modelName',
      modelName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );
  }

  /// Deletes a model package.
  ///
  /// A model package is used to create Amazon SageMaker models or list on AWS
  /// Marketplace. Buyers can subscribe to model packages listed on AWS
  /// Marketplace to create models in Amazon SageMaker.
  ///
  /// Parameter [modelPackageName] :
  /// The name of the model package. The name must have 1 to 63 characters.
  /// Valid characters are a-z, A-Z, 0-9, and - (hyphen).
  Future<void> deleteModelPackage({
    @_s.required String modelPackageName,
  }) async {
    ArgumentError.checkNotNull(modelPackageName, 'modelPackageName');
    _s.validateStringLength(
      'modelPackageName',
      modelPackageName,
      1,
      63,
    );
    _s.validateStringPattern(
      'modelPackageName',
      modelPackageName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteModelPackage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelPackageName': modelPackageName,
      },
    );
  }

  /// Deletes a monitoring schedule. Also stops the schedule had not already
  /// been stopped. This does not delete the job execution history of the
  /// monitoring schedule.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [monitoringScheduleName] :
  /// The name of the monitoring schedule to delete.
  Future<void> deleteMonitoringSchedule({
    @_s.required String monitoringScheduleName,
  }) async {
    ArgumentError.checkNotNull(
        monitoringScheduleName, 'monitoringScheduleName');
    _s.validateStringLength(
      'monitoringScheduleName',
      monitoringScheduleName,
      1,
      63,
    );
    _s.validateStringPattern(
      'monitoringScheduleName',
      monitoringScheduleName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteMonitoringSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitoringScheduleName': monitoringScheduleName,
      },
    );
  }

  /// Deletes an Amazon SageMaker notebook instance. Before you can delete a
  /// notebook instance, you must call the <code>StopNotebookInstance</code>
  /// API.
  /// <important>
  /// When you delete a notebook instance, you lose all of your data. Amazon
  /// SageMaker removes the ML compute instance, and deletes the ML storage
  /// volume and the network interface associated with the notebook instance.
  /// </important>
  ///
  /// Parameter [notebookInstanceName] :
  /// The name of the Amazon SageMaker notebook instance to delete.
  Future<void> deleteNotebookInstance({
    @_s.required String notebookInstanceName,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceName, 'notebookInstanceName');
    _s.validateStringLength(
      'notebookInstanceName',
      notebookInstanceName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceName',
      notebookInstanceName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteNotebookInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceName': notebookInstanceName,
      },
    );
  }

  /// Deletes a notebook instance lifecycle configuration.
  ///
  /// Parameter [notebookInstanceLifecycleConfigName] :
  /// The name of the lifecycle configuration to delete.
  Future<void> deleteNotebookInstanceLifecycleConfig({
    @_s.required String notebookInstanceLifecycleConfigName,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceLifecycleConfigName,
        'notebookInstanceLifecycleConfigName');
    _s.validateStringLength(
      'notebookInstanceLifecycleConfigName',
      notebookInstanceLifecycleConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceLifecycleConfigName',
      notebookInstanceLifecycleConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteNotebookInstanceLifecycleConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceLifecycleConfigName':
            notebookInstanceLifecycleConfigName,
      },
    );
  }

  /// Deletes the specified tags from an Amazon SageMaker resource.
  ///
  /// To list a resource's tags, use the <code>ListTags</code> API.
  /// <note>
  /// When you call this API to delete tags from a hyperparameter tuning job,
  /// the deleted tags are not removed from training jobs that the
  /// hyperparameter tuning job launched before you called this API.
  /// </note>
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags you want to
  /// delete.
  ///
  /// Parameter [tagKeys] :
  /// An array or one or more tag keys to delete.
  Future<void> deleteTags({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:.*''',
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );

    return DeleteTagsOutput.fromJson(jsonResponse.body);
  }

  /// Deletes the specified trial. All trial components that make up the trial
  /// must be deleted first. Use the <a>DescribeTrialComponent</a> API to get
  /// the list of trial components.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trialName] :
  /// The name of the trial to delete.
  Future<DeleteTrialResponse> deleteTrial({
    @_s.required String trialName,
  }) async {
    ArgumentError.checkNotNull(trialName, 'trialName');
    _s.validateStringLength(
      'trialName',
      trialName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialName',
      trialName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteTrial'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialName': trialName,
      },
    );

    return DeleteTrialResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified trial component. A trial component must be
  /// disassociated from all trials before the trial component can be deleted.
  /// To disassociate a trial component from a trial, call the
  /// <a>DisassociateTrialComponent</a> API.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trialComponentName] :
  /// The name of the component to delete.
  Future<DeleteTrialComponentResponse> deleteTrialComponent({
    @_s.required String trialComponentName,
  }) async {
    ArgumentError.checkNotNull(trialComponentName, 'trialComponentName');
    _s.validateStringLength(
      'trialComponentName',
      trialComponentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialComponentName',
      trialComponentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteTrialComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialComponentName': trialComponentName,
      },
    );

    return DeleteTrialComponentResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a user profile.
  ///
  /// May throw [ResourceInUse].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [userProfileName] :
  /// The user profile name.
  Future<void> deleteUserProfile({
    @_s.required String domainId,
    @_s.required String userProfileName,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    ArgumentError.checkNotNull(userProfileName, 'userProfileName');
    _s.validateStringLength(
      'userProfileName',
      userProfileName,
      0,
      63,
    );
    _s.validateStringPattern(
      'userProfileName',
      userProfileName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'UserProfileName': userProfileName,
      },
    );
  }

  /// Deletes an existing work team. This operation can't be undone.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [workteamName] :
  /// The name of the work team to delete.
  Future<DeleteWorkteamResponse> deleteWorkteam({
    @_s.required String workteamName,
  }) async {
    ArgumentError.checkNotNull(workteamName, 'workteamName');
    _s.validateStringLength(
      'workteamName',
      workteamName,
      1,
      63,
    );
    _s.validateStringPattern(
      'workteamName',
      workteamName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DeleteWorkteam'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkteamName': workteamName,
      },
    );

    return DeleteWorkteamResponse.fromJson(jsonResponse.body);
  }

  /// Returns a description of the specified algorithm that is in your account.
  ///
  /// Parameter [algorithmName] :
  /// The name of the algorithm to describe.
  Future<DescribeAlgorithmOutput> describeAlgorithm({
    @_s.required String algorithmName,
  }) async {
    ArgumentError.checkNotNull(algorithmName, 'algorithmName');
    _s.validateStringLength(
      'algorithmName',
      algorithmName,
      1,
      170,
    );
    _s.validateStringPattern(
      'algorithmName',
      algorithmName,
      r'''(arn:aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:[a-z\-]*\/)?([a-zA-Z0-9]([a-zA-Z0-9-]){0,62})(?<!-)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeAlgorithm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AlgorithmName': algorithmName,
      },
    );

    return DescribeAlgorithmOutput.fromJson(jsonResponse.body);
  }

  /// Describes the app.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [appName] :
  /// The name of the app.
  ///
  /// Parameter [appType] :
  /// The type of app.
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [userProfileName] :
  /// The user profile name.
  Future<DescribeAppResponse> describeApp({
    @_s.required String appName,
    @_s.required AppType appType,
    @_s.required String domainId,
    @_s.required String userProfileName,
  }) async {
    ArgumentError.checkNotNull(appName, 'appName');
    _s.validateStringLength(
      'appName',
      appName,
      0,
      63,
    );
    _s.validateStringPattern(
      'appName',
      appName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(appType, 'appType');
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    ArgumentError.checkNotNull(userProfileName, 'userProfileName');
    _s.validateStringLength(
      'userProfileName',
      userProfileName,
      0,
      63,
    );
    _s.validateStringPattern(
      'userProfileName',
      userProfileName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AppName': appName,
        'AppType': appType,
        'DomainId': domainId,
        'UserProfileName': userProfileName,
      },
    );

    return DescribeAppResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about an Amazon SageMaker job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [autoMLJobName] :
  /// Request information about a job using that job's unique name.
  Future<DescribeAutoMLJobResponse> describeAutoMLJob({
    @_s.required String autoMLJobName,
  }) async {
    ArgumentError.checkNotNull(autoMLJobName, 'autoMLJobName');
    _s.validateStringLength(
      'autoMLJobName',
      autoMLJobName,
      1,
      32,
    );
    _s.validateStringPattern(
      'autoMLJobName',
      autoMLJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeAutoMLJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoMLJobName': autoMLJobName,
      },
    );

    return DescribeAutoMLJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets details about the specified Git repository.
  ///
  /// Parameter [codeRepositoryName] :
  /// The name of the Git repository to describe.
  Future<DescribeCodeRepositoryOutput> describeCodeRepository({
    @_s.required String codeRepositoryName,
  }) async {
    ArgumentError.checkNotNull(codeRepositoryName, 'codeRepositoryName');
    _s.validateStringLength(
      'codeRepositoryName',
      codeRepositoryName,
      1,
      63,
    );
    _s.validateStringPattern(
      'codeRepositoryName',
      codeRepositoryName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeCodeRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CodeRepositoryName': codeRepositoryName,
      },
    );

    return DescribeCodeRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Returns information about a model compilation job.
  ///
  /// To create a model compilation job, use <a>CreateCompilationJob</a>. To get
  /// information about multiple model compilation jobs, use
  /// <a>ListCompilationJobs</a>.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [compilationJobName] :
  /// The name of the model compilation job that you want information about.
  Future<DescribeCompilationJobResponse> describeCompilationJob({
    @_s.required String compilationJobName,
  }) async {
    ArgumentError.checkNotNull(compilationJobName, 'compilationJobName');
    _s.validateStringLength(
      'compilationJobName',
      compilationJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'compilationJobName',
      compilationJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeCompilationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CompilationJobName': compilationJobName,
      },
    );

    return DescribeCompilationJobResponse.fromJson(jsonResponse.body);
  }

  /// The desciption of the domain.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  Future<DescribeDomainResponse> describeDomain({
    @_s.required String domainId,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
      },
    );

    return DescribeDomainResponse.fromJson(jsonResponse.body);
  }

  /// Returns the description of an endpoint.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint.
  Future<DescribeEndpointOutput> describeEndpoint({
    @_s.required String endpointName,
  }) async {
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    _s.validateStringLength(
      'endpointName',
      endpointName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointName',
      endpointName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointName': endpointName,
      },
    );

    return DescribeEndpointOutput.fromJson(jsonResponse.body);
  }

  /// Returns the description of an endpoint configuration created using the
  /// <code>CreateEndpointConfig</code> API.
  ///
  /// Parameter [endpointConfigName] :
  /// The name of the endpoint configuration.
  Future<DescribeEndpointConfigOutput> describeEndpointConfig({
    @_s.required String endpointConfigName,
  }) async {
    ArgumentError.checkNotNull(endpointConfigName, 'endpointConfigName');
    _s.validateStringLength(
      'endpointConfigName',
      endpointConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointConfigName',
      endpointConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeEndpointConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointConfigName': endpointConfigName,
      },
    );

    return DescribeEndpointConfigOutput.fromJson(jsonResponse.body);
  }

  /// Provides a list of an experiment's properties.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [experimentName] :
  /// The name of the experiment to describe.
  Future<DescribeExperimentResponse> describeExperiment({
    @_s.required String experimentName,
  }) async {
    ArgumentError.checkNotNull(experimentName, 'experimentName');
    _s.validateStringLength(
      'experimentName',
      experimentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'experimentName',
      experimentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeExperiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExperimentName': experimentName,
      },
    );

    return DescribeExperimentResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the specified flow definition.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [flowDefinitionName] :
  /// The name of the flow definition.
  Future<DescribeFlowDefinitionResponse> describeFlowDefinition({
    @_s.required String flowDefinitionName,
  }) async {
    ArgumentError.checkNotNull(flowDefinitionName, 'flowDefinitionName');
    _s.validateStringLength(
      'flowDefinitionName',
      flowDefinitionName,
      1,
      63,
    );
    _s.validateStringPattern(
      'flowDefinitionName',
      flowDefinitionName,
      r'''^[a-z0-9](-*[a-z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeFlowDefinition'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FlowDefinitionName': flowDefinitionName,
      },
    );

    return DescribeFlowDefinitionResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the requested human task user interface.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [humanTaskUiName] :
  /// The name of the human task user interface you want information about.
  Future<DescribeHumanTaskUiResponse> describeHumanTaskUi({
    @_s.required String humanTaskUiName,
  }) async {
    ArgumentError.checkNotNull(humanTaskUiName, 'humanTaskUiName');
    _s.validateStringLength(
      'humanTaskUiName',
      humanTaskUiName,
      1,
      63,
    );
    _s.validateStringPattern(
      'humanTaskUiName',
      humanTaskUiName,
      r'''^[a-z0-9](-*[a-z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeHumanTaskUi'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HumanTaskUiName': humanTaskUiName,
      },
    );

    return DescribeHumanTaskUiResponse.fromJson(jsonResponse.body);
  }

  /// Gets a description of a hyperparameter tuning job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [hyperParameterTuningJobName] :
  /// The name of the tuning job to describe.
  Future<DescribeHyperParameterTuningJobResponse>
      describeHyperParameterTuningJob({
    @_s.required String hyperParameterTuningJobName,
  }) async {
    ArgumentError.checkNotNull(
        hyperParameterTuningJobName, 'hyperParameterTuningJobName');
    _s.validateStringLength(
      'hyperParameterTuningJobName',
      hyperParameterTuningJobName,
      1,
      32,
    );
    _s.validateStringPattern(
      'hyperParameterTuningJobName',
      hyperParameterTuningJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeHyperParameterTuningJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HyperParameterTuningJobName': hyperParameterTuningJobName,
      },
    );

    return DescribeHyperParameterTuningJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a labeling job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [labelingJobName] :
  /// The name of the labeling job to return information for.
  Future<DescribeLabelingJobResponse> describeLabelingJob({
    @_s.required String labelingJobName,
  }) async {
    ArgumentError.checkNotNull(labelingJobName, 'labelingJobName');
    _s.validateStringLength(
      'labelingJobName',
      labelingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'labelingJobName',
      labelingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeLabelingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelingJobName': labelingJobName,
      },
    );

    return DescribeLabelingJobResponse.fromJson(jsonResponse.body);
  }

  /// Describes a model that you created using the <code>CreateModel</code> API.
  ///
  /// Parameter [modelName] :
  /// The name of the model.
  Future<DescribeModelOutput> describeModel({
    @_s.required String modelName,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    _s.validateStringLength(
      'modelName',
      modelName,
      0,
      63,
    );
    _s.validateStringPattern(
      'modelName',
      modelName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );

    return DescribeModelOutput.fromJson(jsonResponse.body);
  }

  /// Returns a description of the specified model package, which is used to
  /// create Amazon SageMaker models or list them on AWS Marketplace.
  ///
  /// To create models in Amazon SageMaker, buyers can subscribe to model
  /// packages listed on AWS Marketplace.
  ///
  /// Parameter [modelPackageName] :
  /// The name of the model package to describe.
  Future<DescribeModelPackageOutput> describeModelPackage({
    @_s.required String modelPackageName,
  }) async {
    ArgumentError.checkNotNull(modelPackageName, 'modelPackageName');
    _s.validateStringLength(
      'modelPackageName',
      modelPackageName,
      1,
      170,
    );
    _s.validateStringPattern(
      'modelPackageName',
      modelPackageName,
      r'''(arn:aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:[a-z\-]*\/)?([a-zA-Z0-9]([a-zA-Z0-9-]){0,62})(?<!-)$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeModelPackage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelPackageName': modelPackageName,
      },
    );

    return DescribeModelPackageOutput.fromJson(jsonResponse.body);
  }

  /// Describes the schedule for a monitoring job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [monitoringScheduleName] :
  /// Name of a previously created monitoring schedule.
  Future<DescribeMonitoringScheduleResponse> describeMonitoringSchedule({
    @_s.required String monitoringScheduleName,
  }) async {
    ArgumentError.checkNotNull(
        monitoringScheduleName, 'monitoringScheduleName');
    _s.validateStringLength(
      'monitoringScheduleName',
      monitoringScheduleName,
      1,
      63,
    );
    _s.validateStringPattern(
      'monitoringScheduleName',
      monitoringScheduleName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeMonitoringSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitoringScheduleName': monitoringScheduleName,
      },
    );

    return DescribeMonitoringScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a notebook instance.
  ///
  /// Parameter [notebookInstanceName] :
  /// The name of the notebook instance that you want information about.
  Future<DescribeNotebookInstanceOutput> describeNotebookInstance({
    @_s.required String notebookInstanceName,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceName, 'notebookInstanceName');
    _s.validateStringLength(
      'notebookInstanceName',
      notebookInstanceName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceName',
      notebookInstanceName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeNotebookInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceName': notebookInstanceName,
      },
    );

    return DescribeNotebookInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Returns a description of a notebook instance lifecycle configuration.
  ///
  /// For information about notebook instance lifestyle configurations, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step
  /// 2.1: (Optional) Customize a Notebook Instance</a>.
  ///
  /// Parameter [notebookInstanceLifecycleConfigName] :
  /// The name of the lifecycle configuration to describe.
  Future<DescribeNotebookInstanceLifecycleConfigOutput>
      describeNotebookInstanceLifecycleConfig({
    @_s.required String notebookInstanceLifecycleConfigName,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceLifecycleConfigName,
        'notebookInstanceLifecycleConfigName');
    _s.validateStringLength(
      'notebookInstanceLifecycleConfigName',
      notebookInstanceLifecycleConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceLifecycleConfigName',
      notebookInstanceLifecycleConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeNotebookInstanceLifecycleConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceLifecycleConfigName':
            notebookInstanceLifecycleConfigName,
      },
    );

    return DescribeNotebookInstanceLifecycleConfigOutput.fromJson(
        jsonResponse.body);
  }

  /// Returns a description of a processing job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [processingJobName] :
  /// The name of the processing job. The name must be unique within an AWS
  /// Region in the AWS account.
  Future<DescribeProcessingJobResponse> describeProcessingJob({
    @_s.required String processingJobName,
  }) async {
    ArgumentError.checkNotNull(processingJobName, 'processingJobName');
    _s.validateStringLength(
      'processingJobName',
      processingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'processingJobName',
      processingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeProcessingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProcessingJobName': processingJobName,
      },
    );

    return DescribeProcessingJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a work team provided by a vendor. It returns
  /// details about the subscription with a vendor in the AWS Marketplace.
  ///
  /// Parameter [workteamArn] :
  /// The Amazon Resource Name (ARN) of the subscribed work team to describe.
  Future<DescribeSubscribedWorkteamResponse> describeSubscribedWorkteam({
    @_s.required String workteamArn,
  }) async {
    ArgumentError.checkNotNull(workteamArn, 'workteamArn');
    _s.validateStringLength(
      'workteamArn',
      workteamArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'workteamArn',
      workteamArn,
      r'''arn:aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:workteam/.*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeSubscribedWorkteam'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkteamArn': workteamArn,
      },
    );

    return DescribeSubscribedWorkteamResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a training job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trainingJobName] :
  /// The name of the training job.
  Future<DescribeTrainingJobResponse> describeTrainingJob({
    @_s.required String trainingJobName,
  }) async {
    ArgumentError.checkNotNull(trainingJobName, 'trainingJobName');
    _s.validateStringLength(
      'trainingJobName',
      trainingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'trainingJobName',
      trainingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeTrainingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrainingJobName': trainingJobName,
      },
    );

    return DescribeTrainingJobResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a transform job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [transformJobName] :
  /// The name of the transform job that you want to view details of.
  Future<DescribeTransformJobResponse> describeTransformJob({
    @_s.required String transformJobName,
  }) async {
    ArgumentError.checkNotNull(transformJobName, 'transformJobName');
    _s.validateStringLength(
      'transformJobName',
      transformJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'transformJobName',
      transformJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeTransformJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TransformJobName': transformJobName,
      },
    );

    return DescribeTransformJobResponse.fromJson(jsonResponse.body);
  }

  /// Provides a list of a trial's properties.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trialName] :
  /// The name of the trial to describe.
  Future<DescribeTrialResponse> describeTrial({
    @_s.required String trialName,
  }) async {
    ArgumentError.checkNotNull(trialName, 'trialName');
    _s.validateStringLength(
      'trialName',
      trialName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialName',
      trialName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeTrial'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialName': trialName,
      },
    );

    return DescribeTrialResponse.fromJson(jsonResponse.body);
  }

  /// Provides a list of a trials component's properties.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trialComponentName] :
  /// The name of the trial component to describe.
  Future<DescribeTrialComponentResponse> describeTrialComponent({
    @_s.required String trialComponentName,
  }) async {
    ArgumentError.checkNotNull(trialComponentName, 'trialComponentName');
    _s.validateStringLength(
      'trialComponentName',
      trialComponentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialComponentName',
      trialComponentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeTrialComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialComponentName': trialComponentName,
      },
    );

    return DescribeTrialComponentResponse.fromJson(jsonResponse.body);
  }

  /// Describes the user profile.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [userProfileName] :
  /// The user profile name.
  Future<DescribeUserProfileResponse> describeUserProfile({
    @_s.required String domainId,
    @_s.required String userProfileName,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    ArgumentError.checkNotNull(userProfileName, 'userProfileName');
    _s.validateStringLength(
      'userProfileName',
      userProfileName,
      0,
      63,
    );
    _s.validateStringPattern(
      'userProfileName',
      userProfileName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'UserProfileName': userProfileName,
      },
    );

    return DescribeUserProfileResponse.fromJson(jsonResponse.body);
  }

  /// Lists private workforce information, including workforce name, Amazon
  /// Resource Name (ARN), and, if applicable, allowed IP address ranges (<a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>).
  /// Allowable IP address ranges are the IP addresses that workers can use to
  /// access tasks.
  /// <important>
  /// This operation applies only to private workforces.
  /// </important>
  ///
  /// Parameter [workforceName] :
  /// The name of the private workforce whose access you want to restrict.
  /// <code>WorkforceName</code> is automatically set to <code>default</code>
  /// when a workforce is created and cannot be modified.
  Future<DescribeWorkforceResponse> describeWorkforce({
    @_s.required String workforceName,
  }) async {
    ArgumentError.checkNotNull(workforceName, 'workforceName');
    _s.validateStringLength(
      'workforceName',
      workforceName,
      1,
      63,
    );
    _s.validateStringPattern(
      'workforceName',
      workforceName,
      r'''^[a-zA-Z0-9]([a-zA-Z0-9\-])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeWorkforce'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkforceName': workforceName,
      },
    );

    return DescribeWorkforceResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a specific work team. You can see information such
  /// as the create date, the last updated date, membership information, and the
  /// work team's Amazon Resource Name (ARN).
  ///
  /// Parameter [workteamName] :
  /// The name of the work team to return a description of.
  Future<DescribeWorkteamResponse> describeWorkteam({
    @_s.required String workteamName,
  }) async {
    ArgumentError.checkNotNull(workteamName, 'workteamName');
    _s.validateStringLength(
      'workteamName',
      workteamName,
      1,
      63,
    );
    _s.validateStringPattern(
      'workteamName',
      workteamName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DescribeWorkteam'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkteamName': workteamName,
      },
    );

    return DescribeWorkteamResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates a trial component from a trial. This doesn't effect other
  /// trials the component is associated with. Before you can delete a
  /// component, you must disassociate the component from all trials it is
  /// associated with. To associate a trial component with a trial, call the
  /// <a>AssociateTrialComponent</a> API.
  ///
  /// To get a list of the trials a component is associated with, use the
  /// <a>Search</a> API. Specify <code>ExperimentTrialComponent</code> for the
  /// <code>Resource</code> parameter. The list appears in the response under
  /// <code>Results.TrialComponent.Parents</code>.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trialComponentName] :
  /// The name of the component to disassociate from the trial.
  ///
  /// Parameter [trialName] :
  /// The name of the trial to disassociate from.
  Future<DisassociateTrialComponentResponse> disassociateTrialComponent({
    @_s.required String trialComponentName,
    @_s.required String trialName,
  }) async {
    ArgumentError.checkNotNull(trialComponentName, 'trialComponentName');
    _s.validateStringLength(
      'trialComponentName',
      trialComponentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialComponentName',
      trialComponentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(trialName, 'trialName');
    _s.validateStringLength(
      'trialName',
      trialName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialName',
      trialName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.DisassociateTrialComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialComponentName': trialComponentName,
        'TrialName': trialName,
      },
    );

    return DisassociateTrialComponentResponse.fromJson(jsonResponse.body);
  }

  /// An auto-complete API for the search functionality in the Amazon SageMaker
  /// console. It returns suggestions of possible matches for the property name
  /// to use in <code>Search</code> queries. Provides suggestions for
  /// <code>HyperParameters</code>, <code>Tags</code>, and <code>Metrics</code>.
  ///
  /// Parameter [resource] :
  /// The name of the Amazon SageMaker resource to search for.
  ///
  /// Parameter [suggestionQuery] :
  /// Limits the property names that are included in the response.
  Future<GetSearchSuggestionsResponse> getSearchSuggestions({
    @_s.required ResourceType resource,
    SuggestionQuery suggestionQuery,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.GetSearchSuggestions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Resource': resource,
        'SuggestionQuery': suggestionQuery,
      },
    );

    return GetSearchSuggestionsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the machine learning algorithms that have been created.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only algorithms created after the specified time
  /// (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only algorithms created before the specified time
  /// (timestamp).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of algorithms to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the algorithm name. This filter returns only algorithms whose
  /// name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the response to a previous <code>ListAlgorithms</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of algorithms, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The parameter by which to sort the results. The default is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the results. The default is <code>Ascending</code>.
  Future<ListAlgorithmsOutput> listAlgorithms({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    AlgorithmSortBy sortBy,
    SortOrder sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListAlgorithms'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListAlgorithmsOutput.fromJson(jsonResponse.body);
  }

  /// Lists apps.
  ///
  /// Parameter [domainIdEquals] :
  /// A parameter to search for the domain ID.
  ///
  /// Parameter [maxResults] :
  /// Returns a list up to a specified limit.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you will receive this token. Use
  /// it in your next request to receive the next set of results.
  ///
  /// Parameter [sortBy] :
  /// The parameter by which to sort the results. The default is CreationTime.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the results. The default is Ascending.
  ///
  /// Parameter [userProfileNameEquals] :
  /// A parameter to search by user profile name.
  Future<ListAppsResponse> listApps({
    String domainIdEquals,
    int maxResults,
    String nextToken,
    AppSortKey sortBy,
    SortOrder sortOrder,
    String userProfileNameEquals,
  }) async {
    if (domainIdEquals != null) {
      _s.validateStringLength(
        'domainIdEquals',
        domainIdEquals,
        0,
        63,
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    if (userProfileNameEquals != null) {
      _s.validateStringLength(
        'userProfileNameEquals',
        userProfileNameEquals,
        0,
        63,
      );
    }
    if (userProfileNameEquals != null) {
      _s.validateStringPattern(
        'userProfileNameEquals',
        userProfileNameEquals,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListApps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainIdEquals': domainIdEquals,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'UserProfileNameEquals': userProfileNameEquals,
      },
    );

    return ListAppsResponse.fromJson(jsonResponse.body);
  }

  /// Request a list of jobs.
  ///
  /// Parameter [creationTimeAfter] :
  /// Request a list of jobs, using a filter for time.
  ///
  /// Parameter [creationTimeBefore] :
  /// Request a list of jobs, using a filter for time.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// Request a list of jobs, using a filter for time.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// Request a list of jobs, using a filter for time.
  ///
  /// Parameter [maxResults] :
  /// Request a list of jobs up to a specified limit.
  ///
  /// Parameter [nameContains] :
  /// Request a list of jobs, using a search filter for name.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you will receive this token. Use
  /// it in your next request to receive the next set of results.
  ///
  /// Parameter [sortBy] :
  /// The parameter by which to sort the results. The default is AutoMLJobName.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the results. The default is Descending.
  ///
  /// Parameter [statusEquals] :
  /// Request a list of jobs, using a filter for status.
  Future<ListAutoMLJobsResponse> listAutoMLJobs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    AutoMLSortBy sortBy,
    AutoMLSortOrder sortOrder,
    AutoMLJobStatus statusEquals,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListAutoMLJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListAutoMLJobsResponse.fromJson(jsonResponse.body);
  }

  /// List the Candidates created for the job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [autoMLJobName] :
  /// List the Candidates created for the job by providing the job's name.
  ///
  /// Parameter [candidateNameEquals] :
  /// List the Candidates for the job and filter by candidate name.
  ///
  /// Parameter [maxResults] :
  /// List the job's Candidates up to a specified limit.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you will receive this token. Use
  /// it in your next request to receive the next set of results.
  ///
  /// Parameter [sortBy] :
  /// The parameter by which to sort the results. The default is Descending.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the results. The default is Ascending.
  ///
  /// Parameter [statusEquals] :
  /// List the Candidates for the job and filter by status.
  Future<ListCandidatesForAutoMLJobResponse> listCandidatesForAutoMLJob({
    @_s.required String autoMLJobName,
    String candidateNameEquals,
    int maxResults,
    String nextToken,
    CandidateSortBy sortBy,
    AutoMLSortOrder sortOrder,
    CandidateStatus statusEquals,
  }) async {
    ArgumentError.checkNotNull(autoMLJobName, 'autoMLJobName');
    _s.validateStringLength(
      'autoMLJobName',
      autoMLJobName,
      1,
      32,
    );
    _s.validateStringPattern(
      'autoMLJobName',
      autoMLJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (candidateNameEquals != null) {
      _s.validateStringLength(
        'candidateNameEquals',
        candidateNameEquals,
        1,
        64,
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListCandidatesForAutoMLJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoMLJobName': autoMLJobName,
        'CandidateNameEquals': candidateNameEquals,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListCandidatesForAutoMLJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the Git repositories in your account.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only Git repositories that were created after the
  /// specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only Git repositories that were created before the
  /// specified time.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only Git repositories that were last modified after
  /// the specified time.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only Git repositories that were last modified before
  /// the specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Git repositories to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the Git repositories name. This filter returns only
  /// repositories whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of a <code>ListCodeRepositoriesOutput</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To get the next
  /// set of Git repositories, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>Name</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  Future<ListCodeRepositoriesOutput> listCodeRepositories({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    CodeRepositorySortBy sortBy,
    CodeRepositorySortOrder sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListCodeRepositories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListCodeRepositoriesOutput.fromJson(jsonResponse.body);
  }

  /// Lists model compilation jobs that satisfy various filters.
  ///
  /// To create a model compilation job, use <a>CreateCompilationJob</a>. To get
  /// information about a particular model compilation job you have created, use
  /// <a>DescribeCompilationJob</a>.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns the model compilation jobs that were created after a
  /// specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns the model compilation jobs that were created before
  /// a specified time.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns the model compilation jobs that were modified after
  /// a specified time.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns the model compilation jobs that were modified before
  /// a specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of model compilation jobs to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A filter that returns the model compilation jobs whose name contains a
  /// specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListCompilationJobs</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of model compilation jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field by which to sort results. The default is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that retrieves model compilation jobs with a specific
  /// <a>DescribeCompilationJobResponse$CompilationJobStatus</a> status.
  Future<ListCompilationJobsResponse> listCompilationJobs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    ListCompilationJobsSortBy sortBy,
    SortOrder sortOrder,
    CompilationJobStatus statusEquals,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListCompilationJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListCompilationJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the domains.
  ///
  /// Parameter [maxResults] :
  /// Returns a list up to a specified limit.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you will receive this token. Use
  /// it in your next request to receive the next set of results.
  Future<ListDomainsResponse> listDomains({
    int maxResults,
    String nextToken,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListDomains'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListDomainsResponse.fromJson(jsonResponse.body);
  }

  /// Lists endpoint configurations.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only endpoint configurations with a creation time
  /// greater than or equal to the specified time (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only endpoint configurations created before the
  /// specified time (timestamp).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of training jobs to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the endpoint configuration name. This filter returns only
  /// endpoint configurations whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListEndpointConfig</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of endpoint configurations, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Descending</code>.
  Future<ListEndpointConfigsOutput> listEndpointConfigs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    EndpointConfigSortKey sortBy,
    OrderKey sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListEndpointConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListEndpointConfigsOutput.fromJson(jsonResponse.body);
  }

  /// Lists endpoints.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only endpoints with a creation time greater than or
  /// equal to the specified time (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only endpoints that were created before the
  /// specified time (timestamp).
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only endpoints that were modified after the
  /// specified timestamp.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only endpoints that were modified before the
  /// specified timestamp.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of endpoints to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in endpoint names. This filter returns only endpoints whose name
  /// contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of a <code>ListEndpoints</code> request was truncated, the
  /// response includes a <code>NextToken</code>. To retrieve the next set of
  /// endpoints, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// Sorts the list of results. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Descending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that returns only endpoints with the specified status.
  Future<ListEndpointsOutput> listEndpoints({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    EndpointSortKey sortBy,
    OrderKey sortOrder,
    EndpointStatus statusEquals,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListEndpoints'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListEndpointsOutput.fromJson(jsonResponse.body);
  }

  /// Lists all the experiments in your account. The list can be filtered to
  /// show only experiments that were created in a specific time range. The list
  /// can be sorted by experiment name or creation time.
  ///
  /// Parameter [createdAfter] :
  /// A filter that returns only experiments created after the specified time.
  ///
  /// Parameter [createdBefore] :
  /// A filter that returns only experiments created before the specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of experiments to return in the response. The default
  /// value is 10.
  ///
  /// Parameter [nextToken] :
  /// If the previous call to <code>ListExperiments</code> didn't return the
  /// full set of experiments, the call returns a token for getting the next set
  /// of experiments.
  ///
  /// Parameter [sortBy] :
  /// The property used to sort results. The default value is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order. The default value is <code>Descending</code>.
  Future<ListExperimentsResponse> listExperiments({
    DateTime createdAfter,
    DateTime createdBefore,
    int maxResults,
    String nextToken,
    SortExperimentsBy sortBy,
    SortOrder sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListExperiments'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreatedAfter': createdAfter,
        'CreatedBefore': createdBefore,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListExperimentsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the flow definitions in your account.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only flow definitions with a creation time greater
  /// than or equal to the specified timestamp.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only flow definitions that were created before the
  /// specified timestamp.
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return. If the total number of available
  /// items is more than the value specified in <code>MaxResults</code>, then a
  /// <code>NextToken</code> will be provided in the output that you can use to
  /// resume pagination.
  ///
  /// Parameter [nextToken] :
  /// A token to resume pagination.
  ///
  /// Parameter [sortOrder] :
  /// An optional value that specifies whether you want the results sorted in
  /// <code>Ascending</code> or <code>Descending</code> order.
  Future<ListFlowDefinitionsResponse> listFlowDefinitions({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    int maxResults,
    String nextToken,
    SortOrder sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListFlowDefinitions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortOrder': sortOrder,
      },
    );

    return ListFlowDefinitionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about the human task user interfaces in your account.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only human task user interfaces with a creation time
  /// greater than or equal to the specified timestamp.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only human task user interfaces that were created
  /// before the specified timestamp.
  ///
  /// Parameter [maxResults] :
  /// The total number of items to return. If the total number of available
  /// items is more than the value specified in <code>MaxResults</code>, then a
  /// <code>NextToken</code> will be provided in the output that you can use to
  /// resume pagination.
  ///
  /// Parameter [nextToken] :
  /// A token to resume pagination.
  ///
  /// Parameter [sortOrder] :
  /// An optional value that specifies whether you want the results sorted in
  /// <code>Ascending</code> or <code>Descending</code> order.
  Future<ListHumanTaskUisResponse> listHumanTaskUis({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    int maxResults,
    String nextToken,
    SortOrder sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListHumanTaskUis'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortOrder': sortOrder,
      },
    );

    return ListHumanTaskUisResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of <a>HyperParameterTuningJobSummary</a> objects that describe
  /// the hyperparameter tuning jobs launched in your account.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only tuning jobs that were created after the
  /// specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only tuning jobs that were created before the
  /// specified time.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only tuning jobs that were modified after the
  /// specified time.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only tuning jobs that were modified before the
  /// specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of tuning jobs to return. The default value is 10.
  ///
  /// Parameter [nameContains] :
  /// A string in the tuning job name. This filter returns only tuning jobs
  /// whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListHyperParameterTuningJobs</code>
  /// request was truncated, the response includes a <code>NextToken</code>. To
  /// retrieve the next set of tuning jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>Name</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that returns only tuning jobs with the specified status.
  Future<ListHyperParameterTuningJobsResponse> listHyperParameterTuningJobs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    HyperParameterTuningJobSortByOptions sortBy,
    SortOrder sortOrder,
    HyperParameterTuningJobStatus statusEquals,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListHyperParameterTuningJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListHyperParameterTuningJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of labeling jobs.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only labeling jobs created after the specified time
  /// (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only labeling jobs created before the specified time
  /// (timestamp).
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only labeling jobs modified after the specified time
  /// (timestamp).
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only labeling jobs modified before the specified
  /// time (timestamp).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of labeling jobs to return in each page of the
  /// response.
  ///
  /// Parameter [nameContains] :
  /// A string in the labeling job name. This filter returns only labeling jobs
  /// whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListLabelingJobs</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of labeling jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that retrieves only labeling jobs with a specific status.
  Future<ListLabelingJobsResponse> listLabelingJobs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    SortBy sortBy,
    SortOrder sortOrder,
    LabelingJobStatus statusEquals,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListLabelingJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListLabelingJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of labeling jobs assigned to a specified work team.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [workteamArn] :
  /// The Amazon Resource Name (ARN) of the work team for which you want to see
  /// labeling jobs for.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only labeling jobs created after the specified time
  /// (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only labeling jobs created before the specified time
  /// (timestamp).
  ///
  /// Parameter [jobReferenceCodeContains] :
  /// A filter the limits jobs to only the ones whose job reference code
  /// contains the specified string.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of labeling jobs to return in each page of the
  /// response.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListLabelingJobsForWorkteam</code>
  /// request was truncated, the response includes a <code>NextToken</code>. To
  /// retrieve the next set of labeling jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  Future<ListLabelingJobsForWorkteamResponse> listLabelingJobsForWorkteam({
    @_s.required String workteamArn,
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    String jobReferenceCodeContains,
    int maxResults,
    String nextToken,
    ListLabelingJobsForWorkteamSortByOptions sortBy,
    SortOrder sortOrder,
  }) async {
    ArgumentError.checkNotNull(workteamArn, 'workteamArn');
    _s.validateStringLength(
      'workteamArn',
      workteamArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'workteamArn',
      workteamArn,
      r'''arn:aws[a-z\-]*:sagemaker:[a-z0-9\-]*:[0-9]{12}:workteam/.*''',
    );
    if (jobReferenceCodeContains != null) {
      _s.validateStringLength(
        'jobReferenceCodeContains',
        jobReferenceCodeContains,
        1,
        255,
      );
    }
    if (jobReferenceCodeContains != null) {
      _s.validateStringPattern(
        'jobReferenceCodeContains',
        jobReferenceCodeContains,
        r'''.+''',
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListLabelingJobsForWorkteam'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkteamArn': workteamArn,
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'JobReferenceCodeContains': jobReferenceCodeContains,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListLabelingJobsForWorkteamResponse.fromJson(jsonResponse.body);
  }

  /// Lists the model packages that have been created.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only model packages created after the specified time
  /// (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only model packages created before the specified
  /// time (timestamp).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of model packages to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the model package name. This filter returns only model
  /// packages whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the response to a previous <code>ListModelPackages</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of model packages, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The parameter by which to sort the results. The default is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the results. The default is <code>Ascending</code>.
  Future<ListModelPackagesOutput> listModelPackages({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    ModelPackageSortBy sortBy,
    SortOrder sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListModelPackages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListModelPackagesOutput.fromJson(jsonResponse.body);
  }

  /// Lists models created with the <a>CreateModel</a> API.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only models with a creation time greater than or
  /// equal to the specified time (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only models created before the specified time
  /// (timestamp).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of models to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the training job name. This filter returns only models in the
  /// training job whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the response to a previous <code>ListModels</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of models, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// Sorts the list of results. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Descending</code>.
  Future<ListModelsOutput> listModels({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    ModelSortKey sortBy,
    OrderKey sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListModels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListModelsOutput.fromJson(jsonResponse.body);
  }

  /// Returns list of all monitoring job executions.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only jobs created after a specified time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only jobs created before a specified time.
  ///
  /// Parameter [endpointName] :
  /// Name of a specific endpoint to fetch jobs for.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only jobs modified before a specified time.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only jobs modified after a specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return in the response. The default value is
  /// 10.
  ///
  /// Parameter [monitoringScheduleName] :
  /// Name of a specific schedule to fetch jobs for.
  ///
  /// Parameter [nextToken] :
  /// The token returned if the response is truncated. To retrieve the next set
  /// of job executions, use it in the next request.
  ///
  /// Parameter [scheduledTimeAfter] :
  /// Filter for jobs scheduled after a specified time.
  ///
  /// Parameter [scheduledTimeBefore] :
  /// Filter for jobs scheduled before a specified time.
  ///
  /// Parameter [sortBy] :
  /// Whether to sort results by <code>Status</code>, <code>CreationTime</code>,
  /// <code>ScheduledTime</code> field. The default is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// Whether to sort the results in <code>Ascending</code> or
  /// <code>Descending</code> order. The default is <code>Descending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that retrieves only jobs with a specific status.
  Future<ListMonitoringExecutionsResponse> listMonitoringExecutions({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    String endpointName,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String monitoringScheduleName,
    String nextToken,
    DateTime scheduledTimeAfter,
    DateTime scheduledTimeBefore,
    MonitoringExecutionSortKey sortBy,
    SortOrder sortOrder,
    ExecutionStatus statusEquals,
  }) async {
    if (endpointName != null) {
      _s.validateStringLength(
        'endpointName',
        endpointName,
        0,
        63,
      );
    }
    if (endpointName != null) {
      _s.validateStringPattern(
        'endpointName',
        endpointName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (monitoringScheduleName != null) {
      _s.validateStringLength(
        'monitoringScheduleName',
        monitoringScheduleName,
        1,
        63,
      );
    }
    if (monitoringScheduleName != null) {
      _s.validateStringPattern(
        'monitoringScheduleName',
        monitoringScheduleName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListMonitoringExecutions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'EndpointName': endpointName,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'MonitoringScheduleName': monitoringScheduleName,
        'NextToken': nextToken,
        'ScheduledTimeAfter': scheduledTimeAfter,
        'ScheduledTimeBefore': scheduledTimeBefore,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListMonitoringExecutionsResponse.fromJson(jsonResponse.body);
  }

  /// Returns list of all monitoring schedules.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only monitoring schedules created after a specified
  /// time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only monitoring schedules created before a specified
  /// time.
  ///
  /// Parameter [endpointName] :
  /// Name of a specific endpoint to fetch schedules for.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only monitoring schedules modified after a specified
  /// time.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only monitoring schedules modified before a
  /// specified time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return in the response. The default value is
  /// 10.
  ///
  /// Parameter [nameContains] :
  /// Filter for monitoring schedules whose name contains a specified string.
  ///
  /// Parameter [nextToken] :
  /// The token returned if the response is truncated. To retrieve the next set
  /// of job executions, use it in the next request.
  ///
  /// Parameter [sortBy] :
  /// Whether to sort results by <code>Status</code>, <code>CreationTime</code>,
  /// <code>ScheduledTime</code> field. The default is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// Whether to sort the results in <code>Ascending</code> or
  /// <code>Descending</code> order. The default is <code>Descending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that returns only monitoring schedules modified before a
  /// specified time.
  Future<ListMonitoringSchedulesResponse> listMonitoringSchedules({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    String endpointName,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    MonitoringScheduleSortKey sortBy,
    SortOrder sortOrder,
    ScheduleStatus statusEquals,
  }) async {
    if (endpointName != null) {
      _s.validateStringLength(
        'endpointName',
        endpointName,
        0,
        63,
      );
    }
    if (endpointName != null) {
      _s.validateStringPattern(
        'endpointName',
        endpointName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListMonitoringSchedules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'EndpointName': endpointName,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListMonitoringSchedulesResponse.fromJson(jsonResponse.body);
  }

  /// Lists notebook instance lifestyle configurations created with the
  /// <a>CreateNotebookInstanceLifecycleConfig</a> API.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only lifecycle configurations that were created
  /// after the specified time (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only lifecycle configurations that were created
  /// before the specified time (timestamp).
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only lifecycle configurations that were modified
  /// after the specified time (timestamp).
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only lifecycle configurations that were modified
  /// before the specified time (timestamp).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of lifecycle configurations to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the lifecycle configuration name. This filter returns only
  /// lifecycle configurations whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of a <code>ListNotebookInstanceLifecycleConfigs</code>
  /// request was truncated, the response includes a <code>NextToken</code>. To
  /// get the next set of lifecycle configurations, use the token in the next
  /// request.
  ///
  /// Parameter [sortBy] :
  /// Sorts the list of results. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results.
  Future<ListNotebookInstanceLifecycleConfigsOutput>
      listNotebookInstanceLifecycleConfigs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    NotebookInstanceLifecycleConfigSortKey sortBy,
    NotebookInstanceLifecycleConfigSortOrder sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListNotebookInstanceLifecycleConfigs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListNotebookInstanceLifecycleConfigsOutput.fromJson(
        jsonResponse.body);
  }

  /// Returns a list of the Amazon SageMaker notebook instances in the
  /// requester's account in an AWS Region.
  ///
  /// Parameter [additionalCodeRepositoryEquals] :
  /// A filter that returns only notebook instances with associated with the
  /// specified git repository.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only notebook instances that were created after the
  /// specified time (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only notebook instances that were created before the
  /// specified time (timestamp).
  ///
  /// Parameter [defaultCodeRepositoryContains] :
  /// A string in the name or URL of a Git repository associated with this
  /// notebook instance. This filter returns only notebook instances associated
  /// with a git repository with a name that contains the specified string.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only notebook instances that were modified after the
  /// specified time (timestamp).
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only notebook instances that were modified before
  /// the specified time (timestamp).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of notebook instances to return.
  ///
  /// Parameter [nameContains] :
  /// A string in the notebook instances' name. This filter returns only
  /// notebook instances whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the previous call to the <code>ListNotebookInstances</code> is
  /// truncated, the response includes a <code>NextToken</code>. You can use
  /// this token in your subsequent <code>ListNotebookInstances</code> request
  /// to fetch the next set of notebook instances.
  /// <note>
  /// You might specify a filter or a sort order in your request. When response
  /// is truncated, you must use the same values for the filer and sort order in
  /// the next request.
  /// </note>
  ///
  /// Parameter [notebookInstanceLifecycleConfigNameContains] :
  /// A string in the name of a notebook instances lifecycle configuration
  /// associated with this notebook instance. This filter returns only notebook
  /// instances associated with a lifecycle configuration with a name that
  /// contains the specified string.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>Name</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results.
  ///
  /// Parameter [statusEquals] :
  /// A filter that returns only notebook instances with the specified status.
  Future<ListNotebookInstancesOutput> listNotebookInstances({
    String additionalCodeRepositoryEquals,
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    String defaultCodeRepositoryContains,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    String notebookInstanceLifecycleConfigNameContains,
    NotebookInstanceSortKey sortBy,
    NotebookInstanceSortOrder sortOrder,
    NotebookInstanceStatus statusEquals,
  }) async {
    if (additionalCodeRepositoryEquals != null) {
      _s.validateStringLength(
        'additionalCodeRepositoryEquals',
        additionalCodeRepositoryEquals,
        1,
        1024,
      );
    }
    if (additionalCodeRepositoryEquals != null) {
      _s.validateStringPattern(
        'additionalCodeRepositoryEquals',
        additionalCodeRepositoryEquals,
        r'''^https://([^/]+)/?(.*)$|^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (defaultCodeRepositoryContains != null) {
      _s.validateStringLength(
        'defaultCodeRepositoryContains',
        defaultCodeRepositoryContains,
        0,
        1024,
      );
    }
    if (defaultCodeRepositoryContains != null) {
      _s.validateStringPattern(
        'defaultCodeRepositoryContains',
        defaultCodeRepositoryContains,
        r'''[a-zA-Z0-9-]+''',
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    if (notebookInstanceLifecycleConfigNameContains != null) {
      _s.validateStringLength(
        'notebookInstanceLifecycleConfigNameContains',
        notebookInstanceLifecycleConfigNameContains,
        0,
        63,
      );
    }
    if (notebookInstanceLifecycleConfigNameContains != null) {
      _s.validateStringPattern(
        'notebookInstanceLifecycleConfigNameContains',
        notebookInstanceLifecycleConfigNameContains,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListNotebookInstances'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AdditionalCodeRepositoryEquals': additionalCodeRepositoryEquals,
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'DefaultCodeRepositoryContains': defaultCodeRepositoryContains,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'NotebookInstanceLifecycleConfigNameContains':
            notebookInstanceLifecycleConfigNameContains,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListNotebookInstancesOutput.fromJson(jsonResponse.body);
  }

  /// Lists processing jobs that satisfy various filters.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only processing jobs created after the specified
  /// time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only processing jobs created after the specified
  /// time.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only processing jobs modified after the specified
  /// time.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only processing jobs modified before the specified
  /// time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of processing jobs to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the processing job name. This filter returns only processing
  /// jobs whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListProcessingJobs</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of processing jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that retrieves only processing jobs with a specific status.
  Future<ListProcessingJobsResponse> listProcessingJobs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    SortBy sortBy,
    SortOrder sortOrder,
    ProcessingJobStatus statusEquals,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListProcessingJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListProcessingJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the work teams that you are subscribed to in the AWS
  /// Marketplace. The list may be empty if no work team satisfies the filter
  /// specified in the <code>NameContains</code> parameter.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of work teams to return in each page of the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the work team name. This filter returns only work teams whose
  /// name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListSubscribedWorkteams</code> request
  /// was truncated, the response includes a <code>NextToken</code>. To retrieve
  /// the next set of labeling jobs, use the token in the next request.
  Future<ListSubscribedWorkteamsResponse> listSubscribedWorkteams({
    int maxResults,
    String nameContains,
    String nextToken,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        1,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListSubscribedWorkteams'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
      },
    );

    return ListSubscribedWorkteamsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the tags for the specified Amazon SageMaker resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags you want to
  /// retrieve.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of tags to return.
  ///
  /// Parameter [nextToken] :
  /// If the response to the previous <code>ListTags</code> request is
  /// truncated, Amazon SageMaker returns this token. To retrieve the next set
  /// of tags, use it in the subsequent request.
  Future<ListTagsOutput> listTags({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      0,
      256,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:.*''',
    );
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        50,
        1152921504606846976,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'MaxResults': maxResults,
        'NextToken': nextToken,
      },
    );

    return ListTagsOutput.fromJson(jsonResponse.body);
  }

  /// Lists training jobs.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only training jobs created after the specified time
  /// (timestamp).
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only training jobs created before the specified time
  /// (timestamp).
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only training jobs modified after the specified time
  /// (timestamp).
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only training jobs modified before the specified
  /// time (timestamp).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of training jobs to return in the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the training job name. This filter returns only training jobs
  /// whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListTrainingJobs</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of training jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that retrieves only training jobs with a specific status.
  Future<ListTrainingJobsResponse> listTrainingJobs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    SortBy sortBy,
    SortOrder sortOrder,
    TrainingJobStatus statusEquals,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListTrainingJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListTrainingJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of <a>TrainingJobSummary</a> objects that describe the
  /// training jobs that a hyperparameter tuning job launched.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [hyperParameterTuningJobName] :
  /// The name of the tuning job whose training jobs you want to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of training jobs to return. The default value is 10.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous
  /// <code>ListTrainingJobsForHyperParameterTuningJob</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of training jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>Name</code>.
  ///
  /// If the value of this field is <code>FinalObjectiveMetricValue</code>, any
  /// training jobs that did not return an objective metric are not listed.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that returns only training jobs with the specified status.
  Future<ListTrainingJobsForHyperParameterTuningJobResponse>
      listTrainingJobsForHyperParameterTuningJob({
    @_s.required String hyperParameterTuningJobName,
    int maxResults,
    String nextToken,
    TrainingJobSortByOptions sortBy,
    SortOrder sortOrder,
    TrainingJobStatus statusEquals,
  }) async {
    ArgumentError.checkNotNull(
        hyperParameterTuningJobName, 'hyperParameterTuningJobName');
    _s.validateStringLength(
      'hyperParameterTuningJobName',
      hyperParameterTuningJobName,
      1,
      32,
    );
    _s.validateStringPattern(
      'hyperParameterTuningJobName',
      hyperParameterTuningJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListTrainingJobsForHyperParameterTuningJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HyperParameterTuningJobName': hyperParameterTuningJobName,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListTrainingJobsForHyperParameterTuningJobResponse.fromJson(
        jsonResponse.body);
  }

  /// Lists transform jobs.
  ///
  /// Parameter [creationTimeAfter] :
  /// A filter that returns only transform jobs created after the specified
  /// time.
  ///
  /// Parameter [creationTimeBefore] :
  /// A filter that returns only transform jobs created before the specified
  /// time.
  ///
  /// Parameter [lastModifiedTimeAfter] :
  /// A filter that returns only transform jobs modified after the specified
  /// time.
  ///
  /// Parameter [lastModifiedTimeBefore] :
  /// A filter that returns only transform jobs modified before the specified
  /// time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of transform jobs to return in the response. The
  /// default value is <code>10</code>.
  ///
  /// Parameter [nameContains] :
  /// A string in the transform job name. This filter returns only transform
  /// jobs whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListTransformJobs</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of transform jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Descending</code>.
  ///
  /// Parameter [statusEquals] :
  /// A filter that retrieves only transform jobs with a specific status.
  Future<ListTransformJobsResponse> listTransformJobs({
    DateTime creationTimeAfter,
    DateTime creationTimeBefore,
    DateTime lastModifiedTimeAfter,
    DateTime lastModifiedTimeBefore,
    int maxResults,
    String nameContains,
    String nextToken,
    SortBy sortBy,
    SortOrder sortOrder,
    TransformJobStatus statusEquals,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        0,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''[a-zA-Z0-9\-]+''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListTransformJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreationTimeAfter': creationTimeAfter,
        'CreationTimeBefore': creationTimeBefore,
        'LastModifiedTimeAfter': lastModifiedTimeAfter,
        'LastModifiedTimeBefore': lastModifiedTimeBefore,
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'StatusEquals': statusEquals,
      },
    );

    return ListTransformJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the trial components in your account. You can sort the list by trial
  /// component name or creation time. You can filter the list to show only
  /// components that were created in a specific time range. You can also filter
  /// on one of the following:
  ///
  /// <ul>
  /// <li>
  /// <code>ExperimentName</code>
  /// </li>
  /// <li>
  /// <code>SourceArn</code>
  /// </li>
  /// <li>
  /// <code>TrialName</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [createdAfter] :
  /// A filter that returns only components created after the specified time.
  ///
  /// Parameter [createdBefore] :
  /// A filter that returns only components created before the specified time.
  ///
  /// Parameter [experimentName] :
  /// A filter that returns only components that are part of the specified
  /// experiment. If you specify <code>ExperimentName</code>, you can't filter
  /// by <code>SourceArn</code> or <code>TrialName</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of components to return in the response. The default
  /// value is 10.
  ///
  /// Parameter [nextToken] :
  /// If the previous call to <code>ListTrialComponents</code> didn't return the
  /// full set of components, the call returns a token for getting the next set
  /// of components.
  ///
  /// Parameter [sortBy] :
  /// The property used to sort results. The default value is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order. The default value is <code>Descending</code>.
  ///
  /// Parameter [sourceArn] :
  /// A filter that returns only components that have the specified source
  /// Amazon Resource Name (ARN). If you specify <code>SourceArn</code>, you
  /// can't filter by <code>ExperimentName</code> or <code>TrialName</code>.
  ///
  /// Parameter [trialName] :
  /// A filter that returns only components that are part of the specified
  /// trial. If you specify <code>TrialName</code>, you can't filter by
  /// <code>ExperimentName</code> or <code>SourceArn</code>.
  Future<ListTrialComponentsResponse> listTrialComponents({
    DateTime createdAfter,
    DateTime createdBefore,
    String experimentName,
    int maxResults,
    String nextToken,
    SortTrialComponentsBy sortBy,
    SortOrder sortOrder,
    String sourceArn,
    String trialName,
  }) async {
    if (experimentName != null) {
      _s.validateStringLength(
        'experimentName',
        experimentName,
        1,
        82,
      );
    }
    if (experimentName != null) {
      _s.validateStringPattern(
        'experimentName',
        experimentName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    if (sourceArn != null) {
      _s.validateStringLength(
        'sourceArn',
        sourceArn,
        0,
        256,
      );
    }
    if (trialName != null) {
      _s.validateStringLength(
        'trialName',
        trialName,
        1,
        82,
      );
    }
    if (trialName != null) {
      _s.validateStringPattern(
        'trialName',
        trialName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListTrialComponents'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreatedAfter': createdAfter,
        'CreatedBefore': createdBefore,
        'ExperimentName': experimentName,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'SourceArn': sourceArn,
        'TrialName': trialName,
      },
    );

    return ListTrialComponentsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the trials in your account. Specify an experiment name to limit the
  /// list to the trials that are part of that experiment. Specify a trial
  /// component name to limit the list to the trials that associated with that
  /// trial component. The list can be filtered to show only trials that were
  /// created in a specific time range. The list can be sorted by trial name or
  /// creation time.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [createdAfter] :
  /// A filter that returns only trials created after the specified time.
  ///
  /// Parameter [createdBefore] :
  /// A filter that returns only trials created before the specified time.
  ///
  /// Parameter [experimentName] :
  /// A filter that returns only trials that are part of the specified
  /// experiment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of trials to return in the response. The default value
  /// is 10.
  ///
  /// Parameter [nextToken] :
  /// If the previous call to <code>ListTrials</code> didn't return the full set
  /// of trials, the call returns a token for getting the next set of trials.
  ///
  /// Parameter [sortBy] :
  /// The property used to sort results. The default value is
  /// <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order. The default value is <code>Descending</code>.
  ///
  /// Parameter [trialComponentName] :
  /// A filter that returns only trials that are associated with the specified
  /// trial component.
  Future<ListTrialsResponse> listTrials({
    DateTime createdAfter,
    DateTime createdBefore,
    String experimentName,
    int maxResults,
    String nextToken,
    SortTrialsBy sortBy,
    SortOrder sortOrder,
    String trialComponentName,
  }) async {
    if (experimentName != null) {
      _s.validateStringLength(
        'experimentName',
        experimentName,
        1,
        82,
      );
    }
    if (experimentName != null) {
      _s.validateStringPattern(
        'experimentName',
        experimentName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    if (trialComponentName != null) {
      _s.validateStringLength(
        'trialComponentName',
        trialComponentName,
        1,
        82,
      );
    }
    if (trialComponentName != null) {
      _s.validateStringPattern(
        'trialComponentName',
        trialComponentName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListTrials'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CreatedAfter': createdAfter,
        'CreatedBefore': createdBefore,
        'ExperimentName': experimentName,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'TrialComponentName': trialComponentName,
      },
    );

    return ListTrialsResponse.fromJson(jsonResponse.body);
  }

  /// Lists user profiles.
  ///
  /// Parameter [domainIdEquals] :
  /// A parameter by which to filter the results.
  ///
  /// Parameter [maxResults] :
  /// Returns a list up to a specified limit.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was truncated, you will receive this token. Use
  /// it in your next request to receive the next set of results.
  ///
  /// Parameter [sortBy] :
  /// The parameter by which to sort the results. The default is CreationTime.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for the results. The default is Ascending.
  ///
  /// Parameter [userProfileNameContains] :
  /// A parameter by which to filter the results.
  Future<ListUserProfilesResponse> listUserProfiles({
    String domainIdEquals,
    int maxResults,
    String nextToken,
    UserProfileSortKey sortBy,
    SortOrder sortOrder,
    String userProfileNameContains,
  }) async {
    if (domainIdEquals != null) {
      _s.validateStringLength(
        'domainIdEquals',
        domainIdEquals,
        0,
        63,
      );
    }
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    if (userProfileNameContains != null) {
      _s.validateStringLength(
        'userProfileNameContains',
        userProfileNameContains,
        0,
        63,
      );
    }
    if (userProfileNameContains != null) {
      _s.validateStringPattern(
        'userProfileNameContains',
        userProfileNameContains,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListUserProfiles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainIdEquals': domainIdEquals,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
        'UserProfileNameContains': userProfileNameContains,
      },
    );

    return ListUserProfilesResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of work teams that you have defined in a region. The list may
  /// be empty if no work team satisfies the filter specified in the
  /// <code>NameContains</code> parameter.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of work teams to return in each page of the response.
  ///
  /// Parameter [nameContains] :
  /// A string in the work team's name. This filter returns only work teams
  /// whose name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous <code>ListWorkteams</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of labeling jobs, use the token in the next request.
  ///
  /// Parameter [sortBy] :
  /// The field to sort results by. The default is <code>CreationTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// The sort order for results. The default is <code>Ascending</code>.
  Future<ListWorkteamsResponse> listWorkteams({
    int maxResults,
    String nameContains,
    String nextToken,
    ListWorkteamsSortByOptions sortBy,
    SortOrder sortOrder,
  }) async {
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nameContains != null) {
      _s.validateStringLength(
        'nameContains',
        nameContains,
        1,
        63,
      );
    }
    if (nameContains != null) {
      _s.validateStringPattern(
        'nameContains',
        nameContains,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.ListWorkteams'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MaxResults': maxResults,
        'NameContains': nameContains,
        'NextToken': nextToken,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return ListWorkteamsResponse.fromJson(jsonResponse.body);
  }

  /// Renders the UI template so that you can preview the worker's experience.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) that has access to the S3 objects that are
  /// used by the template.
  ///
  /// Parameter [task] :
  /// A <code>RenderableTask</code> object containing a representative task to
  /// render.
  ///
  /// Parameter [uiTemplate] :
  /// A <code>Template</code> object containing the worker UI template to
  /// render.
  Future<RenderUiTemplateResponse> renderUiTemplate({
    @_s.required String roleArn,
    @_s.required RenderableTask task,
    @_s.required UiTemplate uiTemplate,
  }) async {
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      20,
      2048,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
    );
    ArgumentError.checkNotNull(task, 'task');
    ArgumentError.checkNotNull(uiTemplate, 'uiTemplate');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.RenderUiTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'RoleArn': roleArn,
        'Task': task,
        'UiTemplate': uiTemplate,
      },
    );

    return RenderUiTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Finds Amazon SageMaker resources that match a search query. Matching
  /// resources are returned as a list of <code>SearchRecord</code> objects in
  /// the response. You can sort the search results by any resource property in
  /// a ascending or descending order.
  ///
  /// You can query against the following value types: numeric, text, Boolean,
  /// and timestamp.
  ///
  /// Parameter [resource] :
  /// The name of the Amazon SageMaker resource to search for.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// If more than <code>MaxResults</code> resources match the specified
  /// <code>SearchExpression</code>, the response includes a
  /// <code>NextToken</code>. The <code>NextToken</code> can be passed to the
  /// next <code>SearchRequest</code> to continue retrieving results.
  ///
  /// Parameter [searchExpression] :
  /// A Boolean conditional statement. Resources must satisfy this condition to
  /// be included in search results. You must provide at least one
  /// subexpression, filter, or nested filter. The maximum number of recursive
  /// <code>SubExpressions</code>, <code>NestedFilters</code>, and
  /// <code>Filters</code> that can be included in a
  /// <code>SearchExpression</code> object is 50.
  ///
  /// Parameter [sortBy] :
  /// The name of the resource property used to sort the
  /// <code>SearchResults</code>. The default is <code>LastModifiedTime</code>.
  ///
  /// Parameter [sortOrder] :
  /// How <code>SearchResults</code> are ordered. Valid values are
  /// <code>Ascending</code> or <code>Descending</code>. The default is
  /// <code>Descending</code>.
  Future<SearchResponse> search({
    @_s.required ResourceType resource,
    int maxResults,
    String nextToken,
    SearchExpression searchExpression,
    String sortBy,
    SearchSortOrder sortOrder,
  }) async {
    ArgumentError.checkNotNull(resource, 'resource');
    if (maxResults != null) {
      _s.validateNumRange(
        'maxResults',
        maxResults,
        1,
        100,
      );
    }
    if (nextToken != null) {
      _s.validateStringLength(
        'nextToken',
        nextToken,
        0,
        8192,
      );
    }
    if (nextToken != null) {
      _s.validateStringPattern(
        'nextToken',
        nextToken,
        r'''.*''',
      );
    }
    if (sortBy != null) {
      _s.validateStringLength(
        'sortBy',
        sortBy,
        1,
        255,
      );
    }
    if (sortBy != null) {
      _s.validateStringPattern(
        'sortBy',
        sortBy,
        r'''.+''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.Search'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Resource': resource,
        'MaxResults': maxResults,
        'NextToken': nextToken,
        'SearchExpression': searchExpression,
        'SortBy': sortBy,
        'SortOrder': sortOrder,
      },
    );

    return SearchResponse.fromJson(jsonResponse.body);
  }

  /// Starts a previously stopped monitoring schedule.
  /// <note>
  /// New monitoring schedules are immediately started after creation.
  /// </note>
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [monitoringScheduleName] :
  /// The name of the schedule to start.
  Future<void> startMonitoringSchedule({
    @_s.required String monitoringScheduleName,
  }) async {
    ArgumentError.checkNotNull(
        monitoringScheduleName, 'monitoringScheduleName');
    _s.validateStringLength(
      'monitoringScheduleName',
      monitoringScheduleName,
      1,
      63,
    );
    _s.validateStringPattern(
      'monitoringScheduleName',
      monitoringScheduleName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StartMonitoringSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitoringScheduleName': monitoringScheduleName,
      },
    );
  }

  /// Launches an ML compute instance with the latest version of the libraries
  /// and attaches your ML storage volume. After configuring the notebook
  /// instance, Amazon SageMaker sets the notebook instance status to
  /// <code>InService</code>. A notebook instance's status must be
  /// <code>InService</code> before you can connect to your Jupyter notebook.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [notebookInstanceName] :
  /// The name of the notebook instance to start.
  Future<void> startNotebookInstance({
    @_s.required String notebookInstanceName,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceName, 'notebookInstanceName');
    _s.validateStringLength(
      'notebookInstanceName',
      notebookInstanceName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceName',
      notebookInstanceName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StartNotebookInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceName': notebookInstanceName,
      },
    );
  }

  /// A method for forcing the termination of a running job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [autoMLJobName] :
  /// The name of the object you are requesting.
  Future<void> stopAutoMLJob({
    @_s.required String autoMLJobName,
  }) async {
    ArgumentError.checkNotNull(autoMLJobName, 'autoMLJobName');
    _s.validateStringLength(
      'autoMLJobName',
      autoMLJobName,
      1,
      32,
    );
    _s.validateStringPattern(
      'autoMLJobName',
      autoMLJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopAutoMLJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AutoMLJobName': autoMLJobName,
      },
    );
  }

  /// Stops a model compilation job.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal.
  /// This gracefully shuts the job down. If the job hasn't stopped, it sends
  /// the SIGKILL signal.
  ///
  /// When it receives a <code>StopCompilationJob</code> request, Amazon
  /// SageMaker changes the <a>CompilationJobSummary$CompilationJobStatus</a> of
  /// the job to <code>Stopping</code>. After Amazon SageMaker stops the job, it
  /// sets the <a>CompilationJobSummary$CompilationJobStatus</a> to
  /// <code>Stopped</code>.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [compilationJobName] :
  /// The name of the model compilation job to stop.
  Future<void> stopCompilationJob({
    @_s.required String compilationJobName,
  }) async {
    ArgumentError.checkNotNull(compilationJobName, 'compilationJobName');
    _s.validateStringLength(
      'compilationJobName',
      compilationJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'compilationJobName',
      compilationJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopCompilationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CompilationJobName': compilationJobName,
      },
    );
  }

  /// Stops a running hyperparameter tuning job and all running training jobs
  /// that the tuning job launched.
  ///
  /// All model artifacts output from the training jobs are stored in Amazon
  /// Simple Storage Service (Amazon S3). All data that the training jobs write
  /// to Amazon CloudWatch Logs are still available in CloudWatch. After the
  /// tuning job moves to the <code>Stopped</code> state, it releases all
  /// reserved resources for the tuning job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [hyperParameterTuningJobName] :
  /// The name of the tuning job to stop.
  Future<void> stopHyperParameterTuningJob({
    @_s.required String hyperParameterTuningJobName,
  }) async {
    ArgumentError.checkNotNull(
        hyperParameterTuningJobName, 'hyperParameterTuningJobName');
    _s.validateStringLength(
      'hyperParameterTuningJobName',
      hyperParameterTuningJobName,
      1,
      32,
    );
    _s.validateStringPattern(
      'hyperParameterTuningJobName',
      hyperParameterTuningJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopHyperParameterTuningJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'HyperParameterTuningJobName': hyperParameterTuningJobName,
      },
    );
  }

  /// Stops a running labeling job. A job that is stopped cannot be restarted.
  /// Any results obtained before the job is stopped are placed in the Amazon S3
  /// output bucket.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [labelingJobName] :
  /// The name of the labeling job to stop.
  Future<void> stopLabelingJob({
    @_s.required String labelingJobName,
  }) async {
    ArgumentError.checkNotNull(labelingJobName, 'labelingJobName');
    _s.validateStringLength(
      'labelingJobName',
      labelingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'labelingJobName',
      labelingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopLabelingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LabelingJobName': labelingJobName,
      },
    );
  }

  /// Stops a previously started monitoring schedule.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [monitoringScheduleName] :
  /// The name of the schedule to stop.
  Future<void> stopMonitoringSchedule({
    @_s.required String monitoringScheduleName,
  }) async {
    ArgumentError.checkNotNull(
        monitoringScheduleName, 'monitoringScheduleName');
    _s.validateStringLength(
      'monitoringScheduleName',
      monitoringScheduleName,
      1,
      63,
    );
    _s.validateStringPattern(
      'monitoringScheduleName',
      monitoringScheduleName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopMonitoringSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitoringScheduleName': monitoringScheduleName,
      },
    );
  }

  /// Terminates the ML compute instance. Before terminating the instance,
  /// Amazon SageMaker disconnects the ML storage volume from it. Amazon
  /// SageMaker preserves the ML storage volume. Amazon SageMaker stops charging
  /// you for the ML compute instance when you call
  /// <code>StopNotebookInstance</code>.
  ///
  /// To access data on the ML storage volume for a notebook instance that has
  /// been terminated, call the <code>StartNotebookInstance</code> API.
  /// <code>StartNotebookInstance</code> launches another ML compute instance,
  /// configures it, and attaches the preserved ML storage volume so you can
  /// continue your work.
  ///
  /// Parameter [notebookInstanceName] :
  /// The name of the notebook instance to terminate.
  Future<void> stopNotebookInstance({
    @_s.required String notebookInstanceName,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceName, 'notebookInstanceName');
    _s.validateStringLength(
      'notebookInstanceName',
      notebookInstanceName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceName',
      notebookInstanceName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopNotebookInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceName': notebookInstanceName,
      },
    );
  }

  /// Stops a processing job.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [processingJobName] :
  /// The name of the processing job to stop.
  Future<void> stopProcessingJob({
    @_s.required String processingJobName,
  }) async {
    ArgumentError.checkNotNull(processingJobName, 'processingJobName');
    _s.validateStringLength(
      'processingJobName',
      processingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'processingJobName',
      processingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopProcessingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProcessingJobName': processingJobName,
      },
    );
  }

  /// Stops a training job. To stop a job, Amazon SageMaker sends the algorithm
  /// the <code>SIGTERM</code> signal, which delays job termination for 120
  /// seconds. Algorithms might use this 120-second window to save the model
  /// artifacts, so the results of the training is not lost.
  ///
  /// When it receives a <code>StopTrainingJob</code> request, Amazon SageMaker
  /// changes the status of the job to <code>Stopping</code>. After Amazon
  /// SageMaker stops the job, it sets the status to <code>Stopped</code>.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trainingJobName] :
  /// The name of the training job to stop.
  Future<void> stopTrainingJob({
    @_s.required String trainingJobName,
  }) async {
    ArgumentError.checkNotNull(trainingJobName, 'trainingJobName');
    _s.validateStringLength(
      'trainingJobName',
      trainingJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'trainingJobName',
      trainingJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopTrainingJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrainingJobName': trainingJobName,
      },
    );
  }

  /// Stops a transform job.
  ///
  /// When Amazon SageMaker receives a <code>StopTransformJob</code> request,
  /// the status of the job changes to <code>Stopping</code>. After Amazon
  /// SageMaker stops the job, the status is set to <code>Stopped</code>. When
  /// you stop a transform job before it is completed, Amazon SageMaker doesn't
  /// store the job's output in Amazon S3.
  ///
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [transformJobName] :
  /// The name of the transform job to stop.
  Future<void> stopTransformJob({
    @_s.required String transformJobName,
  }) async {
    ArgumentError.checkNotNull(transformJobName, 'transformJobName');
    _s.validateStringLength(
      'transformJobName',
      transformJobName,
      1,
      63,
    );
    _s.validateStringPattern(
      'transformJobName',
      transformJobName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.StopTransformJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TransformJobName': transformJobName,
      },
    );
  }

  /// Updates the specified Git repository with the specified values.
  ///
  /// Parameter [codeRepositoryName] :
  /// The name of the Git repository to update.
  ///
  /// Parameter [gitConfig] :
  /// The configuration of the git repository, including the URL and the Amazon
  /// Resource Name (ARN) of the AWS Secrets Manager secret that contains the
  /// credentials used to access the repository. The secret must have a staging
  /// label of <code>AWSCURRENT</code> and must be in the following format:
  ///
  /// <code>{"username": <i>UserName</i>, "password": <i>Password</i>}</code>
  Future<UpdateCodeRepositoryOutput> updateCodeRepository({
    @_s.required String codeRepositoryName,
    GitConfigForUpdate gitConfig,
  }) async {
    ArgumentError.checkNotNull(codeRepositoryName, 'codeRepositoryName');
    _s.validateStringLength(
      'codeRepositoryName',
      codeRepositoryName,
      1,
      63,
    );
    _s.validateStringPattern(
      'codeRepositoryName',
      codeRepositoryName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateCodeRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CodeRepositoryName': codeRepositoryName,
        'GitConfig': gitConfig,
      },
    );

    return UpdateCodeRepositoryOutput.fromJson(jsonResponse.body);
  }

  /// Updates a domain. Changes will impact all of the people in the domain.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceInUse].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [defaultUserSettings] :
  /// A collection of settings.
  Future<UpdateDomainResponse> updateDomain({
    @_s.required String domainId,
    UserSettings defaultUserSettings,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateDomain'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'DefaultUserSettings': defaultUserSettings,
      },
    );

    return UpdateDomainResponse.fromJson(jsonResponse.body);
  }

  /// Deploys the new <code>EndpointConfig</code> specified in the request,
  /// switches to using newly created endpoint, and then deletes resources
  /// provisioned for the endpoint using the previous
  /// <code>EndpointConfig</code> (there is no availability loss).
  ///
  /// When Amazon SageMaker receives the request, it sets the endpoint status to
  /// <code>Updating</code>. After updating the endpoint, it sets the status to
  /// <code>InService</code>. To check the status of an endpoint, use the
  /// <a>DescribeEndpoint</a> API.
  /// <note>
  /// You must not delete an <code>EndpointConfig</code> in use by an endpoint
  /// that is live or while the <code>UpdateEndpoint</code> or
  /// <code>CreateEndpoint</code> operations are being performed on the
  /// endpoint. To update an endpoint, you must create a new
  /// <code>EndpointConfig</code>.
  /// </note>
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [endpointConfigName] :
  /// The name of the new endpoint configuration.
  ///
  /// Parameter [endpointName] :
  /// The name of the endpoint whose configuration you want to update.
  ///
  /// Parameter [excludeRetainedVariantProperties] :
  /// When you are updating endpoint resources with
  /// <a>UpdateEndpointInput$RetainAllVariantProperties</a>, whose value is set
  /// to <code>true</code>, <code>ExcludeRetainedVariantProperties</code>
  /// specifies the list of type <a>VariantProperty</a> to override with the
  /// values provided by <code>EndpointConfig</code>. If you don't specify a
  /// value for <code>ExcludeAllVariantProperties</code>, no variant properties
  /// are overridden.
  ///
  /// Parameter [retainAllVariantProperties] :
  /// When updating endpoint resources, enables or disables the retention of
  /// variant properties, such as the instance count or the variant weight. To
  /// retain the variant properties of an endpoint when updating it, set
  /// <code>RetainAllVariantProperties</code> to <code>true</code>. To use the
  /// variant properties specified in a new <code>EndpointConfig</code> call
  /// when updating an endpoint, set <code>RetainAllVariantProperties</code> to
  /// <code>false</code>.
  Future<UpdateEndpointOutput> updateEndpoint({
    @_s.required String endpointConfigName,
    @_s.required String endpointName,
    List<VariantProperty> excludeRetainedVariantProperties,
    bool retainAllVariantProperties,
  }) async {
    ArgumentError.checkNotNull(endpointConfigName, 'endpointConfigName');
    _s.validateStringLength(
      'endpointConfigName',
      endpointConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointConfigName',
      endpointConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    _s.validateStringLength(
      'endpointName',
      endpointName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointName',
      endpointName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (excludeRetainedVariantProperties != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateEndpoint'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EndpointConfigName': endpointConfigName,
        'EndpointName': endpointName,
        'ExcludeRetainedVariantProperties': excludeRetainedVariantProperties,
        'RetainAllVariantProperties': retainAllVariantProperties,
      },
    );

    return UpdateEndpointOutput.fromJson(jsonResponse.body);
  }

  /// Updates variant weight of one or more variants associated with an existing
  /// endpoint, or capacity of one variant associated with an existing endpoint.
  /// When it receives the request, Amazon SageMaker sets the endpoint status to
  /// <code>Updating</code>. After updating the endpoint, it sets the status to
  /// <code>InService</code>. To check the status of an endpoint, use the
  /// <a>DescribeEndpoint</a> API.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [desiredWeightsAndCapacities] :
  /// An object that provides new capacity and weight values for a variant.
  ///
  /// Parameter [endpointName] :
  /// The name of an existing Amazon SageMaker endpoint.
  Future<UpdateEndpointWeightsAndCapacitiesOutput>
      updateEndpointWeightsAndCapacities({
    @_s.required List<DesiredWeightAndCapacity> desiredWeightsAndCapacities,
    @_s.required String endpointName,
  }) async {
    ArgumentError.checkNotNull(
        desiredWeightsAndCapacities, 'desiredWeightsAndCapacities');
    ArgumentError.checkNotNull(endpointName, 'endpointName');
    _s.validateStringLength(
      'endpointName',
      endpointName,
      0,
      63,
    );
    _s.validateStringPattern(
      'endpointName',
      endpointName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateEndpointWeightsAndCapacities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DesiredWeightsAndCapacities': desiredWeightsAndCapacities,
        'EndpointName': endpointName,
      },
    );

    return UpdateEndpointWeightsAndCapacitiesOutput.fromJson(jsonResponse.body);
  }

  /// Adds, updates, or removes the description of an experiment. Updates the
  /// display name of an experiment.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [experimentName] :
  /// The name of the experiment to update.
  ///
  /// Parameter [description] :
  /// The description of the experiment.
  ///
  /// Parameter [displayName] :
  /// The name of the experiment as displayed. The name doesn't need to be
  /// unique. If <code>DisplayName</code> isn't specified,
  /// <code>ExperimentName</code> is displayed.
  Future<UpdateExperimentResponse> updateExperiment({
    @_s.required String experimentName,
    String description,
    String displayName,
  }) async {
    ArgumentError.checkNotNull(experimentName, 'experimentName');
    _s.validateStringLength(
      'experimentName',
      experimentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'experimentName',
      experimentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (description != null) {
      _s.validateStringLength(
        'description',
        description,
        0,
        3072,
      );
    }
    if (description != null) {
      _s.validateStringPattern(
        'description',
        description,
        r'''.*''',
      );
    }
    if (displayName != null) {
      _s.validateStringLength(
        'displayName',
        displayName,
        1,
        82,
      );
    }
    if (displayName != null) {
      _s.validateStringPattern(
        'displayName',
        displayName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateExperiment'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ExperimentName': experimentName,
        'Description': description,
        'DisplayName': displayName,
      },
    );

    return UpdateExperimentResponse.fromJson(jsonResponse.body);
  }

  /// Updates a previously created schedule.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [monitoringScheduleConfig] :
  /// The configuration object that specifies the monitoring schedule and
  /// defines the monitoring job.
  ///
  /// Parameter [monitoringScheduleName] :
  /// The name of the monitoring schedule. The name must be unique within an AWS
  /// Region within an AWS account.
  Future<UpdateMonitoringScheduleResponse> updateMonitoringSchedule({
    @_s.required MonitoringScheduleConfig monitoringScheduleConfig,
    @_s.required String monitoringScheduleName,
  }) async {
    ArgumentError.checkNotNull(
        monitoringScheduleConfig, 'monitoringScheduleConfig');
    ArgumentError.checkNotNull(
        monitoringScheduleName, 'monitoringScheduleName');
    _s.validateStringLength(
      'monitoringScheduleName',
      monitoringScheduleName,
      1,
      63,
    );
    _s.validateStringPattern(
      'monitoringScheduleName',
      monitoringScheduleName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateMonitoringSchedule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MonitoringScheduleConfig': monitoringScheduleConfig,
        'MonitoringScheduleName': monitoringScheduleName,
      },
    );

    return UpdateMonitoringScheduleResponse.fromJson(jsonResponse.body);
  }

  /// Updates a notebook instance. NotebookInstance updates include upgrading or
  /// downgrading the ML compute instance used for your notebook instance to
  /// accommodate changes in your workload requirements.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [notebookInstanceName] :
  /// The name of the notebook instance to update.
  ///
  /// Parameter [acceleratorTypes] :
  /// A list of the Elastic Inference (EI) instance types to associate with this
  /// notebook instance. Currently only one EI instance type can be associated
  /// with a notebook instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html">Using
  /// Elastic Inference in Amazon SageMaker</a>.
  ///
  /// Parameter [additionalCodeRepositories] :
  /// An array of up to three Git repositories to associate with the notebook
  /// instance. These can be either the names of Git repositories stored as
  /// resources in your account, or the URL of Git repositories in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository. These repositories are
  /// cloned at the same level as the default repository of your notebook
  /// instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating
  /// Git Repositories with Amazon SageMaker Notebook Instances</a>.
  ///
  /// Parameter [defaultCodeRepository] :
  /// The Git repository to associate with the notebook instance as its default
  /// code repository. This can be either the name of a Git repository stored as
  /// a resource in your account, or the URL of a Git repository in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository. When you open a notebook
  /// instance, it opens in the directory that contains this repository. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating
  /// Git Repositories with Amazon SageMaker Notebook Instances</a>.
  ///
  /// Parameter [disassociateAcceleratorTypes] :
  /// A list of the Elastic Inference (EI) instance types to remove from this
  /// notebook instance. This operation is idempotent. If you specify an
  /// accelerator type that is not associated with the notebook instance when
  /// you call this method, it does not throw an error.
  ///
  /// Parameter [disassociateAdditionalCodeRepositories] :
  /// A list of names or URLs of the default Git repositories to remove from
  /// this notebook instance. This operation is idempotent. If you specify a Git
  /// repository that is not associated with the notebook instance when you call
  /// this method, it does not throw an error.
  ///
  /// Parameter [disassociateDefaultCodeRepository] :
  /// The name or URL of the default Git repository to remove from this notebook
  /// instance. This operation is idempotent. If you specify a Git repository
  /// that is not associated with the notebook instance when you call this
  /// method, it does not throw an error.
  ///
  /// Parameter [disassociateLifecycleConfig] :
  /// Set to <code>true</code> to remove the notebook instance lifecycle
  /// configuration currently associated with the notebook instance. This
  /// operation is idempotent. If you specify a lifecycle configuration that is
  /// not associated with the notebook instance when you call this method, it
  /// does not throw an error.
  ///
  /// Parameter [instanceType] :
  /// The Amazon ML compute instance type.
  ///
  /// Parameter [lifecycleConfigName] :
  /// The name of a lifecycle configuration to associate with the notebook
  /// instance. For information about lifestyle configurations, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step
  /// 2.1: (Optional) Customize a Notebook Instance</a>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that Amazon SageMaker can
  /// assume to access the notebook instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-roles.html">Amazon
  /// SageMaker Roles</a>.
  /// <note>
  /// To be able to pass this role to Amazon SageMaker, the caller of this API
  /// must have the <code>iam:PassRole</code> permission.
  /// </note>
  ///
  /// Parameter [rootAccess] :
  /// Whether root access is enabled or disabled for users of the notebook
  /// instance. The default value is <code>Enabled</code>.
  /// <note>
  /// If you set this to <code>Disabled</code>, users don't have root access on
  /// the notebook instance, but lifecycle configuration scripts still run with
  /// root permissions.
  /// </note>
  ///
  /// Parameter [volumeSizeInGB] :
  /// The size, in GB, of the ML storage volume to attach to the notebook
  /// instance. The default value is 5 GB. ML storage volumes are encrypted, so
  /// Amazon SageMaker can't determine the amount of available free space on the
  /// volume. Because of this, you can increase the volume size when you update
  /// a notebook instance, but you can't decrease the volume size. If you want
  /// to decrease the size of the ML storage volume in use, create a new
  /// notebook instance with the desired size.
  Future<void> updateNotebookInstance({
    @_s.required String notebookInstanceName,
    List<String> acceleratorTypes,
    List<String> additionalCodeRepositories,
    String defaultCodeRepository,
    bool disassociateAcceleratorTypes,
    bool disassociateAdditionalCodeRepositories,
    bool disassociateDefaultCodeRepository,
    bool disassociateLifecycleConfig,
    InstanceType instanceType,
    String lifecycleConfigName,
    String roleArn,
    RootAccess rootAccess,
    int volumeSizeInGB,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceName, 'notebookInstanceName');
    _s.validateStringLength(
      'notebookInstanceName',
      notebookInstanceName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceName',
      notebookInstanceName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (additionalCodeRepositories != null) {}
    if (defaultCodeRepository != null) {
      _s.validateStringLength(
        'defaultCodeRepository',
        defaultCodeRepository,
        1,
        1024,
      );
    }
    if (defaultCodeRepository != null) {
      _s.validateStringPattern(
        'defaultCodeRepository',
        defaultCodeRepository,
        r'''^https://([^/]+)/?(.*)$|^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (lifecycleConfigName != null) {
      _s.validateStringLength(
        'lifecycleConfigName',
        lifecycleConfigName,
        0,
        63,
      );
    }
    if (lifecycleConfigName != null) {
      _s.validateStringPattern(
        'lifecycleConfigName',
        lifecycleConfigName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (roleArn != null) {
      _s.validateStringLength(
        'roleArn',
        roleArn,
        20,
        2048,
      );
    }
    if (roleArn != null) {
      _s.validateStringPattern(
        'roleArn',
        roleArn,
        r'''^arn:aws[a-z\-]*:iam::\d{12}:role/?[a-zA-Z_0-9+=,.@\-_/]+$''',
      );
    }
    if (volumeSizeInGB != null) {
      _s.validateNumRange(
        'volumeSizeInGB',
        volumeSizeInGB,
        5,
        16384,
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateNotebookInstance'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceName': notebookInstanceName,
        'AcceleratorTypes': acceleratorTypes,
        'AdditionalCodeRepositories': additionalCodeRepositories,
        'DefaultCodeRepository': defaultCodeRepository,
        'DisassociateAcceleratorTypes': disassociateAcceleratorTypes,
        'DisassociateAdditionalCodeRepositories':
            disassociateAdditionalCodeRepositories,
        'DisassociateDefaultCodeRepository': disassociateDefaultCodeRepository,
        'DisassociateLifecycleConfig': disassociateLifecycleConfig,
        'InstanceType': instanceType,
        'LifecycleConfigName': lifecycleConfigName,
        'RoleArn': roleArn,
        'RootAccess': rootAccess,
        'VolumeSizeInGB': volumeSizeInGB,
      },
    );

    return UpdateNotebookInstanceOutput.fromJson(jsonResponse.body);
  }

  /// Updates a notebook instance lifecycle configuration created with the
  /// <a>CreateNotebookInstanceLifecycleConfig</a> API.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [notebookInstanceLifecycleConfigName] :
  /// The name of the lifecycle configuration.
  ///
  /// Parameter [onCreate] :
  /// The shell script that runs only once, when you create a notebook instance.
  /// The shell script must be a base64-encoded string.
  ///
  /// Parameter [onStart] :
  /// The shell script that runs every time you start a notebook instance,
  /// including when you create the notebook instance. The shell script must be
  /// a base64-encoded string.
  Future<void> updateNotebookInstanceLifecycleConfig({
    @_s.required String notebookInstanceLifecycleConfigName,
    List<NotebookInstanceLifecycleHook> onCreate,
    List<NotebookInstanceLifecycleHook> onStart,
  }) async {
    ArgumentError.checkNotNull(notebookInstanceLifecycleConfigName,
        'notebookInstanceLifecycleConfigName');
    _s.validateStringLength(
      'notebookInstanceLifecycleConfigName',
      notebookInstanceLifecycleConfigName,
      0,
      63,
    );
    _s.validateStringPattern(
      'notebookInstanceLifecycleConfigName',
      notebookInstanceLifecycleConfigName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (onCreate != null) {}
    if (onStart != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateNotebookInstanceLifecycleConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'NotebookInstanceLifecycleConfigName':
            notebookInstanceLifecycleConfigName,
        'OnCreate': onCreate,
        'OnStart': onStart,
      },
    );

    return UpdateNotebookInstanceLifecycleConfigOutput.fromJson(
        jsonResponse.body);
  }

  /// Updates the display name of a trial.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trialName] :
  /// The name of the trial to update.
  ///
  /// Parameter [displayName] :
  /// The name of the trial as displayed. The name doesn't need to be unique. If
  /// <code>DisplayName</code> isn't specified, <code>TrialName</code> is
  /// displayed.
  Future<UpdateTrialResponse> updateTrial({
    @_s.required String trialName,
    String displayName,
  }) async {
    ArgumentError.checkNotNull(trialName, 'trialName');
    _s.validateStringLength(
      'trialName',
      trialName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialName',
      trialName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (displayName != null) {
      _s.validateStringLength(
        'displayName',
        displayName,
        1,
        82,
      );
    }
    if (displayName != null) {
      _s.validateStringPattern(
        'displayName',
        displayName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateTrial'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialName': trialName,
        'DisplayName': displayName,
      },
    );

    return UpdateTrialResponse.fromJson(jsonResponse.body);
  }

  /// Updates one or more properties of a trial component.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [trialComponentName] :
  /// The name of the component to update.
  ///
  /// Parameter [displayName] :
  /// The name of the component as displayed. The name doesn't need to be
  /// unique. If <code>DisplayName</code> isn't specified,
  /// <code>TrialComponentName</code> is displayed.
  ///
  /// Parameter [endTime] :
  /// When the component ended.
  ///
  /// Parameter [inputArtifacts] :
  /// Replaces all of the component's input artifacts with the specified
  /// artifacts.
  ///
  /// Parameter [inputArtifactsToRemove] :
  /// The input artifacts to remove from the component.
  ///
  /// Parameter [outputArtifacts] :
  /// Replaces all of the component's output artifacts with the specified
  /// artifacts.
  ///
  /// Parameter [outputArtifactsToRemove] :
  /// The output artifacts to remove from the component.
  ///
  /// Parameter [parameters] :
  /// Replaces all of the component's hyperparameters with the specified
  /// hyperparameters.
  ///
  /// Parameter [parametersToRemove] :
  /// The hyperparameters to remove from the component.
  ///
  /// Parameter [startTime] :
  /// When the component started.
  ///
  /// Parameter [status] :
  /// The new status of the component.
  Future<UpdateTrialComponentResponse> updateTrialComponent({
    @_s.required String trialComponentName,
    String displayName,
    DateTime endTime,
    Map<String, TrialComponentArtifact> inputArtifacts,
    List<String> inputArtifactsToRemove,
    Map<String, TrialComponentArtifact> outputArtifacts,
    List<String> outputArtifactsToRemove,
    Map<String, TrialComponentParameterValue> parameters,
    List<String> parametersToRemove,
    DateTime startTime,
    TrialComponentStatus status,
  }) async {
    ArgumentError.checkNotNull(trialComponentName, 'trialComponentName');
    _s.validateStringLength(
      'trialComponentName',
      trialComponentName,
      1,
      82,
    );
    _s.validateStringPattern(
      'trialComponentName',
      trialComponentName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (displayName != null) {
      _s.validateStringLength(
        'displayName',
        displayName,
        1,
        82,
      );
    }
    if (displayName != null) {
      _s.validateStringPattern(
        'displayName',
        displayName,
        r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
      );
    }
    if (inputArtifacts != null) {}
    if (outputArtifacts != null) {}
    if (parameters != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateTrialComponent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TrialComponentName': trialComponentName,
        'DisplayName': displayName,
        'EndTime': endTime,
        'InputArtifacts': inputArtifacts,
        'InputArtifactsToRemove': inputArtifactsToRemove,
        'OutputArtifacts': outputArtifacts,
        'OutputArtifactsToRemove': outputArtifactsToRemove,
        'Parameters': parameters,
        'ParametersToRemove': parametersToRemove,
        'StartTime': startTime,
        'Status': status,
      },
    );

    return UpdateTrialComponentResponse.fromJson(jsonResponse.body);
  }

  /// Updates a user profile.
  ///
  /// May throw [ResourceLimitExceeded].
  /// May throw [ResourceInUse].
  /// May throw [ResourceNotFound].
  ///
  /// Parameter [domainId] :
  /// The domain ID.
  ///
  /// Parameter [userProfileName] :
  /// The user profile name.
  ///
  /// Parameter [userSettings] :
  /// A collection of settings.
  Future<UpdateUserProfileResponse> updateUserProfile({
    @_s.required String domainId,
    @_s.required String userProfileName,
    UserSettings userSettings,
  }) async {
    ArgumentError.checkNotNull(domainId, 'domainId');
    _s.validateStringLength(
      'domainId',
      domainId,
      0,
      63,
    );
    ArgumentError.checkNotNull(userProfileName, 'userProfileName');
    _s.validateStringLength(
      'userProfileName',
      userProfileName,
      0,
      63,
    );
    _s.validateStringPattern(
      'userProfileName',
      userProfileName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateUserProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DomainId': domainId,
        'UserProfileName': userProfileName,
        'UserSettings': userSettings,
      },
    );

    return UpdateUserProfileResponse.fromJson(jsonResponse.body);
  }

  /// Restricts access to tasks assigned to workers in the specified workforce
  /// to those within specific ranges of IP addresses. You specify allowed IP
  /// addresses by creating a list of up to four <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>.
  ///
  /// By default, a workforce isn't restricted to specific IP addresses. If you
  /// specify a range of IP addresses, workers who attempt to access tasks using
  /// any IP address outside the specified range are denied access and get a
  /// <code>Not Found</code> error message on the worker portal. After
  /// restricting access with this operation, you can see the allowed IP values
  /// for a private workforce with the operation.
  /// <important>
  /// This operation applies only to private workforces.
  /// </important>
  ///
  /// Parameter [workforceName] :
  /// The name of the private workforce whose access you want to restrict.
  /// <code>WorkforceName</code> is automatically set to <code>default</code>
  /// when a workforce is created and cannot be modified.
  ///
  /// Parameter [sourceIpConfig] :
  /// A list of one to four worker IP address ranges (<a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>)
  /// that can be used to access tasks assigned to this workforce.
  ///
  /// Maximum: Four CIDR values
  Future<UpdateWorkforceResponse> updateWorkforce({
    @_s.required String workforceName,
    SourceIpConfig sourceIpConfig,
  }) async {
    ArgumentError.checkNotNull(workforceName, 'workforceName');
    _s.validateStringLength(
      'workforceName',
      workforceName,
      1,
      63,
    );
    _s.validateStringPattern(
      'workforceName',
      workforceName,
      r'''^[a-zA-Z0-9]([a-zA-Z0-9\-])*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateWorkforce'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkforceName': workforceName,
        'SourceIpConfig': sourceIpConfig,
      },
    );

    return UpdateWorkforceResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing work team with new member definitions or description.
  ///
  /// May throw [ResourceLimitExceeded].
  ///
  /// Parameter [workteamName] :
  /// The name of the work team to update.
  ///
  /// Parameter [description] :
  /// An updated description for the work team.
  ///
  /// Parameter [memberDefinitions] :
  /// A list of <code>MemberDefinition</code> objects that contain the updated
  /// work team members.
  ///
  /// Parameter [notificationConfiguration] :
  /// Configures SNS topic notifications for available or expiring work items
  Future<UpdateWorkteamResponse> updateWorkteam({
    @_s.required String workteamName,
    String description,
    List<MemberDefinition> memberDefinitions,
    NotificationConfiguration notificationConfiguration,
  }) async {
    ArgumentError.checkNotNull(workteamName, 'workteamName');
    _s.validateStringLength(
      'workteamName',
      workteamName,
      1,
      63,
    );
    _s.validateStringPattern(
      'workteamName',
      workteamName,
      r'''^[a-zA-Z0-9](-*[a-zA-Z0-9])*''',
    );
    if (description != null) {
      _s.validateStringLength(
        'description',
        description,
        1,
        200,
      );
    }
    if (description != null) {
      _s.validateStringPattern(
        'description',
        description,
        r'''.+''',
      );
    }
    if (memberDefinitions != null) {}
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SageMaker.UpdateWorkteam'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'WorkteamName': workteamName,
        'Description': description,
        'MemberDefinitions': memberDefinitions,
        'NotificationConfiguration': notificationConfiguration,
      },
    );

    return UpdateWorkteamResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddTagsOutput {
  /// A list of tags associated with the Amazon SageMaker resource.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  AddTagsOutput({
    this.tags,
  });
  factory AddTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$AddTagsOutputFromJson(json);
}

enum AlgorithmSortBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
}

/// Specifies the training algorithm to use in a <a>CreateTrainingJob</a>
/// request.
///
/// For more information about algorithms provided by Amazon SageMaker, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>.
/// For information about using your own algorithms, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using
/// Your Own Algorithms with Amazon SageMaker</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AlgorithmSpecification {
  /// The input mode that the algorithm supports. For the input modes that Amazon
  /// SageMaker algorithms support, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>.
  /// If an algorithm supports the <code>File</code> input mode, Amazon SageMaker
  /// downloads the training data from S3 to the provisioned ML storage Volume,
  /// and mounts the directory to docker volume for training container. If an
  /// algorithm supports the <code>Pipe</code> input mode, Amazon SageMaker
  /// streams data directly from S3 to the container.
  ///
  /// In File mode, make sure you provision ML storage volume with sufficient
  /// capacity to accommodate the data download from S3. In addition to the
  /// training data, the ML storage volume also stores the output model. The
  /// algorithm container use ML storage volume to also store intermediate
  /// information, if any.
  ///
  /// For distributed algorithms using File mode, training data is distributed
  /// uniformly, and your training duration is predictable if the input data
  /// objects size is approximately same. Amazon SageMaker does not split the
  /// files any further for model training. If the object sizes are skewed,
  /// training won't be optimal as the data distribution is also skewed where one
  /// host in a training cluster is overloaded, thus becoming bottleneck in
  /// training.
  @_s.JsonKey(name: 'TrainingInputMode')
  final TrainingInputMode trainingInputMode;

  /// The name of the algorithm resource to use for the training job. This must be
  /// an algorithm resource that you created or subscribe to on AWS Marketplace.
  /// If you specify a value for this parameter, you can't specify a value for
  /// <code>TrainingImage</code>.
  @_s.JsonKey(name: 'AlgorithmName')
  final String algorithmName;

  /// To generate and save time-series metrics during training, set to
  /// <code>true</code>. The default is <code>false</code> and time-series metrics
  /// aren't generated except in the following cases:
  ///
  /// <ul>
  /// <li>
  /// You use one of the Amazon SageMaker built-in algorithms
  /// </li>
  /// <li>
  /// You use one of the following <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/pre-built-containers-frameworks-deep-learning.html">Prebuilt
  /// Amazon SageMaker Docker Images</a>:
  ///
  /// <ul>
  /// <li>
  /// Tensorflow (version &gt;= 1.15)
  /// </li>
  /// <li>
  /// MXNet (version &gt;= 1.6)
  /// </li>
  /// <li>
  /// PyTorch (version &gt;= 1.3)
  /// </li>
  /// </ul> </li>
  /// <li>
  /// You specify at least one <a>MetricDefinition</a>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EnableSageMakerMetricsTimeSeries')
  final bool enableSageMakerMetricsTimeSeries;

  /// A list of metric definition objects. Each object specifies the metric name
  /// and regular expressions used to parse algorithm logs. Amazon SageMaker
  /// publishes each metric to Amazon CloudWatch.
  @_s.JsonKey(name: 'MetricDefinitions')
  final List<MetricDefinition> metricDefinitions;

  /// The registry path of the Docker image that contains the training algorithm.
  /// For information about docker registry paths for built-in algorithms, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html">Algorithms
  /// Provided by Amazon SageMaker: Common Parameters</a>. Amazon SageMaker
  /// supports both <code>registry/repository[:tag]</code> and
  /// <code>registry/repository[@digest]</code> image path formats. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using
  /// Your Own Algorithms with Amazon SageMaker</a>.
  @_s.JsonKey(name: 'TrainingImage')
  final String trainingImage;

  AlgorithmSpecification({
    @_s.required this.trainingInputMode,
    this.algorithmName,
    this.enableSageMakerMetricsTimeSeries,
    this.metricDefinitions,
    this.trainingImage,
  });
  factory AlgorithmSpecification.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$AlgorithmSpecificationToJson(this);
}

enum AlgorithmStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Deleting')
  deleting,
}

/// Specifies the validation and image scan statuses of the algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AlgorithmStatusDetails {
  /// The status of the scan of the algorithm's Docker image container.
  @_s.JsonKey(name: 'ImageScanStatuses')
  final List<AlgorithmStatusItem> imageScanStatuses;

  /// The status of algorithm validation.
  @_s.JsonKey(name: 'ValidationStatuses')
  final List<AlgorithmStatusItem> validationStatuses;

  AlgorithmStatusDetails({
    this.imageScanStatuses,
    this.validationStatuses,
  });
  factory AlgorithmStatusDetails.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmStatusDetailsFromJson(json);
}

/// Represents the overall status of an algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AlgorithmStatusItem {
  /// The name of the algorithm for which the overall status is being reported.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status.
  @_s.JsonKey(name: 'Status')
  final DetailedAlgorithmStatus status;

  /// if the overall status is <code>Failed</code>, the reason for the failure.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  AlgorithmStatusItem({
    @_s.required this.name,
    @_s.required this.status,
    this.failureReason,
  });
  factory AlgorithmStatusItem.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmStatusItemFromJson(json);
}

/// Provides summary information about an algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AlgorithmSummary {
  /// The Amazon Resource Name (ARN) of the algorithm.
  @_s.JsonKey(name: 'AlgorithmArn')
  final String algorithmArn;

  /// The name of the algorithm that is described by the summary.
  @_s.JsonKey(name: 'AlgorithmName')
  final String algorithmName;

  /// The overall status of the algorithm.
  @_s.JsonKey(name: 'AlgorithmStatus')
  final AlgorithmStatus algorithmStatus;

  /// A timestamp that shows when the algorithm was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// A brief description of the algorithm.
  @_s.JsonKey(name: 'AlgorithmDescription')
  final String algorithmDescription;

  AlgorithmSummary({
    @_s.required this.algorithmArn,
    @_s.required this.algorithmName,
    @_s.required this.algorithmStatus,
    @_s.required this.creationTime,
    this.algorithmDescription,
  });
  factory AlgorithmSummary.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmSummaryFromJson(json);
}

/// Defines a training job and a batch transform job that Amazon SageMaker runs
/// to validate your algorithm.
///
/// The data provided in the validation profile is made available to your buyers
/// on AWS Marketplace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AlgorithmValidationProfile {
  /// The name of the profile for the algorithm. The name must have 1 to 63
  /// characters. Valid characters are a-z, A-Z, 0-9, and - (hyphen).
  @_s.JsonKey(name: 'ProfileName')
  final String profileName;

  /// The <code>TrainingJobDefinition</code> object that describes the training
  /// job that Amazon SageMaker runs to validate your algorithm.
  @_s.JsonKey(name: 'TrainingJobDefinition')
  final TrainingJobDefinition trainingJobDefinition;

  /// The <code>TransformJobDefinition</code> object that describes the transform
  /// job that Amazon SageMaker runs to validate your algorithm.
  @_s.JsonKey(name: 'TransformJobDefinition')
  final TransformJobDefinition transformJobDefinition;

  AlgorithmValidationProfile({
    @_s.required this.profileName,
    @_s.required this.trainingJobDefinition,
    this.transformJobDefinition,
  });
  factory AlgorithmValidationProfile.fromJson(Map<String, dynamic> json) =>
      _$AlgorithmValidationProfileFromJson(json);

  Map<String, dynamic> toJson() => _$AlgorithmValidationProfileToJson(this);
}

/// Specifies configurations for one or more training jobs that Amazon SageMaker
/// runs to test the algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AlgorithmValidationSpecification {
  /// An array of <code>AlgorithmValidationProfile</code> objects, each of which
  /// specifies a training job and batch transform job that Amazon SageMaker runs
  /// to validate your algorithm.
  @_s.JsonKey(name: 'ValidationProfiles')
  final List<AlgorithmValidationProfile> validationProfiles;

  /// The IAM roles that Amazon SageMaker uses to run the training jobs.
  @_s.JsonKey(name: 'ValidationRole')
  final String validationRole;

  AlgorithmValidationSpecification({
    @_s.required this.validationProfiles,
    @_s.required this.validationRole,
  });
  factory AlgorithmValidationSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$AlgorithmValidationSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AlgorithmValidationSpecificationToJson(this);
}

/// Configures how labels are consolidated across human workers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AnnotationConsolidationConfig {
  /// The Amazon Resource Name (ARN) of a Lambda function implements the logic for
  /// annotation consolidation.
  ///
  /// For the built-in bounding box, image classification, semantic segmentation,
  /// and text classification task types, Amazon SageMaker Ground Truth provides
  /// the following Lambda functions:
  ///
  /// <ul>
  /// <li>
  /// <i>Bounding box</i> - Finds the most similar boxes from different workers
  /// based on the Jaccard index of the boxes.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-BoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-BoundingBox</code>
  /// </li>
  /// <li>
  /// <i>Image classification</i> - Uses a variant of the Expectation Maximization
  /// approach to estimate the true class of an image based on annotations from
  /// individual workers.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-ImageMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <i>Multi-label image classification</i> - Uses a variant of the Expectation
  /// Maximization approach to estimate the true classes of an image based on
  /// annotations from individual workers.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-ImageMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <i>Semantic segmentation</i> - Treats each pixel in an image as a
  /// multi-class classification and treats pixel annotations from workers as
  /// "votes" for the correct label.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-SemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <i>Text classification</i> - Uses a variant of the Expectation Maximization
  /// approach to estimate the true class of text based on annotations from
  /// individual workers.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-TextMultiClass</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <i>Multi-label text classification</i> - Uses a variant of the Expectation
  /// Maximization approach to estimate the true classes of text based on
  /// annotations from individual workers.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-TextMultiClassMultiLabel</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <i>Named entity recognition</i> - Groups similar selections and calculates
  /// aggregate boundaries, resolving to most-assigned label.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-NamedEntityRecognition</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <i>Bounding box verification</i> - Uses a variant of the Expectation
  /// Maximization approach to estimate the true class of verification judgement
  /// for bounding box labels based on annotations from individual workers.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-VerificationBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <i>Semantic segmentation verification</i> - Uses a variant of the
  /// Expectation Maximization approach to estimate the true class of verification
  /// judgment for semantic segmentation labels based on annotations from
  /// individual workers.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-VerificationSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <i>Bounding box adjustment</i> - Finds the most similar boxes from different
  /// workers based on the Jaccard index of the adjusted annotations.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-AdjustmentBoundingBox</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <i>Semantic segmentation adjustment</i> - Treats each pixel in an image as a
  /// multi-class classification and treats pixel adjusted annotations from
  /// workers as "votes" for the correct label.
  ///
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:ACS-AdjustmentSemanticSegmentation</code>
  ///
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:ACS-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-annotation-consolidation.html">Annotation
  /// Consolidation</a>.
  @_s.JsonKey(name: 'AnnotationConsolidationLambdaArn')
  final String annotationConsolidationLambdaArn;

  AnnotationConsolidationConfig({
    @_s.required this.annotationConsolidationLambdaArn,
  });
  factory AnnotationConsolidationConfig.fromJson(Map<String, dynamic> json) =>
      _$AnnotationConsolidationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AnnotationConsolidationConfigToJson(this);
}

/// The app's details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppDetails {
  /// The name of the app.
  @_s.JsonKey(name: 'AppName')
  final String appName;

  /// The type of app.
  @_s.JsonKey(name: 'AppType')
  final AppType appType;

  /// The creation time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The domain ID.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// The status.
  @_s.JsonKey(name: 'Status')
  final AppStatus status;

  /// The user profile name.
  @_s.JsonKey(name: 'UserProfileName')
  final String userProfileName;

  AppDetails({
    this.appName,
    this.appType,
    this.creationTime,
    this.domainId,
    this.status,
    this.userProfileName,
  });
  factory AppDetails.fromJson(Map<String, dynamic> json) =>
      _$AppDetailsFromJson(json);
}

enum AppInstanceType {
  @_s.JsonValue('system')
  system,
  @_s.JsonValue('ml.t3.micro')
  mlT3Micro,
  @_s.JsonValue('ml.t3.small')
  mlT3Small,
  @_s.JsonValue('ml.t3.medium')
  mlT3Medium,
  @_s.JsonValue('ml.t3.large')
  mlT3Large,
  @_s.JsonValue('ml.t3.xlarge')
  mlT3Xlarge,
  @_s.JsonValue('ml.t3.2xlarge')
  mlT3_2xlarge,
  @_s.JsonValue('ml.m5.large')
  mlM5Large,
  @_s.JsonValue('ml.m5.xlarge')
  mlM5Xlarge,
  @_s.JsonValue('ml.m5.2xlarge')
  mlM5_2xlarge,
  @_s.JsonValue('ml.m5.4xlarge')
  mlM5_4xlarge,
  @_s.JsonValue('ml.m5.8xlarge')
  mlM5_8xlarge,
  @_s.JsonValue('ml.m5.12xlarge')
  mlM5_12xlarge,
  @_s.JsonValue('ml.m5.16xlarge')
  mlM5_16xlarge,
  @_s.JsonValue('ml.m5.24xlarge')
  mlM5_24xlarge,
  @_s.JsonValue('ml.c5.large')
  mlC5Large,
  @_s.JsonValue('ml.c5.xlarge')
  mlC5Xlarge,
  @_s.JsonValue('ml.c5.2xlarge')
  mlC5_2xlarge,
  @_s.JsonValue('ml.c5.4xlarge')
  mlC5_4xlarge,
  @_s.JsonValue('ml.c5.9xlarge')
  mlC5_9xlarge,
  @_s.JsonValue('ml.c5.12xlarge')
  mlC5_12xlarge,
  @_s.JsonValue('ml.c5.18xlarge')
  mlC5_18xlarge,
  @_s.JsonValue('ml.c5.24xlarge')
  mlC5_24xlarge,
  @_s.JsonValue('ml.p3.2xlarge')
  mlP3_2xlarge,
  @_s.JsonValue('ml.p3.8xlarge')
  mlP3_8xlarge,
  @_s.JsonValue('ml.p3.16xlarge')
  mlP3_16xlarge,
  @_s.JsonValue('ml.g4dn.xlarge')
  mlG4dnXlarge,
  @_s.JsonValue('ml.g4dn.2xlarge')
  mlG4dn_2xlarge,
  @_s.JsonValue('ml.g4dn.4xlarge')
  mlG4dn_4xlarge,
  @_s.JsonValue('ml.g4dn.8xlarge')
  mlG4dn_8xlarge,
  @_s.JsonValue('ml.g4dn.12xlarge')
  mlG4dn_12xlarge,
  @_s.JsonValue('ml.g4dn.16xlarge')
  mlG4dn_16xlarge,
}

enum AppSortKey {
  @_s.JsonValue('CreationTime')
  creationTime,
}

/// Configuration to run a processing job in a specified container image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AppSpecification {
  /// The container image to be run by the processing job.
  @_s.JsonKey(name: 'ImageUri')
  final String imageUri;

  /// The arguments for a container used to run a processing job.
  @_s.JsonKey(name: 'ContainerArguments')
  final List<String> containerArguments;

  /// The entrypoint for a container used to run a processing job.
  @_s.JsonKey(name: 'ContainerEntrypoint')
  final List<String> containerEntrypoint;

  AppSpecification({
    @_s.required this.imageUri,
    this.containerArguments,
    this.containerEntrypoint,
  });
  factory AppSpecification.fromJson(Map<String, dynamic> json) =>
      _$AppSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$AppSpecificationToJson(this);
}

enum AppStatus {
  @_s.JsonValue('Deleted')
  deleted,
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('InService')
  inService,
  @_s.JsonValue('Pending')
  pending,
}

enum AppType {
  @_s.JsonValue('JupyterServer')
  jupyterServer,
  @_s.JsonValue('KernelGateway')
  kernelGateway,
  @_s.JsonValue('TensorBoard')
  tensorBoard,
}

enum AssemblyType {
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('Line')
  line,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateTrialComponentResponse {
  /// The Amazon Resource Name (ARN) of the trial.
  @_s.JsonKey(name: 'TrialArn')
  final String trialArn;

  /// The ARN of the trial component.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  AssociateTrialComponentResponse({
    this.trialArn,
    this.trialComponentArn,
  });
  factory AssociateTrialComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateTrialComponentResponseFromJson(json);
}

enum AuthMode {
  @_s.JsonValue('SSO')
  sso,
  @_s.JsonValue('IAM')
  iam,
}

/// An AutoPilot job will return recommendations, or candidates. Each candidate
/// has futher details about the steps involed, and the status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoMLCandidate {
  /// The candidate name.
  @_s.JsonKey(name: 'CandidateName')
  final String candidateName;

  /// The candidate's status.
  @_s.JsonKey(name: 'CandidateStatus')
  final CandidateStatus candidateStatus;

  /// The candidate's steps.
  @_s.JsonKey(name: 'CandidateSteps')
  final List<AutoMLCandidateStep> candidateSteps;

  /// The creation time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The last modified time.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The objective status.
  @_s.JsonKey(name: 'ObjectiveStatus')
  final ObjectiveStatus objectiveStatus;

  /// The end time.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// The failure reason.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;
  @_s.JsonKey(name: 'FinalAutoMLJobObjectiveMetric')
  final FinalAutoMLJobObjectiveMetric finalAutoMLJobObjectiveMetric;

  /// The inference containers.
  @_s.JsonKey(name: 'InferenceContainers')
  final List<AutoMLContainerDefinition> inferenceContainers;

  AutoMLCandidate({
    @_s.required this.candidateName,
    @_s.required this.candidateStatus,
    @_s.required this.candidateSteps,
    @_s.required this.creationTime,
    @_s.required this.lastModifiedTime,
    @_s.required this.objectiveStatus,
    this.endTime,
    this.failureReason,
    this.finalAutoMLJobObjectiveMetric,
    this.inferenceContainers,
  });
  factory AutoMLCandidate.fromJson(Map<String, dynamic> json) =>
      _$AutoMLCandidateFromJson(json);
}

/// Information about the steps for a Candidate, and what step it is working on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoMLCandidateStep {
  /// The ARN for the Candidate's step.
  @_s.JsonKey(name: 'CandidateStepArn')
  final String candidateStepArn;

  /// The name for the Candidate's step.
  @_s.JsonKey(name: 'CandidateStepName')
  final String candidateStepName;

  /// Whether the Candidate is at the transform, training, or processing step.
  @_s.JsonKey(name: 'CandidateStepType')
  final CandidateStepType candidateStepType;

  AutoMLCandidateStep({
    @_s.required this.candidateStepArn,
    @_s.required this.candidateStepName,
    @_s.required this.candidateStepType,
  });
  factory AutoMLCandidateStep.fromJson(Map<String, dynamic> json) =>
      _$AutoMLCandidateStepFromJson(json);
}

/// Similar to Channel. A channel is a named input source that training
/// algorithms can consume. Refer to Channel for detailed descriptions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLChannel {
  /// The data source.
  @_s.JsonKey(name: 'DataSource')
  final AutoMLDataSource dataSource;

  /// The name of the target variable in supervised learning, a.k.a. 'y'.
  @_s.JsonKey(name: 'TargetAttributeName')
  final String targetAttributeName;

  /// You can use Gzip or None. The default value is None.
  @_s.JsonKey(name: 'CompressionType')
  final CompressionType compressionType;

  AutoMLChannel({
    @_s.required this.dataSource,
    @_s.required this.targetAttributeName,
    this.compressionType,
  });
  factory AutoMLChannel.fromJson(Map<String, dynamic> json) =>
      _$AutoMLChannelFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLChannelToJson(this);
}

/// A list of container definitions that describe the different containers that
/// make up one AutoML candidate. Refer to ContainerDefinition for more details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoMLContainerDefinition {
  /// The ECR path of the container. Refer to ContainerDefinition for more
  /// details.
  @_s.JsonKey(name: 'Image')
  final String image;

  /// The location of the model artifacts. Refer to ContainerDefinition for more
  /// details.
  @_s.JsonKey(name: 'ModelDataUrl')
  final String modelDataUrl;

  /// Environment variables to set in the container. Refer to ContainerDefinition
  /// for more details.
  @_s.JsonKey(name: 'Environment')
  final Map<String, String> environment;

  AutoMLContainerDefinition({
    @_s.required this.image,
    @_s.required this.modelDataUrl,
    this.environment,
  });
  factory AutoMLContainerDefinition.fromJson(Map<String, dynamic> json) =>
      _$AutoMLContainerDefinitionFromJson(json);
}

/// The data source for the AutoPilot job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLDataSource {
  /// The Amazon S3 location of the input data.
  /// <note>
  /// The input data must be in CSV format and contain at least 1000 rows.
  /// </note>
  @_s.JsonKey(name: 'S3DataSource')
  final AutoMLS3DataSource s3DataSource;

  AutoMLDataSource({
    @_s.required this.s3DataSource,
  });
  factory AutoMLDataSource.fromJson(Map<String, dynamic> json) =>
      _$AutoMLDataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLDataSourceToJson(this);
}

/// Artifacts that are generation during a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoMLJobArtifacts {
  /// The URL to the notebook location.
  @_s.JsonKey(name: 'CandidateDefinitionNotebookLocation')
  final String candidateDefinitionNotebookLocation;

  /// The URL to the notebook location.
  @_s.JsonKey(name: 'DataExplorationNotebookLocation')
  final String dataExplorationNotebookLocation;

  AutoMLJobArtifacts({
    this.candidateDefinitionNotebookLocation,
    this.dataExplorationNotebookLocation,
  });
  factory AutoMLJobArtifacts.fromJson(Map<String, dynamic> json) =>
      _$AutoMLJobArtifactsFromJson(json);
}

/// How long a job is allowed to run, or how many candidates a job is allowed to
/// generate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLJobCompletionCriteria {
  /// The maximum time, in seconds, an AutoML job is allowed to wait for a trial
  /// to complete. It must be equal to or greater than
  /// MaxRuntimePerTrainingJobInSeconds.
  @_s.JsonKey(name: 'MaxAutoMLJobRuntimeInSeconds')
  final int maxAutoMLJobRuntimeInSeconds;

  /// The maximum number of times a training job is allowed to run.
  @_s.JsonKey(name: 'MaxCandidates')
  final int maxCandidates;

  /// The maximum time, in seconds, a job is allowed to run.
  @_s.JsonKey(name: 'MaxRuntimePerTrainingJobInSeconds')
  final int maxRuntimePerTrainingJobInSeconds;

  AutoMLJobCompletionCriteria({
    this.maxAutoMLJobRuntimeInSeconds,
    this.maxCandidates,
    this.maxRuntimePerTrainingJobInSeconds,
  });
  factory AutoMLJobCompletionCriteria.fromJson(Map<String, dynamic> json) =>
      _$AutoMLJobCompletionCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLJobCompletionCriteriaToJson(this);
}

/// A collection of settings used for a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLJobConfig {
  /// How long a job is allowed to run, or how many candidates a job is allowed to
  /// generate.
  @_s.JsonKey(name: 'CompletionCriteria')
  final AutoMLJobCompletionCriteria completionCriteria;

  /// Security configuration for traffic encryption or Amazon VPC settings.
  @_s.JsonKey(name: 'SecurityConfig')
  final AutoMLSecurityConfig securityConfig;

  AutoMLJobConfig({
    this.completionCriteria,
    this.securityConfig,
  });
  factory AutoMLJobConfig.fromJson(Map<String, dynamic> json) =>
      _$AutoMLJobConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLJobConfigToJson(this);
}

/// Applies a metric to minimize or maximize for the job's objective.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLJobObjective {
  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final AutoMLMetricEnum metricName;

  AutoMLJobObjective({
    @_s.required this.metricName,
  });
  factory AutoMLJobObjective.fromJson(Map<String, dynamic> json) =>
      _$AutoMLJobObjectiveFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLJobObjectiveToJson(this);
}

enum AutoMLJobObjectiveType {
  @_s.JsonValue('Maximize')
  maximize,
  @_s.JsonValue('Minimize')
  minimize,
}

enum AutoMLJobSecondaryStatus {
  @_s.JsonValue('Starting')
  starting,
  @_s.JsonValue('AnalyzingData')
  analyzingData,
  @_s.JsonValue('FeatureEngineering')
  featureEngineering,
  @_s.JsonValue('ModelTuning')
  modelTuning,
  @_s.JsonValue('MaxCandidatesReached')
  maxCandidatesReached,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('MaxAutoMLJobRuntimeReached')
  maxAutoMLJobRuntimeReached,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('CandidateDefinitionsGenerated')
  candidateDefinitionsGenerated,
}

enum AutoMLJobStatus {
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('Stopping')
  stopping,
}

/// Provides a summary about a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AutoMLJobSummary {
  /// The ARN of the job.
  @_s.JsonKey(name: 'AutoMLJobArn')
  final String autoMLJobArn;

  /// The name of the object you are requesting.
  @_s.JsonKey(name: 'AutoMLJobName')
  final String autoMLJobName;

  /// The job's secondary status.
  @_s.JsonKey(name: 'AutoMLJobSecondaryStatus')
  final AutoMLJobSecondaryStatus autoMLJobSecondaryStatus;

  /// The job's status.
  @_s.JsonKey(name: 'AutoMLJobStatus')
  final AutoMLJobStatus autoMLJobStatus;

  /// When the job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// When the job was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The end time.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// The failure reason.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  AutoMLJobSummary({
    @_s.required this.autoMLJobArn,
    @_s.required this.autoMLJobName,
    @_s.required this.autoMLJobSecondaryStatus,
    @_s.required this.autoMLJobStatus,
    @_s.required this.creationTime,
    @_s.required this.lastModifiedTime,
    this.endTime,
    this.failureReason,
  });
  factory AutoMLJobSummary.fromJson(Map<String, dynamic> json) =>
      _$AutoMLJobSummaryFromJson(json);
}

enum AutoMLMetricEnum {
  @_s.JsonValue('Accuracy')
  accuracy,
  @_s.JsonValue('MSE')
  mse,
  @_s.JsonValue('F1')
  f1,
  @_s.JsonValue('F1macro')
  f1macro,
}

/// The output data configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLOutputDataConfig {
  /// The Amazon S3 output path. Must be 128 characters or less.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  /// The AWS KMS encryption key ID.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  AutoMLOutputDataConfig({
    @_s.required this.s3OutputPath,
    this.kmsKeyId,
  });
  factory AutoMLOutputDataConfig.fromJson(Map<String, dynamic> json) =>
      _$AutoMLOutputDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLOutputDataConfigToJson(this);
}

/// The Amazon S3 data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLS3DataSource {
  /// The data type.
  @_s.JsonKey(name: 'S3DataType')
  final AutoMLS3DataType s3DataType;

  /// The URL to the Amazon S3 data source.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  AutoMLS3DataSource({
    @_s.required this.s3DataType,
    @_s.required this.s3Uri,
  });
  factory AutoMLS3DataSource.fromJson(Map<String, dynamic> json) =>
      _$AutoMLS3DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLS3DataSourceToJson(this);
}

enum AutoMLS3DataType {
  @_s.JsonValue('ManifestFile')
  manifestFile,
  @_s.JsonValue('S3Prefix')
  s3Prefix,
}

/// Security options.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AutoMLSecurityConfig {
  /// Whether to use traffic encryption between the container layers.
  @_s.JsonKey(name: 'EnableInterContainerTrafficEncryption')
  final bool enableInterContainerTrafficEncryption;

  /// The key used to encrypt stored data.
  @_s.JsonKey(name: 'VolumeKmsKeyId')
  final String volumeKmsKeyId;

  /// VPC configuration.
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  AutoMLSecurityConfig({
    this.enableInterContainerTrafficEncryption,
    this.volumeKmsKeyId,
    this.vpcConfig,
  });
  factory AutoMLSecurityConfig.fromJson(Map<String, dynamic> json) =>
      _$AutoMLSecurityConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AutoMLSecurityConfigToJson(this);
}

enum AutoMLSortBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('Status')
  status,
}

enum AutoMLSortOrder {
  @_s.JsonValue('Ascending')
  ascending,
  @_s.JsonValue('Descending')
  descending,
}

enum AwsManagedHumanLoopRequestSource {
  @_s.JsonValue('AWS/Rekognition/DetectModerationLabels/Image/V3')
  awsRekognitionDetectModerationLabelsImageV3,
  @_s.JsonValue('AWS/Textract/AnalyzeDocument/Forms/V1')
  awsTextractAnalyzeDocumentFormsV1,
}

enum BatchStrategy {
  @_s.JsonValue('MultiRecord')
  multiRecord,
  @_s.JsonValue('SingleRecord')
  singleRecord,
}

enum BooleanOperator {
  @_s.JsonValue('And')
  and,
  @_s.JsonValue('Or')
  or,
}

enum CandidateSortBy {
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('FinalObjectiveMetricValue')
  finalObjectiveMetricValue,
}

enum CandidateStatus {
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('Stopping')
  stopping,
}

enum CandidateStepType {
  @_s.JsonValue('AWS::SageMaker::TrainingJob')
  awsSageMakerTrainingJob,
  @_s.JsonValue('AWS::SageMaker::TransformJob')
  awsSageMakerTransformJob,
  @_s.JsonValue('AWS::SageMaker::ProcessingJob')
  awsSageMakerProcessingJob,
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptureContentTypeHeader {
  /// <p/>
  @_s.JsonKey(name: 'CsvContentTypes')
  final List<String> csvContentTypes;

  /// <p/>
  @_s.JsonKey(name: 'JsonContentTypes')
  final List<String> jsonContentTypes;

  CaptureContentTypeHeader({
    this.csvContentTypes,
    this.jsonContentTypes,
  });
  factory CaptureContentTypeHeader.fromJson(Map<String, dynamic> json) =>
      _$CaptureContentTypeHeaderFromJson(json);

  Map<String, dynamic> toJson() => _$CaptureContentTypeHeaderToJson(this);
}

enum CaptureMode {
  @_s.JsonValue('Input')
  input,
  @_s.JsonValue('Output')
  output,
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CaptureOption {
  /// <p/>
  @_s.JsonKey(name: 'CaptureMode')
  final CaptureMode captureMode;

  CaptureOption({
    @_s.required this.captureMode,
  });
  factory CaptureOption.fromJson(Map<String, dynamic> json) =>
      _$CaptureOptionFromJson(json);

  Map<String, dynamic> toJson() => _$CaptureOptionToJson(this);
}

enum CaptureStatus {
  @_s.JsonValue('Started')
  started,
  @_s.JsonValue('Stopped')
  stopped,
}

/// A list of categorical hyperparameters to tune.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CategoricalParameterRange {
  /// The name of the categorical hyperparameter to tune.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of the categories for the hyperparameter.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  CategoricalParameterRange({
    @_s.required this.name,
    @_s.required this.values,
  });
  factory CategoricalParameterRange.fromJson(Map<String, dynamic> json) =>
      _$CategoricalParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$CategoricalParameterRangeToJson(this);
}

/// Defines the possible values for a categorical hyperparameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CategoricalParameterRangeSpecification {
  /// The allowed categories for the hyperparameter.
  @_s.JsonKey(name: 'Values')
  final List<String> values;

  CategoricalParameterRangeSpecification({
    @_s.required this.values,
  });
  factory CategoricalParameterRangeSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$CategoricalParameterRangeSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$CategoricalParameterRangeSpecificationToJson(this);
}

/// A channel is a named input source that training algorithms can consume.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Channel {
  /// The name of the channel.
  @_s.JsonKey(name: 'ChannelName')
  final String channelName;

  /// The location of the channel data.
  @_s.JsonKey(name: 'DataSource')
  final DataSource dataSource;

  /// If training data is compressed, the compression type. The default value is
  /// <code>None</code>. <code>CompressionType</code> is used only in Pipe input
  /// mode. In File mode, leave this field unset or set it to None.
  @_s.JsonKey(name: 'CompressionType')
  final CompressionType compressionType;

  /// The MIME type of the data.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// (Optional) The input mode to use for the data channel in a training job. If
  /// you don't set a value for <code>InputMode</code>, Amazon SageMaker uses the
  /// value set for <code>TrainingInputMode</code>. Use this parameter to override
  /// the <code>TrainingInputMode</code> setting in a
  /// <a>AlgorithmSpecification</a> request when you have a channel that needs a
  /// different input mode from the training job's general setting. To download
  /// the data from Amazon Simple Storage Service (Amazon S3) to the provisioned
  /// ML storage volume, and mount the directory to a Docker volume, use
  /// <code>File</code> input mode. To stream data directly from Amazon S3 to the
  /// container, choose <code>Pipe</code> input mode.
  ///
  /// To use a model for incremental training, choose <code>File</code> input
  /// model.
  @_s.JsonKey(name: 'InputMode')
  final TrainingInputMode inputMode;

  /// <p/>
  /// Specify RecordIO as the value when input data is in raw format but the
  /// training algorithm requires the RecordIO format. In this case, Amazon
  /// SageMaker wraps each individual S3 object in a RecordIO record. If the input
  /// data is already in RecordIO format, you don't need to set this attribute.
  /// For more information, see <a
  /// href="https://mxnet.apache.org/api/architecture/note_data_loading#data-format">Create
  /// a Dataset Using RecordIO</a>.
  ///
  /// In File mode, leave this field unset or set it to None.
  @_s.JsonKey(name: 'RecordWrapperType')
  final RecordWrapper recordWrapperType;

  /// A configuration for a shuffle option for input data in a channel. If you use
  /// <code>S3Prefix</code> for <code>S3DataType</code>, this shuffles the results
  /// of the S3 key prefix matches. If you use <code>ManifestFile</code>, the
  /// order of the S3 object references in the <code>ManifestFile</code> is
  /// shuffled. If you use <code>AugmentedManifestFile</code>, the order of the
  /// JSON lines in the <code>AugmentedManifestFile</code> is shuffled. The
  /// shuffling order is determined using the <code>Seed</code> value.
  ///
  /// For Pipe input mode, shuffling is done at the start of every epoch. With
  /// large datasets this ensures that the order of the training data is different
  /// for each epoch, it helps reduce bias and possible overfitting. In a
  /// multi-node training job when ShuffleConfig is combined with
  /// <code>S3DataDistributionType</code> of <code>ShardedByS3Key</code>, the data
  /// is shuffled across nodes so that the content sent to a particular node on
  /// the first epoch might be sent to a different node on the second epoch.
  @_s.JsonKey(name: 'ShuffleConfig')
  final ShuffleConfig shuffleConfig;

  Channel({
    @_s.required this.channelName,
    @_s.required this.dataSource,
    this.compressionType,
    this.contentType,
    this.inputMode,
    this.recordWrapperType,
    this.shuffleConfig,
  });
  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

/// Defines a named input source, called a channel, to be used by an algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ChannelSpecification {
  /// The name of the channel.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The supported MIME types for the data.
  @_s.JsonKey(name: 'SupportedContentTypes')
  final List<String> supportedContentTypes;

  /// The allowed input mode, either FILE or PIPE.
  ///
  /// In FILE mode, Amazon SageMaker copies the data from the input source onto
  /// the local Amazon Elastic Block Store (Amazon EBS) volumes before starting
  /// your training algorithm. This is the most commonly used input mode.
  ///
  /// In PIPE mode, Amazon SageMaker streams input data from the source directly
  /// to your algorithm without using the EBS volume.
  @_s.JsonKey(name: 'SupportedInputModes')
  final List<String> supportedInputModes;

  /// A brief description of the channel.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Indicates whether the channel is required by the algorithm.
  @_s.JsonKey(name: 'IsRequired')
  final bool isRequired;

  /// The allowed compression types, if data compression is used.
  @_s.JsonKey(name: 'SupportedCompressionTypes')
  final List<String> supportedCompressionTypes;

  ChannelSpecification({
    @_s.required this.name,
    @_s.required this.supportedContentTypes,
    @_s.required this.supportedInputModes,
    this.description,
    this.isRequired,
    this.supportedCompressionTypes,
  });
  factory ChannelSpecification.fromJson(Map<String, dynamic> json) =>
      _$ChannelSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelSpecificationToJson(this);
}

/// Contains information about the output location for managed spot training
/// checkpoint data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CheckpointConfig {
  /// Identifies the S3 path where you want Amazon SageMaker to store checkpoints.
  /// For example, <code>s3://bucket-name/key-name-prefix</code>.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  /// (Optional) The local directory where checkpoints are written. The default
  /// directory is <code>/opt/ml/checkpoints/</code>.
  @_s.JsonKey(name: 'LocalPath')
  final String localPath;

  CheckpointConfig({
    @_s.required this.s3Uri,
    this.localPath,
  });
  factory CheckpointConfig.fromJson(Map<String, dynamic> json) =>
      _$CheckpointConfigFromJson(json);

  Map<String, dynamic> toJson() => _$CheckpointConfigToJson(this);
}

enum CodeRepositorySortBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('LastModifiedTime')
  lastModifiedTime,
}

enum CodeRepositorySortOrder {
  @_s.JsonValue('Ascending')
  ascending,
  @_s.JsonValue('Descending')
  descending,
}

/// Specifies summary information about a Git repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CodeRepositorySummary {
  /// The Amazon Resource Name (ARN) of the Git repository.
  @_s.JsonKey(name: 'CodeRepositoryArn')
  final String codeRepositoryArn;

  /// The name of the Git repository.
  @_s.JsonKey(name: 'CodeRepositoryName')
  final String codeRepositoryName;

  /// The date and time that the Git repository was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The date and time that the Git repository was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// Configuration details for the Git repository, including the URL where it is
  /// located and the ARN of the AWS Secrets Manager secret that contains the
  /// credentials used to access the repository.
  @_s.JsonKey(name: 'GitConfig')
  final GitConfig gitConfig;

  CodeRepositorySummary({
    @_s.required this.codeRepositoryArn,
    @_s.required this.codeRepositoryName,
    @_s.required this.creationTime,
    @_s.required this.lastModifiedTime,
    this.gitConfig,
  });
  factory CodeRepositorySummary.fromJson(Map<String, dynamic> json) =>
      _$CodeRepositorySummaryFromJson(json);
}

/// Identifies a Amazon Cognito user group. A user group can be used in on or
/// more work teams.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CognitoMemberDefinition {
  /// An identifier for an application client. You must create the app client ID
  /// using Amazon Cognito.
  @_s.JsonKey(name: 'ClientId')
  final String clientId;

  /// An identifier for a user group.
  @_s.JsonKey(name: 'UserGroup')
  final String userGroup;

  /// An identifier for a user pool. The user pool must be in the same region as
  /// the service that you are calling.
  @_s.JsonKey(name: 'UserPool')
  final String userPool;

  CognitoMemberDefinition({
    @_s.required this.clientId,
    @_s.required this.userGroup,
    @_s.required this.userPool,
  });
  factory CognitoMemberDefinition.fromJson(Map<String, dynamic> json) =>
      _$CognitoMemberDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$CognitoMemberDefinitionToJson(this);
}

/// Configuration information for tensor collections.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CollectionConfiguration {
  /// The name of the tensor collection. The name must be unique relative to other
  /// rule configuration names.
  @_s.JsonKey(name: 'CollectionName')
  final String collectionName;

  /// Parameter values for the tensor collection. The allowed parameters are
  /// <code>"name"</code>, <code>"include_regex"</code>,
  /// <code>"reduction_config"</code>, <code>"save_config"</code>,
  /// <code>"tensor_names"</code>, and <code>"save_histogram"</code>.
  @_s.JsonKey(name: 'CollectionParameters')
  final Map<String, String> collectionParameters;

  CollectionConfiguration({
    this.collectionName,
    this.collectionParameters,
  });
  factory CollectionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$CollectionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$CollectionConfigurationToJson(this);
}

enum CompilationJobStatus {
  @_s.JsonValue('INPROGRESS')
  inprogress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('STARTING')
  starting,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('STOPPED')
  stopped,
}

/// A summary of a model compilation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompilationJobSummary {
  /// The Amazon Resource Name (ARN) of the model compilation job.
  @_s.JsonKey(name: 'CompilationJobArn')
  final String compilationJobArn;

  /// The name of the model compilation job that you want a summary for.
  @_s.JsonKey(name: 'CompilationJobName')
  final String compilationJobName;

  /// The status of the model compilation job.
  @_s.JsonKey(name: 'CompilationJobStatus')
  final CompilationJobStatus compilationJobStatus;

  /// The type of device that the model will run on after compilation has
  /// completed.
  @_s.JsonKey(name: 'CompilationTargetDevice')
  final TargetDevice compilationTargetDevice;

  /// The time when the model compilation job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The time when the model compilation job completed.
  @_s.JsonKey(
      name: 'CompilationEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime compilationEndTime;

  /// The time when the model compilation job started.
  @_s.JsonKey(
      name: 'CompilationStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime compilationStartTime;

  /// The time when the model compilation job was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  CompilationJobSummary({
    @_s.required this.compilationJobArn,
    @_s.required this.compilationJobName,
    @_s.required this.compilationJobStatus,
    @_s.required this.compilationTargetDevice,
    @_s.required this.creationTime,
    this.compilationEndTime,
    this.compilationStartTime,
    this.lastModifiedTime,
  });
  factory CompilationJobSummary.fromJson(Map<String, dynamic> json) =>
      _$CompilationJobSummaryFromJson(json);
}

enum CompressionType {
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('Gzip')
  gzip,
}

/// Describes the container, as part of model definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerDefinition {
  /// This parameter is ignored for models that contain only a
  /// <code>PrimaryContainer</code>.
  ///
  /// When a <code>ContainerDefinition</code> is part of an inference pipeline,
  /// the value of the parameter uniquely identifies the container for the
  /// purposes of logging and metrics. For information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/inference-pipeline-logs-metrics.html">Use
  /// Logs and Metrics to Monitor an Inference Pipeline</a>. If you don't specify
  /// a value for this parameter for a <code>ContainerDefinition</code> that is
  /// part of an inference pipeline, a unique name is automatically assigned based
  /// on the position of the <code>ContainerDefinition</code> in the pipeline. If
  /// you specify a value for the <code>ContainerHostName</code> for any
  /// <code>ContainerDefinition</code> that is part of an inference pipeline, you
  /// must specify a value for the <code>ContainerHostName</code> parameter of
  /// every <code>ContainerDefinition</code> in that pipeline.
  @_s.JsonKey(name: 'ContainerHostname')
  final String containerHostname;

  /// The environment variables to set in the Docker container. Each key and value
  /// in the <code>Environment</code> string to string map can have length of up
  /// to 1024. We support up to 16 entries in the map.
  @_s.JsonKey(name: 'Environment')
  final Map<String, String> environment;

  /// The Amazon EC2 Container Registry (Amazon ECR) path where inference code is
  /// stored. If you are using your own custom algorithm instead of an algorithm
  /// provided by Amazon SageMaker, the inference code must meet Amazon SageMaker
  /// requirements. Amazon SageMaker supports both
  /// <code>registry/repository[:tag]</code> and
  /// <code>registry/repository[@digest]</code> image path formats. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using
  /// Your Own Algorithms with Amazon SageMaker</a>
  @_s.JsonKey(name: 'Image')
  final String image;

  /// Whether the container hosts a single model or multiple models.
  @_s.JsonKey(name: 'Mode')
  final ContainerMode mode;

  /// The S3 path where the model artifacts, which result from model training, are
  /// stored. This path must point to a single gzip compressed tar archive
  /// (.tar.gz suffix). The S3 path is required for Amazon SageMaker built-in
  /// algorithms, but not if you use your own algorithms. For more information on
  /// built-in algorithms, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html">Common
  /// Parameters</a>.
  ///
  /// If you provide a value for this parameter, Amazon SageMaker uses AWS
  /// Security Token Service to download model artifacts from the S3 path you
  /// provide. AWS STS is activated in your IAM user account by default. If you
  /// previously deactivated AWS STS for a region, you need to reactivate AWS STS
  /// for that region. For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_temp_enable-regions.html">Activating
  /// and Deactivating AWS STS in an AWS Region</a> in the <i>AWS Identity and
  /// Access Management User Guide</i>.
  /// <important>
  /// If you use a built-in algorithm to create a model, Amazon SageMaker requires
  /// that you provide a S3 path to the model artifacts in
  /// <code>ModelDataUrl</code>.
  /// </important>
  @_s.JsonKey(name: 'ModelDataUrl')
  final String modelDataUrl;

  /// The name or Amazon Resource Name (ARN) of the model package to use to create
  /// the model.
  @_s.JsonKey(name: 'ModelPackageName')
  final String modelPackageName;

  ContainerDefinition({
    this.containerHostname,
    this.environment,
    this.image,
    this.mode,
    this.modelDataUrl,
    this.modelPackageName,
  });
  factory ContainerDefinition.fromJson(Map<String, dynamic> json) =>
      _$ContainerDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$ContainerDefinitionToJson(this);
}

enum ContainerMode {
  @_s.JsonValue('SingleModel')
  singleModel,
  @_s.JsonValue('MultiModel')
  multiModel,
}

enum ContentClassifier {
  @_s.JsonValue('FreeOfPersonallyIdentifiableInformation')
  freeOfPersonallyIdentifiableInformation,
  @_s.JsonValue('FreeOfAdultContent')
  freeOfAdultContent,
}

/// A list of continuous hyperparameters to tune.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContinuousParameterRange {
  /// The maximum value for the hyperparameter. The tuning job uses floating-point
  /// values between <code>MinValue</code> value and this value for tuning.
  @_s.JsonKey(name: 'MaxValue')
  final String maxValue;

  /// The minimum value for the hyperparameter. The tuning job uses floating-point
  /// values between this value and <code>MaxValue</code>for tuning.
  @_s.JsonKey(name: 'MinValue')
  final String minValue;

  /// The name of the continuous hyperparameter to tune.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The scale that hyperparameter tuning uses to search the hyperparameter
  /// range. For information about choosing a hyperparameter scale, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type">Hyperparameter
  /// Scaling</a>. One of the following values:
  /// <dl> <dt>Auto</dt> <dd>
  /// Amazon SageMaker hyperparameter tuning chooses the best scale for the
  /// hyperparameter.
  /// </dd> <dt>Linear</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a linear scale.
  /// </dd> <dt>Logarithmic</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a logarithmic scale.
  ///
  /// Logarithmic scaling works only for ranges that have only values greater than
  /// 0.
  /// </dd> <dt>ReverseLogarithmic</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a reverse logarithmic scale.
  ///
  /// Reverse logarithmic scaling works only for ranges that are entirely within
  /// the range 0&lt;=x&lt;1.0.
  /// </dd> </dl>
  @_s.JsonKey(name: 'ScalingType')
  final HyperParameterScalingType scalingType;

  ContinuousParameterRange({
    @_s.required this.maxValue,
    @_s.required this.minValue,
    @_s.required this.name,
    this.scalingType,
  });
  factory ContinuousParameterRange.fromJson(Map<String, dynamic> json) =>
      _$ContinuousParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$ContinuousParameterRangeToJson(this);
}

/// Defines the possible values for a continuous hyperparameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContinuousParameterRangeSpecification {
  /// The maximum floating-point value allowed.
  @_s.JsonKey(name: 'MaxValue')
  final String maxValue;

  /// The minimum floating-point value allowed.
  @_s.JsonKey(name: 'MinValue')
  final String minValue;

  ContinuousParameterRangeSpecification({
    @_s.required this.maxValue,
    @_s.required this.minValue,
  });
  factory ContinuousParameterRangeSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$ContinuousParameterRangeSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ContinuousParameterRangeSpecificationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAlgorithmOutput {
  /// The Amazon Resource Name (ARN) of the new algorithm.
  @_s.JsonKey(name: 'AlgorithmArn')
  final String algorithmArn;

  CreateAlgorithmOutput({
    @_s.required this.algorithmArn,
  });
  factory CreateAlgorithmOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateAlgorithmOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAppResponse {
  /// The app's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'AppArn')
  final String appArn;

  CreateAppResponse({
    this.appArn,
  });
  factory CreateAppResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAutoMLJobResponse {
  /// When a job is created, it is assigned a unique ARN.
  @_s.JsonKey(name: 'AutoMLJobArn')
  final String autoMLJobArn;

  CreateAutoMLJobResponse({
    @_s.required this.autoMLJobArn,
  });
  factory CreateAutoMLJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAutoMLJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCodeRepositoryOutput {
  /// The Amazon Resource Name (ARN) of the new repository.
  @_s.JsonKey(name: 'CodeRepositoryArn')
  final String codeRepositoryArn;

  CreateCodeRepositoryOutput({
    @_s.required this.codeRepositoryArn,
  });
  factory CreateCodeRepositoryOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateCodeRepositoryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateCompilationJobResponse {
  /// If the action is successful, the service sends back an HTTP 200 response.
  /// Amazon SageMaker returns the following data in JSON format:
  ///
  /// <ul>
  /// <li>
  /// <code>CompilationJobArn</code>: The Amazon Resource Name (ARN) of the
  /// compiled job.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'CompilationJobArn')
  final String compilationJobArn;

  CreateCompilationJobResponse({
    @_s.required this.compilationJobArn,
  });
  factory CreateCompilationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateCompilationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDomainResponse {
  /// The Amazon Resource Name (ARN) of the created domain.
  @_s.JsonKey(name: 'DomainArn')
  final String domainArn;

  /// The URL to the created domain.
  @_s.JsonKey(name: 'Url')
  final String url;

  CreateDomainResponse({
    this.domainArn,
    this.url,
  });
  factory CreateDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEndpointConfigOutput {
  /// The Amazon Resource Name (ARN) of the endpoint configuration.
  @_s.JsonKey(name: 'EndpointConfigArn')
  final String endpointConfigArn;

  CreateEndpointConfigOutput({
    @_s.required this.endpointConfigArn,
  });
  factory CreateEndpointConfigOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateEndpointConfigOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateEndpointOutput {
  /// The Amazon Resource Name (ARN) of the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  CreateEndpointOutput({
    @_s.required this.endpointArn,
  });
  factory CreateEndpointOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateEndpointOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateExperimentResponse {
  /// The Amazon Resource Name (ARN) of the experiment.
  @_s.JsonKey(name: 'ExperimentArn')
  final String experimentArn;

  CreateExperimentResponse({
    this.experimentArn,
  });
  factory CreateExperimentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateExperimentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFlowDefinitionResponse {
  /// The Amazon Resource Name (ARN) of the flow definition you create.
  @_s.JsonKey(name: 'FlowDefinitionArn')
  final String flowDefinitionArn;

  CreateFlowDefinitionResponse({
    @_s.required this.flowDefinitionArn,
  });
  factory CreateFlowDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFlowDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateHumanTaskUiResponse {
  /// The Amazon Resource Name (ARN) of the human review workflow user interface
  /// you create.
  @_s.JsonKey(name: 'HumanTaskUiArn')
  final String humanTaskUiArn;

  CreateHumanTaskUiResponse({
    @_s.required this.humanTaskUiArn,
  });
  factory CreateHumanTaskUiResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateHumanTaskUiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateHyperParameterTuningJobResponse {
  /// The Amazon Resource Name (ARN) of the tuning job. Amazon SageMaker assigns
  /// an ARN to a hyperparameter tuning job when you create it.
  @_s.JsonKey(name: 'HyperParameterTuningJobArn')
  final String hyperParameterTuningJobArn;

  CreateHyperParameterTuningJobResponse({
    @_s.required this.hyperParameterTuningJobArn,
  });
  factory CreateHyperParameterTuningJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateHyperParameterTuningJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateLabelingJobResponse {
  /// The Amazon Resource Name (ARN) of the labeling job. You use this ARN to
  /// identify the labeling job.
  @_s.JsonKey(name: 'LabelingJobArn')
  final String labelingJobArn;

  CreateLabelingJobResponse({
    @_s.required this.labelingJobArn,
  });
  factory CreateLabelingJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateLabelingJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateModelOutput {
  /// The ARN of the model created in Amazon SageMaker.
  @_s.JsonKey(name: 'ModelArn')
  final String modelArn;

  CreateModelOutput({
    @_s.required this.modelArn,
  });
  factory CreateModelOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateModelOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateModelPackageOutput {
  /// The Amazon Resource Name (ARN) of the new model package.
  @_s.JsonKey(name: 'ModelPackageArn')
  final String modelPackageArn;

  CreateModelPackageOutput({
    @_s.required this.modelPackageArn,
  });
  factory CreateModelPackageOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateModelPackageOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMonitoringScheduleResponse {
  /// The Amazon Resource Name (ARN) of the monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleArn')
  final String monitoringScheduleArn;

  CreateMonitoringScheduleResponse({
    @_s.required this.monitoringScheduleArn,
  });
  factory CreateMonitoringScheduleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateMonitoringScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNotebookInstanceLifecycleConfigOutput {
  /// The Amazon Resource Name (ARN) of the lifecycle configuration.
  @_s.JsonKey(name: 'NotebookInstanceLifecycleConfigArn')
  final String notebookInstanceLifecycleConfigArn;

  CreateNotebookInstanceLifecycleConfigOutput({
    this.notebookInstanceLifecycleConfigArn,
  });
  factory CreateNotebookInstanceLifecycleConfigOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreateNotebookInstanceLifecycleConfigOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateNotebookInstanceOutput {
  /// The Amazon Resource Name (ARN) of the notebook instance.
  @_s.JsonKey(name: 'NotebookInstanceArn')
  final String notebookInstanceArn;

  CreateNotebookInstanceOutput({
    this.notebookInstanceArn,
  });
  factory CreateNotebookInstanceOutput.fromJson(Map<String, dynamic> json) =>
      _$CreateNotebookInstanceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePresignedDomainUrlResponse {
  /// The presigned URL.
  @_s.JsonKey(name: 'AuthorizedUrl')
  final String authorizedUrl;

  CreatePresignedDomainUrlResponse({
    this.authorizedUrl,
  });
  factory CreatePresignedDomainUrlResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePresignedDomainUrlResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePresignedNotebookInstanceUrlOutput {
  /// A JSON object that contains the URL string.
  @_s.JsonKey(name: 'AuthorizedUrl')
  final String authorizedUrl;

  CreatePresignedNotebookInstanceUrlOutput({
    this.authorizedUrl,
  });
  factory CreatePresignedNotebookInstanceUrlOutput.fromJson(
          Map<String, dynamic> json) =>
      _$CreatePresignedNotebookInstanceUrlOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProcessingJobResponse {
  /// The Amazon Resource Name (ARN) of the processing job.
  @_s.JsonKey(name: 'ProcessingJobArn')
  final String processingJobArn;

  CreateProcessingJobResponse({
    @_s.required this.processingJobArn,
  });
  factory CreateProcessingJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProcessingJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTrainingJobResponse {
  /// The Amazon Resource Name (ARN) of the training job.
  @_s.JsonKey(name: 'TrainingJobArn')
  final String trainingJobArn;

  CreateTrainingJobResponse({
    @_s.required this.trainingJobArn,
  });
  factory CreateTrainingJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTrainingJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTransformJobResponse {
  /// The Amazon Resource Name (ARN) of the transform job.
  @_s.JsonKey(name: 'TransformJobArn')
  final String transformJobArn;

  CreateTransformJobResponse({
    @_s.required this.transformJobArn,
  });
  factory CreateTransformJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTransformJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTrialComponentResponse {
  /// The Amazon Resource Name (ARN) of the trial component.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  CreateTrialComponentResponse({
    this.trialComponentArn,
  });
  factory CreateTrialComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTrialComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateTrialResponse {
  /// The Amazon Resource Name (ARN) of the trial.
  @_s.JsonKey(name: 'TrialArn')
  final String trialArn;

  CreateTrialResponse({
    this.trialArn,
  });
  factory CreateTrialResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateTrialResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserProfileResponse {
  /// The user profile Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'UserProfileArn')
  final String userProfileArn;

  CreateUserProfileResponse({
    this.userProfileArn,
  });
  factory CreateUserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorkteamResponse {
  /// The Amazon Resource Name (ARN) of the work team. You can use this ARN to
  /// identify the work team.
  @_s.JsonKey(name: 'WorkteamArn')
  final String workteamArn;

  CreateWorkteamResponse({
    this.workteamArn,
  });
  factory CreateWorkteamResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWorkteamResponseFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataCaptureConfig {
  /// <p/>
  @_s.JsonKey(name: 'CaptureOptions')
  final List<CaptureOption> captureOptions;

  /// <p/>
  @_s.JsonKey(name: 'DestinationS3Uri')
  final String destinationS3Uri;

  /// <p/>
  @_s.JsonKey(name: 'InitialSamplingPercentage')
  final int initialSamplingPercentage;

  /// <p/>
  @_s.JsonKey(name: 'CaptureContentTypeHeader')
  final CaptureContentTypeHeader captureContentTypeHeader;

  /// <p/>
  @_s.JsonKey(name: 'EnableCapture')
  final bool enableCapture;

  /// <p/>
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  DataCaptureConfig({
    @_s.required this.captureOptions,
    @_s.required this.destinationS3Uri,
    @_s.required this.initialSamplingPercentage,
    this.captureContentTypeHeader,
    this.enableCapture,
    this.kmsKeyId,
  });
  factory DataCaptureConfig.fromJson(Map<String, dynamic> json) =>
      _$DataCaptureConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DataCaptureConfigToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataCaptureConfigSummary {
  /// <p/>
  @_s.JsonKey(name: 'CaptureStatus')
  final CaptureStatus captureStatus;

  /// <p/>
  @_s.JsonKey(name: 'CurrentSamplingPercentage')
  final int currentSamplingPercentage;

  /// <p/>
  @_s.JsonKey(name: 'DestinationS3Uri')
  final String destinationS3Uri;

  /// <p/>
  @_s.JsonKey(name: 'EnableCapture')
  final bool enableCapture;

  /// <p/>
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  DataCaptureConfigSummary({
    @_s.required this.captureStatus,
    @_s.required this.currentSamplingPercentage,
    @_s.required this.destinationS3Uri,
    @_s.required this.enableCapture,
    @_s.required this.kmsKeyId,
  });
  factory DataCaptureConfigSummary.fromJson(Map<String, dynamic> json) =>
      _$DataCaptureConfigSummaryFromJson(json);
}

/// The data structure used to specify the data to be used for inference in a
/// batch transform job and to associate the data that is relevant to the
/// prediction results in the output. The input filter provided allows you to
/// exclude input data that is not needed for inference in a batch transform
/// job. The output filter provided allows you to include input data relevant to
/// interpreting the predictions in the output from the job. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html">Associate
/// Prediction Results with their Corresponding Input Records</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataProcessing {
  /// A <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html#data-processing-operators">JSONPath</a>
  /// expression used to select a portion of the input data to pass to the
  /// algorithm. Use the <code>InputFilter</code> parameter to exclude fields,
  /// such as an ID column, from the input. If you want Amazon SageMaker to pass
  /// the entire input dataset to the algorithm, accept the default value
  /// <code>$</code>.
  ///
  /// Examples: <code>"$"</code>, <code>"$[1:]"</code>, <code>"$.features"</code>
  @_s.JsonKey(name: 'InputFilter')
  final String inputFilter;

  /// Specifies the source of the data to join with the transformed data. The
  /// valid values are <code>None</code> and <code>Input</code>. The default value
  /// is <code>None</code>, which specifies not to join the input with the
  /// transformed data. If you want the batch transform job to join the original
  /// input data with the transformed data, set <code>JoinSource</code> to
  /// <code>Input</code>.
  ///
  /// For JSON or JSONLines objects, such as a JSON array, Amazon SageMaker adds
  /// the transformed data to the input JSON object in an attribute called
  /// <code>SageMakerOutput</code>. The joined result for JSON must be a key-value
  /// pair object. If the input is not a key-value pair object, Amazon SageMaker
  /// creates a new JSON file. In the new JSON file, and the input data is stored
  /// under the <code>SageMakerInput</code> key and the results are stored in
  /// <code>SageMakerOutput</code>.
  ///
  /// For CSV files, Amazon SageMaker combines the transformed data with the input
  /// data at the end of the input data and stores it in the output file. The
  /// joined data has the joined input data followed by the transformed data and
  /// the output is a CSV file.
  @_s.JsonKey(name: 'JoinSource')
  final JoinSource joinSource;

  /// A <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/batch-transform-data-processing.html#data-processing-operators">JSONPath</a>
  /// expression used to select a portion of the joined dataset to save in the
  /// output file for a batch transform job. If you want Amazon SageMaker to store
  /// the entire input dataset in the output file, leave the default value,
  /// <code>$</code>. If you specify indexes that aren't within the dimension size
  /// of the joined dataset, you get an error.
  ///
  /// Examples: <code>"$"</code>, <code>"$[0,5:]"</code>,
  /// <code>"$['id','SageMakerOutput']"</code>
  @_s.JsonKey(name: 'OutputFilter')
  final String outputFilter;

  DataProcessing({
    this.inputFilter,
    this.joinSource,
    this.outputFilter,
  });
  factory DataProcessing.fromJson(Map<String, dynamic> json) =>
      _$DataProcessingFromJson(json);

  Map<String, dynamic> toJson() => _$DataProcessingToJson(this);
}

/// Describes the location of the channel data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSource {
  /// The file system that is associated with a channel.
  @_s.JsonKey(name: 'FileSystemDataSource')
  final FileSystemDataSource fileSystemDataSource;

  /// The S3 location of the data source that is associated with a channel.
  @_s.JsonKey(name: 'S3DataSource')
  final S3DataSource s3DataSource;

  DataSource({
    this.fileSystemDataSource,
    this.s3DataSource,
  });
  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceToJson(this);
}

/// Configuration information for the debug hook parameters, collection
/// configuration, and storage paths.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DebugHookConfig {
  /// Path to Amazon S3 storage location for tensors.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  /// Configuration information for tensor collections.
  @_s.JsonKey(name: 'CollectionConfigurations')
  final List<CollectionConfiguration> collectionConfigurations;

  /// Configuration information for the debug hook parameters.
  @_s.JsonKey(name: 'HookParameters')
  final Map<String, String> hookParameters;

  /// Path to local storage location for tensors. Defaults to
  /// <code>/opt/ml/output/tensors/</code>.
  @_s.JsonKey(name: 'LocalPath')
  final String localPath;

  DebugHookConfig({
    @_s.required this.s3OutputPath,
    this.collectionConfigurations,
    this.hookParameters,
    this.localPath,
  });
  factory DebugHookConfig.fromJson(Map<String, dynamic> json) =>
      _$DebugHookConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DebugHookConfigToJson(this);
}

/// Configuration information for debugging rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DebugRuleConfiguration {
  /// The name of the rule configuration. It must be unique relative to other rule
  /// configuration names.
  @_s.JsonKey(name: 'RuleConfigurationName')
  final String ruleConfigurationName;

  /// The Amazon Elastic Container (ECR) Image for the managed rule evaluation.
  @_s.JsonKey(name: 'RuleEvaluatorImage')
  final String ruleEvaluatorImage;

  /// The instance type to deploy for a training job.
  @_s.JsonKey(name: 'InstanceType')
  final ProcessingInstanceType instanceType;

  /// Path to local storage location for output of rules. Defaults to
  /// <code>/opt/ml/processing/output/rule/</code>.
  @_s.JsonKey(name: 'LocalPath')
  final String localPath;

  /// Runtime configuration for rule container.
  @_s.JsonKey(name: 'RuleParameters')
  final Map<String, String> ruleParameters;

  /// Path to Amazon S3 storage location for rules.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  /// The size, in GB, of the ML storage volume attached to the processing
  /// instance.
  @_s.JsonKey(name: 'VolumeSizeInGB')
  final int volumeSizeInGB;

  DebugRuleConfiguration({
    @_s.required this.ruleConfigurationName,
    @_s.required this.ruleEvaluatorImage,
    this.instanceType,
    this.localPath,
    this.ruleParameters,
    this.s3OutputPath,
    this.volumeSizeInGB,
  });
  factory DebugRuleConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DebugRuleConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DebugRuleConfigurationToJson(this);
}

/// Information about the status of the rule evaluation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DebugRuleEvaluationStatus {
  /// Timestamp when the rule evaluation status was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The name of the rule configuration
  @_s.JsonKey(name: 'RuleConfigurationName')
  final String ruleConfigurationName;

  /// The Amazon Resource Name (ARN) of the rule evaluation job.
  @_s.JsonKey(name: 'RuleEvaluationJobArn')
  final String ruleEvaluationJobArn;

  /// Status of the rule evaluation.
  @_s.JsonKey(name: 'RuleEvaluationStatus')
  final RuleEvaluationStatus ruleEvaluationStatus;

  /// Details from the rule evaluation.
  @_s.JsonKey(name: 'StatusDetails')
  final String statusDetails;

  DebugRuleEvaluationStatus({
    this.lastModifiedTime,
    this.ruleConfigurationName,
    this.ruleEvaluationJobArn,
    this.ruleEvaluationStatus,
    this.statusDetails,
  });
  factory DebugRuleEvaluationStatus.fromJson(Map<String, dynamic> json) =>
      _$DebugRuleEvaluationStatusFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteExperimentResponse {
  /// The Amazon Resource Name (ARN) of the experiment that is being deleted.
  @_s.JsonKey(name: 'ExperimentArn')
  final String experimentArn;

  DeleteExperimentResponse({
    this.experimentArn,
  });
  factory DeleteExperimentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteExperimentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFlowDefinitionResponse {
  DeleteFlowDefinitionResponse();
  factory DeleteFlowDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFlowDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTagsOutput {
  DeleteTagsOutput();
  factory DeleteTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteTagsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTrialComponentResponse {
  /// The Amazon Resource Name (ARN) of the component is being deleted.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  DeleteTrialComponentResponse({
    this.trialComponentArn,
  });
  factory DeleteTrialComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTrialComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteTrialResponse {
  /// The Amazon Resource Name (ARN) of the trial that is being deleted.
  @_s.JsonKey(name: 'TrialArn')
  final String trialArn;

  DeleteTrialResponse({
    this.trialArn,
  });
  factory DeleteTrialResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteTrialResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWorkteamResponse {
  /// Returns <code>true</code> if the work team was successfully deleted;
  /// otherwise, returns <code>false</code>.
  @_s.JsonKey(name: 'Success')
  final bool success;

  DeleteWorkteamResponse({
    @_s.required this.success,
  });
  factory DeleteWorkteamResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteWorkteamResponseFromJson(json);
}

/// Gets the Amazon EC2 Container Registry path of the docker image of the model
/// that is hosted in this <a>ProductionVariant</a>.
///
/// If you used the <code>registry/repository[:tag]</code> form to specify the
/// image path of the primary container when you created the model hosted in
/// this <code>ProductionVariant</code>, the path resolves to a path of the form
/// <code>registry/repository[@digest]</code>. A digest is a hash value that
/// identifies a specific version of an image. For information about Amazon ECR
/// paths, see <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/docker-pull-ecr-image.html">Pulling
/// an Image</a> in the <i>Amazon ECR User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeployedImage {
  /// The date and time when the image path for the model resolved to the
  /// <code>ResolvedImage</code>
  @_s.JsonKey(
      name: 'ResolutionTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime resolutionTime;

  /// The specific digest path of the image hosted in this
  /// <code>ProductionVariant</code>.
  @_s.JsonKey(name: 'ResolvedImage')
  final String resolvedImage;

  /// The image path you specified when you created the model.
  @_s.JsonKey(name: 'SpecifiedImage')
  final String specifiedImage;

  DeployedImage({
    this.resolutionTime,
    this.resolvedImage,
    this.specifiedImage,
  });
  factory DeployedImage.fromJson(Map<String, dynamic> json) =>
      _$DeployedImageFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAlgorithmOutput {
  /// The Amazon Resource Name (ARN) of the algorithm.
  @_s.JsonKey(name: 'AlgorithmArn')
  final String algorithmArn;

  /// The name of the algorithm being described.
  @_s.JsonKey(name: 'AlgorithmName')
  final String algorithmName;

  /// The current status of the algorithm.
  @_s.JsonKey(name: 'AlgorithmStatus')
  final AlgorithmStatus algorithmStatus;

  /// Details about the current status of the algorithm.
  @_s.JsonKey(name: 'AlgorithmStatusDetails')
  final AlgorithmStatusDetails algorithmStatusDetails;

  /// A timestamp specifying when the algorithm was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// Details about training jobs run by this algorithm.
  @_s.JsonKey(name: 'TrainingSpecification')
  final TrainingSpecification trainingSpecification;

  /// A brief summary about the algorithm.
  @_s.JsonKey(name: 'AlgorithmDescription')
  final String algorithmDescription;

  /// Whether the algorithm is certified to be listed in AWS Marketplace.
  @_s.JsonKey(name: 'CertifyForMarketplace')
  final bool certifyForMarketplace;

  /// Details about inference jobs that the algorithm runs.
  @_s.JsonKey(name: 'InferenceSpecification')
  final InferenceSpecification inferenceSpecification;

  /// The product identifier of the algorithm.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  /// Details about configurations for one or more training jobs that Amazon
  /// SageMaker runs to test the algorithm.
  @_s.JsonKey(name: 'ValidationSpecification')
  final AlgorithmValidationSpecification validationSpecification;

  DescribeAlgorithmOutput({
    @_s.required this.algorithmArn,
    @_s.required this.algorithmName,
    @_s.required this.algorithmStatus,
    @_s.required this.algorithmStatusDetails,
    @_s.required this.creationTime,
    @_s.required this.trainingSpecification,
    this.algorithmDescription,
    this.certifyForMarketplace,
    this.inferenceSpecification,
    this.productId,
    this.validationSpecification,
  });
  factory DescribeAlgorithmOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeAlgorithmOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAppResponse {
  /// The app's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'AppArn')
  final String appArn;

  /// The name of the app.
  @_s.JsonKey(name: 'AppName')
  final String appName;

  /// The type of app.
  @_s.JsonKey(name: 'AppType')
  final AppType appType;

  /// The creation time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The domain ID.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// The failure reason.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The timestamp of the last health check.
  @_s.JsonKey(
      name: 'LastHealthCheckTimestamp',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime lastHealthCheckTimestamp;

  /// The timestamp of the last user's activity.
  @_s.JsonKey(
      name: 'LastUserActivityTimestamp',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime lastUserActivityTimestamp;

  /// The instance type and quantity.
  @_s.JsonKey(name: 'ResourceSpec')
  final ResourceSpec resourceSpec;

  /// The status.
  @_s.JsonKey(name: 'Status')
  final AppStatus status;

  /// The user profile name.
  @_s.JsonKey(name: 'UserProfileName')
  final String userProfileName;

  DescribeAppResponse({
    this.appArn,
    this.appName,
    this.appType,
    this.creationTime,
    this.domainId,
    this.failureReason,
    this.lastHealthCheckTimestamp,
    this.lastUserActivityTimestamp,
    this.resourceSpec,
    this.status,
    this.userProfileName,
  });
  factory DescribeAppResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAutoMLJobResponse {
  /// Returns the job's ARN.
  @_s.JsonKey(name: 'AutoMLJobArn')
  final String autoMLJobArn;

  /// Returns the name of a job.
  @_s.JsonKey(name: 'AutoMLJobName')
  final String autoMLJobName;

  /// Returns the job's AutoMLJobSecondaryStatus.
  @_s.JsonKey(name: 'AutoMLJobSecondaryStatus')
  final AutoMLJobSecondaryStatus autoMLJobSecondaryStatus;

  /// Returns the job's AutoMLJobStatus.
  @_s.JsonKey(name: 'AutoMLJobStatus')
  final AutoMLJobStatus autoMLJobStatus;

  /// Returns the job's creation time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// Returns the job's input data config.
  @_s.JsonKey(name: 'InputDataConfig')
  final List<AutoMLChannel> inputDataConfig;

  /// Returns the job's last modified time.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// Returns the job's output data config.
  @_s.JsonKey(name: 'OutputDataConfig')
  final AutoMLOutputDataConfig outputDataConfig;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that has read permission to the input data location and write
  /// permission to the output data location in Amazon S3.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Returns information on the job's artifacts found in AutoMLJobArtifacts.
  @_s.JsonKey(name: 'AutoMLJobArtifacts')
  final AutoMLJobArtifacts autoMLJobArtifacts;

  /// Returns the job's config.
  @_s.JsonKey(name: 'AutoMLJobConfig')
  final AutoMLJobConfig autoMLJobConfig;

  /// Returns the job's objective.
  @_s.JsonKey(name: 'AutoMLJobObjective')
  final AutoMLJobObjective autoMLJobObjective;

  /// Returns the job's BestCandidate.
  @_s.JsonKey(name: 'BestCandidate')
  final AutoMLCandidate bestCandidate;

  /// Returns the job's end time.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// Returns the job's FailureReason.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Returns the job's output from GenerateCandidateDefinitionsOnly.
  @_s.JsonKey(name: 'GenerateCandidateDefinitionsOnly')
  final bool generateCandidateDefinitionsOnly;

  /// Returns the job's problem type.
  @_s.JsonKey(name: 'ProblemType')
  final ProblemType problemType;

  /// This contains ProblemType, AutoMLJobObjective and CompletionCriteria.
  /// They're auto-inferred values, if not provided by you. If you do provide
  /// them, then they'll be the same as provided.
  @_s.JsonKey(name: 'ResolvedAttributes')
  final ResolvedAttributes resolvedAttributes;

  DescribeAutoMLJobResponse({
    @_s.required this.autoMLJobArn,
    @_s.required this.autoMLJobName,
    @_s.required this.autoMLJobSecondaryStatus,
    @_s.required this.autoMLJobStatus,
    @_s.required this.creationTime,
    @_s.required this.inputDataConfig,
    @_s.required this.lastModifiedTime,
    @_s.required this.outputDataConfig,
    @_s.required this.roleArn,
    this.autoMLJobArtifacts,
    this.autoMLJobConfig,
    this.autoMLJobObjective,
    this.bestCandidate,
    this.endTime,
    this.failureReason,
    this.generateCandidateDefinitionsOnly,
    this.problemType,
    this.resolvedAttributes,
  });
  factory DescribeAutoMLJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAutoMLJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCodeRepositoryOutput {
  /// The Amazon Resource Name (ARN) of the Git repository.
  @_s.JsonKey(name: 'CodeRepositoryArn')
  final String codeRepositoryArn;

  /// The name of the Git repository.
  @_s.JsonKey(name: 'CodeRepositoryName')
  final String codeRepositoryName;

  /// The date and time that the repository was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The date and time that the repository was last changed.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// Configuration details about the repository, including the URL where the
  /// repository is located, the default branch, and the Amazon Resource Name
  /// (ARN) of the AWS Secrets Manager secret that contains the credentials used
  /// to access the repository.
  @_s.JsonKey(name: 'GitConfig')
  final GitConfig gitConfig;

  DescribeCodeRepositoryOutput({
    @_s.required this.codeRepositoryArn,
    @_s.required this.codeRepositoryName,
    @_s.required this.creationTime,
    @_s.required this.lastModifiedTime,
    this.gitConfig,
  });
  factory DescribeCodeRepositoryOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeCodeRepositoryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeCompilationJobResponse {
  /// The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker assumes
  /// to perform the model compilation job.
  @_s.JsonKey(name: 'CompilationJobArn')
  final String compilationJobArn;

  /// The name of the model compilation job.
  @_s.JsonKey(name: 'CompilationJobName')
  final String compilationJobName;

  /// The status of the model compilation job.
  @_s.JsonKey(name: 'CompilationJobStatus')
  final CompilationJobStatus compilationJobStatus;

  /// The time that the model compilation job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// If a model compilation job failed, the reason it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Information about the location in Amazon S3 of the input model artifacts,
  /// the name and shape of the expected data inputs, and the framework in which
  /// the model was trained.
  @_s.JsonKey(name: 'InputConfig')
  final InputConfig inputConfig;

  /// The time that the status of the model compilation job was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// Information about the location in Amazon S3 that has been configured for
  /// storing the model artifacts used in the compilation job.
  @_s.JsonKey(name: 'ModelArtifacts')
  final ModelArtifacts modelArtifacts;

  /// Information about the output location for the compiled model and the target
  /// device that the model runs on.
  @_s.JsonKey(name: 'OutputConfig')
  final OutputConfig outputConfig;

  /// The Amazon Resource Name (ARN) of the model compilation job.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Specifies a limit to how long a model compilation job can run. When the job
  /// reaches the time limit, Amazon SageMaker ends the compilation job. Use this
  /// API to cap model training costs.
  @_s.JsonKey(name: 'StoppingCondition')
  final StoppingCondition stoppingCondition;

  /// The time when the model compilation job on a compilation job instance ended.
  /// For a successful or stopped job, this is when the job's model artifacts have
  /// finished uploading. For a failed job, this is when Amazon SageMaker detected
  /// that the job failed.
  @_s.JsonKey(
      name: 'CompilationEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime compilationEndTime;

  /// The time when the model compilation job started the
  /// <code>CompilationJob</code> instances.
  ///
  /// You are billed for the time between this timestamp and the timestamp in the
  /// <a>DescribeCompilationJobResponse$CompilationEndTime</a> field. In Amazon
  /// CloudWatch Logs, the start time might be later than this time. That's
  /// because it takes time to download the compilation job, which depends on the
  /// size of the compilation job container.
  @_s.JsonKey(
      name: 'CompilationStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime compilationStartTime;

  DescribeCompilationJobResponse({
    @_s.required this.compilationJobArn,
    @_s.required this.compilationJobName,
    @_s.required this.compilationJobStatus,
    @_s.required this.creationTime,
    @_s.required this.failureReason,
    @_s.required this.inputConfig,
    @_s.required this.lastModifiedTime,
    @_s.required this.modelArtifacts,
    @_s.required this.outputConfig,
    @_s.required this.roleArn,
    @_s.required this.stoppingCondition,
    this.compilationEndTime,
    this.compilationStartTime,
  });
  factory DescribeCompilationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeCompilationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDomainResponse {
  /// The domain's authentication mode.
  @_s.JsonKey(name: 'AuthMode')
  final AuthMode authMode;

  /// The creation time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// Settings which are applied to all UserProfile in this domain, if settings
  /// are not explicitly specified in a given UserProfile.
  @_s.JsonKey(name: 'DefaultUserSettings')
  final UserSettings defaultUserSettings;

  /// The domain's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'DomainArn')
  final String domainArn;

  /// The domain ID.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// The domain name.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The failure reason.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The ID of the Amazon Elastic File System (EFS) managed by this Domain.
  @_s.JsonKey(name: 'HomeEfsFileSystemId')
  final String homeEfsFileSystemId;

  /// The AWS Key Management Service encryption key ID.
  @_s.JsonKey(name: 'HomeEfsFileSystemKmsKeyId')
  final String homeEfsFileSystemKmsKeyId;

  /// The last modified time.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The SSO managed application instance ID.
  @_s.JsonKey(name: 'SingleSignOnManagedApplicationInstanceId')
  final String singleSignOnManagedApplicationInstanceId;

  /// The status.
  @_s.JsonKey(name: 'Status')
  final DomainStatus status;

  /// Security setting to limit to a set of subnets.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  /// The domain's URL.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// The ID of the Amazon Virtual Private Cloud.
  @_s.JsonKey(name: 'VpcId')
  final String vpcId;

  DescribeDomainResponse({
    this.authMode,
    this.creationTime,
    this.defaultUserSettings,
    this.domainArn,
    this.domainId,
    this.domainName,
    this.failureReason,
    this.homeEfsFileSystemId,
    this.homeEfsFileSystemKmsKeyId,
    this.lastModifiedTime,
    this.singleSignOnManagedApplicationInstanceId,
    this.status,
    this.subnetIds,
    this.url,
    this.vpcId,
  });
  factory DescribeDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointConfigOutput {
  /// A timestamp that shows when the endpoint configuration was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the endpoint configuration.
  @_s.JsonKey(name: 'EndpointConfigArn')
  final String endpointConfigArn;

  /// Name of the Amazon SageMaker endpoint configuration.
  @_s.JsonKey(name: 'EndpointConfigName')
  final String endpointConfigName;

  /// An array of <code>ProductionVariant</code> objects, one for each model that
  /// you want to host at this endpoint.
  @_s.JsonKey(name: 'ProductionVariants')
  final List<ProductionVariant> productionVariants;
  @_s.JsonKey(name: 'DataCaptureConfig')
  final DataCaptureConfig dataCaptureConfig;

  /// AWS KMS key ID Amazon SageMaker uses to encrypt data when storing it on the
  /// ML storage volume attached to the instance.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  DescribeEndpointConfigOutput({
    @_s.required this.creationTime,
    @_s.required this.endpointConfigArn,
    @_s.required this.endpointConfigName,
    @_s.required this.productionVariants,
    this.dataCaptureConfig,
    this.kmsKeyId,
  });
  factory DescribeEndpointConfigOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointConfigOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEndpointOutput {
  /// A timestamp that shows when the endpoint was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  /// The name of the endpoint configuration associated with this endpoint.
  @_s.JsonKey(name: 'EndpointConfigName')
  final String endpointConfigName;

  /// Name of the endpoint.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// The status of the endpoint.
  ///
  /// <ul>
  /// <li>
  /// <code>OutOfService</code>: Endpoint is not available to take incoming
  /// requests.
  /// </li>
  /// <li>
  /// <code>Creating</code>: <a>CreateEndpoint</a> is executing.
  /// </li>
  /// <li>
  /// <code>Updating</code>: <a>UpdateEndpoint</a> or
  /// <a>UpdateEndpointWeightsAndCapacities</a> is executing.
  /// </li>
  /// <li>
  /// <code>SystemUpdating</code>: Endpoint is undergoing maintenance and cannot
  /// be updated or deleted or re-scaled until it has completed. This maintenance
  /// operation does not change any customer-specified values such as VPC config,
  /// KMS encryption, model, instance type, or instance count.
  /// </li>
  /// <li>
  /// <code>RollingBack</code>: Endpoint fails to scale up or down or change its
  /// variant weight and is in the process of rolling back to its previous
  /// configuration. Once the rollback completes, endpoint returns to an
  /// <code>InService</code> status. This transitional status only applies to an
  /// endpoint that has autoscaling enabled and is undergoing variant weight or
  /// capacity changes as part of an <a>UpdateEndpointWeightsAndCapacities</a>
  /// call or when the <a>UpdateEndpointWeightsAndCapacities</a> operation is
  /// called explicitly.
  /// </li>
  /// <li>
  /// <code>InService</code>: Endpoint is available to process incoming requests.
  /// </li>
  /// <li>
  /// <code>Deleting</code>: <a>DeleteEndpoint</a> is executing.
  /// </li>
  /// <li>
  /// <code>Failed</code>: Endpoint could not be created, updated, or re-scaled.
  /// Use <a>DescribeEndpointOutput$FailureReason</a> for information about the
  /// failure. <a>DeleteEndpoint</a> is the only operation that can be performed
  /// on a failed endpoint.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'EndpointStatus')
  final EndpointStatus endpointStatus;

  /// A timestamp that shows when the endpoint was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;
  @_s.JsonKey(name: 'DataCaptureConfig')
  final DataCaptureConfigSummary dataCaptureConfig;

  /// If the status of the endpoint is <code>Failed</code>, the reason why it
  /// failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// An array of <a>ProductionVariantSummary</a> objects, one for each model
  /// hosted behind this endpoint.
  @_s.JsonKey(name: 'ProductionVariants')
  final List<ProductionVariantSummary> productionVariants;

  DescribeEndpointOutput({
    @_s.required this.creationTime,
    @_s.required this.endpointArn,
    @_s.required this.endpointConfigName,
    @_s.required this.endpointName,
    @_s.required this.endpointStatus,
    @_s.required this.lastModifiedTime,
    this.dataCaptureConfig,
    this.failureReason,
    this.productionVariants,
  });
  factory DescribeEndpointOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeEndpointOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeExperimentResponse {
  /// Who created the experiment.
  @_s.JsonKey(name: 'CreatedBy')
  final UserContext createdBy;

  /// When the experiment was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The description of the experiment.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the experiment as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>ExperimentName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The Amazon Resource Name (ARN) of the experiment.
  @_s.JsonKey(name: 'ExperimentArn')
  final String experimentArn;

  /// The name of the experiment.
  @_s.JsonKey(name: 'ExperimentName')
  final String experimentName;

  /// Who last modified the experiment.
  @_s.JsonKey(name: 'LastModifiedBy')
  final UserContext lastModifiedBy;

  /// When the experiment was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The ARN of the source and, optionally, the type.
  @_s.JsonKey(name: 'Source')
  final ExperimentSource source;

  DescribeExperimentResponse({
    this.createdBy,
    this.creationTime,
    this.description,
    this.displayName,
    this.experimentArn,
    this.experimentName,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.source,
  });
  factory DescribeExperimentResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeExperimentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFlowDefinitionResponse {
  /// The timestamp when the flow definition was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the flow defintion.
  @_s.JsonKey(name: 'FlowDefinitionArn')
  final String flowDefinitionArn;

  /// The Amazon Resource Name (ARN) of the flow definition.
  @_s.JsonKey(name: 'FlowDefinitionName')
  final String flowDefinitionName;

  /// The status of the flow definition. Valid values are listed below.
  @_s.JsonKey(name: 'FlowDefinitionStatus')
  final FlowDefinitionStatus flowDefinitionStatus;

  /// An object containing information about who works on the task, the workforce
  /// task price, and other task details.
  @_s.JsonKey(name: 'HumanLoopConfig')
  final HumanLoopConfig humanLoopConfig;

  /// An object containing information about the output file.
  @_s.JsonKey(name: 'OutputConfig')
  final FlowDefinitionOutputConfig outputConfig;

  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) execution role for the flow definition.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// <p/>
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// An object containing information about what triggers a human review
  /// workflow.
  @_s.JsonKey(name: 'HumanLoopActivationConfig')
  final HumanLoopActivationConfig humanLoopActivationConfig;

  /// Container for configuring the source of human task requests. Used to specify
  /// if Amazon Rekognition or Amazon Textract is used as an integration source.
  @_s.JsonKey(name: 'HumanLoopRequestSource')
  final HumanLoopRequestSource humanLoopRequestSource;

  DescribeFlowDefinitionResponse({
    @_s.required this.creationTime,
    @_s.required this.flowDefinitionArn,
    @_s.required this.flowDefinitionName,
    @_s.required this.flowDefinitionStatus,
    @_s.required this.humanLoopConfig,
    @_s.required this.outputConfig,
    @_s.required this.roleArn,
    this.failureReason,
    this.humanLoopActivationConfig,
    this.humanLoopRequestSource,
  });
  factory DescribeFlowDefinitionResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFlowDefinitionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHumanTaskUiResponse {
  /// The timestamp when the human task user interface was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the human task user interface.
  @_s.JsonKey(name: 'HumanTaskUiArn')
  final String humanTaskUiArn;

  /// The name of the human task user interface.
  @_s.JsonKey(name: 'HumanTaskUiName')
  final String humanTaskUiName;
  @_s.JsonKey(name: 'UiTemplate')
  final UiTemplateInfo uiTemplate;

  DescribeHumanTaskUiResponse({
    @_s.required this.creationTime,
    @_s.required this.humanTaskUiArn,
    @_s.required this.humanTaskUiName,
    @_s.required this.uiTemplate,
  });
  factory DescribeHumanTaskUiResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeHumanTaskUiResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeHyperParameterTuningJobResponse {
  /// The date and time that the tuning job started.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the tuning job.
  @_s.JsonKey(name: 'HyperParameterTuningJobArn')
  final String hyperParameterTuningJobArn;

  /// The <a>HyperParameterTuningJobConfig</a> object that specifies the
  /// configuration of the tuning job.
  @_s.JsonKey(name: 'HyperParameterTuningJobConfig')
  final HyperParameterTuningJobConfig hyperParameterTuningJobConfig;

  /// The name of the tuning job.
  @_s.JsonKey(name: 'HyperParameterTuningJobName')
  final String hyperParameterTuningJobName;

  /// The status of the tuning job: InProgress, Completed, Failed, Stopping, or
  /// Stopped.
  @_s.JsonKey(name: 'HyperParameterTuningJobStatus')
  final HyperParameterTuningJobStatus hyperParameterTuningJobStatus;

  /// The <a>ObjectiveStatusCounters</a> object that specifies the number of
  /// training jobs, categorized by the status of their final objective metric,
  /// that this tuning job launched.
  @_s.JsonKey(name: 'ObjectiveStatusCounters')
  final ObjectiveStatusCounters objectiveStatusCounters;

  /// The <a>TrainingJobStatusCounters</a> object that specifies the number of
  /// training jobs, categorized by status, that this tuning job launched.
  @_s.JsonKey(name: 'TrainingJobStatusCounters')
  final TrainingJobStatusCounters trainingJobStatusCounters;

  /// A <a>TrainingJobSummary</a> object that describes the training job that
  /// completed with the best current <a>HyperParameterTuningJobObjective</a>.
  @_s.JsonKey(name: 'BestTrainingJob')
  final HyperParameterTrainingJobSummary bestTrainingJob;

  /// If the tuning job failed, the reason it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The date and time that the tuning job ended.
  @_s.JsonKey(
      name: 'HyperParameterTuningEndTime',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime hyperParameterTuningEndTime;

  /// The date and time that the status of the tuning job was modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// If the hyperparameter tuning job is an warm start tuning job with a
  /// <code>WarmStartType</code> of <code>IDENTICAL_DATA_AND_ALGORITHM</code>,
  /// this is the <a>TrainingJobSummary</a> for the training job with the best
  /// objective metric value of all training jobs launched by this tuning job and
  /// all parent jobs specified for the warm start tuning job.
  @_s.JsonKey(name: 'OverallBestTrainingJob')
  final HyperParameterTrainingJobSummary overallBestTrainingJob;

  /// The <a>HyperParameterTrainingJobDefinition</a> object that specifies the
  /// definition of the training jobs that this tuning job launches.
  @_s.JsonKey(name: 'TrainingJobDefinition')
  final HyperParameterTrainingJobDefinition trainingJobDefinition;

  /// <p/>
  @_s.JsonKey(name: 'TrainingJobDefinitions')
  final List<HyperParameterTrainingJobDefinition> trainingJobDefinitions;

  /// The configuration for starting the hyperparameter parameter tuning job using
  /// one or more previous tuning jobs as a starting point. The results of
  /// previous tuning jobs are used to inform which combinations of
  /// hyperparameters to search over in the new tuning job.
  @_s.JsonKey(name: 'WarmStartConfig')
  final HyperParameterTuningJobWarmStartConfig warmStartConfig;

  DescribeHyperParameterTuningJobResponse({
    @_s.required this.creationTime,
    @_s.required this.hyperParameterTuningJobArn,
    @_s.required this.hyperParameterTuningJobConfig,
    @_s.required this.hyperParameterTuningJobName,
    @_s.required this.hyperParameterTuningJobStatus,
    @_s.required this.objectiveStatusCounters,
    @_s.required this.trainingJobStatusCounters,
    this.bestTrainingJob,
    this.failureReason,
    this.hyperParameterTuningEndTime,
    this.lastModifiedTime,
    this.overallBestTrainingJob,
    this.trainingJobDefinition,
    this.trainingJobDefinitions,
    this.warmStartConfig,
  });
  factory DescribeHyperParameterTuningJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeHyperParameterTuningJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeLabelingJobResponse {
  /// The date and time that the labeling job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// Configuration information required for human workers to complete a labeling
  /// task.
  @_s.JsonKey(name: 'HumanTaskConfig')
  final HumanTaskConfig humanTaskConfig;

  /// Input configuration information for the labeling job, such as the Amazon S3
  /// location of the data objects and the location of the manifest file that
  /// describes the data objects.
  @_s.JsonKey(name: 'InputConfig')
  final LabelingJobInputConfig inputConfig;

  /// A unique identifier for work done as part of a labeling job.
  @_s.JsonKey(name: 'JobReferenceCode')
  final String jobReferenceCode;

  /// Provides a breakdown of the number of data objects labeled by humans, the
  /// number of objects labeled by machine, the number of objects than couldn't be
  /// labeled, and the total number of objects labeled.
  @_s.JsonKey(name: 'LabelCounters')
  final LabelCounters labelCounters;

  /// The Amazon Resource Name (ARN) of the labeling job.
  @_s.JsonKey(name: 'LabelingJobArn')
  final String labelingJobArn;

  /// The name assigned to the labeling job when it was created.
  @_s.JsonKey(name: 'LabelingJobName')
  final String labelingJobName;

  /// The processing status of the labeling job.
  @_s.JsonKey(name: 'LabelingJobStatus')
  final LabelingJobStatus labelingJobStatus;

  /// The date and time that the labeling job was last updated.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The location of the job's output data and the AWS Key Management Service key
  /// ID for the key used to encrypt the output data, if any.
  @_s.JsonKey(name: 'OutputConfig')
  final LabelingJobOutputConfig outputConfig;

  /// The Amazon Resource Name (ARN) that Amazon SageMaker assumes to perform
  /// tasks on your behalf during data labeling.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// If the job failed, the reason that it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The attribute used as the label in the output manifest file.
  @_s.JsonKey(name: 'LabelAttributeName')
  final String labelAttributeName;

  /// The S3 location of the JSON file that defines the categories used to label
  /// data objects. Please note the following label-category limits:
  ///
  /// <ul>
  /// <li>
  /// Semantic segmentation labeling jobs using automated labeling: 20 labels
  /// </li>
  /// <li>
  /// Box bounding labeling jobs (all): 10 labels
  /// </li>
  /// </ul>
  /// The file is a JSON structure in the following format:
  ///
  /// <code>{</code>
  ///
  /// <code> "document-version": "2018-11-28"</code>
  ///
  /// <code> "labels": [</code>
  ///
  /// <code> {</code>
  ///
  /// <code> "label": "<i>label 1</i>"</code>
  ///
  /// <code> },</code>
  ///
  /// <code> {</code>
  ///
  /// <code> "label": "<i>label 2</i>"</code>
  ///
  /// <code> },</code>
  ///
  /// <code> ...</code>
  ///
  /// <code> {</code>
  ///
  /// <code> "label": "<i>label n</i>"</code>
  ///
  /// <code> }</code>
  ///
  /// <code> ]</code>
  ///
  /// <code>}</code>
  @_s.JsonKey(name: 'LabelCategoryConfigS3Uri')
  final String labelCategoryConfigS3Uri;

  /// Configuration information for automated data labeling.
  @_s.JsonKey(name: 'LabelingJobAlgorithmsConfig')
  final LabelingJobAlgorithmsConfig labelingJobAlgorithmsConfig;

  /// The location of the output produced by the labeling job.
  @_s.JsonKey(name: 'LabelingJobOutput')
  final LabelingJobOutput labelingJobOutput;

  /// A set of conditions for stopping a labeling job. If any of the conditions
  /// are met, the job is automatically stopped.
  @_s.JsonKey(name: 'StoppingConditions')
  final LabelingJobStoppingConditions stoppingConditions;

  /// An array of key/value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  DescribeLabelingJobResponse({
    @_s.required this.creationTime,
    @_s.required this.humanTaskConfig,
    @_s.required this.inputConfig,
    @_s.required this.jobReferenceCode,
    @_s.required this.labelCounters,
    @_s.required this.labelingJobArn,
    @_s.required this.labelingJobName,
    @_s.required this.labelingJobStatus,
    @_s.required this.lastModifiedTime,
    @_s.required this.outputConfig,
    @_s.required this.roleArn,
    this.failureReason,
    this.labelAttributeName,
    this.labelCategoryConfigS3Uri,
    this.labelingJobAlgorithmsConfig,
    this.labelingJobOutput,
    this.stoppingConditions,
    this.tags,
  });
  factory DescribeLabelingJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeLabelingJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeModelOutput {
  /// A timestamp that shows when the model was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the IAM role that you specified for the
  /// model.
  @_s.JsonKey(name: 'ExecutionRoleArn')
  final String executionRoleArn;

  /// The Amazon Resource Name (ARN) of the model.
  @_s.JsonKey(name: 'ModelArn')
  final String modelArn;

  /// Name of the Amazon SageMaker model.
  @_s.JsonKey(name: 'ModelName')
  final String modelName;

  /// The containers in the inference pipeline.
  @_s.JsonKey(name: 'Containers')
  final List<ContainerDefinition> containers;

  /// If <code>True</code>, no inbound or outbound network calls can be made to or
  /// from the model container.
  @_s.JsonKey(name: 'EnableNetworkIsolation')
  final bool enableNetworkIsolation;

  /// The location of the primary inference code, associated artifacts, and custom
  /// environment map that the inference code uses when it is deployed in
  /// production.
  @_s.JsonKey(name: 'PrimaryContainer')
  final ContainerDefinition primaryContainer;

  /// A <a>VpcConfig</a> object that specifies the VPC that this model has access
  /// to. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html">Protect
  /// Endpoints by Using an Amazon Virtual Private Cloud</a>
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  DescribeModelOutput({
    @_s.required this.creationTime,
    @_s.required this.executionRoleArn,
    @_s.required this.modelArn,
    @_s.required this.modelName,
    this.containers,
    this.enableNetworkIsolation,
    this.primaryContainer,
    this.vpcConfig,
  });
  factory DescribeModelOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeModelOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeModelPackageOutput {
  /// A timestamp specifying when the model package was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the model package.
  @_s.JsonKey(name: 'ModelPackageArn')
  final String modelPackageArn;

  /// The name of the model package being described.
  @_s.JsonKey(name: 'ModelPackageName')
  final String modelPackageName;

  /// The current status of the model package.
  @_s.JsonKey(name: 'ModelPackageStatus')
  final ModelPackageStatus modelPackageStatus;

  /// Details about the current status of the model package.
  @_s.JsonKey(name: 'ModelPackageStatusDetails')
  final ModelPackageStatusDetails modelPackageStatusDetails;

  /// Whether the model package is certified for listing on AWS Marketplace.
  @_s.JsonKey(name: 'CertifyForMarketplace')
  final bool certifyForMarketplace;

  /// Details about inference jobs that can be run with models based on this model
  /// package.
  @_s.JsonKey(name: 'InferenceSpecification')
  final InferenceSpecification inferenceSpecification;

  /// A brief summary of the model package.
  @_s.JsonKey(name: 'ModelPackageDescription')
  final String modelPackageDescription;

  /// Details about the algorithm that was used to create the model package.
  @_s.JsonKey(name: 'SourceAlgorithmSpecification')
  final SourceAlgorithmSpecification sourceAlgorithmSpecification;

  /// Configurations for one or more transform jobs that Amazon SageMaker runs to
  /// test the model package.
  @_s.JsonKey(name: 'ValidationSpecification')
  final ModelPackageValidationSpecification validationSpecification;

  DescribeModelPackageOutput({
    @_s.required this.creationTime,
    @_s.required this.modelPackageArn,
    @_s.required this.modelPackageName,
    @_s.required this.modelPackageStatus,
    @_s.required this.modelPackageStatusDetails,
    this.certifyForMarketplace,
    this.inferenceSpecification,
    this.modelPackageDescription,
    this.sourceAlgorithmSpecification,
    this.validationSpecification,
  });
  factory DescribeModelPackageOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeModelPackageOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeMonitoringScheduleResponse {
  /// The time at which the monitoring job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The time at which the monitoring job was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleArn')
  final String monitoringScheduleArn;

  /// The configuration object that specifies the monitoring schedule and defines
  /// the monitoring job.
  @_s.JsonKey(name: 'MonitoringScheduleConfig')
  final MonitoringScheduleConfig monitoringScheduleConfig;

  /// Name of the monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleName')
  final String monitoringScheduleName;

  /// The status of an monitoring job.
  @_s.JsonKey(name: 'MonitoringScheduleStatus')
  final ScheduleStatus monitoringScheduleStatus;

  /// The name of the endpoint for the monitoring job.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// A string, up to one KB in size, that contains the reason a monitoring job
  /// failed, if it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Describes metadata on the last execution to run, if there was one.
  @_s.JsonKey(name: 'LastMonitoringExecutionSummary')
  final MonitoringExecutionSummary lastMonitoringExecutionSummary;

  DescribeMonitoringScheduleResponse({
    @_s.required this.creationTime,
    @_s.required this.lastModifiedTime,
    @_s.required this.monitoringScheduleArn,
    @_s.required this.monitoringScheduleConfig,
    @_s.required this.monitoringScheduleName,
    @_s.required this.monitoringScheduleStatus,
    this.endpointName,
    this.failureReason,
    this.lastMonitoringExecutionSummary,
  });
  factory DescribeMonitoringScheduleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeMonitoringScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNotebookInstanceLifecycleConfigOutput {
  /// A timestamp that tells when the lifecycle configuration was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// A timestamp that tells when the lifecycle configuration was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the lifecycle configuration.
  @_s.JsonKey(name: 'NotebookInstanceLifecycleConfigArn')
  final String notebookInstanceLifecycleConfigArn;

  /// The name of the lifecycle configuration.
  @_s.JsonKey(name: 'NotebookInstanceLifecycleConfigName')
  final String notebookInstanceLifecycleConfigName;

  /// The shell script that runs only once, when you create a notebook instance.
  @_s.JsonKey(name: 'OnCreate')
  final List<NotebookInstanceLifecycleHook> onCreate;

  /// The shell script that runs every time you start a notebook instance,
  /// including when you create the notebook instance.
  @_s.JsonKey(name: 'OnStart')
  final List<NotebookInstanceLifecycleHook> onStart;

  DescribeNotebookInstanceLifecycleConfigOutput({
    this.creationTime,
    this.lastModifiedTime,
    this.notebookInstanceLifecycleConfigArn,
    this.notebookInstanceLifecycleConfigName,
    this.onCreate,
    this.onStart,
  });
  factory DescribeNotebookInstanceLifecycleConfigOutput.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeNotebookInstanceLifecycleConfigOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeNotebookInstanceOutput {
  /// A list of the Elastic Inference (EI) instance types associated with this
  /// notebook instance. Currently only one EI instance type can be associated
  /// with a notebook instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html">Using Elastic
  /// Inference in Amazon SageMaker</a>.
  @_s.JsonKey(name: 'AcceleratorTypes')
  final List<String> acceleratorTypes;

  /// An array of up to three Git repositories associated with the notebook
  /// instance. These can be either the names of Git repositories stored as
  /// resources in your account, or the URL of Git repositories in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository. These repositories are cloned
  /// at the same level as the default repository of your notebook instance. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating
  /// Git Repositories with Amazon SageMaker Notebook Instances</a>.
  @_s.JsonKey(name: 'AdditionalCodeRepositories')
  final List<String> additionalCodeRepositories;

  /// A timestamp. Use this parameter to return the time when the notebook
  /// instance was created
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Git repository associated with the notebook instance as its default code
  /// repository. This can be either the name of a Git repository stored as a
  /// resource in your account, or the URL of a Git repository in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository. When you open a notebook
  /// instance, it opens in the directory that contains this repository. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating
  /// Git Repositories with Amazon SageMaker Notebook Instances</a>.
  @_s.JsonKey(name: 'DefaultCodeRepository')
  final String defaultCodeRepository;

  /// Describes whether Amazon SageMaker provides internet access to the notebook
  /// instance. If this value is set to <i>Disabled</i>, the notebook instance
  /// does not have internet access, and cannot connect to Amazon SageMaker
  /// training and endpoint services.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/appendix-additional-considerations.html#appendix-notebook-and-internet-access">Notebook
  /// Instances Are Internet-Enabled by Default</a>.
  @_s.JsonKey(name: 'DirectInternetAccess')
  final DirectInternetAccess directInternetAccess;

  /// If status is <code>Failed</code>, the reason it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The type of ML compute instance running on the notebook instance.
  @_s.JsonKey(name: 'InstanceType')
  final InstanceType instanceType;

  /// The AWS KMS key ID Amazon SageMaker uses to encrypt data when storing it on
  /// the ML storage volume attached to the instance.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  /// A timestamp. Use this parameter to retrieve the time when the notebook
  /// instance was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The network interface IDs that Amazon SageMaker created at the time of
  /// creating the instance.
  @_s.JsonKey(name: 'NetworkInterfaceId')
  final String networkInterfaceId;

  /// The Amazon Resource Name (ARN) of the notebook instance.
  @_s.JsonKey(name: 'NotebookInstanceArn')
  final String notebookInstanceArn;

  /// Returns the name of a notebook instance lifecycle configuration.
  ///
  /// For information about notebook instance lifestyle configurations, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step
  /// 2.1: (Optional) Customize a Notebook Instance</a>
  @_s.JsonKey(name: 'NotebookInstanceLifecycleConfigName')
  final String notebookInstanceLifecycleConfigName;

  /// The name of the Amazon SageMaker notebook instance.
  @_s.JsonKey(name: 'NotebookInstanceName')
  final String notebookInstanceName;

  /// The status of the notebook instance.
  @_s.JsonKey(name: 'NotebookInstanceStatus')
  final NotebookInstanceStatus notebookInstanceStatus;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the instance.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Whether root access is enabled or disabled for users of the notebook
  /// instance.
  /// <note>
  /// Lifecycle configurations need root access to be able to set up a notebook
  /// instance. Because of this, lifecycle configurations associated with a
  /// notebook instance always run with root access even if you disable root
  /// access for users.
  /// </note>
  @_s.JsonKey(name: 'RootAccess')
  final RootAccess rootAccess;

  /// The IDs of the VPC security groups.
  @_s.JsonKey(name: 'SecurityGroups')
  final List<String> securityGroups;

  /// The ID of the VPC subnet.
  @_s.JsonKey(name: 'SubnetId')
  final String subnetId;

  /// The URL that you use to connect to the Jupyter notebook that is running in
  /// your notebook instance.
  @_s.JsonKey(name: 'Url')
  final String url;

  /// The size, in GB, of the ML storage volume attached to the notebook instance.
  @_s.JsonKey(name: 'VolumeSizeInGB')
  final int volumeSizeInGB;

  DescribeNotebookInstanceOutput({
    this.acceleratorTypes,
    this.additionalCodeRepositories,
    this.creationTime,
    this.defaultCodeRepository,
    this.directInternetAccess,
    this.failureReason,
    this.instanceType,
    this.kmsKeyId,
    this.lastModifiedTime,
    this.networkInterfaceId,
    this.notebookInstanceArn,
    this.notebookInstanceLifecycleConfigName,
    this.notebookInstanceName,
    this.notebookInstanceStatus,
    this.roleArn,
    this.rootAccess,
    this.securityGroups,
    this.subnetId,
    this.url,
    this.volumeSizeInGB,
  });
  factory DescribeNotebookInstanceOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeNotebookInstanceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProcessingJobResponse {
  /// Configures the processing job to run a specified container image.
  @_s.JsonKey(name: 'AppSpecification')
  final AppSpecification appSpecification;

  /// The time at which the processing job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the processing job.
  @_s.JsonKey(name: 'ProcessingJobArn')
  final String processingJobArn;

  /// The name of the processing job. The name must be unique within an AWS Region
  /// in the AWS account.
  @_s.JsonKey(name: 'ProcessingJobName')
  final String processingJobName;

  /// Provides the status of a processing job.
  @_s.JsonKey(name: 'ProcessingJobStatus')
  final ProcessingJobStatus processingJobStatus;

  /// Identifies the resources, ML compute instances, and ML storage volumes to
  /// deploy for a processing job. In distributed training, you specify more than
  /// one instance.
  @_s.JsonKey(name: 'ProcessingResources')
  final ProcessingResources processingResources;

  /// The ARN of an AutoML job associated with this processing job.
  @_s.JsonKey(name: 'AutoMLJobArn')
  final String autoMLJobArn;

  /// The environment variables set in the Docker container.
  @_s.JsonKey(name: 'Environment')
  final Map<String, String> environment;

  /// An optional string, up to one KB in size, that contains metadata from the
  /// processing container when the processing job exits.
  @_s.JsonKey(name: 'ExitMessage')
  final String exitMessage;

  /// The configuration information used to create an experiment.
  @_s.JsonKey(name: 'ExperimentConfig')
  final ExperimentConfig experimentConfig;

  /// A string, up to one KB in size, that contains the reason a processing job
  /// failed, if it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The time at which the processing job was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The ARN of a monitoring schedule for an endpoint associated with this
  /// processing job.
  @_s.JsonKey(name: 'MonitoringScheduleArn')
  final String monitoringScheduleArn;

  /// Networking options for a processing job.
  @_s.JsonKey(name: 'NetworkConfig')
  final NetworkConfig networkConfig;

  /// The time at which the processing job completed.
  @_s.JsonKey(
      name: 'ProcessingEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime processingEndTime;

  /// The inputs for a processing job.
  @_s.JsonKey(name: 'ProcessingInputs')
  final List<ProcessingInput> processingInputs;

  /// Output configuration for the processing job.
  @_s.JsonKey(name: 'ProcessingOutputConfig')
  final ProcessingOutputConfig processingOutputConfig;

  /// The time at which the processing job started.
  @_s.JsonKey(
      name: 'ProcessingStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime processingStartTime;

  /// The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can
  /// assume to perform tasks on your behalf.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The time limit for how long the processing job is allowed to run.
  @_s.JsonKey(name: 'StoppingCondition')
  final ProcessingStoppingCondition stoppingCondition;

  /// The ARN of a training job associated with this processing job.
  @_s.JsonKey(name: 'TrainingJobArn')
  final String trainingJobArn;

  DescribeProcessingJobResponse({
    @_s.required this.appSpecification,
    @_s.required this.creationTime,
    @_s.required this.processingJobArn,
    @_s.required this.processingJobName,
    @_s.required this.processingJobStatus,
    @_s.required this.processingResources,
    this.autoMLJobArn,
    this.environment,
    this.exitMessage,
    this.experimentConfig,
    this.failureReason,
    this.lastModifiedTime,
    this.monitoringScheduleArn,
    this.networkConfig,
    this.processingEndTime,
    this.processingInputs,
    this.processingOutputConfig,
    this.processingStartTime,
    this.roleArn,
    this.stoppingCondition,
    this.trainingJobArn,
  });
  factory DescribeProcessingJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProcessingJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSubscribedWorkteamResponse {
  /// A <code>Workteam</code> instance that contains information about the work
  /// team.
  @_s.JsonKey(name: 'SubscribedWorkteam')
  final SubscribedWorkteam subscribedWorkteam;

  DescribeSubscribedWorkteamResponse({
    @_s.required this.subscribedWorkteam,
  });
  factory DescribeSubscribedWorkteamResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeSubscribedWorkteamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrainingJobResponse {
  /// Information about the algorithm used for training, and algorithm metadata.
  @_s.JsonKey(name: 'AlgorithmSpecification')
  final AlgorithmSpecification algorithmSpecification;

  /// A timestamp that indicates when the training job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// Information about the Amazon S3 location that is configured for storing
  /// model artifacts.
  @_s.JsonKey(name: 'ModelArtifacts')
  final ModelArtifacts modelArtifacts;

  /// Resources, including ML compute instances and ML storage volumes, that are
  /// configured for model training.
  @_s.JsonKey(name: 'ResourceConfig')
  final ResourceConfig resourceConfig;

  /// Provides detailed information about the state of the training job. For
  /// detailed information on the secondary status of the training job, see
  /// <code>StatusMessage</code> under <a>SecondaryStatusTransition</a>.
  ///
  /// Amazon SageMaker provides primary statuses and secondary statuses that apply
  /// to each of them:
  /// <dl> <dt>InProgress</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Starting</code> - Starting the training job.
  /// </li>
  /// <li>
  /// <code>Downloading</code> - An optional stage for algorithms that support
  /// <code>File</code> training input mode. It indicates that data is being
  /// downloaded to the ML storage volumes.
  /// </li>
  /// <li>
  /// <code>Training</code> - Training is in progress.
  /// </li>
  /// <li>
  /// <code>Interrupted</code> - The job stopped because the managed spot training
  /// instances were interrupted.
  /// </li>
  /// <li>
  /// <code>Uploading</code> - Training is complete and the model artifacts are
  /// being uploaded to the S3 location.
  /// </li>
  /// </ul> </dd> <dt>Completed</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Completed</code> - The training job has completed.
  /// </li>
  /// </ul> </dd> <dt>Failed</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Failed</code> - The training job has failed. The reason for the
  /// failure is returned in the <code>FailureReason</code> field of
  /// <code>DescribeTrainingJobResponse</code>.
  /// </li>
  /// </ul> </dd> <dt>Stopped</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the
  /// maximum allowed runtime.
  /// </li>
  /// <li>
  /// <code>MaxWaitTmeExceeded</code> - The job stopped because it exceeded the
  /// maximum allowed wait time.
  /// </li>
  /// <li>
  /// <code>Stopped</code> - The training job has stopped.
  /// </li>
  /// </ul> </dd> <dt>Stopping</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Stopping</code> - Stopping the training job.
  /// </li>
  /// </ul> </dd> </dl> <important>
  /// Valid values for <code>SecondaryStatus</code> are subject to change.
  /// </important>
  /// We no longer support the following secondary statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>LaunchingMLInstances</code>
  /// </li>
  /// <li>
  /// <code>PreparingTrainingStack</code>
  /// </li>
  /// <li>
  /// <code>DownloadingTrainingImage</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SecondaryStatus')
  final SecondaryStatus secondaryStatus;

  /// Specifies a limit to how long a model training job can run. It also
  /// specifies the maximum time to wait for a spot instance. When the job reaches
  /// the time limit, Amazon SageMaker ends the training job. Use this API to cap
  /// model training costs.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code>
  /// signal, which delays job termination for 120 seconds. Algorithms can use
  /// this 120-second window to save the model artifacts, so the results of
  /// training are not lost.
  @_s.JsonKey(name: 'StoppingCondition')
  final StoppingCondition stoppingCondition;

  /// The Amazon Resource Name (ARN) of the training job.
  @_s.JsonKey(name: 'TrainingJobArn')
  final String trainingJobArn;

  /// Name of the model training job.
  @_s.JsonKey(name: 'TrainingJobName')
  final String trainingJobName;

  /// The status of the training job.
  ///
  /// Amazon SageMaker provides the following training job statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>InProgress</code> - The training is in progress.
  /// </li>
  /// <li>
  /// <code>Completed</code> - The training job has completed.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The training job has failed. To see the reason for the
  /// failure, see the <code>FailureReason</code> field in the response to a
  /// <code>DescribeTrainingJobResponse</code> call.
  /// </li>
  /// <li>
  /// <code>Stopping</code> - The training job is stopping.
  /// </li>
  /// <li>
  /// <code>Stopped</code> - The training job has stopped.
  /// </li>
  /// </ul>
  /// For more detailed information, see <code>SecondaryStatus</code>.
  @_s.JsonKey(name: 'TrainingJobStatus')
  final TrainingJobStatus trainingJobStatus;

  /// <p/>
  @_s.JsonKey(name: 'AutoMLJobArn')
  final String autoMLJobArn;

  /// The billable time in seconds.
  ///
  /// You can calculate the savings from using managed spot training using the
  /// formula <code>(1 - BillableTimeInSeconds / TrainingTimeInSeconds) *
  /// 100</code>. For example, if <code>BillableTimeInSeconds</code> is 100 and
  /// <code>TrainingTimeInSeconds</code> is 500, the savings is 80%.
  @_s.JsonKey(name: 'BillableTimeInSeconds')
  final int billableTimeInSeconds;
  @_s.JsonKey(name: 'CheckpointConfig')
  final CheckpointConfig checkpointConfig;
  @_s.JsonKey(name: 'DebugHookConfig')
  final DebugHookConfig debugHookConfig;

  /// Configuration information for debugging rules.
  @_s.JsonKey(name: 'DebugRuleConfigurations')
  final List<DebugRuleConfiguration> debugRuleConfigurations;

  /// Status about the debug rule evaluation.
  @_s.JsonKey(name: 'DebugRuleEvaluationStatuses')
  final List<DebugRuleEvaluationStatus> debugRuleEvaluationStatuses;

  /// To encrypt all communications between ML compute instances in distributed
  /// training, choose <code>True</code>. Encryption provides greater security for
  /// distributed training, but training might take longer. How long it takes
  /// depends on the amount of communication between compute instances, especially
  /// if you use a deep learning algorithms in distributed training.
  @_s.JsonKey(name: 'EnableInterContainerTrafficEncryption')
  final bool enableInterContainerTrafficEncryption;

  /// A Boolean indicating whether managed spot training is enabled
  /// (<code>True</code>) or not (<code>False</code>).
  @_s.JsonKey(name: 'EnableManagedSpotTraining')
  final bool enableManagedSpotTraining;

  /// If you want to allow inbound or outbound network calls, except for calls
  /// between peers within a training cluster for distributed training, choose
  /// <code>True</code>. If you enable network isolation for training jobs that
  /// are configured to use a VPC, Amazon SageMaker downloads and uploads customer
  /// data and model artifacts through the specified VPC, but the training
  /// container does not have network access.
  @_s.JsonKey(name: 'EnableNetworkIsolation')
  final bool enableNetworkIsolation;
  @_s.JsonKey(name: 'ExperimentConfig')
  final ExperimentConfig experimentConfig;

  /// If the training job failed, the reason it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// A collection of <code>MetricData</code> objects that specify the names,
  /// values, and dates and times that the training algorithm emitted to Amazon
  /// CloudWatch.
  @_s.JsonKey(name: 'FinalMetricDataList')
  final List<MetricData> finalMetricDataList;

  /// Algorithm-specific parameters.
  @_s.JsonKey(name: 'HyperParameters')
  final Map<String, String> hyperParameters;

  /// An array of <code>Channel</code> objects that describes each data input
  /// channel.
  @_s.JsonKey(name: 'InputDataConfig')
  final List<Channel> inputDataConfig;

  /// The Amazon Resource Name (ARN) of the Amazon SageMaker Ground Truth labeling
  /// job that created the transform or training job.
  @_s.JsonKey(name: 'LabelingJobArn')
  final String labelingJobArn;

  /// A timestamp that indicates when the status of the training job was last
  /// modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The S3 path where model artifacts that you configured when creating the job
  /// are stored. Amazon SageMaker creates subfolders for model artifacts.
  @_s.JsonKey(name: 'OutputDataConfig')
  final OutputDataConfig outputDataConfig;

  /// The AWS Identity and Access Management (IAM) role configured for the
  /// training job.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// A history of all of the secondary statuses that the training job has
  /// transitioned through.
  @_s.JsonKey(name: 'SecondaryStatusTransitions')
  final List<SecondaryStatusTransition> secondaryStatusTransitions;
  @_s.JsonKey(name: 'TensorBoardOutputConfig')
  final TensorBoardOutputConfig tensorBoardOutputConfig;

  /// Indicates the time when the training job ends on training instances. You are
  /// billed for the time interval between the value of
  /// <code>TrainingStartTime</code> and this time. For successful jobs and
  /// stopped jobs, this is the time after model artifacts are uploaded. For
  /// failed jobs, this is the time when Amazon SageMaker detects a job failure.
  @_s.JsonKey(
      name: 'TrainingEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime trainingEndTime;

  /// Indicates the time when the training job starts on training instances. You
  /// are billed for the time interval between this time and the value of
  /// <code>TrainingEndTime</code>. The start time in CloudWatch Logs might be
  /// later than this time. The difference is due to the time it takes to download
  /// the training data and to the size of the training container.
  @_s.JsonKey(
      name: 'TrainingStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime trainingStartTime;

  /// The training time in seconds.
  @_s.JsonKey(name: 'TrainingTimeInSeconds')
  final int trainingTimeInSeconds;

  /// The Amazon Resource Name (ARN) of the associated hyperparameter tuning job
  /// if the training job was launched by a hyperparameter tuning job.
  @_s.JsonKey(name: 'TuningJobArn')
  final String tuningJobArn;

  /// A <a>VpcConfig</a> object that specifies the VPC that this training job has
  /// access to. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect
  /// Training Jobs by Using an Amazon Virtual Private Cloud</a>.
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  DescribeTrainingJobResponse({
    @_s.required this.algorithmSpecification,
    @_s.required this.creationTime,
    @_s.required this.modelArtifacts,
    @_s.required this.resourceConfig,
    @_s.required this.secondaryStatus,
    @_s.required this.stoppingCondition,
    @_s.required this.trainingJobArn,
    @_s.required this.trainingJobName,
    @_s.required this.trainingJobStatus,
    this.autoMLJobArn,
    this.billableTimeInSeconds,
    this.checkpointConfig,
    this.debugHookConfig,
    this.debugRuleConfigurations,
    this.debugRuleEvaluationStatuses,
    this.enableInterContainerTrafficEncryption,
    this.enableManagedSpotTraining,
    this.enableNetworkIsolation,
    this.experimentConfig,
    this.failureReason,
    this.finalMetricDataList,
    this.hyperParameters,
    this.inputDataConfig,
    this.labelingJobArn,
    this.lastModifiedTime,
    this.outputDataConfig,
    this.roleArn,
    this.secondaryStatusTransitions,
    this.tensorBoardOutputConfig,
    this.trainingEndTime,
    this.trainingStartTime,
    this.trainingTimeInSeconds,
    this.tuningJobArn,
    this.vpcConfig,
  });
  factory DescribeTrainingJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTrainingJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTransformJobResponse {
  /// A timestamp that shows when the transform Job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The name of the model used in the transform job.
  @_s.JsonKey(name: 'ModelName')
  final String modelName;

  /// Describes the dataset to be transformed and the Amazon S3 location where it
  /// is stored.
  @_s.JsonKey(name: 'TransformInput')
  final TransformInput transformInput;

  /// The Amazon Resource Name (ARN) of the transform job.
  @_s.JsonKey(name: 'TransformJobArn')
  final String transformJobArn;

  /// The name of the transform job.
  @_s.JsonKey(name: 'TransformJobName')
  final String transformJobName;

  /// The status of the transform job. If the transform job failed, the reason is
  /// returned in the <code>FailureReason</code> field.
  @_s.JsonKey(name: 'TransformJobStatus')
  final TransformJobStatus transformJobStatus;

  /// Describes the resources, including ML instance types and ML instance count,
  /// to use for the transform job.
  @_s.JsonKey(name: 'TransformResources')
  final TransformResources transformResources;

  /// <p/>
  @_s.JsonKey(name: 'AutoMLJobArn')
  final String autoMLJobArn;

  /// Specifies the number of records to include in a mini-batch for an HTTP
  /// inference request. A <i>record</i> <i/> is a single unit of input data that
  /// inference can be made on. For example, a single line in a CSV file is a
  /// record.
  ///
  /// To enable the batch strategy, you must set <code>SplitType</code> to
  /// <code>Line</code>, <code>RecordIO</code>, or <code>TFRecord</code>.
  @_s.JsonKey(name: 'BatchStrategy')
  final BatchStrategy batchStrategy;
  @_s.JsonKey(name: 'DataProcessing')
  final DataProcessing dataProcessing;

  /// The environment variables to set in the Docker container. We support up to
  /// 16 key and values entries in the map.
  @_s.JsonKey(name: 'Environment')
  final Map<String, String> environment;
  @_s.JsonKey(name: 'ExperimentConfig')
  final ExperimentConfig experimentConfig;

  /// If the transform job failed, <code>FailureReason</code> describes why it
  /// failed. A transform job creates a log file, which includes error messages,
  /// and stores it as an Amazon S3 object. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/logging-cloudwatch.html">Log
  /// Amazon SageMaker Events with Amazon CloudWatch</a>.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The Amazon Resource Name (ARN) of the Amazon SageMaker Ground Truth labeling
  /// job that created the transform or training job.
  @_s.JsonKey(name: 'LabelingJobArn')
  final String labelingJobArn;

  /// The maximum number of parallel requests on each instance node that can be
  /// launched in a transform job. The default value is 1.
  @_s.JsonKey(name: 'MaxConcurrentTransforms')
  final int maxConcurrentTransforms;

  /// The maximum payload size, in MB, used in the transform job.
  @_s.JsonKey(name: 'MaxPayloadInMB')
  final int maxPayloadInMB;

  /// Indicates when the transform job has been completed, or has stopped or
  /// failed. You are billed for the time interval between this time and the value
  /// of <code>TransformStartTime</code>.
  @_s.JsonKey(
      name: 'TransformEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime transformEndTime;

  /// Identifies the Amazon S3 location where you want Amazon SageMaker to save
  /// the results from the transform job.
  @_s.JsonKey(name: 'TransformOutput')
  final TransformOutput transformOutput;

  /// Indicates when the transform job starts on ML instances. You are billed for
  /// the time interval between this time and the value of
  /// <code>TransformEndTime</code>.
  @_s.JsonKey(
      name: 'TransformStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime transformStartTime;

  DescribeTransformJobResponse({
    @_s.required this.creationTime,
    @_s.required this.modelName,
    @_s.required this.transformInput,
    @_s.required this.transformJobArn,
    @_s.required this.transformJobName,
    @_s.required this.transformJobStatus,
    @_s.required this.transformResources,
    this.autoMLJobArn,
    this.batchStrategy,
    this.dataProcessing,
    this.environment,
    this.experimentConfig,
    this.failureReason,
    this.labelingJobArn,
    this.maxConcurrentTransforms,
    this.maxPayloadInMB,
    this.transformEndTime,
    this.transformOutput,
    this.transformStartTime,
  });
  factory DescribeTransformJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTransformJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrialComponentResponse {
  /// Who created the component.
  @_s.JsonKey(name: 'CreatedBy')
  final UserContext createdBy;

  /// When the component was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The name of the component as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>TrialComponentName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// When the component ended.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// The input artifacts of the component.
  @_s.JsonKey(name: 'InputArtifacts')
  final Map<String, TrialComponentArtifact> inputArtifacts;

  /// Who last modified the component.
  @_s.JsonKey(name: 'LastModifiedBy')
  final UserContext lastModifiedBy;

  /// When the component was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The metrics for the component.
  @_s.JsonKey(name: 'Metrics')
  final List<TrialComponentMetricSummary> metrics;

  /// The output artifacts of the component.
  @_s.JsonKey(name: 'OutputArtifacts')
  final Map<String, TrialComponentArtifact> outputArtifacts;

  /// The hyperparameters of the component.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, TrialComponentParameterValue> parameters;

  /// The Amazon Resource Name (ARN) of the source and, optionally, the job type.
  @_s.JsonKey(name: 'Source')
  final TrialComponentSource source;

  /// When the component started.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;

  /// The status of the component. States include:
  ///
  /// <ul>
  /// <li>
  /// InProgress
  /// </li>
  /// <li>
  /// Completed
  /// </li>
  /// <li>
  /// Failed
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final TrialComponentStatus status;

  /// The Amazon Resource Name (ARN) of the trial component.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  /// The name of the trial component.
  @_s.JsonKey(name: 'TrialComponentName')
  final String trialComponentName;

  DescribeTrialComponentResponse({
    this.createdBy,
    this.creationTime,
    this.displayName,
    this.endTime,
    this.inputArtifacts,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.metrics,
    this.outputArtifacts,
    this.parameters,
    this.source,
    this.startTime,
    this.status,
    this.trialComponentArn,
    this.trialComponentName,
  });
  factory DescribeTrialComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTrialComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTrialResponse {
  /// Who created the trial.
  @_s.JsonKey(name: 'CreatedBy')
  final UserContext createdBy;

  /// When the trial was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The name of the trial as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>TrialName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The name of the experiment the trial is part of.
  @_s.JsonKey(name: 'ExperimentName')
  final String experimentName;

  /// Who last modified the trial.
  @_s.JsonKey(name: 'LastModifiedBy')
  final UserContext lastModifiedBy;

  /// When the trial was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the source and, optionally, the job type.
  @_s.JsonKey(name: 'Source')
  final TrialSource source;

  /// The Amazon Resource Name (ARN) of the trial.
  @_s.JsonKey(name: 'TrialArn')
  final String trialArn;

  /// The name of the trial.
  @_s.JsonKey(name: 'TrialName')
  final String trialName;

  DescribeTrialResponse({
    this.createdBy,
    this.creationTime,
    this.displayName,
    this.experimentName,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.source,
    this.trialArn,
    this.trialName,
  });
  factory DescribeTrialResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTrialResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeUserProfileResponse {
  /// The creation time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The domain ID.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// The failure reason.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The homa Amazon Elastic File System (EFS) Uid.
  @_s.JsonKey(name: 'HomeEfsFileSystemUid')
  final String homeEfsFileSystemUid;

  /// The last modified time.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The SSO user identifier.
  @_s.JsonKey(name: 'SingleSignOnUserIdentifier')
  final String singleSignOnUserIdentifier;

  /// The SSO user value.
  @_s.JsonKey(name: 'SingleSignOnUserValue')
  final String singleSignOnUserValue;

  /// The status.
  @_s.JsonKey(name: 'Status')
  final UserProfileStatus status;

  /// The user profile Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'UserProfileArn')
  final String userProfileArn;

  /// The user profile name.
  @_s.JsonKey(name: 'UserProfileName')
  final String userProfileName;

  /// A collection of settings.
  @_s.JsonKey(name: 'UserSettings')
  final UserSettings userSettings;

  DescribeUserProfileResponse({
    this.creationTime,
    this.domainId,
    this.failureReason,
    this.homeEfsFileSystemUid,
    this.lastModifiedTime,
    this.singleSignOnUserIdentifier,
    this.singleSignOnUserValue,
    this.status,
    this.userProfileArn,
    this.userProfileName,
    this.userSettings,
  });
  factory DescribeUserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeUserProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkforceResponse {
  /// A single private workforce, which is automatically created when you create
  /// your first private work team. You can create one private work force in each
  /// AWS Region. By default, any workforce-related API operation used in a
  /// specific region will apply to the workforce created in that region. To learn
  /// how to create a private workforce, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html">Create
  /// a Private Workforce</a>.
  @_s.JsonKey(name: 'Workforce')
  final Workforce workforce;

  DescribeWorkforceResponse({
    @_s.required this.workforce,
  });
  factory DescribeWorkforceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorkforceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorkteamResponse {
  /// A <code>Workteam</code> instance that contains information about the work
  /// team.
  @_s.JsonKey(name: 'Workteam')
  final Workteam workteam;

  DescribeWorkteamResponse({
    @_s.required this.workteam,
  });
  factory DescribeWorkteamResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorkteamResponseFromJson(json);
}

/// Specifies weight and capacity values for a production variant.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DesiredWeightAndCapacity {
  /// The name of the variant to update.
  @_s.JsonKey(name: 'VariantName')
  final String variantName;

  /// The variant's capacity.
  @_s.JsonKey(name: 'DesiredInstanceCount')
  final int desiredInstanceCount;

  /// The variant's weight.
  @_s.JsonKey(name: 'DesiredWeight')
  final double desiredWeight;

  DesiredWeightAndCapacity({
    @_s.required this.variantName,
    this.desiredInstanceCount,
    this.desiredWeight,
  });
  Map<String, dynamic> toJson() => _$DesiredWeightAndCapacityToJson(this);
}

enum DetailedAlgorithmStatus {
  @_s.JsonValue('NotStarted')
  notStarted,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
}

enum DetailedModelPackageStatus {
  @_s.JsonValue('NotStarted')
  notStarted,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
}

enum DirectInternetAccess {
  @_s.JsonValue('Enabled')
  enabled,
  @_s.JsonValue('Disabled')
  disabled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateTrialComponentResponse {
  /// The Amazon Resource Name (ARN) of the trial.
  @_s.JsonKey(name: 'TrialArn')
  final String trialArn;

  /// The ARN of the trial component.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  DisassociateTrialComponentResponse({
    this.trialArn,
    this.trialComponentArn,
  });
  factory DisassociateTrialComponentResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateTrialComponentResponseFromJson(json);
}

/// The domain's details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DomainDetails {
  /// The creation time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The domain's Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'DomainArn')
  final String domainArn;

  /// The domain ID.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// The domain name.
  @_s.JsonKey(name: 'DomainName')
  final String domainName;

  /// The last modified time.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The status.
  @_s.JsonKey(name: 'Status')
  final DomainStatus status;

  /// The domain's URL.
  @_s.JsonKey(name: 'Url')
  final String url;

  DomainDetails({
    this.creationTime,
    this.domainArn,
    this.domainId,
    this.domainName,
    this.lastModifiedTime,
    this.status,
    this.url,
  });
  factory DomainDetails.fromJson(Map<String, dynamic> json) =>
      _$DomainDetailsFromJson(json);
}

enum DomainStatus {
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('InService')
  inService,
  @_s.JsonValue('Pending')
  pending,
}

enum EndpointConfigSortKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
}

/// Provides summary information for an endpoint configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndpointConfigSummary {
  /// A timestamp that shows when the endpoint configuration was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the endpoint configuration.
  @_s.JsonKey(name: 'EndpointConfigArn')
  final String endpointConfigArn;

  /// The name of the endpoint configuration.
  @_s.JsonKey(name: 'EndpointConfigName')
  final String endpointConfigName;

  EndpointConfigSummary({
    @_s.required this.creationTime,
    @_s.required this.endpointConfigArn,
    @_s.required this.endpointConfigName,
  });
  factory EndpointConfigSummary.fromJson(Map<String, dynamic> json) =>
      _$EndpointConfigSummaryFromJson(json);
}

/// Input object for the endpoint
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EndpointInput {
  /// An endpoint in customer's account which has enabled
  /// <code>DataCaptureConfig</code> enabled.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// Path to the filesystem where the endpoint data is available to the
  /// container.
  @_s.JsonKey(name: 'LocalPath')
  final String localPath;

  /// Whether input data distributed in Amazon S3 is fully replicated or sharded
  /// by an S3 key. Defauts to <code>FullyReplicated</code>
  @_s.JsonKey(name: 'S3DataDistributionType')
  final ProcessingS3DataDistributionType s3DataDistributionType;

  /// Whether the <code>Pipe</code> or <code>File</code> is used as the input mode
  /// for transfering data for the monitoring job. <code>Pipe</code> mode is
  /// recommended for large datasets. <code>File</code> mode is useful for small
  /// files that fit in memory. Defaults to <code>File</code>.
  @_s.JsonKey(name: 'S3InputMode')
  final ProcessingS3InputMode s3InputMode;

  EndpointInput({
    @_s.required this.endpointName,
    @_s.required this.localPath,
    this.s3DataDistributionType,
    this.s3InputMode,
  });
  factory EndpointInput.fromJson(Map<String, dynamic> json) =>
      _$EndpointInputFromJson(json);

  Map<String, dynamic> toJson() => _$EndpointInputToJson(this);
}

enum EndpointSortKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('Status')
  status,
}

enum EndpointStatus {
  @_s.JsonValue('OutOfService')
  outOfService,
  @_s.JsonValue('Creating')
  creating,
  @_s.JsonValue('Updating')
  updating,
  @_s.JsonValue('SystemUpdating')
  systemUpdating,
  @_s.JsonValue('RollingBack')
  rollingBack,
  @_s.JsonValue('InService')
  inService,
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Failed')
  failed,
}

/// Provides summary information for an endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EndpointSummary {
  /// A timestamp that shows when the endpoint was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  /// The name of the endpoint.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// The status of the endpoint.
  ///
  /// <ul>
  /// <li>
  /// <code>OutOfService</code>: Endpoint is not available to take incoming
  /// requests.
  /// </li>
  /// <li>
  /// <code>Creating</code>: <a>CreateEndpoint</a> is executing.
  /// </li>
  /// <li>
  /// <code>Updating</code>: <a>UpdateEndpoint</a> or
  /// <a>UpdateEndpointWeightsAndCapacities</a> is executing.
  /// </li>
  /// <li>
  /// <code>SystemUpdating</code>: Endpoint is undergoing maintenance and cannot
  /// be updated or deleted or re-scaled until it has completed. This maintenance
  /// operation does not change any customer-specified values such as VPC config,
  /// KMS encryption, model, instance type, or instance count.
  /// </li>
  /// <li>
  /// <code>RollingBack</code>: Endpoint fails to scale up or down or change its
  /// variant weight and is in the process of rolling back to its previous
  /// configuration. Once the rollback completes, endpoint returns to an
  /// <code>InService</code> status. This transitional status only applies to an
  /// endpoint that has autoscaling enabled and is undergoing variant weight or
  /// capacity changes as part of an <a>UpdateEndpointWeightsAndCapacities</a>
  /// call or when the <a>UpdateEndpointWeightsAndCapacities</a> operation is
  /// called explicitly.
  /// </li>
  /// <li>
  /// <code>InService</code>: Endpoint is available to process incoming requests.
  /// </li>
  /// <li>
  /// <code>Deleting</code>: <a>DeleteEndpoint</a> is executing.
  /// </li>
  /// <li>
  /// <code>Failed</code>: Endpoint could not be created, updated, or re-scaled.
  /// Use <a>DescribeEndpointOutput$FailureReason</a> for information about the
  /// failure. <a>DeleteEndpoint</a> is the only operation that can be performed
  /// on a failed endpoint.
  /// </li>
  /// </ul>
  /// To get a list of endpoints with a specified status, use the
  /// <a>ListEndpointsInput$StatusEquals</a> filter.
  @_s.JsonKey(name: 'EndpointStatus')
  final EndpointStatus endpointStatus;

  /// A timestamp that shows when the endpoint was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  EndpointSummary({
    @_s.required this.creationTime,
    @_s.required this.endpointArn,
    @_s.required this.endpointName,
    @_s.required this.endpointStatus,
    @_s.required this.lastModifiedTime,
  });
  factory EndpointSummary.fromJson(Map<String, dynamic> json) =>
      _$EndpointSummaryFromJson(json);
}

enum ExecutionStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('CompletedWithViolations')
  completedWithViolations,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
}

/// The properties of an experiment as returned by the <a>Search</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Experiment {
  @_s.JsonKey(name: 'CreatedBy')
  final UserContext createdBy;

  /// When the experiment was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The description of the experiment.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The name of the experiment as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>ExperimentName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The Amazon Resource Name (ARN) of the experiment.
  @_s.JsonKey(name: 'ExperimentArn')
  final String experimentArn;

  /// The name of the experiment.
  @_s.JsonKey(name: 'ExperimentName')
  final String experimentName;
  @_s.JsonKey(name: 'LastModifiedBy')
  final UserContext lastModifiedBy;

  /// When the experiment was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;
  @_s.JsonKey(name: 'Source')
  final ExperimentSource source;

  /// The list of tags that are associated with the experiment. You can use
  /// <a>Search</a> API to search on the tags.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  Experiment({
    this.createdBy,
    this.creationTime,
    this.description,
    this.displayName,
    this.experimentArn,
    this.experimentName,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.source,
    this.tags,
  });
  factory Experiment.fromJson(Map<String, dynamic> json) =>
      _$ExperimentFromJson(json);
}

/// Configuration for the experiment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ExperimentConfig {
  /// The name of the experiment.
  @_s.JsonKey(name: 'ExperimentName')
  final String experimentName;

  /// Display name for the trial component.
  @_s.JsonKey(name: 'TrialComponentDisplayName')
  final String trialComponentDisplayName;

  /// The name of the trial.
  @_s.JsonKey(name: 'TrialName')
  final String trialName;

  ExperimentConfig({
    this.experimentName,
    this.trialComponentDisplayName,
    this.trialName,
  });
  factory ExperimentConfig.fromJson(Map<String, dynamic> json) =>
      _$ExperimentConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ExperimentConfigToJson(this);
}

/// The source of the experiment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExperimentSource {
  /// The Amazon Resource Name (ARN) of the source.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// The source type.
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  ExperimentSource({
    @_s.required this.sourceArn,
    this.sourceType,
  });
  factory ExperimentSource.fromJson(Map<String, dynamic> json) =>
      _$ExperimentSourceFromJson(json);
}

/// A summary of the properties of an experiment. To get the complete set of
/// properties, call the <a>DescribeExperiment</a> API and provide the
/// <code>ExperimentName</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExperimentSummary {
  /// When the experiment was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The name of the experiment as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>ExperimentName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The Amazon Resource Name (ARN) of the experiment.
  @_s.JsonKey(name: 'ExperimentArn')
  final String experimentArn;

  /// The name of the experiment.
  @_s.JsonKey(name: 'ExperimentName')
  final String experimentName;
  @_s.JsonKey(name: 'ExperimentSource')
  final ExperimentSource experimentSource;

  /// When the experiment was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  ExperimentSummary({
    this.creationTime,
    this.displayName,
    this.experimentArn,
    this.experimentName,
    this.experimentSource,
    this.lastModifiedTime,
  });
  factory ExperimentSummary.fromJson(Map<String, dynamic> json) =>
      _$ExperimentSummaryFromJson(json);
}

enum FileSystemAccessMode {
  @_s.JsonValue('rw')
  rw,
  @_s.JsonValue('ro')
  ro,
}

/// Specifies a file system data source for a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FileSystemDataSource {
  /// The full path to the directory to associate with the channel.
  @_s.JsonKey(name: 'DirectoryPath')
  final String directoryPath;

  /// The access mode of the mount of the directory associated with the channel. A
  /// directory can be mounted either in <code>ro</code> (read-only) or
  /// <code>rw</code> (read-write) mode.
  @_s.JsonKey(name: 'FileSystemAccessMode')
  final FileSystemAccessMode fileSystemAccessMode;

  /// The file system id.
  @_s.JsonKey(name: 'FileSystemId')
  final String fileSystemId;

  /// The file system type.
  @_s.JsonKey(name: 'FileSystemType')
  final FileSystemType fileSystemType;

  FileSystemDataSource({
    @_s.required this.directoryPath,
    @_s.required this.fileSystemAccessMode,
    @_s.required this.fileSystemId,
    @_s.required this.fileSystemType,
  });
  factory FileSystemDataSource.fromJson(Map<String, dynamic> json) =>
      _$FileSystemDataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$FileSystemDataSourceToJson(this);
}

enum FileSystemType {
  @_s.JsonValue('EFS')
  efs,
  @_s.JsonValue('FSxLustre')
  fSxLustre,
}

/// A conditional statement for a search expression that includes a resource
/// property, a Boolean operator, and a value. Resources that match the
/// statement are returned in the results from the <a>Search</a> API.
///
/// If you specify a <code>Value</code>, but not an <code>Operator</code>,
/// Amazon SageMaker uses the equals operator.
///
/// In search, there are several property types:
/// <dl> <dt>Metrics</dt> <dd>
/// To define a metric filter, enter a value using the form
/// <code>"Metrics.&lt;name&gt;"</code>, where <code>&lt;name&gt;</code> is a
/// metric name. For example, the following filter searches for training jobs
/// with an <code>"accuracy"</code> metric greater than <code>"0.9"</code>:
///
/// <code>{</code>
///
/// <code>"Name": "Metrics.accuracy",</code>
///
/// <code>"Operator": "GreaterThan",</code>
///
/// <code>"Value": "0.9"</code>
///
/// <code>}</code>
/// </dd> <dt>HyperParameters</dt> <dd>
/// To define a hyperparameter filter, enter a value with the form
/// <code>"HyperParameters.&lt;name&gt;"</code>. Decimal hyperparameter values
/// are treated as a decimal in a comparison if the specified <code>Value</code>
/// is also a decimal value. If the specified <code>Value</code> is an integer,
/// the decimal hyperparameter values are treated as integers. For example, the
/// following filter is satisfied by training jobs with a
/// <code>"learning_rate"</code> hyperparameter that is less than
/// <code>"0.5"</code>:
///
/// <code> {</code>
///
/// <code> "Name": "HyperParameters.learning_rate",</code>
///
/// <code> "Operator": "LessThan",</code>
///
/// <code> "Value": "0.5"</code>
///
/// <code> }</code>
/// </dd> <dt>Tags</dt> <dd>
/// To define a tag filter, enter a value with the form
/// <code>Tags.&lt;key&gt;</code>.
/// </dd> </dl>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// A resource property name. For example, <code>TrainingJobName</code>. For
  /// valid property names, see <a>SearchRecord</a>. You must specify a valid
  /// property for the resource.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A Boolean binary operator that is used to evaluate the filter. The operator
  /// field contains one of the following values:
  /// <dl> <dt>Equals</dt> <dd>
  /// The value of <code>Name</code> equals <code>Value</code>.
  /// </dd> <dt>NotEquals</dt> <dd>
  /// The value of <code>Name</code> doesn't equal <code>Value</code>.
  /// </dd> <dt>GreaterThan</dt> <dd>
  /// The value of <code>Name</code> is greater than <code>Value</code>. Not
  /// supported for text properties.
  /// </dd> <dt>GreaterThanOrEqualTo</dt> <dd>
  /// The value of <code>Name</code> is greater than or equal to
  /// <code>Value</code>. Not supported for text properties.
  /// </dd> <dt>LessThan</dt> <dd>
  /// The value of <code>Name</code> is less than <code>Value</code>. Not
  /// supported for text properties.
  /// </dd> <dt>LessThanOrEqualTo</dt> <dd>
  /// The value of <code>Name</code> is less than or equal to <code>Value</code>.
  /// Not supported for text properties.
  /// </dd> <dt>Contains</dt> <dd>
  /// The value of <code>Name</code> contains the string <code>Value</code>. A
  /// <code>SearchExpression</code> can include only one <code>Contains</code>
  /// operator. Only supported for text properties.
  /// </dd> <dt>Exists</dt> <dd>
  /// The <code>Name</code> property exists.
  /// </dd> <dt>NotExists</dt> <dd>
  /// The <code>Name</code> property does not exist.
  /// </dd> <dt>In</dt> <dd>
  /// The value of <code>Name</code> is one of the comma delimited strings in
  /// <code>Value</code>. Only supported for text properties.
  /// </dd> </dl>
  @_s.JsonKey(name: 'Operator')
  final Operator operator;

  /// A value used with <code>Name</code> and <code>Operator</code> to determine
  /// which resources satisfy the filter's condition. For numerical properties,
  /// <code>Value</code> must be an integer or floating-point decimal. For
  /// timestamp properties, <code>Value</code> must be an ISO 8601 date-time
  /// string of the following format: <code>YYYY-mm-dd'T'HH:MM:SS</code>.
  @_s.JsonKey(name: 'Value')
  final String value;

  Filter({
    @_s.required this.name,
    this.operator,
    this.value,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

/// The candidate result from a job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FinalAutoMLJobObjectiveMetric {
  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final AutoMLMetricEnum metricName;

  /// The value of the metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  /// The metric type used.
  @_s.JsonKey(name: 'Type')
  final AutoMLJobObjectiveType type;

  FinalAutoMLJobObjectiveMetric({
    @_s.required this.metricName,
    @_s.required this.value,
    this.type,
  });
  factory FinalAutoMLJobObjectiveMetric.fromJson(Map<String, dynamic> json) =>
      _$FinalAutoMLJobObjectiveMetricFromJson(json);
}

/// Shows the final value for the objective metric for a training job that was
/// launched by a hyperparameter tuning job. You define the objective metric in
/// the <code>HyperParameterTuningJobObjective</code> parameter of
/// <a>HyperParameterTuningJobConfig</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FinalHyperParameterTuningJobObjectiveMetric {
  /// The name of the objective metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The value of the objective metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  /// Whether to minimize or maximize the objective metric. Valid values are
  /// Minimize and Maximize.
  @_s.JsonKey(name: 'Type')
  final HyperParameterTuningJobObjectiveType type;

  FinalHyperParameterTuningJobObjectiveMetric({
    @_s.required this.metricName,
    @_s.required this.value,
    this.type,
  });
  factory FinalHyperParameterTuningJobObjectiveMetric.fromJson(
          Map<String, dynamic> json) =>
      _$FinalHyperParameterTuningJobObjectiveMetricFromJson(json);
}

/// Contains information about where human output will be stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FlowDefinitionOutputConfig {
  /// The Amazon S3 path where the object containing human output will be made
  /// available.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  /// The Amazon Key Management Service (KMS) key ID for server-side encryption.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  FlowDefinitionOutputConfig({
    @_s.required this.s3OutputPath,
    this.kmsKeyId,
  });
  factory FlowDefinitionOutputConfig.fromJson(Map<String, dynamic> json) =>
      _$FlowDefinitionOutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$FlowDefinitionOutputConfigToJson(this);
}

enum FlowDefinitionStatus {
  @_s.JsonValue('Initializing')
  initializing,
  @_s.JsonValue('Active')
  active,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Deleting')
  deleting,
}

/// Contains summary information about the flow definition.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FlowDefinitionSummary {
  /// The timestamp when SageMaker created the flow definition.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the flow definition.
  @_s.JsonKey(name: 'FlowDefinitionArn')
  final String flowDefinitionArn;

  /// The name of the flow definition.
  @_s.JsonKey(name: 'FlowDefinitionName')
  final String flowDefinitionName;

  /// The status of the flow definition. Valid values:
  @_s.JsonKey(name: 'FlowDefinitionStatus')
  final FlowDefinitionStatus flowDefinitionStatus;

  /// The reason why the flow definition creation failed. A failure reason is
  /// returned only when the flow definition status is <code>Failed</code>.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  FlowDefinitionSummary({
    @_s.required this.creationTime,
    @_s.required this.flowDefinitionArn,
    @_s.required this.flowDefinitionName,
    @_s.required this.flowDefinitionStatus,
    this.failureReason,
  });
  factory FlowDefinitionSummary.fromJson(Map<String, dynamic> json) =>
      _$FlowDefinitionSummaryFromJson(json);
}

enum Framework {
  @_s.JsonValue('TENSORFLOW')
  tensorflow,
  @_s.JsonValue('KERAS')
  keras,
  @_s.JsonValue('MXNET')
  mxnet,
  @_s.JsonValue('ONNX')
  onnx,
  @_s.JsonValue('PYTORCH')
  pytorch,
  @_s.JsonValue('XGBOOST')
  xgboost,
  @_s.JsonValue('TFLITE')
  tflite,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSearchSuggestionsResponse {
  /// A list of property names for a <code>Resource</code> that match a
  /// <code>SuggestionQuery</code>.
  @_s.JsonKey(name: 'PropertyNameSuggestions')
  final List<PropertyNameSuggestion> propertyNameSuggestions;

  GetSearchSuggestionsResponse({
    this.propertyNameSuggestions,
  });
  factory GetSearchSuggestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSearchSuggestionsResponseFromJson(json);
}

/// Specifies configuration details for a Git repository in your AWS account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GitConfig {
  /// The URL where the Git repository is located.
  @_s.JsonKey(name: 'RepositoryUrl')
  final String repositoryUrl;

  /// The default branch for the Git repository.
  @_s.JsonKey(name: 'Branch')
  final String branch;

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that
  /// contains the credentials used to access the git repository. The secret must
  /// have a staging label of <code>AWSCURRENT</code> and must be in the following
  /// format:
  ///
  /// <code>{"username": <i>UserName</i>, "password": <i>Password</i>}</code>
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  GitConfig({
    @_s.required this.repositoryUrl,
    this.branch,
    this.secretArn,
  });
  factory GitConfig.fromJson(Map<String, dynamic> json) =>
      _$GitConfigFromJson(json);

  Map<String, dynamic> toJson() => _$GitConfigToJson(this);
}

/// Specifies configuration details for a Git repository when the repository is
/// updated.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GitConfigForUpdate {
  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that
  /// contains the credentials used to access the git repository. The secret must
  /// have a staging label of <code>AWSCURRENT</code> and must be in the following
  /// format:
  ///
  /// <code>{"username": <i>UserName</i>, "password": <i>Password</i>}</code>
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  GitConfigForUpdate({
    this.secretArn,
  });
  Map<String, dynamic> toJson() => _$GitConfigForUpdateToJson(this);
}

/// Defines under what conditions SageMaker creates a human loop. Used within .
/// See for the required format of activation conditions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HumanLoopActivationConditionsConfig {
  /// JSON expressing use-case specific conditions declaratively. If any condition
  /// is matched, atomic tasks are created against the configured work team. The
  /// set of conditions is different for Rekognition and Textract. For more
  /// information about how to structure the JSON, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/a2i-human-fallback-conditions-json-schema.html">JSON
  /// Schema for Human Loop Activation Conditions in Amazon Augmented AI</a> in
  /// the <i>Amazon SageMaker Developer Guide</i>.
  @_s.JsonKey(name: 'HumanLoopActivationConditions')
  final String humanLoopActivationConditions;

  HumanLoopActivationConditionsConfig({
    @_s.required this.humanLoopActivationConditions,
  });
  factory HumanLoopActivationConditionsConfig.fromJson(
          Map<String, dynamic> json) =>
      _$HumanLoopActivationConditionsConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HumanLoopActivationConditionsConfigToJson(this);
}

/// Provides information about how and under what conditions SageMaker creates a
/// human loop. If <code>HumanLoopActivationConfig</code> is not given, then all
/// requests go to humans.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HumanLoopActivationConfig {
  /// Container structure for defining under what conditions SageMaker creates a
  /// human loop.
  @_s.JsonKey(name: 'HumanLoopActivationConditionsConfig')
  final HumanLoopActivationConditionsConfig humanLoopActivationConditionsConfig;

  HumanLoopActivationConfig({
    @_s.required this.humanLoopActivationConditionsConfig,
  });
  factory HumanLoopActivationConfig.fromJson(Map<String, dynamic> json) =>
      _$HumanLoopActivationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HumanLoopActivationConfigToJson(this);
}

/// Describes the work to be performed by human workers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HumanLoopConfig {
  /// The Amazon Resource Name (ARN) of the human task user interface.
  @_s.JsonKey(name: 'HumanTaskUiArn')
  final String humanTaskUiArn;

  /// The number of distinct workers who will perform the same task on each
  /// object. For example, if <code>TaskCount</code> is set to <code>3</code> for
  /// an image classification labeling job, three workers will classify each input
  /// image. Increasing <code>TaskCount</code> can improve label accuracy.
  @_s.JsonKey(name: 'TaskCount')
  final int taskCount;

  /// A description for the human worker task.
  @_s.JsonKey(name: 'TaskDescription')
  final String taskDescription;

  /// A title for the human worker task.
  @_s.JsonKey(name: 'TaskTitle')
  final String taskTitle;

  /// Amazon Resource Name (ARN) of a team of workers.
  @_s.JsonKey(name: 'WorkteamArn')
  final String workteamArn;
  @_s.JsonKey(name: 'PublicWorkforceTaskPrice')
  final PublicWorkforceTaskPrice publicWorkforceTaskPrice;

  /// The length of time that a task remains available for labeling by human
  /// workers.
  @_s.JsonKey(name: 'TaskAvailabilityLifetimeInSeconds')
  final int taskAvailabilityLifetimeInSeconds;

  /// Keywords used to describe the task so that workers can discover the task.
  @_s.JsonKey(name: 'TaskKeywords')
  final List<String> taskKeywords;

  /// The amount of time that a worker has to complete a task.
  @_s.JsonKey(name: 'TaskTimeLimitInSeconds')
  final int taskTimeLimitInSeconds;

  HumanLoopConfig({
    @_s.required this.humanTaskUiArn,
    @_s.required this.taskCount,
    @_s.required this.taskDescription,
    @_s.required this.taskTitle,
    @_s.required this.workteamArn,
    this.publicWorkforceTaskPrice,
    this.taskAvailabilityLifetimeInSeconds,
    this.taskKeywords,
    this.taskTimeLimitInSeconds,
  });
  factory HumanLoopConfig.fromJson(Map<String, dynamic> json) =>
      _$HumanLoopConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HumanLoopConfigToJson(this);
}

/// Container for configuring the source of human task requests.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HumanLoopRequestSource {
  /// Specifies whether Amazon Rekognition or Amazon Textract are used as the
  /// integration source. The default field settings and JSON parsing rules are
  /// different based on the integration source. Valid values:
  @_s.JsonKey(name: 'AwsManagedHumanLoopRequestSource')
  final AwsManagedHumanLoopRequestSource awsManagedHumanLoopRequestSource;

  HumanLoopRequestSource({
    @_s.required this.awsManagedHumanLoopRequestSource,
  });
  factory HumanLoopRequestSource.fromJson(Map<String, dynamic> json) =>
      _$HumanLoopRequestSourceFromJson(json);

  Map<String, dynamic> toJson() => _$HumanLoopRequestSourceToJson(this);
}

/// Information required for human workers to complete a labeling task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HumanTaskConfig {
  /// Configures how labels are consolidated across human workers.
  @_s.JsonKey(name: 'AnnotationConsolidationConfig')
  final AnnotationConsolidationConfig annotationConsolidationConfig;

  /// The number of human workers that will label an object.
  @_s.JsonKey(name: 'NumberOfHumanWorkersPerDataObject')
  final int numberOfHumanWorkersPerDataObject;

  /// The Amazon Resource Name (ARN) of a Lambda function that is run before a
  /// data object is sent to a human worker. Use this function to provide input to
  /// a custom labeling job.
  ///
  /// For the built-in bounding box, image classification, semantic segmentation,
  /// and text classification task types, Amazon SageMaker Ground Truth provides
  /// the following Lambda functions:
  ///
  /// <b>US East (Northern Virginia) (us-east-1):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-1:432418664414:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>US East (Ohio) (us-east-2):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-east-2:266458841044:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>US West (Oregon) (us-west-2):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:us-west-2:081040173940:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>Canada (Central) (ca-central-1):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ca-central-1:918755190332:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>EU (Ireland) (eu-west-1):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-1:568282634449:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>EU (London) (eu-west-2):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-west-2:487402164563:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>EU Frankfurt (eu-central-1):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:eu-central-1:203001061592:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>Asia Pacific (Tokyo) (ap-northeast-1):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-1:477331159723:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>Asia Pacific (Seoul) (ap-northeast-2):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-northeast-2:845288260483:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>Asia Pacific (Mumbai) (ap-south-1):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-south-1:565803892007:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>Asia Pacific (Singapore) (ap-southeast-1):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-1:377565633583:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  /// <b>Asia Pacific (Sydney) (ap-southeast-2):</b>
  ///
  /// <ul>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-BoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-ImageMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-ImageMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-SemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-TextMultiClass</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-TextMultiClassMultiLabel</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-NamedEntityRecognition</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-VerificationBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-VerificationSemanticSegmentation</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-AdjustmentBoundingBox</code>
  /// </li>
  /// <li>
  /// <code>arn:aws:lambda:ap-southeast-2:454466003867:function:PRE-AdjustmentSemanticSegmentation</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'PreHumanTaskLambdaArn')
  final String preHumanTaskLambdaArn;

  /// A description of the task for your human workers.
  @_s.JsonKey(name: 'TaskDescription')
  final String taskDescription;

  /// The amount of time that a worker has to complete a task.
  @_s.JsonKey(name: 'TaskTimeLimitInSeconds')
  final int taskTimeLimitInSeconds;

  /// A title for the task for your human workers.
  @_s.JsonKey(name: 'TaskTitle')
  final String taskTitle;

  /// Information about the user interface that workers use to complete the
  /// labeling task.
  @_s.JsonKey(name: 'UiConfig')
  final UiConfig uiConfig;

  /// The Amazon Resource Name (ARN) of the work team assigned to complete the
  /// tasks.
  @_s.JsonKey(name: 'WorkteamArn')
  final String workteamArn;

  /// Defines the maximum number of data objects that can be labeled by human
  /// workers at the same time. Also referred to as batch size. Each object may
  /// have more than one worker at one time. The default value is 1000 objects.
  @_s.JsonKey(name: 'MaxConcurrentTaskCount')
  final int maxConcurrentTaskCount;

  /// The price that you pay for each task performed by an Amazon Mechanical Turk
  /// worker.
  @_s.JsonKey(name: 'PublicWorkforceTaskPrice')
  final PublicWorkforceTaskPrice publicWorkforceTaskPrice;

  /// The length of time that a task remains available for labeling by human
  /// workers. <b>If you choose the Amazon Mechanical Turk workforce, the maximum
  /// is 12 hours (43200)</b>. The default value is 864000 seconds (10 days). For
  /// private and vendor workforces, the maximum is as listed.
  @_s.JsonKey(name: 'TaskAvailabilityLifetimeInSeconds')
  final int taskAvailabilityLifetimeInSeconds;

  /// Keywords used to describe the task so that workers on Amazon Mechanical Turk
  /// can discover the task.
  @_s.JsonKey(name: 'TaskKeywords')
  final List<String> taskKeywords;

  HumanTaskConfig({
    @_s.required this.annotationConsolidationConfig,
    @_s.required this.numberOfHumanWorkersPerDataObject,
    @_s.required this.preHumanTaskLambdaArn,
    @_s.required this.taskDescription,
    @_s.required this.taskTimeLimitInSeconds,
    @_s.required this.taskTitle,
    @_s.required this.uiConfig,
    @_s.required this.workteamArn,
    this.maxConcurrentTaskCount,
    this.publicWorkforceTaskPrice,
    this.taskAvailabilityLifetimeInSeconds,
    this.taskKeywords,
  });
  factory HumanTaskConfig.fromJson(Map<String, dynamic> json) =>
      _$HumanTaskConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HumanTaskConfigToJson(this);
}

/// Container for human task user interface information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HumanTaskUiSummary {
  /// A timestamp when SageMaker created the human task user interface.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the human task user interface.
  @_s.JsonKey(name: 'HumanTaskUiArn')
  final String humanTaskUiArn;

  /// The name of the human task user interface.
  @_s.JsonKey(name: 'HumanTaskUiName')
  final String humanTaskUiName;

  HumanTaskUiSummary({
    @_s.required this.creationTime,
    @_s.required this.humanTaskUiArn,
    @_s.required this.humanTaskUiName,
  });
  factory HumanTaskUiSummary.fromJson(Map<String, dynamic> json) =>
      _$HumanTaskUiSummaryFromJson(json);
}

/// Specifies which training algorithm to use for training jobs that a
/// hyperparameter tuning job launches and the metrics to monitor.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HyperParameterAlgorithmSpecification {
  /// The input mode that the algorithm supports: File or Pipe. In File input
  /// mode, Amazon SageMaker downloads the training data from Amazon S3 to the
  /// storage volume that is attached to the training instance and mounts the
  /// directory to the Docker volume for the training container. In Pipe input
  /// mode, Amazon SageMaker streams data directly from Amazon S3 to the
  /// container.
  ///
  /// If you specify File mode, make sure that you provision the storage volume
  /// that is attached to the training instance with enough capacity to
  /// accommodate the training data downloaded from Amazon S3, the model
  /// artifacts, and intermediate information.
  /// <p/>
  /// For more information about input modes, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>.
  @_s.JsonKey(name: 'TrainingInputMode')
  final TrainingInputMode trainingInputMode;

  /// The name of the resource algorithm to use for the hyperparameter tuning job.
  /// If you specify a value for this parameter, do not specify a value for
  /// <code>TrainingImage</code>.
  @_s.JsonKey(name: 'AlgorithmName')
  final String algorithmName;

  /// An array of <a>MetricDefinition</a> objects that specify the metrics that
  /// the algorithm emits.
  @_s.JsonKey(name: 'MetricDefinitions')
  final List<MetricDefinition> metricDefinitions;

  /// The registry path of the Docker image that contains the training algorithm.
  /// For information about Docker registry paths for built-in algorithms, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sagemaker-algo-docker-registry-paths.html">Algorithms
  /// Provided by Amazon SageMaker: Common Parameters</a>. Amazon SageMaker
  /// supports both <code>registry/repository[:tag]</code> and
  /// <code>registry/repository[@digest]</code> image path formats. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using
  /// Your Own Algorithms with Amazon SageMaker</a>.
  @_s.JsonKey(name: 'TrainingImage')
  final String trainingImage;

  HyperParameterAlgorithmSpecification({
    @_s.required this.trainingInputMode,
    this.algorithmName,
    this.metricDefinitions,
    this.trainingImage,
  });
  factory HyperParameterAlgorithmSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$HyperParameterAlgorithmSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HyperParameterAlgorithmSpecificationToJson(this);
}

enum HyperParameterScalingType {
  @_s.JsonValue('Auto')
  auto,
  @_s.JsonValue('Linear')
  linear,
  @_s.JsonValue('Logarithmic')
  logarithmic,
  @_s.JsonValue('ReverseLogarithmic')
  reverseLogarithmic,
}

/// Defines a hyperparameter to be used by an algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HyperParameterSpecification {
  /// The name of this hyperparameter. The name must be unique.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of this hyperparameter. The valid types are <code>Integer</code>,
  /// <code>Continuous</code>, <code>Categorical</code>, and
  /// <code>FreeText</code>.
  @_s.JsonKey(name: 'Type')
  final ParameterType type;

  /// The default value for this hyperparameter. If a default value is specified,
  /// a hyperparameter cannot be required.
  @_s.JsonKey(name: 'DefaultValue')
  final String defaultValue;

  /// A brief description of the hyperparameter.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Indicates whether this hyperparameter is required.
  @_s.JsonKey(name: 'IsRequired')
  final bool isRequired;

  /// Indicates whether this hyperparameter is tunable in a hyperparameter tuning
  /// job.
  @_s.JsonKey(name: 'IsTunable')
  final bool isTunable;

  /// The allowed range for this hyperparameter.
  @_s.JsonKey(name: 'Range')
  final ParameterRange range;

  HyperParameterSpecification({
    @_s.required this.name,
    @_s.required this.type,
    this.defaultValue,
    this.description,
    this.isRequired,
    this.isTunable,
    this.range,
  });
  factory HyperParameterSpecification.fromJson(Map<String, dynamic> json) =>
      _$HyperParameterSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$HyperParameterSpecificationToJson(this);
}

/// Defines the training jobs launched by a hyperparameter tuning job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HyperParameterTrainingJobDefinition {
  /// The <a>HyperParameterAlgorithmSpecification</a> object that specifies the
  /// resource algorithm to use for the training jobs that the tuning job
  /// launches.
  @_s.JsonKey(name: 'AlgorithmSpecification')
  final HyperParameterAlgorithmSpecification algorithmSpecification;

  /// Specifies the path to the Amazon S3 bucket where you store model artifacts
  /// from the training jobs that the tuning job launches.
  @_s.JsonKey(name: 'OutputDataConfig')
  final OutputDataConfig outputDataConfig;

  /// The resources, including the compute instances and storage volumes, to use
  /// for the training jobs that the tuning job launches.
  ///
  /// Storage volumes store model artifacts and incremental states. Training
  /// algorithms might also use storage volumes for scratch space. If you want
  /// Amazon SageMaker to use the storage volume to store the training data,
  /// choose <code>File</code> as the <code>TrainingInputMode</code> in the
  /// algorithm specification. For distributed training algorithms, specify an
  /// instance count greater than 1.
  @_s.JsonKey(name: 'ResourceConfig')
  final ResourceConfig resourceConfig;

  /// The Amazon Resource Name (ARN) of the IAM role associated with the training
  /// jobs that the tuning job launches.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Specifies a limit to how long a model hyperparameter training job can run.
  /// It also specifies how long you are willing to wait for a managed spot
  /// training job to complete. When the job reaches the a limit, Amazon SageMaker
  /// ends the training job. Use this API to cap model training costs.
  @_s.JsonKey(name: 'StoppingCondition')
  final StoppingCondition stoppingCondition;
  @_s.JsonKey(name: 'CheckpointConfig')
  final CheckpointConfig checkpointConfig;

  /// The job definition name.
  @_s.JsonKey(name: 'DefinitionName')
  final String definitionName;

  /// To encrypt all communications between ML compute instances in distributed
  /// training, choose <code>True</code>. Encryption provides greater security for
  /// distributed training, but training might take longer. How long it takes
  /// depends on the amount of communication between compute instances, especially
  /// if you use a deep learning algorithm in distributed training.
  @_s.JsonKey(name: 'EnableInterContainerTrafficEncryption')
  final bool enableInterContainerTrafficEncryption;

  /// A Boolean indicating whether managed spot training is enabled
  /// (<code>True</code>) or not (<code>False</code>).
  @_s.JsonKey(name: 'EnableManagedSpotTraining')
  final bool enableManagedSpotTraining;

  /// Isolates the training container. No inbound or outbound network calls can be
  /// made, except for calls between peers within a training cluster for
  /// distributed training. If network isolation is used for training jobs that
  /// are configured to use a VPC, Amazon SageMaker downloads and uploads customer
  /// data and model artifacts through the specified VPC, but the training
  /// container does not have network access.
  @_s.JsonKey(name: 'EnableNetworkIsolation')
  final bool enableNetworkIsolation;
  @_s.JsonKey(name: 'HyperParameterRanges')
  final ParameterRanges hyperParameterRanges;

  /// An array of <a>Channel</a> objects that specify the input for the training
  /// jobs that the tuning job launches.
  @_s.JsonKey(name: 'InputDataConfig')
  final List<Channel> inputDataConfig;

  /// Specifies the values of hyperparameters that do not change for the tuning
  /// job.
  @_s.JsonKey(name: 'StaticHyperParameters')
  final Map<String, String> staticHyperParameters;
  @_s.JsonKey(name: 'TuningObjective')
  final HyperParameterTuningJobObjective tuningObjective;

  /// The <a>VpcConfig</a> object that specifies the VPC that you want the
  /// training jobs that this hyperparameter tuning job launches to connect to.
  /// Control access to and from your training container by configuring the VPC.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect
  /// Training Jobs by Using an Amazon Virtual Private Cloud</a>.
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  HyperParameterTrainingJobDefinition({
    @_s.required this.algorithmSpecification,
    @_s.required this.outputDataConfig,
    @_s.required this.resourceConfig,
    @_s.required this.roleArn,
    @_s.required this.stoppingCondition,
    this.checkpointConfig,
    this.definitionName,
    this.enableInterContainerTrafficEncryption,
    this.enableManagedSpotTraining,
    this.enableNetworkIsolation,
    this.hyperParameterRanges,
    this.inputDataConfig,
    this.staticHyperParameters,
    this.tuningObjective,
    this.vpcConfig,
  });
  factory HyperParameterTrainingJobDefinition.fromJson(
          Map<String, dynamic> json) =>
      _$HyperParameterTrainingJobDefinitionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HyperParameterTrainingJobDefinitionToJson(this);
}

/// Specifies summary information about a training job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HyperParameterTrainingJobSummary {
  /// The date and time that the training job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the training job.
  @_s.JsonKey(name: 'TrainingJobArn')
  final String trainingJobArn;

  /// The name of the training job.
  @_s.JsonKey(name: 'TrainingJobName')
  final String trainingJobName;

  /// The status of the training job.
  @_s.JsonKey(name: 'TrainingJobStatus')
  final TrainingJobStatus trainingJobStatus;

  /// A list of the hyperparameters for which you specified ranges to search.
  @_s.JsonKey(name: 'TunedHyperParameters')
  final Map<String, String> tunedHyperParameters;

  /// The reason that the training job failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The <a>FinalHyperParameterTuningJobObjectiveMetric</a> object that specifies
  /// the value of the objective metric of the tuning job that launched this
  /// training job.
  @_s.JsonKey(name: 'FinalHyperParameterTuningJobObjectiveMetric')
  final FinalHyperParameterTuningJobObjectiveMetric
      finalHyperParameterTuningJobObjectiveMetric;

  /// The status of the objective metric for the training job:
  ///
  /// <ul>
  /// <li>
  /// Succeeded: The final objective metric for the training job was evaluated by
  /// the hyperparameter tuning job and used in the hyperparameter tuning process.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// Pending: The training job is in progress and evaluation of its final
  /// objective metric is pending.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// Failed: The final objective metric for the training job was not evaluated,
  /// and was not used in the hyperparameter tuning process. This typically occurs
  /// when the training job failed or did not emit an objective metric.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'ObjectiveStatus')
  final ObjectiveStatus objectiveStatus;

  /// Specifies the time when the training job ends on training instances. You are
  /// billed for the time interval between the value of
  /// <code>TrainingStartTime</code> and this time. For successful jobs and
  /// stopped jobs, this is the time after model artifacts are uploaded. For
  /// failed jobs, this is the time when Amazon SageMaker detects a job failure.
  @_s.JsonKey(
      name: 'TrainingEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime trainingEndTime;

  /// The training job definition name.
  @_s.JsonKey(name: 'TrainingJobDefinitionName')
  final String trainingJobDefinitionName;

  /// The date and time that the training job started.
  @_s.JsonKey(
      name: 'TrainingStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime trainingStartTime;

  /// The HyperParameter tuning job that launched the training job.
  @_s.JsonKey(name: 'TuningJobName')
  final String tuningJobName;

  HyperParameterTrainingJobSummary({
    @_s.required this.creationTime,
    @_s.required this.trainingJobArn,
    @_s.required this.trainingJobName,
    @_s.required this.trainingJobStatus,
    @_s.required this.tunedHyperParameters,
    this.failureReason,
    this.finalHyperParameterTuningJobObjectiveMetric,
    this.objectiveStatus,
    this.trainingEndTime,
    this.trainingJobDefinitionName,
    this.trainingStartTime,
    this.tuningJobName,
  });
  factory HyperParameterTrainingJobSummary.fromJson(
          Map<String, dynamic> json) =>
      _$HyperParameterTrainingJobSummaryFromJson(json);
}

/// Configures a hyperparameter tuning job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HyperParameterTuningJobConfig {
  /// The <a>ResourceLimits</a> object that specifies the maximum number of
  /// training jobs and parallel training jobs for this tuning job.
  @_s.JsonKey(name: 'ResourceLimits')
  final ResourceLimits resourceLimits;

  /// Specifies how hyperparameter tuning chooses the combinations of
  /// hyperparameter values to use for the training job it launches. To use the
  /// Bayesian search strategy, set this to <code>Bayesian</code>. To randomly
  /// search, set it to <code>Random</code>. For information about search
  /// strategies, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-how-it-works.html">How
  /// Hyperparameter Tuning Works</a>.
  @_s.JsonKey(name: 'Strategy')
  final HyperParameterTuningJobStrategyType strategy;

  /// The <a>HyperParameterTuningJobObjective</a> object that specifies the
  /// objective metric for this tuning job.
  @_s.JsonKey(name: 'HyperParameterTuningJobObjective')
  final HyperParameterTuningJobObjective hyperParameterTuningJobObjective;

  /// The <a>ParameterRanges</a> object that specifies the ranges of
  /// hyperparameters that this tuning job searches.
  @_s.JsonKey(name: 'ParameterRanges')
  final ParameterRanges parameterRanges;

  /// Specifies whether to use early stopping for training jobs launched by the
  /// hyperparameter tuning job. This can be one of the following values (the
  /// default value is <code>OFF</code>):
  /// <dl> <dt>OFF</dt> <dd>
  /// Training jobs launched by the hyperparameter tuning job do not use early
  /// stopping.
  /// </dd> <dt>AUTO</dt> <dd>
  /// Amazon SageMaker stops training jobs launched by the hyperparameter tuning
  /// job when they are unlikely to perform better than previously completed
  /// training jobs. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-early-stopping.html">Stop
  /// Training Jobs Early</a>.
  /// </dd> </dl>
  @_s.JsonKey(name: 'TrainingJobEarlyStoppingType')
  final TrainingJobEarlyStoppingType trainingJobEarlyStoppingType;

  /// The tuning job's completion criteria.
  @_s.JsonKey(name: 'TuningJobCompletionCriteria')
  final TuningJobCompletionCriteria tuningJobCompletionCriteria;

  HyperParameterTuningJobConfig({
    @_s.required this.resourceLimits,
    @_s.required this.strategy,
    this.hyperParameterTuningJobObjective,
    this.parameterRanges,
    this.trainingJobEarlyStoppingType,
    this.tuningJobCompletionCriteria,
  });
  factory HyperParameterTuningJobConfig.fromJson(Map<String, dynamic> json) =>
      _$HyperParameterTuningJobConfigFromJson(json);

  Map<String, dynamic> toJson() => _$HyperParameterTuningJobConfigToJson(this);
}

/// Defines the objective metric for a hyperparameter tuning job. Hyperparameter
/// tuning uses the value of this metric to evaluate the training jobs it
/// launches, and returns the training job that results in either the highest or
/// lowest value for this metric, depending on the value you specify for the
/// <code>Type</code> parameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HyperParameterTuningJobObjective {
  /// The name of the metric to use for the objective metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// Whether to minimize or maximize the objective metric.
  @_s.JsonKey(name: 'Type')
  final HyperParameterTuningJobObjectiveType type;

  HyperParameterTuningJobObjective({
    @_s.required this.metricName,
    @_s.required this.type,
  });
  factory HyperParameterTuningJobObjective.fromJson(
          Map<String, dynamic> json) =>
      _$HyperParameterTuningJobObjectiveFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HyperParameterTuningJobObjectiveToJson(this);
}

enum HyperParameterTuningJobObjectiveType {
  @_s.JsonValue('Maximize')
  maximize,
  @_s.JsonValue('Minimize')
  minimize,
}

enum HyperParameterTuningJobSortByOptions {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('CreationTime')
  creationTime,
}

enum HyperParameterTuningJobStatus {
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('Stopping')
  stopping,
}

/// The strategy hyperparameter tuning uses to find the best combination of
/// hyperparameters for your model. Currently, the only supported value is
/// <code>Bayesian</code>.
enum HyperParameterTuningJobStrategyType {
  @_s.JsonValue('Bayesian')
  bayesian,
  @_s.JsonValue('Random')
  random,
}

/// Provides summary information about a hyperparameter tuning job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HyperParameterTuningJobSummary {
  /// The date and time that the tuning job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the tuning job.
  @_s.JsonKey(name: 'HyperParameterTuningJobArn')
  final String hyperParameterTuningJobArn;

  /// The name of the tuning job.
  @_s.JsonKey(name: 'HyperParameterTuningJobName')
  final String hyperParameterTuningJobName;

  /// The status of the tuning job.
  @_s.JsonKey(name: 'HyperParameterTuningJobStatus')
  final HyperParameterTuningJobStatus hyperParameterTuningJobStatus;

  /// The <a>ObjectiveStatusCounters</a> object that specifies the numbers of
  /// training jobs, categorized by objective metric status, that this tuning job
  /// launched.
  @_s.JsonKey(name: 'ObjectiveStatusCounters')
  final ObjectiveStatusCounters objectiveStatusCounters;

  /// Specifies the search strategy hyperparameter tuning uses to choose which
  /// hyperparameters to use for each iteration. Currently, the only valid value
  /// is Bayesian.
  @_s.JsonKey(name: 'Strategy')
  final HyperParameterTuningJobStrategyType strategy;

  /// The <a>TrainingJobStatusCounters</a> object that specifies the numbers of
  /// training jobs, categorized by status, that this tuning job launched.
  @_s.JsonKey(name: 'TrainingJobStatusCounters')
  final TrainingJobStatusCounters trainingJobStatusCounters;

  /// The date and time that the tuning job ended.
  @_s.JsonKey(
      name: 'HyperParameterTuningEndTime',
      fromJson: unixFromJson,
      toJson: unixToJson)
  final DateTime hyperParameterTuningEndTime;

  /// The date and time that the tuning job was modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The <a>ResourceLimits</a> object that specifies the maximum number of
  /// training jobs and parallel training jobs allowed for this tuning job.
  @_s.JsonKey(name: 'ResourceLimits')
  final ResourceLimits resourceLimits;

  HyperParameterTuningJobSummary({
    @_s.required this.creationTime,
    @_s.required this.hyperParameterTuningJobArn,
    @_s.required this.hyperParameterTuningJobName,
    @_s.required this.hyperParameterTuningJobStatus,
    @_s.required this.objectiveStatusCounters,
    @_s.required this.strategy,
    @_s.required this.trainingJobStatusCounters,
    this.hyperParameterTuningEndTime,
    this.lastModifiedTime,
    this.resourceLimits,
  });
  factory HyperParameterTuningJobSummary.fromJson(Map<String, dynamic> json) =>
      _$HyperParameterTuningJobSummaryFromJson(json);
}

/// Specifies the configuration for a hyperparameter tuning job that uses one or
/// more previous hyperparameter tuning jobs as a starting point. The results of
/// previous tuning jobs are used to inform which combinations of
/// hyperparameters to search over in the new tuning job.
///
/// All training jobs launched by the new hyperparameter tuning job are
/// evaluated by using the objective metric, and the training job that performs
/// the best is compared to the best training jobs from the parent tuning jobs.
/// From these, the training job that performs the best as measured by the
/// objective metric is returned as the overall best training job.
/// <note>
/// All training jobs launched by parent hyperparameter tuning jobs and the new
/// hyperparameter tuning jobs count against the limit of training jobs for the
/// tuning job.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class HyperParameterTuningJobWarmStartConfig {
  /// An array of hyperparameter tuning jobs that are used as the starting point
  /// for the new hyperparameter tuning job. For more information about warm
  /// starting a hyperparameter tuning job, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-warm-start.html">Using
  /// a Previous Hyperparameter Tuning Job as a Starting Point</a>.
  ///
  /// Hyperparameter tuning jobs created before October 1, 2018 cannot be used as
  /// parent jobs for warm start tuning jobs.
  @_s.JsonKey(name: 'ParentHyperParameterTuningJobs')
  final List<ParentHyperParameterTuningJob> parentHyperParameterTuningJobs;

  /// Specifies one of the following:
  /// <dl> <dt>IDENTICAL_DATA_AND_ALGORITHM</dt> <dd>
  /// The new hyperparameter tuning job uses the same input data and training
  /// image as the parent tuning jobs. You can change the hyperparameter ranges to
  /// search and the maximum number of training jobs that the hyperparameter
  /// tuning job launches. You cannot use a new version of the training algorithm,
  /// unless the changes in the new version do not affect the algorithm itself.
  /// For example, changes that improve logging or adding support for a different
  /// data format are allowed. You can also change hyperparameters from tunable to
  /// static, and from static to tunable, but the total number of static plus
  /// tunable hyperparameters must remain the same as it is in all parent jobs.
  /// The objective metric for the new tuning job must be the same as for all
  /// parent jobs.
  /// </dd> <dt>TRANSFER_LEARNING</dt> <dd>
  /// The new hyperparameter tuning job can include input data, hyperparameter
  /// ranges, maximum number of concurrent training jobs, and maximum number of
  /// training jobs that are different than those of its parent hyperparameter
  /// tuning jobs. The training image can also be a different version from the
  /// version used in the parent hyperparameter tuning job. You can also change
  /// hyperparameters from tunable to static, and from static to tunable, but the
  /// total number of static plus tunable hyperparameters must remain the same as
  /// it is in all parent jobs. The objective metric for the new tuning job must
  /// be the same as for all parent jobs.
  /// </dd> </dl>
  @_s.JsonKey(name: 'WarmStartType')
  final HyperParameterTuningJobWarmStartType warmStartType;

  HyperParameterTuningJobWarmStartConfig({
    @_s.required this.parentHyperParameterTuningJobs,
    @_s.required this.warmStartType,
  });
  factory HyperParameterTuningJobWarmStartConfig.fromJson(
          Map<String, dynamic> json) =>
      _$HyperParameterTuningJobWarmStartConfigFromJson(json);

  Map<String, dynamic> toJson() =>
      _$HyperParameterTuningJobWarmStartConfigToJson(this);
}

enum HyperParameterTuningJobWarmStartType {
  @_s.JsonValue('IdenticalDataAndAlgorithm')
  identicalDataAndAlgorithm,
  @_s.JsonValue('TransferLearning')
  transferLearning,
}

/// Defines how to perform inference generation after a training job is run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InferenceSpecification {
  /// The Amazon ECR registry path of the Docker image that contains the inference
  /// code.
  @_s.JsonKey(name: 'Containers')
  final List<ModelPackageContainerDefinition> containers;

  /// The supported MIME types for the input data.
  @_s.JsonKey(name: 'SupportedContentTypes')
  final List<String> supportedContentTypes;

  /// A list of the instance types that are used to generate inferences in
  /// real-time.
  @_s.JsonKey(name: 'SupportedRealtimeInferenceInstanceTypes')
  final List<String> supportedRealtimeInferenceInstanceTypes;

  /// The supported MIME types for the output data.
  @_s.JsonKey(name: 'SupportedResponseMIMETypes')
  final List<String> supportedResponseMIMETypes;

  /// A list of the instance types on which a transformation job can be run or on
  /// which an endpoint can be deployed.
  @_s.JsonKey(name: 'SupportedTransformInstanceTypes')
  final List<String> supportedTransformInstanceTypes;

  InferenceSpecification({
    @_s.required this.containers,
    @_s.required this.supportedContentTypes,
    @_s.required this.supportedRealtimeInferenceInstanceTypes,
    @_s.required this.supportedResponseMIMETypes,
    @_s.required this.supportedTransformInstanceTypes,
  });
  factory InferenceSpecification.fromJson(Map<String, dynamic> json) =>
      _$InferenceSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$InferenceSpecificationToJson(this);
}

/// Contains information about the location of input model artifacts, the name
/// and shape of the expected data inputs, and the framework in which the model
/// was trained.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputConfig {
  /// Specifies the name and shape of the expected data inputs for your trained
  /// model with a JSON dictionary form. The data inputs are
  /// <a>InputConfig$Framework</a> specific.
  ///
  /// <ul>
  /// <li>
  /// <code>TensorFlow</code>: You must specify the name and shape (NHWC format)
  /// of the expected data inputs using a dictionary format for your trained
  /// model. The dictionary formats required for the console and CLI are
  /// different.
  ///
  /// <ul>
  /// <li>
  /// Examples for one input:
  ///
  /// <ul>
  /// <li>
  /// If using the console, <code>{"input":[1,1024,1024,3]}</code>
  /// </li>
  /// <li>
  /// If using the CLI, <code>{\"input\":[1,1024,1024,3]}</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Examples for two inputs:
  ///
  /// <ul>
  /// <li>
  /// If using the console, <code>{"data1": [1,28,28,1],
  /// "data2":[1,28,28,1]}</code>
  /// </li>
  /// <li>
  /// If using the CLI, <code>{\"data1\": [1,28,28,1],
  /// \"data2\":[1,28,28,1]}</code>
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <code>KERAS</code>: You must specify the name and shape (NCHW format) of
  /// expected data inputs using a dictionary format for your trained model. Note
  /// that while Keras model artifacts should be uploaded in NHWC (channel-last)
  /// format, <code>DataInputConfig</code> should be specified in NCHW
  /// (channel-first) format. The dictionary formats required for the console and
  /// CLI are different.
  ///
  /// <ul>
  /// <li>
  /// Examples for one input:
  ///
  /// <ul>
  /// <li>
  /// If using the console, <code>{"input_1":[1,3,224,224]}</code>
  /// </li>
  /// <li>
  /// If using the CLI, <code>{\"input_1\":[1,3,224,224]}</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Examples for two inputs:
  ///
  /// <ul>
  /// <li>
  /// If using the console, <code>{"input_1": [1,3,224,224],
  /// "input_2":[1,3,224,224]} </code>
  /// </li>
  /// <li>
  /// If using the CLI, <code>{\"input_1\": [1,3,224,224],
  /// \"input_2\":[1,3,224,224]}</code>
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <code>MXNET/ONNX</code>: You must specify the name and shape (NCHW format)
  /// of the expected data inputs in order using a dictionary format for your
  /// trained model. The dictionary formats required for the console and CLI are
  /// different.
  ///
  /// <ul>
  /// <li>
  /// Examples for one input:
  ///
  /// <ul>
  /// <li>
  /// If using the console, <code>{"data":[1,3,1024,1024]}</code>
  /// </li>
  /// <li>
  /// If using the CLI, <code>{\"data\":[1,3,1024,1024]}</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Examples for two inputs:
  ///
  /// <ul>
  /// <li>
  /// If using the console, <code>{"var1": [1,1,28,28], "var2":[1,1,28,28]}
  /// </code>
  /// </li>
  /// <li>
  /// If using the CLI, <code>{\"var1\": [1,1,28,28], \"var2\":[1,1,28,28]}</code>
  /// </li>
  /// </ul> </li>
  /// </ul> </li>
  /// <li>
  /// <code>PyTorch</code>: You can either specify the name and shape (NCHW
  /// format) of expected data inputs in order using a dictionary format for your
  /// trained model or you can specify the shape only using a list format. The
  /// dictionary formats required for the console and CLI are different. The list
  /// formats for the console and CLI are the same.
  ///
  /// <ul>
  /// <li>
  /// Examples for one input in dictionary format:
  ///
  /// <ul>
  /// <li>
  /// If using the console, <code>{"input0":[1,3,224,224]}</code>
  /// </li>
  /// <li>
  /// If using the CLI, <code>{\"input0\":[1,3,224,224]}</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Example for one input in list format: <code>[[1,3,224,224]]</code>
  /// </li>
  /// <li>
  /// Examples for two inputs in dictionary format:
  ///
  /// <ul>
  /// <li>
  /// If using the console, <code>{"input0":[1,3,224,224],
  /// "input1":[1,3,224,224]}</code>
  /// </li>
  /// <li>
  /// If using the CLI, <code>{\"input0\":[1,3,224,224], \"input1\":[1,3,224,224]}
  /// </code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// Example for two inputs in list format: <code>[[1,3,224,224],
  /// [1,3,224,224]]</code>
  /// </li>
  /// </ul> </li>
  /// <li>
  /// <code>XGBOOST</code>: input data name and shape are not needed.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'DataInputConfig')
  final String dataInputConfig;

  /// Identifies the framework in which the model was trained. For example:
  /// TENSORFLOW.
  @_s.JsonKey(name: 'Framework')
  final Framework framework;

  /// The S3 path where the model artifacts, which result from model training, are
  /// stored. This path must point to a single gzip compressed tar archive
  /// (.tar.gz suffix).
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  InputConfig({
    @_s.required this.dataInputConfig,
    @_s.required this.framework,
    @_s.required this.s3Uri,
  });
  factory InputConfig.fromJson(Map<String, dynamic> json) =>
      _$InputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InputConfigToJson(this);
}

enum InstanceType {
  @_s.JsonValue('ml.t2.medium')
  mlT2Medium,
  @_s.JsonValue('ml.t2.large')
  mlT2Large,
  @_s.JsonValue('ml.t2.xlarge')
  mlT2Xlarge,
  @_s.JsonValue('ml.t2.2xlarge')
  mlT2_2xlarge,
  @_s.JsonValue('ml.t3.medium')
  mlT3Medium,
  @_s.JsonValue('ml.t3.large')
  mlT3Large,
  @_s.JsonValue('ml.t3.xlarge')
  mlT3Xlarge,
  @_s.JsonValue('ml.t3.2xlarge')
  mlT3_2xlarge,
  @_s.JsonValue('ml.m4.xlarge')
  mlM4Xlarge,
  @_s.JsonValue('ml.m4.2xlarge')
  mlM4_2xlarge,
  @_s.JsonValue('ml.m4.4xlarge')
  mlM4_4xlarge,
  @_s.JsonValue('ml.m4.10xlarge')
  mlM4_10xlarge,
  @_s.JsonValue('ml.m4.16xlarge')
  mlM4_16xlarge,
  @_s.JsonValue('ml.m5.xlarge')
  mlM5Xlarge,
  @_s.JsonValue('ml.m5.2xlarge')
  mlM5_2xlarge,
  @_s.JsonValue('ml.m5.4xlarge')
  mlM5_4xlarge,
  @_s.JsonValue('ml.m5.12xlarge')
  mlM5_12xlarge,
  @_s.JsonValue('ml.m5.24xlarge')
  mlM5_24xlarge,
  @_s.JsonValue('ml.c4.xlarge')
  mlC4Xlarge,
  @_s.JsonValue('ml.c4.2xlarge')
  mlC4_2xlarge,
  @_s.JsonValue('ml.c4.4xlarge')
  mlC4_4xlarge,
  @_s.JsonValue('ml.c4.8xlarge')
  mlC4_8xlarge,
  @_s.JsonValue('ml.c5.xlarge')
  mlC5Xlarge,
  @_s.JsonValue('ml.c5.2xlarge')
  mlC5_2xlarge,
  @_s.JsonValue('ml.c5.4xlarge')
  mlC5_4xlarge,
  @_s.JsonValue('ml.c5.9xlarge')
  mlC5_9xlarge,
  @_s.JsonValue('ml.c5.18xlarge')
  mlC5_18xlarge,
  @_s.JsonValue('ml.c5d.xlarge')
  mlC5dXlarge,
  @_s.JsonValue('ml.c5d.2xlarge')
  mlC5d_2xlarge,
  @_s.JsonValue('ml.c5d.4xlarge')
  mlC5d_4xlarge,
  @_s.JsonValue('ml.c5d.9xlarge')
  mlC5d_9xlarge,
  @_s.JsonValue('ml.c5d.18xlarge')
  mlC5d_18xlarge,
  @_s.JsonValue('ml.p2.xlarge')
  mlP2Xlarge,
  @_s.JsonValue('ml.p2.8xlarge')
  mlP2_8xlarge,
  @_s.JsonValue('ml.p2.16xlarge')
  mlP2_16xlarge,
  @_s.JsonValue('ml.p3.2xlarge')
  mlP3_2xlarge,
  @_s.JsonValue('ml.p3.8xlarge')
  mlP3_8xlarge,
  @_s.JsonValue('ml.p3.16xlarge')
  mlP3_16xlarge,
}

/// For a hyperparameter of the integer type, specifies the range that a
/// hyperparameter tuning job searches.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IntegerParameterRange {
  /// The maximum value of the hyperparameter to search.
  @_s.JsonKey(name: 'MaxValue')
  final String maxValue;

  /// The minimum value of the hyperparameter to search.
  @_s.JsonKey(name: 'MinValue')
  final String minValue;

  /// The name of the hyperparameter to search.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The scale that hyperparameter tuning uses to search the hyperparameter
  /// range. For information about choosing a hyperparameter scale, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-ranges.html#scaling-type">Hyperparameter
  /// Scaling</a>. One of the following values:
  /// <dl> <dt>Auto</dt> <dd>
  /// Amazon SageMaker hyperparameter tuning chooses the best scale for the
  /// hyperparameter.
  /// </dd> <dt>Linear</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a linear scale.
  /// </dd> <dt>Logarithmic</dt> <dd>
  /// Hyperparameter tuning searches the values in the hyperparameter range by
  /// using a logarithmic scale.
  ///
  /// Logarithmic scaling works only for ranges that have only values greater than
  /// 0.
  /// </dd> </dl>
  @_s.JsonKey(name: 'ScalingType')
  final HyperParameterScalingType scalingType;

  IntegerParameterRange({
    @_s.required this.maxValue,
    @_s.required this.minValue,
    @_s.required this.name,
    this.scalingType,
  });
  factory IntegerParameterRange.fromJson(Map<String, dynamic> json) =>
      _$IntegerParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$IntegerParameterRangeToJson(this);
}

/// Defines the possible values for an integer hyperparameter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class IntegerParameterRangeSpecification {
  /// The maximum integer value allowed.
  @_s.JsonKey(name: 'MaxValue')
  final String maxValue;

  /// The minimum integer value allowed.
  @_s.JsonKey(name: 'MinValue')
  final String minValue;

  IntegerParameterRangeSpecification({
    @_s.required this.maxValue,
    @_s.required this.minValue,
  });
  factory IntegerParameterRangeSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$IntegerParameterRangeSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$IntegerParameterRangeSpecificationToJson(this);
}

enum JoinSource {
  @_s.JsonValue('Input')
  input,
  @_s.JsonValue('None')
  none,
}

/// Jupyter server's app settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JupyterServerAppSettings {
  /// The instance type and quantity.
  @_s.JsonKey(name: 'DefaultResourceSpec')
  final ResourceSpec defaultResourceSpec;

  JupyterServerAppSettings({
    this.defaultResourceSpec,
  });
  factory JupyterServerAppSettings.fromJson(Map<String, dynamic> json) =>
      _$JupyterServerAppSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$JupyterServerAppSettingsToJson(this);
}

/// The kernel gateway app settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class KernelGatewayAppSettings {
  /// The instance type and quantity.
  @_s.JsonKey(name: 'DefaultResourceSpec')
  final ResourceSpec defaultResourceSpec;

  KernelGatewayAppSettings({
    this.defaultResourceSpec,
  });
  factory KernelGatewayAppSettings.fromJson(Map<String, dynamic> json) =>
      _$KernelGatewayAppSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$KernelGatewayAppSettingsToJson(this);
}

/// Provides a breakdown of the number of objects labeled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LabelCounters {
  /// The total number of objects that could not be labeled due to an error.
  @_s.JsonKey(name: 'FailedNonRetryableError')
  final int failedNonRetryableError;

  /// The total number of objects labeled by a human worker.
  @_s.JsonKey(name: 'HumanLabeled')
  final int humanLabeled;

  /// The total number of objects labeled by automated data labeling.
  @_s.JsonKey(name: 'MachineLabeled')
  final int machineLabeled;

  /// The total number of objects labeled.
  @_s.JsonKey(name: 'TotalLabeled')
  final int totalLabeled;

  /// The total number of objects not yet labeled.
  @_s.JsonKey(name: 'Unlabeled')
  final int unlabeled;

  LabelCounters({
    this.failedNonRetryableError,
    this.humanLabeled,
    this.machineLabeled,
    this.totalLabeled,
    this.unlabeled,
  });
  factory LabelCounters.fromJson(Map<String, dynamic> json) =>
      _$LabelCountersFromJson(json);
}

/// Provides counts for human-labeled tasks in the labeling job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LabelCountersForWorkteam {
  /// The total number of data objects labeled by a human worker.
  @_s.JsonKey(name: 'HumanLabeled')
  final int humanLabeled;

  /// The total number of data objects that need to be labeled by a human worker.
  @_s.JsonKey(name: 'PendingHuman')
  final int pendingHuman;

  /// The total number of tasks in the labeling job.
  @_s.JsonKey(name: 'Total')
  final int total;

  LabelCountersForWorkteam({
    this.humanLabeled,
    this.pendingHuman,
    this.total,
  });
  factory LabelCountersForWorkteam.fromJson(Map<String, dynamic> json) =>
      _$LabelCountersForWorkteamFromJson(json);
}

/// Provides configuration information for auto-labeling of your data objects. A
/// <code>LabelingJobAlgorithmsConfig</code> object must be supplied in order to
/// use auto-labeling.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelingJobAlgorithmsConfig {
  /// Specifies the Amazon Resource Name (ARN) of the algorithm used for
  /// auto-labeling. You must select one of the following ARNs:
  ///
  /// <ul>
  /// <li>
  /// <i>Image classification</i>
  ///
  /// <code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/image-classification</code>
  /// </li>
  /// <li>
  /// <i>Text classification</i>
  ///
  /// <code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/text-classification</code>
  /// </li>
  /// <li>
  /// <i>Object detection</i>
  ///
  /// <code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/object-detection</code>
  /// </li>
  /// <li>
  /// <i>Semantic Segmentation</i>
  ///
  /// <code>arn:aws:sagemaker:<i>region</i>:027400017018:labeling-job-algorithm-specification/semantic-segmentation</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'LabelingJobAlgorithmSpecificationArn')
  final String labelingJobAlgorithmSpecificationArn;

  /// At the end of an auto-label job Amazon SageMaker Ground Truth sends the
  /// Amazon Resource Nam (ARN) of the final model used for auto-labeling. You can
  /// use this model as the starting point for subsequent similar jobs by
  /// providing the ARN of the model here.
  @_s.JsonKey(name: 'InitialActiveLearningModelArn')
  final String initialActiveLearningModelArn;

  /// Provides configuration information for a labeling job.
  @_s.JsonKey(name: 'LabelingJobResourceConfig')
  final LabelingJobResourceConfig labelingJobResourceConfig;

  LabelingJobAlgorithmsConfig({
    @_s.required this.labelingJobAlgorithmSpecificationArn,
    this.initialActiveLearningModelArn,
    this.labelingJobResourceConfig,
  });
  factory LabelingJobAlgorithmsConfig.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobAlgorithmsConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LabelingJobAlgorithmsConfigToJson(this);
}

/// Attributes of the data specified by the customer. Use these to describe the
/// data to be labeled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelingJobDataAttributes {
  /// Declares that your content is free of personally identifiable information or
  /// adult content. Amazon SageMaker may restrict the Amazon Mechanical Turk
  /// workers that can view your task based on this information.
  @_s.JsonKey(name: 'ContentClassifiers')
  final List<String> contentClassifiers;

  LabelingJobDataAttributes({
    this.contentClassifiers,
  });
  factory LabelingJobDataAttributes.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobDataAttributesFromJson(json);

  Map<String, dynamic> toJson() => _$LabelingJobDataAttributesToJson(this);
}

/// Provides information about the location of input data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelingJobDataSource {
  /// The Amazon S3 location of the input data objects.
  @_s.JsonKey(name: 'S3DataSource')
  final LabelingJobS3DataSource s3DataSource;

  LabelingJobDataSource({
    @_s.required this.s3DataSource,
  });
  factory LabelingJobDataSource.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobDataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$LabelingJobDataSourceToJson(this);
}

/// Provides summary information for a work team.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LabelingJobForWorkteamSummary {
  /// The date and time that the labeling job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// A unique identifier for a labeling job. You can use this to refer to a
  /// specific labeling job.
  @_s.JsonKey(name: 'JobReferenceCode')
  final String jobReferenceCode;

  /// <p/>
  @_s.JsonKey(name: 'WorkRequesterAccountId')
  final String workRequesterAccountId;

  /// Provides information about the progress of a labeling job.
  @_s.JsonKey(name: 'LabelCounters')
  final LabelCountersForWorkteam labelCounters;

  /// The name of the labeling job that the work team is assigned to.
  @_s.JsonKey(name: 'LabelingJobName')
  final String labelingJobName;

  /// The configured number of workers per data object.
  @_s.JsonKey(name: 'NumberOfHumanWorkersPerDataObject')
  final int numberOfHumanWorkersPerDataObject;

  LabelingJobForWorkteamSummary({
    @_s.required this.creationTime,
    @_s.required this.jobReferenceCode,
    @_s.required this.workRequesterAccountId,
    this.labelCounters,
    this.labelingJobName,
    this.numberOfHumanWorkersPerDataObject,
  });
  factory LabelingJobForWorkteamSummary.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobForWorkteamSummaryFromJson(json);
}

/// Input configuration information for a labeling job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelingJobInputConfig {
  /// The location of the input data.
  @_s.JsonKey(name: 'DataSource')
  final LabelingJobDataSource dataSource;

  /// Attributes of the data specified by the customer.
  @_s.JsonKey(name: 'DataAttributes')
  final LabelingJobDataAttributes dataAttributes;

  LabelingJobInputConfig({
    @_s.required this.dataSource,
    this.dataAttributes,
  });
  factory LabelingJobInputConfig.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobInputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LabelingJobInputConfigToJson(this);
}

/// Specifies the location of the output produced by the labeling job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LabelingJobOutput {
  /// The Amazon S3 bucket location of the manifest file for labeled data.
  @_s.JsonKey(name: 'OutputDatasetS3Uri')
  final String outputDatasetS3Uri;

  /// The Amazon Resource Name (ARN) for the most recent Amazon SageMaker model
  /// trained as part of automated data labeling.
  @_s.JsonKey(name: 'FinalActiveLearningModelArn')
  final String finalActiveLearningModelArn;

  LabelingJobOutput({
    @_s.required this.outputDatasetS3Uri,
    this.finalActiveLearningModelArn,
  });
  factory LabelingJobOutput.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobOutputFromJson(json);
}

/// Output configuration information for a labeling job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelingJobOutputConfig {
  /// The Amazon S3 location to write output data.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  /// The AWS Key Management Service ID of the key used to encrypt the output
  /// data, if any.
  ///
  /// If you use a KMS key ID or an alias of your master key, the Amazon SageMaker
  /// execution role must include permissions to call <code>kms:Encrypt</code>. If
  /// you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key
  /// for Amazon S3 for your role's account. Amazon SageMaker uses server-side
  /// encryption with KMS-managed keys for <code>LabelingJobOutputConfig</code>.
  /// If you use a bucket policy with an <code>s3:PutObject</code> permission that
  /// only allows objects with server-side encryption, set the condition key of
  /// <code>s3:x-amz-server-side-encryption</code> to <code>"aws:kms"</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">KMS-Managed
  /// Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide.</i>
  ///
  /// The KMS key policy must grant permission to the IAM role that you specify in
  /// your <code>CreateLabelingJob</code> request. For more information, see <a
  /// href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Using
  /// Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  LabelingJobOutputConfig({
    @_s.required this.s3OutputPath,
    this.kmsKeyId,
  });
  factory LabelingJobOutputConfig.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobOutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LabelingJobOutputConfigToJson(this);
}

/// Provides configuration information for labeling jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelingJobResourceConfig {
  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt data on the storage volume attached to the ML compute instance(s)
  /// that run the training job. The <code>VolumeKmsKeyId</code> can be any of the
  /// following formats:
  ///
  /// <ul>
  /// <li>
  /// // KMS Key ID
  ///
  /// <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// // Amazon Resource Name (ARN) of a KMS Key
  ///
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'VolumeKmsKeyId')
  final String volumeKmsKeyId;

  LabelingJobResourceConfig({
    this.volumeKmsKeyId,
  });
  factory LabelingJobResourceConfig.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobResourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LabelingJobResourceConfigToJson(this);
}

/// The Amazon S3 location of the input data objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelingJobS3DataSource {
  /// The Amazon S3 location of the manifest file that describes the input data
  /// objects.
  @_s.JsonKey(name: 'ManifestS3Uri')
  final String manifestS3Uri;

  LabelingJobS3DataSource({
    @_s.required this.manifestS3Uri,
  });
  factory LabelingJobS3DataSource.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobS3DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$LabelingJobS3DataSourceToJson(this);
}

enum LabelingJobStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
}

/// A set of conditions for stopping a labeling job. If any of the conditions
/// are met, the job is automatically stopped. You can use these conditions to
/// control the cost of data labeling.
/// <note>
/// Labeling jobs fail after 30 days with an appropriate client error message.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LabelingJobStoppingConditions {
  /// The maximum number of objects that can be labeled by human workers.
  @_s.JsonKey(name: 'MaxHumanLabeledObjectCount')
  final int maxHumanLabeledObjectCount;

  /// The maximum number of input data objects that should be labeled.
  @_s.JsonKey(name: 'MaxPercentageOfInputDatasetLabeled')
  final int maxPercentageOfInputDatasetLabeled;

  LabelingJobStoppingConditions({
    this.maxHumanLabeledObjectCount,
    this.maxPercentageOfInputDatasetLabeled,
  });
  factory LabelingJobStoppingConditions.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobStoppingConditionsFromJson(json);

  Map<String, dynamic> toJson() => _$LabelingJobStoppingConditionsToJson(this);
}

/// Provides summary information about a labeling job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LabelingJobSummary {
  /// The date and time that the job was created (timestamp).
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// Counts showing the progress of the labeling job.
  @_s.JsonKey(name: 'LabelCounters')
  final LabelCounters labelCounters;

  /// The Amazon Resource Name (ARN) assigned to the labeling job when it was
  /// created.
  @_s.JsonKey(name: 'LabelingJobArn')
  final String labelingJobArn;

  /// The name of the labeling job.
  @_s.JsonKey(name: 'LabelingJobName')
  final String labelingJobName;

  /// The current status of the labeling job.
  @_s.JsonKey(name: 'LabelingJobStatus')
  final LabelingJobStatus labelingJobStatus;

  /// The date and time that the job was last modified (timestamp).
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of a Lambda function. The function is run
  /// before each data object is sent to a worker.
  @_s.JsonKey(name: 'PreHumanTaskLambdaArn')
  final String preHumanTaskLambdaArn;

  /// The Amazon Resource Name (ARN) of the work team assigned to the job.
  @_s.JsonKey(name: 'WorkteamArn')
  final String workteamArn;

  /// The Amazon Resource Name (ARN) of the Lambda function used to consolidate
  /// the annotations from individual workers into a label for a data object. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-annotation-consolidation.html">Annotation
  /// Consolidation</a>.
  @_s.JsonKey(name: 'AnnotationConsolidationLambdaArn')
  final String annotationConsolidationLambdaArn;

  /// If the <code>LabelingJobStatus</code> field is <code>Failed</code>, this
  /// field contains a description of the error.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Input configuration for the labeling job.
  @_s.JsonKey(name: 'InputConfig')
  final LabelingJobInputConfig inputConfig;

  /// The location of the output produced by the labeling job.
  @_s.JsonKey(name: 'LabelingJobOutput')
  final LabelingJobOutput labelingJobOutput;

  LabelingJobSummary({
    @_s.required this.creationTime,
    @_s.required this.labelCounters,
    @_s.required this.labelingJobArn,
    @_s.required this.labelingJobName,
    @_s.required this.labelingJobStatus,
    @_s.required this.lastModifiedTime,
    @_s.required this.preHumanTaskLambdaArn,
    @_s.required this.workteamArn,
    this.annotationConsolidationLambdaArn,
    this.failureReason,
    this.inputConfig,
    this.labelingJobOutput,
  });
  factory LabelingJobSummary.fromJson(Map<String, dynamic> json) =>
      _$LabelingJobSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAlgorithmsOutput {
  /// &gt;An array of <code>AlgorithmSummary</code> objects, each of which lists
  /// an algorithm.
  @_s.JsonKey(name: 'AlgorithmSummaryList')
  final List<AlgorithmSummary> algorithmSummaryList;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of algorithms, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAlgorithmsOutput({
    @_s.required this.algorithmSummaryList,
    this.nextToken,
  });
  factory ListAlgorithmsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListAlgorithmsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAppsResponse {
  /// The list of apps.
  @_s.JsonKey(name: 'Apps')
  final List<AppDetails> apps;

  /// If the previous response was truncated, you will receive this token. Use it
  /// in your next request to receive the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAppsResponse({
    this.apps,
    this.nextToken,
  });
  factory ListAppsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAppsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAutoMLJobsResponse {
  /// Returns a summary list of jobs.
  @_s.JsonKey(name: 'AutoMLJobSummaries')
  final List<AutoMLJobSummary> autoMLJobSummaries;

  /// If the previous response was truncated, you will receive this token. Use it
  /// in your next request to receive the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAutoMLJobsResponse({
    @_s.required this.autoMLJobSummaries,
    this.nextToken,
  });
  factory ListAutoMLJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAutoMLJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCandidatesForAutoMLJobResponse {
  /// Summaries about the Candidates.
  @_s.JsonKey(name: 'Candidates')
  final List<AutoMLCandidate> candidates;

  /// If the previous response was truncated, you will receive this token. Use it
  /// in your next request to receive the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCandidatesForAutoMLJobResponse({
    @_s.required this.candidates,
    this.nextToken,
  });
  factory ListCandidatesForAutoMLJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListCandidatesForAutoMLJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCodeRepositoriesOutput {
  /// Gets a list of summaries of the Git repositories. Each summary specifies the
  /// following values for the repository:
  ///
  /// <ul>
  /// <li>
  /// Name
  /// </li>
  /// <li>
  /// Amazon Resource Name (ARN)
  /// </li>
  /// <li>
  /// Creation time
  /// </li>
  /// <li>
  /// Last modified time
  /// </li>
  /// <li>
  /// Configuration information, including the URL location of the repository and
  /// the ARN of the AWS Secrets Manager secret that contains the credentials used
  /// to access the repository.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'CodeRepositorySummaryList')
  final List<CodeRepositorySummary> codeRepositorySummaryList;

  /// If the result of a <code>ListCodeRepositoriesOutput</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To get the next
  /// set of Git repositories, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCodeRepositoriesOutput({
    @_s.required this.codeRepositorySummaryList,
    this.nextToken,
  });
  factory ListCodeRepositoriesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListCodeRepositoriesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListCompilationJobsResponse {
  /// An array of <a>CompilationJobSummary</a> objects, each describing a model
  /// compilation job.
  @_s.JsonKey(name: 'CompilationJobSummaries')
  final List<CompilationJobSummary> compilationJobSummaries;

  /// If the response is truncated, Amazon SageMaker returns this
  /// <code>NextToken</code>. To retrieve the next set of model compilation jobs,
  /// use this token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListCompilationJobsResponse({
    @_s.required this.compilationJobSummaries,
    this.nextToken,
  });
  factory ListCompilationJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListCompilationJobsResponseFromJson(json);
}

enum ListCompilationJobsSortBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('Status')
  status,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDomainsResponse {
  /// The list of domains.
  @_s.JsonKey(name: 'Domains')
  final List<DomainDetails> domains;

  /// If the previous response was truncated, you will receive this token. Use it
  /// in your next request to receive the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDomainsResponse({
    this.domains,
    this.nextToken,
  });
  factory ListDomainsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDomainsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEndpointConfigsOutput {
  /// An array of endpoint configurations.
  @_s.JsonKey(name: 'EndpointConfigs')
  final List<EndpointConfigSummary> endpointConfigs;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of endpoint configurations, use it in the subsequent
  /// request
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEndpointConfigsOutput({
    @_s.required this.endpointConfigs,
    this.nextToken,
  });
  factory ListEndpointConfigsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListEndpointConfigsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEndpointsOutput {
  /// An array or endpoint objects.
  @_s.JsonKey(name: 'Endpoints')
  final List<EndpointSummary> endpoints;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of training jobs, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEndpointsOutput({
    @_s.required this.endpoints,
    this.nextToken,
  });
  factory ListEndpointsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListEndpointsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListExperimentsResponse {
  /// A list of the summaries of your experiments.
  @_s.JsonKey(name: 'ExperimentSummaries')
  final List<ExperimentSummary> experimentSummaries;

  /// A token for getting the next set of experiments, if there are any.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListExperimentsResponse({
    this.experimentSummaries,
    this.nextToken,
  });
  factory ListExperimentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListExperimentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFlowDefinitionsResponse {
  /// An array of objects describing the flow definitions.
  @_s.JsonKey(name: 'FlowDefinitionSummaries')
  final List<FlowDefinitionSummary> flowDefinitionSummaries;

  /// A token to resume pagination.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFlowDefinitionsResponse({
    @_s.required this.flowDefinitionSummaries,
    this.nextToken,
  });
  factory ListFlowDefinitionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFlowDefinitionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHumanTaskUisResponse {
  /// An array of objects describing the human task user interfaces.
  @_s.JsonKey(name: 'HumanTaskUiSummaries')
  final List<HumanTaskUiSummary> humanTaskUiSummaries;

  /// A token to resume pagination.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHumanTaskUisResponse({
    @_s.required this.humanTaskUiSummaries,
    this.nextToken,
  });
  factory ListHumanTaskUisResponse.fromJson(Map<String, dynamic> json) =>
      _$ListHumanTaskUisResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListHyperParameterTuningJobsResponse {
  /// A list of <a>HyperParameterTuningJobSummary</a> objects that describe the
  /// tuning jobs that the <code>ListHyperParameterTuningJobs</code> request
  /// returned.
  @_s.JsonKey(name: 'HyperParameterTuningJobSummaries')
  final List<HyperParameterTuningJobSummary> hyperParameterTuningJobSummaries;

  /// If the result of this <code>ListHyperParameterTuningJobs</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of tuning jobs, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListHyperParameterTuningJobsResponse({
    @_s.required this.hyperParameterTuningJobSummaries,
    this.nextToken,
  });
  factory ListHyperParameterTuningJobsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListHyperParameterTuningJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLabelingJobsForWorkteamResponse {
  /// An array of <code>LabelingJobSummary</code> objects, each describing a
  /// labeling job.
  @_s.JsonKey(name: 'LabelingJobSummaryList')
  final List<LabelingJobForWorkteamSummary> labelingJobSummaryList;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of labeling jobs, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLabelingJobsForWorkteamResponse({
    @_s.required this.labelingJobSummaryList,
    this.nextToken,
  });
  factory ListLabelingJobsForWorkteamResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListLabelingJobsForWorkteamResponseFromJson(json);
}

enum ListLabelingJobsForWorkteamSortByOptions {
  @_s.JsonValue('CreationTime')
  creationTime,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLabelingJobsResponse {
  /// An array of <code>LabelingJobSummary</code> objects, each describing a
  /// labeling job.
  @_s.JsonKey(name: 'LabelingJobSummaryList')
  final List<LabelingJobSummary> labelingJobSummaryList;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of labeling jobs, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLabelingJobsResponse({
    this.labelingJobSummaryList,
    this.nextToken,
  });
  factory ListLabelingJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListLabelingJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListModelPackagesOutput {
  /// An array of <code>ModelPackageSummary</code> objects, each of which lists a
  /// model package.
  @_s.JsonKey(name: 'ModelPackageSummaryList')
  final List<ModelPackageSummary> modelPackageSummaryList;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of model packages, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListModelPackagesOutput({
    @_s.required this.modelPackageSummaryList,
    this.nextToken,
  });
  factory ListModelPackagesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListModelPackagesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListModelsOutput {
  /// An array of <code>ModelSummary</code> objects, each of which lists a model.
  @_s.JsonKey(name: 'Models')
  final List<ModelSummary> models;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of models, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListModelsOutput({
    @_s.required this.models,
    this.nextToken,
  });
  factory ListModelsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListModelsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMonitoringExecutionsResponse {
  /// A JSON array in which each element is a summary for a monitoring execution.
  @_s.JsonKey(name: 'MonitoringExecutionSummaries')
  final List<MonitoringExecutionSummary> monitoringExecutionSummaries;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of jobs, use it in the subsequent reques
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMonitoringExecutionsResponse({
    @_s.required this.monitoringExecutionSummaries,
    this.nextToken,
  });
  factory ListMonitoringExecutionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListMonitoringExecutionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMonitoringSchedulesResponse {
  /// A JSON array in which each element is a summary for a monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleSummaries')
  final List<MonitoringScheduleSummary> monitoringScheduleSummaries;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of jobs, use it in the subsequent reques
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMonitoringSchedulesResponse({
    @_s.required this.monitoringScheduleSummaries,
    this.nextToken,
  });
  factory ListMonitoringSchedulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMonitoringSchedulesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNotebookInstanceLifecycleConfigsOutput {
  /// If the response is truncated, Amazon SageMaker returns this token. To get
  /// the next set of lifecycle configurations, use it in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>NotebookInstanceLifecycleConfiguration</code> objects,
  /// each listing a lifecycle configuration.
  @_s.JsonKey(name: 'NotebookInstanceLifecycleConfigs')
  final List<NotebookInstanceLifecycleConfigSummary>
      notebookInstanceLifecycleConfigs;

  ListNotebookInstanceLifecycleConfigsOutput({
    this.nextToken,
    this.notebookInstanceLifecycleConfigs,
  });
  factory ListNotebookInstanceLifecycleConfigsOutput.fromJson(
          Map<String, dynamic> json) =>
      _$ListNotebookInstanceLifecycleConfigsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListNotebookInstancesOutput {
  /// If the response to the previous <code>ListNotebookInstances</code> request
  /// was truncated, Amazon SageMaker returns this token. To retrieve the next set
  /// of notebook instances, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>NotebookInstanceSummary</code> objects, one for each
  /// notebook instance.
  @_s.JsonKey(name: 'NotebookInstances')
  final List<NotebookInstanceSummary> notebookInstances;

  ListNotebookInstancesOutput({
    this.nextToken,
    this.notebookInstances,
  });
  factory ListNotebookInstancesOutput.fromJson(Map<String, dynamic> json) =>
      _$ListNotebookInstancesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProcessingJobsResponse {
  /// An array of <code>ProcessingJobSummary</code> objects, each listing a
  /// processing job.
  @_s.JsonKey(name: 'ProcessingJobSummaries')
  final List<ProcessingJobSummary> processingJobSummaries;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of processing jobs, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListProcessingJobsResponse({
    @_s.required this.processingJobSummaries,
    this.nextToken,
  });
  factory ListProcessingJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProcessingJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSubscribedWorkteamsResponse {
  /// An array of <code>Workteam</code> objects, each describing a work team.
  @_s.JsonKey(name: 'SubscribedWorkteams')
  final List<SubscribedWorkteam> subscribedWorkteams;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of work teams, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListSubscribedWorkteamsResponse({
    @_s.required this.subscribedWorkteams,
    this.nextToken,
  });
  factory ListSubscribedWorkteamsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSubscribedWorkteamsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsOutput {
  /// If response is truncated, Amazon SageMaker includes a token in the response.
  /// You can use this token in your subsequent request to fetch next set of
  /// tokens.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of <code>Tag</code> objects, each with a tag key and a value.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsOutput({
    this.nextToken,
    this.tags,
  });
  factory ListTagsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListTagsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTrainingJobsForHyperParameterTuningJobResponse {
  /// A list of <a>TrainingJobSummary</a> objects that describe the training jobs
  /// that the <code>ListTrainingJobsForHyperParameterTuningJob</code> request
  /// returned.
  @_s.JsonKey(name: 'TrainingJobSummaries')
  final List<HyperParameterTrainingJobSummary> trainingJobSummaries;

  /// If the result of this
  /// <code>ListTrainingJobsForHyperParameterTuningJob</code> request was
  /// truncated, the response includes a <code>NextToken</code>. To retrieve the
  /// next set of training jobs, use the token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTrainingJobsForHyperParameterTuningJobResponse({
    @_s.required this.trainingJobSummaries,
    this.nextToken,
  });
  factory ListTrainingJobsForHyperParameterTuningJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListTrainingJobsForHyperParameterTuningJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTrainingJobsResponse {
  /// An array of <code>TrainingJobSummary</code> objects, each listing a training
  /// job.
  @_s.JsonKey(name: 'TrainingJobSummaries')
  final List<TrainingJobSummary> trainingJobSummaries;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of training jobs, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTrainingJobsResponse({
    @_s.required this.trainingJobSummaries,
    this.nextToken,
  });
  factory ListTrainingJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTrainingJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTransformJobsResponse {
  /// An array of <code>TransformJobSummary</code> objects.
  @_s.JsonKey(name: 'TransformJobSummaries')
  final List<TransformJobSummary> transformJobSummaries;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of transform jobs, use it in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTransformJobsResponse({
    @_s.required this.transformJobSummaries,
    this.nextToken,
  });
  factory ListTransformJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTransformJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTrialComponentsResponse {
  /// A token for getting the next set of components, if there are any.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the summaries of your trial components.
  @_s.JsonKey(name: 'TrialComponentSummaries')
  final List<TrialComponentSummary> trialComponentSummaries;

  ListTrialComponentsResponse({
    this.nextToken,
    this.trialComponentSummaries,
  });
  factory ListTrialComponentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTrialComponentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTrialsResponse {
  /// A token for getting the next set of trials, if there are any.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of the summaries of your trials.
  @_s.JsonKey(name: 'TrialSummaries')
  final List<TrialSummary> trialSummaries;

  ListTrialsResponse({
    this.nextToken,
    this.trialSummaries,
  });
  factory ListTrialsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTrialsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUserProfilesResponse {
  /// If the previous response was truncated, you will receive this token. Use it
  /// in your next request to receive the next set of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The list of user profiles.
  @_s.JsonKey(name: 'UserProfiles')
  final List<UserProfileDetails> userProfiles;

  ListUserProfilesResponse({
    this.nextToken,
    this.userProfiles,
  });
  factory ListUserProfilesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUserProfilesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorkteamsResponse {
  /// An array of <code>Workteam</code> objects, each describing a work team.
  @_s.JsonKey(name: 'Workteams')
  final List<Workteam> workteams;

  /// If the response is truncated, Amazon SageMaker returns this token. To
  /// retrieve the next set of work teams, use it in the subsequent request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListWorkteamsResponse({
    @_s.required this.workteams,
    this.nextToken,
  });
  factory ListWorkteamsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWorkteamsResponseFromJson(json);
}

enum ListWorkteamsSortByOptions {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreateDate')
  createDate,
}

/// Defines the Amazon Cognito user group that is part of a work team.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MemberDefinition {
  /// The Amazon Cognito user group that is part of the work team.
  @_s.JsonKey(name: 'CognitoMemberDefinition')
  final CognitoMemberDefinition cognitoMemberDefinition;

  MemberDefinition({
    this.cognitoMemberDefinition,
  });
  factory MemberDefinition.fromJson(Map<String, dynamic> json) =>
      _$MemberDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$MemberDefinitionToJson(this);
}

/// The name, value, and date and time of a metric that was emitted to Amazon
/// CloudWatch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MetricData {
  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The date and time that the algorithm emitted the metric.
  @_s.JsonKey(name: 'Timestamp', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime timestamp;

  /// The value of the metric.
  @_s.JsonKey(name: 'Value')
  final double value;

  MetricData({
    this.metricName,
    this.timestamp,
    this.value,
  });
  factory MetricData.fromJson(Map<String, dynamic> json) =>
      _$MetricDataFromJson(json);
}

/// Specifies a metric that the training algorithm writes to <code>stderr</code>
/// or <code>stdout</code> . Amazon SageMakerhyperparameter tuning captures all
/// defined metrics. You specify one metric that a hyperparameter tuning job
/// uses as its objective metric to choose the best training job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MetricDefinition {
  /// The name of the metric.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A regular expression that searches the output of a training job and gets the
  /// value of the metric. For more information about using regular expressions to
  /// define metrics, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/automatic-model-tuning-define-metrics.html">Defining
  /// Objective Metrics</a>.
  @_s.JsonKey(name: 'Regex')
  final String regex;

  MetricDefinition({
    @_s.required this.name,
    @_s.required this.regex,
  });
  factory MetricDefinition.fromJson(Map<String, dynamic> json) =>
      _$MetricDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$MetricDefinitionToJson(this);
}

/// Provides information about the location that is configured for storing model
/// artifacts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelArtifacts {
  /// The path of the S3 object that contains the model artifacts. For example,
  /// <code>s3://bucket-name/keynameprefix/model.tar.gz</code>.
  @_s.JsonKey(name: 'S3ModelArtifacts')
  final String s3ModelArtifacts;

  ModelArtifacts({
    @_s.required this.s3ModelArtifacts,
  });
  factory ModelArtifacts.fromJson(Map<String, dynamic> json) =>
      _$ModelArtifactsFromJson(json);
}

/// Describes the Docker container for the model package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelPackageContainerDefinition {
  /// The Amazon EC2 Container Registry (Amazon ECR) path where inference code is
  /// stored.
  ///
  /// If you are using your own custom algorithm instead of an algorithm provided
  /// by Amazon SageMaker, the inference code must meet Amazon SageMaker
  /// requirements. Amazon SageMaker supports both
  /// <code>registry/repository[:tag]</code> and
  /// <code>registry/repository[@digest]</code> image path formats. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/your-algorithms.html">Using
  /// Your Own Algorithms with Amazon SageMaker</a>.
  @_s.JsonKey(name: 'Image')
  final String image;

  /// The DNS host name for the Docker container.
  @_s.JsonKey(name: 'ContainerHostname')
  final String containerHostname;

  /// An MD5 hash of the training algorithm that identifies the Docker image used
  /// for training.
  @_s.JsonKey(name: 'ImageDigest')
  final String imageDigest;

  /// The Amazon S3 path where the model artifacts, which result from model
  /// training, are stored. This path must point to a single <code>gzip</code>
  /// compressed tar archive (<code>.tar.gz</code> suffix).
  @_s.JsonKey(name: 'ModelDataUrl')
  final String modelDataUrl;

  /// The AWS Marketplace product ID of the model package.
  @_s.JsonKey(name: 'ProductId')
  final String productId;

  ModelPackageContainerDefinition({
    @_s.required this.image,
    this.containerHostname,
    this.imageDigest,
    this.modelDataUrl,
    this.productId,
  });
  factory ModelPackageContainerDefinition.fromJson(Map<String, dynamic> json) =>
      _$ModelPackageContainerDefinitionFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ModelPackageContainerDefinitionToJson(this);
}

enum ModelPackageSortBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
}

enum ModelPackageStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Deleting')
  deleting,
}

/// Specifies the validation and image scan statuses of the model package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelPackageStatusDetails {
  /// The validation status of the model package.
  @_s.JsonKey(name: 'ValidationStatuses')
  final List<ModelPackageStatusItem> validationStatuses;

  /// The status of the scan of the Docker image container for the model package.
  @_s.JsonKey(name: 'ImageScanStatuses')
  final List<ModelPackageStatusItem> imageScanStatuses;

  ModelPackageStatusDetails({
    @_s.required this.validationStatuses,
    this.imageScanStatuses,
  });
  factory ModelPackageStatusDetails.fromJson(Map<String, dynamic> json) =>
      _$ModelPackageStatusDetailsFromJson(json);
}

/// Represents the overall status of a model package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelPackageStatusItem {
  /// The name of the model package for which the overall status is being
  /// reported.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status.
  @_s.JsonKey(name: 'Status')
  final DetailedModelPackageStatus status;

  /// if the overall status is <code>Failed</code>, the reason for the failure.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  ModelPackageStatusItem({
    @_s.required this.name,
    @_s.required this.status,
    this.failureReason,
  });
  factory ModelPackageStatusItem.fromJson(Map<String, dynamic> json) =>
      _$ModelPackageStatusItemFromJson(json);
}

/// Provides summary information about a model package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelPackageSummary {
  /// A timestamp that shows when the model package was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the model package.
  @_s.JsonKey(name: 'ModelPackageArn')
  final String modelPackageArn;

  /// The name of the model package.
  @_s.JsonKey(name: 'ModelPackageName')
  final String modelPackageName;

  /// The overall status of the model package.
  @_s.JsonKey(name: 'ModelPackageStatus')
  final ModelPackageStatus modelPackageStatus;

  /// A brief description of the model package.
  @_s.JsonKey(name: 'ModelPackageDescription')
  final String modelPackageDescription;

  ModelPackageSummary({
    @_s.required this.creationTime,
    @_s.required this.modelPackageArn,
    @_s.required this.modelPackageName,
    @_s.required this.modelPackageStatus,
    this.modelPackageDescription,
  });
  factory ModelPackageSummary.fromJson(Map<String, dynamic> json) =>
      _$ModelPackageSummaryFromJson(json);
}

/// Contains data, such as the inputs and targeted instance types that are used
/// in the process of validating the model package.
///
/// The data provided in the validation profile is made available to your buyers
/// on AWS Marketplace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelPackageValidationProfile {
  /// The name of the profile for the model package.
  @_s.JsonKey(name: 'ProfileName')
  final String profileName;

  /// The <code>TransformJobDefinition</code> object that describes the transform
  /// job used for the validation of the model package.
  @_s.JsonKey(name: 'TransformJobDefinition')
  final TransformJobDefinition transformJobDefinition;

  ModelPackageValidationProfile({
    @_s.required this.profileName,
    @_s.required this.transformJobDefinition,
  });
  factory ModelPackageValidationProfile.fromJson(Map<String, dynamic> json) =>
      _$ModelPackageValidationProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ModelPackageValidationProfileToJson(this);
}

/// Specifies batch transform jobs that Amazon SageMaker runs to validate your
/// model package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ModelPackageValidationSpecification {
  /// An array of <code>ModelPackageValidationProfile</code> objects, each of
  /// which specifies a batch transform job that Amazon SageMaker runs to validate
  /// your model package.
  @_s.JsonKey(name: 'ValidationProfiles')
  final List<ModelPackageValidationProfile> validationProfiles;

  /// The IAM roles to be used for the validation of the model package.
  @_s.JsonKey(name: 'ValidationRole')
  final String validationRole;

  ModelPackageValidationSpecification({
    @_s.required this.validationProfiles,
    @_s.required this.validationRole,
  });
  factory ModelPackageValidationSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$ModelPackageValidationSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ModelPackageValidationSpecificationToJson(this);
}

enum ModelSortKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
}

/// Provides summary information about a model.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ModelSummary {
  /// A timestamp that indicates when the model was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the model.
  @_s.JsonKey(name: 'ModelArn')
  final String modelArn;

  /// The name of the model that you want a summary for.
  @_s.JsonKey(name: 'ModelName')
  final String modelName;

  ModelSummary({
    @_s.required this.creationTime,
    @_s.required this.modelArn,
    @_s.required this.modelName,
  });
  factory ModelSummary.fromJson(Map<String, dynamic> json) =>
      _$ModelSummaryFromJson(json);
}

/// Container image configuration object for the monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringAppSpecification {
  /// The container image to be run by the monitoring job.
  @_s.JsonKey(name: 'ImageUri')
  final String imageUri;

  /// An array of arguments for the container used to run the monitoring job.
  @_s.JsonKey(name: 'ContainerArguments')
  final List<String> containerArguments;

  /// Specifies the entrypoint for a container used to run the monitoring job.
  @_s.JsonKey(name: 'ContainerEntrypoint')
  final List<String> containerEntrypoint;

  /// An Amazon S3 URI to a script that is called after analysis has been
  /// performed. Applicable only for the built-in (first party) containers.
  @_s.JsonKey(name: 'PostAnalyticsProcessorSourceUri')
  final String postAnalyticsProcessorSourceUri;

  /// An Amazon S3 URI to a script that is called per row prior to running
  /// analysis. It can base64 decode the payload and convert it into a flatted
  /// json so that the built-in container can use the converted data. Applicable
  /// only for the built-in (first party) containers.
  @_s.JsonKey(name: 'RecordPreprocessorSourceUri')
  final String recordPreprocessorSourceUri;

  MonitoringAppSpecification({
    @_s.required this.imageUri,
    this.containerArguments,
    this.containerEntrypoint,
    this.postAnalyticsProcessorSourceUri,
    this.recordPreprocessorSourceUri,
  });
  factory MonitoringAppSpecification.fromJson(Map<String, dynamic> json) =>
      _$MonitoringAppSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringAppSpecificationToJson(this);
}

/// Configuration for monitoring constraints and monitoring statistics. These
/// baseline resources are compared against the results of the current job from
/// the series of jobs scheduled to collect data periodically.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringBaselineConfig {
  /// The baseline constraint file in Amazon S3 that the current monitoring job
  /// should validated against.
  @_s.JsonKey(name: 'ConstraintsResource')
  final MonitoringConstraintsResource constraintsResource;

  /// The baseline statistics file in Amazon S3 that the current monitoring job
  /// should be validated against.
  @_s.JsonKey(name: 'StatisticsResource')
  final MonitoringStatisticsResource statisticsResource;

  MonitoringBaselineConfig({
    this.constraintsResource,
    this.statisticsResource,
  });
  factory MonitoringBaselineConfig.fromJson(Map<String, dynamic> json) =>
      _$MonitoringBaselineConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringBaselineConfigToJson(this);
}

/// Configuration for the cluster used to run model monitoring jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringClusterConfig {
  /// The number of ML compute instances to use in the model monitoring job. For
  /// distributed processing jobs, specify a value greater than 1. The default
  /// value is 1.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The ML compute instance type for the processing job.
  @_s.JsonKey(name: 'InstanceType')
  final ProcessingInstanceType instanceType;

  /// The size of the ML storage volume, in gigabytes, that you want to provision.
  /// You must specify sufficient ML storage for your scenario.
  @_s.JsonKey(name: 'VolumeSizeInGB')
  final int volumeSizeInGB;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt data on the storage volume attached to the ML compute instance(s)
  /// that run the model monitoring job.
  @_s.JsonKey(name: 'VolumeKmsKeyId')
  final String volumeKmsKeyId;

  MonitoringClusterConfig({
    @_s.required this.instanceCount,
    @_s.required this.instanceType,
    @_s.required this.volumeSizeInGB,
    this.volumeKmsKeyId,
  });
  factory MonitoringClusterConfig.fromJson(Map<String, dynamic> json) =>
      _$MonitoringClusterConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringClusterConfigToJson(this);
}

/// The constraints resource for a monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringConstraintsResource {
  /// The Amazon S3 URI for the constraints resource.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  MonitoringConstraintsResource({
    this.s3Uri,
  });
  factory MonitoringConstraintsResource.fromJson(Map<String, dynamic> json) =>
      _$MonitoringConstraintsResourceFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringConstraintsResourceToJson(this);
}

enum MonitoringExecutionSortKey {
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('ScheduledTime')
  scheduledTime,
  @_s.JsonValue('Status')
  status,
}

/// Summary of information about the last monitoring job to run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MonitoringExecutionSummary {
  /// The time at which the monitoring job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// A timestamp that indicates the last time the monitoring job was modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The status of the monitoring job.
  @_s.JsonKey(name: 'MonitoringExecutionStatus')
  final ExecutionStatus monitoringExecutionStatus;

  /// The name of the monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleName')
  final String monitoringScheduleName;

  /// The time the monitoring job was scheduled.
  @_s.JsonKey(name: 'ScheduledTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime scheduledTime;

  /// The name of teh endpoint used to run the monitoring job.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  /// Contains the reason a monitoring job failed, if it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The Amazon Resource Name (ARN) of the monitoring job.
  @_s.JsonKey(name: 'ProcessingJobArn')
  final String processingJobArn;

  MonitoringExecutionSummary({
    @_s.required this.creationTime,
    @_s.required this.lastModifiedTime,
    @_s.required this.monitoringExecutionStatus,
    @_s.required this.monitoringScheduleName,
    @_s.required this.scheduledTime,
    this.endpointName,
    this.failureReason,
    this.processingJobArn,
  });
  factory MonitoringExecutionSummary.fromJson(Map<String, dynamic> json) =>
      _$MonitoringExecutionSummaryFromJson(json);
}

/// The inputs for a monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringInput {
  /// The endpoint for a monitoring job.
  @_s.JsonKey(name: 'EndpointInput')
  final EndpointInput endpointInput;

  MonitoringInput({
    @_s.required this.endpointInput,
  });
  factory MonitoringInput.fromJson(Map<String, dynamic> json) =>
      _$MonitoringInputFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringInputToJson(this);
}

/// Defines the monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringJobDefinition {
  /// Configures the monitoring job to run a specified Docker container image.
  @_s.JsonKey(name: 'MonitoringAppSpecification')
  final MonitoringAppSpecification monitoringAppSpecification;

  /// The array of inputs for the monitoring job. Currently we support monitoring
  /// an Amazon SageMaker Endpoint.
  @_s.JsonKey(name: 'MonitoringInputs')
  final List<MonitoringInput> monitoringInputs;

  /// The array of outputs from the monitoring job to be uploaded to Amazon Simple
  /// Storage Service (Amazon S3).
  @_s.JsonKey(name: 'MonitoringOutputConfig')
  final MonitoringOutputConfig monitoringOutputConfig;

  /// Identifies the resources, ML compute instances, and ML storage volumes to
  /// deploy for a monitoring job. In distributed processing, you specify more
  /// than one instance.
  @_s.JsonKey(name: 'MonitoringResources')
  final MonitoringResources monitoringResources;

  /// The Amazon Resource Name (ARN) of an IAM role that Amazon SageMaker can
  /// assume to perform tasks on your behalf.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Baseline configuration used to validate that the data conforms to the
  /// specified constraints and statistics
  @_s.JsonKey(name: 'BaselineConfig')
  final MonitoringBaselineConfig baselineConfig;

  /// Sets the environment variables in the Docker container.
  @_s.JsonKey(name: 'Environment')
  final Map<String, String> environment;

  /// Specifies networking options for an monitoring job.
  @_s.JsonKey(name: 'NetworkConfig')
  final NetworkConfig networkConfig;

  /// Specifies a time limit for how long the monitoring job is allowed to run.
  @_s.JsonKey(name: 'StoppingCondition')
  final MonitoringStoppingCondition stoppingCondition;

  MonitoringJobDefinition({
    @_s.required this.monitoringAppSpecification,
    @_s.required this.monitoringInputs,
    @_s.required this.monitoringOutputConfig,
    @_s.required this.monitoringResources,
    @_s.required this.roleArn,
    this.baselineConfig,
    this.environment,
    this.networkConfig,
    this.stoppingCondition,
  });
  factory MonitoringJobDefinition.fromJson(Map<String, dynamic> json) =>
      _$MonitoringJobDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringJobDefinitionToJson(this);
}

/// The output object for a monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringOutput {
  /// The Amazon S3 storage location where the results of a monitoring job are
  /// saved.
  @_s.JsonKey(name: 'S3Output')
  final MonitoringS3Output s3Output;

  MonitoringOutput({
    @_s.required this.s3Output,
  });
  factory MonitoringOutput.fromJson(Map<String, dynamic> json) =>
      _$MonitoringOutputFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringOutputToJson(this);
}

/// The output configuration for monitoring jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringOutputConfig {
  /// Monitoring outputs for monitoring jobs. This is where the output of the
  /// periodic monitoring jobs is uploaded.
  @_s.JsonKey(name: 'MonitoringOutputs')
  final List<MonitoringOutput> monitoringOutputs;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt the model artifacts at rest using Amazon S3 server-side encryption.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  MonitoringOutputConfig({
    @_s.required this.monitoringOutputs,
    this.kmsKeyId,
  });
  factory MonitoringOutputConfig.fromJson(Map<String, dynamic> json) =>
      _$MonitoringOutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringOutputConfigToJson(this);
}

/// Identifies the resources to deploy for a monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringResources {
  /// The configuration for the cluster resources used to run the processing job.
  @_s.JsonKey(name: 'ClusterConfig')
  final MonitoringClusterConfig clusterConfig;

  MonitoringResources({
    @_s.required this.clusterConfig,
  });
  factory MonitoringResources.fromJson(Map<String, dynamic> json) =>
      _$MonitoringResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringResourcesToJson(this);
}

/// Information about where and how you want to store the results of a
/// monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringS3Output {
  /// The local path to the Amazon S3 storage location where Amazon SageMaker
  /// saves the results of a monitoring job. LocalPath is an absolute path for the
  /// output data.
  @_s.JsonKey(name: 'LocalPath')
  final String localPath;

  /// A URI that identifies the Amazon S3 storage location where Amazon SageMaker
  /// saves the results of a monitoring job.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  /// Whether to upload the results of the monitoring job continuously or after
  /// the job completes.
  @_s.JsonKey(name: 'S3UploadMode')
  final ProcessingS3UploadMode s3UploadMode;

  MonitoringS3Output({
    @_s.required this.localPath,
    @_s.required this.s3Uri,
    this.s3UploadMode,
  });
  factory MonitoringS3Output.fromJson(Map<String, dynamic> json) =>
      _$MonitoringS3OutputFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringS3OutputToJson(this);
}

/// Configures the monitoring schedule and defines the monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringScheduleConfig {
  /// Defines the monitoring job.
  @_s.JsonKey(name: 'MonitoringJobDefinition')
  final MonitoringJobDefinition monitoringJobDefinition;

  /// Configures the monitoring schedule.
  @_s.JsonKey(name: 'ScheduleConfig')
  final ScheduleConfig scheduleConfig;

  MonitoringScheduleConfig({
    @_s.required this.monitoringJobDefinition,
    this.scheduleConfig,
  });
  factory MonitoringScheduleConfig.fromJson(Map<String, dynamic> json) =>
      _$MonitoringScheduleConfigFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringScheduleConfigToJson(this);
}

enum MonitoringScheduleSortKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('Status')
  status,
}

/// Summarizes the monitoring schedule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MonitoringScheduleSummary {
  /// The creation time of the monitoring schedule.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The last time the monitoring schedule was modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleArn')
  final String monitoringScheduleArn;

  /// The name of the monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleName')
  final String monitoringScheduleName;

  /// The status of the monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleStatus')
  final ScheduleStatus monitoringScheduleStatus;

  /// The name of the endpoint using the monitoring schedule.
  @_s.JsonKey(name: 'EndpointName')
  final String endpointName;

  MonitoringScheduleSummary({
    @_s.required this.creationTime,
    @_s.required this.lastModifiedTime,
    @_s.required this.monitoringScheduleArn,
    @_s.required this.monitoringScheduleName,
    @_s.required this.monitoringScheduleStatus,
    this.endpointName,
  });
  factory MonitoringScheduleSummary.fromJson(Map<String, dynamic> json) =>
      _$MonitoringScheduleSummaryFromJson(json);
}

/// The statistics resource for a monitoring job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringStatisticsResource {
  /// The Amazon S3 URI for the statistics resource.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  MonitoringStatisticsResource({
    this.s3Uri,
  });
  factory MonitoringStatisticsResource.fromJson(Map<String, dynamic> json) =>
      _$MonitoringStatisticsResourceFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringStatisticsResourceToJson(this);
}

/// A time limit for how long the monitoring job is allowed to run before
/// stopping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class MonitoringStoppingCondition {
  /// The maximum runtime allowed in seconds.
  @_s.JsonKey(name: 'MaxRuntimeInSeconds')
  final int maxRuntimeInSeconds;

  MonitoringStoppingCondition({
    @_s.required this.maxRuntimeInSeconds,
  });
  factory MonitoringStoppingCondition.fromJson(Map<String, dynamic> json) =>
      _$MonitoringStoppingConditionFromJson(json);

  Map<String, dynamic> toJson() => _$MonitoringStoppingConditionToJson(this);
}

/// A list of nested <a>Filter</a> objects. A resource must satisfy the
/// conditions of all filters to be included in the results returned from the
/// <a>Search</a> API.
///
/// For example, to filter on a training job's <code>InputDataConfig</code>
/// property with a specific channel name and <code>S3Uri</code> prefix, define
/// the following filters:
///
/// <ul>
/// <li>
/// <code>'{Name:"InputDataConfig.ChannelName", "Operator":"Equals",
/// "Value":"train"}',</code>
/// </li>
/// <li>
/// <code>'{Name:"InputDataConfig.DataSource.S3DataSource.S3Uri",
/// "Operator":"Contains", "Value":"mybucket/catdata"}'</code>
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NestedFilters {
  /// A list of filters. Each filter acts on a property. Filters must contain at
  /// least one <code>Filters</code> value. For example, a
  /// <code>NestedFilters</code> call might include a filter on the
  /// <code>PropertyName</code> parameter of the <code>InputDataConfig</code>
  /// property: <code>InputDataConfig.DataSource.S3DataSource.S3Uri</code>.
  @_s.JsonKey(name: 'Filters')
  final List<Filter> filters;

  /// The name of the property to use in the nested filters. The value must match
  /// a listed property name, such as <code>InputDataConfig</code>.
  @_s.JsonKey(name: 'NestedPropertyName')
  final String nestedPropertyName;

  NestedFilters({
    @_s.required this.filters,
    @_s.required this.nestedPropertyName,
  });
  Map<String, dynamic> toJson() => _$NestedFiltersToJson(this);
}

/// Networking options for a job, such as network traffic encryption between
/// containers, whether to allow inbound and outbound network calls to and from
/// containers, and the VPC subnets and security groups to use for VPC-enabled
/// jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NetworkConfig {
  /// Whether to allow inbound and outbound network calls to and from the
  /// containers used for the processing job.
  @_s.JsonKey(name: 'EnableNetworkIsolation')
  final bool enableNetworkIsolation;
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  NetworkConfig({
    this.enableNetworkIsolation,
    this.vpcConfig,
  });
  factory NetworkConfig.fromJson(Map<String, dynamic> json) =>
      _$NetworkConfigFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkConfigToJson(this);
}

enum NotebookInstanceAcceleratorType {
  @_s.JsonValue('ml.eia1.medium')
  mlEia1Medium,
  @_s.JsonValue('ml.eia1.large')
  mlEia1Large,
  @_s.JsonValue('ml.eia1.xlarge')
  mlEia1Xlarge,
  @_s.JsonValue('ml.eia2.medium')
  mlEia2Medium,
  @_s.JsonValue('ml.eia2.large')
  mlEia2Large,
  @_s.JsonValue('ml.eia2.xlarge')
  mlEia2Xlarge,
}

enum NotebookInstanceLifecycleConfigSortKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('LastModifiedTime')
  lastModifiedTime,
}

enum NotebookInstanceLifecycleConfigSortOrder {
  @_s.JsonValue('Ascending')
  ascending,
  @_s.JsonValue('Descending')
  descending,
}

/// Provides a summary of a notebook instance lifecycle configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotebookInstanceLifecycleConfigSummary {
  /// The Amazon Resource Name (ARN) of the lifecycle configuration.
  @_s.JsonKey(name: 'NotebookInstanceLifecycleConfigArn')
  final String notebookInstanceLifecycleConfigArn;

  /// The name of the lifecycle configuration.
  @_s.JsonKey(name: 'NotebookInstanceLifecycleConfigName')
  final String notebookInstanceLifecycleConfigName;

  /// A timestamp that tells when the lifecycle configuration was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// A timestamp that tells when the lifecycle configuration was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  NotebookInstanceLifecycleConfigSummary({
    @_s.required this.notebookInstanceLifecycleConfigArn,
    @_s.required this.notebookInstanceLifecycleConfigName,
    this.creationTime,
    this.lastModifiedTime,
  });
  factory NotebookInstanceLifecycleConfigSummary.fromJson(
          Map<String, dynamic> json) =>
      _$NotebookInstanceLifecycleConfigSummaryFromJson(json);
}

/// Contains the notebook instance lifecycle configuration script.
///
/// Each lifecycle configuration script has a limit of 16384 characters.
///
/// The value of the <code>$PATH</code> environment variable that is available
/// to both scripts is <code>/sbin:bin:/usr/sbin:/usr/bin</code>.
///
/// View CloudWatch Logs for notebook instance lifecycle configurations in log
/// group <code>/aws/sagemaker/NotebookInstances</code> in log stream
/// <code>[notebook-instance-name]/[LifecycleConfigHook]</code>.
///
/// Lifecycle configuration scripts cannot run for longer than 5 minutes. If a
/// script runs for longer than 5 minutes, it fails and the notebook instance is
/// not created or started.
///
/// For information about notebook instance lifestyle configurations, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step
/// 2.1: (Optional) Customize a Notebook Instance</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NotebookInstanceLifecycleHook {
  /// A base64-encoded string that contains a shell script for a notebook instance
  /// lifecycle configuration.
  @_s.JsonKey(name: 'Content')
  final String content;

  NotebookInstanceLifecycleHook({
    this.content,
  });
  factory NotebookInstanceLifecycleHook.fromJson(Map<String, dynamic> json) =>
      _$NotebookInstanceLifecycleHookFromJson(json);

  Map<String, dynamic> toJson() => _$NotebookInstanceLifecycleHookToJson(this);
}

enum NotebookInstanceSortKey {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('Status')
  status,
}

enum NotebookInstanceSortOrder {
  @_s.JsonValue('Ascending')
  ascending,
  @_s.JsonValue('Descending')
  descending,
}

enum NotebookInstanceStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InService')
  inService,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Updating')
  updating,
}

/// Provides summary information for an Amazon SageMaker notebook instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotebookInstanceSummary {
  /// The Amazon Resource Name (ARN) of the notebook instance.
  @_s.JsonKey(name: 'NotebookInstanceArn')
  final String notebookInstanceArn;

  /// The name of the notebook instance that you want a summary for.
  @_s.JsonKey(name: 'NotebookInstanceName')
  final String notebookInstanceName;

  /// An array of up to three Git repositories associated with the notebook
  /// instance. These can be either the names of Git repositories stored as
  /// resources in your account, or the URL of Git repositories in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository. These repositories are cloned
  /// at the same level as the default repository of your notebook instance. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating
  /// Git Repositories with Amazon SageMaker Notebook Instances</a>.
  @_s.JsonKey(name: 'AdditionalCodeRepositories')
  final List<String> additionalCodeRepositories;

  /// A timestamp that shows when the notebook instance was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Git repository associated with the notebook instance as its default code
  /// repository. This can be either the name of a Git repository stored as a
  /// resource in your account, or the URL of a Git repository in <a
  /// href="https://docs.aws.amazon.com/codecommit/latest/userguide/welcome.html">AWS
  /// CodeCommit</a> or in any other Git repository. When you open a notebook
  /// instance, it opens in the directory that contains this repository. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/nbi-git-repo.html">Associating
  /// Git Repositories with Amazon SageMaker Notebook Instances</a>.
  @_s.JsonKey(name: 'DefaultCodeRepository')
  final String defaultCodeRepository;

  /// The type of ML compute instance that the notebook instance is running on.
  @_s.JsonKey(name: 'InstanceType')
  final InstanceType instanceType;

  /// A timestamp that shows when the notebook instance was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The name of a notebook instance lifecycle configuration associated with this
  /// notebook instance.
  ///
  /// For information about notebook instance lifestyle configurations, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/notebook-lifecycle-config.html">Step
  /// 2.1: (Optional) Customize a Notebook Instance</a>.
  @_s.JsonKey(name: 'NotebookInstanceLifecycleConfigName')
  final String notebookInstanceLifecycleConfigName;

  /// The status of the notebook instance.
  @_s.JsonKey(name: 'NotebookInstanceStatus')
  final NotebookInstanceStatus notebookInstanceStatus;

  /// The URL that you use to connect to the Jupyter instance running in your
  /// notebook instance.
  @_s.JsonKey(name: 'Url')
  final String url;

  NotebookInstanceSummary({
    @_s.required this.notebookInstanceArn,
    @_s.required this.notebookInstanceName,
    this.additionalCodeRepositories,
    this.creationTime,
    this.defaultCodeRepository,
    this.instanceType,
    this.lastModifiedTime,
    this.notebookInstanceLifecycleConfigName,
    this.notebookInstanceStatus,
    this.url,
  });
  factory NotebookInstanceSummary.fromJson(Map<String, dynamic> json) =>
      _$NotebookInstanceSummaryFromJson(json);
}

enum NotebookOutputOption {
  @_s.JsonValue('Allowed')
  allowed,
  @_s.JsonValue('Disabled')
  disabled,
}

/// Configures SNS notifications of available or expiring work items for work
/// teams.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class NotificationConfiguration {
  /// The ARN for the SNS topic to which notifications should be published.
  @_s.JsonKey(name: 'NotificationTopicArn')
  final String notificationTopicArn;

  NotificationConfiguration({
    this.notificationTopicArn,
  });
  factory NotificationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NotificationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationConfigurationToJson(this);
}

enum ObjectiveStatus {
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Failed')
  failed,
}

/// Specifies the number of training jobs that this hyperparameter tuning job
/// launched, categorized by the status of their objective metric. The objective
/// metric status shows whether the final objective metric for the training job
/// has been evaluated by the tuning job and used in the hyperparameter tuning
/// process.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ObjectiveStatusCounters {
  /// The number of training jobs whose final objective metric was not evaluated
  /// and used in the hyperparameter tuning process. This typically occurs when
  /// the training job failed or did not emit an objective metric.
  @_s.JsonKey(name: 'Failed')
  final int failed;

  /// The number of training jobs that are in progress and pending evaluation of
  /// their final objective metric.
  @_s.JsonKey(name: 'Pending')
  final int pending;

  /// The number of training jobs whose final objective metric was evaluated by
  /// the hyperparameter tuning job and used in the hyperparameter tuning process.
  @_s.JsonKey(name: 'Succeeded')
  final int succeeded;

  ObjectiveStatusCounters({
    this.failed,
    this.pending,
    this.succeeded,
  });
  factory ObjectiveStatusCounters.fromJson(Map<String, dynamic> json) =>
      _$ObjectiveStatusCountersFromJson(json);
}

enum Operator {
  @_s.JsonValue('Equals')
  equals,
  @_s.JsonValue('NotEquals')
  notEquals,
  @_s.JsonValue('GreaterThan')
  greaterThan,
  @_s.JsonValue('GreaterThanOrEqualTo')
  greaterThanOrEqualTo,
  @_s.JsonValue('LessThan')
  lessThan,
  @_s.JsonValue('LessThanOrEqualTo')
  lessThanOrEqualTo,
  @_s.JsonValue('Contains')
  contains,
  @_s.JsonValue('Exists')
  exists,
  @_s.JsonValue('NotExists')
  notExists,
  @_s.JsonValue('In')
  $in,
}

enum OrderKey {
  @_s.JsonValue('Ascending')
  ascending,
  @_s.JsonValue('Descending')
  descending,
}

/// Contains information about the output location for the compiled model and
/// the device (target) that the model runs on.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputConfig {
  /// Identifies the S3 path where you want Amazon SageMaker to store the model
  /// artifacts. For example, s3://bucket-name/key-name-prefix.
  @_s.JsonKey(name: 'S3OutputLocation')
  final String s3OutputLocation;

  /// Identifies the device that you want to run your model on after it has been
  /// compiled. For example: ml_c5.
  @_s.JsonKey(name: 'TargetDevice')
  final TargetDevice targetDevice;

  OutputConfig({
    @_s.required this.s3OutputLocation,
    @_s.required this.targetDevice,
  });
  factory OutputConfig.fromJson(Map<String, dynamic> json) =>
      _$OutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OutputConfigToJson(this);
}

/// Provides information about how to store model training results (model
/// artifacts).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputDataConfig {
  /// Identifies the S3 path where you want Amazon SageMaker to store the model
  /// artifacts. For example, <code>s3://bucket-name/key-name-prefix</code>.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt the model artifacts at rest using Amazon S3 server-side encryption.
  /// The <code>KmsKeyId</code> can be any of the following formats:
  ///
  /// <ul>
  /// <li>
  /// // KMS Key ID
  ///
  /// <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// // Amazon Resource Name (ARN) of a KMS Key
  ///
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// // KMS Key Alias
  ///
  /// <code>"alias/ExampleAlias"</code>
  /// </li>
  /// <li>
  /// // Amazon Resource Name (ARN) of a KMS Key Alias
  ///
  /// <code>"arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias"</code>
  /// </li>
  /// </ul>
  /// If you use a KMS key ID or an alias of your master key, the Amazon SageMaker
  /// execution role must include permissions to call <code>kms:Encrypt</code>. If
  /// you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key
  /// for Amazon S3 for your role's account. Amazon SageMaker uses server-side
  /// encryption with KMS-managed keys for <code>OutputDataConfig</code>. If you
  /// use a bucket policy with an <code>s3:PutObject</code> permission that only
  /// allows objects with server-side encryption, set the condition key of
  /// <code>s3:x-amz-server-side-encryption</code> to <code>"aws:kms"</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">KMS-Managed
  /// Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide.</i>
  ///
  /// The KMS key policy must grant permission to the IAM role that you specify in
  /// your <code>CreateTrainingJob</code>, <code>CreateTransformJob</code>, or
  /// <code>CreateHyperParameterTuningJob</code> requests. For more information,
  /// see <a
  /// href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Using
  /// Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  OutputDataConfig({
    @_s.required this.s3OutputPath,
    this.kmsKeyId,
  });
  factory OutputDataConfig.fromJson(Map<String, dynamic> json) =>
      _$OutputDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OutputDataConfigToJson(this);
}

/// Defines the possible values for categorical, continuous, and integer
/// hyperparameters to be used by an algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParameterRange {
  /// A <code>CategoricalParameterRangeSpecification</code> object that defines
  /// the possible values for a categorical hyperparameter.
  @_s.JsonKey(name: 'CategoricalParameterRangeSpecification')
  final CategoricalParameterRangeSpecification
      categoricalParameterRangeSpecification;

  /// A <code>ContinuousParameterRangeSpecification</code> object that defines the
  /// possible values for a continuous hyperparameter.
  @_s.JsonKey(name: 'ContinuousParameterRangeSpecification')
  final ContinuousParameterRangeSpecification
      continuousParameterRangeSpecification;

  /// A <code>IntegerParameterRangeSpecification</code> object that defines the
  /// possible values for an integer hyperparameter.
  @_s.JsonKey(name: 'IntegerParameterRangeSpecification')
  final IntegerParameterRangeSpecification integerParameterRangeSpecification;

  ParameterRange({
    this.categoricalParameterRangeSpecification,
    this.continuousParameterRangeSpecification,
    this.integerParameterRangeSpecification,
  });
  factory ParameterRange.fromJson(Map<String, dynamic> json) =>
      _$ParameterRangeFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterRangeToJson(this);
}

/// Specifies ranges of integer, continuous, and categorical hyperparameters
/// that a hyperparameter tuning job searches. The hyperparameter tuning job
/// launches training jobs with hyperparameter values within these ranges to
/// find the combination of values that result in the training job with the best
/// performance as measured by the objective metric of the hyperparameter tuning
/// job.
/// <note>
/// You can specify a maximum of 20 hyperparameters that a hyperparameter tuning
/// job can search over. Every possible value of a categorical parameter range
/// counts against this limit.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParameterRanges {
  /// The array of <a>CategoricalParameterRange</a> objects that specify ranges of
  /// categorical hyperparameters that a hyperparameter tuning job searches.
  @_s.JsonKey(name: 'CategoricalParameterRanges')
  final List<CategoricalParameterRange> categoricalParameterRanges;

  /// The array of <a>ContinuousParameterRange</a> objects that specify ranges of
  /// continuous hyperparameters that a hyperparameter tuning job searches.
  @_s.JsonKey(name: 'ContinuousParameterRanges')
  final List<ContinuousParameterRange> continuousParameterRanges;

  /// The array of <a>IntegerParameterRange</a> objects that specify ranges of
  /// integer hyperparameters that a hyperparameter tuning job searches.
  @_s.JsonKey(name: 'IntegerParameterRanges')
  final List<IntegerParameterRange> integerParameterRanges;

  ParameterRanges({
    this.categoricalParameterRanges,
    this.continuousParameterRanges,
    this.integerParameterRanges,
  });
  factory ParameterRanges.fromJson(Map<String, dynamic> json) =>
      _$ParameterRangesFromJson(json);

  Map<String, dynamic> toJson() => _$ParameterRangesToJson(this);
}

enum ParameterType {
  @_s.JsonValue('Integer')
  integer,
  @_s.JsonValue('Continuous')
  continuous,
  @_s.JsonValue('Categorical')
  categorical,
  @_s.JsonValue('FreeText')
  freeText,
}

/// The trial that a trial component is associated with and the experiment the
/// trial is part of. A component might not be associated with a trial. A
/// component can be associated with multiple trials.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Parent {
  /// The name of the experiment.
  @_s.JsonKey(name: 'ExperimentName')
  final String experimentName;

  /// The name of the trial.
  @_s.JsonKey(name: 'TrialName')
  final String trialName;

  Parent({
    this.experimentName,
    this.trialName,
  });
  factory Parent.fromJson(Map<String, dynamic> json) => _$ParentFromJson(json);
}

/// A previously completed or stopped hyperparameter tuning job to be used as a
/// starting point for a new hyperparameter tuning job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ParentHyperParameterTuningJob {
  /// The name of the hyperparameter tuning job to be used as a starting point for
  /// a new hyperparameter tuning job.
  @_s.JsonKey(name: 'HyperParameterTuningJobName')
  final String hyperParameterTuningJobName;

  ParentHyperParameterTuningJob({
    this.hyperParameterTuningJobName,
  });
  factory ParentHyperParameterTuningJob.fromJson(Map<String, dynamic> json) =>
      _$ParentHyperParameterTuningJobFromJson(json);

  Map<String, dynamic> toJson() => _$ParentHyperParameterTuningJobToJson(this);
}

enum ProblemType {
  @_s.JsonValue('BinaryClassification')
  binaryClassification,
  @_s.JsonValue('MulticlassClassification')
  multiclassClassification,
  @_s.JsonValue('Regression')
  regression,
}

/// Configuration for the cluster used to run a processing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingClusterConfig {
  /// The number of ML compute instances to use in the processing job. For
  /// distributed processing jobs, specify a value greater than 1. The default
  /// value is 1.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The ML compute instance type for the processing job.
  @_s.JsonKey(name: 'InstanceType')
  final ProcessingInstanceType instanceType;

  /// The size of the ML storage volume in gigabytes that you want to provision.
  /// You must specify sufficient ML storage for your scenario.
  @_s.JsonKey(name: 'VolumeSizeInGB')
  final int volumeSizeInGB;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt data on the storage volume attached to the ML compute instance(s)
  /// that run the processing job.
  @_s.JsonKey(name: 'VolumeKmsKeyId')
  final String volumeKmsKeyId;

  ProcessingClusterConfig({
    @_s.required this.instanceCount,
    @_s.required this.instanceType,
    @_s.required this.volumeSizeInGB,
    this.volumeKmsKeyId,
  });
  factory ProcessingClusterConfig.fromJson(Map<String, dynamic> json) =>
      _$ProcessingClusterConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingClusterConfigToJson(this);
}

/// The inputs for a processing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingInput {
  /// The name of the inputs for the processing job.
  @_s.JsonKey(name: 'InputName')
  final String inputName;

  /// The S3 inputs for the processing job.
  @_s.JsonKey(name: 'S3Input')
  final ProcessingS3Input s3Input;

  ProcessingInput({
    @_s.required this.inputName,
    @_s.required this.s3Input,
  });
  factory ProcessingInput.fromJson(Map<String, dynamic> json) =>
      _$ProcessingInputFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingInputToJson(this);
}

enum ProcessingInstanceType {
  @_s.JsonValue('ml.t3.medium')
  mlT3Medium,
  @_s.JsonValue('ml.t3.large')
  mlT3Large,
  @_s.JsonValue('ml.t3.xlarge')
  mlT3Xlarge,
  @_s.JsonValue('ml.t3.2xlarge')
  mlT3_2xlarge,
  @_s.JsonValue('ml.m4.xlarge')
  mlM4Xlarge,
  @_s.JsonValue('ml.m4.2xlarge')
  mlM4_2xlarge,
  @_s.JsonValue('ml.m4.4xlarge')
  mlM4_4xlarge,
  @_s.JsonValue('ml.m4.10xlarge')
  mlM4_10xlarge,
  @_s.JsonValue('ml.m4.16xlarge')
  mlM4_16xlarge,
  @_s.JsonValue('ml.c4.xlarge')
  mlC4Xlarge,
  @_s.JsonValue('ml.c4.2xlarge')
  mlC4_2xlarge,
  @_s.JsonValue('ml.c4.4xlarge')
  mlC4_4xlarge,
  @_s.JsonValue('ml.c4.8xlarge')
  mlC4_8xlarge,
  @_s.JsonValue('ml.p2.xlarge')
  mlP2Xlarge,
  @_s.JsonValue('ml.p2.8xlarge')
  mlP2_8xlarge,
  @_s.JsonValue('ml.p2.16xlarge')
  mlP2_16xlarge,
  @_s.JsonValue('ml.p3.2xlarge')
  mlP3_2xlarge,
  @_s.JsonValue('ml.p3.8xlarge')
  mlP3_8xlarge,
  @_s.JsonValue('ml.p3.16xlarge')
  mlP3_16xlarge,
  @_s.JsonValue('ml.c5.xlarge')
  mlC5Xlarge,
  @_s.JsonValue('ml.c5.2xlarge')
  mlC5_2xlarge,
  @_s.JsonValue('ml.c5.4xlarge')
  mlC5_4xlarge,
  @_s.JsonValue('ml.c5.9xlarge')
  mlC5_9xlarge,
  @_s.JsonValue('ml.c5.18xlarge')
  mlC5_18xlarge,
  @_s.JsonValue('ml.m5.large')
  mlM5Large,
  @_s.JsonValue('ml.m5.xlarge')
  mlM5Xlarge,
  @_s.JsonValue('ml.m5.2xlarge')
  mlM5_2xlarge,
  @_s.JsonValue('ml.m5.4xlarge')
  mlM5_4xlarge,
  @_s.JsonValue('ml.m5.12xlarge')
  mlM5_12xlarge,
  @_s.JsonValue('ml.m5.24xlarge')
  mlM5_24xlarge,
  @_s.JsonValue('ml.r5.large')
  mlR5Large,
  @_s.JsonValue('ml.r5.xlarge')
  mlR5Xlarge,
  @_s.JsonValue('ml.r5.2xlarge')
  mlR5_2xlarge,
  @_s.JsonValue('ml.r5.4xlarge')
  mlR5_4xlarge,
  @_s.JsonValue('ml.r5.8xlarge')
  mlR5_8xlarge,
  @_s.JsonValue('ml.r5.12xlarge')
  mlR5_12xlarge,
  @_s.JsonValue('ml.r5.16xlarge')
  mlR5_16xlarge,
  @_s.JsonValue('ml.r5.24xlarge')
  mlR5_24xlarge,
}

/// An Amazon SageMaker processing job that is used to analyze data and evaluate
/// models. For more information, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/processing-job.html">Process
/// Data and Evaluate Models</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProcessingJob {
  @_s.JsonKey(name: 'AppSpecification')
  final AppSpecification appSpecification;

  /// The Amazon Resource Name (ARN) of the AutoML job associated with this
  /// processing job.
  @_s.JsonKey(name: 'AutoMLJobArn')
  final String autoMLJobArn;

  /// The time the processing job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// Sets the environment variables in the Docker container.
  @_s.JsonKey(name: 'Environment')
  final Map<String, String> environment;

  /// A string, up to one KB in size, that contains metadata from the processing
  /// container when the processing job exits.
  @_s.JsonKey(name: 'ExitMessage')
  final String exitMessage;
  @_s.JsonKey(name: 'ExperimentConfig')
  final ExperimentConfig experimentConfig;

  /// A string, up to one KB in size, that contains the reason a processing job
  /// failed, if it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// The time the processing job was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The ARN of a monitoring schedule for an endpoint associated with this
  /// processing job.
  @_s.JsonKey(name: 'MonitoringScheduleArn')
  final String monitoringScheduleArn;
  @_s.JsonKey(name: 'NetworkConfig')
  final NetworkConfig networkConfig;

  /// The time that the processing job ended.
  @_s.JsonKey(
      name: 'ProcessingEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime processingEndTime;

  /// For each input, data is downloaded from S3 into the processing container
  /// before the processing job begins running if "S3InputMode" is set to
  /// <code>File</code>.
  @_s.JsonKey(name: 'ProcessingInputs')
  final List<ProcessingInput> processingInputs;

  /// The ARN of the processing job.
  @_s.JsonKey(name: 'ProcessingJobArn')
  final String processingJobArn;

  /// The name of the processing job.
  @_s.JsonKey(name: 'ProcessingJobName')
  final String processingJobName;

  /// The status of the processing job.
  @_s.JsonKey(name: 'ProcessingJobStatus')
  final ProcessingJobStatus processingJobStatus;
  @_s.JsonKey(name: 'ProcessingOutputConfig')
  final ProcessingOutputConfig processingOutputConfig;
  @_s.JsonKey(name: 'ProcessingResources')
  final ProcessingResources processingResources;

  /// The time that the processing job started.
  @_s.JsonKey(
      name: 'ProcessingStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime processingStartTime;

  /// The ARN of the role used to create the processing job.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;
  @_s.JsonKey(name: 'StoppingCondition')
  final ProcessingStoppingCondition stoppingCondition;

  /// An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-whatURL">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The ARN of the training job associated with this processing job.
  @_s.JsonKey(name: 'TrainingJobArn')
  final String trainingJobArn;

  ProcessingJob({
    this.appSpecification,
    this.autoMLJobArn,
    this.creationTime,
    this.environment,
    this.exitMessage,
    this.experimentConfig,
    this.failureReason,
    this.lastModifiedTime,
    this.monitoringScheduleArn,
    this.networkConfig,
    this.processingEndTime,
    this.processingInputs,
    this.processingJobArn,
    this.processingJobName,
    this.processingJobStatus,
    this.processingOutputConfig,
    this.processingResources,
    this.processingStartTime,
    this.roleArn,
    this.stoppingCondition,
    this.tags,
    this.trainingJobArn,
  });
  factory ProcessingJob.fromJson(Map<String, dynamic> json) =>
      _$ProcessingJobFromJson(json);
}

enum ProcessingJobStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
}

/// Summary of information about a processing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProcessingJobSummary {
  /// The time at which the processing job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the processing job..
  @_s.JsonKey(name: 'ProcessingJobArn')
  final String processingJobArn;

  /// The name of the processing job.
  @_s.JsonKey(name: 'ProcessingJobName')
  final String processingJobName;

  /// The status of the processing job.
  @_s.JsonKey(name: 'ProcessingJobStatus')
  final ProcessingJobStatus processingJobStatus;

  /// An optional string, up to one KB in size, that contains metadata from the
  /// processing container when the processing job exits.
  @_s.JsonKey(name: 'ExitMessage')
  final String exitMessage;

  /// A string, up to one KB in size, that contains the reason a processing job
  /// failed, if it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// A timestamp that indicates the last time the processing job was modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The time at which the processing job completed.
  @_s.JsonKey(
      name: 'ProcessingEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime processingEndTime;

  ProcessingJobSummary({
    @_s.required this.creationTime,
    @_s.required this.processingJobArn,
    @_s.required this.processingJobName,
    @_s.required this.processingJobStatus,
    this.exitMessage,
    this.failureReason,
    this.lastModifiedTime,
    this.processingEndTime,
  });
  factory ProcessingJobSummary.fromJson(Map<String, dynamic> json) =>
      _$ProcessingJobSummaryFromJson(json);
}

/// Describes the results of a processing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingOutput {
  /// The name for the processing job output.
  @_s.JsonKey(name: 'OutputName')
  final String outputName;

  /// Configuration for processing job outputs in Amazon S3.
  @_s.JsonKey(name: 'S3Output')
  final ProcessingS3Output s3Output;

  ProcessingOutput({
    @_s.required this.outputName,
    @_s.required this.s3Output,
  });
  factory ProcessingOutput.fromJson(Map<String, dynamic> json) =>
      _$ProcessingOutputFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingOutputToJson(this);
}

/// The output configuration for the processing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingOutputConfig {
  /// Output configuration information for a processing job.
  @_s.JsonKey(name: 'Outputs')
  final List<ProcessingOutput> outputs;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt the processing job output. <code>KmsKeyId</code> can be an ID of a
  /// KMS key, ARN of a KMS key, alias of a KMS key, or alias of a KMS key. The
  /// <code>KmsKeyId</code> is applied to all outputs.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  ProcessingOutputConfig({
    @_s.required this.outputs,
    this.kmsKeyId,
  });
  factory ProcessingOutputConfig.fromJson(Map<String, dynamic> json) =>
      _$ProcessingOutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingOutputConfigToJson(this);
}

/// Identifies the resources, ML compute instances, and ML storage volumes to
/// deploy for a processing job. In distributed training, you specify more than
/// one instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingResources {
  /// The configuration for the resources in a cluster used to run the processing
  /// job.
  @_s.JsonKey(name: 'ClusterConfig')
  final ProcessingClusterConfig clusterConfig;

  ProcessingResources({
    @_s.required this.clusterConfig,
  });
  factory ProcessingResources.fromJson(Map<String, dynamic> json) =>
      _$ProcessingResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingResourcesToJson(this);
}

enum ProcessingS3CompressionType {
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('Gzip')
  gzip,
}

enum ProcessingS3DataDistributionType {
  @_s.JsonValue('FullyReplicated')
  fullyReplicated,
  @_s.JsonValue('ShardedByS3Key')
  shardedByS3Key,
}

enum ProcessingS3DataType {
  @_s.JsonValue('ManifestFile')
  manifestFile,
  @_s.JsonValue('S3Prefix')
  s3Prefix,
}

/// Information about where and how you want to obtain the inputs for an
/// processing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingS3Input {
  /// The local path to the Amazon S3 bucket where you want Amazon SageMaker to
  /// download the inputs to run a processing job. <code>LocalPath</code> is an
  /// absolute path to the input data.
  @_s.JsonKey(name: 'LocalPath')
  final String localPath;

  /// Whether you use an <code>S3Prefix</code> or a <code>ManifestFile</code> for
  /// the data type. If you choose <code>S3Prefix</code>, <code>S3Uri</code>
  /// identifies a key name prefix. Amazon SageMaker uses all objects with the
  /// specified key name prefix for the processing job. If you choose
  /// <code>ManifestFile</code>, <code>S3Uri</code> identifies an object that is a
  /// manifest file containing a list of object keys that you want Amazon
  /// SageMaker to use for the processing job.
  @_s.JsonKey(name: 'S3DataType')
  final ProcessingS3DataType s3DataType;

  /// Whether to use <code>File</code> or <code>Pipe</code> input mode. In
  /// <code>File</code> mode, Amazon SageMaker copies the data from the input
  /// source onto the local Amazon Elastic Block Store (Amazon EBS) volumes before
  /// starting your training algorithm. This is the most commonly used input mode.
  /// In <code>Pipe</code> mode, Amazon SageMaker streams input data from the
  /// source directly to your algorithm without using the EBS volume.
  @_s.JsonKey(name: 'S3InputMode')
  final ProcessingS3InputMode s3InputMode;

  /// The URI for the Amazon S3 storage where you want Amazon SageMaker to
  /// download the artifacts needed to run a processing job.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  /// Whether to use <code>Gzip</code> compression for Amazon S3 storage.
  @_s.JsonKey(name: 'S3CompressionType')
  final ProcessingS3CompressionType s3CompressionType;

  /// Whether the data stored in Amazon S3 is <code>FullyReplicated</code> or
  /// <code>ShardedByS3Key</code>.
  @_s.JsonKey(name: 'S3DataDistributionType')
  final ProcessingS3DataDistributionType s3DataDistributionType;

  ProcessingS3Input({
    @_s.required this.localPath,
    @_s.required this.s3DataType,
    @_s.required this.s3InputMode,
    @_s.required this.s3Uri,
    this.s3CompressionType,
    this.s3DataDistributionType,
  });
  factory ProcessingS3Input.fromJson(Map<String, dynamic> json) =>
      _$ProcessingS3InputFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingS3InputToJson(this);
}

enum ProcessingS3InputMode {
  @_s.JsonValue('Pipe')
  pipe,
  @_s.JsonValue('File')
  file,
}

/// Information about where and how you want to store the results of an
/// processing job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingS3Output {
  /// The local path to the Amazon S3 bucket where you want Amazon SageMaker to
  /// save the results of an processing job. <code>LocalPath</code> is an absolute
  /// path to the input data.
  @_s.JsonKey(name: 'LocalPath')
  final String localPath;

  /// Whether to upload the results of the processing job continuously or after
  /// the job completes.
  @_s.JsonKey(name: 'S3UploadMode')
  final ProcessingS3UploadMode s3UploadMode;

  /// A URI that identifies the Amazon S3 bucket where you want Amazon SageMaker
  /// to save the results of a processing job.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  ProcessingS3Output({
    @_s.required this.localPath,
    @_s.required this.s3UploadMode,
    @_s.required this.s3Uri,
  });
  factory ProcessingS3Output.fromJson(Map<String, dynamic> json) =>
      _$ProcessingS3OutputFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingS3OutputToJson(this);
}

enum ProcessingS3UploadMode {
  @_s.JsonValue('Continuous')
  continuous,
  @_s.JsonValue('EndOfJob')
  endOfJob,
}

/// Specifies a time limit for how long the processing job is allowed to run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProcessingStoppingCondition {
  /// Specifies the maximum runtime in seconds.
  @_s.JsonKey(name: 'MaxRuntimeInSeconds')
  final int maxRuntimeInSeconds;

  ProcessingStoppingCondition({
    @_s.required this.maxRuntimeInSeconds,
  });
  factory ProcessingStoppingCondition.fromJson(Map<String, dynamic> json) =>
      _$ProcessingStoppingConditionFromJson(json);

  Map<String, dynamic> toJson() => _$ProcessingStoppingConditionToJson(this);
}

/// Identifies a model that you want to host and the resources to deploy for
/// hosting it. If you are deploying multiple models, tell Amazon SageMaker how
/// to distribute traffic among the models by specifying variant weights.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ProductionVariant {
  /// Number of instances to launch initially.
  @_s.JsonKey(name: 'InitialInstanceCount')
  final int initialInstanceCount;

  /// The ML compute instance type.
  @_s.JsonKey(name: 'InstanceType')
  final ProductionVariantInstanceType instanceType;

  /// The name of the model that you want to host. This is the name that you
  /// specified when creating the model.
  @_s.JsonKey(name: 'ModelName')
  final String modelName;

  /// The name of the production variant.
  @_s.JsonKey(name: 'VariantName')
  final String variantName;

  /// The size of the Elastic Inference (EI) instance to use for the production
  /// variant. EI instances provide on-demand GPU computing for inference. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/ei.html">Using Elastic
  /// Inference in Amazon SageMaker</a>.
  @_s.JsonKey(name: 'AcceleratorType')
  final ProductionVariantAcceleratorType acceleratorType;

  /// Determines initial traffic distribution among all of the models that you
  /// specify in the endpoint configuration. The traffic to a production variant
  /// is determined by the ratio of the <code>VariantWeight</code> to the sum of
  /// all <code>VariantWeight</code> values across all ProductionVariants. If
  /// unspecified, it defaults to 1.0.
  @_s.JsonKey(name: 'InitialVariantWeight')
  final double initialVariantWeight;

  ProductionVariant({
    @_s.required this.initialInstanceCount,
    @_s.required this.instanceType,
    @_s.required this.modelName,
    @_s.required this.variantName,
    this.acceleratorType,
    this.initialVariantWeight,
  });
  factory ProductionVariant.fromJson(Map<String, dynamic> json) =>
      _$ProductionVariantFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionVariantToJson(this);
}

enum ProductionVariantAcceleratorType {
  @_s.JsonValue('ml.eia1.medium')
  mlEia1Medium,
  @_s.JsonValue('ml.eia1.large')
  mlEia1Large,
  @_s.JsonValue('ml.eia1.xlarge')
  mlEia1Xlarge,
  @_s.JsonValue('ml.eia2.medium')
  mlEia2Medium,
  @_s.JsonValue('ml.eia2.large')
  mlEia2Large,
  @_s.JsonValue('ml.eia2.xlarge')
  mlEia2Xlarge,
}

enum ProductionVariantInstanceType {
  @_s.JsonValue('ml.t2.medium')
  mlT2Medium,
  @_s.JsonValue('ml.t2.large')
  mlT2Large,
  @_s.JsonValue('ml.t2.xlarge')
  mlT2Xlarge,
  @_s.JsonValue('ml.t2.2xlarge')
  mlT2_2xlarge,
  @_s.JsonValue('ml.m4.xlarge')
  mlM4Xlarge,
  @_s.JsonValue('ml.m4.2xlarge')
  mlM4_2xlarge,
  @_s.JsonValue('ml.m4.4xlarge')
  mlM4_4xlarge,
  @_s.JsonValue('ml.m4.10xlarge')
  mlM4_10xlarge,
  @_s.JsonValue('ml.m4.16xlarge')
  mlM4_16xlarge,
  @_s.JsonValue('ml.m5.large')
  mlM5Large,
  @_s.JsonValue('ml.m5.xlarge')
  mlM5Xlarge,
  @_s.JsonValue('ml.m5.2xlarge')
  mlM5_2xlarge,
  @_s.JsonValue('ml.m5.4xlarge')
  mlM5_4xlarge,
  @_s.JsonValue('ml.m5.12xlarge')
  mlM5_12xlarge,
  @_s.JsonValue('ml.m5.24xlarge')
  mlM5_24xlarge,
  @_s.JsonValue('ml.m5d.large')
  mlM5dLarge,
  @_s.JsonValue('ml.m5d.xlarge')
  mlM5dXlarge,
  @_s.JsonValue('ml.m5d.2xlarge')
  mlM5d_2xlarge,
  @_s.JsonValue('ml.m5d.4xlarge')
  mlM5d_4xlarge,
  @_s.JsonValue('ml.m5d.12xlarge')
  mlM5d_12xlarge,
  @_s.JsonValue('ml.m5d.24xlarge')
  mlM5d_24xlarge,
  @_s.JsonValue('ml.c4.large')
  mlC4Large,
  @_s.JsonValue('ml.c4.xlarge')
  mlC4Xlarge,
  @_s.JsonValue('ml.c4.2xlarge')
  mlC4_2xlarge,
  @_s.JsonValue('ml.c4.4xlarge')
  mlC4_4xlarge,
  @_s.JsonValue('ml.c4.8xlarge')
  mlC4_8xlarge,
  @_s.JsonValue('ml.p2.xlarge')
  mlP2Xlarge,
  @_s.JsonValue('ml.p2.8xlarge')
  mlP2_8xlarge,
  @_s.JsonValue('ml.p2.16xlarge')
  mlP2_16xlarge,
  @_s.JsonValue('ml.p3.2xlarge')
  mlP3_2xlarge,
  @_s.JsonValue('ml.p3.8xlarge')
  mlP3_8xlarge,
  @_s.JsonValue('ml.p3.16xlarge')
  mlP3_16xlarge,
  @_s.JsonValue('ml.c5.large')
  mlC5Large,
  @_s.JsonValue('ml.c5.xlarge')
  mlC5Xlarge,
  @_s.JsonValue('ml.c5.2xlarge')
  mlC5_2xlarge,
  @_s.JsonValue('ml.c5.4xlarge')
  mlC5_4xlarge,
  @_s.JsonValue('ml.c5.9xlarge')
  mlC5_9xlarge,
  @_s.JsonValue('ml.c5.18xlarge')
  mlC5_18xlarge,
  @_s.JsonValue('ml.c5d.large')
  mlC5dLarge,
  @_s.JsonValue('ml.c5d.xlarge')
  mlC5dXlarge,
  @_s.JsonValue('ml.c5d.2xlarge')
  mlC5d_2xlarge,
  @_s.JsonValue('ml.c5d.4xlarge')
  mlC5d_4xlarge,
  @_s.JsonValue('ml.c5d.9xlarge')
  mlC5d_9xlarge,
  @_s.JsonValue('ml.c5d.18xlarge')
  mlC5d_18xlarge,
  @_s.JsonValue('ml.g4dn.xlarge')
  mlG4dnXlarge,
  @_s.JsonValue('ml.g4dn.2xlarge')
  mlG4dn_2xlarge,
  @_s.JsonValue('ml.g4dn.4xlarge')
  mlG4dn_4xlarge,
  @_s.JsonValue('ml.g4dn.8xlarge')
  mlG4dn_8xlarge,
  @_s.JsonValue('ml.g4dn.12xlarge')
  mlG4dn_12xlarge,
  @_s.JsonValue('ml.g4dn.16xlarge')
  mlG4dn_16xlarge,
  @_s.JsonValue('ml.r5.large')
  mlR5Large,
  @_s.JsonValue('ml.r5.xlarge')
  mlR5Xlarge,
  @_s.JsonValue('ml.r5.2xlarge')
  mlR5_2xlarge,
  @_s.JsonValue('ml.r5.4xlarge')
  mlR5_4xlarge,
  @_s.JsonValue('ml.r5.12xlarge')
  mlR5_12xlarge,
  @_s.JsonValue('ml.r5.24xlarge')
  mlR5_24xlarge,
  @_s.JsonValue('ml.r5d.large')
  mlR5dLarge,
  @_s.JsonValue('ml.r5d.xlarge')
  mlR5dXlarge,
  @_s.JsonValue('ml.r5d.2xlarge')
  mlR5d_2xlarge,
  @_s.JsonValue('ml.r5d.4xlarge')
  mlR5d_4xlarge,
  @_s.JsonValue('ml.r5d.12xlarge')
  mlR5d_12xlarge,
  @_s.JsonValue('ml.r5d.24xlarge')
  mlR5d_24xlarge,
  @_s.JsonValue('ml.inf1.xlarge')
  mlInf1Xlarge,
  @_s.JsonValue('ml.inf1.2xlarge')
  mlInf1_2xlarge,
  @_s.JsonValue('ml.inf1.6xlarge')
  mlInf1_6xlarge,
  @_s.JsonValue('ml.inf1.24xlarge')
  mlInf1_24xlarge,
}

/// Describes weight and capacities for a production variant associated with an
/// endpoint. If you sent a request to the
/// <code>UpdateEndpointWeightsAndCapacities</code> API and the endpoint status
/// is <code>Updating</code>, you get different desired and current values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProductionVariantSummary {
  /// The name of the variant.
  @_s.JsonKey(name: 'VariantName')
  final String variantName;

  /// The number of instances associated with the variant.
  @_s.JsonKey(name: 'CurrentInstanceCount')
  final int currentInstanceCount;

  /// The weight associated with the variant.
  @_s.JsonKey(name: 'CurrentWeight')
  final double currentWeight;

  /// An array of <code>DeployedImage</code> objects that specify the Amazon EC2
  /// Container Registry paths of the inference images deployed on instances of
  /// this <code>ProductionVariant</code>.
  @_s.JsonKey(name: 'DeployedImages')
  final List<DeployedImage> deployedImages;

  /// The number of instances requested in the
  /// <code>UpdateEndpointWeightsAndCapacities</code> request.
  @_s.JsonKey(name: 'DesiredInstanceCount')
  final int desiredInstanceCount;

  /// The requested weight, as specified in the
  /// <code>UpdateEndpointWeightsAndCapacities</code> request.
  @_s.JsonKey(name: 'DesiredWeight')
  final double desiredWeight;

  ProductionVariantSummary({
    @_s.required this.variantName,
    this.currentInstanceCount,
    this.currentWeight,
    this.deployedImages,
    this.desiredInstanceCount,
    this.desiredWeight,
  });
  factory ProductionVariantSummary.fromJson(Map<String, dynamic> json) =>
      _$ProductionVariantSummaryFromJson(json);
}

/// Part of the <code>SuggestionQuery</code> type. Specifies a hint for
/// retrieving property names that begin with the specified text.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class PropertyNameQuery {
  /// Text that begins a property's name.
  @_s.JsonKey(name: 'PropertyNameHint')
  final String propertyNameHint;

  PropertyNameQuery({
    @_s.required this.propertyNameHint,
  });
  Map<String, dynamic> toJson() => _$PropertyNameQueryToJson(this);
}

/// A property name returned from a <code>GetSearchSuggestions</code> call that
/// specifies a value in the <code>PropertyNameQuery</code> field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PropertyNameSuggestion {
  /// A suggested property name based on what you entered in the search textbox in
  /// the Amazon SageMaker console.
  @_s.JsonKey(name: 'PropertyName')
  final String propertyName;

  PropertyNameSuggestion({
    this.propertyName,
  });
  factory PropertyNameSuggestion.fromJson(Map<String, dynamic> json) =>
      _$PropertyNameSuggestionFromJson(json);
}

/// Defines the amount of money paid to an Amazon Mechanical Turk worker for
/// each task performed.
///
/// Use one of the following prices for bounding box tasks. Prices are in US
/// dollars and should be based on the complexity of the task; the longer it
/// takes in your initial testing, the more you should offer.
///
/// <ul>
/// <li>
/// 0.036
/// </li>
/// <li>
/// 0.048
/// </li>
/// <li>
/// 0.060
/// </li>
/// <li>
/// 0.072
/// </li>
/// <li>
/// 0.120
/// </li>
/// <li>
/// 0.240
/// </li>
/// <li>
/// 0.360
/// </li>
/// <li>
/// 0.480
/// </li>
/// <li>
/// 0.600
/// </li>
/// <li>
/// 0.720
/// </li>
/// <li>
/// 0.840
/// </li>
/// <li>
/// 0.960
/// </li>
/// <li>
/// 1.080
/// </li>
/// <li>
/// 1.200
/// </li>
/// </ul>
/// Use one of the following prices for image classification, text
/// classification, and custom tasks. Prices are in US dollars.
///
/// <ul>
/// <li>
/// 0.012
/// </li>
/// <li>
/// 0.024
/// </li>
/// <li>
/// 0.036
/// </li>
/// <li>
/// 0.048
/// </li>
/// <li>
/// 0.060
/// </li>
/// <li>
/// 0.072
/// </li>
/// <li>
/// 0.120
/// </li>
/// <li>
/// 0.240
/// </li>
/// <li>
/// 0.360
/// </li>
/// <li>
/// 0.480
/// </li>
/// <li>
/// 0.600
/// </li>
/// <li>
/// 0.720
/// </li>
/// <li>
/// 0.840
/// </li>
/// <li>
/// 0.960
/// </li>
/// <li>
/// 1.080
/// </li>
/// <li>
/// 1.200
/// </li>
/// </ul>
/// Use one of the following prices for semantic segmentation tasks. Prices are
/// in US dollars.
///
/// <ul>
/// <li>
/// 0.840
/// </li>
/// <li>
/// 0.960
/// </li>
/// <li>
/// 1.080
/// </li>
/// <li>
/// 1.200
/// </li>
/// </ul>
/// Use one of the following prices for Textract AnalyzeDocument Important Form
/// Key Amazon Augmented AI review tasks. Prices are in US dollars.
///
/// <ul>
/// <li>
/// 2.400
/// </li>
/// <li>
/// 2.280
/// </li>
/// <li>
/// 2.160
/// </li>
/// <li>
/// 2.040
/// </li>
/// <li>
/// 1.920
/// </li>
/// <li>
/// 1.800
/// </li>
/// <li>
/// 1.680
/// </li>
/// <li>
/// 1.560
/// </li>
/// <li>
/// 1.440
/// </li>
/// <li>
/// 1.320
/// </li>
/// <li>
/// 1.200
/// </li>
/// <li>
/// 1.080
/// </li>
/// <li>
/// 0.960
/// </li>
/// <li>
/// 0.840
/// </li>
/// <li>
/// 0.720
/// </li>
/// <li>
/// 0.600
/// </li>
/// <li>
/// 0.480
/// </li>
/// <li>
/// 0.360
/// </li>
/// <li>
/// 0.240
/// </li>
/// <li>
/// 0.120
/// </li>
/// <li>
/// 0.072
/// </li>
/// <li>
/// 0.060
/// </li>
/// <li>
/// 0.048
/// </li>
/// <li>
/// 0.036
/// </li>
/// <li>
/// 0.024
/// </li>
/// <li>
/// 0.012
/// </li>
/// </ul>
/// Use one of the following prices for Rekognition DetectModerationLabels
/// Amazon Augmented AI review tasks. Prices are in US dollars.
///
/// <ul>
/// <li>
/// 1.200
/// </li>
/// <li>
/// 1.080
/// </li>
/// <li>
/// 0.960
/// </li>
/// <li>
/// 0.840
/// </li>
/// <li>
/// 0.720
/// </li>
/// <li>
/// 0.600
/// </li>
/// <li>
/// 0.480
/// </li>
/// <li>
/// 0.360
/// </li>
/// <li>
/// 0.240
/// </li>
/// <li>
/// 0.120
/// </li>
/// <li>
/// 0.072
/// </li>
/// <li>
/// 0.060
/// </li>
/// <li>
/// 0.048
/// </li>
/// <li>
/// 0.036
/// </li>
/// <li>
/// 0.024
/// </li>
/// <li>
/// 0.012
/// </li>
/// </ul>
/// Use one of the following prices for Amazon Augmented AI custom human review
/// tasks. Prices are in US dollars.
///
/// <ul>
/// <li>
/// 1.200
/// </li>
/// <li>
/// 1.080
/// </li>
/// <li>
/// 0.960
/// </li>
/// <li>
/// 0.840
/// </li>
/// <li>
/// 0.720
/// </li>
/// <li>
/// 0.600
/// </li>
/// <li>
/// 0.480
/// </li>
/// <li>
/// 0.360
/// </li>
/// <li>
/// 0.240
/// </li>
/// <li>
/// 0.120
/// </li>
/// <li>
/// 0.072
/// </li>
/// <li>
/// 0.060
/// </li>
/// <li>
/// 0.048
/// </li>
/// <li>
/// 0.036
/// </li>
/// <li>
/// 0.024
/// </li>
/// <li>
/// 0.012
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PublicWorkforceTaskPrice {
  /// Defines the amount of money paid to an Amazon Mechanical Turk worker in
  /// United States dollars.
  @_s.JsonKey(name: 'AmountInUsd')
  final USD amountInUsd;

  PublicWorkforceTaskPrice({
    this.amountInUsd,
  });
  factory PublicWorkforceTaskPrice.fromJson(Map<String, dynamic> json) =>
      _$PublicWorkforceTaskPriceFromJson(json);

  Map<String, dynamic> toJson() => _$PublicWorkforceTaskPriceToJson(this);
}

enum RecordWrapper {
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('RecordIO')
  recordIO,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RenderUiTemplateResponse {
  /// A list of one or more <code>RenderingError</code> objects if any were
  /// encountered while rendering the template. If there were no errors, the list
  /// is empty.
  @_s.JsonKey(name: 'Errors')
  final List<RenderingError> errors;

  /// A Liquid template that renders the HTML for the worker UI.
  @_s.JsonKey(name: 'RenderedContent')
  final String renderedContent;

  RenderUiTemplateResponse({
    @_s.required this.errors,
    @_s.required this.renderedContent,
  });
  factory RenderUiTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$RenderUiTemplateResponseFromJson(json);
}

/// Contains input values for a task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RenderableTask {
  /// A JSON object that contains values for the variables defined in the
  /// template. It is made available to the template under the substitution
  /// variable <code>task.input</code>. For example, if you define a variable
  /// <code>task.input.text</code> in your template, you can supply the variable
  /// in the JSON object as <code>"text": "sample text"</code>.
  @_s.JsonKey(name: 'Input')
  final String input;

  RenderableTask({
    @_s.required this.input,
  });
  Map<String, dynamic> toJson() => _$RenderableTaskToJson(this);
}

/// A description of an error that occurred while rendering the template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RenderingError {
  /// A unique identifier for a specific class of errors.
  @_s.JsonKey(name: 'Code')
  final String code;

  /// A human-readable message describing the error.
  @_s.JsonKey(name: 'Message')
  final String message;

  RenderingError({
    @_s.required this.code,
    @_s.required this.message,
  });
  factory RenderingError.fromJson(Map<String, dynamic> json) =>
      _$RenderingErrorFromJson(json);
}

/// The resolved attributes.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResolvedAttributes {
  @_s.JsonKey(name: 'AutoMLJobObjective')
  final AutoMLJobObjective autoMLJobObjective;
  @_s.JsonKey(name: 'CompletionCriteria')
  final AutoMLJobCompletionCriteria completionCriteria;

  /// The problem type.
  @_s.JsonKey(name: 'ProblemType')
  final ProblemType problemType;

  ResolvedAttributes({
    this.autoMLJobObjective,
    this.completionCriteria,
    this.problemType,
  });
  factory ResolvedAttributes.fromJson(Map<String, dynamic> json) =>
      _$ResolvedAttributesFromJson(json);
}

/// Describes the resources, including ML compute instances and ML storage
/// volumes, to use for model training.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceConfig {
  /// The number of ML compute instances to use. For distributed training, provide
  /// a value greater than 1.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The ML compute instance type.
  @_s.JsonKey(name: 'InstanceType')
  final TrainingInstanceType instanceType;

  /// The size of the ML storage volume that you want to provision.
  ///
  /// ML storage volumes store model artifacts and incremental states. Training
  /// algorithms might also use the ML storage volume for scratch space. If you
  /// want to store the training data in the ML storage volume, choose
  /// <code>File</code> as the <code>TrainingInputMode</code> in the algorithm
  /// specification.
  ///
  /// You must specify sufficient ML storage for your scenario.
  /// <note>
  /// Amazon SageMaker supports only the General Purpose SSD (gp2) ML storage
  /// volume type.
  /// </note> <note>
  /// Certain Nitro-based instances include local storage with a fixed total size,
  /// dependent on the instance type. When using these instances for training,
  /// Amazon SageMaker mounts the local instance storage instead of Amazon EBS gp2
  /// storage. You can't request a <code>VolumeSizeInGB</code> greater than the
  /// total size of the local instance storage.
  ///
  /// For a list of instance types that support local instance storage, including
  /// the total size per instance type, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes">Instance
  /// Store Volumes</a>.
  /// </note>
  @_s.JsonKey(name: 'VolumeSizeInGB')
  final int volumeSizeInGB;

  /// The AWS KMS key that Amazon SageMaker uses to encrypt data on the storage
  /// volume attached to the ML compute instance(s) that run the training job.
  /// <note>
  /// Certain Nitro-based instances include local storage, dependent on the
  /// instance type. Local storage volumes are encrypted using a hardware module
  /// on the instance. You can't request a <code>VolumeKmsKeyId</code> when using
  /// an instance type with local storage.
  ///
  /// For a list of instance types that support local instance storage, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html#instance-store-volumes">Instance
  /// Store Volumes</a>.
  ///
  /// For more information about local instance storage encryption, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ssd-instance-store.html">SSD
  /// Instance Store Volumes</a>.
  /// </note>
  /// The <code>VolumeKmsKeyId</code> can be in any of the following formats:
  ///
  /// <ul>
  /// <li>
  /// // KMS Key ID
  ///
  /// <code>"1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// <li>
  /// // Amazon Resource Name (ARN) of a KMS Key
  ///
  /// <code>"arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab"</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'VolumeKmsKeyId')
  final String volumeKmsKeyId;

  ResourceConfig({
    @_s.required this.instanceCount,
    @_s.required this.instanceType,
    @_s.required this.volumeSizeInGB,
    this.volumeKmsKeyId,
  });
  factory ResourceConfig.fromJson(Map<String, dynamic> json) =>
      _$ResourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceConfigToJson(this);
}

/// Specifies the maximum number of training jobs and parallel training jobs
/// that a hyperparameter tuning job can launch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceLimits {
  /// The maximum number of training jobs that a hyperparameter tuning job can
  /// launch.
  @_s.JsonKey(name: 'MaxNumberOfTrainingJobs')
  final int maxNumberOfTrainingJobs;

  /// The maximum number of concurrent training jobs that a hyperparameter tuning
  /// job can launch.
  @_s.JsonKey(name: 'MaxParallelTrainingJobs')
  final int maxParallelTrainingJobs;

  ResourceLimits({
    @_s.required this.maxNumberOfTrainingJobs,
    @_s.required this.maxParallelTrainingJobs,
  });
  factory ResourceLimits.fromJson(Map<String, dynamic> json) =>
      _$ResourceLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceLimitsToJson(this);
}

/// The instance type and quantity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ResourceSpec {
  /// The Amazon Resource Name (ARN) of the environment.
  @_s.JsonKey(name: 'EnvironmentArn')
  final String environmentArn;

  /// The instance type.
  @_s.JsonKey(name: 'InstanceType')
  final AppInstanceType instanceType;

  ResourceSpec({
    this.environmentArn,
    this.instanceType,
  });
  factory ResourceSpec.fromJson(Map<String, dynamic> json) =>
      _$ResourceSpecFromJson(json);

  Map<String, dynamic> toJson() => _$ResourceSpecToJson(this);
}

enum ResourceType {
  @_s.JsonValue('TrainingJob')
  trainingJob,
  @_s.JsonValue('Experiment')
  experiment,
  @_s.JsonValue('ExperimentTrial')
  experimentTrial,
  @_s.JsonValue('ExperimentTrialComponent')
  experimentTrialComponent,
}

/// The retention policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RetentionPolicy {
  /// The home Amazon Elastic File System (EFS).
  @_s.JsonKey(name: 'HomeEfsFileSystem')
  final RetentionType homeEfsFileSystem;

  RetentionPolicy({
    this.homeEfsFileSystem,
  });
  Map<String, dynamic> toJson() => _$RetentionPolicyToJson(this);
}

enum RetentionType {
  @_s.JsonValue('Retain')
  retain,
  @_s.JsonValue('Delete')
  delete,
}

enum RootAccess {
  @_s.JsonValue('Enabled')
  enabled,
  @_s.JsonValue('Disabled')
  disabled,
}

enum RuleEvaluationStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('NoIssuesFound')
  noIssuesFound,
  @_s.JsonValue('IssuesFound')
  issuesFound,
  @_s.JsonValue('Error')
  error,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
}

enum S3DataDistribution {
  @_s.JsonValue('FullyReplicated')
  fullyReplicated,
  @_s.JsonValue('ShardedByS3Key')
  shardedByS3Key,
}

/// Describes the S3 data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3DataSource {
  /// If you choose <code>S3Prefix</code>, <code>S3Uri</code> identifies a key
  /// name prefix. Amazon SageMaker uses all objects that match the specified key
  /// name prefix for model training.
  ///
  /// If you choose <code>ManifestFile</code>, <code>S3Uri</code> identifies an
  /// object that is a manifest file containing a list of object keys that you
  /// want Amazon SageMaker to use for model training.
  ///
  /// If you choose <code>AugmentedManifestFile</code>, S3Uri identifies an object
  /// that is an augmented manifest file in JSON lines format. This file contains
  /// the data you want to use for model training.
  /// <code>AugmentedManifestFile</code> can only be used if the Channel's input
  /// mode is <code>Pipe</code>.
  @_s.JsonKey(name: 'S3DataType')
  final S3DataType s3DataType;

  /// Depending on the value specified for the <code>S3DataType</code>, identifies
  /// either a key name prefix or a manifest. For example:
  ///
  /// <ul>
  /// <li>
  /// A key name prefix might look like this:
  /// <code>s3://bucketname/exampleprefix</code>.
  /// </li>
  /// <li>
  /// A manifest might look like this:
  /// <code>s3://bucketname/example.manifest</code>
  ///
  /// The manifest is an S3 object which is a JSON file with the following format:
  ///
  /// The preceding JSON matches the following <code>s3Uris</code>:
  ///
  /// <code>[ {"prefix": "s3://customer_bucket/some/prefix/"},</code>
  ///
  /// <code>"relative/path/to/custdata-1",</code>
  ///
  /// <code>"relative/path/custdata-2",</code>
  ///
  /// <code>...</code>
  ///
  /// <code>"relative/path/custdata-N"</code>
  ///
  /// <code>]</code>
  ///
  /// The preceding JSON matches the following <code>s3Uris</code>:
  ///
  /// <code>s3://customer_bucket/some/prefix/relative/path/to/custdata-1</code>
  ///
  /// <code>s3://customer_bucket/some/prefix/relative/path/custdata-2</code>
  ///
  /// <code>...</code>
  ///
  /// <code>s3://customer_bucket/some/prefix/relative/path/custdata-N</code>
  ///
  /// The complete set of <code>s3uris</code> in this manifest is the input data
  /// for the channel for this datasource. The object that each
  /// <code>s3uris</code> points to must be readable by the IAM role that Amazon
  /// SageMaker uses to perform tasks on your behalf.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  /// A list of one or more attribute names to use that are found in a specified
  /// augmented manifest file.
  @_s.JsonKey(name: 'AttributeNames')
  final List<String> attributeNames;

  /// If you want Amazon SageMaker to replicate the entire dataset on each ML
  /// compute instance that is launched for model training, specify
  /// <code>FullyReplicated</code>.
  ///
  /// If you want Amazon SageMaker to replicate a subset of data on each ML
  /// compute instance that is launched for model training, specify
  /// <code>ShardedByS3Key</code>. If there are <i>n</i> ML compute instances
  /// launched for a training job, each instance gets approximately 1/<i>n</i> of
  /// the number of S3 objects. In this case, model training on each machine uses
  /// only the subset of training data.
  ///
  /// Don't choose more ML compute instances for training than available S3
  /// objects. If you do, some nodes won't get any data and you will pay for nodes
  /// that aren't getting any training data. This applies in both File and Pipe
  /// modes. Keep this in mind when developing algorithms.
  ///
  /// In distributed training, where you use multiple ML compute EC2 instances,
  /// you might choose <code>ShardedByS3Key</code>. If the algorithm requires
  /// copying training data to the ML storage volume (when
  /// <code>TrainingInputMode</code> is set to <code>File</code>), this copies
  /// 1/<i>n</i> of the number of objects.
  @_s.JsonKey(name: 'S3DataDistributionType')
  final S3DataDistribution s3DataDistributionType;

  S3DataSource({
    @_s.required this.s3DataType,
    @_s.required this.s3Uri,
    this.attributeNames,
    this.s3DataDistributionType,
  });
  factory S3DataSource.fromJson(Map<String, dynamic> json) =>
      _$S3DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$S3DataSourceToJson(this);
}

enum S3DataType {
  @_s.JsonValue('ManifestFile')
  manifestFile,
  @_s.JsonValue('S3Prefix')
  s3Prefix,
  @_s.JsonValue('AugmentedManifestFile')
  augmentedManifestFile,
}

/// Configuration details about the monitoring schedule.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ScheduleConfig {
  /// A cron expression that describes details about the monitoring schedule.
  ///
  /// Currently the only supported cron expressions are:
  ///
  /// <ul>
  /// <li>
  /// If you want to set the job to start every hour, please use the following:
  ///
  /// <code>Hourly: cron(0 * ? * * *)</code>
  /// </li>
  /// <li>
  /// If you want to start the job daily:
  ///
  /// <code>cron(0 [00-23] ? * * *)</code>
  /// </li>
  /// </ul>
  /// For example, the following are valid cron expressions:
  ///
  /// <ul>
  /// <li>
  /// Daily at noon UTC: <code>cron(0 12 ? * * *)</code>
  /// </li>
  /// <li>
  /// Daily at midnight UTC: <code>cron(0 0 ? * * *)</code>
  /// </li>
  /// </ul>
  /// To support running every 6, 12 hours, the following are also supported:
  ///
  /// <code>cron(0 [00-23]/[01-24] ? * * *)</code>
  ///
  /// For example, the following are valid cron expressions:
  ///
  /// <ul>
  /// <li>
  /// Every 12 hours, starting at 5pm UTC: <code>cron(0 17/12 ? * * *)</code>
  /// </li>
  /// <li>
  /// Every two hours starting at midnight: <code>cron(0 0/2 ? * * *)</code>
  /// </li>
  /// </ul> <note>
  /// <ul>
  /// <li>
  /// Even though the cron expression is set to start at 5PM UTC, note that there
  /// could be a delay of 0-20 minutes from the actual requested time to run the
  /// execution.
  /// </li>
  /// <li>
  /// We recommend that if you would like a daily schedule, you do not provide
  /// this parameter. Amazon SageMaker will pick a time for running every day.
  /// </li>
  /// </ul> </note>
  @_s.JsonKey(name: 'ScheduleExpression')
  final String scheduleExpression;

  ScheduleConfig({
    @_s.required this.scheduleExpression,
  });
  factory ScheduleConfig.fromJson(Map<String, dynamic> json) =>
      _$ScheduleConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleConfigToJson(this);
}

enum ScheduleStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Scheduled')
  scheduled,
  @_s.JsonValue('Stopped')
  stopped,
}

/// A multi-expression that searches for the specified resource or resources in
/// a search. All resource objects that satisfy the expression's condition are
/// included in the search results. You must specify at least one subexpression,
/// filter, or nested filter. A <code>SearchExpression</code> can contain up to
/// twenty elements.
///
/// A <code>SearchExpression</code> contains the following components:
///
/// <ul>
/// <li>
/// A list of <code>Filter</code> objects. Each filter defines a simple Boolean
/// expression comprised of a resource property name, Boolean operator, and
/// value. A <code>SearchExpression</code> can include only one
/// <code>Contains</code> operator.
/// </li>
/// <li>
/// A list of <code>NestedFilter</code> objects. Each nested filter defines a
/// list of Boolean expressions using a list of resource properties. A nested
/// filter is satisfied if a single object in the list satisfies all Boolean
/// expressions.
/// </li>
/// <li>
/// A list of <code>SearchExpression</code> objects. A search expression object
/// can be nested in a list of search expression objects.
/// </li>
/// <li>
/// A Boolean operator: <code>And</code> or <code>Or</code>.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SearchExpression {
  /// A list of filter objects.
  @_s.JsonKey(name: 'Filters')
  final List<Filter> filters;

  /// A list of nested filter objects.
  @_s.JsonKey(name: 'NestedFilters')
  final List<NestedFilters> nestedFilters;

  /// A Boolean operator used to evaluate the search expression. If you want every
  /// conditional statement in all lists to be satisfied for the entire search
  /// expression to be true, specify <code>And</code>. If only a single
  /// conditional statement needs to be true for the entire search expression to
  /// be true, specify <code>Or</code>. The default value is <code>And</code>.
  @_s.JsonKey(name: 'Operator')
  final BooleanOperator operator;

  /// A list of search expression objects.
  @_s.JsonKey(name: 'SubExpressions')
  final List<SearchExpression> subExpressions;

  SearchExpression({
    this.filters,
    this.nestedFilters,
    this.operator,
    this.subExpressions,
  });
  Map<String, dynamic> toJson() => _$SearchExpressionToJson(this);
}

/// A single resource returned as part of the <a>Search</a> API response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchRecord {
  /// The properties of an experiment.
  @_s.JsonKey(name: 'Experiment')
  final Experiment experiment;

  /// The properties of a training job.
  @_s.JsonKey(name: 'TrainingJob')
  final TrainingJob trainingJob;

  /// The properties of a trial.
  @_s.JsonKey(name: 'Trial')
  final Trial trial;

  /// The properties of a trial component.
  @_s.JsonKey(name: 'TrialComponent')
  final TrialComponent trialComponent;

  SearchRecord({
    this.experiment,
    this.trainingJob,
    this.trial,
    this.trialComponent,
  });
  factory SearchRecord.fromJson(Map<String, dynamic> json) =>
      _$SearchRecordFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchResponse {
  /// If the result of the previous <code>Search</code> request was truncated, the
  /// response includes a NextToken. To retrieve the next set of results, use the
  /// token in the next request.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of <code>SearchRecord</code> objects.
  @_s.JsonKey(name: 'Results')
  final List<SearchRecord> results;

  SearchResponse({
    this.nextToken,
    this.results,
  });
  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
}

enum SearchSortOrder {
  @_s.JsonValue('Ascending')
  ascending,
  @_s.JsonValue('Descending')
  descending,
}

enum SecondaryStatus {
  @_s.JsonValue('Starting')
  starting,
  @_s.JsonValue('LaunchingMLInstances')
  launchingMLInstances,
  @_s.JsonValue('PreparingTrainingStack')
  preparingTrainingStack,
  @_s.JsonValue('Downloading')
  downloading,
  @_s.JsonValue('DownloadingTrainingImage')
  downloadingTrainingImage,
  @_s.JsonValue('Training')
  training,
  @_s.JsonValue('Uploading')
  uploading,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
  @_s.JsonValue('MaxRuntimeExceeded')
  maxRuntimeExceeded,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Interrupted')
  interrupted,
  @_s.JsonValue('MaxWaitTimeExceeded')
  maxWaitTimeExceeded,
}

/// An array element of
/// <a>DescribeTrainingJobResponse$SecondaryStatusTransitions</a>. It provides
/// additional details about a status that the training job has transitioned
/// through. A training job can be in one of several states, for example,
/// starting, downloading, training, or uploading. Within each state, there are
/// a number of intermediate states. For example, within the starting state,
/// Amazon SageMaker could be starting the training job or launching the ML
/// instances. These transitional states are referred to as the job's secondary
/// status.
/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SecondaryStatusTransition {
  /// A timestamp that shows when the training job transitioned to the current
  /// secondary status state.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;

  /// Contains a secondary status information from a training job.
  ///
  /// Status might be one of the following secondary statuses:
  /// <dl> <dt>InProgress</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Starting</code> - Starting the training job.
  /// </li>
  /// <li>
  /// <code>Downloading</code> - An optional stage for algorithms that support
  /// <code>File</code> training input mode. It indicates that data is being
  /// downloaded to the ML storage volumes.
  /// </li>
  /// <li>
  /// <code>Training</code> - Training is in progress.
  /// </li>
  /// <li>
  /// <code>Uploading</code> - Training is complete and the model artifacts are
  /// being uploaded to the S3 location.
  /// </li>
  /// </ul> </dd> <dt>Completed</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Completed</code> - The training job has completed.
  /// </li>
  /// </ul> </dd> <dt>Failed</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Failed</code> - The training job has failed. The reason for the
  /// failure is returned in the <code>FailureReason</code> field of
  /// <code>DescribeTrainingJobResponse</code>.
  /// </li>
  /// </ul> </dd> <dt>Stopped</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the
  /// maximum allowed runtime.
  /// </li>
  /// <li>
  /// <code>Stopped</code> - The training job has stopped.
  /// </li>
  /// </ul> </dd> <dt>Stopping</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Stopping</code> - Stopping the training job.
  /// </li>
  /// </ul> </dd> </dl>
  /// We no longer support the following secondary statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>LaunchingMLInstances</code>
  /// </li>
  /// <li>
  /// <code>PreparingTrainingStack</code>
  /// </li>
  /// <li>
  /// <code>DownloadingTrainingImage</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final SecondaryStatus status;

  /// A timestamp that shows when the training job transitioned out of this
  /// secondary status state into another secondary status state or when the
  /// training job has ended.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// A detailed description of the progress within a secondary status.
  ///
  /// Amazon SageMaker provides secondary statuses and status messages that apply
  /// to each of them:
  /// <dl> <dt>Starting</dt> <dd>
  /// <ul>
  /// <li>
  /// Starting the training job.
  /// </li>
  /// <li>
  /// Launching requested ML instances.
  /// </li>
  /// <li>
  /// Insufficient capacity error from EC2 while launching instances, retrying!
  /// </li>
  /// <li>
  /// Launched instance was unhealthy, replacing it!
  /// </li>
  /// <li>
  /// Preparing the instances for training.
  /// </li>
  /// </ul> </dd> <dt>Training</dt> <dd>
  /// <ul>
  /// <li>
  /// Downloading the training image.
  /// </li>
  /// <li>
  /// Training image download completed. Training in progress.
  /// </li>
  /// </ul> </dd> </dl> <important>
  /// Status messages are subject to change. Therefore, we recommend not including
  /// them in code that programmatically initiates actions. For examples, don't
  /// use status messages in if statements.
  /// </important>
  /// To have an overview of your training job's progress, view
  /// <code>TrainingJobStatus</code> and <code>SecondaryStatus</code> in
  /// <a>DescribeTrainingJob</a>, and <code>StatusMessage</code> together. For
  /// example, at the start of a training job, you might see the following:
  ///
  /// <ul>
  /// <li>
  /// <code>TrainingJobStatus</code> - InProgress
  /// </li>
  /// <li>
  /// <code>SecondaryStatus</code> - Training
  /// </li>
  /// <li>
  /// <code>StatusMessage</code> - Downloading the training image
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'StatusMessage')
  final String statusMessage;

  SecondaryStatusTransition({
    @_s.required this.startTime,
    @_s.required this.status,
    this.endTime,
    this.statusMessage,
  });
  factory SecondaryStatusTransition.fromJson(Map<String, dynamic> json) =>
      _$SecondaryStatusTransitionFromJson(json);
}

/// The sharing settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SharingSettings {
  /// The notebook output option.
  @_s.JsonKey(name: 'NotebookOutputOption')
  final NotebookOutputOption notebookOutputOption;

  /// The AWS Key Management Service encryption key ID.
  @_s.JsonKey(name: 'S3KmsKeyId')
  final String s3KmsKeyId;

  /// The Amazon S3 output path.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  SharingSettings({
    this.notebookOutputOption,
    this.s3KmsKeyId,
    this.s3OutputPath,
  });
  factory SharingSettings.fromJson(Map<String, dynamic> json) =>
      _$SharingSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$SharingSettingsToJson(this);
}

/// A configuration for a shuffle option for input data in a channel. If you use
/// <code>S3Prefix</code> for <code>S3DataType</code>, the results of the S3 key
/// prefix matches are shuffled. If you use <code>ManifestFile</code>, the order
/// of the S3 object references in the <code>ManifestFile</code> is shuffled. If
/// you use <code>AugmentedManifestFile</code>, the order of the JSON lines in
/// the <code>AugmentedManifestFile</code> is shuffled. The shuffling order is
/// determined using the <code>Seed</code> value.
///
/// For Pipe input mode, when <code>ShuffleConfig</code> is specified shuffling
/// is done at the start of every epoch. With large datasets, this ensures that
/// the order of the training data is different for each epoch, and it helps
/// reduce bias and possible overfitting. In a multi-node training job when
/// <code>ShuffleConfig</code> is combined with
/// <code>S3DataDistributionType</code> of <code>ShardedByS3Key</code>, the data
/// is shuffled across nodes so that the content sent to a particular node on
/// the first epoch might be sent to a different node on the second epoch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ShuffleConfig {
  /// Determines the shuffling order in <code>ShuffleConfig</code> value.
  @_s.JsonKey(name: 'Seed')
  final int seed;

  ShuffleConfig({
    @_s.required this.seed,
  });
  factory ShuffleConfig.fromJson(Map<String, dynamic> json) =>
      _$ShuffleConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ShuffleConfigToJson(this);
}

enum SortBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('Status')
  status,
}

enum SortExperimentsBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
}

enum SortOrder {
  @_s.JsonValue('Ascending')
  ascending,
  @_s.JsonValue('Descending')
  descending,
}

enum SortTrialComponentsBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
}

enum SortTrialsBy {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
}

/// Specifies an algorithm that was used to create the model package. The
/// algorithm must be either an algorithm resource in your Amazon SageMaker
/// account or an algorithm in AWS Marketplace that you are subscribed to.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceAlgorithm {
  /// The name of an algorithm that was used to create the model package. The
  /// algorithm must be either an algorithm resource in your Amazon SageMaker
  /// account or an algorithm in AWS Marketplace that you are subscribed to.
  @_s.JsonKey(name: 'AlgorithmName')
  final String algorithmName;

  /// The Amazon S3 path where the model artifacts, which result from model
  /// training, are stored. This path must point to a single <code>gzip</code>
  /// compressed tar archive (<code>.tar.gz</code> suffix).
  @_s.JsonKey(name: 'ModelDataUrl')
  final String modelDataUrl;

  SourceAlgorithm({
    @_s.required this.algorithmName,
    this.modelDataUrl,
  });
  factory SourceAlgorithm.fromJson(Map<String, dynamic> json) =>
      _$SourceAlgorithmFromJson(json);

  Map<String, dynamic> toJson() => _$SourceAlgorithmToJson(this);
}

/// A list of algorithms that were used to create a model package.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceAlgorithmSpecification {
  /// A list of the algorithms that were used to create a model package.
  @_s.JsonKey(name: 'SourceAlgorithms')
  final List<SourceAlgorithm> sourceAlgorithms;

  SourceAlgorithmSpecification({
    @_s.required this.sourceAlgorithms,
  });
  factory SourceAlgorithmSpecification.fromJson(Map<String, dynamic> json) =>
      _$SourceAlgorithmSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$SourceAlgorithmSpecificationToJson(this);
}

/// A list of IP address ranges (<a
/// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>).
/// Used to create an allow list of IP addresses for a private workforce. For
/// more information, see .
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SourceIpConfig {
  /// A list of one to four <a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">Classless
  /// Inter-Domain Routing</a> (CIDR) values.
  ///
  /// Maximum: Four CIDR values
  /// <note>
  /// The following Length Constraints apply to individual CIDR values in the CIDR
  /// value list.
  /// </note>
  @_s.JsonKey(name: 'Cidrs')
  final List<String> cidrs;

  SourceIpConfig({
    @_s.required this.cidrs,
  });
  factory SourceIpConfig.fromJson(Map<String, dynamic> json) =>
      _$SourceIpConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SourceIpConfigToJson(this);
}

enum SplitType {
  @_s.JsonValue('None')
  none,
  @_s.JsonValue('Line')
  line,
  @_s.JsonValue('RecordIO')
  recordIO,
  @_s.JsonValue('TFRecord')
  tFRecord,
}

/// Specifies a limit to how long a model training or compilation job can run.
/// It also specifies how long you are willing to wait for a managed spot
/// training job to complete. When the job reaches the time limit, Amazon
/// SageMaker ends the training or compilation job. Use this API to cap model
/// training costs.
///
/// To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code>
/// signal, which delays job termination for 120 seconds. Algorithms can use
/// this 120-second window to save the model artifacts, so the results of
/// training are not lost.
///
/// The training algorithms provided by Amazon SageMaker automatically save the
/// intermediate results of a model training job when possible. This attempt to
/// save artifacts is only a best effort case as model might not be in a state
/// from which it can be saved. For example, if training has just started, the
/// model might not be ready to save. When saved, this intermediate data is a
/// valid model artifact. You can use it to create a model with
/// <code>CreateModel</code>.
/// <note>
/// The Neural Topic Model (NTM) currently does not support saving intermediate
/// model artifacts. When training NTMs, make sure that the maximum runtime is
/// sufficient for the training job to complete.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StoppingCondition {
  /// The maximum length of time, in seconds, that the training or compilation job
  /// can run. If job does not complete during this time, Amazon SageMaker ends
  /// the job. If value is not specified, default value is 1 day. The maximum
  /// value is 28 days.
  @_s.JsonKey(name: 'MaxRuntimeInSeconds')
  final int maxRuntimeInSeconds;

  /// The maximum length of time, in seconds, how long you are willing to wait for
  /// a managed spot training job to complete. It is the amount of time spent
  /// waiting for Spot capacity plus the amount of time the training job runs. It
  /// must be equal to or greater than <code>MaxRuntimeInSeconds</code>.
  @_s.JsonKey(name: 'MaxWaitTimeInSeconds')
  final int maxWaitTimeInSeconds;

  StoppingCondition({
    this.maxRuntimeInSeconds,
    this.maxWaitTimeInSeconds,
  });
  factory StoppingCondition.fromJson(Map<String, dynamic> json) =>
      _$StoppingConditionFromJson(json);

  Map<String, dynamic> toJson() => _$StoppingConditionToJson(this);
}

/// Describes a work team of a vendor that does the a labelling job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubscribedWorkteam {
  /// The Amazon Resource Name (ARN) of the vendor that you have subscribed.
  @_s.JsonKey(name: 'WorkteamArn')
  final String workteamArn;

  /// <p/>
  @_s.JsonKey(name: 'ListingId')
  final String listingId;

  /// The description of the vendor from the Amazon Marketplace.
  @_s.JsonKey(name: 'MarketplaceDescription')
  final String marketplaceDescription;

  /// The title of the service provided by the vendor in the Amazon Marketplace.
  @_s.JsonKey(name: 'MarketplaceTitle')
  final String marketplaceTitle;

  /// The name of the vendor in the Amazon Marketplace.
  @_s.JsonKey(name: 'SellerName')
  final String sellerName;

  SubscribedWorkteam({
    @_s.required this.workteamArn,
    this.listingId,
    this.marketplaceDescription,
    this.marketplaceTitle,
    this.sellerName,
  });
  factory SubscribedWorkteam.fromJson(Map<String, dynamic> json) =>
      _$SubscribedWorkteamFromJson(json);
}

/// Specified in the <a>GetSearchSuggestions</a> request. Limits the property
/// names that are included in the response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SuggestionQuery {
  /// Defines a property name hint. Only property names that begin with the
  /// specified hint are included in the response.
  @_s.JsonKey(name: 'PropertyNameQuery')
  final PropertyNameQuery propertyNameQuery;

  SuggestionQuery({
    this.propertyNameQuery,
  });
  Map<String, dynamic> toJson() => _$SuggestionQueryToJson(this);
}

/// Describes a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag key.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The tag value.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

enum TargetDevice {
  @_s.JsonValue('lambda')
  lambda,
  @_s.JsonValue('ml_m4')
  mlM4,
  @_s.JsonValue('ml_m5')
  mlM5,
  @_s.JsonValue('ml_c4')
  mlC4,
  @_s.JsonValue('ml_c5')
  mlC5,
  @_s.JsonValue('ml_p2')
  mlP2,
  @_s.JsonValue('ml_p3')
  mlP3,
  @_s.JsonValue('ml_inf1')
  mlInf1,
  @_s.JsonValue('jetson_tx1')
  jetsonTx1,
  @_s.JsonValue('jetson_tx2')
  jetsonTx2,
  @_s.JsonValue('jetson_nano')
  jetsonNano,
  @_s.JsonValue('jetson_xavier')
  jetsonXavier,
  @_s.JsonValue('rasp3b')
  rasp3b,
  @_s.JsonValue('imx8qm')
  imx8qm,
  @_s.JsonValue('deeplens')
  deeplens,
  @_s.JsonValue('rk3399')
  rk3399,
  @_s.JsonValue('rk3288')
  rk3288,
  @_s.JsonValue('aisage')
  aisage,
  @_s.JsonValue('sbe_c')
  sbeC,
  @_s.JsonValue('qcs605')
  qcs605,
  @_s.JsonValue('qcs603')
  qcs603,
  @_s.JsonValue('sitara_am57x')
  sitaraAm57x,
  @_s.JsonValue('amba_cv22')
  ambaCv22,
}

/// The TensorBoard app settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TensorBoardAppSettings {
  /// The instance type and quantity.
  @_s.JsonKey(name: 'DefaultResourceSpec')
  final ResourceSpec defaultResourceSpec;

  TensorBoardAppSettings({
    this.defaultResourceSpec,
  });
  factory TensorBoardAppSettings.fromJson(Map<String, dynamic> json) =>
      _$TensorBoardAppSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TensorBoardAppSettingsToJson(this);
}

/// Configuration of storage locations for TensorBoard output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TensorBoardOutputConfig {
  /// Path to Amazon S3 storage location for TensorBoard output.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  /// Path to local storage location for tensorBoard output. Defaults to
  /// <code>/opt/ml/output/tensorboard</code>.
  @_s.JsonKey(name: 'LocalPath')
  final String localPath;

  TensorBoardOutputConfig({
    @_s.required this.s3OutputPath,
    this.localPath,
  });
  factory TensorBoardOutputConfig.fromJson(Map<String, dynamic> json) =>
      _$TensorBoardOutputConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TensorBoardOutputConfigToJson(this);
}

enum TrainingInputMode {
  @_s.JsonValue('Pipe')
  pipe,
  @_s.JsonValue('File')
  file,
}

enum TrainingInstanceType {
  @_s.JsonValue('ml.m4.xlarge')
  mlM4Xlarge,
  @_s.JsonValue('ml.m4.2xlarge')
  mlM4_2xlarge,
  @_s.JsonValue('ml.m4.4xlarge')
  mlM4_4xlarge,
  @_s.JsonValue('ml.m4.10xlarge')
  mlM4_10xlarge,
  @_s.JsonValue('ml.m4.16xlarge')
  mlM4_16xlarge,
  @_s.JsonValue('ml.g4dn.xlarge')
  mlG4dnXlarge,
  @_s.JsonValue('ml.g4dn.2xlarge')
  mlG4dn_2xlarge,
  @_s.JsonValue('ml.g4dn.4xlarge')
  mlG4dn_4xlarge,
  @_s.JsonValue('ml.g4dn.8xlarge')
  mlG4dn_8xlarge,
  @_s.JsonValue('ml.g4dn.12xlarge')
  mlG4dn_12xlarge,
  @_s.JsonValue('ml.g4dn.16xlarge')
  mlG4dn_16xlarge,
  @_s.JsonValue('ml.m5.large')
  mlM5Large,
  @_s.JsonValue('ml.m5.xlarge')
  mlM5Xlarge,
  @_s.JsonValue('ml.m5.2xlarge')
  mlM5_2xlarge,
  @_s.JsonValue('ml.m5.4xlarge')
  mlM5_4xlarge,
  @_s.JsonValue('ml.m5.12xlarge')
  mlM5_12xlarge,
  @_s.JsonValue('ml.m5.24xlarge')
  mlM5_24xlarge,
  @_s.JsonValue('ml.c4.xlarge')
  mlC4Xlarge,
  @_s.JsonValue('ml.c4.2xlarge')
  mlC4_2xlarge,
  @_s.JsonValue('ml.c4.4xlarge')
  mlC4_4xlarge,
  @_s.JsonValue('ml.c4.8xlarge')
  mlC4_8xlarge,
  @_s.JsonValue('ml.p2.xlarge')
  mlP2Xlarge,
  @_s.JsonValue('ml.p2.8xlarge')
  mlP2_8xlarge,
  @_s.JsonValue('ml.p2.16xlarge')
  mlP2_16xlarge,
  @_s.JsonValue('ml.p3.2xlarge')
  mlP3_2xlarge,
  @_s.JsonValue('ml.p3.8xlarge')
  mlP3_8xlarge,
  @_s.JsonValue('ml.p3.16xlarge')
  mlP3_16xlarge,
  @_s.JsonValue('ml.p3dn.24xlarge')
  mlP3dn_24xlarge,
  @_s.JsonValue('ml.c5.xlarge')
  mlC5Xlarge,
  @_s.JsonValue('ml.c5.2xlarge')
  mlC5_2xlarge,
  @_s.JsonValue('ml.c5.4xlarge')
  mlC5_4xlarge,
  @_s.JsonValue('ml.c5.9xlarge')
  mlC5_9xlarge,
  @_s.JsonValue('ml.c5.18xlarge')
  mlC5_18xlarge,
  @_s.JsonValue('ml.c5n.xlarge')
  mlC5nXlarge,
  @_s.JsonValue('ml.c5n.2xlarge')
  mlC5n_2xlarge,
  @_s.JsonValue('ml.c5n.4xlarge')
  mlC5n_4xlarge,
  @_s.JsonValue('ml.c5n.9xlarge')
  mlC5n_9xlarge,
  @_s.JsonValue('ml.c5n.18xlarge')
  mlC5n_18xlarge,
}

/// Contains information about a training job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrainingJob {
  /// Information about the algorithm used for training, and algorithm metadata.
  @_s.JsonKey(name: 'AlgorithmSpecification')
  final AlgorithmSpecification algorithmSpecification;

  /// The Amazon Resource Name (ARN) of the job.
  @_s.JsonKey(name: 'AutoMLJobArn')
  final String autoMLJobArn;

  /// The billable time in seconds.
  @_s.JsonKey(name: 'BillableTimeInSeconds')
  final int billableTimeInSeconds;
  @_s.JsonKey(name: 'CheckpointConfig')
  final CheckpointConfig checkpointConfig;

  /// A timestamp that indicates when the training job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;
  @_s.JsonKey(name: 'DebugHookConfig')
  final DebugHookConfig debugHookConfig;

  /// Information about the debug rule configuration.
  @_s.JsonKey(name: 'DebugRuleConfigurations')
  final List<DebugRuleConfiguration> debugRuleConfigurations;

  /// Information about the evaluation status of the rules for the training job.
  @_s.JsonKey(name: 'DebugRuleEvaluationStatuses')
  final List<DebugRuleEvaluationStatus> debugRuleEvaluationStatuses;

  /// To encrypt all communications between ML compute instances in distributed
  /// training, choose <code>True</code>. Encryption provides greater security for
  /// distributed training, but training might take longer. How long it takes
  /// depends on the amount of communication between compute instances, especially
  /// if you use a deep learning algorithm in distributed training.
  @_s.JsonKey(name: 'EnableInterContainerTrafficEncryption')
  final bool enableInterContainerTrafficEncryption;

  /// When true, enables managed spot training using Amazon EC2 Spot instances to
  /// run training jobs instead of on-demand instances. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/model-managed-spot-training.html">Managed
  /// Spot Training</a>.
  @_s.JsonKey(name: 'EnableManagedSpotTraining')
  final bool enableManagedSpotTraining;

  /// If the <code>TrainingJob</code> was created with network isolation, the
  /// value is set to <code>true</code>. If network isolation is enabled, nodes
  /// can't communicate beyond the VPC they run in.
  @_s.JsonKey(name: 'EnableNetworkIsolation')
  final bool enableNetworkIsolation;
  @_s.JsonKey(name: 'ExperimentConfig')
  final ExperimentConfig experimentConfig;

  /// If the training job failed, the reason it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// A list of final metric values that are set when the training job completes.
  /// Used only if the training job was configured to use metrics.
  @_s.JsonKey(name: 'FinalMetricDataList')
  final List<MetricData> finalMetricDataList;

  /// Algorithm-specific parameters.
  @_s.JsonKey(name: 'HyperParameters')
  final Map<String, String> hyperParameters;

  /// An array of <code>Channel</code> objects that describes each data input
  /// channel.
  @_s.JsonKey(name: 'InputDataConfig')
  final List<Channel> inputDataConfig;

  /// The Amazon Resource Name (ARN) of the labeling job.
  @_s.JsonKey(name: 'LabelingJobArn')
  final String labelingJobArn;

  /// A timestamp that indicates when the status of the training job was last
  /// modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// Information about the Amazon S3 location that is configured for storing
  /// model artifacts.
  @_s.JsonKey(name: 'ModelArtifacts')
  final ModelArtifacts modelArtifacts;

  /// The S3 path where model artifacts that you configured when creating the job
  /// are stored. Amazon SageMaker creates subfolders for model artifacts.
  @_s.JsonKey(name: 'OutputDataConfig')
  final OutputDataConfig outputDataConfig;

  /// Resources, including ML compute instances and ML storage volumes, that are
  /// configured for model training.
  @_s.JsonKey(name: 'ResourceConfig')
  final ResourceConfig resourceConfig;

  /// The AWS Identity and Access Management (IAM) role configured for the
  /// training job.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// Provides detailed information about the state of the training job. For
  /// detailed information about the secondary status of the training job, see
  /// <code>StatusMessage</code> under <a>SecondaryStatusTransition</a>.
  ///
  /// Amazon SageMaker provides primary statuses and secondary statuses that apply
  /// to each of them:
  /// <dl> <dt>InProgress</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Starting</code> - Starting the training job.
  /// </li>
  /// <li>
  /// <code>Downloading</code> - An optional stage for algorithms that support
  /// <code>File</code> training input mode. It indicates that data is being
  /// downloaded to the ML storage volumes.
  /// </li>
  /// <li>
  /// <code>Training</code> - Training is in progress.
  /// </li>
  /// <li>
  /// <code>Uploading</code> - Training is complete and the model artifacts are
  /// being uploaded to the S3 location.
  /// </li>
  /// </ul> </dd> <dt>Completed</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Completed</code> - The training job has completed.
  /// </li>
  /// </ul> </dd> <dt>Failed</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Failed</code> - The training job has failed. The reason for the
  /// failure is returned in the <code>FailureReason</code> field of
  /// <code>DescribeTrainingJobResponse</code>.
  /// </li>
  /// </ul> </dd> <dt>Stopped</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>MaxRuntimeExceeded</code> - The job stopped because it exceeded the
  /// maximum allowed runtime.
  /// </li>
  /// <li>
  /// <code>Stopped</code> - The training job has stopped.
  /// </li>
  /// </ul> </dd> <dt>Stopping</dt> <dd>
  /// <ul>
  /// <li>
  /// <code>Stopping</code> - Stopping the training job.
  /// </li>
  /// </ul> </dd> </dl> <important>
  /// Valid values for <code>SecondaryStatus</code> are subject to change.
  /// </important>
  /// We no longer support the following secondary statuses:
  ///
  /// <ul>
  /// <li>
  /// <code>LaunchingMLInstances</code>
  /// </li>
  /// <li>
  /// <code>PreparingTrainingStack</code>
  /// </li>
  /// <li>
  /// <code>DownloadingTrainingImage</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'SecondaryStatus')
  final SecondaryStatus secondaryStatus;

  /// A history of all of the secondary statuses that the training job has
  /// transitioned through.
  @_s.JsonKey(name: 'SecondaryStatusTransitions')
  final List<SecondaryStatusTransition> secondaryStatusTransitions;

  /// Specifies a limit to how long a model training job can run. When the job
  /// reaches the time limit, Amazon SageMaker ends the training job. Use this API
  /// to cap model training costs.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the <code>SIGTERM</code>
  /// signal, which delays job termination for 120 seconds. Algorithms can use
  /// this 120-second window to save the model artifacts, so the results of
  /// training are not lost.
  @_s.JsonKey(name: 'StoppingCondition')
  final StoppingCondition stoppingCondition;

  /// An array of key-value pairs. For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/cost-alloc-tags.html#allocation-what">Using
  /// Cost Allocation Tags</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;
  @_s.JsonKey(name: 'TensorBoardOutputConfig')
  final TensorBoardOutputConfig tensorBoardOutputConfig;

  /// Indicates the time when the training job ends on training instances. You are
  /// billed for the time interval between the value of
  /// <code>TrainingStartTime</code> and this time. For successful jobs and
  /// stopped jobs, this is the time after model artifacts are uploaded. For
  /// failed jobs, this is the time when Amazon SageMaker detects a job failure.
  @_s.JsonKey(
      name: 'TrainingEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime trainingEndTime;

  /// The Amazon Resource Name (ARN) of the training job.
  @_s.JsonKey(name: 'TrainingJobArn')
  final String trainingJobArn;

  /// The name of the training job.
  @_s.JsonKey(name: 'TrainingJobName')
  final String trainingJobName;

  /// The status of the training job.
  ///
  /// Training job statuses are:
  ///
  /// <ul>
  /// <li>
  /// <code>InProgress</code> - The training is in progress.
  /// </li>
  /// <li>
  /// <code>Completed</code> - The training job has completed.
  /// </li>
  /// <li>
  /// <code>Failed</code> - The training job has failed. To see the reason for the
  /// failure, see the <code>FailureReason</code> field in the response to a
  /// <code>DescribeTrainingJobResponse</code> call.
  /// </li>
  /// <li>
  /// <code>Stopping</code> - The training job is stopping.
  /// </li>
  /// <li>
  /// <code>Stopped</code> - The training job has stopped.
  /// </li>
  /// </ul>
  /// For more detailed information, see <code>SecondaryStatus</code>.
  @_s.JsonKey(name: 'TrainingJobStatus')
  final TrainingJobStatus trainingJobStatus;

  /// Indicates the time when the training job starts on training instances. You
  /// are billed for the time interval between this time and the value of
  /// <code>TrainingEndTime</code>. The start time in CloudWatch Logs might be
  /// later than this time. The difference is due to the time it takes to download
  /// the training data and to the size of the training container.
  @_s.JsonKey(
      name: 'TrainingStartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime trainingStartTime;

  /// The training time in seconds.
  @_s.JsonKey(name: 'TrainingTimeInSeconds')
  final int trainingTimeInSeconds;

  /// The Amazon Resource Name (ARN) of the associated hyperparameter tuning job
  /// if the training job was launched by a hyperparameter tuning job.
  @_s.JsonKey(name: 'TuningJobArn')
  final String tuningJobArn;

  /// A <a>VpcConfig</a> object that specifies the VPC that this training job has
  /// access to. For more information, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect
  /// Training Jobs by Using an Amazon Virtual Private Cloud</a>.
  @_s.JsonKey(name: 'VpcConfig')
  final VpcConfig vpcConfig;

  TrainingJob({
    this.algorithmSpecification,
    this.autoMLJobArn,
    this.billableTimeInSeconds,
    this.checkpointConfig,
    this.creationTime,
    this.debugHookConfig,
    this.debugRuleConfigurations,
    this.debugRuleEvaluationStatuses,
    this.enableInterContainerTrafficEncryption,
    this.enableManagedSpotTraining,
    this.enableNetworkIsolation,
    this.experimentConfig,
    this.failureReason,
    this.finalMetricDataList,
    this.hyperParameters,
    this.inputDataConfig,
    this.labelingJobArn,
    this.lastModifiedTime,
    this.modelArtifacts,
    this.outputDataConfig,
    this.resourceConfig,
    this.roleArn,
    this.secondaryStatus,
    this.secondaryStatusTransitions,
    this.stoppingCondition,
    this.tags,
    this.tensorBoardOutputConfig,
    this.trainingEndTime,
    this.trainingJobArn,
    this.trainingJobName,
    this.trainingJobStatus,
    this.trainingStartTime,
    this.trainingTimeInSeconds,
    this.tuningJobArn,
    this.vpcConfig,
  });
  factory TrainingJob.fromJson(Map<String, dynamic> json) =>
      _$TrainingJobFromJson(json);
}

/// Defines the input needed to run a training job using the algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrainingJobDefinition {
  /// An array of <code>Channel</code> objects, each of which specifies an input
  /// source.
  @_s.JsonKey(name: 'InputDataConfig')
  final List<Channel> inputDataConfig;

  /// the path to the S3 bucket where you want to store model artifacts. Amazon
  /// SageMaker creates subfolders for the artifacts.
  @_s.JsonKey(name: 'OutputDataConfig')
  final OutputDataConfig outputDataConfig;

  /// The resources, including the ML compute instances and ML storage volumes, to
  /// use for model training.
  @_s.JsonKey(name: 'ResourceConfig')
  final ResourceConfig resourceConfig;

  /// Specifies a limit to how long a model training job can run. When the job
  /// reaches the time limit, Amazon SageMaker ends the training job. Use this API
  /// to cap model training costs.
  ///
  /// To stop a job, Amazon SageMaker sends the algorithm the SIGTERM signal,
  /// which delays job termination for 120 seconds. Algorithms can use this
  /// 120-second window to save the model artifacts.
  @_s.JsonKey(name: 'StoppingCondition')
  final StoppingCondition stoppingCondition;

  /// The input mode used by the algorithm for the training job. For the input
  /// modes that Amazon SageMaker algorithms support, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/algos.html">Algorithms</a>.
  ///
  /// If an algorithm supports the <code>File</code> input mode, Amazon SageMaker
  /// downloads the training data from S3 to the provisioned ML storage Volume,
  /// and mounts the directory to docker volume for training container. If an
  /// algorithm supports the <code>Pipe</code> input mode, Amazon SageMaker
  /// streams data directly from S3 to the container.
  @_s.JsonKey(name: 'TrainingInputMode')
  final TrainingInputMode trainingInputMode;

  /// The hyperparameters used for the training job.
  @_s.JsonKey(name: 'HyperParameters')
  final Map<String, String> hyperParameters;

  TrainingJobDefinition({
    @_s.required this.inputDataConfig,
    @_s.required this.outputDataConfig,
    @_s.required this.resourceConfig,
    @_s.required this.stoppingCondition,
    @_s.required this.trainingInputMode,
    this.hyperParameters,
  });
  factory TrainingJobDefinition.fromJson(Map<String, dynamic> json) =>
      _$TrainingJobDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingJobDefinitionToJson(this);
}

enum TrainingJobEarlyStoppingType {
  @_s.JsonValue('Off')
  off,
  @_s.JsonValue('Auto')
  auto,
}

enum TrainingJobSortByOptions {
  @_s.JsonValue('Name')
  name,
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('Status')
  status,
  @_s.JsonValue('FinalObjectiveMetricValue')
  finalObjectiveMetricValue,
}

enum TrainingJobStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
}

/// The numbers of training jobs launched by a hyperparameter tuning job,
/// categorized by status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrainingJobStatusCounters {
  /// The number of completed training jobs launched by the hyperparameter tuning
  /// job.
  @_s.JsonKey(name: 'Completed')
  final int completed;

  /// The number of in-progress training jobs launched by a hyperparameter tuning
  /// job.
  @_s.JsonKey(name: 'InProgress')
  final int inProgress;

  /// The number of training jobs that failed and can't be retried. A failed
  /// training job can't be retried if it failed because a client error occurred.
  @_s.JsonKey(name: 'NonRetryableError')
  final int nonRetryableError;

  /// The number of training jobs that failed, but can be retried. A failed
  /// training job can be retried only if it failed because an internal service
  /// error occurred.
  @_s.JsonKey(name: 'RetryableError')
  final int retryableError;

  /// The number of training jobs launched by a hyperparameter tuning job that
  /// were manually stopped.
  @_s.JsonKey(name: 'Stopped')
  final int stopped;

  TrainingJobStatusCounters({
    this.completed,
    this.inProgress,
    this.nonRetryableError,
    this.retryableError,
    this.stopped,
  });
  factory TrainingJobStatusCounters.fromJson(Map<String, dynamic> json) =>
      _$TrainingJobStatusCountersFromJson(json);
}

/// Provides summary information about a training job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrainingJobSummary {
  /// A timestamp that shows when the training job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the training job.
  @_s.JsonKey(name: 'TrainingJobArn')
  final String trainingJobArn;

  /// The name of the training job that you want a summary for.
  @_s.JsonKey(name: 'TrainingJobName')
  final String trainingJobName;

  /// The status of the training job.
  @_s.JsonKey(name: 'TrainingJobStatus')
  final TrainingJobStatus trainingJobStatus;

  /// Timestamp when the training job was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// A timestamp that shows when the training job ended. This field is set only
  /// if the training job has one of the terminal statuses
  /// (<code>Completed</code>, <code>Failed</code>, or <code>Stopped</code>).
  @_s.JsonKey(
      name: 'TrainingEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime trainingEndTime;

  TrainingJobSummary({
    @_s.required this.creationTime,
    @_s.required this.trainingJobArn,
    @_s.required this.trainingJobName,
    @_s.required this.trainingJobStatus,
    this.lastModifiedTime,
    this.trainingEndTime,
  });
  factory TrainingJobSummary.fromJson(Map<String, dynamic> json) =>
      _$TrainingJobSummaryFromJson(json);
}

/// Defines how the algorithm is used for a training job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrainingSpecification {
  /// A list of the instance types that this algorithm can use for training.
  @_s.JsonKey(name: 'SupportedTrainingInstanceTypes')
  final List<String> supportedTrainingInstanceTypes;

  /// A list of <code>ChannelSpecification</code> objects, which specify the input
  /// sources to be used by the algorithm.
  @_s.JsonKey(name: 'TrainingChannels')
  final List<ChannelSpecification> trainingChannels;

  /// The Amazon ECR registry path of the Docker image that contains the training
  /// algorithm.
  @_s.JsonKey(name: 'TrainingImage')
  final String trainingImage;

  /// A list of <code>MetricDefinition</code> objects, which are used for parsing
  /// metrics generated by the algorithm.
  @_s.JsonKey(name: 'MetricDefinitions')
  final List<MetricDefinition> metricDefinitions;

  /// A list of the <code>HyperParameterSpecification</code> objects, that define
  /// the supported hyperparameters. This is required if the algorithm supports
  /// automatic model tuning.&gt;
  @_s.JsonKey(name: 'SupportedHyperParameters')
  final List<HyperParameterSpecification> supportedHyperParameters;

  /// A list of the metrics that the algorithm emits that can be used as the
  /// objective metric in a hyperparameter tuning job.
  @_s.JsonKey(name: 'SupportedTuningJobObjectiveMetrics')
  final List<HyperParameterTuningJobObjective>
      supportedTuningJobObjectiveMetrics;

  /// Indicates whether the algorithm supports distributed training. If set to
  /// false, buyers can't request more than one instance during training.
  @_s.JsonKey(name: 'SupportsDistributedTraining')
  final bool supportsDistributedTraining;

  /// An MD5 hash of the training algorithm that identifies the Docker image used
  /// for training.
  @_s.JsonKey(name: 'TrainingImageDigest')
  final String trainingImageDigest;

  TrainingSpecification({
    @_s.required this.supportedTrainingInstanceTypes,
    @_s.required this.trainingChannels,
    @_s.required this.trainingImage,
    this.metricDefinitions,
    this.supportedHyperParameters,
    this.supportedTuningJobObjectiveMetrics,
    this.supportsDistributedTraining,
    this.trainingImageDigest,
  });
  factory TrainingSpecification.fromJson(Map<String, dynamic> json) =>
      _$TrainingSpecificationFromJson(json);

  Map<String, dynamic> toJson() => _$TrainingSpecificationToJson(this);
}

/// Describes the location of the channel data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransformDataSource {
  /// The S3 location of the data source that is associated with a channel.
  @_s.JsonKey(name: 'S3DataSource')
  final TransformS3DataSource s3DataSource;

  TransformDataSource({
    @_s.required this.s3DataSource,
  });
  factory TransformDataSource.fromJson(Map<String, dynamic> json) =>
      _$TransformDataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$TransformDataSourceToJson(this);
}

/// Describes the input source of a transform job and the way the transform job
/// consumes it.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransformInput {
  /// Describes the location of the channel data, which is, the S3 location of the
  /// input data that the model can consume.
  @_s.JsonKey(name: 'DataSource')
  final TransformDataSource dataSource;

  /// If your transform data is compressed, specify the compression type. Amazon
  /// SageMaker automatically decompresses the data for the transform job
  /// accordingly. The default value is <code>None</code>.
  @_s.JsonKey(name: 'CompressionType')
  final CompressionType compressionType;

  /// The multipurpose internet mail extension (MIME) type of the data. Amazon
  /// SageMaker uses the MIME type with each http call to transfer data to the
  /// transform job.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// The method to use to split the transform job's data files into smaller
  /// batches. Splitting is necessary when the total size of each object is too
  /// large to fit in a single request. You can also use data splitting to improve
  /// performance by processing multiple concurrent mini-batches. The default
  /// value for <code>SplitType</code> is <code>None</code>, which indicates that
  /// input data files are not split, and request payloads contain the entire
  /// contents of an input object. Set the value of this parameter to
  /// <code>Line</code> to split records on a newline character boundary.
  /// <code>SplitType</code> also supports a number of record-oriented binary data
  /// formats.
  ///
  /// When splitting is enabled, the size of a mini-batch depends on the values of
  /// the <code>BatchStrategy</code> and <code>MaxPayloadInMB</code> parameters.
  /// When the value of <code>BatchStrategy</code> is <code>MultiRecord</code>,
  /// Amazon SageMaker sends the maximum number of records in each request, up to
  /// the <code>MaxPayloadInMB</code> limit. If the value of
  /// <code>BatchStrategy</code> is <code>SingleRecord</code>, Amazon SageMaker
  /// sends individual records in each request.
  /// <note>
  /// Some data formats represent a record as a binary payload wrapped with extra
  /// padding bytes. When splitting is applied to a binary data format, padding is
  /// removed if the value of <code>BatchStrategy</code> is set to
  /// <code>SingleRecord</code>. Padding is not removed if the value of
  /// <code>BatchStrategy</code> is set to <code>MultiRecord</code>.
  ///
  /// For more information about <code>RecordIO</code>, see <a
  /// href="https://mxnet.apache.org/api/faq/recordio">Create a Dataset Using
  /// RecordIO</a> in the MXNet documentation. For more information about
  /// <code>TFRecord</code>, see <a
  /// href="https://www.tensorflow.org/guide/datasets#consuming_tfrecord_data">Consuming
  /// TFRecord data</a> in the TensorFlow documentation.
  /// </note>
  @_s.JsonKey(name: 'SplitType')
  final SplitType splitType;

  TransformInput({
    @_s.required this.dataSource,
    this.compressionType,
    this.contentType,
    this.splitType,
  });
  factory TransformInput.fromJson(Map<String, dynamic> json) =>
      _$TransformInputFromJson(json);

  Map<String, dynamic> toJson() => _$TransformInputToJson(this);
}

enum TransformInstanceType {
  @_s.JsonValue('ml.m4.xlarge')
  mlM4Xlarge,
  @_s.JsonValue('ml.m4.2xlarge')
  mlM4_2xlarge,
  @_s.JsonValue('ml.m4.4xlarge')
  mlM4_4xlarge,
  @_s.JsonValue('ml.m4.10xlarge')
  mlM4_10xlarge,
  @_s.JsonValue('ml.m4.16xlarge')
  mlM4_16xlarge,
  @_s.JsonValue('ml.c4.xlarge')
  mlC4Xlarge,
  @_s.JsonValue('ml.c4.2xlarge')
  mlC4_2xlarge,
  @_s.JsonValue('ml.c4.4xlarge')
  mlC4_4xlarge,
  @_s.JsonValue('ml.c4.8xlarge')
  mlC4_8xlarge,
  @_s.JsonValue('ml.p2.xlarge')
  mlP2Xlarge,
  @_s.JsonValue('ml.p2.8xlarge')
  mlP2_8xlarge,
  @_s.JsonValue('ml.p2.16xlarge')
  mlP2_16xlarge,
  @_s.JsonValue('ml.p3.2xlarge')
  mlP3_2xlarge,
  @_s.JsonValue('ml.p3.8xlarge')
  mlP3_8xlarge,
  @_s.JsonValue('ml.p3.16xlarge')
  mlP3_16xlarge,
  @_s.JsonValue('ml.c5.xlarge')
  mlC5Xlarge,
  @_s.JsonValue('ml.c5.2xlarge')
  mlC5_2xlarge,
  @_s.JsonValue('ml.c5.4xlarge')
  mlC5_4xlarge,
  @_s.JsonValue('ml.c5.9xlarge')
  mlC5_9xlarge,
  @_s.JsonValue('ml.c5.18xlarge')
  mlC5_18xlarge,
  @_s.JsonValue('ml.m5.large')
  mlM5Large,
  @_s.JsonValue('ml.m5.xlarge')
  mlM5Xlarge,
  @_s.JsonValue('ml.m5.2xlarge')
  mlM5_2xlarge,
  @_s.JsonValue('ml.m5.4xlarge')
  mlM5_4xlarge,
  @_s.JsonValue('ml.m5.12xlarge')
  mlM5_12xlarge,
  @_s.JsonValue('ml.m5.24xlarge')
  mlM5_24xlarge,
}

/// Defines the input needed to run a transform job using the inference
/// specification specified in the algorithm.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransformJobDefinition {
  /// A description of the input source and the way the transform job consumes it.
  @_s.JsonKey(name: 'TransformInput')
  final TransformInput transformInput;

  /// Identifies the Amazon S3 location where you want Amazon SageMaker to save
  /// the results from the transform job.
  @_s.JsonKey(name: 'TransformOutput')
  final TransformOutput transformOutput;

  /// Identifies the ML compute instances for the transform job.
  @_s.JsonKey(name: 'TransformResources')
  final TransformResources transformResources;

  /// A string that determines the number of records included in a single
  /// mini-batch.
  ///
  /// <code>SingleRecord</code> means only one record is used per mini-batch.
  /// <code>MultiRecord</code> means a mini-batch is set to contain as many
  /// records that can fit within the <code>MaxPayloadInMB</code> limit.
  @_s.JsonKey(name: 'BatchStrategy')
  final BatchStrategy batchStrategy;

  /// The environment variables to set in the Docker container. We support up to
  /// 16 key and values entries in the map.
  @_s.JsonKey(name: 'Environment')
  final Map<String, String> environment;

  /// The maximum number of parallel requests that can be sent to each instance in
  /// a transform job. The default value is 1.
  @_s.JsonKey(name: 'MaxConcurrentTransforms')
  final int maxConcurrentTransforms;

  /// The maximum payload size allowed, in MB. A payload is the data portion of a
  /// record (without metadata).
  @_s.JsonKey(name: 'MaxPayloadInMB')
  final int maxPayloadInMB;

  TransformJobDefinition({
    @_s.required this.transformInput,
    @_s.required this.transformOutput,
    @_s.required this.transformResources,
    this.batchStrategy,
    this.environment,
    this.maxConcurrentTransforms,
    this.maxPayloadInMB,
  });
  factory TransformJobDefinition.fromJson(Map<String, dynamic> json) =>
      _$TransformJobDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$TransformJobDefinitionToJson(this);
}

enum TransformJobStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
}

/// Provides a summary of a transform job. Multiple
/// <code>TransformJobSummary</code> objects are returned as a list after in
/// response to a <a>ListTransformJobs</a> call.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TransformJobSummary {
  /// A timestamp that shows when the transform Job was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the transform job.
  @_s.JsonKey(name: 'TransformJobArn')
  final String transformJobArn;

  /// The name of the transform job.
  @_s.JsonKey(name: 'TransformJobName')
  final String transformJobName;

  /// The status of the transform job.
  @_s.JsonKey(name: 'TransformJobStatus')
  final TransformJobStatus transformJobStatus;

  /// If the transform job failed, the reason it failed.
  @_s.JsonKey(name: 'FailureReason')
  final String failureReason;

  /// Indicates when the transform job was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// Indicates when the transform job ends on compute instances. For successful
  /// jobs and stopped jobs, this is the exact time recorded after the results are
  /// uploaded. For failed jobs, this is when Amazon SageMaker detected that the
  /// job failed.
  @_s.JsonKey(
      name: 'TransformEndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime transformEndTime;

  TransformJobSummary({
    @_s.required this.creationTime,
    @_s.required this.transformJobArn,
    @_s.required this.transformJobName,
    @_s.required this.transformJobStatus,
    this.failureReason,
    this.lastModifiedTime,
    this.transformEndTime,
  });
  factory TransformJobSummary.fromJson(Map<String, dynamic> json) =>
      _$TransformJobSummaryFromJson(json);
}

/// Describes the results of a transform job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransformOutput {
  /// The Amazon S3 path where you want Amazon SageMaker to store the results of
  /// the transform job. For example,
  /// <code>s3://bucket-name/key-name-prefix</code>.
  ///
  /// For every S3 object used as input for the transform job, batch transform
  /// stores the transformed data with an .<code>out</code> suffix in a
  /// corresponding subfolder in the location in the output prefix. For example,
  /// for the input data stored at
  /// <code>s3://bucket-name/input-name-prefix/dataset01/data.csv</code>, batch
  /// transform stores the transformed data at
  /// <code>s3://bucket-name/output-name-prefix/input-name-prefix/data.csv.out</code>.
  /// Batch transform doesn't upload partially processed objects. For an input S3
  /// object that contains multiple records, it creates an .<code>out</code> file
  /// only if the transform job succeeds on the entire file. When the input
  /// contains multiple S3 objects, the batch transform job processes the listed
  /// S3 objects and uploads only the output for successfully processed objects.
  /// If any object fails in the transform job batch transform marks the job as
  /// failed to prompt investigation.
  @_s.JsonKey(name: 'S3OutputPath')
  final String s3OutputPath;

  /// The MIME type used to specify the output data. Amazon SageMaker uses the
  /// MIME type with each http call to transfer data from the transform job.
  @_s.JsonKey(name: 'Accept')
  final String accept;

  /// Defines how to assemble the results of the transform job as a single S3
  /// object. Choose a format that is most convenient to you. To concatenate the
  /// results in binary format, specify <code>None</code>. To add a newline
  /// character at the end of every transformed record, specify <code>Line</code>.
  @_s.JsonKey(name: 'AssembleWith')
  final AssemblyType assembleWith;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt the model artifacts at rest using Amazon S3 server-side encryption.
  /// The <code>KmsKeyId</code> can be any of the following formats:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias name ARN:
  /// <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  /// If you don't provide a KMS key ID, Amazon SageMaker uses the default KMS key
  /// for Amazon S3 for your role's account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">KMS-Managed
  /// Encryption Keys</a> in the <i>Amazon Simple Storage Service Developer
  /// Guide.</i>
  ///
  /// The KMS key policy must grant permission to the IAM role that you specify in
  /// your <a>CreateModel</a> request. For more information, see <a
  /// href="http://docs.aws.amazon.com/kms/latest/developerguide/key-policies.html">Using
  /// Key Policies in AWS KMS</a> in the <i>AWS Key Management Service Developer
  /// Guide</i>.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  TransformOutput({
    @_s.required this.s3OutputPath,
    this.accept,
    this.assembleWith,
    this.kmsKeyId,
  });
  factory TransformOutput.fromJson(Map<String, dynamic> json) =>
      _$TransformOutputFromJson(json);

  Map<String, dynamic> toJson() => _$TransformOutputToJson(this);
}

/// Describes the resources, including ML instance types and ML instance count,
/// to use for transform job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransformResources {
  /// The number of ML compute instances to use in the transform job. For
  /// distributed transform jobs, specify a value greater than 1. The default
  /// value is <code>1</code>.
  @_s.JsonKey(name: 'InstanceCount')
  final int instanceCount;

  /// The ML compute instance type for the transform job. If you are using
  /// built-in algorithms to transform moderately sized datasets, we recommend
  /// using ml.m4.xlarge or <code>ml.m5.large</code> instance types.
  @_s.JsonKey(name: 'InstanceType')
  final TransformInstanceType instanceType;

  /// The AWS Key Management Service (AWS KMS) key that Amazon SageMaker uses to
  /// encrypt model data on the storage volume attached to the ML compute
  /// instance(s) that run the batch transform job. The
  /// <code>VolumeKmsKeyId</code> can be any of the following formats:
  ///
  /// <ul>
  /// <li>
  /// Key ID: <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Key ARN:
  /// <code>arn:aws:kms:us-west-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  /// </li>
  /// <li>
  /// Alias name: <code>alias/ExampleAlias</code>
  /// </li>
  /// <li>
  /// Alias name ARN:
  /// <code>arn:aws:kms:us-west-2:111122223333:alias/ExampleAlias</code>
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'VolumeKmsKeyId')
  final String volumeKmsKeyId;

  TransformResources({
    @_s.required this.instanceCount,
    @_s.required this.instanceType,
    this.volumeKmsKeyId,
  });
  factory TransformResources.fromJson(Map<String, dynamic> json) =>
      _$TransformResourcesFromJson(json);

  Map<String, dynamic> toJson() => _$TransformResourcesToJson(this);
}

/// Describes the S3 data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TransformS3DataSource {
  /// If you choose <code>S3Prefix</code>, <code>S3Uri</code> identifies a key
  /// name prefix. Amazon SageMaker uses all objects with the specified key name
  /// prefix for batch transform.
  ///
  /// If you choose <code>ManifestFile</code>, <code>S3Uri</code> identifies an
  /// object that is a manifest file containing a list of object keys that you
  /// want Amazon SageMaker to use for batch transform.
  ///
  /// The following values are compatible: <code>ManifestFile</code>,
  /// <code>S3Prefix</code>
  ///
  /// The following value is not compatible: <code>AugmentedManifestFile</code>
  @_s.JsonKey(name: 'S3DataType')
  final S3DataType s3DataType;

  /// Depending on the value specified for the <code>S3DataType</code>, identifies
  /// either a key name prefix or a manifest. For example:
  ///
  /// <ul>
  /// <li>
  /// A key name prefix might look like this:
  /// <code>s3://bucketname/exampleprefix</code>.
  /// </li>
  /// <li>
  /// A manifest might look like this:
  /// <code>s3://bucketname/example.manifest</code>
  ///
  /// The manifest is an S3 object which is a JSON file with the following format:
  ///
  /// <code>[ {"prefix": "s3://customer_bucket/some/prefix/"},</code>
  ///
  /// <code>"relative/path/to/custdata-1",</code>
  ///
  /// <code>"relative/path/custdata-2",</code>
  ///
  /// <code>...</code>
  ///
  /// <code>"relative/path/custdata-N"</code>
  ///
  /// <code>]</code>
  ///
  /// The preceding JSON matches the following <code>s3Uris</code>:
  ///
  /// <code>s3://customer_bucket/some/prefix/relative/path/to/custdata-1</code>
  ///
  /// <code>s3://customer_bucket/some/prefix/relative/path/custdata-2</code>
  ///
  /// <code>...</code>
  ///
  /// <code>s3://customer_bucket/some/prefix/relative/path/custdata-N</code>
  ///
  /// The complete set of <code>S3Uris</code> in this manifest constitutes the
  /// input data for the channel for this datasource. The object that each
  /// <code>S3Uris</code> points to must be readable by the IAM role that Amazon
  /// SageMaker uses to perform tasks on your behalf.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  TransformS3DataSource({
    @_s.required this.s3DataType,
    @_s.required this.s3Uri,
  });
  factory TransformS3DataSource.fromJson(Map<String, dynamic> json) =>
      _$TransformS3DataSourceFromJson(json);

  Map<String, dynamic> toJson() => _$TransformS3DataSourceToJson(this);
}

/// The properties of a trial as returned by the <a>Search</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Trial {
  @_s.JsonKey(name: 'CreatedBy')
  final UserContext createdBy;

  /// When the trial was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The name of the trial as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>TrialName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The name of the experiment the trial is part of.
  @_s.JsonKey(name: 'ExperimentName')
  final String experimentName;
  @_s.JsonKey(name: 'LastModifiedBy')
  final UserContext lastModifiedBy;

  /// Who last modified the trial.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;
  @_s.JsonKey(name: 'Source')
  final TrialSource source;

  /// The list of tags that are associated with the trial. You can use
  /// <a>Search</a> API to search on the tags.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The Amazon Resource Name (ARN) of the trial.
  @_s.JsonKey(name: 'TrialArn')
  final String trialArn;

  /// A list of the components associated with the trial. For each component, a
  /// summary of the component's properties is included.
  @_s.JsonKey(name: 'TrialComponentSummaries')
  final List<TrialComponentSimpleSummary> trialComponentSummaries;

  /// The name of the trial.
  @_s.JsonKey(name: 'TrialName')
  final String trialName;

  Trial({
    this.createdBy,
    this.creationTime,
    this.displayName,
    this.experimentName,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.source,
    this.tags,
    this.trialArn,
    this.trialComponentSummaries,
    this.trialName,
  });
  factory Trial.fromJson(Map<String, dynamic> json) => _$TrialFromJson(json);
}

/// The properties of a trial component as returned by the <a>Search</a> API.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialComponent {
  @_s.JsonKey(name: 'CreatedBy')
  final UserContext createdBy;

  /// When the component was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The name of the component as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>TrialComponentName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// When the component ended.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// The input artifacts of the component.
  @_s.JsonKey(name: 'InputArtifacts')
  final Map<String, TrialComponentArtifact> inputArtifacts;
  @_s.JsonKey(name: 'LastModifiedBy')
  final UserContext lastModifiedBy;

  /// When the component was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The metrics for the component.
  @_s.JsonKey(name: 'Metrics')
  final List<TrialComponentMetricSummary> metrics;

  /// The output artifacts of the component.
  @_s.JsonKey(name: 'OutputArtifacts')
  final Map<String, TrialComponentArtifact> outputArtifacts;

  /// The hyperparameters of the component.
  @_s.JsonKey(name: 'Parameters')
  final Map<String, TrialComponentParameterValue> parameters;

  /// An array of the parents of the component. A parent is a trial the component
  /// is associated with and the experiment the trial is part of. A component
  /// might not have any parents.
  @_s.JsonKey(name: 'Parents')
  final List<Parent> parents;

  /// The Amazon Resource Name (ARN) and job type of the source of the component.
  @_s.JsonKey(name: 'Source')
  final TrialComponentSource source;

  /// Details of the source of the component.
  @_s.JsonKey(name: 'SourceDetail')
  final TrialComponentSourceDetail sourceDetail;

  /// When the component started.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;
  @_s.JsonKey(name: 'Status')
  final TrialComponentStatus status;

  /// The list of tags that are associated with the component. You can use
  /// <a>Search</a> API to search on the tags.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  /// The Amazon Resource Name (ARN) of the trial component.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  /// The name of the trial component.
  @_s.JsonKey(name: 'TrialComponentName')
  final String trialComponentName;

  TrialComponent({
    this.createdBy,
    this.creationTime,
    this.displayName,
    this.endTime,
    this.inputArtifacts,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.metrics,
    this.outputArtifacts,
    this.parameters,
    this.parents,
    this.source,
    this.sourceDetail,
    this.startTime,
    this.status,
    this.tags,
    this.trialComponentArn,
    this.trialComponentName,
  });
  factory TrialComponent.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentFromJson(json);
}

/// Represents an input or output artifact of a trial component. You specify
/// <code>TrialComponentArtifact</code> as part of the
/// <code>InputArtifacts</code> and <code>OutputArtifacts</code> parameters in
/// the <a>CreateTrialComponent</a> request.
///
/// Examples of input artifacts are datasets, algorithms, hyperparameters,
/// source code, and instance types. Examples of output artifacts are metrics,
/// snapshots, logs, and images.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrialComponentArtifact {
  /// The location of the artifact.
  @_s.JsonKey(name: 'Value')
  final String value;

  /// The media type of the artifact, which indicates the type of data in the
  /// artifact file. The media type consists of a <i>type</i> and a <i>subtype</i>
  /// concatenated with a slash (/) character, for example, text/csv, image/jpeg,
  /// and s3/uri. The type specifies the category of the media. The subtype
  /// specifies the kind of data.
  @_s.JsonKey(name: 'MediaType')
  final String mediaType;

  TrialComponentArtifact({
    @_s.required this.value,
    this.mediaType,
  });
  factory TrialComponentArtifact.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentArtifactFromJson(json);

  Map<String, dynamic> toJson() => _$TrialComponentArtifactToJson(this);
}

/// A summary of the metrics of a trial component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialComponentMetricSummary {
  /// The average value of the metric.
  @_s.JsonKey(name: 'Avg')
  final double avg;

  /// The number of samples used to generate the metric.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// The most recent value of the metric.
  @_s.JsonKey(name: 'Last')
  final double last;

  /// The maximum value of the metric.
  @_s.JsonKey(name: 'Max')
  final double max;

  /// The name of the metric.
  @_s.JsonKey(name: 'MetricName')
  final String metricName;

  /// The minimum value of the metric.
  @_s.JsonKey(name: 'Min')
  final double min;

  /// The Amazon Resource Name (ARN) of the source.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// The standard deviation of the metric.
  @_s.JsonKey(name: 'StdDev')
  final double stdDev;

  /// When the metric was last updated.
  @_s.JsonKey(name: 'TimeStamp', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime timeStamp;

  TrialComponentMetricSummary({
    this.avg,
    this.count,
    this.last,
    this.max,
    this.metricName,
    this.min,
    this.sourceArn,
    this.stdDev,
    this.timeStamp,
  });
  factory TrialComponentMetricSummary.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentMetricSummaryFromJson(json);
}

/// The value of a hyperparameter. Only one of <code>NumberValue</code> or
/// <code>StringValue</code> can be specified.
///
/// This object is specified in the <a>CreateTrialComponent</a> request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrialComponentParameterValue {
  /// The numeric value of a numeric hyperparameter. If you specify a value for
  /// this parameter, you can't specify the <code>StringValue</code> parameter.
  @_s.JsonKey(name: 'NumberValue')
  final double numberValue;

  /// The string value of a categorical hyperparameter. If you specify a value for
  /// this parameter, you can't specify the <code>NumberValue</code> parameter.
  @_s.JsonKey(name: 'StringValue')
  final String stringValue;

  TrialComponentParameterValue({
    this.numberValue,
    this.stringValue,
  });
  factory TrialComponentParameterValue.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentParameterValueFromJson(json);

  Map<String, dynamic> toJson() => _$TrialComponentParameterValueToJson(this);
}

enum TrialComponentPrimaryStatus {
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Stopping')
  stopping,
  @_s.JsonValue('Stopped')
  stopped,
}

/// A short summary of a trial component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialComponentSimpleSummary {
  @_s.JsonKey(name: 'CreatedBy')
  final UserContext createdBy;

  /// When the component was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the trial component.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  /// The name of the trial component.
  @_s.JsonKey(name: 'TrialComponentName')
  final String trialComponentName;
  @_s.JsonKey(name: 'TrialComponentSource')
  final TrialComponentSource trialComponentSource;

  TrialComponentSimpleSummary({
    this.createdBy,
    this.creationTime,
    this.trialComponentArn,
    this.trialComponentName,
    this.trialComponentSource,
  });
  factory TrialComponentSimpleSummary.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentSimpleSummaryFromJson(json);
}

/// The Amazon Resource Name (ARN) and job type of the source of a trial
/// component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialComponentSource {
  /// The source ARN.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// The source job type.
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  TrialComponentSource({
    @_s.required this.sourceArn,
    this.sourceType,
  });
  factory TrialComponentSource.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentSourceFromJson(json);
}

/// Detailed information about the source of a trial component. Either
/// <code>ProcessingJob</code> or <code>TrainingJob</code> is returned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialComponentSourceDetail {
  /// Information about a processing job that's the source of a trial component.
  @_s.JsonKey(name: 'ProcessingJob')
  final ProcessingJob processingJob;

  /// The Amazon Resource Name (ARN) of the source.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// Information about a training job that's the source of a trial component.
  @_s.JsonKey(name: 'TrainingJob')
  final TrainingJob trainingJob;

  TrialComponentSourceDetail({
    this.processingJob,
    this.sourceArn,
    this.trainingJob,
  });
  factory TrialComponentSourceDetail.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentSourceDetailFromJson(json);
}

/// The status of the trial component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TrialComponentStatus {
  /// If the component failed, a message describing why.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The status of the trial component.
  @_s.JsonKey(name: 'PrimaryStatus')
  final TrialComponentPrimaryStatus primaryStatus;

  TrialComponentStatus({
    this.message,
    this.primaryStatus,
  });
  factory TrialComponentStatus.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentStatusFromJson(json);

  Map<String, dynamic> toJson() => _$TrialComponentStatusToJson(this);
}

/// A summary of the properties of a trial component. To get all the properties,
/// call the <a>DescribeTrialComponent</a> API and provide the
/// <code>TrialComponentName</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialComponentSummary {
  /// Who created the component.
  @_s.JsonKey(name: 'CreatedBy')
  final UserContext createdBy;

  /// When the component was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The name of the component as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>TrialComponentName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// When the component ended.
  @_s.JsonKey(name: 'EndTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime endTime;

  /// Who last modified the component.
  @_s.JsonKey(name: 'LastModifiedBy')
  final UserContext lastModifiedBy;

  /// When the component was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// When the component started.
  @_s.JsonKey(name: 'StartTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime startTime;

  /// The status of the component. States include:
  ///
  /// <ul>
  /// <li>
  /// InProgress
  /// </li>
  /// <li>
  /// Completed
  /// </li>
  /// <li>
  /// Failed
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Status')
  final TrialComponentStatus status;

  /// The ARN of the trial component.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  /// The name of the trial component.
  @_s.JsonKey(name: 'TrialComponentName')
  final String trialComponentName;
  @_s.JsonKey(name: 'TrialComponentSource')
  final TrialComponentSource trialComponentSource;

  TrialComponentSummary({
    this.createdBy,
    this.creationTime,
    this.displayName,
    this.endTime,
    this.lastModifiedBy,
    this.lastModifiedTime,
    this.startTime,
    this.status,
    this.trialComponentArn,
    this.trialComponentName,
    this.trialComponentSource,
  });
  factory TrialComponentSummary.fromJson(Map<String, dynamic> json) =>
      _$TrialComponentSummaryFromJson(json);
}

/// The source of the trial.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialSource {
  /// The Amazon Resource Name (ARN) of the source.
  @_s.JsonKey(name: 'SourceArn')
  final String sourceArn;

  /// The source job type.
  @_s.JsonKey(name: 'SourceType')
  final String sourceType;

  TrialSource({
    @_s.required this.sourceArn,
    this.sourceType,
  });
  factory TrialSource.fromJson(Map<String, dynamic> json) =>
      _$TrialSourceFromJson(json);
}

/// A summary of the properties of a trial. To get the complete set of
/// properties, call the <a>DescribeTrial</a> API and provide the
/// <code>TrialName</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TrialSummary {
  /// When the trial was created.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The name of the trial as displayed. If <code>DisplayName</code> isn't
  /// specified, <code>TrialName</code> is displayed.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// When the trial was last modified.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The Amazon Resource Name (ARN) of the trial.
  @_s.JsonKey(name: 'TrialArn')
  final String trialArn;

  /// The name of the trial.
  @_s.JsonKey(name: 'TrialName')
  final String trialName;
  @_s.JsonKey(name: 'TrialSource')
  final TrialSource trialSource;

  TrialSummary({
    this.creationTime,
    this.displayName,
    this.lastModifiedTime,
    this.trialArn,
    this.trialName,
    this.trialSource,
  });
  factory TrialSummary.fromJson(Map<String, dynamic> json) =>
      _$TrialSummaryFromJson(json);
}

/// The job completion criteria.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TuningJobCompletionCriteria {
  /// The objective metric's value.
  @_s.JsonKey(name: 'TargetObjectiveMetricValue')
  final double targetObjectiveMetricValue;

  TuningJobCompletionCriteria({
    @_s.required this.targetObjectiveMetricValue,
  });
  factory TuningJobCompletionCriteria.fromJson(Map<String, dynamic> json) =>
      _$TuningJobCompletionCriteriaFromJson(json);

  Map<String, dynamic> toJson() => _$TuningJobCompletionCriteriaToJson(this);
}

/// Represents an amount of money in United States dollars/
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class USD {
  /// The fractional portion, in cents, of the amount.
  @_s.JsonKey(name: 'Cents')
  final int cents;

  /// The whole number of dollars in the amount.
  @_s.JsonKey(name: 'Dollars')
  final int dollars;

  /// Fractions of a cent, in tenths.
  @_s.JsonKey(name: 'TenthFractionsOfACent')
  final int tenthFractionsOfACent;

  USD({
    this.cents,
    this.dollars,
    this.tenthFractionsOfACent,
  });
  factory USD.fromJson(Map<String, dynamic> json) => _$USDFromJson(json);

  Map<String, dynamic> toJson() => _$USDToJson(this);
}

/// Provided configuration information for the worker UI for a labeling job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UiConfig {
  /// The Amazon S3 bucket location of the UI template. For more information about
  /// the contents of a UI template, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-custom-templates-step2.html">
  /// Creating Your Custom Labeling Task Template</a>.
  @_s.JsonKey(name: 'UiTemplateS3Uri')
  final String uiTemplateS3Uri;

  UiConfig({
    @_s.required this.uiTemplateS3Uri,
  });
  factory UiConfig.fromJson(Map<String, dynamic> json) =>
      _$UiConfigFromJson(json);

  Map<String, dynamic> toJson() => _$UiConfigToJson(this);
}

/// The Liquid template for the worker user interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UiTemplate {
  /// The content of the Liquid template for the worker user interface.
  @_s.JsonKey(name: 'Content')
  final String content;

  UiTemplate({
    @_s.required this.content,
  });
  Map<String, dynamic> toJson() => _$UiTemplateToJson(this);
}

/// Container for user interface template information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UiTemplateInfo {
  /// The SHA-256 digest of the contents of the template.
  @_s.JsonKey(name: 'ContentSha256')
  final String contentSha256;

  /// The URL for the user interface template.
  @_s.JsonKey(name: 'Url')
  final String url;

  UiTemplateInfo({
    this.contentSha256,
    this.url,
  });
  factory UiTemplateInfo.fromJson(Map<String, dynamic> json) =>
      _$UiTemplateInfoFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateCodeRepositoryOutput {
  /// The ARN of the Git repository.
  @_s.JsonKey(name: 'CodeRepositoryArn')
  final String codeRepositoryArn;

  UpdateCodeRepositoryOutput({
    @_s.required this.codeRepositoryArn,
  });
  factory UpdateCodeRepositoryOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateCodeRepositoryOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDomainResponse {
  /// The domain Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'DomainArn')
  final String domainArn;

  UpdateDomainResponse({
    this.domainArn,
  });
  factory UpdateDomainResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDomainResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEndpointOutput {
  /// The Amazon Resource Name (ARN) of the endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  UpdateEndpointOutput({
    @_s.required this.endpointArn,
  });
  factory UpdateEndpointOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateEndpointOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateEndpointWeightsAndCapacitiesOutput {
  /// The Amazon Resource Name (ARN) of the updated endpoint.
  @_s.JsonKey(name: 'EndpointArn')
  final String endpointArn;

  UpdateEndpointWeightsAndCapacitiesOutput({
    @_s.required this.endpointArn,
  });
  factory UpdateEndpointWeightsAndCapacitiesOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateEndpointWeightsAndCapacitiesOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateExperimentResponse {
  /// The Amazon Resource Name (ARN) of the experiment.
  @_s.JsonKey(name: 'ExperimentArn')
  final String experimentArn;

  UpdateExperimentResponse({
    this.experimentArn,
  });
  factory UpdateExperimentResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateExperimentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateMonitoringScheduleResponse {
  /// The Amazon Resource Name (ARN) of the monitoring schedule.
  @_s.JsonKey(name: 'MonitoringScheduleArn')
  final String monitoringScheduleArn;

  UpdateMonitoringScheduleResponse({
    @_s.required this.monitoringScheduleArn,
  });
  factory UpdateMonitoringScheduleResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateMonitoringScheduleResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNotebookInstanceLifecycleConfigOutput {
  UpdateNotebookInstanceLifecycleConfigOutput();
  factory UpdateNotebookInstanceLifecycleConfigOutput.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateNotebookInstanceLifecycleConfigOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateNotebookInstanceOutput {
  UpdateNotebookInstanceOutput();
  factory UpdateNotebookInstanceOutput.fromJson(Map<String, dynamic> json) =>
      _$UpdateNotebookInstanceOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTrialComponentResponse {
  /// The Amazon Resource Name (ARN) of the trial component.
  @_s.JsonKey(name: 'TrialComponentArn')
  final String trialComponentArn;

  UpdateTrialComponentResponse({
    this.trialComponentArn,
  });
  factory UpdateTrialComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTrialComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateTrialResponse {
  /// The Amazon Resource Name (ARN) of the trial.
  @_s.JsonKey(name: 'TrialArn')
  final String trialArn;

  UpdateTrialResponse({
    this.trialArn,
  });
  factory UpdateTrialResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateTrialResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserProfileResponse {
  /// The user profile Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'UserProfileArn')
  final String userProfileArn;

  UpdateUserProfileResponse({
    this.userProfileArn,
  });
  factory UpdateUserProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserProfileResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWorkforceResponse {
  /// A single private workforce, which is automatically created when you create
  /// your first private work team. You can create one private work force in each
  /// AWS Region. By default, any workforce-related API operation used in a
  /// specific region will apply to the workforce created in that region. To learn
  /// how to create a private workforce, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html">Create
  /// a Private Workforce</a>.
  @_s.JsonKey(name: 'Workforce')
  final Workforce workforce;

  UpdateWorkforceResponse({
    @_s.required this.workforce,
  });
  factory UpdateWorkforceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorkforceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWorkteamResponse {
  /// A <code>Workteam</code> object that describes the updated work team.
  @_s.JsonKey(name: 'Workteam')
  final Workteam workteam;

  UpdateWorkteamResponse({
    @_s.required this.workteam,
  });
  factory UpdateWorkteamResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorkteamResponseFromJson(json);
}

/// Information about the user who created or modified an experiment, trial, or
/// trial component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserContext {
  /// The domain associated with the user.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// The Amazon Resource Name (ARN) of the user's profile.
  @_s.JsonKey(name: 'UserProfileArn')
  final String userProfileArn;

  /// The name of the user's profile.
  @_s.JsonKey(name: 'UserProfileName')
  final String userProfileName;

  UserContext({
    this.domainId,
    this.userProfileArn,
    this.userProfileName,
  });
  factory UserContext.fromJson(Map<String, dynamic> json) =>
      _$UserContextFromJson(json);
}

/// The user profile details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserProfileDetails {
  /// The creation time.
  @_s.JsonKey(name: 'CreationTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime creationTime;

  /// The domain ID.
  @_s.JsonKey(name: 'DomainId')
  final String domainId;

  /// The last modified time.
  @_s.JsonKey(
      name: 'LastModifiedTime', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastModifiedTime;

  /// The status.
  @_s.JsonKey(name: 'Status')
  final UserProfileStatus status;

  /// The user profile name.
  @_s.JsonKey(name: 'UserProfileName')
  final String userProfileName;

  UserProfileDetails({
    this.creationTime,
    this.domainId,
    this.lastModifiedTime,
    this.status,
    this.userProfileName,
  });
  factory UserProfileDetails.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDetailsFromJson(json);
}

enum UserProfileSortKey {
  @_s.JsonValue('CreationTime')
  creationTime,
  @_s.JsonValue('LastModifiedTime')
  lastModifiedTime,
}

enum UserProfileStatus {
  @_s.JsonValue('Deleting')
  deleting,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('InService')
  inService,
  @_s.JsonValue('Pending')
  pending,
}

/// A collection of settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserSettings {
  /// The execution role for the user.
  @_s.JsonKey(name: 'ExecutionRole')
  final String executionRole;

  /// The Jupyter server's app settings.
  @_s.JsonKey(name: 'JupyterServerAppSettings')
  final JupyterServerAppSettings jupyterServerAppSettings;

  /// The kernel gateway app settings.
  @_s.JsonKey(name: 'KernelGatewayAppSettings')
  final KernelGatewayAppSettings kernelGatewayAppSettings;

  /// The security groups.
  @_s.JsonKey(name: 'SecurityGroups')
  final List<String> securityGroups;

  /// The sharing settings.
  @_s.JsonKey(name: 'SharingSettings')
  final SharingSettings sharingSettings;

  /// The TensorBoard app settings.
  @_s.JsonKey(name: 'TensorBoardAppSettings')
  final TensorBoardAppSettings tensorBoardAppSettings;

  UserSettings({
    this.executionRole,
    this.jupyterServerAppSettings,
    this.kernelGatewayAppSettings,
    this.securityGroups,
    this.sharingSettings,
    this.tensorBoardAppSettings,
  });
  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

/// Specifies a production variant property type for an Endpoint.
///
/// If you are updating an endpoint with the
/// <a>UpdateEndpointInput$RetainAllVariantProperties</a> option set to
/// <code>true</code>, the <code>VariantProperty</code> objects listed in
/// <a>UpdateEndpointInput$ExcludeRetainedVariantProperties</a> override the
/// existing variant properties of the endpoint.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class VariantProperty {
  /// The type of variant property. The supported values are:
  ///
  /// <ul>
  /// <li>
  /// <code>DesiredInstanceCount</code>: Overrides the existing variant instance
  /// counts using the <a>ProductionVariant$InitialInstanceCount</a> values in the
  /// <a>CreateEndpointConfigInput$ProductionVariants</a>.
  /// </li>
  /// <li>
  /// <code>DesiredWeight</code>: Overrides the existing variant weights using the
  /// <a>ProductionVariant$InitialVariantWeight</a> values in the
  /// <a>CreateEndpointConfigInput$ProductionVariants</a>.
  /// </li>
  /// <li>
  /// <code>DataCaptureConfig</code>: (Not currently supported.)
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'VariantPropertyType')
  final VariantPropertyType variantPropertyType;

  VariantProperty({
    @_s.required this.variantPropertyType,
  });
  Map<String, dynamic> toJson() => _$VariantPropertyToJson(this);
}

enum VariantPropertyType {
  @_s.JsonValue('DesiredInstanceCount')
  desiredInstanceCount,
  @_s.JsonValue('DesiredWeight')
  desiredWeight,
  @_s.JsonValue('DataCaptureConfig')
  dataCaptureConfig,
}

/// Specifies a VPC that your training jobs and hosted models have access to.
/// Control access to and from your training and model containers by configuring
/// the VPC. For more information, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/host-vpc.html">Protect
/// Endpoints by Using an Amazon Virtual Private Cloud</a> and <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/train-vpc.html">Protect
/// Training Jobs by Using an Amazon Virtual Private Cloud</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VpcConfig {
  /// The VPC security group IDs, in the form sg-xxxxxxxx. Specify the security
  /// groups for the VPC that is specified in the <code>Subnets</code> field.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// The ID of the subnets in the VPC to which you want to connect your training
  /// job or model. For information about the availability of specific instance
  /// types, see <a
  /// href="https://docs.aws.amazon.com/sagemaker/latest/dg/instance-types-az.html">Supported
  /// Instance Types and Availability Zones</a>.
  @_s.JsonKey(name: 'Subnets')
  final List<String> subnets;

  VpcConfig({
    @_s.required this.securityGroupIds,
    @_s.required this.subnets,
  });
  factory VpcConfig.fromJson(Map<String, dynamic> json) =>
      _$VpcConfigFromJson(json);

  Map<String, dynamic> toJson() => _$VpcConfigToJson(this);
}

/// A single private workforce, which is automatically created when you create
/// your first private work team. You can create one private work force in each
/// AWS Region. By default, any workforce-related API operation used in a
/// specific region will apply to the workforce created in that region. To learn
/// how to create a private workforce, see <a
/// href="https://docs.aws.amazon.com/sagemaker/latest/dg/sms-workforce-create-private.html">Create
/// a Private Workforce</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Workforce {
  /// The Amazon Resource Name (ARN) of the private workforce.
  @_s.JsonKey(name: 'WorkforceArn')
  final String workforceArn;

  /// The name of the private workforce whose access you want to restrict.
  /// <code>WorkforceName</code> is automatically set to <code>default</code> when
  /// a workforce is created and cannot be modified.
  @_s.JsonKey(name: 'WorkforceName')
  final String workforceName;

  /// The most recent date that was used to successfully add one or more IP
  /// address ranges (<a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>)
  /// to a private workforce's allow list.
  @_s.JsonKey(
      name: 'LastUpdatedDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastUpdatedDate;

  /// A list of one to four IP address ranges (<a
  /// href="https://docs.aws.amazon.com/vpc/latest/userguide/VPC_Subnets.html">CIDRs</a>)
  /// to be added to the workforce allow list.
  @_s.JsonKey(name: 'SourceIpConfig')
  final SourceIpConfig sourceIpConfig;

  Workforce({
    @_s.required this.workforceArn,
    @_s.required this.workforceName,
    this.lastUpdatedDate,
    this.sourceIpConfig,
  });
  factory Workforce.fromJson(Map<String, dynamic> json) =>
      _$WorkforceFromJson(json);
}

/// Provides details about a labeling work team.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Workteam {
  /// A description of the work team.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The Amazon Cognito user groups that make up the work team.
  @_s.JsonKey(name: 'MemberDefinitions')
  final List<MemberDefinition> memberDefinitions;

  /// The Amazon Resource Name (ARN) that identifies the work team.
  @_s.JsonKey(name: 'WorkteamArn')
  final String workteamArn;

  /// The name of the work team.
  @_s.JsonKey(name: 'WorkteamName')
  final String workteamName;

  /// The date and time that the work team was created (timestamp).
  @_s.JsonKey(name: 'CreateDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime createDate;

  /// The date and time that the work team was last updated (timestamp).
  @_s.JsonKey(
      name: 'LastUpdatedDate', fromJson: unixFromJson, toJson: unixToJson)
  final DateTime lastUpdatedDate;

  /// Configures SNS notifications of available or expiring work items for work
  /// teams.
  @_s.JsonKey(name: 'NotificationConfiguration')
  final NotificationConfiguration notificationConfiguration;

  /// The Amazon Marketplace identifier for a vendor's work team.
  @_s.JsonKey(name: 'ProductListingIds')
  final List<String> productListingIds;

  /// The URI of the labeling job's user interface. Workers open this URI to start
  /// labeling your data objects.
  @_s.JsonKey(name: 'SubDomain')
  final String subDomain;

  Workteam({
    @_s.required this.description,
    @_s.required this.memberDefinitions,
    @_s.required this.workteamArn,
    @_s.required this.workteamName,
    this.createDate,
    this.lastUpdatedDate,
    this.notificationConfiguration,
    this.productListingIds,
    this.subDomain,
  });
  factory Workteam.fromJson(Map<String, dynamic> json) =>
      _$WorkteamFromJson(json);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ResourceInUse extends _s.GenericAwsException {
  ResourceInUse({String type, String message})
      : super(type: type, code: 'ResourceInUse', message: message);
}

class ResourceLimitExceeded extends _s.GenericAwsException {
  ResourceLimitExceeded({String type, String message})
      : super(type: type, code: 'ResourceLimitExceeded', message: message);
}

class ResourceNotFound extends _s.GenericAwsException {
  ResourceNotFound({String type, String message})
      : super(type: type, code: 'ResourceNotFound', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ResourceInUse': (type, message) =>
      ResourceInUse(type: type, message: message),
  'ResourceLimitExceeded': (type, message) =>
      ResourceLimitExceeded(type: type, message: message),
  'ResourceNotFound': (type, message) =>
      ResourceNotFound(type: type, message: message),
};
