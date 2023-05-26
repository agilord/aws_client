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

/// Amazon Elastic Container Registry Public (Amazon ECR Public) is a managed
/// container image registry service. Amazon ECR provides both public and
/// private registries to host your container images. You can use the Docker CLI
/// or your preferred client to push, pull, and manage images. Amazon ECR
/// provides a secure, scalable, and reliable registry for your Docker or Open
/// Container Initiative (OCI) images. Amazon ECR supports public repositories
/// with this API. For information about the Amazon ECR API for private
/// repositories, see <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/APIReference/Welcome.html">Amazon
/// Elastic Container Registry API Reference</a>.
class EcrPublic {
  final _s.JsonProtocol _protocol;
  EcrPublic({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.ecr-public',
            signingName: 'ecr-public',
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

  /// Checks the availability of one or more image layers that are within a
  /// repository in a public registry. When an image is pushed to a repository,
  /// each image layer is checked to verify if it has been uploaded before. If
  /// it has been uploaded, then the image layer is skipped.
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
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [layerDigests] :
  /// The digests of the image layers to check.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that's associated with the image layers to
  /// check.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID, or registry alias, associated with the
  /// public registry that contains the image layers to check. If you do not
  /// specify a registry, the default public registry is assumed.
  Future<BatchCheckLayerAvailabilityResponse> batchCheckLayerAvailability({
    required List<String> layerDigests,
    required String repositoryName,
    String? registryId,
  }) async {
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

  /// Deletes a list of specified images that are within a repository in a
  /// public registry. Images are specified with either an <code>imageTag</code>
  /// or <code>imageDigest</code>.
  ///
  /// You can remove a tag from an image by specifying the image's tag in your
  /// request. When you remove the last tag from an image, the image is deleted
  /// from your repository.
  ///
  /// You can completely delete an image (and all of its tags) by specifying the
  /// digest of the image in your request.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [UnsupportedCommandException].
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
  /// The Amazon Web Services account ID, or registry alias, that's associated
  /// with the registry that contains the image to delete. If you do not specify
  /// a registry, the default public registry is assumed.
  Future<BatchDeleteImageResponse> batchDeleteImage({
    required List<ImageIdentifier> imageIds,
    required String repositoryName,
    String? registryId,
  }) async {
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

  /// Informs Amazon ECR that the image layer upload is complete for a specified
  /// public registry, repository name, and upload ID. You can optionally
  /// provide a <code>sha256</code> digest of the image layer for data
  /// validation purposes.
  ///
  /// When an image is pushed, the CompleteLayerUpload API is called once for
  /// each new image layer to verify that the upload is complete.
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
  /// The Amazon Web Services account ID, or registry alias, associated with the
  /// registry where layers are uploaded. If you do not specify a registry, the
  /// default public registry is assumed.
  Future<CompleteLayerUploadResponse> completeLayerUpload({
    required List<String> layerDigests,
    required String repositoryName,
    required String uploadId,
    String? registryId,
  }) async {
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
  /// May throw [InvalidTagParameterException].
  /// May throw [TooManyTagsException].
  /// May throw [RepositoryAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [repositoryName] :
  /// The name to use for the repository. This appears publicly in the Amazon
  /// ECR Public Gallery. The repository name can be specified on its own (for
  /// example <code>nginx-web-app</code>) or prepended with a namespace to group
  /// the repository into a category (for example
  /// <code>project-a/nginx-web-app</code>).
  ///
  /// Parameter [catalogData] :
  /// The details about the repository that are publicly visible in the Amazon
  /// ECR Public Gallery.
  ///
  /// Parameter [tags] :
  /// The metadata that you apply to each repository to help categorize and
  /// organize your repositories. Each tag consists of a key and an optional
  /// value. You define both of them. Tag keys can have a maximum character
  /// length of 128 characters, and tag values can have a maximum length of 256
  /// characters.
  Future<CreateRepositoryResponse> createRepository({
    required String repositoryName,
    RepositoryCatalogDataInput? catalogData,
    List<Tag>? tags,
  }) async {
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
        if (tags != null) 'tags': tags,
      },
    );

    return CreateRepositoryResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a repository in a public registry. If the repository contains
  /// images, you must either manually delete all images in the repository or
  /// use the <code>force</code> option. This option deletes all images on your
  /// behalf before deleting the repository.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [RepositoryNotEmptyException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to delete.
  ///
  /// Parameter [force] :
  /// The force option can be used to delete a repository that contains images.
  /// If the force option is not used, the repository must be empty prior to
  /// deletion.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the public
  /// registry that contains the repository to delete. If you do not specify a
  /// registry, the default public registry is assumed.
  Future<DeleteRepositoryResponse> deleteRepository({
    required String repositoryName,
    bool? force,
    String? registryId,
  }) async {
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

  /// Deletes the repository policy that's associated with the specified
  /// repository.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [RepositoryPolicyNotFoundException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that's associated with the repository policy to
  /// delete.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the public
  /// registry that contains the repository policy to delete. If you do not
  /// specify a registry, the default public registry is assumed.
  Future<DeleteRepositoryPolicyResponse> deleteRepositoryPolicy({
    required String repositoryName,
    String? registryId,
  }) async {
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
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository that contains the image tag details to
  /// describe.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results that's returned by
  /// <code>DescribeImageTags</code> in paginated output. When this parameter is
  /// used, <code>DescribeImageTags</code> only returns <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. You can see the remaining results of the initial request by
  /// sending another <code>DescribeImageTags</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter isn't used, then <code>DescribeImageTags</code> returns up
  /// to 100 results and a <code>nextToken</code> value, if applicable. If you
  /// specify images with <code>imageIds</code>, you can't use this option.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value that's returned from a previous paginated
  /// <code>DescribeImageTags</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. If there are no more results to return, this
  /// value is <code>null</code>. If you specify images with
  /// <code>imageIds</code>, you can't use this option.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the public
  /// registry that contains the repository where images are described. If you
  /// do not specify a registry, the default public registry is assumed.
  Future<DescribeImageTagsResponse> describeImageTags({
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

  /// Returns metadata that's related to the images in a repository in a public
  /// registry.
  /// <note>
  /// Beginning with Docker version 1.9, the Docker client compresses image
  /// layers before pushing them to a V2 Docker registry. The output of the
  /// <code>docker images</code> command shows the uncompressed image size.
  /// Therefore, it might return a larger image size than the image sizes that
  /// are returned by <a>DescribeImages</a>.
  /// </note>
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [ImageNotFoundException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [repositoryName] :
  /// The repository that contains the images to describe.
  ///
  /// Parameter [imageIds] :
  /// The list of image IDs for the requested repository.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results that's returned by
  /// <code>DescribeImages</code> in paginated output. When this parameter is
  /// used, <code>DescribeImages</code> only returns <code>maxResults</code>
  /// results in a single page along with a <code>nextToken</code> response
  /// element. You can see the remaining results of the initial request by
  /// sending another <code>DescribeImages</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter isn't used, then <code>DescribeImages</code> returns up to
  /// 100 results and a <code>nextToken</code> value, if applicable. If you
  /// specify images with <code>imageIds</code>, you can't use this option.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value that's returned from a previous paginated
  /// <code>DescribeImages</code> request where <code>maxResults</code> was used
  /// and the results exceeded the value of that parameter. Pagination continues
  /// from the end of the previous results that returned the
  /// <code>nextToken</code> value. If there are no more results to return, this
  /// value is <code>null</code>. If you specify images with
  /// <code>imageIds</code>, you can't use this option.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the public
  /// registry that contains the repository where images are described. If you
  /// do not specify a registry, the default public registry is assumed.
  Future<DescribeImagesResponse> describeImages({
    required String repositoryName,
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
  /// The maximum number of repository results that's returned by
  /// <code>DescribeRegistries</code> in paginated output. When this parameter
  /// is used, <code>DescribeRegistries</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>DescribeRegistries</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter isn't used, then <code>DescribeRegistries</code> returns up
  /// to 100 results and a <code>nextToken</code> value, if applicable.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value that's returned from a previous paginated
  /// <code>DescribeRegistries</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. If there are no more results to return, this
  /// value is <code>null</code>.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<DescribeRegistriesResponse> describeRegistries({
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

  /// Describes repositories that are in a public registry.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of repository results that's returned by
  /// <code>DescribeRepositories</code> in paginated output. When this parameter
  /// is used, <code>DescribeRepositories</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. You can see the remaining results
  /// of the initial request by sending another
  /// <code>DescribeRepositories</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter isn't used, then <code>DescribeRepositories</code> returns
  /// up to 100 results and a <code>nextToken</code> value, if applicable. If
  /// you specify repositories with <code>repositoryNames</code>, you can't use
  /// this option.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value that's returned from a previous paginated
  /// <code>DescribeRepositories</code> request where <code>maxResults</code>
  /// was used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value. If there are no more results to return, this
  /// value is <code>null</code>. If you specify repositories with
  /// <code>repositoryNames</code>, you can't use this option.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the registry
  /// that contains the repositories to be described. If you do not specify a
  /// registry, the default public registry is assumed.
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
  /// IAM authentication credentials. You can use it to access any Amazon ECR
  /// registry that your IAM principal has access to. The authorization token is
  /// valid for 12 hours. This API requires the
  /// <code>ecr-public:GetAuthorizationToken</code> and
  /// <code>sts:GetServiceBearerToken</code> permissions.
  ///
  /// May throw [ServerException].
  /// May throw [InvalidParameterException].
  /// May throw [UnsupportedCommandException].
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
  /// May throw [RepositoryCatalogDataNotFoundException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to retrieve the catalog metadata for.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the registry
  /// that contains the repositories to be described. If you do not specify a
  /// registry, the default public registry is assumed.
  Future<GetRepositoryCatalogDataResponse> getRepositoryCatalogData({
    required String repositoryName,
    String? registryId,
  }) async {
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
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository with the policy to retrieve.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the public
  /// registry that contains the repository. If you do not specify a registry,
  /// the default public registry is assumed.
  Future<GetRepositoryPolicyResponse> getRepositoryPolicy({
    required String repositoryName,
    String? registryId,
  }) async {
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
  /// When an image is pushed, the InitiateLayerUpload API is called once for
  /// each image layer that hasn't already been uploaded. Whether an image layer
  /// uploads is determined by the BatchCheckLayerAvailability API action.
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
  /// The name of the repository that you want to upload layers to.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID, or registry alias, that's associated
  /// with the registry to which you intend to upload layers. If you do not
  /// specify a registry, the default public registry is assumed.
  Future<InitiateLayerUploadResponse> initiateLayerUpload({
    required String repositoryName,
    String? registryId,
  }) async {
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

  /// List the tags for an Amazon ECR Public resource.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [UnsupportedCommandException].
  /// May throw [ServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list the
  /// tags for. Currently, the supported resource is an Amazon ECR Public
  /// repository.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.ListTagsForResource'
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

  /// Creates or updates the image manifest and tags that are associated with an
  /// image.
  ///
  /// When an image is pushed and all new image layers have been uploaded, the
  /// PutImage API is called once to create or update the image manifest and the
  /// tags that are associated with the image.
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
  /// The image manifest that corresponds to the image to be uploaded.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository where the image is put.
  ///
  /// Parameter [imageDigest] :
  /// The image digest of the image manifest that corresponds to the image.
  ///
  /// Parameter [imageManifestMediaType] :
  /// The media type of the image manifest. If you push an image manifest that
  /// doesn't contain the <code>mediaType</code> field, you must specify the
  /// <code>imageManifestMediaType</code> in the request.
  ///
  /// Parameter [imageTag] :
  /// The tag to associate with the image. This parameter is required for images
  /// that use the Docker Image Manifest V2 Schema 2 or Open Container
  /// Initiative (OCI) formats.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID, or registry alias, that's associated
  /// with the public registry that contains the repository where the image is
  /// put. If you do not specify a registry, the default public registry is
  /// assumed.
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

  /// Create or update the catalog data for a public registry.
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
    String? displayName,
  }) async {
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
  /// May throw [UnsupportedCommandException].
  ///
  /// Parameter [catalogData] :
  /// An object containing the catalog data for a repository. This data is
  /// publicly visible in the Amazon ECR Public Gallery.
  ///
  /// Parameter [repositoryName] :
  /// The name of the repository to create or update the catalog data for.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the public
  /// registry the repository is in. If you do not specify a registry, the
  /// default public registry is assumed.
  Future<PutRepositoryCatalogDataResponse> putRepositoryCatalogData({
    required RepositoryCatalogDataInput catalogData,
    required String repositoryName,
    String? registryId,
  }) async {
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
  /// May throw [UnsupportedCommandException].
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
  /// If the policy that you want to set on a repository policy would prevent
  /// you from setting another policy in the future, you must force the
  /// <a>SetRepositoryPolicy</a> operation. This prevents accidental repository
  /// lockouts.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID that's associated with the registry
  /// that contains the repository. If you do not specify a registry, the
  /// default public registry is assumed.
  Future<SetRepositoryPolicyResponse> setRepositoryPolicy({
    required String policyText,
    required String repositoryName,
    bool? force,
    String? registryId,
  }) async {
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

  /// Associates the specified tags to a resource with the specified
  /// <code>resourceArn</code>. If existing tags on a resource aren't specified
  /// in the request parameters, they aren't changed. When a resource is
  /// deleted, the tags associated with that resource are also deleted.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidTagParameterException].
  /// May throw [TooManyTagsException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [UnsupportedCommandException].
  /// May throw [ServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to add tags to. Currently,
  /// the supported resource is an Amazon ECR Public repository.
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
      'X-Amz-Target': 'SpencerFrontendService.TagResource'
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
  /// May throw [TooManyTagsException].
  /// May throw [RepositoryNotFoundException].
  /// May throw [UnsupportedCommandException].
  /// May throw [ServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to delete tags from.
  /// Currently, the supported resource is an Amazon ECR Public repository.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'SpencerFrontendService.UntagResource'
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

  /// Uploads an image layer part to Amazon ECR.
  ///
  /// When an image is pushed, each new image layer is uploaded in parts. The
  /// maximum size of each image layer part can be 20971520 bytes (about 20MB).
  /// The UploadLayerPart API is called once for each new image layer part.
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
  /// The name of the repository that you're uploading layer parts to.
  ///
  /// Parameter [uploadId] :
  /// The upload ID from a previous <a>InitiateLayerUpload</a> operation to
  /// associate with the layer part upload.
  ///
  /// Parameter [registryId] :
  /// The Amazon Web Services account ID, or registry alias, that's associated
  /// with the registry that you're uploading layer parts to. If you do not
  /// specify a registry, the default public registry is assumed.
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
      'X-Amz-Target': 'SpencerFrontendService.UploadLayerPart'
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
}

/// An authorization token data object that corresponds to a public registry.
class AuthorizationData {
  /// A base64-encoded string that contains authorization data for a public Amazon
  /// ECR registry. When the string is decoded, it's presented in the format
  /// <code>user:password</code> for public registry authentication using
  /// <code>docker login</code>.
  final String? authorizationToken;

  /// The Unix time in seconds and milliseconds when the authorization token
  /// expires. Authorization tokens are valid for 12 hours.
  final DateTime? expiresAt;

  AuthorizationData({
    this.authorizationToken,
    this.expiresAt,
  });

  factory AuthorizationData.fromJson(Map<String, dynamic> json) {
    return AuthorizationData(
      authorizationToken: json['authorizationToken'] as String?,
      expiresAt: timeStampFromJson(json['expiresAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationToken = this.authorizationToken;
    final expiresAt = this.expiresAt;
    return {
      if (authorizationToken != null) 'authorizationToken': authorizationToken,
      if (expiresAt != null) 'expiresAt': unixTimestampToJson(expiresAt),
    };
  }
}

class BatchCheckLayerAvailabilityResponse {
  /// Any failures associated with the call.
  final List<LayerFailure>? failures;

  /// A list of image layer objects that correspond to the image layer references
  /// in the request.
  final List<Layer>? layers;

  BatchCheckLayerAvailabilityResponse({
    this.failures,
    this.layers,
  });

  factory BatchCheckLayerAvailabilityResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCheckLayerAvailabilityResponse(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => LayerFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
      layers: (json['layers'] as List?)
          ?.whereNotNull()
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
          ?.whereNotNull()
          .map((e) => ImageFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
      imageIds: (json['imageIds'] as List?)
          ?.whereNotNull()
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

class CompleteLayerUploadResponse {
  /// The <code>sha256</code> digest of the image layer.
  final String? layerDigest;

  /// The public registry ID that's associated with the request.
  final String? registryId;

  /// The repository name that's associated with the request.
  final String? repositoryName;

  /// The upload ID that's associated with the layer.
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

class CreateRepositoryResponse {
  final RepositoryCatalogData? catalogData;

  /// The repository that was created.
  final Repository? repository;

  CreateRepositoryResponse({
    this.catalogData,
    this.repository,
  });

  factory CreateRepositoryResponse.fromJson(Map<String, dynamic> json) {
    return CreateRepositoryResponse(
      catalogData: json['catalogData'] != null
          ? RepositoryCatalogData.fromJson(
              json['catalogData'] as Map<String, dynamic>)
          : null,
      repository: json['repository'] != null
          ? Repository.fromJson(json['repository'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogData = this.catalogData;
    final repository = this.repository;
    return {
      if (catalogData != null) 'catalogData': catalogData,
      if (repository != null) 'repository': repository,
    };
  }
}

class DeleteRepositoryPolicyResponse {
  /// The JSON repository policy that was deleted from the repository.
  final String? policyText;

  /// The registry ID that's associated with the request.
  final String? registryId;

  /// The repository name that's associated with the request.
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

class DescribeImageTagsResponse {
  /// The image tag details for the images in the requested repository.
  final List<ImageTagDetail>? imageTagDetails;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeImageTags</code> request. When the results of a
  /// <code>DescribeImageTags</code> request exceed <code>maxResults</code>, you
  /// can use this value to retrieve the next page of results. If there are no
  /// more results to return, this value is <code>null</code>.
  final String? nextToken;

  DescribeImageTagsResponse({
    this.imageTagDetails,
    this.nextToken,
  });

  factory DescribeImageTagsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeImageTagsResponse(
      imageTagDetails: (json['imageTagDetails'] as List?)
          ?.whereNotNull()
          .map((e) => ImageTagDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageTagDetails = this.imageTagDetails;
    final nextToken = this.nextToken;
    return {
      if (imageTagDetails != null) 'imageTagDetails': imageTagDetails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeImagesResponse {
  /// A list of <a>ImageDetail</a> objects that contain data about the image.
  final List<ImageDetail>? imageDetails;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeImages</code> request. When the results of a
  /// <code>DescribeImages</code> request exceed <code>maxResults</code>, you can
  /// use this value to retrieve the next page of results. If there are no more
  /// results to return, this value is <code>null</code>.
  final String? nextToken;

  DescribeImagesResponse({
    this.imageDetails,
    this.nextToken,
  });

  factory DescribeImagesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeImagesResponse(
      imageDetails: (json['imageDetails'] as List?)
          ?.whereNotNull()
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

class DescribeRegistriesResponse {
  /// An object that contains the details for a public registry.
  final List<Registry> registries;

  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeRepositories</code> request. If the results of a
  /// <code>DescribeRepositories</code> request exceed <code>maxResults</code>,
  /// you can use this value to retrieve the next page of results. If there are no
  /// more results, this value is <code>null</code>.
  final String? nextToken;

  DescribeRegistriesResponse({
    required this.registries,
    this.nextToken,
  });

  factory DescribeRegistriesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRegistriesResponse(
      registries: (json['registries'] as List)
          .whereNotNull()
          .map((e) => Registry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final registries = this.registries;
    final nextToken = this.nextToken;
    return {
      'registries': registries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeRepositoriesResponse {
  /// The <code>nextToken</code> value to include in a future
  /// <code>DescribeRepositories</code> request. When the results of a
  /// <code>DescribeRepositories</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. If there are no
  /// more results to return, this value is <code>null</code>.
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
          ?.whereNotNull()
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

class GetAuthorizationTokenResponse {
  /// An authorization token data object that corresponds to a public registry.
  final AuthorizationData? authorizationData;

  GetAuthorizationTokenResponse({
    this.authorizationData,
  });

  factory GetAuthorizationTokenResponse.fromJson(Map<String, dynamic> json) {
    return GetAuthorizationTokenResponse(
      authorizationData: json['authorizationData'] != null
          ? AuthorizationData.fromJson(
              json['authorizationData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationData = this.authorizationData;
    return {
      if (authorizationData != null) 'authorizationData': authorizationData,
    };
  }
}

class GetRegistryCatalogDataResponse {
  /// The catalog metadata for the public registry.
  final RegistryCatalogData registryCatalogData;

  GetRegistryCatalogDataResponse({
    required this.registryCatalogData,
  });

  factory GetRegistryCatalogDataResponse.fromJson(Map<String, dynamic> json) {
    return GetRegistryCatalogDataResponse(
      registryCatalogData: RegistryCatalogData.fromJson(
          json['registryCatalogData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final registryCatalogData = this.registryCatalogData;
    return {
      'registryCatalogData': registryCatalogData,
    };
  }
}

class GetRepositoryCatalogDataResponse {
  /// The catalog metadata for the repository.
  final RepositoryCatalogData? catalogData;

  GetRepositoryCatalogDataResponse({
    this.catalogData,
  });

  factory GetRepositoryCatalogDataResponse.fromJson(Map<String, dynamic> json) {
    return GetRepositoryCatalogDataResponse(
      catalogData: json['catalogData'] != null
          ? RepositoryCatalogData.fromJson(
              json['catalogData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogData = this.catalogData;
    return {
      if (catalogData != null) 'catalogData': catalogData,
    };
  }
}

class GetRepositoryPolicyResponse {
  /// The repository policy text that's associated with the repository. The policy
  /// text will be in JSON format.
  final String? policyText;

  /// The registry ID that's associated with the request.
  final String? registryId;

  /// The repository name that's associated with the request.
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

/// An object that represents an Amazon ECR image.
class Image {
  /// An object that contains the image tag and image digest associated with an
  /// image.
  final ImageIdentifier? imageId;

  /// The image manifest that's associated with the image.
  final String? imageManifest;

  /// The manifest media type of the image.
  final String? imageManifestMediaType;

  /// The Amazon Web Services account ID that's associated with the registry
  /// containing the image.
  final String? registryId;

  /// The name of the repository that's associated with the image.
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

/// An object that describes an image that's returned by a <a>DescribeImages</a>
/// operation.
class ImageDetail {
  /// The artifact media type of the image.
  final String? artifactMediaType;

  /// The <code>sha256</code> digest of the image manifest.
  final String? imageDigest;

  /// The media type of the image manifest.
  final String? imageManifestMediaType;

  /// The date and time, expressed in standard JavaScript date format, that the
  /// current image was pushed to the repository at.
  final DateTime? imagePushedAt;

  /// The size, in bytes, of the image in the repository.
  ///
  /// If the image is a manifest list, this is the max size of all manifests in
  /// the list.
  /// <note>
  /// Beginning with Docker version 1.9, the Docker client compresses image layers
  /// before pushing them to a V2 Docker registry. The output of the <code>docker
  /// images</code> command shows the uncompressed image size, so it might return
  /// a larger image size than the image sizes that are returned by
  /// <a>DescribeImages</a>.
  /// </note>
  final int? imageSizeInBytes;

  /// The list of tags that's associated with this image.
  final List<String>? imageTags;

  /// The Amazon Web Services account ID that's associated with the public
  /// registry where this image belongs.
  final String? registryId;

  /// The name of the repository where this image belongs.
  final String? repositoryName;

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

  factory ImageDetail.fromJson(Map<String, dynamic> json) {
    return ImageDetail(
      artifactMediaType: json['artifactMediaType'] as String?,
      imageDigest: json['imageDigest'] as String?,
      imageManifestMediaType: json['imageManifestMediaType'] as String?,
      imagePushedAt: timeStampFromJson(json['imagePushedAt']),
      imageSizeInBytes: json['imageSizeInBytes'] as int?,
      imageTags: (json['imageTags'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      registryId: json['registryId'] as String?,
      repositoryName: json['repositoryName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactMediaType = this.artifactMediaType;
    final imageDigest = this.imageDigest;
    final imageManifestMediaType = this.imageManifestMediaType;
    final imagePushedAt = this.imagePushedAt;
    final imageSizeInBytes = this.imageSizeInBytes;
    final imageTags = this.imageTags;
    final registryId = this.registryId;
    final repositoryName = this.repositoryName;
    return {
      if (artifactMediaType != null) 'artifactMediaType': artifactMediaType,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (imageManifestMediaType != null)
        'imageManifestMediaType': imageManifestMediaType,
      if (imagePushedAt != null)
        'imagePushedAt': unixTimestampToJson(imagePushedAt),
      if (imageSizeInBytes != null) 'imageSizeInBytes': imageSizeInBytes,
      if (imageTags != null) 'imageTags': imageTags,
      if (registryId != null) 'registryId': registryId,
      if (repositoryName != null) 'repositoryName': repositoryName,
    };
  }
}

/// An object that represents an Amazon ECR image failure.
class ImageFailure {
  /// The code that's associated with the failure.
  final ImageFailureCode? failureCode;

  /// The reason for the failure.
  final String? failureReason;

  /// The image ID that's associated with the failure.
  final ImageIdentifier? imageId;

  ImageFailure({
    this.failureCode,
    this.failureReason,
    this.imageId,
  });

  factory ImageFailure.fromJson(Map<String, dynamic> json) {
    return ImageFailure(
      failureCode: (json['failureCode'] as String?)?.toImageFailureCode(),
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
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (imageId != null) 'imageId': imageId,
    };
  }
}

enum ImageFailureCode {
  invalidImageDigest,
  invalidImageTag,
  imageTagDoesNotMatchDigest,
  imageNotFound,
  missingDigestAndTag,
  imageReferencedByManifestList,
  kmsError,
}

extension ImageFailureCodeValueExtension on ImageFailureCode {
  String toValue() {
    switch (this) {
      case ImageFailureCode.invalidImageDigest:
        return 'InvalidImageDigest';
      case ImageFailureCode.invalidImageTag:
        return 'InvalidImageTag';
      case ImageFailureCode.imageTagDoesNotMatchDigest:
        return 'ImageTagDoesNotMatchDigest';
      case ImageFailureCode.imageNotFound:
        return 'ImageNotFound';
      case ImageFailureCode.missingDigestAndTag:
        return 'MissingDigestAndTag';
      case ImageFailureCode.imageReferencedByManifestList:
        return 'ImageReferencedByManifestList';
      case ImageFailureCode.kmsError:
        return 'KmsError';
    }
  }
}

extension ImageFailureCodeFromString on String {
  ImageFailureCode toImageFailureCode() {
    switch (this) {
      case 'InvalidImageDigest':
        return ImageFailureCode.invalidImageDigest;
      case 'InvalidImageTag':
        return ImageFailureCode.invalidImageTag;
      case 'ImageTagDoesNotMatchDigest':
        return ImageFailureCode.imageTagDoesNotMatchDigest;
      case 'ImageNotFound':
        return ImageFailureCode.imageNotFound;
      case 'MissingDigestAndTag':
        return ImageFailureCode.missingDigestAndTag;
      case 'ImageReferencedByManifestList':
        return ImageFailureCode.imageReferencedByManifestList;
      case 'KmsError':
        return ImageFailureCode.kmsError;
    }
    throw Exception('$this is not known in enum ImageFailureCode');
  }
}

/// An object with identifying information for an Amazon ECR image.
class ImageIdentifier {
  /// The <code>sha256</code> digest of the image manifest.
  final String? imageDigest;

  /// The tag that's used for the image.
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

/// An object that represents the image tag details for an image.
class ImageTagDetail {
  /// The time stamp that indicates when the image tag was created.
  final DateTime? createdAt;

  /// An object that describes the details of an image.
  final ReferencedImageDetail? imageDetail;

  /// The tag that's associated with the image.
  final String? imageTag;

  ImageTagDetail({
    this.createdAt,
    this.imageDetail,
    this.imageTag,
  });

  factory ImageTagDetail.fromJson(Map<String, dynamic> json) {
    return ImageTagDetail(
      createdAt: timeStampFromJson(json['createdAt']),
      imageDetail: json['imageDetail'] != null
          ? ReferencedImageDetail.fromJson(
              json['imageDetail'] as Map<String, dynamic>)
          : null,
      imageTag: json['imageTag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final imageDetail = this.imageDetail;
    final imageTag = this.imageTag;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (imageDetail != null) 'imageDetail': imageDetail,
      if (imageTag != null) 'imageTag': imageTag,
    };
  }
}

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

/// An object that represents an Amazon ECR image layer.
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
      layerAvailability:
          (json['layerAvailability'] as String?)?.toLayerAvailability(),
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
        'layerAvailability': layerAvailability.toValue(),
      if (layerDigest != null) 'layerDigest': layerDigest,
      if (layerSize != null) 'layerSize': layerSize,
      if (mediaType != null) 'mediaType': mediaType,
    };
  }
}

enum LayerAvailability {
  available,
  unavailable,
}

extension LayerAvailabilityValueExtension on LayerAvailability {
  String toValue() {
    switch (this) {
      case LayerAvailability.available:
        return 'AVAILABLE';
      case LayerAvailability.unavailable:
        return 'UNAVAILABLE';
    }
  }
}

extension LayerAvailabilityFromString on String {
  LayerAvailability toLayerAvailability() {
    switch (this) {
      case 'AVAILABLE':
        return LayerAvailability.available;
      case 'UNAVAILABLE':
        return LayerAvailability.unavailable;
    }
    throw Exception('$this is not known in enum LayerAvailability');
  }
}

/// An object that represents an Amazon ECR image layer failure.
class LayerFailure {
  /// The failure code that's associated with the failure.
  final LayerFailureCode? failureCode;

  /// The reason for the failure.
  final String? failureReason;

  /// The layer digest that's associated with the failure.
  final String? layerDigest;

  LayerFailure({
    this.failureCode,
    this.failureReason,
    this.layerDigest,
  });

  factory LayerFailure.fromJson(Map<String, dynamic> json) {
    return LayerFailure(
      failureCode: (json['failureCode'] as String?)?.toLayerFailureCode(),
      failureReason: json['failureReason'] as String?,
      layerDigest: json['layerDigest'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final layerDigest = this.layerDigest;
    return {
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (layerDigest != null) 'layerDigest': layerDigest,
    };
  }
}

enum LayerFailureCode {
  invalidLayerDigest,
  missingLayerDigest,
}

extension LayerFailureCodeValueExtension on LayerFailureCode {
  String toValue() {
    switch (this) {
      case LayerFailureCode.invalidLayerDigest:
        return 'InvalidLayerDigest';
      case LayerFailureCode.missingLayerDigest:
        return 'MissingLayerDigest';
    }
  }
}

extension LayerFailureCodeFromString on String {
  LayerFailureCode toLayerFailureCode() {
    switch (this) {
      case 'InvalidLayerDigest':
        return LayerFailureCode.invalidLayerDigest;
      case 'MissingLayerDigest':
        return LayerFailureCode.missingLayerDigest;
    }
    throw Exception('$this is not known in enum LayerFailureCode');
  }
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
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

class PutRegistryCatalogDataResponse {
  /// The catalog data for the public registry.
  final RegistryCatalogData registryCatalogData;

  PutRegistryCatalogDataResponse({
    required this.registryCatalogData,
  });

  factory PutRegistryCatalogDataResponse.fromJson(Map<String, dynamic> json) {
    return PutRegistryCatalogDataResponse(
      registryCatalogData: RegistryCatalogData.fromJson(
          json['registryCatalogData'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final registryCatalogData = this.registryCatalogData;
    return {
      'registryCatalogData': registryCatalogData,
    };
  }
}

class PutRepositoryCatalogDataResponse {
  /// The catalog data for the repository.
  final RepositoryCatalogData? catalogData;

  PutRepositoryCatalogDataResponse({
    this.catalogData,
  });

  factory PutRepositoryCatalogDataResponse.fromJson(Map<String, dynamic> json) {
    return PutRepositoryCatalogDataResponse(
      catalogData: json['catalogData'] != null
          ? RepositoryCatalogData.fromJson(
              json['catalogData'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final catalogData = this.catalogData;
    return {
      if (catalogData != null) 'catalogData': catalogData,
    };
  }
}

/// An object that describes the image tag details that are returned by a
/// <a>DescribeImageTags</a> action.
class ReferencedImageDetail {
  /// The artifact media type of the image.
  final String? artifactMediaType;

  /// The <code>sha256</code> digest of the image manifest.
  final String? imageDigest;

  /// The media type of the image manifest.
  final String? imageManifestMediaType;

  /// The date and time, expressed in standard JavaScript date format, which the
  /// current image tag was pushed to the repository at.
  final DateTime? imagePushedAt;

  /// The size, in bytes, of the image in the repository.
  ///
  /// If the image is a manifest list, this is the max size of all manifests in
  /// the list.
  /// <note>
  /// Beginning with Docker version 1.9, the Docker client compresses image layers
  /// before pushing them to a V2 Docker registry. The output of the <code>docker
  /// images</code> command shows the uncompressed image size, so it might return
  /// a larger image size than the image sizes that are returned by
  /// <a>DescribeImages</a>.
  /// </note>
  final int? imageSizeInBytes;

  ReferencedImageDetail({
    this.artifactMediaType,
    this.imageDigest,
    this.imageManifestMediaType,
    this.imagePushedAt,
    this.imageSizeInBytes,
  });

  factory ReferencedImageDetail.fromJson(Map<String, dynamic> json) {
    return ReferencedImageDetail(
      artifactMediaType: json['artifactMediaType'] as String?,
      imageDigest: json['imageDigest'] as String?,
      imageManifestMediaType: json['imageManifestMediaType'] as String?,
      imagePushedAt: timeStampFromJson(json['imagePushedAt']),
      imageSizeInBytes: json['imageSizeInBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactMediaType = this.artifactMediaType;
    final imageDigest = this.imageDigest;
    final imageManifestMediaType = this.imageManifestMediaType;
    final imagePushedAt = this.imagePushedAt;
    final imageSizeInBytes = this.imageSizeInBytes;
    return {
      if (artifactMediaType != null) 'artifactMediaType': artifactMediaType,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (imageManifestMediaType != null)
        'imageManifestMediaType': imageManifestMediaType,
      if (imagePushedAt != null)
        'imagePushedAt': unixTimestampToJson(imagePushedAt),
      if (imageSizeInBytes != null) 'imageSizeInBytes': imageSizeInBytes,
    };
  }
}

/// The details of a public registry.
class Registry {
  /// An array of objects that represents the aliases for a public registry.
  final List<RegistryAlias> aliases;

  /// The Amazon Resource Name (ARN) of the public registry.
  final String registryArn;

  /// The Amazon Web Services account ID that's associated with the registry. If
  /// you do not specify a registry, the default public registry is assumed.
  final String registryId;

  /// The URI of a public registry. The URI contains a universal prefix and the
  /// registry alias.
  final String registryUri;

  /// Indicates whether the account is a verified Amazon Web Services Marketplace
  /// vendor. If an account is verified, each public repository receives a
  /// verified account badge on the Amazon ECR Public Gallery.
  final bool verified;

  Registry({
    required this.aliases,
    required this.registryArn,
    required this.registryId,
    required this.registryUri,
    required this.verified,
  });

  factory Registry.fromJson(Map<String, dynamic> json) {
    return Registry(
      aliases: (json['aliases'] as List)
          .whereNotNull()
          .map((e) => RegistryAlias.fromJson(e as Map<String, dynamic>))
          .toList(),
      registryArn: json['registryArn'] as String,
      registryId: json['registryId'] as String,
      registryUri: json['registryUri'] as String,
      verified: json['verified'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final registryArn = this.registryArn;
    final registryId = this.registryId;
    final registryUri = this.registryUri;
    final verified = this.verified;
    return {
      'aliases': aliases,
      'registryArn': registryArn,
      'registryId': registryId,
      'registryUri': registryUri,
      'verified': verified,
    };
  }
}

/// An object representing the aliases for a public registry. A public registry
/// is given an alias when it's created. However, a custom alias can be set
/// using the Amazon ECR console. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonECR/latest/userguide/Registries.html">Registries</a>
/// in the <i>Amazon Elastic Container Registry User Guide</i>.
class RegistryAlias {
  /// Indicates whether the registry alias is the default alias for the registry.
  /// When the first public repository is created, your public registry is
  /// assigned a default registry alias.
  final bool defaultRegistryAlias;

  /// The name of the registry alias.
  final String name;

  /// Indicates whether the registry alias is the primary alias for the registry.
  /// If true, the alias is the primary registry alias and is displayed in both
  /// the repository URL and the image URI used in the <code>docker pull</code>
  /// commands on the Amazon ECR Public Gallery.
  /// <note>
  /// A registry alias that isn't the primary registry alias can be used in the
  /// repository URI in a <code>docker pull</code> command.
  /// </note>
  final bool primaryRegistryAlias;

  /// The status of the registry alias.
  final RegistryAliasStatus status;

  RegistryAlias({
    required this.defaultRegistryAlias,
    required this.name,
    required this.primaryRegistryAlias,
    required this.status,
  });

  factory RegistryAlias.fromJson(Map<String, dynamic> json) {
    return RegistryAlias(
      defaultRegistryAlias: json['defaultRegistryAlias'] as bool,
      name: json['name'] as String,
      primaryRegistryAlias: json['primaryRegistryAlias'] as bool,
      status: (json['status'] as String).toRegistryAliasStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultRegistryAlias = this.defaultRegistryAlias;
    final name = this.name;
    final primaryRegistryAlias = this.primaryRegistryAlias;
    final status = this.status;
    return {
      'defaultRegistryAlias': defaultRegistryAlias,
      'name': name,
      'primaryRegistryAlias': primaryRegistryAlias,
      'status': status.toValue(),
    };
  }
}

enum RegistryAliasStatus {
  active,
  pending,
  rejected,
}

extension RegistryAliasStatusValueExtension on RegistryAliasStatus {
  String toValue() {
    switch (this) {
      case RegistryAliasStatus.active:
        return 'ACTIVE';
      case RegistryAliasStatus.pending:
        return 'PENDING';
      case RegistryAliasStatus.rejected:
        return 'REJECTED';
    }
  }
}

extension RegistryAliasStatusFromString on String {
  RegistryAliasStatus toRegistryAliasStatus() {
    switch (this) {
      case 'ACTIVE':
        return RegistryAliasStatus.active;
      case 'PENDING':
        return RegistryAliasStatus.pending;
      case 'REJECTED':
        return RegistryAliasStatus.rejected;
    }
    throw Exception('$this is not known in enum RegistryAliasStatus');
  }
}

/// The metadata for a public registry.
class RegistryCatalogData {
  /// The display name for a public registry. This appears on the Amazon ECR
  /// Public Gallery.
  /// <important>
  /// Only accounts that have the verified account badge can have a registry
  /// display name.
  /// </important>
  final String? displayName;

  RegistryCatalogData({
    this.displayName,
  });

  factory RegistryCatalogData.fromJson(Map<String, dynamic> json) {
    return RegistryCatalogData(
      displayName: json['displayName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    return {
      if (displayName != null) 'displayName': displayName,
    };
  }
}

/// An object representing a repository.
class Repository {
  /// The date and time, in JavaScript date format, when the repository was
  /// created.
  final DateTime? createdAt;

  /// The Amazon Web Services account ID that's associated with the public
  /// registry that contains the repository.
  final String? registryId;

  /// The Amazon Resource Name (ARN) that identifies the repository. The ARN
  /// contains the <code>arn:aws:ecr</code> namespace, followed by the region of
  /// the repository, Amazon Web Services account ID of the repository owner,
  /// repository namespace, and repository name. For example,
  /// <code>arn:aws:ecr:region:012345678910:repository/test</code>.
  final String? repositoryArn;

  /// The name of the repository.
  final String? repositoryName;

  /// The URI for the repository. You can use this URI for container image
  /// <code>push</code> and <code>pull</code> operations.
  final String? repositoryUri;

  Repository({
    this.createdAt,
    this.registryId,
    this.repositoryArn,
    this.repositoryName,
    this.repositoryUri,
  });

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      createdAt: timeStampFromJson(json['createdAt']),
      registryId: json['registryId'] as String?,
      repositoryArn: json['repositoryArn'] as String?,
      repositoryName: json['repositoryName'] as String?,
      repositoryUri: json['repositoryUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final registryId = this.registryId;
    final repositoryArn = this.repositoryArn;
    final repositoryName = this.repositoryName;
    final repositoryUri = this.repositoryUri;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (registryId != null) 'registryId': registryId,
      if (repositoryArn != null) 'repositoryArn': repositoryArn,
      if (repositoryName != null) 'repositoryName': repositoryName,
      if (repositoryUri != null) 'repositoryUri': repositoryUri,
    };
  }
}

/// The catalog data for a repository. This data is publicly visible in the
/// Amazon ECR Public Gallery.
class RepositoryCatalogData {
  /// The longform description of the contents of the repository. This text
  /// appears in the repository details on the Amazon ECR Public Gallery.
  final String? aboutText;

  /// The architecture tags that are associated with the repository.
  /// <note>
  /// Only supported operating system tags appear publicly in the Amazon ECR
  /// Public Gallery. For more information, see <a>RepositoryCatalogDataInput</a>.
  /// </note>
  final List<String>? architectures;

  /// The short description of the repository.
  final String? description;

  /// The URL that contains the logo that's associated with the repository.
  final String? logoUrl;

  /// Indicates whether the repository is certified by Amazon Web Services
  /// Marketplace.
  final bool? marketplaceCertified;

  /// The operating system tags that are associated with the repository.
  /// <note>
  /// Only supported operating system tags appear publicly in the Amazon ECR
  /// Public Gallery. For more information, see <a>RepositoryCatalogDataInput</a>.
  /// </note>
  final List<String>? operatingSystems;

  /// The longform usage details of the contents of the repository. The usage text
  /// provides context for users of the repository.
  final String? usageText;

  RepositoryCatalogData({
    this.aboutText,
    this.architectures,
    this.description,
    this.logoUrl,
    this.marketplaceCertified,
    this.operatingSystems,
    this.usageText,
  });

  factory RepositoryCatalogData.fromJson(Map<String, dynamic> json) {
    return RepositoryCatalogData(
      aboutText: json['aboutText'] as String?,
      architectures: (json['architectures'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      logoUrl: json['logoUrl'] as String?,
      marketplaceCertified: json['marketplaceCertified'] as bool?,
      operatingSystems: (json['operatingSystems'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      usageText: json['usageText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aboutText = this.aboutText;
    final architectures = this.architectures;
    final description = this.description;
    final logoUrl = this.logoUrl;
    final marketplaceCertified = this.marketplaceCertified;
    final operatingSystems = this.operatingSystems;
    final usageText = this.usageText;
    return {
      if (aboutText != null) 'aboutText': aboutText,
      if (architectures != null) 'architectures': architectures,
      if (description != null) 'description': description,
      if (logoUrl != null) 'logoUrl': logoUrl,
      if (marketplaceCertified != null)
        'marketplaceCertified': marketplaceCertified,
      if (operatingSystems != null) 'operatingSystems': operatingSystems,
      if (usageText != null) 'usageText': usageText,
    };
  }
}

/// An object that contains the catalog data for a repository. This data is
/// publicly visible in the Amazon ECR Public Gallery.
class RepositoryCatalogDataInput {
  /// A detailed description of the contents of the repository. It's publicly
  /// visible in the Amazon ECR Public Gallery. The text must be in markdown
  /// format.
  final String? aboutText;

  /// The system architecture that the images in the repository are compatible
  /// with. On the Amazon ECR Public Gallery, the following supported
  /// architectures appear as badges on the repository and are used as search
  /// filters.
  /// <note>
  /// If an unsupported tag is added to your repository catalog data, it's
  /// associated with the repository and can be retrieved using the API but isn't
  /// discoverable in the Amazon ECR Public Gallery.
  /// </note>
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
  /// </ul>
  final List<String>? architectures;

  /// A short description of the contents of the repository. This text appears in
  /// both the image details and also when searching for repositories on the
  /// Amazon ECR Public Gallery.
  final String? description;

  /// The base64-encoded repository logo payload.
  /// <note>
  /// The repository logo is only publicly visible in the Amazon ECR Public
  /// Gallery for verified accounts.
  /// </note>
  final Uint8List? logoImageBlob;

  /// The operating systems that the images in the repository are compatible with.
  /// On the Amazon ECR Public Gallery, the following supported operating systems
  /// appear as badges on the repository and are used as search filters.
  /// <note>
  /// If an unsupported tag is added to your repository catalog data, it's
  /// associated with the repository and can be retrieved using the API but isn't
  /// discoverable in the Amazon ECR Public Gallery.
  /// </note>
  /// <ul>
  /// <li>
  /// <code>Linux</code>
  /// </li>
  /// <li>
  /// <code>Windows</code>
  /// </li>
  /// </ul>
  final List<String>? operatingSystems;

  /// Detailed information about how to use the contents of the repository. It's
  /// publicly visible in the Amazon ECR Public Gallery. The usage text provides
  /// context, support information, and additional usage details for users of the
  /// repository. The text must be in markdown format.
  final String? usageText;

  RepositoryCatalogDataInput({
    this.aboutText,
    this.architectures,
    this.description,
    this.logoImageBlob,
    this.operatingSystems,
    this.usageText,
  });

  Map<String, dynamic> toJson() {
    final aboutText = this.aboutText;
    final architectures = this.architectures;
    final description = this.description;
    final logoImageBlob = this.logoImageBlob;
    final operatingSystems = this.operatingSystems;
    final usageText = this.usageText;
    return {
      if (aboutText != null) 'aboutText': aboutText,
      if (architectures != null) 'architectures': architectures,
      if (description != null) 'description': description,
      if (logoImageBlob != null) 'logoImageBlob': base64Encode(logoImageBlob),
      if (operatingSystems != null) 'operatingSystems': operatingSystems,
      if (usageText != null) 'usageText': usageText,
    };
  }
}

class SetRepositoryPolicyResponse {
  /// The JSON repository policy text that's applied to the repository.
  final String? policyText;

  /// The registry ID that's associated with the request.
  final String? registryId;

  /// The repository name that's associated with the request.
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

/// The metadata that you apply to a resource to help you categorize and
/// organize them. Each tag consists of a key and an optional value. You define
/// both. Tag keys can have a maximum character length of 128 characters, and
/// tag values can have a maximum length of 256 characters.
class Tag {
  /// One part of a key-value pair that make up a tag. A <code>key</code> is a
  /// general label that acts like a category for more specific tag values.
  final String? key;

  /// The optional part of a key-value pair that make up a tag. A
  /// <code>value</code> acts as a descriptor within a tag category (key).
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UploadLayerPartResponse {
  /// The integer value of the last byte that's received in the request.
  final int? lastByteReceived;

  /// The registry ID that's associated with the request.
  final String? registryId;

  /// The repository name that's associated with the request.
  final String? repositoryName;

  /// The upload ID that's associated with the request.
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

class EmptyUploadException extends _s.GenericAwsException {
  EmptyUploadException({String? type, String? message})
      : super(type: type, code: 'EmptyUploadException', message: message);
}

class ImageAlreadyExistsException extends _s.GenericAwsException {
  ImageAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'ImageAlreadyExistsException', message: message);
}

class ImageDigestDoesNotMatchException extends _s.GenericAwsException {
  ImageDigestDoesNotMatchException({String? type, String? message})
      : super(
            type: type,
            code: 'ImageDigestDoesNotMatchException',
            message: message);
}

class ImageNotFoundException extends _s.GenericAwsException {
  ImageNotFoundException({String? type, String? message})
      : super(type: type, code: 'ImageNotFoundException', message: message);
}

class ImageTagAlreadyExistsException extends _s.GenericAwsException {
  ImageTagAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ImageTagAlreadyExistsException',
            message: message);
}

class InvalidLayerException extends _s.GenericAwsException {
  InvalidLayerException({String? type, String? message})
      : super(type: type, code: 'InvalidLayerException', message: message);
}

class InvalidLayerPartException extends _s.GenericAwsException {
  InvalidLayerPartException({String? type, String? message})
      : super(type: type, code: 'InvalidLayerPartException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidTagParameterException extends _s.GenericAwsException {
  InvalidTagParameterException({String? type, String? message})
      : super(
            type: type, code: 'InvalidTagParameterException', message: message);
}

class LayerAlreadyExistsException extends _s.GenericAwsException {
  LayerAlreadyExistsException({String? type, String? message})
      : super(
            type: type, code: 'LayerAlreadyExistsException', message: message);
}

class LayerPartTooSmallException extends _s.GenericAwsException {
  LayerPartTooSmallException({String? type, String? message})
      : super(type: type, code: 'LayerPartTooSmallException', message: message);
}

class LayersNotFoundException extends _s.GenericAwsException {
  LayersNotFoundException({String? type, String? message})
      : super(type: type, code: 'LayersNotFoundException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ReferencedImagesNotFoundException extends _s.GenericAwsException {
  ReferencedImagesNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ReferencedImagesNotFoundException',
            message: message);
}

class RegistryNotFoundException extends _s.GenericAwsException {
  RegistryNotFoundException({String? type, String? message})
      : super(type: type, code: 'RegistryNotFoundException', message: message);
}

class RepositoryAlreadyExistsException extends _s.GenericAwsException {
  RepositoryAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryAlreadyExistsException',
            message: message);
}

class RepositoryCatalogDataNotFoundException extends _s.GenericAwsException {
  RepositoryCatalogDataNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryCatalogDataNotFoundException',
            message: message);
}

class RepositoryNotEmptyException extends _s.GenericAwsException {
  RepositoryNotEmptyException({String? type, String? message})
      : super(
            type: type, code: 'RepositoryNotEmptyException', message: message);
}

class RepositoryNotFoundException extends _s.GenericAwsException {
  RepositoryNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'RepositoryNotFoundException', message: message);
}

class RepositoryPolicyNotFoundException extends _s.GenericAwsException {
  RepositoryPolicyNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'RepositoryPolicyNotFoundException',
            message: message);
}

class ServerException extends _s.GenericAwsException {
  ServerException({String? type, String? message})
      : super(type: type, code: 'ServerException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

class UnsupportedCommandException extends _s.GenericAwsException {
  UnsupportedCommandException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedCommandException', message: message);
}

class UploadNotFoundException extends _s.GenericAwsException {
  UploadNotFoundException({String? type, String? message})
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
  'InvalidTagParameterException': (type, message) =>
      InvalidTagParameterException(type: type, message: message),
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
  'RepositoryCatalogDataNotFoundException': (type, message) =>
      RepositoryCatalogDataNotFoundException(type: type, message: message),
  'RepositoryNotEmptyException': (type, message) =>
      RepositoryNotEmptyException(type: type, message: message),
  'RepositoryNotFoundException': (type, message) =>
      RepositoryNotFoundException(type: type, message: message),
  'RepositoryPolicyNotFoundException': (type, message) =>
      RepositoryPolicyNotFoundException(type: type, message: message),
  'ServerException': (type, message) =>
      ServerException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
  'UnsupportedCommandException': (type, message) =>
      UnsupportedCommandException(type: type, message: message),
  'UploadNotFoundException': (type, message) =>
      UploadNotFoundException(type: type, message: message),
};
