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

part '2015-09-21.g.dart';

/// Amazon Elastic Container Registry (Amazon ECR) is a managed container image
/// registry service. Customers can use the familiar Docker CLI, or their
/// preferred client, to push, pull, and manage images. Amazon ECR provides a
/// secure, scalable, and reliable registry for your Docker or Open Container
/// Initiative (OCI) images. Amazon ECR supports private repositories with
/// resource-based permissions using IAM so that specific users or Amazon EC2
/// instances can access repositories and images.
class Ecr {
  final _s.JsonProtocol _protocol;
  Ecr({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.ecr',
            signingName: 'ecr',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// May throw [RepositoryNotFoundException].
  /// May throw [InvalidParameterException].
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
  /// The AWS account ID associated with the registry that contains the image
  /// layers to check. If you do not specify a registry, the default registry is
  /// assumed.
  Future<BatchCheckLayerAvailabilityResponse> batchCheckLayerAvailability({
    @_s.required List<String> layerDigests,
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(layerDigests, 'layerDigests');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
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
  /// The AWS account ID associated with the registry that contains the image to
  /// delete. If you do not specify a registry, the default registry is assumed.
  Future<BatchDeleteImageResponse> batchDeleteImage({
    @_s.required List<ImageIdentifier> imageIds,
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(imageIds, 'imageIds');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
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
  /// The AWS account ID associated with the registry that contains the images
  /// to describe. If you do not specify a registry, the default registry is
  /// assumed.
  Future<BatchGetImageResponse> batchGetImage({
    @_s.required List<ImageIdentifier> imageIds,
    @_s.required String repositoryName,
    List<String> acceptedMediaTypes,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(imageIds, 'imageIds');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [UploadNotFoundException].
  /// May throw [InvalidLayerException].
  /// May throw [LayerPartTooSmallException].
  /// May throw [LayerAlreadyExistsException].
  /// May throw [EmptyUploadException].
  /// May throw [KmsException].
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
  /// The AWS account ID associated with the registry to which to upload layers.
  /// If you do not specify a registry, the default registry is assumed.
  Future<CompleteLayerUploadResponse> completeLayerUpload({
    @_s.required List<String> layerDigests,
    @_s.required String repositoryName,
    @_s.required String uploadId,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(layerDigests, 'layerDigests');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    _s.validateStringPattern(
      'uploadId',
      uploadId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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

  /// Creates a repository. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html">Amazon
  /// ECR Repositories</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagParameterException].
  /// May throw [TooManyTagsException].
  /// May throw [RepositoryAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [KmsException].
  ///
  /// Parameter [repositoryName] :
  /// The name to use for the repository. The repository name may be specified
  /// on its own (such as <code>nginx-web-app</code>) or it can be prepended
  /// with a namespace to group the repository into a category (such as
  /// <code>project-a/nginx-web-app</code>).
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration for the repository. This determines how the
  /// contents of your repository are encrypted at rest.
  ///
  /// Parameter [imageScanningConfiguration] :
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
  /// Parameter [tags] :
  /// The metadata that you apply to the repository to help you categorize and
  /// organize them. Each tag consists of a key and an optional value, both of
  /// which you define. Tag keys can have a maximum character length of 128
  /// characters, and tag values can have a maximum length of 256 characters.
  Future<CreateRepositoryResponse> createRepository({
    @_s.required String repositoryName,
    EncryptionConfiguration encryptionConfiguration,
    ImageScanningConfiguration imageScanningConfiguration,
    ImageTagMutability imageTagMutability,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
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
          'imageTagMutability': imageTagMutability.toValue(),
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRepositoryResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the lifecycle policy associated with the specified repository.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [LifecyclePolicyNotFoundException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository. If you do not specify a registry, the default registry is
  /// assumed.
  Future<DeleteLifecyclePolicyResponse> deleteLifecyclePolicy({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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

  /// Deletes the registry permissions policy.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RegistryPolicyNotFoundException].
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

  /// Deletes a repository. If the repository contains images, you must either
  /// delete all images in the repository or use the <code>force</code> option
  /// to delete the repository.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [RepositoryNotEmptyException].
  /// May throw [KmsException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to delete.
  ///
  /// Parameter [force] :
  /// If a repository contains images, forces the deletion.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository to delete. If you do not specify a registry, the default
  /// registry is assumed.
  Future<DeleteRepositoryResponse> deleteRepository({
    @_s.required String repositoryName,
    bool force,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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

  /// Deletes the repository policy associated with the specified repository.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [RepositoryPolicyNotFoundException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that is associated with the repository policy
  /// to delete.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository policy to delete. If you do not specify a registry, the default
  /// registry is assumed.
  Future<DeleteRepositoryPolicyResponse> deleteRepositoryPolicy({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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

  /// Returns the scan findings for the specified image.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ImageNotFoundException].
  /// May throw [ScanNotFoundException].
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
  /// The AWS account ID associated with the registry that contains the
  /// repository in which to describe the image scan findings for. If you do not
  /// specify a registry, the default registry is assumed.
  Future<DescribeImageScanFindingsResponse> describeImageScanFindings({
    @_s.required ImageIdentifier imageId,
    @_s.required String repositoryName,
    int maxResults,
    String nextToken,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(imageId, 'imageId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
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

  /// Returns metadata about the images in a repository.
  /// <note>
  /// Beginning with Docker version 1.9, the Docker client compresses image
  /// layers before pushing them to a V2 Docker registry. The output of the
  /// <code>docker images</code> command shows the uncompressed image size, so
  /// it may return a larger image size than the image sizes returned by
  /// <a>DescribeImages</a>.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ImageNotFoundException].
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
  /// The AWS account ID associated with the registry that contains the
  /// repository in which to describe images. If you do not specify a registry,
  /// the default registry is assumed.
  Future<DescribeImagesResponse> describeImages({
    @_s.required String repositoryName,
    DescribeImagesFilter filter,
    List<ImageIdentifier> imageIds,
    int maxResults,
    String nextToken,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
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

  /// Describes the settings for a registry. The replication configuration for a
  /// repository can be created or updated with the
  /// <a>PutReplicationConfiguration</a> API action.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
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
  /// The AWS account ID associated with the registry that contains the
  /// repositories to be described. If you do not specify a registry, the
  /// default registry is assumed.
  ///
  /// Parameter [repositoryNames] :
  /// A list of repositories to describe. If this parameter is omitted, then all
  /// repositories in a registry are described.
  Future<DescribeRepositoriesResponse> describeRepositories({
    int maxResults,
    String nextToken,
    String registryId,
    List<String> repositoryNames,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
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

  /// Retrieves an authorization token. An authorization token represents your
  /// IAM authentication credentials and can be used to access any Amazon ECR
  /// registry that your IAM principal has access to. The authorization token is
  /// valid for 12 hours.
  ///
  /// The <code>authorizationToken</code> returned is a base64 encoded string
  /// that can be decoded and used in a <code>docker login</code> command to
  /// authenticate to a registry. The AWS CLI offers an
  /// <code>get-login-password</code> command that simplifies the login process.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html#registry_auth">Registry
  /// Authentication</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [registryIds] :
  /// A list of AWS account IDs that are associated with the registries for
  /// which to get AuthorizationData objects. If you do not specify a registry,
  /// the default registry is assumed.
  Future<GetAuthorizationTokenResponse> getAuthorizationToken({
    List<String> registryIds,
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [LayersNotFoundException].
  /// May throw [LayerInaccessibleException].
  /// May throw [RepositoryNotFoundException].
  ///
  /// Parameter [layerDigest] :
  /// The digest of the image layer to download.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that is associated with the image layer to
  /// download.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the image
  /// layer to download. If you do not specify a registry, the default registry
  /// is assumed.
  Future<GetDownloadUrlForLayerResponse> getDownloadUrlForLayer({
    @_s.required String layerDigest,
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(layerDigest, 'layerDigest');
    _s.validateStringPattern(
      'layerDigest',
      layerDigest,
      r'''[a-zA-Z0-9-_+.]+:[a-fA-F0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [LifecyclePolicyNotFoundException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository. If you do not specify a registry, the default registry is
  /// assumed.
  Future<GetLifecyclePolicyResponse> getLifecyclePolicy({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [LifecyclePolicyPreviewNotFoundException].
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
  /// <code>GetLifecyclePolicyPreviewRequest</code> in&#x2028; paginated output.
  /// When this parameter is used, <code>GetLifecyclePolicyPreviewRequest</code>
  /// only returns&#x2028; <code>maxResults</code> results in a single page
  /// along with a <code>nextToken</code>&#x2028; response element. The
  /// remaining results of the initial request can be seen by sending&#x2028;
  /// another <code>GetLifecyclePolicyPreviewRequest</code> request with the
  /// returned <code>nextToken</code>&#x2028; value. This value can be between 1
  /// and 1000. If this&#x2028; parameter is not used, then
  /// <code>GetLifecyclePolicyPreviewRequest</code> returns up to&#x2028; 100
  /// results and a <code>nextToken</code> value, if&#x2028; applicable. This
  /// option cannot be used when you specify images with <code>imageIds</code>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous
  /// paginated&#x2028; <code>GetLifecyclePolicyPreviewRequest</code> request
  /// where <code>maxResults</code> was used and the&#x2028; results exceeded
  /// the value of that parameter. Pagination continues from the end of
  /// the&#x2028; previous results that returned the <code>nextToken</code>
  /// value. This value is&#x2028; <code>null</code> when there are no more
  /// results to return. This option cannot be used when you specify images with
  /// <code>imageIds</code>.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository. If you do not specify a registry, the default registry is
  /// assumed.
  Future<GetLifecyclePolicyPreviewResponse> getLifecyclePolicyPreview({
    @_s.required String repositoryName,
    LifecyclePolicyPreviewFilter filter,
    List<ImageIdentifier> imageIds,
    int maxResults,
    String nextToken,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RegistryPolicyNotFoundException].
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

  /// Retrieves the repository policy for the specified repository.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [RepositoryPolicyNotFoundException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository with the policy to retrieve.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository. If you do not specify a registry, the default registry is
  /// assumed.
  Future<GetRepositoryPolicyResponse> getRepositoryPolicy({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [KmsException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to which you intend to upload layers.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry to which you intend to
  /// upload layers. If you do not specify a registry, the default registry is
  /// assumed.
  Future<InitiateLayerUploadResponse> initiateLayerUpload({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
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
  /// The AWS account ID associated with the registry that contains the
  /// repository in which to list images. If you do not specify a registry, the
  /// default registry is assumed.
  Future<ListImagesResponse> listImages({
    @_s.required String repositoryName,
    ListImagesFilter filter,
    int maxResults,
    String nextToken,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ImageAlreadyExistsException].
  /// May throw [LayersNotFoundException].
  /// May throw [ReferencedImagesNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ImageTagAlreadyExistsException].
  /// May throw [ImageDigestDoesNotMatchException].
  /// May throw [KmsException].
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
  /// The tag to associate with the image. This parameter is required for images
  /// that use the Docker Image Manifest V2 Schema 2 or Open Container
  /// Initiative (OCI) formats.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository in which to put the image. If you do not specify a registry,
  /// the default registry is assumed.
  Future<PutImageResponse> putImage({
    @_s.required String imageManifest,
    @_s.required String repositoryName,
    String imageDigest,
    String imageManifestMediaType,
    String imageTag,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(imageManifest, 'imageManifest');
    _s.validateStringLength(
      'imageManifest',
      imageManifest,
      1,
      4194304,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'imageTag',
      imageTag,
      1,
      300,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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

  /// Updates the image scanning configuration for the specified repository.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
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
  /// The AWS account ID associated with the registry that contains the
  /// repository in which to update the image scanning configuration setting. If
  /// you do not specify a registry, the default registry is assumed.
  Future<PutImageScanningConfigurationResponse> putImageScanningConfiguration({
    @_s.required ImageScanningConfiguration imageScanningConfiguration,
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(
        imageScanningConfiguration, 'imageScanningConfiguration');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// Tag Mutability</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
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
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository in which to update the image tag mutability settings. If you do
  /// not specify a registry, the default registry is assumed.
  Future<PutImageTagMutabilityResponse> putImageTagMutability({
    @_s.required ImageTagMutability imageTagMutability,
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(imageTagMutability, 'imageTagMutability');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
        'imageTagMutability': imageTagMutability?.toValue() ?? '',
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return PutImageTagMutabilityResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the lifecycle policy for the specified repository. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/LifecyclePolicies.html">Lifecycle
  /// Policy Template</a>.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  ///
  /// Parameter [lifecyclePolicyText] :
  /// The JSON repository policy text to apply to the repository.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to receive the policy.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository. If you do&#x2028; not specify a registry, the default registry
  /// is assumed.
  Future<PutLifecyclePolicyResponse> putLifecyclePolicy({
    @_s.required String lifecyclePolicyText,
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(lifecyclePolicyText, 'lifecyclePolicyText');
    _s.validateStringLength(
      'lifecyclePolicyText',
      lifecyclePolicyText,
      100,
      30720,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// A registry policy is used to specify permissions for another AWS account
  /// and is used when configuring cross-account replication. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry-permissions.html">Registry
  /// permissions</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [policyText] :
  /// The JSON policy text to apply to your registry. The policy text follows
  /// the same format as IAM policy text. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/registry-permissions.html">Registry
  /// permissions</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  Future<PutRegistryPolicyResponse> putRegistryPolicy({
    @_s.required String policyText,
  }) async {
    ArgumentError.checkNotNull(policyText, 'policyText');
    _s.validateStringLength(
      'policyText',
      policyText,
      0,
      10240,
      isRequired: true,
    );
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

  /// Creates or updates the replication configuration for a registry. The
  /// existing replication configuration for a repository can be retrieved with
  /// the <a>DescribeRegistry</a> API action. The first time the
  /// PutReplicationConfiguration API is called, a service-linked IAM role is
  /// created in your account for the replication process. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/using-service-linked-roles.html">Using
  /// Service-Linked Roles for Amazon ECR</a> in the <i>Amazon Elastic Container
  /// Registry User Guide</i>.
  /// <note>
  /// When configuring cross-account replication, the destination account must
  /// grant the source account permission to replicate. This permission is
  /// controlled using a registry permissions policy. For more information, see
  /// <a>PutRegistryPolicy</a>.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [ValidationException].
  ///
  /// Parameter [replicationConfiguration] :
  /// An object representing the replication configuration for a registry.
  Future<PutReplicationConfigurationResponse> putReplicationConfiguration({
    @_s.required ReplicationConfiguration replicationConfiguration,
  }) async {
    ArgumentError.checkNotNull(
        replicationConfiguration, 'replicationConfiguration');
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

  /// Applies a repository policy to the specified repository to control access
  /// permissions. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policies.html">Amazon
  /// ECR Repository Policies</a> in the <i>Amazon Elastic Container Registry
  /// User Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  ///
  /// Parameter [policyText] :
  /// The JSON repository policy text to apply to the repository. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/repository-policy-examples.html">Amazon
  /// ECR Repository Policies</a> in the <i>Amazon Elastic Container Registry
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
  /// The AWS account ID associated with the registry that contains the
  /// repository. If you do not specify a registry, the default registry is
  /// assumed.
  Future<SetRepositoryPolicyResponse> setRepositoryPolicy({
    @_s.required String policyText,
    @_s.required String repositoryName,
    bool force,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(policyText, 'policyText');
    _s.validateStringLength(
      'policyText',
      policyText,
      0,
      10240,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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

  /// Starts an image vulnerability scan. An image scan can only be started once
  /// per day on an individual image. This limit includes if an image was
  /// scanned on initial push. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/image-scanning.html">Image
  /// Scanning</a> in the <i>Amazon Elastic Container Registry User Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedImageTypeException].
  /// May throw [LimitExceededException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ImageNotFoundException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the images to scan.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository in which to start an image scan request. If you do not specify
  /// a registry, the default registry is assumed.
  Future<StartImageScanResponse> startImageScan({
    @_s.required ImageIdentifier imageId,
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(imageId, 'imageId');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [LifecyclePolicyNotFoundException].
  /// May throw [LifecyclePolicyPreviewInProgressException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to be evaluated.
  ///
  /// Parameter [lifecyclePolicyText] :
  /// The policy to be evaluated against. If you do not specify a policy, the
  /// current policy for the repository is used.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repository. If you do not specify a registry, the default registry is
  /// assumed.
  Future<StartLifecyclePolicyPreviewResponse> startLifecyclePolicyPreview({
    @_s.required String repositoryName,
    String lifecyclePolicyText,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'lifecyclePolicyText',
      lifecyclePolicyText,
      100,
      30720,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
    );
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
  /// May throw [TooManyTagsException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
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
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.TagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Deletes specified tags from a resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagParameterException].
  /// May throw [TooManyTagsException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource from which to remove tags.
  /// Currently, the only supported resource is an Amazon ECR repository.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AmazonEC2ContainerRegistry_V20150921.UntagResource'
    };
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
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
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidLayerPartException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [UploadNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [KmsException].
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
  /// The AWS account ID associated with the registry to which you are uploading
  /// layer parts. If you do not specify a registry, the default registry is
  /// assumed.
  Future<UploadLayerPartResponse> uploadLayerPart({
    @_s.required Uint8List layerPartBlob,
    @_s.required int partFirstByte,
    @_s.required int partLastByte,
    @_s.required String repositoryName,
    @_s.required String uploadId,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(layerPartBlob, 'layerPartBlob');
    ArgumentError.checkNotNull(partFirstByte, 'partFirstByte');
    _s.validateNumRange(
      'partFirstByte',
      partFirstByte,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(partLastByte, 'partLastByte');
    _s.validateNumRange(
      'partLastByte',
      partLastByte,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(uploadId, 'uploadId');
    _s.validateStringPattern(
      'uploadId',
      uploadId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'registryId',
      registryId,
      r'''[0-9]{12}''',
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
        'layerPartBlob': layerPartBlob?.let(base64Encode),
        'partFirstByte': partFirstByte,
        'partLastByte': partLastByte,
        'repositoryName': repositoryName,
        'uploadId': uploadId,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return UploadLayerPartResponse.fromJson(jsonResponse.body);
  }
}

/// This data type is used in the <a>ImageScanFinding</a> data type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Attribute {
  /// The attribute key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The value assigned to the attribute key.
  @_s.JsonKey(name: 'value')
  final String value;

  Attribute({
    @_s.required this.key,
    this.value,
  });
  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
}

/// An object representing authorization data for an Amazon ECR registry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuthorizationData {
  /// A base64-encoded string that contains authorization data for the specified
  /// Amazon ECR registry. When the string is decoded, it is presented in the
  /// format <code>user:password</code> for private registry authentication using
  /// <code>docker login</code>.
  @_s.JsonKey(name: 'authorizationToken')
  final String authorizationToken;

  /// The Unix time in seconds and milliseconds when the authorization token
  /// expires. Authorization tokens are valid for 12 hours.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expiresAt')
  final DateTime expiresAt;

  /// The registry URL to use for this authorization token in a <code>docker
  /// login</code> command. The Amazon ECR registry URL format is
  /// <code>https://aws_account_id.dkr.ecr.region.amazonaws.com</code>. For
  /// example, <code>https://012345678910.dkr.ecr.us-east-1.amazonaws.com</code>..
  @_s.JsonKey(name: 'proxyEndpoint')
  final String proxyEndpoint;

  AuthorizationData({
    this.authorizationToken,
    this.expiresAt,
    this.proxyEndpoint,
  });
  factory AuthorizationData.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationDataFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCheckLayerAvailabilityResponse {
  /// Any failures associated with the call.
  @_s.JsonKey(name: 'failures')
  final List<LayerFailure> failures;

  /// A list of image layer objects corresponding to the image layer references in
  /// the request.
  @_s.JsonKey(name: 'layers')
  final List<Layer> layers;

  BatchCheckLayerAvailabilityResponse({
    this.failures,
    this.layers,
  });
  factory BatchCheckLayerAvailabilityResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchCheckLayerAvailabilityResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteImageResponse {
  /// Any failures associated with the call.
  @_s.JsonKey(name: 'failures')
  final List<ImageFailure> failures;

  /// The image IDs of the deleted images.
  @_s.JsonKey(name: 'imageIds')
  final List<ImageIdentifier> imageIds;

  BatchDeleteImageResponse({
    this.failures,
    this.imageIds,
  });
  factory BatchDeleteImageResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteImageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetImageResponse {
  /// Any failures associated with the call.
  @_s.JsonKey(name: 'failures')
  final List<ImageFailure> failures;

  /// A list of image objects corresponding to the image references in the
  /// request.
  @_s.JsonKey(name: 'images')
  final List<Image> images;

  BatchGetImageResponse({
    this.failures,
    this.images,
  });
  factory BatchGetImageResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetImageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CompleteLayerUploadResponse {
  /// The <code>sha256</code> digest of the image layer.
  @_s.JsonKey(name: 'layerDigest')
  final String layerDigest;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// The upload ID associated with the layer.
  @_s.JsonKey(name: 'uploadId')
  final String uploadId;

  CompleteLayerUploadResponse({
    this.layerDigest,
    this.registryId,
    this.repositoryName,
    this.uploadId,
  });
  factory CompleteLayerUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$CompleteLayerUploadResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRepositoryResponse {
  /// The repository that was created.
  @_s.JsonKey(name: 'repository')
  final Repository repository;

  CreateRepositoryResponse({
    this.repository,
  });
  factory CreateRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRepositoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLifecyclePolicyResponse {
  /// The time stamp of the last time that the lifecycle policy was run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastEvaluatedAt')
  final DateTime lastEvaluatedAt;

  /// The JSON lifecycle policy text.
  @_s.JsonKey(name: 'lifecyclePolicyText')
  final String lifecyclePolicyText;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  DeleteLifecyclePolicyResponse({
    this.lastEvaluatedAt,
    this.lifecyclePolicyText,
    this.registryId,
    this.repositoryName,
  });
  factory DeleteLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteLifecyclePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRegistryPolicyResponse {
  /// The contents of the registry permissions policy that was deleted.
  @_s.JsonKey(name: 'policyText')
  final String policyText;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  DeleteRegistryPolicyResponse({
    this.policyText,
    this.registryId,
  });
  factory DeleteRegistryPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRegistryPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRepositoryPolicyResponse {
  /// The JSON repository policy that was deleted from the repository.
  @_s.JsonKey(name: 'policyText')
  final String policyText;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  DeleteRepositoryPolicyResponse({
    this.policyText,
    this.registryId,
    this.repositoryName,
  });
  factory DeleteRepositoryPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRepositoryPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRepositoryResponse {
  /// The repository that was deleted.
  @_s.JsonKey(name: 'repository')
  final Repository repository;

  DeleteRepositoryResponse({
    this.repository,
  });
  factory DeleteRepositoryResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRepositoryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeImageScanFindingsResponse {
  @_s.JsonKey(name: 'imageId')
  final ImageIdentifier imageId;

  /// The information contained in the image scan findings.
  @_s.JsonKey(name: 'imageScanFindings')
  final ImageScanFindings imageScanFindings;

  /// The current state of the scan.
  @_s.JsonKey(name: 'imageScanStatus')
  final ImageScanStatus imageScanStatus;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeImageScanFindings</code> request. When the results of a
  /// <code>DescribeImageScanFindings</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is null when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  DescribeImageScanFindingsResponse({
    this.imageId,
    this.imageScanFindings,
    this.imageScanStatus,
    this.nextToken,
    this.registryId,
    this.repositoryName,
  });
  factory DescribeImageScanFindingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeImageScanFindingsResponseFromJson(json);
}

/// An object representing a filter on a <a>DescribeImages</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeImagesFilter {
  /// The tag status with which to filter your <a>DescribeImages</a> results. You
  /// can filter results based on whether they are <code>TAGGED</code> or
  /// <code>UNTAGGED</code>.
  @_s.JsonKey(name: 'tagStatus')
  final TagStatus tagStatus;

  DescribeImagesFilter({
    this.tagStatus,
  });
  Map<String, dynamic> toJson() => _$DescribeImagesFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeImagesResponse {
  /// A list of <a>ImageDetail</a> objects that contain data about the image.
  @_s.JsonKey(name: 'imageDetails')
  final List<ImageDetail> imageDetails;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeImages</code> request. When the results of a
  /// <code>DescribeImages</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeImagesResponse({
    this.imageDetails,
    this.nextToken,
  });
  factory DescribeImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeImagesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRegistryResponse {
  /// The ID of the registry.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The replication configuration for the registry.
  @_s.JsonKey(name: 'replicationConfiguration')
  final ReplicationConfiguration replicationConfiguration;

  DescribeRegistryResponse({
    this.registryId,
    this.replicationConfiguration,
  });
  factory DescribeRegistryResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRegistryResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRepositoriesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeRepositories</code> request. When the results of a
  /// <code>DescribeRepositories</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of repository objects corresponding to valid repositories.
  @_s.JsonKey(name: 'repositories')
  final List<Repository> repositories;

  DescribeRepositoriesResponse({
    this.nextToken,
    this.repositories,
  });
  factory DescribeRepositoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRepositoriesResponseFromJson(json);
}

/// The encryption configuration for the repository. This determines how the
/// contents of your repository are encrypted at rest.
///
/// By default, when no encryption configuration is set or the
/// <code>AES256</code> encryption type is used, Amazon ECR uses server-side
/// encryption with Amazon S3-managed encryption keys which encrypts your data
/// at rest using an AES-256 encryption algorithm. This does not require any
/// action on your part.
///
/// For more control over the encryption of the contents of your repository, you
/// can use server-side encryption with customer master keys (CMKs) stored in
/// AWS Key Management Service (AWS KMS) to encrypt your images. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/encryption-at-rest.html">Amazon
/// ECR encryption at rest</a> in the <i>Amazon Elastic Container Registry User
/// Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionConfiguration {
  /// The encryption type to use.
  ///
  /// If you use the <code>KMS</code> encryption type, the contents of the
  /// repository will be encrypted using server-side encryption with customer
  /// master keys (CMKs) stored in AWS KMS. When you use AWS KMS to encrypt your
  /// data, you can either use the default AWS managed CMK for Amazon ECR, or
  /// specify your own CMK, which you already created. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingKMSEncryption.html">Protecting
  /// Data Using Server-Side Encryption with CMKs Stored in AWS Key Management
  /// Service (SSE-KMS)</a> in the <i>Amazon Simple Storage Service Console
  /// Developer Guide.</i>.
  ///
  /// If you use the <code>AES256</code> encryption type, Amazon ECR uses
  /// server-side encryption with Amazon S3-managed encryption keys which encrypts
  /// the images in the repository using an AES-256 encryption algorithm. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingServerSideEncryption.html">Protecting
  /// Data Using Server-Side Encryption with Amazon S3-Managed Encryption Keys
  /// (SSE-S3)</a> in the <i>Amazon Simple Storage Service Console Developer
  /// Guide.</i>.
  @_s.JsonKey(name: 'encryptionType')
  final EncryptionType encryptionType;

  /// If you use the <code>KMS</code> encryption type, specify the CMK to use for
  /// encryption. The alias, key ID, or full ARN of the CMK can be specified. The
  /// key must exist in the same Region as the repository. If no key is specified,
  /// the default AWS managed CMK for Amazon ECR will be used.
  @_s.JsonKey(name: 'kmsKey')
  final String kmsKey;

  EncryptionConfiguration({
    @_s.required this.encryptionType,
    this.kmsKey,
  });
  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EncryptionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionConfigurationToJson(this);
}

enum EncryptionType {
  @_s.JsonValue('AES256')
  aes256,
  @_s.JsonValue('KMS')
  kms,
}

enum FindingSeverity {
  @_s.JsonValue('INFORMATIONAL')
  informational,
  @_s.JsonValue('LOW')
  low,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('CRITICAL')
  critical,
  @_s.JsonValue('UNDEFINED')
  undefined,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAuthorizationTokenResponse {
  /// A list of authorization token data objects that correspond to the
  /// <code>registryIds</code> values in the request.
  @_s.JsonKey(name: 'authorizationData')
  final List<AuthorizationData> authorizationData;

  GetAuthorizationTokenResponse({
    this.authorizationData,
  });
  factory GetAuthorizationTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAuthorizationTokenResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDownloadUrlForLayerResponse {
  /// The pre-signed Amazon S3 download URL for the requested layer.
  @_s.JsonKey(name: 'downloadUrl')
  final String downloadUrl;

  /// The digest of the image layer to download.
  @_s.JsonKey(name: 'layerDigest')
  final String layerDigest;

  GetDownloadUrlForLayerResponse({
    this.downloadUrl,
    this.layerDigest,
  });
  factory GetDownloadUrlForLayerResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDownloadUrlForLayerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLifecyclePolicyPreviewResponse {
  /// The JSON lifecycle policy text.
  @_s.JsonKey(name: 'lifecyclePolicyText')
  final String lifecyclePolicyText;

  /// The <code>nextToken</code> value to include in a future
  /// <code>GetLifecyclePolicyPreview</code> request. When the results of a
  /// <code>GetLifecyclePolicyPreview</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The results of the lifecycle policy preview request.
  @_s.JsonKey(name: 'previewResults')
  final List<LifecyclePolicyPreviewResult> previewResults;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// The status of the lifecycle policy preview request.
  @_s.JsonKey(name: 'status')
  final LifecyclePolicyPreviewStatus status;

  /// The list of images that is returned as a result of the action.
  @_s.JsonKey(name: 'summary')
  final LifecyclePolicyPreviewSummary summary;

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
          Map<String, dynamic> json) =>
      _$GetLifecyclePolicyPreviewResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLifecyclePolicyResponse {
  /// The time stamp of the last time that the lifecycle policy was run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastEvaluatedAt')
  final DateTime lastEvaluatedAt;

  /// The JSON lifecycle policy text.
  @_s.JsonKey(name: 'lifecyclePolicyText')
  final String lifecyclePolicyText;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  GetLifecyclePolicyResponse({
    this.lastEvaluatedAt,
    this.lifecyclePolicyText,
    this.registryId,
    this.repositoryName,
  });
  factory GetLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetLifecyclePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRegistryPolicyResponse {
  /// The JSON text of the permissions policy for a registry.
  @_s.JsonKey(name: 'policyText')
  final String policyText;

  /// The ID of the registry.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  GetRegistryPolicyResponse({
    this.policyText,
    this.registryId,
  });
  factory GetRegistryPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRegistryPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRepositoryPolicyResponse {
  /// The JSON repository policy text associated with the repository.
  @_s.JsonKey(name: 'policyText')
  final String policyText;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  GetRepositoryPolicyResponse({
    this.policyText,
    this.registryId,
    this.repositoryName,
  });
  factory GetRepositoryPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRepositoryPolicyResponseFromJson(json);
}

/// An object representing an Amazon ECR image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Image {
  /// An object containing the image tag and image digest associated with an
  /// image.
  @_s.JsonKey(name: 'imageId')
  final ImageIdentifier imageId;

  /// The image manifest associated with the image.
  @_s.JsonKey(name: 'imageManifest')
  final String imageManifest;

  /// The manifest media type of the image.
  @_s.JsonKey(name: 'imageManifestMediaType')
  final String imageManifestMediaType;

  /// The AWS account ID associated with the registry containing the image.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The name of the repository associated with the image.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  Image({
    this.imageId,
    this.imageManifest,
    this.imageManifestMediaType,
    this.registryId,
    this.repositoryName,
  });
  factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);
}

enum ImageActionType {
  @_s.JsonValue('EXPIRE')
  expire,
}

/// An object that describes an image returned by a <a>DescribeImages</a>
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageDetail {
  /// The artifact media type of the image.
  @_s.JsonKey(name: 'artifactMediaType')
  final String artifactMediaType;

  /// The <code>sha256</code> digest of the image manifest.
  @_s.JsonKey(name: 'imageDigest')
  final String imageDigest;

  /// The media type of the image manifest.
  @_s.JsonKey(name: 'imageManifestMediaType')
  final String imageManifestMediaType;

  /// The date and time, expressed in standard JavaScript date format, at which
  /// the current image was pushed to the repository.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'imagePushedAt')
  final DateTime imagePushedAt;

  /// A summary of the last completed image scan.
  @_s.JsonKey(name: 'imageScanFindingsSummary')
  final ImageScanFindingsSummary imageScanFindingsSummary;

  /// The current state of the scan.
  @_s.JsonKey(name: 'imageScanStatus')
  final ImageScanStatus imageScanStatus;

  /// The size, in bytes, of the image in the repository.
  ///
  /// If the image is a manifest list, this will be the max size of all manifests
  /// in the list.
  /// <note>
  /// Beginning with Docker version 1.9, the Docker client compresses image layers
  /// before pushing them to a V2 Docker registry. The output of the <code>docker
  /// images</code> command shows the uncompressed image size, so it may return a
  /// larger image size than the image sizes returned by <a>DescribeImages</a>.
  /// </note>
  @_s.JsonKey(name: 'imageSizeInBytes')
  final int imageSizeInBytes;

  /// The list of tags associated with this image.
  @_s.JsonKey(name: 'imageTags')
  final List<String> imageTags;

  /// The AWS account ID associated with the registry to which this image belongs.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The name of the repository to which this image belongs.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  ImageDetail({
    this.artifactMediaType,
    this.imageDigest,
    this.imageManifestMediaType,
    this.imagePushedAt,
    this.imageScanFindingsSummary,
    this.imageScanStatus,
    this.imageSizeInBytes,
    this.imageTags,
    this.registryId,
    this.repositoryName,
  });
  factory ImageDetail.fromJson(Map<String, dynamic> json) =>
      _$ImageDetailFromJson(json);
}

/// An object representing an Amazon ECR image failure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageFailure {
  /// The code associated with the failure.
  @_s.JsonKey(name: 'failureCode')
  final ImageFailureCode failureCode;

  /// The reason for the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The image ID associated with the failure.
  @_s.JsonKey(name: 'imageId')
  final ImageIdentifier imageId;

  ImageFailure({
    this.failureCode,
    this.failureReason,
    this.imageId,
  });
  factory ImageFailure.fromJson(Map<String, dynamic> json) =>
      _$ImageFailureFromJson(json);
}

enum ImageFailureCode {
  @_s.JsonValue('InvalidImageDigest')
  invalidImageDigest,
  @_s.JsonValue('InvalidImageTag')
  invalidImageTag,
  @_s.JsonValue('ImageTagDoesNotMatchDigest')
  imageTagDoesNotMatchDigest,
  @_s.JsonValue('ImageNotFound')
  imageNotFound,
  @_s.JsonValue('MissingDigestAndTag')
  missingDigestAndTag,
  @_s.JsonValue('ImageReferencedByManifestList')
  imageReferencedByManifestList,
  @_s.JsonValue('KmsError')
  kmsError,
}

/// An object with identifying information for an Amazon ECR image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImageIdentifier {
  /// The <code>sha256</code> digest of the image manifest.
  @_s.JsonKey(name: 'imageDigest')
  final String imageDigest;

  /// The tag used for the image.
  @_s.JsonKey(name: 'imageTag')
  final String imageTag;

  ImageIdentifier({
    this.imageDigest,
    this.imageTag,
  });
  factory ImageIdentifier.fromJson(Map<String, dynamic> json) =>
      _$ImageIdentifierFromJson(json);

  Map<String, dynamic> toJson() => _$ImageIdentifierToJson(this);
}

/// Contains information about an image scan finding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageScanFinding {
  /// A collection of attributes of the host from which the finding is generated.
  @_s.JsonKey(name: 'attributes')
  final List<Attribute> attributes;

  /// The description of the finding.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The name associated with the finding, usually a CVE number.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The finding severity.
  @_s.JsonKey(name: 'severity')
  final FindingSeverity severity;

  /// A link containing additional details about the security vulnerability.
  @_s.JsonKey(name: 'uri')
  final String uri;

  ImageScanFinding({
    this.attributes,
    this.description,
    this.name,
    this.severity,
    this.uri,
  });
  factory ImageScanFinding.fromJson(Map<String, dynamic> json) =>
      _$ImageScanFindingFromJson(json);
}

/// The details of an image scan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageScanFindings {
  /// The image vulnerability counts, sorted by severity.
  @_s.JsonKey(name: 'findingSeverityCounts')
  final Map<FindingSeverity, int> findingSeverityCounts;

  /// The findings from the image scan.
  @_s.JsonKey(name: 'findings')
  final List<ImageScanFinding> findings;

  /// The time of the last completed image scan.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'imageScanCompletedAt')
  final DateTime imageScanCompletedAt;

  /// The time when the vulnerability data was last scanned.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'vulnerabilitySourceUpdatedAt')
  final DateTime vulnerabilitySourceUpdatedAt;

  ImageScanFindings({
    this.findingSeverityCounts,
    this.findings,
    this.imageScanCompletedAt,
    this.vulnerabilitySourceUpdatedAt,
  });
  factory ImageScanFindings.fromJson(Map<String, dynamic> json) =>
      _$ImageScanFindingsFromJson(json);
}

/// A summary of the last completed image scan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageScanFindingsSummary {
  /// The image vulnerability counts, sorted by severity.
  @_s.JsonKey(name: 'findingSeverityCounts')
  final Map<FindingSeverity, int> findingSeverityCounts;

  /// The time of the last completed image scan.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'imageScanCompletedAt')
  final DateTime imageScanCompletedAt;

  /// The time when the vulnerability data was last scanned.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'vulnerabilitySourceUpdatedAt')
  final DateTime vulnerabilitySourceUpdatedAt;

  ImageScanFindingsSummary({
    this.findingSeverityCounts,
    this.imageScanCompletedAt,
    this.vulnerabilitySourceUpdatedAt,
  });
  factory ImageScanFindingsSummary.fromJson(Map<String, dynamic> json) =>
      _$ImageScanFindingsSummaryFromJson(json);
}

/// The current status of an image scan.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageScanStatus {
  /// The description of the image scan status.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The current state of an image scan.
  @_s.JsonKey(name: 'status')
  final ScanStatus status;

  ImageScanStatus({
    this.description,
    this.status,
  });
  factory ImageScanStatus.fromJson(Map<String, dynamic> json) =>
      _$ImageScanStatusFromJson(json);
}

/// The image scanning configuration for a repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ImageScanningConfiguration {
  /// The setting that determines whether images are scanned after being pushed to
  /// a repository. If set to <code>true</code>, images will be scanned after
  /// being pushed. If this parameter is not specified, it will default to
  /// <code>false</code> and images will not be scanned unless a scan is manually
  /// started with the <a>StartImageScan</a> API.
  @_s.JsonKey(name: 'scanOnPush')
  final bool scanOnPush;

  ImageScanningConfiguration({
    this.scanOnPush,
  });
  factory ImageScanningConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ImageScanningConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ImageScanningConfigurationToJson(this);
}

enum ImageTagMutability {
  @_s.JsonValue('MUTABLE')
  mutable,
  @_s.JsonValue('IMMUTABLE')
  immutable,
}

extension on ImageTagMutability {
  String toValue() {
    switch (this) {
      case ImageTagMutability.mutable:
        return 'MUTABLE';
      case ImageTagMutability.immutable:
        return 'IMMUTABLE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InitiateLayerUploadResponse {
  /// The size, in bytes, that Amazon ECR expects future layer part uploads to be.
  @_s.JsonKey(name: 'partSize')
  final int partSize;

  /// The upload ID for the layer upload. This parameter is passed to further
  /// <a>UploadLayerPart</a> and <a>CompleteLayerUpload</a> operations.
  @_s.JsonKey(name: 'uploadId')
  final String uploadId;

  InitiateLayerUploadResponse({
    this.partSize,
    this.uploadId,
  });
  factory InitiateLayerUploadResponse.fromJson(Map<String, dynamic> json) =>
      _$InitiateLayerUploadResponseFromJson(json);
}

/// An object representing an Amazon ECR image layer.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Layer {
  /// The availability status of the image layer.
  @_s.JsonKey(name: 'layerAvailability')
  final LayerAvailability layerAvailability;

  /// The <code>sha256</code> digest of the image layer.
  @_s.JsonKey(name: 'layerDigest')
  final String layerDigest;

  /// The size, in bytes, of the image layer.
  @_s.JsonKey(name: 'layerSize')
  final int layerSize;

  /// The media type of the layer, such as
  /// <code>application/vnd.docker.image.rootfs.diff.tar.gzip</code> or
  /// <code>application/vnd.oci.image.layer.v1.tar+gzip</code>.
  @_s.JsonKey(name: 'mediaType')
  final String mediaType;

  Layer({
    this.layerAvailability,
    this.layerDigest,
    this.layerSize,
    this.mediaType,
  });
  factory Layer.fromJson(Map<String, dynamic> json) => _$LayerFromJson(json);
}

enum LayerAvailability {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('UNAVAILABLE')
  unavailable,
}

/// An object representing an Amazon ECR image layer failure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LayerFailure {
  /// The failure code associated with the failure.
  @_s.JsonKey(name: 'failureCode')
  final LayerFailureCode failureCode;

  /// The reason for the failure.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The layer digest associated with the failure.
  @_s.JsonKey(name: 'layerDigest')
  final String layerDigest;

  LayerFailure({
    this.failureCode,
    this.failureReason,
    this.layerDigest,
  });
  factory LayerFailure.fromJson(Map<String, dynamic> json) =>
      _$LayerFailureFromJson(json);
}

enum LayerFailureCode {
  @_s.JsonValue('InvalidLayerDigest')
  invalidLayerDigest,
  @_s.JsonValue('MissingLayerDigest')
  missingLayerDigest,
}

/// The filter for the lifecycle policy preview.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class LifecyclePolicyPreviewFilter {
  /// The tag status of the image.
  @_s.JsonKey(name: 'tagStatus')
  final TagStatus tagStatus;

  LifecyclePolicyPreviewFilter({
    this.tagStatus,
  });
  Map<String, dynamic> toJson() => _$LifecyclePolicyPreviewFilterToJson(this);
}

/// The result of the lifecycle policy preview.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LifecyclePolicyPreviewResult {
  /// The type of action to be taken.
  @_s.JsonKey(name: 'action')
  final LifecyclePolicyRuleAction action;

  /// The priority of the applied rule.
  @_s.JsonKey(name: 'appliedRulePriority')
  final int appliedRulePriority;

  /// The <code>sha256</code> digest of the image manifest.
  @_s.JsonKey(name: 'imageDigest')
  final String imageDigest;

  /// The date and time, expressed in standard JavaScript date format, at which
  /// the current image was pushed to the repository.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'imagePushedAt')
  final DateTime imagePushedAt;

  /// The list of tags associated with this image.
  @_s.JsonKey(name: 'imageTags')
  final List<String> imageTags;

  LifecyclePolicyPreviewResult({
    this.action,
    this.appliedRulePriority,
    this.imageDigest,
    this.imagePushedAt,
    this.imageTags,
  });
  factory LifecyclePolicyPreviewResult.fromJson(Map<String, dynamic> json) =>
      _$LifecyclePolicyPreviewResultFromJson(json);
}

enum LifecyclePolicyPreviewStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('EXPIRED')
  expired,
  @_s.JsonValue('FAILED')
  failed,
}

/// The summary of the lifecycle policy preview request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LifecyclePolicyPreviewSummary {
  /// The number of expiring images.
  @_s.JsonKey(name: 'expiringImageTotalCount')
  final int expiringImageTotalCount;

  LifecyclePolicyPreviewSummary({
    this.expiringImageTotalCount,
  });
  factory LifecyclePolicyPreviewSummary.fromJson(Map<String, dynamic> json) =>
      _$LifecyclePolicyPreviewSummaryFromJson(json);
}

/// The type of action to be taken.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LifecyclePolicyRuleAction {
  /// The type of action to be taken.
  @_s.JsonKey(name: 'type')
  final ImageActionType type;

  LifecyclePolicyRuleAction({
    this.type,
  });
  factory LifecyclePolicyRuleAction.fromJson(Map<String, dynamic> json) =>
      _$LifecyclePolicyRuleActionFromJson(json);
}

/// An object representing a filter on a <a>ListImages</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListImagesFilter {
  /// The tag status with which to filter your <a>ListImages</a> results. You can
  /// filter results based on whether they are <code>TAGGED</code> or
  /// <code>UNTAGGED</code>.
  @_s.JsonKey(name: 'tagStatus')
  final TagStatus tagStatus;

  ListImagesFilter({
    this.tagStatus,
  });
  Map<String, dynamic> toJson() => _$ListImagesFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListImagesResponse {
  /// The list of image IDs for the requested repository.
  @_s.JsonKey(name: 'imageIds')
  final List<ImageIdentifier> imageIds;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListImages</code> request. When the results of a
  /// <code>ListImages</code> request exceed <code>maxResults</code>, this value
  /// can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListImagesResponse({
    this.imageIds,
    this.nextToken,
  });
  factory ListImagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListImagesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags for the resource.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutImageResponse {
  /// Details of the image uploaded.
  @_s.JsonKey(name: 'image')
  final Image image;

  PutImageResponse({
    this.image,
  });
  factory PutImageResponse.fromJson(Map<String, dynamic> json) =>
      _$PutImageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutImageScanningConfigurationResponse {
  /// The image scanning configuration setting for the repository.
  @_s.JsonKey(name: 'imageScanningConfiguration')
  final ImageScanningConfiguration imageScanningConfiguration;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  PutImageScanningConfigurationResponse({
    this.imageScanningConfiguration,
    this.registryId,
    this.repositoryName,
  });
  factory PutImageScanningConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutImageScanningConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutImageTagMutabilityResponse {
  /// The image tag mutability setting for the repository.
  @_s.JsonKey(name: 'imageTagMutability')
  final ImageTagMutability imageTagMutability;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  PutImageTagMutabilityResponse({
    this.imageTagMutability,
    this.registryId,
    this.repositoryName,
  });
  factory PutImageTagMutabilityResponse.fromJson(Map<String, dynamic> json) =>
      _$PutImageTagMutabilityResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutLifecyclePolicyResponse {
  /// The JSON repository policy text.
  @_s.JsonKey(name: 'lifecyclePolicyText')
  final String lifecyclePolicyText;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  PutLifecyclePolicyResponse({
    this.lifecyclePolicyText,
    this.registryId,
    this.repositoryName,
  });
  factory PutLifecyclePolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutLifecyclePolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRegistryPolicyResponse {
  /// The JSON policy text for your registry.
  @_s.JsonKey(name: 'policyText')
  final String policyText;

  /// The registry ID.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  PutRegistryPolicyResponse({
    this.policyText,
    this.registryId,
  });
  factory PutRegistryPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutRegistryPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutReplicationConfigurationResponse {
  /// The contents of the replication configuration for the registry.
  @_s.JsonKey(name: 'replicationConfiguration')
  final ReplicationConfiguration replicationConfiguration;

  PutReplicationConfigurationResponse({
    this.replicationConfiguration,
  });
  factory PutReplicationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutReplicationConfigurationResponseFromJson(json);
}

/// The replication configuration for a registry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ReplicationConfiguration {
  /// An array of objects representing the replication rules for a replication
  /// configuration. A replication configuration may contain only one replication
  /// rule but the rule may contain one or more replication destinations.
  @_s.JsonKey(name: 'rules')
  final List<ReplicationRule> rules;

  ReplicationConfiguration({
    @_s.required this.rules,
  });
  factory ReplicationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ReplicationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicationConfigurationToJson(this);
}

/// An array of objects representing the details of a replication destination.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ReplicationDestination {
  /// A Region to replicate to.
  @_s.JsonKey(name: 'region')
  final String region;

  /// The account ID of the destination registry to replicate to.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  ReplicationDestination({
    @_s.required this.region,
    @_s.required this.registryId,
  });
  factory ReplicationDestination.fromJson(Map<String, dynamic> json) =>
      _$ReplicationDestinationFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicationDestinationToJson(this);
}

/// An array of objects representing the replication destinations for a
/// replication configuration. A replication configuration may contain only one
/// replication rule but the rule may contain one or more replication
/// destinations.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ReplicationRule {
  /// An array of objects representing the details of a replication destination.
  @_s.JsonKey(name: 'destinations')
  final List<ReplicationDestination> destinations;

  ReplicationRule({
    @_s.required this.destinations,
  });
  factory ReplicationRule.fromJson(Map<String, dynamic> json) =>
      _$ReplicationRuleFromJson(json);

  Map<String, dynamic> toJson() => _$ReplicationRuleToJson(this);
}

/// An object representing a repository.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Repository {
  /// The date and time, in JavaScript date format, when the repository was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The encryption configuration for the repository. This determines how the
  /// contents of your repository are encrypted at rest.
  @_s.JsonKey(name: 'encryptionConfiguration')
  final EncryptionConfiguration encryptionConfiguration;
  @_s.JsonKey(name: 'imageScanningConfiguration')
  final ImageScanningConfiguration imageScanningConfiguration;

  /// The tag mutability setting for the repository.
  @_s.JsonKey(name: 'imageTagMutability')
  final ImageTagMutability imageTagMutability;

  /// The AWS account ID associated with the registry that contains the
  /// repository.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The Amazon Resource Name (ARN) that identifies the repository. The ARN
  /// contains the <code>arn:aws:ecr</code> namespace, followed by the region of
  /// the repository, AWS account ID of the repository owner, repository
  /// namespace, and repository name. For example,
  /// <code>arn:aws:ecr:region:012345678910:repository/test</code>.
  @_s.JsonKey(name: 'repositoryArn')
  final String repositoryArn;

  /// The name of the repository.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// The URI for the repository. You can use this URI for container image
  /// <code>push</code> and <code>pull</code> operations.
  @_s.JsonKey(name: 'repositoryUri')
  final String repositoryUri;

  Repository({
    this.createdAt,
    this.encryptionConfiguration,
    this.imageScanningConfiguration,
    this.imageTagMutability,
    this.registryId,
    this.repositoryArn,
    this.repositoryName,
    this.repositoryUri,
  });
  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
}

enum ScanStatus {
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETE')
  complete,
  @_s.JsonValue('FAILED')
  failed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SetRepositoryPolicyResponse {
  /// The JSON repository policy text applied to the repository.
  @_s.JsonKey(name: 'policyText')
  final String policyText;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  SetRepositoryPolicyResponse({
    this.policyText,
    this.registryId,
    this.repositoryName,
  });
  factory SetRepositoryPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$SetRepositoryPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartImageScanResponse {
  @_s.JsonKey(name: 'imageId')
  final ImageIdentifier imageId;

  /// The current state of the scan.
  @_s.JsonKey(name: 'imageScanStatus')
  final ImageScanStatus imageScanStatus;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  StartImageScanResponse({
    this.imageId,
    this.imageScanStatus,
    this.registryId,
    this.repositoryName,
  });
  factory StartImageScanResponse.fromJson(Map<String, dynamic> json) =>
      _$StartImageScanResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartLifecyclePolicyPreviewResponse {
  /// The JSON repository policy text.
  @_s.JsonKey(name: 'lifecyclePolicyText')
  final String lifecyclePolicyText;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// The status of the lifecycle policy preview request.
  @_s.JsonKey(name: 'status')
  final LifecyclePolicyPreviewStatus status;

  StartLifecyclePolicyPreviewResponse({
    this.lifecyclePolicyText,
    this.registryId,
    this.repositoryName,
    this.status,
  });
  factory StartLifecyclePolicyPreviewResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartLifecyclePolicyPreviewResponseFromJson(json);
}

/// The metadata that you apply to a resource to help you categorize and
/// organize them. Each tag consists of a key and an optional value, both of
/// which you define. Tag keys can have a maximum character length of 128
/// characters, and tag values can have a maximum length of 256 characters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// One part of a key-value pair that make up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The optional part of a key-value pair that make up a tag. A
  /// <code>value</code> acts as a descriptor within a tag category (key).
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

enum TagStatus {
  @_s.JsonValue('TAGGED')
  tagged,
  @_s.JsonValue('UNTAGGED')
  untagged,
  @_s.JsonValue('ANY')
  any,
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
class UploadLayerPartResponse {
  /// The integer value of the last byte received in the request.
  @_s.JsonKey(name: 'lastByteReceived')
  final int lastByteReceived;

  /// The registry ID associated with the request.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The repository name associated with the request.
  @_s.JsonKey(name: 'repositoryName')
  final String repositoryName;

  /// The upload ID associated with the request.
  @_s.JsonKey(name: 'uploadId')
  final String uploadId;

  UploadLayerPartResponse({
    this.lastByteReceived,
    this.registryId,
    this.repositoryName,
    this.uploadId,
  });
  factory UploadLayerPartResponse.fromJson(Map<String, dynamic> json) =>
      _$UploadLayerPartResponseFromJson(json);
}

class EmptyUploadException extends _s.GenericAwsException {
  EmptyUploadException({String type, String message})
      : super(type: type, code: 'EmptyUploadException', message: message);
}

class ImageAlreadyExistsException extends _s.GenericAwsException {
  ImageAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'ImageAlreadyExistsException', message: message);
}

class ImageDigestDoesNotMatchException extends _s.GenericAwsException {
  ImageDigestDoesNotMatchException({String type, String message})
      : super(
            type: type,
            code: 'ImageDigestDoesNotMatchException',
            message: message);
}

class ImageNotFoundException extends _s.GenericAwsException {
  ImageNotFoundException({String type, String message})
      : super(type: type, code: 'ImageNotFoundException', message: message);
}

class ImageTagAlreadyExistsException extends _s.GenericAwsException {
  ImageTagAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ImageTagAlreadyExistsException',
            message: message);
}

class InvalidLayerException extends _s.GenericAwsException {
  InvalidLayerException({String type, String message})
      : super(type: type, code: 'InvalidLayerException', message: message);
}

class InvalidLayerPartException extends _s.GenericAwsException {
  InvalidLayerPartException({String type, String message})
      : super(type: type, code: 'InvalidLayerPartException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidTagParameterException extends _s.GenericAwsException {
  InvalidTagParameterException({String type, String message})
      : super(
            type: type, code: 'InvalidTagParameterException', message: message);
}

class KmsException extends _s.GenericAwsException {
  KmsException({String type, String message})
      : super(type: type, code: 'KmsException', message: message);
}

class LayerAlreadyExistsException extends _s.GenericAwsException {
  LayerAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'LayerAlreadyExistsException', message: message);
}

class LayerInaccessibleException extends _s.GenericAwsException {
  LayerInaccessibleException({String type, String message})
      : super(type: type, code: 'LayerInaccessibleException', message: message);
}

class LayerPartTooSmallException extends _s.GenericAwsException {
  LayerPartTooSmallException({String type, String message})
      : super(type: type, code: 'LayerPartTooSmallException', message: message);
}

class LayersNotFoundException extends _s.GenericAwsException {
  LayersNotFoundException({String type, String message})
      : super(type: type, code: 'LayersNotFoundException', message: message);
}

class LifecyclePolicyNotFoundException extends _s.GenericAwsException {
  LifecyclePolicyNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'LifecyclePolicyNotFoundException',
            message: message);
}

class LifecyclePolicyPreviewInProgressException extends _s.GenericAwsException {
  LifecyclePolicyPreviewInProgressException({String type, String message})
      : super(
            type: type,
            code: 'LifecyclePolicyPreviewInProgressException',
            message: message);
}

class LifecyclePolicyPreviewNotFoundException extends _s.GenericAwsException {
  LifecyclePolicyPreviewNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'LifecyclePolicyPreviewNotFoundException',
            message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ReferencedImagesNotFoundException extends _s.GenericAwsException {
  ReferencedImagesNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'ReferencedImagesNotFoundException',
            message: message);
}

class RegistryPolicyNotFoundException extends _s.GenericAwsException {
  RegistryPolicyNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'RegistryPolicyNotFoundException',
            message: message);
}

class RepositoryAlreadyExistsException extends _s.GenericAwsException {
  RepositoryAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryAlreadyExistsException',
            message: message);
}

class RepositoryNotEmptyException extends _s.GenericAwsException {
  RepositoryNotEmptyException({String type, String message})
      : super(
            type: type, code: 'RepositoryNotEmptyException', message: message);
}

class RepositoryNotFoundException extends _s.GenericAwsException {
  RepositoryNotFoundException({String type, String message})
      : super(
            type: type, code: 'RepositoryNotFoundException', message: message);
}

class RepositoryPolicyNotFoundException extends _s.GenericAwsException {
  RepositoryPolicyNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'RepositoryPolicyNotFoundException',
            message: message);
}

class ScanNotFoundException extends _s.GenericAwsException {
  ScanNotFoundException({String type, String message})
      : super(type: type, code: 'ScanNotFoundException', message: message);
}

class ServerException extends _s.GenericAwsException {
  ServerException({String type, String message})
      : super(type: type, code: 'ServerException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnsupportedImageTypeException extends _s.GenericAwsException {
  UnsupportedImageTypeException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedImageTypeException',
            message: message);
}

class UploadNotFoundException extends _s.GenericAwsException {
  UploadNotFoundException({String type, String message})
      : super(type: type, code: 'UploadNotFoundException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'EmptyUploadException': (type, message) =>
      EmptyUploadException(type: type, message: message),
  'ImageAlreadyExistsException': (type, message) =>
      ImageAlreadyExistsException(type: type, message: message),
  'ImageDigestDoesNotMatchException': (type, message) =>
      ImageDigestDoesNotMatchException(type: type, message: message),
  'ImageNotFoundException': (type, message) =>
      ImageNotFoundException(type: type, message: message),
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
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnsupportedImageTypeException': (type, message) =>
      UnsupportedImageTypeException(type: type, message: message),
  'UploadNotFoundException': (type, message) =>
      UploadNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
