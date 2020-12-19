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
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'kendra-2019-02-03.g.dart';

/// Amazon Kendra is a service for indexing large document sets.
class Kendra {
  final _s.JsonProtocol _protocol;
  Kendra({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kendra',
            signingName: 'kendra',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Removes one or more documents from an index. The documents must have been
  /// added with the <a>BatchPutDocument</a> operation.
  ///
  /// The documents are deleted asynchronously. You can see the progress of the
  /// deletion by using AWS CloudWatch. Any error messages releated to the
  /// processing of the batch are sent to you CloudWatch log.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documentIdList] :
  /// One or more identifiers for documents to delete from the index.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the documents to delete.
  Future<BatchDeleteDocumentResponse> batchDeleteDocument({
    @_s.required List<String> documentIdList,
    @_s.required String indexId,
  }) async {
    ArgumentError.checkNotNull(documentIdList, 'documentIdList');
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.BatchDeleteDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentIdList': documentIdList,
        'IndexId': indexId,
      },
    );

    return BatchDeleteDocumentResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more documents to an index.
  ///
  /// The <code>BatchPutDocument</code> operation enables you to ingest inline
  /// documents or a set of documents stored in an Amazon S3 bucket. Use this
  /// operation to ingest your text and unstructured text into an index, add
  /// custom attributes to the documents, and to attach an access control list
  /// to the documents added to the index.
  ///
  /// The documents are indexed asynchronously. You can see the progress of the
  /// batch using AWS CloudWatch. Any error messages related to processing the
  /// batch are sent to your AWS CloudWatch log.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documents] :
  /// One or more documents to add to the index.
  ///
  /// Each document is limited to 5 Mb, the total size of the list is limited to
  /// 50 Mb.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index to add the documents to. You need to create
  /// the index first using the <a>CreateIndex</a> operation.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role that is allowed to run the
  /// <code>BatchPutDocument</code> operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// Roles for Amazon Kendra</a>.
  Future<BatchPutDocumentResponse> batchPutDocument({
    @_s.required List<Document> documents,
    @_s.required String indexId,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(documents, 'documents');
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.BatchPutDocument'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Documents': documents,
        'IndexId': indexId,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );

    return BatchPutDocumentResponse.fromJson(jsonResponse.body);
  }

  /// Creates a data source that you use to with an Amazon Kendra index.
  ///
  /// You specify a name, connector type and description for your data source.
  /// You can choose between an S3 connector, a SharePoint Online connector, and
  /// a database connector.
  ///
  /// You also specify configuration information such as document metadata
  /// (author, source URI, and so on) and user context information.
  ///
  /// <code>CreateDataSource</code> is a synchronous operation. The operation
  /// returns 200 if the data source was successfully created. Otherwise, an
  /// exception is raised.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [configuration] :
  /// The connector configuration information that is required to access the
  /// repository.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that should be associated with this data
  /// source.
  ///
  /// Parameter [name] :
  /// A unique name for the data source. A data source name can't be changed
  /// without deleting and recreating the data source.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the
  /// data source. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// Roles for Amazon Kendra</a>.
  ///
  /// Parameter [type] :
  /// The type of repository that contains the data source.
  ///
  /// Parameter [description] :
  /// A description for the data source.
  ///
  /// Parameter [schedule] :
  /// Sets the frequency that Amazon Kendra will check the documents in your
  /// repository and update the index. If you don't set a schedule Amazon Kendra
  /// will not periodically update the index. You can call the
  /// <code>StartDataSourceSyncJob</code> operation to update the index.
  Future<CreateDataSourceResponse> createDataSource({
    @_s.required DataSourceConfiguration configuration,
    @_s.required String indexId,
    @_s.required String name,
    @_s.required String roleArn,
    @_s.required DataSourceType type,
    String description,
    String schedule,
  }) async {
    ArgumentError.checkNotNull(configuration, 'configuration');
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^\P{C}*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.CreateDataSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Configuration': configuration,
        'IndexId': indexId,
        'Name': name,
        'RoleArn': roleArn,
        'Type': type?.toValue() ?? '',
        if (description != null) 'Description': description,
        if (schedule != null) 'Schedule': schedule,
      },
    );

    return CreateDataSourceResponse.fromJson(jsonResponse.body);
  }

  /// Creates an new set of frequently asked question (FAQ) questions and
  /// answers.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the FAQ.
  ///
  /// Parameter [name] :
  /// The name that should be associated with the FAQ.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the S3
  /// bucket that contains the FAQs. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// Roles for Amazon Kendra</a>.
  ///
  /// Parameter [s3Path] :
  /// The S3 location of the FAQ input data.
  ///
  /// Parameter [description] :
  /// A description of the FAQ.
  Future<CreateFaqResponse> createFaq({
    @_s.required String indexId,
    @_s.required String name,
    @_s.required String roleArn,
    @_s.required S3Path s3Path,
    String description,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(s3Path, 's3Path');
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^\P{C}*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.CreateFaq'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
        'Name': name,
        'RoleArn': roleArn,
        'S3Path': s3Path,
        if (description != null) 'Description': description,
      },
    );

    return CreateFaqResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon Kendra index. Index creation is an asynchronous
  /// operation. To determine if index creation has completed, check the
  /// <code>Status</code> field returned from a call to . The
  /// <code>Status</code> field is set to <code>ACTIVE</code> when the index is
  /// ready to use.
  ///
  /// Once the index is active you can index your documents using the operation
  /// or using one of the supported data sources.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceAlreadyExistException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name for the new index.
  ///
  /// Parameter [roleArn] :
  /// An IAM role that gives Amazon Kendra permissions to access your Amazon
  /// CloudWatch logs and metrics. This is also the role used when you use the
  /// <code>BatchPutDocument</code> operation to index documents from an Amazon
  /// S3 bucket.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create an index.
  /// Multiple calls to the <code>CreateIndex</code> operation with the same
  /// client token will create only one index.”
  ///
  /// Parameter [description] :
  /// A description for the index.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The identifier of the AWS KMS customer managed key (CMK) to use to encrypt
  /// data indexed by Amazon Kendra. Amazon Kendra doesn't support asymmetric
  /// CMKs.
  Future<CreateIndexResponse> createIndex({
    @_s.required String name,
    @_s.required String roleArn,
    String clientToken,
    String description,
    ServerSideEncryptionConfiguration serverSideEncryptionConfiguration,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
      isRequired: true,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^\P{C}*$''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.CreateIndex'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Name': name,
        'RoleArn': roleArn,
        if (clientToken != null) 'ClientToken': clientToken,
        if (description != null) 'Description': description,
        if (serverSideEncryptionConfiguration != null)
          'ServerSideEncryptionConfiguration':
              serverSideEncryptionConfiguration,
      },
    );

    return CreateIndexResponse.fromJson(jsonResponse.body);
  }

  /// Removes an FAQ from an index.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the FAQ to remove.
  ///
  /// Parameter [indexId] :
  /// The index to remove the FAQ from.
  Future<void> deleteFaq({
    @_s.required String id,
    @_s.required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteFaq'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
      },
    );
  }

  /// Deletes an existing Amazon Kendra index. An exception is not thrown if the
  /// index is already being deleted. While the index is being deleted, the
  /// <code>Status</code> field returned by a call to the <a>DescribeIndex</a>
  /// operation is set to <code>DELETING</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the index to delete.
  Future<void> deleteIndex({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteIndex'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );
  }

  /// Gets information about a Amazon Kendra data source.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the data source to describe.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the data source.
  Future<DescribeDataSourceResponse> describeDataSource({
    @_s.required String id,
    @_s.required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DescribeDataSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
      },
    );

    return DescribeDataSourceResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about an FAQ list.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the FAQ.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the FAQ.
  Future<DescribeFaqResponse> describeFaq({
    @_s.required String id,
    @_s.required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DescribeFaq'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
      },
    );

    return DescribeFaqResponse.fromJson(jsonResponse.body);
  }

  /// Describes an existing Amazon Kendra index
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The name of the index to describe.
  Future<DescribeIndexResponse> describeIndex({
    @_s.required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DescribeIndex'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
      },
    );

    return DescribeIndexResponse.fromJson(jsonResponse.body);
  }

  /// Gets statistics about synchronizing Amazon Kendra with a data source.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the data source.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the data source.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of synchronization jobs to return in the response. If
  /// there are fewer results in the list, this response contains only the
  /// actual results.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request to
  /// <code>GetDataSourceSyncJobHistory</code> was truncated, include the
  /// <code>NextToken</code> to fetch the next set of jobs.
  ///
  /// Parameter [startTimeFilter] :
  /// When specified, the synchronization jobs returned in the list are limited
  /// to jobs between the specified dates.
  ///
  /// Parameter [statusFilter] :
  /// When specified, only returns synchronization jobs with the
  /// <code>Status</code> field equal to the specified status.
  Future<ListDataSourceSyncJobsResponse> listDataSourceSyncJobs({
    @_s.required String id,
    @_s.required String indexId,
    int maxResults,
    String nextToken,
    TimeRange startTimeFilter,
    DataSourceSyncJobStatus statusFilter,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      800,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListDataSourceSyncJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (startTimeFilter != null) 'StartTimeFilter': startTimeFilter,
        if (statusFilter != null) 'StatusFilter': statusFilter.toValue(),
      },
    );

    return ListDataSourceSyncJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the data sources that you have created.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the data source.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data sources to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of data sources
  /// (<code>DataSourceSummaryItems</code>).
  Future<ListDataSourcesResponse> listDataSources({
    @_s.required String indexId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      800,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListDataSources'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListDataSourcesResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of FAQ lists associated with an index.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The index that contains the FAQ lists.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of FAQs to return in the response. If there are fewer
  /// results in the list, this response contains only the actual results.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request to <code>ListFaqs</code> was
  /// truncated, include the <code>NextToken</code> to fetch the next set of
  /// FAQs.
  Future<ListFaqsResponse> listFaqs({
    @_s.required String indexId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      800,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListFaqs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFaqsResponse.fromJson(jsonResponse.body);
  }

  /// Lists the Amazon Kendra indexes that you have created.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data sources to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of indexes
  /// (<code>DataSourceSummaryItems</code>).
  Future<ListIndicesResponse> listIndices({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      800,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListIndices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListIndicesResponse.fromJson(jsonResponse.body);
  }

  /// Searches an active index. Use this API to search your documents using
  /// query. The <code>Query</code> operation enables to do faceted search and
  /// to filter results based on document attributes.
  ///
  /// It also enables you to provide user context that Amazon Kendra uses to
  /// enforce document access control in the search results.
  ///
  /// Amazon Kendra searches your index for text content and question and answer
  /// (FAQ) content. By default the response contains three types of results.
  ///
  /// <ul>
  /// <li>
  /// Relevant passages
  /// </li>
  /// <li>
  /// Matching FAQs
  /// </li>
  /// <li>
  /// Relevant documents
  /// </li>
  /// </ul>
  /// You can specify that the query return only one type of result using the
  /// <code>QueryResultTypeConfig</code> parameter.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The unique identifier of the index to search. The identifier is returned
  /// in the response from the operation.
  ///
  /// Parameter [queryText] :
  /// The text to search for.
  ///
  /// Parameter [attributeFilter] :
  /// Enables filtered searches based on document attributes. You can only
  /// provide one attribute filter; however, the <code>AndAllFilters</code>,
  /// <code>NotFilter</code>, and <code>OrAllFilters</code> parameters contain a
  /// list of other filters.
  ///
  /// The <code>AttributeFilter</code> parameter enables you to create a set of
  /// filtering rules that a document must satisfy to be included in the query
  /// results.
  ///
  /// Parameter [facets] :
  /// An array of documents attributes. Amazon Kendra returns a count for each
  /// attribute key specified. You can use this information to help narrow the
  /// search for your user.
  ///
  /// Parameter [pageNumber] :
  /// Query results are returned in pages the size of the <code>PageSize</code>
  /// parameter. By default, Amazon Kendra returns the first page of results.
  /// Use this parameter to get result pages after the first one.
  ///
  /// Parameter [pageSize] :
  /// Sets the number of results that are returned in each page of results. The
  /// default page size is 100.
  ///
  /// Parameter [queryResultTypeFilter] :
  /// Sets the type of query. Only results for the specified query type are
  /// returned.
  ///
  /// Parameter [requestedDocumentAttributes] :
  /// An array of document attributes to include in the response. No other
  /// document attributes are included in the response. By default all document
  /// attributes are included in the response.
  Future<QueryResult> query({
    @_s.required String indexId,
    @_s.required String queryText,
    AttributeFilter attributeFilter,
    List<Facet> facets,
    int pageNumber,
    int pageSize,
    QueryResultType queryResultTypeFilter,
    List<String> requestedDocumentAttributes,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(queryText, 'queryText');
    _s.validateStringLength(
      'queryText',
      queryText,
      1,
      1000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'queryText',
      queryText,
      r'''^\P{C}*$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.Query'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
        'QueryText': queryText,
        if (attributeFilter != null) 'AttributeFilter': attributeFilter,
        if (facets != null) 'Facets': facets,
        if (pageNumber != null) 'PageNumber': pageNumber,
        if (pageSize != null) 'PageSize': pageSize,
        if (queryResultTypeFilter != null)
          'QueryResultTypeFilter': queryResultTypeFilter.toValue(),
        if (requestedDocumentAttributes != null)
          'RequestedDocumentAttributes': requestedDocumentAttributes,
      },
    );

    return QueryResult.fromJson(jsonResponse.body);
  }

  /// Starts a synchronization job for a data source. If a synchronization job
  /// is already in progress, Amazon Kendra returns a
  /// <code>ResourceInUseException</code> exception.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceInUseException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the data source to synchronize.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the data source.
  Future<StartDataSourceSyncJobResponse> startDataSourceSyncJob({
    @_s.required String id,
    @_s.required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.StartDataSourceSyncJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
      },
    );

    return StartDataSourceSyncJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a running synchronization job. You can't stop a scheduled
  /// synchronization job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the data source for which to stop the synchronization
  /// jobs.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the data source.
  Future<void> stopDataSourceSyncJob({
    @_s.required String id,
    @_s.required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.StopDataSourceSyncJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
      },
    );
  }

  /// Enables you to provide feedback to Amazon Kendra to improve the
  /// performance of the service.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that was queried.
  ///
  /// Parameter [queryId] :
  /// The identifier of the specific query for which you are submitting
  /// feedback. The query ID is returned in the response to the operation.
  ///
  /// Parameter [clickFeedbackItems] :
  /// Tells Amazon Kendra that a particular search result link was chosen by the
  /// user.
  ///
  /// Parameter [relevanceFeedbackItems] :
  /// Provides Amazon Kendra with relevant or not relevant feedback for whether
  /// a particular item was relevant to the search.
  Future<void> submitFeedback({
    @_s.required String indexId,
    @_s.required String queryId,
    List<ClickFeedback> clickFeedbackItems,
    List<RelevanceFeedback> relevanceFeedbackItems,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(queryId, 'queryId');
    _s.validateStringLength(
      'queryId',
      queryId,
      1,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.SubmitFeedback'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
        'QueryId': queryId,
        if (clickFeedbackItems != null)
          'ClickFeedbackItems': clickFeedbackItems,
        if (relevanceFeedbackItems != null)
          'RelevanceFeedbackItems': relevanceFeedbackItems,
      },
    );
  }

  /// Updates an existing Amazon Kendra data source.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the data source to update.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that contains the data source to update.
  ///
  /// Parameter [description] :
  /// The new description for the data source.
  ///
  /// Parameter [name] :
  /// The name of the data source to update. The name of the data source can't
  /// be updated. To rename a data source you must delete the data source and
  /// re-create it.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the new role to use when the data source
  /// is accessing resources on your behalf.
  ///
  /// Parameter [schedule] :
  /// The new update schedule for the data source.
  Future<void> updateDataSource({
    @_s.required String id,
    @_s.required String indexId,
    DataSourceConfiguration configuration,
    String description,
    String name,
    String roleArn,
    String schedule,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'indexId',
      indexId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^\P{C}*$''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1000,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateDataSource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
        if (configuration != null) 'Configuration': configuration,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
        if (roleArn != null) 'RoleArn': roleArn,
        if (schedule != null) 'Schedule': schedule,
      },
    );
  }

  /// Updates an existing Amazon Kendra index.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the index to update.
  ///
  /// Parameter [description] :
  /// A new description for the index.
  ///
  /// Parameter [documentMetadataConfigurationUpdates] :
  /// The document metadata to update.
  ///
  /// Parameter [name] :
  /// The name of the index to update.
  ///
  /// Parameter [roleArn] :
  /// A new IAM role that gives Amazon Kendra permission to access your Amazon
  /// CloudWatch logs.
  Future<void> updateIndex({
    @_s.required String id,
    String description,
    List<DocumentMetadataConfiguration> documentMetadataConfigurationUpdates,
    String name,
    String roleArn,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringPattern(
      'id',
      id,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      1,
      1000,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''^\P{C}*$''',
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1000,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
    );
    _s.validateStringPattern(
      'roleArn',
      roleArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateIndex'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (description != null) 'Description': description,
        if (documentMetadataConfigurationUpdates != null)
          'DocumentMetadataConfigurationUpdates':
              documentMetadataConfigurationUpdates,
        if (name != null) 'Name': name,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );
  }
}

/// Access Control List files for the documents in a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccessControlListConfiguration {
  /// Path to the AWS S3 bucket that contains the ACL files.
  @_s.JsonKey(name: 'KeyPath')
  final String keyPath;

  AccessControlListConfiguration({
    this.keyPath,
  });
  factory AccessControlListConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AccessControlListConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AccessControlListConfigurationToJson(this);
}

/// Provides information about the column that should be used for filtering the
/// query response by groups.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AclConfiguration {
  /// A list of groups, separated by semi-colons, that filters a query response
  /// based on user context. The document is only returned to users that are in
  /// one of the groups specified in the <code>UserContext</code> field of the
  /// <a>Query</a> operation.
  @_s.JsonKey(name: 'AllowedGroupsColumnName')
  final String allowedGroupsColumnName;

  AclConfiguration({
    @_s.required this.allowedGroupsColumnName,
  });
  factory AclConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AclConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AclConfigurationToJson(this);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdditionalResultAttribute {
  /// <p/>
  @_s.JsonKey(name: 'Key')
  final String key;

  /// <p/>
  @_s.JsonKey(name: 'Value')
  final AdditionalResultAttributeValue value;

  /// <p/>
  @_s.JsonKey(name: 'ValueType')
  final AdditionalResultAttributeValueType valueType;

  AdditionalResultAttribute({
    @_s.required this.key,
    @_s.required this.value,
    @_s.required this.valueType,
  });
  factory AdditionalResultAttribute.fromJson(Map<String, dynamic> json) =>
      _$AdditionalResultAttributeFromJson(json);
}

/// An attribute returned with a document from a search.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdditionalResultAttributeValue {
  /// The text associated with the attribute and information about the highlight
  /// to apply to the text.
  @_s.JsonKey(name: 'TextWithHighlightsValue')
  final TextWithHighlights textWithHighlightsValue;

  AdditionalResultAttributeValue({
    this.textWithHighlightsValue,
  });
  factory AdditionalResultAttributeValue.fromJson(Map<String, dynamic> json) =>
      _$AdditionalResultAttributeValueFromJson(json);
}

enum AdditionalResultAttributeValueType {
  @_s.JsonValue('TEXT_WITH_HIGHLIGHTS_VALUE')
  textWithHighlightsValue,
}

/// Provides filtering the query results based on document attributes.
///
/// When you use the <code>AndAllFilters</code> or <code>OrAllFilters</code>,
/// filters you can use a total of 3 layers. For example, you can use:
/// <ol>
/// <li>
/// <code>&lt;AndAllFilters&gt;</code>
/// </li>
/// <li>
/// <code> &lt;OrAllFilters&gt;</code>
/// </li>
/// <li>
/// <code> &lt;EqualTo&gt;</code>
/// </li> </ol>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class AttributeFilter {
  /// Performs a logical <code>AND</code> operation on all supplied filters.
  @_s.JsonKey(name: 'AndAllFilters')
  final List<AttributeFilter> andAllFilters;

  /// Returns true when a document contains all of the specified document
  /// attributes.
  @_s.JsonKey(name: 'ContainsAll')
  final DocumentAttribute containsAll;

  /// Returns true when a document contains any of the specified document
  /// attributes.
  @_s.JsonKey(name: 'ContainsAny')
  final DocumentAttribute containsAny;

  /// Performs an equals operation on two document attributes.
  @_s.JsonKey(name: 'EqualsTo')
  final DocumentAttribute equalsTo;

  /// Performs a greater than operation on two document attributes. Use with a
  /// document attribute of type <code>Integer</code> or <code>Long</code>.
  @_s.JsonKey(name: 'GreaterThan')
  final DocumentAttribute greaterThan;

  /// Performs a greater or equals than operation on two document attributes. Use
  /// with a document attribute of type <code>Integer</code> or <code>Long</code>.
  @_s.JsonKey(name: 'GreaterThanOrEquals')
  final DocumentAttribute greaterThanOrEquals;

  /// Performs a less than operation on two document attributes. Use with a
  /// document attribute of type <code>Integer</code> or <code>Long</code>.
  @_s.JsonKey(name: 'LessThan')
  final DocumentAttribute lessThan;

  /// Performs a less than or equals operation on two document attributes. Use
  /// with a document attribute of type <code>Integer</code> or <code>Long</code>.
  @_s.JsonKey(name: 'LessThanOrEquals')
  final DocumentAttribute lessThanOrEquals;

  /// Performs a logical <code>NOT</code> operation on all supplied filters.
  @_s.JsonKey(name: 'NotFilter')
  final AttributeFilter notFilter;

  /// Performs a logical <code>OR</code> operation on all supplied filters.
  @_s.JsonKey(name: 'OrAllFilters')
  final List<AttributeFilter> orAllFilters;

  AttributeFilter({
    this.andAllFilters,
    this.containsAll,
    this.containsAny,
    this.equalsTo,
    this.greaterThan,
    this.greaterThanOrEquals,
    this.lessThan,
    this.lessThanOrEquals,
    this.notFilter,
    this.orAllFilters,
  });
  Map<String, dynamic> toJson() => _$AttributeFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteDocumentResponse {
  /// A list of documents that could not be removed from the index. Each entry
  /// contains an error message that indicates why the document couldn't be
  /// removed from the index.
  @_s.JsonKey(name: 'FailedDocuments')
  final List<BatchDeleteDocumentResponseFailedDocument> failedDocuments;

  BatchDeleteDocumentResponse({
    this.failedDocuments,
  });
  factory BatchDeleteDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteDocumentResponseFromJson(json);
}

/// Provides information about documents that could not be removed from an index
/// by the <a>BatchDeleteDocument</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteDocumentResponseFailedDocument {
  /// The error code for why the document couldn't be removed from the index.
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// An explanation for why the document couldn't be removed from the index.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier of the document that couldn't be removed from the index.
  @_s.JsonKey(name: 'Id')
  final String id;

  BatchDeleteDocumentResponseFailedDocument({
    this.errorCode,
    this.errorMessage,
    this.id,
  });
  factory BatchDeleteDocumentResponseFailedDocument.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDeleteDocumentResponseFailedDocumentFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutDocumentResponse {
  /// A list of documents that were not added to the index because the document
  /// failed a validation check. Each document contains an error message that
  /// indicates why the document couldn't be added to the index.
  ///
  /// If there was an error adding a document to an index the error is reported in
  /// your AWS CloudWatch log.
  @_s.JsonKey(name: 'FailedDocuments')
  final List<BatchPutDocumentResponseFailedDocument> failedDocuments;

  BatchPutDocumentResponse({
    this.failedDocuments,
  });
  factory BatchPutDocumentResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchPutDocumentResponseFromJson(json);
}

/// Provides information about a document that could not be indexed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchPutDocumentResponseFailedDocument {
  /// The type of error that caused the document to fail to be indexed.
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// A description of the reason why the document could not be indexed.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The unique identifier of the document.
  @_s.JsonKey(name: 'Id')
  final String id;

  BatchPutDocumentResponseFailedDocument({
    this.errorCode,
    this.errorMessage,
    this.id,
  });
  factory BatchPutDocumentResponseFailedDocument.fromJson(
          Map<String, dynamic> json) =>
      _$BatchPutDocumentResponseFailedDocumentFromJson(json);
}

/// Gathers information about when a particular result was clicked by a user.
/// Your application uses the <a>SubmitFeedback</a> operation to provide click
/// information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ClickFeedback {
  /// The Unix timestamp of the data and time that the result was clicked.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ClickTime')
  final DateTime clickTime;

  /// The unique identifier of the search result that was clicked.
  @_s.JsonKey(name: 'ResultId')
  final String resultId;

  ClickFeedback({
    @_s.required this.clickTime,
    @_s.required this.resultId,
  });
  Map<String, dynamic> toJson() => _$ClickFeedbackToJson(this);
}

/// Provides information about how Amazon Kendra should use the columns of a
/// database in an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ColumnConfiguration {
  /// One to five columns that indicate when a document in the database has
  /// changed.
  @_s.JsonKey(name: 'ChangeDetectingColumns')
  final List<String> changeDetectingColumns;

  /// The column that contains the contents of the document.
  @_s.JsonKey(name: 'DocumentDataColumnName')
  final String documentDataColumnName;

  /// The column that provides the document's unique identifier.
  @_s.JsonKey(name: 'DocumentIdColumnName')
  final String documentIdColumnName;

  /// The column that contains the title of the document.
  @_s.JsonKey(name: 'DocumentTitleColumnName')
  final String documentTitleColumnName;

  /// An array of objects that map database column names to the corresponding
  /// fields in an index. You must first create the fields in the index using the
  /// <a>UpdateIndex</a> operation.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  ColumnConfiguration({
    @_s.required this.changeDetectingColumns,
    @_s.required this.documentDataColumnName,
    @_s.required this.documentIdColumnName,
    this.documentTitleColumnName,
    this.fieldMappings,
  });
  factory ColumnConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ColumnConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ColumnConfigurationToJson(this);
}

/// Provides the information necessary to connect to a database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConnectionConfiguration {
  /// The name of the host for the database. Can be either a string
  /// (host.subdomain.domain.tld) or an IPv4 or IPv6 address.
  @_s.JsonKey(name: 'DatabaseHost')
  final String databaseHost;

  /// The name of the database containing the document data.
  @_s.JsonKey(name: 'DatabaseName')
  final String databaseName;

  /// The port that the database uses for connections.
  @_s.JsonKey(name: 'DatabasePort')
  final int databasePort;

  /// The Amazon Resource Name (ARN) of credentials stored in AWS Secrets Manager.
  /// The credentials should be a user/password pair. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html">Using
  /// a Database Data Source</a>. For more information about AWS Secrets Manager,
  /// see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">
  /// What Is AWS Secrets Manager </a> in the <i>AWS Secrets Manager</i> user
  /// guide.
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  /// The name of the table that contains the document data.
  @_s.JsonKey(name: 'TableName')
  final String tableName;

  ConnectionConfiguration({
    @_s.required this.databaseHost,
    @_s.required this.databaseName,
    @_s.required this.databasePort,
    @_s.required this.secretArn,
    @_s.required this.tableName,
  });
  factory ConnectionConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ConnectionConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConnectionConfigurationToJson(this);
}

enum ContentType {
  @_s.JsonValue('PDF')
  pdf,
  @_s.JsonValue('HTML')
  html,
  @_s.JsonValue('MS_WORD')
  msWord,
  @_s.JsonValue('PLAIN_TEXT')
  plainText,
  @_s.JsonValue('PPT')
  ppt,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDataSourceResponse {
  /// A unique identifier for the data source.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateDataSourceResponse({
    @_s.required this.id,
  });
  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFaqResponse {
  /// The unique identifier of the FAQ.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateFaqResponse({
    this.id,
  });
  factory CreateFaqResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFaqResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateIndexResponse {
  /// The unique identifier of the index. Use this identifier when you query an
  /// index, set up a data source, or index a document.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateIndexResponse({
    this.id,
  });
  factory CreateIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateIndexResponseFromJson(json);
}

/// Configuration information for a Amazon Kendra data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSourceConfiguration {
  /// Provides information necessary to create a connector for a database.
  @_s.JsonKey(name: 'DatabaseConfiguration')
  final DatabaseConfiguration databaseConfiguration;

  /// Provides information to create a connector for a document repository in an
  /// Amazon S3 bucket.
  @_s.JsonKey(name: 'S3Configuration')
  final S3DataSourceConfiguration s3Configuration;

  /// Provides information necessary to create a connector for a Microsoft
  /// SharePoint site.
  @_s.JsonKey(name: 'SharePointConfiguration')
  final SharePointConfiguration sharePointConfiguration;

  DataSourceConfiguration({
    this.databaseConfiguration,
    this.s3Configuration,
    this.sharePointConfiguration,
  });
  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DataSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceConfigurationToJson(this);
}

enum DataSourceStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('ACTIVE')
  active,
}

/// Summary information for a Amazon Kendra data source. Returned in a call to .
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSourceSummary {
  /// The UNIX datetime that the data source was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier for the data source.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the data source.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The status of the data source. When the status is <code>ATIVE</code> the
  /// data source is ready to use.
  @_s.JsonKey(name: 'Status')
  final DataSourceStatus status;

  /// The type of the data source.
  @_s.JsonKey(name: 'Type')
  final DataSourceType type;

  /// The UNIX datetime that the data source was lasted updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  DataSourceSummary({
    this.createdAt,
    this.id,
    this.name,
    this.status,
    this.type,
    this.updatedAt,
  });
  factory DataSourceSummary.fromJson(Map<String, dynamic> json) =>
      _$DataSourceSummaryFromJson(json);
}

/// Provides information about a synchronization job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSourceSyncJob {
  /// If the reason that the synchronization failed is due to an error with the
  /// underlying data source, this field contains a code that identifies the
  /// error.
  @_s.JsonKey(name: 'DataSourceErrorCode')
  final String dataSourceErrorCode;

  /// The UNIX datetime that the synchronization job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// If the <code>Status</code> field is set to <code>FAILED</code>, the
  /// <code>ErrorCode</code> field contains a the reason that the synchronization
  /// failed.
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// If the <code>Status</code> field is set to <code>ERROR</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the synchronization to fail.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// A unique identifier for the synchronization job.
  @_s.JsonKey(name: 'ExecutionId')
  final String executionId;

  /// The UNIX datetime that the synchronization job was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The execution status of the synchronization job. When the
  /// <code>Status</code> field is set to <code>SUCCEEDED</code>, the
  /// synchronization job is done. If the status code is set to
  /// <code>FAILED</code>, the <code>ErrorCode</code> and
  /// <code>ErrorMessage</code> fields give you the reason for the failure.
  @_s.JsonKey(name: 'Status')
  final DataSourceSyncJobStatus status;

  DataSourceSyncJob({
    this.dataSourceErrorCode,
    this.endTime,
    this.errorCode,
    this.errorMessage,
    this.executionId,
    this.startTime,
    this.status,
  });
  factory DataSourceSyncJob.fromJson(Map<String, dynamic> json) =>
      _$DataSourceSyncJobFromJson(json);
}

enum DataSourceSyncJobStatus {
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('SYNCING')
  syncing,
  @_s.JsonValue('INCOMPLETE')
  incomplete,
  @_s.JsonValue('STOPPING')
  stopping,
  @_s.JsonValue('ABORTED')
  aborted,
}

extension on DataSourceSyncJobStatus {
  String toValue() {
    switch (this) {
      case DataSourceSyncJobStatus.failed:
        return 'FAILED';
      case DataSourceSyncJobStatus.succeeded:
        return 'SUCCEEDED';
      case DataSourceSyncJobStatus.syncing:
        return 'SYNCING';
      case DataSourceSyncJobStatus.incomplete:
        return 'INCOMPLETE';
      case DataSourceSyncJobStatus.stopping:
        return 'STOPPING';
      case DataSourceSyncJobStatus.aborted:
        return 'ABORTED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Maps a column or attribute in the data source to an index field. You must
/// first create the fields in the index using the <a>UpdateIndex</a> operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSourceToIndexFieldMapping {
  /// The name of the column or attribute in the data source.
  @_s.JsonKey(name: 'DataSourceFieldName')
  final String dataSourceFieldName;

  /// The name of the field in the index.
  @_s.JsonKey(name: 'IndexFieldName')
  final String indexFieldName;

  /// The type of data stored in the column or attribute.
  @_s.JsonKey(name: 'DateFieldFormat')
  final String dateFieldFormat;

  DataSourceToIndexFieldMapping({
    @_s.required this.dataSourceFieldName,
    @_s.required this.indexFieldName,
    this.dateFieldFormat,
  });
  factory DataSourceToIndexFieldMapping.fromJson(Map<String, dynamic> json) =>
      _$DataSourceToIndexFieldMappingFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceToIndexFieldMappingToJson(this);
}

enum DataSourceType {
  @_s.JsonValue('S3')
  s3,
  @_s.JsonValue('SHAREPOINT')
  sharepoint,
  @_s.JsonValue('DATABASE')
  database,
}

extension on DataSourceType {
  String toValue() {
    switch (this) {
      case DataSourceType.s3:
        return 'S3';
      case DataSourceType.sharepoint:
        return 'SHAREPOINT';
      case DataSourceType.database:
        return 'DATABASE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides information for connecting to an Amazon VPC.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSourceVpcConfiguration {
  /// A list of identifiers of security groups within your Amazon VPC. The
  /// security groups should enable Amazon Kendra to connect to the data source.
  @_s.JsonKey(name: 'SecurityGroupIds')
  final List<String> securityGroupIds;

  /// A list of identifiers for subnets within your Amazon VPC. The subnets should
  /// be able to connect to each other in the VPC, and they should have outgoing
  /// access to the Internet through a NAT device.
  @_s.JsonKey(name: 'SubnetIds')
  final List<String> subnetIds;

  DataSourceVpcConfiguration({
    @_s.required this.securityGroupIds,
    @_s.required this.subnetIds,
  });
  factory DataSourceVpcConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DataSourceVpcConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceVpcConfigurationToJson(this);
}

/// Provides the information necessary to connect a database to an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DatabaseConfiguration {
  /// Information about where the index should get the document information from
  /// the database.
  @_s.JsonKey(name: 'ColumnConfiguration')
  final ColumnConfiguration columnConfiguration;

  /// The information necessary to connect to a database.
  @_s.JsonKey(name: 'ConnectionConfiguration')
  final ConnectionConfiguration connectionConfiguration;

  /// The type of database engine that runs the database.
  @_s.JsonKey(name: 'DatabaseEngineType')
  final DatabaseEngineType databaseEngineType;

  /// Information about the database column that provides information for user
  /// context filtering.
  @_s.JsonKey(name: 'AclConfiguration')
  final AclConfiguration aclConfiguration;
  @_s.JsonKey(name: 'VpcConfiguration')
  final DataSourceVpcConfiguration vpcConfiguration;

  DatabaseConfiguration({
    @_s.required this.columnConfiguration,
    @_s.required this.connectionConfiguration,
    @_s.required this.databaseEngineType,
    this.aclConfiguration,
    this.vpcConfiguration,
  });
  factory DatabaseConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DatabaseConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DatabaseConfigurationToJson(this);
}

enum DatabaseEngineType {
  @_s.JsonValue('RDS_AURORA_MYSQL')
  rdsAuroraMysql,
  @_s.JsonValue('RDS_AURORA_POSTGRESQL')
  rdsAuroraPostgresql,
  @_s.JsonValue('RDS_MYSQL')
  rdsMysql,
  @_s.JsonValue('RDS_POSTGRESQL')
  rdsPostgresql,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDataSourceResponse {
  /// Information that describes where the data source is located and how the data
  /// source is configured. The specific information in the description depends on
  /// the data source provider.
  @_s.JsonKey(name: 'Configuration')
  final DataSourceConfiguration configuration;

  /// The Unix timestamp of when the data source was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description of the data source.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the data source to fail.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier of the data source.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The identifier of the index that contains the data source.
  @_s.JsonKey(name: 'IndexId')
  final String indexId;

  /// The name that you gave the data source when it was created.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the role that enables the data source to
  /// access its resources.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The schedule that Amazon Kendra will update the data source.
  @_s.JsonKey(name: 'Schedule')
  final String schedule;

  /// The current status of the data source. When the status is
  /// <code>ACTIVE</code> the data source is ready to use. When the status is
  /// <code>FAILED</code>, the <code>ErrorMessage</code> field contains the reason
  /// that the data source failed.
  @_s.JsonKey(name: 'Status')
  final DataSourceStatus status;

  /// The type of the data source.
  @_s.JsonKey(name: 'Type')
  final DataSourceType type;

  /// The Unix timestamp of when the data source was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  DescribeDataSourceResponse({
    this.configuration,
    this.createdAt,
    this.description,
    this.errorMessage,
    this.id,
    this.indexId,
    this.name,
    this.roleArn,
    this.schedule,
    this.status,
    this.type,
    this.updatedAt,
  });
  factory DescribeDataSourceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDataSourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFaqResponse {
  /// The date and time that the FAQ was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description of the FAQ that you provided when it was created.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// If the <code>Status</code> field is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains the reason why the FAQ failed.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The identifier of the FAQ.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The identifier of the index that contains the FAQ.
  @_s.JsonKey(name: 'IndexId')
  final String indexId;

  /// The name that you gave the FAQ when it was created.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the role that provides access to the S3
  /// bucket containing the input files for the FAQ.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;
  @_s.JsonKey(name: 'S3Path')
  final S3Path s3Path;

  /// The status of the FAQ. It is ready to use when the status is
  /// <code>ACTIVE</code>.
  @_s.JsonKey(name: 'Status')
  final FaqStatus status;

  /// The date and time that the FAQ was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  DescribeFaqResponse({
    this.createdAt,
    this.description,
    this.errorMessage,
    this.id,
    this.indexId,
    this.name,
    this.roleArn,
    this.s3Path,
    this.status,
    this.updatedAt,
  });
  factory DescribeFaqResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFaqResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeIndexResponse {
  /// The Unix datetime that the index was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The description of the index.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// Configuration settings for any metadata applied to the documents in the
  /// index.
  @_s.JsonKey(name: 'DocumentMetadataConfigurations')
  final List<DocumentMetadataConfiguration> documentMetadataConfigurations;

  /// When th e<code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a message that explains why.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// the name of the index.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Provides information about the number of FAQ questions and answers and the
  /// number of text documents indexed.
  @_s.JsonKey(name: 'IndexStatistics')
  final IndexStatistics indexStatistics;

  /// The name of the index.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Resource Name (ARN) of the IAM role that gives Amazon Kendra
  /// permission to write to your Amazon Cloudwatch logs.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;

  /// The identifier of the AWS KMS customer master key (CMK) used to encrypt your
  /// data. Amazon Kendra doesn't support asymmetric CMKs.
  @_s.JsonKey(name: 'ServerSideEncryptionConfiguration')
  final ServerSideEncryptionConfiguration serverSideEncryptionConfiguration;

  /// The current status of the index. When the value is <code>ACTIVE</code>, the
  /// index is ready for use. If the <code>Status</code> field value is
  /// <code>FAILED</code>, the <code>ErrorMessage</code> field contains a message
  /// that explains why.
  @_s.JsonKey(name: 'Status')
  final IndexStatus status;

  /// The Unix datetime that the index was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  DescribeIndexResponse({
    this.createdAt,
    this.description,
    this.documentMetadataConfigurations,
    this.errorMessage,
    this.id,
    this.indexStatistics,
    this.name,
    this.roleArn,
    this.serverSideEncryptionConfiguration,
    this.status,
    this.updatedAt,
  });
  factory DescribeIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeIndexResponseFromJson(json);
}

/// A document in an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Document {
  /// A unique identifier of the document in the index.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Information to use for user context filtering.
  @_s.JsonKey(name: 'AccessControlList')
  final List<Principal> accessControlList;

  /// Custom attributes to apply to the document. Use the custom attributes to
  /// provide additional information for searching, to provide facets for refining
  /// searches, and to provide additional information in the query response.
  @_s.JsonKey(name: 'Attributes')
  final List<DocumentAttribute> attributes;

  /// The contents of the document.
  ///
  /// Documents passed to the <code>Blob</code> parameter must be base64 encoded.
  /// Your code might not need to encode the document file bytes if you're using
  /// an AWS SDK to call Amazon Kendra operations. If you are calling the Amazon
  /// Kendra endpoint directly using REST, you must base64 encode the contents
  /// before sending.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Blob')
  final Uint8List blob;

  /// The file type of the document in the <code>Blob</code> field.
  @_s.JsonKey(name: 'ContentType')
  final ContentType contentType;
  @_s.JsonKey(name: 'S3Path')
  final S3Path s3Path;

  /// The title of the document.
  @_s.JsonKey(name: 'Title')
  final String title;

  Document({
    @_s.required this.id,
    this.accessControlList,
    this.attributes,
    this.blob,
    this.contentType,
    this.s3Path,
    this.title,
  });
  Map<String, dynamic> toJson() => _$DocumentToJson(this);
}

/// A custom attribute value assigned to a document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DocumentAttribute {
  /// The identifier for the attribute.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the attribute.
  @_s.JsonKey(name: 'Value')
  final DocumentAttributeValue value;

  DocumentAttribute({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory DocumentAttribute.fromJson(Map<String, dynamic> json) =>
      _$DocumentAttributeFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentAttributeToJson(this);
}

/// The value of a custom document attribute. You can only provide one value for
/// a custom attribute.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DocumentAttributeValue {
  /// A date value expressed as seconds from the Unix epoch.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'DateValue')
  final DateTime dateValue;

  /// A long integer value.
  @_s.JsonKey(name: 'LongValue')
  final int longValue;

  /// A list of strings.
  @_s.JsonKey(name: 'StringListValue')
  final List<String> stringListValue;

  /// A string, such as "department".
  @_s.JsonKey(name: 'StringValue')
  final String stringValue;

  DocumentAttributeValue({
    this.dateValue,
    this.longValue,
    this.stringListValue,
    this.stringValue,
  });
  factory DocumentAttributeValue.fromJson(Map<String, dynamic> json) =>
      _$DocumentAttributeValueFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentAttributeValueToJson(this);
}

/// Provides the count of documents that match a particular attribute when doing
/// a faceted search.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DocumentAttributeValueCountPair {
  /// The number of documents in the response that have the attribute value for
  /// the key.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// The value of the attribute. For example, "HR."
  @_s.JsonKey(name: 'DocumentAttributeValue')
  final DocumentAttributeValue documentAttributeValue;

  DocumentAttributeValueCountPair({
    this.count,
    this.documentAttributeValue,
  });
  factory DocumentAttributeValueCountPair.fromJson(Map<String, dynamic> json) =>
      _$DocumentAttributeValueCountPairFromJson(json);
}

enum DocumentAttributeValueType {
  @_s.JsonValue('STRING_VALUE')
  stringValue,
  @_s.JsonValue('STRING_LIST_VALUE')
  stringListValue,
  @_s.JsonValue('LONG_VALUE')
  longValue,
  @_s.JsonValue('DATE_VALUE')
  dateValue,
}

/// Specifies the properties of a custom index field.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DocumentMetadataConfiguration {
  /// The name of the index field.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The data type of the index field.
  @_s.JsonKey(name: 'Type')
  final DocumentAttributeValueType type;

  /// Provides manual tuning parameters to determine how the field affects the
  /// search results.
  @_s.JsonKey(name: 'Relevance')
  final Relevance relevance;

  /// Provides information about how the field is used during a search.
  @_s.JsonKey(name: 'Search')
  final Search search;

  DocumentMetadataConfiguration({
    @_s.required this.name,
    @_s.required this.type,
    this.relevance,
    this.search,
  });
  factory DocumentMetadataConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DocumentMetadataConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentMetadataConfigurationToJson(this);
}

/// Document metadata files that contain information such as the document access
/// control information, source URI, document author, and custom attributes.
/// Each metadata file contains metadata about a single document.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DocumentsMetadataConfiguration {
  /// A prefix used to filter metadata configuration files in the AWS S3 bucket.
  /// The S3 bucket might contain multiple metadata files. Use
  /// <code>S3Prefix</code> to include only the desired metadata files.
  @_s.JsonKey(name: 'S3Prefix')
  final String s3Prefix;

  DocumentsMetadataConfiguration({
    this.s3Prefix,
  });
  factory DocumentsMetadataConfiguration.fromJson(Map<String, dynamic> json) =>
      _$DocumentsMetadataConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DocumentsMetadataConfigurationToJson(this);
}

enum ErrorCode {
  @_s.JsonValue('InternalError')
  internalError,
  @_s.JsonValue('InvalidRequest')
  invalidRequest,
}

/// Information a document attribute
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Facet {
  /// The unique key for the document attribute.
  @_s.JsonKey(name: 'DocumentAttributeKey')
  final String documentAttributeKey;

  Facet({
    this.documentAttributeKey,
  });
  Map<String, dynamic> toJson() => _$FacetToJson(this);
}

/// The facet values for the documents in the response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FacetResult {
  /// The key for the facet values. This is the same as the
  /// <code>DocumentAttributeKey</code> provided in the query.
  @_s.JsonKey(name: 'DocumentAttributeKey')
  final String documentAttributeKey;

  /// An array of key/value pairs, where the key is the value of the attribute and
  /// the count is the number of documents that share the key value.
  @_s.JsonKey(name: 'DocumentAttributeValueCountPairs')
  final List<DocumentAttributeValueCountPair> documentAttributeValueCountPairs;

  FacetResult({
    this.documentAttributeKey,
    this.documentAttributeValueCountPairs,
  });
  factory FacetResult.fromJson(Map<String, dynamic> json) =>
      _$FacetResultFromJson(json);
}

/// Provides statistical information about the FAQ questions and answers
/// contained in an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaqStatistics {
  /// The total number of FAQ questions and answers contained in the index.
  @_s.JsonKey(name: 'IndexedQuestionAnswersCount')
  final int indexedQuestionAnswersCount;

  FaqStatistics({
    @_s.required this.indexedQuestionAnswersCount,
  });
  factory FaqStatistics.fromJson(Map<String, dynamic> json) =>
      _$FaqStatisticsFromJson(json);
}

enum FaqStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
}

/// Provides information about a frequently asked questions and answer contained
/// in an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaqSummary {
  /// The UNIX datetime that the FAQ was added to the index.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The unique identifier of the FAQ.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name that you assigned the FAQ when you created or updated the FAQ.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The current status of the FAQ. When the status is <code>ACTIVE</code> the
  /// FAQ is ready for use.
  @_s.JsonKey(name: 'Status')
  final FaqStatus status;

  /// The UNIX datetime that the FAQ was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  FaqSummary({
    this.createdAt,
    this.id,
    this.name,
    this.status,
    this.updatedAt,
  });
  factory FaqSummary.fromJson(Map<String, dynamic> json) =>
      _$FaqSummaryFromJson(json);
}

/// Provides information that you can use to highlight a search result so that
/// your users can quickly identify terms in the response.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Highlight {
  /// The zero-based location in the response string where the highlight starts.
  @_s.JsonKey(name: 'BeginOffset')
  final int beginOffset;

  /// The zero-based location in the response string where the highlight ends.
  @_s.JsonKey(name: 'EndOffset')
  final int endOffset;

  /// Indicates whether the response is the best response. True if this is the
  /// best response; otherwise, false.
  @_s.JsonKey(name: 'TopAnswer')
  final bool topAnswer;

  Highlight({
    @_s.required this.beginOffset,
    @_s.required this.endOffset,
    this.topAnswer,
  });
  factory Highlight.fromJson(Map<String, dynamic> json) =>
      _$HighlightFromJson(json);
}

/// A summary of information about an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IndexConfigurationSummary {
  /// The Unix timestamp when the index was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The current status of the index. When the status is <code>ACTIVE</code>, the
  /// index is ready to search.
  @_s.JsonKey(name: 'Status')
  final IndexStatus status;

  /// The Unix timestamp when the index was last updated by the
  /// <code>UpdateIndex</code> operation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  /// A unique identifier for the index. Use this to identify the index when you
  /// are using operations such as <code>Query</code>, <code>DescribeIndex</code>,
  /// <code>UpdateIndex</code>, and <code>DeleteIndex</code>.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the index.
  @_s.JsonKey(name: 'Name')
  final String name;

  IndexConfigurationSummary({
    @_s.required this.createdAt,
    @_s.required this.status,
    @_s.required this.updatedAt,
    this.id,
    this.name,
  });
  factory IndexConfigurationSummary.fromJson(Map<String, dynamic> json) =>
      _$IndexConfigurationSummaryFromJson(json);
}

/// Provides information about the number of documents and the number of
/// questions and answers in an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IndexStatistics {
  /// The number of question and answer topics in the index.
  @_s.JsonKey(name: 'FaqStatistics')
  final FaqStatistics faqStatistics;

  /// The number of text documents indexed.
  @_s.JsonKey(name: 'TextDocumentStatistics')
  final TextDocumentStatistics textDocumentStatistics;

  IndexStatistics({
    @_s.required this.faqStatistics,
    @_s.required this.textDocumentStatistics,
  });
  factory IndexStatistics.fromJson(Map<String, dynamic> json) =>
      _$IndexStatisticsFromJson(json);
}

enum IndexStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('SYSTEM_UPDATING')
  systemUpdating,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDataSourceSyncJobsResponse {
  /// A history of synchronization jobs for the data source.
  @_s.JsonKey(name: 'History')
  final List<DataSourceSyncJob> history;

  /// The <code>GetDataSourceSyncJobHistory</code> operation returns a page of
  /// vocabularies at a time. The maximum size of the page is set by the
  /// <code>MaxResults</code> parameter. If there are more jobs in the list than
  /// the page size, Amazon Kendra returns the NextPage token. Include the token
  /// in the next request to the <code>GetDataSourceSyncJobHistory</code>
  /// operation to return in the next page of jobs.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListDataSourceSyncJobsResponse({
    this.history,
    this.nextToken,
  });
  factory ListDataSourceSyncJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDataSourceSyncJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDataSourcesResponse {
  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of data sources.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of summary information for one or more data sources.
  @_s.JsonKey(name: 'SummaryItems')
  final List<DataSourceSummary> summaryItems;

  ListDataSourcesResponse({
    this.nextToken,
    this.summaryItems,
  });
  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDataSourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFaqsResponse {
  /// information about the FAQs associated with the specified index.
  @_s.JsonKey(name: 'FaqSummaryItems')
  final List<FaqSummary> faqSummaryItems;

  /// The <code>ListFaqs</code> operation returns a page of FAQs at a time. The
  /// maximum size of the page is set by the <code>MaxResults</code> parameter. If
  /// there are more jobs in the list than the page size, Amazon Kendra returns
  /// the <code>NextPage</code> token. Include the token in the next request to
  /// the <code>ListFaqs</code> operation to return the next page of FAQs.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFaqsResponse({
    this.faqSummaryItems,
    this.nextToken,
  });
  factory ListFaqsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFaqsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListIndicesResponse {
  /// An array of summary information for one or more indexes.
  @_s.JsonKey(name: 'IndexConfigurationSummaryItems')
  final List<IndexConfigurationSummary> indexConfigurationSummaryItems;

  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of indexes.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListIndicesResponse({
    this.indexConfigurationSummaryItems,
    this.nextToken,
  });
  factory ListIndicesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListIndicesResponseFromJson(json);
}

enum Order {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
  descending,
}

/// Provides user and group information for document access filtering.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Principal {
  /// Whether to allow or deny access to the principal.
  @_s.JsonKey(name: 'Access')
  final ReadAccessType access;

  /// The name of the user or group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The type of principal.
  @_s.JsonKey(name: 'Type')
  final PrincipalType type;

  Principal({
    @_s.required this.access,
    @_s.required this.name,
    @_s.required this.type,
  });
  Map<String, dynamic> toJson() => _$PrincipalToJson(this);
}

enum PrincipalType {
  @_s.JsonValue('USER')
  user,
  @_s.JsonValue('GROUP')
  group,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryResult {
  /// Contains the facet results. A <code>FacetResult</code> contains the counts
  /// for each attribute key that was specified in the <code>Facets</code> input
  /// parameter.
  @_s.JsonKey(name: 'FacetResults')
  final List<FacetResult> facetResults;

  /// The unique identifier for the search. You use <code>QueryId</code> to
  /// identify the search when using the feedback API.
  @_s.JsonKey(name: 'QueryId')
  final String queryId;

  /// The results of the search.
  @_s.JsonKey(name: 'ResultItems')
  final List<QueryResultItem> resultItems;

  /// The number of items returned by the search. Use this to determine when you
  /// have requested the last set of results.
  @_s.JsonKey(name: 'TotalNumberOfResults')
  final int totalNumberOfResults;

  QueryResult({
    this.facetResults,
    this.queryId,
    this.resultItems,
    this.totalNumberOfResults,
  });
  factory QueryResult.fromJson(Map<String, dynamic> json) =>
      _$QueryResultFromJson(json);
}

/// A single query result.
///
/// A query result contains information about a document returned by the query.
/// This includes the original location of the document, a list of attributes
/// assigned to the document, and relevant text from the document that satisfies
/// the query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class QueryResultItem {
  /// <p/>
  @_s.JsonKey(name: 'AdditionalAttributes')
  final List<AdditionalResultAttribute> additionalAttributes;

  /// An array of document attributes for the document that the query result maps
  /// to. For example, the document author (Author) or the source URI (SourceUri)
  /// of the document.
  @_s.JsonKey(name: 'DocumentAttributes')
  final List<DocumentAttribute> documentAttributes;

  /// An extract of the text in the document. Contains information about
  /// highlighting the relevant terms in the excerpt.
  @_s.JsonKey(name: 'DocumentExcerpt')
  final TextWithHighlights documentExcerpt;

  /// The unique identifier for the document.
  @_s.JsonKey(name: 'DocumentId')
  final String documentId;

  /// The title of the document. Contains the text of the title and information
  /// for highlighting the relevant terms in the title.
  @_s.JsonKey(name: 'DocumentTitle')
  final TextWithHighlights documentTitle;

  /// The URI of the original location of the document.
  @_s.JsonKey(name: 'DocumentURI')
  final String documentURI;

  /// The unique identifier for the query result.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of document.
  @_s.JsonKey(name: 'Type')
  final QueryResultType type;

  QueryResultItem({
    this.additionalAttributes,
    this.documentAttributes,
    this.documentExcerpt,
    this.documentId,
    this.documentTitle,
    this.documentURI,
    this.id,
    this.type,
  });
  factory QueryResultItem.fromJson(Map<String, dynamic> json) =>
      _$QueryResultItemFromJson(json);
}

enum QueryResultType {
  @_s.JsonValue('DOCUMENT')
  document,
  @_s.JsonValue('QUESTION_ANSWER')
  questionAnswer,
  @_s.JsonValue('ANSWER')
  answer,
}

extension on QueryResultType {
  String toValue() {
    switch (this) {
      case QueryResultType.document:
        return 'DOCUMENT';
      case QueryResultType.questionAnswer:
        return 'QUESTION_ANSWER';
      case QueryResultType.answer:
        return 'ANSWER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ReadAccessType {
  @_s.JsonValue('ALLOW')
  allow,
  @_s.JsonValue('DENY')
  deny,
}

/// Provides information for manually tuning the relevance of a field in a
/// search. When a query includes terms that match the field, the results are
/// given a boost in the response based on these tuning parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Relevance {
  /// Specifies the time period that the boost applies to. For example, to make
  /// the boost apply to documents with the field value within the last month, you
  /// would use "2628000s". Once the field value is beyond the specified range,
  /// the effect of the boost drops off. The higher the importance, the faster the
  /// effect drops off. If you don't specify a value, the default is 3 months. The
  /// value of the field is a numeric string followed by the character "s", for
  /// example "86400s" for one day, or "604800s" for one week.
  ///
  /// Only applies to <code>DATE</code> fields.
  @_s.JsonKey(name: 'Duration')
  final String duration;

  /// Indicates that this field determines how "fresh" a document is. For example,
  /// if document 1 was created on November 5, and document 2 was created on
  /// October 31, document 1 is "fresher" than document 2. You can only set the
  /// <code>Freshness</code> field on one <code>DATE</code> type field. Only
  /// applies to <code>DATE</code> fields.
  @_s.JsonKey(name: 'Freshness')
  final bool freshness;

  /// The relative importance of the field in the search. Larger numbers provide
  /// more of a boost than smaller numbers.
  @_s.JsonKey(name: 'Importance')
  final int importance;

  /// Determines how values should be interpreted.
  ///
  /// When the <code>RankOrder</code> field is <code>ASCENDING</code>, higher
  /// numbers are better. For example, a document with a rating score of 10 is
  /// higher ranking than a document with a rating score of 1.
  ///
  /// When the <code>RankOrder</code> field is <code>DESCENDING</code>, lower
  /// numbers are better. For example, in a task tracking application, a priority
  /// 1 task is more important than a priority 5 task.
  ///
  /// Only applies to <code>LONG</code> and <code>DOUBLE</code> fields.
  @_s.JsonKey(name: 'RankOrder')
  final Order rankOrder;

  /// A list of values that should be given a different boost when they appear in
  /// the result list. For example, if you are boosting a field called
  /// "department," query terms that match the department field are boosted in the
  /// result. However, you can add entries from the department field to boost
  /// documents with those values higher.
  ///
  /// For example, you can add entries to the map with names of departments. If
  /// you add "HR",5 and "Legal",3 those departments are given special attention
  /// when they appear in the metadata of a document. When those terms appear they
  /// are given the specified importance instead of the regular importance for the
  /// boost.
  @_s.JsonKey(name: 'ValueImportanceMap')
  final Map<String, int> valueImportanceMap;

  Relevance({
    this.duration,
    this.freshness,
    this.importance,
    this.rankOrder,
    this.valueImportanceMap,
  });
  factory Relevance.fromJson(Map<String, dynamic> json) =>
      _$RelevanceFromJson(json);

  Map<String, dynamic> toJson() => _$RelevanceToJson(this);
}

/// Provides feedback on how relevant a document is to a search. Your
/// application uses the <a>SubmitFeedback</a> operation to provide relevance
/// information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class RelevanceFeedback {
  /// Whether to document was relevant or not relevant to the search.
  @_s.JsonKey(name: 'RelevanceValue')
  final RelevanceType relevanceValue;

  /// The unique identifier of the search result that the user provided relevance
  /// feedback for.
  @_s.JsonKey(name: 'ResultId')
  final String resultId;

  RelevanceFeedback({
    @_s.required this.relevanceValue,
    @_s.required this.resultId,
  });
  Map<String, dynamic> toJson() => _$RelevanceFeedbackToJson(this);
}

enum RelevanceType {
  @_s.JsonValue('RELEVANT')
  relevant,
  @_s.JsonValue('NOT_RELEVANT')
  notRelevant,
}

/// Provides configuration information for a data source to index documents in
/// an Amazon S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3DataSourceConfiguration {
  /// The name of the bucket that contains the documents.
  @_s.JsonKey(name: 'BucketName')
  final String bucketName;

  /// Provides the path to the S3 bucket that contains the user context filtering
  /// files for the data source.
  @_s.JsonKey(name: 'AccessControlListConfiguration')
  final AccessControlListConfiguration accessControlListConfiguration;
  @_s.JsonKey(name: 'DocumentsMetadataConfiguration')
  final DocumentsMetadataConfiguration documentsMetadataConfiguration;

  /// A list of glob patterns for documents that should not be indexed. If a
  /// document that matches an inclusion prefix also matches an exclusion pattern,
  /// the document is not indexed.
  ///
  /// For more information about glob patterns, see <a
  /// href="http://wikipedia.org/wiki/Glob_%28programming%29">glob
  /// (programming)</a> in <i>Wikipedia</i>.
  @_s.JsonKey(name: 'ExclusionPatterns')
  final List<String> exclusionPatterns;

  /// A list of S3 prefixes for the documents that should be included in the
  /// index.
  @_s.JsonKey(name: 'InclusionPrefixes')
  final List<String> inclusionPrefixes;

  S3DataSourceConfiguration({
    @_s.required this.bucketName,
    this.accessControlListConfiguration,
    this.documentsMetadataConfiguration,
    this.exclusionPatterns,
    this.inclusionPrefixes,
  });
  factory S3DataSourceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$S3DataSourceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$S3DataSourceConfigurationToJson(this);
}

/// Information required to find a specific file in an Amazon S3 bucket.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Path {
  /// The name of the S3 bucket that contains the file.
  @_s.JsonKey(name: 'Bucket')
  final String bucket;

  /// The name of the file.
  @_s.JsonKey(name: 'Key')
  final String key;

  S3Path({
    @_s.required this.bucket,
    @_s.required this.key,
  });
  factory S3Path.fromJson(Map<String, dynamic> json) => _$S3PathFromJson(json);

  Map<String, dynamic> toJson() => _$S3PathToJson(this);
}

/// Provides information about how a custom index field is used during a search.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Search {
  /// Determines whether the field is returned in the query response. The default
  /// is <code>true</code>.
  @_s.JsonKey(name: 'Displayable')
  final bool displayable;

  /// Indicates that the field can be used to create search facets, a count of
  /// results for each value in the field. The default is <code>false</code> .
  @_s.JsonKey(name: 'Facetable')
  final bool facetable;

  /// Determines whether the field is used in the search. If the
  /// <code>Searchable</code> field is <code>true</code>, you can use relevance
  /// tuning to manually tune how Amazon Kendra weights the field in the search.
  /// The default is <code>true</code> for string fields and <code>false</code>
  /// for number and date fields.
  @_s.JsonKey(name: 'Searchable')
  final bool searchable;

  Search({
    this.displayable,
    this.facetable,
    this.searchable,
  });
  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);
}

/// Provides the identifier of the AWS KMS customer master key (CMK) used to
/// encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support
/// asymmetric CMKs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerSideEncryptionConfiguration {
  /// The identifier of the AWS KMS customer master key (CMK). Amazon Kendra
  /// doesn't support asymmetric CMKs.
  @_s.JsonKey(name: 'KmsKeyId')
  final String kmsKeyId;

  ServerSideEncryptionConfiguration({
    this.kmsKeyId,
  });
  factory ServerSideEncryptionConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$ServerSideEncryptionConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ServerSideEncryptionConfigurationToJson(this);
}

/// Provides configuration information for connecting to a Microsoft SharePoint
/// data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SharePointConfiguration {
  /// The Amazon Resource Name (ARN) of credentials stored in AWS Secrets Manager.
  /// The credentials should be a user/password pair. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-sharepoint.html">Using
  /// a Microsoft SharePoint Data Source</a>. For more information about AWS
  /// Secrets Manager, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">
  /// What Is AWS Secrets Manager </a> in the <i>AWS Secrets Manager</i> user
  /// guide.
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  /// The version of Microsoft SharePoint that you are using as a data source.
  @_s.JsonKey(name: 'SharePointVersion')
  final SharePointVersion sharePointVersion;

  /// The URLs of the Microsoft SharePoint site that contains the documents that
  /// should be indexed.
  @_s.JsonKey(name: 'Urls')
  final List<String> urls;

  /// <code>TRUE</code> to include attachments to documents stored in your
  /// Microsoft SharePoint site in the index; otherwise, <code>FALSE</code>.
  @_s.JsonKey(name: 'CrawlAttachments')
  final bool crawlAttachments;

  /// The Microsoft SharePoint attribute field that contains the title of the
  /// document.
  @_s.JsonKey(name: 'DocumentTitleFieldName')
  final String documentTitleFieldName;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// excluded from the index. Documents that don't match the patterns are
  /// included in the index. If a document matches both an exclusion pattern and
  /// an inclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the display URL of the SharePoint document.
  @_s.JsonKey(name: 'ExclusionPatterns')
  final List<String> exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// Microsoft SharePoint attributes to custom fields in the Amazon Kendra index.
  /// You must first create the index fields using the operation before you map
  /// SharePoint attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// Data Source Fields</a>.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// included in the index. Documents that don't match the patterns are excluded
  /// from the index. If a document matches both an inclusion pattern and an
  /// exclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the display URL of the SharePoint document.
  @_s.JsonKey(name: 'InclusionPatterns')
  final List<String> inclusionPatterns;

  /// Set to <code>TRUE</code> to use the Microsoft SharePoint change log to
  /// determine the documents that need to be updated in the index. Depending on
  /// the size of the SharePoint change log, it may take longer for Amazon Kendra
  /// to use the change log than it takes it to determine the changed documents
  /// using the Amazon Kendra document crawler.
  @_s.JsonKey(name: 'UseChangeLog')
  final bool useChangeLog;
  @_s.JsonKey(name: 'VpcConfiguration')
  final DataSourceVpcConfiguration vpcConfiguration;

  SharePointConfiguration({
    @_s.required this.secretArn,
    @_s.required this.sharePointVersion,
    @_s.required this.urls,
    this.crawlAttachments,
    this.documentTitleFieldName,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
    this.useChangeLog,
    this.vpcConfiguration,
  });
  factory SharePointConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SharePointConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SharePointConfigurationToJson(this);
}

enum SharePointVersion {
  @_s.JsonValue('SHAREPOINT_ONLINE')
  sharepointOnline,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartDataSourceSyncJobResponse {
  /// Identifies a particular synchronization job.
  @_s.JsonKey(name: 'ExecutionId')
  final String executionId;

  StartDataSourceSyncJobResponse({
    this.executionId,
  });
  factory StartDataSourceSyncJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartDataSourceSyncJobResponseFromJson(json);
}

/// Provides information about text documents indexed in an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TextDocumentStatistics {
  /// The number of text documents indexed.
  @_s.JsonKey(name: 'IndexedTextDocumentsCount')
  final int indexedTextDocumentsCount;

  TextDocumentStatistics({
    @_s.required this.indexedTextDocumentsCount,
  });
  factory TextDocumentStatistics.fromJson(Map<String, dynamic> json) =>
      _$TextDocumentStatisticsFromJson(json);
}

/// Provides text and information about where to highlight the text.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TextWithHighlights {
  /// The beginning and end of the text that should be highlighted.
  @_s.JsonKey(name: 'Highlights')
  final List<Highlight> highlights;

  /// The text to display to the user.
  @_s.JsonKey(name: 'Text')
  final String text;

  TextWithHighlights({
    this.highlights,
    this.text,
  });
  factory TextWithHighlights.fromJson(Map<String, dynamic> json) =>
      _$TextWithHighlightsFromJson(json);
}

/// Provides a range of time.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TimeRange {
  /// The UNIX datetime of the end of the time range.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The UNIX datetime of the beginning of the time range.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  TimeRange({
    this.endTime,
    this.startTime,
  });
  Map<String, dynamic> toJson() => _$TimeRangeToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceAlreadyExistException extends _s.GenericAwsException {
  ResourceAlreadyExistException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String type, String message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceAlreadyExistException': (type, message) =>
      ResourceAlreadyExistException(type: type, message: message),
  'ResourceInUseException': (type, message) =>
      ResourceInUseException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ResourceUnavailableException': (type, message) =>
      ResourceUnavailableException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
