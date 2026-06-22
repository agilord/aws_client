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

import 'v2015_09_21.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Elastic Container Registry (Amazon ECR) is a managed container image
/// registry service. Customers can use the familiar Docker CLI, or their
/// preferred client, to push, pull, and manage images. Amazon ECR provides a
/// secure, scalable, and reliable registry for your Docker or Open Container
/// Initiative (OCI) images. Amazon ECR supports private repositories with
/// resource-based permissions using IAM so that specific users or Amazon EC2
/// instances can access repositories and images.
class Ecr {
  final _s.JsonProtocol _protocol;
  factory Ecr({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'api.ecr',
      signingName: 'ecr',
    );
    return Ecr._(
      protocol: _s.JsonProtocol(
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
  Ecr._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Checks the availability of one or more image layers in a repository.
  ///
  /// When an image is pushed to a repository, each image layer is checked to
  /// verify if it has been uploaded before. If it has been uploaded, then the
  /// image layer is skipped.
  /// <note>
  /// This operation is used by the Amazon ECR proxy and is not generally used
  /// by customers for pulling and pushing images. In most cases, you should use
  /// the <code>docker</code> CLI to pull, tag, and push images.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [layerDigests] :
  /// The digests of the image layers to check.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that is associated with the image layers to
  /// check.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the image layers to check. If you do not specify a registry, the
  /// default registry is assumed.
  Future<BatchCheckLayerAvailabilityResponse> batchCheckLayerAvailability({
    required List<String> layerDigests,
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.BatchCheckLayerAvailability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'layerDigests': layerDigests,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return BatchCheckLayerAvailabilityResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a list of specified images within a repository. Images are
  /// specified with either an <code>imageTag</code> or
  /// <code>imageDigest</code>.
  ///
  /// You can remove a tag from an image by specifying the image's tag in your
  /// request. When you remove the last tag from an image, the image is deleted
  /// from your repository.
  ///
  /// You can completely delete an image (and all of its tags) by specifying the
  /// image's digest in your request.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [imageIds] :
  /// A list of image ID references that correspond to images to delete. The
  /// format of the <code>imageIds</code> reference is <code>imageTag=tag</code>
  /// or <code>imageDigest=digest</code>.
  ///
  /// Parameter [repositoryName] :
  /// The repository that contains the image to delete.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the image to delete. If you do not specify a registry, the
  /// default registry is assumed.
  Future<BatchDeleteImageResponse> batchDeleteImage({
    required List<ImageIdentifier> imageIds,
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.BatchDeleteImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageIds': imageIds,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return BatchDeleteImageResponse.fromJson(jsonResponse.body);
  }

  /// Gets detailed information for an image. Images are specified with either
  /// an <code>imageTag</code> or <code>imageDigest</code>.
  ///
  /// When an image is pulled, the BatchGetImage API is called once to retrieve
  /// the image manifest.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [UnableToGetUpstreamImageException].
  ///
  /// Parameter [imageIds] :
  /// A list of image ID references that correspond to images to describe. The
  /// format of the <code>imageIds</code> reference is <code>imageTag=tag</code>
  /// or <code>imageDigest=digest</code>.
  ///
  /// Parameter [repositoryName] :
  /// The repository that contains the images to describe.
  ///
  /// Parameter [acceptedMediaTypes] :
  /// The accepted media types for the request.
  ///
  /// Valid values:
  /// <code>application/vnd.docker.distribution.manifest.v1+json</code> |
  /// <code>application/vnd.docker.distribution.manifest.v2+json</code> |
  /// <code>application/vnd.oci.image.manifest.v1+json</code>
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the images to describe. If you do not specify a registry, the
  /// default registry is assumed.
  Future<BatchGetImageResponse> batchGetImage({
    required List<ImageIdentifier> imageIds,
    required String repositoryName,
    List<String>? acceptedMediaTypes,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.BatchGetImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageIds': imageIds,
        'repositoryName': repositoryName,
        if (acceptedMediaTypes != null)
          'acceptedMediaTypes': acceptedMediaTypes,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return BatchGetImageResponse.fromJson(jsonResponse.body);
  }

  /// Gets the scanning configuration for one or more repositories.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryNames] :
  /// One or more repository names to get the scanning configuration for.
  Future<BatchGetRepositoryScanningConfigurationResponse>
      batchGetRepositoryScanningConfiguration({
    required List<String> repositoryNames,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.BatchGetRepositoryScanningConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryNames': repositoryNames,
      },
    );

    return BatchGetRepositoryScanningConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Informs Amazon ECR that the image layer upload has completed for a
  /// specified registry, repository name, and upload ID. You can optionally
  /// provide a <code>sha256</code> digest of the image layer for data
  /// validation purposes.
  ///
  /// When an image is pushed, the CompleteLayerUpload API is called once per
  /// each new image layer to verify that the upload has completed.
  /// <note>
  /// This operation is used by the Amazon ECR proxy and is not generally used
  /// by customers for pulling and pushing images. In most cases, you should use
  /// the <code>docker</code> CLI to pull, tag, and push images.
  /// </note>
  ///
  /// May throw [EmptyUploadException].
  /// May throw [InvalidLayerException].
  /// May throw [InvalidParameterException].
  /// May throw [KmsException].
  /// May throw [LayerAlreadyExistsException].
  /// May throw [LayerPartTooSmallException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [UploadNotFoundException].
  ///
  /// Parameter [layerDigests] :
  /// The <code>sha256</code> digest of the image layer.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to associate with the image layer.
  ///
  /// Parameter [uploadId] :
  /// The upload ID from a previous <a>InitiateLayerUpload</a> operation to
  /// associate with the image layer.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry to which
  /// to upload layers. If you do not specify a registry, the default registry
  /// is assumed.
  Future<CompleteLayerUploadResponse> completeLayerUpload({
    required List<String> layerDigests,
    required String repositoryName,
    required String uploadId,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.CompleteLayerUpload'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'layerDigests': layerDigests,
        'repositoryName': repositoryName,
        'uploadId': uploadId,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return CompleteLayerUploadResponse.fromJson(jsonResponse.body);
  }

  /// Creates a pull through cache rule. A pull through cache rule provides a
  /// way to cache images from an upstream registry source in your Amazon ECR
  /// private registry. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/pull-through-cache.html">Using
  /// pull through cache rules</a> in the <i>Amazon Elastic Container Registry
  /// User Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [PullThroughCacheRuleAlreadyExistsException].
  /// May throw [SecretNotFoundException].
  /// May throw [ServerException].
  /// May throw [UnableToAccessSecretException].
  /// May throw [UnableToDecryptSecretValueException].
  /// May throw [UnsupportedUpstreamRegistryException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ecrRepositoryPrefix] :
  /// The repository name prefix to use when caching images from the source
  /// registry.
  /// <important>
  /// There is always an assumed <code>/</code> applied to the end of the
  /// prefix. If you specify <code>ecr-public</code> as the prefix, Amazon ECR
  /// treats that as <code>ecr-public/</code>.
  /// </important>
  ///
  /// Parameter [upstreamRegistryUrl] :
  /// The registry URL of the upstream public registry to use as the source for
  /// the pull through cache rule. The following is the syntax to use for each
  /// supported upstream registry.
  ///
  /// <ul>
  /// <li>
  /// Amazon ECR (<code>ecr</code>) –
  /// <code><accountId>.dkr.ecr.<region>.amazonaws.com</code>
  /// </li>
  /// <li>
  /// Amazon ECR Public (<code>ecr-public</code>) – <code>public.ecr.aws</code>
  /// </li>
  /// <li>
  /// Docker Hub (<code>docker-hub</code>) – <code>registry-1.docker.io</code>
  /// </li>
  /// <li>
  /// GitHub Container Registry (<code>github-container-registry</code>) –
  /// <code>ghcr.io</code>
  /// </li>
  /// <li>
  /// GitLab Container Registry (<code>gitlab-container-registry</code>) –
  /// <code>registry.gitlab.com</code>
  /// </li>
  /// <li>
  /// Kubernetes (<code>k8s</code>) – <code>registry.k8s.io</code>
  /// </li>
  /// <li>
  /// Microsoft Azure Container Registry (<code>azure-container-registry</code>)
  /// – <code><custom>.azurecr.io</code>
  /// </li>
  /// <li>
  /// Quay (<code>quay</code>) – <code>quay.io</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [credentialArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret that identifies the credentials to authenticate to the upstream
  /// registry.
  ///
  /// Parameter [customRoleArn] :
  /// Amazon Resource Name (ARN) of the IAM role to be assumed by Amazon ECR to
  /// authenticate to the ECR upstream registry. This role must be in the same
  /// account as the registry that you are configuring.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry to create
  /// the pull through cache rule for. If you do not specify a registry, the
  /// default registry is assumed.
  ///
  /// Parameter [upstreamRegistry] :
  /// The name of the upstream registry.
  ///
  /// Parameter [upstreamRepositoryPrefix] :
  /// The repository name prefix of the upstream registry to match with the
  /// upstream repository name. When this field isn't specified, Amazon ECR will
  /// use the <code>ROOT</code>.
  Future<CreatePullThroughCacheRuleResponse> createPullThroughCacheRule({
    required String ecrRepositoryPrefix,
    required String upstreamRegistryUrl,
    String? credentialArn,
    String? customRoleArn,
    String? registryId,
    UpstreamRegistry? upstreamRegistry,
    String? upstreamRepositoryPrefix,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.CreatePullThroughCacheRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
        'upstreamRegistryUrl': upstreamRegistryUrl,
        if (credentialArn != null) 'credentialArn': credentialArn,
        if (customRoleArn != null) 'customRoleArn': customRoleArn,
        if (registryId != null) 'registryId': registryId,
        if (upstreamRegistry != null)
          'upstreamRegistry': upstreamRegistry.value,
        if (upstreamRepositoryPrefix != null)
          'upstreamRepositoryPrefix': upstreamRepositoryPrefix,
      },
    );

    return CreatePullThroughCacheRuleResponse.fromJson(jsonResponse.body);
  }

  /// Creates a repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html">Amazon
  /// ECR repositories</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagParameterException].
  /// May throw [KmsException].
  /// May throw [LimitExceededException].
  /// May throw [RepositoryAlreadyExistsException].
  /// May throw [ServerException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [repositoryName] :
  /// The name to use for the repository. The repository name may be specified
  /// on its own (such as <code>nginx-web-app</code>) or it can be prepended
  /// with a namespace to group the repository into a category (such as
  /// <code>project-a/nginx-web-app</code>).
  ///
  /// The repository name must start with a letter and can only contain
  /// lowercase letters, numbers, hyphens, underscores, and forward slashes.
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration for the repository. This determines how the
  /// contents of your repository are encrypted at rest.
  ///
  /// Parameter [imageScanningConfiguration] :
  /// <important>
  /// The <code>imageScanningConfiguration</code> parameter is being deprecated,
  /// in favor of specifying the image scanning configuration at the registry
  /// level. For more information, see
  /// <code>PutRegistryScanningConfiguration</code>.
  /// </important>
  /// The image scanning configuration for the repository. This determines
  /// whether images are scanned for known vulnerabilities after being pushed to
  /// the repository.
  ///
  /// Parameter [imageTagMutability] :
  /// The tag mutability setting for the repository. If this parameter is
  /// omitted, the default setting of <code>MUTABLE</code> will be used which
  /// will allow image tags to be overwritten. If <code>IMMUTABLE</code> is
  /// specified, all image tags within the repository will be immutable which
  /// will prevent them from being overwritten.
  ///
  /// Parameter [imageTagMutabilityExclusionFilters] :
  /// A list of filters that specify which image tags should be excluded from
  /// the repository's image tag mutability setting.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry to create
  /// the repository. If you do not specify a registry, the default registry is
  /// assumed.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to the repository to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define. Tag keys can have a maximum character length of 128
  /// characters, and tag values can have a maximum length of 256 characters.
  Future<CreateRepositoryResponse> createRepository({
    required String repositoryName,
    EncryptionConfiguration? encryptionConfiguration,
    ImageScanningConfiguration? imageScanningConfiguration,
    ImageTagMutability? imageTagMutability,
    List<ImageTagMutabilityExclusionFilter>? imageTagMutabilityExclusionFilters,
    String? registryId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.CreateRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (encryptionConfiguration != null)
          'encryptionConfiguration': encryptionConfiguration,
        if (imageScanningConfiguration != null)
          'imageScanningConfiguration': imageScanningConfiguration,
        if (imageTagMutability != null)
          'imageTagMutability': imageTagMutability.value,
        if (imageTagMutabilityExclusionFilters != null)
          'imageTagMutabilityExclusionFilters':
              imageTagMutabilityExclusionFilters,
        if (registryId != null) 'registryId': registryId,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRepositoryResponse.fromJson(jsonResponse.body);
  }

  /// Creates a repository creation template. This template is used to define
  /// the settings for repositories created by Amazon ECR on your behalf. For
  /// example, repositories created through pull through cache actions. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-creation-templates.html">Private
  /// repository creation templates</a> in the <i>Amazon Elastic Container
  /// Registry User Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ServerException].
  /// May throw [TemplateAlreadyExistsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [appliedFor] :
  /// A list of enumerable strings representing the Amazon ECR repository
  /// creation scenarios that this template will apply towards. The supported
  /// scenarios are <code>PULL_THROUGH_CACHE</code>, <code>REPLICATION</code>,
  /// and <code>CREATE_ON_PUSH</code>
  ///
  /// Parameter [prefix] :
  /// The repository namespace prefix to associate with the template. All
  /// repositories created using this namespace prefix will have the settings
  /// defined in this template applied. For example, a prefix of
  /// <code>prod</code> would apply to all repositories beginning with
  /// <code>prod/</code>. Similarly, a prefix of <code>prod/team</code> would
  /// apply to all repositories beginning with <code>prod/team/</code>.
  ///
  /// To apply a template to all repositories in your registry that don't have
  /// an associated creation template, you can use <code>ROOT</code> as the
  /// prefix.
  /// <important>
  /// There is always an assumed <code>/</code> applied to the end of the
  /// prefix. If you specify <code>ecr-public</code> as the prefix, Amazon ECR
  /// treats that as <code>ecr-public/</code>. When using a pull through cache
  /// rule, the repository prefix you specify during rule creation is what you
  /// should specify as your repository creation template prefix as well.
  /// </important>
  ///
  /// Parameter [customRoleArn] :
  /// The ARN of the role to be assumed by Amazon ECR. This role must be in the
  /// same account as the registry that you are configuring. Amazon ECR will
  /// assume your supplied role when the customRoleArn is specified. When this
  /// field isn't specified, Amazon ECR will use the service-linked role for the
  /// repository creation template.
  ///
  /// Parameter [description] :
  /// A description for the repository creation template.
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration to use for repositories created using the
  /// template.
  ///
  /// Parameter [imageTagMutability] :
  /// The tag mutability setting for the repository. If this parameter is
  /// omitted, the default setting of <code>MUTABLE</code> will be used which
  /// will allow image tags to be overwritten. If <code>IMMUTABLE</code> is
  /// specified, all image tags within the repository will be immutable which
  /// will prevent them from being overwritten.
  ///
  /// Parameter [imageTagMutabilityExclusionFilters] :
  /// A list of filters that specify which image tags should be excluded from
  /// the repository creation template's image tag mutability setting.
  ///
  /// Parameter [lifecyclePolicy] :
  /// The lifecycle policy to use for repositories created using the template.
  ///
  /// Parameter [repositoryPolicy] :
  /// The repository policy to apply to repositories created using the template.
  /// A repository policy is a permissions policy associated with a repository
  /// to control access permissions.
  ///
  /// Parameter [resourceTags] :
  /// The metadata to apply to the repository to help you categorize and
  /// organize. Each tag consists of a key and an optional value, both of which
  /// you define. Tag keys can have a maximum character length of 128
  /// characters, and tag values can have a maximum length of 256 characters.
  Future<CreateRepositoryCreationTemplateResponse>
      createRepositoryCreationTemplate({
    required List<RCTAppliedFor> appliedFor,
    required String prefix,
    String? customRoleArn,
    String? description,
    EncryptionConfigurationForRepositoryCreationTemplate?
        encryptionConfiguration,
    ImageTagMutability? imageTagMutability,
    List<ImageTagMutabilityExclusionFilter>? imageTagMutabilityExclusionFilters,
    String? lifecyclePolicy,
    String? repositoryPolicy,
    List<Tag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.CreateRepositoryCreationTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'appliedFor': appliedFor.map((e) => e.value).toList(),
        'prefix': prefix,
        if (customRoleArn != null) 'customRoleArn': customRoleArn,
        if (description != null) 'description': description,
        if (encryptionConfiguration != null)
          'encryptionConfiguration': encryptionConfiguration,
        if (imageTagMutability != null)
          'imageTagMutability': imageTagMutability.value,
        if (imageTagMutabilityExclusionFilters != null)
          'imageTagMutabilityExclusionFilters':
              imageTagMutabilityExclusionFilters,
        if (lifecyclePolicy != null) 'lifecyclePolicy': lifecyclePolicy,
        if (repositoryPolicy != null) 'repositoryPolicy': repositoryPolicy,
        if (resourceTags != null) 'resourceTags': resourceTags,
      },
    );

    return CreateRepositoryCreationTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the lifecycle policy associated with the specified repository.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LifecyclePolicyNotFoundException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  Future<DeleteLifecyclePolicyResponse> deleteLifecyclePolicy({
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DeleteLifecyclePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DeleteLifecyclePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a pull through cache rule.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [PullThroughCacheRuleNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ecrRepositoryPrefix] :
  /// The Amazon ECR repository prefix associated with the pull through cache
  /// rule to delete.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the pull through cache rule. If you do not specify a registry,
  /// the default registry is assumed.
  Future<DeletePullThroughCacheRuleResponse> deletePullThroughCacheRule({
    required String ecrRepositoryPrefix,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DeletePullThroughCacheRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DeletePullThroughCacheRuleResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the registry permissions policy.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RegistryPolicyNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  Future<DeleteRegistryPolicyResponse> deleteRegistryPolicy() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DeleteRegistryPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteRegistryPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a repository. If the repository isn't empty, you must either
  /// delete the contents of the repository or use the <code>force</code> option
  /// to delete the repository and have Amazon ECR delete all of its contents on
  /// your behalf.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [KmsException].
  /// May throw [RepositoryNotEmptyException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to delete.
  ///
  /// Parameter [force] :
  /// If true, deleting the repository force deletes the contents of the
  /// repository. If false, the repository must be empty before attempting to
  /// delete it.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository to delete. If you do not specify a registry, the
  /// default registry is assumed.
  Future<DeleteRepositoryResponse> deleteRepository({
    required String repositoryName,
    bool? force,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.DeleteRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (force != null) 'force': force,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DeleteRepositoryResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a repository creation template.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [TemplateNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [prefix] :
  /// The repository namespace prefix associated with the repository creation
  /// template.
  Future<DeleteRepositoryCreationTemplateResponse>
      deleteRepositoryCreationTemplate({
    required String prefix,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DeleteRepositoryCreationTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'prefix': prefix,
      },
    );

    return DeleteRepositoryCreationTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the repository policy associated with the specified repository.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [RepositoryPolicyNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that is associated with the repository policy
  /// to delete.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository policy to delete. If you do not specify a
  /// registry, the default registry is assumed.
  Future<DeleteRepositoryPolicyResponse> deleteRepositoryPolicy({
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DeleteRepositoryPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DeleteRepositoryPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the registry's signing configuration. Images pushed after deletion
  /// of the signing configuration will no longer be automatically signed.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/managed-signing.html">Managed
  /// signing</a> in the <i>Amazon Elastic Container Registry User Guide</i>.
  /// <note>
  /// Deleting the signing configuration does not affect existing image
  /// signatures.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [SigningConfigurationNotFoundException].
  /// May throw [ValidationException].
  Future<DeleteSigningConfigurationResponse>
      deleteSigningConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DeleteSigningConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteSigningConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Removes a principal from the pull time update exclusion list for a
  /// registry. Once removed, Amazon ECR will resume updating the pull time if
  /// the specified principal pulls an image.
  ///
  /// May throw [ExclusionNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM principal to remove from the pull time update exclusion
  /// list.
  Future<DeregisterPullTimeUpdateExclusionResponse>
      deregisterPullTimeUpdateExclusion({
    required String principalArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DeregisterPullTimeUpdateExclusion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'principalArn': principalArn,
      },
    );

    return DeregisterPullTimeUpdateExclusionResponse.fromJson(
        jsonResponse.body);
  }

  /// Returns the replication status for a specified image.
  ///
  /// May throw [ImageNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that the image is in.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry. If you do
  /// not specify a registry, the default registry is assumed.
  Future<DescribeImageReplicationStatusResponse>
      describeImageReplicationStatus({
    required ImageIdentifier imageId,
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DescribeImageReplicationStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageId': imageId,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DescribeImageReplicationStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata about the images in a repository.
  /// <note>
  /// Starting with Docker version 1.9, the Docker client compresses image
  /// layers before pushing them to a V2 Docker registry. The output of the
  /// <code>docker images</code> command shows the uncompressed image size.
  /// Therefore, Docker might return a larger image than the image shown in the
  /// Amazon Web Services Management Console.
  /// </note> <important>
  /// The new version of Amazon ECR <i>Basic Scanning</i> doesn't use the
  /// <a>ImageDetail$imageScanFindingsSummary</a> and
  /// <a>ImageDetail$imageScanStatus</a> attributes from the API response to
  /// return scan results. Use the <a>DescribeImageScanFindings</a> API instead.
  /// For more information about Amazon Web Services native basic scanning, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html">
  /// Scan images for software vulnerabilities in Amazon ECR</a>.
  /// </important>
  ///
  /// May throw [ImageNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [repositoryName] :
  /// The repository that contains the images to describe.
  ///
  /// Parameter [filter] :
  /// The filter key and value with which to filter your
  /// <code>DescribeImages</code> results.
  ///
  /// Parameter [imageIds] :
  /// The list of image IDs for the requested repository.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results returned by
  /// <code>DescribeImages</code> in paginated output. When this parameter is
  /// used, <code>DescribeImages</code> only returns <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. The remaining results of the initial request can be seen by
  /// sending another <code>DescribeImages</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter is not used, then <code>DescribeImages</code> returns up to
  /// 100 results and a <code>nextToken</code> value, if applicable. This option
  /// cannot be used when you specify images with <code>imageIds</code>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeImages</code> request where <code>maxResults</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return. This option cannot be used when you specify
  /// images with <code>imageIds</code>.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository in which to describe images. If you do not specify
  /// a registry, the default registry is assumed.
  Future<DescribeImagesResponse> describeImages({
    required String repositoryName,
    DescribeImagesFilter? filter,
    List<ImageIdentifier>? imageIds,
    int? maxResults,
    String? nextToken,
    String? registryId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.DescribeImages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (filter != null) 'filter': filter,
        if (imageIds != null) 'imageIds': imageIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DescribeImagesResponse.fromJson(jsonResponse.body);
  }

  /// Returns the scan findings for the specified image.
  ///
  /// May throw [ImageNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ScanNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The repository for the image for which to describe the scan findings.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of image scan results returned by
  /// <code>DescribeImageScanFindings</code> in paginated output. When this
  /// parameter is used, <code>DescribeImageScanFindings</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeImageScanFindings</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter is not used, then <code>DescribeImageScanFindings</code>
  /// returns up to 100 results and a <code>nextToken</code> value, if
  /// applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeImageScanFindings</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository in which to describe the image scan findings for.
  /// If you do not specify a registry, the default registry is assumed.
  Future<DescribeImageScanFindingsResponse> describeImageScanFindings({
    required ImageIdentifier imageId,
    required String repositoryName,
    int? maxResults,
    String? nextToken,
    String? registryId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DescribeImageScanFindings'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageId': imageId,
        'repositoryName': repositoryName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DescribeImageScanFindingsResponse.fromJson(jsonResponse.body);
  }

  /// Returns the signing status for a specified image. If the image matched
  /// signing rules that reference different signing profiles, a status is
  /// returned for each profile.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/managed-signing.html">Managed
  /// signing</a> in the <i>Amazon Elastic Container Registry User Guide</i>.
  ///
  /// May throw [ImageNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageId] :
  /// An object containing identifying information for an image.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the image.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  Future<DescribeImageSigningStatusResponse> describeImageSigningStatus({
    required ImageIdentifier imageId,
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DescribeImageSigningStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageId': imageId,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DescribeImageSigningStatusResponse.fromJson(jsonResponse.body);
  }

  /// Returns the pull through cache rules for a registry.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [PullThroughCacheRuleNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ecrRepositoryPrefixes] :
  /// The Amazon ECR repository prefixes associated with the pull through cache
  /// rules to return. If no repository prefix value is specified, all pull
  /// through cache rules are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of pull through cache rules returned by
  /// <code>DescribePullThroughCacheRulesRequest</code> in paginated output.
  /// When this parameter is used,
  /// <code>DescribePullThroughCacheRulesRequest</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribePullThroughCacheRulesRequest</code> request with the
  /// returned <code>nextToken</code> value. This value can be between 1 and
  /// 1000. If this parameter is not used, then
  /// <code>DescribePullThroughCacheRulesRequest</code> returns up to 100
  /// results and a <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribePullThroughCacheRulesRequest</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is null when
  /// there are no more results to return.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry to return
  /// the pull through cache rules for. If you do not specify a registry, the
  /// default registry is assumed.
  Future<DescribePullThroughCacheRulesResponse> describePullThroughCacheRules({
    List<String>? ecrRepositoryPrefixes,
    int? maxResults,
    String? nextToken,
    String? registryId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DescribePullThroughCacheRules'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (ecrRepositoryPrefixes != null)
          'ecrRepositoryPrefixes': ecrRepositoryPrefixes,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DescribePullThroughCacheRulesResponse.fromJson(jsonResponse.body);
  }

  /// Describes the settings for a registry. The replication configuration for a
  /// repository can be created or updated with the
  /// <a>PutReplicationConfiguration</a> API action.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  Future<DescribeRegistryResponse> describeRegistry() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.DescribeRegistry'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DescribeRegistryResponse.fromJson(jsonResponse.body);
  }

  /// Describes image repositories in a registry.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results returned by
  /// <code>DescribeRepositories</code> in paginated output. When this parameter
  /// is used, <code>DescribeRepositories</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeRepositories</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter is not used, then <code>DescribeRepositories</code> returns
  /// up to 100 results and a <code>nextToken</code> value, if applicable. This
  /// option cannot be used when you specify repositories with
  /// <code>repositoryNames</code>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeRepositories</code> request where <code>maxResults</code>
  /// was used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return. This option cannot be used when you specify
  /// repositories with <code>repositoryNames</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repositories to be described. If you do not specify a
  /// registry, the default registry is assumed.
  ///
  /// Parameter [repositoryNames] :
  /// A list of repositories to describe. If this parameter is omitted, then all
  /// repositories in a registry are described.
  Future<DescribeRepositoriesResponse> describeRepositories({
    int? maxResults,
    String? nextToken,
    String? registryId,
    List<String>? repositoryNames,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DescribeRepositories'
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
        if (registryId != null) 'registryId': registryId,
        if (repositoryNames != null) 'repositoryNames': repositoryNames,
      },
    );

    return DescribeRepositoriesResponse.fromJson(jsonResponse.body);
  }

  /// Returns details about the repository creation templates in a registry. The
  /// <code>prefixes</code> request parameter can be used to return the details
  /// for a specific repository creation template.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results returned by
  /// <code>DescribeRepositoryCreationTemplatesRequest</code> in paginated
  /// output. When this parameter is used,
  /// <code>DescribeRepositoryCreationTemplatesRequest</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeRepositoryCreationTemplatesRequest</code> request with the
  /// returned <code>nextToken</code> value. This value can be between 1 and
  /// 1000. If this parameter is not used, then
  /// <code>DescribeRepositoryCreationTemplatesRequest</code> returns up to 100
  /// results and a <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeRepositoryCreationTemplates</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is
  /// <code>null</code> when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [prefixes] :
  /// The repository namespace prefixes associated with the repository creation
  /// templates to describe. If this value is not specified, all repository
  /// creation templates are returned.
  Future<DescribeRepositoryCreationTemplatesResponse>
      describeRepositoryCreationTemplates({
    int? maxResults,
    String? nextToken,
    List<String>? prefixes,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.DescribeRepositoryCreationTemplates'
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
        if (prefixes != null) 'prefixes': prefixes,
      },
    );

    return DescribeRepositoryCreationTemplatesResponse.fromJson(
        jsonResponse.body);
  }

  /// Retrieves the account setting value for the specified setting name.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the account setting, such as
  /// <code>BASIC_SCAN_TYPE_VERSION</code>, <code>REGISTRY_POLICY_SCOPE</code>,
  /// or <code>BLOB_MOUNTING</code>.
  Future<GetAccountSettingResponse> getAccountSetting({
    required String name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.GetAccountSetting'
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

    return GetAccountSettingResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves an authorization token. An authorization token represents your
  /// IAM authentication credentials and can be used to access any Amazon ECR
  /// registry that your IAM principal has access to. The authorization token is
  /// valid for 12 hours.
  ///
  /// The <code>authorizationToken</code> returned is a base64 encoded string
  /// that can be decoded and used in a <code>docker login</code> command to
  /// authenticate to a registry. The CLI offers an
  /// <code>get-login-password</code> command that simplifies the login process.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth">Registry
  /// authentication</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  ///
  /// Parameter [registryIds] :
  /// A list of Amazon Web Services account IDs that are associated with the
  /// registries for which to get AuthorizationData objects. If you do not
  /// specify a registry, the default registry is assumed.
  Future<GetAuthorizationTokenResponse> getAuthorizationToken({
    List<String>? registryIds,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.GetAuthorizationToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (registryIds != null) 'registryIds': registryIds,
      },
    );

    return GetAuthorizationTokenResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the pre-signed Amazon S3 download URL corresponding to an image
  /// layer. You can only get URLs for image layers that are referenced in an
  /// image.
  ///
  /// When an image is pulled, the GetDownloadUrlForLayer API is called once per
  /// image layer that is not already cached.
  /// <note>
  /// This operation is used by the Amazon ECR proxy and is not generally used
  /// by customers for pulling and pushing images. In most cases, you should use
  /// the <code>docker</code> CLI to pull, tag, and push images.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LayerInaccessibleException].
  /// May throw [LayersNotFoundException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [UnableToGetUpstreamLayerException].
  ///
  /// Parameter [layerDigest] :
  /// The digest of the image layer to download.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that is associated with the image layer to
  /// download.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the image layer to download. If you do not specify a registry,
  /// the default registry is assumed.
  Future<GetDownloadUrlForLayerResponse> getDownloadUrlForLayer({
    required String layerDigest,
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.GetDownloadUrlForLayer'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'layerDigest': layerDigest,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return GetDownloadUrlForLayerResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the lifecycle policy for the specified repository.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LifecyclePolicyNotFoundException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  Future<GetLifecyclePolicyResponse> getLifecyclePolicy({
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.GetLifecyclePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return GetLifecyclePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the results of the lifecycle policy preview request for the
  /// specified repository.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LifecyclePolicyPreviewNotFoundException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository.
  ///
  /// Parameter [filter] :
  /// An optional parameter that filters results based on image tag status and
  /// all tags, if tagged.
  ///
  /// Parameter [imageIds] :
  /// The list of imageIDs to be included.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results returned by
  /// <code>GetLifecyclePolicyPreviewRequest</code> in paginated output. When
  /// this parameter is used, <code>GetLifecyclePolicyPreviewRequest</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>GetLifecyclePolicyPreviewRequest</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>GetLifecyclePolicyPreviewRequest</code>
  /// returns up to 100 results and a <code>nextToken</code> value, if
  /// applicable. This option cannot be used when you specify images with
  /// <code>imageIds</code>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>GetLifecyclePolicyPreviewRequest</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is
  /// <code>null</code> when there are no more results to return. This option
  /// cannot be used when you specify images with <code>imageIds</code>.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  Future<GetLifecyclePolicyPreviewResponse> getLifecyclePolicyPreview({
    required String repositoryName,
    LifecyclePolicyPreviewFilter? filter,
    List<ImageIdentifier>? imageIds,
    int? maxResults,
    String? nextToken,
    String? registryId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.GetLifecyclePolicyPreview'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (filter != null) 'filter': filter,
        if (imageIds != null) 'imageIds': imageIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return GetLifecyclePolicyPreviewResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the permissions policy for a registry.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RegistryPolicyNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  Future<GetRegistryPolicyResponse> getRegistryPolicy() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.GetRegistryPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetRegistryPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the scanning configuration for a registry.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  Future<GetRegistryScanningConfigurationResponse>
      getRegistryScanningConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.GetRegistryScanningConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetRegistryScanningConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the repository policy for the specified repository.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [RepositoryPolicyNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository with the policy to retrieve.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  Future<GetRepositoryPolicyResponse> getRepositoryPolicy({
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.GetRepositoryPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return GetRepositoryPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the registry's signing configuration, which defines rules for
  /// automatically signing images using Amazon Web Services Signer.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/managed-signing.html">Managed
  /// signing</a> in the <i>Amazon Elastic Container Registry User Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [SigningConfigurationNotFoundException].
  /// May throw [ValidationException].
  Future<GetSigningConfigurationResponse> getSigningConfiguration() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.GetSigningConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetSigningConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Notifies Amazon ECR that you intend to upload an image layer.
  ///
  /// When an image is pushed, the InitiateLayerUpload API is called once per
  /// image layer that has not already been uploaded. Whether or not an image
  /// layer has been uploaded is determined by the BatchCheckLayerAvailability
  /// API action.
  /// <note>
  /// This operation is used by the Amazon ECR proxy and is not generally used
  /// by customers for pulling and pushing images. In most cases, you should use
  /// the <code>docker</code> CLI to pull, tag, and push images.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [KmsException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to which you intend to upload layers.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry to which
  /// you intend to upload layers. If you do not specify a registry, the default
  /// registry is assumed.
  Future<InitiateLayerUploadResponse> initiateLayerUpload({
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.InitiateLayerUpload'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return InitiateLayerUploadResponse.fromJson(jsonResponse.body);
  }

  /// Lists the artifacts associated with a specified subject image.
  /// <note>
  /// The IAM principal invoking this operation must have the
  /// <code>ecr:BatchGetImage</code> permission.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [UnableToListUpstreamImageReferrersException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the subject image.
  ///
  /// Parameter [subjectId] :
  /// An object containing the image digest of the subject image for which to
  /// retrieve associated artifacts.
  ///
  /// Parameter [filter] :
  /// The filter key and value with which to filter your
  /// <code>ListImageReferrers</code> results. If no filter is specified, only
  /// artifacts with <code>ACTIVE</code> status are returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of image referrer results returned by
  /// <code>ListImageReferrers</code> in paginated output. When this parameter
  /// is used, <code>ListImageReferrers</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListImageReferrers</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 50. If this
  /// parameter is not used, then <code>ListImageReferrers</code> returns up to
  /// 20 results and a <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListImageReferrers</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository in which to list image referrers. If you do not
  /// specify a registry, the default registry is assumed.
  Future<ListImageReferrersResponse> listImageReferrers({
    required String repositoryName,
    required SubjectIdentifier subjectId,
    ListImageReferrersFilter? filter,
    int? maxResults,
    String? nextToken,
    String? registryId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.ListImageReferrers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        'subjectId': subjectId,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return ListImageReferrersResponse.fromJson(jsonResponse.body);
  }

  /// Lists all the image IDs for the specified repository.
  ///
  /// You can filter images based on whether or not they are tagged by using the
  /// <code>tagStatus</code> filter and specifying either <code>TAGGED</code>,
  /// <code>UNTAGGED</code> or <code>ANY</code>. For example, you can filter
  /// your results to return only <code>UNTAGGED</code> images and then pipe
  /// that result to a <a>BatchDeleteImage</a> operation to delete them. Or, you
  /// can filter your results to return only <code>TAGGED</code> images to list
  /// all of the tags in your repository.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [repositoryName] :
  /// The repository with image IDs to be listed.
  ///
  /// Parameter [filter] :
  /// The filter key and value with which to filter your <code>ListImages</code>
  /// results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of image results returned by <code>ListImages</code> in
  /// paginated output. When this parameter is used, <code>ListImages</code>
  /// only returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another <code>ListImages</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 1000. If this parameter is not used, then
  /// <code>ListImages</code> returns up to 100 results and a
  /// <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListImages</code> request where <code>maxResults</code> was used and
  /// the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository in which to list images. If you do not specify a
  /// registry, the default registry is assumed.
  Future<ListImagesResponse> listImages({
    required String repositoryName,
    ListImagesFilter? filter,
    int? maxResults,
    String? nextToken,
    String? registryId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.ListImages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return ListImagesResponse.fromJson(jsonResponse.body);
  }

  /// Lists the IAM principals that are excluded from having their image pull
  /// times recorded.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of pull time update exclusion results returned by
  /// <code>ListPullTimeUpdateExclusions</code> in paginated output. When this
  /// parameter is used, <code>ListPullTimeUpdateExclusions</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListPullTimeUpdateExclusions</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter is not used, then <code>ListPullTimeUpdateExclusions</code>
  /// returns up to 100 results and a <code>nextToken</code> value, if
  /// applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListPullTimeUpdateExclusions</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value. This value is
  /// <code>null</code> when there are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListPullTimeUpdateExclusionsResponse> listPullTimeUpdateExclusions({
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
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.ListPullTimeUpdateExclusions'
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

    return ListPullTimeUpdateExclusionsResponse.fromJson(jsonResponse.body);
  }

  /// List the tags for an Amazon ECR resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource for which to
  /// list the tags. Currently, the only supported resource is an Amazon ECR
  /// repository.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Allows you to change the basic scan type version or registry policy scope.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the account setting, such as
  /// <code>BASIC_SCAN_TYPE_VERSION</code>, <code>REGISTRY_POLICY_SCOPE</code>,
  /// or <code>BLOB_MOUNTING</code>.
  ///
  /// Parameter [value] :
  /// Setting value that is specified. Valid value for basic scan type:
  /// <code>AWS_NATIVE</code>. Valid values for registry policy scope:
  /// <code>V2</code>. Valid values for blob mounting: <code>ENABLED</code> or
  /// <code>DISABLED</code>.
  Future<PutAccountSettingResponse> putAccountSetting({
    required String name,
    required String value,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.PutAccountSetting'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'name': name,
        'value': value,
      },
    );

    return PutAccountSettingResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the image manifest and tags associated with an image.
  ///
  /// When an image is pushed and all new image layers have been uploaded, the
  /// PutImage API is called once to create or update the image manifest and the
  /// tags associated with the image.
  /// <note>
  /// This operation is used by the Amazon ECR proxy and is not generally used
  /// by customers for pulling and pushing images. In most cases, you should use
  /// the <code>docker</code> CLI to pull, tag, and push images.
  /// </note>
  ///
  /// May throw [ImageAlreadyExistsException].
  /// May throw [ImageDigestDoesNotMatchException].
  /// May throw [ImageTagAlreadyExistsException].
  /// May throw [InvalidParameterException].
  /// May throw [KmsException].
  /// May throw [LayersNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ReferencedImagesNotFoundException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [imageManifest] :
  /// The image manifest corresponding to the image to be uploaded.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository in which to put the image.
  ///
  /// Parameter [imageDigest] :
  /// The image digest of the image manifest corresponding to the image.
  ///
  /// Parameter [imageManifestMediaType] :
  /// The media type of the image manifest. If you push an image manifest that
  /// does not contain the <code>mediaType</code> field, you must specify the
  /// <code>imageManifestMediaType</code> in the request.
  ///
  /// Parameter [imageTag] :
  /// The tag to associate with the image. This parameter is optional.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository in which to put the image. If you do not specify a
  /// registry, the default registry is assumed.
  Future<PutImageResponse> putImage({
    required String imageManifest,
    required String repositoryName,
    String? imageDigest,
    String? imageManifestMediaType,
    String? imageTag,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.PutImage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageManifest': imageManifest,
        'repositoryName': repositoryName,
        if (imageDigest != null) 'imageDigest': imageDigest,
        if (imageManifestMediaType != null)
          'imageManifestMediaType': imageManifestMediaType,
        if (imageTag != null) 'imageTag': imageTag,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return PutImageResponse.fromJson(jsonResponse.body);
  }

  /// <important>
  /// The <code>PutImageScanningConfiguration</code> API is being deprecated, in
  /// favor of specifying the image scanning configuration at the registry
  /// level. For more information, see <a>PutRegistryScanningConfiguration</a>.
  /// </important>
  /// Updates the image scanning configuration for the specified repository.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [imageScanningConfiguration] :
  /// The image scanning configuration for the repository. This setting
  /// determines whether images are scanned for known vulnerabilities after
  /// being pushed to the repository.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository in which to update the image scanning
  /// configuration setting.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository in which to update the image scanning
  /// configuration setting. If you do not specify a registry, the default
  /// registry is assumed.
  Future<PutImageScanningConfigurationResponse> putImageScanningConfiguration({
    required ImageScanningConfiguration imageScanningConfiguration,
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.PutImageScanningConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageScanningConfiguration': imageScanningConfiguration,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return PutImageScanningConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Updates the image tag mutability settings for the specified repository.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-tag-mutability.html">Image
  /// tag mutability</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [imageTagMutability] :
  /// The tag mutability setting for the repository. If <code>MUTABLE</code> is
  /// specified, image tags can be overwritten. If <code>IMMUTABLE</code> is
  /// specified, all image tags within the repository will be immutable which
  /// will prevent them from being overwritten.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository in which to update the image tag mutability
  /// settings.
  ///
  /// Parameter [imageTagMutabilityExclusionFilters] :
  /// A list of filters that specify which image tags should be excluded from
  /// the image tag mutability setting being applied.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository in which to update the image tag mutability
  /// settings. If you do not specify a registry, the default registry is
  /// assumed.
  Future<PutImageTagMutabilityResponse> putImageTagMutability({
    required ImageTagMutability imageTagMutability,
    required String repositoryName,
    List<ImageTagMutabilityExclusionFilter>? imageTagMutabilityExclusionFilters,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.PutImageTagMutability'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageTagMutability': imageTagMutability.value,
        'repositoryName': repositoryName,
        if (imageTagMutabilityExclusionFilters != null)
          'imageTagMutabilityExclusionFilters':
              imageTagMutabilityExclusionFilters,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return PutImageTagMutabilityResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the lifecycle policy for the specified repository. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html">Lifecycle
  /// policy template</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lifecyclePolicyText] :
  /// The JSON repository policy text to apply to the repository.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to receive the policy.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  Future<PutLifecyclePolicyResponse> putLifecyclePolicy({
    required String lifecyclePolicyText,
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.PutLifecyclePolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'lifecyclePolicyText': lifecyclePolicyText,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return PutLifecyclePolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the permissions policy for your registry.
  ///
  /// A registry policy is used to specify permissions for another Amazon Web
  /// Services account and is used when configuring cross-account replication.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry-permissions.html">Registry
  /// permissions</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [policyText] :
  /// The JSON policy text to apply to your registry. The policy text follows
  /// the same format as IAM policy text. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry-permissions.html">Registry
  /// permissions</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  Future<PutRegistryPolicyResponse> putRegistryPolicy({
    required String policyText,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.PutRegistryPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyText': policyText,
      },
    );

    return PutRegistryPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the scanning configuration for your private registry.
  ///
  /// May throw [BlockedByOrganizationPolicyException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [rules] :
  /// The scanning rules to use for the registry. A scanning rule is used to
  /// determine which repository filters are used and at what frequency scanning
  /// will occur.
  ///
  /// Parameter [scanType] :
  /// The scanning type to set for the registry.
  ///
  /// When a registry scanning configuration is not defined, by default the
  /// <code>BASIC</code> scan type is used. When basic scanning is used, you may
  /// specify filters to determine which individual repositories, or all
  /// repositories, are scanned when new images are pushed to those
  /// repositories. Alternatively, you can do manual scans of images with basic
  /// scanning.
  ///
  /// When the <code>ENHANCED</code> scan type is set, Amazon Inspector provides
  /// automated vulnerability scanning. You may choose between continuous
  /// scanning or scan on push and you may specify filters to determine which
  /// individual repositories, or all repositories, are scanned.
  Future<PutRegistryScanningConfigurationResponse>
      putRegistryScanningConfiguration({
    List<RegistryScanningRule>? rules,
    ScanType? scanType,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.PutRegistryScanningConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (rules != null) 'rules': rules,
        if (scanType != null) 'scanType': scanType.value,
      },
    );

    return PutRegistryScanningConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the replication configuration for a registry. The
  /// existing replication configuration for a repository can be retrieved with
  /// the <a>DescribeRegistry</a> API action. The first time the
  /// PutReplicationConfiguration API is called, a service-linked IAM role is
  /// created in your account for the replication process. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/using-service-linked-roles.html">Using
  /// service-linked roles for Amazon ECR</a> in the <i>Amazon Elastic Container
  /// Registry User Guide</i>. For more information on the custom role for
  /// replication, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/replication-creation-templates.html#roles-creatingrole-user-console">Creating
  /// an IAM role for replication</a>.
  /// <note>
  /// When configuring cross-account replication, the destination account must
  /// grant the source account permission to replicate. This permission is
  /// controlled using a registry permissions policy. For more information, see
  /// <a>PutRegistryPolicy</a>.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [replicationConfiguration] :
  /// An object representing the replication configuration for a registry.
  Future<PutReplicationConfigurationResponse> putReplicationConfiguration({
    required ReplicationConfiguration replicationConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.PutReplicationConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'replicationConfiguration': replicationConfiguration,
      },
    );

    return PutReplicationConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the registry's signing configuration, which defines
  /// rules for automatically signing images with Amazon Web Services Signer.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/managed-signing.html">Managed
  /// signing</a> in the <i>Amazon Elastic Container Registry User Guide</i>.
  /// <note>
  /// To successfully generate a signature, the IAM principal pushing images
  /// must have permission to sign payloads with the Amazon Web Services Signer
  /// signing profile referenced in the signing configuration.
  /// </note>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [signingConfiguration] :
  /// The signing configuration to assign to the registry.
  Future<PutSigningConfigurationResponse> putSigningConfiguration({
    required SigningConfiguration signingConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.PutSigningConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'signingConfiguration': signingConfiguration,
      },
    );

    return PutSigningConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Adds an IAM principal to the pull time update exclusion list for a
  /// registry. Amazon ECR will not record the pull time if an excluded
  /// principal pulls an image.
  ///
  /// May throw [ExclusionAlreadyExistsException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [principalArn] :
  /// The ARN of the IAM principal to exclude from having image pull times
  /// recorded.
  Future<RegisterPullTimeUpdateExclusionResponse>
      registerPullTimeUpdateExclusion({
    required String principalArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.RegisterPullTimeUpdateExclusion'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'principalArn': principalArn,
      },
    );

    return RegisterPullTimeUpdateExclusionResponse.fromJson(jsonResponse.body);
  }

  /// Applies a repository policy to the specified repository to control access
  /// permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html">Amazon
  /// ECR Repository policies</a> in the <i>Amazon Elastic Container Registry
  /// User Guide</i>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [policyText] :
  /// The JSON repository policy text to apply to the repository. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policy-examples.html">Amazon
  /// ECR repository policies</a> in the <i>Amazon Elastic Container Registry
  /// User Guide</i>.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to receive the policy.
  ///
  /// Parameter [force] :
  /// If the policy you are attempting to set on a repository policy would
  /// prevent you from setting another policy in the future, you must force the
  /// <a>SetRepositoryPolicy</a> operation. This is intended to prevent
  /// accidental repository lock outs.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  Future<SetRepositoryPolicyResponse> setRepositoryPolicy({
    required String policyText,
    required String repositoryName,
    bool? force,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.SetRepositoryPolicy'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'policyText': policyText,
        'repositoryName': repositoryName,
        if (force != null) 'force': force,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return SetRepositoryPolicyResponse.fromJson(jsonResponse.body);
  }

  /// Starts a basic image vulnerability scan.
  ///
  /// A basic image scan can only be started once per 24 hours on an individual
  /// image. This limit includes if an image was scanned on initial push. You
  /// can start up to 100,000 basic scans per 24 hours. This limit includes both
  /// scans on initial push and scans initiated by the StartImageScan API. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning-basic.html">Basic
  /// scanning</a> in the <i>Amazon Elastic Container Registry User Guide</i>.
  ///
  /// May throw [ImageArchivedException].
  /// May throw [ImageNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [UnsupportedImageTypeException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the images to scan.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository in which to start an image scan request. If you do
  /// not specify a registry, the default registry is assumed.
  Future<StartImageScanResponse> startImageScan({
    required ImageIdentifier imageId,
    required String repositoryName,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.StartImageScan'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageId': imageId,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return StartImageScanResponse.fromJson(jsonResponse.body);
  }

  /// Starts a preview of a lifecycle policy for the specified repository. This
  /// allows you to see the results before associating the lifecycle policy with
  /// the repository.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LifecyclePolicyNotFoundException].
  /// May throw [LifecyclePolicyPreviewInProgressException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to be evaluated.
  ///
  /// Parameter [lifecyclePolicyText] :
  /// The policy to be evaluated against. If you do not specify a policy, the
  /// current policy for the repository is used.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository. If you do not specify a registry, the default
  /// registry is assumed.
  Future<StartLifecyclePolicyPreviewResponse> startLifecyclePolicyPreview({
    required String repositoryName,
    String? lifecyclePolicyText,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.StartLifecyclePolicyPreview'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (lifecyclePolicyText != null)
          'lifecyclePolicyText': lifecyclePolicyText,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return StartLifecyclePolicyPreviewResponse.fromJson(jsonResponse.body);
  }

  /// Adds specified tags to a resource with the specified ARN. Existing tags on
  /// a resource are not changed if they are not specified in the request
  /// parameters.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the the resource to which to add tags.
  /// Currently, the only supported resource is an Amazon ECR repository.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is an array of key-value pairs. Tag
  /// keys can have a maximum character length of 128 characters, and tag values
  /// can have a maximum length of 256 characters.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.TagResource'
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

  /// Deletes specified tags from a resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to remove tags.
  /// Currently, the only supported resource is an Amazon ECR repository.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.UntagResource'
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

  /// Transitions an image between storage classes. You can transition images
  /// from Amazon ECR standard storage class to Amazon ECR archival storage
  /// class for long-term storage, or restore archived images back to Amazon ECR
  /// standard.
  ///
  /// May throw [ImageNotFoundException].
  /// May throw [ImageStorageClassUpdateNotSupportedException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the image to transition.
  ///
  /// Parameter [targetStorageClass] :
  /// The target storage class for the image.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry that
  /// contains the image to transition. If you do not specify a registry, the
  /// default registry is assumed.
  Future<UpdateImageStorageClassResponse> updateImageStorageClass({
    required ImageIdentifier imageId,
    required String repositoryName,
    required TargetStorageClass targetStorageClass,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.UpdateImageStorageClass'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'imageId': imageId,
        'repositoryName': repositoryName,
        'targetStorageClass': targetStorageClass.value,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return UpdateImageStorageClassResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing pull through cache rule.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [PullThroughCacheRuleNotFoundException].
  /// May throw [SecretNotFoundException].
  /// May throw [ServerException].
  /// May throw [UnableToAccessSecretException].
  /// May throw [UnableToDecryptSecretValueException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ecrRepositoryPrefix] :
  /// The repository name prefix to use when caching images from the source
  /// registry.
  ///
  /// Parameter [credentialArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret that identifies the credentials to authenticate to the upstream
  /// registry.
  ///
  /// Parameter [customRoleArn] :
  /// Amazon Resource Name (ARN) of the IAM role to be assumed by Amazon ECR to
  /// authenticate to the ECR upstream registry. This role must be in the same
  /// account as the registry that you are configuring.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry associated
  /// with the pull through cache rule. If you do not specify a registry, the
  /// default registry is assumed.
  Future<UpdatePullThroughCacheRuleResponse> updatePullThroughCacheRule({
    required String ecrRepositoryPrefix,
    String? credentialArn,
    String? customRoleArn,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.UpdatePullThroughCacheRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
        if (credentialArn != null) 'credentialArn': credentialArn,
        if (customRoleArn != null) 'customRoleArn': customRoleArn,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return UpdatePullThroughCacheRuleResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing repository creation template.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [TemplateNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [prefix] :
  /// The repository namespace prefix that matches an existing repository
  /// creation template in the registry. All repositories created using this
  /// namespace prefix will have the settings defined in this template applied.
  /// For example, a prefix of <code>prod</code> would apply to all repositories
  /// beginning with <code>prod/</code>. This includes a repository named
  /// <code>prod/team1</code> as well as a repository named
  /// <code>prod/repository1</code>.
  ///
  /// To apply a template to all repositories in your registry that don't have
  /// an associated creation template, you can use <code>ROOT</code> as the
  /// prefix.
  ///
  /// Parameter [appliedFor] :
  /// Updates the list of enumerable strings representing the Amazon ECR
  /// repository creation scenarios that this template will apply towards. The
  /// supported scenarios are <code>PULL_THROUGH_CACHE</code>,
  /// <code>REPLICATION</code>, and <code>CREATE_ON_PUSH</code>
  ///
  /// Parameter [customRoleArn] :
  /// The ARN of the role to be assumed by Amazon ECR. This role must be in the
  /// same account as the registry that you are configuring. Amazon ECR will
  /// assume your supplied role when the customRoleArn is specified. When this
  /// field isn't specified, Amazon ECR will use the service-linked role for the
  /// repository creation template.
  ///
  /// Parameter [description] :
  /// A description for the repository creation template.
  ///
  /// Parameter [imageTagMutability] :
  /// Updates the tag mutability setting for the repository. If this parameter
  /// is omitted, the default setting of <code>MUTABLE</code> will be used which
  /// will allow image tags to be overwritten. If <code>IMMUTABLE</code> is
  /// specified, all image tags within the repository will be immutable which
  /// will prevent them from being overwritten.
  ///
  /// Parameter [imageTagMutabilityExclusionFilters] :
  /// A list of filters that specify which image tags should be excluded from
  /// the repository creation template's image tag mutability setting.
  ///
  /// Parameter [lifecyclePolicy] :
  /// Updates the lifecycle policy associated with the specified repository
  /// creation template.
  ///
  /// Parameter [repositoryPolicy] :
  /// Updates the repository policy created using the template. A repository
  /// policy is a permissions policy associated with a repository to control
  /// access permissions.
  ///
  /// Parameter [resourceTags] :
  /// The metadata to apply to the repository to help you categorize and
  /// organize. Each tag consists of a key and an optional value, both of which
  /// you define. Tag keys can have a maximum character length of 128
  /// characters, and tag values can have a maximum length of 256 characters.
  Future<UpdateRepositoryCreationTemplateResponse>
      updateRepositoryCreationTemplate({
    required String prefix,
    List<RCTAppliedFor>? appliedFor,
    String? customRoleArn,
    String? description,
    EncryptionConfigurationForRepositoryCreationTemplate?
        encryptionConfiguration,
    ImageTagMutability? imageTagMutability,
    List<ImageTagMutabilityExclusionFilter>? imageTagMutabilityExclusionFilters,
    String? lifecyclePolicy,
    String? repositoryPolicy,
    List<Tag>? resourceTags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.UpdateRepositoryCreationTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'prefix': prefix,
        if (appliedFor != null)
          'appliedFor': appliedFor.map((e) => e.value).toList(),
        if (customRoleArn != null) 'customRoleArn': customRoleArn,
        if (description != null) 'description': description,
        if (encryptionConfiguration != null)
          'encryptionConfiguration': encryptionConfiguration,
        if (imageTagMutability != null)
          'imageTagMutability': imageTagMutability.value,
        if (imageTagMutabilityExclusionFilters != null)
          'imageTagMutabilityExclusionFilters':
              imageTagMutabilityExclusionFilters,
        if (lifecyclePolicy != null) 'lifecyclePolicy': lifecyclePolicy,
        if (repositoryPolicy != null) 'repositoryPolicy': repositoryPolicy,
        if (resourceTags != null) 'resourceTags': resourceTags,
      },
    );

    return UpdateRepositoryCreationTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Uploads an image layer part to Amazon ECR.
  ///
  /// When an image is pushed, each new image layer is uploaded in parts. The
  /// maximum size of each image layer part can be 20971520 bytes (or about
  /// 20MB). The UploadLayerPart API is called once per each new image layer
  /// part.
  /// <note>
  /// This operation is used by the Amazon ECR proxy and is not generally used
  /// by customers for pulling and pushing images. In most cases, you should use
  /// the <code>docker</code> CLI to pull, tag, and push images.
  /// </note>
  ///
  /// May throw [InvalidLayerPartException].
  /// May throw [InvalidParameterException].
  /// May throw [KmsException].
  /// May throw [LimitExceededException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  /// May throw [UploadNotFoundException].
  ///
  /// Parameter [layerPartBlob] :
  /// The base64-encoded layer part payload.
  ///
  /// Parameter [partFirstByte] :
  /// The position of the first byte of the layer part witin the overall image
  /// layer.
  ///
  /// Parameter [partLastByte] :
  /// The position of the last byte of the layer part within the overall image
  /// layer.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to which you are uploading layer parts.
  ///
  /// Parameter [uploadId] :
  /// The upload ID from a previous <a>InitiateLayerUpload</a> operation to
  /// associate with the layer part upload.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID associated with the registry to which
  /// you are uploading layer parts. If you do not specify a registry, the
  /// default registry is assumed.
  Future<UploadLayerPartResponse> uploadLayerPart({
    required Uint8List layerPartBlob,
    required int partFirstByte,
    required int partLastByte,
    required String repositoryName,
    required String uploadId,
    String? registryId,
  }) async {
    _s.validateNumRange(
      'partFirstByte',
      partFirstByte,
      0,
      1152921504606846976,
      isRequired: true,
    );
    _s.validateNumRange(
      'partLastByte',
      partLastByte,
      0,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.UploadLayerPart'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'layerPartBlob': base64Encode(layerPartBlob),
        'partFirstByte': partFirstByte,
        'partLastByte': partLastByte,
        'repositoryName': repositoryName,
        'uploadId': uploadId,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return UploadLayerPartResponse.fromJson(jsonResponse.body);
  }

  /// Validates an existing pull through cache rule for an upstream registry
  /// that requires authentication. This will retrieve the contents of the
  /// Amazon Web Services Secrets Manager secret, verify the syntax, and then
  /// validate that authentication to the upstream registry is successful.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [PullThroughCacheRuleNotFoundException].
  /// May throw [ServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ecrRepositoryPrefix] :
  /// The repository name prefix associated with the pull through cache rule.
  ///
  /// Parameter [registryId] :
  /// The registry ID associated with the pull through cache rule. If you do not
  /// specify a registry, the default registry is assumed.
  Future<ValidatePullThroughCacheRuleResponse> validatePullThroughCacheRule({
    required String ecrRepositoryPrefix,
    String? registryId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AmazonEC2ContainerRegistry_V20150921.ValidatePullThroughCacheRule'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return ValidatePullThroughCacheRuleResponse.fromJson(jsonResponse.body);
  }
}

/// @nodoc
class BatchCheckLayerAvailabilityResponse {
  /// Any failures associated with the call.
  final List<LayerFailure>? failures;

  /// A list of image layer objects corresponding to the image layer references in
  /// the request.
  final List<Layer>? layers;

  BatchCheckLayerAvailabilityResponse({
    this.failures,
    this.layers,
  });

  factory BatchCheckLayerAvailabilityResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCheckLayerAvailabilityResponse(
      failures: (json['failures'] as List?)
          ?.nonNulls
          .map((e) => LayerFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
      layers: (json['layers'] as List?)
          ?.nonNulls
          .map((e) => Layer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final layers = this.layers;
    return {
      if (failures != null) 'failures': failures,
      if (layers != null) 'layers': layers,
    };
  }
}

/// @nodoc
class BatchDeleteImageResponse {
  /// Any failures associated with the call.
  final List<ImageFailure>? failures;

  /// The image IDs of the deleted images.
  final List<ImageIdentifier>? imageIds;

  BatchDeleteImageResponse({
    this.failures,
    this.imageIds,
  });

  factory BatchDeleteImageResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteImageResponse(
      failures: (json['failures'] as List?)
          ?.nonNulls
          .map((e) => ImageFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageIds: (json['imageIds'] as List?)
          ?.nonNulls
          .map((e) => ImageIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final imageIds = this.imageIds;
    return {
      if (failures != null) 'failures': failures,
      if (imageIds != null) 'imageIds': imageIds,
    };
  }
}

/// @nodoc
class BatchGetImageResponse {
  /// Any failures associated with the call.
  final List<ImageFailure>? failures;

  /// A list of image objects corresponding to the image references in the
  /// request.
  final List<Image>? images;

  BatchGetImageResponse({
    this.failures,
    this.images,
  });

  factory BatchGetImageResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetImageResponse(
      failures: (json['failures'] as List?)
          ?.nonNulls
          .map((e) => ImageFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
      images: (json['images'] as List?)
          ?.nonNulls
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final images = this.images;
    return {
      if (failures != null) 'failures': failures,
      if (images != null) 'images': images,
    };
  }
}

/// @nodoc
class BatchGetRepositoryScanningConfigurationResponse {
  /// Any failures associated with the call.
  final List<RepositoryScanningConfigurationFailure>? failures;

  /// The scanning configuration for the requested repositories.
  final List<RepositoryScanningConfiguration>? scanningConfigurations;

  BatchGetRepositoryScanningConfigurationResponse({
    this.failures,
    this.scanningConfigurations,
  });

  factory BatchGetRepositoryScanningConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetRepositoryScanningConfigurationResponse(
      failures: (json['failures'] as List?)
          ?.nonNulls
          .map((e) => RepositoryScanningConfigurationFailure.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      scanningConfigurations: (json['scanningConfigurations'] as List?)
          ?.nonNulls
          .map((e) => RepositoryScanningConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final scanningConfigurations = this.scanningConfigurations;
    return {
      if (failures != null) 'failures': failures,
      if (scanningConfigurations != null)
        'scanningConfigurations': scanningConfigurations,
    };
  }
}

/// @nodoc
class CompleteLayerUploadResponse {
  /// The <code>sha256</code> digest of the image layer.
  final String? layerDigest;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  /// The upload ID associated with the layer.
  final String? uploadId;

  CompleteLayerUploadResponse({
    this.layerDigest,
    this.registryId,
    this.repositoryName,
    this.uploadId,
  });

  factory CompleteLayerUploadResponse.fromJson(Map<String, dynamic> json) {
    return CompleteLayerUploadResponse(
      layerDigest: json['layerDigest'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
      uploadId: json['uploadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final layerDigest = this.layerDigest;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    final uploadId = this.uploadId;
    return {
      if (layerDigest != null) 'layerDigest': layerDigest,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (uploadId != null) 'uploadId': uploadId,
    };
  }
}

/// @nodoc
class CreatePullThroughCacheRuleResponse {
  /// The date and time, in JavaScript date format, when the pull through cache
  /// rule was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret associated with the pull through cache rule.
  final String? credentialArn;

  /// The ARN of the IAM role associated with the pull through cache rule.
  final String? customRoleArn;

  /// The Amazon ECR repository prefix associated with the pull through cache
  /// rule.
  final String? ecrRepositoryPrefix;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The name of the upstream registry associated with the pull through cache
  /// rule.
  final UpstreamRegistry? upstreamRegistry;

  /// The upstream registry URL associated with the pull through cache rule.
  final String? upstreamRegistryUrl;

  /// The upstream repository prefix associated with the pull through cache rule.
  final String? upstreamRepositoryPrefix;

  CreatePullThroughCacheRuleResponse({
    this.createdAt,
    this.credentialArn,
    this.customRoleArn,
    this.ecrRepositoryPrefix,
    this.registryId,
    this.upstreamRegistry,
    this.upstreamRegistryUrl,
    this.upstreamRepositoryPrefix,
  });

  factory CreatePullThroughCacheRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePullThroughCacheRuleResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      credentialArn: json['credentialArn'] as String?,
      customRoleArn: json['customRoleArn'] as String?,
      ecrRepositoryPrefix: json['ecrRepositoryPrefix'] as String?,
      registryId: json['registryId'] as String?,
      upstreamRegistry: (json['upstreamRegistry'] as String?)
          ?.let(UpstreamRegistry.fromString),
      upstreamRegistryUrl: json['upstreamRegistryUrl'] as String?,
      upstreamRepositoryPrefix: json['upstreamRepositoryPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final credentialArn = this.credentialArn;
    final customRoleArn = this.customRoleArn;
    final ecrRepositoryPrefix = this.ecrRepositoryPrefix;
    final registryId = this.registryId;
    final upstreamRegistry = this.upstreamRegistry;
    final upstreamRegistryUrl = this.upstreamRegistryUrl;
    final upstreamRepositoryPrefix = this.upstreamRepositoryPrefix;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (credentialArn != null) 'credentialArn': credentialArn,
      if (customRoleArn != null) 'customRoleArn': customRoleArn,
      if (ecrRepositoryPrefix != null)
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
      if (registryId != null) 'registryId': registryId,
      if (upstreamRegistry != null) 'upstreamRegistry': upstreamRegistry.value,
      if (upstreamRegistryUrl != null)
        'upstreamRegistryUrl': upstreamRegistryUrl,
      if (upstreamRepositoryPrefix != null)
        'upstreamRepositoryPrefix': upstreamRepositoryPrefix,
    };
  }
}

/// @nodoc
class CreateRepositoryResponse {
  /// The repository that was created.
  final Repository? repository;

  CreateRepositoryResponse({
    this.repository,
  });

  factory CreateRepositoryResponse.fromJson(Map<String, dynamic> json) {
    return CreateRepositoryResponse(
      repository: json['repository'] != null
          ? Repository.fromJson(json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

/// @nodoc
class CreateRepositoryCreationTemplateResponse {
  /// The registry ID associated with the request.
  final String? registryId;

  /// The details of the repository creation template associated with the request.
  final RepositoryCreationTemplate? repositoryCreationTemplate;

  CreateRepositoryCreationTemplateResponse({
    this.registryId,
    this.repositoryCreationTemplate,
  });

  factory CreateRepositoryCreationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRepositoryCreationTemplateResponse(
      registryId: json['registryId'] as String?,
      repositoryCreationTemplate: json['repositoryCreationTemplate'] != null
          ? RepositoryCreationTemplate.fromJson(
              json['repositoryCreationTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryId = this.registryId;
    final repositoryCreationTemplate = this.repositoryCreationTemplate;
    return {
      if (registryId != null) 'registryId': registryId,
      if (repositoryCreationTemplate != null)
        'repositoryCreationTemplate': repositoryCreationTemplate,
    };
  }
}

/// @nodoc
class DeleteLifecyclePolicyResponse {
  /// The time stamp of the last time that the lifecycle policy was run.
  final DateTime? lastEvaluatedAt;

  /// The JSON lifecycle policy text.
  final String? lifecyclePolicyText;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  DeleteLifecyclePolicyResponse({
    this.lastEvaluatedAt,
    this.lifecyclePolicyText,
    this.registryId,
    this.repositoryName,
  });

  factory DeleteLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteLifecyclePolicyResponse(
      lastEvaluatedAt: timeStampFromJson(json['lastEvaluatedAt']),
      lifecyclePolicyText: json['lifecyclePolicyText'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastEvaluatedAt = this.lastEvaluatedAt;
    final lifecyclePolicyText = this.lifecyclePolicyText;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (lastEvaluatedAt != null)
        'lastEvaluatedAt': unixTimestampToJson(lastEvaluatedAt),
      if (lifecyclePolicyText != null)
        'lifecyclePolicyText': lifecyclePolicyText,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class DeletePullThroughCacheRuleResponse {
  /// The timestamp associated with the pull through cache rule.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret associated with the pull through cache rule.
  final String? credentialArn;

  /// The ARN of the IAM role associated with the pull through cache rule.
  final String? customRoleArn;

  /// The Amazon ECR repository prefix associated with the request.
  final String? ecrRepositoryPrefix;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The upstream registry URL associated with the pull through cache rule.
  final String? upstreamRegistryUrl;

  /// The upstream repository prefix associated with the pull through cache rule.
  final String? upstreamRepositoryPrefix;

  DeletePullThroughCacheRuleResponse({
    this.createdAt,
    this.credentialArn,
    this.customRoleArn,
    this.ecrRepositoryPrefix,
    this.registryId,
    this.upstreamRegistryUrl,
    this.upstreamRepositoryPrefix,
  });

  factory DeletePullThroughCacheRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return DeletePullThroughCacheRuleResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      credentialArn: json['credentialArn'] as String?,
      customRoleArn: json['customRoleArn'] as String?,
      ecrRepositoryPrefix: json['ecrRepositoryPrefix'] as String?,
      registryId: json['registryId'] as String?,
      upstreamRegistryUrl: json['upstreamRegistryUrl'] as String?,
      upstreamRepositoryPrefix: json['upstreamRepositoryPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final credentialArn = this.credentialArn;
    final customRoleArn = this.customRoleArn;
    final ecrRepositoryPrefix = this.ecrRepositoryPrefix;
    final registryId = this.registryId;
    final upstreamRegistryUrl = this.upstreamRegistryUrl;
    final upstreamRepositoryPrefix = this.upstreamRepositoryPrefix;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (credentialArn != null) 'credentialArn': credentialArn,
      if (customRoleArn != null) 'customRoleArn': customRoleArn,
      if (ecrRepositoryPrefix != null)
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
      if (registryId != null) 'registryId': registryId,
      if (upstreamRegistryUrl != null)
        'upstreamRegistryUrl': upstreamRegistryUrl,
      if (upstreamRepositoryPrefix != null)
        'upstreamRepositoryPrefix': upstreamRepositoryPrefix,
    };
  }
}

/// @nodoc
class DeleteRegistryPolicyResponse {
  /// The contents of the registry permissions policy that was deleted.
  final String? policyText;

  /// The registry ID associated with the request.
  final String? registryId;

  DeleteRegistryPolicyResponse({
    this.policyText,
    this.registryId,
  });

  factory DeleteRegistryPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRegistryPolicyResponse(
      policyText: json['policyText'] as String?,
      registryId: json['registryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyText = this.policyText;
    final registryId = this.registryId;
    return {
      if (policyText != null) 'policyText': policyText,
      if (registryId != null) 'registryId': registryId,
    };
  }
}

/// @nodoc
class DeleteRepositoryResponse {
  /// The repository that was deleted.
  final Repository? repository;

  DeleteRepositoryResponse({
    this.repository,
  });

  factory DeleteRepositoryResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRepositoryResponse(
      repository: json['repository'] != null
          ? Repository.fromJson(json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final repository = this.repository;
    return {
      if (repository != null) 'repository': repository,
    };
  }
}

/// @nodoc
class DeleteRepositoryCreationTemplateResponse {
  /// The registry ID associated with the request.
  final String? registryId;

  /// The details of the repository creation template that was deleted.
  final RepositoryCreationTemplate? repositoryCreationTemplate;

  DeleteRepositoryCreationTemplateResponse({
    this.registryId,
    this.repositoryCreationTemplate,
  });

  factory DeleteRepositoryCreationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteRepositoryCreationTemplateResponse(
      registryId: json['registryId'] as String?,
      repositoryCreationTemplate: json['repositoryCreationTemplate'] != null
          ? RepositoryCreationTemplate.fromJson(
              json['repositoryCreationTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryId = this.registryId;
    final repositoryCreationTemplate = this.repositoryCreationTemplate;
    return {
      if (registryId != null) 'registryId': registryId,
      if (repositoryCreationTemplate != null)
        'repositoryCreationTemplate': repositoryCreationTemplate,
    };
  }
}

/// @nodoc
class DeleteRepositoryPolicyResponse {
  /// The JSON repository policy that was deleted from the repository.
  final String? policyText;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  DeleteRepositoryPolicyResponse({
    this.policyText,
    this.registryId,
    this.repositoryName,
  });

  factory DeleteRepositoryPolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteRepositoryPolicyResponse(
      policyText: json['policyText'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyText = this.policyText;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (policyText != null) 'policyText': policyText,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class DeleteSigningConfigurationResponse {
  /// The Amazon Web Services account ID associated with the registry.
  final String? registryId;

  /// The registry's deleted signing configuration.
  final SigningConfiguration? signingConfiguration;

  DeleteSigningConfigurationResponse({
    this.registryId,
    this.signingConfiguration,
  });

  factory DeleteSigningConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteSigningConfigurationResponse(
      registryId: json['registryId'] as String?,
      signingConfiguration: json['signingConfiguration'] != null
          ? SigningConfiguration.fromJson(
              json['signingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryId = this.registryId;
    final signingConfiguration = this.signingConfiguration;
    return {
      if (registryId != null) 'registryId': registryId,
      if (signingConfiguration != null)
        'signingConfiguration': signingConfiguration,
    };
  }
}

/// @nodoc
class DeregisterPullTimeUpdateExclusionResponse {
  /// The ARN of the IAM principal that was removed from the pull time update
  /// exclusion list.
  final String? principalArn;

  DeregisterPullTimeUpdateExclusionResponse({
    this.principalArn,
  });

  factory DeregisterPullTimeUpdateExclusionResponse.fromJson(
      Map<String, dynamic> json) {
    return DeregisterPullTimeUpdateExclusionResponse(
      principalArn: json['principalArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final principalArn = this.principalArn;
    return {
      if (principalArn != null) 'principalArn': principalArn,
    };
  }
}

/// @nodoc
class DescribeImageReplicationStatusResponse {
  final ImageIdentifier? imageId;

  /// The replication status details for the images in the specified repository.
  final List<ImageReplicationStatus>? replicationStatuses;

  /// The repository name associated with the request.
  final String? repositoryName;

  DescribeImageReplicationStatusResponse({
    this.imageId,
    this.replicationStatuses,
    this.repositoryName,
  });

  factory DescribeImageReplicationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeImageReplicationStatusResponse(
      imageId: json['imageId'] != null
          ? ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>)
          : null,
      replicationStatuses: (json['replicationStatuses'] as List?)
          ?.nonNulls
          .map(
              (e) => ImageReplicationStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final replicationStatuses = this.replicationStatuses;
    final repositoryName = this.repositoryName;
    return {
      if (imageId != null) 'imageId': imageId,
      if (replicationStatuses != null)
        'replicationStatuses': replicationStatuses,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class DescribeImagesResponse {
  /// A list of <a>ImageDetail</a> objects that contain data about the image.
  final List<ImageDetail>? imageDetails;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeImages</code> request. When the results of a
  /// <code>DescribeImages</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  DescribeImagesResponse({
    this.imageDetails,
    this.nextToken,
  });

  factory DescribeImagesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeImagesResponse(
      imageDetails: (json['imageDetails'] as List?)
          ?.nonNulls
          .map((e) => ImageDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageDetails = this.imageDetails;
    final nextToken = this.nextToken;
    return {
      if (imageDetails != null) 'imageDetails': imageDetails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class DescribeImageScanFindingsResponse {
  final ImageIdentifier? imageId;

  /// The information contained in the image scan findings.
  final ImageScanFindings? imageScanFindings;

  /// The current state of the scan.
  final ImageScanStatus? imageScanStatus;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeImageScanFindings</code> request. When the results of a
  /// <code>DescribeImageScanFindings</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is null when there are no more results to return.
  final String? nextToken;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  DescribeImageScanFindingsResponse({
    this.imageId,
    this.imageScanFindings,
    this.imageScanStatus,
    this.nextToken,
    this.registryId,
    this.repositoryName,
  });

  factory DescribeImageScanFindingsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeImageScanFindingsResponse(
      imageId: json['imageId'] != null
          ? ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>)
          : null,
      imageScanFindings: json['imageScanFindings'] != null
          ? ImageScanFindings.fromJson(
              json['imageScanFindings'] as Map<String, dynamic>)
          : null,
      imageScanStatus: json['imageScanStatus'] != null
          ? ImageScanStatus.fromJson(
              json['imageScanStatus'] as Map<String, dynamic>)
          : null,
      nextToken: json['nextToken'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final imageScanFindings = this.imageScanFindings;
    final imageScanStatus = this.imageScanStatus;
    final nextToken = this.nextToken;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (imageId != null) 'imageId': imageId,
      if (imageScanFindings != null) 'imageScanFindings': imageScanFindings,
      if (imageScanStatus != null) 'imageScanStatus': imageScanStatus,
      if (nextToken != null) 'nextToken': nextToken,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class DescribeImageSigningStatusResponse {
  /// An object with identifying information for the image.
  final ImageIdentifier? imageId;

  /// The Amazon Web Services account ID associated with the registry.
  final String? registryId;

  /// The name of the repository.
  final String? repositoryName;

  /// A list of signing statuses for the specified image. Each status corresponds
  /// to a signing profile.
  final List<ImageSigningStatus>? signingStatuses;

  DescribeImageSigningStatusResponse({
    this.imageId,
    this.registryId,
    this.repositoryName,
    this.signingStatuses,
  });

  factory DescribeImageSigningStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeImageSigningStatusResponse(
      imageId: json['imageId'] != null
          ? ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>)
          : null,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
      signingStatuses: (json['signingStatuses'] as List?)
          ?.nonNulls
          .map((e) => ImageSigningStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    final signingStatuses = this.signingStatuses;
    return {
      if (imageId != null) 'imageId': imageId,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (signingStatuses != null) 'signingStatuses': signingStatuses,
    };
  }
}

/// @nodoc
class DescribePullThroughCacheRulesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribePullThroughCacheRulesRequest</code> request. When the results
  /// of a <code>DescribePullThroughCacheRulesRequest</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is null when there are no more results to return.
  final String? nextToken;

  /// The details of the pull through cache rules.
  final List<PullThroughCacheRule>? pullThroughCacheRules;

  DescribePullThroughCacheRulesResponse({
    this.nextToken,
    this.pullThroughCacheRules,
  });

  factory DescribePullThroughCacheRulesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribePullThroughCacheRulesResponse(
      nextToken: json['nextToken'] as String?,
      pullThroughCacheRules: (json['pullThroughCacheRules'] as List?)
          ?.nonNulls
          .map((e) => PullThroughCacheRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pullThroughCacheRules = this.pullThroughCacheRules;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (pullThroughCacheRules != null)
        'pullThroughCacheRules': pullThroughCacheRules,
    };
  }
}

/// @nodoc
class DescribeRegistryResponse {
  /// The registry ID associated with the request.
  final String? registryId;

  /// The replication configuration for the registry.
  final ReplicationConfiguration? replicationConfiguration;

  DescribeRegistryResponse({
    this.registryId,
    this.replicationConfiguration,
  });

  factory DescribeRegistryResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRegistryResponse(
      registryId: json['registryId'] as String?,
      replicationConfiguration: json['replicationConfiguration'] != null
          ? ReplicationConfiguration.fromJson(
              json['replicationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryId = this.registryId;
    final replicationConfiguration = this.replicationConfiguration;
    return {
      if (registryId != null) 'registryId': registryId,
      if (replicationConfiguration != null)
        'replicationConfiguration': replicationConfiguration,
    };
  }
}

/// @nodoc
class DescribeRepositoriesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeRepositories</code> request. When the results of a
  /// <code>DescribeRepositories</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// A list of repository objects corresponding to valid repositories.
  final List<Repository>? repositories;

  DescribeRepositoriesResponse({
    this.nextToken,
    this.repositories,
  });

  factory DescribeRepositoriesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRepositoriesResponse(
      nextToken: json['nextToken'] as String?,
      repositories: (json['repositories'] as List?)
          ?.nonNulls
          .map((e) => Repository.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final repositories = this.repositories;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (repositories != null) 'repositories': repositories,
    };
  }
}

/// @nodoc
class DescribeRepositoryCreationTemplatesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeRepositoryCreationTemplates</code> request. When the results
  /// of a <code>DescribeRepositoryCreationTemplates</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  final String? nextToken;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The details of the repository creation templates.
  final List<RepositoryCreationTemplate>? repositoryCreationTemplates;

  DescribeRepositoryCreationTemplatesResponse({
    this.nextToken,
    this.registryId,
    this.repositoryCreationTemplates,
  });

  factory DescribeRepositoryCreationTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRepositoryCreationTemplatesResponse(
      nextToken: json['nextToken'] as String?,
      registryId: json['registryId'] as String?,
      repositoryCreationTemplates: (json['repositoryCreationTemplates']
              as List?)
          ?.nonNulls
          .map((e) =>
              RepositoryCreationTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final registryId = this.registryId;
    final repositoryCreationTemplates = this.repositoryCreationTemplates;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (registryId != null) 'registryId': registryId,
      if (repositoryCreationTemplates != null)
        'repositoryCreationTemplates': repositoryCreationTemplates,
    };
  }
}

/// @nodoc
class GetAccountSettingResponse {
  /// Retrieves the name of the account setting.
  final String? name;

  /// The setting value for the setting name. Valid value for basic scan type:
  /// <code>AWS_NATIVE</code>. Valid values for registry policy scope:
  /// <code>V2</code>. Valid values for blob mounting: <code>ENABLED</code> or
  /// <code>DISABLED</code>.
  final String? value;

  GetAccountSettingResponse({
    this.name,
    this.value,
  });

  factory GetAccountSettingResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountSettingResponse(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class GetAuthorizationTokenResponse {
  /// A list of authorization token data objects that correspond to the
  /// <code>registryIds</code> values in the request.
  /// <note>
  /// The size of the authorization token returned by Amazon ECR is not fixed. We
  /// recommend that you don't make assumptions about the maximum size.
  /// </note>
  final List<AuthorizationData>? authorizationData;

  GetAuthorizationTokenResponse({
    this.authorizationData,
  });

  factory GetAuthorizationTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetAuthorizationTokenResponse(
      authorizationData: (json['authorizationData'] as List?)
          ?.nonNulls
          .map((e) => AuthorizationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationData = this.authorizationData;
    return {
      if (authorizationData != null) 'authorizationData': authorizationData,
    };
  }
}

/// @nodoc
class GetDownloadUrlForLayerResponse {
  /// The pre-signed Amazon S3 download URL for the requested layer.
  final String? downloadUrl;

  /// The digest of the image layer to download.
  final String? layerDigest;

  GetDownloadUrlForLayerResponse({
    this.downloadUrl,
    this.layerDigest,
  });

  factory GetDownloadUrlForLayerResponse.fromJson(Map<String, dynamic> json) {
    return GetDownloadUrlForLayerResponse(
      downloadUrl: json['downloadUrl'] as String?,
      layerDigest: json['layerDigest'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final downloadUrl = this.downloadUrl;
    final layerDigest = this.layerDigest;
    return {
      if (downloadUrl != null) 'downloadUrl': downloadUrl,
      if (layerDigest != null) 'layerDigest': layerDigest,
    };
  }
}

/// @nodoc
class GetLifecyclePolicyResponse {
  /// The time stamp of the last time that the lifecycle policy was run.
  final DateTime? lastEvaluatedAt;

  /// The JSON lifecycle policy text.
  final String? lifecyclePolicyText;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  GetLifecyclePolicyResponse({
    this.lastEvaluatedAt,
    this.lifecyclePolicyText,
    this.registryId,
    this.repositoryName,
  });

  factory GetLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetLifecyclePolicyResponse(
      lastEvaluatedAt: timeStampFromJson(json['lastEvaluatedAt']),
      lifecyclePolicyText: json['lifecyclePolicyText'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastEvaluatedAt = this.lastEvaluatedAt;
    final lifecyclePolicyText = this.lifecyclePolicyText;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (lastEvaluatedAt != null)
        'lastEvaluatedAt': unixTimestampToJson(lastEvaluatedAt),
      if (lifecyclePolicyText != null)
        'lifecyclePolicyText': lifecyclePolicyText,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class GetLifecyclePolicyPreviewResponse {
  /// The JSON lifecycle policy text.
  final String? lifecyclePolicyText;

  /// The <code>nextToken</code> value to include in a future
  /// <code>GetLifecyclePolicyPreview</code> request. When the results of a
  /// <code>GetLifecyclePolicyPreview</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  final String? nextToken;

  /// The results of the lifecycle policy preview request.
  final List<LifecyclePolicyPreviewResult>? previewResults;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  /// The status of the lifecycle policy preview request.
  final LifecyclePolicyPreviewStatus? status;

  /// The list of images that is returned as a result of the action.
  final LifecyclePolicyPreviewSummary? summary;

  GetLifecyclePolicyPreviewResponse({
    this.lifecyclePolicyText,
    this.nextToken,
    this.previewResults,
    this.registryId,
    this.repositoryName,
    this.status,
    this.summary,
  });

  factory GetLifecyclePolicyPreviewResponse.fromJson(
      Map<String, dynamic> json) {
    return GetLifecyclePolicyPreviewResponse(
      lifecyclePolicyText: json['lifecyclePolicyText'] as String?,
      nextToken: json['nextToken'] as String?,
      previewResults: (json['previewResults'] as List?)
          ?.nonNulls
          .map((e) =>
              LifecyclePolicyPreviewResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
      status: (json['status'] as String?)
          ?.let(LifecyclePolicyPreviewStatus.fromString),
      summary: json['summary'] != null
          ? LifecyclePolicyPreviewSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicyText = this.lifecyclePolicyText;
    final nextToken = this.nextToken;
    final previewResults = this.previewResults;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    final status = this.status;
    final summary = this.summary;
    return {
      if (lifecyclePolicyText != null)
        'lifecyclePolicyText': lifecyclePolicyText,
      if (nextToken != null) 'nextToken': nextToken,
      if (previewResults != null) 'previewResults': previewResults,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (status != null) 'status': status.value,
      if (summary != null) 'summary': summary,
    };
  }
}

/// @nodoc
class GetRegistryPolicyResponse {
  /// The JSON text of the permissions policy for a registry.
  final String? policyText;

  /// The registry ID associated with the request.
  final String? registryId;

  GetRegistryPolicyResponse({
    this.policyText,
    this.registryId,
  });

  factory GetRegistryPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetRegistryPolicyResponse(
      policyText: json['policyText'] as String?,
      registryId: json['registryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyText = this.policyText;
    final registryId = this.registryId;
    return {
      if (policyText != null) 'policyText': policyText,
      if (registryId != null) 'registryId': registryId,
    };
  }
}

/// @nodoc
class GetRegistryScanningConfigurationResponse {
  /// The registry ID associated with the request.
  final String? registryId;

  /// The scanning configuration for the registry.
  final RegistryScanningConfiguration? scanningConfiguration;

  GetRegistryScanningConfigurationResponse({
    this.registryId,
    this.scanningConfiguration,
  });

  factory GetRegistryScanningConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRegistryScanningConfigurationResponse(
      registryId: json['registryId'] as String?,
      scanningConfiguration: json['scanningConfiguration'] != null
          ? RegistryScanningConfiguration.fromJson(
              json['scanningConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryId = this.registryId;
    final scanningConfiguration = this.scanningConfiguration;
    return {
      if (registryId != null) 'registryId': registryId,
      if (scanningConfiguration != null)
        'scanningConfiguration': scanningConfiguration,
    };
  }
}

/// @nodoc
class GetRepositoryPolicyResponse {
  /// The JSON repository policy text associated with the repository.
  final String? policyText;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  GetRepositoryPolicyResponse({
    this.policyText,
    this.registryId,
    this.repositoryName,
  });

  factory GetRepositoryPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetRepositoryPolicyResponse(
      policyText: json['policyText'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyText = this.policyText;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (policyText != null) 'policyText': policyText,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class GetSigningConfigurationResponse {
  /// The Amazon Web Services account ID associated with the registry.
  final String? registryId;

  /// The registry's signing configuration.
  final SigningConfiguration? signingConfiguration;

  GetSigningConfigurationResponse({
    this.registryId,
    this.signingConfiguration,
  });

  factory GetSigningConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetSigningConfigurationResponse(
      registryId: json['registryId'] as String?,
      signingConfiguration: json['signingConfiguration'] != null
          ? SigningConfiguration.fromJson(
              json['signingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryId = this.registryId;
    final signingConfiguration = this.signingConfiguration;
    return {
      if (registryId != null) 'registryId': registryId,
      if (signingConfiguration != null)
        'signingConfiguration': signingConfiguration,
    };
  }
}

/// @nodoc
class InitiateLayerUploadResponse {
  /// The size, in bytes, that Amazon ECR expects future layer part uploads to be.
  final int? partSize;

  /// The upload ID for the layer upload. This parameter is passed to further
  /// <a>UploadLayerPart</a> and <a>CompleteLayerUpload</a> operations.
  final String? uploadId;

  InitiateLayerUploadResponse({
    this.partSize,
    this.uploadId,
  });

  factory InitiateLayerUploadResponse.fromJson(Map<String, dynamic> json) {
    return InitiateLayerUploadResponse(
      partSize: json['partSize'] as int?,
      uploadId: json['uploadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final partSize = this.partSize;
    final uploadId = this.uploadId;
    return {
      if (partSize != null) 'partSize': partSize,
      if (uploadId != null) 'uploadId': uploadId,
    };
  }
}

/// @nodoc
class ListImageReferrersResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListImageReferrers</code> request. When the results of a
  /// <code>ListImageReferrers</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The list of artifacts associated with the subject image.
  final List<ImageReferrer>? referrers;

  ListImageReferrersResponse({
    this.nextToken,
    this.referrers,
  });

  factory ListImageReferrersResponse.fromJson(Map<String, dynamic> json) {
    return ListImageReferrersResponse(
      nextToken: json['nextToken'] as String?,
      referrers: (json['referrers'] as List?)
          ?.nonNulls
          .map((e) => ImageReferrer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final referrers = this.referrers;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (referrers != null) 'referrers': referrers,
    };
  }
}

/// @nodoc
class ListImagesResponse {
  /// The list of image IDs for the requested repository.
  final List<ImageIdentifier>? imageIds;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListImages</code> request. When the results of a
  /// <code>ListImages</code> request exceed <code>maxResults</code>, this value
  /// can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListImagesResponse({
    this.imageIds,
    this.nextToken,
  });

  factory ListImagesResponse.fromJson(Map<String, dynamic> json) {
    return ListImagesResponse(
      imageIds: (json['imageIds'] as List?)
          ?.nonNulls
          .map((e) => ImageIdentifier.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageIds = this.imageIds;
    final nextToken = this.nextToken;
    return {
      if (imageIds != null) 'imageIds': imageIds,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPullTimeUpdateExclusionsResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>ListPullTimeUpdateExclusions</code> request. When the results of a
  /// <code>ListPullTimeUpdateExclusions</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  final String? nextToken;

  /// The list of IAM principal ARNs that are excluded from having their image
  /// pull times recorded.
  final List<String>? pullTimeUpdateExclusions;

  ListPullTimeUpdateExclusionsResponse({
    this.nextToken,
    this.pullTimeUpdateExclusions,
  });

  factory ListPullTimeUpdateExclusionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPullTimeUpdateExclusionsResponse(
      nextToken: json['nextToken'] as String?,
      pullTimeUpdateExclusions: (json['pullTimeUpdateExclusions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final pullTimeUpdateExclusions = this.pullTimeUpdateExclusions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (pullTimeUpdateExclusions != null)
        'pullTimeUpdateExclusions': pullTimeUpdateExclusions,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags for the resource.
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
class PutAccountSettingResponse {
  /// Retrieves the name of the account setting.
  final String? name;

  /// Retrieves the value of the specified account setting.
  final String? value;

  PutAccountSettingResponse({
    this.name,
    this.value,
  });

  factory PutAccountSettingResponse.fromJson(Map<String, dynamic> json) {
    return PutAccountSettingResponse(
      name: json['name'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'name': name,
      if (value != null) 'value': value,
    };
  }
}

/// @nodoc
class PutImageResponse {
  /// Details of the image uploaded.
  final Image? image;

  PutImageResponse({
    this.image,
  });

  factory PutImageResponse.fromJson(Map<String, dynamic> json) {
    return PutImageResponse(
      image: json['image'] != null
          ? Image.fromJson(json['image'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final image = this.image;
    return {
      if (image != null) 'image': image,
    };
  }
}

/// @nodoc
class PutImageScanningConfigurationResponse {
  /// The image scanning configuration setting for the repository.
  final ImageScanningConfiguration? imageScanningConfiguration;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  PutImageScanningConfigurationResponse({
    this.imageScanningConfiguration,
    this.registryId,
    this.repositoryName,
  });

  factory PutImageScanningConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutImageScanningConfigurationResponse(
      imageScanningConfiguration: json['imageScanningConfiguration'] != null
          ? ImageScanningConfiguration.fromJson(
              json['imageScanningConfiguration'] as Map<String, dynamic>)
          : null,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageScanningConfiguration = this.imageScanningConfiguration;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (imageScanningConfiguration != null)
        'imageScanningConfiguration': imageScanningConfiguration,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class PutImageTagMutabilityResponse {
  /// The image tag mutability setting for the repository.
  final ImageTagMutability? imageTagMutability;

  /// The list of filters that specify which image tags are excluded from the
  /// repository's image tag mutability setting.
  final List<ImageTagMutabilityExclusionFilter>?
      imageTagMutabilityExclusionFilters;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  PutImageTagMutabilityResponse({
    this.imageTagMutability,
    this.imageTagMutabilityExclusionFilters,
    this.registryId,
    this.repositoryName,
  });

  factory PutImageTagMutabilityResponse.fromJson(Map<String, dynamic> json) {
    return PutImageTagMutabilityResponse(
      imageTagMutability: (json['imageTagMutability'] as String?)
          ?.let(ImageTagMutability.fromString),
      imageTagMutabilityExclusionFilters:
          (json['imageTagMutabilityExclusionFilters'] as List?)
              ?.nonNulls
              .map((e) => ImageTagMutabilityExclusionFilter.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageTagMutability = this.imageTagMutability;
    final imageTagMutabilityExclusionFilters =
        this.imageTagMutabilityExclusionFilters;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (imageTagMutability != null)
        'imageTagMutability': imageTagMutability.value,
      if (imageTagMutabilityExclusionFilters != null)
        'imageTagMutabilityExclusionFilters':
            imageTagMutabilityExclusionFilters,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class PutLifecyclePolicyResponse {
  /// The JSON repository policy text.
  final String? lifecyclePolicyText;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  PutLifecyclePolicyResponse({
    this.lifecyclePolicyText,
    this.registryId,
    this.repositoryName,
  });

  factory PutLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutLifecyclePolicyResponse(
      lifecyclePolicyText: json['lifecyclePolicyText'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicyText = this.lifecyclePolicyText;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (lifecyclePolicyText != null)
        'lifecyclePolicyText': lifecyclePolicyText,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class PutRegistryPolicyResponse {
  /// The JSON policy text for your registry.
  final String? policyText;

  /// The registry ID associated with the request.
  final String? registryId;

  PutRegistryPolicyResponse({
    this.policyText,
    this.registryId,
  });

  factory PutRegistryPolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutRegistryPolicyResponse(
      policyText: json['policyText'] as String?,
      registryId: json['registryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyText = this.policyText;
    final registryId = this.registryId;
    return {
      if (policyText != null) 'policyText': policyText,
      if (registryId != null) 'registryId': registryId,
    };
  }
}

/// @nodoc
class PutRegistryScanningConfigurationResponse {
  /// The scanning configuration for your registry.
  final RegistryScanningConfiguration? registryScanningConfiguration;

  PutRegistryScanningConfigurationResponse({
    this.registryScanningConfiguration,
  });

  factory PutRegistryScanningConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutRegistryScanningConfigurationResponse(
      registryScanningConfiguration:
          json['registryScanningConfiguration'] != null
              ? RegistryScanningConfiguration.fromJson(
                  json['registryScanningConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryScanningConfiguration = this.registryScanningConfiguration;
    return {
      if (registryScanningConfiguration != null)
        'registryScanningConfiguration': registryScanningConfiguration,
    };
  }
}

/// @nodoc
class PutReplicationConfigurationResponse {
  /// The contents of the replication configuration for the registry.
  final ReplicationConfiguration? replicationConfiguration;

  PutReplicationConfigurationResponse({
    this.replicationConfiguration,
  });

  factory PutReplicationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutReplicationConfigurationResponse(
      replicationConfiguration: json['replicationConfiguration'] != null
          ? ReplicationConfiguration.fromJson(
              json['replicationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationConfiguration = this.replicationConfiguration;
    return {
      if (replicationConfiguration != null)
        'replicationConfiguration': replicationConfiguration,
    };
  }
}

/// @nodoc
class PutSigningConfigurationResponse {
  /// The registry's updated signing configuration.
  final SigningConfiguration? signingConfiguration;

  PutSigningConfigurationResponse({
    this.signingConfiguration,
  });

  factory PutSigningConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return PutSigningConfigurationResponse(
      signingConfiguration: json['signingConfiguration'] != null
          ? SigningConfiguration.fromJson(
              json['signingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final signingConfiguration = this.signingConfiguration;
    return {
      if (signingConfiguration != null)
        'signingConfiguration': signingConfiguration,
    };
  }
}

/// @nodoc
class RegisterPullTimeUpdateExclusionResponse {
  /// The date and time, expressed in standard JavaScript date format, when the
  /// exclusion was created.
  final DateTime? createdAt;

  /// The ARN of the IAM principal that was added to the pull time update
  /// exclusion list.
  final String? principalArn;

  RegisterPullTimeUpdateExclusionResponse({
    this.createdAt,
    this.principalArn,
  });

  factory RegisterPullTimeUpdateExclusionResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterPullTimeUpdateExclusionResponse(
      createdAt: timeStampFromJson(json['createdAt']),
      principalArn: json['principalArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final principalArn = this.principalArn;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (principalArn != null) 'principalArn': principalArn,
    };
  }
}

/// @nodoc
class SetRepositoryPolicyResponse {
  /// The JSON repository policy text applied to the repository.
  final String? policyText;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  SetRepositoryPolicyResponse({
    this.policyText,
    this.registryId,
    this.repositoryName,
  });

  factory SetRepositoryPolicyResponse.fromJson(Map<String, dynamic> json) {
    return SetRepositoryPolicyResponse(
      policyText: json['policyText'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyText = this.policyText;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (policyText != null) 'policyText': policyText,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class StartImageScanResponse {
  final ImageIdentifier? imageId;

  /// The current state of the scan.
  final ImageScanStatus? imageScanStatus;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  StartImageScanResponse({
    this.imageId,
    this.imageScanStatus,
    this.registryId,
    this.repositoryName,
  });

  factory StartImageScanResponse.fromJson(Map<String, dynamic> json) {
    return StartImageScanResponse(
      imageId: json['imageId'] != null
          ? ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>)
          : null,
      imageScanStatus: json['imageScanStatus'] != null
          ? ImageScanStatus.fromJson(
              json['imageScanStatus'] as Map<String, dynamic>)
          : null,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final imageScanStatus = this.imageScanStatus;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (imageId != null) 'imageId': imageId,
      if (imageScanStatus != null) 'imageScanStatus': imageScanStatus,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class StartLifecyclePolicyPreviewResponse {
  /// The JSON repository policy text.
  final String? lifecyclePolicyText;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  /// The status of the lifecycle policy preview request.
  final LifecyclePolicyPreviewStatus? status;

  StartLifecyclePolicyPreviewResponse({
    this.lifecyclePolicyText,
    this.registryId,
    this.repositoryName,
    this.status,
  });

  factory StartLifecyclePolicyPreviewResponse.fromJson(
      Map<String, dynamic> json) {
    return StartLifecyclePolicyPreviewResponse(
      lifecyclePolicyText: json['lifecyclePolicyText'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
      status: (json['status'] as String?)
          ?.let(LifecyclePolicyPreviewStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final lifecyclePolicyText = this.lifecyclePolicyText;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    final status = this.status;
    return {
      if (lifecyclePolicyText != null)
        'lifecyclePolicyText': lifecyclePolicyText,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (status != null) 'status': status.value,
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
class UpdateImageStorageClassResponse {
  final ImageIdentifier? imageId;

  /// The current status of the image after the call to UpdateImageStorageClass is
  /// complete. Valid values are <code>ACTIVE</code>, <code>ARCHIVED</code>, and
  /// <code>ACTIVATING</code>.
  final ImageStatus? imageStatus;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  UpdateImageStorageClassResponse({
    this.imageId,
    this.imageStatus,
    this.registryId,
    this.repositoryName,
  });

  factory UpdateImageStorageClassResponse.fromJson(Map<String, dynamic> json) {
    return UpdateImageStorageClassResponse(
      imageId: json['imageId'] != null
          ? ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>)
          : null,
      imageStatus:
          (json['imageStatus'] as String?)?.let(ImageStatus.fromString),
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final imageStatus = this.imageStatus;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (imageId != null) 'imageId': imageId,
      if (imageStatus != null) 'imageStatus': imageStatus.value,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class UpdatePullThroughCacheRuleResponse {
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret associated with the pull through cache rule.
  final String? credentialArn;

  /// The ARN of the IAM role associated with the pull through cache rule.
  final String? customRoleArn;

  /// The Amazon ECR repository prefix associated with the pull through cache
  /// rule.
  final String? ecrRepositoryPrefix;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The date and time, in JavaScript date format, when the pull through cache
  /// rule was updated.
  final DateTime? updatedAt;

  /// The upstream repository prefix associated with the pull through cache rule.
  final String? upstreamRepositoryPrefix;

  UpdatePullThroughCacheRuleResponse({
    this.credentialArn,
    this.customRoleArn,
    this.ecrRepositoryPrefix,
    this.registryId,
    this.updatedAt,
    this.upstreamRepositoryPrefix,
  });

  factory UpdatePullThroughCacheRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdatePullThroughCacheRuleResponse(
      credentialArn: json['credentialArn'] as String?,
      customRoleArn: json['customRoleArn'] as String?,
      ecrRepositoryPrefix: json['ecrRepositoryPrefix'] as String?,
      registryId: json['registryId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      upstreamRepositoryPrefix: json['upstreamRepositoryPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final credentialArn = this.credentialArn;
    final customRoleArn = this.customRoleArn;
    final ecrRepositoryPrefix = this.ecrRepositoryPrefix;
    final registryId = this.registryId;
    final updatedAt = this.updatedAt;
    final upstreamRepositoryPrefix = this.upstreamRepositoryPrefix;
    return {
      if (credentialArn != null) 'credentialArn': credentialArn,
      if (customRoleArn != null) 'customRoleArn': customRoleArn,
      if (ecrRepositoryPrefix != null)
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
      if (registryId != null) 'registryId': registryId,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (upstreamRepositoryPrefix != null)
        'upstreamRepositoryPrefix': upstreamRepositoryPrefix,
    };
  }
}

/// @nodoc
class UpdateRepositoryCreationTemplateResponse {
  /// The registry ID associated with the request.
  final String? registryId;

  /// The details of the repository creation template associated with the request.
  final RepositoryCreationTemplate? repositoryCreationTemplate;

  UpdateRepositoryCreationTemplateResponse({
    this.registryId,
    this.repositoryCreationTemplate,
  });

  factory UpdateRepositoryCreationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateRepositoryCreationTemplateResponse(
      registryId: json['registryId'] as String?,
      repositoryCreationTemplate: json['repositoryCreationTemplate'] != null
          ? RepositoryCreationTemplate.fromJson(
              json['repositoryCreationTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final registryId = this.registryId;
    final repositoryCreationTemplate = this.repositoryCreationTemplate;
    return {
      if (registryId != null) 'registryId': registryId,
      if (repositoryCreationTemplate != null)
        'repositoryCreationTemplate': repositoryCreationTemplate,
    };
  }
}

/// @nodoc
class UploadLayerPartResponse {
  /// The integer value of the last byte received in the request.
  final int? lastByteReceived;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The repository name associated with the request.
  final String? repositoryName;

  /// The upload ID associated with the request.
  final String? uploadId;

  UploadLayerPartResponse({
    this.lastByteReceived,
    this.registryId,
    this.repositoryName,
    this.uploadId,
  });

  factory UploadLayerPartResponse.fromJson(Map<String, dynamic> json) {
    return UploadLayerPartResponse(
      lastByteReceived: json['lastByteReceived'] as int?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
      uploadId: json['uploadId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastByteReceived = this.lastByteReceived;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    final uploadId = this.uploadId;
    return {
      if (lastByteReceived != null) 'lastByteReceived': lastByteReceived,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (uploadId != null) 'uploadId': uploadId,
    };
  }
}

/// @nodoc
class ValidatePullThroughCacheRuleResponse {
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Secrets Manager
  /// secret associated with the pull through cache rule.
  final String? credentialArn;

  /// The ARN of the IAM role associated with the pull through cache rule.
  final String? customRoleArn;

  /// The Amazon ECR repository prefix associated with the pull through cache
  /// rule.
  final String? ecrRepositoryPrefix;

  /// The reason the validation failed. For more details about possible causes and
  /// how to address them, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/pull-through-cache.html">Using
  /// pull through cache rules</a> in the <i>Amazon Elastic Container Registry
  /// User Guide</i>.
  final String? failure;

  /// Whether or not the pull through cache rule was validated. If
  /// <code>true</code>, Amazon ECR was able to reach the upstream registry and
  /// authentication was successful. If <code>false</code>, there was an issue and
  /// validation failed. The <code>failure</code> reason indicates the cause.
  final bool? isValid;

  /// The registry ID associated with the request.
  final String? registryId;

  /// The upstream registry URL associated with the pull through cache rule.
  final String? upstreamRegistryUrl;

  /// The upstream repository prefix associated with the pull through cache rule.
  final String? upstreamRepositoryPrefix;

  ValidatePullThroughCacheRuleResponse({
    this.credentialArn,
    this.customRoleArn,
    this.ecrRepositoryPrefix,
    this.failure,
    this.isValid,
    this.registryId,
    this.upstreamRegistryUrl,
    this.upstreamRepositoryPrefix,
  });

  factory ValidatePullThroughCacheRuleResponse.fromJson(
      Map<String, dynamic> json) {
    return ValidatePullThroughCacheRuleResponse(
      credentialArn: json['credentialArn'] as String?,
      customRoleArn: json['customRoleArn'] as String?,
      ecrRepositoryPrefix: json['ecrRepositoryPrefix'] as String?,
      failure: json['failure'] as String?,
      isValid: json['isValid'] as bool?,
      registryId: json['registryId'] as String?,
      upstreamRegistryUrl: json['upstreamRegistryUrl'] as String?,
      upstreamRepositoryPrefix: json['upstreamRepositoryPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final credentialArn = this.credentialArn;
    final customRoleArn = this.customRoleArn;
    final ecrRepositoryPrefix = this.ecrRepositoryPrefix;
    final failure = this.failure;
    final isValid = this.isValid;
    final registryId = this.registryId;
    final upstreamRegistryUrl = this.upstreamRegistryUrl;
    final upstreamRepositoryPrefix = this.upstreamRepositoryPrefix;
    return {
      if (credentialArn != null) 'credentialArn': credentialArn,
      if (customRoleArn != null) 'customRoleArn': customRoleArn,
      if (ecrRepositoryPrefix != null)
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
      if (failure != null) 'failure': failure,
      if (isValid != null) 'isValid': isValid,
      if (registryId != null) 'registryId': registryId,
      if (upstreamRegistryUrl != null)
        'upstreamRegistryUrl': upstreamRegistryUrl,
      if (upstreamRepositoryPrefix != null)
        'upstreamRepositoryPrefix': upstreamRepositoryPrefix,
    };
  }
}

/// The details of the repository creation template associated with the request.
///
/// @nodoc
class RepositoryCreationTemplate {
  /// A list of enumerable Strings representing the repository creation scenarios
  /// that this template will apply towards. The supported scenarios are
  /// PULL_THROUGH_CACHE, REPLICATION, and CREATE_ON_PUSH
  final List<RCTAppliedFor>? appliedFor;

  /// The date and time, in JavaScript date format, when the repository creation
  /// template was created.
  final DateTime? createdAt;

  /// The ARN of the role to be assumed by Amazon ECR. Amazon ECR will assume your
  /// supplied role when the customRoleArn is specified. When this field isn't
  /// specified, Amazon ECR will use the service-linked role for the repository
  /// creation template.
  final String? customRoleArn;

  /// The description associated with the repository creation template.
  final String? description;

  /// The encryption configuration associated with the repository creation
  /// template.
  final EncryptionConfigurationForRepositoryCreationTemplate?
      encryptionConfiguration;

  /// The tag mutability setting for the repository. If this parameter is omitted,
  /// the default setting of <code>MUTABLE</code> will be used which will allow
  /// image tags to be overwritten. If <code>IMMUTABLE</code> is specified, all
  /// image tags within the repository will be immutable which will prevent them
  /// from being overwritten.
  final ImageTagMutability? imageTagMutability;

  /// A list of filters that specify which image tags are excluded from the
  /// repository creation template's image tag mutability setting.
  final List<ImageTagMutabilityExclusionFilter>?
      imageTagMutabilityExclusionFilters;

  /// The lifecycle policy to use for repositories created using the template.
  final String? lifecyclePolicy;

  /// The repository namespace prefix associated with the repository creation
  /// template.
  final String? prefix;

  /// The repository policy to apply to repositories created using the template. A
  /// repository policy is a permissions policy associated with a repository to
  /// control access permissions.
  final String? repositoryPolicy;

  /// The metadata to apply to the repository to help you categorize and organize.
  /// Each tag consists of a key and an optional value, both of which you define.
  /// Tag keys can have a maximum character length of 128 characters, and tag
  /// values can have a maximum length of 256 characters.
  final List<Tag>? resourceTags;

  /// The date and time, in JavaScript date format, when the repository creation
  /// template was last updated.
  final DateTime? updatedAt;

  RepositoryCreationTemplate({
    this.appliedFor,
    this.createdAt,
    this.customRoleArn,
    this.description,
    this.encryptionConfiguration,
    this.imageTagMutability,
    this.imageTagMutabilityExclusionFilters,
    this.lifecyclePolicy,
    this.prefix,
    this.repositoryPolicy,
    this.resourceTags,
    this.updatedAt,
  });

  factory RepositoryCreationTemplate.fromJson(Map<String, dynamic> json) {
    return RepositoryCreationTemplate(
      appliedFor: (json['appliedFor'] as List?)
          ?.nonNulls
          .map((e) => RCTAppliedFor.fromString((e as String)))
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      customRoleArn: json['customRoleArn'] as String?,
      description: json['description'] as String?,
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? EncryptionConfigurationForRepositoryCreationTemplate.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      imageTagMutability: (json['imageTagMutability'] as String?)
          ?.let(ImageTagMutability.fromString),
      imageTagMutabilityExclusionFilters:
          (json['imageTagMutabilityExclusionFilters'] as List?)
              ?.nonNulls
              .map((e) => ImageTagMutabilityExclusionFilter.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      lifecyclePolicy: json['lifecyclePolicy'] as String?,
      prefix: json['prefix'] as String?,
      repositoryPolicy: json['repositoryPolicy'] as String?,
      resourceTags: (json['resourceTags'] as List?)
          ?.nonNulls
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final appliedFor = this.appliedFor;
    final createdAt = this.createdAt;
    final customRoleArn = this.customRoleArn;
    final description = this.description;
    final encryptionConfiguration = this.encryptionConfiguration;
    final imageTagMutability = this.imageTagMutability;
    final imageTagMutabilityExclusionFilters =
        this.imageTagMutabilityExclusionFilters;
    final lifecyclePolicy = this.lifecyclePolicy;
    final prefix = this.prefix;
    final repositoryPolicy = this.repositoryPolicy;
    final resourceTags = this.resourceTags;
    final updatedAt = this.updatedAt;
    return {
      if (appliedFor != null)
        'appliedFor': appliedFor.map((e) => e.value).toList(),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (customRoleArn != null) 'customRoleArn': customRoleArn,
      if (description != null) 'description': description,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (imageTagMutability != null)
        'imageTagMutability': imageTagMutability.value,
      if (imageTagMutabilityExclusionFilters != null)
        'imageTagMutabilityExclusionFilters':
            imageTagMutabilityExclusionFilters,
      if (lifecyclePolicy != null) 'lifecyclePolicy': lifecyclePolicy,
      if (prefix != null) 'prefix': prefix,
      if (repositoryPolicy != null) 'repositoryPolicy': repositoryPolicy,
      if (resourceTags != null) 'resourceTags': resourceTags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// The encryption configuration to associate with the repository creation
/// template.
///
/// @nodoc
class EncryptionConfigurationForRepositoryCreationTemplate {
  /// The encryption type to use.
  ///
  /// If you use the <code>KMS</code> encryption type, the contents of the
  /// repository will be encrypted using server-side encryption with Key
  /// Management Service key stored in KMS. When you use KMS to encrypt your data,
  /// you can either use the default Amazon Web Services managed KMS key for
  /// Amazon ECR, or specify your own KMS key, which you already created. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">Protecting
  /// data using server-side encryption with an KMS key stored in Key Management
  /// Service (SSE-KMS)</a> in the <i>Amazon Simple Storage Service Console
  /// Developer Guide</i>.
  ///
  /// If you use the <code>AES256</code> encryption type, Amazon ECR uses
  /// server-side encryption with Amazon S3-managed encryption keys which encrypts
  /// the images in the repository using an AES256 encryption algorithm. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html">Protecting
  /// data using server-side encryption with Amazon S3-managed encryption keys
  /// (SSE-S3)</a> in the <i>Amazon Simple Storage Service Console Developer
  /// Guide</i>.
  final EncryptionType encryptionType;

  /// If you use the <code>KMS</code> encryption type, specify the KMS key to use
  /// for encryption. The full ARN of the KMS key must be specified. The key must
  /// exist in the same Region as the repository. If no key is specified, the
  /// default Amazon Web Services managed KMS key for Amazon ECR will be used.
  final String? kmsKey;

  EncryptionConfigurationForRepositoryCreationTemplate({
    required this.encryptionType,
    this.kmsKey,
  });

  factory EncryptionConfigurationForRepositoryCreationTemplate.fromJson(
      Map<String, dynamic> json) {
    return EncryptionConfigurationForRepositoryCreationTemplate(
      encryptionType:
          EncryptionType.fromString((json['encryptionType'] as String?) ?? ''),
      kmsKey: json['kmsKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    final kmsKey = this.kmsKey;
    return {
      'encryptionType': encryptionType.value,
      if (kmsKey != null) 'kmsKey': kmsKey,
    };
  }
}

/// @nodoc
class ImageTagMutability {
  static const mutable = ImageTagMutability._('MUTABLE');
  static const immutable = ImageTagMutability._('IMMUTABLE');
  static const immutableWithExclusion =
      ImageTagMutability._('IMMUTABLE_WITH_EXCLUSION');
  static const mutableWithExclusion =
      ImageTagMutability._('MUTABLE_WITH_EXCLUSION');

  final String value;

  const ImageTagMutability._(this.value);

  static const values = [
    mutable,
    immutable,
    immutableWithExclusion,
    mutableWithExclusion
  ];

  static ImageTagMutability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageTagMutability._(value));

  @override
  bool operator ==(other) =>
      other is ImageTagMutability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RCTAppliedFor {
  static const replication = RCTAppliedFor._('REPLICATION');
  static const pullThroughCache = RCTAppliedFor._('PULL_THROUGH_CACHE');
  static const createOnPush = RCTAppliedFor._('CREATE_ON_PUSH');

  final String value;

  const RCTAppliedFor._(this.value);

  static const values = [replication, pullThroughCache, createOnPush];

  static RCTAppliedFor fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RCTAppliedFor._(value));

  @override
  bool operator ==(other) => other is RCTAppliedFor && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A filter that specifies which image tags should be excluded from the
/// repository's image tag mutability setting.
///
/// @nodoc
class ImageTagMutabilityExclusionFilter {
  /// The filter value used to match image tags for exclusion from mutability
  /// settings.
  final String filter;

  /// The type of filter to apply for excluding image tags from mutability
  /// settings.
  final ImageTagMutabilityExclusionFilterType filterType;

  ImageTagMutabilityExclusionFilter({
    required this.filter,
    required this.filterType,
  });

  factory ImageTagMutabilityExclusionFilter.fromJson(
      Map<String, dynamic> json) {
    return ImageTagMutabilityExclusionFilter(
      filter: (json['filter'] as String?) ?? '',
      filterType: ImageTagMutabilityExclusionFilterType.fromString(
          (json['filterType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final filterType = this.filterType;
    return {
      'filter': filter,
      'filterType': filterType.value,
    };
  }
}

/// @nodoc
class ImageTagMutabilityExclusionFilterType {
  static const wildcard = ImageTagMutabilityExclusionFilterType._('WILDCARD');

  final String value;

  const ImageTagMutabilityExclusionFilterType._(this.value);

  static const values = [wildcard];

  static ImageTagMutabilityExclusionFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageTagMutabilityExclusionFilterType._(value));

  @override
  bool operator ==(other) =>
      other is ImageTagMutabilityExclusionFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The metadata to apply to a resource to help you categorize and organize
/// them. Each tag consists of a key and a value, both of which you define. Tag
/// keys can have a maximum character length of 128 characters, and tag values
/// can have a maximum length of 256 characters.
///
/// @nodoc
class Tag {
  /// One part of a key-value pair that make up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  final String key;

  /// A <code>value</code> acts as a descriptor within a tag category (key).
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
  }
}

/// @nodoc
class EncryptionType {
  static const aes256 = EncryptionType._('AES256');
  static const kms = EncryptionType._('KMS');
  static const kmsDsse = EncryptionType._('KMS_DSSE');

  final String value;

  const EncryptionType._(this.value);

  static const values = [aes256, kms, kmsDsse];

  static EncryptionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionType._(value));

  @override
  bool operator ==(other) => other is EncryptionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object with identifying information for an image in an Amazon ECR
/// repository.
///
/// @nodoc
class ImageIdentifier {
  /// The <code>sha256</code> digest of the image manifest.
  final String? imageDigest;

  /// The tag used for the image.
  final String? imageTag;

  ImageIdentifier({
    this.imageDigest,
    this.imageTag,
  });

  factory ImageIdentifier.fromJson(Map<String, dynamic> json) {
    return ImageIdentifier(
      imageDigest: json['imageDigest'] as String?,
      imageTag: json['imageTag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageDigest = this.imageDigest;
    final imageTag = this.imageTag;
    return {
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (imageTag != null) 'imageTag': imageTag,
    };
  }
}

/// @nodoc
class ImageStatus {
  static const active = ImageStatus._('ACTIVE');
  static const archived = ImageStatus._('ARCHIVED');
  static const activating = ImageStatus._('ACTIVATING');

  final String value;

  const ImageStatus._(this.value);

  static const values = [active, archived, activating];

  static ImageStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ImageStatus._(value));

  @override
  bool operator ==(other) => other is ImageStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TargetStorageClass {
  static const standard = TargetStorageClass._('STANDARD');
  static const archive = TargetStorageClass._('ARCHIVE');

  final String value;

  const TargetStorageClass._(this.value);

  static const values = [standard, archive];

  static TargetStorageClass fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetStorageClass._(value));

  @override
  bool operator ==(other) =>
      other is TargetStorageClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LifecyclePolicyPreviewStatus {
  static const inProgress = LifecyclePolicyPreviewStatus._('IN_PROGRESS');
  static const complete = LifecyclePolicyPreviewStatus._('COMPLETE');
  static const expired = LifecyclePolicyPreviewStatus._('EXPIRED');
  static const failed = LifecyclePolicyPreviewStatus._('FAILED');

  final String value;

  const LifecyclePolicyPreviewStatus._(this.value);

  static const values = [inProgress, complete, expired, failed];

  static LifecyclePolicyPreviewStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LifecyclePolicyPreviewStatus._(value));

  @override
  bool operator ==(other) =>
      other is LifecyclePolicyPreviewStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The current status of an image scan.
///
/// @nodoc
class ImageScanStatus {
  /// The description of the image scan status.
  final String? description;

  /// The current state of an image scan.
  final ScanStatus? status;

  ImageScanStatus({
    this.description,
    this.status,
  });

  factory ImageScanStatus.fromJson(Map<String, dynamic> json) {
    return ImageScanStatus(
      description: json['description'] as String?,
      status: (json['status'] as String?)?.let(ScanStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final status = this.status;
    return {
      if (description != null) 'description': description,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ScanStatus {
  static const inProgress = ScanStatus._('IN_PROGRESS');
  static const complete = ScanStatus._('COMPLETE');
  static const failed = ScanStatus._('FAILED');
  static const unsupportedImage = ScanStatus._('UNSUPPORTED_IMAGE');
  static const active = ScanStatus._('ACTIVE');
  static const pending = ScanStatus._('PENDING');
  static const scanEligibilityExpired =
      ScanStatus._('SCAN_ELIGIBILITY_EXPIRED');
  static const findingsUnavailable = ScanStatus._('FINDINGS_UNAVAILABLE');
  static const limitExceeded = ScanStatus._('LIMIT_EXCEEDED');
  static const imageArchived = ScanStatus._('IMAGE_ARCHIVED');

  final String value;

  const ScanStatus._(this.value);

  static const values = [
    inProgress,
    complete,
    failed,
    unsupportedImage,
    active,
    pending,
    scanEligibilityExpired,
    findingsUnavailable,
    limitExceeded,
    imageArchived
  ];

  static ScanStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanStatus._(value));

  @override
  bool operator ==(other) => other is ScanStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The signing configuration for a registry, which specifies rules for
/// automatically signing images when pushed.
///
/// @nodoc
class SigningConfiguration {
  /// A list of signing rules. Each rule defines a signing profile and optional
  /// repository filters that determine which images are automatically signed.
  /// Maximum of 10 rules.
  final List<SigningRule> rules;

  SigningConfiguration({
    required this.rules,
  });

  factory SigningConfiguration.fromJson(Map<String, dynamic> json) {
    return SigningConfiguration(
      rules: ((json['rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => SigningRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      'rules': rules,
    };
  }
}

/// A signing rule that specifies a signing profile and optional repository
/// filters. When an image is pushed to a matching repository, a signing job is
/// created using the specified profile.
///
/// @nodoc
class SigningRule {
  /// The ARN of the Amazon Web Services Signer signing profile to use for signing
  /// images that match this rule. For more information about signing profiles,
  /// see <a
  /// href="https://docs.aws.amazon.com/signer/latest/developerguide/signing-profiles.html">Signing
  /// profiles</a> in the <i>Amazon Web Services Signer Developer Guide</i>.
  final String signingProfileArn;

  /// A list of repository filters that determine which repositories have their
  /// images signed on push. If no filters are specified, all images pushed to the
  /// registry are signed using the rule's signing profile. Maximum of 100 filters
  /// per rule.
  final List<SigningRepositoryFilter>? repositoryFilters;

  SigningRule({
    required this.signingProfileArn,
    this.repositoryFilters,
  });

  factory SigningRule.fromJson(Map<String, dynamic> json) {
    return SigningRule(
      signingProfileArn: (json['signingProfileArn'] as String?) ?? '',
      repositoryFilters: (json['repositoryFilters'] as List?)
          ?.nonNulls
          .map((e) =>
              SigningRepositoryFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final signingProfileArn = this.signingProfileArn;
    final repositoryFilters = this.repositoryFilters;
    return {
      'signingProfileArn': signingProfileArn,
      if (repositoryFilters != null) 'repositoryFilters': repositoryFilters,
    };
  }
}

/// A repository filter used to determine which repositories have their images
/// automatically signed on push. Each filter consists of a filter type and
/// filter value.
///
/// @nodoc
class SigningRepositoryFilter {
  /// The filter value used to match repository names. When using
  /// <code>WILDCARD_MATCH</code>, the <code>*</code> character matches any
  /// sequence of characters.
  ///
  /// Examples:
  ///
  /// <ul>
  /// <li>
  /// <code>myapp/*</code> - Matches all repositories starting with
  /// <code>myapp/</code>
  /// </li>
  /// <li>
  /// <code>*/production</code> - Matches all repositories ending with
  /// <code>/production</code>
  /// </li>
  /// <li>
  /// <code>*prod*</code> - Matches all repositories containing <code>prod</code>
  /// </li>
  /// </ul>
  final String filter;

  /// The type of filter to apply. Currently, only <code>WILDCARD_MATCH</code> is
  /// supported, which uses wildcard patterns to match repository names.
  final SigningRepositoryFilterType filterType;

  SigningRepositoryFilter({
    required this.filter,
    required this.filterType,
  });

  factory SigningRepositoryFilter.fromJson(Map<String, dynamic> json) {
    return SigningRepositoryFilter(
      filter: (json['filter'] as String?) ?? '',
      filterType: SigningRepositoryFilterType.fromString(
          (json['filterType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final filterType = this.filterType;
    return {
      'filter': filter,
      'filterType': filterType.value,
    };
  }
}

/// The type of filter to use when determining which repositories should have
/// their images automatically signed.
///
/// @nodoc
class SigningRepositoryFilterType {
  static const wildcardMatch = SigningRepositoryFilterType._('WILDCARD_MATCH');

  final String value;

  const SigningRepositoryFilterType._(this.value);

  static const values = [wildcardMatch];

  static SigningRepositoryFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SigningRepositoryFilterType._(value));

  @override
  bool operator ==(other) =>
      other is SigningRepositoryFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The replication configuration for a registry.
///
/// @nodoc
class ReplicationConfiguration {
  /// An array of objects representing the replication destinations and repository
  /// filters for a replication configuration.
  final List<ReplicationRule> rules;

  ReplicationConfiguration({
    required this.rules,
  });

  factory ReplicationConfiguration.fromJson(Map<String, dynamic> json) {
    return ReplicationConfiguration(
      rules: ((json['rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => ReplicationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    return {
      'rules': rules,
    };
  }
}

/// An array of objects representing the replication destinations and repository
/// filters for a replication configuration.
///
/// @nodoc
class ReplicationRule {
  /// An array of objects representing the destination for a replication rule.
  final List<ReplicationDestination> destinations;

  /// An array of objects representing the filters for a replication rule.
  /// Specifying a repository filter for a replication rule provides a method for
  /// controlling which repositories in a private registry are replicated.
  final List<RepositoryFilter>? repositoryFilters;

  ReplicationRule({
    required this.destinations,
    this.repositoryFilters,
  });

  factory ReplicationRule.fromJson(Map<String, dynamic> json) {
    return ReplicationRule(
      destinations: ((json['destinations'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => ReplicationDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
      repositoryFilters: (json['repositoryFilters'] as List?)
          ?.nonNulls
          .map((e) => RepositoryFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    final repositoryFilters = this.repositoryFilters;
    return {
      'destinations': destinations,
      if (repositoryFilters != null) 'repositoryFilters': repositoryFilters,
    };
  }
}

/// The filter settings used with image replication. Specifying a repository
/// filter to a replication rule provides a method for controlling which
/// repositories in a private registry are replicated. If no filters are added,
/// the contents of all repositories are replicated.
///
/// @nodoc
class RepositoryFilter {
  /// The repository filter details. When the <code>PREFIX_MATCH</code> filter
  /// type is specified, this value is required and should be the repository name
  /// prefix to configure replication for.
  final String filter;

  /// The repository filter type. The only supported value is
  /// <code>PREFIX_MATCH</code>, which is a repository name prefix specified with
  /// the <code>filter</code> parameter.
  final RepositoryFilterType filterType;

  RepositoryFilter({
    required this.filter,
    required this.filterType,
  });

  factory RepositoryFilter.fromJson(Map<String, dynamic> json) {
    return RepositoryFilter(
      filter: (json['filter'] as String?) ?? '',
      filterType: RepositoryFilterType.fromString(
          (json['filterType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final filterType = this.filterType;
    return {
      'filter': filter,
      'filterType': filterType.value,
    };
  }
}

/// @nodoc
class RepositoryFilterType {
  static const prefixMatch = RepositoryFilterType._('PREFIX_MATCH');

  final String value;

  const RepositoryFilterType._(this.value);

  static const values = [prefixMatch];

  static RepositoryFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RepositoryFilterType._(value));

  @override
  bool operator ==(other) =>
      other is RepositoryFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An array of objects representing the destination for a replication rule.
///
/// @nodoc
class ReplicationDestination {
  /// The Region to replicate to.
  final String region;

  /// The Amazon Web Services account ID of the Amazon ECR private registry to
  /// replicate to. When configuring cross-Region replication within your own
  /// registry, specify your own account ID.
  final String registryId;

  ReplicationDestination({
    required this.region,
    required this.registryId,
  });

  factory ReplicationDestination.fromJson(Map<String, dynamic> json) {
    return ReplicationDestination(
      region: (json['region'] as String?) ?? '',
      registryId: (json['registryId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final registryId = this.registryId;
    return {
      'region': region,
      'registryId': registryId,
    };
  }
}

/// The scanning configuration for a private registry.
///
/// @nodoc
class RegistryScanningConfiguration {
  /// The scanning rules associated with the registry.
  final List<RegistryScanningRule>? rules;

  /// The type of scanning configured for the registry.
  final ScanType? scanType;

  RegistryScanningConfiguration({
    this.rules,
    this.scanType,
  });

  factory RegistryScanningConfiguration.fromJson(Map<String, dynamic> json) {
    return RegistryScanningConfiguration(
      rules: (json['rules'] as List?)
          ?.nonNulls
          .map((e) => RegistryScanningRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      scanType: (json['scanType'] as String?)?.let(ScanType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final rules = this.rules;
    final scanType = this.scanType;
    return {
      if (rules != null) 'rules': rules,
      if (scanType != null) 'scanType': scanType.value,
    };
  }
}

/// @nodoc
class ScanType {
  static const basic = ScanType._('BASIC');
  static const enhanced = ScanType._('ENHANCED');

  final String value;

  const ScanType._(this.value);

  static const values = [basic, enhanced];

  static ScanType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ScanType._(value));

  @override
  bool operator ==(other) => other is ScanType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a scanning rule for a private registry.
///
/// @nodoc
class RegistryScanningRule {
  /// The repository filters associated with the scanning configuration for a
  /// private registry.
  final List<ScanningRepositoryFilter> repositoryFilters;

  /// The frequency that scans are performed at for a private registry. When the
  /// <code>ENHANCED</code> scan type is specified, the supported scan frequencies
  /// are <code>CONTINUOUS_SCAN</code> and <code>SCAN_ON_PUSH</code>. When the
  /// <code>BASIC</code> scan type is specified, the <code>SCAN_ON_PUSH</code>
  /// scan frequency is supported. If scan on push is not specified, then the
  /// <code>MANUAL</code> scan frequency is set by default.
  final ScanFrequency scanFrequency;

  RegistryScanningRule({
    required this.repositoryFilters,
    required this.scanFrequency,
  });

  factory RegistryScanningRule.fromJson(Map<String, dynamic> json) {
    return RegistryScanningRule(
      repositoryFilters: ((json['repositoryFilters'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              ScanningRepositoryFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      scanFrequency:
          ScanFrequency.fromString((json['scanFrequency'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final repositoryFilters = this.repositoryFilters;
    final scanFrequency = this.scanFrequency;
    return {
      'repositoryFilters': repositoryFilters,
      'scanFrequency': scanFrequency.value,
    };
  }
}

/// @nodoc
class ScanFrequency {
  static const scanOnPush = ScanFrequency._('SCAN_ON_PUSH');
  static const continuousScan = ScanFrequency._('CONTINUOUS_SCAN');
  static const manual = ScanFrequency._('MANUAL');

  final String value;

  const ScanFrequency._(this.value);

  static const values = [scanOnPush, continuousScan, manual];

  static ScanFrequency fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanFrequency._(value));

  @override
  bool operator ==(other) => other is ScanFrequency && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of a scanning repository filter. For more information on how to
/// use filters, see <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html#image-scanning-filters">Using
/// filters</a> in the <i>Amazon Elastic Container Registry User Guide</i>.
///
/// @nodoc
class ScanningRepositoryFilter {
  /// The filter to use when scanning.
  final String filter;

  /// The type associated with the filter.
  final ScanningRepositoryFilterType filterType;

  ScanningRepositoryFilter({
    required this.filter,
    required this.filterType,
  });

  factory ScanningRepositoryFilter.fromJson(Map<String, dynamic> json) {
    return ScanningRepositoryFilter(
      filter: (json['filter'] as String?) ?? '',
      filterType: ScanningRepositoryFilterType.fromString(
          (json['filterType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final filter = this.filter;
    final filterType = this.filterType;
    return {
      'filter': filter,
      'filterType': filterType.value,
    };
  }
}

/// @nodoc
class ScanningRepositoryFilterType {
  static const wildcard = ScanningRepositoryFilterType._('WILDCARD');

  final String value;

  const ScanningRepositoryFilterType._(this.value);

  static const values = [wildcard];

  static ScanningRepositoryFilterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanningRepositoryFilterType._(value));

  @override
  bool operator ==(other) =>
      other is ScanningRepositoryFilterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The image scanning configuration for a repository.
///
/// @nodoc
class ImageScanningConfiguration {
  /// The setting that determines whether images are scanned after being pushed to
  /// a repository. If set to <code>true</code>, images will be scanned after
  /// being pushed. If this parameter is not specified, it will default to
  /// <code>false</code> and images will not be scanned unless a scan is manually
  /// started with the <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/APIReference/API_StartImageScan.html">API_StartImageScan</a>
  /// API.
  final bool? scanOnPush;

  ImageScanningConfiguration({
    this.scanOnPush,
  });

  factory ImageScanningConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageScanningConfiguration(
      scanOnPush: json['scanOnPush'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final scanOnPush = this.scanOnPush;
    return {
      if (scanOnPush != null) 'scanOnPush': scanOnPush,
    };
  }
}

/// An object representing an Amazon ECR image.
///
/// @nodoc
class Image {
  /// An object containing the image tag and image digest associated with an
  /// image.
  final ImageIdentifier? imageId;

  /// The image manifest associated with the image.
  final String? imageManifest;

  /// The manifest media type of the image.
  final String? imageManifestMediaType;

  /// The Amazon Web Services account ID associated with the registry containing
  /// the image.
  final String? registryId;

  /// The name of the repository associated with the image.
  final String? repositoryName;

  Image({
    this.imageId,
    this.imageManifest,
    this.imageManifestMediaType,
    this.registryId,
    this.repositoryName,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      imageId: json['imageId'] != null
          ? ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>)
          : null,
      imageManifest: json['imageManifest'] as String?,
      imageManifestMediaType: json['imageManifestMediaType'] as String?,
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageId = this.imageId;
    final imageManifest = this.imageManifest;
    final imageManifestMediaType = this.imageManifestMediaType;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (imageId != null) 'imageId': imageId,
      if (imageManifest != null) 'imageManifest': imageManifest,
      if (imageManifestMediaType != null)
        'imageManifestMediaType': imageManifestMediaType,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// An object representing a filter on a <a>ListImages</a> operation.
///
/// @nodoc
class ListImagesFilter {
  /// The image status with which to filter your <a>ListImages</a> results. Valid
  /// values are <code>ACTIVE</code>, <code>ARCHIVED</code>, and
  /// <code>ACTIVATING</code>. If not specified, only images with
  /// <code>ACTIVE</code> status are returned.
  final ImageStatusFilter? imageStatus;

  /// The tag status with which to filter your <a>ListImages</a> results.
  final TagStatus? tagStatus;

  ListImagesFilter({
    this.imageStatus,
    this.tagStatus,
  });

  Map<String, dynamic> toJson() {
    final imageStatus = this.imageStatus;
    final tagStatus = this.tagStatus;
    return {
      if (imageStatus != null) 'imageStatus': imageStatus.value,
      if (tagStatus != null) 'tagStatus': tagStatus.value,
    };
  }
}

/// @nodoc
class TagStatus {
  static const tagged = TagStatus._('TAGGED');
  static const untagged = TagStatus._('UNTAGGED');
  static const any = TagStatus._('ANY');

  final String value;

  const TagStatus._(this.value);

  static const values = [tagged, untagged, any];

  static TagStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TagStatus._(value));

  @override
  bool operator ==(other) => other is TagStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ImageStatusFilter {
  static const active = ImageStatusFilter._('ACTIVE');
  static const archived = ImageStatusFilter._('ARCHIVED');
  static const activating = ImageStatusFilter._('ACTIVATING');
  static const any = ImageStatusFilter._('ANY');

  final String value;

  const ImageStatusFilter._(this.value);

  static const values = [active, archived, activating, any];

  static ImageStatusFilter fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageStatusFilter._(value));

  @override
  bool operator ==(other) => other is ImageStatusFilter && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing an artifact associated with a subject image.
///
/// @nodoc
class ImageReferrer {
  /// The digest of the artifact manifest.
  final String digest;

  /// The media type of the artifact manifest.
  final String mediaType;

  /// The size, in bytes, of the artifact.
  final int size;

  /// A map of annotations associated with the artifact.
  final Map<String, String>? annotations;

  /// The status of the artifact. Valid values are <code>ACTIVE</code>,
  /// <code>ARCHIVED</code>, or <code>ACTIVATING</code>.
  final ArtifactStatus? artifactStatus;

  /// A string identifying the type of artifact.
  final String? artifactType;

  ImageReferrer({
    required this.digest,
    required this.mediaType,
    required this.size,
    this.annotations,
    this.artifactStatus,
    this.artifactType,
  });

  factory ImageReferrer.fromJson(Map<String, dynamic> json) {
    return ImageReferrer(
      digest: (json['digest'] as String?) ?? '',
      mediaType: (json['mediaType'] as String?) ?? '',
      size: (json['size'] as int?) ?? 0,
      annotations: (json['annotations'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      artifactStatus:
          (json['artifactStatus'] as String?)?.let(ArtifactStatus.fromString),
      artifactType: json['artifactType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final digest = this.digest;
    final mediaType = this.mediaType;
    final size = this.size;
    final annotations = this.annotations;
    final artifactStatus = this.artifactStatus;
    final artifactType = this.artifactType;
    return {
      'digest': digest,
      'mediaType': mediaType,
      'size': size,
      if (annotations != null) 'annotations': annotations,
      if (artifactStatus != null) 'artifactStatus': artifactStatus.value,
      if (artifactType != null) 'artifactType': artifactType,
    };
  }
}

/// @nodoc
class ArtifactStatus {
  static const active = ArtifactStatus._('ACTIVE');
  static const archived = ArtifactStatus._('ARCHIVED');
  static const activating = ArtifactStatus._('ACTIVATING');

  final String value;

  const ArtifactStatus._(this.value);

  static const values = [active, archived, activating];

  static ArtifactStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ArtifactStatus._(value));

  @override
  bool operator ==(other) => other is ArtifactStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object that identifies an image subject.
///
/// @nodoc
class SubjectIdentifier {
  /// The digest of the image.
  final String imageDigest;

  SubjectIdentifier({
    required this.imageDigest,
  });

  Map<String, dynamic> toJson() {
    final imageDigest = this.imageDigest;
    return {
      'imageDigest': imageDigest,
    };
  }
}

/// An object representing a filter on a <a>ListImageReferrers</a> operation.
///
/// @nodoc
class ListImageReferrersFilter {
  /// The artifact status with which to filter your <a>ListImageReferrers</a>
  /// results. Valid values are <code>ACTIVE</code>, <code>ARCHIVED</code>,
  /// <code>ACTIVATING</code>, or <code>ANY</code>. If not specified, only
  /// artifacts with <code>ACTIVE</code> status are returned.
  final ArtifactStatusFilter? artifactStatus;

  /// The artifact types with which to filter your <a>ListImageReferrers</a>
  /// results.
  final List<String>? artifactTypes;

  ListImageReferrersFilter({
    this.artifactStatus,
    this.artifactTypes,
  });

  Map<String, dynamic> toJson() {
    final artifactStatus = this.artifactStatus;
    final artifactTypes = this.artifactTypes;
    return {
      if (artifactStatus != null) 'artifactStatus': artifactStatus.value,
      if (artifactTypes != null) 'artifactTypes': artifactTypes,
    };
  }
}

/// @nodoc
class ArtifactStatusFilter {
  static const active = ArtifactStatusFilter._('ACTIVE');
  static const archived = ArtifactStatusFilter._('ARCHIVED');
  static const activating = ArtifactStatusFilter._('ACTIVATING');
  static const any = ArtifactStatusFilter._('ANY');

  final String value;

  const ArtifactStatusFilter._(this.value);

  static const values = [active, archived, activating, any];

  static ArtifactStatusFilter fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ArtifactStatusFilter._(value));

  @override
  bool operator ==(other) =>
      other is ArtifactStatusFilter && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The summary of the lifecycle policy preview request.
///
/// @nodoc
class LifecyclePolicyPreviewSummary {
  /// The number of expiring images.
  final int? expiringImageTotalCount;

  /// The total count of images that will be transitioned to each storage class.
  /// This field is only present if at least one image will be transitoned in the
  /// summary.
  final List<TransitioningImageTotalCount>? transitioningImageTotalCounts;

  LifecyclePolicyPreviewSummary({
    this.expiringImageTotalCount,
    this.transitioningImageTotalCounts,
  });

  factory LifecyclePolicyPreviewSummary.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyPreviewSummary(
      expiringImageTotalCount: json['expiringImageTotalCount'] as int?,
      transitioningImageTotalCounts: (json['transitioningImageTotalCounts']
              as List?)
          ?.nonNulls
          .map((e) =>
              TransitioningImageTotalCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final expiringImageTotalCount = this.expiringImageTotalCount;
    final transitioningImageTotalCounts = this.transitioningImageTotalCounts;
    return {
      if (expiringImageTotalCount != null)
        'expiringImageTotalCount': expiringImageTotalCount,
      if (transitioningImageTotalCounts != null)
        'transitioningImageTotalCounts': transitioningImageTotalCounts,
    };
  }
}

/// The total count of images transitioning to a storage class.
///
/// @nodoc
class TransitioningImageTotalCount {
  /// The total number of images transitioning to the storage class.
  final int? imageTotalCount;

  /// The target storage class.
  final LifecyclePolicyTargetStorageClass? targetStorageClass;

  TransitioningImageTotalCount({
    this.imageTotalCount,
    this.targetStorageClass,
  });

  factory TransitioningImageTotalCount.fromJson(Map<String, dynamic> json) {
    return TransitioningImageTotalCount(
      imageTotalCount: json['imageTotalCount'] as int?,
      targetStorageClass: (json['targetStorageClass'] as String?)
          ?.let(LifecyclePolicyTargetStorageClass.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final imageTotalCount = this.imageTotalCount;
    final targetStorageClass = this.targetStorageClass;
    return {
      if (imageTotalCount != null) 'imageTotalCount': imageTotalCount,
      if (targetStorageClass != null)
        'targetStorageClass': targetStorageClass.value,
    };
  }
}

/// @nodoc
class LifecyclePolicyTargetStorageClass {
  static const archive = LifecyclePolicyTargetStorageClass._('ARCHIVE');

  final String value;

  const LifecyclePolicyTargetStorageClass._(this.value);

  static const values = [archive];

  static LifecyclePolicyTargetStorageClass fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LifecyclePolicyTargetStorageClass._(value));

  @override
  bool operator ==(other) =>
      other is LifecyclePolicyTargetStorageClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The result of the lifecycle policy preview.
///
/// @nodoc
class LifecyclePolicyPreviewResult {
  /// The type of action to be taken.
  final LifecyclePolicyRuleAction? action;

  /// The priority of the applied rule.
  final int? appliedRulePriority;

  /// The <code>sha256</code> digest of the image manifest.
  final String? imageDigest;

  /// The date and time, expressed in standard JavaScript date format, at which
  /// the current image was pushed to the repository.
  final DateTime? imagePushedAt;

  /// The list of tags associated with this image.
  final List<String>? imageTags;

  /// The storage class of the image.
  final LifecyclePolicyStorageClass? storageClass;

  LifecyclePolicyPreviewResult({
    this.action,
    this.appliedRulePriority,
    this.imageDigest,
    this.imagePushedAt,
    this.imageTags,
    this.storageClass,
  });

  factory LifecyclePolicyPreviewResult.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyPreviewResult(
      action: json['action'] != null
          ? LifecyclePolicyRuleAction.fromJson(
              json['action'] as Map<String, dynamic>)
          : null,
      appliedRulePriority: json['appliedRulePriority'] as int?,
      imageDigest: json['imageDigest'] as String?,
      imagePushedAt: timeStampFromJson(json['imagePushedAt']),
      imageTags: (json['imageTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      storageClass: (json['storageClass'] as String?)
          ?.let(LifecyclePolicyStorageClass.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final appliedRulePriority = this.appliedRulePriority;
    final imageDigest = this.imageDigest;
    final imagePushedAt = this.imagePushedAt;
    final imageTags = this.imageTags;
    final storageClass = this.storageClass;
    return {
      if (action != null) 'action': action,
      if (appliedRulePriority != null)
        'appliedRulePriority': appliedRulePriority,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (imagePushedAt != null)
        'imagePushedAt': unixTimestampToJson(imagePushedAt),
      if (imageTags != null) 'imageTags': imageTags,
      if (storageClass != null) 'storageClass': storageClass.value,
    };
  }
}

/// The type of action to be taken.
///
/// @nodoc
class LifecyclePolicyRuleAction {
  /// The target storage class for the action. This is only present when the
  /// <code>type</code> is <code>TRANSITION.</code>
  final LifecyclePolicyTargetStorageClass? targetStorageClass;

  /// The type of action to be taken.
  final ImageActionType? type;

  LifecyclePolicyRuleAction({
    this.targetStorageClass,
    this.type,
  });

  factory LifecyclePolicyRuleAction.fromJson(Map<String, dynamic> json) {
    return LifecyclePolicyRuleAction(
      targetStorageClass: (json['targetStorageClass'] as String?)
          ?.let(LifecyclePolicyTargetStorageClass.fromString),
      type: (json['type'] as String?)?.let(ImageActionType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final targetStorageClass = this.targetStorageClass;
    final type = this.type;
    return {
      if (targetStorageClass != null)
        'targetStorageClass': targetStorageClass.value,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class LifecyclePolicyStorageClass {
  static const archive = LifecyclePolicyStorageClass._('ARCHIVE');
  static const standard = LifecyclePolicyStorageClass._('STANDARD');

  final String value;

  const LifecyclePolicyStorageClass._(this.value);

  static const values = [archive, standard];

  static LifecyclePolicyStorageClass fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LifecyclePolicyStorageClass._(value));

  @override
  bool operator ==(other) =>
      other is LifecyclePolicyStorageClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ImageActionType {
  static const expire = ImageActionType._('EXPIRE');
  static const transition = ImageActionType._('TRANSITION');

  final String value;

  const ImageActionType._(this.value);

  static const values = [expire, transition];

  static ImageActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageActionType._(value));

  @override
  bool operator ==(other) => other is ImageActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The filter for the lifecycle policy preview.
///
/// @nodoc
class LifecyclePolicyPreviewFilter {
  /// The tag status of the image.
  final TagStatus? tagStatus;

  LifecyclePolicyPreviewFilter({
    this.tagStatus,
  });

  Map<String, dynamic> toJson() {
    final tagStatus = this.tagStatus;
    return {
      if (tagStatus != null) 'tagStatus': tagStatus.value,
    };
  }
}

/// An object representing authorization data for an Amazon ECR registry.
///
/// @nodoc
class AuthorizationData {
  /// A base64-encoded string that contains authorization data for the specified
  /// Amazon ECR registry. When the string is decoded, it is presented in the
  /// format <code>user:password</code> for private registry authentication using
  /// <code>docker login</code>.
  final String? authorizationToken;

  /// The Unix time in seconds and milliseconds when the authorization token
  /// expires. Authorization tokens are valid for 12 hours.
  final DateTime? expiresAt;

  /// The registry URL to use for this authorization token in a <code>docker
  /// login</code> command. The Amazon ECR registry URL format is
  /// <code>https://aws_account_id.dkr.ecr.region.amazonaws.com</code>. For
  /// example, <code>https://012345678910.dkr.ecr.us-east-1.amazonaws.com</code>..
  final String? proxyEndpoint;

  AuthorizationData({
    this.authorizationToken,
    this.expiresAt,
    this.proxyEndpoint,
  });

  factory AuthorizationData.fromJson(Map<String, dynamic> json) {
    return AuthorizationData(
      authorizationToken: json['authorizationToken'] as String?,
      expiresAt: timeStampFromJson(json['expiresAt']),
      proxyEndpoint: json['proxyEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationToken = this.authorizationToken;
    final expiresAt = this.expiresAt;
    final proxyEndpoint = this.proxyEndpoint;
    return {
      if (authorizationToken != null) 'authorizationToken': authorizationToken,
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
      if (proxyEndpoint != null) 'proxyEndpoint': proxyEndpoint,
    };
  }
}

/// An object representing a repository.
///
/// @nodoc
class Repository {
  /// The date and time, in JavaScript date format, when the repository was
  /// created.
  final DateTime? createdAt;

  /// The encryption configuration for the repository. This determines how the
  /// contents of your repository are encrypted at rest.
  final EncryptionConfiguration? encryptionConfiguration;
  final ImageScanningConfiguration? imageScanningConfiguration;

  /// The tag mutability setting for the repository.
  final ImageTagMutability? imageTagMutability;

  /// A list of filters that specify which image tags are excluded from the
  /// repository's image tag mutability setting.
  final List<ImageTagMutabilityExclusionFilter>?
      imageTagMutabilityExclusionFilters;

  /// The Amazon Web Services account ID associated with the registry that
  /// contains the repository.
  final String? registryId;

  /// The Amazon Resource Name (ARN) that identifies the repository. The ARN
  /// contains the <code>arn:aws:ecr</code> namespace, followed by the region of
  /// the repository, Amazon Web Services account ID of the repository owner,
  /// repository namespace, and repository name. For example,
  /// <code>arn:aws:ecr:region:012345678910:repository-namespace/repository-name</code>.
  final String? repositoryArn;

  /// The name of the repository.
  final String? repositoryName;

  /// The URI for the repository. You can use this URI for container image
  /// <code>push</code> and <code>pull</code> operations.
  final String? repositoryUri;

  Repository({
    this.createdAt,
    this.encryptionConfiguration,
    this.imageScanningConfiguration,
    this.imageTagMutability,
    this.imageTagMutabilityExclusionFilters,
    this.registryId,
    this.repositoryArn,
    this.repositoryName,
    this.repositoryUri,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      createdAt: timeStampFromJson(json['createdAt']),
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      imageScanningConfiguration: json['imageScanningConfiguration'] != null
          ? ImageScanningConfiguration.fromJson(
              json['imageScanningConfiguration'] as Map<String, dynamic>)
          : null,
      imageTagMutability: (json['imageTagMutability'] as String?)
          ?.let(ImageTagMutability.fromString),
      imageTagMutabilityExclusionFilters:
          (json['imageTagMutabilityExclusionFilters'] as List?)
              ?.nonNulls
              .map((e) => ImageTagMutabilityExclusionFilter.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      registryId: json['registryId'] as String?,
      repositoryArn: json['repositoryArn'] as String?,
      repositoryName: json['repositoryName'] as String?,
      repositoryUri: json['repositoryUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final encryptionConfiguration = this.encryptionConfiguration;
    final imageScanningConfiguration = this.imageScanningConfiguration;
    final imageTagMutability = this.imageTagMutability;
    final imageTagMutabilityExclusionFilters =
        this.imageTagMutabilityExclusionFilters;
    final registryId = this.registryId;
    final repositoryArn = this.repositoryArn;
    final repositoryName = this.repositoryName;
    final repositoryUri = this.repositoryUri;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (imageScanningConfiguration != null)
        'imageScanningConfiguration': imageScanningConfiguration,
      if (imageTagMutability != null)
        'imageTagMutability': imageTagMutability.value,
      if (imageTagMutabilityExclusionFilters != null)
        'imageTagMutabilityExclusionFilters':
            imageTagMutabilityExclusionFilters,
      if (registryId != null) 'registryId': registryId,
      if (repositoryArn != null) 'repositoryArn': repositoryArn,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (repositoryUri != null) 'repositoryUri': repositoryUri,
    };
  }
}

/// The encryption configuration for the repository. This determines how the
/// contents of your repository are encrypted at rest.
///
/// By default, when no encryption configuration is set or the
/// <code>AES256</code> encryption type is used, Amazon ECR uses server-side
/// encryption with Amazon S3-managed encryption keys which encrypts your data
/// at rest using an AES256 encryption algorithm. This does not require any
/// action on your part.
///
/// For more control over the encryption of the contents of your repository, you
/// can use server-side encryption with Key Management Service key stored in Key
/// Management Service (KMS) to encrypt your images. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/encryption-at-rest.html">Amazon
/// ECR encryption at rest</a> in the <i>Amazon Elastic Container Registry User
/// Guide</i>.
///
/// @nodoc
class EncryptionConfiguration {
  /// The encryption type to use.
  ///
  /// If you use the <code>KMS</code> encryption type, the contents of the
  /// repository will be encrypted using server-side encryption with Key
  /// Management Service key stored in KMS. When you use KMS to encrypt your data,
  /// you can either use the default Amazon Web Services managed KMS key for
  /// Amazon ECR, or specify your own KMS key, which you already created.
  ///
  /// If you use the <code>KMS_DSSE</code> encryption type, the contents of the
  /// repository will be encrypted with two layers of encryption using server-side
  /// encryption with the KMS Management Service key stored in KMS. Similar to the
  /// <code>KMS</code> encryption type, you can either use the default Amazon Web
  /// Services managed KMS key for Amazon ECR, or specify your own KMS key, which
  /// you've already created.
  ///
  /// If you use the <code>AES256</code> encryption type, Amazon ECR uses
  /// server-side encryption with Amazon S3-managed encryption keys which encrypts
  /// the images in the repository using an AES256 encryption algorithm.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/encryption-at-rest.html">Amazon
  /// ECR encryption at rest</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  final EncryptionType encryptionType;

  /// If you use the <code>KMS</code> encryption type, specify the KMS key to use
  /// for encryption. The alias, key ID, or full ARN of the KMS key can be
  /// specified. The key must exist in the same Region as the repository. If no
  /// key is specified, the default Amazon Web Services managed KMS key for Amazon
  /// ECR will be used.
  final String? kmsKey;

  EncryptionConfiguration({
    required this.encryptionType,
    this.kmsKey,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      encryptionType:
          EncryptionType.fromString((json['encryptionType'] as String?) ?? ''),
      kmsKey: json['kmsKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionType = this.encryptionType;
    final kmsKey = this.kmsKey;
    return {
      'encryptionType': encryptionType.value,
      if (kmsKey != null) 'kmsKey': kmsKey,
    };
  }
}

/// The details of a pull through cache rule.
///
/// @nodoc
class PullThroughCacheRule {
  /// The date and time the pull through cache was created.
  final DateTime? createdAt;

  /// The ARN of the Secrets Manager secret associated with the pull through cache
  /// rule.
  final String? credentialArn;

  /// The ARN of the IAM role associated with the pull through cache rule.
  final String? customRoleArn;

  /// The Amazon ECR repository prefix associated with the pull through cache
  /// rule.
  final String? ecrRepositoryPrefix;

  /// The Amazon Web Services account ID associated with the registry the pull
  /// through cache rule is associated with.
  final String? registryId;

  /// The date and time, in JavaScript date format, when the pull through cache
  /// rule was last updated.
  final DateTime? updatedAt;

  /// The name of the upstream source registry associated with the pull through
  /// cache rule.
  final UpstreamRegistry? upstreamRegistry;

  /// The upstream registry URL associated with the pull through cache rule.
  final String? upstreamRegistryUrl;

  /// The upstream repository prefix associated with the pull through cache rule.
  final String? upstreamRepositoryPrefix;

  PullThroughCacheRule({
    this.createdAt,
    this.credentialArn,
    this.customRoleArn,
    this.ecrRepositoryPrefix,
    this.registryId,
    this.updatedAt,
    this.upstreamRegistry,
    this.upstreamRegistryUrl,
    this.upstreamRepositoryPrefix,
  });

  factory PullThroughCacheRule.fromJson(Map<String, dynamic> json) {
    return PullThroughCacheRule(
      createdAt: timeStampFromJson(json['createdAt']),
      credentialArn: json['credentialArn'] as String?,
      customRoleArn: json['customRoleArn'] as String?,
      ecrRepositoryPrefix: json['ecrRepositoryPrefix'] as String?,
      registryId: json['registryId'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      upstreamRegistry: (json['upstreamRegistry'] as String?)
          ?.let(UpstreamRegistry.fromString),
      upstreamRegistryUrl: json['upstreamRegistryUrl'] as String?,
      upstreamRepositoryPrefix: json['upstreamRepositoryPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final credentialArn = this.credentialArn;
    final customRoleArn = this.customRoleArn;
    final ecrRepositoryPrefix = this.ecrRepositoryPrefix;
    final registryId = this.registryId;
    final updatedAt = this.updatedAt;
    final upstreamRegistry = this.upstreamRegistry;
    final upstreamRegistryUrl = this.upstreamRegistryUrl;
    final upstreamRepositoryPrefix = this.upstreamRepositoryPrefix;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (credentialArn != null) 'credentialArn': credentialArn,
      if (customRoleArn != null) 'customRoleArn': customRoleArn,
      if (ecrRepositoryPrefix != null)
        'ecrRepositoryPrefix': ecrRepositoryPrefix,
      if (registryId != null) 'registryId': registryId,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
      if (upstreamRegistry != null) 'upstreamRegistry': upstreamRegistry.value,
      if (upstreamRegistryUrl != null)
        'upstreamRegistryUrl': upstreamRegistryUrl,
      if (upstreamRepositoryPrefix != null)
        'upstreamRepositoryPrefix': upstreamRepositoryPrefix,
    };
  }
}

/// @nodoc
class UpstreamRegistry {
  static const ecr = UpstreamRegistry._('ecr');
  static const ecrPublic = UpstreamRegistry._('ecr-public');
  static const quay = UpstreamRegistry._('quay');
  static const k8s = UpstreamRegistry._('k8s');
  static const dockerHub = UpstreamRegistry._('docker-hub');
  static const githubContainerRegistry =
      UpstreamRegistry._('github-container-registry');
  static const azureContainerRegistry =
      UpstreamRegistry._('azure-container-registry');
  static const gitlabContainerRegistry =
      UpstreamRegistry._('gitlab-container-registry');
  static const chainguard = UpstreamRegistry._('chainguard');

  final String value;

  const UpstreamRegistry._(this.value);

  static const values = [
    ecr,
    ecrPublic,
    quay,
    k8s,
    dockerHub,
    githubContainerRegistry,
    azureContainerRegistry,
    gitlabContainerRegistry,
    chainguard
  ];

  static UpstreamRegistry fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => UpstreamRegistry._(value));

  @override
  bool operator ==(other) => other is UpstreamRegistry && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The signing status for an image. Each status corresponds to a signing
/// profile.
///
/// @nodoc
class ImageSigningStatus {
  /// The failure code, which is only present if <code>status</code> is
  /// <code>FAILED</code>.
  final String? failureCode;

  /// A description of why signing the image failed. This field is only present if
  /// <code>status</code> is <code>FAILED</code>.
  final String? failureReason;

  /// The ARN of the Amazon Web Services Signer signing profile used to sign the
  /// image.
  final String? signingProfileArn;

  /// The image's signing status. Possible values are:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code> - Signing is currently in progress.
  /// </li>
  /// <li>
  /// <code>COMPLETE</code> - The signature was successfully generated.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - Signing failed. See <code>failureCode</code> and
  /// <code>failureReason</code> for details.
  /// </li>
  /// </ul>
  final SigningStatus? status;

  ImageSigningStatus({
    this.failureCode,
    this.failureReason,
    this.signingProfileArn,
    this.status,
  });

  factory ImageSigningStatus.fromJson(Map<String, dynamic> json) {
    return ImageSigningStatus(
      failureCode: json['failureCode'] as String?,
      failureReason: json['failureReason'] as String?,
      signingProfileArn: json['signingProfileArn'] as String?,
      status: (json['status'] as String?)?.let(SigningStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final signingProfileArn = this.signingProfileArn;
    final status = this.status;
    return {
      if (failureCode != null) 'failureCode': failureCode,
      if (failureReason != null) 'failureReason': failureReason,
      if (signingProfileArn != null) 'signingProfileArn': signingProfileArn,
      if (status != null) 'status': status.value,
    };
  }
}

/// The image signing status. Possible values include <code>IN_PROGRESS</code>,
/// <code>COMPLETE</code>, and <code>FAILED</code>.
///
/// @nodoc
class SigningStatus {
  static const inProgress = SigningStatus._('IN_PROGRESS');
  static const complete = SigningStatus._('COMPLETE');
  static const failed = SigningStatus._('FAILED');

  final String value;

  const SigningStatus._(this.value);

  static const values = [inProgress, complete, failed];

  static SigningStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SigningStatus._(value));

  @override
  bool operator ==(other) => other is SigningStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of an image scan.
///
/// @nodoc
class ImageScanFindings {
  /// Details about the enhanced scan findings from Amazon Inspector.
  final List<EnhancedImageScanFinding>? enhancedFindings;

  /// The image vulnerability counts, sorted by severity.
  final Map<FindingSeverity, int>? findingSeverityCounts;

  /// The findings from the image scan.
  final List<ImageScanFinding>? findings;

  /// The time of the last completed image scan.
  final DateTime? imageScanCompletedAt;

  /// The time when the vulnerability data was last scanned.
  final DateTime? vulnerabilitySourceUpdatedAt;

  ImageScanFindings({
    this.enhancedFindings,
    this.findingSeverityCounts,
    this.findings,
    this.imageScanCompletedAt,
    this.vulnerabilitySourceUpdatedAt,
  });

  factory ImageScanFindings.fromJson(Map<String, dynamic> json) {
    return ImageScanFindings(
      enhancedFindings: (json['enhancedFindings'] as List?)
          ?.nonNulls
          .map((e) =>
              EnhancedImageScanFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      findingSeverityCounts: (json['findingSeverityCounts']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(FindingSeverity.fromString(k), e as int)),
      findings: (json['findings'] as List?)
          ?.nonNulls
          .map((e) => ImageScanFinding.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageScanCompletedAt: timeStampFromJson(json['imageScanCompletedAt']),
      vulnerabilitySourceUpdatedAt:
          timeStampFromJson(json['vulnerabilitySourceUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final enhancedFindings = this.enhancedFindings;
    final findingSeverityCounts = this.findingSeverityCounts;
    final findings = this.findings;
    final imageScanCompletedAt = this.imageScanCompletedAt;
    final vulnerabilitySourceUpdatedAt = this.vulnerabilitySourceUpdatedAt;
    return {
      if (enhancedFindings != null) 'enhancedFindings': enhancedFindings,
      if (findingSeverityCounts != null)
        'findingSeverityCounts':
            findingSeverityCounts.map((k, e) => MapEntry(k.value, e)),
      if (findings != null) 'findings': findings,
      if (imageScanCompletedAt != null)
        'imageScanCompletedAt': unixTimestampToJson(imageScanCompletedAt),
      if (vulnerabilitySourceUpdatedAt != null)
        'vulnerabilitySourceUpdatedAt':
            unixTimestampToJson(vulnerabilitySourceUpdatedAt),
    };
  }
}

/// The details of an enhanced image scan. This is returned when enhanced
/// scanning is enabled for your private registry.
///
/// @nodoc
class EnhancedImageScanFinding {
  /// The Amazon Web Services account ID associated with the image.
  final String? awsAccountId;

  /// The description of the finding.
  final String? description;

  /// If a finding discovered in your environment has an exploit available.
  final String? exploitAvailable;

  /// The Amazon Resource Number (ARN) of the finding.
  final String? findingArn;

  /// The date and time that the finding was first observed.
  final DateTime? firstObservedAt;

  /// Details on whether a fix is available through a version update. This value
  /// can be <code>YES</code>, <code>NO</code>, or <code>PARTIAL</code>. A
  /// <code>PARTIAL</code> fix means that some, but not all, of the packages
  /// identified in the finding have fixes available through updated versions.
  final String? fixAvailable;

  /// The date and time that the finding was last observed.
  final DateTime? lastObservedAt;

  /// An object that contains the details of a package vulnerability finding.
  final PackageVulnerabilityDetails? packageVulnerabilityDetails;

  /// An object that contains the details about how to remediate a finding.
  final Remediation? remediation;

  /// Contains information on the resources involved in a finding.
  final List<Resource>? resources;

  /// The Amazon Inspector score given to the finding.
  final double? score;

  /// An object that contains details of the Amazon Inspector score.
  final ScoreDetails? scoreDetails;

  /// The severity of the finding.
  final String? severity;

  /// The status of the finding.
  final String? status;

  /// The title of the finding.
  final String? title;

  /// The type of the finding.
  final String? type;

  /// The date and time the finding was last updated at.
  final DateTime? updatedAt;

  EnhancedImageScanFinding({
    this.awsAccountId,
    this.description,
    this.exploitAvailable,
    this.findingArn,
    this.firstObservedAt,
    this.fixAvailable,
    this.lastObservedAt,
    this.packageVulnerabilityDetails,
    this.remediation,
    this.resources,
    this.score,
    this.scoreDetails,
    this.severity,
    this.status,
    this.title,
    this.type,
    this.updatedAt,
  });

  factory EnhancedImageScanFinding.fromJson(Map<String, dynamic> json) {
    return EnhancedImageScanFinding(
      awsAccountId: json['awsAccountId'] as String?,
      description: json['description'] as String?,
      exploitAvailable: json['exploitAvailable'] as String?,
      findingArn: json['findingArn'] as String?,
      firstObservedAt: timeStampFromJson(json['firstObservedAt']),
      fixAvailable: json['fixAvailable'] as String?,
      lastObservedAt: timeStampFromJson(json['lastObservedAt']),
      packageVulnerabilityDetails: json['packageVulnerabilityDetails'] != null
          ? PackageVulnerabilityDetails.fromJson(
              json['packageVulnerabilityDetails'] as Map<String, dynamic>)
          : null,
      remediation: json['remediation'] != null
          ? Remediation.fromJson(json['remediation'] as Map<String, dynamic>)
          : null,
      resources: (json['resources'] as List?)
          ?.nonNulls
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: json['score'] as double?,
      scoreDetails: json['scoreDetails'] != null
          ? ScoreDetails.fromJson(json['scoreDetails'] as Map<String, dynamic>)
          : null,
      severity: json['severity'] as String?,
      status: json['status'] as String?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final awsAccountId = this.awsAccountId;
    final description = this.description;
    final exploitAvailable = this.exploitAvailable;
    final findingArn = this.findingArn;
    final firstObservedAt = this.firstObservedAt;
    final fixAvailable = this.fixAvailable;
    final lastObservedAt = this.lastObservedAt;
    final packageVulnerabilityDetails = this.packageVulnerabilityDetails;
    final remediation = this.remediation;
    final resources = this.resources;
    final score = this.score;
    final scoreDetails = this.scoreDetails;
    final severity = this.severity;
    final status = this.status;
    final title = this.title;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (awsAccountId != null) 'awsAccountId': awsAccountId,
      if (description != null) 'description': description,
      if (exploitAvailable != null) 'exploitAvailable': exploitAvailable,
      if (findingArn != null) 'findingArn': findingArn,
      if (firstObservedAt != null)
        'firstObservedAt': unixTimestampToJson(firstObservedAt),
      if (fixAvailable != null) 'fixAvailable': fixAvailable,
      if (lastObservedAt != null)
        'lastObservedAt': unixTimestampToJson(lastObservedAt),
      if (packageVulnerabilityDetails != null)
        'packageVulnerabilityDetails': packageVulnerabilityDetails,
      if (remediation != null) 'remediation': remediation,
      if (resources != null) 'resources': resources,
      if (score != null) 'score': score,
      if (scoreDetails != null) 'scoreDetails': scoreDetails,
      if (severity != null) 'severity': severity,
      if (status != null) 'status': status,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Information about a package vulnerability finding.
///
/// @nodoc
class PackageVulnerabilityDetails {
  /// An object that contains details about the CVSS score of a finding.
  final List<CvssScore>? cvss;

  /// One or more URLs that contain details about this vulnerability type.
  final List<String>? referenceUrls;

  /// One or more vulnerabilities related to the one identified in this finding.
  final List<String>? relatedVulnerabilities;

  /// The source of the vulnerability information.
  final String? source;

  /// A URL to the source of the vulnerability information.
  final String? sourceUrl;

  /// The date and time that this vulnerability was first added to the vendor's
  /// database.
  final DateTime? vendorCreatedAt;

  /// The severity the vendor has given to this vulnerability type.
  final String? vendorSeverity;

  /// The date and time the vendor last updated this vulnerability in their
  /// database.
  final DateTime? vendorUpdatedAt;

  /// The ID given to this vulnerability.
  final String? vulnerabilityId;

  /// The packages impacted by this vulnerability.
  final List<VulnerablePackage>? vulnerablePackages;

  PackageVulnerabilityDetails({
    this.cvss,
    this.referenceUrls,
    this.relatedVulnerabilities,
    this.source,
    this.sourceUrl,
    this.vendorCreatedAt,
    this.vendorSeverity,
    this.vendorUpdatedAt,
    this.vulnerabilityId,
    this.vulnerablePackages,
  });

  factory PackageVulnerabilityDetails.fromJson(Map<String, dynamic> json) {
    return PackageVulnerabilityDetails(
      cvss: (json['cvss'] as List?)
          ?.nonNulls
          .map((e) => CvssScore.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceUrls: (json['referenceUrls'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      relatedVulnerabilities: (json['relatedVulnerabilities'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      source: json['source'] as String?,
      sourceUrl: json['sourceUrl'] as String?,
      vendorCreatedAt: timeStampFromJson(json['vendorCreatedAt']),
      vendorSeverity: json['vendorSeverity'] as String?,
      vendorUpdatedAt: timeStampFromJson(json['vendorUpdatedAt']),
      vulnerabilityId: json['vulnerabilityId'] as String?,
      vulnerablePackages: (json['vulnerablePackages'] as List?)
          ?.nonNulls
          .map((e) => VulnerablePackage.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cvss = this.cvss;
    final referenceUrls = this.referenceUrls;
    final relatedVulnerabilities = this.relatedVulnerabilities;
    final source = this.source;
    final sourceUrl = this.sourceUrl;
    final vendorCreatedAt = this.vendorCreatedAt;
    final vendorSeverity = this.vendorSeverity;
    final vendorUpdatedAt = this.vendorUpdatedAt;
    final vulnerabilityId = this.vulnerabilityId;
    final vulnerablePackages = this.vulnerablePackages;
    return {
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
      if (vulnerabilityId != null) 'vulnerabilityId': vulnerabilityId,
      if (vulnerablePackages != null) 'vulnerablePackages': vulnerablePackages,
    };
  }
}

/// Information on how to remediate a finding.
///
/// @nodoc
class Remediation {
  /// An object that contains information about the recommended course of action
  /// to remediate the finding.
  final Recommendation? recommendation;

  Remediation({
    this.recommendation,
  });

  factory Remediation.fromJson(Map<String, dynamic> json) {
    return Remediation(
      recommendation: json['recommendation'] != null
          ? Recommendation.fromJson(
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

/// Information about the Amazon Inspector score given to a finding.
///
/// @nodoc
class ScoreDetails {
  /// An object that contains details about the CVSS score given to a finding.
  final CvssScoreDetails? cvss;

  ScoreDetails({
    this.cvss,
  });

  factory ScoreDetails.fromJson(Map<String, dynamic> json) {
    return ScoreDetails(
      cvss: json['cvss'] != null
          ? CvssScoreDetails.fromJson(json['cvss'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cvss = this.cvss;
    return {
      if (cvss != null) 'cvss': cvss,
    };
  }
}

/// Information about the CVSS score.
///
/// @nodoc
class CvssScoreDetails {
  /// An object that contains details about adjustment Amazon Inspector made to
  /// the CVSS score.
  final List<CvssScoreAdjustment>? adjustments;

  /// The CVSS score.
  final double? score;

  /// The source for the CVSS score.
  final String? scoreSource;

  /// The vector for the CVSS score.
  final String? scoringVector;

  /// The CVSS version used in scoring.
  final String? version;

  CvssScoreDetails({
    this.adjustments,
    this.score,
    this.scoreSource,
    this.scoringVector,
    this.version,
  });

  factory CvssScoreDetails.fromJson(Map<String, dynamic> json) {
    return CvssScoreDetails(
      adjustments: (json['adjustments'] as List?)
          ?.nonNulls
          .map((e) => CvssScoreAdjustment.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: json['score'] as double?,
      scoreSource: json['scoreSource'] as String?,
      scoringVector: json['scoringVector'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adjustments = this.adjustments;
    final score = this.score;
    final scoreSource = this.scoreSource;
    final scoringVector = this.scoringVector;
    final version = this.version;
    return {
      if (adjustments != null) 'adjustments': adjustments,
      if (score != null) 'score': score,
      if (scoreSource != null) 'scoreSource': scoreSource,
      if (scoringVector != null) 'scoringVector': scoringVector,
      if (version != null) 'version': version,
    };
  }
}

/// Details on adjustments Amazon Inspector made to the CVSS score for a
/// finding.
///
/// @nodoc
class CvssScoreAdjustment {
  /// The metric used to adjust the CVSS score.
  final String? metric;

  /// The reason the CVSS score has been adjustment.
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

/// Details about the resource involved in a finding.
///
/// @nodoc
class Resource {
  /// An object that contains details about the resource involved in a finding.
  final ResourceDetails? details;

  /// The ID of the resource.
  final String? id;

  /// The tags attached to the resource.
  final Map<String, String>? tags;

  /// The type of resource.
  final String? type;

  Resource({
    this.details,
    this.id,
    this.tags,
    this.type,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      details: json['details'] != null
          ? ResourceDetails.fromJson(json['details'] as Map<String, dynamic>)
          : null,
      id: json['id'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final details = this.details;
    final id = this.id;
    final tags = this.tags;
    final type = this.type;
    return {
      if (details != null) 'details': details,
      if (id != null) 'id': id,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type,
    };
  }
}

/// Contains details about the resource involved in the finding.
///
/// @nodoc
class ResourceDetails {
  /// An object that contains details about the Amazon ECR container image
  /// involved in the finding.
  final AwsEcrContainerImageDetails? awsEcrContainerImage;

  ResourceDetails({
    this.awsEcrContainerImage,
  });

  factory ResourceDetails.fromJson(Map<String, dynamic> json) {
    return ResourceDetails(
      awsEcrContainerImage: json['awsEcrContainerImage'] != null
          ? AwsEcrContainerImageDetails.fromJson(
              json['awsEcrContainerImage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final awsEcrContainerImage = this.awsEcrContainerImage;
    return {
      if (awsEcrContainerImage != null)
        'awsEcrContainerImage': awsEcrContainerImage,
    };
  }
}

/// The image details of the Amazon ECR container image.
///
/// @nodoc
class AwsEcrContainerImageDetails {
  /// The architecture of the Amazon ECR container image.
  final String? architecture;

  /// The image author of the Amazon ECR container image.
  final String? author;

  /// The image hash of the Amazon ECR container image.
  final String? imageHash;

  /// The image tags attached to the Amazon ECR container image.
  final List<String>? imageTags;

  /// The number of Amazon ECS or Amazon EKS clusters currently running the image.
  final int? inUseCount;

  /// The most recent date and time a cluster was running the image.
  final DateTime? lastInUseAt;

  /// The platform of the Amazon ECR container image.
  final String? platform;

  /// The date and time the Amazon ECR container image was pushed.
  final DateTime? pushedAt;

  /// The registry the Amazon ECR container image belongs to.
  final String? registry;

  /// The name of the repository the Amazon ECR container image resides in.
  final String? repositoryName;

  AwsEcrContainerImageDetails({
    this.architecture,
    this.author,
    this.imageHash,
    this.imageTags,
    this.inUseCount,
    this.lastInUseAt,
    this.platform,
    this.pushedAt,
    this.registry,
    this.repositoryName,
  });

  factory AwsEcrContainerImageDetails.fromJson(Map<String, dynamic> json) {
    return AwsEcrContainerImageDetails(
      architecture: json['architecture'] as String?,
      author: json['author'] as String?,
      imageHash: json['imageHash'] as String?,
      imageTags: (json['imageTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      inUseCount: json['inUseCount'] as int?,
      lastInUseAt: timeStampFromJson(json['lastInUseAt']),
      platform: json['platform'] as String?,
      pushedAt: timeStampFromJson(json['pushedAt']),
      registry: json['registry'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final author = this.author;
    final imageHash = this.imageHash;
    final imageTags = this.imageTags;
    final inUseCount = this.inUseCount;
    final lastInUseAt = this.lastInUseAt;
    final platform = this.platform;
    final pushedAt = this.pushedAt;
    final registry = this.registry;
    final repositoryName = this.repositoryName;
    return {
      if (architecture != null) 'architecture': architecture,
      if (author != null) 'author': author,
      if (imageHash != null) 'imageHash': imageHash,
      if (imageTags != null) 'imageTags': imageTags,
      if (inUseCount != null) 'inUseCount': inUseCount,
      if (lastInUseAt != null) 'lastInUseAt': unixTimestampToJson(lastInUseAt),
      if (platform != null) 'platform': platform,
      if (pushedAt != null) 'pushedAt': unixTimestampToJson(pushedAt),
      if (registry != null) 'registry': registry,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// Details about the recommended course of action to remediate the finding.
///
/// @nodoc
class Recommendation {
  /// The recommended course of action to remediate the finding.
  final String? text;

  /// The URL address to the CVE remediation recommendations.
  final String? url;

  Recommendation({
    this.text,
    this.url,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
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

/// Information on the vulnerable package identified by a finding.
///
/// @nodoc
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
      if (sourceLayerHash != null) 'sourceLayerHash': sourceLayerHash,
      if (version != null) 'version': version,
    };
  }
}

/// The CVSS score for a finding.
///
/// @nodoc
class CvssScore {
  /// The base CVSS score used for the finding.
  final double? baseScore;

  /// The vector string of the CVSS score.
  final String? scoringVector;

  /// The source of the CVSS score.
  final String? source;

  /// The version of CVSS used for the score.
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

/// Contains information about an image scan finding.
///
/// @nodoc
class ImageScanFinding {
  /// A collection of attributes of the host from which the finding is generated.
  final List<Attribute>? attributes;

  /// The description of the finding.
  final String? description;

  /// The name associated with the finding, usually a CVE number.
  final String? name;

  /// The finding severity.
  final FindingSeverity? severity;

  /// A link containing additional details about the security vulnerability.
  final String? uri;

  ImageScanFinding({
    this.attributes,
    this.description,
    this.name,
    this.severity,
    this.uri,
  });

  factory ImageScanFinding.fromJson(Map<String, dynamic> json) {
    return ImageScanFinding(
      attributes: (json['attributes'] as List?)
          ?.nonNulls
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['description'] as String?,
      name: json['name'] as String?,
      severity: (json['severity'] as String?)?.let(FindingSeverity.fromString),
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final description = this.description;
    final name = this.name;
    final severity = this.severity;
    final uri = this.uri;
    return {
      if (attributes != null) 'attributes': attributes,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (severity != null) 'severity': severity.value,
      if (uri != null) 'uri': uri,
    };
  }
}

/// @nodoc
class FindingSeverity {
  static const informational = FindingSeverity._('INFORMATIONAL');
  static const low = FindingSeverity._('LOW');
  static const medium = FindingSeverity._('MEDIUM');
  static const high = FindingSeverity._('HIGH');
  static const critical = FindingSeverity._('CRITICAL');
  static const undefined = FindingSeverity._('UNDEFINED');

  final String value;

  const FindingSeverity._(this.value);

  static const values = [informational, low, medium, high, critical, undefined];

  static FindingSeverity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FindingSeverity._(value));

  @override
  bool operator ==(other) => other is FindingSeverity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This data type is used in the <a>ImageScanFinding</a> data type.
///
/// @nodoc
class Attribute {
  /// The attribute key.
  final String key;

  /// The value assigned to the attribute key.
  final String? value;

  Attribute({
    required this.key,
    this.value,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      key: (json['key'] as String?) ?? '',
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// An object that describes an image returned by a <a>DescribeImages</a>
/// operation.
///
/// @nodoc
class ImageDetail {
  /// The artifact media type of the image.
  final String? artifactMediaType;

  /// The <code>sha256</code> digest of the image manifest.
  final String? imageDigest;

  /// The media type of the image manifest.
  final String? imageManifestMediaType;

  /// The date and time, expressed in standard JavaScript date format, at which
  /// the current image was pushed to the repository.
  final DateTime? imagePushedAt;

  /// A summary of the last completed image scan.
  final ImageScanFindingsSummary? imageScanFindingsSummary;

  /// The current state of the scan.
  final ImageScanStatus? imageScanStatus;

  /// The size, in bytes, of the image in the repository.
  ///
  /// If the image is a manifest list, this will be the max size of all manifests
  /// in the list.
  /// <note>
  /// Starting with Docker version 1.9, the Docker client compresses image layers
  /// before pushing them to a V2 Docker registry. The output of the <code>docker
  /// images</code> command shows the uncompressed image size. Therefore, Docker
  /// might return a larger image than the image shown in the Amazon Web Services
  /// Management Console.
  /// </note>
  final int? imageSizeInBytes;

  /// The current status of the image.
  final ImageStatus? imageStatus;

  /// The list of tags associated with this image.
  final List<String>? imageTags;

  /// The date and time, expressed in standard JavaScript date format, when the
  /// image was last restored from Amazon ECR archive to Amazon ECR standard.
  final DateTime? lastActivatedAt;

  /// The date and time, expressed in standard JavaScript date format, when the
  /// image was last transitioned to Amazon ECR archive.
  final DateTime? lastArchivedAt;

  /// The date and time, expressed in standard JavaScript date format, when Amazon
  /// ECR recorded the last image pull.
  /// <note>
  /// Amazon ECR refreshes the last image pull timestamp at least once every 24
  /// hours. For example, if you pull an image once a day then the
  /// <code>lastRecordedPullTime</code> timestamp will indicate the exact time
  /// that the image was last pulled. However, if you pull an image once an hour,
  /// because Amazon ECR refreshes the <code>lastRecordedPullTime</code> timestamp
  /// at least once every 24 hours, the result may not be the exact time that the
  /// image was last pulled.
  /// </note>
  final DateTime? lastRecordedPullTime;

  /// The Amazon Web Services account ID associated with the registry to which
  /// this image belongs.
  final String? registryId;

  /// The name of the repository to which this image belongs.
  final String? repositoryName;

  /// The digest of the subject manifest for images that are referrers.
  final String? subjectManifestDigest;

  ImageDetail({
    this.artifactMediaType,
    this.imageDigest,
    this.imageManifestMediaType,
    this.imagePushedAt,
    this.imageScanFindingsSummary,
    this.imageScanStatus,
    this.imageSizeInBytes,
    this.imageStatus,
    this.imageTags,
    this.lastActivatedAt,
    this.lastArchivedAt,
    this.lastRecordedPullTime,
    this.registryId,
    this.repositoryName,
    this.subjectManifestDigest,
  });

  factory ImageDetail.fromJson(Map<String, dynamic> json) {
    return ImageDetail(
      artifactMediaType: json['artifactMediaType'] as String?,
      imageDigest: json['imageDigest'] as String?,
      imageManifestMediaType: json['imageManifestMediaType'] as String?,
      imagePushedAt: timeStampFromJson(json['imagePushedAt']),
      imageScanFindingsSummary: json['imageScanFindingsSummary'] != null
          ? ImageScanFindingsSummary.fromJson(
              json['imageScanFindingsSummary'] as Map<String, dynamic>)
          : null,
      imageScanStatus: json['imageScanStatus'] != null
          ? ImageScanStatus.fromJson(
              json['imageScanStatus'] as Map<String, dynamic>)
          : null,
      imageSizeInBytes: json['imageSizeInBytes'] as int?,
      imageStatus:
          (json['imageStatus'] as String?)?.let(ImageStatus.fromString),
      imageTags: (json['imageTags'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      lastActivatedAt: timeStampFromJson(json['lastActivatedAt']),
      lastArchivedAt: timeStampFromJson(json['lastArchivedAt']),
      lastRecordedPullTime: timeStampFromJson(json['lastRecordedPullTime']),
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
      subjectManifestDigest: json['subjectManifestDigest'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactMediaType = this.artifactMediaType;
    final imageDigest = this.imageDigest;
    final imageManifestMediaType = this.imageManifestMediaType;
    final imagePushedAt = this.imagePushedAt;
    final imageScanFindingsSummary = this.imageScanFindingsSummary;
    final imageScanStatus = this.imageScanStatus;
    final imageSizeInBytes = this.imageSizeInBytes;
    final imageStatus = this.imageStatus;
    final imageTags = this.imageTags;
    final lastActivatedAt = this.lastActivatedAt;
    final lastArchivedAt = this.lastArchivedAt;
    final lastRecordedPullTime = this.lastRecordedPullTime;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    final subjectManifestDigest = this.subjectManifestDigest;
    return {
      if (artifactMediaType != null) 'artifactMediaType': artifactMediaType,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (imageManifestMediaType != null)
        'imageManifestMediaType': imageManifestMediaType,
      if (imagePushedAt != null)
        'imagePushedAt': unixTimestampToJson(imagePushedAt),
      if (imageScanFindingsSummary != null)
        'imageScanFindingsSummary': imageScanFindingsSummary,
      if (imageScanStatus != null) 'imageScanStatus': imageScanStatus,
      if (imageSizeInBytes != null) 'imageSizeInBytes': imageSizeInBytes,
      if (imageStatus != null) 'imageStatus': imageStatus.value,
      if (imageTags != null) 'imageTags': imageTags,
      if (lastActivatedAt != null)
        'lastActivatedAt': unixTimestampToJson(lastActivatedAt),
      if (lastArchivedAt != null)
        'lastArchivedAt': unixTimestampToJson(lastArchivedAt),
      if (lastRecordedPullTime != null)
        'lastRecordedPullTime': unixTimestampToJson(lastRecordedPullTime),
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (subjectManifestDigest != null)
        'subjectManifestDigest': subjectManifestDigest,
    };
  }
}

/// A summary of the last completed image scan.
///
/// @nodoc
class ImageScanFindingsSummary {
  /// The image vulnerability counts, sorted by severity.
  final Map<FindingSeverity, int>? findingSeverityCounts;

  /// The time of the last completed image scan.
  final DateTime? imageScanCompletedAt;

  /// The time when the vulnerability data was last scanned.
  final DateTime? vulnerabilitySourceUpdatedAt;

  ImageScanFindingsSummary({
    this.findingSeverityCounts,
    this.imageScanCompletedAt,
    this.vulnerabilitySourceUpdatedAt,
  });

  factory ImageScanFindingsSummary.fromJson(Map<String, dynamic> json) {
    return ImageScanFindingsSummary(
      findingSeverityCounts: (json['findingSeverityCounts']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(FindingSeverity.fromString(k), e as int)),
      imageScanCompletedAt: timeStampFromJson(json['imageScanCompletedAt']),
      vulnerabilitySourceUpdatedAt:
          timeStampFromJson(json['vulnerabilitySourceUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final findingSeverityCounts = this.findingSeverityCounts;
    final imageScanCompletedAt = this.imageScanCompletedAt;
    final vulnerabilitySourceUpdatedAt = this.vulnerabilitySourceUpdatedAt;
    return {
      if (findingSeverityCounts != null)
        'findingSeverityCounts':
            findingSeverityCounts.map((k, e) => MapEntry(k.value, e)),
      if (imageScanCompletedAt != null)
        'imageScanCompletedAt': unixTimestampToJson(imageScanCompletedAt),
      if (vulnerabilitySourceUpdatedAt != null)
        'vulnerabilitySourceUpdatedAt':
            unixTimestampToJson(vulnerabilitySourceUpdatedAt),
    };
  }
}

/// An object representing a filter on a <a>DescribeImages</a> operation.
///
/// @nodoc
class DescribeImagesFilter {
  /// The image status with which to filter your <a>DescribeImages</a> results.
  /// Valid values are <code>ACTIVE</code>, <code>ARCHIVED</code>, and
  /// <code>ACTIVATING</code>. If not specified, only images with
  /// <code>ACTIVE</code> status are returned.
  final ImageStatusFilter? imageStatus;

  /// The tag status with which to filter your <a>DescribeImages</a> results. You
  /// can filter results based on whether they are <code>TAGGED</code> or
  /// <code>UNTAGGED</code>.
  final TagStatus? tagStatus;

  DescribeImagesFilter({
    this.imageStatus,
    this.tagStatus,
  });

  Map<String, dynamic> toJson() {
    final imageStatus = this.imageStatus;
    final tagStatus = this.tagStatus;
    return {
      if (imageStatus != null) 'imageStatus': imageStatus.value,
      if (tagStatus != null) 'tagStatus': tagStatus.value,
    };
  }
}

/// The status of the replication process for an image.
///
/// @nodoc
class ImageReplicationStatus {
  /// The failure code for a replication that has failed.
  final String? failureCode;

  /// The destination Region for the image replication.
  final String? region;

  /// The Amazon Web Services account ID associated with the registry to which the
  /// image belongs.
  final String? registryId;

  /// The image replication status.
  final ReplicationStatus? status;

  ImageReplicationStatus({
    this.failureCode,
    this.region,
    this.registryId,
    this.status,
  });

  factory ImageReplicationStatus.fromJson(Map<String, dynamic> json) {
    return ImageReplicationStatus(
      failureCode: json['failureCode'] as String?,
      region: json['region'] as String?,
      registryId: json['registryId'] as String?,
      status: (json['status'] as String?)?.let(ReplicationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final region = this.region;
    final registryId = this.registryId;
    final status = this.status;
    return {
      if (failureCode != null) 'failureCode': failureCode,
      if (region != null) 'region': region,
      if (registryId != null) 'registryId': registryId,
      if (status != null) 'status': status.value,
    };
  }
}

/// @nodoc
class ReplicationStatus {
  static const inProgress = ReplicationStatus._('IN_PROGRESS');
  static const complete = ReplicationStatus._('COMPLETE');
  static const failed = ReplicationStatus._('FAILED');

  final String value;

  const ReplicationStatus._(this.value);

  static const values = [inProgress, complete, failed];

  static ReplicationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationStatus._(value));

  @override
  bool operator ==(other) => other is ReplicationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details about any failures associated with the scanning configuration of
/// a repository.
///
/// @nodoc
class RepositoryScanningConfigurationFailure {
  /// The failure code.
  final ScanningConfigurationFailureCode? failureCode;

  /// The reason for the failure.
  final String? failureReason;

  /// The name of the repository.
  final String? repositoryName;

  RepositoryScanningConfigurationFailure({
    this.failureCode,
    this.failureReason,
    this.repositoryName,
  });

  factory RepositoryScanningConfigurationFailure.fromJson(
      Map<String, dynamic> json) {
    return RepositoryScanningConfigurationFailure(
      failureCode: (json['failureCode'] as String?)
          ?.let(ScanningConfigurationFailureCode.fromString),
      failureReason: json['failureReason'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final repositoryName = this.repositoryName;
    return {
      if (failureCode != null) 'failureCode': failureCode.value,
      if (failureReason != null) 'failureReason': failureReason,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// @nodoc
class ScanningConfigurationFailureCode {
  static const repositoryNotFound =
      ScanningConfigurationFailureCode._('REPOSITORY_NOT_FOUND');

  final String value;

  const ScanningConfigurationFailureCode._(this.value);

  static const values = [repositoryNotFound];

  static ScanningConfigurationFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScanningConfigurationFailureCode._(value));

  @override
  bool operator ==(other) =>
      other is ScanningConfigurationFailureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The details of the scanning configuration for a repository.
///
/// @nodoc
class RepositoryScanningConfiguration {
  /// The scan filters applied to the repository.
  final List<ScanningRepositoryFilter>? appliedScanFilters;

  /// The ARN of the repository.
  final String? repositoryArn;

  /// The name of the repository.
  final String? repositoryName;

  /// The scan frequency for the repository.
  final ScanFrequency? scanFrequency;

  /// Whether or not scan on push is configured for the repository.
  final bool? scanOnPush;

  RepositoryScanningConfiguration({
    this.appliedScanFilters,
    this.repositoryArn,
    this.repositoryName,
    this.scanFrequency,
    this.scanOnPush,
  });

  factory RepositoryScanningConfiguration.fromJson(Map<String, dynamic> json) {
    return RepositoryScanningConfiguration(
      appliedScanFilters: (json['appliedScanFilters'] as List?)
          ?.nonNulls
          .map((e) =>
              ScanningRepositoryFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      repositoryArn: json['repositoryArn'] as String?,
      repositoryName: json['repositoryName'] as String?,
      scanFrequency:
          (json['scanFrequency'] as String?)?.let(ScanFrequency.fromString),
      scanOnPush: json['scanOnPush'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final appliedScanFilters = this.appliedScanFilters;
    final repositoryArn = this.repositoryArn;
    final repositoryName = this.repositoryName;
    final scanFrequency = this.scanFrequency;
    final scanOnPush = this.scanOnPush;
    return {
      if (appliedScanFilters != null) 'appliedScanFilters': appliedScanFilters,
      if (repositoryArn != null) 'repositoryArn': repositoryArn,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (scanFrequency != null) 'scanFrequency': scanFrequency.value,
      if (scanOnPush != null) 'scanOnPush': scanOnPush,
    };
  }
}

/// An object representing an Amazon ECR image failure.
///
/// @nodoc
class ImageFailure {
  /// The code associated with the failure.
  final ImageFailureCode? failureCode;

  /// The reason for the failure.
  final String? failureReason;

  /// The image ID associated with the failure.
  final ImageIdentifier? imageId;

  ImageFailure({
    this.failureCode,
    this.failureReason,
    this.imageId,
  });

  factory ImageFailure.fromJson(Map<String, dynamic> json) {
    return ImageFailure(
      failureCode:
          (json['failureCode'] as String?)?.let(ImageFailureCode.fromString),
      failureReason: json['failureReason'] as String?,
      imageId: json['imageId'] != null
          ? ImageIdentifier.fromJson(json['imageId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final imageId = this.imageId;
    return {
      if (failureCode != null) 'failureCode': failureCode.value,
      if (failureReason != null) 'failureReason': failureReason,
      if (imageId != null) 'imageId': imageId,
    };
  }
}

/// @nodoc
class ImageFailureCode {
  static const invalidImageDigest = ImageFailureCode._('InvalidImageDigest');
  static const invalidImageTag = ImageFailureCode._('InvalidImageTag');
  static const imageTagDoesNotMatchDigest =
      ImageFailureCode._('ImageTagDoesNotMatchDigest');
  static const imageNotFound = ImageFailureCode._('ImageNotFound');
  static const missingDigestAndTag = ImageFailureCode._('MissingDigestAndTag');
  static const imageReferencedByManifestList =
      ImageFailureCode._('ImageReferencedByManifestList');
  static const kmsError = ImageFailureCode._('KmsError');
  static const upstreamAccessDenied =
      ImageFailureCode._('UpstreamAccessDenied');
  static const upstreamTooManyRequests =
      ImageFailureCode._('UpstreamTooManyRequests');
  static const upstreamUnavailable = ImageFailureCode._('UpstreamUnavailable');
  static const imageInaccessible = ImageFailureCode._('ImageInaccessible');

  final String value;

  const ImageFailureCode._(this.value);

  static const values = [
    invalidImageDigest,
    invalidImageTag,
    imageTagDoesNotMatchDigest,
    imageNotFound,
    missingDigestAndTag,
    imageReferencedByManifestList,
    kmsError,
    upstreamAccessDenied,
    upstreamTooManyRequests,
    upstreamUnavailable,
    imageInaccessible
  ];

  static ImageFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImageFailureCode._(value));

  @override
  bool operator ==(other) => other is ImageFailureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing an Amazon ECR image layer failure.
///
/// @nodoc
class LayerFailure {
  /// The failure code associated with the failure.
  final LayerFailureCode? failureCode;

  /// The reason for the failure.
  final String? failureReason;

  /// The layer digest associated with the failure.
  final String? layerDigest;

  LayerFailure({
    this.failureCode,
    this.failureReason,
    this.layerDigest,
  });

  factory LayerFailure.fromJson(Map<String, dynamic> json) {
    return LayerFailure(
      failureCode:
          (json['failureCode'] as String?)?.let(LayerFailureCode.fromString),
      failureReason: json['failureReason'] as String?,
      layerDigest: json['layerDigest'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final layerDigest = this.layerDigest;
    return {
      if (failureCode != null) 'failureCode': failureCode.value,
      if (failureReason != null) 'failureReason': failureReason,
      if (layerDigest != null) 'layerDigest': layerDigest,
    };
  }
}

/// @nodoc
class LayerFailureCode {
  static const invalidLayerDigest = LayerFailureCode._('InvalidLayerDigest');
  static const missingLayerDigest = LayerFailureCode._('MissingLayerDigest');

  final String value;

  const LayerFailureCode._(this.value);

  static const values = [invalidLayerDigest, missingLayerDigest];

  static LayerFailureCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LayerFailureCode._(value));

  @override
  bool operator ==(other) => other is LayerFailureCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing an Amazon ECR image layer.
///
/// @nodoc
class Layer {
  /// The availability status of the image layer.
  final LayerAvailability? layerAvailability;

  /// The <code>sha256</code> digest of the image layer.
  final String? layerDigest;

  /// The size, in bytes, of the image layer.
  final int? layerSize;

  /// The media type of the layer, such as
  /// <code>application/vnd.docker.image.rootfs.diff.tar.gzip</code> or
  /// <code>application/vnd.oci.image.layer.v1.tar+gzip</code>.
  final String? mediaType;

  Layer({
    this.layerAvailability,
    this.layerDigest,
    this.layerSize,
    this.mediaType,
  });

  factory Layer.fromJson(Map<String, dynamic> json) {
    return Layer(
      layerAvailability: (json['layerAvailability'] as String?)
          ?.let(LayerAvailability.fromString),
      layerDigest: json['layerDigest'] as String?,
      layerSize: json['layerSize'] as int?,
      mediaType: json['mediaType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final layerAvailability = this.layerAvailability;
    final layerDigest = this.layerDigest;
    final layerSize = this.layerSize;
    final mediaType = this.mediaType;
    return {
      if (layerAvailability != null)
        'layerAvailability': layerAvailability.value,
      if (layerDigest != null) 'layerDigest': layerDigest,
      if (layerSize != null) 'layerSize': layerSize,
      if (mediaType != null) 'mediaType': mediaType,
    };
  }
}

/// @nodoc
class LayerAvailability {
  static const available = LayerAvailability._('AVAILABLE');
  static const unavailable = LayerAvailability._('UNAVAILABLE');
  static const archived = LayerAvailability._('ARCHIVED');

  final String value;

  const LayerAvailability._(this.value);

  static const values = [available, unavailable, archived];

  static LayerAvailability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LayerAvailability._(value));

  @override
  bool operator ==(other) => other is LayerAvailability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BlockedByOrganizationPolicyException extends _s.GenericAwsException {
  BlockedByOrganizationPolicyException({String? type, String? message})
      : super(
            type: type,
            code: 'BlockedByOrganizationPolicyException',
            message: message);
}

/// @nodoc
class EmptyUploadException extends _s.GenericAwsException {
  EmptyUploadException({String? type, String? message})
      : super(type: type, code: 'EmptyUploadException', message: message);
}

/// @nodoc
class ExclusionAlreadyExistsException extends _s.GenericAwsException {
  ExclusionAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ExclusionAlreadyExistsException',
            message: message);
}

/// @nodoc
class ExclusionNotFoundException extends _s.GenericAwsException {
  ExclusionNotFoundException({String? type, String? message})
      : super(type: type, code: 'ExclusionNotFoundException', message: message);
}

/// @nodoc
class ImageAlreadyExistsException extends _s.GenericAwsException {
  ImageAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'ImageAlreadyExistsException', message: message);
}

/// @nodoc
class ImageArchivedException extends _s.GenericAwsException {
  ImageArchivedException({String? type, String? message})
      : super(type: type, code: 'ImageArchivedException', message: message);
}

/// @nodoc
class ImageDigestDoesNotMatchException extends _s.GenericAwsException {
  ImageDigestDoesNotMatchException({String? type, String? message})
      : super(
            type: type,
            code: 'ImageDigestDoesNotMatchException',
            message: message);
}

/// @nodoc
class ImageNotFoundException extends _s.GenericAwsException {
  ImageNotFoundException({String? type, String? message})
      : super(type: type, code: 'ImageNotFoundException', message: message);
}

/// @nodoc
class ImageStorageClassUpdateNotSupportedException
    extends _s.GenericAwsException {
  ImageStorageClassUpdateNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'ImageStorageClassUpdateNotSupportedException',
            message: message);
}

/// @nodoc
class ImageTagAlreadyExistsException extends _s.GenericAwsException {
  ImageTagAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ImageTagAlreadyExistsException',
            message: message);
}

/// @nodoc
class InvalidLayerException extends _s.GenericAwsException {
  InvalidLayerException({String? type, String? message})
      : super(type: type, code: 'InvalidLayerException', message: message);
}

/// @nodoc
class InvalidLayerPartException extends _s.GenericAwsException {
  InvalidLayerPartException({String? type, String? message})
      : super(type: type, code: 'InvalidLayerPartException', message: message);
}

/// @nodoc
class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

/// @nodoc
class InvalidTagParameterException extends _s.GenericAwsException {
  InvalidTagParameterException({String? type, String? message})
      : super(
            type: type, code: 'InvalidTagParameterException', message: message);
}

/// @nodoc
class KmsException extends _s.GenericAwsException {
  KmsException({String? type, String? message})
      : super(type: type, code: 'KmsException', message: message);
}

/// @nodoc
class LayerAlreadyExistsException extends _s.GenericAwsException {
  LayerAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'LayerAlreadyExistsException', message: message);
}

/// @nodoc
class LayerInaccessibleException extends _s.GenericAwsException {
  LayerInaccessibleException({String? type, String? message})
      : super(type: type, code: 'LayerInaccessibleException', message: message);
}

/// @nodoc
class LayerPartTooSmallException extends _s.GenericAwsException {
  LayerPartTooSmallException({String? type, String? message})
      : super(type: type, code: 'LayerPartTooSmallException', message: message);
}

/// @nodoc
class LayersNotFoundException extends _s.GenericAwsException {
  LayersNotFoundException({String? type, String? message})
      : super(type: type, code: 'LayersNotFoundException', message: message);
}

/// @nodoc
class LifecyclePolicyNotFoundException extends _s.GenericAwsException {
  LifecyclePolicyNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'LifecyclePolicyNotFoundException',
            message: message);
}

/// @nodoc
class LifecyclePolicyPreviewInProgressException extends _s.GenericAwsException {
  LifecyclePolicyPreviewInProgressException({String? type, String? message})
      : super(
            type: type,
            code: 'LifecyclePolicyPreviewInProgressException',
            message: message);
}

/// @nodoc
class LifecyclePolicyPreviewNotFoundException extends _s.GenericAwsException {
  LifecyclePolicyPreviewNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'LifecyclePolicyPreviewNotFoundException',
            message: message);
}

/// @nodoc
class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

/// @nodoc
class PullThroughCacheRuleAlreadyExistsException
    extends _s.GenericAwsException {
  PullThroughCacheRuleAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'PullThroughCacheRuleAlreadyExistsException',
            message: message);
}

/// @nodoc
class PullThroughCacheRuleNotFoundException extends _s.GenericAwsException {
  PullThroughCacheRuleNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'PullThroughCacheRuleNotFoundException',
            message: message);
}

/// @nodoc
class ReferencedImagesNotFoundException extends _s.GenericAwsException {
  ReferencedImagesNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ReferencedImagesNotFoundException',
            message: message);
}

/// @nodoc
class RegistryPolicyNotFoundException extends _s.GenericAwsException {
  RegistryPolicyNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'RegistryPolicyNotFoundException',
            message: message);
}

/// @nodoc
class RepositoryAlreadyExistsException extends _s.GenericAwsException {
  RepositoryAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryAlreadyExistsException',
            message: message);
}

/// @nodoc
class RepositoryNotEmptyException extends _s.GenericAwsException {
  RepositoryNotEmptyException({String? type, String? message})
      : super(
            type: type, code: 'RepositoryNotEmptyException', message: message);
}

/// @nodoc
class RepositoryNotFoundException extends _s.GenericAwsException {
  RepositoryNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'RepositoryNotFoundException', message: message);
}

/// @nodoc
class RepositoryPolicyNotFoundException extends _s.GenericAwsException {
  RepositoryPolicyNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryPolicyNotFoundException',
            message: message);
}

/// @nodoc
class ScanNotFoundException extends _s.GenericAwsException {
  ScanNotFoundException({String? type, String? message})
      : super(type: type, code: 'ScanNotFoundException', message: message);
}

/// @nodoc
class SecretNotFoundException extends _s.GenericAwsException {
  SecretNotFoundException({String? type, String? message})
      : super(type: type, code: 'SecretNotFoundException', message: message);
}

/// @nodoc
class ServerException extends _s.GenericAwsException {
  ServerException({String? type, String? message})
      : super(type: type, code: 'ServerException', message: message);
}

/// @nodoc
class SigningConfigurationNotFoundException extends _s.GenericAwsException {
  SigningConfigurationNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'SigningConfigurationNotFoundException',
            message: message);
}

/// @nodoc
class TemplateAlreadyExistsException extends _s.GenericAwsException {
  TemplateAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'TemplateAlreadyExistsException',
            message: message);
}

/// @nodoc
class TemplateNotFoundException extends _s.GenericAwsException {
  TemplateNotFoundException({String? type, String? message})
      : super(type: type, code: 'TemplateNotFoundException', message: message);
}

/// @nodoc
class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

/// @nodoc
class UnableToAccessSecretException extends _s.GenericAwsException {
  UnableToAccessSecretException({String? type, String? message})
      : super(
            type: type,
            code: 'UnableToAccessSecretException',
            message: message);
}

/// @nodoc
class UnableToDecryptSecretValueException extends _s.GenericAwsException {
  UnableToDecryptSecretValueException({String? type, String? message})
      : super(
            type: type,
            code: 'UnableToDecryptSecretValueException',
            message: message);
}

/// @nodoc
class UnableToGetUpstreamImageException extends _s.GenericAwsException {
  UnableToGetUpstreamImageException({String? type, String? message})
      : super(
            type: type,
            code: 'UnableToGetUpstreamImageException',
            message: message);
}

/// @nodoc
class UnableToGetUpstreamLayerException extends _s.GenericAwsException {
  UnableToGetUpstreamLayerException({String? type, String? message})
      : super(
            type: type,
            code: 'UnableToGetUpstreamLayerException',
            message: message);
}

/// @nodoc
class UnableToListUpstreamImageReferrersException
    extends _s.GenericAwsException {
  UnableToListUpstreamImageReferrersException({String? type, String? message})
      : super(
            type: type,
            code: 'UnableToListUpstreamImageReferrersException',
            message: message);
}

/// @nodoc
class UnsupportedImageTypeException extends _s.GenericAwsException {
  UnsupportedImageTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedImageTypeException',
            message: message);
}

/// @nodoc
class UnsupportedUpstreamRegistryException extends _s.GenericAwsException {
  UnsupportedUpstreamRegistryException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedUpstreamRegistryException',
            message: message);
}

/// @nodoc
class UploadNotFoundException extends _s.GenericAwsException {
  UploadNotFoundException({String? type, String? message})
      : super(type: type, code: 'UploadNotFoundException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BlockedByOrganizationPolicyException': (type, message) =>
      BlockedByOrganizationPolicyException(type: type, message: message),
  'EmptyUploadException': (type, message) =>
      EmptyUploadException(type: type, message: message),
  'ExclusionAlreadyExistsException': (type, message) =>
      ExclusionAlreadyExistsException(type: type, message: message),
  'ExclusionNotFoundException': (type, message) =>
      ExclusionNotFoundException(type: type, message: message),
  'ImageAlreadyExistsException': (type, message) =>
      ImageAlreadyExistsException(type: type, message: message),
  'ImageArchivedException': (type, message) =>
      ImageArchivedException(type: type, message: message),
  'ImageDigestDoesNotMatchException': (type, message) =>
      ImageDigestDoesNotMatchException(type: type, message: message),
  'ImageNotFoundException': (type, message) =>
      ImageNotFoundException(type: type, message: message),
  'ImageStorageClassUpdateNotSupportedException': (type, message) =>
      ImageStorageClassUpdateNotSupportedException(
          type: type, message: message),
  'ImageTagAlreadyExistsException': (type, message) =>
      ImageTagAlreadyExistsException(type: type, message: message),
  'InvalidLayerException': (type, message) =>
      InvalidLayerException(type: type, message: message),
  'InvalidLayerPartException': (type, message) =>
      InvalidLayerPartException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidTagParameterException': (type, message) =>
      InvalidTagParameterException(type: type, message: message),
  'KmsException': (type, message) => KmsException(type: type, message: message),
  'LayerAlreadyExistsException': (type, message) =>
      LayerAlreadyExistsException(type: type, message: message),
  'LayerInaccessibleException': (type, message) =>
      LayerInaccessibleException(type: type, message: message),
  'LayerPartTooSmallException': (type, message) =>
      LayerPartTooSmallException(type: type, message: message),
  'LayersNotFoundException': (type, message) =>
      LayersNotFoundException(type: type, message: message),
  'LifecyclePolicyNotFoundException': (type, message) =>
      LifecyclePolicyNotFoundException(type: type, message: message),
  'LifecyclePolicyPreviewInProgressException': (type, message) =>
      LifecyclePolicyPreviewInProgressException(type: type, message: message),
  'LifecyclePolicyPreviewNotFoundException': (type, message) =>
      LifecyclePolicyPreviewNotFoundException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'PullThroughCacheRuleAlreadyExistsException': (type, message) =>
      PullThroughCacheRuleAlreadyExistsException(type: type, message: message),
  'PullThroughCacheRuleNotFoundException': (type, message) =>
      PullThroughCacheRuleNotFoundException(type: type, message: message),
  'ReferencedImagesNotFoundException': (type, message) =>
      ReferencedImagesNotFoundException(type: type, message: message),
  'RegistryPolicyNotFoundException': (type, message) =>
      RegistryPolicyNotFoundException(type: type, message: message),
  'RepositoryAlreadyExistsException': (type, message) =>
      RepositoryAlreadyExistsException(type: type, message: message),
  'RepositoryNotEmptyException': (type, message) =>
      RepositoryNotEmptyException(type: type, message: message),
  'RepositoryNotFoundException': (type, message) =>
      RepositoryNotFoundException(type: type, message: message),
  'RepositoryPolicyNotFoundException': (type, message) =>
      RepositoryPolicyNotFoundException(type: type, message: message),
  'ScanNotFoundException': (type, message) =>
      ScanNotFoundException(type: type, message: message),
  'SecretNotFoundException': (type, message) =>
      SecretNotFoundException(type: type, message: message),
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
  'SigningConfigurationNotFoundException': (type, message) =>
      SigningConfigurationNotFoundException(type: type, message: message),
  'TemplateAlreadyExistsException': (type, message) =>
      TemplateAlreadyExistsException(type: type, message: message),
  'TemplateNotFoundException': (type, message) =>
      TemplateNotFoundException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnableToAccessSecretException': (type, message) =>
      UnableToAccessSecretException(type: type, message: message),
  'UnableToDecryptSecretValueException': (type, message) =>
      UnableToDecryptSecretValueException(type: type, message: message),
  'UnableToGetUpstreamImageException': (type, message) =>
      UnableToGetUpstreamImageException(type: type, message: message),
  'UnableToGetUpstreamLayerException': (type, message) =>
      UnableToGetUpstreamLayerException(type: type, message: message),
  'UnableToListUpstreamImageReferrersException': (type, message) =>
      UnableToListUpstreamImageReferrersException(type: type, message: message),
  'UnsupportedImageTypeException': (type, message) =>
      UnsupportedImageTypeException(type: type, message: message),
  'UnsupportedUpstreamRegistryException': (type, message) =>
      UnsupportedUpstreamRegistryException(type: type, message: message),
  'UploadNotFoundException': (type, message) =>
      UploadNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
