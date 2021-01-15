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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2019-12-02.g.dart';

/// EC2 Image Builder is a fully managed AWS service that makes it easier to
/// automate the creation, management, and deployment of customized, secure, and
/// up-to-date "golden" server images that are pre-installed and pre-configured
/// with software and settings to meet specific IT standards.
class Imagebuilder {
  final _s.RestJsonProtocol _protocol;
  Imagebuilder({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'imagebuilder',
            signingName: 'imagebuilder',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// Parameter [clientToken] :
  /// The idempotency token used to make this request idempotent.
  ///
  /// Parameter [imageBuildVersionArn] :
  /// The Amazon Resource Name (ARN) of the image whose creation you want to
  /// cancel.
  Future<CancelImageCreationResponse> cancelImageCreation({
    @_s.required String clientToken,
    @_s.required String imageBuildVersionArn,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(imageBuildVersionArn, 'imageBuildVersionArn');
    _s.validateStringPattern(
      'imageBuildVersionArn',
      imageBuildVersionArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image/[a-z0-9-_]+/\d+\.\d+\.\d+/\d+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'imageBuildVersionArn': imageBuildVersionArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/CancelImageCreation',
      exceptionFnMap: _exceptionFns,
    );
    return CancelImageCreationResponse.fromJson(response);
  }

  /// Creates a new component that can be used to build, validate, test, and
  /// assess your image.
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
  /// Parameter [clientToken] :
  /// The idempotency token of the component.
  ///
  /// Parameter [name] :
  /// The name of the component.
  ///
  /// Parameter [platform] :
  /// The platform of the component.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the component. This version follows the semantic
  /// version syntax. For example, major.minor.patch. This could be versioned
  /// like software (2.0.1) or like a date (2019.12.01).
  ///
  /// Parameter [changeDescription] :
  /// The change description of the component. Describes what change has been
  /// made in this version, or what makes this version different from other
  /// versions of this component.
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
  /// Parameter [supportedOsVersions] :
  /// The operating system (OS) version supported by the component. If the OS
  /// information is available, a prefix match is performed against the parent
  /// image OS version during image recipe creation.
  ///
  /// Parameter [tags] :
  /// The tags of the component.
  ///
  /// Parameter [uri] :
  /// The uri of the component. Must be an S3 URL and the requester must have
  /// permission to access the S3 bucket. If you use S3, you can specify
  /// component content up to your service quota. Either <code>data</code> or
  /// <code>uri</code> can be used to specify the data within the component.
  Future<CreateComponentResponse> createComponent({
    @_s.required String clientToken,
    @_s.required String name,
    @_s.required Platform platform,
    @_s.required String semanticVersion,
    String changeDescription,
    String data,
    String description,
    String kmsKeyId,
    List<String> supportedOsVersions,
    Map<String, String> tags,
    String uri,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[-_A-Za-z-0-9][-_A-Za-z0-9 ]{1,126}[-_A-Za-z-0-9]$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(platform, 'platform');
    ArgumentError.checkNotNull(semanticVersion, 'semanticVersion');
    _s.validateStringPattern(
      'semanticVersion',
      semanticVersion,
      r'''^[0-9]+\.[0-9]+\.[0-9]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'changeDescription',
      changeDescription,
      1,
      1024,
    );
    _s.validateStringLength(
      'data',
      data,
      1,
      16000,
    );
    _s.validateStringPattern(
      'data',
      data,
      r'''[^\x00]+''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'name': name,
      'platform': platform?.toValue() ?? '',
      'semanticVersion': semanticVersion,
      if (changeDescription != null) 'changeDescription': changeDescription,
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
  /// Parameter [clientToken] :
  /// The client token used to make this request idempotent.
  ///
  /// Parameter [components] :
  /// Components for build and test that are included in the container recipe.
  ///
  /// Parameter [containerType] :
  /// The type of container to create.
  ///
  /// Parameter [dockerfileTemplateData] :
  /// The Dockerfile template used to build your image as an inline data blob.
  ///
  /// Parameter [name] :
  /// The name of the container recipe.
  ///
  /// Parameter [parentImage] :
  /// The source image for the container recipe.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the container recipe
  /// (&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;).
  ///
  /// Parameter [targetRepository] :
  /// The destination repository for the container image.
  ///
  /// Parameter [description] :
  /// The description of the container recipe.
  ///
  /// Parameter [dockerfileTemplateUri] :
  /// The S3 URI for the Dockerfile that will be used to build your container
  /// image.
  ///
  /// Parameter [imageOsVersionOverride] :
  /// Specifies the operating system version for the source image.
  ///
  /// Parameter [kmsKeyId] :
  /// Identifies which KMS key is used to encrypt the container image.
  ///
  /// Parameter [platformOverride] :
  /// Specifies the operating system platform when you use a custom source
  /// image.
  ///
  /// Parameter [tags] :
  /// Tags that are attached to the container recipe.
  ///
  /// Parameter [workingDirectory] :
  /// The working directory for use during build and test workflows.
  Future<CreateContainerRecipeResponse> createContainerRecipe({
    @_s.required String clientToken,
    @_s.required List<ComponentConfiguration> components,
    @_s.required ContainerType containerType,
    @_s.required String dockerfileTemplateData,
    @_s.required String name,
    @_s.required String parentImage,
    @_s.required String semanticVersion,
    @_s.required TargetContainerRepository targetRepository,
    String description,
    String dockerfileTemplateUri,
    String imageOsVersionOverride,
    String kmsKeyId,
    Platform platformOverride,
    Map<String, String> tags,
    String workingDirectory,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(components, 'components');
    ArgumentError.checkNotNull(containerType, 'containerType');
    ArgumentError.checkNotNull(
        dockerfileTemplateData, 'dockerfileTemplateData');
    _s.validateStringLength(
      'dockerfileTemplateData',
      dockerfileTemplateData,
      1,
      16000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dockerfileTemplateData',
      dockerfileTemplateData,
      r'''[^\x00]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[-_A-Za-z-0-9][-_A-Za-z0-9 ]{1,126}[-_A-Za-z-0-9]$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(parentImage, 'parentImage');
    _s.validateStringLength(
      'parentImage',
      parentImage,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(semanticVersion, 'semanticVersion');
    _s.validateStringPattern(
      'semanticVersion',
      semanticVersion,
      r'''^[0-9]+\.[0-9]+\.[0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetRepository, 'targetRepository');
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'imageOsVersionOverride',
      imageOsVersionOverride,
      1,
      1024,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      1024,
    );
    _s.validateStringLength(
      'workingDirectory',
      workingDirectory,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'components': components,
      'containerType': containerType?.toValue() ?? '',
      'dockerfileTemplateData': dockerfileTemplateData,
      'name': name,
      'parentImage': parentImage,
      'semanticVersion': semanticVersion,
      'targetRepository': targetRepository,
      if (description != null) 'description': description,
      if (dockerfileTemplateUri != null)
        'dockerfileTemplateUri': dockerfileTemplateUri,
      if (imageOsVersionOverride != null)
        'imageOsVersionOverride': imageOsVersionOverride,
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
  /// Parameter [clientToken] :
  /// The idempotency token of the distribution configuration.
  ///
  /// Parameter [distributions] :
  /// The distributions of the distribution configuration.
  ///
  /// Parameter [name] :
  /// The name of the distribution configuration.
  ///
  /// Parameter [description] :
  /// The description of the distribution configuration.
  ///
  /// Parameter [tags] :
  /// The tags of the distribution configuration.
  Future<CreateDistributionConfigurationResponse>
      createDistributionConfiguration({
    @_s.required String clientToken,
    @_s.required List<Distribution> distributions,
    @_s.required String name,
    String description,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(distributions, 'distributions');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[-_A-Za-z-0-9][-_A-Za-z0-9 ]{1,126}[-_A-Za-z-0-9]$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'distributions': distributions,
      'name': name,
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
  /// configuration.
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
  /// Parameter [clientToken] :
  /// The idempotency token used to make this request idempotent.
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// defines the environment in which your image will be built and tested.
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
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe that defines how images
  /// are configured, tested, and assessed.
  ///
  /// Parameter [imageTestsConfiguration] :
  /// The image tests configuration of the image.
  ///
  /// Parameter [tags] :
  /// The tags of the image.
  Future<CreateImageResponse> createImage({
    @_s.required String clientToken,
    @_s.required String infrastructureConfigurationArn,
    String containerRecipeArn,
    String distributionConfigurationArn,
    bool enhancedImageMetadataEnabled,
    String imageRecipeArn,
    ImageTestsConfiguration imageTestsConfiguration,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        infrastructureConfigurationArn, 'infrastructureConfigurationArn');
    _s.validateStringPattern(
      'infrastructureConfigurationArn',
      infrastructureConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):infrastructure-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'containerRecipeArn',
      containerRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):container-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
    );
    _s.validateStringPattern(
      'distributionConfigurationArn',
      distributionConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):distribution-configuration/[a-z0-9-_]+$''',
    );
    _s.validateStringPattern(
      'imageRecipeArn',
      imageRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'infrastructureConfigurationArn': infrastructureConfigurationArn,
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (enhancedImageMetadataEnabled != null)
        'enhancedImageMetadataEnabled': enhancedImageMetadataEnabled,
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (imageTestsConfiguration != null)
        'imageTestsConfiguration': imageTestsConfiguration,
      if (tags != null) 'tags': tags,
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
  /// Parameter [clientToken] :
  /// The idempotency token used to make this request idempotent.
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// will be used to build images created by this image pipeline.
  ///
  /// Parameter [name] :
  /// The name of the image pipeline.
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
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe that will be used to
  /// configure images created by this image pipeline.
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
  Future<CreateImagePipelineResponse> createImagePipeline({
    @_s.required String clientToken,
    @_s.required String infrastructureConfigurationArn,
    @_s.required String name,
    String containerRecipeArn,
    String description,
    String distributionConfigurationArn,
    bool enhancedImageMetadataEnabled,
    String imageRecipeArn,
    ImageTestsConfiguration imageTestsConfiguration,
    Schedule schedule,
    PipelineStatus status,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        infrastructureConfigurationArn, 'infrastructureConfigurationArn');
    _s.validateStringPattern(
      'infrastructureConfigurationArn',
      infrastructureConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):infrastructure-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[-_A-Za-z-0-9][-_A-Za-z0-9 ]{1,126}[-_A-Za-z-0-9]$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'containerRecipeArn',
      containerRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):container-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringPattern(
      'distributionConfigurationArn',
      distributionConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):distribution-configuration/[a-z0-9-_]+$''',
    );
    _s.validateStringPattern(
      'imageRecipeArn',
      imageRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'infrastructureConfigurationArn': infrastructureConfigurationArn,
      'name': name,
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (description != null) 'description': description,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (enhancedImageMetadataEnabled != null)
        'enhancedImageMetadataEnabled': enhancedImageMetadataEnabled,
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (imageTestsConfiguration != null)
        'imageTestsConfiguration': imageTestsConfiguration,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
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
  /// Parameter [clientToken] :
  /// The idempotency token used to make this request idempotent.
  ///
  /// Parameter [components] :
  /// The components of the image recipe.
  ///
  /// Parameter [name] :
  /// The name of the image recipe.
  ///
  /// Parameter [parentImage] :
  /// The parent image of the image recipe. The value of the string can be the
  /// ARN of the parent image or an AMI ID. The format for the ARN follows this
  /// example:
  /// <code>arn:aws:imagebuilder:us-west-2:aws:image/windows-server-2016-english-full-base-x86/xxxx.x.x</code>.
  /// You can provide the specific version that you want to use, or you can use
  /// a wildcard in all of the fields. If you enter an AMI ID for the string
  /// value, you must have access to the AMI, and the AMI must be in the same
  /// Region in which you are using Image Builder.
  ///
  /// Parameter [semanticVersion] :
  /// The semantic version of the image recipe.
  ///
  /// Parameter [blockDeviceMappings] :
  /// The block device mappings of the image recipe.
  ///
  /// Parameter [description] :
  /// The description of the image recipe.
  ///
  /// Parameter [tags] :
  /// The tags of the image recipe.
  ///
  /// Parameter [workingDirectory] :
  /// The working directory to be used during build and test workflows.
  Future<CreateImageRecipeResponse> createImageRecipe({
    @_s.required String clientToken,
    @_s.required List<ComponentConfiguration> components,
    @_s.required String name,
    @_s.required String parentImage,
    @_s.required String semanticVersion,
    List<InstanceBlockDeviceMapping> blockDeviceMappings,
    String description,
    Map<String, String> tags,
    String workingDirectory,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(components, 'components');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[-_A-Za-z-0-9][-_A-Za-z0-9 ]{1,126}[-_A-Za-z-0-9]$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(parentImage, 'parentImage');
    _s.validateStringLength(
      'parentImage',
      parentImage,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(semanticVersion, 'semanticVersion');
    _s.validateStringPattern(
      'semanticVersion',
      semanticVersion,
      r'''^[0-9]+\.[0-9]+\.[0-9]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'workingDirectory',
      workingDirectory,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'components': components,
      'name': name,
      'parentImage': parentImage,
      'semanticVersion': semanticVersion,
      if (blockDeviceMappings != null)
        'blockDeviceMappings': blockDeviceMappings,
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
  /// Parameter [clientToken] :
  /// The idempotency token used to make this request idempotent.
  ///
  /// Parameter [instanceProfileName] :
  /// The instance profile to associate with the instance used to customize your
  /// EC2 AMI.
  ///
  /// Parameter [name] :
  /// The name of the infrastructure configuration.
  ///
  /// Parameter [description] :
  /// The description of the infrastructure configuration.
  ///
  /// Parameter [instanceTypes] :
  /// The instance types of the infrastructure configuration. You can specify
  /// one or more instance types to use for this build. The service will pick
  /// one of these instance types based on availability.
  ///
  /// Parameter [keyPair] :
  /// The key pair of the infrastructure configuration. This can be used to log
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
  /// your EC2 AMI.
  ///
  /// Parameter [snsTopicArn] :
  /// The SNS topic on which to send image build events.
  ///
  /// Parameter [subnetId] :
  /// The subnet ID in which to place the instance used to customize your EC2
  /// AMI.
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
    @_s.required String clientToken,
    @_s.required String instanceProfileName,
    @_s.required String name,
    String description,
    List<String> instanceTypes,
    String keyPair,
    Logging logging,
    Map<String, String> resourceTags,
    List<String> securityGroupIds,
    String snsTopicArn,
    String subnetId,
    Map<String, String> tags,
    bool terminateInstanceOnFailure,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceProfileName, 'instanceProfileName');
    _s.validateStringLength(
      'instanceProfileName',
      instanceProfileName,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[-_A-Za-z-0-9][-_A-Za-z0-9 ]{1,126}[-_A-Za-z-0-9]$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'keyPair',
      keyPair,
      1,
      1024,
    );
    _s.validateStringPattern(
      'snsTopicArn',
      snsTopicArn,
      r'''^arn:aws[^:]*:sns:[^:]+:\d{12}:[a-zA-Z0-9-_]{1,256}$''',
    );
    _s.validateStringLength(
      'subnetId',
      subnetId,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'instanceProfileName': instanceProfileName,
      'name': name,
      if (description != null) 'description': description,
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
    @_s.required String componentBuildVersionArn,
  }) async {
    ArgumentError.checkNotNull(
        componentBuildVersionArn, 'componentBuildVersionArn');
    _s.validateStringPattern(
      'componentBuildVersionArn',
      componentBuildVersionArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):component/[a-z0-9-_]+/\d+\.\d+\.\d+/\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (componentBuildVersionArn != null)
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
    @_s.required String containerRecipeArn,
  }) async {
    ArgumentError.checkNotNull(containerRecipeArn, 'containerRecipeArn');
    _s.validateStringPattern(
      'containerRecipeArn',
      containerRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):container-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (containerRecipeArn != null)
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
    @_s.required String distributionConfigurationArn,
  }) async {
    ArgumentError.checkNotNull(
        distributionConfigurationArn, 'distributionConfigurationArn');
    _s.validateStringPattern(
      'distributionConfigurationArn',
      distributionConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):distribution-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (distributionConfigurationArn != null)
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

  /// Deletes an image.
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
  /// The Amazon Resource Name (ARN) of the image to delete.
  Future<DeleteImageResponse> deleteImage({
    @_s.required String imageBuildVersionArn,
  }) async {
    ArgumentError.checkNotNull(imageBuildVersionArn, 'imageBuildVersionArn');
    _s.validateStringPattern(
      'imageBuildVersionArn',
      imageBuildVersionArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image/[a-z0-9-_]+/\d+\.\d+\.\d+/\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (imageBuildVersionArn != null)
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
    @_s.required String imagePipelineArn,
  }) async {
    ArgumentError.checkNotNull(imagePipelineArn, 'imagePipelineArn');
    _s.validateStringPattern(
      'imagePipelineArn',
      imagePipelineArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-pipeline/[a-z0-9-_]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (imagePipelineArn != null) 'imagePipelineArn': [imagePipelineArn],
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
    @_s.required String imageRecipeArn,
  }) async {
    ArgumentError.checkNotNull(imageRecipeArn, 'imageRecipeArn');
    _s.validateStringPattern(
      'imageRecipeArn',
      imageRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (imageRecipeArn != null) 'imageRecipeArn': [imageRecipeArn],
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
    @_s.required String infrastructureConfigurationArn,
  }) async {
    ArgumentError.checkNotNull(
        infrastructureConfigurationArn, 'infrastructureConfigurationArn');
    _s.validateStringPattern(
      'infrastructureConfigurationArn',
      infrastructureConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):infrastructure-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (infrastructureConfigurationArn != null)
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
  /// The Amazon Resource Name (ARN) of the component that you want to retrieve.
  /// Regex requires "/\d+$" suffix.
  Future<GetComponentResponse> getComponent({
    @_s.required String componentBuildVersionArn,
  }) async {
    ArgumentError.checkNotNull(
        componentBuildVersionArn, 'componentBuildVersionArn');
    _s.validateStringPattern(
      'componentBuildVersionArn',
      componentBuildVersionArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):component/[a-z0-9-_]+/(?:(?:(\d+|x)\.(\d+|x)\.(\d+|x))|(?:\d+\.\d+\.\d+/\d+))$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (componentBuildVersionArn != null)
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
    @_s.required String componentArn,
  }) async {
    ArgumentError.checkNotNull(componentArn, 'componentArn');
    _s.validateStringPattern(
      'componentArn',
      componentArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):component/[a-z0-9-_]+/\d+\.\d+\.\d+/\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (componentArn != null) 'componentArn': [componentArn],
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
    @_s.required String containerRecipeArn,
  }) async {
    ArgumentError.checkNotNull(containerRecipeArn, 'containerRecipeArn');
    _s.validateStringPattern(
      'containerRecipeArn',
      containerRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):container-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (containerRecipeArn != null)
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
    @_s.required String containerRecipeArn,
  }) async {
    ArgumentError.checkNotNull(containerRecipeArn, 'containerRecipeArn');
    _s.validateStringPattern(
      'containerRecipeArn',
      containerRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):container-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (containerRecipeArn != null)
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
    @_s.required String distributionConfigurationArn,
  }) async {
    ArgumentError.checkNotNull(
        distributionConfigurationArn, 'distributionConfigurationArn');
    _s.validateStringPattern(
      'distributionConfigurationArn',
      distributionConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):distribution-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (distributionConfigurationArn != null)
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
  /// The Amazon Resource Name (ARN) of the image that you want to retrieve.
  Future<GetImageResponse> getImage({
    @_s.required String imageBuildVersionArn,
  }) async {
    ArgumentError.checkNotNull(imageBuildVersionArn, 'imageBuildVersionArn');
    _s.validateStringPattern(
      'imageBuildVersionArn',
      imageBuildVersionArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image/[a-z0-9-_]+/(?:(?:(\d+|x)\.(\d+|x)\.(\d+|x))|(?:\d+\.\d+\.\d+/\d+))$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (imageBuildVersionArn != null)
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
    @_s.required String imagePipelineArn,
  }) async {
    ArgumentError.checkNotNull(imagePipelineArn, 'imagePipelineArn');
    _s.validateStringPattern(
      'imagePipelineArn',
      imagePipelineArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-pipeline/[a-z0-9-_]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (imagePipelineArn != null) 'imagePipelineArn': [imagePipelineArn],
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
    @_s.required String imageArn,
  }) async {
    ArgumentError.checkNotNull(imageArn, 'imageArn');
    _s.validateStringPattern(
      'imageArn',
      imageArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image/[a-z0-9-_]+/\d+\.\d+\.\d+/\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (imageArn != null) 'imageArn': [imageArn],
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
    @_s.required String imageRecipeArn,
  }) async {
    ArgumentError.checkNotNull(imageRecipeArn, 'imageRecipeArn');
    _s.validateStringPattern(
      'imageRecipeArn',
      imageRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (imageRecipeArn != null) 'imageRecipeArn': [imageRecipeArn],
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
    @_s.required String imageRecipeArn,
  }) async {
    ArgumentError.checkNotNull(imageRecipeArn, 'imageRecipeArn');
    _s.validateStringPattern(
      'imageRecipeArn',
      imageRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (imageRecipeArn != null) 'imageRecipeArn': [imageRecipeArn],
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
    @_s.required String infrastructureConfigurationArn,
  }) async {
    ArgumentError.checkNotNull(
        infrastructureConfigurationArn, 'infrastructureConfigurationArn');
    _s.validateStringPattern(
      'infrastructureConfigurationArn',
      infrastructureConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):infrastructure-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (infrastructureConfigurationArn != null)
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
  /// Parameter [clientToken] :
  /// The idempotency token of the component.
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
  /// version syntax. For example, major.minor.patch. This could be versioned
  /// like software (2.0.1) or like a date (2019.12.01).
  ///
  /// Parameter [type] :
  /// The type of the component denotes whether the component is used to build
  /// the image or only to test it.
  ///
  /// Parameter [changeDescription] :
  /// The change description of the component. Describes what change has been
  /// made in this version, or what makes this version different from other
  /// versions of this component.
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
  /// The uri of the component. Must be an S3 URL and the requester must have
  /// permission to access the S3 bucket. If you use S3, you can specify
  /// component content up to your service quota. Either <code>data</code> or
  /// <code>uri</code> can be used to specify the data within the component.
  Future<ImportComponentResponse> importComponent({
    @_s.required String clientToken,
    @_s.required ComponentFormat format,
    @_s.required String name,
    @_s.required Platform platform,
    @_s.required String semanticVersion,
    @_s.required ComponentType type,
    String changeDescription,
    String data,
    String description,
    String kmsKeyId,
    Map<String, String> tags,
    String uri,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(format, 'format');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''^[-_A-Za-z-0-9][-_A-Za-z0-9 ]{1,126}[-_A-Za-z-0-9]$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(platform, 'platform');
    ArgumentError.checkNotNull(semanticVersion, 'semanticVersion');
    _s.validateStringPattern(
      'semanticVersion',
      semanticVersion,
      r'''^[0-9]+\.[0-9]+\.[0-9]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'changeDescription',
      changeDescription,
      1,
      1024,
    );
    _s.validateStringLength(
      'data',
      data,
      1,
      1024,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'kmsKeyId',
      kmsKeyId,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'format': format?.toValue() ?? '',
      'name': name,
      'platform': platform?.toValue() ?? '',
      'semanticVersion': semanticVersion,
      'type': type?.toValue() ?? '',
      if (changeDescription != null) 'changeDescription': changeDescription,
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

  /// Returns the list of component build versions for the specified semantic
  /// version.
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
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  Future<ListComponentBuildVersionsResponse> listComponentBuildVersions({
    @_s.required String componentVersionArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(componentVersionArn, 'componentVersionArn');
    _s.validateStringPattern(
      'componentVersionArn',
      componentVersionArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):component/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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

  /// Returns the list of component build versions for the specified semantic
  /// version.
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
  /// Returns the list of component build versions for the specified semantic
  /// version.
  ///
  /// Parameter [filters] :
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  ///
  /// Parameter [owner] :
  /// The owner defines which components you want to list. By default, this
  /// request will only show components owned by your account. You can use this
  /// field to specify if you want to view components owned by yourself, by
  /// Amazon, or those components that have been shared with you by other
  /// customers.
  Future<ListComponentsResponse> listComponents({
    bool byName,
    List<Filter> filters,
    int maxResults,
    String nextToken,
    Ownership owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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
  /// Request filters that are used to narrow the list of container images that
  /// are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the list.
  ///
  /// Parameter [nextToken] :
  /// Provides a token for pagination, which determines where to begin the next
  /// set of results when the current set reaches the maximum for one request.
  ///
  /// Parameter [owner] :
  /// Returns container recipes belonging to the specified owner, that have been
  /// shared with you. You can omit this field to return container recipes
  /// belonging to your account.
  Future<ListContainerRecipesResponse> listContainerRecipes({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    Ownership owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      1024,
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
  /// The filters.
  ///
  /// <ul>
  /// <li>
  /// <code>name</code> - The name of this distribution configuration.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  Future<ListDistributionConfigurationsResponse>
      listDistributionConfigurations({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  Future<ListImageBuildVersionsResponse> listImageBuildVersions({
    @_s.required String imageVersionArn,
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(imageVersionArn, 'imageVersionArn');
    _s.validateStringPattern(
      'imageVersionArn',
      imageVersionArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  Future<ListImagePipelineImagesResponse> listImagePipelineImages({
    @_s.required String imagePipelineArn,
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(imagePipelineArn, 'imagePipelineArn');
    _s.validateStringPattern(
      'imagePipelineArn',
      imagePipelineArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-pipeline/[a-z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  Future<ListImagePipelinesResponse> listImagePipelines({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  ///
  /// Parameter [owner] :
  /// The owner defines which image recipes you want to list. By default, this
  /// request will only show image recipes owned by your account. You can use
  /// this field to specify if you want to view image recipes owned by yourself,
  /// by Amazon, or those image recipes that have been shared with you by other
  /// customers.
  Future<ListImageRecipesResponse> listImageRecipes({
    List<Filter> filters,
    int maxResults,
    String nextToken,
    Ownership owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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

  /// Returns the list of images that you have access to.
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
  /// The filters.
  ///
  /// Parameter [includeDeprecated] :
  /// Includes deprecated images in the response list.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  ///
  /// Parameter [owner] :
  /// The owner defines which images you want to list. By default, this request
  /// will only show images owned by your account. You can use this field to
  /// specify if you want to view images owned by yourself, by Amazon, or those
  /// images that have been shared with you by other customers.
  Future<ListImagesResponse> listImages({
    bool byName,
    List<Filter> filters,
    bool includeDeprecated,
    int maxResults,
    String nextToken,
    Ownership owner,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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
  /// The filters.
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the NextToken from a
  /// previously truncated response.
  Future<ListInfrastructureConfigurationsResponse>
      listInfrastructureConfigurations({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      65535,
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):(?:image-recipe|container-recipe|infrastructure-configuration|distribution-configuration|component|image|image-pipeline)/[a-z0-9-_]+(?:/(?:(?:x|\d+)\.(?:x|\d+)\.(?:x|\d+))(?:/\d+)?)?$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
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
    @_s.required String componentArn,
    @_s.required String policy,
  }) async {
    ArgumentError.checkNotNull(componentArn, 'componentArn');
    _s.validateStringPattern(
      'componentArn',
      componentArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):component/[a-z0-9-_]+/\d+\.\d+\.\d+/\d+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      30000,
      isRequired: true,
    );
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
  /// (https://docs.aws.amazon.com/ram/latest/APIReference/API_CreateResourceShare.html)
  /// to share resources. If you call the Image Builder API
  /// <code>PutContainerImagePolicy</code>, you must also call the RAM API
  /// PromoteResourceShareCreatedFromPolicy
  /// (https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html)
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
    @_s.required String containerRecipeArn,
    @_s.required String policy,
  }) async {
    ArgumentError.checkNotNull(containerRecipeArn, 'containerRecipeArn');
    _s.validateStringPattern(
      'containerRecipeArn',
      containerRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):container-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      30000,
      isRequired: true,
    );
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
    @_s.required String imageArn,
    @_s.required String policy,
  }) async {
    ArgumentError.checkNotNull(imageArn, 'imageArn');
    _s.validateStringPattern(
      'imageArn',
      imageArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image/[a-z0-9-_]+/\d+\.\d+\.\d+/\d+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      30000,
      isRequired: true,
    );
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
    @_s.required String imageRecipeArn,
    @_s.required String policy,
  }) async {
    ArgumentError.checkNotNull(imageRecipeArn, 'imageRecipeArn');
    _s.validateStringPattern(
      'imageRecipeArn',
      imageRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(policy, 'policy');
    _s.validateStringLength(
      'policy',
      policy,
      1,
      30000,
      isRequired: true,
    );
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
  /// Parameter [clientToken] :
  /// The idempotency token used to make this request idempotent.
  ///
  /// Parameter [imagePipelineArn] :
  /// The Amazon Resource Name (ARN) of the image pipeline that you want to
  /// manually invoke.
  Future<StartImagePipelineExecutionResponse> startImagePipelineExecution({
    @_s.required String clientToken,
    @_s.required String imagePipelineArn,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(imagePipelineArn, 'imagePipelineArn');
    _s.validateStringPattern(
      'imagePipelineArn',
      imagePipelineArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-pipeline/[a-z0-9-_]+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'imagePipelineArn': imagePipelineArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/StartImagePipelineExecution',
      exceptionFnMap: _exceptionFns,
    );
    return StartImagePipelineExecutionResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):(?:image-recipe|container-recipe|infrastructure-configuration|distribution-configuration|component|image|image-pipeline)/[a-z0-9-_]+(?:/(?:(?:x|\d+)\.(?:x|\d+)\.(?:x|\d+))(?:/\d+)?)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):(?:image-recipe|container-recipe|infrastructure-configuration|distribution-configuration|component|image|image-pipeline)/[a-z0-9-_]+(?:/(?:(?:x|\d+)\.(?:x|\d+)\.(?:x|\d+))(?:/\d+)?)?$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    return UntagResourceResponse.fromJson(response);
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
  /// Parameter [clientToken] :
  /// The idempotency token of the distribution configuration.
  ///
  /// Parameter [distributionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the distribution configuration that you
  /// want to update.
  ///
  /// Parameter [distributions] :
  /// The distributions of the distribution configuration.
  ///
  /// Parameter [description] :
  /// The description of the distribution configuration.
  Future<UpdateDistributionConfigurationResponse>
      updateDistributionConfiguration({
    @_s.required String clientToken,
    @_s.required String distributionConfigurationArn,
    @_s.required List<Distribution> distributions,
    String description,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        distributionConfigurationArn, 'distributionConfigurationArn');
    _s.validateStringPattern(
      'distributionConfigurationArn',
      distributionConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):distribution-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(distributions, 'distributions');
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'distributionConfigurationArn': distributionConfigurationArn,
      'distributions': distributions,
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

  /// Updates a new image pipeline. Image pipelines enable you to automate the
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
  ///
  /// Parameter [clientToken] :
  /// The idempotency token used to make this request idempotent.
  ///
  /// Parameter [imagePipelineArn] :
  /// The Amazon Resource Name (ARN) of the image pipeline that you want to
  /// update.
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// will be used to build images updated by this image pipeline.
  ///
  /// Parameter [containerRecipeArn] :
  /// The Amazon Resource Name (ARN) of the container pipeline to update.
  ///
  /// Parameter [description] :
  /// The description of the image pipeline.
  ///
  /// Parameter [distributionConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the distribution configuration that will
  /// be used to configure and distribute images updated by this image pipeline.
  ///
  /// Parameter [enhancedImageMetadataEnabled] :
  /// Collects additional information about the image being created, including
  /// the operating system (OS) version and package list. This information is
  /// used to enhance the overall experience of using EC2 Image Builder. Enabled
  /// by default.
  ///
  /// Parameter [imageRecipeArn] :
  /// The Amazon Resource Name (ARN) of the image recipe that will be used to
  /// configure images updated by this image pipeline.
  ///
  /// Parameter [imageTestsConfiguration] :
  /// The image test configuration of the image pipeline.
  ///
  /// Parameter [schedule] :
  /// The schedule of the image pipeline.
  ///
  /// Parameter [status] :
  /// The status of the image pipeline.
  Future<UpdateImagePipelineResponse> updateImagePipeline({
    @_s.required String clientToken,
    @_s.required String imagePipelineArn,
    @_s.required String infrastructureConfigurationArn,
    String containerRecipeArn,
    String description,
    String distributionConfigurationArn,
    bool enhancedImageMetadataEnabled,
    String imageRecipeArn,
    ImageTestsConfiguration imageTestsConfiguration,
    Schedule schedule,
    PipelineStatus status,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(imagePipelineArn, 'imagePipelineArn');
    _s.validateStringPattern(
      'imagePipelineArn',
      imagePipelineArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-pipeline/[a-z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        infrastructureConfigurationArn, 'infrastructureConfigurationArn');
    _s.validateStringPattern(
      'infrastructureConfigurationArn',
      infrastructureConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):infrastructure-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'containerRecipeArn',
      containerRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):container-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringPattern(
      'distributionConfigurationArn',
      distributionConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):distribution-configuration/[a-z0-9-_]+$''',
    );
    _s.validateStringPattern(
      'imageRecipeArn',
      imageRecipeArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):image-recipe/[a-z0-9-_]+/\d+\.\d+\.\d+$''',
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'imagePipelineArn': imagePipelineArn,
      'infrastructureConfigurationArn': infrastructureConfigurationArn,
      if (containerRecipeArn != null) 'containerRecipeArn': containerRecipeArn,
      if (description != null) 'description': description,
      if (distributionConfigurationArn != null)
        'distributionConfigurationArn': distributionConfigurationArn,
      if (enhancedImageMetadataEnabled != null)
        'enhancedImageMetadataEnabled': enhancedImageMetadataEnabled,
      if (imageRecipeArn != null) 'imageRecipeArn': imageRecipeArn,
      if (imageTestsConfiguration != null)
        'imageTestsConfiguration': imageTestsConfiguration,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
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
  /// Parameter [clientToken] :
  /// The idempotency token used to make this request idempotent.
  ///
  /// Parameter [infrastructureConfigurationArn] :
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that
  /// you want to update.
  ///
  /// Parameter [instanceProfileName] :
  /// The instance profile to associate with the instance used to customize your
  /// EC2 AMI.
  ///
  /// Parameter [description] :
  /// The description of the infrastructure configuration.
  ///
  /// Parameter [instanceTypes] :
  /// The instance types of the infrastructure configuration. You can specify
  /// one or more instance types to use for this build. The service will pick
  /// one of these instance types based on availability.
  ///
  /// Parameter [keyPair] :
  /// The key pair of the infrastructure configuration. This can be used to log
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
  /// your EC2 AMI.
  ///
  /// Parameter [snsTopicArn] :
  /// The SNS topic on which to send image build events.
  ///
  /// Parameter [subnetId] :
  /// The subnet ID to place the instance used to customize your EC2 AMI in.
  ///
  /// Parameter [terminateInstanceOnFailure] :
  /// The terminate instance on failure setting of the infrastructure
  /// configuration. Set to false if you want Image Builder to retain the
  /// instance used to configure your AMI if the build or test phase of your
  /// workflow fails.
  Future<UpdateInfrastructureConfigurationResponse>
      updateInfrastructureConfiguration({
    @_s.required String clientToken,
    @_s.required String infrastructureConfigurationArn,
    @_s.required String instanceProfileName,
    String description,
    List<String> instanceTypes,
    String keyPair,
    Logging logging,
    Map<String, String> resourceTags,
    List<String> securityGroupIds,
    String snsTopicArn,
    String subnetId,
    bool terminateInstanceOnFailure,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        infrastructureConfigurationArn, 'infrastructureConfigurationArn');
    _s.validateStringPattern(
      'infrastructureConfigurationArn',
      infrastructureConfigurationArn,
      r'''^arn:aws[^:]*:imagebuilder:[^:]+:(?:\d{12}|aws):infrastructure-configuration/[a-z0-9-_]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(instanceProfileName, 'instanceProfileName');
    _s.validateStringLength(
      'instanceProfileName',
      instanceProfileName,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1024,
    );
    _s.validateStringLength(
      'keyPair',
      keyPair,
      1,
      1024,
    );
    _s.validateStringPattern(
      'snsTopicArn',
      snsTopicArn,
      r'''^arn:aws[^:]*:sns:[^:]+:\d{12}:[a-zA-Z0-9-_]{1,256}$''',
    );
    _s.validateStringLength(
      'subnetId',
      subnetId,
      1,
      1024,
    );
    final $payload = <String, dynamic>{
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      'infrastructureConfigurationArn': infrastructureConfigurationArn,
      'instanceProfileName': instanceProfileName,
      if (description != null) 'description': description,
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
}

/// Details of an EC2 AMI.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Ami {
  /// The account ID of the owner of the AMI.
  @_s.JsonKey(name: 'accountId')
  final String accountId;

  /// The description of the EC2 AMI. Minimum and maximum length are in
  /// characters.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The AMI ID of the EC2 AMI.
  @_s.JsonKey(name: 'image')
  final String image;

  /// The name of the EC2 AMI.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The AWS Region of the EC2 AMI.
  @_s.JsonKey(name: 'region')
  final String region;
  @_s.JsonKey(name: 'state')
  final ImageState state;

  Ami({
    this.accountId,
    this.description,
    this.image,
    this.name,
    this.region,
    this.state,
  });
  factory Ami.fromJson(Map<String, dynamic> json) => _$AmiFromJson(json);
}

/// Define and configure the output AMIs of the pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AmiDistributionConfiguration {
  /// The tags to apply to AMIs distributed to this Region.
  @_s.JsonKey(name: 'amiTags')
  final Map<String, String> amiTags;

  /// The description of the distribution configuration. Minimum and maximum
  /// length are in characters.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The KMS key identifier used to encrypt the distributed image.
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  /// Launch permissions can be used to configure which AWS accounts can use the
  /// AMI to launch instances.
  @_s.JsonKey(name: 'launchPermission')
  final LaunchPermissionConfiguration launchPermission;

  /// The name of the distribution configuration.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ID of an account to which you want to distribute an image.
  @_s.JsonKey(name: 'targetAccountIds')
  final List<String> targetAccountIds;

  AmiDistributionConfiguration({
    this.amiTags,
    this.description,
    this.kmsKeyId,
    this.launchPermission,
    this.name,
    this.targetAccountIds,
  });
  factory AmiDistributionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AmiDistributionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AmiDistributionConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelImageCreationResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the image whose creation has been
  /// cancelled.
  @_s.JsonKey(name: 'imageBuildVersionArn')
  final String imageBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  CancelImageCreationResponse({
    this.clientToken,
    this.imageBuildVersionArn,
    this.requestId,
  });
  factory CancelImageCreationResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelImageCreationResponseFromJson(json);
}

/// A detailed view of a component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Component {
  /// The Amazon Resource Name (ARN) of the component.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The change description of the component.
  @_s.JsonKey(name: 'changeDescription')
  final String changeDescription;

  /// The data of the component.
  @_s.JsonKey(name: 'data')
  final String data;

  /// The date that the component was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The description of the component.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The encryption status of the component.
  @_s.JsonKey(name: 'encrypted')
  final bool encrypted;

  /// The KMS key identifier used to encrypt the component.
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  /// The name of the component.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The owner of the component.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The platform of the component.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The operating system (OS) version supported by the component. If the OS
  /// information is available, a prefix match is performed against the parent
  /// image OS version during image recipe creation.
  @_s.JsonKey(name: 'supportedOsVersions')
  final List<String> supportedOsVersions;

  /// The tags associated with the component.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The type of the component denotes whether the component is used to build the
  /// image or only to test it.
  @_s.JsonKey(name: 'type')
  final ComponentType type;

  /// The version of the component.
  @_s.JsonKey(name: 'version')
  final String version;

  Component({
    this.arn,
    this.changeDescription,
    this.data,
    this.dateCreated,
    this.description,
    this.encrypted,
    this.kmsKeyId,
    this.name,
    this.owner,
    this.platform,
    this.supportedOsVersions,
    this.tags,
    this.type,
    this.version,
  });
  factory Component.fromJson(Map<String, dynamic> json) =>
      _$ComponentFromJson(json);
}

/// Configuration details of the component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ComponentConfiguration {
  /// The Amazon Resource Name (ARN) of the component.
  @_s.JsonKey(name: 'componentArn')
  final String componentArn;

  ComponentConfiguration({
    @_s.required this.componentArn,
  });
  factory ComponentConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ComponentConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentConfigurationToJson(this);
}

enum ComponentFormat {
  @_s.JsonValue('SHELL')
  shell,
}

extension on ComponentFormat {
  String toValue() {
    switch (this) {
      case ComponentFormat.shell:
        return 'SHELL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A high-level summary of a component.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComponentSummary {
  /// The Amazon Resource Name (ARN) of the component.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The change description of the component.
  @_s.JsonKey(name: 'changeDescription')
  final String changeDescription;

  /// The date that the component was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The description of the component.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the component.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The owner of the component.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The platform of the component.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The operating system (OS) version supported by the component. If the OS
  /// information is available, a prefix match is performed against the parent
  /// image OS version during image recipe creation.
  @_s.JsonKey(name: 'supportedOsVersions')
  final List<String> supportedOsVersions;

  /// The tags associated with the component.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The type of the component denotes whether the component is used to build the
  /// image or only to test it.
  @_s.JsonKey(name: 'type')
  final ComponentType type;

  /// The version of the component.
  @_s.JsonKey(name: 'version')
  final String version;

  ComponentSummary({
    this.arn,
    this.changeDescription,
    this.dateCreated,
    this.description,
    this.name,
    this.owner,
    this.platform,
    this.supportedOsVersions,
    this.tags,
    this.type,
    this.version,
  });
  factory ComponentSummary.fromJson(Map<String, dynamic> json) =>
      _$ComponentSummaryFromJson(json);
}

enum ComponentType {
  @_s.JsonValue('BUILD')
  build,
  @_s.JsonValue('TEST')
  test,
}

extension on ComponentType {
  String toValue() {
    switch (this) {
      case ComponentType.build:
        return 'BUILD';
      case ComponentType.test:
        return 'TEST';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A high-level overview of a component semantic version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComponentVersion {
  /// The Amazon Resource Name (ARN) of the component.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date that the component was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The description of the component.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the component.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The owner of the component.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The platform of the component.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The operating system (OS) version supported by the component. If the OS
  /// information is available, a prefix match is performed against the parent
  /// image OS version during image recipe creation.
  @_s.JsonKey(name: 'supportedOsVersions')
  final List<String> supportedOsVersions;

  /// The type of the component denotes whether the component is used to build the
  /// image or only to test it.
  @_s.JsonKey(name: 'type')
  final ComponentType type;

  /// The semantic version of the component.
  @_s.JsonKey(name: 'version')
  final String version;

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
  factory ComponentVersion.fromJson(Map<String, dynamic> json) =>
      _$ComponentVersionFromJson(json);
}

/// A container encapsulates the runtime environment for an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Container {
  /// A list of URIs for containers created in the context Region.
  @_s.JsonKey(name: 'imageUris')
  final List<String> imageUris;

  /// Containers and container images are Region-specific. This is the Region
  /// context for the container.
  @_s.JsonKey(name: 'region')
  final String region;

  Container({
    this.imageUris,
    this.region,
  });
  factory Container.fromJson(Map<String, dynamic> json) =>
      _$ContainerFromJson(json);
}

/// Container distribution settings for encryption, licensing, and sharing in a
/// specific Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ContainerDistributionConfiguration {
  /// The destination repository for the container distribution configuration.
  @_s.JsonKey(name: 'targetRepository')
  final TargetContainerRepository targetRepository;

  /// Tags that are attached to the container distribution configuration.
  @_s.JsonKey(name: 'containerTags')
  final List<String> containerTags;

  /// The description of the container distribution configuration.
  @_s.JsonKey(name: 'description')
  final String description;

  ContainerDistributionConfiguration({
    @_s.required this.targetRepository,
    this.containerTags,
    this.description,
  });
  factory ContainerDistributionConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$ContainerDistributionConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ContainerDistributionConfigurationToJson(this);
}

/// A container recipe.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerRecipe {
  /// The Amazon Resource Name (ARN) of the container recipe.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Components for build and test that are included in the container recipe.
  @_s.JsonKey(name: 'components')
  final List<ComponentConfiguration> components;

  /// Specifies the type of container, such as Docker.
  @_s.JsonKey(name: 'containerType')
  final ContainerType containerType;

  /// The date when this container recipe was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The description of the container recipe.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Dockerfiles are text documents that are used to build Docker containers, and
  /// ensure that they contain all of the elements required by the application
  /// running inside. The template data consists of contextual variables where
  /// Image Builder places build information or scripts, based on your container
  /// image recipe.
  @_s.JsonKey(name: 'dockerfileTemplateData')
  final String dockerfileTemplateData;

  /// A flag that indicates if the target container is encrypted.
  @_s.JsonKey(name: 'encrypted')
  final bool encrypted;

  /// Identifies which KMS key is used to encrypt the container image for
  /// distribution to the target Region.
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  /// The name of the container recipe.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The owner of the container recipe.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The source image for the container recipe.
  @_s.JsonKey(name: 'parentImage')
  final String parentImage;

  /// The system platform for the container, such as Windows or Linux.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// Tags that are attached to the container recipe.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The destination repository for the container image.
  @_s.JsonKey(name: 'targetRepository')
  final TargetContainerRepository targetRepository;

  /// The semantic version of the container recipe
  /// (&lt;major&gt;.&lt;minor&gt;.&lt;patch&gt;).
  @_s.JsonKey(name: 'version')
  final String version;

  /// The working directory for use during build and test workflows.
  @_s.JsonKey(name: 'workingDirectory')
  final String workingDirectory;

  ContainerRecipe({
    this.arn,
    this.components,
    this.containerType,
    this.dateCreated,
    this.description,
    this.dockerfileTemplateData,
    this.encrypted,
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
  factory ContainerRecipe.fromJson(Map<String, dynamic> json) =>
      _$ContainerRecipeFromJson(json);
}

/// A summary of a container recipe
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ContainerRecipeSummary {
  /// The Amazon Resource Name (ARN) of the container recipe.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Specifies the type of container, such as "Docker".
  @_s.JsonKey(name: 'containerType')
  final ContainerType containerType;

  /// The date when this container recipe was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The name of the container recipe.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The owner of the container recipe.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The source image for the container recipe.
  @_s.JsonKey(name: 'parentImage')
  final String parentImage;

  /// The system platform for the container, such as Windows or Linux.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// Tags that are attached to the container recipe.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory ContainerRecipeSummary.fromJson(Map<String, dynamic> json) =>
      _$ContainerRecipeSummaryFromJson(json);
}

enum ContainerRepositoryService {
  @_s.JsonValue('ECR')
  ecr,
}

enum ContainerType {
  @_s.JsonValue('DOCKER')
  docker,
}

extension on ContainerType {
  String toValue() {
    switch (this) {
      case ContainerType.docker:
        return 'DOCKER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateComponentResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the component that was created by this
  /// request.
  @_s.JsonKey(name: 'componentBuildVersionArn')
  final String componentBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  CreateComponentResponse({
    this.clientToken,
    this.componentBuildVersionArn,
    this.requestId,
  });
  factory CreateComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateContainerRecipeResponse {
  /// The client token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Returns the Amazon Resource Name (ARN) of the container recipe that the
  /// request created.
  @_s.JsonKey(name: 'containerRecipeArn')
  final String containerRecipeArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  CreateContainerRecipeResponse({
    this.clientToken,
    this.containerRecipeArn,
    this.requestId,
  });
  factory CreateContainerRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateContainerRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDistributionConfigurationResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the distribution configuration that was
  /// created by this request.
  @_s.JsonKey(name: 'distributionConfigurationArn')
  final String distributionConfigurationArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  CreateDistributionConfigurationResponse({
    this.clientToken,
    this.distributionConfigurationArn,
    this.requestId,
  });
  factory CreateDistributionConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateDistributionConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateImagePipelineResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the image pipeline that was created by
  /// this request.
  @_s.JsonKey(name: 'imagePipelineArn')
  final String imagePipelineArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  CreateImagePipelineResponse({
    this.clientToken,
    this.imagePipelineArn,
    this.requestId,
  });
  factory CreateImagePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateImagePipelineResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateImageRecipeResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the image recipe that was created by this
  /// request.
  @_s.JsonKey(name: 'imageRecipeArn')
  final String imageRecipeArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  CreateImageRecipeResponse({
    this.clientToken,
    this.imageRecipeArn,
    this.requestId,
  });
  factory CreateImageRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateImageRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateImageResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the image that was created by this
  /// request.
  @_s.JsonKey(name: 'imageBuildVersionArn')
  final String imageBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  CreateImageResponse({
    this.clientToken,
    this.imageBuildVersionArn,
    this.requestId,
  });
  factory CreateImageResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateImageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateInfrastructureConfigurationResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the infrastructure configuration that was
  /// created by this request.
  @_s.JsonKey(name: 'infrastructureConfigurationArn')
  final String infrastructureConfigurationArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  CreateInfrastructureConfigurationResponse({
    this.clientToken,
    this.infrastructureConfigurationArn,
    this.requestId,
  });
  factory CreateInfrastructureConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateInfrastructureConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteComponentResponse {
  /// The Amazon Resource Name (ARN) of the component build version that was
  /// deleted.
  @_s.JsonKey(name: 'componentBuildVersionArn')
  final String componentBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  DeleteComponentResponse({
    this.componentBuildVersionArn,
    this.requestId,
  });
  factory DeleteComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteContainerRecipeResponse {
  /// The Amazon Resource Name (ARN) of the container recipe that was deleted.
  @_s.JsonKey(name: 'containerRecipeArn')
  final String containerRecipeArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  DeleteContainerRecipeResponse({
    this.containerRecipeArn,
    this.requestId,
  });
  factory DeleteContainerRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteContainerRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteDistributionConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the distribution configuration that was
  /// deleted.
  @_s.JsonKey(name: 'distributionConfigurationArn')
  final String distributionConfigurationArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  DeleteDistributionConfigurationResponse({
    this.distributionConfigurationArn,
    this.requestId,
  });
  factory DeleteDistributionConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteDistributionConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteImagePipelineResponse {
  /// The Amazon Resource Name (ARN) of the image pipeline that was deleted.
  @_s.JsonKey(name: 'imagePipelineArn')
  final String imagePipelineArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  DeleteImagePipelineResponse({
    this.imagePipelineArn,
    this.requestId,
  });
  factory DeleteImagePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteImagePipelineResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteImageRecipeResponse {
  /// The Amazon Resource Name (ARN) of the image recipe that was deleted.
  @_s.JsonKey(name: 'imageRecipeArn')
  final String imageRecipeArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  DeleteImageRecipeResponse({
    this.imageRecipeArn,
    this.requestId,
  });
  factory DeleteImageRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteImageRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteImageResponse {
  /// The Amazon Resource Name (ARN) of the image that was deleted.
  @_s.JsonKey(name: 'imageBuildVersionArn')
  final String imageBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  DeleteImageResponse({
    this.imageBuildVersionArn,
    this.requestId,
  });
  factory DeleteImageResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteImageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteInfrastructureConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the infrastructure configuration that was
  /// deleted.
  @_s.JsonKey(name: 'infrastructureConfigurationArn')
  final String infrastructureConfigurationArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  DeleteInfrastructureConfigurationResponse({
    this.infrastructureConfigurationArn,
    this.requestId,
  });
  factory DeleteInfrastructureConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteInfrastructureConfigurationResponseFromJson(json);
}

/// Defines the settings for a specific Region.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Distribution {
  /// The target Region.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The specific AMI settings (for example, launch permissions, AMI tags).
  @_s.JsonKey(name: 'amiDistributionConfiguration')
  final AmiDistributionConfiguration amiDistributionConfiguration;

  /// Container distribution settings for encryption, licensing, and sharing in a
  /// specific Region.
  @_s.JsonKey(name: 'containerDistributionConfiguration')
  final ContainerDistributionConfiguration containerDistributionConfiguration;

  /// The License Manager Configuration to associate with the AMI in the specified
  /// Region.
  @_s.JsonKey(name: 'licenseConfigurationArns')
  final List<String> licenseConfigurationArns;

  Distribution({
    @_s.required this.region,
    this.amiDistributionConfiguration,
    this.containerDistributionConfiguration,
    this.licenseConfigurationArns,
  });
  factory Distribution.fromJson(Map<String, dynamic> json) =>
      _$DistributionFromJson(json);

  Map<String, dynamic> toJson() => _$DistributionToJson(this);
}

/// A distribution configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DistributionConfiguration {
  /// The maximum duration in minutes for this distribution configuration.
  @_s.JsonKey(name: 'timeoutMinutes')
  final int timeoutMinutes;

  /// The Amazon Resource Name (ARN) of the distribution configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date on which this distribution configuration was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The date on which this distribution configuration was last updated.
  @_s.JsonKey(name: 'dateUpdated')
  final String dateUpdated;

  /// The description of the distribution configuration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The distributions of the distribution configuration.
  @_s.JsonKey(name: 'distributions')
  final List<Distribution> distributions;

  /// The name of the distribution configuration.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The tags of the distribution configuration.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DistributionConfiguration({
    @_s.required this.timeoutMinutes,
    this.arn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.distributions,
    this.name,
    this.tags,
  });
  factory DistributionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DistributionConfigurationFromJson(json);
}

/// A high-level overview of a distribution configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DistributionConfigurationSummary {
  /// The Amazon Resource Name (ARN) of the distribution configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date on which the distribution configuration was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The date on which the distribution configuration was updated.
  @_s.JsonKey(name: 'dateUpdated')
  final String dateUpdated;

  /// The description of the distribution configuration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the distribution configuration.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of Regions where the container image is distributed to.
  @_s.JsonKey(name: 'regions')
  final List<String> regions;

  /// The tags associated with the distribution configuration.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DistributionConfigurationSummary({
    this.arn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.name,
    this.regions,
    this.tags,
  });
  factory DistributionConfigurationSummary.fromJson(
          Map<String, dynamic> json) =>
      _$DistributionConfigurationSummaryFromJson(json);
}

/// Amazon EBS-specific block device mapping specifications.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EbsInstanceBlockDeviceSpecification {
  /// Use to configure delete on termination of the associated device.
  @_s.JsonKey(name: 'deleteOnTermination')
  final bool deleteOnTermination;

  /// Use to configure device encryption.
  @_s.JsonKey(name: 'encrypted')
  final bool encrypted;

  /// Use to configure device IOPS.
  @_s.JsonKey(name: 'iops')
  final int iops;

  /// Use to configure the KMS key to use when encrypting the device.
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  /// The snapshot that defines the device contents.
  @_s.JsonKey(name: 'snapshotId')
  final String snapshotId;

  /// Use to override the device's volume size.
  @_s.JsonKey(name: 'volumeSize')
  final int volumeSize;

  /// Use to override the device's volume type.
  @_s.JsonKey(name: 'volumeType')
  final EbsVolumeType volumeType;

  EbsInstanceBlockDeviceSpecification({
    this.deleteOnTermination,
    this.encrypted,
    this.iops,
    this.kmsKeyId,
    this.snapshotId,
    this.volumeSize,
    this.volumeType,
  });
  factory EbsInstanceBlockDeviceSpecification.fromJson(
          Map<String, dynamic> json) =>
      _$EbsInstanceBlockDeviceSpecificationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$EbsInstanceBlockDeviceSpecificationToJson(this);
}

enum EbsVolumeType {
  @_s.JsonValue('standard')
  standard,
  @_s.JsonValue('io1')
  io1,
  @_s.JsonValue('io2')
  io2,
  @_s.JsonValue('gp2')
  gp2,
  @_s.JsonValue('sc1')
  sc1,
  @_s.JsonValue('st1')
  st1,
}

/// A filter name and value pair that is used to return a more specific list of
/// results from a list operation. Filters can be used to match a set of
/// resources by specific criteria, such as tags, attributes, or IDs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The name of the filter. Filter names are case-sensitive.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The filter values. Filter values are case-sensitive.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComponentPolicyResponse {
  /// The component policy.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetComponentPolicyResponse({
    this.policy,
    this.requestId,
  });
  factory GetComponentPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetComponentPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetComponentResponse {
  /// The component object associated with the specified ARN.
  @_s.JsonKey(name: 'component')
  final Component component;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetComponentResponse({
    this.component,
    this.requestId,
  });
  factory GetComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$GetComponentResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContainerRecipePolicyResponse {
  /// The container recipe policy object that is returned.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetContainerRecipePolicyResponse({
    this.policy,
    this.requestId,
  });
  factory GetContainerRecipePolicyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetContainerRecipePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetContainerRecipeResponse {
  /// The container recipe object that is returned.
  @_s.JsonKey(name: 'containerRecipe')
  final ContainerRecipe containerRecipe;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetContainerRecipeResponse({
    this.containerRecipe,
    this.requestId,
  });
  factory GetContainerRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetContainerRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDistributionConfigurationResponse {
  /// The distribution configuration object.
  @_s.JsonKey(name: 'distributionConfiguration')
  final DistributionConfiguration distributionConfiguration;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetDistributionConfigurationResponse({
    this.distributionConfiguration,
    this.requestId,
  });
  factory GetDistributionConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetDistributionConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImagePipelineResponse {
  /// The image pipeline object.
  @_s.JsonKey(name: 'imagePipeline')
  final ImagePipeline imagePipeline;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetImagePipelineResponse({
    this.imagePipeline,
    this.requestId,
  });
  factory GetImagePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImagePipelineResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImagePolicyResponse {
  /// The image policy object.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetImagePolicyResponse({
    this.policy,
    this.requestId,
  });
  factory GetImagePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImagePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImageRecipePolicyResponse {
  /// The image recipe policy object.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetImageRecipePolicyResponse({
    this.policy,
    this.requestId,
  });
  factory GetImageRecipePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImageRecipePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImageRecipeResponse {
  /// The image recipe object.
  @_s.JsonKey(name: 'imageRecipe')
  final ImageRecipe imageRecipe;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetImageRecipeResponse({
    this.imageRecipe,
    this.requestId,
  });
  factory GetImageRecipeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImageRecipeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetImageResponse {
  /// The image object.
  @_s.JsonKey(name: 'image')
  final Image image;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetImageResponse({
    this.image,
    this.requestId,
  });
  factory GetImageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetImageResponseFromJson(json);
}

/// GetInfrastructureConfiguration response object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInfrastructureConfigurationResponse {
  /// The infrastructure configuration object.
  @_s.JsonKey(name: 'infrastructureConfiguration')
  final InfrastructureConfiguration infrastructureConfiguration;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  GetInfrastructureConfigurationResponse({
    this.infrastructureConfiguration,
    this.requestId,
  });
  factory GetInfrastructureConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetInfrastructureConfigurationResponseFromJson(json);
}

/// An image build version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Image {
  /// The Amazon Resource Name (ARN) of the image.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The container recipe used to create the container image type.
  @_s.JsonKey(name: 'containerRecipe')
  final ContainerRecipe containerRecipe;

  /// The date on which this image was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The distribution configuration used when creating this image.
  @_s.JsonKey(name: 'distributionConfiguration')
  final DistributionConfiguration distributionConfiguration;

  /// Collects additional information about the image being created, including the
  /// operating system (OS) version and package list. This information is used to
  /// enhance the overall experience of using EC2 Image Builder. Enabled by
  /// default.
  @_s.JsonKey(name: 'enhancedImageMetadataEnabled')
  final bool enhancedImageMetadataEnabled;

  /// The image recipe used when creating the image.
  @_s.JsonKey(name: 'imageRecipe')
  final ImageRecipe imageRecipe;

  /// The image tests configuration used when creating this image.
  @_s.JsonKey(name: 'imageTestsConfiguration')
  final ImageTestsConfiguration imageTestsConfiguration;

  /// The infrastructure used when creating this image.
  @_s.JsonKey(name: 'infrastructureConfiguration')
  final InfrastructureConfiguration infrastructureConfiguration;

  /// The name of the image.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The operating system version of the instance. For example, Amazon Linux 2,
  /// Ubuntu 18, or Microsoft Windows Server 2019.
  @_s.JsonKey(name: 'osVersion')
  final String osVersion;

  /// The output resources produced when creating this image.
  @_s.JsonKey(name: 'outputResources')
  final OutputResources outputResources;

  /// The platform of the image.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The Amazon Resource Name (ARN) of the image pipeline that created this
  /// image.
  @_s.JsonKey(name: 'sourcePipelineArn')
  final String sourcePipelineArn;

  /// The name of the image pipeline that created this image.
  @_s.JsonKey(name: 'sourcePipelineName')
  final String sourcePipelineName;

  /// The state of the image.
  @_s.JsonKey(name: 'state')
  final ImageState state;

  /// The tags of the image.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Specifies whether this is an AMI or container image.
  @_s.JsonKey(name: 'type')
  final ImageType type;

  /// The semantic version of the image.
  @_s.JsonKey(name: 'version')
  final String version;

  Image({
    this.arn,
    this.containerRecipe,
    this.dateCreated,
    this.distributionConfiguration,
    this.enhancedImageMetadataEnabled,
    this.imageRecipe,
    this.imageTestsConfiguration,
    this.infrastructureConfiguration,
    this.name,
    this.osVersion,
    this.outputResources,
    this.platform,
    this.sourcePipelineArn,
    this.sourcePipelineName,
    this.state,
    this.tags,
    this.type,
    this.version,
  });
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

/// Details of an image pipeline.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImagePipeline {
  /// The Amazon Resource Name (ARN) of the image pipeline.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The Amazon Resource Name (ARN) of the container recipe that is used for this
  /// pipeline.
  @_s.JsonKey(name: 'containerRecipeArn')
  final String containerRecipeArn;

  /// The date on which this image pipeline was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The date on which this image pipeline was last run.
  @_s.JsonKey(name: 'dateLastRun')
  final String dateLastRun;

  /// The date on which this image pipeline will next be run.
  @_s.JsonKey(name: 'dateNextRun')
  final String dateNextRun;

  /// The date on which this image pipeline was last updated.
  @_s.JsonKey(name: 'dateUpdated')
  final String dateUpdated;

  /// The description of the image pipeline.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The Amazon Resource Name (ARN) of the distribution configuration associated
  /// with this image pipeline.
  @_s.JsonKey(name: 'distributionConfigurationArn')
  final String distributionConfigurationArn;

  /// Collects additional information about the image being created, including the
  /// operating system (OS) version and package list. This information is used to
  /// enhance the overall experience of using EC2 Image Builder. Enabled by
  /// default.
  @_s.JsonKey(name: 'enhancedImageMetadataEnabled')
  final bool enhancedImageMetadataEnabled;

  /// The Amazon Resource Name (ARN) of the image recipe associated with this
  /// image pipeline.
  @_s.JsonKey(name: 'imageRecipeArn')
  final String imageRecipeArn;

  /// The image tests configuration of the image pipeline.
  @_s.JsonKey(name: 'imageTestsConfiguration')
  final ImageTestsConfiguration imageTestsConfiguration;

  /// The Amazon Resource Name (ARN) of the infrastructure configuration
  /// associated with this image pipeline.
  @_s.JsonKey(name: 'infrastructureConfigurationArn')
  final String infrastructureConfigurationArn;

  /// The name of the image pipeline.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The platform of the image pipeline.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The schedule of the image pipeline.
  @_s.JsonKey(name: 'schedule')
  final Schedule schedule;

  /// The status of the image pipeline.
  @_s.JsonKey(name: 'status')
  final PipelineStatus status;

  /// The tags of this image pipeline.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
    this.imageRecipeArn,
    this.imageTestsConfiguration,
    this.infrastructureConfigurationArn,
    this.name,
    this.platform,
    this.schedule,
    this.status,
    this.tags,
  });
  factory ImagePipeline.fromJson(Map<String, dynamic> json) =>
      _$ImagePipelineFromJson(json);
}

/// An image recipe.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageRecipe {
  /// The Amazon Resource Name (ARN) of the image recipe.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The block device mappings to apply when creating images from this recipe.
  @_s.JsonKey(name: 'blockDeviceMappings')
  final List<InstanceBlockDeviceMapping> blockDeviceMappings;

  /// The components of the image recipe.
  @_s.JsonKey(name: 'components')
  final List<ComponentConfiguration> components;

  /// The date on which this image recipe was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The description of the image recipe.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the image recipe.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The owner of the image recipe.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The parent image of the image recipe.
  @_s.JsonKey(name: 'parentImage')
  final String parentImage;

  /// The platform of the image recipe.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The tags of the image recipe.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Specifies which type of image is created by the recipe - an AMI or a
  /// container image.
  @_s.JsonKey(name: 'type')
  final ImageType type;

  /// The version of the image recipe.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The working directory to be used during build and test workflows.
  @_s.JsonKey(name: 'workingDirectory')
  final String workingDirectory;

  ImageRecipe({
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
  factory ImageRecipe.fromJson(Map<String, dynamic> json) =>
      _$ImageRecipeFromJson(json);
}

/// A summary of an image recipe.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageRecipeSummary {
  /// The Amazon Resource Name (ARN) of the image recipe.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date on which this image recipe was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The name of the image recipe.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The owner of the image recipe.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The parent image of the image recipe.
  @_s.JsonKey(name: 'parentImage')
  final String parentImage;

  /// The platform of the image recipe.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The tags of the image recipe.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ImageRecipeSummary({
    this.arn,
    this.dateCreated,
    this.name,
    this.owner,
    this.parentImage,
    this.platform,
    this.tags,
  });
  factory ImageRecipeSummary.fromJson(Map<String, dynamic> json) =>
      _$ImageRecipeSummaryFromJson(json);
}

/// Image state shows the image status and the reason for that status.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageState {
  /// The reason for the image's status.
  @_s.JsonKey(name: 'reason')
  final String reason;

  /// The status of the image.
  @_s.JsonKey(name: 'status')
  final ImageStatus status;

  ImageState({
    this.reason,
    this.status,
  });
  factory ImageState.fromJson(Map<String, dynamic> json) =>
      _$ImageStateFromJson(json);
}

enum ImageStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('BUILDING')
  building,
  @_s.JsonValue('TESTING')
  testing,
  @_s.JsonValue('DISTRIBUTING')
  distributing,
  @_s.JsonValue('INTEGRATING')
  integrating,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('CANCELLED')
  cancelled,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('DEPRECATED')
  deprecated,
  @_s.JsonValue('DELETED')
  deleted,
}

/// An image summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageSummary {
  /// The Amazon Resource Name (ARN) of the image.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date on which this image was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The name of the image.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The operating system version of the instance. For example, Amazon Linux 2,
  /// Ubuntu 18, or Microsoft Windows Server 2019.
  @_s.JsonKey(name: 'osVersion')
  final String osVersion;

  /// The output resources produced when creating this image.
  @_s.JsonKey(name: 'outputResources')
  final OutputResources outputResources;

  /// The owner of the image.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The platform of the image.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// The state of the image.
  @_s.JsonKey(name: 'state')
  final ImageState state;

  /// The tags of the image.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Specifies whether this is an AMI or container image.
  @_s.JsonKey(name: 'type')
  final ImageType type;

  /// The version of the image.
  @_s.JsonKey(name: 'version')
  final String version;

  ImageSummary({
    this.arn,
    this.dateCreated,
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
  factory ImageSummary.fromJson(Map<String, dynamic> json) =>
      _$ImageSummaryFromJson(json);
}

/// Image tests configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImageTestsConfiguration {
  /// Defines if tests should be executed when building this image.
  @_s.JsonKey(name: 'imageTestsEnabled')
  final bool imageTestsEnabled;

  /// The maximum time in minutes that tests are permitted to run.
  @_s.JsonKey(name: 'timeoutMinutes')
  final int timeoutMinutes;

  ImageTestsConfiguration({
    this.imageTestsEnabled,
    this.timeoutMinutes,
  });
  factory ImageTestsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ImageTestsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ImageTestsConfigurationToJson(this);
}

enum ImageType {
  @_s.JsonValue('AMI')
  ami,
  @_s.JsonValue('DOCKER')
  docker,
}

/// An image semantic version.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageVersion {
  /// The Amazon Resource Name (ARN) of the image semantic version.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date at which this image semantic version was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The name of the image semantic version.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The operating system version of the instance. For example, Amazon Linux 2,
  /// Ubuntu 18, or Microsoft Windows Server 2019.
  @_s.JsonKey(name: 'osVersion')
  final String osVersion;

  /// The owner of the image semantic version.
  @_s.JsonKey(name: 'owner')
  final String owner;

  /// The platform of the image semantic version.
  @_s.JsonKey(name: 'platform')
  final Platform platform;

  /// Specifies whether this is an AMI or container image.
  @_s.JsonKey(name: 'type')
  final ImageType type;

  /// The semantic version of the image semantic version.
  @_s.JsonKey(name: 'version')
  final String version;

  ImageVersion({
    this.arn,
    this.dateCreated,
    this.name,
    this.osVersion,
    this.owner,
    this.platform,
    this.type,
    this.version,
  });
  factory ImageVersion.fromJson(Map<String, dynamic> json) =>
      _$ImageVersionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportComponentResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the imported component.
  @_s.JsonKey(name: 'componentBuildVersionArn')
  final String componentBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ImportComponentResponse({
    this.clientToken,
    this.componentBuildVersionArn,
    this.requestId,
  });
  factory ImportComponentResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportComponentResponseFromJson(json);
}

/// Details of the infrastructure configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InfrastructureConfiguration {
  /// The Amazon Resource Name (ARN) of the infrastructure configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date on which the infrastructure configuration was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The date on which the infrastructure configuration was last updated.
  @_s.JsonKey(name: 'dateUpdated')
  final String dateUpdated;

  /// The description of the infrastructure configuration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The instance profile of the infrastructure configuration.
  @_s.JsonKey(name: 'instanceProfileName')
  final String instanceProfileName;

  /// The instance types of the infrastructure configuration.
  @_s.JsonKey(name: 'instanceTypes')
  final List<String> instanceTypes;

  /// The EC2 key pair of the infrastructure configuration.
  @_s.JsonKey(name: 'keyPair')
  final String keyPair;

  /// The logging configuration of the infrastructure configuration.
  @_s.JsonKey(name: 'logging')
  final Logging logging;

  /// The name of the infrastructure configuration.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The tags attached to the resource created by Image Builder.
  @_s.JsonKey(name: 'resourceTags')
  final Map<String, String> resourceTags;

  /// The security group IDs of the infrastructure configuration.
  @_s.JsonKey(name: 'securityGroupIds')
  final List<String> securityGroupIds;

  /// The SNS topic Amazon Resource Name (ARN) of the infrastructure
  /// configuration.
  @_s.JsonKey(name: 'snsTopicArn')
  final String snsTopicArn;

  /// The subnet ID of the infrastructure configuration.
  @_s.JsonKey(name: 'subnetId')
  final String subnetId;

  /// The tags of the infrastructure configuration.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The terminate instance on failure configuration of the infrastructure
  /// configuration.
  @_s.JsonKey(name: 'terminateInstanceOnFailure')
  final bool terminateInstanceOnFailure;

  InfrastructureConfiguration({
    this.arn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
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
  factory InfrastructureConfiguration.fromJson(Map<String, dynamic> json) =>
      _$InfrastructureConfigurationFromJson(json);
}

/// The infrastructure used when building EC2 AMIs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InfrastructureConfigurationSummary {
  /// The Amazon Resource Name (ARN) of the infrastructure configuration.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date on which the infrastructure configuration was created.
  @_s.JsonKey(name: 'dateCreated')
  final String dateCreated;

  /// The date on which the infrastructure configuration was last updated.
  @_s.JsonKey(name: 'dateUpdated')
  final String dateUpdated;

  /// The description of the infrastructure configuration.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name of the infrastructure configuration.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The tags attached to the image created by Image Builder.
  @_s.JsonKey(name: 'resourceTags')
  final Map<String, String> resourceTags;

  /// The tags of the infrastructure configuration.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  InfrastructureConfigurationSummary({
    this.arn,
    this.dateCreated,
    this.dateUpdated,
    this.description,
    this.name,
    this.resourceTags,
    this.tags,
  });
  factory InfrastructureConfigurationSummary.fromJson(
          Map<String, dynamic> json) =>
      _$InfrastructureConfigurationSummaryFromJson(json);
}

/// Defines block device mappings for the instance used to configure your image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InstanceBlockDeviceMapping {
  /// The device to which these mappings apply.
  @_s.JsonKey(name: 'deviceName')
  final String deviceName;

  /// Use to manage Amazon EBS-specific configuration for this mapping.
  @_s.JsonKey(name: 'ebs')
  final EbsInstanceBlockDeviceSpecification ebs;

  /// Use to remove a mapping from the parent image.
  @_s.JsonKey(name: 'noDevice')
  final String noDevice;

  /// Use to manage instance ephemeral devices.
  @_s.JsonKey(name: 'virtualName')
  final String virtualName;

  InstanceBlockDeviceMapping({
    this.deviceName,
    this.ebs,
    this.noDevice,
    this.virtualName,
  });
  factory InstanceBlockDeviceMapping.fromJson(Map<String, dynamic> json) =>
      _$InstanceBlockDeviceMappingFromJson(json);

  Map<String, dynamic> toJson() => _$InstanceBlockDeviceMappingToJson(this);
}

/// Describes the configuration for a launch permission. The launch permission
/// modification request is sent to the <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyImageAttribute.html">EC2
/// ModifyImageAttribute</a> API on behalf of the user for each Region they have
/// selected to distribute the AMI. To make an AMI public, set the launch
/// permission authorized accounts to <code>all</code>. See the examples for
/// making an AMI public at <a
/// href="https://docs.aws.amazon.com/AWSEC2/latest/APIReference/API_ModifyImageAttribute.html">EC2
/// ModifyImageAttribute</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LaunchPermissionConfiguration {
  /// The name of the group.
  @_s.JsonKey(name: 'userGroups')
  final List<String> userGroups;

  /// The AWS account ID.
  @_s.JsonKey(name: 'userIds')
  final List<String> userIds;

  LaunchPermissionConfiguration({
    this.userGroups,
    this.userIds,
  });
  factory LaunchPermissionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LaunchPermissionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchPermissionConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListComponentBuildVersionsResponse {
  /// The list of component summaries for the specified semantic version.
  @_s.JsonKey(name: 'componentSummaryList')
  final List<ComponentSummary> componentSummaryList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListComponentBuildVersionsResponse({
    this.componentSummaryList,
    this.nextToken,
    this.requestId,
  });
  factory ListComponentBuildVersionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListComponentBuildVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListComponentsResponse {
  /// The list of component semantic versions.
  @_s.JsonKey(name: 'componentVersionList')
  final List<ComponentVersion> componentVersionList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListComponentsResponse({
    this.componentVersionList,
    this.nextToken,
    this.requestId,
  });
  factory ListComponentsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListComponentsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListContainerRecipesResponse {
  /// The list of container recipes returned for the request.
  @_s.JsonKey(name: 'containerRecipeSummaryList')
  final List<ContainerRecipeSummary> containerRecipeSummaryList;

  /// The next token field is used for paginated responses. When this is not
  /// empty, there are additional container recipes that the service has not
  /// included in this response. Use this token with the next request to retrieve
  /// additional list items.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListContainerRecipesResponse({
    this.containerRecipeSummaryList,
    this.nextToken,
    this.requestId,
  });
  factory ListContainerRecipesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListContainerRecipesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDistributionConfigurationsResponse {
  /// The list of distributions.
  @_s.JsonKey(name: 'distributionConfigurationSummaryList')
  final List<DistributionConfigurationSummary>
      distributionConfigurationSummaryList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListDistributionConfigurationsResponse({
    this.distributionConfigurationSummaryList,
    this.nextToken,
    this.requestId,
  });
  factory ListDistributionConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListDistributionConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListImageBuildVersionsResponse {
  /// The list of image build versions.
  @_s.JsonKey(name: 'imageSummaryList')
  final List<ImageSummary> imageSummaryList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListImageBuildVersionsResponse({
    this.imageSummaryList,
    this.nextToken,
    this.requestId,
  });
  factory ListImageBuildVersionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListImageBuildVersionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListImagePipelineImagesResponse {
  /// The list of images built by this pipeline.
  @_s.JsonKey(name: 'imageSummaryList')
  final List<ImageSummary> imageSummaryList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListImagePipelineImagesResponse({
    this.imageSummaryList,
    this.nextToken,
    this.requestId,
  });
  factory ListImagePipelineImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListImagePipelineImagesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListImagePipelinesResponse {
  /// The list of image pipelines.
  @_s.JsonKey(name: 'imagePipelineList')
  final List<ImagePipeline> imagePipelineList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListImagePipelinesResponse({
    this.imagePipelineList,
    this.nextToken,
    this.requestId,
  });
  factory ListImagePipelinesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListImagePipelinesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListImageRecipesResponse {
  /// The list of image pipelines.
  @_s.JsonKey(name: 'imageRecipeSummaryList')
  final List<ImageRecipeSummary> imageRecipeSummaryList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListImageRecipesResponse({
    this.imageRecipeSummaryList,
    this.nextToken,
    this.requestId,
  });
  factory ListImageRecipesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListImageRecipesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListImagesResponse {
  /// The list of image semantic versions.
  @_s.JsonKey(name: 'imageVersionList')
  final List<ImageVersion> imageVersionList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListImagesResponse({
    this.imageVersionList,
    this.nextToken,
    this.requestId,
  });
  factory ListImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListImagesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListInfrastructureConfigurationsResponse {
  /// The list of infrastructure configurations.
  @_s.JsonKey(name: 'infrastructureConfigurationSummaryList')
  final List<InfrastructureConfigurationSummary>
      infrastructureConfigurationSummaryList;

  /// The next token used for paginated responses. When this is not empty, there
  /// are additional elements that the service has not included in this request.
  /// Use this token with the next request to retrieve additional objects.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  ListInfrastructureConfigurationsResponse({
    this.infrastructureConfigurationSummaryList,
    this.nextToken,
    this.requestId,
  });
  factory ListInfrastructureConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListInfrastructureConfigurationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags for the specified resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// Logging configuration defines where Image Builder uploads your logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Logging {
  /// The Amazon S3 logging configuration.
  @_s.JsonKey(name: 's3Logs')
  final S3Logs s3Logs;

  Logging({
    this.s3Logs,
  });
  factory Logging.fromJson(Map<String, dynamic> json) =>
      _$LoggingFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingToJson(this);
}

/// The resources produced by this image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OutputResources {
  /// The EC2 AMIs created by this image.
  @_s.JsonKey(name: 'amis')
  final List<Ami> amis;

  /// Container images that the pipeline has generated and stored in the output
  /// repository.
  @_s.JsonKey(name: 'containers')
  final List<Container> containers;

  OutputResources({
    this.amis,
    this.containers,
  });
  factory OutputResources.fromJson(Map<String, dynamic> json) =>
      _$OutputResourcesFromJson(json);
}

enum Ownership {
  @_s.JsonValue('Self')
  self,
  @_s.JsonValue('Shared')
  shared,
  @_s.JsonValue('Amazon')
  amazon,
}

extension on Ownership {
  String toValue() {
    switch (this) {
      case Ownership.self:
        return 'Self';
      case Ownership.shared:
        return 'Shared';
      case Ownership.amazon:
        return 'Amazon';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PipelineExecutionStartCondition {
  @_s.JsonValue('EXPRESSION_MATCH_ONLY')
  expressionMatchOnly,
  @_s.JsonValue('EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE')
  expressionMatchAndDependencyUpdatesAvailable,
}

enum PipelineStatus {
  @_s.JsonValue('DISABLED')
  disabled,
  @_s.JsonValue('ENABLED')
  enabled,
}

extension on PipelineStatus {
  String toValue() {
    switch (this) {
      case PipelineStatus.disabled:
        return 'DISABLED';
      case PipelineStatus.enabled:
        return 'ENABLED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Platform {
  @_s.JsonValue('Windows')
  windows,
  @_s.JsonValue('Linux')
  linux,
}

extension on Platform {
  String toValue() {
    switch (this) {
      case Platform.windows:
        return 'Windows';
      case Platform.linux:
        return 'Linux';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutComponentPolicyResponse {
  /// The Amazon Resource Name (ARN) of the component that this policy was applied
  /// to.
  @_s.JsonKey(name: 'componentArn')
  final String componentArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  PutComponentPolicyResponse({
    this.componentArn,
    this.requestId,
  });
  factory PutComponentPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutComponentPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutContainerRecipePolicyResponse {
  /// The Amazon Resource Name (ARN) of the container recipe that this policy was
  /// applied to.
  @_s.JsonKey(name: 'containerRecipeArn')
  final String containerRecipeArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  PutContainerRecipePolicyResponse({
    this.containerRecipeArn,
    this.requestId,
  });
  factory PutContainerRecipePolicyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutContainerRecipePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutImagePolicyResponse {
  /// The Amazon Resource Name (ARN) of the image that this policy was applied to.
  @_s.JsonKey(name: 'imageArn')
  final String imageArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  PutImagePolicyResponse({
    this.imageArn,
    this.requestId,
  });
  factory PutImagePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutImagePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutImageRecipePolicyResponse {
  /// The Amazon Resource Name (ARN) of the image recipe that this policy was
  /// applied to.
  @_s.JsonKey(name: 'imageRecipeArn')
  final String imageRecipeArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  PutImageRecipePolicyResponse({
    this.imageRecipeArn,
    this.requestId,
  });
  factory PutImageRecipePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutImageRecipePolicyResponseFromJson(json);
}

/// Amazon S3 logging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Logs {
  /// The Amazon S3 bucket in which to store the logs.
  @_s.JsonKey(name: 's3BucketName')
  final String s3BucketName;

  /// The Amazon S3 path in which to store the logs.
  @_s.JsonKey(name: 's3KeyPrefix')
  final String s3KeyPrefix;

  S3Logs({
    this.s3BucketName,
    this.s3KeyPrefix,
  });
  factory S3Logs.fromJson(Map<String, dynamic> json) => _$S3LogsFromJson(json);

  Map<String, dynamic> toJson() => _$S3LogsToJson(this);
}

/// A schedule configures how often and when a pipeline will automatically
/// create a new image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Schedule {
  /// The condition configures when the pipeline should trigger a new image build.
  /// When the <code>pipelineExecutionStartCondition</code> is set to
  /// <code>EXPRESSION_MATCH_AND_DEPENDENCY_UPDATES_AVAILABLE</code>, and you use
  /// semantic version filters on the source image or components in your image
  /// recipe, EC2 Image Builder will build a new image only when there are new
  /// versions of the image or components in your recipe that match the semantic
  /// version filter. When it is set to <code>EXPRESSION_MATCH_ONLY</code>, it
  /// will build a new image every time the CRON expression matches the current
  /// time. For semantic version syntax, see <a
  /// href="https://docs.aws.amazon.com/imagebuilder/latest/APIReference/API_CreateComponent.html">CreateComponent</a>
  /// in the <i> EC2 Image Builder API Reference</i>.
  @_s.JsonKey(name: 'pipelineExecutionStartCondition')
  final PipelineExecutionStartCondition pipelineExecutionStartCondition;

  /// The cron expression determines how often EC2 Image Builder evaluates your
  /// <code>pipelineExecutionStartCondition</code>.
  ///
  /// For information on how to format a cron expression in Image Builder, see <a
  /// href="https://docs.aws.amazon.com/imagebuilder/latest/userguide/image-builder-cron.html">Use
  /// cron expressions in EC2 Image Builder</a>.
  @_s.JsonKey(name: 'scheduleExpression')
  final String scheduleExpression;

  Schedule({
    this.pipelineExecutionStartCondition,
    this.scheduleExpression,
  });
  factory Schedule.fromJson(Map<String, dynamic> json) =>
      _$ScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$ScheduleToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartImagePipelineExecutionResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the image that was created by this
  /// request.
  @_s.JsonKey(name: 'imageBuildVersionArn')
  final String imageBuildVersionArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  StartImagePipelineExecutionResponse({
    this.clientToken,
    this.imageBuildVersionArn,
    this.requestId,
  });
  factory StartImagePipelineExecutionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartImagePipelineExecutionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// The container repository where the output container image is stored.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TargetContainerRepository {
  /// The name of the container repository where the output container image is
  /// stored. This name is prefixed by the repository location.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// Specifies the service in which this image was registered.
  @_s.JsonKey(name: 'service')
  final ContainerRepositoryService service;

  TargetContainerRepository({
    @_s.required this.repositoryName,
    @_s.required this.service,
  });
  factory TargetContainerRepository.fromJson(Map<String, dynamic> json) =>
      _$TargetContainerRepositoryFromJson(json);

  Map<String, dynamic> toJson() => _$TargetContainerRepositoryToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateDistributionConfigurationResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the distribution configuration that was
  /// updated by this request.
  @_s.JsonKey(name: 'distributionConfigurationArn')
  final String distributionConfigurationArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  UpdateDistributionConfigurationResponse({
    this.clientToken,
    this.distributionConfigurationArn,
    this.requestId,
  });
  factory UpdateDistributionConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateDistributionConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateImagePipelineResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the image pipeline that was updated by
  /// this request.
  @_s.JsonKey(name: 'imagePipelineArn')
  final String imagePipelineArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  UpdateImagePipelineResponse({
    this.clientToken,
    this.imagePipelineArn,
    this.requestId,
  });
  factory UpdateImagePipelineResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateImagePipelineResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateInfrastructureConfigurationResponse {
  /// The idempotency token used to make this request idempotent.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of the infrastructure configuration that was
  /// updated by this request.
  @_s.JsonKey(name: 'infrastructureConfigurationArn')
  final String infrastructureConfigurationArn;

  /// The request ID that uniquely identifies this request.
  @_s.JsonKey(name: 'requestId')
  final String requestId;

  UpdateInfrastructureConfigurationResponse({
    this.clientToken,
    this.infrastructureConfigurationArn,
    this.requestId,
  });
  factory UpdateInfrastructureConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateInfrastructureConfigurationResponseFromJson(json);
}

class CallRateLimitExceededException extends _s.GenericAwsException {
  CallRateLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'CallRateLimitExceededException',
            message: message);
}

class ClientException extends _s.GenericAwsException {
  ClientException({String type, String message})
      : super(type: type, code: 'ClientException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String type, String message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InvalidPaginationTokenException extends _s.GenericAwsException {
  InvalidPaginationTokenException({String type, String message})
      : super(
            type: type,
            code: 'InvalidPaginationTokenException',
            message: message);
}

class InvalidParameterCombinationException extends _s.GenericAwsException {
  InvalidParameterCombinationException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterCombinationException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class InvalidVersionNumberException extends _s.GenericAwsException {
  InvalidVersionNumberException({String type, String message})
      : super(
            type: type,
            code: 'InvalidVersionNumberException',
            message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceDependencyException extends _s.GenericAwsException {
  ResourceDependencyException({String type, String message})
      : super(
            type: type, code: 'ResourceDependencyException', message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceException extends _s.GenericAwsException {
  ServiceException({String type, String message})
      : super(type: type, code: 'ServiceException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
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
