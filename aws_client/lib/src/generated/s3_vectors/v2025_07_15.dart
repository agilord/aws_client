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

/// Amazon S3 vector buckets are a bucket type to store and search vectors with
/// sub-second search times. They are designed to provide dedicated API
/// operations for you to interact with vectors to do similarity search. Within
/// a vector bucket, you use a vector index to organize and logically group your
/// vector data. When you make a write or read request, you direct it to a
/// single vector index. You store your vector data as vectors. A vector
/// contains a key (a name that you assign), a multi-dimensional vector, and,
/// optionally, metadata that describes a vector. The key uniquely identifies
/// the vector in a vector index.
class S3Vectors {
  final _s.RestJsonProtocol _protocol;
  S3Vectors({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 's3vectors',
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

  /// Lists all of the tags applied to a specified Amazon S3 Vectors resource.
  /// Each tag is a label consisting of a key and value pair. Tags can help you
  /// organize, track costs for, and control access to resources.
  /// <note>
  /// For a list of S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// For vector buckets and vector indexes, you must have the
  /// <code>s3vectors:ListTagsForResource</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 Vectors resource that you
  /// want to list tags for. The tagged resource can be a vector bucket or a
  /// vector index.
  Future<ListTagsForResourceOutput> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceOutput.fromJson(response);
  }

  /// Applies one or more user-defined tags to an Amazon S3 Vectors resource or
  /// updates existing tags. Each tag is a label consisting of a key and value
  /// pair. Tags can help you organize, track costs for, and control access to
  /// your resources. You can add up to 50 tags for each resource.
  /// <note>
  /// For a list of S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// For vector buckets and vector indexes, you must have the
  /// <code>s3vectors:TagResource</code> permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 Vectors resource that
  /// you're applying tags to. The tagged resource can be a vector bucket or a
  /// vector index.
  ///
  /// Parameter [tags] :
  /// The user-defined tag that you want to add to the specified S3 Vectors
  /// resource. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html">Tagging
  /// for cost allocation or attribute-based access control (ABAC)</a>.
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

  /// Removes the specified user-defined tags from an Amazon S3 Vectors
  /// resource. You can pass one or more tag keys.
  /// <note>
  /// For a list of S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// For vector buckets and vector indexes, you must have the
  /// <code>s3vectors:UntagResource</code> permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 Vectors resource that
  /// you're removing tags from. The tagged resource can be a vector bucket or a
  /// vector index.
  ///
  /// Parameter [tagKeys] :
  /// The array of tag keys that you're removing from the S3 Vectors resource.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html">Tagging
  /// for cost allocation or attribute-based access control (ABAC)</a>.
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

  /// Creates a vector bucket in the Amazon Web Services Region that you want
  /// your bucket to be in.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:CreateVectorBucket</code> permission to
  /// use this operation.
  ///
  /// You must have the <code>s3vectors:TagResource</code> permission in
  /// addition to <code>s3vectors:CreateVectorBucket</code> permission to create
  /// a vector bucket with tags.
  /// </dd> </dl>
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket to create.
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration for the vector bucket. By default, if you
  /// don't specify, all new vectors in Amazon S3 vector buckets use server-side
  /// encryption with Amazon S3 managed keys (SSE-S3), specifically
  /// <code>AES256</code>.
  ///
  /// Parameter [tags] :
  /// An array of user-defined tags that you would like to apply to the vector
  /// bucket that you are creating. A tag is a key-value pair that you apply to
  /// your resources. Tags can help you organize and control access to
  /// resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html">Tagging
  /// for cost allocation or attribute-based access control (ABAC)</a>.
  /// <note>
  /// You must have the <code>s3vectors:TagResource</code> permission in
  /// addition to <code>s3vectors:CreateVectorBucket</code> permission to create
  /// a vector bucket with tags.
  /// </note>
  Future<CreateVectorBucketOutput> createVectorBucket({
    required String vectorBucketName,
    EncryptionConfiguration? encryptionConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'vectorBucketName': vectorBucketName,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateVectorBucket',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVectorBucketOutput.fromJson(response);
  }

  /// Deletes a vector bucket. All vector indexes in the vector bucket must be
  /// deleted before the vector bucket can be deleted. To perform this
  /// operation, you must use either the vector bucket name or the vector bucket
  /// Amazon Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:DeleteVectorBucket</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [vectorBucketArn] :
  /// The ARN of the vector bucket to delete.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket to delete.
  Future<void> deleteVectorBucket({
    String? vectorBucketArn,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      if (vectorBucketArn != null) 'vectorBucketArn': vectorBucketArn,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteVectorBucket',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a vector bucket policy. To specify the bucket, you must use either
  /// the vector bucket name or the vector bucket Amazon Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:DeleteVectorBucketPolicy</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [vectorBucketArn] :
  /// The ARN of the vector bucket to delete the policy from.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket to delete the policy from.
  Future<void> deleteVectorBucketPolicy({
    String? vectorBucketArn,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      if (vectorBucketArn != null) 'vectorBucketArn': vectorBucketArn,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteVectorBucketPolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns vector bucket attributes. To specify the bucket, you must use
  /// either the vector bucket name or the vector bucket Amazon Resource Name
  /// (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:GetVectorBucket</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [vectorBucketArn] :
  /// The ARN of the vector bucket to retrieve information about.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket to retrieve information about.
  Future<GetVectorBucketOutput> getVectorBucket({
    String? vectorBucketArn,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      if (vectorBucketArn != null) 'vectorBucketArn': vectorBucketArn,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetVectorBucket',
      exceptionFnMap: _exceptionFns,
    );
    return GetVectorBucketOutput.fromJson(response);
  }

  /// Gets details about a vector bucket policy. To specify the bucket, you must
  /// use either the vector bucket name or the vector bucket Amazon Resource
  /// Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:GetVectorBucketPolicy</code> permission
  /// to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [vectorBucketArn] :
  /// The ARN of the vector bucket.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket.
  Future<GetVectorBucketPolicyOutput> getVectorBucketPolicy({
    String? vectorBucketArn,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      if (vectorBucketArn != null) 'vectorBucketArn': vectorBucketArn,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetVectorBucketPolicy',
      exceptionFnMap: _exceptionFns,
    );
    return GetVectorBucketPolicyOutput.fromJson(response);
  }

  /// Returns a list of all the vector buckets that are owned by the
  /// authenticated sender of the request.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:ListVectorBuckets</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of vector buckets to be returned in the response.
  ///
  /// Parameter [nextToken] :
  /// The previous pagination token.
  ///
  /// Parameter [prefix] :
  /// Limits the response to vector buckets that begin with the specified
  /// prefix.
  Future<ListVectorBucketsOutput> listVectorBuckets({
    int? maxResults,
    String? nextToken,
    String? prefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (prefix != null) 'prefix': prefix,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListVectorBuckets',
      exceptionFnMap: _exceptionFns,
    );
    return ListVectorBucketsOutput.fromJson(response);
  }

  /// Creates a bucket policy for a vector bucket. To specify the bucket, you
  /// must use either the vector bucket name or the vector bucket Amazon
  /// Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:PutVectorBucketPolicy</code> permission
  /// to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [policy] :
  /// The <code>JSON</code> that defines the policy. For more information about
  /// bucket policies for S3 Vectors, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-vectors-bucket-policy.html">Managing
  /// vector bucket policies</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// Parameter [vectorBucketArn] :
  /// The Amazon Resource Name (ARN) of the vector bucket.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket.
  Future<void> putVectorBucketPolicy({
    required String policy,
    String? vectorBucketArn,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      'policy': policy,
      if (vectorBucketArn != null) 'vectorBucketArn': vectorBucketArn,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutVectorBucketPolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a vector index within a vector bucket. To specify the vector
  /// bucket, you must use either the vector bucket name or the vector bucket
  /// Amazon Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:CreateIndex</code> permission to use
  /// this operation.
  ///
  /// You must have the <code>s3vectors:TagResource</code> permission in
  /// addition to <code>s3vectors:CreateIndex</code> permission to create a
  /// vector index with tags.
  /// </dd> </dl>
  ///
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [dataType] :
  /// The data type of the vectors to be inserted into the vector index.
  ///
  /// Parameter [dimension] :
  /// The dimensions of the vectors to be inserted into the vector index.
  ///
  /// Parameter [distanceMetric] :
  /// The distance metric to be used for similarity search.
  ///
  /// Parameter [indexName] :
  /// The name of the vector index to create.
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration for a vector index. By default, if you don't
  /// specify, all new vectors in the vector index will use the encryption
  /// configuration of the vector bucket.
  ///
  /// Parameter [metadataConfiguration] :
  /// The metadata configuration for the vector index.
  ///
  /// Parameter [tags] :
  /// An array of user-defined tags that you would like to apply to the vector
  /// index that you are creating. A tag is a key-value pair that you apply to
  /// your resources. Tags can help you organize, track costs, and control
  /// access to resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html">Tagging
  /// for cost allocation or attribute-based access control (ABAC)</a>.
  /// <note>
  /// You must have the <code>s3vectors:TagResource</code> permission in
  /// addition to <code>s3vectors:CreateIndex</code> permission to create a
  /// vector index with tags.
  /// </note>
  ///
  /// Parameter [vectorBucketArn] :
  /// The Amazon Resource Name (ARN) of the vector bucket to create the vector
  /// index in.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket to create the vector index in.
  Future<CreateIndexOutput> createIndex({
    required DataType dataType,
    required int dimension,
    required DistanceMetric distanceMetric,
    required String indexName,
    EncryptionConfiguration? encryptionConfiguration,
    MetadataConfiguration? metadataConfiguration,
    Map<String, String>? tags,
    String? vectorBucketArn,
    String? vectorBucketName,
  }) async {
    _s.validateNumRange(
      'dimension',
      dimension,
      1,
      4096,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'dataType': dataType.value,
      'dimension': dimension,
      'distanceMetric': distanceMetric.value,
      'indexName': indexName,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (metadataConfiguration != null)
        'metadataConfiguration': metadataConfiguration,
      if (tags != null) 'tags': tags,
      if (vectorBucketArn != null) 'vectorBucketArn': vectorBucketArn,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateIndex',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIndexOutput.fromJson(response);
  }

  /// Deletes a vector index. To specify the vector index, you can either use
  /// both the vector bucket name and vector index name, or use the vector index
  /// Amazon Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:DeleteIndex</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [indexArn] :
  /// The ARN of the vector index to delete.
  ///
  /// Parameter [indexName] :
  /// The name of the vector index to delete.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket that contains the vector index.
  Future<void> deleteIndex({
    String? indexArn,
    String? indexName,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      if (indexArn != null) 'indexArn': indexArn,
      if (indexName != null) 'indexName': indexName,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteIndex',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns vector index attributes. To specify the vector index, you can
  /// either use both the vector bucket name and the vector index name, or use
  /// the vector index Amazon Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:GetIndex</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [indexArn] :
  /// The ARN of the vector index.
  ///
  /// Parameter [indexName] :
  /// The name of the vector index.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket that contains the vector index.
  Future<GetIndexOutput> getIndex({
    String? indexArn,
    String? indexName,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      if (indexArn != null) 'indexArn': indexArn,
      if (indexName != null) 'indexName': indexName,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetIndex',
      exceptionFnMap: _exceptionFns,
    );
    return GetIndexOutput.fromJson(response);
  }

  /// Returns a list of all the vector indexes within the specified vector
  /// bucket. To specify the bucket, you must use either the vector bucket name
  /// or the vector bucket Amazon Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:ListIndexes</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to be returned in the response.
  ///
  /// Parameter [nextToken] :
  /// The previous pagination token.
  ///
  /// Parameter [prefix] :
  /// Limits the response to vector indexes that begin with the specified
  /// prefix.
  ///
  /// Parameter [vectorBucketArn] :
  /// The ARN of the vector bucket that contains the vector indexes.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket that contains the vector indexes.
  Future<ListIndexesOutput> listIndexes({
    int? maxResults,
    String? nextToken,
    String? prefix,
    String? vectorBucketArn,
    String? vectorBucketName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (prefix != null) 'prefix': prefix,
      if (vectorBucketArn != null) 'vectorBucketArn': vectorBucketArn,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListIndexes',
      exceptionFnMap: _exceptionFns,
    );
    return ListIndexesOutput.fromJson(response);
  }

  /// Deletes one or more vectors in a vector index. To specify the vector
  /// index, you can either use both the vector bucket name and vector index
  /// name, or use the vector index Amazon Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:DeleteVectors</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [KmsDisabledException].
  /// May throw [KmsInvalidKeyUsageException].
  /// May throw [KmsInvalidStateException].
  /// May throw [KmsNotFoundException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [keys] :
  /// The keys of the vectors to delete.
  ///
  /// Parameter [indexArn] :
  /// The ARN of the vector index that contains a vector you want to delete.
  ///
  /// Parameter [indexName] :
  /// The name of the vector index that contains a vector you want to delete.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket that contains the vector index.
  Future<void> deleteVectors({
    required List<String> keys,
    String? indexArn,
    String? indexName,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      'keys': keys,
      if (indexArn != null) 'indexArn': indexArn,
      if (indexName != null) 'indexName': indexName,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteVectors',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns vector attributes. To specify the vector index, you can either use
  /// both the vector bucket name and the vector index name, or use the vector
  /// index Amazon Resource Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:GetVectors</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [KmsDisabledException].
  /// May throw [KmsInvalidKeyUsageException].
  /// May throw [KmsInvalidStateException].
  /// May throw [KmsNotFoundException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [keys] :
  /// The names of the vectors you want to return attributes for.
  ///
  /// Parameter [indexArn] :
  /// The ARN of the vector index.
  ///
  /// Parameter [indexName] :
  /// The name of the vector index.
  ///
  /// Parameter [returnData] :
  /// Indicates whether to include the vector data in the response. The default
  /// value is <code>false</code>.
  ///
  /// Parameter [returnMetadata] :
  /// Indicates whether to include metadata in the response. The default value
  /// is <code>false</code>.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket that contains the vector index.
  Future<GetVectorsOutput> getVectors({
    required List<String> keys,
    String? indexArn,
    String? indexName,
    bool? returnData,
    bool? returnMetadata,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      'keys': keys,
      if (indexArn != null) 'indexArn': indexArn,
      if (indexName != null) 'indexName': indexName,
      if (returnData != null) 'returnData': returnData,
      if (returnMetadata != null) 'returnMetadata': returnMetadata,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetVectors',
      exceptionFnMap: _exceptionFns,
    );
    return GetVectorsOutput.fromJson(response);
  }

  /// List vectors in the specified vector index. To specify the vector index,
  /// you can either use both the vector bucket name and the vector index name,
  /// or use the vector index Amazon Resource Name (ARN).
  ///
  /// <code>ListVectors</code> operations proceed sequentially; however, for
  /// faster performance on a large number of vectors in a vector index,
  /// applications can request a parallel <code>ListVectors</code> operation by
  /// providing the <code>segmentCount</code> and <code>segmentIndex</code>
  /// parameters.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:ListVectors</code> permission to use
  /// this operation. Additional permissions are required based on the request
  /// parameters you specify:
  ///
  /// <ul>
  /// <li>
  /// With only <code>s3vectors:ListVectors</code> permission, you can list
  /// vector keys when <code>returnData</code> and <code>returnMetadata</code>
  /// are both set to false or not specified..
  /// </li>
  /// <li>
  /// If you set <code>returnData</code> or <code>returnMetadata</code> to true,
  /// you must have both <code>s3vectors:ListVectors</code> and
  /// <code>s3vectors:GetVectors</code> permissions. The request fails with a
  /// <code>403 Forbidden</code> error if you request vector data or metadata
  /// without the <code>s3vectors:GetVectors</code> permission.
  /// </li>
  /// </ul> </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [indexArn] :
  /// The Amazon resource Name (ARN) of the vector index.
  ///
  /// Parameter [indexName] :
  /// The name of the vector index.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of vectors to return on a page.
  ///
  /// If you don't specify <code>maxResults</code>, the <code>ListVectors</code>
  /// operation uses a default value of 500.
  ///
  /// If the processed dataset size exceeds 1 MB before reaching the
  /// <code>maxResults</code> value, the operation stops and returns the vectors
  /// that are retrieved up to that point, along with a <code>nextToken</code>
  /// that you can use in a subsequent request to retrieve the next set of
  /// results.
  ///
  /// Parameter [nextToken] :
  /// Pagination token from a previous request. The value of this field is empty
  /// for an initial request.
  ///
  /// Parameter [returnData] :
  /// If true, the vector data of each vector will be included in the response.
  /// The default value is <code>false</code>.
  ///
  /// Parameter [returnMetadata] :
  /// If true, the metadata associated with each vector will be included in the
  /// response. The default value is <code>false</code>.
  ///
  /// Parameter [segmentCount] :
  /// For a parallel <code>ListVectors</code> request, <code>segmentCount</code>
  /// represents the total number of vector segments into which the
  /// <code>ListVectors</code> operation will be divided. The value of
  /// <code>segmentCount</code> corresponds to the number of application workers
  /// that will perform the parallel <code>ListVectors</code> operation. For
  /// example, if you want to use four application threads to list vectors in a
  /// vector index, specify a <code>segmentCount</code> value of 4.
  ///
  /// If you specify a <code>segmentCount</code> value of 1, the
  /// <code>ListVectors</code> operation will be sequential rather than
  /// parallel.
  ///
  /// If you specify <code>segmentCount</code>, you must also specify
  /// <code>segmentIndex</code>.
  ///
  /// Parameter [segmentIndex] :
  /// For a parallel <code>ListVectors</code> request, <code>segmentIndex</code>
  /// is the index of the segment from which to list vectors in the current
  /// request. It identifies an individual segment to be listed by an
  /// application worker.
  ///
  /// Segment IDs are zero-based, so the first segment is always 0. For example,
  /// if you want to use four application threads to list vectors in a vector
  /// index, then the first thread specifies a <code>segmentIndex</code> value
  /// of 0, the second thread specifies 1, and so on.
  ///
  /// The value of <code>segmentIndex</code> must be less than the value
  /// provided for <code>segmentCount</code>.
  ///
  /// If you provide <code>segmentIndex</code>, you must also provide
  /// <code>segmentCount</code>.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket.
  Future<ListVectorsOutput> listVectors({
    String? indexArn,
    String? indexName,
    int? maxResults,
    String? nextToken,
    bool? returnData,
    bool? returnMetadata,
    int? segmentCount,
    int? segmentIndex,
    String? vectorBucketName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateNumRange(
      'segmentCount',
      segmentCount,
      1,
      16,
    );
    _s.validateNumRange(
      'segmentIndex',
      segmentIndex,
      0,
      15,
    );
    final $payload = <String, dynamic>{
      if (indexArn != null) 'indexArn': indexArn,
      if (indexName != null) 'indexName': indexName,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (returnData != null) 'returnData': returnData,
      if (returnMetadata != null) 'returnMetadata': returnMetadata,
      if (segmentCount != null) 'segmentCount': segmentCount,
      if (segmentIndex != null) 'segmentIndex': segmentIndex,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListVectors',
      exceptionFnMap: _exceptionFns,
    );
    return ListVectorsOutput.fromJson(response);
  }

  /// Adds one or more vectors to a vector index. To specify the vector index,
  /// you can either use both the vector bucket name and the vector index name,
  /// or use the vector index Amazon Resource Name (ARN).
  ///
  /// For more information about limits, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-vectors-limitations.html">Limitations
  /// and restrictions</a> in the <i>Amazon S3 User Guide</i>.
  /// <note>
  /// When inserting vector data into your vector index, you must provide the
  /// vector data as <code>float32</code> (32-bit floating point) values. If you
  /// pass higher-precision values to an Amazon Web Services SDK, S3 Vectors
  /// converts the values to 32-bit floating point before storing them, and
  /// <code>GetVectors</code>, <code>ListVectors</code>, and
  /// <code>QueryVectors</code> operations return the float32 values. Different
  /// Amazon Web Services SDKs may have different default numeric types, so
  /// ensure your vectors are properly formatted as <code>float32</code> values
  /// regardless of which SDK you're using. For example, in Python, use
  /// <code>numpy.float32</code> or explicitly cast your values.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:PutVectors</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [KmsDisabledException].
  /// May throw [KmsInvalidKeyUsageException].
  /// May throw [KmsInvalidStateException].
  /// May throw [KmsNotFoundException].
  /// May throw [NotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [vectors] :
  /// The vectors to add to a vector index. The number of vectors in a single
  /// request must not exceed the resource capacity, otherwise the request will
  /// be rejected with the error <code>ServiceUnavailableException</code> with
  /// the error message "Currently unable to handle the request".
  ///
  /// Parameter [indexArn] :
  /// The ARN of the vector index where you want to write vectors.
  ///
  /// Parameter [indexName] :
  /// The name of the vector index where you want to write vectors.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket that contains the vector index.
  Future<void> putVectors({
    required List<PutInputVector> vectors,
    String? indexArn,
    String? indexName,
    String? vectorBucketName,
  }) async {
    final $payload = <String, dynamic>{
      'vectors': vectors,
      if (indexArn != null) 'indexArn': indexArn,
      if (indexName != null) 'indexName': indexName,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutVectors',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Performs an approximate nearest neighbor search query in a vector index
  /// using a query vector. By default, it returns the keys of approximate
  /// nearest neighbors. You can optionally include the computed distance
  /// (between the query vector and each vector in the response), the vector
  /// data, and metadata of each vector in the response.
  ///
  /// To specify the vector index, you can either use both the vector bucket
  /// name and the vector index name, or use the vector index Amazon Resource
  /// Name (ARN).
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3vectors:QueryVectors</code> permission to use
  /// this operation. Additional permissions are required based on the request
  /// parameters you specify:
  ///
  /// <ul>
  /// <li>
  /// With only <code>s3vectors:QueryVectors</code> permission, you can retrieve
  /// vector keys of approximate nearest neighbors and computed distances
  /// between these vectors. This permission is sufficient only when you don't
  /// set any metadata filters and don't request vector data or metadata (by
  /// keeping the <code>returnMetadata</code> parameter set to
  /// <code>false</code> or not specified).
  /// </li>
  /// <li>
  /// If you specify a metadata filter or set <code>returnMetadata</code> to
  /// true, you must have both <code>s3vectors:QueryVectors</code> and
  /// <code>s3vectors:GetVectors</code> permissions. The request fails with a
  /// <code>403 Forbidden error</code> if you request metadata filtering, vector
  /// data, or metadata without the <code>s3vectors:GetVectors</code>
  /// permission.
  /// </li>
  /// </ul> </dd> </dl>
  ///
  /// May throw [KmsDisabledException].
  /// May throw [KmsInvalidKeyUsageException].
  /// May throw [KmsInvalidStateException].
  /// May throw [KmsNotFoundException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [queryVector] :
  /// The query vector. Ensure that the query vector has the same dimension as
  /// the dimension of the vector index that's being queried. For example, if
  /// your vector index contains vectors with 384 dimensions, your query vector
  /// must also have 384 dimensions.
  ///
  /// Parameter [topK] :
  /// The number of results to return for each query.
  ///
  /// Parameter [filter] :
  /// Metadata filter to apply during the query. For more information about
  /// metadata keys, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-vectors-metadata-filtering.html">Metadata
  /// filtering</a> in the <i>Amazon S3 User Guide</i>.
  ///
  /// Parameter [indexArn] :
  /// The ARN of the vector index that you want to query.
  ///
  /// Parameter [indexName] :
  /// The name of the vector index that you want to query.
  ///
  /// Parameter [returnDistance] :
  /// Indicates whether to include the computed distance in the response. The
  /// default value is <code>false</code>.
  ///
  /// Parameter [returnMetadata] :
  /// Indicates whether to include metadata in the response. The default value
  /// is <code>false</code>.
  ///
  /// Parameter [vectorBucketName] :
  /// The name of the vector bucket that contains the vector index.
  Future<QueryVectorsOutput> queryVectors({
    required VectorData queryVector,
    required int topK,
    Document? filter,
    String? indexArn,
    String? indexName,
    bool? returnDistance,
    bool? returnMetadata,
    String? vectorBucketName,
  }) async {
    _s.validateNumRange(
      'topK',
      topK,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'queryVector': queryVector,
      'topK': topK,
      if (filter != null) 'filter': filter,
      if (indexArn != null) 'indexArn': indexArn,
      if (indexName != null) 'indexName': indexName,
      if (returnDistance != null) 'returnDistance': returnDistance,
      if (returnMetadata != null) 'returnMetadata': returnMetadata,
      if (vectorBucketName != null) 'vectorBucketName': vectorBucketName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/QueryVectors',
      exceptionFnMap: _exceptionFns,
    );
    return QueryVectorsOutput.fromJson(response);
  }
}

/// @nodoc
class ListTagsForResourceOutput {
  /// The user-defined tags that are applied to the S3 Vectors resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html">Tagging
  /// for cost allocation or attribute-based access control (ABAC)</a>.
  final Map<String, String> tags;

  ListTagsForResourceOutput({
    required this.tags,
  });

  factory ListTagsForResourceOutput.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceOutput(
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

/// @nodoc
class TagResourceOutput {
  TagResourceOutput();

  factory TagResourceOutput.fromJson(Map<String, dynamic> _) {
    return TagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceOutput {
  UntagResourceOutput();

  factory UntagResourceOutput.fromJson(Map<String, dynamic> _) {
    return UntagResourceOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateVectorBucketOutput {
  /// The Amazon Resource Name (ARN) of the newly created vector bucket.
  final String vectorBucketArn;

  CreateVectorBucketOutput({
    required this.vectorBucketArn,
  });

  factory CreateVectorBucketOutput.fromJson(Map<String, dynamic> json) {
    return CreateVectorBucketOutput(
      vectorBucketArn: (json['vectorBucketArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final vectorBucketArn = this.vectorBucketArn;
    return {
      'vectorBucketArn': vectorBucketArn,
    };
  }
}

/// @nodoc
class DeleteVectorBucketOutput {
  DeleteVectorBucketOutput();

  factory DeleteVectorBucketOutput.fromJson(Map<String, dynamic> _) {
    return DeleteVectorBucketOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteVectorBucketPolicyOutput {
  DeleteVectorBucketPolicyOutput();

  factory DeleteVectorBucketPolicyOutput.fromJson(Map<String, dynamic> _) {
    return DeleteVectorBucketPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetVectorBucketOutput {
  /// The attributes of the vector bucket.
  final VectorBucket vectorBucket;

  GetVectorBucketOutput({
    required this.vectorBucket,
  });

  factory GetVectorBucketOutput.fromJson(Map<String, dynamic> json) {
    return GetVectorBucketOutput(
      vectorBucket: VectorBucket.fromJson(
          (json['vectorBucket'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final vectorBucket = this.vectorBucket;
    return {
      'vectorBucket': vectorBucket,
    };
  }
}

/// @nodoc
class GetVectorBucketPolicyOutput {
  /// The <code>JSON</code> that defines the policy.
  final String? policy;

  GetVectorBucketPolicyOutput({
    this.policy,
  });

  factory GetVectorBucketPolicyOutput.fromJson(Map<String, dynamic> json) {
    return GetVectorBucketPolicyOutput(
      policy: json['policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'policy': policy,
    };
  }
}

/// @nodoc
class ListVectorBucketsOutput {
  /// The list of vector buckets owned by the requester.
  final List<VectorBucketSummary> vectorBuckets;

  /// The element is included in the response when there are more buckets to be
  /// listed with pagination.
  final String? nextToken;

  ListVectorBucketsOutput({
    required this.vectorBuckets,
    this.nextToken,
  });

  factory ListVectorBucketsOutput.fromJson(Map<String, dynamic> json) {
    return ListVectorBucketsOutput(
      vectorBuckets: ((json['vectorBuckets'] as List?) ?? const [])
          .nonNulls
          .map((e) => VectorBucketSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vectorBuckets = this.vectorBuckets;
    final nextToken = this.nextToken;
    return {
      'vectorBuckets': vectorBuckets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class PutVectorBucketPolicyOutput {
  PutVectorBucketPolicyOutput();

  factory PutVectorBucketPolicyOutput.fromJson(Map<String, dynamic> _) {
    return PutVectorBucketPolicyOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateIndexOutput {
  /// The Amazon Resource Name (ARN) of the newly created vector index.
  final String indexArn;

  CreateIndexOutput({
    required this.indexArn,
  });

  factory CreateIndexOutput.fromJson(Map<String, dynamic> json) {
    return CreateIndexOutput(
      indexArn: (json['indexArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final indexArn = this.indexArn;
    return {
      'indexArn': indexArn,
    };
  }
}

/// @nodoc
class DeleteIndexOutput {
  DeleteIndexOutput();

  factory DeleteIndexOutput.fromJson(Map<String, dynamic> _) {
    return DeleteIndexOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetIndexOutput {
  /// The attributes of the vector index.
  final Index index;

  GetIndexOutput({
    required this.index,
  });

  factory GetIndexOutput.fromJson(Map<String, dynamic> json) {
    return GetIndexOutput(
      index: Index.fromJson((json['index'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final index = this.index;
    return {
      'index': index,
    };
  }
}

/// @nodoc
class ListIndexesOutput {
  /// The attributes of the vector indexes
  final List<IndexSummary> indexes;

  /// The next pagination token.
  final String? nextToken;

  ListIndexesOutput({
    required this.indexes,
    this.nextToken,
  });

  factory ListIndexesOutput.fromJson(Map<String, dynamic> json) {
    return ListIndexesOutput(
      indexes: ((json['indexes'] as List?) ?? const [])
          .nonNulls
          .map((e) => IndexSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexes = this.indexes;
    final nextToken = this.nextToken;
    return {
      'indexes': indexes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class DeleteVectorsOutput {
  DeleteVectorsOutput();

  factory DeleteVectorsOutput.fromJson(Map<String, dynamic> _) {
    return DeleteVectorsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetVectorsOutput {
  /// The attributes of the vectors.
  final List<GetOutputVector> vectors;

  GetVectorsOutput({
    required this.vectors,
  });

  factory GetVectorsOutput.fromJson(Map<String, dynamic> json) {
    return GetVectorsOutput(
      vectors: ((json['vectors'] as List?) ?? const [])
          .nonNulls
          .map((e) => GetOutputVector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final vectors = this.vectors;
    return {
      'vectors': vectors,
    };
  }
}

/// @nodoc
class ListVectorsOutput {
  /// Vectors in the current segment.
  final List<ListOutputVector> vectors;

  /// Pagination token to be used in the subsequent request. The field is empty if
  /// no further pagination is required.
  final String? nextToken;

  ListVectorsOutput({
    required this.vectors,
    this.nextToken,
  });

  factory ListVectorsOutput.fromJson(Map<String, dynamic> json) {
    return ListVectorsOutput(
      vectors: ((json['vectors'] as List?) ?? const [])
          .nonNulls
          .map((e) => ListOutputVector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vectors = this.vectors;
    final nextToken = this.nextToken;
    return {
      'vectors': vectors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class PutVectorsOutput {
  PutVectorsOutput();

  factory PutVectorsOutput.fromJson(Map<String, dynamic> _) {
    return PutVectorsOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class QueryVectorsOutput {
  /// The distance metric that was used for the similarity search calculation.
  /// This is the same distance metric that was configured for the vector index
  /// when it was created.
  final DistanceMetric distanceMetric;

  /// The vectors in the approximate nearest neighbor search.
  final List<QueryOutputVector> vectors;

  QueryVectorsOutput({
    required this.distanceMetric,
    required this.vectors,
  });

  factory QueryVectorsOutput.fromJson(Map<String, dynamic> json) {
    return QueryVectorsOutput(
      distanceMetric:
          DistanceMetric.fromString((json['distanceMetric'] as String?) ?? ''),
      vectors: ((json['vectors'] as List?) ?? const [])
          .nonNulls
          .map((e) => QueryOutputVector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final distanceMetric = this.distanceMetric;
    final vectors = this.vectors;
    return {
      'distanceMetric': distanceMetric.value,
      'vectors': vectors,
    };
  }
}

/// @nodoc
class DistanceMetric {
  static const euclidean = DistanceMetric._('euclidean');
  static const cosine = DistanceMetric._('cosine');

  final String value;

  const DistanceMetric._(this.value);

  static const values = [euclidean, cosine];

  static DistanceMetric fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DistanceMetric._(value));

  @override
  bool operator ==(other) => other is DistanceMetric && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The attributes of a vector in the approximate nearest neighbor search.
///
/// @nodoc
class QueryOutputVector {
  /// The key of the vector in the approximate nearest neighbor search.
  final String key;

  /// The measure of similarity between the vector in the response and the query
  /// vector.
  final double? distance;

  /// The metadata associated with the vector, if requested.
  final Object? metadata;

  QueryOutputVector({
    required this.key,
    this.distance,
    this.metadata,
  });

  factory QueryOutputVector.fromJson(Map<String, dynamic> json) {
    return QueryOutputVector(
      key: (json['key'] as String?) ?? '',
      distance: json['distance'] as double?,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final distance = this.distance;
    final metadata = this.metadata;
    return {
      'key': key,
      if (distance != null) 'distance': distance,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// The vector data in different formats.
///
/// @nodoc
class VectorData {
  /// The vector data as 32-bit floating point numbers. The number of elements in
  /// this array must exactly match the dimension of the vector index where the
  /// operation is being performed.
  final List<double>? float32;

  VectorData({
    this.float32,
  });

  factory VectorData.fromJson(Map<String, dynamic> json) {
    return VectorData(
      float32:
          (json['float32'] as List?)?.nonNulls.map((e) => e as double).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final float32 = this.float32;
    return {
      if (float32 != null) 'float32': float32,
    };
  }
}

/// The attributes of a vector to add to a vector index.
///
/// @nodoc
class PutInputVector {
  /// The vector data of the vector.
  ///
  /// Vector dimensions must match the dimension count that's configured for the
  /// vector index.
  ///
  /// <ul>
  /// <li>
  /// For the <code>cosine</code> distance metric, zero vectors (vectors
  /// containing all zeros) aren't allowed.
  /// </li>
  /// <li>
  /// For both <code>cosine</code> and <code>euclidean</code> distance metrics,
  /// vector data must contain only valid floating-point values. Invalid values
  /// such as NaN (Not a Number) or Infinity aren't allowed.
  /// </li>
  /// </ul>
  final VectorData data;

  /// The name of the vector. The key uniquely identifies the vector in a vector
  /// index.
  final String key;

  /// Metadata about the vector. All metadata entries undergo validation to ensure
  /// they meet the format requirements for size and data types.
  final Object? metadata;

  PutInputVector({
    required this.data,
    required this.key,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    final data = this.data;
    final key = this.key;
    final metadata = this.metadata;
    return {
      'data': data,
      'key': key,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// The attributes of a vector returned by the <code>ListVectors</code>
/// operation.
///
/// @nodoc
class ListOutputVector {
  /// The name of the vector.
  final String key;

  /// The vector data of the vector.
  final VectorData? data;

  /// Metadata about the vector.
  final Object? metadata;

  ListOutputVector({
    required this.key,
    this.data,
    this.metadata,
  });

  factory ListOutputVector.fromJson(Map<String, dynamic> json) {
    return ListOutputVector(
      key: (json['key'] as String?) ?? '',
      data: json['data'] != null
          ? VectorData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final data = this.data;
    final metadata = this.metadata;
    return {
      'key': key,
      if (data != null) 'data': data,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// The attributes of a vector returned by the <code>GetVectors</code>
/// operation.
///
/// @nodoc
class GetOutputVector {
  /// The name of the vector.
  final String key;

  /// The vector data of the vector.
  final VectorData? data;

  /// Metadata about the vector.
  final Object? metadata;

  GetOutputVector({
    required this.key,
    this.data,
    this.metadata,
  });

  factory GetOutputVector.fromJson(Map<String, dynamic> json) {
    return GetOutputVector(
      key: (json['key'] as String?) ?? '',
      data: json['data'] != null
          ? VectorData.fromJson(json['data'] as Map<String, dynamic>)
          : null,
      metadata: json['metadata'],
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final data = this.data;
    final metadata = this.metadata;
    return {
      'key': key,
      if (data != null) 'data': data,
      if (metadata != null) 'metadata': metadata,
    };
  }
}

/// Summary information about a vector index.
///
/// @nodoc
class IndexSummary {
  /// Date and time when the vector index was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the vector index.
  final String indexArn;

  /// The name of the vector index.
  final String indexName;

  /// The name of the vector bucket that contains the vector index.
  final String vectorBucketName;

  IndexSummary({
    required this.creationTime,
    required this.indexArn,
    required this.indexName,
    required this.vectorBucketName,
  });

  factory IndexSummary.fromJson(Map<String, dynamic> json) {
    return IndexSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      indexArn: (json['indexArn'] as String?) ?? '',
      indexName: (json['indexName'] as String?) ?? '',
      vectorBucketName: (json['vectorBucketName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final vectorBucketName = this.vectorBucketName;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'indexArn': indexArn,
      'indexName': indexName,
      'vectorBucketName': vectorBucketName,
    };
  }
}

/// The attributes of a vector index.
///
/// @nodoc
class Index {
  /// Date and time when the vector index was created.
  final DateTime creationTime;

  /// The data type of the vectors inserted into the vector index.
  final DataType dataType;

  /// The number of values in the vectors that are inserted into the vector index.
  final int dimension;

  /// The distance metric to be used for similarity search.
  final DistanceMetric distanceMetric;

  /// The Amazon Resource Name (ARN) of the vector index.
  final String indexArn;

  /// The name of the vector index.
  final String indexName;

  /// The name of the vector bucket that contains the vector index.
  final String vectorBucketName;

  /// The encryption configuration for a vector index. By default, if you don't
  /// specify, all new vectors in the vector index will use the encryption
  /// configuration of the vector bucket.
  final EncryptionConfiguration? encryptionConfiguration;

  /// The metadata configuration for the vector index.
  final MetadataConfiguration? metadataConfiguration;

  Index({
    required this.creationTime,
    required this.dataType,
    required this.dimension,
    required this.distanceMetric,
    required this.indexArn,
    required this.indexName,
    required this.vectorBucketName,
    this.encryptionConfiguration,
    this.metadataConfiguration,
  });

  factory Index.fromJson(Map<String, dynamic> json) {
    return Index(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      dataType: DataType.fromString((json['dataType'] as String?) ?? ''),
      dimension: (json['dimension'] as int?) ?? 0,
      distanceMetric:
          DistanceMetric.fromString((json['distanceMetric'] as String?) ?? ''),
      indexArn: (json['indexArn'] as String?) ?? '',
      indexName: (json['indexName'] as String?) ?? '',
      vectorBucketName: (json['vectorBucketName'] as String?) ?? '',
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
      metadataConfiguration: json['metadataConfiguration'] != null
          ? MetadataConfiguration.fromJson(
              json['metadataConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final dataType = this.dataType;
    final dimension = this.dimension;
    final distanceMetric = this.distanceMetric;
    final indexArn = this.indexArn;
    final indexName = this.indexName;
    final vectorBucketName = this.vectorBucketName;
    final encryptionConfiguration = this.encryptionConfiguration;
    final metadataConfiguration = this.metadataConfiguration;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'dataType': dataType.value,
      'dimension': dimension,
      'distanceMetric': distanceMetric.value,
      'indexArn': indexArn,
      'indexName': indexName,
      'vectorBucketName': vectorBucketName,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (metadataConfiguration != null)
        'metadataConfiguration': metadataConfiguration,
    };
  }
}

/// @nodoc
class DataType {
  static const float32 = DataType._('float32');

  final String value;

  const DataType._(this.value);

  static const values = [float32];

  static DataType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DataType._(value));

  @override
  bool operator ==(other) => other is DataType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The metadata configuration for a vector index.
///
/// @nodoc
class MetadataConfiguration {
  /// Non-filterable metadata keys allow you to enrich vectors with additional
  /// context during storage and retrieval. Unlike default metadata keys, these
  /// keys can’t be used as query filters. Non-filterable metadata keys can be
  /// retrieved but can’t be searched, queried, or filtered. You can access
  /// non-filterable metadata keys of your vectors after finding the vectors. For
  /// more information about non-filterable metadata keys, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-vectors-vectors.html">Vectors</a>
  /// and <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-vectors-limitations.html">Limitations
  /// and restrictions</a> in the <i>Amazon S3 User Guide</i>.
  final List<String> nonFilterableMetadataKeys;

  MetadataConfiguration({
    required this.nonFilterableMetadataKeys,
  });

  factory MetadataConfiguration.fromJson(Map<String, dynamic> json) {
    return MetadataConfiguration(
      nonFilterableMetadataKeys:
          ((json['nonFilterableMetadataKeys'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nonFilterableMetadataKeys = this.nonFilterableMetadataKeys;
    return {
      'nonFilterableMetadataKeys': nonFilterableMetadataKeys,
    };
  }
}

/// The encryption configuration for a vector bucket or index. By default, if
/// you don't specify, all new vectors in Amazon S3 vector buckets use
/// server-side encryption with Amazon S3 managed keys (SSE-S3), specifically
/// <code>AES256</code>. You can optionally override bucket level encryption
/// settings, and set a specific encryption configuration for a vector index at
/// the time of index creation.
///
/// @nodoc
class EncryptionConfiguration {
  /// Amazon Web Services Key Management Service (KMS) customer managed key ID to
  /// use for the encryption configuration. This parameter is allowed if and only
  /// if <code>sseType</code> is set to <code>aws:kms</code>.
  ///
  /// To specify the KMS key, you must use the format of the KMS key Amazon
  /// Resource Name (ARN).
  ///
  /// For example, specify Key ARN in the following format:
  /// <code>arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>
  final String? kmsKeyArn;

  /// The server-side encryption type to use for the encryption configuration of
  /// the vector bucket. By default, if you don't specify, all new vectors in
  /// Amazon S3 vector buckets use server-side encryption with Amazon S3 managed
  /// keys (SSE-S3), specifically <code>AES256</code>.
  final SseType? sseType;

  EncryptionConfiguration({
    this.kmsKeyArn,
    this.sseType,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      kmsKeyArn: json['kmsKeyArn'] as String?,
      sseType: (json['sseType'] as String?)?.let(SseType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyArn = this.kmsKeyArn;
    final sseType = this.sseType;
    return {
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (sseType != null) 'sseType': sseType.value,
    };
  }
}

/// @nodoc
class SseType {
  static const aes256 = SseType._('AES256');
  static const awsKms = SseType._('aws:kms');

  final String value;

  const SseType._(this.value);

  static const values = [aes256, awsKms];

  static SseType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SseType._(value));

  @override
  bool operator ==(other) => other is SseType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about a vector bucket.
///
/// @nodoc
class VectorBucketSummary {
  /// Date and time when the vector bucket was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the vector bucket.
  final String vectorBucketArn;

  /// The name of the vector bucket.
  final String vectorBucketName;

  VectorBucketSummary({
    required this.creationTime,
    required this.vectorBucketArn,
    required this.vectorBucketName,
  });

  factory VectorBucketSummary.fromJson(Map<String, dynamic> json) {
    return VectorBucketSummary(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      vectorBucketArn: (json['vectorBucketArn'] as String?) ?? '',
      vectorBucketName: (json['vectorBucketName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final vectorBucketArn = this.vectorBucketArn;
    final vectorBucketName = this.vectorBucketName;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'vectorBucketArn': vectorBucketArn,
      'vectorBucketName': vectorBucketName,
    };
  }
}

/// The attributes of a vector bucket.
///
/// @nodoc
class VectorBucket {
  /// Date and time when the vector bucket was created.
  final DateTime creationTime;

  /// The Amazon Resource Name (ARN) of the vector bucket.
  final String vectorBucketArn;

  /// The name of the vector bucket.
  final String vectorBucketName;

  /// The encryption configuration for the vector bucket.
  final EncryptionConfiguration? encryptionConfiguration;

  VectorBucket({
    required this.creationTime,
    required this.vectorBucketArn,
    required this.vectorBucketName,
    this.encryptionConfiguration,
  });

  factory VectorBucket.fromJson(Map<String, dynamic> json) {
    return VectorBucket(
      creationTime: nonNullableTimeStampFromJson(json['creationTime'] ?? 0),
      vectorBucketArn: (json['vectorBucketArn'] as String?) ?? '',
      vectorBucketName: (json['vectorBucketName'] as String?) ?? '',
      encryptionConfiguration: json['encryptionConfiguration'] != null
          ? EncryptionConfiguration.fromJson(
              json['encryptionConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final vectorBucketArn = this.vectorBucketArn;
    final vectorBucketName = this.vectorBucketName;
    final encryptionConfiguration = this.encryptionConfiguration;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'vectorBucketArn': vectorBucketArn,
      'vectorBucketName': vectorBucketName,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
    };
  }
}

/// @nodoc
class Document {
  Document();

  Map<String, dynamic> toJson() {
    return {};
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
class KmsDisabledException extends _s.GenericAwsException {
  KmsDisabledException({String? type, String? message})
      : super(type: type, code: 'KmsDisabledException', message: message);
}

/// @nodoc
class KmsInvalidKeyUsageException extends _s.GenericAwsException {
  KmsInvalidKeyUsageException({String? type, String? message})
      : super(
            type: type, code: 'KmsInvalidKeyUsageException', message: message);
}

/// @nodoc
class KmsInvalidStateException extends _s.GenericAwsException {
  KmsInvalidStateException({String? type, String? message})
      : super(type: type, code: 'KmsInvalidStateException', message: message);
}

/// @nodoc
class KmsNotFoundException extends _s.GenericAwsException {
  KmsNotFoundException({String? type, String? message})
      : super(type: type, code: 'KmsNotFoundException', message: message);
}

/// @nodoc
class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'KmsDisabledException': (type, message) =>
      KmsDisabledException(type: type, message: message),
  'KmsInvalidKeyUsageException': (type, message) =>
      KmsInvalidKeyUsageException(type: type, message: message),
  'KmsInvalidStateException': (type, message) =>
      KmsInvalidStateException(type: type, message: message),
  'KmsNotFoundException': (type, message) =>
      KmsNotFoundException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
};
