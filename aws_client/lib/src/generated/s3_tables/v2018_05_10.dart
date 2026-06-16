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

/// An Amazon S3 table represents a structured dataset consisting of tabular
/// data in <a href="https://parquet.apache.org/docs/">Apache Parquet</a> format
/// and related metadata. This data is stored inside an S3 table as a
/// subresource. All tables in a table bucket are stored in the <a
/// href="https://iceberg.apache.org/docs/latest/">Apache Iceberg</a> table
/// format. Through integration with the <a
/// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/glue/latest/dg/catalog-and-crawler.html">Amazon
/// Web Services Glue Data Catalog</a> you can interact with your tables using
/// Amazon Web Services analytics services, such as <a
/// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/athena/">Amazon
/// Athena</a> and <a
/// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/redshift/">Amazon
/// Redshift</a>. Amazon S3 manages maintenance of your tables through automatic
/// file compaction and snapshot management. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-buckets.html">Amazon
/// S3 table buckets</a>.
class S3Tables {
  final _s.RestJsonProtocol _protocol;
  S3Tables({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 's3tables',
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

  /// Lists all of the tags applied to a specified Amazon S3 Tables resource.
  /// Each tag is a label consisting of a key and value pair. Tags can help you
  /// organize, track costs for, and control access to resources.
  /// <note>
  /// For a list of S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// For tables and table buckets, you must have the
  /// <code>s3tables:ListTagsForResource</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 Tables resource that you
  /// want to list tags for. The tagged resource can be a table bucket or a
  /// table. For a list of all S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tag/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Applies one or more user-defined tags to an Amazon S3 Tables resource or
  /// updates existing tags. Each tag is a label consisting of a key and value
  /// pair. Tags can help you organize, track costs for, and control access to
  /// your resources. You can add up to 50 tags for each S3 resource.
  /// <note>
  /// For a list of S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// For tables and table buckets, you must have the
  /// <code>s3tables:TagResource</code> permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 Tables resource that
  /// you're applying tags to. The tagged resource can be a table bucket or a
  /// table. For a list of all S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  ///
  /// Parameter [tags] :
  /// The user-defined tag that you want to add to the specified S3 Tables
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
      requestUri: '/tag/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified user-defined tags from an Amazon S3 Tables resource.
  /// You can pass one or more tag keys.
  /// <note>
  /// For a list of S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  /// </note> <dl> <dt>Permissions</dt> <dd>
  /// For tables and table buckets, you must have the
  /// <code>s3tables:UntagResource</code> permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon S3 Tables resource that
  /// you're removing tags from. The tagged resource can be a table bucket or a
  /// table. For a list of all S3 resources that support tagging, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html#manage-tags">Managing
  /// tags for Amazon S3 resources</a>.
  ///
  /// Parameter [tagKeys] :
  /// The array of tag keys that you're removing from the S3 Tables resource.
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
      requestUri: '/tag/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a namespace. A namespace is a logical grouping of tables within
  /// your table bucket, which you can use to organize tables. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-namespace-create.html">Create
  /// a namespace</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:CreateNamespace</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [namespace] :
  /// A name for the namespace.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket to create the namespace
  /// in.
  Future<CreateNamespaceResponse> createNamespace({
    required List<String> namespace,
    required String tableBucketARN,
  }) async {
    final $payload = <String, dynamic>{
      'namespace': namespace,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/namespaces/${Uri.encodeComponent(tableBucketARN)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNamespaceResponse.fromJson(response);
  }

  /// Deletes a namespace. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-namespace-delete.html">Delete
  /// a namespace</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:DeleteNamespace</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [namespace] :
  /// The name of the namespace.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket associated with the
  /// namespace.
  Future<void> deleteNamespace({
    required String namespace,
    required String tableBucketARN,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/namespaces/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets details about a namespace. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-namespace.html">Table
  /// namespaces</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetNamespace</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [namespace] :
  /// The name of the namespace.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetNamespaceResponse> getNamespace({
    required String namespace,
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/namespaces/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNamespaceResponse.fromJson(response);
  }

  /// Lists the namespaces within a table bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-namespace.html">Table
  /// namespaces</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:ListNamespaces</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  ///
  /// Parameter [continuationToken] :
  /// <code>ContinuationToken</code> indicates to Amazon S3 that the list is
  /// being continued on this bucket with a token.
  /// <code>ContinuationToken</code> is obfuscated and is not a real key. You
  /// can use this <code>ContinuationToken</code> for pagination of the list
  /// results.
  ///
  /// Parameter [maxNamespaces] :
  /// The maximum number of namespaces to return in the list.
  ///
  /// Parameter [prefix] :
  /// The prefix of the namespaces.
  Future<ListNamespacesResponse> listNamespaces({
    required String tableBucketARN,
    String? continuationToken,
    int? maxNamespaces,
    String? prefix,
  }) async {
    _s.validateNumRange(
      'maxNamespaces',
      maxNamespaces,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (continuationToken != null) 'continuationToken': [continuationToken],
      if (maxNamespaces != null) 'maxNamespaces': [maxNamespaces.toString()],
      if (prefix != null) 'prefix': [prefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/namespaces/${Uri.encodeComponent(tableBucketARN)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNamespacesResponse.fromJson(response);
  }

  /// Deletes the encryption configuration for a table bucket.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:DeleteTableBucketEncryption</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<void> deleteTableBucketEncryption({
    required String tableBucketARN,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/encryption',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the encryption configuration for a table bucket.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableBucketEncryption</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableBucketEncryptionResponse> getTableBucketEncryption({
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/encryption',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableBucketEncryptionResponse.fromJson(response);
  }

  /// Sets the encryption configuration for a table bucket.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:PutTableBucketEncryption</code>
  /// permission to use this operation.
  /// <note>
  /// If you choose SSE-KMS encryption you must grant the S3 Tables maintenance
  /// principal access to your KMS key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-kms-permissions.html">Permissions
  /// requirements for S3 Tables SSE-KMS encryption</a> in the <i>Amazon Simple
  /// Storage Service User Guide</i>.
  /// </note> </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration to apply to the table bucket.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<void> putTableBucketEncryption({
    required EncryptionConfiguration encryptionConfiguration,
    required String tableBucketARN,
  }) async {
    final $payload = <String, dynamic>{
      'encryptionConfiguration': encryptionConfiguration,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/encryption',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a table bucket policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-bucket-policy.html#table-bucket-policy-delete">Deleting
  /// a table bucket policy</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:DeleteTableBucketPolicy</code> permission
  /// to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<void> deleteTableBucketPolicy({
    required String tableBucketARN,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets details about a table bucket policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-bucket-policy.html#table-bucket-policy-get">Viewing
  /// a table bucket policy</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableBucketPolicy</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableBucketPolicyResponse> getTableBucketPolicy({
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableBucketPolicyResponse.fromJson(response);
  }

  /// Creates a new table bucket policy or replaces an existing table bucket
  /// policy for a table bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-bucket-policy.html#table-bucket-policy-add">Adding
  /// a table bucket policy</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:PutTableBucketPolicy</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [resourcePolicy] :
  /// The <code>JSON</code> that defines the policy.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<void> putTableBucketPolicy({
    required String resourcePolicy,
    required String tableBucketARN,
  }) async {
    final $payload = <String, dynamic>{
      'resourcePolicy': resourcePolicy,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the replication configuration for a table bucket. After deletion,
  /// new table updates will no longer be replicated to destination buckets,
  /// though existing replicated tables will remain in destination buckets.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:DeleteTableBucketReplication</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  ///
  /// Parameter [versionToken] :
  /// A version token from a previous GetTableBucketReplication call. Use this
  /// token to ensure you're deleting the expected version of the configuration.
  Future<void> deleteTableBucketReplication({
    required String tableBucketARN,
    String? versionToken,
  }) async {
    final $query = <String, List<String>>{
      'tableBucketARN': [tableBucketARN],
      if (versionToken != null) 'versionToken': [versionToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/table-bucket-replication',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the replication configuration for a table bucket.This operation
  /// returns the IAM role, <code>versionToken</code>, and replication rules
  /// that define how tables in this bucket are replicated to other buckets.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableBucketReplication</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableBucketReplicationResponse> getTableBucketReplication({
    required String tableBucketARN,
  }) async {
    final $query = <String, List<String>>{
      'tableBucketARN': [tableBucketARN],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/table-bucket-replication',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTableBucketReplicationResponse.fromJson(response);
  }

  /// Creates or updates the replication configuration for a table bucket. This
  /// operation defines how tables in the source bucket are replicated to
  /// destination buckets. Replication helps ensure data availability and
  /// disaster recovery across regions or accounts.
  /// <dl> <dt>Permissions</dt> <dd>
  /// <ul>
  /// <li>
  /// You must have the <code>s3tables:PutTableBucketReplication</code>
  /// permission to use this operation. The IAM role specified in the
  /// configuration must have permissions to read from the source bucket and
  /// write permissions to all destination buckets.
  /// </li>
  /// <li>
  /// You must also have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>s3tables:GetTable</code> permission on the source table.
  /// </li>
  /// <li>
  /// <code>s3tables:ListTables</code> permission on the bucket containing the
  /// table.
  /// </li>
  /// <li>
  /// <code>s3tables:CreateTable</code> permission for the destination.
  /// </li>
  /// <li>
  /// <code>s3tables:CreateNamespace</code> permission for the destination.
  /// </li>
  /// <li>
  /// <code>s3tables:GetTableMaintenanceConfig</code> permission for the source
  /// bucket.
  /// </li>
  /// <li>
  /// <code>s3tables:PutTableMaintenanceConfig</code> permission for the
  /// destination bucket.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// You must have <code>iam:PassRole</code> permission with condition allowing
  /// roles to be passed to <code>replication.s3tables.amazonaws.com</code>.
  /// </li>
  /// </ul> </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [configuration] :
  /// The replication configuration to apply, including the IAM role and
  /// replication rules.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the source table bucket.
  ///
  /// Parameter [versionToken] :
  /// A version token from a previous GetTableBucketReplication call. Use this
  /// token to ensure you're updating the expected version of the configuration.
  Future<PutTableBucketReplicationResponse> putTableBucketReplication({
    required TableBucketReplicationConfiguration configuration,
    required String tableBucketARN,
    String? versionToken,
  }) async {
    final $query = <String, List<String>>{
      'tableBucketARN': [tableBucketARN],
      if (versionToken != null) 'versionToken': [versionToken],
    };
    final $payload = <String, dynamic>{
      'configuration': configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/table-bucket-replication',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutTableBucketReplicationResponse.fromJson(response);
  }

  /// Creates a table bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-buckets-create.html">Creating
  /// a table bucket</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// <ul>
  /// <li>
  /// You must have the <code>s3tables:CreateTableBucket</code> permission to
  /// use this operation.
  /// </li>
  /// <li>
  /// If you use this operation with the optional
  /// <code>encryptionConfiguration</code> parameter you must have the
  /// <code>s3tables:PutTableBucketEncryption</code> permission.
  /// </li>
  /// <li>
  /// If you use this operation with the <code>storageClassConfiguration</code>
  /// request parameter, you must have the
  /// <code>s3tables:PutTableBucketStorageClass</code> permission.
  /// </li>
  /// <li>
  /// To create a table bucket with tags, you must have the
  /// <code>s3tables:TagResource</code> permission in addition to
  /// <code>s3tables:CreateTableBucket</code> permission.
  /// </li>
  /// </ul> </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name for the table bucket.
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration to use for the table bucket. This
  /// configuration specifies the default encryption settings that will be
  /// applied to all tables created in this bucket unless overridden at the
  /// table level. The configuration includes the encryption algorithm and, if
  /// using SSE-KMS, the KMS key to use.
  ///
  /// Parameter [storageClassConfiguration] :
  /// The default storage class configuration for the table bucket. This
  /// configuration will be applied to all new tables created in this bucket
  /// unless overridden at the table level. If not specified, the service
  /// default storage class will be used.
  ///
  /// Parameter [tags] :
  /// A map of user-defined tags that you would like to apply to the table
  /// bucket that you are creating. A tag is a key-value pair that you apply to
  /// your resources. Tags can help you organize and control access to
  /// resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html">Tagging
  /// for cost allocation or attribute-based access control (ABAC)</a>.
  /// <note>
  /// You must have the <code>s3tables:TagResource</code> permission in addition
  /// to <code>s3tables:CreateTableBucket</code> permisson to create a table
  /// bucket with tags.
  /// </note>
  Future<CreateTableBucketResponse> createTableBucket({
    required String name,
    EncryptionConfiguration? encryptionConfiguration,
    StorageClassConfiguration? storageClassConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (storageClassConfiguration != null)
        'storageClassConfiguration': storageClassConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/buckets',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTableBucketResponse.fromJson(response);
  }

  /// Deletes a table bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-buckets-delete.html">Deleting
  /// a table bucket</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:DeleteTableBucket</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<void> deleteTableBucket({
    required String tableBucketARN,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the metrics configuration for a table bucket.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the
  /// <code>s3tables:DeleteTableBucketMetricsConfiguration</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<void> deleteTableBucketMetricsConfiguration({
    required String tableBucketARN,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/metrics',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets details on a table bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-buckets-details.html">Viewing
  /// details about an Amazon S3 table bucket</a> in the <i>Amazon Simple
  /// Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableBucket</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableBucketResponse> getTableBucket({
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableBucketResponse.fromJson(response);
  }

  /// Gets details about a maintenance configuration for a given table bucket.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-table-buckets-maintenance.html">Amazon
  /// S3 table bucket maintenance</a> in the <i>Amazon Simple Storage Service
  /// User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the
  /// <code>s3tables:GetTableBucketMaintenanceConfiguration</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket associated with the
  /// maintenance configuration.
  Future<GetTableBucketMaintenanceConfigurationResponse>
      getTableBucketMaintenanceConfiguration({
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/maintenance',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableBucketMaintenanceConfigurationResponse.fromJson(response);
  }

  /// Gets the metrics configuration for a table bucket.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableBucketMetricsConfiguration</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableBucketMetricsConfigurationResponse>
      getTableBucketMetricsConfiguration({
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/metrics',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableBucketMetricsConfigurationResponse.fromJson(response);
  }

  /// Retrieves the storage class configuration for a specific table. This
  /// allows you to view the storage class settings that apply to an individual
  /// table, which may differ from the table bucket's default configuration.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableBucketStorageClass</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableBucketStorageClassResponse> getTableBucketStorageClass({
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/buckets/${Uri.encodeComponent(tableBucketARN)}/storage-class',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableBucketStorageClassResponse.fromJson(response);
  }

  /// Lists table buckets for your account. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-buckets.html">S3
  /// Table buckets</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:ListTableBuckets</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [continuationToken] :
  /// <code>ContinuationToken</code> indicates to Amazon S3 that the list is
  /// being continued on this bucket with a token.
  /// <code>ContinuationToken</code> is obfuscated and is not a real key. You
  /// can use this <code>ContinuationToken</code> for pagination of the list
  /// results.
  ///
  /// Parameter [maxBuckets] :
  /// The maximum number of table buckets to return in the list.
  ///
  /// Parameter [prefix] :
  /// The prefix of the table buckets.
  ///
  /// Parameter [type] :
  /// The type of table buckets to filter by in the list.
  Future<ListTableBucketsResponse> listTableBuckets({
    String? continuationToken,
    int? maxBuckets,
    String? prefix,
    TableBucketType? type,
  }) async {
    _s.validateNumRange(
      'maxBuckets',
      maxBuckets,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (continuationToken != null) 'continuationToken': [continuationToken],
      if (maxBuckets != null) 'maxBuckets': [maxBuckets.toString()],
      if (prefix != null) 'prefix': [prefix],
      if (type != null) 'type': [type.value],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/buckets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTableBucketsResponse.fromJson(response);
  }

  /// Creates a new maintenance configuration or replaces an existing
  /// maintenance configuration for a table bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-table-buckets-maintenance.html">Amazon
  /// S3 table bucket maintenance</a> in the <i>Amazon Simple Storage Service
  /// User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the
  /// <code>s3tables:PutTableBucketMaintenanceConfiguration</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket associated with the
  /// maintenance configuration.
  ///
  /// Parameter [type] :
  /// The type of the maintenance configuration.
  ///
  /// Parameter [value] :
  /// Defines the values of the maintenance configuration for the table bucket.
  Future<void> putTableBucketMaintenanceConfiguration({
    required String tableBucketARN,
    required TableBucketMaintenanceType type,
    required TableBucketMaintenanceConfigurationValue value,
  }) async {
    final $payload = <String, dynamic>{
      'value': value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/buckets/${Uri.encodeComponent(tableBucketARN)}/maintenance/${Uri.encodeComponent(type.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the metrics configuration for a table bucket.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:PutTableBucketMetricsConfiguration</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<void> putTableBucketMetricsConfiguration({
    required String tableBucketARN,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/buckets/${Uri.encodeComponent(tableBucketARN)}/metrics',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets or updates the storage class configuration for a table bucket. This
  /// configuration serves as the default storage class for all new tables
  /// created in the bucket, allowing you to optimize storage costs at the
  /// bucket level.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:PutTableBucketStorageClass</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [storageClassConfiguration] :
  /// The storage class configuration to apply to the table bucket. This
  /// configuration will serve as the default for new tables created in this
  /// bucket.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<void> putTableBucketStorageClass({
    required StorageClassConfiguration storageClassConfiguration,
    required String tableBucketARN,
  }) async {
    final $payload = <String, dynamic>{
      'storageClassConfiguration': storageClassConfiguration,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/buckets/${Uri.encodeComponent(tableBucketARN)}/storage-class',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the encryption configuration for a table.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableEncryption</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket containing the table.
  Future<GetTableEncryptionResponse> getTableEncryption({
    required String name,
    required String namespace,
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/encryption',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableEncryptionResponse.fromJson(response);
  }

  /// Deletes a table policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-table-policy.html#table-policy-delete">Deleting
  /// a table policy</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:DeleteTablePolicy</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The table name.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket that contains the
  /// table.
  Future<void> deleteTablePolicy({
    required String name,
    required String namespace,
    required String tableBucketARN,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets details about a table policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-table-policy.html#table-policy-get">Viewing
  /// a table policy</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTablePolicy</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket that contains the
  /// table.
  Future<GetTablePolicyResponse> getTablePolicy({
    required String name,
    required String namespace,
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetTablePolicyResponse.fromJson(response);
  }

  /// Creates a new table policy or replaces an existing table policy for a
  /// table. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-table-policy.html#table-policy-add">Adding
  /// a table policy</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:PutTablePolicy</code> permission to use
  /// this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the table.
  ///
  /// Parameter [resourcePolicy] :
  /// The <code>JSON</code> that defines the policy.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket that contains the
  /// table.
  Future<void> putTablePolicy({
    required String name,
    required String namespace,
    required String resourcePolicy,
    required String tableBucketARN,
  }) async {
    final $payload = <String, dynamic>{
      'resourcePolicy': resourcePolicy,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the replication configuration for a specific table. After
  /// deletion, new updates to this table will no longer be replicated to
  /// destination tables, though existing replicated copies will remain in
  /// destination buckets.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:DeleteTableReplication</code> permission
  /// to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) of the table.
  ///
  /// Parameter [versionToken] :
  /// A version token from a previous GetTableReplication call. Use this token
  /// to ensure you're deleting the expected version of the configuration.
  Future<void> deleteTableReplication({
    required String tableArn,
    required String versionToken,
  }) async {
    final $query = <String, List<String>>{
      'tableArn': [tableArn],
      'versionToken': [versionToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/table-replication',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the replication configuration for a specific table.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableReplication</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) of the table.
  Future<GetTableReplicationResponse> getTableReplication({
    required String tableArn,
  }) async {
    final $query = <String, List<String>>{
      'tableArn': [tableArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/table-replication',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTableReplicationResponse.fromJson(response);
  }

  /// Retrieves the replication status for a table, including the status of
  /// replication to each destination. This operation provides visibility into
  /// replication health and progress.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableReplicationStatus</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) of the table.
  Future<GetTableReplicationStatusResponse> getTableReplicationStatus({
    required String tableArn,
  }) async {
    final $query = <String, List<String>>{
      'tableArn': [tableArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/replication-status',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTableReplicationStatusResponse.fromJson(response);
  }

  /// Creates or updates the replication configuration for a specific table.
  /// This operation allows you to define table-level replication independently
  /// of bucket-level replication, providing granular control over which tables
  /// are replicated and where.
  /// <dl> <dt>Permissions</dt> <dd>
  /// <ul>
  /// <li>
  /// You must have the <code>s3tables:PutTableReplication</code> permission to
  /// use this operation. The IAM role specified in the configuration must have
  /// permissions to read from the source table and write to all destination
  /// tables.
  /// </li>
  /// <li>
  /// You must also have the following permissions:
  ///
  /// <ul>
  /// <li>
  /// <code>s3tables:GetTable</code> permission on the source table being
  /// replicated.
  /// </li>
  /// <li>
  /// <code>s3tables:CreateTable</code> permission for the destination.
  /// </li>
  /// <li>
  /// <code>s3tables:CreateNamespace</code> permission for the destination.
  /// </li>
  /// <li>
  /// <code>s3tables:GetTableMaintenanceConfig</code> permission for the source
  /// table.
  /// </li>
  /// <li>
  /// <code>s3tables:PutTableMaintenanceConfig</code> permission for the
  /// destination table.
  /// </li>
  /// </ul> </li>
  /// <li>
  /// You must have <code>iam:PassRole</code> permission with condition allowing
  /// roles to be passed to <code>replication.s3tables.amazonaws.com</code>.
  /// </li>
  /// </ul> </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [configuration] :
  /// The replication configuration to apply to the table, including the IAM
  /// role and replication rules.
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) of the source table.
  ///
  /// Parameter [versionToken] :
  /// A version token from a previous GetTableReplication call. Use this token
  /// to ensure you're updating the expected version of the configuration.
  Future<PutTableReplicationResponse> putTableReplication({
    required TableReplicationConfiguration configuration,
    required String tableArn,
    String? versionToken,
  }) async {
    final $query = <String, List<String>>{
      'tableArn': [tableArn],
      if (versionToken != null) 'versionToken': [versionToken],
    };
    final $payload = <String, dynamic>{
      'configuration': configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/table-replication',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PutTableReplicationResponse.fromJson(response);
  }

  /// Creates a new table associated with the given namespace in a table bucket.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-create.html">Creating
  /// an Amazon S3 table</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// <ul>
  /// <li>
  /// You must have the <code>s3tables:CreateTable</code> permission to use this
  /// operation.
  /// </li>
  /// <li>
  /// If you use this operation with the optional <code>metadata</code> request
  /// parameter you must have the <code>s3tables:PutTableData</code> permission.
  /// </li>
  /// <li>
  /// If you use this operation with the optional
  /// <code>encryptionConfiguration</code> request parameter you must have the
  /// <code>s3tables:PutTableEncryption</code> permission.
  /// </li>
  /// <li>
  /// If you use this operation with the <code>storageClassConfiguration</code>
  /// request parameter, you must have the
  /// <code>s3tables:PutTableStorageClass</code> permission.
  /// </li>
  /// <li>
  /// To create a table with tags, you must have the
  /// <code>s3tables:TagResource</code> permission in addition to
  /// <code>s3tables:CreateTable</code> permission.
  /// </li>
  /// </ul> <note>
  /// Additionally, If you choose SSE-KMS encryption you must grant the S3
  /// Tables maintenance principal access to your KMS key. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-kms-permissions.html">Permissions
  /// requirements for S3 Tables SSE-KMS encryption</a>.
  /// </note> </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [format] :
  /// The format for the table.
  ///
  /// Parameter [name] :
  /// The name for the table.
  ///
  /// Parameter [namespace] :
  /// The namespace to associated with the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket to create the table in.
  ///
  /// Parameter [encryptionConfiguration] :
  /// The encryption configuration to use for the table. This configuration
  /// specifies the encryption algorithm and, if using SSE-KMS, the KMS key to
  /// use for encrypting the table.
  /// <note>
  /// If you choose SSE-KMS encryption you must grant the S3 Tables maintenance
  /// principal access to your KMS key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-kms-permissions.html">Permissions
  /// requirements for S3 Tables SSE-KMS encryption</a>.
  /// </note>
  ///
  /// Parameter [metadata] :
  /// The metadata for the table.
  ///
  /// Parameter [storageClassConfiguration] :
  /// The storage class configuration for the table. If not specified, the table
  /// inherits the storage class configuration from its table bucket. Specify
  /// this parameter to override the bucket's default storage class for this
  /// table.
  ///
  /// Parameter [tags] :
  /// A map of user-defined tags that you would like to apply to the table that
  /// you are creating. A tag is a key-value pair that you apply to your
  /// resources. Tags can help you organize, track costs for, and control access
  /// to resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html">Tagging
  /// for cost allocation or attribute-based access control (ABAC)</a>.
  /// <note>
  /// You must have the <code>s3tables:TagResource</code> permission in addition
  /// to <code>s3tables:CreateTable</code> permission to create a table with
  /// tags.
  /// </note>
  Future<CreateTableResponse> createTable({
    required OpenTableFormat format,
    required String name,
    required String namespace,
    required String tableBucketARN,
    EncryptionConfiguration? encryptionConfiguration,
    TableMetadata? metadata,
    StorageClassConfiguration? storageClassConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'format': format.value,
      'name': name,
      if (encryptionConfiguration != null)
        'encryptionConfiguration': encryptionConfiguration,
      if (metadata != null) 'metadata': metadata,
      if (storageClassConfiguration != null)
        'storageClassConfiguration': storageClassConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateTableResponse.fromJson(response);
  }

  /// Deletes a table. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-delete.html">Deleting
  /// an Amazon S3 table</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:DeleteTable</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket that contains the
  /// table.
  ///
  /// Parameter [versionToken] :
  /// The version token of the table.
  Future<void> deleteTable({
    required String name,
    required String namespace,
    required String tableBucketARN,
    String? versionToken,
  }) async {
    final $query = <String, List<String>>{
      if (versionToken != null) 'versionToken': [versionToken],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets details about a table. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-tables.html">S3
  /// Tables</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTable</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The name of the namespace the table is associated with.
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) of the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket associated with the
  /// table.
  Future<GetTableResponse> getTable({
    String? name,
    String? namespace,
    String? tableArn,
    String? tableBucketARN,
  }) async {
    final $query = <String, List<String>>{
      if (name != null) 'name': [name],
      if (namespace != null) 'namespace': [namespace],
      if (tableArn != null) 'tableArn': [tableArn],
      if (tableBucketARN != null) 'tableBucketARN': [tableBucketARN],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/get-table',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTableResponse.fromJson(response);
  }

  /// Gets details about the maintenance configuration of a table. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-maintenance.html">S3
  /// Tables maintenance</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// <ul>
  /// <li>
  /// You must have the <code>s3tables:GetTableMaintenanceConfiguration</code>
  /// permission to use this operation.
  /// </li>
  /// <li>
  /// You must have the <code>s3tables:GetTableData</code> permission to use set
  /// the compaction strategy to <code>sort</code> or <code>zorder</code>.
  /// </li>
  /// </ul> </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableMaintenanceConfigurationResponse>
      getTableMaintenanceConfiguration({
    required String name,
    required String namespace,
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/maintenance',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableMaintenanceConfigurationResponse.fromJson(response);
  }

  /// Gets the status of a maintenance job for a table. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-maintenance.html">S3
  /// Tables maintenance</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableMaintenanceJobStatus</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table containing the maintenance job status you want to
  /// check.
  ///
  /// Parameter [namespace] :
  /// The name of the namespace the table is associated with.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableMaintenanceJobStatusResponse> getTableMaintenanceJobStatus({
    required String name,
    required String namespace,
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/maintenance-job-status',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableMaintenanceJobStatusResponse.fromJson(response);
  }

  /// Gets the location of the table metadata.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableMetadataLocation</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace of the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  Future<GetTableMetadataLocationResponse> getTableMetadataLocation({
    required String name,
    required String namespace,
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/metadata-location',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableMetadataLocationResponse.fromJson(response);
  }

  /// Retrieves the expiration configuration settings for records in a table,
  /// and the status of the configuration. If the status of the configuration is
  /// <code>enabled</code>, records expire and are automatically removed from
  /// the table after the specified number of days.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the
  /// <code>s3tables:GetTableRecordExpirationConfiguration</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [MethodNotAllowedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) of the table.
  Future<GetTableRecordExpirationConfigurationResponse>
      getTableRecordExpirationConfiguration({
    required String tableArn,
  }) async {
    final $query = <String, List<String>>{
      'tableArn': [tableArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/table-record-expiration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTableRecordExpirationConfigurationResponse.fromJson(response);
  }

  /// Retrieves the status, metrics, and details of the latest record expiration
  /// job for a table. This includes when the job ran, and whether it succeeded
  /// or failed. If the job ran successfully, this also includes statistics
  /// about the records that were removed.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableRecordExpirationJobStatus</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [MethodNotAllowedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) of the table.
  Future<GetTableRecordExpirationJobStatusResponse>
      getTableRecordExpirationJobStatus({
    required String tableArn,
  }) async {
    final $query = <String, List<String>>{
      'tableArn': [tableArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/table-record-expiration-job-status',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetTableRecordExpirationJobStatusResponse.fromJson(response);
  }

  /// Retrieves the storage class configuration for a specific table. This
  /// allows you to view the storage class settings that apply to an individual
  /// table, which may differ from the table bucket's default configuration.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:GetTableStorageClass</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket that contains the
  /// table.
  Future<GetTableStorageClassResponse> getTableStorageClass({
    required String name,
    required String namespace,
    required String tableBucketARN,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/storage-class',
      exceptionFnMap: _exceptionFns,
    );
    return GetTableStorageClassResponse.fromJson(response);
  }

  /// List tables in the given table bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-tables.html">S3
  /// Tables</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:ListTables</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon resource Name (ARN) of the table bucket.
  ///
  /// Parameter [continuationToken] :
  /// <code>ContinuationToken</code> indicates to Amazon S3 that the list is
  /// being continued on this bucket with a token.
  /// <code>ContinuationToken</code> is obfuscated and is not a real key. You
  /// can use this <code>ContinuationToken</code> for pagination of the list
  /// results.
  ///
  /// Parameter [maxTables] :
  /// The maximum number of tables to return.
  ///
  /// Parameter [namespace] :
  /// The namespace of the tables.
  ///
  /// Parameter [prefix] :
  /// The prefix of the tables.
  Future<ListTablesResponse> listTables({
    required String tableBucketARN,
    String? continuationToken,
    int? maxTables,
    String? namespace,
    String? prefix,
  }) async {
    _s.validateNumRange(
      'maxTables',
      maxTables,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (continuationToken != null) 'continuationToken': [continuationToken],
      if (maxTables != null) 'maxTables': [maxTables.toString()],
      if (namespace != null) 'namespace': [namespace],
      if (prefix != null) 'prefix': [prefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tables/${Uri.encodeComponent(tableBucketARN)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTablesResponse.fromJson(response);
  }

  /// Creates a new maintenance configuration or replaces an existing
  /// maintenance configuration for a table. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-maintenance.html">S3
  /// Tables maintenance</a> in the <i>Amazon Simple Storage Service User
  /// Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:PutTableMaintenanceConfiguration</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace of the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table associated with the
  /// maintenance configuration.
  ///
  /// Parameter [type] :
  /// The type of the maintenance configuration.
  ///
  /// Parameter [value] :
  /// Defines the values of the maintenance configuration for the table.
  Future<void> putTableMaintenanceConfiguration({
    required String name,
    required String namespace,
    required String tableBucketARN,
    required TableMaintenanceType type,
    required TableMaintenanceConfigurationValue value,
  }) async {
    final $payload = <String, dynamic>{
      'value': value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/maintenance/${Uri.encodeComponent(type.value)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or updates the expiration configuration settings for records in a
  /// table, including the status of the configuration. If you enable record
  /// expiration for a table, records expire and are automatically removed from
  /// the table after the number of days that you specify.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the
  /// <code>s3tables:PutTableRecordExpirationConfiguration</code> permission to
  /// use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [MethodNotAllowedException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [tableArn] :
  /// The Amazon Resource Name (ARN) of the table.
  ///
  /// Parameter [value] :
  /// The record expiration configuration to apply to the table, including the
  /// status (<code>enabled</code> or <code>disabled</code>) and retention
  /// period in days.
  Future<void> putTableRecordExpirationConfiguration({
    required String tableArn,
    required TableRecordExpirationConfigurationValue value,
  }) async {
    final $query = <String, List<String>>{
      'tableArn': [tableArn],
    };
    final $payload = <String, dynamic>{
      'value': value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/table-record-expiration',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Renames a table or a namespace. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-tables.html">S3
  /// Tables</a> in the <i>Amazon Simple Storage Service User Guide</i>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:RenameTable</code> permission to use this
  /// operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [name] :
  /// The current name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace associated with the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  ///
  /// Parameter [newName] :
  /// The new name for the table.
  ///
  /// Parameter [newNamespaceName] :
  /// The new name for the namespace.
  ///
  /// Parameter [versionToken] :
  /// The version token of the table.
  Future<void> renameTable({
    required String name,
    required String namespace,
    required String tableBucketARN,
    String? newName,
    String? newNamespaceName,
    String? versionToken,
  }) async {
    final $payload = <String, dynamic>{
      if (newName != null) 'newName': newName,
      if (newNamespaceName != null) 'newNamespaceName': newNamespaceName,
      if (versionToken != null) 'versionToken': versionToken,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/rename',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the metadata location for a table. The metadata location of a
  /// table must be an S3 URI that begins with the table's warehouse location.
  /// The metadata location for an Apache Iceberg table must end with
  /// <code>.metadata.json</code>, or if the metadata file is Gzip-compressed,
  /// <code>.metadata.json.gz</code>.
  /// <dl> <dt>Permissions</dt> <dd>
  /// You must have the <code>s3tables:UpdateTableMetadataLocation</code>
  /// permission to use this operation.
  /// </dd> </dl>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [InternalServerErrorException].
  /// May throw [NotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [metadataLocation] :
  /// The new metadata location for the table.
  ///
  /// Parameter [name] :
  /// The name of the table.
  ///
  /// Parameter [namespace] :
  /// The namespace of the table.
  ///
  /// Parameter [tableBucketARN] :
  /// The Amazon Resource Name (ARN) of the table bucket.
  ///
  /// Parameter [versionToken] :
  /// The version token of the table.
  Future<UpdateTableMetadataLocationResponse> updateTableMetadataLocation({
    required String metadataLocation,
    required String name,
    required String namespace,
    required String tableBucketARN,
    required String versionToken,
  }) async {
    final $payload = <String, dynamic>{
      'metadataLocation': metadataLocation,
      'versionToken': versionToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/tables/${Uri.encodeComponent(tableBucketARN)}/${Uri.encodeComponent(namespace)}/${Uri.encodeComponent(name)}/metadata-location',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateTableMetadataLocationResponse.fromJson(response);
  }
}

class ListTagsForResourceResponse {
  /// The user-defined tags that are applied to the resource. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/tagging.html">Tagging
  /// for cost allocation or attribute-based access control (ABAC)</a>.
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

class CreateNamespaceResponse {
  /// The name of the namespace.
  final List<String> namespace;

  /// The Amazon Resource Name (ARN) of the table bucket the namespace was created
  /// in.
  final String tableBucketARN;

  CreateNamespaceResponse({
    required this.namespace,
    required this.tableBucketARN,
  });

  factory CreateNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return CreateNamespaceResponse(
      namespace: ((json['namespace'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      tableBucketARN: (json['tableBucketARN'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final namespace = this.namespace;
    final tableBucketARN = this.tableBucketARN;
    return {
      'namespace': namespace,
      'tableBucketARN': tableBucketARN,
    };
  }
}

class GetNamespaceResponse {
  /// The date and time the namespace was created at.
  final DateTime createdAt;

  /// The ID of the account that created the namespace.
  final String createdBy;

  /// The name of the namespace.
  final List<String> namespace;

  /// The ID of the account that owns the namespcace.
  final String ownerAccountId;

  /// The unique identifier of the namespace.
  final String? namespaceId;

  /// The unique identifier of the table bucket containing this namespace.
  final String? tableBucketId;

  GetNamespaceResponse({
    required this.createdAt,
    required this.createdBy,
    required this.namespace,
    required this.ownerAccountId,
    this.namespaceId,
    this.tableBucketId,
  });

  factory GetNamespaceResponse.fromJson(Map<String, dynamic> json) {
    return GetNamespaceResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      namespace: ((json['namespace'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      ownerAccountId: (json['ownerAccountId'] as String?) ?? '',
      namespaceId: json['namespaceId'] as String?,
      tableBucketId: json['tableBucketId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final namespace = this.namespace;
    final ownerAccountId = this.ownerAccountId;
    final namespaceId = this.namespaceId;
    final tableBucketId = this.tableBucketId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'namespace': namespace,
      'ownerAccountId': ownerAccountId,
      if (namespaceId != null) 'namespaceId': namespaceId,
      if (tableBucketId != null) 'tableBucketId': tableBucketId,
    };
  }
}

class ListNamespacesResponse {
  /// A list of namespaces.
  final List<NamespaceSummary> namespaces;

  /// The <code>ContinuationToken</code> for pagination of the list results.
  final String? continuationToken;

  ListNamespacesResponse({
    required this.namespaces,
    this.continuationToken,
  });

  factory ListNamespacesResponse.fromJson(Map<String, dynamic> json) {
    return ListNamespacesResponse(
      namespaces: ((json['namespaces'] as List?) ?? const [])
          .nonNulls
          .map((e) => NamespaceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      continuationToken: json['continuationToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final namespaces = this.namespaces;
    final continuationToken = this.continuationToken;
    return {
      'namespaces': namespaces,
      if (continuationToken != null) 'continuationToken': continuationToken,
    };
  }
}

class GetTableBucketEncryptionResponse {
  /// The encryption configuration for the table bucket.
  final EncryptionConfiguration encryptionConfiguration;

  GetTableBucketEncryptionResponse({
    required this.encryptionConfiguration,
  });

  factory GetTableBucketEncryptionResponse.fromJson(Map<String, dynamic> json) {
    return GetTableBucketEncryptionResponse(
      encryptionConfiguration: EncryptionConfiguration.fromJson(
          (json['encryptionConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfiguration = this.encryptionConfiguration;
    return {
      'encryptionConfiguration': encryptionConfiguration,
    };
  }
}

class GetTableBucketPolicyResponse {
  /// The <code>JSON</code> that defines the policy.
  final String resourcePolicy;

  GetTableBucketPolicyResponse({
    required this.resourcePolicy,
  });

  factory GetTableBucketPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetTableBucketPolicyResponse(
      resourcePolicy: (json['resourcePolicy'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      'resourcePolicy': resourcePolicy,
    };
  }
}

class GetTableBucketReplicationResponse {
  /// The replication configuration for the table bucket, including the IAM role
  /// and replication rules.
  final TableBucketReplicationConfiguration configuration;

  /// A version token that represents the current state of the replication
  /// configuration. Use this token when updating the configuration to ensure
  /// consistency.
  final String versionToken;

  GetTableBucketReplicationResponse({
    required this.configuration,
    required this.versionToken,
  });

  factory GetTableBucketReplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableBucketReplicationResponse(
      configuration: TableBucketReplicationConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      versionToken: (json['versionToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final versionToken = this.versionToken;
    return {
      'configuration': configuration,
      'versionToken': versionToken,
    };
  }
}

class PutTableBucketReplicationResponse {
  /// The status of the replication configuration operation.
  final String status;

  /// A new version token representing the updated replication configuration.
  final String versionToken;

  PutTableBucketReplicationResponse({
    required this.status,
    required this.versionToken,
  });

  factory PutTableBucketReplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutTableBucketReplicationResponse(
      status: (json['status'] as String?) ?? '',
      versionToken: (json['versionToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final versionToken = this.versionToken;
    return {
      'status': status,
      'versionToken': versionToken,
    };
  }
}

class CreateTableBucketResponse {
  /// The Amazon Resource Name (ARN) of the table bucket.
  final String arn;

  CreateTableBucketResponse({
    required this.arn,
  });

  factory CreateTableBucketResponse.fromJson(Map<String, dynamic> json) {
    return CreateTableBucketResponse(
      arn: (json['arn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      'arn': arn,
    };
  }
}

class GetTableBucketResponse {
  /// The Amazon Resource Name (ARN) of the table bucket.
  final String arn;

  /// The date and time the table bucket was created.
  final DateTime createdAt;

  /// The name of the table bucket
  final String name;

  /// The ID of the account that owns the table bucket.
  final String ownerAccountId;

  /// The unique identifier of the table bucket.
  final String? tableBucketId;

  /// The type of the table bucket.
  final TableBucketType? type;

  GetTableBucketResponse({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.ownerAccountId,
    this.tableBucketId,
    this.type,
  });

  factory GetTableBucketResponse.fromJson(Map<String, dynamic> json) {
    return GetTableBucketResponse(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      ownerAccountId: (json['ownerAccountId'] as String?) ?? '',
      tableBucketId: json['tableBucketId'] as String?,
      type: (json['type'] as String?)?.let(TableBucketType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final tableBucketId = this.tableBucketId;
    final type = this.type;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'ownerAccountId': ownerAccountId,
      if (tableBucketId != null) 'tableBucketId': tableBucketId,
      if (type != null) 'type': type.value,
    };
  }
}

class GetTableBucketMaintenanceConfigurationResponse {
  /// Details about the maintenance configuration for the table bucket.
  final Map<TableBucketMaintenanceType,
      TableBucketMaintenanceConfigurationValue> configuration;

  /// The Amazon Resource Name (ARN) of the table bucket associated with the
  /// maintenance configuration.
  final String tableBucketARN;

  GetTableBucketMaintenanceConfigurationResponse({
    required this.configuration,
    required this.tableBucketARN,
  });

  factory GetTableBucketMaintenanceConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableBucketMaintenanceConfigurationResponse(
      configuration: ((json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              TableBucketMaintenanceType.fromString(k),
              TableBucketMaintenanceConfigurationValue.fromJson(
                  e as Map<String, dynamic>))),
      tableBucketARN: (json['tableBucketARN'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final tableBucketARN = this.tableBucketARN;
    return {
      'configuration': configuration.map((k, e) => MapEntry(k.value, e)),
      'tableBucketARN': tableBucketARN,
    };
  }
}

class GetTableBucketMetricsConfigurationResponse {
  /// The Amazon Resource Name (ARN) of the table bucket.
  final String tableBucketARN;

  /// The unique identifier of the metrics configuration.
  final String? id;

  GetTableBucketMetricsConfigurationResponse({
    required this.tableBucketARN,
    this.id,
  });

  factory GetTableBucketMetricsConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableBucketMetricsConfigurationResponse(
      tableBucketARN: (json['tableBucketARN'] as String?) ?? '',
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tableBucketARN = this.tableBucketARN;
    final id = this.id;
    return {
      'tableBucketARN': tableBucketARN,
      if (id != null) 'id': id,
    };
  }
}

class GetTableBucketStorageClassResponse {
  /// The storage class configuration for the table bucket.
  final StorageClassConfiguration storageClassConfiguration;

  GetTableBucketStorageClassResponse({
    required this.storageClassConfiguration,
  });

  factory GetTableBucketStorageClassResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableBucketStorageClassResponse(
      storageClassConfiguration: StorageClassConfiguration.fromJson(
          (json['storageClassConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final storageClassConfiguration = this.storageClassConfiguration;
    return {
      'storageClassConfiguration': storageClassConfiguration,
    };
  }
}

class ListTableBucketsResponse {
  /// A list of table buckets.
  final List<TableBucketSummary> tableBuckets;

  /// You can use this <code>ContinuationToken</code> for pagination of the list
  /// results.
  final String? continuationToken;

  ListTableBucketsResponse({
    required this.tableBuckets,
    this.continuationToken,
  });

  factory ListTableBucketsResponse.fromJson(Map<String, dynamic> json) {
    return ListTableBucketsResponse(
      tableBuckets: ((json['tableBuckets'] as List?) ?? const [])
          .nonNulls
          .map((e) => TableBucketSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      continuationToken: json['continuationToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tableBuckets = this.tableBuckets;
    final continuationToken = this.continuationToken;
    return {
      'tableBuckets': tableBuckets,
      if (continuationToken != null) 'continuationToken': continuationToken,
    };
  }
}

class GetTableEncryptionResponse {
  /// The encryption configuration for the table.
  final EncryptionConfiguration encryptionConfiguration;

  GetTableEncryptionResponse({
    required this.encryptionConfiguration,
  });

  factory GetTableEncryptionResponse.fromJson(Map<String, dynamic> json) {
    return GetTableEncryptionResponse(
      encryptionConfiguration: EncryptionConfiguration.fromJson(
          (json['encryptionConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfiguration = this.encryptionConfiguration;
    return {
      'encryptionConfiguration': encryptionConfiguration,
    };
  }
}

class GetTablePolicyResponse {
  /// The <code>JSON</code> that defines the policy.
  final String resourcePolicy;

  GetTablePolicyResponse({
    required this.resourcePolicy,
  });

  factory GetTablePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetTablePolicyResponse(
      resourcePolicy: (json['resourcePolicy'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      'resourcePolicy': resourcePolicy,
    };
  }
}

class GetTableReplicationResponse {
  /// The replication configuration for the table, including the IAM role and
  /// replication rules.
  final TableReplicationConfiguration configuration;

  /// A version token that represents the current state of the table's replication
  /// configuration. Use this token when updating the configuration to ensure
  /// consistency.
  final String versionToken;

  GetTableReplicationResponse({
    required this.configuration,
    required this.versionToken,
  });

  factory GetTableReplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetTableReplicationResponse(
      configuration: TableReplicationConfiguration.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      versionToken: (json['versionToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final versionToken = this.versionToken;
    return {
      'configuration': configuration,
      'versionToken': versionToken,
    };
  }
}

class GetTableReplicationStatusResponse {
  /// An array of status information for each replication destination, including
  /// the current state, last successful update, and any error messages.
  final List<ReplicationDestinationStatusModel> destinations;

  /// The Amazon Resource Name (ARN) of the source table being replicated.
  final String sourceTableArn;

  GetTableReplicationStatusResponse({
    required this.destinations,
    required this.sourceTableArn,
  });

  factory GetTableReplicationStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableReplicationStatusResponse(
      destinations: ((json['destinations'] as List?) ?? const [])
          .nonNulls
          .map((e) => ReplicationDestinationStatusModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      sourceTableArn: (json['sourceTableArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    final sourceTableArn = this.sourceTableArn;
    return {
      'destinations': destinations,
      'sourceTableArn': sourceTableArn,
    };
  }
}

class PutTableReplicationResponse {
  /// The status of the replication configuration operation.
  final String status;

  /// A new version token representing the updated replication configuration.
  final String versionToken;

  PutTableReplicationResponse({
    required this.status,
    required this.versionToken,
  });

  factory PutTableReplicationResponse.fromJson(Map<String, dynamic> json) {
    return PutTableReplicationResponse(
      status: (json['status'] as String?) ?? '',
      versionToken: (json['versionToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final versionToken = this.versionToken;
    return {
      'status': status,
      'versionToken': versionToken,
    };
  }
}

class CreateTableResponse {
  /// The Amazon Resource Name (ARN) of the table.
  final String tableARN;

  /// The version token of the table.
  final String versionToken;

  CreateTableResponse({
    required this.tableARN,
    required this.versionToken,
  });

  factory CreateTableResponse.fromJson(Map<String, dynamic> json) {
    return CreateTableResponse(
      tableARN: (json['tableARN'] as String?) ?? '',
      versionToken: (json['versionToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final tableARN = this.tableARN;
    final versionToken = this.versionToken;
    return {
      'tableARN': tableARN,
      'versionToken': versionToken,
    };
  }
}

class GetTableResponse {
  /// The date and time the table bucket was created at.
  final DateTime createdAt;

  /// The ID of the account that created the table.
  final String createdBy;

  /// The format of the table.
  final OpenTableFormat format;

  /// The date and time the table was last modified on.
  final DateTime modifiedAt;

  /// The ID of the account that last modified the table.
  final String modifiedBy;

  /// The name of the table.
  final String name;

  /// The namespace associated with the table.
  final List<String> namespace;

  /// The ID of the account that owns the table.
  final String ownerAccountId;

  /// The Amazon Resource Name (ARN) of the table.
  final String tableARN;

  /// The type of the table.
  final TableType type;

  /// The version token of the table.
  final String versionToken;

  /// The warehouse location of the table.
  final String warehouseLocation;

  /// The service that manages the table.
  final String? managedByService;

  /// If this table is managed by S3 Tables, contains additional information such
  /// as replication details.
  final ManagedTableInformation? managedTableInformation;

  /// The metadata location of the table.
  final String? metadataLocation;

  /// The unique identifier of the namespace containing this table.
  final String? namespaceId;

  /// The unique identifier of the table bucket containing this table.
  final String? tableBucketId;

  GetTableResponse({
    required this.createdAt,
    required this.createdBy,
    required this.format,
    required this.modifiedAt,
    required this.modifiedBy,
    required this.name,
    required this.namespace,
    required this.ownerAccountId,
    required this.tableARN,
    required this.type,
    required this.versionToken,
    required this.warehouseLocation,
    this.managedByService,
    this.managedTableInformation,
    this.metadataLocation,
    this.namespaceId,
    this.tableBucketId,
  });

  factory GetTableResponse.fromJson(Map<String, dynamic> json) {
    return GetTableResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      format: OpenTableFormat.fromString((json['format'] as String?) ?? ''),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      modifiedBy: (json['modifiedBy'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      namespace: ((json['namespace'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      ownerAccountId: (json['ownerAccountId'] as String?) ?? '',
      tableARN: (json['tableARN'] as String?) ?? '',
      type: TableType.fromString((json['type'] as String?) ?? ''),
      versionToken: (json['versionToken'] as String?) ?? '',
      warehouseLocation: (json['warehouseLocation'] as String?) ?? '',
      managedByService: json['managedByService'] as String?,
      managedTableInformation: json['managedTableInformation'] != null
          ? ManagedTableInformation.fromJson(
              json['managedTableInformation'] as Map<String, dynamic>)
          : null,
      metadataLocation: json['metadataLocation'] as String?,
      namespaceId: json['namespaceId'] as String?,
      tableBucketId: json['tableBucketId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final format = this.format;
    final modifiedAt = this.modifiedAt;
    final modifiedBy = this.modifiedBy;
    final name = this.name;
    final namespace = this.namespace;
    final ownerAccountId = this.ownerAccountId;
    final tableARN = this.tableARN;
    final type = this.type;
    final versionToken = this.versionToken;
    final warehouseLocation = this.warehouseLocation;
    final managedByService = this.managedByService;
    final managedTableInformation = this.managedTableInformation;
    final metadataLocation = this.metadataLocation;
    final namespaceId = this.namespaceId;
    final tableBucketId = this.tableBucketId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'format': format.value,
      'modifiedAt': iso8601ToJson(modifiedAt),
      'modifiedBy': modifiedBy,
      'name': name,
      'namespace': namespace,
      'ownerAccountId': ownerAccountId,
      'tableARN': tableARN,
      'type': type.value,
      'versionToken': versionToken,
      'warehouseLocation': warehouseLocation,
      if (managedByService != null) 'managedByService': managedByService,
      if (managedTableInformation != null)
        'managedTableInformation': managedTableInformation,
      if (metadataLocation != null) 'metadataLocation': metadataLocation,
      if (namespaceId != null) 'namespaceId': namespaceId,
      if (tableBucketId != null) 'tableBucketId': tableBucketId,
    };
  }
}

class GetTableMaintenanceConfigurationResponse {
  /// Details about the maintenance configuration for the table bucket.
  final Map<TableMaintenanceType, TableMaintenanceConfigurationValue>
      configuration;

  /// The Amazon Resource Name (ARN) of the table.
  final String tableARN;

  GetTableMaintenanceConfigurationResponse({
    required this.configuration,
    required this.tableARN,
  });

  factory GetTableMaintenanceConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableMaintenanceConfigurationResponse(
      configuration: ((json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              TableMaintenanceType.fromString(k),
              TableMaintenanceConfigurationValue.fromJson(
                  e as Map<String, dynamic>))),
      tableARN: (json['tableARN'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final tableARN = this.tableARN;
    return {
      'configuration': configuration.map((k, e) => MapEntry(k.value, e)),
      'tableARN': tableARN,
    };
  }
}

class GetTableMaintenanceJobStatusResponse {
  /// The status of the maintenance job.
  final Map<TableMaintenanceJobType, TableMaintenanceJobStatusValue> status;

  /// The Amazon Resource Name (ARN) of the table.
  final String tableARN;

  GetTableMaintenanceJobStatusResponse({
    required this.status,
    required this.tableARN,
  });

  factory GetTableMaintenanceJobStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableMaintenanceJobStatusResponse(
      status: ((json['status'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(
              TableMaintenanceJobType.fromString(k),
              TableMaintenanceJobStatusValue.fromJson(
                  e as Map<String, dynamic>))),
      tableARN: (json['tableARN'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final tableARN = this.tableARN;
    return {
      'status': status.map((k, e) => MapEntry(k.value, e)),
      'tableARN': tableARN,
    };
  }
}

class GetTableMetadataLocationResponse {
  /// The version token.
  final String versionToken;

  /// The warehouse location.
  final String warehouseLocation;

  /// The metadata location.
  final String? metadataLocation;

  GetTableMetadataLocationResponse({
    required this.versionToken,
    required this.warehouseLocation,
    this.metadataLocation,
  });

  factory GetTableMetadataLocationResponse.fromJson(Map<String, dynamic> json) {
    return GetTableMetadataLocationResponse(
      versionToken: (json['versionToken'] as String?) ?? '',
      warehouseLocation: (json['warehouseLocation'] as String?) ?? '',
      metadataLocation: json['metadataLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final versionToken = this.versionToken;
    final warehouseLocation = this.warehouseLocation;
    final metadataLocation = this.metadataLocation;
    return {
      'versionToken': versionToken,
      'warehouseLocation': warehouseLocation,
      if (metadataLocation != null) 'metadataLocation': metadataLocation,
    };
  }
}

class GetTableRecordExpirationConfigurationResponse {
  /// The record expiration configuration for the table, including the status and
  /// retention settings.
  final TableRecordExpirationConfigurationValue configuration;

  GetTableRecordExpirationConfigurationResponse({
    required this.configuration,
  });

  factory GetTableRecordExpirationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableRecordExpirationConfigurationResponse(
      configuration: TableRecordExpirationConfigurationValue.fromJson(
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      'configuration': configuration,
    };
  }
}

class GetTableRecordExpirationJobStatusResponse {
  /// The current status of the most recent expiration job.
  final TableRecordExpirationJobStatus status;

  /// If the job failed, this field contains an error message describing the
  /// failure reason.
  final String? failureMessage;

  /// The timestamp when the expiration job was last executed.
  final DateTime? lastRunTimestamp;

  /// Metrics about the most recent expiration job execution, including the number
  /// of records and files deleted.
  final TableRecordExpirationJobMetrics? metrics;

  GetTableRecordExpirationJobStatusResponse({
    required this.status,
    this.failureMessage,
    this.lastRunTimestamp,
    this.metrics,
  });

  factory GetTableRecordExpirationJobStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return GetTableRecordExpirationJobStatusResponse(
      status: TableRecordExpirationJobStatus.fromString(
          (json['status'] as String?) ?? ''),
      failureMessage: json['failureMessage'] as String?,
      lastRunTimestamp: timeStampFromJson(json['lastRunTimestamp']),
      metrics: json['metrics'] != null
          ? TableRecordExpirationJobMetrics.fromJson(
              json['metrics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final failureMessage = this.failureMessage;
    final lastRunTimestamp = this.lastRunTimestamp;
    final metrics = this.metrics;
    return {
      'status': status.value,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastRunTimestamp != null)
        'lastRunTimestamp': iso8601ToJson(lastRunTimestamp),
      if (metrics != null) 'metrics': metrics,
    };
  }
}

class GetTableStorageClassResponse {
  /// The storage class configuration for the table.
  final StorageClassConfiguration storageClassConfiguration;

  GetTableStorageClassResponse({
    required this.storageClassConfiguration,
  });

  factory GetTableStorageClassResponse.fromJson(Map<String, dynamic> json) {
    return GetTableStorageClassResponse(
      storageClassConfiguration: StorageClassConfiguration.fromJson(
          (json['storageClassConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final storageClassConfiguration = this.storageClassConfiguration;
    return {
      'storageClassConfiguration': storageClassConfiguration,
    };
  }
}

class ListTablesResponse {
  /// A list of tables.
  final List<TableSummary> tables;

  /// You can use this <code>ContinuationToken</code> for pagination of the list
  /// results.
  final String? continuationToken;

  ListTablesResponse({
    required this.tables,
    this.continuationToken,
  });

  factory ListTablesResponse.fromJson(Map<String, dynamic> json) {
    return ListTablesResponse(
      tables: ((json['tables'] as List?) ?? const [])
          .nonNulls
          .map((e) => TableSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      continuationToken: json['continuationToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tables = this.tables;
    final continuationToken = this.continuationToken;
    return {
      'tables': tables,
      if (continuationToken != null) 'continuationToken': continuationToken,
    };
  }
}

class UpdateTableMetadataLocationResponse {
  /// The metadata location of the table.
  final String metadataLocation;

  /// The name of the table.
  final String name;

  /// The namespace the table is associated with.
  final List<String> namespace;

  /// The Amazon Resource Name (ARN) of the table.
  final String tableARN;

  /// The version token of the table.
  final String versionToken;

  UpdateTableMetadataLocationResponse({
    required this.metadataLocation,
    required this.name,
    required this.namespace,
    required this.tableARN,
    required this.versionToken,
  });

  factory UpdateTableMetadataLocationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateTableMetadataLocationResponse(
      metadataLocation: (json['metadataLocation'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
      namespace: ((json['namespace'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      tableARN: (json['tableARN'] as String?) ?? '',
      versionToken: (json['versionToken'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final metadataLocation = this.metadataLocation;
    final name = this.name;
    final namespace = this.namespace;
    final tableARN = this.tableARN;
    final versionToken = this.versionToken;
    return {
      'metadataLocation': metadataLocation,
      'name': name,
      'namespace': namespace,
      'tableARN': tableARN,
      'versionToken': versionToken,
    };
  }
}

/// The expiration configuration settings for records in a table, and the status
/// of the configuration. If the status of the configuration is enabled, records
/// expire and are automatically removed after the number of days specified in
/// the record expiration settings for the table.
class TableRecordExpirationConfigurationValue {
  /// The expiration settings for records in the table.
  final TableRecordExpirationSettings? settings;

  /// The status of the expiration settings for records in the table.
  final TableRecordExpirationStatus? status;

  TableRecordExpirationConfigurationValue({
    this.settings,
    this.status,
  });

  factory TableRecordExpirationConfigurationValue.fromJson(
      Map<String, dynamic> json) {
    return TableRecordExpirationConfigurationValue(
      settings: json['settings'] != null
          ? TableRecordExpirationSettings.fromJson(
              json['settings'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)
          ?.let(TableRecordExpirationStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final settings = this.settings;
    final status = this.status;
    return {
      if (settings != null) 'settings': settings,
      if (status != null) 'status': status.value,
    };
  }
}

class TableRecordExpirationStatus {
  static const enabled = TableRecordExpirationStatus._('enabled');
  static const disabled = TableRecordExpirationStatus._('disabled');

  final String value;

  const TableRecordExpirationStatus._(this.value);

  static const values = [enabled, disabled];

  static TableRecordExpirationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TableRecordExpirationStatus._(value));

  @override
  bool operator ==(other) =>
      other is TableRecordExpirationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The record expiration setting that specifies when records expire and are
/// automatically removed from a table.
class TableRecordExpirationSettings {
  /// If you enable record expiration for a table, you can specify the number of
  /// days to retain your table records. For example, to retain your table records
  /// for one year, set this value to <code>365</code>.
  final int? days;

  TableRecordExpirationSettings({
    this.days,
  });

  factory TableRecordExpirationSettings.fromJson(Map<String, dynamic> json) {
    return TableRecordExpirationSettings(
      days: json['days'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final days = this.days;
    return {
      if (days != null) 'days': days,
    };
  }
}

class TableMaintenanceType {
  static const icebergCompaction = TableMaintenanceType._('icebergCompaction');
  static const icebergSnapshotManagement =
      TableMaintenanceType._('icebergSnapshotManagement');

  final String value;

  const TableMaintenanceType._(this.value);

  static const values = [icebergCompaction, icebergSnapshotManagement];

  static TableMaintenanceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TableMaintenanceType._(value));

  @override
  bool operator ==(other) =>
      other is TableMaintenanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The values that define a maintenance configuration for a table.
class TableMaintenanceConfigurationValue {
  /// Contains details about the settings for the maintenance configuration.
  final TableMaintenanceSettings? settings;

  /// The status of the maintenance configuration.
  final MaintenanceStatus? status;

  TableMaintenanceConfigurationValue({
    this.settings,
    this.status,
  });

  factory TableMaintenanceConfigurationValue.fromJson(
      Map<String, dynamic> json) {
    return TableMaintenanceConfigurationValue(
      settings: json['settings'] != null
          ? TableMaintenanceSettings.fromJson(
              json['settings'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(MaintenanceStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final settings = this.settings;
    final status = this.status;
    return {
      if (settings != null) 'settings': settings,
      if (status != null) 'status': status.value,
    };
  }
}

class MaintenanceStatus {
  static const enabled = MaintenanceStatus._('enabled');
  static const disabled = MaintenanceStatus._('disabled');

  final String value;

  const MaintenanceStatus._(this.value);

  static const values = [enabled, disabled];

  static MaintenanceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MaintenanceStatus._(value));

  @override
  bool operator ==(other) => other is MaintenanceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about maintenance settings for the table.
class TableMaintenanceSettings {
  /// Contains details about the Iceberg compaction settings for the table.
  final IcebergCompactionSettings? icebergCompaction;

  /// Contains details about the Iceberg snapshot management settings for the
  /// table.
  final IcebergSnapshotManagementSettings? icebergSnapshotManagement;

  TableMaintenanceSettings({
    this.icebergCompaction,
    this.icebergSnapshotManagement,
  });

  factory TableMaintenanceSettings.fromJson(Map<String, dynamic> json) {
    return TableMaintenanceSettings(
      icebergCompaction: json['icebergCompaction'] != null
          ? IcebergCompactionSettings.fromJson(
              json['icebergCompaction'] as Map<String, dynamic>)
          : null,
      icebergSnapshotManagement: json['icebergSnapshotManagement'] != null
          ? IcebergSnapshotManagementSettings.fromJson(
              json['icebergSnapshotManagement'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final icebergCompaction = this.icebergCompaction;
    final icebergSnapshotManagement = this.icebergSnapshotManagement;
    return {
      if (icebergCompaction != null) 'icebergCompaction': icebergCompaction,
      if (icebergSnapshotManagement != null)
        'icebergSnapshotManagement': icebergSnapshotManagement,
    };
  }
}

/// Contains details about the compaction settings for an Iceberg table.
class IcebergCompactionSettings {
  /// The compaction strategy to use for the table. This determines how files are
  /// selected and combined during compaction operations.
  final IcebergCompactionStrategy? strategy;

  /// The target file size for the table in MB.
  final int? targetFileSizeMB;

  IcebergCompactionSettings({
    this.strategy,
    this.targetFileSizeMB,
  });

  factory IcebergCompactionSettings.fromJson(Map<String, dynamic> json) {
    return IcebergCompactionSettings(
      strategy: (json['strategy'] as String?)
          ?.let(IcebergCompactionStrategy.fromString),
      targetFileSizeMB: json['targetFileSizeMB'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final strategy = this.strategy;
    final targetFileSizeMB = this.targetFileSizeMB;
    return {
      if (strategy != null) 'strategy': strategy.value,
      if (targetFileSizeMB != null) 'targetFileSizeMB': targetFileSizeMB,
    };
  }
}

/// Contains details about the snapshot management settings for an Iceberg
/// table. The oldest snapshot expires when its age exceeds the
/// <code>maxSnapshotAgeHours</code> and the total number of snapshots exceeds
/// the value for the minimum number of snapshots to keep
/// <code>minSnapshotsToKeep</code>.
class IcebergSnapshotManagementSettings {
  /// The maximum age of a snapshot before it can be expired.
  final int? maxSnapshotAgeHours;

  /// The minimum number of snapshots to keep.
  final int? minSnapshotsToKeep;

  IcebergSnapshotManagementSettings({
    this.maxSnapshotAgeHours,
    this.minSnapshotsToKeep,
  });

  factory IcebergSnapshotManagementSettings.fromJson(
      Map<String, dynamic> json) {
    return IcebergSnapshotManagementSettings(
      maxSnapshotAgeHours: json['maxSnapshotAgeHours'] as int?,
      minSnapshotsToKeep: json['minSnapshotsToKeep'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxSnapshotAgeHours = this.maxSnapshotAgeHours;
    final minSnapshotsToKeep = this.minSnapshotsToKeep;
    return {
      if (maxSnapshotAgeHours != null)
        'maxSnapshotAgeHours': maxSnapshotAgeHours,
      if (minSnapshotsToKeep != null) 'minSnapshotsToKeep': minSnapshotsToKeep,
    };
  }
}

class IcebergCompactionStrategy {
  static const auto = IcebergCompactionStrategy._('auto');
  static const binpack = IcebergCompactionStrategy._('binpack');
  static const sort = IcebergCompactionStrategy._('sort');
  static const zOrder = IcebergCompactionStrategy._('z-order');

  final String value;

  const IcebergCompactionStrategy._(this.value);

  static const values = [auto, binpack, sort, zOrder];

  static IcebergCompactionStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IcebergCompactionStrategy._(value));

  @override
  bool operator ==(other) =>
      other is IcebergCompactionStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a table.
class TableSummary {
  /// The date and time the table was created at.
  final DateTime createdAt;

  /// The date and time the table was last modified at.
  final DateTime modifiedAt;

  /// The name of the table.
  final String name;

  /// The name of the namespace.
  final List<String> namespace;

  /// The Amazon Resource Name (ARN) of the table.
  final String tableARN;

  /// The type of the table.
  final TableType type;

  /// The Amazon Web Services service managing this table, if applicable. For
  /// example, a replicated table is managed by the S3 Tables replication service.
  final String? managedByService;

  /// The unique identifier for the namespace that contains this table.
  final String? namespaceId;

  /// The unique identifier for the table bucket that contains this table.
  final String? tableBucketId;

  TableSummary({
    required this.createdAt,
    required this.modifiedAt,
    required this.name,
    required this.namespace,
    required this.tableARN,
    required this.type,
    this.managedByService,
    this.namespaceId,
    this.tableBucketId,
  });

  factory TableSummary.fromJson(Map<String, dynamic> json) {
    return TableSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      modifiedAt: nonNullableTimeStampFromJson(json['modifiedAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      namespace: ((json['namespace'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      tableARN: (json['tableARN'] as String?) ?? '',
      type: TableType.fromString((json['type'] as String?) ?? ''),
      managedByService: json['managedByService'] as String?,
      namespaceId: json['namespaceId'] as String?,
      tableBucketId: json['tableBucketId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final name = this.name;
    final namespace = this.namespace;
    final tableARN = this.tableARN;
    final type = this.type;
    final managedByService = this.managedByService;
    final namespaceId = this.namespaceId;
    final tableBucketId = this.tableBucketId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'modifiedAt': iso8601ToJson(modifiedAt),
      'name': name,
      'namespace': namespace,
      'tableARN': tableARN,
      'type': type.value,
      if (managedByService != null) 'managedByService': managedByService,
      if (namespaceId != null) 'namespaceId': namespaceId,
      if (tableBucketId != null) 'tableBucketId': tableBucketId,
    };
  }
}

class TableType {
  static const customer = TableType._('customer');
  static const aws = TableType._('aws');

  final String value;

  const TableType._(this.value);

  static const values = [customer, aws];

  static TableType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TableType._(value));

  @override
  bool operator ==(other) => other is TableType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration details for the storage class of tables or table buckets.
/// This allows you to optimize storage costs by selecting the appropriate
/// storage class based on your access patterns and performance requirements.
class StorageClassConfiguration {
  /// The storage class for the table or table bucket. Valid values include
  /// storage classes optimized for different access patterns and cost profiles.
  final StorageClass storageClass;

  StorageClassConfiguration({
    required this.storageClass,
  });

  factory StorageClassConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageClassConfiguration(
      storageClass:
          StorageClass.fromString((json['storageClass'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final storageClass = this.storageClass;
    return {
      'storageClass': storageClass.value,
    };
  }
}

class StorageClass {
  static const standard = StorageClass._('STANDARD');
  static const intelligentTiering = StorageClass._('INTELLIGENT_TIERING');

  final String value;

  const StorageClass._(this.value);

  static const values = [standard, intelligentTiering];

  static StorageClass fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StorageClass._(value));

  @override
  bool operator ==(other) => other is StorageClass && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class TableRecordExpirationJobStatus {
  static const notYetRun = TableRecordExpirationJobStatus._('NotYetRun');
  static const successful = TableRecordExpirationJobStatus._('Successful');
  static const failed = TableRecordExpirationJobStatus._('Failed');
  static const disabled = TableRecordExpirationJobStatus._('Disabled');

  final String value;

  const TableRecordExpirationJobStatus._(this.value);

  static const values = [notYetRun, successful, failed, disabled];

  static TableRecordExpirationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TableRecordExpirationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is TableRecordExpirationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Provides metrics for the record expiration job that most recently ran for a
/// table. The metrics provide insight into the amount of data that was removed
/// when the job ran.
class TableRecordExpirationJobMetrics {
  /// The total number of data files that were removed when the job ran.
  final int? deletedDataFiles;

  /// The total number of records that were removed when the job ran.
  final int? deletedRecords;

  /// The total size (in bytes) of the data files that were removed when the job
  /// ran.
  final int? removedFilesSize;

  TableRecordExpirationJobMetrics({
    this.deletedDataFiles,
    this.deletedRecords,
    this.removedFilesSize,
  });

  factory TableRecordExpirationJobMetrics.fromJson(Map<String, dynamic> json) {
    return TableRecordExpirationJobMetrics(
      deletedDataFiles: json['deletedDataFiles'] as int?,
      deletedRecords: json['deletedRecords'] as int?,
      removedFilesSize: json['removedFilesSize'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deletedDataFiles = this.deletedDataFiles;
    final deletedRecords = this.deletedRecords;
    final removedFilesSize = this.removedFilesSize;
    return {
      if (deletedDataFiles != null) 'deletedDataFiles': deletedDataFiles,
      if (deletedRecords != null) 'deletedRecords': deletedRecords,
      if (removedFilesSize != null) 'removedFilesSize': removedFilesSize,
    };
  }
}

class TableMaintenanceJobType {
  static const icebergCompaction =
      TableMaintenanceJobType._('icebergCompaction');
  static const icebergSnapshotManagement =
      TableMaintenanceJobType._('icebergSnapshotManagement');
  static const icebergUnreferencedFileRemoval =
      TableMaintenanceJobType._('icebergUnreferencedFileRemoval');

  final String value;

  const TableMaintenanceJobType._(this.value);

  static const values = [
    icebergCompaction,
    icebergSnapshotManagement,
    icebergUnreferencedFileRemoval
  ];

  static TableMaintenanceJobType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TableMaintenanceJobType._(value));

  @override
  bool operator ==(other) =>
      other is TableMaintenanceJobType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the status of a maintenance job.
class TableMaintenanceJobStatusValue {
  /// The status of the job.
  final JobStatus status;

  /// The failure message of a failed job.
  final String? failureMessage;

  /// The date and time that the maintenance job was last run.
  final DateTime? lastRunTimestamp;

  TableMaintenanceJobStatusValue({
    required this.status,
    this.failureMessage,
    this.lastRunTimestamp,
  });

  factory TableMaintenanceJobStatusValue.fromJson(Map<String, dynamic> json) {
    return TableMaintenanceJobStatusValue(
      status: JobStatus.fromString((json['status'] as String?) ?? ''),
      failureMessage: json['failureMessage'] as String?,
      lastRunTimestamp: timeStampFromJson(json['lastRunTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final failureMessage = this.failureMessage;
    final lastRunTimestamp = this.lastRunTimestamp;
    return {
      'status': status.value,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastRunTimestamp != null)
        'lastRunTimestamp': iso8601ToJson(lastRunTimestamp),
    };
  }
}

class JobStatus {
  static const notYetRun = JobStatus._('Not_Yet_Run');
  static const successful = JobStatus._('Successful');
  static const failed = JobStatus._('Failed');
  static const disabled = JobStatus._('Disabled');

  final String value;

  const JobStatus._(this.value);

  static const values = [notYetRun, successful, failed, disabled];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OpenTableFormat {
  static const iceberg = OpenTableFormat._('ICEBERG');

  final String value;

  const OpenTableFormat._(this.value);

  static const values = [iceberg];

  static OpenTableFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OpenTableFormat._(value));

  @override
  bool operator ==(other) => other is OpenTableFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about tables that are managed by S3 Tables, including
/// replication information for replica tables.
class ManagedTableInformation {
  /// If this table is a replica, contains information about the source table from
  /// which it is replicated.
  final ReplicationInformation? replicationInformation;

  ManagedTableInformation({
    this.replicationInformation,
  });

  factory ManagedTableInformation.fromJson(Map<String, dynamic> json) {
    return ManagedTableInformation(
      replicationInformation: json['replicationInformation'] != null
          ? ReplicationInformation.fromJson(
              json['replicationInformation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationInformation = this.replicationInformation;
    return {
      if (replicationInformation != null)
        'replicationInformation': replicationInformation,
    };
  }
}

/// Contains information about the source of a replicated table.
class ReplicationInformation {
  /// The Amazon Resource Name (ARN) of the source table from which this table is
  /// replicated.
  final String sourceTableARN;

  ReplicationInformation({
    required this.sourceTableARN,
  });

  factory ReplicationInformation.fromJson(Map<String, dynamic> json) {
    return ReplicationInformation(
      sourceTableARN: (json['sourceTableARN'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final sourceTableARN = this.sourceTableARN;
    return {
      'sourceTableARN': sourceTableARN,
    };
  }
}

/// Contains details about the table metadata.
class TableMetadata {
  /// Contains details about the metadata of an Iceberg table.
  final IcebergMetadata? iceberg;

  TableMetadata({
    this.iceberg,
  });

  Map<String, dynamic> toJson() {
    final iceberg = this.iceberg;
    return {
      if (iceberg != null) 'iceberg': iceberg,
    };
  }
}

/// Configuration specifying how data should be encrypted. This structure
/// defines the encryption algorithm and optional KMS key to be used for
/// server-side encryption.
class EncryptionConfiguration {
  /// The server-side encryption algorithm to use. Valid values are
  /// <code>AES256</code> for S3-managed encryption keys, or <code>aws:kms</code>
  /// for Amazon Web Services KMS-managed encryption keys. If you choose SSE-KMS
  /// encryption you must grant the S3 Tables maintenance principal access to your
  /// KMS key. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/userguide/s3-tables-kms-permissions.html">Permissions
  /// requirements for S3 Tables SSE-KMS encryption</a>.
  final SSEAlgorithm sseAlgorithm;

  /// The Amazon Resource Name (ARN) of the KMS key to use for encryption. This
  /// field is required only when <code>sseAlgorithm</code> is set to
  /// <code>aws:kms</code>.
  final String? kmsKeyArn;

  EncryptionConfiguration({
    required this.sseAlgorithm,
    this.kmsKeyArn,
  });

  factory EncryptionConfiguration.fromJson(Map<String, dynamic> json) {
    return EncryptionConfiguration(
      sseAlgorithm:
          SSEAlgorithm.fromString((json['sseAlgorithm'] as String?) ?? ''),
      kmsKeyArn: json['kmsKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sseAlgorithm = this.sseAlgorithm;
    final kmsKeyArn = this.kmsKeyArn;
    return {
      'sseAlgorithm': sseAlgorithm.value,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
    };
  }
}

class SSEAlgorithm {
  static const aes256 = SSEAlgorithm._('AES256');
  static const awsKms = SSEAlgorithm._('aws:kms');

  final String value;

  const SSEAlgorithm._(this.value);

  static const values = [aes256, awsKms];

  static SSEAlgorithm fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SSEAlgorithm._(value));

  @override
  bool operator ==(other) => other is SSEAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about the metadata for an Iceberg table.
class IcebergMetadata {
  /// The partition specification for the Iceberg table. Partitioning organizes
  /// data into separate files based on the values of one or more fields, which
  /// can improve query performance by reducing the amount of data scanned. Each
  /// partition field applies a transform (such as identity, year, month, or
  /// bucket) to a single field.
  final IcebergPartitionSpec? partitionSpec;

  /// A map of custom configuration properties for the Iceberg table.
  final Map<String, String>? properties;

  /// The schema for an Iceberg table. Use this property to define table schemas
  /// with primitive types only. For schemas that include nested or complex types
  /// such as <code>struct</code>, <code>list</code>, or <code>map</code>, use
  /// <code>schemaV2</code> instead.
  final IcebergSchema? schema;

  /// The schema for an Iceberg table using the V2 format. Use this property to
  /// define table schemas that include nested or complex data types such as
  /// <code>struct</code>, <code>list</code>, or <code>map</code>, in addition to
  /// primitive types. For schemas with only primitive types, you can use either
  /// <code>schema</code> or <code>schemaV2</code>.
  final IcebergSchemaV2? schemaV2;

  /// The sort order for the Iceberg table. Sort order defines how data is sorted
  /// within data files, which can improve query performance by enabling more
  /// efficient data skipping and filtering.
  final IcebergSortOrder? writeOrder;

  IcebergMetadata({
    this.partitionSpec,
    this.properties,
    this.schema,
    this.schemaV2,
    this.writeOrder,
  });

  Map<String, dynamic> toJson() {
    final partitionSpec = this.partitionSpec;
    final properties = this.properties;
    final schema = this.schema;
    final schemaV2 = this.schemaV2;
    final writeOrder = this.writeOrder;
    return {
      if (partitionSpec != null) 'partitionSpec': partitionSpec,
      if (properties != null) 'properties': properties,
      if (schema != null) 'schema': schema,
      if (schemaV2 != null) 'schemaV2': schemaV2,
      if (writeOrder != null) 'writeOrder': writeOrder,
    };
  }
}

/// Contains details about the schema for an Iceberg table.
class IcebergSchema {
  /// The schema fields for the table
  final List<SchemaField> fields;

  IcebergSchema({
    required this.fields,
  });

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    return {
      'fields': fields,
    };
  }
}

/// Contains details about the schema for an Iceberg table using the V2 format.
/// This schema format supports nested and complex data types such as
/// <code>struct</code>, <code>list</code>, and <code>map</code>, in addition to
/// primitive types.
class IcebergSchemaV2 {
  /// The schema fields for the table. Each field defines a column in the table,
  /// including its name, type, and whether it is required.
  final List<SchemaV2Field> fields;

  /// The type of the top-level schema, which is always a <code>struct</code> type
  /// as defined in the <a
  /// href="https://iceberg.apache.org/spec/#schemas-and-data-types">Apache
  /// Iceberg specification</a>. This value must be <code>struct</code>.
  final SchemaV2FieldType type;

  /// A list of field IDs that are used as the identifier fields for the table.
  /// Identifier fields uniquely identify a row in the table.
  final List<int>? identifierFieldIds;

  /// An optional unique identifier for the schema. Schema IDs are used by Apache
  /// Iceberg to track schema evolution.
  final int? schemaId;

  IcebergSchemaV2({
    required this.fields,
    required this.type,
    this.identifierFieldIds,
    this.schemaId,
  });

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final type = this.type;
    final identifierFieldIds = this.identifierFieldIds;
    final schemaId = this.schemaId;
    return {
      'fields': fields,
      'type': type.value,
      if (identifierFieldIds != null)
        'identifier-field-ids': identifierFieldIds,
      if (schemaId != null) 'schema-id': schemaId,
    };
  }
}

/// Defines how data in an Iceberg table is partitioned. Partitioning helps
/// optimize query performance by organizing data into separate files based on
/// field values. Each partition field specifies a transform to apply to a
/// source field.
class IcebergPartitionSpec {
  /// The list of partition fields that define how the table data is partitioned.
  /// Each field specifies a source field and a transform to apply. This field is
  /// required if <code>partitionSpec</code> is provided.
  final List<IcebergPartitionField> fields;

  /// The unique identifier for this partition specification. If not specified,
  /// defaults to <code>0</code>.
  final int? specId;

  IcebergPartitionSpec({
    required this.fields,
    this.specId,
  });

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final specId = this.specId;
    return {
      'fields': fields,
      if (specId != null) 'spec-id': specId,
    };
  }
}

/// Defines the sort order for data within an Iceberg table. Sorting data can
/// improve query performance by enabling more efficient data skipping.
class IcebergSortOrder {
  /// The list of sort fields that define how data is sorted within files. Each
  /// field specifies a source field, sort direction, and null ordering. This
  /// field is required if <code>writeOrder</code> is provided.
  final List<IcebergSortField> fields;

  /// The unique identifier for this sort order. If not specified, defaults to
  /// <code>1</code>. The order ID is used by Apache Iceberg to track sort order
  /// evolution.
  final int orderId;

  IcebergSortOrder({
    required this.fields,
    required this.orderId,
  });

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final orderId = this.orderId;
    return {
      'fields': fields,
      'order-id': orderId,
    };
  }
}

/// Defines a single sort field in an Iceberg sort order specification.
class IcebergSortField {
  /// The sort direction. Valid values are <code>asc</code> for ascending order or
  /// <code>desc</code> for descending order.
  final IcebergSortDirection direction;

  /// Specifies how null values are ordered. Valid values are
  /// <code>nulls-first</code> to place nulls before non-null values, or
  /// <code>nulls-last</code> to place nulls after non-null values.
  final IcebergNullOrder nullOrder;

  /// The ID of the source schema field to sort by. This must reference a valid
  /// field ID from the table schema.
  final int sourceId;

  /// The transform to apply to the source field before sorting. Use
  /// <code>identity</code> to sort by the field value directly, or specify other
  /// transforms as needed.
  final String transform;

  IcebergSortField({
    required this.direction,
    required this.nullOrder,
    required this.sourceId,
    required this.transform,
  });

  Map<String, dynamic> toJson() {
    final direction = this.direction;
    final nullOrder = this.nullOrder;
    final sourceId = this.sourceId;
    final transform = this.transform;
    return {
      'direction': direction.value,
      'null-order': nullOrder.value,
      'source-id': sourceId,
      'transform': transform,
    };
  }
}

class IcebergSortDirection {
  static const asc = IcebergSortDirection._('asc');
  static const desc = IcebergSortDirection._('desc');

  final String value;

  const IcebergSortDirection._(this.value);

  static const values = [asc, desc];

  static IcebergSortDirection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IcebergSortDirection._(value));

  @override
  bool operator ==(other) =>
      other is IcebergSortDirection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IcebergNullOrder {
  static const nullsFirst = IcebergNullOrder._('nulls-first');
  static const nullsLast = IcebergNullOrder._('nulls-last');

  final String value;

  const IcebergNullOrder._(this.value);

  static const values = [nullsFirst, nullsLast];

  static IcebergNullOrder fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IcebergNullOrder._(value));

  @override
  bool operator ==(other) => other is IcebergNullOrder && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Defines a single partition field in an Iceberg partition specification.
class IcebergPartitionField {
  /// The name for this partition field. This name is used in the partitioned file
  /// paths.
  final String name;

  /// The ID of the source schema field to partition by. This must reference a
  /// valid field ID from the table schema.
  final int sourceId;

  /// The partition transform to apply to the source field. Supported transforms
  /// include <code>identity</code>, <code>year</code>, <code>month</code>,
  /// <code>day</code>, <code>hour</code>, <code>bucket</code>, and
  /// <code>truncate</code>. For more information, see the <a
  /// href="https://iceberg.apache.org/spec/#partition-transforms">Apache Iceberg
  /// partition transforms documentation</a>.
  final String transform;

  /// An optional unique identifier for this partition field. If not specified, S3
  /// Tables automatically assigns a field ID.
  final int? fieldId;

  IcebergPartitionField({
    required this.name,
    required this.sourceId,
    required this.transform,
    this.fieldId,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sourceId = this.sourceId;
    final transform = this.transform;
    final fieldId = this.fieldId;
    return {
      'name': name,
      'source-id': sourceId,
      'transform': transform,
      if (fieldId != null) 'field-id': fieldId,
    };
  }
}

class SchemaV2FieldType {
  static const struct = SchemaV2FieldType._('struct');

  final String value;

  const SchemaV2FieldType._(this.value);

  static const values = [struct];

  static SchemaV2FieldType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SchemaV2FieldType._(value));

  @override
  bool operator ==(other) => other is SchemaV2FieldType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details about a schema field in the V2 format. This field format
/// supports nested and complex data types such as <code>struct</code>,
/// <code>list</code>, and <code>map</code>, in addition to primitive types.
class SchemaV2Field {
  /// The unique identifier for the schema field. Field IDs are used by Apache
  /// Iceberg to track schema evolution and maintain compatibility across schema
  /// changes.
  final int id;

  /// The name of the field.
  final String name;

  /// A Boolean value that specifies whether values are required for each row in
  /// this field. If this is <code>true</code>, the field does not allow null
  /// values.
  final bool required;

  /// The data type of the field. This can be a primitive type string such as
  /// <code>boolean</code>, <code>int</code>, <code>long</code>,
  /// <code>float</code>, <code>double</code>, <code>string</code>,
  /// <code>binary</code>, <code>date</code>, <code>timestamp</code>, or
  /// <code>timestamptz</code>, or a complex type represented as a JSON object for
  /// nested types such as <code>struct</code>, <code>list</code>, or
  /// <code>map</code>. For more information, see the <a
  /// href="https://iceberg.apache.org/spec/#schemas-and-data-types">Apache
  /// Iceberg schemas and data types documentation</a>.
  final Document type;

  /// An optional description of the field.
  final String? doc;

  SchemaV2Field({
    required this.id,
    required this.name,
    required this.required,
    required this.type,
    this.doc,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final required = this.required;
    final type = this.type;
    final doc = this.doc;
    return {
      'id': id,
      'name': name,
      'required': required,
      'type': type,
      if (doc != null) 'doc': doc,
    };
  }
}

/// Contains details about a schema field.
class SchemaField {
  /// The name of the field.
  final String name;

  /// The field type. S3 Tables supports all Apache Iceberg primitive types. For
  /// more information, see the <a
  /// href="https://iceberg.apache.org/spec/#primitive-types">Apache Iceberg
  /// documentation</a>.
  final String type;

  /// An optional unique identifier for the schema field. Field IDs are used by
  /// Apache Iceberg to track schema evolution and maintain compatibility across
  /// schema changes. If not specified, S3 Tables automatically assigns field IDs.
  final int? id;

  /// A Boolean value that specifies whether values are required for each row in
  /// this field. By default, this is <code>false</code> and null values are
  /// allowed in the field. If this is <code>true</code> the field does not allow
  /// null values.
  final bool? required;

  SchemaField({
    required this.name,
    required this.type,
    this.id,
    this.required,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final id = this.id;
    final required = this.required;
    return {
      'name': name,
      'type': type,
      if (id != null) 'id': id,
      if (required != null) 'required': required,
    };
  }
}

/// The replication configuration for an individual table. This configuration
/// defines how the table is replicated to destination tables.
class TableReplicationConfiguration {
  /// The Amazon Resource Name (ARN) of the IAM role that S3 Tables assumes to
  /// replicate the table on your behalf.
  final String role;

  /// An array of replication rules that define where this table should be
  /// replicated.
  final List<TableReplicationRule> rules;

  TableReplicationConfiguration({
    required this.role,
    required this.rules,
  });

  factory TableReplicationConfiguration.fromJson(Map<String, dynamic> json) {
    return TableReplicationConfiguration(
      role: (json['role'] as String?) ?? '',
      rules: ((json['rules'] as List?) ?? const [])
          .nonNulls
          .map((e) => TableReplicationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    final rules = this.rules;
    return {
      'role': role,
      'rules': rules,
    };
  }
}

/// Defines a rule for replicating a table to one or more destination tables.
class TableReplicationRule {
  /// An array of destination table buckets where this table should be replicated.
  final List<ReplicationDestination> destinations;

  TableReplicationRule({
    required this.destinations,
  });

  factory TableReplicationRule.fromJson(Map<String, dynamic> json) {
    return TableReplicationRule(
      destinations: ((json['destinations'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => ReplicationDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    return {
      'destinations': destinations,
    };
  }
}

/// Specifies a destination table bucket for replication.
class ReplicationDestination {
  /// The Amazon Resource Name (ARN) of the destination table bucket where tables
  /// will be replicated.
  final String destinationTableBucketARN;

  ReplicationDestination({
    required this.destinationTableBucketARN,
  });

  factory ReplicationDestination.fromJson(Map<String, dynamic> json) {
    return ReplicationDestination(
      destinationTableBucketARN:
          (json['destinationTableBucketARN'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final destinationTableBucketARN = this.destinationTableBucketARN;
    return {
      'destinationTableBucketARN': destinationTableBucketARN,
    };
  }
}

/// Contains status information for a replication destination, including the
/// current replication state, last successful update, and any error messages.
class ReplicationDestinationStatusModel {
  /// The Amazon Resource Name (ARN) of the destination table bucket.
  final String destinationTableBucketArn;

  /// The current status of replication to this destination.
  final ReplicationStatus replicationStatus;

  /// The Amazon Resource Name (ARN) of the destination table.
  final String? destinationTableArn;

  /// If replication has failed, this field contains an error message describing
  /// the failure reason.
  final String? failureMessage;

  /// Information about the most recent successful replication update to this
  /// destination.
  final LastSuccessfulReplicatedUpdate? lastSuccessfulReplicatedUpdate;

  ReplicationDestinationStatusModel({
    required this.destinationTableBucketArn,
    required this.replicationStatus,
    this.destinationTableArn,
    this.failureMessage,
    this.lastSuccessfulReplicatedUpdate,
  });

  factory ReplicationDestinationStatusModel.fromJson(
      Map<String, dynamic> json) {
    return ReplicationDestinationStatusModel(
      destinationTableBucketArn:
          (json['destinationTableBucketArn'] as String?) ?? '',
      replicationStatus: ReplicationStatus.fromString(
          (json['replicationStatus'] as String?) ?? ''),
      destinationTableArn: json['destinationTableArn'] as String?,
      failureMessage: json['failureMessage'] as String?,
      lastSuccessfulReplicatedUpdate: json['lastSuccessfulReplicatedUpdate'] !=
              null
          ? LastSuccessfulReplicatedUpdate.fromJson(
              json['lastSuccessfulReplicatedUpdate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationTableBucketArn = this.destinationTableBucketArn;
    final replicationStatus = this.replicationStatus;
    final destinationTableArn = this.destinationTableArn;
    final failureMessage = this.failureMessage;
    final lastSuccessfulReplicatedUpdate = this.lastSuccessfulReplicatedUpdate;
    return {
      'destinationTableBucketArn': destinationTableBucketArn,
      'replicationStatus': replicationStatus.value,
      if (destinationTableArn != null)
        'destinationTableArn': destinationTableArn,
      if (failureMessage != null) 'failureMessage': failureMessage,
      if (lastSuccessfulReplicatedUpdate != null)
        'lastSuccessfulReplicatedUpdate': lastSuccessfulReplicatedUpdate,
    };
  }
}

class ReplicationStatus {
  static const pending = ReplicationStatus._('pending');
  static const completed = ReplicationStatus._('completed');
  static const failed = ReplicationStatus._('failed');

  final String value;

  const ReplicationStatus._(this.value);

  static const values = [pending, completed, failed];

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

/// Contains information about the most recent successful replication update to
/// a destination.
class LastSuccessfulReplicatedUpdate {
  /// The S3 location of the metadata that was successfully replicated.
  final String metadataLocation;

  /// The timestamp when the replication update completed successfully.
  final DateTime timestamp;

  LastSuccessfulReplicatedUpdate({
    required this.metadataLocation,
    required this.timestamp,
  });

  factory LastSuccessfulReplicatedUpdate.fromJson(Map<String, dynamic> json) {
    return LastSuccessfulReplicatedUpdate(
      metadataLocation: (json['metadataLocation'] as String?) ?? '',
      timestamp: nonNullableTimeStampFromJson(json['timestamp'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final metadataLocation = this.metadataLocation;
    final timestamp = this.timestamp;
    return {
      'metadataLocation': metadataLocation,
      'timestamp': iso8601ToJson(timestamp),
    };
  }
}

class TableBucketMaintenanceType {
  static const icebergUnreferencedFileRemoval =
      TableBucketMaintenanceType._('icebergUnreferencedFileRemoval');

  final String value;

  const TableBucketMaintenanceType._(this.value);

  static const values = [icebergUnreferencedFileRemoval];

  static TableBucketMaintenanceType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TableBucketMaintenanceType._(value));

  @override
  bool operator ==(other) =>
      other is TableBucketMaintenanceType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about the values that define the maintenance configuration for a
/// table bucket.
class TableBucketMaintenanceConfigurationValue {
  /// Contains details about the settings of the maintenance configuration.
  final TableBucketMaintenanceSettings? settings;

  /// The status of the maintenance configuration.
  final MaintenanceStatus? status;

  TableBucketMaintenanceConfigurationValue({
    this.settings,
    this.status,
  });

  factory TableBucketMaintenanceConfigurationValue.fromJson(
      Map<String, dynamic> json) {
    return TableBucketMaintenanceConfigurationValue(
      settings: json['settings'] != null
          ? TableBucketMaintenanceSettings.fromJson(
              json['settings'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(MaintenanceStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final settings = this.settings;
    final status = this.status;
    return {
      if (settings != null) 'settings': settings,
      if (status != null) 'status': status.value,
    };
  }
}

/// Contains details about the maintenance settings for the table bucket.
class TableBucketMaintenanceSettings {
  /// The unreferenced file removal settings for the table bucket.
  final IcebergUnreferencedFileRemovalSettings? icebergUnreferencedFileRemoval;

  TableBucketMaintenanceSettings({
    this.icebergUnreferencedFileRemoval,
  });

  factory TableBucketMaintenanceSettings.fromJson(Map<String, dynamic> json) {
    return TableBucketMaintenanceSettings(
      icebergUnreferencedFileRemoval: json['icebergUnreferencedFileRemoval'] !=
              null
          ? IcebergUnreferencedFileRemovalSettings.fromJson(
              json['icebergUnreferencedFileRemoval'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final icebergUnreferencedFileRemoval = this.icebergUnreferencedFileRemoval;
    return {
      if (icebergUnreferencedFileRemoval != null)
        'icebergUnreferencedFileRemoval': icebergUnreferencedFileRemoval,
    };
  }
}

/// Contains details about the unreferenced file removal settings for an Iceberg
/// table bucket.
class IcebergUnreferencedFileRemovalSettings {
  /// The number of days an object has to be non-current before it is deleted.
  final int? nonCurrentDays;

  /// The number of days an object has to be unreferenced before it is marked as
  /// non-current.
  final int? unreferencedDays;

  IcebergUnreferencedFileRemovalSettings({
    this.nonCurrentDays,
    this.unreferencedDays,
  });

  factory IcebergUnreferencedFileRemovalSettings.fromJson(
      Map<String, dynamic> json) {
    return IcebergUnreferencedFileRemovalSettings(
      nonCurrentDays: json['nonCurrentDays'] as int?,
      unreferencedDays: json['unreferencedDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final nonCurrentDays = this.nonCurrentDays;
    final unreferencedDays = this.unreferencedDays;
    return {
      if (nonCurrentDays != null) 'nonCurrentDays': nonCurrentDays,
      if (unreferencedDays != null) 'unreferencedDays': unreferencedDays,
    };
  }
}

/// Contains details about a table bucket.
class TableBucketSummary {
  /// The Amazon Resource Name (ARN) of the table bucket.
  final String arn;

  /// The date and time the table bucket was created at.
  final DateTime createdAt;

  /// The name of the table bucket.
  final String name;

  /// The ID of the account that owns the table bucket.
  final String ownerAccountId;

  /// The system-assigned unique identifier for the table bucket.
  final String? tableBucketId;

  /// The type of the table bucket.
  final TableBucketType? type;

  TableBucketSummary({
    required this.arn,
    required this.createdAt,
    required this.name,
    required this.ownerAccountId,
    this.tableBucketId,
    this.type,
  });

  factory TableBucketSummary.fromJson(Map<String, dynamic> json) {
    return TableBucketSummary(
      arn: (json['arn'] as String?) ?? '',
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      name: (json['name'] as String?) ?? '',
      ownerAccountId: (json['ownerAccountId'] as String?) ?? '',
      tableBucketId: json['tableBucketId'] as String?,
      type: (json['type'] as String?)?.let(TableBucketType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final ownerAccountId = this.ownerAccountId;
    final tableBucketId = this.tableBucketId;
    final type = this.type;
    return {
      'arn': arn,
      'createdAt': iso8601ToJson(createdAt),
      'name': name,
      'ownerAccountId': ownerAccountId,
      if (tableBucketId != null) 'tableBucketId': tableBucketId,
      if (type != null) 'type': type.value,
    };
  }
}

class TableBucketType {
  static const customer = TableBucketType._('customer');
  static const aws = TableBucketType._('aws');

  final String value;

  const TableBucketType._(this.value);

  static const values = [customer, aws];

  static TableBucketType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TableBucketType._(value));

  @override
  bool operator ==(other) => other is TableBucketType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The replication configuration for a table bucket. This configuration defines
/// how tables in the source bucket are replicated to destination table buckets,
/// including the IAM role used for replication.
class TableBucketReplicationConfiguration {
  /// The Amazon Resource Name (ARN) of the IAM role that S3 Tables assumes to
  /// replicate tables on your behalf.
  final String role;

  /// An array of replication rules that define which tables to replicate and
  /// where to replicate them.
  final List<TableBucketReplicationRule> rules;

  TableBucketReplicationConfiguration({
    required this.role,
    required this.rules,
  });

  factory TableBucketReplicationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TableBucketReplicationConfiguration(
      role: (json['role'] as String?) ?? '',
      rules: ((json['rules'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              TableBucketReplicationRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final role = this.role;
    final rules = this.rules;
    return {
      'role': role,
      'rules': rules,
    };
  }
}

/// Defines a rule for replicating tables from a source table bucket to one or
/// more destination table buckets.
class TableBucketReplicationRule {
  /// An array of destination table buckets where tables should be replicated.
  final List<ReplicationDestination> destinations;

  TableBucketReplicationRule({
    required this.destinations,
  });

  factory TableBucketReplicationRule.fromJson(Map<String, dynamic> json) {
    return TableBucketReplicationRule(
      destinations: ((json['destinations'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => ReplicationDestination.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    return {
      'destinations': destinations,
    };
  }
}

/// Contains details about a namespace.
class NamespaceSummary {
  /// The date and time the namespace was created at.
  final DateTime createdAt;

  /// The ID of the account that created the namespace.
  final String createdBy;

  /// The name of the namespace.
  final List<String> namespace;

  /// The ID of the account that owns the namespace.
  final String ownerAccountId;

  /// The system-assigned unique identifier for the namespace.
  final String? namespaceId;

  /// The system-assigned unique identifier for the table bucket that contains
  /// this namespace.
  final String? tableBucketId;

  NamespaceSummary({
    required this.createdAt,
    required this.createdBy,
    required this.namespace,
    required this.ownerAccountId,
    this.namespaceId,
    this.tableBucketId,
  });

  factory NamespaceSummary.fromJson(Map<String, dynamic> json) {
    return NamespaceSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] ?? 0),
      createdBy: (json['createdBy'] as String?) ?? '',
      namespace: ((json['namespace'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      ownerAccountId: (json['ownerAccountId'] as String?) ?? '',
      namespaceId: json['namespaceId'] as String?,
      tableBucketId: json['tableBucketId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final namespace = this.namespace;
    final ownerAccountId = this.ownerAccountId;
    final namespaceId = this.namespaceId;
    final tableBucketId = this.tableBucketId;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'namespace': namespace,
      'ownerAccountId': ownerAccountId,
      if (namespaceId != null) 'namespaceId': namespaceId,
      if (tableBucketId != null) 'tableBucketId': tableBucketId,
    };
  }
}

class Document {
  Document();

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
}

class MethodNotAllowedException extends _s.GenericAwsException {
  MethodNotAllowedException({String? type, String? message})
      : super(type: type, code: 'MethodNotAllowedException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'MethodNotAllowedException': (type, message) =>
      MethodNotAllowedException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
};
