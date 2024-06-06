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

/// EC2 Image Builder is a fully managed Amazon Web Services service that makes
/// it easier to automate the creation, management, and deployment of
/// customized, secure, and up-to-date "golden" server images that are
/// pre-installed and pre-configured with software and settings to meet specific
/// IT standards.
class Imagebuilder {
  final _s.RestJsonProtocol _protocol;
  Imagebuilder({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'imagebuilder',
            signingName: 'imagebuilder',
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

  /// CancelImageCreation cancels the creation of Image. This operation can only
  /// be used on images in a non-terminal state.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [imageBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the image that you want to cancel
  /// creation for.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  Future<CancelImageCreationResponse> cancelImageCreation({
    required String imageBuildVersionArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'imageBuildVersionArn': imageBuildVersionArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CancelImageCreation',
      exceptionFnMap: _exceptionFns,
    );
    return CancelImageCreationResponse.fromJson(response);
  }

  /// Cancel a specific image lifecycle policy runtime instance.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [lifecycleExecutionId] :
  /// Identifies the specific runtime instance of the image lifecycle to cancel.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  Future<CancelLifecycleExecutionResponse> cancelLifecycleExecution({
    required String lifecycleExecutionId,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'lifecycleExecutionId': lifecycleExecutionId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CancelLifecycleExecution',
      exceptionFnMap: _exceptionFns,
    );
    return CancelLifecycleExecutionResponse.fromJson(response);
  }

  /// Creates a new component that can be used to build, validate, test, and
  /// assess your image. The component is based on a YAML document that you
  /// specify using exactly one of the following methods:
  ///
  /// <ul>
  /// <li>
  /// Inline, using the <code>data</code> property in the request body.
  /// </li>
  /// <li>
  /// A URL that points to a YAML document file stored in Amazon S3, using the
  /// <code>uri</code> property in the request body.
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [InvalidVersionNumberException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// The name of the component.
  ///
  /// Parameter [platform] :
  /// The operating system platform of the component.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the component. This version follows the semantic
  /// version syntax.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or
  /// 1073741823 for each node. Image Builder automatically assigns the build
  /// number to the fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example,
  /// you might choose a software version pattern, such as 1.0.0, or a date,
  /// such as 2021.01.01.
  /// </note>
  ///
  /// Parameter [changeDescription] :
  /// The change description of the component. Describes what change has been
  /// made in this version, or what makes this version different from other
  /// versions of the component.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [data] :
  /// Component <code>data</code> contains inline YAML document content for the
  /// component. Alternatively, you can specify the <code>uri</code> of a YAML
  /// document file stored in Amazon S3. However, you cannot specify both
  /// properties.
  ///
  /// Parameter [description] :
  /// Describes the contents of the component.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key that is used to encrypt this component.
  ///
  /// Parameter [supportedOsVersions] :
  /// The operating system (OS) version supported by the component. If the OS
  /// information is available, a prefix match is performed against the base
  /// image OS version during image recipe creation.
  ///
  /// Parameter [tags] :
  /// The tags that apply to the component.
  ///
  /// Parameter [uri] :
  /// The <code>uri</code> of a YAML component document file. This must be an S3
  /// URL (<code>s3://bucket/key</code>), and the requester must have permission
  /// to access the S3 bucket it points to. If you use Amazon S3, you can
  /// specify component content up to your service quota.
  ///
  /// Alternatively, you can specify the YAML document inline, using the
  /// component <code>data</code> property. You cannot specify both properties.
  Future<CreateComponentResponse> createComponent({
    required String name,
    required Platform platform,
    required String semanticVersion,
    String? changeDescription,
    String? clientToken,
    String? data,
    String? description,
    String? kmsKeyId,
    List<String>? supportedOsVersions,
    Map<String, String>? tags,
    String? uri,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'platform': platform.toValue(),
      'semanticVersion': semanticVersion,
      if (changeDescription != null) 'changeDescription': changeDescription,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (data != null) 'data': data,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (supportedOsVersions != null)
        'supportedOsVersions': supportedOsVersions,
      if (tags != null) 'tags': tags,
      if (uri != null) 'uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateComponent',
      exceptionFnMap: _exceptionFns,
    );
    return CreateComponentResponse.fromJson(response);
  }

  /// Creates a new container recipe. Container recipes define how images are
  /// configured, tested, and assessed.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [InvalidVersionNumberException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [components] :
  /// Components for build and test that are included in the container recipe.
  /// Recipes require a minimum of one build component, and can have a maximum
  /// of 20 build and test components in any combination.
  ///
  /// Parameter [containerType] :
  /// The type of container to create.
  ///
  /// Parameter [name] :
  /// The name of the container recipe.
  ///
  /// Parameter [parentImage] :
  /// The base image for the container recipe.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the container recipe. This version follows the
  /// semantic version syntax.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or
  /// 1073741823 for each node. Image Builder automatically assigns the build
  /// number to the fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example,
  /// you might choose a software version pattern, such as 1.0.0, or a date,
  /// such as 2021.01.01.
  /// </note>
  ///
  /// Parameter [targetRepository] :
  /// The destination repository for the container image.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// The description of the container recipe.
  ///
  /// Parameter [dockerfileTemplateData] :
  /// The Dockerfile template used to build your image as an inline data blob.
  ///
  /// Parameter [dockerfileTemplateUri] :
  /// The Amazon S3 URI for the Dockerfile that will be used to build your
  /// container image.
  ///
  /// Parameter [imageOsVersionOverride] :
  /// Specifies the operating system version for the base image.
  ///
  /// Parameter [instanceConfiguration] :
  /// A group of options that can be used to configure an instance for building
  /// and testing container images.
  ///
  /// Parameter [kmsKeyId] :
  /// Identifies which KMS key is used to encrypt the container image.
  ///
  /// Parameter [platformOverride] :
  /// Specifies the operating system platform when you use a custom base image.
  ///
  /// Parameter [tags] :
  /// Tags that are attached to the container recipe.
  ///
  /// Parameter [workingDirectory] :
  /// The working directory for use during build and test workflows.
  Future<CreateContainerRecipeResponse> createContainerRecipe({
    required List<ComponentConfiguration> components,
    required ContainerType containerType,
    required String name,
    required String parentImage,
    required String semanticVersion,
    required TargetContainerRepository targetRepository,
    String? clientToken,
    String? description,
    String? dockerfileTemplateData,
    String? dockerfileTemplateUri,
    String? imageOsVersionOverride,
    InstanceConfiguration? instanceConfiguration,
    String? kmsKeyId,
    Platform? platformOverride,
    Map<String, String>? tags,
    String? workingDirectory,
  }) async {
    final $payload = <String, dynamic>{
      'components': components,
      'containerType': containerType.toValue(),
      'name': name,
      'parentImage': parentImage,
      'semanticVersion': semanticVersion,
      'targetRepository': targetRepository,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (dockerfileTemplateData != null)
        'dockerfileTemplateData': dockerfileTemplateData,
      if (dockerfileTemplateUri != null)
        'dockerfileTemplateUri': dockerfileTemplateUri,
      if (imageOsVersionOverride != null)
        'imageOsVersionOverride': imageOsVersionOverride,
      if (instanceConfiguration != null)
        'instanceConfiguration': instanceConfiguration,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (platformOverride != null)
        'platformOverride': platformOverride.toValue(),
      if (tags != null) 'tags': tags,
      if (workingDirectory != null) 'workingDirectory': workingDirectory,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateContainerRecipe',
      exceptionFnMap: _exceptionFns,
    );
    return CreateContainerRecipeResponse.fromJson(response);
  }

  /// Creates a new distribution configuration. Distribution configurations
  /// define and configure the outputs of your pipeline.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [distributions] :
  /// The distributions of the distribution configuration.
  ///
  /// Parameter [name] :
  /// The name of the distribution configuration.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// The description of the distribution configuration.
  ///
  /// Parameter [tags] :
  /// The tags of the distribution configuration.
  Future<CreateDistributionConfigurationResponse>
      createDistributionConfiguration({
    required List<Distribution> distributions,
    required String name,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'distributions': distributions,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateDistributionConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDistributionConfigurationResponse.fromJson(response);
  }

  /// Creates a new image. This request will create a new image along with all
  /// of the configured output resources defined in the distribution
  /// configuration. You must specify exactly one recipe for your image, using
  /// either a ContainerRecipeArn or an ImageRecipeArn.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// defines the environment in which your image will be built and tested.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [containerRecipeArn] :
  /// The Amazon Resource Name (ARN) of the container recipe that defines how
  /// images are configured and tested.
  ///
  /// Parameter [distributionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the distribution configuration that
  /// defines and configures the outputs of your pipeline.
  ///
  /// Parameter [enhancedImageMetadataEnabled] :
  /// Collects additional information about the image being created, including
  /// the operating system (OS) version and package list. This information is
  /// used to enhance the overall experience of using EC2 Image Builder. Enabled
  /// by default.
  ///
  /// Parameter [executionRole] :
  /// The name or Amazon Resource Name (ARN) for the IAM role you create that
  /// grants Image Builder access to perform workflow actions.
  ///
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe that defines how images
  /// are configured, tested, and assessed.
  ///
  /// Parameter [imageScanningConfiguration] :
  /// Contains settings for vulnerability scans.
  ///
  /// Parameter [imageTestsConfiguration] :
  /// The image tests configuration of the image.
  ///
  /// Parameter [tags] :
  /// The tags of the image.
  ///
  /// Parameter [workflows] :
  /// Contains an array of workflow configuration objects.
  Future<CreateImageResponse> createImage({
    required String infrastructureConfigurationArn,
    String? clientToken,
    String? containerRecipeArn,
    String? distributionConfigurationArn,
    bool? enhancedImageMetadataEnabled,
    String? executionRole,
    String? imageRecipeArn,
    ImageScanningConfiguration? imageScanningConfiguration,
    ImageTestsConfiguration? imageTestsConfiguration,
    Map<String, String>? tags,
    List<WorkflowConfiguration>? workflows,
  }) async {
    final $payload = <String, dynamic>{
      'infrastructureConfigurationArn': infrastructureConfigurationArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (enhancedImageMetadataEnabled != null)
        'enhancedImageMetadataEnabled': enhancedImageMetadataEnabled,
      if (executionRole != null) 'executionRole': executionRole,
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (imageScanningConfiguration != null)
        'imageScanningConfiguration': imageScanningConfiguration,
      if (imageTestsConfiguration != null)
        'imageTestsConfiguration': imageTestsConfiguration,
      if (tags != null) 'tags': tags,
      if (workflows != null) 'workflows': workflows,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateImage',
      exceptionFnMap: _exceptionFns,
    );
    return CreateImageResponse.fromJson(response);
  }

  /// Creates a new image pipeline. Image pipelines enable you to automate the
  /// creation and distribution of images.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// will be used to build images created by this image pipeline.
  ///
  /// Parameter [name] :
  /// The name of the image pipeline.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [containerRecipeArn] :
  /// The Amazon Resource Name (ARN) of the container recipe that is used to
  /// configure images created by this container pipeline.
  ///
  /// Parameter [description] :
  /// The description of the image pipeline.
  ///
  /// Parameter [distributionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the distribution configuration that will
  /// be used to configure and distribute images created by this image pipeline.
  ///
  /// Parameter [enhancedImageMetadataEnabled] :
  /// Collects additional information about the image being created, including
  /// the operating system (OS) version and package list. This information is
  /// used to enhance the overall experience of using EC2 Image Builder. Enabled
  /// by default.
  ///
  /// Parameter [executionRole] :
  /// The name or Amazon Resource Name (ARN) for the IAM role you create that
  /// grants Image Builder access to perform workflow actions.
  ///
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe that will be used to
  /// configure images created by this image pipeline.
  ///
  /// Parameter [imageScanningConfiguration] :
  /// Contains settings for vulnerability scans.
  ///
  /// Parameter [imageTestsConfiguration] :
  /// The image test configuration of the image pipeline.
  ///
  /// Parameter [schedule] :
  /// The schedule of the image pipeline.
  ///
  /// Parameter [status] :
  /// The status of the image pipeline.
  ///
  /// Parameter [tags] :
  /// The tags of the image pipeline.
  ///
  /// Parameter [workflows] :
  /// Contains an array of workflow configuration objects.
  Future<CreateImagePipelineResponse> createImagePipeline({
    required String infrastructureConfigurationArn,
    required String name,
    String? clientToken,
    String? containerRecipeArn,
    String? description,
    String? distributionConfigurationArn,
    bool? enhancedImageMetadataEnabled,
    String? executionRole,
    String? imageRecipeArn,
    ImageScanningConfiguration? imageScanningConfiguration,
    ImageTestsConfiguration? imageTestsConfiguration,
    Schedule? schedule,
    PipelineStatus? status,
    Map<String, String>? tags,
    List<WorkflowConfiguration>? workflows,
  }) async {
    final $payload = <String, dynamic>{
      'infrastructureConfigurationArn': infrastructureConfigurationArn,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (description != null) 'description': description,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (enhancedImageMetadataEnabled != null)
        'enhancedImageMetadataEnabled': enhancedImageMetadataEnabled,
      if (executionRole != null) 'executionRole': executionRole,
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (imageScanningConfiguration != null)
        'imageScanningConfiguration': imageScanningConfiguration,
      if (imageTestsConfiguration != null)
        'imageTestsConfiguration': imageTestsConfiguration,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (workflows != null) 'workflows': workflows,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateImagePipeline',
      exceptionFnMap: _exceptionFns,
    );
    return CreateImagePipelineResponse.fromJson(response);
  }

  /// Creates a new image recipe. Image recipes define how images are
  /// configured, tested, and assessed.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [InvalidVersionNumberException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [components] :
  /// The components included in the image recipe.
  ///
  /// Parameter [name] :
  /// The name of the image recipe.
  ///
  /// Parameter [parentImage] :
  /// The base image of the image recipe. The value of the string can be the ARN
  /// of the base image or an AMI ID. The format for the ARN follows this
  /// example:
  /// <code>arn:aws:imagebuilder:us-west-2:aws:image/windows-server-2016-english-full-base-x86/x.x.x</code>.
  /// You can provide the specific version that you want to use, or you can use
  /// a wildcard in all of the fields. If you enter an AMI ID for the string
  /// value, you must have access to the AMI, and the AMI must be in the same
  /// Region in which you are using Image Builder.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the image recipe. This version follows the
  /// semantic version syntax.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or
  /// 1073741823 for each node. Image Builder automatically assigns the build
  /// number to the fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example,
  /// you might choose a software version pattern, such as 1.0.0, or a date,
  /// such as 2021.01.01.
  /// </note>
  ///
  /// Parameter [additionalInstanceConfiguration] :
  /// Specify additional settings and launch scripts for your build instances.
  ///
  /// Parameter [blockDeviceMappings] :
  /// The block device mappings of the image recipe.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// The description of the image recipe.
  ///
  /// Parameter [tags] :
  /// The tags of the image recipe.
  ///
  /// Parameter [workingDirectory] :
  /// The working directory used during build and test workflows.
  Future<CreateImageRecipeResponse> createImageRecipe({
    required List<ComponentConfiguration> components,
    required String name,
    required String parentImage,
    required String semanticVersion,
    AdditionalInstanceConfiguration? additionalInstanceConfiguration,
    List<InstanceBlockDeviceMapping>? blockDeviceMappings,
    String? clientToken,
    String? description,
    Map<String, String>? tags,
    String? workingDirectory,
  }) async {
    final $payload = <String, dynamic>{
      'components': components,
      'name': name,
      'parentImage': parentImage,
      'semanticVersion': semanticVersion,
      if (additionalInstanceConfiguration != null)
        'additionalInstanceConfiguration': additionalInstanceConfiguration,
      if (blockDeviceMappings != null)
        'blockDeviceMappings': blockDeviceMappings,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
      if (workingDirectory != null) 'workingDirectory': workingDirectory,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateImageRecipe',
      exceptionFnMap: _exceptionFns,
    );
    return CreateImageRecipeResponse.fromJson(response);
  }

  /// Creates a new infrastructure configuration. An infrastructure
  /// configuration defines the environment in which your image will be built
  /// and tested.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [instanceProfileName] :
  /// The instance profile to associate with the instance used to customize your
  /// Amazon EC2 AMI.
  ///
  /// Parameter [name] :
  /// The name of the infrastructure configuration.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// The description of the infrastructure configuration.
  ///
  /// Parameter [instanceMetadataOptions] :
  /// The instance metadata options that you can set for the HTTP requests that
  /// pipeline builds use to launch EC2 build and test instances.
  ///
  /// Parameter [instanceTypes] :
  /// The instance types of the infrastructure configuration. You can specify
  /// one or more instance types to use for this build. The service will pick
  /// one of these instance types based on availability.
  ///
  /// Parameter [keyPair] :
  /// The key pair of the infrastructure configuration. You can use this to log
  /// on to and debug the instance used to create your image.
  ///
  /// Parameter [logging] :
  /// The logging configuration of the infrastructure configuration.
  ///
  /// Parameter [resourceTags] :
  /// The tags attached to the resource created by Image Builder.
  ///
  /// Parameter [securityGroupIds] :
  /// The security group IDs to associate with the instance used to customize
  /// your Amazon EC2 AMI.
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) for the SNS topic to which we send image
  /// build event notifications.
  /// <note>
  /// EC2 Image Builder is unable to send notifications to SNS topics that are
  /// encrypted using keys from other accounts. The key that is used to encrypt
  /// the SNS topic must reside in the account that the Image Builder service
  /// runs under.
  /// </note>
  ///
  /// Parameter [subnetId] :
  /// The subnet ID in which to place the instance used to customize your Amazon
  /// EC2 AMI.
  ///
  /// Parameter [tags] :
  /// The tags of the infrastructure configuration.
  ///
  /// Parameter [terminateInstanceOnFailure] :
  /// The terminate instance on failure setting of the infrastructure
  /// configuration. Set to false if you want Image Builder to retain the
  /// instance used to configure your AMI if the build or test phase of your
  /// workflow fails.
  Future<CreateInfrastructureConfigurationResponse>
      createInfrastructureConfiguration({
    required String instanceProfileName,
    required String name,
    String? clientToken,
    String? description,
    InstanceMetadataOptions? instanceMetadataOptions,
    List<String>? instanceTypes,
    String? keyPair,
    Logging? logging,
    Map<String, String>? resourceTags,
    List<String>? securityGroupIds,
    String? snsTopicArn,
    String? subnetId,
    Map<String, String>? tags,
    bool? terminateInstanceOnFailure,
  }) async {
    final $payload = <String, dynamic>{
      'instanceProfileName': instanceProfileName,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (instanceMetadataOptions != null)
        'instanceMetadataOptions': instanceMetadataOptions,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (keyPair != null) 'keyPair': keyPair,
      if (logging != null) 'logging': logging,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (snsTopicArn != null) 'snsTopicArn': snsTopicArn,
      if (subnetId != null) 'subnetId': subnetId,
      if (tags != null) 'tags': tags,
      if (terminateInstanceOnFailure != null)
        'terminateInstanceOnFailure': terminateInstanceOnFailure,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateInfrastructureConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateInfrastructureConfigurationResponse.fromJson(response);
  }

  /// Create a lifecycle policy resource.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [executionRole] :
  /// The name or Amazon Resource Name (ARN) for the IAM role you create that
  /// grants Image Builder access to run lifecycle actions.
  ///
  /// Parameter [name] :
  /// The name of the lifecycle policy to create.
  ///
  /// Parameter [policyDetails] :
  /// Configuration details for the lifecycle policy rules.
  ///
  /// Parameter [resourceSelection] :
  /// Selection criteria for the resources that the lifecycle policy applies to.
  ///
  /// Parameter [resourceType] :
  /// The type of Image Builder resource that the lifecycle policy applies to.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// Optional description for the lifecycle policy.
  ///
  /// Parameter [status] :
  /// Indicates whether the lifecycle policy resource is enabled.
  ///
  /// Parameter [tags] :
  /// Tags to apply to the lifecycle policy resource.
  Future<CreateLifecyclePolicyResponse> createLifecyclePolicy({
    required String executionRole,
    required String name,
    required List<LifecyclePolicyDetail> policyDetails,
    required LifecyclePolicyResourceSelection resourceSelection,
    required LifecyclePolicyResourceType resourceType,
    String? clientToken,
    String? description,
    LifecyclePolicyStatus? status,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'executionRole': executionRole,
      'name': name,
      'policyDetails': policyDetails,
      'resourceSelection': resourceSelection,
      'resourceType': resourceType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateLifecyclePolicy',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLifecyclePolicyResponse.fromJson(response);
  }

  /// Create a new workflow or a new version of an existing workflow.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [InvalidVersionNumberException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterCombinationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [name] :
  /// The name of the workflow to create.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of this workflow resource. The semantic version
  /// syntax adheres to the following rules.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or
  /// 1073741823 for each node. Image Builder automatically assigns the build
  /// number to the fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example,
  /// you might choose a software version pattern, such as 1.0.0, or a date,
  /// such as 2021.01.01.
  /// </note>
  ///
  /// Parameter [type] :
  /// The phase in the image build process for which the workflow resource is
  /// responsible.
  ///
  /// Parameter [changeDescription] :
  /// Describes what change has been made in this version of the workflow, or
  /// what makes this version different from other versions of the workflow.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [data] :
  /// Contains the UTF-8 encoded YAML document content for the workflow.
  /// Alternatively, you can specify the <code>uri</code> of a YAML document
  /// file stored in Amazon S3. However, you cannot specify both properties.
  ///
  /// Parameter [description] :
  /// Describes the workflow.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key that is used to encrypt this workflow resource.
  ///
  /// Parameter [tags] :
  /// Tags that apply to the workflow resource.
  ///
  /// Parameter [uri] :
  /// The <code>uri</code> of a YAML component document file. This must be an S3
  /// URL (<code>s3://bucket/key</code>), and the requester must have permission
  /// to access the S3 bucket it points to. If you use Amazon S3, you can
  /// specify component content up to your service quota.
  ///
  /// Alternatively, you can specify the YAML document inline, using the
  /// component <code>data</code> property. You cannot specify both properties.
  Future<CreateWorkflowResponse> createWorkflow({
    required String name,
    required String semanticVersion,
    required WorkflowType type,
    String? changeDescription,
    String? clientToken,
    String? data,
    String? description,
    String? kmsKeyId,
    Map<String, String>? tags,
    String? uri,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'semanticVersion': semanticVersion,
      'type': type.toValue(),
      if (changeDescription != null) 'changeDescription': changeDescription,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (data != null) 'data': data,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (tags != null) 'tags': tags,
      if (uri != null) 'uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CreateWorkflow',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkflowResponse.fromJson(response);
  }

  /// Deletes a component build version.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [componentBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the component build version to delete.
  Future<DeleteComponentResponse> deleteComponent({
    required String componentBuildVersionArn,
  }) async {
    final $query = <String, List<String>>{
      'componentBuildVersionArn': [componentBuildVersionArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteComponent',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteComponentResponse.fromJson(response);
  }

  /// Deletes a container recipe.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [containerRecipeArn] :
  /// The Amazon Resource Name (ARN) of the container recipe to delete.
  Future<DeleteContainerRecipeResponse> deleteContainerRecipe({
    required String containerRecipeArn,
  }) async {
    final $query = <String, List<String>>{
      'containerRecipeArn': [containerRecipeArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteContainerRecipe',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteContainerRecipeResponse.fromJson(response);
  }

  /// Deletes a distribution configuration.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [distributionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the distribution configuration to
  /// delete.
  Future<DeleteDistributionConfigurationResponse>
      deleteDistributionConfiguration({
    required String distributionConfigurationArn,
  }) async {
    final $query = <String, List<String>>{
      'distributionConfigurationArn': [distributionConfigurationArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteDistributionConfiguration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDistributionConfigurationResponse.fromJson(response);
  }

  /// Deletes an Image Builder image resource. This does not delete any EC2 AMIs
  /// or ECR container images that are created during the image build process.
  /// You must clean those up separately, using the appropriate Amazon EC2 or
  /// Amazon ECR console actions, or API or CLI commands.
  ///
  /// <ul>
  /// <li>
  /// To deregister an EC2 Linux AMI, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/deregister-ami.html">Deregister
  /// your Linux AMI</a> in the <i> <i>Amazon EC2 User Guide</i> </i>.
  /// </li>
  /// <li>
  /// To deregister an EC2 Windows AMI, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/deregister-ami.html">Deregister
  /// your Windows AMI</a> in the <i> <i>Amazon EC2 Windows Guide</i> </i>.
  /// </li>
  /// <li>
  /// To delete a container image from Amazon ECR, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/delete_image.html">Deleting
  /// an image</a> in the <i>Amazon ECR User Guide</i>.
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [imageBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the Image Builder image resource to
  /// delete.
  Future<DeleteImageResponse> deleteImage({
    required String imageBuildVersionArn,
  }) async {
    final $query = <String, List<String>>{
      'imageBuildVersionArn': [imageBuildVersionArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteImage',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteImageResponse.fromJson(response);
  }

  /// Deletes an image pipeline.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [imagePipelineArn] :
  /// The Amazon Resource Name (ARN) of the image pipeline to delete.
  Future<DeleteImagePipelineResponse> deleteImagePipeline({
    required String imagePipelineArn,
  }) async {
    final $query = <String, List<String>>{
      'imagePipelineArn': [imagePipelineArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteImagePipeline',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteImagePipelineResponse.fromJson(response);
  }

  /// Deletes an image recipe.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe to delete.
  Future<DeleteImageRecipeResponse> deleteImageRecipe({
    required String imageRecipeArn,
  }) async {
    final $query = <String, List<String>>{
      'imageRecipeArn': [imageRecipeArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteImageRecipe',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteImageRecipeResponse.fromJson(response);
  }

  /// Deletes an infrastructure configuration.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration to
  /// delete.
  Future<DeleteInfrastructureConfigurationResponse>
      deleteInfrastructureConfiguration({
    required String infrastructureConfigurationArn,
  }) async {
    final $query = <String, List<String>>{
      'infrastructureConfigurationArn': [infrastructureConfigurationArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteInfrastructureConfiguration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteInfrastructureConfigurationResponse.fromJson(response);
  }

  /// Delete the specified lifecycle policy resource.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [InvalidRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [lifecyclePolicyArn] :
  /// The Amazon Resource Name (ARN) of the lifecycle policy resource to delete.
  Future<DeleteLifecyclePolicyResponse> deleteLifecyclePolicy({
    required String lifecyclePolicyArn,
  }) async {
    final $query = <String, List<String>>{
      'lifecyclePolicyArn': [lifecyclePolicyArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteLifecyclePolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLifecyclePolicyResponse.fromJson(response);
  }

  /// Deletes a specific workflow resource.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceDependencyException].
  ///
  /// Parameter [workflowBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the workflow resource to delete.
  Future<DeleteWorkflowResponse> deleteWorkflow({
    required String workflowBuildVersionArn,
  }) async {
    final $query = <String, List<String>>{
      'workflowBuildVersionArn': [workflowBuildVersionArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/DeleteWorkflow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorkflowResponse.fromJson(response);
  }

  /// Gets a component object.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [componentBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the component that you want to get.
  /// Regex requires the suffix <code>/\d+$</code>.
  Future<GetComponentResponse> getComponent({
    required String componentBuildVersionArn,
  }) async {
    final $query = <String, List<String>>{
      'componentBuildVersionArn': [componentBuildVersionArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetComponent',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetComponentResponse.fromJson(response);
  }

  /// Gets a component policy.
  ///
  /// May throw [ServiceException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [componentArn] :
  /// The Amazon Resource Name (ARN) of the component whose policy you want to
  /// retrieve.
  Future<GetComponentPolicyResponse> getComponentPolicy({
    required String componentArn,
  }) async {
    final $query = <String, List<String>>{
      'componentArn': [componentArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetComponentPolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetComponentPolicyResponse.fromJson(response);
  }

  /// Retrieves a container recipe.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [containerRecipeArn] :
  /// The Amazon Resource Name (ARN) of the container recipe to retrieve.
  Future<GetContainerRecipeResponse> getContainerRecipe({
    required String containerRecipeArn,
  }) async {
    final $query = <String, List<String>>{
      'containerRecipeArn': [containerRecipeArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetContainerRecipe',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetContainerRecipeResponse.fromJson(response);
  }

  /// Retrieves the policy for a container recipe.
  ///
  /// May throw [ServiceException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [containerRecipeArn] :
  /// The Amazon Resource Name (ARN) of the container recipe for the policy
  /// being requested.
  Future<GetContainerRecipePolicyResponse> getContainerRecipePolicy({
    required String containerRecipeArn,
  }) async {
    final $query = <String, List<String>>{
      'containerRecipeArn': [containerRecipeArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetContainerRecipePolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetContainerRecipePolicyResponse.fromJson(response);
  }

  /// Gets a distribution configuration.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [distributionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the distribution configuration that you
  /// want to retrieve.
  Future<GetDistributionConfigurationResponse> getDistributionConfiguration({
    required String distributionConfigurationArn,
  }) async {
    final $query = <String, List<String>>{
      'distributionConfigurationArn': [distributionConfigurationArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetDistributionConfiguration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDistributionConfigurationResponse.fromJson(response);
  }

  /// Gets an image.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the image that you want to get.
  Future<GetImageResponse> getImage({
    required String imageBuildVersionArn,
  }) async {
    final $query = <String, List<String>>{
      'imageBuildVersionArn': [imageBuildVersionArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetImage',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetImageResponse.fromJson(response);
  }

  /// Gets an image pipeline.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imagePipelineArn] :
  /// The Amazon Resource Name (ARN) of the image pipeline that you want to
  /// retrieve.
  Future<GetImagePipelineResponse> getImagePipeline({
    required String imagePipelineArn,
  }) async {
    final $query = <String, List<String>>{
      'imagePipelineArn': [imagePipelineArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetImagePipeline',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetImagePipelineResponse.fromJson(response);
  }

  /// Gets an image policy.
  ///
  /// May throw [ServiceException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageArn] :
  /// The Amazon Resource Name (ARN) of the image whose policy you want to
  /// retrieve.
  Future<GetImagePolicyResponse> getImagePolicy({
    required String imageArn,
  }) async {
    final $query = <String, List<String>>{
      'imageArn': [imageArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetImagePolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetImagePolicyResponse.fromJson(response);
  }

  /// Gets an image recipe.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe that you want to
  /// retrieve.
  Future<GetImageRecipeResponse> getImageRecipe({
    required String imageRecipeArn,
  }) async {
    final $query = <String, List<String>>{
      'imageRecipeArn': [imageRecipeArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetImageRecipe',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetImageRecipeResponse.fromJson(response);
  }

  /// Gets an image recipe policy.
  ///
  /// May throw [ServiceException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe whose policy you want
  /// to retrieve.
  Future<GetImageRecipePolicyResponse> getImageRecipePolicy({
    required String imageRecipeArn,
  }) async {
    final $query = <String, List<String>>{
      'imageRecipeArn': [imageRecipeArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetImageRecipePolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetImageRecipePolicyResponse.fromJson(response);
  }

  /// Gets an infrastructure configuration.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// you want to retrieve.
  Future<GetInfrastructureConfigurationResponse>
      getInfrastructureConfiguration({
    required String infrastructureConfigurationArn,
  }) async {
    final $query = <String, List<String>>{
      'infrastructureConfigurationArn': [infrastructureConfigurationArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetInfrastructureConfiguration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetInfrastructureConfigurationResponse.fromJson(response);
  }

  /// Get the runtime information that was logged for a specific runtime
  /// instance of the lifecycle policy.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [lifecycleExecutionId] :
  /// Use the unique identifier for a runtime instance of the lifecycle policy
  /// to get runtime details.
  Future<GetLifecycleExecutionResponse> getLifecycleExecution({
    required String lifecycleExecutionId,
  }) async {
    final $query = <String, List<String>>{
      'lifecycleExecutionId': [lifecycleExecutionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetLifecycleExecution',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLifecycleExecutionResponse.fromJson(response);
  }

  /// Get details for the specified image lifecycle policy.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [lifecyclePolicyArn] :
  /// Specifies the Amazon Resource Name (ARN) of the image lifecycle policy
  /// resource to get.
  Future<GetLifecyclePolicyResponse> getLifecyclePolicy({
    required String lifecyclePolicyArn,
  }) async {
    final $query = <String, List<String>>{
      'lifecyclePolicyArn': [lifecyclePolicyArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetLifecyclePolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetLifecyclePolicyResponse.fromJson(response);
  }

  /// Get a workflow resource object.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [workflowBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the workflow resource that you want to
  /// get.
  Future<GetWorkflowResponse> getWorkflow({
    required String workflowBuildVersionArn,
  }) async {
    final $query = <String, List<String>>{
      'workflowBuildVersionArn': [workflowBuildVersionArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetWorkflow',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowResponse.fromJson(response);
  }

  /// Get the runtime information that was logged for a specific runtime
  /// instance of the workflow.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [workflowExecutionId] :
  /// Use the unique identifier for a runtime instance of the workflow to get
  /// runtime details.
  Future<GetWorkflowExecutionResponse> getWorkflowExecution({
    required String workflowExecutionId,
  }) async {
    final $query = <String, List<String>>{
      'workflowExecutionId': [workflowExecutionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetWorkflowExecution',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowExecutionResponse.fromJson(response);
  }

  /// Get the runtime information that was logged for a specific runtime
  /// instance of the workflow step.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [stepExecutionId] :
  /// Use the unique identifier for a specific runtime instance of the workflow
  /// step to get runtime details for that step.
  Future<GetWorkflowStepExecutionResponse> getWorkflowStepExecution({
    required String stepExecutionId,
  }) async {
    final $query = <String, List<String>>{
      'stepExecutionId': [stepExecutionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/GetWorkflowStepExecution',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkflowStepExecutionResponse.fromJson(response);
  }

  /// Imports a component and transforms its data into a component document.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [InvalidVersionNumberException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [format] :
  /// The format of the resource that you want to import as a component.
  ///
  /// Parameter [name] :
  /// The name of the component.
  ///
  /// Parameter [platform] :
  /// The platform of the component.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the component. This version follows the semantic
  /// version syntax.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Filtering:</b> With semantic versioning, you have the flexibility to
  /// use wildcards (x) to specify the most recent versions or nodes when
  /// selecting the base image or components for your recipe. When you use a
  /// wildcard in any node, all nodes to the right of the first wildcard must
  /// also be wildcards.
  /// </note>
  ///
  /// Parameter [type] :
  /// The type of the component denotes whether the component is used to build
  /// the image, or only to test it.
  ///
  /// Parameter [changeDescription] :
  /// The change description of the component. This description indicates the
  /// change that has been made in this version, or what makes this version
  /// different from other versions of the component.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [data] :
  /// The data of the component. Used to specify the data inline. Either
  /// <code>data</code> or <code>uri</code> can be used to specify the data
  /// within the component.
  ///
  /// Parameter [description] :
  /// The description of the component. Describes the contents of the component.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key that should be used to encrypt this component.
  ///
  /// Parameter [tags] :
  /// The tags of the component.
  ///
  /// Parameter [uri] :
  /// The uri of the component. Must be an Amazon S3 URL and the requester must
  /// have permission to access the Amazon S3 bucket. If you use Amazon S3, you
  /// can specify component content up to your service quota. Either
  /// <code>data</code> or <code>uri</code> can be used to specify the data
  /// within the component.
  Future<ImportComponentResponse> importComponent({
    required ComponentFormat format,
    required String name,
    required Platform platform,
    required String semanticVersion,
    required ComponentType type,
    String? changeDescription,
    String? clientToken,
    String? data,
    String? description,
    String? kmsKeyId,
    Map<String, String>? tags,
    String? uri,
  }) async {
    final $payload = <String, dynamic>{
      'format': format.toValue(),
      'name': name,
      'platform': platform.toValue(),
      'semanticVersion': semanticVersion,
      'type': type.toValue(),
      if (changeDescription != null) 'changeDescription': changeDescription,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (data != null) 'data': data,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (tags != null) 'tags': tags,
      if (uri != null) 'uri': uri,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/ImportComponent',
      exceptionFnMap: _exceptionFns,
    );
    return ImportComponentResponse.fromJson(response);
  }

  /// When you export your virtual machine (VM) from its virtualization
  /// environment, that process creates a set of one or more disk container
  /// files that act as snapshots of your VM’s environment, settings, and data.
  /// The Amazon EC2 API <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ImportImage.html">ImportImage</a>
  /// action uses those files to import your VM and create an AMI. To import
  /// using the CLI command, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/ec2/import-image.html">import-image</a>
  ///
  /// You can reference the task ID from the VM import to pull in the AMI that
  /// the import created as the base image for your Image Builder recipe.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [name] :
  /// The name of the base image that is created by the import process.
  ///
  /// Parameter [platform] :
  /// The operating system platform for the imported VM.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version to attach to the base image that was created during
  /// the import process. This version follows the semantic version syntax.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or
  /// 1073741823 for each node. Image Builder automatically assigns the build
  /// number to the fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example,
  /// you might choose a software version pattern, such as 1.0.0, or a date,
  /// such as 2021.01.01.
  /// </note>
  ///
  /// Parameter [vmImportTaskId] :
  /// The <code>importTaskId</code> (API) or <code>ImportTaskId</code> (CLI)
  /// from the Amazon EC2 VM import process. Image Builder retrieves information
  /// from the import process to pull in the AMI that is created from the VM
  /// source as the base image for your recipe.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// The description for the base image that is created by the import process.
  ///
  /// Parameter [osVersion] :
  /// The operating system version for the imported VM.
  ///
  /// Parameter [tags] :
  /// Tags that are attached to the import resources.
  Future<ImportVmImageResponse> importVmImage({
    required String name,
    required Platform platform,
    required String semanticVersion,
    required String vmImportTaskId,
    String? clientToken,
    String? description,
    String? osVersion,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'platform': platform.toValue(),
      'semanticVersion': semanticVersion,
      'vmImportTaskId': vmImportTaskId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (osVersion != null) 'osVersion': osVersion,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/ImportVmImage',
      exceptionFnMap: _exceptionFns,
    );
    return ImportVmImageResponse.fromJson(response);
  }

  /// Returns the list of component build versions for the specified semantic
  /// version.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Filtering:</b> With semantic versioning, you have the flexibility to
  /// use wildcards (x) to specify the most recent versions or nodes when
  /// selecting the base image or components for your recipe. When you use a
  /// wildcard in any node, all nodes to the right of the first wildcard must
  /// also be wildcards.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [componentVersionArn] :
  /// The component version Amazon Resource Name (ARN) whose versions you want
  /// to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListComponentBuildVersionsResponse> listComponentBuildVersions({
    required String componentVersionArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'componentVersionArn': componentVersionArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListComponentBuildVersions',
      exceptionFnMap: _exceptionFns,
    );
    return ListComponentBuildVersionsResponse.fromJson(response);
  }

  /// Returns the list of components that can be filtered by name, or by using
  /// the listed <code>filters</code> to streamline results. Newly created
  /// components can take up to two minutes to appear in the ListComponents API
  /// Results.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Filtering:</b> With semantic versioning, you have the flexibility to
  /// use wildcards (x) to specify the most recent versions or nodes when
  /// selecting the base image or components for your recipe. When you use a
  /// wildcard in any node, all nodes to the right of the first wildcard must
  /// also be wildcards.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [byName] :
  /// Returns the list of components for the specified name.
  ///
  /// Parameter [filters] :
  /// Use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>description</code>
  /// </li>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>platform</code>
  /// </li>
  /// <li>
  /// <code>supportedOsVersion</code>
  /// </li>
  /// <li>
  /// <code>type</code>
  /// </li>
  /// <li>
  /// <code>version</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  ///
  /// Parameter [owner] :
  /// Filters results based on the type of owner for the component. By default,
  /// this request returns a list of components that your account owns. To see
  /// results for other types of owners, you can specify components that Amazon
  /// manages, third party components, or components that other accounts have
  /// shared with you.
  Future<ListComponentsResponse> listComponents({
    bool? byName,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    Ownership? owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (byName != null) 'byName': byName,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (owner != null) 'owner': owner.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListComponents',
      exceptionFnMap: _exceptionFns,
    );
    return ListComponentsResponse.fromJson(response);
  }

  /// Returns a list of container recipes.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>containerType</code>
  /// </li>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>parentImage</code>
  /// </li>
  /// <li>
  /// <code>platform</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  ///
  /// Parameter [owner] :
  /// Returns container recipes belonging to the specified owner, that have been
  /// shared with you. You can omit this field to return container recipes
  /// belonging to your account.
  Future<ListContainerRecipesResponse> listContainerRecipes({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    Ownership? owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (owner != null) 'owner': owner.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListContainerRecipes',
      exceptionFnMap: _exceptionFns,
    );
    return ListContainerRecipesResponse.fromJson(response);
  }

  /// Returns a list of distribution configurations.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// You can filter on <code>name</code> to streamline results.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListDistributionConfigurationsResponse>
      listDistributionConfigurations({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListDistributionConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListDistributionConfigurationsResponse.fromJson(response);
  }

  /// Returns a list of image build versions.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageVersionArn] :
  /// The Amazon Resource Name (ARN) of the image whose build versions you want
  /// to retrieve.
  ///
  /// Parameter [filters] :
  /// Use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>osVersion</code>
  /// </li>
  /// <li>
  /// <code>platform</code>
  /// </li>
  /// <li>
  /// <code>type</code>
  /// </li>
  /// <li>
  /// <code>version</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListImageBuildVersionsResponse> listImageBuildVersions({
    required String imageVersionArn,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'imageVersionArn': imageVersionArn,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImageBuildVersions',
      exceptionFnMap: _exceptionFns,
    );
    return ListImageBuildVersionsResponse.fromJson(response);
  }

  /// List the Packages that are associated with an Image Build Version, as
  /// determined by Amazon Web Services Systems Manager Inventory at build time.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageBuildVersionArn] :
  /// Filter results for the ListImagePackages request by the Image Build
  /// Version ARN
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListImagePackagesResponse> listImagePackages({
    required String imageBuildVersionArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'imageBuildVersionArn': imageBuildVersionArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImagePackages',
      exceptionFnMap: _exceptionFns,
    );
    return ListImagePackagesResponse.fromJson(response);
  }

  /// Returns a list of images created by the specified pipeline.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imagePipelineArn] :
  /// The Amazon Resource Name (ARN) of the image pipeline whose images you want
  /// to view.
  ///
  /// Parameter [filters] :
  /// Use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>version</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListImagePipelineImagesResponse> listImagePipelineImages({
    required String imagePipelineArn,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'imagePipelineArn': imagePipelineArn,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImagePipelineImages',
      exceptionFnMap: _exceptionFns,
    );
    return ListImagePipelineImagesResponse.fromJson(response);
  }

  /// Returns a list of image pipelines.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>description</code>
  /// </li>
  /// <li>
  /// <code>distributionConfigurationArn</code>
  /// </li>
  /// <li>
  /// <code>imageRecipeArn</code>
  /// </li>
  /// <li>
  /// <code>infrastructureConfigurationArn</code>
  /// </li>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>status</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListImagePipelinesResponse> listImagePipelines({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImagePipelines',
      exceptionFnMap: _exceptionFns,
    );
    return ListImagePipelinesResponse.fromJson(response);
  }

  /// Returns a list of image recipes.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>parentImage</code>
  /// </li>
  /// <li>
  /// <code>platform</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  ///
  /// Parameter [owner] :
  /// The owner defines which image recipes you want to list. By default, this
  /// request will only show image recipes owned by your account. You can use
  /// this field to specify if you want to view image recipes owned by yourself,
  /// by Amazon, or those image recipes that have been shared with you by other
  /// customers.
  Future<ListImageRecipesResponse> listImageRecipes({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    Ownership? owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (owner != null) 'owner': owner.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImageRecipes',
      exceptionFnMap: _exceptionFns,
    );
    return ListImageRecipesResponse.fromJson(response);
  }

  /// Returns a list of image scan aggregations for your account. You can filter
  /// by the type of key that Image Builder uses to group results. For example,
  /// if you want to get a list of findings by severity level for one of your
  /// pipelines, you might specify your pipeline with the
  /// <code>imagePipelineArn</code> filter. If you don't specify a filter, Image
  /// Builder returns an aggregation for your account.
  ///
  /// To streamline results, you can use the following filters in your request:
  ///
  /// <ul>
  /// <li>
  /// <code>accountId</code>
  /// </li>
  /// <li>
  /// <code>imageBuildVersionArn</code>
  /// </li>
  /// <li>
  /// <code>imagePipelineArn</code>
  /// </li>
  /// <li>
  /// <code>vulnerabilityId</code>
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListImageScanFindingAggregationsResponse>
      listImageScanFindingAggregations({
    Filter? filter,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filter != null) 'filter': filter,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImageScanFindingAggregations',
      exceptionFnMap: _exceptionFns,
    );
    return ListImageScanFindingAggregationsResponse.fromJson(response);
  }

  /// Returns a list of image scan findings for your account.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// An array of name value pairs that you can use to filter your results. You
  /// can use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>imageBuildVersionArn</code>
  /// </li>
  /// <li>
  /// <code>imagePipelineArn</code>
  /// </li>
  /// <li>
  /// <code>vulnerabilityId</code>
  /// </li>
  /// <li>
  /// <code>severity</code>
  /// </li>
  /// </ul>
  /// If you don't request a filter, then all findings in your account are
  /// listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListImageScanFindingsResponse> listImageScanFindings({
    List<ImageScanFindingsFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImageScanFindings',
      exceptionFnMap: _exceptionFns,
    );
    return ListImageScanFindingsResponse.fromJson(response);
  }

  /// Returns the list of images that you have access to. Newly created images
  /// can take up to two minutes to appear in the ListImages API Results.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [byName] :
  /// Requests a list of images with a specific recipe name.
  ///
  /// Parameter [filters] :
  /// Use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>name</code>
  /// </li>
  /// <li>
  /// <code>osVersion</code>
  /// </li>
  /// <li>
  /// <code>platform</code>
  /// </li>
  /// <li>
  /// <code>type</code>
  /// </li>
  /// <li>
  /// <code>version</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [includeDeprecated] :
  /// Includes deprecated images in the response list.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  ///
  /// Parameter [owner] :
  /// The owner defines which images you want to list. By default, this request
  /// will only show images owned by your account. You can use this field to
  /// specify if you want to view images owned by yourself, by Amazon, or those
  /// images that have been shared with you by other customers.
  Future<ListImagesResponse> listImages({
    bool? byName,
    List<Filter>? filters,
    bool? includeDeprecated,
    int? maxResults,
    String? nextToken,
    Ownership? owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (byName != null) 'byName': byName,
      if (filters != null) 'filters': filters,
      if (includeDeprecated != null) 'includeDeprecated': includeDeprecated,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (owner != null) 'owner': owner.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImages',
      exceptionFnMap: _exceptionFns,
    );
    return ListImagesResponse.fromJson(response);
  }

  /// Returns a list of infrastructure configurations.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// You can filter on <code>name</code> to streamline results.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListInfrastructureConfigurationsResponse>
      listInfrastructureConfigurations({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListInfrastructureConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListInfrastructureConfigurationsResponse.fromJson(response);
  }

  /// List resources that the runtime instance of the image lifecycle identified
  /// for lifecycle actions.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [lifecycleExecutionId] :
  /// Use the unique identifier for a runtime instance of the lifecycle policy
  /// to get runtime details.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  ///
  /// Parameter [parentResourceId] :
  /// You can leave this empty to get a list of Image Builder resources that
  /// were identified for lifecycle actions.
  ///
  /// To get a list of associated resources that are impacted for an individual
  /// resource (the parent), specify its Amazon Resource Name (ARN). Associated
  /// resources are produced from your image and distributed when you run a
  /// build, such as AMIs or container images stored in ECR repositories.
  Future<ListLifecycleExecutionResourcesResponse>
      listLifecycleExecutionResources({
    required String lifecycleExecutionId,
    int? maxResults,
    String? nextToken,
    String? parentResourceId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'lifecycleExecutionId': lifecycleExecutionId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (parentResourceId != null) 'parentResourceId': parentResourceId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListLifecycleExecutionResources',
      exceptionFnMap: _exceptionFns,
    );
    return ListLifecycleExecutionResourcesResponse.fromJson(response);
  }

  /// Get the lifecycle runtime history for the specified resource.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to get a list of
  /// lifecycle runtime instances.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListLifecycleExecutionsResponse> listLifecycleExecutions({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListLifecycleExecutions',
      exceptionFnMap: _exceptionFns,
    );
    return ListLifecycleExecutionsResponse.fromJson(response);
  }

  /// Get a list of lifecycle policies in your Amazon Web Services account.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [filters] :
  /// Streamline results based on one of the following values:
  /// <code>Name</code>, <code>Status</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListLifecyclePoliciesResponse> listLifecyclePolicies({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListLifecyclePolicies',
      exceptionFnMap: _exceptionFns,
    );
    return ListLifecyclePoliciesResponse.fromJson(response);
  }

  /// Returns the list of tags for the specified resource.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags you want to
  /// retrieve.
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

  /// Get a list of workflow steps that are waiting for action for workflows in
  /// your Amazon Web Services account.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListWaitingWorkflowStepsResponse> listWaitingWorkflowSteps({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListWaitingWorkflowSteps',
      exceptionFnMap: _exceptionFns,
    );
    return ListWaitingWorkflowStepsResponse.fromJson(response);
  }

  /// Returns a list of build versions for a specific workflow resource.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [workflowVersionArn] :
  /// The Amazon Resource Name (ARN) of the workflow resource for which to get a
  /// list of build versions.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListWorkflowBuildVersionsResponse> listWorkflowBuildVersions({
    required String workflowVersionArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'workflowVersionArn': workflowVersionArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListWorkflowBuildVersions',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowBuildVersionsResponse.fromJson(response);
  }

  /// Returns a list of workflow runtime instance metadata objects for a
  /// specific image build version.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageBuildVersionArn] :
  /// List all workflow runtime instances for the specified image build version
  /// resource ARN.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListWorkflowExecutionsResponse> listWorkflowExecutions({
    required String imageBuildVersionArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'imageBuildVersionArn': imageBuildVersionArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListWorkflowExecutions',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowExecutionsResponse.fromJson(response);
  }

  /// Returns runtime data for each step in a runtime instance of the workflow
  /// that you specify in the request.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [workflowExecutionId] :
  /// The unique identifier that Image Builder assigned to keep track of runtime
  /// details when it ran the workflow.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListWorkflowStepExecutionsResponse> listWorkflowStepExecutions({
    required String workflowExecutionId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      'workflowExecutionId': workflowExecutionId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListWorkflowStepExecutions',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowStepExecutionsResponse.fromJson(response);
  }

  /// Lists workflow build versions based on filtering parameters.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPaginationTokenException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [byName] :
  /// Specify all or part of the workflow name to streamline results.
  ///
  /// Parameter [filters] :
  /// Used to streamline search results.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  ///
  /// Parameter [owner] :
  /// Used to get a list of workflow build version filtered by the identity of
  /// the creator.
  Future<ListWorkflowsResponse> listWorkflows({
    bool? byName,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    Ownership? owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    final $payload = <String, dynamic>{
      if (byName != null) 'byName': byName,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (owner != null) 'owner': owner.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListWorkflows',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkflowsResponse.fromJson(response);
  }

  /// Applies a policy to a component. We recommend that you call the RAM API <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a>
  /// to share resources. If you call the Image Builder API
  /// <code>PutComponentPolicy</code>, you must also call the RAM API <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a>
  /// in order for the resource to be visible to all principals with whom the
  /// resource is shared.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [componentArn] :
  /// The Amazon Resource Name (ARN) of the component that this policy should be
  /// applied to.
  ///
  /// Parameter [policy] :
  /// The policy to apply.
  Future<PutComponentPolicyResponse> putComponentPolicy({
    required String componentArn,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'componentArn': componentArn,
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/PutComponentPolicy',
      exceptionFnMap: _exceptionFns,
    );
    return PutComponentPolicyResponse.fromJson(response);
  }

  /// Applies a policy to a container image. We recommend that you call the RAM
  /// API CreateResourceShare
  /// (https://docs.aws.amazon.com//ram/latest/APIReference/API_CreateResourceShare.html)
  /// to share resources. If you call the Image Builder API
  /// <code>PutContainerImagePolicy</code>, you must also call the RAM API
  /// PromoteResourceShareCreatedFromPolicy
  /// (https://docs.aws.amazon.com//ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html)
  /// in order for the resource to be visible to all principals with whom the
  /// resource is shared.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [containerRecipeArn] :
  /// The Amazon Resource Name (ARN) of the container recipe that this policy
  /// should be applied to.
  ///
  /// Parameter [policy] :
  /// The policy to apply to the container recipe.
  Future<PutContainerRecipePolicyResponse> putContainerRecipePolicy({
    required String containerRecipeArn,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'containerRecipeArn': containerRecipeArn,
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/PutContainerRecipePolicy',
      exceptionFnMap: _exceptionFns,
    );
    return PutContainerRecipePolicyResponse.fromJson(response);
  }

  /// Applies a policy to an image. We recommend that you call the RAM API <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a>
  /// to share resources. If you call the Image Builder API
  /// <code>PutImagePolicy</code>, you must also call the RAM API <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a>
  /// in order for the resource to be visible to all principals with whom the
  /// resource is shared.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageArn] :
  /// The Amazon Resource Name (ARN) of the image that this policy should be
  /// applied to.
  ///
  /// Parameter [policy] :
  /// The policy to apply.
  Future<PutImagePolicyResponse> putImagePolicy({
    required String imageArn,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'imageArn': imageArn,
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/PutImagePolicy',
      exceptionFnMap: _exceptionFns,
    );
    return PutImagePolicyResponse.fromJson(response);
  }

  /// Applies a policy to an image recipe. We recommend that you call the RAM
  /// API <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html">CreateResourceShare</a>
  /// to share resources. If you call the Image Builder API
  /// <code>PutImageRecipePolicy</code>, you must also call the RAM API <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html">PromoteResourceShareCreatedFromPolicy</a>
  /// in order for the resource to be visible to all principals with whom the
  /// resource is shared.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  ///
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe that this policy should
  /// be applied to.
  ///
  /// Parameter [policy] :
  /// The policy to apply.
  Future<PutImageRecipePolicyResponse> putImageRecipePolicy({
    required String imageRecipeArn,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'imageRecipeArn': imageRecipeArn,
      'policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/PutImageRecipePolicy',
      exceptionFnMap: _exceptionFns,
    );
    return PutImageRecipePolicyResponse.fromJson(response);
  }

  /// Pauses or resumes image creation when the associated workflow runs a
  /// <code>WaitForAction</code> step.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidParameterValueException].
  /// May throw [ServiceUnavailableException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [action] :
  /// The action for the image creation process to take while a workflow
  /// <code>WaitForAction</code> step waits for an asynchronous action to
  /// complete.
  ///
  /// Parameter [imageBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the image build version to send action
  /// for.
  ///
  /// Parameter [stepExecutionId] :
  /// Uniquely identifies the workflow step that sent the step action.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [reason] :
  /// The reason why this action is sent.
  Future<SendWorkflowStepActionResponse> sendWorkflowStepAction({
    required WorkflowStepActionType action,
    required String imageBuildVersionArn,
    required String stepExecutionId,
    String? clientToken,
    String? reason,
  }) async {
    final $payload = <String, dynamic>{
      'action': action.toValue(),
      'imageBuildVersionArn': imageBuildVersionArn,
      'stepExecutionId': stepExecutionId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (reason != null) 'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/SendWorkflowStepAction',
      exceptionFnMap: _exceptionFns,
    );
    return SendWorkflowStepActionResponse.fromJson(response);
  }

  /// Manually triggers a pipeline to create an image.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [imagePipelineArn] :
  /// The Amazon Resource Name (ARN) of the image pipeline that you want to
  /// manually invoke.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  Future<StartImagePipelineExecutionResponse> startImagePipelineExecution({
    required String imagePipelineArn,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'imagePipelineArn': imagePipelineArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/StartImagePipelineExecution',
      exceptionFnMap: _exceptionFns,
    );
    return StartImagePipelineExecutionResponse.fromJson(response);
  }

  /// Begin asynchronous resource state update for lifecycle changes to the
  /// specified image resources.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the Image Builder resource that is updated. The state update
  /// might also impact associated resources.
  ///
  /// Parameter [state] :
  /// Indicates the lifecycle action to take for this request.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [exclusionRules] :
  /// Skip action on the image resource and associated resources if specified
  /// exclusion rules are met.
  ///
  /// Parameter [executionRole] :
  /// The name or Amazon Resource Name (ARN) of the IAM role that’s used to
  /// update image state.
  ///
  /// Parameter [includeResources] :
  /// A list of image resources to update state for.
  ///
  /// Parameter [updateAt] :
  /// The timestamp that indicates when resources are updated by a lifecycle
  /// action.
  Future<StartResourceStateUpdateResponse> startResourceStateUpdate({
    required String resourceArn,
    required ResourceState state,
    String? clientToken,
    ResourceStateUpdateExclusionRules? exclusionRules,
    String? executionRole,
    ResourceStateUpdateIncludeResources? includeResources,
    DateTime? updateAt,
  }) async {
    final $payload = <String, dynamic>{
      'resourceArn': resourceArn,
      'state': state,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (exclusionRules != null) 'exclusionRules': exclusionRules,
      if (executionRole != null) 'executionRole': executionRole,
      if (includeResources != null) 'includeResources': includeResources,
      if (updateAt != null) 'updateAt': unixTimestampToJson(updateAt),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/StartResourceStateUpdate',
      exceptionFnMap: _exceptionFns,
    );
    return StartResourceStateUpdateResponse.fromJson(response);
  }

  /// Adds a tag to a resource.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the resource.
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

  /// Removes a tag from a resource.
  ///
  /// May throw [ServiceException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove from the resource.
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

  /// Updates a new distribution configuration. Distribution configurations
  /// define and configure the outputs of your pipeline.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [distributionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the distribution configuration that you
  /// want to update.
  ///
  /// Parameter [distributions] :
  /// The distributions of the distribution configuration.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// The description of the distribution configuration.
  Future<UpdateDistributionConfigurationResponse>
      updateDistributionConfiguration({
    required String distributionConfigurationArn,
    required List<Distribution> distributions,
    String? clientToken,
    String? description,
  }) async {
    final $payload = <String, dynamic>{
      'distributionConfigurationArn': distributionConfigurationArn,
      'distributions': distributions,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/UpdateDistributionConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDistributionConfigurationResponse.fromJson(response);
  }

  /// Updates an image pipeline. Image pipelines enable you to automate the
  /// creation and distribution of images. You must specify exactly one recipe
  /// for your image, using either a <code>containerRecipeArn</code> or an
  /// <code>imageRecipeArn</code>.
  /// <note>
  /// UpdateImagePipeline does not support selective updates for the pipeline.
  /// You must specify all of the required properties in the update request, not
  /// just the properties that have changed.
  /// </note>
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [imagePipelineArn] :
  /// The Amazon Resource Name (ARN) of the image pipeline that you want to
  /// update.
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// Image Builder uses to build images that this image pipeline has updated.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [containerRecipeArn] :
  /// The Amazon Resource Name (ARN) of the container pipeline to update.
  ///
  /// Parameter [description] :
  /// The description of the image pipeline.
  ///
  /// Parameter [distributionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the distribution configuration that
  /// Image Builder uses to configure and distribute images that this image
  /// pipeline has updated.
  ///
  /// Parameter [enhancedImageMetadataEnabled] :
  /// Collects additional information about the image being created, including
  /// the operating system (OS) version and package list. This information is
  /// used to enhance the overall experience of using EC2 Image Builder. Enabled
  /// by default.
  ///
  /// Parameter [executionRole] :
  /// The name or Amazon Resource Name (ARN) for the IAM role you create that
  /// grants Image Builder access to perform workflow actions.
  ///
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe that will be used to
  /// configure images updated by this image pipeline.
  ///
  /// Parameter [imageScanningConfiguration] :
  /// Contains settings for vulnerability scans.
  ///
  /// Parameter [imageTestsConfiguration] :
  /// The image test configuration of the image pipeline.
  ///
  /// Parameter [schedule] :
  /// The schedule of the image pipeline.
  ///
  /// Parameter [status] :
  /// The status of the image pipeline.
  ///
  /// Parameter [workflows] :
  /// Contains the workflows to run for the pipeline.
  Future<UpdateImagePipelineResponse> updateImagePipeline({
    required String imagePipelineArn,
    required String infrastructureConfigurationArn,
    String? clientToken,
    String? containerRecipeArn,
    String? description,
    String? distributionConfigurationArn,
    bool? enhancedImageMetadataEnabled,
    String? executionRole,
    String? imageRecipeArn,
    ImageScanningConfiguration? imageScanningConfiguration,
    ImageTestsConfiguration? imageTestsConfiguration,
    Schedule? schedule,
    PipelineStatus? status,
    List<WorkflowConfiguration>? workflows,
  }) async {
    final $payload = <String, dynamic>{
      'imagePipelineArn': imagePipelineArn,
      'infrastructureConfigurationArn': infrastructureConfigurationArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (description != null) 'description': description,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (enhancedImageMetadataEnabled != null)
        'enhancedImageMetadataEnabled': enhancedImageMetadataEnabled,
      if (executionRole != null) 'executionRole': executionRole,
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (imageScanningConfiguration != null)
        'imageScanningConfiguration': imageScanningConfiguration,
      if (imageTestsConfiguration != null)
        'imageTestsConfiguration': imageTestsConfiguration,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
      if (workflows != null) 'workflows': workflows,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/UpdateImagePipeline',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateImagePipelineResponse.fromJson(response);
  }

  /// Updates a new infrastructure configuration. An infrastructure
  /// configuration defines the environment in which your image will be built
  /// and tested.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// you want to update.
  ///
  /// Parameter [instanceProfileName] :
  /// The instance profile to associate with the instance used to customize your
  /// Amazon EC2 AMI.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// The description of the infrastructure configuration.
  ///
  /// Parameter [instanceMetadataOptions] :
  /// The instance metadata options that you can set for the HTTP requests that
  /// pipeline builds use to launch EC2 build and test instances. For more
  /// information about instance metadata options, see one of the following
  /// links:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-options.html">Configure
  /// the instance metadata options</a> in the <i> <i>Amazon EC2 User Guide</i>
  /// </i> for Linux instances.
  /// </li>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/configuring-instance-metadata-options.html">Configure
  /// the instance metadata options</a> in the <i> <i>Amazon EC2 Windows
  /// Guide</i> </i> for Windows instances.
  /// </li>
  /// </ul>
  ///
  /// Parameter [instanceTypes] :
  /// The instance types of the infrastructure configuration. You can specify
  /// one or more instance types to use for this build. The service will pick
  /// one of these instance types based on availability.
  ///
  /// Parameter [keyPair] :
  /// The key pair of the infrastructure configuration. You can use this to log
  /// on to and debug the instance used to create your image.
  ///
  /// Parameter [logging] :
  /// The logging configuration of the infrastructure configuration.
  ///
  /// Parameter [resourceTags] :
  /// The tags attached to the resource created by Image Builder.
  ///
  /// Parameter [securityGroupIds] :
  /// The security group IDs to associate with the instance used to customize
  /// your Amazon EC2 AMI.
  ///
  /// Parameter [snsTopicArn] :
  /// The Amazon Resource Name (ARN) for the SNS topic to which we send image
  /// build event notifications.
  /// <note>
  /// EC2 Image Builder is unable to send notifications to SNS topics that are
  /// encrypted using keys from other accounts. The key that is used to encrypt
  /// the SNS topic must reside in the account that the Image Builder service
  /// runs under.
  /// </note>
  ///
  /// Parameter [subnetId] :
  /// The subnet ID to place the instance used to customize your Amazon EC2 AMI
  /// in.
  ///
  /// Parameter [terminateInstanceOnFailure] :
  /// The terminate instance on failure setting of the infrastructure
  /// configuration. Set to false if you want Image Builder to retain the
  /// instance used to configure your AMI if the build or test phase of your
  /// workflow fails.
  Future<UpdateInfrastructureConfigurationResponse>
      updateInfrastructureConfiguration({
    required String infrastructureConfigurationArn,
    required String instanceProfileName,
    String? clientToken,
    String? description,
    InstanceMetadataOptions? instanceMetadataOptions,
    List<String>? instanceTypes,
    String? keyPair,
    Logging? logging,
    Map<String, String>? resourceTags,
    List<String>? securityGroupIds,
    String? snsTopicArn,
    String? subnetId,
    bool? terminateInstanceOnFailure,
  }) async {
    final $payload = <String, dynamic>{
      'infrastructureConfigurationArn': infrastructureConfigurationArn,
      'instanceProfileName': instanceProfileName,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (instanceMetadataOptions != null)
        'instanceMetadataOptions': instanceMetadataOptions,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (keyPair != null) 'keyPair': keyPair,
      if (logging != null) 'logging': logging,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (snsTopicArn != null) 'snsTopicArn': snsTopicArn,
      if (subnetId != null) 'subnetId': subnetId,
      if (terminateInstanceOnFailure != null)
        'terminateInstanceOnFailure': terminateInstanceOnFailure,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/UpdateInfrastructureConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateInfrastructureConfigurationResponse.fromJson(response);
  }

  /// Update the specified lifecycle policy.
  ///
  /// May throw [ServiceException].
  /// May throw [ClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidRequestException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ForbiddenException].
  /// May throw [CallRateLimitExceededException].
  /// May throw [ResourceInUseException].
  /// May throw [InvalidParameterCombinationException].
  ///
  /// Parameter [executionRole] :
  /// The name or Amazon Resource Name (ARN) of the IAM role that Image Builder
  /// uses to update the lifecycle policy.
  ///
  /// Parameter [lifecyclePolicyArn] :
  /// The Amazon Resource Name (ARN) of the lifecycle policy resource.
  ///
  /// Parameter [policyDetails] :
  /// The configuration details for a lifecycle policy resource.
  ///
  /// Parameter [resourceSelection] :
  /// Selection criteria for resources that the lifecycle policy applies to.
  ///
  /// Parameter [resourceType] :
  /// The type of image resource that the lifecycle policy applies to.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure idempotency of the
  /// request. For more information, see <a
  /// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html">Ensuring
  /// idempotency</a> in the <i>Amazon EC2 API Reference</i>.
  ///
  /// Parameter [description] :
  /// Optional description for the lifecycle policy.
  ///
  /// Parameter [status] :
  /// Indicates whether the lifecycle policy resource is enabled.
  Future<UpdateLifecyclePolicyResponse> updateLifecyclePolicy({
    required String executionRole,
    required String lifecyclePolicyArn,
    required List<LifecyclePolicyDetail> policyDetails,
    required LifecyclePolicyResourceSelection resourceSelection,
    required LifecyclePolicyResourceType resourceType,
    String? clientToken,
    String? description,
    LifecyclePolicyStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      'executionRole': executionRole,
      'lifecyclePolicyArn': lifecyclePolicyArn,
      'policyDetails': policyDetails,
      'resourceSelection': resourceSelection,
      'resourceType': resourceType.toValue(),
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/UpdateLifecyclePolicy',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLifecyclePolicyResponse.fromJson(response);
  }
}

/// Contains counts of vulnerability findings from image scans that run when you
/// create new Image Builder images, or build new versions of existing images.
/// The vulnerability counts are grouped by severity level. The counts are
/// aggregated across resources to create the final tally for the account that
/// owns them.
class AccountAggregation {
  /// Identifies the account that owns the aggregated resource findings.
  final String? accountId;

  /// Counts by severity level for medium severity and higher level findings, plus
  /// a total for all of the findings.
  final SeverityCounts? severityCounts;

  AccountAggregation({
    this.accountId,
    this.severityCounts,
  });

  factory AccountAggregation.fromJson(Map<String, dynamic> json) {
    return AccountAggregation(
      accountId: json['accountId'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final severityCounts = this.severityCounts;
    return {
      if (accountId != null) 'accountId': accountId,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// In addition to your infrastructure configuration, these settings provide an
/// extra layer of control over your build instances. You can also specify
/// commands to run on launch for all of your build instances.
///
/// Image Builder does not automatically install the Systems Manager agent on
/// Windows instances. If your base image includes the Systems Manager agent,
/// then the AMI that you create will also include the agent. For Linux
/// instances, if the base image does not already include the Systems Manager
/// agent, Image Builder installs it. For Linux instances where Image Builder
/// installs the Systems Manager agent, you can choose whether to keep it for
/// the AMI that you create.
class AdditionalInstanceConfiguration {
  /// Contains settings for the Systems Manager agent on your build instance.
  final SystemsManagerAgent? systemsManagerAgent;

  /// Use this property to provide commands or a command script to run when you
  /// launch your build instance.
  ///
  /// The userDataOverride property replaces any commands that Image Builder might
  /// have added to ensure that Systems Manager is installed on your Linux build
  /// instance. If you override the user data, make sure that you add commands to
  /// install Systems Manager, if it is not pre-installed on your base image.
  /// <note>
  /// The user data is always base 64 encoded. For example, the following commands
  /// are encoded as
  /// <code>IyEvYmluL2Jhc2gKbWtkaXIgLXAgL3Zhci9iYi8KdG91Y2ggL3Zhci$</code>:
  ///
  /// <i>#!/bin/bash</i>
  ///
  /// mkdir -p /var/bb/
  ///
  /// touch /var
  /// </note>
  final String? userDataOverride;

  AdditionalInstanceConfiguration({
    this.systemsManagerAgent,
    this.userDataOverride,
  });

  factory AdditionalInstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return AdditionalInstanceConfiguration(
      systemsManagerAgent: json['systemsManagerAgent'] != null
          ? SystemsManagerAgent.fromJson(
              json['systemsManagerAgent'] as Map<String, dynamic>)
          : null,
      userDataOverride: json['userDataOverride'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final systemsManagerAgent = this.systemsManagerAgent;
    final userDataOverride = this.userDataOverride;
    return {
      if (systemsManagerAgent != null)
        'systemsManagerAgent': systemsManagerAgent,
      if (userDataOverride != null) 'userDataOverride': userDataOverride,
    };
  }
}

/// Details of an Amazon EC2 AMI.
class Ami {
  /// The account ID of the owner of the AMI.
  final String? accountId;

  /// The description of the Amazon EC2 AMI. Minimum and maximum length are in
  /// characters.
  final String? description;

  /// The AMI ID of the Amazon EC2 AMI.
  final String? image;

  /// The name of the Amazon EC2 AMI.
  final String? name;

  /// The Amazon Web Services Region of the Amazon EC2 AMI.
  final String? region;
  final ImageState? state;

  Ami({
    this.accountId,
    this.description,
    this.image,
    this.name,
    this.region,
    this.state,
  });

  factory Ami.fromJson(Map<String, dynamic> json) {
    return Ami(
      accountId: json['accountId'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      region: json['region'] as String?,
      state: json['state'] != null
          ? ImageState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final description = this.description;
    final image = this.image;
    final name = this.name;
    final region = this.region;
    final state = this.state;
    return {
      if (accountId != null) 'accountId': accountId,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (name != null) 'name': name,
      if (region != null) 'region': region,
      if (state != null) 'state': state,
    };
  }
}

/// Define and configure the output AMIs of the pipeline.
class AmiDistributionConfiguration {
  /// The tags to apply to AMIs distributed to this Region.
  final Map<String, String>? amiTags;

  /// The description of the AMI distribution configuration. Minimum and maximum
  /// length are in characters.
  final String? description;

  /// The KMS key identifier used to encrypt the distributed image.
  final String? kmsKeyId;

  /// Launch permissions can be used to configure which Amazon Web Services
  /// accounts can use the AMI to launch instances.
  final LaunchPermissionConfiguration? launchPermission;

  /// The name of the output AMI.
  final String? name;

  /// The ID of an account to which you want to distribute an image.
  final List<String>? targetAccountIds;

  AmiDistributionConfiguration({
    this.amiTags,
    this.description,
    this.kmsKeyId,
    this.launchPermission,
    this.name,
    this.targetAccountIds,
  });

  factory AmiDistributionConfiguration.fromJson(Map<String, dynamic> json) {
    return AmiDistributionConfiguration(
      amiTags: (json['amiTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      description: json['description'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      launchPermission: json['launchPermission'] != null
          ? LaunchPermissionConfiguration.fromJson(
              json['launchPermission'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      targetAccountIds: (json['targetAccountIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final amiTags = this.amiTags;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final launchPermission = this.launchPermission;
    final name = this.name;
    final targetAccountIds = this.targetAccountIds;
    return {
      if (amiTags != null) 'amiTags': amiTags,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (launchPermission != null) 'launchPermission': launchPermission,
      if (name != null) 'name': name,
      if (targetAccountIds != null) 'targetAccountIds': targetAccountIds,
    };
  }
}

enum BuildType {
  userInitiated,
  scheduled,
  import,
}

extension BuildTypeValueExtension on BuildType {
  String toValue() {
    switch (this) {
      case BuildType.userInitiated:
        return 'USER_INITIATED';
      case BuildType.scheduled:
        return 'SCHEDULED';
      case BuildType.import:
        return 'IMPORT';
    }
  }
}

extension BuildTypeFromString on String {
  BuildType toBuildType() {
    switch (this) {
      case 'USER_INITIATED':
        return BuildType.userInitiated;
      case 'SCHEDULED':
        return BuildType.scheduled;
      case 'IMPORT':
        return BuildType.import;
    }
    throw Exception('$this is not known in enum BuildType');
  }
}

class CancelImageCreationResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The ARN of the image whose creation this request canceled.
  final String? imageBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  CancelImageCreationResponse({
    this.clientToken,
    this.imageBuildVersionArn,
    this.requestId,
  });

  factory CancelImageCreationResponse.fromJson(Map<String, dynamic> json) {
    return CancelImageCreationResponse(
      clientToken: json['clientToken'] as String?,
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class CancelLifecycleExecutionResponse {
  /// The unique identifier for the image lifecycle runtime instance that was
  /// canceled.
  final String? lifecycleExecutionId;

  CancelLifecycleExecutionResponse({
    this.lifecycleExecutionId,
  });

  factory CancelLifecycleExecutionResponse.fromJson(Map<String, dynamic> json) {
    return CancelLifecycleExecutionResponse(
      lifecycleExecutionId: json['lifecycleExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycleExecutionId = this.lifecycleExecutionId;
    return {
      if (lifecycleExecutionId != null)
        'lifecycleExecutionId': lifecycleExecutionId,
    };
  }
}

/// A detailed view of a component.
class Component {
  /// The Amazon Resource Name (ARN) of the component.
  final String? arn;

  /// Describes what change has been made in this version of the component, or
  /// what makes this version different from other versions of the component.
  final String? changeDescription;

  /// Component data contains the YAML document content for the component.
  final String? data;

  /// The date that Image Builder created the component.
  final String? dateCreated;

  /// The description of the component.
  final String? description;

  /// The encryption status of the component.
  final bool? encrypted;

  /// The KMS key identifier used to encrypt the component.
  final String? kmsKeyId;

  /// The name of the component.
  final String? name;

  /// Indicates whether component source is hidden from view in the console, and
  /// from component detail results for API, CLI, or SDK operations.
  final bool? obfuscate;

  /// The owner of the component.
  final String? owner;

  /// Contains parameter details for each of the parameters that the component
  /// document defined for the component.
  final List<ComponentParameterDetail>? parameters;

  /// The operating system platform of the component.
  final Platform? platform;

  /// Contains the name of the publisher if this is a third-party component.
  /// Otherwise, this property is empty.
  final String? publisher;

  /// Describes the current status of the component. This is used for components
  /// that are no longer active.
  final ComponentState? state;

  /// The operating system (OS) version supported by the component. If the OS
  /// information is available, Image Builder performs a prefix match against the
  /// base image OS version during image recipe creation.
  final List<String>? supportedOsVersions;

  /// The tags that apply to the component.
  final Map<String, String>? tags;

  /// The component type specifies whether Image Builder uses the component to
  /// build the image or only to test it.
  final ComponentType? type;

  /// The version of the component.
  final String? version;

  Component({
    this.arn,
    this.changeDescription,
    this.data,
    this.dateCreated,
    this.description,
    this.encrypted,
    this.kmsKeyId,
    this.name,
    this.obfuscate,
    this.owner,
    this.parameters,
    this.platform,
    this.publisher,
    this.state,
    this.supportedOsVersions,
    this.tags,
    this.type,
    this.version,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      arn: json['arn'] as String?,
      changeDescription: json['changeDescription'] as String?,
      data: json['data'] as String?,
      dateCreated: json['dateCreated'] as String?,
      description: json['description'] as String?,
      encrypted: json['encrypted'] as bool?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      obfuscate: json['obfuscate'] as bool?,
      owner: json['owner'] as String?,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ComponentParameterDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      platform: (json['platform'] as String?)?.toPlatform(),
      publisher: json['publisher'] as String?,
      state: json['state'] != null
          ? ComponentState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      supportedOsVersions: (json['supportedOsVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toComponentType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final changeDescription = this.changeDescription;
    final data = this.data;
    final dateCreated = this.dateCreated;
    final description = this.description;
    final encrypted = this.encrypted;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final obfuscate = this.obfuscate;
    final owner = this.owner;
    final parameters = this.parameters;
    final platform = this.platform;
    final publisher = this.publisher;
    final state = this.state;
    final supportedOsVersions = this.supportedOsVersions;
    final tags = this.tags;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (changeDescription != null) 'changeDescription': changeDescription,
      if (data != null) 'data': data,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (description != null) 'description': description,
      if (encrypted != null) 'encrypted': encrypted,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (obfuscate != null) 'obfuscate': obfuscate,
      if (owner != null) 'owner': owner,
      if (parameters != null) 'parameters': parameters,
      if (platform != null) 'platform': platform.toValue(),
      if (publisher != null) 'publisher': publisher,
      if (state != null) 'state': state,
      if (supportedOsVersions != null)
        'supportedOsVersions': supportedOsVersions,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// Configuration details of the component.
class ComponentConfiguration {
  /// The Amazon Resource Name (ARN) of the component.
  final String componentArn;

  /// A group of parameter settings that Image Builder uses to configure the
  /// component for a specific recipe.
  final List<ComponentParameter>? parameters;

  ComponentConfiguration({
    required this.componentArn,
    this.parameters,
  });

  factory ComponentConfiguration.fromJson(Map<String, dynamic> json) {
    return ComponentConfiguration(
      componentArn: json['componentArn'] as String,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final componentArn = this.componentArn;
    final parameters = this.parameters;
    return {
      'componentArn': componentArn,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

enum ComponentFormat {
  shell,
}

extension ComponentFormatValueExtension on ComponentFormat {
  String toValue() {
    switch (this) {
      case ComponentFormat.shell:
        return 'SHELL';
    }
  }
}

extension ComponentFormatFromString on String {
  ComponentFormat toComponentFormat() {
    switch (this) {
      case 'SHELL':
        return ComponentFormat.shell;
    }
    throw Exception('$this is not known in enum ComponentFormat');
  }
}

/// Contains a key/value pair that sets the named component parameter.
class ComponentParameter {
  /// The name of the component parameter to set.
  final String name;

  /// Sets the value for the named component parameter.
  final List<String> value;

  ComponentParameter({
    required this.name,
    required this.value,
  });

  factory ComponentParameter.fromJson(Map<String, dynamic> json) {
    return ComponentParameter(
      name: json['name'] as String,
      value: (json['value'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// Defines a parameter that is used to provide configuration details for the
/// component.
class ComponentParameterDetail {
  /// The name of this input parameter.
  final String name;

  /// The type of input this parameter provides. The currently supported value is
  /// "string".
  final String type;

  /// The default value of this parameter if no input is provided.
  final List<String>? defaultValue;

  /// Describes this parameter.
  final String? description;

  ComponentParameterDetail({
    required this.name,
    required this.type,
    this.defaultValue,
    this.description,
  });

  factory ComponentParameterDetail.fromJson(Map<String, dynamic> json) {
    return ComponentParameterDetail(
      name: json['name'] as String,
      type: json['type'] as String,
      defaultValue: (json['defaultValue'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final defaultValue = this.defaultValue;
    final description = this.description;
    return {
      'name': name,
      'type': type,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
    };
  }
}

/// A group of fields that describe the current status of components.
class ComponentState {
  /// Describes how or why the component changed state.
  final String? reason;

  /// The current state of the component.
  final ComponentStatus? status;

  ComponentState({
    this.reason,
    this.status,
  });

  factory ComponentState.fromJson(Map<String, dynamic> json) {
    return ComponentState(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toComponentStatus(),
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

enum ComponentStatus {
  deprecated,
}

extension ComponentStatusValueExtension on ComponentStatus {
  String toValue() {
    switch (this) {
      case ComponentStatus.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension ComponentStatusFromString on String {
  ComponentStatus toComponentStatus() {
    switch (this) {
      case 'DEPRECATED':
        return ComponentStatus.deprecated;
    }
    throw Exception('$this is not known in enum ComponentStatus');
  }
}

/// A high-level summary of a component.
class ComponentSummary {
  /// The Amazon Resource Name (ARN) of the component.
  final String? arn;

  /// The change description for the current version of the component.
  final String? changeDescription;

  /// The original creation date of the component.
  final String? dateCreated;

  /// The description of the component.
  final String? description;

  /// The name of the component.
  final String? name;

  /// Indicates whether component source is hidden from view in the console, and
  /// from component detail results for API, CLI, or SDK operations.
  final bool? obfuscate;

  /// The owner of the component.
  final String? owner;

  /// The operating system platform of the component.
  final Platform? platform;

  /// Contains the name of the publisher if this is a third-party component.
  /// Otherwise, this property is empty.
  final String? publisher;

  /// Describes the current status of the component.
  final ComponentState? state;

  /// The operating system (OS) version that the component supports. If the OS
  /// information is available, Image Builder performs a prefix match against the
  /// base image OS version during image recipe creation.
  final List<String>? supportedOsVersions;

  /// The tags that apply to the component.
  final Map<String, String>? tags;

  /// The component type specifies whether Image Builder uses the component to
  /// build the image or only to test it.
  final ComponentType? type;

  /// The version of the component.
  final String? version;

  ComponentSummary({
    this.arn,
    this.changeDescription,
    this.dateCreated,
    this.description,
    this.name,
    this.obfuscate,
    this.owner,
    this.platform,
    this.publisher,
    this.state,
    this.supportedOsVersions,
    this.tags,
    this.type,
    this.version,
  });

  factory ComponentSummary.fromJson(Map<String, dynamic> json) {
    return ComponentSummary(
      arn: json['arn'] as String?,
      changeDescription: json['changeDescription'] as String?,
      dateCreated: json['dateCreated'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      obfuscate: json['obfuscate'] as bool?,
      owner: json['owner'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      publisher: json['publisher'] as String?,
      state: json['state'] != null
          ? ComponentState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      supportedOsVersions: (json['supportedOsVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toComponentType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final changeDescription = this.changeDescription;
    final dateCreated = this.dateCreated;
    final description = this.description;
    final name = this.name;
    final obfuscate = this.obfuscate;
    final owner = this.owner;
    final platform = this.platform;
    final publisher = this.publisher;
    final state = this.state;
    final supportedOsVersions = this.supportedOsVersions;
    final tags = this.tags;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (changeDescription != null) 'changeDescription': changeDescription,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (obfuscate != null) 'obfuscate': obfuscate,
      if (owner != null) 'owner': owner,
      if (platform != null) 'platform': platform.toValue(),
      if (publisher != null) 'publisher': publisher,
      if (state != null) 'state': state,
      if (supportedOsVersions != null)
        'supportedOsVersions': supportedOsVersions,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum ComponentType {
  build,
  test,
}

extension ComponentTypeValueExtension on ComponentType {
  String toValue() {
    switch (this) {
      case ComponentType.build:
        return 'BUILD';
      case ComponentType.test:
        return 'TEST';
    }
  }
}

extension ComponentTypeFromString on String {
  ComponentType toComponentType() {
    switch (this) {
      case 'BUILD':
        return ComponentType.build;
      case 'TEST':
        return ComponentType.test;
    }
    throw Exception('$this is not known in enum ComponentType');
  }
}

/// The defining characteristics of a specific version of an Amazon Web Services
/// TOE component.
class ComponentVersion {
  /// The Amazon Resource Name (ARN) of the component.
  /// <note>
  /// Semantic versioning is included in each object's Amazon Resource Name (ARN),
  /// at the level that applies to that object as follows:
  /// <ol>
  /// <li>
  /// Versionless ARNs and Name ARNs do not include specific values in any of the
  /// nodes. The nodes are either left off entirely, or they are specified as
  /// wildcards, for example: x.x.x.
  /// </li>
  /// <li>
  /// Version ARNs have only the first three nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;
  /// </li>
  /// <li>
  /// Build version ARNs have all four nodes, and point to a specific build for a
  /// specific version of an object.
  /// </li> </ol> </note>
  final String? arn;

  /// The date that the component was created.
  final String? dateCreated;

  /// The description of the component.
  final String? description;

  /// The name of the component.
  final String? name;

  /// The owner of the component.
  final String? owner;

  /// The platform of the component.
  final Platform? platform;

  /// he operating system (OS) version supported by the component. If the OS
  /// information is available, a prefix match is performed against the base image
  /// OS version during image recipe creation.
  final List<String>? supportedOsVersions;

  /// The type of the component denotes whether the component is used to build the
  /// image or only to test it.
  final ComponentType? type;

  /// The semantic version of the component.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or 1073741823
  /// for each node. Image Builder automatically assigns the build number to the
  /// fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example, you
  /// might choose a software version pattern, such as 1.0.0, or a date, such as
  /// 2021.01.01.
  ///
  /// <b>Filtering:</b> With semantic versioning, you have the flexibility to use
  /// wildcards (x) to specify the most recent versions or nodes when selecting
  /// the base image or components for your recipe. When you use a wildcard in any
  /// node, all nodes to the right of the first wildcard must also be wildcards.
  /// </note>
  final String? version;

  ComponentVersion({
    this.arn,
    this.dateCreated,
    this.description,
    this.name,
    this.owner,
    this.platform,
    this.supportedOsVersions,
    this.type,
    this.version,
  });

  factory ComponentVersion.fromJson(Map<String, dynamic> json) {
    return ComponentVersion(
      arn: json['arn'] as String?,
      dateCreated: json['dateCreated'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      supportedOsVersions: (json['supportedOsVersions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String?)?.toComponentType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final description = this.description;
    final name = this.name;
    final owner = this.owner;
    final platform = this.platform;
    final supportedOsVersions = this.supportedOsVersions;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (platform != null) 'platform': platform.toValue(),
      if (supportedOsVersions != null)
        'supportedOsVersions': supportedOsVersions,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// A container encapsulates the runtime environment for an application.
class Container {
  /// A list of URIs for containers created in the context Region.
  final List<String>? imageUris;

  /// Containers and container images are Region-specific. This is the Region
  /// context for the container.
  final String? region;

  Container({
    this.imageUris,
    this.region,
  });

  factory Container.fromJson(Map<String, dynamic> json) {
    return Container(
      imageUris: (json['imageUris'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      region: json['region'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageUris = this.imageUris;
    final region = this.region;
    return {
      if (imageUris != null) 'imageUris': imageUris,
      if (region != null) 'region': region,
    };
  }
}

/// Container distribution settings for encryption, licensing, and sharing in a
/// specific Region.
class ContainerDistributionConfiguration {
  /// The destination repository for the container distribution configuration.
  final TargetContainerRepository targetRepository;

  /// Tags that are attached to the container distribution configuration.
  final List<String>? containerTags;

  /// The description of the container distribution configuration.
  final String? description;

  ContainerDistributionConfiguration({
    required this.targetRepository,
    this.containerTags,
    this.description,
  });

  factory ContainerDistributionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ContainerDistributionConfiguration(
      targetRepository: TargetContainerRepository.fromJson(
          json['targetRepository'] as Map<String, dynamic>),
      containerTags: (json['containerTags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetRepository = this.targetRepository;
    final containerTags = this.containerTags;
    final description = this.description;
    return {
      'targetRepository': targetRepository,
      if (containerTags != null) 'containerTags': containerTags,
      if (description != null) 'description': description,
    };
  }
}

/// A container recipe.
class ContainerRecipe {
  /// The Amazon Resource Name (ARN) of the container recipe.
  /// <note>
  /// Semantic versioning is included in each object's Amazon Resource Name (ARN),
  /// at the level that applies to that object as follows:
  /// <ol>
  /// <li>
  /// Versionless ARNs and Name ARNs do not include specific values in any of the
  /// nodes. The nodes are either left off entirely, or they are specified as
  /// wildcards, for example: x.x.x.
  /// </li>
  /// <li>
  /// Version ARNs have only the first three nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;
  /// </li>
  /// <li>
  /// Build version ARNs have all four nodes, and point to a specific build for a
  /// specific version of an object.
  /// </li> </ol> </note>
  final String? arn;

  /// Build and test components that are included in the container recipe. Recipes
  /// require a minimum of one build component, and can have a maximum of 20 build
  /// and test components in any combination.
  final List<ComponentConfiguration>? components;

  /// Specifies the type of container, such as Docker.
  final ContainerType? containerType;

  /// The date when this container recipe was created.
  final String? dateCreated;

  /// The description of the container recipe.
  final String? description;

  /// Dockerfiles are text documents that are used to build Docker containers, and
  /// ensure that they contain all of the elements required by the application
  /// running inside. The template data consists of contextual variables where
  /// Image Builder places build information or scripts, based on your container
  /// image recipe.
  final String? dockerfileTemplateData;

  /// A flag that indicates if the target container is encrypted.
  final bool? encrypted;

  /// A group of options that can be used to configure an instance for building
  /// and testing container images.
  final InstanceConfiguration? instanceConfiguration;

  /// Identifies which KMS key is used to encrypt the container image for
  /// distribution to the target Region.
  final String? kmsKeyId;

  /// The name of the container recipe.
  final String? name;

  /// The owner of the container recipe.
  final String? owner;

  /// The base image for the container recipe.
  final String? parentImage;

  /// The system platform for the container, such as Windows or Linux.
  final Platform? platform;

  /// Tags that are attached to the container recipe.
  final Map<String, String>? tags;

  /// The destination repository for the container image.
  final TargetContainerRepository? targetRepository;

  /// The semantic version of the container recipe.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or 1073741823
  /// for each node. Image Builder automatically assigns the build number to the
  /// fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example, you
  /// might choose a software version pattern, such as 1.0.0, or a date, such as
  /// 2021.01.01.
  ///
  /// <b>Filtering:</b> With semantic versioning, you have the flexibility to use
  /// wildcards (x) to specify the most recent versions or nodes when selecting
  /// the base image or components for your recipe. When you use a wildcard in any
  /// node, all nodes to the right of the first wildcard must also be wildcards.
  /// </note>
  final String? version;

  /// The working directory for use during build and test workflows.
  final String? workingDirectory;

  ContainerRecipe({
    this.arn,
    this.components,
    this.containerType,
    this.dateCreated,
    this.description,
    this.dockerfileTemplateData,
    this.encrypted,
    this.instanceConfiguration,
    this.kmsKeyId,
    this.name,
    this.owner,
    this.parentImage,
    this.platform,
    this.tags,
    this.targetRepository,
    this.version,
    this.workingDirectory,
  });

  factory ContainerRecipe.fromJson(Map<String, dynamic> json) {
    return ContainerRecipe(
      arn: json['arn'] as String?,
      components: (json['components'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ComponentConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      containerType: (json['containerType'] as String?)?.toContainerType(),
      dateCreated: json['dateCreated'] as String?,
      description: json['description'] as String?,
      dockerfileTemplateData: json['dockerfileTemplateData'] as String?,
      encrypted: json['encrypted'] as bool?,
      instanceConfiguration: json['instanceConfiguration'] != null
          ? InstanceConfiguration.fromJson(
              json['instanceConfiguration'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      parentImage: json['parentImage'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetRepository: json['targetRepository'] != null
          ? TargetContainerRepository.fromJson(
              json['targetRepository'] as Map<String, dynamic>)
          : null,
      version: json['version'] as String?,
      workingDirectory: json['workingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final components = this.components;
    final containerType = this.containerType;
    final dateCreated = this.dateCreated;
    final description = this.description;
    final dockerfileTemplateData = this.dockerfileTemplateData;
    final encrypted = this.encrypted;
    final instanceConfiguration = this.instanceConfiguration;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final owner = this.owner;
    final parentImage = this.parentImage;
    final platform = this.platform;
    final tags = this.tags;
    final targetRepository = this.targetRepository;
    final version = this.version;
    final workingDirectory = this.workingDirectory;
    return {
      if (arn != null) 'arn': arn,
      if (components != null) 'components': components,
      if (containerType != null) 'containerType': containerType.toValue(),
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (description != null) 'description': description,
      if (dockerfileTemplateData != null)
        'dockerfileTemplateData': dockerfileTemplateData,
      if (encrypted != null) 'encrypted': encrypted,
      if (instanceConfiguration != null)
        'instanceConfiguration': instanceConfiguration,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (parentImage != null) 'parentImage': parentImage,
      if (platform != null) 'platform': platform.toValue(),
      if (tags != null) 'tags': tags,
      if (targetRepository != null) 'targetRepository': targetRepository,
      if (version != null) 'version': version,
      if (workingDirectory != null) 'workingDirectory': workingDirectory,
    };
  }
}

/// A summary of a container recipe
class ContainerRecipeSummary {
  /// The Amazon Resource Name (ARN) of the container recipe.
  final String? arn;

  /// Specifies the type of container, such as "Docker".
  final ContainerType? containerType;

  /// The date when this container recipe was created.
  final String? dateCreated;

  /// The name of the container recipe.
  final String? name;

  /// The owner of the container recipe.
  final String? owner;

  /// The base image for the container recipe.
  final String? parentImage;

  /// The system platform for the container, such as Windows or Linux.
  final Platform? platform;

  /// Tags that are attached to the container recipe.
  final Map<String, String>? tags;

  ContainerRecipeSummary({
    this.arn,
    this.containerType,
    this.dateCreated,
    this.name,
    this.owner,
    this.parentImage,
    this.platform,
    this.tags,
  });

  factory ContainerRecipeSummary.fromJson(Map<String, dynamic> json) {
    return ContainerRecipeSummary(
      arn: json['arn'] as String?,
      containerType: (json['containerType'] as String?)?.toContainerType(),
      dateCreated: json['dateCreated'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      parentImage: json['parentImage'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final containerType = this.containerType;
    final dateCreated = this.dateCreated;
    final name = this.name;
    final owner = this.owner;
    final parentImage = this.parentImage;
    final platform = this.platform;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (containerType != null) 'containerType': containerType.toValue(),
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (parentImage != null) 'parentImage': parentImage,
      if (platform != null) 'platform': platform.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

enum ContainerRepositoryService {
  ecr,
}

extension ContainerRepositoryServiceValueExtension
    on ContainerRepositoryService {
  String toValue() {
    switch (this) {
      case ContainerRepositoryService.ecr:
        return 'ECR';
    }
  }
}

extension ContainerRepositoryServiceFromString on String {
  ContainerRepositoryService toContainerRepositoryService() {
    switch (this) {
      case 'ECR':
        return ContainerRepositoryService.ecr;
    }
    throw Exception('$this is not known in enum ContainerRepositoryService');
  }
}

enum ContainerType {
  docker,
}

extension ContainerTypeValueExtension on ContainerType {
  String toValue() {
    switch (this) {
      case ContainerType.docker:
        return 'DOCKER';
    }
  }
}

extension ContainerTypeFromString on String {
  ContainerType toContainerType() {
    switch (this) {
      case 'DOCKER':
        return ContainerType.docker;
    }
    throw Exception('$this is not known in enum ContainerType');
  }
}

class CreateComponentResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the component that the request created.
  final String? componentBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  CreateComponentResponse({
    this.clientToken,
    this.componentBuildVersionArn,
    this.requestId,
  });

  factory CreateComponentResponse.fromJson(Map<String, dynamic> json) {
    return CreateComponentResponse(
      clientToken: json['clientToken'] as String?,
      componentBuildVersionArn: json['componentBuildVersionArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final componentBuildVersionArn = this.componentBuildVersionArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (componentBuildVersionArn != null)
        'componentBuildVersionArn': componentBuildVersionArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class CreateContainerRecipeResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// Returns the Amazon Resource Name (ARN) of the container recipe that the
  /// request created.
  final String? containerRecipeArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  CreateContainerRecipeResponse({
    this.clientToken,
    this.containerRecipeArn,
    this.requestId,
  });

  factory CreateContainerRecipeResponse.fromJson(Map<String, dynamic> json) {
    return CreateContainerRecipeResponse(
      clientToken: json['clientToken'] as String?,
      containerRecipeArn: json['containerRecipeArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final containerRecipeArn = this.containerRecipeArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class CreateDistributionConfigurationResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the distribution configuration that was
  /// created by this request.
  final String? distributionConfigurationArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  CreateDistributionConfigurationResponse({
    this.clientToken,
    this.distributionConfigurationArn,
    this.requestId,
  });

  factory CreateDistributionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDistributionConfigurationResponse(
      clientToken: json['clientToken'] as String?,
      distributionConfigurationArn:
          json['distributionConfigurationArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final distributionConfigurationArn = this.distributionConfigurationArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class CreateImagePipelineResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the image pipeline that was created by
  /// this request.
  final String? imagePipelineArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  CreateImagePipelineResponse({
    this.clientToken,
    this.imagePipelineArn,
    this.requestId,
  });

  factory CreateImagePipelineResponse.fromJson(Map<String, dynamic> json) {
    return CreateImagePipelineResponse(
      clientToken: json['clientToken'] as String?,
      imagePipelineArn: json['imagePipelineArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final imagePipelineArn = this.imagePipelineArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (imagePipelineArn != null) 'imagePipelineArn': imagePipelineArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class CreateImageRecipeResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the image recipe that was created by this
  /// request.
  final String? imageRecipeArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  CreateImageRecipeResponse({
    this.clientToken,
    this.imageRecipeArn,
    this.requestId,
  });

  factory CreateImageRecipeResponse.fromJson(Map<String, dynamic> json) {
    return CreateImageRecipeResponse(
      clientToken: json['clientToken'] as String?,
      imageRecipeArn: json['imageRecipeArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final imageRecipeArn = this.imageRecipeArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class CreateImageResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the image that the request created.
  final String? imageBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  CreateImageResponse({
    this.clientToken,
    this.imageBuildVersionArn,
    this.requestId,
  });

  factory CreateImageResponse.fromJson(Map<String, dynamic> json) {
    return CreateImageResponse(
      clientToken: json['clientToken'] as String?,
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class CreateInfrastructureConfigurationResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the infrastructure configuration that was
  /// created by this request.
  final String? infrastructureConfigurationArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  CreateInfrastructureConfigurationResponse({
    this.clientToken,
    this.infrastructureConfigurationArn,
    this.requestId,
  });

  factory CreateInfrastructureConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateInfrastructureConfigurationResponse(
      clientToken: json['clientToken'] as String?,
      infrastructureConfigurationArn:
          json['infrastructureConfigurationArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final infrastructureConfigurationArn = this.infrastructureConfigurationArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (infrastructureConfigurationArn != null)
        'infrastructureConfigurationArn': infrastructureConfigurationArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class CreateLifecyclePolicyResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the lifecycle policy that the request
  /// created.
  final String? lifecyclePolicyArn;

  CreateLifecyclePolicyResponse({
    this.clientToken,
    this.lifecyclePolicyArn,
  });

  factory CreateLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return CreateLifecyclePolicyResponse(
      clientToken: json['clientToken'] as String?,
      lifecyclePolicyArn: json['lifecyclePolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final lifecyclePolicyArn = this.lifecyclePolicyArn;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (lifecyclePolicyArn != null) 'lifecyclePolicyArn': lifecyclePolicyArn,
    };
  }
}

class CreateWorkflowResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the workflow resource that the request
  /// created.
  final String? workflowBuildVersionArn;

  CreateWorkflowResponse({
    this.clientToken,
    this.workflowBuildVersionArn,
  });

  factory CreateWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkflowResponse(
      clientToken: json['clientToken'] as String?,
      workflowBuildVersionArn: json['workflowBuildVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final workflowBuildVersionArn = this.workflowBuildVersionArn;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (workflowBuildVersionArn != null)
        'workflowBuildVersionArn': workflowBuildVersionArn,
    };
  }
}

/// Amazon Inspector generates a risk score for each finding. This score helps
/// you to prioritize findings, to focus on the most critical findings and the
/// most vulnerable resources. The score uses the Common Vulnerability Scoring
/// System (CVSS) format. This format is a modification of the base CVSS score
/// that the National Vulnerability Database (NVD) provides. For more
/// information about severity levels, see <a
/// href="https://docs.aws.amazon.com/inspector/latest/user/findings-understanding-severity.html">Severity
/// levels for Amazon Inspector findings</a> in the <i>Amazon Inspector User
/// Guide</i>.
class CvssScore {
  /// The CVSS base score.
  final double? baseScore;

  /// The vector string of the CVSS score.
  final String? scoringVector;

  /// The source of the CVSS score.
  final String? source;

  /// The CVSS version that generated the score.
  final String? version;

  CvssScore({
    this.baseScore,
    this.scoringVector,
    this.source,
    this.version,
  });

  factory CvssScore.fromJson(Map<String, dynamic> json) {
    return CvssScore(
      baseScore: json['baseScore'] as double?,
      scoringVector: json['scoringVector'] as String?,
      source: json['source'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseScore = this.baseScore;
    final scoringVector = this.scoringVector;
    final source = this.source;
    final version = this.version;
    return {
      if (baseScore != null) 'baseScore': baseScore,
      if (scoringVector != null) 'scoringVector': scoringVector,
      if (source != null) 'source': source,
      if (version != null) 'version': version,
    };
  }
}

/// Details about an adjustment that Amazon Inspector made to the CVSS score for
/// a finding.
class CvssScoreAdjustment {
  /// The metric that Amazon Inspector used to adjust the CVSS score.
  final String? metric;

  /// The reason for the CVSS score adjustment.
  final String? reason;

  CvssScoreAdjustment({
    this.metric,
    this.reason,
  });

  factory CvssScoreAdjustment.fromJson(Map<String, dynamic> json) {
    return CvssScoreAdjustment(
      metric: json['metric'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metric = this.metric;
    final reason = this.reason;
    return {
      if (metric != null) 'metric': metric,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Details about the source of the score, and the factors that determined the
/// adjustments to create the final score.
class CvssScoreDetails {
  /// An object that contains details about an adjustment that Amazon Inspector
  /// made to the CVSS score for the finding.
  final List<CvssScoreAdjustment>? adjustments;

  /// The source of the finding.
  final String? cvssSource;

  /// The CVSS score.
  final double? score;

  /// The source for the CVSS score.
  final String? scoreSource;

  /// A vector that measures the severity of the vulnerability.
  final String? scoringVector;

  /// The CVSS version that generated the score.
  final String? version;

  CvssScoreDetails({
    this.adjustments,
    this.cvssSource,
    this.score,
    this.scoreSource,
    this.scoringVector,
    this.version,
  });

  factory CvssScoreDetails.fromJson(Map<String, dynamic> json) {
    return CvssScoreDetails(
      adjustments: (json['adjustments'] as List?)
          ?.whereNotNull()
          .map((e) => CvssScoreAdjustment.fromJson(e as Map<String, dynamic>))
          .toList(),
      cvssSource: json['cvssSource'] as String?,
      score: json['score'] as double?,
      scoreSource: json['scoreSource'] as String?,
      scoringVector: json['scoringVector'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adjustments = this.adjustments;
    final cvssSource = this.cvssSource;
    final score = this.score;
    final scoreSource = this.scoreSource;
    final scoringVector = this.scoringVector;
    final version = this.version;
    return {
      if (adjustments != null) 'adjustments': adjustments,
      if (cvssSource != null) 'cvssSource': cvssSource,
      if (score != null) 'score': score,
      if (scoreSource != null) 'scoreSource': scoreSource,
      if (scoringVector != null) 'scoringVector': scoringVector,
      if (version != null) 'version': version,
    };
  }
}

class DeleteComponentResponse {
  /// The ARN of the component build version that this request deleted.
  final String? componentBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  DeleteComponentResponse({
    this.componentBuildVersionArn,
    this.requestId,
  });

  factory DeleteComponentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteComponentResponse(
      componentBuildVersionArn: json['componentBuildVersionArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentBuildVersionArn = this.componentBuildVersionArn;
    final requestId = this.requestId;
    return {
      if (componentBuildVersionArn != null)
        'componentBuildVersionArn': componentBuildVersionArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class DeleteContainerRecipeResponse {
  /// The Amazon Resource Name (ARN) of the container recipe that was deleted.
  final String? containerRecipeArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  DeleteContainerRecipeResponse({
    this.containerRecipeArn,
    this.requestId,
  });

  factory DeleteContainerRecipeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteContainerRecipeResponse(
      containerRecipeArn: json['containerRecipeArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerRecipeArn = this.containerRecipeArn;
    final requestId = this.requestId;
    return {
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class DeleteDistributionConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the distribution configuration that was
  /// deleted.
  final String? distributionConfigurationArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  DeleteDistributionConfigurationResponse({
    this.distributionConfigurationArn,
    this.requestId,
  });

  factory DeleteDistributionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteDistributionConfigurationResponse(
      distributionConfigurationArn:
          json['distributionConfigurationArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distributionConfigurationArn = this.distributionConfigurationArn;
    final requestId = this.requestId;
    return {
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class DeleteImagePipelineResponse {
  /// The Amazon Resource Name (ARN) of the image pipeline that was deleted.
  final String? imagePipelineArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  DeleteImagePipelineResponse({
    this.imagePipelineArn,
    this.requestId,
  });

  factory DeleteImagePipelineResponse.fromJson(Map<String, dynamic> json) {
    return DeleteImagePipelineResponse(
      imagePipelineArn: json['imagePipelineArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imagePipelineArn = this.imagePipelineArn;
    final requestId = this.requestId;
    return {
      if (imagePipelineArn != null) 'imagePipelineArn': imagePipelineArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class DeleteImageRecipeResponse {
  /// The Amazon Resource Name (ARN) of the image recipe that was deleted.
  final String? imageRecipeArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  DeleteImageRecipeResponse({
    this.imageRecipeArn,
    this.requestId,
  });

  factory DeleteImageRecipeResponse.fromJson(Map<String, dynamic> json) {
    return DeleteImageRecipeResponse(
      imageRecipeArn: json['imageRecipeArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageRecipeArn = this.imageRecipeArn;
    final requestId = this.requestId;
    return {
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class DeleteImageResponse {
  /// The ARN of the Image Builder image resource that this request deleted.
  final String? imageBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  DeleteImageResponse({
    this.imageBuildVersionArn,
    this.requestId,
  });

  factory DeleteImageResponse.fromJson(Map<String, dynamic> json) {
    return DeleteImageResponse(
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final requestId = this.requestId;
    return {
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class DeleteInfrastructureConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that was
  /// deleted.
  final String? infrastructureConfigurationArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  DeleteInfrastructureConfigurationResponse({
    this.infrastructureConfigurationArn,
    this.requestId,
  });

  factory DeleteInfrastructureConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteInfrastructureConfigurationResponse(
      infrastructureConfigurationArn:
          json['infrastructureConfigurationArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final infrastructureConfigurationArn = this.infrastructureConfigurationArn;
    final requestId = this.requestId;
    return {
      if (infrastructureConfigurationArn != null)
        'infrastructureConfigurationArn': infrastructureConfigurationArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class DeleteLifecyclePolicyResponse {
  /// The ARN of the lifecycle policy that was deleted.
  final String? lifecyclePolicyArn;

  DeleteLifecyclePolicyResponse({
    this.lifecyclePolicyArn,
  });

  factory DeleteLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteLifecyclePolicyResponse(
      lifecyclePolicyArn: json['lifecyclePolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicyArn = this.lifecyclePolicyArn;
    return {
      if (lifecyclePolicyArn != null) 'lifecyclePolicyArn': lifecyclePolicyArn,
    };
  }
}

class DeleteWorkflowResponse {
  /// The ARN of the workflow resource that this request deleted.
  final String? workflowBuildVersionArn;

  DeleteWorkflowResponse({
    this.workflowBuildVersionArn,
  });

  factory DeleteWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return DeleteWorkflowResponse(
      workflowBuildVersionArn: json['workflowBuildVersionArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workflowBuildVersionArn = this.workflowBuildVersionArn;
    return {
      if (workflowBuildVersionArn != null)
        'workflowBuildVersionArn': workflowBuildVersionArn,
    };
  }
}

enum DiskImageFormat {
  vmdk,
  raw,
  vhd,
}

extension DiskImageFormatValueExtension on DiskImageFormat {
  String toValue() {
    switch (this) {
      case DiskImageFormat.vmdk:
        return 'VMDK';
      case DiskImageFormat.raw:
        return 'RAW';
      case DiskImageFormat.vhd:
        return 'VHD';
    }
  }
}

extension DiskImageFormatFromString on String {
  DiskImageFormat toDiskImageFormat() {
    switch (this) {
      case 'VMDK':
        return DiskImageFormat.vmdk;
      case 'RAW':
        return DiskImageFormat.raw;
      case 'VHD':
        return DiskImageFormat.vhd;
    }
    throw Exception('$this is not known in enum DiskImageFormat');
  }
}

/// Defines the settings for a specific Region.
class Distribution {
  /// The target Region.
  final String region;

  /// The specific AMI settings; for example, launch permissions or AMI tags.
  final AmiDistributionConfiguration? amiDistributionConfiguration;

  /// Container distribution settings for encryption, licensing, and sharing in a
  /// specific Region.
  final ContainerDistributionConfiguration? containerDistributionConfiguration;

  /// The Windows faster-launching configurations to use for AMI distribution.
  final List<FastLaunchConfiguration>? fastLaunchConfigurations;

  /// A group of launchTemplateConfiguration settings that apply to image
  /// distribution for specified accounts.
  final List<LaunchTemplateConfiguration>? launchTemplateConfigurations;

  /// The License Manager Configuration to associate with the AMI in the specified
  /// Region.
  final List<String>? licenseConfigurationArns;

  /// Configure export settings to deliver disk images created from your image
  /// build, using a file format that is compatible with your VMs in that Region.
  final S3ExportConfiguration? s3ExportConfiguration;

  Distribution({
    required this.region,
    this.amiDistributionConfiguration,
    this.containerDistributionConfiguration,
    this.fastLaunchConfigurations,
    this.launchTemplateConfigurations,
    this.licenseConfigurationArns,
    this.s3ExportConfiguration,
  });

  factory Distribution.fromJson(Map<String, dynamic> json) {
    return Distribution(
      region: json['region'] as String,
      amiDistributionConfiguration: json['amiDistributionConfiguration'] != null
          ? AmiDistributionConfiguration.fromJson(
              json['amiDistributionConfiguration'] as Map<String, dynamic>)
          : null,
      containerDistributionConfiguration:
          json['containerDistributionConfiguration'] != null
              ? ContainerDistributionConfiguration.fromJson(
                  json['containerDistributionConfiguration']
                      as Map<String, dynamic>)
              : null,
      fastLaunchConfigurations: (json['fastLaunchConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FastLaunchConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      launchTemplateConfigurations: (json['launchTemplateConfigurations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              LaunchTemplateConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      licenseConfigurationArns: (json['licenseConfigurationArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      s3ExportConfiguration: json['s3ExportConfiguration'] != null
          ? S3ExportConfiguration.fromJson(
              json['s3ExportConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final amiDistributionConfiguration = this.amiDistributionConfiguration;
    final containerDistributionConfiguration =
        this.containerDistributionConfiguration;
    final fastLaunchConfigurations = this.fastLaunchConfigurations;
    final launchTemplateConfigurations = this.launchTemplateConfigurations;
    final licenseConfigurationArns = this.licenseConfigurationArns;
    final s3ExportConfiguration = this.s3ExportConfiguration;
    return {
      'region': region,
      if (amiDistributionConfiguration != null)
        'amiDistributionConfiguration': amiDistributionConfiguration,
      if (containerDistributionConfiguration != null)
        'containerDistributionConfiguration':
            containerDistributionConfiguration,
      if (fastLaunchConfigurations != null)
        'fastLaunchConfigurations': fastLaunchConfigurations,
      if (launchTemplateConfigurations != null)
        'launchTemplateConfigurations': launchTemplateConfigurations,
      if (licenseConfigurationArns != null)
        'licenseConfigurationArns': licenseConfigurationArns,
      if (s3ExportConfiguration != null)
        's3ExportConfiguration': s3ExportConfiguration,
    };
  }
}

/// A distribution configuration.
class DistributionConfiguration {
  /// The maximum duration in minutes for this distribution configuration.
  final int timeoutMinutes;

  /// The Amazon Resource Name (ARN) of the distribution configuration.
  final String? arn;

  /// The date on which this distribution configuration was created.
  final String? dateCreated;

  /// The date on which this distribution configuration was last updated.
  final String? dateUpdated;

  /// The description of the distribution configuration.
  final String? description;

  /// The distribution objects that apply Region-specific settings for the
  /// deployment of the image to targeted Regions.
  final List<Distribution>? distributions;

  /// The name of the distribution configuration.
  final String? name;

  /// The tags of the distribution configuration.
  final Map<String, String>? tags;

  DistributionConfiguration({
    required this.timeoutMinutes,
    this.arn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.distributions,
    this.name,
    this.tags,
  });

  factory DistributionConfiguration.fromJson(Map<String, dynamic> json) {
    return DistributionConfiguration(
      timeoutMinutes: json['timeoutMinutes'] as int,
      arn: json['arn'] as String?,
      dateCreated: json['dateCreated'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
      description: json['description'] as String?,
      distributions: (json['distributions'] as List?)
          ?.whereNotNull()
          .map((e) => Distribution.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final timeoutMinutes = this.timeoutMinutes;
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final distributions = this.distributions;
    final name = this.name;
    final tags = this.tags;
    return {
      'timeoutMinutes': timeoutMinutes,
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (dateUpdated != null) 'dateUpdated': dateUpdated,
      if (description != null) 'description': description,
      if (distributions != null) 'distributions': distributions,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A high-level overview of a distribution configuration.
class DistributionConfigurationSummary {
  /// The Amazon Resource Name (ARN) of the distribution configuration.
  final String? arn;

  /// The date on which the distribution configuration was created.
  final String? dateCreated;

  /// The date on which the distribution configuration was updated.
  final String? dateUpdated;

  /// The description of the distribution configuration.
  final String? description;

  /// The name of the distribution configuration.
  final String? name;

  /// A list of Regions where the container image is distributed to.
  final List<String>? regions;

  /// The tags associated with the distribution configuration.
  final Map<String, String>? tags;

  DistributionConfigurationSummary({
    this.arn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.name,
    this.regions,
    this.tags,
  });

  factory DistributionConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return DistributionConfigurationSummary(
      arn: json['arn'] as String?,
      dateCreated: json['dateCreated'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      regions: (json['regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final name = this.name;
    final regions = this.regions;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (dateUpdated != null) 'dateUpdated': dateUpdated,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (regions != null) 'regions': regions,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Amazon EBS-specific block device mapping specifications.
class EbsInstanceBlockDeviceSpecification {
  /// Use to configure delete on termination of the associated device.
  final bool? deleteOnTermination;

  /// Use to configure device encryption.
  final bool? encrypted;

  /// Use to configure device IOPS.
  final int? iops;

  /// Use to configure the KMS key to use when encrypting the device.
  final String? kmsKeyId;

  /// The snapshot that defines the device contents.
  final String? snapshotId;

  /// <b>For GP3 volumes only</b> – The throughput in MiB/s that the volume
  /// supports.
  final int? throughput;

  /// Use to override the device's volume size.
  final int? volumeSize;

  /// Use to override the device's volume type.
  final EbsVolumeType? volumeType;

  EbsInstanceBlockDeviceSpecification({
    this.deleteOnTermination,
    this.encrypted,
    this.iops,
    this.kmsKeyId,
    this.snapshotId,
    this.throughput,
    this.volumeSize,
    this.volumeType,
  });

  factory EbsInstanceBlockDeviceSpecification.fromJson(
      Map<String, dynamic> json) {
    return EbsInstanceBlockDeviceSpecification(
      deleteOnTermination: json['deleteOnTermination'] as bool?,
      encrypted: json['encrypted'] as bool?,
      iops: json['iops'] as int?,
      kmsKeyId: json['kmsKeyId'] as String?,
      snapshotId: json['snapshotId'] as String?,
      throughput: json['throughput'] as int?,
      volumeSize: json['volumeSize'] as int?,
      volumeType: (json['volumeType'] as String?)?.toEbsVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final deleteOnTermination = this.deleteOnTermination;
    final encrypted = this.encrypted;
    final iops = this.iops;
    final kmsKeyId = this.kmsKeyId;
    final snapshotId = this.snapshotId;
    final throughput = this.throughput;
    final volumeSize = this.volumeSize;
    final volumeType = this.volumeType;
    return {
      if (deleteOnTermination != null)
        'deleteOnTermination': deleteOnTermination,
      if (encrypted != null) 'encrypted': encrypted,
      if (iops != null) 'iops': iops,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (snapshotId != null) 'snapshotId': snapshotId,
      if (throughput != null) 'throughput': throughput,
      if (volumeSize != null) 'volumeSize': volumeSize,
      if (volumeType != null) 'volumeType': volumeType.toValue(),
    };
  }
}

enum EbsVolumeType {
  standard,
  io1,
  io2,
  gp2,
  gp3,
  sc1,
  st1,
}

extension EbsVolumeTypeValueExtension on EbsVolumeType {
  String toValue() {
    switch (this) {
      case EbsVolumeType.standard:
        return 'standard';
      case EbsVolumeType.io1:
        return 'io1';
      case EbsVolumeType.io2:
        return 'io2';
      case EbsVolumeType.gp2:
        return 'gp2';
      case EbsVolumeType.gp3:
        return 'gp3';
      case EbsVolumeType.sc1:
        return 'sc1';
      case EbsVolumeType.st1:
        return 'st1';
    }
  }
}

extension EbsVolumeTypeFromString on String {
  EbsVolumeType toEbsVolumeType() {
    switch (this) {
      case 'standard':
        return EbsVolumeType.standard;
      case 'io1':
        return EbsVolumeType.io1;
      case 'io2':
        return EbsVolumeType.io2;
      case 'gp2':
        return EbsVolumeType.gp2;
      case 'gp3':
        return EbsVolumeType.gp3;
      case 'sc1':
        return EbsVolumeType.sc1;
      case 'st1':
        return EbsVolumeType.st1;
    }
    throw Exception('$this is not known in enum EbsVolumeType');
  }
}

/// Settings that Image Builder uses to configure the ECR repository and the
/// output container images that Amazon Inspector scans.
class EcrConfiguration {
  /// Tags for Image Builder to apply to the output container image that &amp;INS;
  /// scans. Tags can help you identify and manage your scanned images.
  final List<String>? containerTags;

  /// The name of the container repository that Amazon Inspector scans to identify
  /// findings for your container images. The name includes the path for the
  /// repository location. If you don’t provide this information, Image Builder
  /// creates a repository in your account named
  /// <code>image-builder-image-scanning-repository</code> for vulnerability scans
  /// of your output container images.
  final String? repositoryName;

  EcrConfiguration({
    this.containerTags,
    this.repositoryName,
  });

  factory EcrConfiguration.fromJson(Map<String, dynamic> json) {
    return EcrConfiguration(
      containerTags: (json['containerTags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerTags = this.containerTags;
    final repositoryName = this.repositoryName;
    return {
      if (containerTags != null) 'containerTags': containerTags,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// Define and configure faster launching for output Windows AMIs.
class FastLaunchConfiguration {
  /// A Boolean that represents the current state of faster launching for the
  /// Windows AMI. Set to <code>true</code> to start using Windows faster
  /// launching, or <code>false</code> to stop using it.
  final bool enabled;

  /// The owner account ID for the fast-launch enabled Windows AMI.
  final String? accountId;

  /// The launch template that the fast-launch enabled Windows AMI uses when it
  /// launches Windows instances to create pre-provisioned snapshots.
  final FastLaunchLaunchTemplateSpecification? launchTemplate;

  /// The maximum number of parallel instances that are launched for creating
  /// resources.
  final int? maxParallelLaunches;

  /// Configuration settings for managing the number of snapshots that are created
  /// from pre-provisioned instances for the Windows AMI when faster launching is
  /// enabled.
  final FastLaunchSnapshotConfiguration? snapshotConfiguration;

  FastLaunchConfiguration({
    required this.enabled,
    this.accountId,
    this.launchTemplate,
    this.maxParallelLaunches,
    this.snapshotConfiguration,
  });

  factory FastLaunchConfiguration.fromJson(Map<String, dynamic> json) {
    return FastLaunchConfiguration(
      enabled: json['enabled'] as bool,
      accountId: json['accountId'] as String?,
      launchTemplate: json['launchTemplate'] != null
          ? FastLaunchLaunchTemplateSpecification.fromJson(
              json['launchTemplate'] as Map<String, dynamic>)
          : null,
      maxParallelLaunches: json['maxParallelLaunches'] as int?,
      snapshotConfiguration: json['snapshotConfiguration'] != null
          ? FastLaunchSnapshotConfiguration.fromJson(
              json['snapshotConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final accountId = this.accountId;
    final launchTemplate = this.launchTemplate;
    final maxParallelLaunches = this.maxParallelLaunches;
    final snapshotConfiguration = this.snapshotConfiguration;
    return {
      'enabled': enabled,
      if (accountId != null) 'accountId': accountId,
      if (launchTemplate != null) 'launchTemplate': launchTemplate,
      if (maxParallelLaunches != null)
        'maxParallelLaunches': maxParallelLaunches,
      if (snapshotConfiguration != null)
        'snapshotConfiguration': snapshotConfiguration,
    };
  }
}

/// Identifies the launch template that the associated Windows AMI uses for
/// launching an instance when faster launching is enabled.
/// <note>
/// You can specify either the <code>launchTemplateName</code> or the
/// <code>launchTemplateId</code>, but not both.
/// </note>
class FastLaunchLaunchTemplateSpecification {
  /// The ID of the launch template to use for faster launching for a Windows AMI.
  final String? launchTemplateId;

  /// The name of the launch template to use for faster launching for a Windows
  /// AMI.
  final String? launchTemplateName;

  /// The version of the launch template to use for faster launching for a Windows
  /// AMI.
  final String? launchTemplateVersion;

  FastLaunchLaunchTemplateSpecification({
    this.launchTemplateId,
    this.launchTemplateName,
    this.launchTemplateVersion,
  });

  factory FastLaunchLaunchTemplateSpecification.fromJson(
      Map<String, dynamic> json) {
    return FastLaunchLaunchTemplateSpecification(
      launchTemplateId: json['launchTemplateId'] as String?,
      launchTemplateName: json['launchTemplateName'] as String?,
      launchTemplateVersion: json['launchTemplateVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchTemplateId = this.launchTemplateId;
    final launchTemplateName = this.launchTemplateName;
    final launchTemplateVersion = this.launchTemplateVersion;
    return {
      if (launchTemplateId != null) 'launchTemplateId': launchTemplateId,
      if (launchTemplateName != null) 'launchTemplateName': launchTemplateName,
      if (launchTemplateVersion != null)
        'launchTemplateVersion': launchTemplateVersion,
    };
  }
}

/// Configuration settings for creating and managing pre-provisioned snapshots
/// for a fast-launch enabled Windows AMI.
class FastLaunchSnapshotConfiguration {
  /// The number of pre-provisioned snapshots to keep on hand for a fast-launch
  /// enabled Windows AMI.
  final int? targetResourceCount;

  FastLaunchSnapshotConfiguration({
    this.targetResourceCount,
  });

  factory FastLaunchSnapshotConfiguration.fromJson(Map<String, dynamic> json) {
    return FastLaunchSnapshotConfiguration(
      targetResourceCount: json['targetResourceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetResourceCount = this.targetResourceCount;
    return {
      if (targetResourceCount != null)
        'targetResourceCount': targetResourceCount,
    };
  }
}

/// A filter name and value pair that is used to return a more specific list of
/// results from a list operation. Filters can be used to match a set of
/// resources by specific criteria, such as tags, attributes, or IDs.
class Filter {
  /// The name of the filter. Filter names are case-sensitive.
  final String? name;

  /// The filter values. Filter values are case-sensitive.
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name,
      if (values != null) 'values': values,
    };
  }
}

class GetComponentPolicyResponse {
  /// The component policy.
  final String? policy;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetComponentPolicyResponse({
    this.policy,
    this.requestId,
  });

  factory GetComponentPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetComponentPolicyResponse(
      policy: json['policy'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final requestId = this.requestId;
    return {
      if (policy != null) 'policy': policy,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetComponentResponse {
  /// The component object specified in the request.
  final Component? component;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetComponentResponse({
    this.component,
    this.requestId,
  });

  factory GetComponentResponse.fromJson(Map<String, dynamic> json) {
    return GetComponentResponse(
      component: json['component'] != null
          ? Component.fromJson(json['component'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    final requestId = this.requestId;
    return {
      if (component != null) 'component': component,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetContainerRecipePolicyResponse {
  /// The container recipe policy object that is returned.
  final String? policy;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetContainerRecipePolicyResponse({
    this.policy,
    this.requestId,
  });

  factory GetContainerRecipePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetContainerRecipePolicyResponse(
      policy: json['policy'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final requestId = this.requestId;
    return {
      if (policy != null) 'policy': policy,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetContainerRecipeResponse {
  /// The container recipe object that is returned.
  final ContainerRecipe? containerRecipe;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetContainerRecipeResponse({
    this.containerRecipe,
    this.requestId,
  });

  factory GetContainerRecipeResponse.fromJson(Map<String, dynamic> json) {
    return GetContainerRecipeResponse(
      containerRecipe: json['containerRecipe'] != null
          ? ContainerRecipe.fromJson(
              json['containerRecipe'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerRecipe = this.containerRecipe;
    final requestId = this.requestId;
    return {
      if (containerRecipe != null) 'containerRecipe': containerRecipe,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetDistributionConfigurationResponse {
  /// The distribution configuration object.
  final DistributionConfiguration? distributionConfiguration;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetDistributionConfigurationResponse({
    this.distributionConfiguration,
    this.requestId,
  });

  factory GetDistributionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDistributionConfigurationResponse(
      distributionConfiguration: json['distributionConfiguration'] != null
          ? DistributionConfiguration.fromJson(
              json['distributionConfiguration'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distributionConfiguration = this.distributionConfiguration;
    final requestId = this.requestId;
    return {
      if (distributionConfiguration != null)
        'distributionConfiguration': distributionConfiguration,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetImagePipelineResponse {
  /// The image pipeline object.
  final ImagePipeline? imagePipeline;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetImagePipelineResponse({
    this.imagePipeline,
    this.requestId,
  });

  factory GetImagePipelineResponse.fromJson(Map<String, dynamic> json) {
    return GetImagePipelineResponse(
      imagePipeline: json['imagePipeline'] != null
          ? ImagePipeline.fromJson(
              json['imagePipeline'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imagePipeline = this.imagePipeline;
    final requestId = this.requestId;
    return {
      if (imagePipeline != null) 'imagePipeline': imagePipeline,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetImagePolicyResponse {
  /// The image policy object.
  final String? policy;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetImagePolicyResponse({
    this.policy,
    this.requestId,
  });

  factory GetImagePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetImagePolicyResponse(
      policy: json['policy'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final requestId = this.requestId;
    return {
      if (policy != null) 'policy': policy,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetImageRecipePolicyResponse {
  /// The image recipe policy object.
  final String? policy;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetImageRecipePolicyResponse({
    this.policy,
    this.requestId,
  });

  factory GetImageRecipePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetImageRecipePolicyResponse(
      policy: json['policy'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final requestId = this.requestId;
    return {
      if (policy != null) 'policy': policy,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetImageRecipeResponse {
  /// The image recipe object.
  final ImageRecipe? imageRecipe;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetImageRecipeResponse({
    this.imageRecipe,
    this.requestId,
  });

  factory GetImageRecipeResponse.fromJson(Map<String, dynamic> json) {
    return GetImageRecipeResponse(
      imageRecipe: json['imageRecipe'] != null
          ? ImageRecipe.fromJson(json['imageRecipe'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageRecipe = this.imageRecipe;
    final requestId = this.requestId;
    return {
      if (imageRecipe != null) 'imageRecipe': imageRecipe,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetImageResponse {
  /// The image object.
  final Image? image;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetImageResponse({
    this.image,
    this.requestId,
  });

  factory GetImageResponse.fromJson(Map<String, dynamic> json) {
    return GetImageResponse(
      image: json['image'] != null
          ? Image.fromJson(json['image'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    final requestId = this.requestId;
    return {
      if (image != null) 'image': image,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

/// GetInfrastructureConfiguration response object.
class GetInfrastructureConfigurationResponse {
  /// The infrastructure configuration object.
  final InfrastructureConfiguration? infrastructureConfiguration;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  GetInfrastructureConfigurationResponse({
    this.infrastructureConfiguration,
    this.requestId,
  });

  factory GetInfrastructureConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetInfrastructureConfigurationResponse(
      infrastructureConfiguration: json['infrastructureConfiguration'] != null
          ? InfrastructureConfiguration.fromJson(
              json['infrastructureConfiguration'] as Map<String, dynamic>)
          : null,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final infrastructureConfiguration = this.infrastructureConfiguration;
    final requestId = this.requestId;
    return {
      if (infrastructureConfiguration != null)
        'infrastructureConfiguration': infrastructureConfiguration,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class GetLifecycleExecutionResponse {
  /// Runtime details for the specified runtime instance of the lifecycle policy.
  final LifecycleExecution? lifecycleExecution;

  GetLifecycleExecutionResponse({
    this.lifecycleExecution,
  });

  factory GetLifecycleExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetLifecycleExecutionResponse(
      lifecycleExecution: json['lifecycleExecution'] != null
          ? LifecycleExecution.fromJson(
              json['lifecycleExecution'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycleExecution = this.lifecycleExecution;
    return {
      if (lifecycleExecution != null) 'lifecycleExecution': lifecycleExecution,
    };
  }
}

class GetLifecyclePolicyResponse {
  /// The ARN of the image lifecycle policy resource that was returned.
  final LifecyclePolicy? lifecyclePolicy;

  GetLifecyclePolicyResponse({
    this.lifecyclePolicy,
  });

  factory GetLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetLifecyclePolicyResponse(
      lifecyclePolicy: json['lifecyclePolicy'] != null
          ? LifecyclePolicy.fromJson(
              json['lifecyclePolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicy = this.lifecyclePolicy;
    return {
      if (lifecyclePolicy != null) 'lifecyclePolicy': lifecyclePolicy,
    };
  }
}

class GetWorkflowExecutionResponse {
  /// The timestamp when the specified runtime instance of the workflow finished.
  final String? endTime;

  /// The Amazon Resource Name (ARN) of the image resource build version that the
  /// specified runtime instance of the workflow created.
  final String? imageBuildVersionArn;

  /// The output message from the specified runtime instance of the workflow, if
  /// applicable.
  final String? message;

  /// Test workflows are defined within named runtime groups. The parallel group
  /// is a named group that contains one or more test workflows.
  final String? parallelGroup;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  /// The timestamp when the specified runtime instance of the workflow started.
  final String? startTime;

  /// The current runtime status for the specified runtime instance of the
  /// workflow.
  final WorkflowExecutionStatus? status;

  /// The total number of steps in the specified runtime instance of the workflow
  /// that ran. This number should equal the sum of the step counts for steps that
  /// succeeded, were skipped, and failed.
  final int? totalStepCount;

  /// A runtime count for the number of steps that failed in the specified runtime
  /// instance of the workflow.
  final int? totalStepsFailed;

  /// A runtime count for the number of steps that were skipped in the specified
  /// runtime instance of the workflow.
  final int? totalStepsSkipped;

  /// A runtime count for the number of steps that ran successfully in the
  /// specified runtime instance of the workflow.
  final int? totalStepsSucceeded;

  /// The type of workflow that Image Builder ran for the specified runtime
  /// instance of the workflow.
  final WorkflowType? type;

  /// The Amazon Resource Name (ARN) of the build version for the Image Builder
  /// workflow resource that defines the specified runtime instance of the
  /// workflow.
  final String? workflowBuildVersionArn;

  /// The unique identifier that Image Builder assigned to keep track of runtime
  /// details when it ran the workflow.
  final String? workflowExecutionId;

  GetWorkflowExecutionResponse({
    this.endTime,
    this.imageBuildVersionArn,
    this.message,
    this.parallelGroup,
    this.requestId,
    this.startTime,
    this.status,
    this.totalStepCount,
    this.totalStepsFailed,
    this.totalStepsSkipped,
    this.totalStepsSucceeded,
    this.type,
    this.workflowBuildVersionArn,
    this.workflowExecutionId,
  });

  factory GetWorkflowExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowExecutionResponse(
      endTime: json['endTime'] as String?,
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      message: json['message'] as String?,
      parallelGroup: json['parallelGroup'] as String?,
      requestId: json['requestId'] as String?,
      startTime: json['startTime'] as String?,
      status: (json['status'] as String?)?.toWorkflowExecutionStatus(),
      totalStepCount: json['totalStepCount'] as int?,
      totalStepsFailed: json['totalStepsFailed'] as int?,
      totalStepsSkipped: json['totalStepsSkipped'] as int?,
      totalStepsSucceeded: json['totalStepsSucceeded'] as int?,
      type: (json['type'] as String?)?.toWorkflowType(),
      workflowBuildVersionArn: json['workflowBuildVersionArn'] as String?,
      workflowExecutionId: json['workflowExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final message = this.message;
    final parallelGroup = this.parallelGroup;
    final requestId = this.requestId;
    final startTime = this.startTime;
    final status = this.status;
    final totalStepCount = this.totalStepCount;
    final totalStepsFailed = this.totalStepsFailed;
    final totalStepsSkipped = this.totalStepsSkipped;
    final totalStepsSucceeded = this.totalStepsSucceeded;
    final type = this.type;
    final workflowBuildVersionArn = this.workflowBuildVersionArn;
    final workflowExecutionId = this.workflowExecutionId;
    return {
      if (endTime != null) 'endTime': endTime,
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (message != null) 'message': message,
      if (parallelGroup != null) 'parallelGroup': parallelGroup,
      if (requestId != null) 'requestId': requestId,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
      if (totalStepCount != null) 'totalStepCount': totalStepCount,
      if (totalStepsFailed != null) 'totalStepsFailed': totalStepsFailed,
      if (totalStepsSkipped != null) 'totalStepsSkipped': totalStepsSkipped,
      if (totalStepsSucceeded != null)
        'totalStepsSucceeded': totalStepsSucceeded,
      if (type != null) 'type': type.toValue(),
      if (workflowBuildVersionArn != null)
        'workflowBuildVersionArn': workflowBuildVersionArn,
      if (workflowExecutionId != null)
        'workflowExecutionId': workflowExecutionId,
    };
  }
}

class GetWorkflowResponse {
  /// The workflow resource specified in the request.
  final Workflow? workflow;

  GetWorkflowResponse({
    this.workflow,
  });

  factory GetWorkflowResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowResponse(
      workflow: json['workflow'] != null
          ? Workflow.fromJson(json['workflow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workflow = this.workflow;
    return {
      if (workflow != null) 'workflow': workflow,
    };
  }
}

class GetWorkflowStepExecutionResponse {
  /// The name of the action that the specified step performs.
  final String? action;

  /// Describes the specified workflow step.
  final String? description;

  /// The timestamp when the specified runtime instance of the workflow step
  /// finished.
  final String? endTime;

  /// The Amazon Resource Name (ARN) of the image resource build version that the
  /// specified runtime instance of the workflow step creates.
  final String? imageBuildVersionArn;

  /// Input parameters that Image Builder provided for the specified runtime
  /// instance of the workflow step.
  final String? inputs;

  /// The output message from the specified runtime instance of the workflow step,
  /// if applicable.
  final String? message;

  /// The name of the specified runtime instance of the workflow step.
  final String? name;

  /// The action to perform if the workflow step fails.
  final String? onFailure;

  /// The file names that the specified runtime version of the workflow step
  /// created as output.
  final String? outputs;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  /// Reports on the rollback status of the specified runtime version of the
  /// workflow step, if applicable.
  final WorkflowStepExecutionRollbackStatus? rollbackStatus;

  /// The timestamp when the specified runtime version of the workflow step
  /// started.
  final String? startTime;

  /// The current status for the specified runtime version of the workflow step.
  final WorkflowStepExecutionStatus? status;

  /// The unique identifier for the runtime version of the workflow step that you
  /// specified in the request.
  final String? stepExecutionId;

  /// The maximum duration in seconds for this step to complete its action.
  final int? timeoutSeconds;

  /// The Amazon Resource Name (ARN) of the build version for the Image Builder
  /// workflow resource that defines this workflow step.
  final String? workflowBuildVersionArn;

  /// The unique identifier that Image Builder assigned to keep track of runtime
  /// details when it ran the workflow.
  final String? workflowExecutionId;

  GetWorkflowStepExecutionResponse({
    this.action,
    this.description,
    this.endTime,
    this.imageBuildVersionArn,
    this.inputs,
    this.message,
    this.name,
    this.onFailure,
    this.outputs,
    this.requestId,
    this.rollbackStatus,
    this.startTime,
    this.status,
    this.stepExecutionId,
    this.timeoutSeconds,
    this.workflowBuildVersionArn,
    this.workflowExecutionId,
  });

  factory GetWorkflowStepExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkflowStepExecutionResponse(
      action: json['action'] as String?,
      description: json['description'] as String?,
      endTime: json['endTime'] as String?,
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      inputs: json['inputs'] as String?,
      message: json['message'] as String?,
      name: json['name'] as String?,
      onFailure: json['onFailure'] as String?,
      outputs: json['outputs'] as String?,
      requestId: json['requestId'] as String?,
      rollbackStatus: (json['rollbackStatus'] as String?)
          ?.toWorkflowStepExecutionRollbackStatus(),
      startTime: json['startTime'] as String?,
      status: (json['status'] as String?)?.toWorkflowStepExecutionStatus(),
      stepExecutionId: json['stepExecutionId'] as String?,
      timeoutSeconds: json['timeoutSeconds'] as int?,
      workflowBuildVersionArn: json['workflowBuildVersionArn'] as String?,
      workflowExecutionId: json['workflowExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final description = this.description;
    final endTime = this.endTime;
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final inputs = this.inputs;
    final message = this.message;
    final name = this.name;
    final onFailure = this.onFailure;
    final outputs = this.outputs;
    final requestId = this.requestId;
    final rollbackStatus = this.rollbackStatus;
    final startTime = this.startTime;
    final status = this.status;
    final stepExecutionId = this.stepExecutionId;
    final timeoutSeconds = this.timeoutSeconds;
    final workflowBuildVersionArn = this.workflowBuildVersionArn;
    final workflowExecutionId = this.workflowExecutionId;
    return {
      if (action != null) 'action': action,
      if (description != null) 'description': description,
      if (endTime != null) 'endTime': endTime,
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (inputs != null) 'inputs': inputs,
      if (message != null) 'message': message,
      if (name != null) 'name': name,
      if (onFailure != null) 'onFailure': onFailure,
      if (outputs != null) 'outputs': outputs,
      if (requestId != null) 'requestId': requestId,
      if (rollbackStatus != null) 'rollbackStatus': rollbackStatus.toValue(),
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
      if (stepExecutionId != null) 'stepExecutionId': stepExecutionId,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
      if (workflowBuildVersionArn != null)
        'workflowBuildVersionArn': workflowBuildVersionArn,
      if (workflowExecutionId != null)
        'workflowExecutionId': workflowExecutionId,
    };
  }
}

/// An Image Builder image. You must specify exactly one recipe for the image –
/// either a container recipe (<code>containerRecipe</code>), which creates a
/// container image, or an image recipe (<code>imageRecipe</code>), which
/// creates an AMI.
class Image {
  /// The Amazon Resource Name (ARN) of the image.
  /// <note>
  /// Semantic versioning is included in each object's Amazon Resource Name (ARN),
  /// at the level that applies to that object as follows:
  /// <ol>
  /// <li>
  /// Versionless ARNs and Name ARNs do not include specific values in any of the
  /// nodes. The nodes are either left off entirely, or they are specified as
  /// wildcards, for example: x.x.x.
  /// </li>
  /// <li>
  /// Version ARNs have only the first three nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;
  /// </li>
  /// <li>
  /// Build version ARNs have all four nodes, and point to a specific build for a
  /// specific version of an object.
  /// </li> </ol> </note>
  final String? arn;

  /// Indicates the type of build that created this image. The build can be
  /// initiated in the following ways:
  ///
  /// <ul>
  /// <li>
  /// <b>USER_INITIATED</b> – A manual pipeline build request.
  /// </li>
  /// <li>
  /// <b>SCHEDULED</b> – A pipeline build initiated by a cron expression in the
  /// Image Builder pipeline, or from EventBridge.
  /// </li>
  /// <li>
  /// <b>IMPORT</b> – A VM import created the image to use as the base image for
  /// the recipe.
  /// </li>
  /// </ul>
  final BuildType? buildType;

  /// For container images, this is the container recipe that Image Builder used
  /// to create the image. For images that distribute an AMI, this is empty.
  final ContainerRecipe? containerRecipe;

  /// The date on which Image Builder created this image.
  final String? dateCreated;

  /// The time when deprecation occurs for an image resource. This can be a past
  /// or future date.
  final DateTime? deprecationTime;

  /// The distribution configuration that Image Builder used to create this image.
  final DistributionConfiguration? distributionConfiguration;

  /// Indicates whether Image Builder collects additional information about the
  /// image, such as the operating system (OS) version and package list.
  final bool? enhancedImageMetadataEnabled;

  /// The name or Amazon Resource Name (ARN) for the IAM role you create that
  /// grants Image Builder access to perform workflow actions.
  final String? executionRole;

  /// For images that distribute an AMI, this is the image recipe that Image
  /// Builder used to create the image. For container images, this is empty.
  final ImageRecipe? imageRecipe;

  /// Contains settings for vulnerability scans.
  final ImageScanningConfiguration? imageScanningConfiguration;

  /// The origin of the base image that Image Builder used to build this image.
  final ImageSource? imageSource;

  /// The image tests that ran when that Image Builder created this image.
  final ImageTestsConfiguration? imageTestsConfiguration;

  /// The infrastructure that Image Builder used to create this image.
  final InfrastructureConfiguration? infrastructureConfiguration;

  /// Identifies the last runtime instance of the lifecycle policy to take action
  /// on the image.
  final String? lifecycleExecutionId;

  /// The name of the image.
  final String? name;

  /// The operating system version for instances that launch from this image. For
  /// example, Amazon Linux 2, Ubuntu 18, or Microsoft Windows Server 2019.
  final String? osVersion;

  /// The output resources that Image Builder produces for this image.
  final OutputResources? outputResources;

  /// The image operating system platform, such as Linux or Windows.
  final Platform? platform;

  /// Contains information about the current state of scans for this image.
  final ImageScanState? scanState;

  /// The Amazon Resource Name (ARN) of the image pipeline that created this
  /// image.
  final String? sourcePipelineArn;

  /// The name of the image pipeline that created this image.
  final String? sourcePipelineName;

  /// The state of the image.
  final ImageState? state;

  /// The tags that apply to this image.
  final Map<String, String>? tags;

  /// Specifies whether this image produces an AMI or a container image.
  final ImageType? type;

  /// The semantic version of the image.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or 1073741823
  /// for each node. Image Builder automatically assigns the build number to the
  /// fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example, you
  /// might choose a software version pattern, such as 1.0.0, or a date, such as
  /// 2021.01.01.
  ///
  /// <b>Filtering:</b> With semantic versioning, you have the flexibility to use
  /// wildcards (x) to specify the most recent versions or nodes when selecting
  /// the base image or components for your recipe. When you use a wildcard in any
  /// node, all nodes to the right of the first wildcard must also be wildcards.
  /// </note>
  final String? version;

  /// Contains the build and test workflows that are associated with the image.
  final List<WorkflowConfiguration>? workflows;

  Image({
    this.arn,
    this.buildType,
    this.containerRecipe,
    this.dateCreated,
    this.deprecationTime,
    this.distributionConfiguration,
    this.enhancedImageMetadataEnabled,
    this.executionRole,
    this.imageRecipe,
    this.imageScanningConfiguration,
    this.imageSource,
    this.imageTestsConfiguration,
    this.infrastructureConfiguration,
    this.lifecycleExecutionId,
    this.name,
    this.osVersion,
    this.outputResources,
    this.platform,
    this.scanState,
    this.sourcePipelineArn,
    this.sourcePipelineName,
    this.state,
    this.tags,
    this.type,
    this.version,
    this.workflows,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      arn: json['arn'] as String?,
      buildType: (json['buildType'] as String?)?.toBuildType(),
      containerRecipe: json['containerRecipe'] != null
          ? ContainerRecipe.fromJson(
              json['containerRecipe'] as Map<String, dynamic>)
          : null,
      dateCreated: json['dateCreated'] as String?,
      deprecationTime: timeStampFromJson(json['deprecationTime']),
      distributionConfiguration: json['distributionConfiguration'] != null
          ? DistributionConfiguration.fromJson(
              json['distributionConfiguration'] as Map<String, dynamic>)
          : null,
      enhancedImageMetadataEnabled:
          json['enhancedImageMetadataEnabled'] as bool?,
      executionRole: json['executionRole'] as String?,
      imageRecipe: json['imageRecipe'] != null
          ? ImageRecipe.fromJson(json['imageRecipe'] as Map<String, dynamic>)
          : null,
      imageScanningConfiguration: json['imageScanningConfiguration'] != null
          ? ImageScanningConfiguration.fromJson(
              json['imageScanningConfiguration'] as Map<String, dynamic>)
          : null,
      imageSource: (json['imageSource'] as String?)?.toImageSource(),
      imageTestsConfiguration: json['imageTestsConfiguration'] != null
          ? ImageTestsConfiguration.fromJson(
              json['imageTestsConfiguration'] as Map<String, dynamic>)
          : null,
      infrastructureConfiguration: json['infrastructureConfiguration'] != null
          ? InfrastructureConfiguration.fromJson(
              json['infrastructureConfiguration'] as Map<String, dynamic>)
          : null,
      lifecycleExecutionId: json['lifecycleExecutionId'] as String?,
      name: json['name'] as String?,
      osVersion: json['osVersion'] as String?,
      outputResources: json['outputResources'] != null
          ? OutputResources.fromJson(
              json['outputResources'] as Map<String, dynamic>)
          : null,
      platform: (json['platform'] as String?)?.toPlatform(),
      scanState: json['scanState'] != null
          ? ImageScanState.fromJson(json['scanState'] as Map<String, dynamic>)
          : null,
      sourcePipelineArn: json['sourcePipelineArn'] as String?,
      sourcePipelineName: json['sourcePipelineName'] as String?,
      state: json['state'] != null
          ? ImageState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toImageType(),
      version: json['version'] as String?,
      workflows: (json['workflows'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final buildType = this.buildType;
    final containerRecipe = this.containerRecipe;
    final dateCreated = this.dateCreated;
    final deprecationTime = this.deprecationTime;
    final distributionConfiguration = this.distributionConfiguration;
    final enhancedImageMetadataEnabled = this.enhancedImageMetadataEnabled;
    final executionRole = this.executionRole;
    final imageRecipe = this.imageRecipe;
    final imageScanningConfiguration = this.imageScanningConfiguration;
    final imageSource = this.imageSource;
    final imageTestsConfiguration = this.imageTestsConfiguration;
    final infrastructureConfiguration = this.infrastructureConfiguration;
    final lifecycleExecutionId = this.lifecycleExecutionId;
    final name = this.name;
    final osVersion = this.osVersion;
    final outputResources = this.outputResources;
    final platform = this.platform;
    final scanState = this.scanState;
    final sourcePipelineArn = this.sourcePipelineArn;
    final sourcePipelineName = this.sourcePipelineName;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    final version = this.version;
    final workflows = this.workflows;
    return {
      if (arn != null) 'arn': arn,
      if (buildType != null) 'buildType': buildType.toValue(),
      if (containerRecipe != null) 'containerRecipe': containerRecipe,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (deprecationTime != null)
        'deprecationTime': unixTimestampToJson(deprecationTime),
      if (distributionConfiguration != null)
        'distributionConfiguration': distributionConfiguration,
      if (enhancedImageMetadataEnabled != null)
        'enhancedImageMetadataEnabled': enhancedImageMetadataEnabled,
      if (executionRole != null) 'executionRole': executionRole,
      if (imageRecipe != null) 'imageRecipe': imageRecipe,
      if (imageScanningConfiguration != null)
        'imageScanningConfiguration': imageScanningConfiguration,
      if (imageSource != null) 'imageSource': imageSource.toValue(),
      if (imageTestsConfiguration != null)
        'imageTestsConfiguration': imageTestsConfiguration,
      if (infrastructureConfiguration != null)
        'infrastructureConfiguration': infrastructureConfiguration,
      if (lifecycleExecutionId != null)
        'lifecycleExecutionId': lifecycleExecutionId,
      if (name != null) 'name': name,
      if (osVersion != null) 'osVersion': osVersion,
      if (outputResources != null) 'outputResources': outputResources,
      if (platform != null) 'platform': platform.toValue(),
      if (scanState != null) 'scanState': scanState,
      if (sourcePipelineArn != null) 'sourcePipelineArn': sourcePipelineArn,
      if (sourcePipelineName != null) 'sourcePipelineName': sourcePipelineName,
      if (state != null) 'state': state,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
      if (workflows != null) 'workflows': workflows,
    };
  }
}

/// Contains vulnerability counts for a specific image.
class ImageAggregation {
  /// The Amazon Resource Name (ARN) that identifies the image for this
  /// aggregation.
  final String? imageBuildVersionArn;

  /// Counts by severity level for medium severity and higher level findings, plus
  /// a total for all of the findings for the specified image.
  final SeverityCounts? severityCounts;

  ImageAggregation({
    this.imageBuildVersionArn,
    this.severityCounts,
  });

  factory ImageAggregation.fromJson(Map<String, dynamic> json) {
    return ImageAggregation(
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final severityCounts = this.severityCounts;
    return {
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// Represents a package installed on an Image Builder image.
class ImagePackage {
  /// The name of the package as reported to the operating system package manager.
  final String? packageName;

  /// The version of the package as reported to the operating system package
  /// manager.
  final String? packageVersion;

  ImagePackage({
    this.packageName,
    this.packageVersion,
  });

  factory ImagePackage.fromJson(Map<String, dynamic> json) {
    return ImagePackage(
      packageName: json['packageName'] as String?,
      packageVersion: json['packageVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final packageName = this.packageName;
    final packageVersion = this.packageVersion;
    return {
      if (packageName != null) 'packageName': packageName,
      if (packageVersion != null) 'packageVersion': packageVersion,
    };
  }
}

/// Details of an image pipeline.
class ImagePipeline {
  /// The Amazon Resource Name (ARN) of the image pipeline.
  final String? arn;

  /// The Amazon Resource Name (ARN) of the container recipe that is used for this
  /// pipeline.
  final String? containerRecipeArn;

  /// The date on which this image pipeline was created.
  final String? dateCreated;

  /// This is no longer supported, and does not return a value.
  final String? dateLastRun;

  /// The next date when the pipeline is scheduled to run.
  final String? dateNextRun;

  /// The date on which this image pipeline was last updated.
  final String? dateUpdated;

  /// The description of the image pipeline.
  final String? description;

  /// The Amazon Resource Name (ARN) of the distribution configuration associated
  /// with this image pipeline.
  final String? distributionConfigurationArn;

  /// Collects additional information about the image being created, including the
  /// operating system (OS) version and package list. This information is used to
  /// enhance the overall experience of using EC2 Image Builder. Enabled by
  /// default.
  final bool? enhancedImageMetadataEnabled;

  /// The name or Amazon Resource Name (ARN) for the IAM role you create that
  /// grants Image Builder access to perform workflow actions.
  final String? executionRole;

  /// The Amazon Resource Name (ARN) of the image recipe associated with this
  /// image pipeline.
  final String? imageRecipeArn;

  /// Contains settings for vulnerability scans.
  final ImageScanningConfiguration? imageScanningConfiguration;

  /// The image tests configuration of the image pipeline.
  final ImageTestsConfiguration? imageTestsConfiguration;

  /// The Amazon Resource Name (ARN) of the infrastructure configuration
  /// associated with this image pipeline.
  final String? infrastructureConfigurationArn;

  /// The name of the image pipeline.
  final String? name;

  /// The platform of the image pipeline.
  final Platform? platform;

  /// The schedule of the image pipeline.
  final Schedule? schedule;

  /// The status of the image pipeline.
  final PipelineStatus? status;

  /// The tags of this image pipeline.
  final Map<String, String>? tags;

  /// Contains the workflows that run for the image pipeline.
  final List<WorkflowConfiguration>? workflows;

  ImagePipeline({
    this.arn,
    this.containerRecipeArn,
    this.dateCreated,
    this.dateLastRun,
    this.dateNextRun,
    this.dateUpdated,
    this.description,
    this.distributionConfigurationArn,
    this.enhancedImageMetadataEnabled,
    this.executionRole,
    this.imageRecipeArn,
    this.imageScanningConfiguration,
    this.imageTestsConfiguration,
    this.infrastructureConfigurationArn,
    this.name,
    this.platform,
    this.schedule,
    this.status,
    this.tags,
    this.workflows,
  });

  factory ImagePipeline.fromJson(Map<String, dynamic> json) {
    return ImagePipeline(
      arn: json['arn'] as String?,
      containerRecipeArn: json['containerRecipeArn'] as String?,
      dateCreated: json['dateCreated'] as String?,
      dateLastRun: json['dateLastRun'] as String?,
      dateNextRun: json['dateNextRun'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
      description: json['description'] as String?,
      distributionConfigurationArn:
          json['distributionConfigurationArn'] as String?,
      enhancedImageMetadataEnabled:
          json['enhancedImageMetadataEnabled'] as bool?,
      executionRole: json['executionRole'] as String?,
      imageRecipeArn: json['imageRecipeArn'] as String?,
      imageScanningConfiguration: json['imageScanningConfiguration'] != null
          ? ImageScanningConfiguration.fromJson(
              json['imageScanningConfiguration'] as Map<String, dynamic>)
          : null,
      imageTestsConfiguration: json['imageTestsConfiguration'] != null
          ? ImageTestsConfiguration.fromJson(
              json['imageTestsConfiguration'] as Map<String, dynamic>)
          : null,
      infrastructureConfigurationArn:
          json['infrastructureConfigurationArn'] as String?,
      name: json['name'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      schedule: json['schedule'] != null
          ? Schedule.fromJson(json['schedule'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toPipelineStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      workflows: (json['workflows'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final containerRecipeArn = this.containerRecipeArn;
    final dateCreated = this.dateCreated;
    final dateLastRun = this.dateLastRun;
    final dateNextRun = this.dateNextRun;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final distributionConfigurationArn = this.distributionConfigurationArn;
    final enhancedImageMetadataEnabled = this.enhancedImageMetadataEnabled;
    final executionRole = this.executionRole;
    final imageRecipeArn = this.imageRecipeArn;
    final imageScanningConfiguration = this.imageScanningConfiguration;
    final imageTestsConfiguration = this.imageTestsConfiguration;
    final infrastructureConfigurationArn = this.infrastructureConfigurationArn;
    final name = this.name;
    final platform = this.platform;
    final schedule = this.schedule;
    final status = this.status;
    final tags = this.tags;
    final workflows = this.workflows;
    return {
      if (arn != null) 'arn': arn,
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (dateLastRun != null) 'dateLastRun': dateLastRun,
      if (dateNextRun != null) 'dateNextRun': dateNextRun,
      if (dateUpdated != null) 'dateUpdated': dateUpdated,
      if (description != null) 'description': description,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (enhancedImageMetadataEnabled != null)
        'enhancedImageMetadataEnabled': enhancedImageMetadataEnabled,
      if (executionRole != null) 'executionRole': executionRole,
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (imageScanningConfiguration != null)
        'imageScanningConfiguration': imageScanningConfiguration,
      if (imageTestsConfiguration != null)
        'imageTestsConfiguration': imageTestsConfiguration,
      if (infrastructureConfigurationArn != null)
        'infrastructureConfigurationArn': infrastructureConfigurationArn,
      if (name != null) 'name': name,
      if (platform != null) 'platform': platform.toValue(),
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (workflows != null) 'workflows': workflows,
    };
  }
}

/// Contains vulnerability counts for a specific image pipeline.
class ImagePipelineAggregation {
  /// The Amazon Resource Name (ARN) that identifies the image pipeline for this
  /// aggregation.
  final String? imagePipelineArn;

  /// Counts by severity level for medium severity and higher level findings, plus
  /// a total for all of the findings for the specified image pipeline.
  final SeverityCounts? severityCounts;

  ImagePipelineAggregation({
    this.imagePipelineArn,
    this.severityCounts,
  });

  factory ImagePipelineAggregation.fromJson(Map<String, dynamic> json) {
    return ImagePipelineAggregation(
      imagePipelineArn: json['imagePipelineArn'] as String?,
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imagePipelineArn = this.imagePipelineArn;
    final severityCounts = this.severityCounts;
    return {
      if (imagePipelineArn != null) 'imagePipelineArn': imagePipelineArn,
      if (severityCounts != null) 'severityCounts': severityCounts,
    };
  }
}

/// An image recipe.
class ImageRecipe {
  /// Before you create a new AMI, Image Builder launches temporary Amazon EC2
  /// instances to build and test your image configuration. Instance configuration
  /// adds a layer of control over those instances. You can define settings and
  /// add scripts to run when an instance is launched from your AMI.
  final AdditionalInstanceConfiguration? additionalInstanceConfiguration;

  /// The Amazon Resource Name (ARN) of the image recipe.
  final String? arn;

  /// The block device mappings to apply when creating images from this recipe.
  final List<InstanceBlockDeviceMapping>? blockDeviceMappings;

  /// The components that are included in the image recipe. Recipes require a
  /// minimum of one build component, and can have a maximum of 20 build and test
  /// components in any combination.
  final List<ComponentConfiguration>? components;

  /// The date on which this image recipe was created.
  final String? dateCreated;

  /// The description of the image recipe.
  final String? description;

  /// The name of the image recipe.
  final String? name;

  /// The owner of the image recipe.
  final String? owner;

  /// The base image of the image recipe.
  final String? parentImage;

  /// The platform of the image recipe.
  final Platform? platform;

  /// The tags of the image recipe.
  final Map<String, String>? tags;

  /// Specifies which type of image is created by the recipe - an AMI or a
  /// container image.
  final ImageType? type;

  /// The version of the image recipe.
  final String? version;

  /// The working directory to be used during build and test workflows.
  final String? workingDirectory;

  ImageRecipe({
    this.additionalInstanceConfiguration,
    this.arn,
    this.blockDeviceMappings,
    this.components,
    this.dateCreated,
    this.description,
    this.name,
    this.owner,
    this.parentImage,
    this.platform,
    this.tags,
    this.type,
    this.version,
    this.workingDirectory,
  });

  factory ImageRecipe.fromJson(Map<String, dynamic> json) {
    return ImageRecipe(
      additionalInstanceConfiguration:
          json['additionalInstanceConfiguration'] != null
              ? AdditionalInstanceConfiguration.fromJson(
                  json['additionalInstanceConfiguration']
                      as Map<String, dynamic>)
              : null,
      arn: json['arn'] as String?,
      blockDeviceMappings: (json['blockDeviceMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              InstanceBlockDeviceMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      components: (json['components'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ComponentConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      dateCreated: json['dateCreated'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      parentImage: json['parentImage'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toImageType(),
      version: json['version'] as String?,
      workingDirectory: json['workingDirectory'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final additionalInstanceConfiguration =
        this.additionalInstanceConfiguration;
    final arn = this.arn;
    final blockDeviceMappings = this.blockDeviceMappings;
    final components = this.components;
    final dateCreated = this.dateCreated;
    final description = this.description;
    final name = this.name;
    final owner = this.owner;
    final parentImage = this.parentImage;
    final platform = this.platform;
    final tags = this.tags;
    final type = this.type;
    final version = this.version;
    final workingDirectory = this.workingDirectory;
    return {
      if (additionalInstanceConfiguration != null)
        'additionalInstanceConfiguration': additionalInstanceConfiguration,
      if (arn != null) 'arn': arn,
      if (blockDeviceMappings != null)
        'blockDeviceMappings': blockDeviceMappings,
      if (components != null) 'components': components,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (parentImage != null) 'parentImage': parentImage,
      if (platform != null) 'platform': platform.toValue(),
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
      if (workingDirectory != null) 'workingDirectory': workingDirectory,
    };
  }
}

/// A summary of an image recipe.
class ImageRecipeSummary {
  /// The Amazon Resource Name (ARN) of the image recipe.
  final String? arn;

  /// The date on which this image recipe was created.
  final String? dateCreated;

  /// The name of the image recipe.
  final String? name;

  /// The owner of the image recipe.
  final String? owner;

  /// The base image of the image recipe.
  final String? parentImage;

  /// The platform of the image recipe.
  final Platform? platform;

  /// The tags of the image recipe.
  final Map<String, String>? tags;

  ImageRecipeSummary({
    this.arn,
    this.dateCreated,
    this.name,
    this.owner,
    this.parentImage,
    this.platform,
    this.tags,
  });

  factory ImageRecipeSummary.fromJson(Map<String, dynamic> json) {
    return ImageRecipeSummary(
      arn: json['arn'] as String?,
      dateCreated: json['dateCreated'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      parentImage: json['parentImage'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final name = this.name;
    final owner = this.owner;
    final parentImage = this.parentImage;
    final platform = this.platform;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (parentImage != null) 'parentImage': parentImage,
      if (platform != null) 'platform': platform.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// Contains details about a vulnerability scan finding.
class ImageScanFinding {
  /// The Amazon Web Services account ID that's associated with the finding.
  final String? awsAccountId;

  /// The description of the finding.
  final String? description;

  /// The date and time when the finding was first observed.
  final DateTime? firstObservedAt;

  /// Details about whether a fix is available for any of the packages that are
  /// identified in the finding through a version update.
  final String? fixAvailable;

  /// The Amazon Resource Name (ARN) of the image build version that's associated
  /// with the finding.
  final String? imageBuildVersionArn;

  /// The Amazon Resource Name (ARN) of the image pipeline that's associated with
  /// the finding.
  final String? imagePipelineArn;

  /// The score that Amazon Inspector assigned for the finding.
  final double? inspectorScore;

  /// An object that contains details of the Amazon Inspector score.
  final InspectorScoreDetails? inspectorScoreDetails;

  /// An object that contains the details of a package vulnerability finding.
  final PackageVulnerabilityDetails? packageVulnerabilityDetails;

  /// An object that contains the details about how to remediate the finding.
  final Remediation? remediation;

  /// The severity of the finding.
  final String? severity;

  /// The title of the finding.
  final String? title;

  /// The type of the finding. Image Builder looks for findings of the type
  /// <code>PACKAGE_VULNERABILITY</code> that apply to output images, and excludes
  /// other types.
  final String? type;

  /// The timestamp when the finding was last updated.
  final DateTime? updatedAt;

  ImageScanFinding({
    this.awsAccountId,
    this.description,
    this.firstObservedAt,
    this.fixAvailable,
    this.imageBuildVersionArn,
    this.imagePipelineArn,
    this.inspectorScore,
    this.inspectorScoreDetails,
    this.packageVulnerabilityDetails,
    this.remediation,
    this.severity,
    this.title,
    this.type,
    this.updatedAt,
  });

  factory ImageScanFinding.fromJson(Map<String, dynamic> json) {
    return ImageScanFinding(
      awsAccountId: json['awsAccountId'] as String?,
      description: json['description'] as String?,
      firstObservedAt: timeStampFromJson(json['firstObservedAt']),
      fixAvailable: json['fixAvailable'] as String?,
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      imagePipelineArn: json['imagePipelineArn'] as String?,
      inspectorScore: json['inspectorScore'] as double?,
      inspectorScoreDetails: json['inspectorScoreDetails'] != null
          ? InspectorScoreDetails.fromJson(
              json['inspectorScoreDetails'] as Map<String, dynamic>)
          : null,
      packageVulnerabilityDetails: json['packageVulnerabilityDetails'] != null
          ? PackageVulnerabilityDetails.fromJson(
              json['packageVulnerabilityDetails'] as Map<String, dynamic>)
          : null,
      remediation: json['remediation'] != null
          ? Remediation.fromJson(json['remediation'] as Map<String, dynamic>)
          : null,
      severity: json['severity'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final description = this.description;
    final firstObservedAt = this.firstObservedAt;
    final fixAvailable = this.fixAvailable;
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final imagePipelineArn = this.imagePipelineArn;
    final inspectorScore = this.inspectorScore;
    final inspectorScoreDetails = this.inspectorScoreDetails;
    final packageVulnerabilityDetails = this.packageVulnerabilityDetails;
    final remediation = this.remediation;
    final severity = this.severity;
    final title = this.title;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (description != null) 'description': description,
      if (firstObservedAt != null)
        'firstObservedAt': unixTimestampToJson(firstObservedAt),
      if (fixAvailable != null) 'fixAvailable': fixAvailable,
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (imagePipelineArn != null) 'imagePipelineArn': imagePipelineArn,
      if (inspectorScore != null) 'inspectorScore': inspectorScore,
      if (inspectorScoreDetails != null)
        'inspectorScoreDetails': inspectorScoreDetails,
      if (packageVulnerabilityDetails != null)
        'packageVulnerabilityDetails': packageVulnerabilityDetails,
      if (remediation != null) 'remediation': remediation,
      if (severity != null) 'severity': severity,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// This returns exactly one type of aggregation, based on the filter that Image
/// Builder applies in its API action.
class ImageScanFindingAggregation {
  /// Returns an object that contains severity counts based on an account ID.
  final AccountAggregation? accountAggregation;

  /// Returns an object that contains severity counts based on the Amazon Resource
  /// Name (ARN) for a specific image.
  final ImageAggregation? imageAggregation;

  /// Returns an object that contains severity counts based on an image pipeline
  /// ARN.
  final ImagePipelineAggregation? imagePipelineAggregation;

  /// Returns an object that contains severity counts based on vulnerability ID.
  final VulnerabilityIdAggregation? vulnerabilityIdAggregation;

  ImageScanFindingAggregation({
    this.accountAggregation,
    this.imageAggregation,
    this.imagePipelineAggregation,
    this.vulnerabilityIdAggregation,
  });

  factory ImageScanFindingAggregation.fromJson(Map<String, dynamic> json) {
    return ImageScanFindingAggregation(
      accountAggregation: json['accountAggregation'] != null
          ? AccountAggregation.fromJson(
              json['accountAggregation'] as Map<String, dynamic>)
          : null,
      imageAggregation: json['imageAggregation'] != null
          ? ImageAggregation.fromJson(
              json['imageAggregation'] as Map<String, dynamic>)
          : null,
      imagePipelineAggregation: json['imagePipelineAggregation'] != null
          ? ImagePipelineAggregation.fromJson(
              json['imagePipelineAggregation'] as Map<String, dynamic>)
          : null,
      vulnerabilityIdAggregation: json['vulnerabilityIdAggregation'] != null
          ? VulnerabilityIdAggregation.fromJson(
              json['vulnerabilityIdAggregation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountAggregation = this.accountAggregation;
    final imageAggregation = this.imageAggregation;
    final imagePipelineAggregation = this.imagePipelineAggregation;
    final vulnerabilityIdAggregation = this.vulnerabilityIdAggregation;
    return {
      if (accountAggregation != null) 'accountAggregation': accountAggregation,
      if (imageAggregation != null) 'imageAggregation': imageAggregation,
      if (imagePipelineAggregation != null)
        'imagePipelineAggregation': imagePipelineAggregation,
      if (vulnerabilityIdAggregation != null)
        'vulnerabilityIdAggregation': vulnerabilityIdAggregation,
    };
  }
}

/// A name value pair that Image Builder applies to streamline results from the
/// vulnerability scan findings list action.
class ImageScanFindingsFilter {
  /// The name of the image scan finding filter. Filter names are case-sensitive.
  final String? name;

  /// The filter values. Filter values are case-sensitive.
  final List<String>? values;

  ImageScanFindingsFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name,
      if (values != null) 'values': values,
    };
  }
}

/// Shows the vulnerability scan status for a specific image, and the reason for
/// that status.
class ImageScanState {
  /// The reason for the scan status for the image.
  final String? reason;

  /// The current state of vulnerability scans for the image.
  final ImageScanStatus? status;

  ImageScanState({
    this.reason,
    this.status,
  });

  factory ImageScanState.fromJson(Map<String, dynamic> json) {
    return ImageScanState(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toImageScanStatus(),
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

enum ImageScanStatus {
  pending,
  scanning,
  collecting,
  completed,
  abandoned,
  failed,
  timedOut,
}

extension ImageScanStatusValueExtension on ImageScanStatus {
  String toValue() {
    switch (this) {
      case ImageScanStatus.pending:
        return 'PENDING';
      case ImageScanStatus.scanning:
        return 'SCANNING';
      case ImageScanStatus.collecting:
        return 'COLLECTING';
      case ImageScanStatus.completed:
        return 'COMPLETED';
      case ImageScanStatus.abandoned:
        return 'ABANDONED';
      case ImageScanStatus.failed:
        return 'FAILED';
      case ImageScanStatus.timedOut:
        return 'TIMED_OUT';
    }
  }
}

extension ImageScanStatusFromString on String {
  ImageScanStatus toImageScanStatus() {
    switch (this) {
      case 'PENDING':
        return ImageScanStatus.pending;
      case 'SCANNING':
        return ImageScanStatus.scanning;
      case 'COLLECTING':
        return ImageScanStatus.collecting;
      case 'COMPLETED':
        return ImageScanStatus.completed;
      case 'ABANDONED':
        return ImageScanStatus.abandoned;
      case 'FAILED':
        return ImageScanStatus.failed;
      case 'TIMED_OUT':
        return ImageScanStatus.timedOut;
    }
    throw Exception('$this is not known in enum ImageScanStatus');
  }
}

/// Contains settings for Image Builder image resource and container image
/// scans.
class ImageScanningConfiguration {
  /// Contains Amazon ECR settings for vulnerability scans.
  final EcrConfiguration? ecrConfiguration;

  /// A setting that indicates whether Image Builder keeps a snapshot of the
  /// vulnerability scans that Amazon Inspector runs against the build instance
  /// when you create a new image.
  final bool? imageScanningEnabled;

  ImageScanningConfiguration({
    this.ecrConfiguration,
    this.imageScanningEnabled,
  });

  factory ImageScanningConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageScanningConfiguration(
      ecrConfiguration: json['ecrConfiguration'] != null
          ? EcrConfiguration.fromJson(
              json['ecrConfiguration'] as Map<String, dynamic>)
          : null,
      imageScanningEnabled: json['imageScanningEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final ecrConfiguration = this.ecrConfiguration;
    final imageScanningEnabled = this.imageScanningEnabled;
    return {
      if (ecrConfiguration != null) 'ecrConfiguration': ecrConfiguration,
      if (imageScanningEnabled != null)
        'imageScanningEnabled': imageScanningEnabled,
    };
  }
}

enum ImageSource {
  amazonManaged,
  awsMarketplace,
  imported,
  custom,
}

extension ImageSourceValueExtension on ImageSource {
  String toValue() {
    switch (this) {
      case ImageSource.amazonManaged:
        return 'AMAZON_MANAGED';
      case ImageSource.awsMarketplace:
        return 'AWS_MARKETPLACE';
      case ImageSource.imported:
        return 'IMPORTED';
      case ImageSource.custom:
        return 'CUSTOM';
    }
  }
}

extension ImageSourceFromString on String {
  ImageSource toImageSource() {
    switch (this) {
      case 'AMAZON_MANAGED':
        return ImageSource.amazonManaged;
      case 'AWS_MARKETPLACE':
        return ImageSource.awsMarketplace;
      case 'IMPORTED':
        return ImageSource.imported;
      case 'CUSTOM':
        return ImageSource.custom;
    }
    throw Exception('$this is not known in enum ImageSource');
  }
}

/// Image status and the reason for that status.
class ImageState {
  /// The reason for the status of the image.
  final String? reason;

  /// The status of the image.
  final ImageStatus? status;

  ImageState({
    this.reason,
    this.status,
  });

  factory ImageState.fromJson(Map<String, dynamic> json) {
    return ImageState(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toImageStatus(),
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

enum ImageStatus {
  pending,
  creating,
  building,
  testing,
  distributing,
  integrating,
  available,
  cancelled,
  failed,
  deprecated,
  deleted,
  disabled,
}

extension ImageStatusValueExtension on ImageStatus {
  String toValue() {
    switch (this) {
      case ImageStatus.pending:
        return 'PENDING';
      case ImageStatus.creating:
        return 'CREATING';
      case ImageStatus.building:
        return 'BUILDING';
      case ImageStatus.testing:
        return 'TESTING';
      case ImageStatus.distributing:
        return 'DISTRIBUTING';
      case ImageStatus.integrating:
        return 'INTEGRATING';
      case ImageStatus.available:
        return 'AVAILABLE';
      case ImageStatus.cancelled:
        return 'CANCELLED';
      case ImageStatus.failed:
        return 'FAILED';
      case ImageStatus.deprecated:
        return 'DEPRECATED';
      case ImageStatus.deleted:
        return 'DELETED';
      case ImageStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ImageStatusFromString on String {
  ImageStatus toImageStatus() {
    switch (this) {
      case 'PENDING':
        return ImageStatus.pending;
      case 'CREATING':
        return ImageStatus.creating;
      case 'BUILDING':
        return ImageStatus.building;
      case 'TESTING':
        return ImageStatus.testing;
      case 'DISTRIBUTING':
        return ImageStatus.distributing;
      case 'INTEGRATING':
        return ImageStatus.integrating;
      case 'AVAILABLE':
        return ImageStatus.available;
      case 'CANCELLED':
        return ImageStatus.cancelled;
      case 'FAILED':
        return ImageStatus.failed;
      case 'DEPRECATED':
        return ImageStatus.deprecated;
      case 'DELETED':
        return ImageStatus.deleted;
      case 'DISABLED':
        return ImageStatus.disabled;
    }
    throw Exception('$this is not known in enum ImageStatus');
  }
}

/// An image summary.
class ImageSummary {
  /// The Amazon Resource Name (ARN) of the image.
  final String? arn;

  /// Indicates the type of build that created this image. The build can be
  /// initiated in the following ways:
  ///
  /// <ul>
  /// <li>
  /// <b>USER_INITIATED</b> – A manual pipeline build request.
  /// </li>
  /// <li>
  /// <b>SCHEDULED</b> – A pipeline build initiated by a cron expression in the
  /// Image Builder pipeline, or from EventBridge.
  /// </li>
  /// <li>
  /// <b>IMPORT</b> – A VM import created the image to use as the base image for
  /// the recipe.
  /// </li>
  /// </ul>
  final BuildType? buildType;

  /// The date on which Image Builder created this image.
  final String? dateCreated;

  /// The time when deprecation occurs for an image resource. This can be a past
  /// or future date.
  final DateTime? deprecationTime;

  /// The origin of the base image that Image Builder used to build this image.
  final ImageSource? imageSource;

  /// Identifies the last runtime instance of the lifecycle policy to take action
  /// on the image.
  final String? lifecycleExecutionId;

  /// The name of the image.
  final String? name;

  /// The operating system version of the instances that launch from this image.
  /// For example, Amazon Linux 2, Ubuntu 18, or Microsoft Windows Server 2019.
  final String? osVersion;

  /// The output resources that Image Builder produced when it created this image.
  final OutputResources? outputResources;

  /// The owner of the image.
  final String? owner;

  /// The image operating system platform, such as Linux or Windows.
  final Platform? platform;

  /// The state of the image.
  final ImageState? state;

  /// The tags that apply to this image.
  final Map<String, String>? tags;

  /// Specifies whether this image produces an AMI or a container image.
  final ImageType? type;

  /// The version of the image.
  final String? version;

  ImageSummary({
    this.arn,
    this.buildType,
    this.dateCreated,
    this.deprecationTime,
    this.imageSource,
    this.lifecycleExecutionId,
    this.name,
    this.osVersion,
    this.outputResources,
    this.owner,
    this.platform,
    this.state,
    this.tags,
    this.type,
    this.version,
  });

  factory ImageSummary.fromJson(Map<String, dynamic> json) {
    return ImageSummary(
      arn: json['arn'] as String?,
      buildType: (json['buildType'] as String?)?.toBuildType(),
      dateCreated: json['dateCreated'] as String?,
      deprecationTime: timeStampFromJson(json['deprecationTime']),
      imageSource: (json['imageSource'] as String?)?.toImageSource(),
      lifecycleExecutionId: json['lifecycleExecutionId'] as String?,
      name: json['name'] as String?,
      osVersion: json['osVersion'] as String?,
      outputResources: json['outputResources'] != null
          ? OutputResources.fromJson(
              json['outputResources'] as Map<String, dynamic>)
          : null,
      owner: json['owner'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      state: json['state'] != null
          ? ImageState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toImageType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final buildType = this.buildType;
    final dateCreated = this.dateCreated;
    final deprecationTime = this.deprecationTime;
    final imageSource = this.imageSource;
    final lifecycleExecutionId = this.lifecycleExecutionId;
    final name = this.name;
    final osVersion = this.osVersion;
    final outputResources = this.outputResources;
    final owner = this.owner;
    final platform = this.platform;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (buildType != null) 'buildType': buildType.toValue(),
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (deprecationTime != null)
        'deprecationTime': unixTimestampToJson(deprecationTime),
      if (imageSource != null) 'imageSource': imageSource.toValue(),
      if (lifecycleExecutionId != null)
        'lifecycleExecutionId': lifecycleExecutionId,
      if (name != null) 'name': name,
      if (osVersion != null) 'osVersion': osVersion,
      if (outputResources != null) 'outputResources': outputResources,
      if (owner != null) 'owner': owner,
      if (platform != null) 'platform': platform.toValue(),
      if (state != null) 'state': state,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// Configure image tests for your pipeline build. Tests run after building the
/// image, to verify that the AMI or container image is valid before
/// distributing it.
class ImageTestsConfiguration {
  /// Determines if tests should run after building the image. Image Builder
  /// defaults to enable tests to run following the image build, before image
  /// distribution.
  final bool? imageTestsEnabled;

  /// The maximum time in minutes that tests are permitted to run.
  /// <note>
  /// The timeoutMinutes attribute is not currently active. This value is ignored.
  /// </note>
  final int? timeoutMinutes;

  ImageTestsConfiguration({
    this.imageTestsEnabled,
    this.timeoutMinutes,
  });

  factory ImageTestsConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageTestsConfiguration(
      imageTestsEnabled: json['imageTestsEnabled'] as bool?,
      timeoutMinutes: json['timeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageTestsEnabled = this.imageTestsEnabled;
    final timeoutMinutes = this.timeoutMinutes;
    return {
      if (imageTestsEnabled != null) 'imageTestsEnabled': imageTestsEnabled,
      if (timeoutMinutes != null) 'timeoutMinutes': timeoutMinutes,
    };
  }
}

enum ImageType {
  ami,
  docker,
}

extension ImageTypeValueExtension on ImageType {
  String toValue() {
    switch (this) {
      case ImageType.ami:
        return 'AMI';
      case ImageType.docker:
        return 'DOCKER';
    }
  }
}

extension ImageTypeFromString on String {
  ImageType toImageType() {
    switch (this) {
      case 'AMI':
        return ImageType.ami;
      case 'DOCKER':
        return ImageType.docker;
    }
    throw Exception('$this is not known in enum ImageType');
  }
}

/// The defining characteristics of a specific version of an Image Builder
/// image.
class ImageVersion {
  /// The Amazon Resource Name (ARN) of a specific version of an Image Builder
  /// image.
  /// <note>
  /// Semantic versioning is included in each object's Amazon Resource Name (ARN),
  /// at the level that applies to that object as follows:
  /// <ol>
  /// <li>
  /// Versionless ARNs and Name ARNs do not include specific values in any of the
  /// nodes. The nodes are either left off entirely, or they are specified as
  /// wildcards, for example: x.x.x.
  /// </li>
  /// <li>
  /// Version ARNs have only the first three nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;
  /// </li>
  /// <li>
  /// Build version ARNs have all four nodes, and point to a specific build for a
  /// specific version of an object.
  /// </li> </ol> </note>
  final String? arn;

  /// Indicates the type of build that created this image. The build can be
  /// initiated in the following ways:
  ///
  /// <ul>
  /// <li>
  /// <b>USER_INITIATED</b> – A manual pipeline build request.
  /// </li>
  /// <li>
  /// <b>SCHEDULED</b> – A pipeline build initiated by a cron expression in the
  /// Image Builder pipeline, or from EventBridge.
  /// </li>
  /// <li>
  /// <b>IMPORT</b> – A VM import created the image to use as the base image for
  /// the recipe.
  /// </li>
  /// </ul>
  final BuildType? buildType;

  /// The date on which this specific version of the Image Builder image was
  /// created.
  final String? dateCreated;

  /// The origin of the base image that Image Builder used to build this image.
  final ImageSource? imageSource;

  /// The name of this specific version of an Image Builder image.
  final String? name;

  /// The operating system version of the Amazon EC2 build instance. For example,
  /// Amazon Linux 2, Ubuntu 18, or Microsoft Windows Server 2019.
  final String? osVersion;

  /// The owner of the image version.
  final String? owner;

  /// The operating system platform of the image version, for example "Windows" or
  /// "Linux".
  final Platform? platform;

  /// Specifies whether this image produces an AMI or a container image.
  final ImageType? type;

  /// Details for a specific version of an Image Builder image. This version
  /// follows the semantic version syntax.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Assignment:</b> For the first three nodes you can assign any positive
  /// integer value, including zero, with an upper limit of 2^30-1, or 1073741823
  /// for each node. Image Builder automatically assigns the build number to the
  /// fourth node.
  ///
  /// <b>Patterns:</b> You can use any numeric pattern that adheres to the
  /// assignment requirements for the nodes that you can assign. For example, you
  /// might choose a software version pattern, such as 1.0.0, or a date, such as
  /// 2021.01.01.
  ///
  /// <b>Filtering:</b> With semantic versioning, you have the flexibility to use
  /// wildcards (x) to specify the most recent versions or nodes when selecting
  /// the base image or components for your recipe. When you use a wildcard in any
  /// node, all nodes to the right of the first wildcard must also be wildcards.
  /// </note>
  final String? version;

  ImageVersion({
    this.arn,
    this.buildType,
    this.dateCreated,
    this.imageSource,
    this.name,
    this.osVersion,
    this.owner,
    this.platform,
    this.type,
    this.version,
  });

  factory ImageVersion.fromJson(Map<String, dynamic> json) {
    return ImageVersion(
      arn: json['arn'] as String?,
      buildType: (json['buildType'] as String?)?.toBuildType(),
      dateCreated: json['dateCreated'] as String?,
      imageSource: (json['imageSource'] as String?)?.toImageSource(),
      name: json['name'] as String?,
      osVersion: json['osVersion'] as String?,
      owner: json['owner'] as String?,
      platform: (json['platform'] as String?)?.toPlatform(),
      type: (json['type'] as String?)?.toImageType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final buildType = this.buildType;
    final dateCreated = this.dateCreated;
    final imageSource = this.imageSource;
    final name = this.name;
    final osVersion = this.osVersion;
    final owner = this.owner;
    final platform = this.platform;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (buildType != null) 'buildType': buildType.toValue(),
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (imageSource != null) 'imageSource': imageSource.toValue(),
      if (name != null) 'name': name,
      if (osVersion != null) 'osVersion': osVersion,
      if (owner != null) 'owner': owner,
      if (platform != null) 'platform': platform.toValue(),
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

class ImportComponentResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the imported component.
  final String? componentBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ImportComponentResponse({
    this.clientToken,
    this.componentBuildVersionArn,
    this.requestId,
  });

  factory ImportComponentResponse.fromJson(Map<String, dynamic> json) {
    return ImportComponentResponse(
      clientToken: json['clientToken'] as String?,
      componentBuildVersionArn: json['componentBuildVersionArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final componentBuildVersionArn = this.componentBuildVersionArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (componentBuildVersionArn != null)
        'componentBuildVersionArn': componentBuildVersionArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ImportVmImageResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the AMI that was created during the VM
  /// import process. This AMI is used as the base image for the recipe that
  /// imported the VM.
  final String? imageArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ImportVmImageResponse({
    this.clientToken,
    this.imageArn,
    this.requestId,
  });

  factory ImportVmImageResponse.fromJson(Map<String, dynamic> json) {
    return ImportVmImageResponse(
      clientToken: json['clientToken'] as String?,
      imageArn: json['imageArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final imageArn = this.imageArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (imageArn != null) 'imageArn': imageArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

/// Details of the infrastructure configuration.
class InfrastructureConfiguration {
  /// The Amazon Resource Name (ARN) of the infrastructure configuration.
  final String? arn;

  /// The date on which the infrastructure configuration was created.
  final String? dateCreated;

  /// The date on which the infrastructure configuration was last updated.
  final String? dateUpdated;

  /// The description of the infrastructure configuration.
  final String? description;

  /// The instance metadata option settings for the infrastructure configuration.
  final InstanceMetadataOptions? instanceMetadataOptions;

  /// The instance profile of the infrastructure configuration.
  final String? instanceProfileName;

  /// The instance types of the infrastructure configuration.
  final List<String>? instanceTypes;

  /// The Amazon EC2 key pair of the infrastructure configuration.
  final String? keyPair;

  /// The logging configuration of the infrastructure configuration.
  final Logging? logging;

  /// The name of the infrastructure configuration.
  final String? name;

  /// The tags attached to the resource created by Image Builder.
  final Map<String, String>? resourceTags;

  /// The security group IDs of the infrastructure configuration.
  final List<String>? securityGroupIds;

  /// The Amazon Resource Name (ARN) for the SNS topic to which we send image
  /// build event notifications.
  /// <note>
  /// EC2 Image Builder is unable to send notifications to SNS topics that are
  /// encrypted using keys from other accounts. The key that is used to encrypt
  /// the SNS topic must reside in the account that the Image Builder service runs
  /// under.
  /// </note>
  final String? snsTopicArn;

  /// The subnet ID of the infrastructure configuration.
  final String? subnetId;

  /// The tags of the infrastructure configuration.
  final Map<String, String>? tags;

  /// The terminate instance on failure configuration of the infrastructure
  /// configuration.
  final bool? terminateInstanceOnFailure;

  InfrastructureConfiguration({
    this.arn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.instanceMetadataOptions,
    this.instanceProfileName,
    this.instanceTypes,
    this.keyPair,
    this.logging,
    this.name,
    this.resourceTags,
    this.securityGroupIds,
    this.snsTopicArn,
    this.subnetId,
    this.tags,
    this.terminateInstanceOnFailure,
  });

  factory InfrastructureConfiguration.fromJson(Map<String, dynamic> json) {
    return InfrastructureConfiguration(
      arn: json['arn'] as String?,
      dateCreated: json['dateCreated'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
      description: json['description'] as String?,
      instanceMetadataOptions: json['instanceMetadataOptions'] != null
          ? InstanceMetadataOptions.fromJson(
              json['instanceMetadataOptions'] as Map<String, dynamic>)
          : null,
      instanceProfileName: json['instanceProfileName'] as String?,
      instanceTypes: (json['instanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      keyPair: json['keyPair'] as String?,
      logging: json['logging'] != null
          ? Logging.fromJson(json['logging'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      resourceTags: (json['resourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      snsTopicArn: json['snsTopicArn'] as String?,
      subnetId: json['subnetId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      terminateInstanceOnFailure: json['terminateInstanceOnFailure'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final instanceMetadataOptions = this.instanceMetadataOptions;
    final instanceProfileName = this.instanceProfileName;
    final instanceTypes = this.instanceTypes;
    final keyPair = this.keyPair;
    final logging = this.logging;
    final name = this.name;
    final resourceTags = this.resourceTags;
    final securityGroupIds = this.securityGroupIds;
    final snsTopicArn = this.snsTopicArn;
    final subnetId = this.subnetId;
    final tags = this.tags;
    final terminateInstanceOnFailure = this.terminateInstanceOnFailure;
    return {
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (dateUpdated != null) 'dateUpdated': dateUpdated,
      if (description != null) 'description': description,
      if (instanceMetadataOptions != null)
        'instanceMetadataOptions': instanceMetadataOptions,
      if (instanceProfileName != null)
        'instanceProfileName': instanceProfileName,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (keyPair != null) 'keyPair': keyPair,
      if (logging != null) 'logging': logging,
      if (name != null) 'name': name,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (snsTopicArn != null) 'snsTopicArn': snsTopicArn,
      if (subnetId != null) 'subnetId': subnetId,
      if (tags != null) 'tags': tags,
      if (terminateInstanceOnFailure != null)
        'terminateInstanceOnFailure': terminateInstanceOnFailure,
    };
  }
}

/// The infrastructure used when building Amazon EC2 AMIs.
class InfrastructureConfigurationSummary {
  /// The Amazon Resource Name (ARN) of the infrastructure configuration.
  final String? arn;

  /// The date on which the infrastructure configuration was created.
  final String? dateCreated;

  /// The date on which the infrastructure configuration was last updated.
  final String? dateUpdated;

  /// The description of the infrastructure configuration.
  final String? description;

  /// The instance profile of the infrastructure configuration.
  final String? instanceProfileName;

  /// The instance types of the infrastructure configuration.
  final List<String>? instanceTypes;

  /// The name of the infrastructure configuration.
  final String? name;

  /// The tags attached to the image created by Image Builder.
  final Map<String, String>? resourceTags;

  /// The tags of the infrastructure configuration.
  final Map<String, String>? tags;

  InfrastructureConfigurationSummary({
    this.arn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.instanceProfileName,
    this.instanceTypes,
    this.name,
    this.resourceTags,
    this.tags,
  });

  factory InfrastructureConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return InfrastructureConfigurationSummary(
      arn: json['arn'] as String?,
      dateCreated: json['dateCreated'] as String?,
      dateUpdated: json['dateUpdated'] as String?,
      description: json['description'] as String?,
      instanceProfileName: json['instanceProfileName'] as String?,
      instanceTypes: (json['instanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String?,
      resourceTags: (json['resourceTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final instanceProfileName = this.instanceProfileName;
    final instanceTypes = this.instanceTypes;
    final name = this.name;
    final resourceTags = this.resourceTags;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (dateUpdated != null) 'dateUpdated': dateUpdated,
      if (description != null) 'description': description,
      if (instanceProfileName != null)
        'instanceProfileName': instanceProfileName,
      if (instanceTypes != null) 'instanceTypes': instanceTypes,
      if (name != null) 'name': name,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about the factors that influenced the score that Amazon
/// Inspector assigned for a finding.
class InspectorScoreDetails {
  /// An object that contains details about an adjustment that Amazon Inspector
  /// made to the CVSS score for the finding.
  final CvssScoreDetails? adjustedCvss;

  InspectorScoreDetails({
    this.adjustedCvss,
  });

  factory InspectorScoreDetails.fromJson(Map<String, dynamic> json) {
    return InspectorScoreDetails(
      adjustedCvss: json['adjustedCvss'] != null
          ? CvssScoreDetails.fromJson(
              json['adjustedCvss'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adjustedCvss = this.adjustedCvss;
    return {
      if (adjustedCvss != null) 'adjustedCvss': adjustedCvss,
    };
  }
}

/// Defines block device mappings for the instance used to configure your image.
class InstanceBlockDeviceMapping {
  /// The device to which these mappings apply.
  final String? deviceName;

  /// Use to manage Amazon EBS-specific configuration for this mapping.
  final EbsInstanceBlockDeviceSpecification? ebs;

  /// Use to remove a mapping from the base image.
  final String? noDevice;

  /// Use to manage instance ephemeral devices.
  final String? virtualName;

  InstanceBlockDeviceMapping({
    this.deviceName,
    this.ebs,
    this.noDevice,
    this.virtualName,
  });

  factory InstanceBlockDeviceMapping.fromJson(Map<String, dynamic> json) {
    return InstanceBlockDeviceMapping(
      deviceName: json['deviceName'] as String?,
      ebs: json['ebs'] != null
          ? EbsInstanceBlockDeviceSpecification.fromJson(
              json['ebs'] as Map<String, dynamic>)
          : null,
      noDevice: json['noDevice'] as String?,
      virtualName: json['virtualName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final ebs = this.ebs;
    final noDevice = this.noDevice;
    final virtualName = this.virtualName;
    return {
      if (deviceName != null) 'deviceName': deviceName,
      if (ebs != null) 'ebs': ebs,
      if (noDevice != null) 'noDevice': noDevice,
      if (virtualName != null) 'virtualName': virtualName,
    };
  }
}

/// Defines a custom base AMI and block device mapping configurations of an
/// instance used for building and testing container images.
class InstanceConfiguration {
  /// Defines the block devices to attach for building an instance from this Image
  /// Builder AMI.
  final List<InstanceBlockDeviceMapping>? blockDeviceMappings;

  /// The AMI ID to use as the base image for a container build and test instance.
  /// If not specified, Image Builder will use the appropriate ECS-optimized AMI
  /// as a base image.
  final String? image;

  InstanceConfiguration({
    this.blockDeviceMappings,
    this.image,
  });

  factory InstanceConfiguration.fromJson(Map<String, dynamic> json) {
    return InstanceConfiguration(
      blockDeviceMappings: (json['blockDeviceMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              InstanceBlockDeviceMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      image: json['image'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockDeviceMappings = this.blockDeviceMappings;
    final image = this.image;
    return {
      if (blockDeviceMappings != null)
        'blockDeviceMappings': blockDeviceMappings,
      if (image != null) 'image': image,
    };
  }
}

/// The instance metadata options that apply to the HTTP requests that pipeline
/// builds use to launch EC2 build and test instances. For more information
/// about instance metadata options, see <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-options.html">Configure
/// the instance metadata options</a> in the <i> <i>Amazon EC2 User Guide</i>
/// </i> for Linux instances, or <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/WindowsGuide/configuring-instance-metadata-options.html">Configure
/// the instance metadata options</a> in the <i> <i>Amazon EC2 Windows Guide</i>
/// </i> for Windows instances.
class InstanceMetadataOptions {
  /// Limit the number of hops that an instance metadata request can traverse to
  /// reach its destination. The default is one hop. However, if HTTP tokens are
  /// required, container image builds need a minimum of two hops.
  final int? httpPutResponseHopLimit;

  /// Indicates whether a signed token header is required for instance metadata
  /// retrieval requests. The values affect the response as follows:
  ///
  /// <ul>
  /// <li>
  /// <b>required</b> – When you retrieve the IAM role credentials, version 2.0
  /// credentials are returned in all cases.
  /// </li>
  /// <li>
  /// <b>optional</b> – You can include a signed token header in your request to
  /// retrieve instance metadata, or you can leave it out. If you include it,
  /// version 2.0 credentials are returned for the IAM role. Otherwise, version
  /// 1.0 credentials are returned.
  /// </li>
  /// </ul>
  /// The default setting is <b>optional</b>.
  final String? httpTokens;

  InstanceMetadataOptions({
    this.httpPutResponseHopLimit,
    this.httpTokens,
  });

  factory InstanceMetadataOptions.fromJson(Map<String, dynamic> json) {
    return InstanceMetadataOptions(
      httpPutResponseHopLimit: json['httpPutResponseHopLimit'] as int?,
      httpTokens: json['httpTokens'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final httpPutResponseHopLimit = this.httpPutResponseHopLimit;
    final httpTokens = this.httpTokens;
    return {
      if (httpPutResponseHopLimit != null)
        'httpPutResponseHopLimit': httpPutResponseHopLimit,
      if (httpTokens != null) 'httpTokens': httpTokens,
    };
  }
}

/// Describes the configuration for a launch permission. The launch permission
/// modification request is sent to the <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyImageAttribute.html">Amazon
/// EC2 ModifyImageAttribute</a> API on behalf of the user for each Region they
/// have selected to distribute the AMI. To make an AMI public, set the launch
/// permission authorized accounts to <code>all</code>. See the examples for
/// making an AMI public at <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyImageAttribute.html">Amazon
/// EC2 ModifyImageAttribute</a>.
class LaunchPermissionConfiguration {
  /// The ARN for an Amazon Web Services Organization that you want to share your
  /// AMI with. For more information, see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_introduction.html">What
  /// is Organizations?</a>.
  final List<String>? organizationArns;

  /// The ARN for an Organizations organizational unit (OU) that you want to share
  /// your AMI with. For more information about key concepts for Organizations,
  /// see <a
  /// href="https://docs.aws.amazon.com/organizations/latest/userguide/orgs_getting-started_concepts.html">Organizations
  /// terminology and concepts</a>.
  final List<String>? organizationalUnitArns;

  /// The name of the group.
  final List<String>? userGroups;

  /// The Amazon Web Services account ID.
  final List<String>? userIds;

  LaunchPermissionConfiguration({
    this.organizationArns,
    this.organizationalUnitArns,
    this.userGroups,
    this.userIds,
  });

  factory LaunchPermissionConfiguration.fromJson(Map<String, dynamic> json) {
    return LaunchPermissionConfiguration(
      organizationArns: (json['organizationArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      organizationalUnitArns: (json['organizationalUnitArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      userGroups: (json['userGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      userIds: (json['userIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final organizationArns = this.organizationArns;
    final organizationalUnitArns = this.organizationalUnitArns;
    final userGroups = this.userGroups;
    final userIds = this.userIds;
    return {
      if (organizationArns != null) 'organizationArns': organizationArns,
      if (organizationalUnitArns != null)
        'organizationalUnitArns': organizationalUnitArns,
      if (userGroups != null) 'userGroups': userGroups,
      if (userIds != null) 'userIds': userIds,
    };
  }
}

/// Identifies an Amazon EC2 launch template to use for a specific account.
class LaunchTemplateConfiguration {
  /// Identifies the Amazon EC2 launch template to use.
  final String launchTemplateId;

  /// The account ID that this configuration applies to.
  final String? accountId;

  /// Set the specified Amazon EC2 launch template as the default launch template
  /// for the specified account.
  final bool? setDefaultVersion;

  LaunchTemplateConfiguration({
    required this.launchTemplateId,
    this.accountId,
    this.setDefaultVersion,
  });

  factory LaunchTemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return LaunchTemplateConfiguration(
      launchTemplateId: json['launchTemplateId'] as String,
      accountId: json['accountId'] as String?,
      setDefaultVersion: json['setDefaultVersion'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchTemplateId = this.launchTemplateId;
    final accountId = this.accountId;
    final setDefaultVersion = this.setDefaultVersion;
    return {
      'launchTemplateId': launchTemplateId,
      if (accountId != null) 'accountId': accountId,
      if (setDefaultVersion != null) 'setDefaultVersion': setDefaultVersion,
    };
  }
}

/// Contains metadata from a runtime instance of a lifecycle policy.
class LifecycleExecution {
  /// The timestamp when the lifecycle runtime instance completed.
  final DateTime? endTime;

  /// Identifies the lifecycle policy runtime instance.
  final String? lifecycleExecutionId;

  /// The Amazon Resource Name (ARN) of the lifecycle policy that ran.
  final String? lifecyclePolicyArn;

  /// Contains information about associated resources that are identified for
  /// action by the runtime instance of the lifecycle policy.
  final LifecycleExecutionResourcesImpactedSummary? resourcesImpactedSummary;

  /// The timestamp when the lifecycle runtime instance started.
  final DateTime? startTime;

  /// Runtime state that reports if the policy action ran successfully, failed, or
  /// was skipped.
  final LifecycleExecutionState? state;

  LifecycleExecution({
    this.endTime,
    this.lifecycleExecutionId,
    this.lifecyclePolicyArn,
    this.resourcesImpactedSummary,
    this.startTime,
    this.state,
  });

  factory LifecycleExecution.fromJson(Map<String, dynamic> json) {
    return LifecycleExecution(
      endTime: timeStampFromJson(json['endTime']),
      lifecycleExecutionId: json['lifecycleExecutionId'] as String?,
      lifecyclePolicyArn: json['lifecyclePolicyArn'] as String?,
      resourcesImpactedSummary: json['resourcesImpactedSummary'] != null
          ? LifecycleExecutionResourcesImpactedSummary.fromJson(
              json['resourcesImpactedSummary'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      state: json['state'] != null
          ? LifecycleExecutionState.fromJson(
              json['state'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final lifecycleExecutionId = this.lifecycleExecutionId;
    final lifecyclePolicyArn = this.lifecyclePolicyArn;
    final resourcesImpactedSummary = this.resourcesImpactedSummary;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (lifecycleExecutionId != null)
        'lifecycleExecutionId': lifecycleExecutionId,
      if (lifecyclePolicyArn != null) 'lifecyclePolicyArn': lifecyclePolicyArn,
      if (resourcesImpactedSummary != null)
        'resourcesImpactedSummary': resourcesImpactedSummary,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (state != null) 'state': state,
    };
  }
}

/// Contains details for a resource that the runtime instance of the lifecycle
/// policy identified for action.
class LifecycleExecutionResource {
  /// The account that owns the impacted resource.
  final String? accountId;

  /// The action to take for the identified resource.
  final LifecycleExecutionResourceAction? action;

  /// The ending timestamp from the lifecycle action that was applied to the
  /// resource.
  final DateTime? endTime;

  /// For an impacted container image, this identifies a list of URIs for
  /// associated container images distributed to ECR repositories.
  final List<String>? imageUris;

  /// The Amazon Web Services Region where the lifecycle execution resource is
  /// stored.
  final String? region;

  /// Identifies the impacted resource. The resource ID depends on the type of
  /// resource, as follows.
  ///
  /// <ul>
  /// <li>
  /// Image Builder image resources: Amazon Resource Name (ARN)
  /// </li>
  /// <li>
  /// Distributed AMIs: AMI ID
  /// </li>
  /// <li>
  /// Container images distributed to an ECR repository: image URI or SHA Digest
  /// </li>
  /// </ul>
  final String? resourceId;

  /// A list of associated resource snapshots for the impacted resource if it’s an
  /// AMI.
  final List<LifecycleExecutionSnapshotResource>? snapshots;

  /// The starting timestamp from the lifecycle action that was applied to the
  /// resource.
  final DateTime? startTime;

  /// The runtime state for the lifecycle execution.
  final LifecycleExecutionResourceState? state;

  LifecycleExecutionResource({
    this.accountId,
    this.action,
    this.endTime,
    this.imageUris,
    this.region,
    this.resourceId,
    this.snapshots,
    this.startTime,
    this.state,
  });

  factory LifecycleExecutionResource.fromJson(Map<String, dynamic> json) {
    return LifecycleExecutionResource(
      accountId: json['accountId'] as String?,
      action: json['action'] != null
          ? LifecycleExecutionResourceAction.fromJson(
              json['action'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      imageUris: (json['imageUris'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      region: json['region'] as String?,
      resourceId: json['resourceId'] as String?,
      snapshots: (json['snapshots'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleExecutionSnapshotResource.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['startTime']),
      state: json['state'] != null
          ? LifecycleExecutionResourceState.fromJson(
              json['state'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final action = this.action;
    final endTime = this.endTime;
    final imageUris = this.imageUris;
    final region = this.region;
    final resourceId = this.resourceId;
    final snapshots = this.snapshots;
    final startTime = this.startTime;
    final state = this.state;
    return {
      if (accountId != null) 'accountId': accountId,
      if (action != null) 'action': action,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (imageUris != null) 'imageUris': imageUris,
      if (region != null) 'region': region,
      if (resourceId != null) 'resourceId': resourceId,
      if (snapshots != null) 'snapshots': snapshots,
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
      if (state != null) 'state': state,
    };
  }
}

/// The lifecycle policy action that was identified for the impacted resource.
class LifecycleExecutionResourceAction {
  /// The name of the resource that was identified for a lifecycle policy action.
  final LifecycleExecutionResourceActionName? name;

  /// The reason why the lifecycle policy action is taken.
  final String? reason;

  LifecycleExecutionResourceAction({
    this.name,
    this.reason,
  });

  factory LifecycleExecutionResourceAction.fromJson(Map<String, dynamic> json) {
    return LifecycleExecutionResourceAction(
      name: (json['name'] as String?)?.toLifecycleExecutionResourceActionName(),
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final reason = this.reason;
    return {
      if (name != null) 'name': name.toValue(),
      if (reason != null) 'reason': reason,
    };
  }
}

enum LifecycleExecutionResourceActionName {
  available,
  delete,
  deprecate,
  disable,
}

extension LifecycleExecutionResourceActionNameValueExtension
    on LifecycleExecutionResourceActionName {
  String toValue() {
    switch (this) {
      case LifecycleExecutionResourceActionName.available:
        return 'AVAILABLE';
      case LifecycleExecutionResourceActionName.delete:
        return 'DELETE';
      case LifecycleExecutionResourceActionName.deprecate:
        return 'DEPRECATE';
      case LifecycleExecutionResourceActionName.disable:
        return 'DISABLE';
    }
  }
}

extension LifecycleExecutionResourceActionNameFromString on String {
  LifecycleExecutionResourceActionName
      toLifecycleExecutionResourceActionName() {
    switch (this) {
      case 'AVAILABLE':
        return LifecycleExecutionResourceActionName.available;
      case 'DELETE':
        return LifecycleExecutionResourceActionName.delete;
      case 'DEPRECATE':
        return LifecycleExecutionResourceActionName.deprecate;
      case 'DISABLE':
        return LifecycleExecutionResourceActionName.disable;
    }
    throw Exception(
        '$this is not known in enum LifecycleExecutionResourceActionName');
  }
}

/// Contains the state of an impacted resource that the runtime instance of the
/// lifecycle policy identified for action.
class LifecycleExecutionResourceState {
  /// Messaging that clarifies the reason for the assigned status.
  final String? reason;

  /// The runtime status of the lifecycle action taken for the impacted resource.
  final LifecycleExecutionResourceStatus? status;

  LifecycleExecutionResourceState({
    this.reason,
    this.status,
  });

  factory LifecycleExecutionResourceState.fromJson(Map<String, dynamic> json) {
    return LifecycleExecutionResourceState(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toLifecycleExecutionResourceStatus(),
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

enum LifecycleExecutionResourceStatus {
  failed,
  inProgress,
  skipped,
  success,
}

extension LifecycleExecutionResourceStatusValueExtension
    on LifecycleExecutionResourceStatus {
  String toValue() {
    switch (this) {
      case LifecycleExecutionResourceStatus.failed:
        return 'FAILED';
      case LifecycleExecutionResourceStatus.inProgress:
        return 'IN_PROGRESS';
      case LifecycleExecutionResourceStatus.skipped:
        return 'SKIPPED';
      case LifecycleExecutionResourceStatus.success:
        return 'SUCCESS';
    }
  }
}

extension LifecycleExecutionResourceStatusFromString on String {
  LifecycleExecutionResourceStatus toLifecycleExecutionResourceStatus() {
    switch (this) {
      case 'FAILED':
        return LifecycleExecutionResourceStatus.failed;
      case 'IN_PROGRESS':
        return LifecycleExecutionResourceStatus.inProgress;
      case 'SKIPPED':
        return LifecycleExecutionResourceStatus.skipped;
      case 'SUCCESS':
        return LifecycleExecutionResourceStatus.success;
    }
    throw Exception(
        '$this is not known in enum LifecycleExecutionResourceStatus');
  }
}

/// Contains details for an image resource that was identified for a lifecycle
/// action.
class LifecycleExecutionResourcesImpactedSummary {
  /// Indicates whether an image resource that was identified for a lifecycle
  /// action has associated resources that are also impacted.
  final bool? hasImpactedResources;

  LifecycleExecutionResourcesImpactedSummary({
    this.hasImpactedResources,
  });

  factory LifecycleExecutionResourcesImpactedSummary.fromJson(
      Map<String, dynamic> json) {
    return LifecycleExecutionResourcesImpactedSummary(
      hasImpactedResources: json['hasImpactedResources'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final hasImpactedResources = this.hasImpactedResources;
    return {
      if (hasImpactedResources != null)
        'hasImpactedResources': hasImpactedResources,
    };
  }
}

/// Contains the state of an impacted snapshot resource that the runtime
/// instance of the lifecycle policy identified for action.
class LifecycleExecutionSnapshotResource {
  /// Identifies the impacted snapshot resource.
  final String? snapshotId;

  /// The runtime status of the lifecycle action taken for the snapshot.
  final LifecycleExecutionResourceState? state;

  LifecycleExecutionSnapshotResource({
    this.snapshotId,
    this.state,
  });

  factory LifecycleExecutionSnapshotResource.fromJson(
      Map<String, dynamic> json) {
    return LifecycleExecutionSnapshotResource(
      snapshotId: json['snapshotId'] as String?,
      state: json['state'] != null
          ? LifecycleExecutionResourceState.fromJson(
              json['state'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final snapshotId = this.snapshotId;
    final state = this.state;
    return {
      if (snapshotId != null) 'snapshotId': snapshotId,
      if (state != null) 'state': state,
    };
  }
}

/// The current state of the runtime instance of the lifecycle policy.
class LifecycleExecutionState {
  /// The reason for the current status.
  final String? reason;

  /// The runtime status of the lifecycle execution.
  final LifecycleExecutionStatus? status;

  LifecycleExecutionState({
    this.reason,
    this.status,
  });

  factory LifecycleExecutionState.fromJson(Map<String, dynamic> json) {
    return LifecycleExecutionState(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toLifecycleExecutionStatus(),
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

enum LifecycleExecutionStatus {
  inProgress,
  cancelled,
  cancelling,
  failed,
  success,
  pending,
}

extension LifecycleExecutionStatusValueExtension on LifecycleExecutionStatus {
  String toValue() {
    switch (this) {
      case LifecycleExecutionStatus.inProgress:
        return 'IN_PROGRESS';
      case LifecycleExecutionStatus.cancelled:
        return 'CANCELLED';
      case LifecycleExecutionStatus.cancelling:
        return 'CANCELLING';
      case LifecycleExecutionStatus.failed:
        return 'FAILED';
      case LifecycleExecutionStatus.success:
        return 'SUCCESS';
      case LifecycleExecutionStatus.pending:
        return 'PENDING';
    }
  }
}

extension LifecycleExecutionStatusFromString on String {
  LifecycleExecutionStatus toLifecycleExecutionStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return LifecycleExecutionStatus.inProgress;
      case 'CANCELLED':
        return LifecycleExecutionStatus.cancelled;
      case 'CANCELLING':
        return LifecycleExecutionStatus.cancelling;
      case 'FAILED':
        return LifecycleExecutionStatus.failed;
      case 'SUCCESS':
        return LifecycleExecutionStatus.success;
      case 'PENDING':
        return LifecycleExecutionStatus.pending;
    }
    throw Exception('$this is not known in enum LifecycleExecutionStatus');
  }
}

/// The configuration details for a lifecycle policy resource.
class LifecyclePolicy {
  /// The Amazon Resource Name (ARN) of the lifecycle policy resource.
  final String? arn;

  /// The timestamp when Image Builder created the lifecycle policy resource.
  final DateTime? dateCreated;

  /// The timestamp for the last time Image Builder ran the lifecycle policy.
  final DateTime? dateLastRun;

  /// The timestamp when Image Builder updated the lifecycle policy resource.
  final DateTime? dateUpdated;

  /// Optional description for the lifecycle policy.
  final String? description;

  /// The name or Amazon Resource Name (ARN) of the IAM role that Image Builder
  /// uses to run the lifecycle policy. This is a custom role that you create.
  final String? executionRole;

  /// The name of the lifecycle policy.
  final String? name;

  /// The configuration details for a lifecycle policy resource.
  final List<LifecyclePolicyDetail>? policyDetails;

  /// Resource selection criteria used to run the lifecycle policy.
  final LifecyclePolicyResourceSelection? resourceSelection;

  /// The type of resources the lifecycle policy targets.
  final LifecyclePolicyResourceType? resourceType;

  /// Indicates whether the lifecycle policy resource is enabled.
  final LifecyclePolicyStatus? status;

  /// To help manage your lifecycle policy resources, you can assign your own
  /// metadata to each resource in the form of tags. Each tag consists of a key
  /// and an optional value, both of which you define.
  final Map<String, String>? tags;

  LifecyclePolicy({
    this.arn,
    this.dateCreated,
    this.dateLastRun,
    this.dateUpdated,
    this.description,
    this.executionRole,
    this.name,
    this.policyDetails,
    this.resourceSelection,
    this.resourceType,
    this.status,
    this.tags,
  });

  factory LifecyclePolicy.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicy(
      arn: json['arn'] as String?,
      dateCreated: timeStampFromJson(json['dateCreated']),
      dateLastRun: timeStampFromJson(json['dateLastRun']),
      dateUpdated: timeStampFromJson(json['dateUpdated']),
      description: json['description'] as String?,
      executionRole: json['executionRole'] as String?,
      name: json['name'] as String?,
      policyDetails: (json['policyDetails'] as List?)
          ?.whereNotNull()
          .map((e) => LifecyclePolicyDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceSelection: json['resourceSelection'] != null
          ? LifecyclePolicyResourceSelection.fromJson(
              json['resourceSelection'] as Map<String, dynamic>)
          : null,
      resourceType:
          (json['resourceType'] as String?)?.toLifecyclePolicyResourceType(),
      status: (json['status'] as String?)?.toLifecyclePolicyStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final dateLastRun = this.dateLastRun;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final executionRole = this.executionRole;
    final name = this.name;
    final policyDetails = this.policyDetails;
    final resourceSelection = this.resourceSelection;
    final resourceType = this.resourceType;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': unixTimestampToJson(dateCreated),
      if (dateLastRun != null) 'dateLastRun': unixTimestampToJson(dateLastRun),
      if (dateUpdated != null) 'dateUpdated': unixTimestampToJson(dateUpdated),
      if (description != null) 'description': description,
      if (executionRole != null) 'executionRole': executionRole,
      if (name != null) 'name': name,
      if (policyDetails != null) 'policyDetails': policyDetails,
      if (resourceSelection != null) 'resourceSelection': resourceSelection,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The configuration details for a lifecycle policy resource.
class LifecyclePolicyDetail {
  /// Configuration details for the policy action.
  final LifecyclePolicyDetailAction action;

  /// Specifies the resources that the lifecycle policy applies to.
  final LifecyclePolicyDetailFilter filter;

  /// Additional rules to specify resources that should be exempt from policy
  /// actions.
  final LifecyclePolicyDetailExclusionRules? exclusionRules;

  LifecyclePolicyDetail({
    required this.action,
    required this.filter,
    this.exclusionRules,
  });

  factory LifecyclePolicyDetail.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyDetail(
      action: LifecyclePolicyDetailAction.fromJson(
          json['action'] as Map<String, dynamic>),
      filter: LifecyclePolicyDetailFilter.fromJson(
          json['filter'] as Map<String, dynamic>),
      exclusionRules: json['exclusionRules'] != null
          ? LifecyclePolicyDetailExclusionRules.fromJson(
              json['exclusionRules'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final filter = this.filter;
    final exclusionRules = this.exclusionRules;
    return {
      'action': action,
      'filter': filter,
      if (exclusionRules != null) 'exclusionRules': exclusionRules,
    };
  }
}

/// Contains selection criteria for the lifecycle policy.
class LifecyclePolicyDetailAction {
  /// Specifies the lifecycle action to take.
  final LifecyclePolicyDetailActionType type;

  /// Specifies the resources that the lifecycle policy applies to.
  final LifecyclePolicyDetailActionIncludeResources? includeResources;

  LifecyclePolicyDetailAction({
    required this.type,
    this.includeResources,
  });

  factory LifecyclePolicyDetailAction.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyDetailAction(
      type: (json['type'] as String).toLifecyclePolicyDetailActionType(),
      includeResources: json['includeResources'] != null
          ? LifecyclePolicyDetailActionIncludeResources.fromJson(
              json['includeResources'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final includeResources = this.includeResources;
    return {
      'type': type.toValue(),
      if (includeResources != null) 'includeResources': includeResources,
    };
  }
}

/// Specifies how the lifecycle policy should apply actions to selected
/// resources.
class LifecyclePolicyDetailActionIncludeResources {
  /// Specifies whether the lifecycle action should apply to distributed AMIs.
  final bool? amis;

  /// Specifies whether the lifecycle action should apply to distributed
  /// containers.
  final bool? containers;

  /// Specifies whether the lifecycle action should apply to snapshots associated
  /// with distributed AMIs.
  final bool? snapshots;

  LifecyclePolicyDetailActionIncludeResources({
    this.amis,
    this.containers,
    this.snapshots,
  });

  factory LifecyclePolicyDetailActionIncludeResources.fromJson(
      Map<String, dynamic> json) {
    return LifecyclePolicyDetailActionIncludeResources(
      amis: json['amis'] as bool?,
      containers: json['containers'] as bool?,
      snapshots: json['snapshots'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final amis = this.amis;
    final containers = this.containers;
    final snapshots = this.snapshots;
    return {
      if (amis != null) 'amis': amis,
      if (containers != null) 'containers': containers,
      if (snapshots != null) 'snapshots': snapshots,
    };
  }
}

enum LifecyclePolicyDetailActionType {
  delete,
  deprecate,
  disable,
}

extension LifecyclePolicyDetailActionTypeValueExtension
    on LifecyclePolicyDetailActionType {
  String toValue() {
    switch (this) {
      case LifecyclePolicyDetailActionType.delete:
        return 'DELETE';
      case LifecyclePolicyDetailActionType.deprecate:
        return 'DEPRECATE';
      case LifecyclePolicyDetailActionType.disable:
        return 'DISABLE';
    }
  }
}

extension LifecyclePolicyDetailActionTypeFromString on String {
  LifecyclePolicyDetailActionType toLifecyclePolicyDetailActionType() {
    switch (this) {
      case 'DELETE':
        return LifecyclePolicyDetailActionType.delete;
      case 'DEPRECATE':
        return LifecyclePolicyDetailActionType.deprecate;
      case 'DISABLE':
        return LifecyclePolicyDetailActionType.disable;
    }
    throw Exception(
        '$this is not known in enum LifecyclePolicyDetailActionType');
  }
}

/// Specifies resources that lifecycle policy actions should not apply to.
class LifecyclePolicyDetailExclusionRules {
  /// Lists configuration values that apply to AMIs that Image Builder should
  /// exclude from the lifecycle action.
  final LifecyclePolicyDetailExclusionRulesAmis? amis;

  /// Contains a list of tags that Image Builder uses to skip lifecycle actions
  /// for Image Builder image resources that have them.
  final Map<String, String>? tagMap;

  LifecyclePolicyDetailExclusionRules({
    this.amis,
    this.tagMap,
  });

  factory LifecyclePolicyDetailExclusionRules.fromJson(
      Map<String, dynamic> json) {
    return LifecyclePolicyDetailExclusionRules(
      amis: json['amis'] != null
          ? LifecyclePolicyDetailExclusionRulesAmis.fromJson(
              json['amis'] as Map<String, dynamic>)
          : null,
      tagMap: (json['tagMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final amis = this.amis;
    final tagMap = this.tagMap;
    return {
      if (amis != null) 'amis': amis,
      if (tagMap != null) 'tagMap': tagMap,
    };
  }
}

/// Defines criteria for AMIs that are excluded from lifecycle actions.
class LifecyclePolicyDetailExclusionRulesAmis {
  /// Configures whether public AMIs are excluded from the lifecycle action.
  final bool? isPublic;

  /// Specifies configuration details for Image Builder to exclude the most recent
  /// resources from lifecycle actions.
  final LifecyclePolicyDetailExclusionRulesAmisLastLaunched? lastLaunched;

  /// Configures Amazon Web Services Regions that are excluded from the lifecycle
  /// action.
  final List<String>? regions;

  /// Specifies Amazon Web Services accounts whose resources are excluded from the
  /// lifecycle action.
  final List<String>? sharedAccounts;

  /// Lists tags that should be excluded from lifecycle actions for the AMIs that
  /// have them.
  final Map<String, String>? tagMap;

  LifecyclePolicyDetailExclusionRulesAmis({
    this.isPublic,
    this.lastLaunched,
    this.regions,
    this.sharedAccounts,
    this.tagMap,
  });

  factory LifecyclePolicyDetailExclusionRulesAmis.fromJson(
      Map<String, dynamic> json) {
    return LifecyclePolicyDetailExclusionRulesAmis(
      isPublic: json['isPublic'] as bool?,
      lastLaunched: json['lastLaunched'] != null
          ? LifecyclePolicyDetailExclusionRulesAmisLastLaunched.fromJson(
              json['lastLaunched'] as Map<String, dynamic>)
          : null,
      regions: (json['regions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sharedAccounts: (json['sharedAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      tagMap: (json['tagMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final isPublic = this.isPublic;
    final lastLaunched = this.lastLaunched;
    final regions = this.regions;
    final sharedAccounts = this.sharedAccounts;
    final tagMap = this.tagMap;
    return {
      if (isPublic != null) 'isPublic': isPublic,
      if (lastLaunched != null) 'lastLaunched': lastLaunched,
      if (regions != null) 'regions': regions,
      if (sharedAccounts != null) 'sharedAccounts': sharedAccounts,
      if (tagMap != null) 'tagMap': tagMap,
    };
  }
}

/// Defines criteria to exclude AMIs from lifecycle actions based on the last
/// time they were used to launch an instance.
class LifecyclePolicyDetailExclusionRulesAmisLastLaunched {
  /// Defines the unit of time that the lifecycle policy uses to calculate elapsed
  /// time since the last instance launched from the AMI. For example: days,
  /// weeks, months, or years.
  final LifecyclePolicyTimeUnit unit;

  /// The integer number of units for the time period. For example <code>6</code>
  /// (months).
  final int value;

  LifecyclePolicyDetailExclusionRulesAmisLastLaunched({
    required this.unit,
    required this.value,
  });

  factory LifecyclePolicyDetailExclusionRulesAmisLastLaunched.fromJson(
      Map<String, dynamic> json) {
    return LifecyclePolicyDetailExclusionRulesAmisLastLaunched(
      unit: (json['unit'] as String).toLifecyclePolicyTimeUnit(),
      value: json['value'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'unit': unit.toValue(),
      'value': value,
    };
  }
}

/// Defines filters that the lifecycle policy uses to determine impacted
/// resource.
class LifecyclePolicyDetailFilter {
  /// Filter resources based on either <code>age</code> or <code>count</code>.
  final LifecyclePolicyDetailFilterType type;

  /// The number of units for the time period or for the count. For example, a
  /// value of <code>6</code> might refer to six months or six AMIs.
  /// <note>
  /// For count-based filters, this value represents the minimum number of
  /// resources to keep on hand. If you have fewer resources than this number, the
  /// resource is excluded from lifecycle actions.
  /// </note>
  final int value;

  /// For age-based filters, this is the number of resources to keep on hand after
  /// the lifecycle <code>DELETE</code> action is applied. Impacted resources are
  /// only deleted if you have more than this number of resources. If you have
  /// fewer resources than this number, the impacted resource is not deleted.
  final int? retainAtLeast;

  /// Defines the unit of time that the lifecycle policy uses to determine
  /// impacted resources. This is required for age-based rules.
  final LifecyclePolicyTimeUnit? unit;

  LifecyclePolicyDetailFilter({
    required this.type,
    required this.value,
    this.retainAtLeast,
    this.unit,
  });

  factory LifecyclePolicyDetailFilter.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyDetailFilter(
      type: (json['type'] as String).toLifecyclePolicyDetailFilterType(),
      value: json['value'] as int,
      retainAtLeast: json['retainAtLeast'] as int?,
      unit: (json['unit'] as String?)?.toLifecyclePolicyTimeUnit(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final value = this.value;
    final retainAtLeast = this.retainAtLeast;
    final unit = this.unit;
    return {
      'type': type.toValue(),
      'value': value,
      if (retainAtLeast != null) 'retainAtLeast': retainAtLeast,
      if (unit != null) 'unit': unit.toValue(),
    };
  }
}

enum LifecyclePolicyDetailFilterType {
  age,
  count,
}

extension LifecyclePolicyDetailFilterTypeValueExtension
    on LifecyclePolicyDetailFilterType {
  String toValue() {
    switch (this) {
      case LifecyclePolicyDetailFilterType.age:
        return 'AGE';
      case LifecyclePolicyDetailFilterType.count:
        return 'COUNT';
    }
  }
}

extension LifecyclePolicyDetailFilterTypeFromString on String {
  LifecyclePolicyDetailFilterType toLifecyclePolicyDetailFilterType() {
    switch (this) {
      case 'AGE':
        return LifecyclePolicyDetailFilterType.age;
      case 'COUNT':
        return LifecyclePolicyDetailFilterType.count;
    }
    throw Exception(
        '$this is not known in enum LifecyclePolicyDetailFilterType');
  }
}

/// Resource selection criteria for the lifecycle policy.
class LifecyclePolicyResourceSelection {
  /// A list of recipes that are used as selection criteria for the output images
  /// that the lifecycle policy applies to.
  final List<LifecyclePolicyResourceSelectionRecipe>? recipes;

  /// A list of tags that are used as selection criteria for the Image Builder
  /// image resources that the lifecycle policy applies to.
  final Map<String, String>? tagMap;

  LifecyclePolicyResourceSelection({
    this.recipes,
    this.tagMap,
  });

  factory LifecyclePolicyResourceSelection.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyResourceSelection(
      recipes: (json['recipes'] as List?)
          ?.whereNotNull()
          .map((e) => LifecyclePolicyResourceSelectionRecipe.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      tagMap: (json['tagMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final recipes = this.recipes;
    final tagMap = this.tagMap;
    return {
      if (recipes != null) 'recipes': recipes,
      if (tagMap != null) 'tagMap': tagMap,
    };
  }
}

/// Specifies an Image Builder recipe that the lifecycle policy uses for
/// resource selection.
class LifecyclePolicyResourceSelectionRecipe {
  /// The name of an Image Builder recipe that the lifecycle policy uses for
  /// resource selection.
  final String name;

  /// The version of the Image Builder recipe specified by the <code>name</code>
  /// field.
  final String semanticVersion;

  LifecyclePolicyResourceSelectionRecipe({
    required this.name,
    required this.semanticVersion,
  });

  factory LifecyclePolicyResourceSelectionRecipe.fromJson(
      Map<String, dynamic> json) {
    return LifecyclePolicyResourceSelectionRecipe(
      name: json['name'] as String,
      semanticVersion: json['semanticVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final semanticVersion = this.semanticVersion;
    return {
      'name': name,
      'semanticVersion': semanticVersion,
    };
  }
}

enum LifecyclePolicyResourceType {
  amiImage,
  containerImage,
}

extension LifecyclePolicyResourceTypeValueExtension
    on LifecyclePolicyResourceType {
  String toValue() {
    switch (this) {
      case LifecyclePolicyResourceType.amiImage:
        return 'AMI_IMAGE';
      case LifecyclePolicyResourceType.containerImage:
        return 'CONTAINER_IMAGE';
    }
  }
}

extension LifecyclePolicyResourceTypeFromString on String {
  LifecyclePolicyResourceType toLifecyclePolicyResourceType() {
    switch (this) {
      case 'AMI_IMAGE':
        return LifecyclePolicyResourceType.amiImage;
      case 'CONTAINER_IMAGE':
        return LifecyclePolicyResourceType.containerImage;
    }
    throw Exception('$this is not known in enum LifecyclePolicyResourceType');
  }
}

enum LifecyclePolicyStatus {
  disabled,
  enabled,
}

extension LifecyclePolicyStatusValueExtension on LifecyclePolicyStatus {
  String toValue() {
    switch (this) {
      case LifecyclePolicyStatus.disabled:
        return 'DISABLED';
      case LifecyclePolicyStatus.enabled:
        return 'ENABLED';
    }
  }
}

extension LifecyclePolicyStatusFromString on String {
  LifecyclePolicyStatus toLifecyclePolicyStatus() {
    switch (this) {
      case 'DISABLED':
        return LifecyclePolicyStatus.disabled;
      case 'ENABLED':
        return LifecyclePolicyStatus.enabled;
    }
    throw Exception('$this is not known in enum LifecyclePolicyStatus');
  }
}

/// Contains a summary of lifecycle policy resources.
class LifecyclePolicySummary {
  /// The Amazon Resource Name (ARN) of the lifecycle policy summary resource.
  final String? arn;

  /// The timestamp when Image Builder created the lifecycle policy resource.
  final DateTime? dateCreated;

  /// The timestamp for the last time Image Builder ran the lifecycle policy.
  final DateTime? dateLastRun;

  /// The timestamp when Image Builder updated the lifecycle policy resource.
  final DateTime? dateUpdated;

  /// Optional description for the lifecycle policy.
  final String? description;

  /// The name or Amazon Resource Name (ARN) of the IAM role that Image Builder
  /// uses to run the lifecycle policy.
  final String? executionRole;

  /// The name of the lifecycle policy.
  final String? name;

  /// The type of resources the lifecycle policy targets.
  final LifecyclePolicyResourceType? resourceType;

  /// The lifecycle policy resource status.
  final LifecyclePolicyStatus? status;

  /// To help manage your lifecycle policy resources, you can assign your own
  /// metadata to each resource in the form of tags. Each tag consists of a key
  /// and an optional value, both of which you define.
  final Map<String, String>? tags;

  LifecyclePolicySummary({
    this.arn,
    this.dateCreated,
    this.dateLastRun,
    this.dateUpdated,
    this.description,
    this.executionRole,
    this.name,
    this.resourceType,
    this.status,
    this.tags,
  });

  factory LifecyclePolicySummary.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicySummary(
      arn: json['arn'] as String?,
      dateCreated: timeStampFromJson(json['dateCreated']),
      dateLastRun: timeStampFromJson(json['dateLastRun']),
      dateUpdated: timeStampFromJson(json['dateUpdated']),
      description: json['description'] as String?,
      executionRole: json['executionRole'] as String?,
      name: json['name'] as String?,
      resourceType:
          (json['resourceType'] as String?)?.toLifecyclePolicyResourceType(),
      status: (json['status'] as String?)?.toLifecyclePolicyStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final dateLastRun = this.dateLastRun;
    final dateUpdated = this.dateUpdated;
    final description = this.description;
    final executionRole = this.executionRole;
    final name = this.name;
    final resourceType = this.resourceType;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': unixTimestampToJson(dateCreated),
      if (dateLastRun != null) 'dateLastRun': unixTimestampToJson(dateLastRun),
      if (dateUpdated != null) 'dateUpdated': unixTimestampToJson(dateUpdated),
      if (description != null) 'description': description,
      if (executionRole != null) 'executionRole': executionRole,
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType.toValue(),
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

enum LifecyclePolicyTimeUnit {
  days,
  weeks,
  months,
  years,
}

extension LifecyclePolicyTimeUnitValueExtension on LifecyclePolicyTimeUnit {
  String toValue() {
    switch (this) {
      case LifecyclePolicyTimeUnit.days:
        return 'DAYS';
      case LifecyclePolicyTimeUnit.weeks:
        return 'WEEKS';
      case LifecyclePolicyTimeUnit.months:
        return 'MONTHS';
      case LifecyclePolicyTimeUnit.years:
        return 'YEARS';
    }
  }
}

extension LifecyclePolicyTimeUnitFromString on String {
  LifecyclePolicyTimeUnit toLifecyclePolicyTimeUnit() {
    switch (this) {
      case 'DAYS':
        return LifecyclePolicyTimeUnit.days;
      case 'WEEKS':
        return LifecyclePolicyTimeUnit.weeks;
      case 'MONTHS':
        return LifecyclePolicyTimeUnit.months;
      case 'YEARS':
        return LifecyclePolicyTimeUnit.years;
    }
    throw Exception('$this is not known in enum LifecyclePolicyTimeUnit');
  }
}

class ListComponentBuildVersionsResponse {
  /// The list of component summaries for the specified semantic version.
  final List<ComponentSummary>? componentSummaryList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListComponentBuildVersionsResponse({
    this.componentSummaryList,
    this.nextToken,
    this.requestId,
  });

  factory ListComponentBuildVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListComponentBuildVersionsResponse(
      componentSummaryList: (json['componentSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentSummaryList = this.componentSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (componentSummaryList != null)
        'componentSummaryList': componentSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListComponentsResponse {
  /// The list of component semantic versions.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  /// </note>
  final List<ComponentVersion>? componentVersionList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListComponentsResponse({
    this.componentVersionList,
    this.nextToken,
    this.requestId,
  });

  factory ListComponentsResponse.fromJson(Map<String, dynamic> json) {
    return ListComponentsResponse(
      componentVersionList: (json['componentVersionList'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentVersionList = this.componentVersionList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (componentVersionList != null)
        'componentVersionList': componentVersionList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListContainerRecipesResponse {
  /// The list of container recipes returned for the request.
  final List<ContainerRecipeSummary>? containerRecipeSummaryList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListContainerRecipesResponse({
    this.containerRecipeSummaryList,
    this.nextToken,
    this.requestId,
  });

  factory ListContainerRecipesResponse.fromJson(Map<String, dynamic> json) {
    return ListContainerRecipesResponse(
      containerRecipeSummaryList: (json['containerRecipeSummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => ContainerRecipeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerRecipeSummaryList = this.containerRecipeSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (containerRecipeSummaryList != null)
        'containerRecipeSummaryList': containerRecipeSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListDistributionConfigurationsResponse {
  /// The list of distributions.
  final List<DistributionConfigurationSummary>?
      distributionConfigurationSummaryList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListDistributionConfigurationsResponse({
    this.distributionConfigurationSummaryList,
    this.nextToken,
    this.requestId,
  });

  factory ListDistributionConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDistributionConfigurationsResponse(
      distributionConfigurationSummaryList:
          (json['distributionConfigurationSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) => DistributionConfigurationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final distributionConfigurationSummaryList =
        this.distributionConfigurationSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (distributionConfigurationSummaryList != null)
        'distributionConfigurationSummaryList':
            distributionConfigurationSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListImageBuildVersionsResponse {
  /// The list of image build versions.
  final List<ImageSummary>? imageSummaryList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListImageBuildVersionsResponse({
    this.imageSummaryList,
    this.nextToken,
    this.requestId,
  });

  factory ListImageBuildVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListImageBuildVersionsResponse(
      imageSummaryList: (json['imageSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ImageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageSummaryList = this.imageSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (imageSummaryList != null) 'imageSummaryList': imageSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListImagePackagesResponse {
  /// The list of Image Packages returned in the response.
  final List<ImagePackage>? imagePackageList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListImagePackagesResponse({
    this.imagePackageList,
    this.nextToken,
    this.requestId,
  });

  factory ListImagePackagesResponse.fromJson(Map<String, dynamic> json) {
    return ListImagePackagesResponse(
      imagePackageList: (json['imagePackageList'] as List?)
          ?.whereNotNull()
          .map((e) => ImagePackage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imagePackageList = this.imagePackageList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (imagePackageList != null) 'imagePackageList': imagePackageList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListImagePipelineImagesResponse {
  /// The list of images built by this pipeline.
  final List<ImageSummary>? imageSummaryList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListImagePipelineImagesResponse({
    this.imageSummaryList,
    this.nextToken,
    this.requestId,
  });

  factory ListImagePipelineImagesResponse.fromJson(Map<String, dynamic> json) {
    return ListImagePipelineImagesResponse(
      imageSummaryList: (json['imageSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ImageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageSummaryList = this.imageSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (imageSummaryList != null) 'imageSummaryList': imageSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListImagePipelinesResponse {
  /// The list of image pipelines.
  final List<ImagePipeline>? imagePipelineList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListImagePipelinesResponse({
    this.imagePipelineList,
    this.nextToken,
    this.requestId,
  });

  factory ListImagePipelinesResponse.fromJson(Map<String, dynamic> json) {
    return ListImagePipelinesResponse(
      imagePipelineList: (json['imagePipelineList'] as List?)
          ?.whereNotNull()
          .map((e) => ImagePipeline.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imagePipelineList = this.imagePipelineList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (imagePipelineList != null) 'imagePipelineList': imagePipelineList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListImageRecipesResponse {
  /// The list of image pipelines.
  final List<ImageRecipeSummary>? imageRecipeSummaryList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListImageRecipesResponse({
    this.imageRecipeSummaryList,
    this.nextToken,
    this.requestId,
  });

  factory ListImageRecipesResponse.fromJson(Map<String, dynamic> json) {
    return ListImageRecipesResponse(
      imageRecipeSummaryList: (json['imageRecipeSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => ImageRecipeSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageRecipeSummaryList = this.imageRecipeSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (imageRecipeSummaryList != null)
        'imageRecipeSummaryList': imageRecipeSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListImageScanFindingAggregationsResponse {
  /// The aggregation type specifies what type of key is used to group the image
  /// scan findings. Image Builder returns results based on the request filter. If
  /// you didn't specify a filter in the request, the type defaults to
  /// <code>accountId</code>.
  /// <p class="title"> <b>Aggregation types</b>
  ///
  /// <ul>
  /// <li>
  /// accountId
  /// </li>
  /// <li>
  /// imageBuildVersionArn
  /// </li>
  /// <li>
  /// imagePipelineArn
  /// </li>
  /// <li>
  /// vulnerabilityId
  /// </li>
  /// </ul>
  /// Each aggregation includes counts by severity level for medium severity and
  /// higher level findings, plus a total for all of the findings for each key
  /// value.
  final String? aggregationType;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  /// An array of image scan finding aggregations that match the filter criteria.
  final List<ImageScanFindingAggregation>? responses;

  ListImageScanFindingAggregationsResponse({
    this.aggregationType,
    this.nextToken,
    this.requestId,
    this.responses,
  });

  factory ListImageScanFindingAggregationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListImageScanFindingAggregationsResponse(
      aggregationType: json['aggregationType'] as String?,
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
      responses: (json['responses'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ImageScanFindingAggregation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationType = this.aggregationType;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final responses = this.responses;
    return {
      if (aggregationType != null) 'aggregationType': aggregationType,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
      if (responses != null) 'responses': responses,
    };
  }
}

class ListImageScanFindingsResponse {
  /// The image scan findings for your account that meet your request filter
  /// criteria.
  final List<ImageScanFinding>? findings;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListImageScanFindingsResponse({
    this.findings,
    this.nextToken,
    this.requestId,
  });

  factory ListImageScanFindingsResponse.fromJson(Map<String, dynamic> json) {
    return ListImageScanFindingsResponse(
      findings: (json['findings'] as List?)
          ?.whereNotNull()
          .map((e) => ImageScanFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findings = this.findings;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (findings != null) 'findings': findings,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListImagesResponse {
  /// The list of image semantic versions.
  /// <note>
  /// The semantic version has four nodes:
  /// &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;/&lt;build&gt;. You can assign
  /// values for the first three, and can filter on all of them.
  ///
  /// <b>Filtering:</b> With semantic versioning, you have the flexibility to use
  /// wildcards (x) to specify the most recent versions or nodes when selecting
  /// the base image or components for your recipe. When you use a wildcard in any
  /// node, all nodes to the right of the first wildcard must also be wildcards.
  /// </note>
  final List<ImageVersion>? imageVersionList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListImagesResponse({
    this.imageVersionList,
    this.nextToken,
    this.requestId,
  });

  factory ListImagesResponse.fromJson(Map<String, dynamic> json) {
    return ListImagesResponse(
      imageVersionList: (json['imageVersionList'] as List?)
          ?.whereNotNull()
          .map((e) => ImageVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageVersionList = this.imageVersionList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (imageVersionList != null) 'imageVersionList': imageVersionList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListInfrastructureConfigurationsResponse {
  /// The list of infrastructure configurations.
  final List<InfrastructureConfigurationSummary>?
      infrastructureConfigurationSummaryList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  ListInfrastructureConfigurationsResponse({
    this.infrastructureConfigurationSummaryList,
    this.nextToken,
    this.requestId,
  });

  factory ListInfrastructureConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListInfrastructureConfigurationsResponse(
      infrastructureConfigurationSummaryList:
          (json['infrastructureConfigurationSummaryList'] as List?)
              ?.whereNotNull()
              .map((e) => InfrastructureConfigurationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final infrastructureConfigurationSummaryList =
        this.infrastructureConfigurationSummaryList;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    return {
      if (infrastructureConfigurationSummaryList != null)
        'infrastructureConfigurationSummaryList':
            infrastructureConfigurationSummaryList,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class ListLifecycleExecutionResourcesResponse {
  /// Runtime details for the specified runtime instance of the lifecycle policy.
  final String? lifecycleExecutionId;

  /// The current state of the lifecycle runtime instance.
  final LifecycleExecutionState? lifecycleExecutionState;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// A list of resources that were identified for lifecycle actions.
  final List<LifecycleExecutionResource>? resources;

  ListLifecycleExecutionResourcesResponse({
    this.lifecycleExecutionId,
    this.lifecycleExecutionState,
    this.nextToken,
    this.resources,
  });

  factory ListLifecycleExecutionResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLifecycleExecutionResourcesResponse(
      lifecycleExecutionId: json['lifecycleExecutionId'] as String?,
      lifecycleExecutionState: json['lifecycleExecutionState'] != null
          ? LifecycleExecutionState.fromJson(
              json['lifecycleExecutionState'] as Map<String, dynamic>)
          : null,
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) =>
              LifecycleExecutionResource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycleExecutionId = this.lifecycleExecutionId;
    final lifecycleExecutionState = this.lifecycleExecutionState;
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (lifecycleExecutionId != null)
        'lifecycleExecutionId': lifecycleExecutionId,
      if (lifecycleExecutionState != null)
        'lifecycleExecutionState': lifecycleExecutionState,
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

class ListLifecycleExecutionsResponse {
  /// A list of lifecycle runtime instances for the specified resource.
  final List<LifecycleExecution>? lifecycleExecutions;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  ListLifecycleExecutionsResponse({
    this.lifecycleExecutions,
    this.nextToken,
  });

  factory ListLifecycleExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListLifecycleExecutionsResponse(
      lifecycleExecutions: (json['lifecycleExecutions'] as List?)
          ?.whereNotNull()
          .map((e) => LifecycleExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycleExecutions = this.lifecycleExecutions;
    final nextToken = this.nextToken;
    return {
      if (lifecycleExecutions != null)
        'lifecycleExecutions': lifecycleExecutions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLifecyclePoliciesResponse {
  /// A list of lifecycle policies in your Amazon Web Services account that meet
  /// the criteria specified in the request.
  final List<LifecyclePolicySummary>? lifecyclePolicySummaryList;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  ListLifecyclePoliciesResponse({
    this.lifecyclePolicySummaryList,
    this.nextToken,
  });

  factory ListLifecyclePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return ListLifecyclePoliciesResponse(
      lifecyclePolicySummaryList: (json['lifecyclePolicySummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => LifecyclePolicySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicySummaryList = this.lifecyclePolicySummaryList;
    final nextToken = this.nextToken;
    return {
      if (lifecyclePolicySummaryList != null)
        'lifecyclePolicySummaryList': lifecyclePolicySummaryList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags for the specified resource.
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

class ListWaitingWorkflowStepsResponse {
  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// An array of the workflow steps that are waiting for action in your Amazon
  /// Web Services account.
  final List<WorkflowStepExecution>? steps;

  ListWaitingWorkflowStepsResponse({
    this.nextToken,
    this.steps,
  });

  factory ListWaitingWorkflowStepsResponse.fromJson(Map<String, dynamic> json) {
    return ListWaitingWorkflowStepsResponse(
      nextToken: json['nextToken'] as String?,
      steps: (json['steps'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowStepExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final steps = this.steps;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (steps != null) 'steps': steps,
    };
  }
}

class ListWorkflowBuildVersionsResponse {
  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// A list that contains metadata for the workflow builds that have run for the
  /// workflow resource specified in the request.
  final List<WorkflowSummary>? workflowSummaryList;

  ListWorkflowBuildVersionsResponse({
    this.nextToken,
    this.workflowSummaryList,
  });

  factory ListWorkflowBuildVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWorkflowBuildVersionsResponse(
      nextToken: json['nextToken'] as String?,
      workflowSummaryList: (json['workflowSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workflowSummaryList = this.workflowSummaryList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workflowSummaryList != null)
        'workflowSummaryList': workflowSummaryList,
    };
  }
}

class ListWorkflowExecutionsResponse {
  /// The resource ARN of the image build version for which you requested a list
  /// of workflow runtime details.
  final String? imageBuildVersionArn;

  /// The output message from the list action, if applicable.
  final String? message;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  /// Contains an array of runtime details that represents each time a workflow
  /// ran for the requested image build version.
  final List<WorkflowExecutionMetadata>? workflowExecutions;

  ListWorkflowExecutionsResponse({
    this.imageBuildVersionArn,
    this.message,
    this.nextToken,
    this.requestId,
    this.workflowExecutions,
  });

  factory ListWorkflowExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowExecutionsResponse(
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      message: json['message'] as String?,
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
      workflowExecutions: (json['workflowExecutions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WorkflowExecutionMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final message = this.message;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final workflowExecutions = this.workflowExecutions;
    return {
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (message != null) 'message': message,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
      if (workflowExecutions != null) 'workflowExecutions': workflowExecutions,
    };
  }
}

class ListWorkflowStepExecutionsResponse {
  /// The image build version resource ARN that's associated with the specified
  /// runtime instance of the workflow.
  final String? imageBuildVersionArn;

  /// The output message from the list action, if applicable.
  final String? message;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  /// Contains an array of runtime details that represents each step in this
  /// runtime instance of the workflow.
  final List<WorkflowStepMetadata>? steps;

  /// The build version ARN for the Image Builder workflow resource that defines
  /// the steps for this runtime instance of the workflow.
  final String? workflowBuildVersionArn;

  /// The unique identifier that Image Builder assigned to keep track of runtime
  /// details when it ran the workflow.
  final String? workflowExecutionId;

  ListWorkflowStepExecutionsResponse({
    this.imageBuildVersionArn,
    this.message,
    this.nextToken,
    this.requestId,
    this.steps,
    this.workflowBuildVersionArn,
    this.workflowExecutionId,
  });

  factory ListWorkflowStepExecutionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListWorkflowStepExecutionsResponse(
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      message: json['message'] as String?,
      nextToken: json['nextToken'] as String?,
      requestId: json['requestId'] as String?,
      steps: (json['steps'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowStepMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      workflowBuildVersionArn: json['workflowBuildVersionArn'] as String?,
      workflowExecutionId: json['workflowExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final message = this.message;
    final nextToken = this.nextToken;
    final requestId = this.requestId;
    final steps = this.steps;
    final workflowBuildVersionArn = this.workflowBuildVersionArn;
    final workflowExecutionId = this.workflowExecutionId;
    return {
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (message != null) 'message': message,
      if (nextToken != null) 'nextToken': nextToken,
      if (requestId != null) 'requestId': requestId,
      if (steps != null) 'steps': steps,
      if (workflowBuildVersionArn != null)
        'workflowBuildVersionArn': workflowBuildVersionArn,
      if (workflowExecutionId != null)
        'workflowExecutionId': workflowExecutionId,
    };
  }
}

class ListWorkflowsResponse {
  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// A list of workflow build versions that match the request criteria.
  final List<WorkflowVersion>? workflowVersionList;

  ListWorkflowsResponse({
    this.nextToken,
    this.workflowVersionList,
  });

  factory ListWorkflowsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkflowsResponse(
      nextToken: json['nextToken'] as String?,
      workflowVersionList: (json['workflowVersionList'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final workflowVersionList = this.workflowVersionList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (workflowVersionList != null)
        'workflowVersionList': workflowVersionList,
    };
  }
}

/// Logging configuration defines where Image Builder uploads your logs.
class Logging {
  /// The Amazon S3 logging configuration.
  final S3Logs? s3Logs;

  Logging({
    this.s3Logs,
  });

  factory Logging.fromJson(Map<String, dynamic> json) {
    return Logging(
      s3Logs: json['s3Logs'] != null
          ? S3Logs.fromJson(json['s3Logs'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Logs = this.s3Logs;
    return {
      if (s3Logs != null) 's3Logs': s3Logs,
    };
  }
}

enum OnWorkflowFailure {
  $continue,
  abort,
}

extension OnWorkflowFailureValueExtension on OnWorkflowFailure {
  String toValue() {
    switch (this) {
      case OnWorkflowFailure.$continue:
        return 'CONTINUE';
      case OnWorkflowFailure.abort:
        return 'ABORT';
    }
  }
}

extension OnWorkflowFailureFromString on String {
  OnWorkflowFailure toOnWorkflowFailure() {
    switch (this) {
      case 'CONTINUE':
        return OnWorkflowFailure.$continue;
      case 'ABORT':
        return OnWorkflowFailure.abort;
    }
    throw Exception('$this is not known in enum OnWorkflowFailure');
  }
}

/// The resources produced by this image.
class OutputResources {
  /// The Amazon EC2 AMIs created by this image.
  final List<Ami>? amis;

  /// Container images that the pipeline has generated and stored in the output
  /// repository.
  final List<Container>? containers;

  OutputResources({
    this.amis,
    this.containers,
  });

  factory OutputResources.fromJson(Map<String, dynamic> json) {
    return OutputResources(
      amis: (json['amis'] as List?)
          ?.whereNotNull()
          .map((e) => Ami.fromJson(e as Map<String, dynamic>))
          .toList(),
      containers: (json['containers'] as List?)
          ?.whereNotNull()
          .map((e) => Container.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final amis = this.amis;
    final containers = this.containers;
    return {
      if (amis != null) 'amis': amis,
      if (containers != null) 'containers': containers,
    };
  }
}

enum Ownership {
  self,
  shared,
  amazon,
  thirdParty,
}

extension OwnershipValueExtension on Ownership {
  String toValue() {
    switch (this) {
      case Ownership.self:
        return 'Self';
      case Ownership.shared:
        return 'Shared';
      case Ownership.amazon:
        return 'Amazon';
      case Ownership.thirdParty:
        return 'ThirdParty';
    }
  }
}

extension OwnershipFromString on String {
  Ownership toOwnership() {
    switch (this) {
      case 'Self':
        return Ownership.self;
      case 'Shared':
        return Ownership.shared;
      case 'Amazon':
        return Ownership.amazon;
      case 'ThirdParty':
        return Ownership.thirdParty;
    }
    throw Exception('$this is not known in enum Ownership');
  }
}

/// Information about package vulnerability findings.
class PackageVulnerabilityDetails {
  /// A unique identifier for this vulnerability.
  final String vulnerabilityId;

  /// CVSS scores for one or more vulnerabilities that Amazon Inspector identified
  /// for a package.
  final List<CvssScore>? cvss;

  /// Links to web pages that contain details about the vulnerabilities that
  /// Amazon Inspector identified for the package.
  final List<String>? referenceUrls;

  /// Vulnerabilities that are often related to the findings for the package.
  final List<String>? relatedVulnerabilities;

  /// The source of the vulnerability information.
  final String? source;

  /// A link to the source of the vulnerability information.
  final String? sourceUrl;

  /// The date and time when this vulnerability was first added to the vendor's
  /// database.
  final DateTime? vendorCreatedAt;

  /// The severity that the vendor assigned to this vulnerability type.
  final String? vendorSeverity;

  /// The date and time when the vendor last updated this vulnerability in their
  /// database.
  final DateTime? vendorUpdatedAt;

  /// The packages that this vulnerability impacts.
  final List<VulnerablePackage>? vulnerablePackages;

  PackageVulnerabilityDetails({
    required this.vulnerabilityId,
    this.cvss,
    this.referenceUrls,
    this.relatedVulnerabilities,
    this.source,
    this.sourceUrl,
    this.vendorCreatedAt,
    this.vendorSeverity,
    this.vendorUpdatedAt,
    this.vulnerablePackages,
  });

  factory PackageVulnerabilityDetails.fromJson(Map<String, dynamic> json) {
    return PackageVulnerabilityDetails(
      vulnerabilityId: json['vulnerabilityId'] as String,
      cvss: (json['cvss'] as List?)
          ?.whereNotNull()
          .map((e) => CvssScore.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceUrls: (json['referenceUrls'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      source: json['source'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      vendorCreatedAt: timeStampFromJson(json['vendorCreatedAt']),
      vendorSeverity: json['vendorSeverity'] as String?,
      vendorUpdatedAt: timeStampFromJson(json['vendorUpdatedAt']),
      vulnerablePackages: (json['vulnerablePackages'] as List?)
          ?.whereNotNull()
          .map((e) => VulnerablePackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vulnerabilityId = this.vulnerabilityId;
    final cvss = this.cvss;
    final referenceUrls = this.referenceUrls;
    final relatedVulnerabilities = this.relatedVulnerabilities;
    final source = this.source;
    final sourceUrl = this.sourceUrl;
    final vendorCreatedAt = this.vendorCreatedAt;
    final vendorSeverity = this.vendorSeverity;
    final vendorUpdatedAt = this.vendorUpdatedAt;
    final vulnerablePackages = this.vulnerablePackages;
    return {
      'vulnerabilityId': vulnerabilityId,
      if (cvss != null) 'cvss': cvss,
      if (referenceUrls != null) 'referenceUrls': referenceUrls,
      if (relatedVulnerabilities != null)
        'relatedVulnerabilities': relatedVulnerabilities,
      if (source != null) 'source': source,
      if (sourceUrl != null) 'sourceUrl': sourceUrl,
      if (vendorCreatedAt != null)
        'vendorCreatedAt': unixTimestampToJson(vendorCreatedAt),
      if (vendorSeverity != null) 'vendorSeverity': vendorSeverity,
      if (vendorUpdatedAt != null)
        'vendorUpdatedAt': unixTimestampToJson(vendorUpdatedAt),
      if (vulnerablePackages != null) 'vulnerablePackages': vulnerablePackages,
    };
  }
}

enum PipelineExecutionStartCondition {
  expressionMatchOnly,
  expressionMatchAndDependencyUpdatesAvailable,
}

extension PipelineExecutionStartConditionValueExtension
    on PipelineExecutionStartCondition {
  String toValue() {
    switch (this) {
      case PipelineExecutionStartCondition.expressionMatchOnly:
        return 'EXPRESSION_MATCH_ONLY';
      case PipelineExecutionStartCondition
            .expressionMatchAndDependencyUpdatesAvailable:
        return 'EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE';
    }
  }
}

extension PipelineExecutionStartConditionFromString on String {
  PipelineExecutionStartCondition toPipelineExecutionStartCondition() {
    switch (this) {
      case 'EXPRESSION_MATCH_ONLY':
        return PipelineExecutionStartCondition.expressionMatchOnly;
      case 'EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE':
        return PipelineExecutionStartCondition
            .expressionMatchAndDependencyUpdatesAvailable;
    }
    throw Exception(
        '$this is not known in enum PipelineExecutionStartCondition');
  }
}

enum PipelineStatus {
  disabled,
  enabled,
}

extension PipelineStatusValueExtension on PipelineStatus {
  String toValue() {
    switch (this) {
      case PipelineStatus.disabled:
        return 'DISABLED';
      case PipelineStatus.enabled:
        return 'ENABLED';
    }
  }
}

extension PipelineStatusFromString on String {
  PipelineStatus toPipelineStatus() {
    switch (this) {
      case 'DISABLED':
        return PipelineStatus.disabled;
      case 'ENABLED':
        return PipelineStatus.enabled;
    }
    throw Exception('$this is not known in enum PipelineStatus');
  }
}

enum Platform {
  windows,
  linux,
}

extension PlatformValueExtension on Platform {
  String toValue() {
    switch (this) {
      case Platform.windows:
        return 'Windows';
      case Platform.linux:
        return 'Linux';
    }
  }
}

extension PlatformFromString on String {
  Platform toPlatform() {
    switch (this) {
      case 'Windows':
        return Platform.windows;
      case 'Linux':
        return Platform.linux;
    }
    throw Exception('$this is not known in enum Platform');
  }
}

class PutComponentPolicyResponse {
  /// The Amazon Resource Name (ARN) of the component that this policy was applied
  /// to.
  final String? componentArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  PutComponentPolicyResponse({
    this.componentArn,
    this.requestId,
  });

  factory PutComponentPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutComponentPolicyResponse(
      componentArn: json['componentArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final componentArn = this.componentArn;
    final requestId = this.requestId;
    return {
      if (componentArn != null) 'componentArn': componentArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class PutContainerRecipePolicyResponse {
  /// The Amazon Resource Name (ARN) of the container recipe that this policy was
  /// applied to.
  final String? containerRecipeArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  PutContainerRecipePolicyResponse({
    this.containerRecipeArn,
    this.requestId,
  });

  factory PutContainerRecipePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutContainerRecipePolicyResponse(
      containerRecipeArn: json['containerRecipeArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final containerRecipeArn = this.containerRecipeArn;
    final requestId = this.requestId;
    return {
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class PutImagePolicyResponse {
  /// The Amazon Resource Name (ARN) of the image that this policy was applied to.
  final String? imageArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  PutImagePolicyResponse({
    this.imageArn,
    this.requestId,
  });

  factory PutImagePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutImagePolicyResponse(
      imageArn: json['imageArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageArn = this.imageArn;
    final requestId = this.requestId;
    return {
      if (imageArn != null) 'imageArn': imageArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class PutImageRecipePolicyResponse {
  /// The Amazon Resource Name (ARN) of the image recipe that this policy was
  /// applied to.
  final String? imageRecipeArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  PutImageRecipePolicyResponse({
    this.imageRecipeArn,
    this.requestId,
  });

  factory PutImageRecipePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutImageRecipePolicyResponse(
      imageRecipeArn: json['imageRecipeArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageRecipeArn = this.imageRecipeArn;
    final requestId = this.requestId;
    return {
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

/// Information about how to remediate a finding.
class Remediation {
  /// An object that contains information about the recommended course of action
  /// to remediate the finding.
  final RemediationRecommendation? recommendation;

  Remediation({
    this.recommendation,
  });

  factory Remediation.fromJson(Map<String, dynamic> json) {
    return Remediation(
      recommendation: json['recommendation'] != null
          ? RemediationRecommendation.fromJson(
              json['recommendation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recommendation = this.recommendation;
    return {
      if (recommendation != null) 'recommendation': recommendation,
    };
  }
}

/// Details about the recommended course of action to remediate the finding.
class RemediationRecommendation {
  /// The recommended course of action to remediate the finding.
  final String? text;

  /// A link to more information about the recommended remediation for this
  /// vulnerability.
  final String? url;

  RemediationRecommendation({
    this.text,
    this.url,
  });

  factory RemediationRecommendation.fromJson(Map<String, dynamic> json) {
    return RemediationRecommendation(
      text: json['text'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    final url = this.url;
    return {
      if (text != null) 'text': text,
      if (url != null) 'url': url,
    };
  }
}

/// The current state of an impacted resource.
class ResourceState {
  /// Shows the current lifecycle policy action that was applied to an impacted
  /// resource.
  final ResourceStatus? status;

  ResourceState({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Additional rules to specify resources that should be exempt from ad-hoc
/// lifecycle actions.
class ResourceStateUpdateExclusionRules {
  final LifecyclePolicyDetailExclusionRulesAmis? amis;

  ResourceStateUpdateExclusionRules({
    this.amis,
  });

  Map<String, dynamic> toJson() {
    final amis = this.amis;
    return {
      if (amis != null) 'amis': amis,
    };
  }
}

/// Specifies if the lifecycle policy should apply actions to selected
/// resources.
class ResourceStateUpdateIncludeResources {
  /// Specifies whether the lifecycle action should apply to distributed AMIs
  final bool? amis;

  /// Specifies whether the lifecycle action should apply to distributed
  /// containers.
  final bool? containers;

  /// Specifies whether the lifecycle action should apply to snapshots associated
  /// with distributed AMIs.
  final bool? snapshots;

  ResourceStateUpdateIncludeResources({
    this.amis,
    this.containers,
    this.snapshots,
  });

  Map<String, dynamic> toJson() {
    final amis = this.amis;
    final containers = this.containers;
    final snapshots = this.snapshots;
    return {
      if (amis != null) 'amis': amis,
      if (containers != null) 'containers': containers,
      if (snapshots != null) 'snapshots': snapshots,
    };
  }
}

enum ResourceStatus {
  available,
  deleted,
  deprecated,
  disabled,
}

extension ResourceStatusValueExtension on ResourceStatus {
  String toValue() {
    switch (this) {
      case ResourceStatus.available:
        return 'AVAILABLE';
      case ResourceStatus.deleted:
        return 'DELETED';
      case ResourceStatus.deprecated:
        return 'DEPRECATED';
      case ResourceStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension ResourceStatusFromString on String {
  ResourceStatus toResourceStatus() {
    switch (this) {
      case 'AVAILABLE':
        return ResourceStatus.available;
      case 'DELETED':
        return ResourceStatus.deleted;
      case 'DEPRECATED':
        return ResourceStatus.deprecated;
      case 'DISABLED':
        return ResourceStatus.disabled;
    }
    throw Exception('$this is not known in enum ResourceStatus');
  }
}

/// Properties that configure export from your build instance to a compatible
/// file format for your VM.
class S3ExportConfiguration {
  /// Export the updated image to one of the following supported disk image
  /// formats:
  ///
  /// <ul>
  /// <li>
  /// <b>Virtual Hard Disk (VHD)</b> – Compatible with Citrix Xen and Microsoft
  /// Hyper-V virtualization products.
  /// </li>
  /// <li>
  /// <b>Stream-optimized ESX Virtual Machine Disk (VMDK)</b> – Compatible with
  /// VMware ESX and VMware vSphere versions 4, 5, and 6.
  /// </li>
  /// <li>
  /// <b>Raw</b> – Raw format.
  /// </li>
  /// </ul>
  final DiskImageFormat diskImageFormat;

  /// The name of the role that grants VM Import/Export permission to export
  /// images to your S3 bucket.
  final String roleName;

  /// The S3 bucket in which to store the output disk images for your VM.
  final String s3Bucket;

  /// The Amazon S3 path for the bucket where the output disk images for your VM
  /// are stored.
  final String? s3Prefix;

  S3ExportConfiguration({
    required this.diskImageFormat,
    required this.roleName,
    required this.s3Bucket,
    this.s3Prefix,
  });

  factory S3ExportConfiguration.fromJson(Map<String, dynamic> json) {
    return S3ExportConfiguration(
      diskImageFormat: (json['diskImageFormat'] as String).toDiskImageFormat(),
      roleName: json['roleName'] as String,
      s3Bucket: json['s3Bucket'] as String,
      s3Prefix: json['s3Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final diskImageFormat = this.diskImageFormat;
    final roleName = this.roleName;
    final s3Bucket = this.s3Bucket;
    final s3Prefix = this.s3Prefix;
    return {
      'diskImageFormat': diskImageFormat.toValue(),
      'roleName': roleName,
      's3Bucket': s3Bucket,
      if (s3Prefix != null) 's3Prefix': s3Prefix,
    };
  }
}

/// Amazon S3 logging configuration.
class S3Logs {
  /// The S3 bucket in which to store the logs.
  final String? s3BucketName;

  /// The Amazon S3 path to the bucket where the logs are stored.
  final String? s3KeyPrefix;

  S3Logs({
    this.s3BucketName,
    this.s3KeyPrefix,
  });

  factory S3Logs.fromJson(Map<String, dynamic> json) {
    return S3Logs(
      s3BucketName: json['s3BucketName'] as String?,
      s3KeyPrefix: json['s3KeyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketName = this.s3BucketName;
    final s3KeyPrefix = this.s3KeyPrefix;
    return {
      if (s3BucketName != null) 's3BucketName': s3BucketName,
      if (s3KeyPrefix != null) 's3KeyPrefix': s3KeyPrefix,
    };
  }
}

/// A schedule configures when and how often a pipeline will automatically
/// create a new image.
class Schedule {
  /// The condition configures when the pipeline should trigger a new image build.
  /// When the <code>pipelineExecutionStartCondition</code> is set to
  /// <code>EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE</code>, and you use
  /// semantic version filters on the base image or components in your image
  /// recipe, EC2 Image Builder will build a new image only when there are new
  /// versions of the image or components in your recipe that match the semantic
  /// version filter. When it is set to <code>EXPRESSION_MATCH_ONLY</code>, it
  /// will build a new image every time the CRON expression matches the current
  /// time. For semantic version syntax, see <a
  /// href="https://docs.aws.amazon.com/imagebuilder/latest/APIReference/API_CreateComponent.html">CreateComponent</a>
  /// in the <i> EC2 Image Builder API Reference</i>.
  final PipelineExecutionStartCondition? pipelineExecutionStartCondition;

  /// The cron expression determines how often EC2 Image Builder evaluates your
  /// <code>pipelineExecutionStartCondition</code>.
  ///
  /// For information on how to format a cron expression in Image Builder, see <a
  /// href="https://docs.aws.amazon.com/imagebuilder/latest/userguide/image-builder-cron.html">Use
  /// cron expressions in EC2 Image Builder</a>.
  final String? scheduleExpression;

  /// The timezone that applies to the scheduling expression. For example,
  /// "Etc/UTC", "America/Los_Angeles" in the <a
  /// href="https://www.joda.org/joda-time/timezones.html">IANA timezone
  /// format</a>. If not specified this defaults to UTC.
  final String? timezone;

  Schedule({
    this.pipelineExecutionStartCondition,
    this.scheduleExpression,
    this.timezone,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      pipelineExecutionStartCondition:
          (json['pipelineExecutionStartCondition'] as String?)
              ?.toPipelineExecutionStartCondition(),
      scheduleExpression: json['scheduleExpression'] as String?,
      timezone: json['timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final pipelineExecutionStartCondition =
        this.pipelineExecutionStartCondition;
    final scheduleExpression = this.scheduleExpression;
    final timezone = this.timezone;
    return {
      if (pipelineExecutionStartCondition != null)
        'pipelineExecutionStartCondition':
            pipelineExecutionStartCondition.toValue(),
      if (scheduleExpression != null) 'scheduleExpression': scheduleExpression,
      if (timezone != null) 'timezone': timezone,
    };
  }
}

class SendWorkflowStepActionResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the image build version that received the
  /// action request.
  final String? imageBuildVersionArn;

  /// The workflow step that sent the step action.
  final String? stepExecutionId;

  SendWorkflowStepActionResponse({
    this.clientToken,
    this.imageBuildVersionArn,
    this.stepExecutionId,
  });

  factory SendWorkflowStepActionResponse.fromJson(Map<String, dynamic> json) {
    return SendWorkflowStepActionResponse(
      clientToken: json['clientToken'] as String?,
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      stepExecutionId: json['stepExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final stepExecutionId = this.stepExecutionId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (stepExecutionId != null) 'stepExecutionId': stepExecutionId,
    };
  }
}

/// Includes counts by severity level for medium severity and higher level
/// findings, plus a total for all of the findings for the specified filter.
class SeverityCounts {
  /// The total number of findings across all severity levels for the specified
  /// filter.
  final int? all;

  /// The number of critical severity findings for the specified filter.
  final int? critical;

  /// The number of high severity findings for the specified filter.
  final int? high;

  /// The number of medium severity findings for the specified filter.
  final int? medium;

  SeverityCounts({
    this.all,
    this.critical,
    this.high,
    this.medium,
  });

  factory SeverityCounts.fromJson(Map<String, dynamic> json) {
    return SeverityCounts(
      all: json['all'] as int?,
      critical: json['critical'] as int?,
      high: json['high'] as int?,
      medium: json['medium'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final all = this.all;
    final critical = this.critical;
    final high = this.high;
    final medium = this.medium;
    return {
      if (all != null) 'all': all,
      if (critical != null) 'critical': critical,
      if (high != null) 'high': high,
      if (medium != null) 'medium': medium,
    };
  }
}

class StartImagePipelineExecutionResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the image that the request created.
  final String? imageBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  StartImagePipelineExecutionResponse({
    this.clientToken,
    this.imageBuildVersionArn,
    this.requestId,
  });

  factory StartImagePipelineExecutionResponse.fromJson(
      Map<String, dynamic> json) {
    return StartImagePipelineExecutionResponse(
      clientToken: json['clientToken'] as String?,
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class StartResourceStateUpdateResponse {
  /// Identifies the lifecycle runtime instance that started the resource state
  /// update.
  final String? lifecycleExecutionId;

  /// The requested ARN of the Image Builder resource for the asynchronous update.
  final String? resourceArn;

  StartResourceStateUpdateResponse({
    this.lifecycleExecutionId,
    this.resourceArn,
  });

  factory StartResourceStateUpdateResponse.fromJson(Map<String, dynamic> json) {
    return StartResourceStateUpdateResponse(
      lifecycleExecutionId: json['lifecycleExecutionId'] as String?,
      resourceArn: json['resourceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecycleExecutionId = this.lifecycleExecutionId;
    final resourceArn = this.resourceArn;
    return {
      if (lifecycleExecutionId != null)
        'lifecycleExecutionId': lifecycleExecutionId,
      if (resourceArn != null) 'resourceArn': resourceArn,
    };
  }
}

/// Contains settings for the Systems Manager agent on your build instance.
class SystemsManagerAgent {
  /// Controls whether the Systems Manager agent is removed from your final build
  /// image, prior to creating the new AMI. If this is set to true, then the agent
  /// is removed from the final image. If it's set to false, then the agent is
  /// left in, so that it is included in the new AMI. The default value is false.
  final bool? uninstallAfterBuild;

  SystemsManagerAgent({
    this.uninstallAfterBuild,
  });

  factory SystemsManagerAgent.fromJson(Map<String, dynamic> json) {
    return SystemsManagerAgent(
      uninstallAfterBuild: json['uninstallAfterBuild'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final uninstallAfterBuild = this.uninstallAfterBuild;
    return {
      if (uninstallAfterBuild != null)
        'uninstallAfterBuild': uninstallAfterBuild,
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

/// The container repository where the output container image is stored.
class TargetContainerRepository {
  /// The name of the container repository where the output container image is
  /// stored. This name is prefixed by the repository location.
  final String repositoryName;

  /// Specifies the service in which this image was registered.
  final ContainerRepositoryService service;

  TargetContainerRepository({
    required this.repositoryName,
    required this.service,
  });

  factory TargetContainerRepository.fromJson(Map<String, dynamic> json) {
    return TargetContainerRepository(
      repositoryName: json['repositoryName'] as String,
      service: (json['service'] as String).toContainerRepositoryService(),
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryName = this.repositoryName;
    final service = this.service;
    return {
      'repositoryName': repositoryName,
      'service': service.toValue(),
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

class UpdateDistributionConfigurationResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the distribution configuration that was
  /// updated by this request.
  final String? distributionConfigurationArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  UpdateDistributionConfigurationResponse({
    this.clientToken,
    this.distributionConfigurationArn,
    this.requestId,
  });

  factory UpdateDistributionConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDistributionConfigurationResponse(
      clientToken: json['clientToken'] as String?,
      distributionConfigurationArn:
          json['distributionConfigurationArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final distributionConfigurationArn = this.distributionConfigurationArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class UpdateImagePipelineResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the image pipeline that was updated by
  /// this request.
  final String? imagePipelineArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  UpdateImagePipelineResponse({
    this.clientToken,
    this.imagePipelineArn,
    this.requestId,
  });

  factory UpdateImagePipelineResponse.fromJson(Map<String, dynamic> json) {
    return UpdateImagePipelineResponse(
      clientToken: json['clientToken'] as String?,
      imagePipelineArn: json['imagePipelineArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final imagePipelineArn = this.imagePipelineArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (imagePipelineArn != null) 'imagePipelineArn': imagePipelineArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class UpdateInfrastructureConfigurationResponse {
  /// The client token that uniquely identifies the request.
  final String? clientToken;

  /// The Amazon Resource Name (ARN) of the infrastructure configuration that was
  /// updated by this request.
  final String? infrastructureConfigurationArn;

  /// The request ID that uniquely identifies this request.
  final String? requestId;

  UpdateInfrastructureConfigurationResponse({
    this.clientToken,
    this.infrastructureConfigurationArn,
    this.requestId,
  });

  factory UpdateInfrastructureConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateInfrastructureConfigurationResponse(
      clientToken: json['clientToken'] as String?,
      infrastructureConfigurationArn:
          json['infrastructureConfigurationArn'] as String?,
      requestId: json['requestId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final infrastructureConfigurationArn = this.infrastructureConfigurationArn;
    final requestId = this.requestId;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (infrastructureConfigurationArn != null)
        'infrastructureConfigurationArn': infrastructureConfigurationArn,
      if (requestId != null) 'requestId': requestId,
    };
  }
}

class UpdateLifecyclePolicyResponse {
  /// The ARN of the image lifecycle policy resource that was updated.
  final String? lifecyclePolicyArn;

  UpdateLifecyclePolicyResponse({
    this.lifecyclePolicyArn,
  });

  factory UpdateLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLifecyclePolicyResponse(
      lifecyclePolicyArn: json['lifecyclePolicyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicyArn = this.lifecyclePolicyArn;
    return {
      if (lifecyclePolicyArn != null) 'lifecyclePolicyArn': lifecyclePolicyArn,
    };
  }
}

/// Includes counts of image and pipeline resource findings by vulnerability.
class VulnerabilityIdAggregation {
  /// Counts by severity level for medium severity and higher level findings, plus
  /// a total for all of the findings for the specified vulnerability.
  final SeverityCounts? severityCounts;

  /// The vulnerability Id for this set of counts.
  final String? vulnerabilityId;

  VulnerabilityIdAggregation({
    this.severityCounts,
    this.vulnerabilityId,
  });

  factory VulnerabilityIdAggregation.fromJson(Map<String, dynamic> json) {
    return VulnerabilityIdAggregation(
      severityCounts: json['severityCounts'] != null
          ? SeverityCounts.fromJson(
              json['severityCounts'] as Map<String, dynamic>)
          : null,
      vulnerabilityId: json['vulnerabilityId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final severityCounts = this.severityCounts;
    final vulnerabilityId = this.vulnerabilityId;
    return {
      if (severityCounts != null) 'severityCounts': severityCounts,
      if (vulnerabilityId != null) 'vulnerabilityId': vulnerabilityId,
    };
  }
}

/// Information about a vulnerable package that Amazon Inspector identifies in a
/// finding.
class VulnerablePackage {
  /// The architecture of the vulnerable package.
  final String? arch;

  /// The epoch of the vulnerable package.
  final int? epoch;

  /// The file path of the vulnerable package.
  final String? filePath;

  /// The version of the package that contains the vulnerability fix.
  final String? fixedInVersion;

  /// The name of the vulnerable package.
  final String? name;

  /// The package manager of the vulnerable package.
  final String? packageManager;

  /// The release of the vulnerable package.
  final String? release;

  /// The code to run in your environment to update packages with a fix available.
  final String? remediation;

  /// The source layer hash of the vulnerable package.
  final String? sourceLayerHash;

  /// The version of the vulnerable package.
  final String? version;

  VulnerablePackage({
    this.arch,
    this.epoch,
    this.filePath,
    this.fixedInVersion,
    this.name,
    this.packageManager,
    this.release,
    this.remediation,
    this.sourceLayerHash,
    this.version,
  });

  factory VulnerablePackage.fromJson(Map<String, dynamic> json) {
    return VulnerablePackage(
      arch: json['arch'] as String?,
      epoch: json['epoch'] as int?,
      filePath: json['filePath'] as String?,
      fixedInVersion: json['fixedInVersion'] as String?,
      name: json['name'] as String?,
      packageManager: json['packageManager'] as String?,
      release: json['release'] as String?,
      remediation: json['remediation'] as String?,
      sourceLayerHash: json['sourceLayerHash'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arch = this.arch;
    final epoch = this.epoch;
    final filePath = this.filePath;
    final fixedInVersion = this.fixedInVersion;
    final name = this.name;
    final packageManager = this.packageManager;
    final release = this.release;
    final remediation = this.remediation;
    final sourceLayerHash = this.sourceLayerHash;
    final version = this.version;
    return {
      if (arch != null) 'arch': arch,
      if (epoch != null) 'epoch': epoch,
      if (filePath != null) 'filePath': filePath,
      if (fixedInVersion != null) 'fixedInVersion': fixedInVersion,
      if (name != null) 'name': name,
      if (packageManager != null) 'packageManager': packageManager,
      if (release != null) 'release': release,
      if (remediation != null) 'remediation': remediation,
      if (sourceLayerHash != null) 'sourceLayerHash': sourceLayerHash,
      if (version != null) 'version': version,
    };
  }
}

/// Defines a process that Image Builder uses to build and test images during
/// the image creation process.
class Workflow {
  /// The Amazon Resource Name (ARN) of the workflow resource.
  final String? arn;

  /// Describes what change has been made in this version of the workflow, or what
  /// makes this version different from other versions of the workflow.
  final String? changeDescription;

  /// Contains the YAML document content for the workflow.
  final String? data;

  /// The timestamp when Image Builder created the workflow resource.
  final String? dateCreated;

  /// The description of the workflow.
  final String? description;

  /// The KMS key identifier used to encrypt the workflow resource.
  final String? kmsKeyId;

  /// The name of the workflow resource.
  final String? name;

  /// The owner of the workflow resource.
  final String? owner;

  /// An array of input parameters that that the image workflow uses to control
  /// actions or configure settings.
  final List<WorkflowParameterDetail>? parameters;

  /// Describes the current status of the workflow and the reason for that status.
  final WorkflowState? state;

  /// The tags that apply to the workflow resource
  final Map<String, String>? tags;

  /// Specifies the image creation stage that the workflow applies to. Image
  /// Builder currently supports build and test workflows.
  final WorkflowType? type;

  /// The workflow resource version. Workflow resources are immutable. To make a
  /// change, you can clone a workflow or create a new version.
  final String? version;

  Workflow({
    this.arn,
    this.changeDescription,
    this.data,
    this.dateCreated,
    this.description,
    this.kmsKeyId,
    this.name,
    this.owner,
    this.parameters,
    this.state,
    this.tags,
    this.type,
    this.version,
  });

  factory Workflow.fromJson(Map<String, dynamic> json) {
    return Workflow(
      arn: json['arn'] as String?,
      changeDescription: json['changeDescription'] as String?,
      data: json['data'] as String?,
      dateCreated: json['dateCreated'] as String?,
      description: json['description'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) =>
              WorkflowParameterDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      state: json['state'] != null
          ? WorkflowState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toWorkflowType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final changeDescription = this.changeDescription;
    final data = this.data;
    final dateCreated = this.dateCreated;
    final description = this.description;
    final kmsKeyId = this.kmsKeyId;
    final name = this.name;
    final owner = this.owner;
    final parameters = this.parameters;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (changeDescription != null) 'changeDescription': changeDescription,
      if (data != null) 'data': data,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (parameters != null) 'parameters': parameters,
      if (state != null) 'state': state,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

/// Contains control settings and configurable inputs for a workflow resource.
class WorkflowConfiguration {
  /// The Amazon Resource Name (ARN) of the workflow resource.
  final String workflowArn;

  /// The action to take if the workflow fails.
  final OnWorkflowFailure? onFailure;

  /// Test workflows are defined within named runtime groups called parallel
  /// groups. The parallel group is the named group that contains this test
  /// workflow. Test workflows within a parallel group can run at the same time.
  /// Image Builder starts up to five test workflows in the group at the same
  /// time, and starts additional workflows as others complete, until all
  /// workflows in the group have completed. This field only applies for test
  /// workflows.
  final String? parallelGroup;

  /// Contains parameter values for each of the parameters that the workflow
  /// document defined for the workflow resource.
  final List<WorkflowParameter>? parameters;

  WorkflowConfiguration({
    required this.workflowArn,
    this.onFailure,
    this.parallelGroup,
    this.parameters,
  });

  factory WorkflowConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkflowConfiguration(
      workflowArn: json['workflowArn'] as String,
      onFailure: (json['onFailure'] as String?)?.toOnWorkflowFailure(),
      parallelGroup: json['parallelGroup'] as String?,
      parameters: (json['parameters'] as List?)
          ?.whereNotNull()
          .map((e) => WorkflowParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final workflowArn = this.workflowArn;
    final onFailure = this.onFailure;
    final parallelGroup = this.parallelGroup;
    final parameters = this.parameters;
    return {
      'workflowArn': workflowArn,
      if (onFailure != null) 'onFailure': onFailure.toValue(),
      if (parallelGroup != null) 'parallelGroup': parallelGroup,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// Metadata that includes details and status from this runtime instance of the
/// workflow.
class WorkflowExecutionMetadata {
  /// The timestamp when this runtime instance of the workflow finished.
  final String? endTime;

  /// The runtime output message from the workflow, if applicable.
  final String? message;

  /// The name of the test group that included the test workflow resource at
  /// runtime.
  final String? parallelGroup;

  /// The timestamp when the runtime instance of this workflow started.
  final String? startTime;

  /// The current runtime status for this workflow.
  final WorkflowExecutionStatus? status;

  /// The total number of steps in the workflow. This should equal the sum of the
  /// step counts for steps that succeeded, were skipped, and failed.
  final int? totalStepCount;

  /// A runtime count for the number of steps in the workflow that failed.
  final int? totalStepsFailed;

  /// A runtime count for the number of steps in the workflow that were skipped.
  final int? totalStepsSkipped;

  /// A runtime count for the number of steps in the workflow that ran
  /// successfully.
  final int? totalStepsSucceeded;

  /// Indicates what type of workflow that Image Builder ran for this runtime
  /// instance of the workflow.
  final WorkflowType? type;

  /// The Amazon Resource Name (ARN) of the workflow resource build version that
  /// ran.
  final String? workflowBuildVersionArn;

  /// Unique identifier that Image Builder assigns to keep track of runtime
  /// resources each time it runs a workflow.
  final String? workflowExecutionId;

  WorkflowExecutionMetadata({
    this.endTime,
    this.message,
    this.parallelGroup,
    this.startTime,
    this.status,
    this.totalStepCount,
    this.totalStepsFailed,
    this.totalStepsSkipped,
    this.totalStepsSucceeded,
    this.type,
    this.workflowBuildVersionArn,
    this.workflowExecutionId,
  });

  factory WorkflowExecutionMetadata.fromJson(Map<String, dynamic> json) {
    return WorkflowExecutionMetadata(
      endTime: json['endTime'] as String?,
      message: json['message'] as String?,
      parallelGroup: json['parallelGroup'] as String?,
      startTime: json['startTime'] as String?,
      status: (json['status'] as String?)?.toWorkflowExecutionStatus(),
      totalStepCount: json['totalStepCount'] as int?,
      totalStepsFailed: json['totalStepsFailed'] as int?,
      totalStepsSkipped: json['totalStepsSkipped'] as int?,
      totalStepsSucceeded: json['totalStepsSucceeded'] as int?,
      type: (json['type'] as String?)?.toWorkflowType(),
      workflowBuildVersionArn: json['workflowBuildVersionArn'] as String?,
      workflowExecutionId: json['workflowExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final message = this.message;
    final parallelGroup = this.parallelGroup;
    final startTime = this.startTime;
    final status = this.status;
    final totalStepCount = this.totalStepCount;
    final totalStepsFailed = this.totalStepsFailed;
    final totalStepsSkipped = this.totalStepsSkipped;
    final totalStepsSucceeded = this.totalStepsSucceeded;
    final type = this.type;
    final workflowBuildVersionArn = this.workflowBuildVersionArn;
    final workflowExecutionId = this.workflowExecutionId;
    return {
      if (endTime != null) 'endTime': endTime,
      if (message != null) 'message': message,
      if (parallelGroup != null) 'parallelGroup': parallelGroup,
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
      if (totalStepCount != null) 'totalStepCount': totalStepCount,
      if (totalStepsFailed != null) 'totalStepsFailed': totalStepsFailed,
      if (totalStepsSkipped != null) 'totalStepsSkipped': totalStepsSkipped,
      if (totalStepsSucceeded != null)
        'totalStepsSucceeded': totalStepsSucceeded,
      if (type != null) 'type': type.toValue(),
      if (workflowBuildVersionArn != null)
        'workflowBuildVersionArn': workflowBuildVersionArn,
      if (workflowExecutionId != null)
        'workflowExecutionId': workflowExecutionId,
    };
  }
}

enum WorkflowExecutionStatus {
  pending,
  skipped,
  running,
  completed,
  failed,
  rollbackInProgress,
  rollbackCompleted,
  cancelled,
}

extension WorkflowExecutionStatusValueExtension on WorkflowExecutionStatus {
  String toValue() {
    switch (this) {
      case WorkflowExecutionStatus.pending:
        return 'PENDING';
      case WorkflowExecutionStatus.skipped:
        return 'SKIPPED';
      case WorkflowExecutionStatus.running:
        return 'RUNNING';
      case WorkflowExecutionStatus.completed:
        return 'COMPLETED';
      case WorkflowExecutionStatus.failed:
        return 'FAILED';
      case WorkflowExecutionStatus.rollbackInProgress:
        return 'ROLLBACK_IN_PROGRESS';
      case WorkflowExecutionStatus.rollbackCompleted:
        return 'ROLLBACK_COMPLETED';
      case WorkflowExecutionStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension WorkflowExecutionStatusFromString on String {
  WorkflowExecutionStatus toWorkflowExecutionStatus() {
    switch (this) {
      case 'PENDING':
        return WorkflowExecutionStatus.pending;
      case 'SKIPPED':
        return WorkflowExecutionStatus.skipped;
      case 'RUNNING':
        return WorkflowExecutionStatus.running;
      case 'COMPLETED':
        return WorkflowExecutionStatus.completed;
      case 'FAILED':
        return WorkflowExecutionStatus.failed;
      case 'ROLLBACK_IN_PROGRESS':
        return WorkflowExecutionStatus.rollbackInProgress;
      case 'ROLLBACK_COMPLETED':
        return WorkflowExecutionStatus.rollbackCompleted;
      case 'CANCELLED':
        return WorkflowExecutionStatus.cancelled;
    }
    throw Exception('$this is not known in enum WorkflowExecutionStatus');
  }
}

/// Contains a key/value pair that sets the named workflow parameter.
class WorkflowParameter {
  /// The name of the workflow parameter to set.
  final String name;

  /// Sets the value for the named workflow parameter.
  final List<String> value;

  WorkflowParameter({
    required this.name,
    required this.value,
  });

  factory WorkflowParameter.fromJson(Map<String, dynamic> json) {
    return WorkflowParameter(
      name: json['name'] as String,
      value: (json['value'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// Defines a parameter that's used to provide configuration details for the
/// workflow.
class WorkflowParameterDetail {
  /// The name of this input parameter.
  final String name;

  /// The type of input this parameter provides. The currently supported value is
  /// "string".
  final String type;

  /// The default value of this parameter if no input is provided.
  final List<String>? defaultValue;

  /// Describes this parameter.
  final String? description;

  WorkflowParameterDetail({
    required this.name,
    required this.type,
    this.defaultValue,
    this.description,
  });

  factory WorkflowParameterDetail.fromJson(Map<String, dynamic> json) {
    return WorkflowParameterDetail(
      name: json['name'] as String,
      type: json['type'] as String,
      defaultValue: (json['defaultValue'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final defaultValue = this.defaultValue;
    final description = this.description;
    return {
      'name': name,
      'type': type,
      if (defaultValue != null) 'defaultValue': defaultValue,
      if (description != null) 'description': description,
    };
  }
}

/// A group of fields that describe the current status of workflow.
class WorkflowState {
  /// Describes how or why the workflow changed state.
  final String? reason;

  /// The current state of the workflow.
  final WorkflowStatus? status;

  WorkflowState({
    this.reason,
    this.status,
  });

  factory WorkflowState.fromJson(Map<String, dynamic> json) {
    return WorkflowState(
      reason: json['reason'] as String?,
      status: (json['status'] as String?)?.toWorkflowStatus(),
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

enum WorkflowStatus {
  deprecated,
}

extension WorkflowStatusValueExtension on WorkflowStatus {
  String toValue() {
    switch (this) {
      case WorkflowStatus.deprecated:
        return 'DEPRECATED';
    }
  }
}

extension WorkflowStatusFromString on String {
  WorkflowStatus toWorkflowStatus() {
    switch (this) {
      case 'DEPRECATED':
        return WorkflowStatus.deprecated;
    }
    throw Exception('$this is not known in enum WorkflowStatus');
  }
}

enum WorkflowStepActionType {
  resume,
  stop,
}

extension WorkflowStepActionTypeValueExtension on WorkflowStepActionType {
  String toValue() {
    switch (this) {
      case WorkflowStepActionType.resume:
        return 'RESUME';
      case WorkflowStepActionType.stop:
        return 'STOP';
    }
  }
}

extension WorkflowStepActionTypeFromString on String {
  WorkflowStepActionType toWorkflowStepActionType() {
    switch (this) {
      case 'RESUME':
        return WorkflowStepActionType.resume;
      case 'STOP':
        return WorkflowStepActionType.stop;
    }
    throw Exception('$this is not known in enum WorkflowStepActionType');
  }
}

/// Contains runtime details for an instance of a workflow that ran for the
/// associated image build version.
class WorkflowStepExecution {
  /// The name of the step action.
  final String? action;

  /// The Amazon Resource Name (ARN) of the image build version that ran the
  /// workflow.
  final String? imageBuildVersionArn;

  /// The name of the workflow step.
  final String? name;

  /// The timestamp when the workflow step started.
  final String? startTime;

  /// Uniquely identifies the workflow step that ran for the associated image
  /// build version.
  final String? stepExecutionId;

  /// The ARN of the workflow resource that ran.
  final String? workflowBuildVersionArn;

  /// Uniquely identifies the runtime instance of the workflow that contains the
  /// workflow step that ran for the associated image build version.
  final String? workflowExecutionId;

  WorkflowStepExecution({
    this.action,
    this.imageBuildVersionArn,
    this.name,
    this.startTime,
    this.stepExecutionId,
    this.workflowBuildVersionArn,
    this.workflowExecutionId,
  });

  factory WorkflowStepExecution.fromJson(Map<String, dynamic> json) {
    return WorkflowStepExecution(
      action: json['action'] as String?,
      imageBuildVersionArn: json['imageBuildVersionArn'] as String?,
      name: json['name'] as String?,
      startTime: json['startTime'] as String?,
      stepExecutionId: json['stepExecutionId'] as String?,
      workflowBuildVersionArn: json['workflowBuildVersionArn'] as String?,
      workflowExecutionId: json['workflowExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final imageBuildVersionArn = this.imageBuildVersionArn;
    final name = this.name;
    final startTime = this.startTime;
    final stepExecutionId = this.stepExecutionId;
    final workflowBuildVersionArn = this.workflowBuildVersionArn;
    final workflowExecutionId = this.workflowExecutionId;
    return {
      if (action != null) 'action': action,
      if (imageBuildVersionArn != null)
        'imageBuildVersionArn': imageBuildVersionArn,
      if (name != null) 'name': name,
      if (startTime != null) 'startTime': startTime,
      if (stepExecutionId != null) 'stepExecutionId': stepExecutionId,
      if (workflowBuildVersionArn != null)
        'workflowBuildVersionArn': workflowBuildVersionArn,
      if (workflowExecutionId != null)
        'workflowExecutionId': workflowExecutionId,
    };
  }
}

enum WorkflowStepExecutionRollbackStatus {
  running,
  completed,
  skipped,
  failed,
}

extension WorkflowStepExecutionRollbackStatusValueExtension
    on WorkflowStepExecutionRollbackStatus {
  String toValue() {
    switch (this) {
      case WorkflowStepExecutionRollbackStatus.running:
        return 'RUNNING';
      case WorkflowStepExecutionRollbackStatus.completed:
        return 'COMPLETED';
      case WorkflowStepExecutionRollbackStatus.skipped:
        return 'SKIPPED';
      case WorkflowStepExecutionRollbackStatus.failed:
        return 'FAILED';
    }
  }
}

extension WorkflowStepExecutionRollbackStatusFromString on String {
  WorkflowStepExecutionRollbackStatus toWorkflowStepExecutionRollbackStatus() {
    switch (this) {
      case 'RUNNING':
        return WorkflowStepExecutionRollbackStatus.running;
      case 'COMPLETED':
        return WorkflowStepExecutionRollbackStatus.completed;
      case 'SKIPPED':
        return WorkflowStepExecutionRollbackStatus.skipped;
      case 'FAILED':
        return WorkflowStepExecutionRollbackStatus.failed;
    }
    throw Exception(
        '$this is not known in enum WorkflowStepExecutionRollbackStatus');
  }
}

enum WorkflowStepExecutionStatus {
  pending,
  skipped,
  running,
  completed,
  failed,
  cancelled,
}

extension WorkflowStepExecutionStatusValueExtension
    on WorkflowStepExecutionStatus {
  String toValue() {
    switch (this) {
      case WorkflowStepExecutionStatus.pending:
        return 'PENDING';
      case WorkflowStepExecutionStatus.skipped:
        return 'SKIPPED';
      case WorkflowStepExecutionStatus.running:
        return 'RUNNING';
      case WorkflowStepExecutionStatus.completed:
        return 'COMPLETED';
      case WorkflowStepExecutionStatus.failed:
        return 'FAILED';
      case WorkflowStepExecutionStatus.cancelled:
        return 'CANCELLED';
    }
  }
}

extension WorkflowStepExecutionStatusFromString on String {
  WorkflowStepExecutionStatus toWorkflowStepExecutionStatus() {
    switch (this) {
      case 'PENDING':
        return WorkflowStepExecutionStatus.pending;
      case 'SKIPPED':
        return WorkflowStepExecutionStatus.skipped;
      case 'RUNNING':
        return WorkflowStepExecutionStatus.running;
      case 'COMPLETED':
        return WorkflowStepExecutionStatus.completed;
      case 'FAILED':
        return WorkflowStepExecutionStatus.failed;
      case 'CANCELLED':
        return WorkflowStepExecutionStatus.cancelled;
    }
    throw Exception('$this is not known in enum WorkflowStepExecutionStatus');
  }
}

/// Runtime details and status for the workflow step.
class WorkflowStepMetadata {
  /// The step action name.
  final String? action;

  /// Description of the workflow step.
  final String? description;

  /// The timestamp when the workflow step finished.
  final String? endTime;

  /// Input parameters that Image Builder provides for the workflow step.
  final String? inputs;

  /// Detailed output message that the workflow step provides at runtime.
  final String? message;

  /// The name of the workflow step.
  final String? name;

  /// The file names that the workflow step created as output for this runtime
  /// instance of the workflow.
  final String? outputs;

  /// Reports on the rollback status of the step, if applicable.
  final WorkflowStepExecutionRollbackStatus? rollbackStatus;

  /// The timestamp when the workflow step started.
  final String? startTime;

  /// Runtime status for the workflow step.
  final WorkflowStepExecutionStatus? status;

  /// A unique identifier for the workflow step, assigned at runtime.
  final String? stepExecutionId;

  WorkflowStepMetadata({
    this.action,
    this.description,
    this.endTime,
    this.inputs,
    this.message,
    this.name,
    this.outputs,
    this.rollbackStatus,
    this.startTime,
    this.status,
    this.stepExecutionId,
  });

  factory WorkflowStepMetadata.fromJson(Map<String, dynamic> json) {
    return WorkflowStepMetadata(
      action: json['action'] as String?,
      description: json['description'] as String?,
      endTime: json['endTime'] as String?,
      inputs: json['inputs'] as String?,
      message: json['message'] as String?,
      name: json['name'] as String?,
      outputs: json['outputs'] as String?,
      rollbackStatus: (json['rollbackStatus'] as String?)
          ?.toWorkflowStepExecutionRollbackStatus(),
      startTime: json['startTime'] as String?,
      status: (json['status'] as String?)?.toWorkflowStepExecutionStatus(),
      stepExecutionId: json['stepExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final description = this.description;
    final endTime = this.endTime;
    final inputs = this.inputs;
    final message = this.message;
    final name = this.name;
    final outputs = this.outputs;
    final rollbackStatus = this.rollbackStatus;
    final startTime = this.startTime;
    final status = this.status;
    final stepExecutionId = this.stepExecutionId;
    return {
      if (action != null) 'action': action,
      if (description != null) 'description': description,
      if (endTime != null) 'endTime': endTime,
      if (inputs != null) 'inputs': inputs,
      if (message != null) 'message': message,
      if (name != null) 'name': name,
      if (outputs != null) 'outputs': outputs,
      if (rollbackStatus != null) 'rollbackStatus': rollbackStatus.toValue(),
      if (startTime != null) 'startTime': startTime,
      if (status != null) 'status': status.toValue(),
      if (stepExecutionId != null) 'stepExecutionId': stepExecutionId,
    };
  }
}

/// Contains metadata about the workflow resource.
class WorkflowSummary {
  /// The Amazon Resource Name (ARN) of the workflow resource.
  final String? arn;

  /// The change description for the current version of the workflow resource.
  final String? changeDescription;

  /// The original creation date of the workflow resource.
  final String? dateCreated;

  /// Describes the workflow.
  final String? description;

  /// The name of the workflow.
  final String? name;

  /// The owner of the workflow resource.
  final String? owner;

  /// Describes the current state of the workflow resource.
  final WorkflowState? state;

  /// Contains a list of tags that are defined for the workflow.
  final Map<String, String>? tags;

  /// The image creation stage that this workflow applies to. Image Builder
  /// currently supports build and test stage workflows.
  final WorkflowType? type;

  /// The version of the workflow.
  final String? version;

  WorkflowSummary({
    this.arn,
    this.changeDescription,
    this.dateCreated,
    this.description,
    this.name,
    this.owner,
    this.state,
    this.tags,
    this.type,
    this.version,
  });

  factory WorkflowSummary.fromJson(Map<String, dynamic> json) {
    return WorkflowSummary(
      arn: json['arn'] as String?,
      changeDescription: json['changeDescription'] as String?,
      dateCreated: json['dateCreated'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      state: json['state'] != null
          ? WorkflowState.fromJson(json['state'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toWorkflowType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final changeDescription = this.changeDescription;
    final dateCreated = this.dateCreated;
    final description = this.description;
    final name = this.name;
    final owner = this.owner;
    final state = this.state;
    final tags = this.tags;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (changeDescription != null) 'changeDescription': changeDescription,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (state != null) 'state': state,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum WorkflowType {
  build,
  test,
  distribution,
}

extension WorkflowTypeValueExtension on WorkflowType {
  String toValue() {
    switch (this) {
      case WorkflowType.build:
        return 'BUILD';
      case WorkflowType.test:
        return 'TEST';
      case WorkflowType.distribution:
        return 'DISTRIBUTION';
    }
  }
}

extension WorkflowTypeFromString on String {
  WorkflowType toWorkflowType() {
    switch (this) {
      case 'BUILD':
        return WorkflowType.build;
      case 'TEST':
        return WorkflowType.test;
      case 'DISTRIBUTION':
        return WorkflowType.distribution;
    }
    throw Exception('$this is not known in enum WorkflowType');
  }
}

/// Contains details about this version of the workflow.
class WorkflowVersion {
  /// The Amazon Resource Name (ARN) of the workflow resource.
  final String? arn;

  /// The timestamp when Image Builder created the workflow version.
  final String? dateCreated;

  /// Describes the workflow.
  final String? description;

  /// The name of the workflow.
  final String? name;

  /// The owner of the workflow resource.
  final String? owner;

  /// The image creation stage that this workflow applies to. Image Builder
  /// currently supports build and test stage workflows.
  final WorkflowType? type;

  /// The semantic version of the workflow resource. The format includes three
  /// nodes: &lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;.
  final String? version;

  WorkflowVersion({
    this.arn,
    this.dateCreated,
    this.description,
    this.name,
    this.owner,
    this.type,
    this.version,
  });

  factory WorkflowVersion.fromJson(Map<String, dynamic> json) {
    return WorkflowVersion(
      arn: json['arn'] as String?,
      dateCreated: json['dateCreated'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      type: (json['type'] as String?)?.toWorkflowType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dateCreated = this.dateCreated;
    final description = this.description;
    final name = this.name;
    final owner = this.owner;
    final type = this.type;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (dateCreated != null) 'dateCreated': dateCreated,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (owner != null) 'owner': owner,
      if (type != null) 'type': type.toValue(),
      if (version != null) 'version': version,
    };
  }
}

class CallRateLimitExceededException extends _s.GenericAwsException {
  CallRateLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'CallRateLimitExceededException',
            message: message);
}

class ClientException extends _s.GenericAwsException {
  ClientException({String? type, String? message})
      : super(type: type, code: 'ClientException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidVersionNumberException extends _s.GenericAwsException {
  InvalidVersionNumberException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidVersionNumberException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceDependencyException extends _s.GenericAwsException {
  ResourceDependencyException({String? type, String? message})
      : super(
            type: type, code: 'ResourceDependencyException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String? type, String? message})
      : super(type: type, code: 'ServiceException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'CallRateLimitExceededException': (type, message) =>
      CallRateLimitExceededException(type: type, message: message),
  'ClientException': (type, message) =>
      ClientException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'InvalidPaginationTokenException': (type, message) =>
      InvalidPaginationTokenException(type: type, message: message),
  'InvalidParameterCombinationException': (type, message) =>
      InvalidParameterCombinationException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'InvalidVersionNumberException': (type, message) =>
      InvalidVersionNumberException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceDependencyException': (type, message) =>
      ResourceDependencyException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceException': (type, message) =>
      ServiceException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
};
