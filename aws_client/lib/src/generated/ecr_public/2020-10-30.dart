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

part '2020-10-30.g.dart';

/// Amazon Elastic Container Registry (Amazon ECR) is a managed container image
/// registry service. Amazon ECR provides both public and private registries to
/// host your container images. You can use the familiar Docker CLI, or their
/// preferred client, to push, pull, and manage images. Amazon ECR provides a
/// secure, scalable, and reliable registry for your Docker or Open Container
/// Initiative (OCI) images. Amazon ECR supports public repositories with this
/// API. For information about the Amazon ECR API for private repositories, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/APIReference/Welcome.html">Amazon
/// Elastic Container Registry API Reference</a>.
class EcrPublic {
  final _s.JsonProtocol _protocol;
  EcrPublic({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.ecr-public',
            signingName: 'ecr-public',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Checks the availability of one or more image layers within a repository in
  /// a public registry. When an image is pushed to a repository, each image
  /// layer is checked to verify if it has been uploaded before. If it has been
  /// uploaded, then the image layer is skipped.
  /// <note>
  /// This operation is used by the Amazon ECR proxy and is not generally used
  /// by customers for pulling and pushing images. In most cases, you should use
  /// the <code>docker</code> CLI to pull, tag, and push images.
  /// </note>
  ///
  /// May throw [RepositoryNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerException].
  /// May throw [RegistryNotFoundException].
  ///
  /// Parameter [layerDigests] :
  /// The digests of the image layers to check.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that is associated with the image layers to
  /// check.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the public registry that contains the
  /// image layers to check. If you do not specify a registry, the default
  /// public registry is assumed.
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
      205,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'registryId',
      registryId,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.BatchCheckLayerAvailability'
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

  /// Deletes a list of specified images within a repository in a public
  /// registry. Images are specified with either an <code>imageTag</code> or
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
  /// The repository in a public registry that contains the image to delete.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the image to
  /// delete. If you do not specify a registry, the default public registry is
  /// assumed.
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
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.BatchDeleteImage'
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

  /// Informs Amazon ECR that the image layer upload has completed for a
  /// specified public registry, repository name, and upload ID. You can
  /// optionally provide a <code>sha256</code> digest of the image layer for
  /// data validation purposes.
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
  /// May throw [RegistryNotFoundException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [layerDigests] :
  /// The <code>sha256</code> digest of the image layer.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository in a public registry to associate with the
  /// image layer.
  ///
  /// Parameter [uploadId] :
  /// The upload ID from a previous <a>InitiateLayerUpload</a> operation to
  /// associate with the image layer.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry to which to upload layers.
  /// If you do not specify a registry, the default public registry is assumed.
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
      205,
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
    _s.validateStringLength(
      'registryId',
      registryId,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.CompleteLayerUpload'
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

  /// Creates a repository in a public registry. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Repositories.html">Amazon
  /// ECR repositories</a> in the <i>Amazon Elastic Container Registry User
  /// Guide</i>.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryAlreadyExistsException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [repositoryName] :
  /// The name to use for the repository. This appears publicly in the Amazon
  /// ECR Public Gallery. The repository name may be specified on its own (such
  /// as <code>nginx-web-app</code>) or it can be prepended with a namespace to
  /// group the repository into a category (such as
  /// <code>project-a/nginx-web-app</code>).
  ///
  /// Parameter [catalogData] :
  /// The details about the repository that are publicly visible in the Amazon
  /// ECR Public Gallery.
  Future<CreateRepositoryResponse> createRepository({
    @_s.required String repositoryName,
    RepositoryCatalogDataInput catalogData,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.CreateRepository'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (catalogData != null) 'catalogData': catalogData,
      },
    );

    return CreateRepositoryResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a repository in a public registry. If the repository contains
  /// images, you must either delete all images in the repository or use the
  /// <code>force</code> option which deletes all images on your behalf before
  /// deleting the repository.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [RepositoryNotEmptyException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to delete.
  ///
  /// Parameter [force] :
  /// If a repository contains images, forces the deletion.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the public registry that contains the
  /// repository to delete. If you do not specify a registry, the default public
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
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.DeleteRepository'
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
  /// The AWS account ID associated with the public registry that contains the
  /// repository policy to delete. If you do not specify a registry, the default
  /// public registry is assumed.
  Future<DeleteRepositoryPolicyResponse> deleteRepositoryPolicy({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.DeleteRepositoryPolicy'
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

  /// Returns the image tag details for a repository in a public registry.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the image tag details to
  /// describe.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results returned by
  /// <code>DescribeImageTags</code> in paginated output. When this parameter is
  /// used, <code>DescribeImageTags</code> only returns <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. The remaining results of the initial request can be seen by
  /// sending another <code>DescribeImageTags</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter is not used, then <code>DescribeImageTags</code> returns up
  /// to 100 results and a <code>nextToken</code> value, if applicable. This
  /// option cannot be used when you specify images with <code>imageIds</code>.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeImageTags</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return. This option cannot be used when you specify
  /// images with <code>imageIds</code>.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the public registry that contains the
  /// repository in which to describe images. If you do not specify a registry,
  /// the default public registry is assumed.
  Future<DescribeImageTagsResponse> describeImageTags({
    @_s.required String repositoryName,
    int maxResults,
    String nextToken,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.DescribeImageTags'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DescribeImageTagsResponse.fromJson(jsonResponse.body);
  }

  /// Returns metadata about the images in a repository in a public registry.
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
  /// The AWS account ID associated with the public registry that contains the
  /// repository in which to describe images. If you do not specify a registry,
  /// the default public registry is assumed.
  Future<DescribeImagesResponse> describeImages({
    @_s.required String repositoryName,
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
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.DescribeImages'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'repositoryName': repositoryName,
        if (imageIds != null) 'imageIds': imageIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return DescribeImagesResponse.fromJson(jsonResponse.body);
  }

  /// Returns details for a public registry.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedCommandException].
  /// May throw [ServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results returned by
  /// <code>DescribeRegistries</code> in paginated output. When this parameter
  /// is used, <code>DescribeRegistries</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeRegistries</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter is not used, then <code>DescribeRegistries</code> returns
  /// up to 100 results and a <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>DescribeRegistries</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. This value is <code>null</code> when there
  /// are no more results to return.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<DescribeRegistriesResponse> describeRegistries({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.DescribeRegistries'
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

    return DescribeRegistriesResponse.fromJson(jsonResponse.body);
  }

  /// Describes repositories in a public registry.
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
  /// default public registry is assumed.
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
      'X-Amz-Target': 'SpencerFrontendService.DescribeRepositories'
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
  /// valid for 12 hours. This API requires the
  /// <code>ecr-public:GetAuthorizationToken</code> and
  /// <code>sts:GetServiceBearerToken</code> permissions.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  Future<GetAuthorizationTokenResponse> getAuthorizationToken() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.GetAuthorizationToken'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetAuthorizationTokenResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves catalog metadata for a public registry.
  ///
  /// May throw [ServerException].
  /// May throw [UnsupportedCommandException].
  Future<GetRegistryCatalogDataResponse> getRegistryCatalogData() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.GetRegistryCatalogData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return GetRegistryCatalogDataResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve catalog metadata for a repository in a public registry. This
  /// metadata is displayed publicly in the Amazon ECR Public Gallery.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to retrieve the catalog metadata for.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry that contains the
  /// repositories to be described. If you do not specify a registry, the
  /// default public registry is assumed.
  Future<GetRepositoryCatalogDataResponse> getRepositoryCatalogData({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.GetRepositoryCatalogData'
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

    return GetRepositoryCatalogDataResponse.fromJson(jsonResponse.body);
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
  /// The AWS account ID associated with the public registry that contains the
  /// repository. If you do not specify a registry, the default public registry
  /// is assumed.
  Future<GetRepositoryPolicyResponse> getRepositoryPolicy({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.GetRepositoryPolicy'
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
  /// May throw [RegistryNotFoundException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to which you intend to upload layers.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the registry to which you intend to
  /// upload layers. If you do not specify a registry, the default public
  /// registry is assumed.
  Future<InitiateLayerUploadResponse> initiateLayerUpload({
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      205,
      isRequired: true,
    );
    _s.validateStringPattern(
      'repositoryName',
      repositoryName,
      r'''(?:[a-z0-9]+(?:[._-][a-z0-9]+)*/)*[a-z0-9]+(?:[._-][a-z0-9]+)*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'registryId',
      registryId,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.InitiateLayerUpload'
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
  /// May throw [RegistryNotFoundException].
  /// May throw [UnsupportedCommandException].
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
  /// The AWS account ID associated with the public registry that contains the
  /// repository in which to put the image. If you do not specify a registry,
  /// the default public registry is assumed.
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
      205,
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
    _s.validateStringLength(
      'registryId',
      registryId,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.PutImage'
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

  /// Create or updates the catalog data for a public registry.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [displayName] :
  /// The display name for a public registry. The display name is shown as the
  /// repository author in the Amazon ECR Public Gallery.
  /// <note>
  /// The registry display name is only publicly visible in the Amazon ECR
  /// Public Gallery for verified accounts.
  /// </note>
  Future<PutRegistryCatalogDataResponse> putRegistryCatalogData({
    String displayName,
  }) async {
    _s.validateStringLength(
      'displayName',
      displayName,
      0,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.PutRegistryCatalogData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (displayName != null) 'displayName': displayName,
      },
    );

    return PutRegistryCatalogDataResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates the catalog data for a repository in a public registry.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  ///
  /// Parameter [catalogData] :
  /// An object containing the catalog data for a repository. This data is
  /// publicly visible in the Amazon ECR Public Gallery.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to create or update the catalog data for.
  ///
  /// Parameter [registryId] :
  /// The AWS account ID associated with the public registry the repository is
  /// in. If you do not specify a registry, the default public registry is
  /// assumed.
  Future<PutRepositoryCatalogDataResponse> putRepositoryCatalogData({
    @_s.required RepositoryCatalogDataInput catalogData,
    @_s.required String repositoryName,
    String registryId,
  }) async {
    ArgumentError.checkNotNull(catalogData, 'catalogData');
    ArgumentError.checkNotNull(repositoryName, 'repositoryName');
    _s.validateStringLength(
      'repositoryName',
      repositoryName,
      2,
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.PutRepositoryCatalogData'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'catalogData': catalogData,
        'repositoryName': repositoryName,
        if (registryId != null) 'registryId': registryId,
      },
    );

    return PutRepositoryCatalogDataResponse.fromJson(jsonResponse.body);
  }

  /// Applies a repository policy to the specified public repository to control
  /// access permissions. For more information, see <a
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
  /// repository. If you do not specify a registry, the default public registry
  /// is assumed.
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
      205,
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
      'X-Amz-Target': 'SpencerFrontendService.SetRepositoryPolicy'
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
  /// May throw [RegistryNotFoundException].
  /// May throw [UnsupportedCommandException].
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
  /// layer parts. If you do not specify a registry, the default public registry
  /// is assumed.
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
      205,
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
    _s.validateStringLength(
      'registryId',
      registryId,
      1,
      256,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.UploadLayerPart'
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

/// An authorization token data object that corresponds to a public registry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AuthorizationData {
  /// A base64-encoded string that contains authorization data for a public Amazon
  /// ECR registry. When the string is decoded, it is presented in the format
  /// <code>user:password</code> for public registry authentication using
  /// <code>docker login</code>.
  @_s.JsonKey(name: 'authorizationToken')
  final String authorizationToken;

  /// The Unix time in seconds and milliseconds when the authorization token
  /// expires. Authorization tokens are valid for 12 hours.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'expiresAt')
  final DateTime expiresAt;

  AuthorizationData({
    this.authorizationToken,
    this.expiresAt,
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
class CompleteLayerUploadResponse {
  /// The <code>sha256</code> digest of the image layer.
  @_s.JsonKey(name: 'layerDigest')
  final String layerDigest;

  /// The public registry ID associated with the request.
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
  @_s.JsonKey(name: 'catalogData')
  final RepositoryCatalogData catalogData;

  /// The repository that was created.
  @_s.JsonKey(name: 'repository')
  final Repository repository;

  CreateRepositoryResponse({
    this.catalogData,
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
class DescribeImageTagsResponse {
  /// The image tag details for the images in the requested repository.
  @_s.JsonKey(name: 'imageTagDetails')
  final List<ImageTagDetail> imageTagDetails;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeImageTags</code> request. When the results of a
  /// <code>DescribeImageTags</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeImageTagsResponse({
    this.imageTagDetails,
    this.nextToken,
  });
  factory DescribeImageTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeImageTagsResponseFromJson(json);
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
class DescribeRegistriesResponse {
  /// An object containing the details for a public registry.
  @_s.JsonKey(name: 'registries')
  final List<Registry> registries;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeRepositories</code> request. When the results of a
  /// <code>DescribeRepositories</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  DescribeRegistriesResponse({
    @_s.required this.registries,
    this.nextToken,
  });
  factory DescribeRegistriesResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRegistriesResponseFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAuthorizationTokenResponse {
  /// An authorization token data object that corresponds to a public registry.
  @_s.JsonKey(name: 'authorizationData')
  final AuthorizationData authorizationData;

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
class GetRegistryCatalogDataResponse {
  /// The catalog metadata for the public registry.
  @_s.JsonKey(name: 'registryCatalogData')
  final RegistryCatalogData registryCatalogData;

  GetRegistryCatalogDataResponse({
    @_s.required this.registryCatalogData,
  });
  factory GetRegistryCatalogDataResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRegistryCatalogDataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRepositoryCatalogDataResponse {
  /// The catalog metadata for the repository.
  @_s.JsonKey(name: 'catalogData')
  final RepositoryCatalogData catalogData;

  GetRepositoryCatalogDataResponse({
    this.catalogData,
  });
  factory GetRepositoryCatalogDataResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetRepositoryCatalogDataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRepositoryPolicyResponse {
  /// The repository policy text associated with the repository. The policy text
  /// will be in JSON format.
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

  /// The AWS account ID associated with the public registry to which this image
  /// belongs.
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

/// An object representing the image tag details for an image.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImageTagDetail {
  /// The time stamp indicating when the image tag was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// An object that describes the details of an image.
  @_s.JsonKey(name: 'imageDetail')
  final ReferencedImageDetail imageDetail;

  /// The tag associated with the image.
  @_s.JsonKey(name: 'imageTag')
  final String imageTag;

  ImageTagDetail({
    this.createdAt,
    this.imageDetail,
    this.imageTag,
  });
  factory ImageTagDetail.fromJson(Map<String, dynamic> json) =>
      _$ImageTagDetailFromJson(json);
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
class PutRegistryCatalogDataResponse {
  /// The catalog data for the public registry.
  @_s.JsonKey(name: 'registryCatalogData')
  final RegistryCatalogData registryCatalogData;

  PutRegistryCatalogDataResponse({
    @_s.required this.registryCatalogData,
  });
  factory PutRegistryCatalogDataResponse.fromJson(Map<String, dynamic> json) =>
      _$PutRegistryCatalogDataResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutRepositoryCatalogDataResponse {
  /// The catalog data for the repository.
  @_s.JsonKey(name: 'catalogData')
  final RepositoryCatalogData catalogData;

  PutRepositoryCatalogDataResponse({
    this.catalogData,
  });
  factory PutRepositoryCatalogDataResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutRepositoryCatalogDataResponseFromJson(json);
}

/// An object that describes the image tag details returned by a
/// <a>DescribeImageTags</a> action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReferencedImageDetail {
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
  /// the current image tag was pushed to the repository.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'imagePushedAt')
  final DateTime imagePushedAt;

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

  ReferencedImageDetail({
    this.artifactMediaType,
    this.imageDigest,
    this.imageManifestMediaType,
    this.imagePushedAt,
    this.imageSizeInBytes,
  });
  factory ReferencedImageDetail.fromJson(Map<String, dynamic> json) =>
      _$ReferencedImageDetailFromJson(json);
}

/// The details of a public registry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Registry {
  /// An array of objects representing the aliases for a public registry.
  @_s.JsonKey(name: 'aliases')
  final List<RegistryAlias> aliases;

  /// The Amazon Resource Name (ARN) of the public registry.
  @_s.JsonKey(name: 'registryArn')
  final String registryArn;

  /// The AWS account ID associated with the registry. If you do not specify a
  /// registry, the default public registry is assumed.
  @_s.JsonKey(name: 'registryId')
  final String registryId;

  /// The URI of a public registry. The URI contains a universal prefix and the
  /// registry alias.
  @_s.JsonKey(name: 'registryUri')
  final String registryUri;

  /// Whether the account is verified. This indicates whether the account is an
  /// AWS Marketplace vendor. If an account is verified, each public repository
  /// will received a verified account badge on the Amazon ECR Public Gallery.
  @_s.JsonKey(name: 'verified')
  final bool verified;

  Registry({
    @_s.required this.aliases,
    @_s.required this.registryArn,
    @_s.required this.registryId,
    @_s.required this.registryUri,
    @_s.required this.verified,
  });
  factory Registry.fromJson(Map<String, dynamic> json) =>
      _$RegistryFromJson(json);
}

/// An object representing the aliases for a public registry. A public registry
/// is given an alias upon creation but a custom alias can be set using the
/// Amazon ECR console. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html">Registries</a>
/// in the <i>Amazon Elastic Container Registry User Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegistryAlias {
  /// Whether or not the registry alias is the default alias for the registry.
  /// When the first public repository is created, your public registry is
  /// assigned a default registry alias.
  @_s.JsonKey(name: 'defaultRegistryAlias')
  final bool defaultRegistryAlias;

  /// The name of the registry alias.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Whether or not the registry alias is the primary alias for the registry. If
  /// true, the alias is the primary registry alias and is displayed in both the
  /// repository URL and the image URI used in the <code>docker pull</code>
  /// commands on the Amazon ECR Public Gallery.
  /// <note>
  /// A registry alias that is not the primary registry alias can be used in the
  /// repository URI in a <code>docker pull</code> command.
  /// </note>
  @_s.JsonKey(name: 'primaryRegistryAlias')
  final bool primaryRegistryAlias;

  /// The status of the registry alias.
  @_s.JsonKey(name: 'status')
  final RegistryAliasStatus status;

  RegistryAlias({
    @_s.required this.defaultRegistryAlias,
    @_s.required this.name,
    @_s.required this.primaryRegistryAlias,
    @_s.required this.status,
  });
  factory RegistryAlias.fromJson(Map<String, dynamic> json) =>
      _$RegistryAliasFromJson(json);
}

enum RegistryAliasStatus {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('REJECTED')
  rejected,
}

/// The metadata for a public registry.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegistryCatalogData {
  /// The display name for a public registry. This appears on the Amazon ECR
  /// Public Gallery.
  /// <important>
  /// Only accounts that have the verified account badge can have a registry
  /// display name.
  /// </important>
  @_s.JsonKey(name: 'displayName')
  final String displayName;

  RegistryCatalogData({
    this.displayName,
  });
  factory RegistryCatalogData.fromJson(Map<String, dynamic> json) =>
      _$RegistryCatalogDataFromJson(json);
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

  /// The AWS account ID associated with the public registry that contains the
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
    this.registryId,
    this.repositoryArn,
    this.repositoryName,
    this.repositoryUri,
  });
  factory Repository.fromJson(Map<String, dynamic> json) =>
      _$RepositoryFromJson(json);
}

/// The catalog data for a repository. This data is publicly visible in the
/// Amazon ECR Public Gallery.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RepositoryCatalogData {
  /// The longform description of the contents of the repository. This text
  /// appears in the repository details on the Amazon ECR Public Gallery.
  @_s.JsonKey(name: 'aboutText')
  final String aboutText;

  /// The architecture tags that are associated with the repository.
  /// <note>
  /// Only supported operating system tags appear publicly in the Amazon ECR
  /// Public Gallery. For more information, see <a>RepositoryCatalogDataInput</a>.
  /// </note>
  @_s.JsonKey(name: 'architectures')
  final List<String> architectures;

  /// The short description of the repository.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The URL containing the logo associated with the repository.
  @_s.JsonKey(name: 'logoUrl')
  final String logoUrl;

  /// Whether or not the repository is certified by AWS Marketplace.
  @_s.JsonKey(name: 'marketplaceCertified')
  final bool marketplaceCertified;

  /// The operating system tags that are associated with the repository.
  /// <note>
  /// Only supported operating system tags appear publicly in the Amazon ECR
  /// Public Gallery. For more information, see <a>RepositoryCatalogDataInput</a>.
  /// </note>
  @_s.JsonKey(name: 'operatingSystems')
  final List<String> operatingSystems;

  /// The longform usage details of the contents of the repository. The usage text
  /// provides context for users of the repository.
  @_s.JsonKey(name: 'usageText')
  final String usageText;

  RepositoryCatalogData({
    this.aboutText,
    this.architectures,
    this.description,
    this.logoUrl,
    this.marketplaceCertified,
    this.operatingSystems,
    this.usageText,
  });
  factory RepositoryCatalogData.fromJson(Map<String, dynamic> json) =>
      _$RepositoryCatalogDataFromJson(json);
}

/// An object containing the catalog data for a repository. This data is
/// publicly visible in the Amazon ECR Public Gallery.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RepositoryCatalogDataInput {
  /// A detailed description of the contents of the repository. It is publicly
  /// visible in the Amazon ECR Public Gallery. The text must be in markdown
  /// format.
  @_s.JsonKey(name: 'aboutText')
  final String aboutText;

  /// The system architecture that the images in the repository are compatible
  /// with. On the Amazon ECR Public Gallery, the following supported
  /// architectures will appear as badges on the repository and are used as search
  /// filters.
  ///
  /// <ul>
  /// <li>
  /// <code>Linux</code>
  /// </li>
  /// <li>
  /// <code>Windows</code>
  /// </li>
  /// </ul> <note>
  /// If an unsupported tag is added to your repository catalog data, it will be
  /// associated with the repository and can be retrieved using the API but will
  /// not be discoverable in the Amazon ECR Public Gallery.
  /// </note>
  @_s.JsonKey(name: 'architectures')
  final List<String> architectures;

  /// A short description of the contents of the repository. This text appears in
  /// both the image details and also when searching for repositories on the
  /// Amazon ECR Public Gallery.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The base64-encoded repository logo payload.
  /// <note>
  /// The repository logo is only publicly visible in the Amazon ECR Public
  /// Gallery for verified accounts.
  /// </note>
  @Uint8ListConverter()
  @_s.JsonKey(name: 'logoImageBlob')
  final Uint8List logoImageBlob;

  /// The operating systems that the images in the repository are compatible with.
  /// On the Amazon ECR Public Gallery, the following supported operating systems
  /// will appear as badges on the repository and are used as search filters.
  ///
  /// <ul>
  /// <li>
  /// <code>ARM</code>
  /// </li>
  /// <li>
  /// <code>ARM 64</code>
  /// </li>
  /// <li>
  /// <code>x86</code>
  /// </li>
  /// <li>
  /// <code>x86-64</code>
  /// </li>
  /// </ul> <note>
  /// If an unsupported tag is added to your repository catalog data, it will be
  /// associated with the repository and can be retrieved using the API but will
  /// not be discoverable in the Amazon ECR Public Gallery.
  /// </note>
  @_s.JsonKey(name: 'operatingSystems')
  final List<String> operatingSystems;

  /// Detailed information on how to use the contents of the repository. It is
  /// publicly visible in the Amazon ECR Public Gallery. The usage text provides
  /// context, support information, and additional usage details for users of the
  /// repository. The text must be in markdown format.
  @_s.JsonKey(name: 'usageText')
  final String usageText;

  RepositoryCatalogDataInput({
    this.aboutText,
    this.architectures,
    this.description,
    this.logoImageBlob,
    this.operatingSystems,
    this.usageText,
  });
  Map<String, dynamic> toJson() => _$RepositoryCatalogDataInputToJson(this);
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

class LayerAlreadyExistsException extends _s.GenericAwsException {
  LayerAlreadyExistsException({String type, String message})
      : super(
            type: type, code: 'LayerAlreadyExistsException', message: message);
}

class LayerPartTooSmallException extends _s.GenericAwsException {
  LayerPartTooSmallException({String type, String message})
      : super(type: type, code: 'LayerPartTooSmallException', message: message);
}

class LayersNotFoundException extends _s.GenericAwsException {
  LayersNotFoundException({String type, String message})
      : super(type: type, code: 'LayersNotFoundException', message: message);
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

class RegistryNotFoundException extends _s.GenericAwsException {
  RegistryNotFoundException({String type, String message})
      : super(type: type, code: 'RegistryNotFoundException', message: message);
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

class ServerException extends _s.GenericAwsException {
  ServerException({String type, String message})
      : super(type: type, code: 'ServerException', message: message);
}

class UnsupportedCommandException extends _s.GenericAwsException {
  UnsupportedCommandException({String type, String message})
      : super(
            type: type, code: 'UnsupportedCommandException', message: message);
}

class UploadNotFoundException extends _s.GenericAwsException {
  UploadNotFoundException({String type, String message})
      : super(type: type, code: 'UploadNotFoundException', message: message);
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
  'LayerAlreadyExistsException': (type, message) =>
      LayerAlreadyExistsException(type: type, message: message),
  'LayerPartTooSmallException': (type, message) =>
      LayerPartTooSmallException(type: type, message: message),
  'LayersNotFoundException': (type, message) =>
      LayersNotFoundException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ReferencedImagesNotFoundException': (type, message) =>
      ReferencedImagesNotFoundException(type: type, message: message),
  'RegistryNotFoundException': (type, message) =>
      RegistryNotFoundException(type: type, message: message),
  'RepositoryAlreadyExistsException': (type, message) =>
      RepositoryAlreadyExistsException(type: type, message: message),
  'RepositoryNotEmptyException': (type, message) =>
      RepositoryNotEmptyException(type: type, message: message),
  'RepositoryNotFoundException': (type, message) =>
      RepositoryNotFoundException(type: type, message: message),
  'RepositoryPolicyNotFoundException': (type, message) =>
      RepositoryPolicyNotFoundException(type: type, message: message),
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
  'UnsupportedCommandException': (type, message) =>
      UnsupportedCommandException(type: type, message: message),
  'UploadNotFoundException': (type, message) =>
      UploadNotFoundException(type: type, message: message),
};
