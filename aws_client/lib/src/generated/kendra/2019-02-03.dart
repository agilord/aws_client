// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Amazon Kendra is a service for indexing large document sets.
class Kendra {
  final _s.JsonProtocol _protocol;
  Kendra({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
  /// added with the <code>BatchPutDocument</code> operation.
  ///
  /// The documents are deleted asynchronously. You can see the progress of the
  /// deletion by using AWS CloudWatch. Any error messages related to the
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
    required List<String> documentIdList,
    required String indexId,
    DataSourceSyncJobMetricTarget? dataSourceSyncJobMetricTarget,
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
        if (dataSourceSyncJobMetricTarget != null)
          'DataSourceSyncJobMetricTarget': dataSourceSyncJobMetricTarget,
      },
    );

    return BatchDeleteDocumentResponse.fromJson(jsonResponse.body);
  }

  /// Returns the indexing status for one or more documents submitted with the
  /// <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html">
  /// BatchPutDocument</a> operation.
  ///
  /// When you use the <code>BatchPutDocument</code> operation, documents are
  /// indexed asynchronously. You can use the
  /// <code>BatchGetDocumentStatus</code> operation to get the current status of
  /// a list of documents so that you can determine if they have been
  /// successfully indexed.
  ///
  /// You can also use the <code>BatchGetDocumentStatus</code> operation to
  /// check the status of the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteDocument.html">
  /// BatchDeleteDocument</a> operation. When a document is deleted from the
  /// index, Amazon Kendra returns <code>NOT_FOUND</code> as the status.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [documentInfoList] :
  /// A list of <code>DocumentInfo</code> objects that identify the documents
  /// for which to get the status. You identify the documents by their document
  /// ID and optional attributes.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index to add documents to. The index ID is returned
  /// by the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_CreateIndex.html">
  /// CreateIndex </a> operation.
  Future<BatchGetDocumentStatusResponse> batchGetDocumentStatus({
    required List<DocumentInfo> documentInfoList,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(documentInfoList, 'documentInfoList');
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.BatchGetDocumentStatus'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DocumentInfoList': documentInfoList,
        'IndexId': indexId,
      },
    );

    return BatchGetDocumentStatusResponse.fromJson(jsonResponse.body);
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
  /// Documents can include custom attributes. For example, 'DataSourceId' and
  /// 'DataSourceSyncJobId' are custom attributes that provide information on
  /// the synchronization of documents running on a data source. Note,
  /// 'DataSourceSyncJobId' could be an optional custom attribute as Amazon
  /// Kendra will use the ID of a running sync job.
  ///
  /// Documents have the following file size limits.
  ///
  /// <ul>
  /// <li>
  /// 5 MB total size for inline documents
  /// </li>
  /// <li>
  /// 50 MB total size for files from an S3 bucket
  /// </li>
  /// <li>
  /// 5 MB extracted text for any file
  /// </li>
  /// </ul>
  /// For more information about file size and transaction per second quotas,
  /// see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas</a>.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index to add the documents to. You need to create
  /// the index first using the <code>CreateIndex</code> operation.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role that is allowed to run the
  /// <code>BatchPutDocument</code> operation. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// Roles for Amazon Kendra</a>.
  Future<BatchPutDocumentResponse> batchPutDocument({
    required List<Document> documents,
    required String indexId,
    String? roleArn,
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
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
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

  /// Clears existing query suggestions from an index.
  ///
  /// This deletes existing suggestions only, not the queries in the query log.
  /// After you clear suggestions, Amazon Kendra learns new suggestions based on
  /// new queries added to the query log from the time you cleared suggestions.
  /// If you do not see any new suggestions, then please allow Amazon Kendra to
  /// collect enough queries to learn new suggestions.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index you want to clear query suggestions from.
  Future<void> clearQuerySuggestions({
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ClearQuerySuggestions'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
      },
    );
  }

  /// Creates a data source that you use to with an Amazon Kendra index.
  ///
  /// You specify a name, data source connector type and description for your
  /// data source. You also specify configuration information such as document
  /// metadata (author, source URI, and so on) and user context information.
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
  /// Parameter [indexId] :
  /// The identifier of the index that should be associated with this data
  /// source.
  ///
  /// Parameter [name] :
  /// A unique name for the data source. A data source name can't be changed
  /// without deleting and recreating the data source.
  ///
  /// Parameter [type] :
  /// The type of repository that contains the data source.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a data source.
  /// Multiple calls to the <code>CreateDataSource</code> operation with the
  /// same client token will create only one data source.
  ///
  /// Parameter [configuration] :
  /// The connector configuration information that is required to access the
  /// repository.
  ///
  /// You can't specify the <code>Configuration</code> parameter when the
  /// <code>Type</code> parameter is set to <code>CUSTOM</code>. If you do, you
  /// receive a <code>ValidationException</code> exception.
  ///
  /// The <code>Configuration</code> parameter is required for all other data
  /// sources.
  ///
  /// Parameter [description] :
  /// A description for the data source.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the
  /// data source. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// Roles for Amazon Kendra</a>.
  ///
  /// You can't specify the <code>RoleArn</code> parameter when the
  /// <code>Type</code> parameter is set to <code>CUSTOM</code>. If you do, you
  /// receive a <code>ValidationException</code> exception.
  ///
  /// The <code>RoleArn</code> parameter is required for all other data sources.
  ///
  /// Parameter [schedule] :
  /// Sets the frequency that Amazon Kendra will check the documents in your
  /// repository and update the index. If you don't set a schedule Amazon Kendra
  /// will not periodically update the index. You can call the
  /// <code>StartDataSourceSyncJob</code> operation to update the index.
  ///
  /// You can't specify the <code>Schedule</code> parameter when the
  /// <code>Type</code> parameter is set to <code>CUSTOM</code>. If you do, you
  /// receive a <code>ValidationException</code> exception.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify the data source. You can use the
  /// tags to identify and organize your resources and to control access to
  /// resources.
  Future<CreateDataSourceResponse> createDataSource({
    required String indexId,
    required String name,
    required DataSourceType type,
    String? clientToken,
    DataSourceConfiguration? configuration,
    String? description,
    String? roleArn,
    String? schedule,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
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
        'IndexId': indexId,
        'Name': name,
        'Type': type.toValue(),
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (configuration != null) 'Configuration': configuration,
        if (description != null) 'Description': description,
        if (roleArn != null) 'RoleArn': roleArn,
        if (schedule != null) 'Schedule': schedule,
        if (tags != null) 'Tags': tags,
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
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a FAQ. Multiple
  /// calls to the <code>CreateFaqRequest</code> operation with the same client
  /// token will create only one FAQ.
  ///
  /// Parameter [description] :
  /// A description of the FAQ.
  ///
  /// Parameter [fileFormat] :
  /// The format of the input file. You can choose between a basic CSV format, a
  /// CSV format that includes customs attributes in a header, and a JSON format
  /// that includes custom attributes.
  ///
  /// The format must match the format of the file stored in the S3 bucket
  /// identified in the <code>S3Path</code> parameter.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html">Adding
  /// questions and answers</a>.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify the FAQ. You can use the tags to
  /// identify and organize your resources and to control access to resources.
  Future<CreateFaqResponse> createFaq({
    required String indexId,
    required String name,
    required String roleArn,
    required S3Path s3Path,
    String? clientToken,
    String? description,
    FaqFileFormat? fileFormat,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
      isRequired: true,
    );
    ArgumentError.checkNotNull(s3Path, 's3Path');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (fileFormat != null) 'FileFormat': fileFormat.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFaqResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new Amazon Kendra index. Index creation is an asynchronous
  /// operation. To determine if index creation has completed, check the
  /// <code>Status</code> field returned from a call to
  /// <code>DescribeIndex</code>. The <code>Status</code> field is set to
  /// <code>ACTIVE</code> when the index is ready to use.
  ///
  /// Once the index is active you can index your documents using the
  /// <code>BatchPutDocument</code> operation or using one of the supported data
  /// sources.
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
  /// An AWS Identity and Access Management (IAM) role that gives Amazon Kendra
  /// permissions to access your Amazon CloudWatch logs and metrics. This is
  /// also the role used when you use the <code>BatchPutDocument</code>
  /// operation to index documents from an Amazon S3 bucket.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create an index.
  /// Multiple calls to the <code>CreateIndex</code> operation with the same
  /// client token will create only one index.
  ///
  /// Parameter [description] :
  /// A description for the index.
  ///
  /// Parameter [edition] :
  /// The Amazon Kendra edition to use for the index. Choose
  /// <code>DEVELOPER_EDITION</code> for indexes intended for development,
  /// testing, or proof of concept. Use <code>ENTERPRISE_EDITION</code> for your
  /// production databases. Once you set the edition for an index, it can't be
  /// changed.
  ///
  /// The <code>Edition</code> parameter is optional. If you don't supply a
  /// value, the default is <code>ENTERPRISE_EDITION</code>.
  ///
  /// For more information on quota limits for enterprise and developer
  /// editions, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas</a>.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The identifier of the AWS KMS customer managed key (CMK) to use to encrypt
  /// data indexed by Amazon Kendra. Amazon Kendra doesn't support asymmetric
  /// CMKs.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify the index. You can use the tags to
  /// identify and organize your resources and to control access to resources.
  ///
  /// Parameter [userContextPolicy] :
  /// The user context policy.
  /// <dl> <dt>ATTRIBUTE_FILTER</dt> <dd>
  /// All indexed content is searchable and displayable for all users. If there
  /// is an access control list, it is ignored. You can filter on user and group
  /// attributes.
  /// </dd> <dt>USER_TOKEN</dt> <dd>
  /// Enables SSO and token-based user access control. All documents with no
  /// access control and all documents accessible to the user will be searchable
  /// and displayable.
  /// </dd> </dl>
  ///
  /// Parameter [userTokenConfigurations] :
  /// The user token configuration.
  Future<CreateIndexResponse> createIndex({
    required String name,
    required String roleArn,
    String? clientToken,
    String? description,
    IndexEdition? edition,
    ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration,
    List<Tag>? tags,
    UserContextPolicy? userContextPolicy,
    List<UserTokenConfiguration>? userTokenConfigurations,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      1000,
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
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (edition != null) 'Edition': edition.toValue(),
        if (serverSideEncryptionConfiguration != null)
          'ServerSideEncryptionConfiguration':
              serverSideEncryptionConfiguration,
        if (tags != null) 'Tags': tags,
        if (userContextPolicy != null)
          'UserContextPolicy': userContextPolicy.toValue(),
        if (userTokenConfigurations != null)
          'UserTokenConfigurations': userTokenConfigurations,
      },
    );

    return CreateIndexResponse.fromJson(jsonResponse.body);
  }

  /// Creates a block list to exlcude certain queries from suggestions.
  ///
  /// Any query that contains words or phrases specified in the block list is
  /// blocked or filtered out from being shown as a suggestion.
  ///
  /// You need to provide the file location of your block list text file in your
  /// S3 bucket. In your text file, enter each block word or phrase on a
  /// separate line.
  ///
  /// For information on the current quota limits for block lists, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas for
  /// Amazon Kendra</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index you want to create a query suggestions block
  /// list for.
  ///
  /// Parameter [name] :
  /// A user friendly name for the block list.
  ///
  /// For example, the block list named 'offensive-words' includes all offensive
  /// words that could appear in user queries and need to be blocked from
  /// suggestions.
  ///
  /// Parameter [roleArn] :
  /// The IAM (Identity and Access Management) role used by Amazon Kendra to
  /// access the block list text file in your S3 bucket.
  ///
  /// You need permissions to the role ARN (Amazon Resource Name). The role
  /// needs S3 read permissions to your file in S3 and needs to give STS
  /// (Security Token Service) assume role permissions to Amazon Kendra.
  ///
  /// Parameter [sourceS3Path] :
  /// The S3 path to your block list text file in your S3 bucket.
  ///
  /// Each block word or phrase should be on a separate line in a text file.
  ///
  /// For information on the current quota limits for block lists, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas for
  /// Amazon Kendra</a>.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a query
  /// suggestions block list.
  ///
  /// Parameter [description] :
  /// A user-friendly description for the block list.
  ///
  /// For example, the description "List of all offensive words that can appear
  /// in user queries and need to be blocked from suggestions."
  ///
  /// Parameter [tags] :
  /// A tag that you can assign to a block list that categorizes the block list.
  Future<CreateQuerySuggestionsBlockListResponse>
      createQuerySuggestionsBlockList({
    required String indexId,
    required String name,
    required String roleArn,
    required S3Path sourceS3Path,
    String? clientToken,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceS3Path, 'sourceS3Path');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.CreateQuerySuggestionsBlockList'
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
        'SourceS3Path': sourceS3Path,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateQuerySuggestionsBlockListResponse.fromJson(jsonResponse.body);
  }

  /// Creates a thesaurus for an index. The thesaurus contains a list of
  /// synonyms in Solr format.
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
  /// The unique identifier of the index for the new thesaurus.
  ///
  /// Parameter [name] :
  /// The name for the new thesaurus.
  ///
  /// Parameter [roleArn] :
  /// An AWS Identity and Access Management (IAM) role that gives Amazon Kendra
  /// permissions to access thesaurus file specified in
  /// <code>SourceS3Path</code>.
  ///
  /// Parameter [sourceS3Path] :
  /// The thesaurus file Amazon S3 source path.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a thesaurus.
  /// Multiple calls to the <code>CreateThesaurus</code> operation with the same
  /// client token will create only one index.
  ///
  /// Parameter [description] :
  /// The description for the new thesaurus.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify the thesaurus. You can use the
  /// tags to identify and organize your resources and to control access to
  /// resources.
  Future<CreateThesaurusResponse> createThesaurus({
    required String indexId,
    required String name,
    required String roleArn,
    required S3Path sourceS3Path,
    String? clientToken,
    String? description,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
    ArgumentError.checkNotNull(roleArn, 'roleArn');
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sourceS3Path, 'sourceS3Path');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      100,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.CreateThesaurus'
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
        'SourceS3Path': sourceS3Path,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateThesaurusResponse.fromJson(jsonResponse.body);
  }

  /// Deletes an Amazon Kendra data source. An exception is not thrown if the
  /// data source is already being deleted. While the data source is being
  /// deleted, the <code>Status</code> field returned by a call to the
  /// <code>DescribeDataSource</code> operation is set to <code>DELETING</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/delete-data-source.html">Deleting
  /// Data Sources</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the data source to delete.
  ///
  /// Parameter [indexId] :
  /// The unique identifier of the index associated with the data source.
  Future<void> deleteDataSource({
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteDataSource'
    };
    await _protocol.send(
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
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteFaq'
    };
    await _protocol.send(
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
  /// <code>Status</code> field returned by a call to the
  /// <code>DescribeIndex</code> operation is set to <code>DELETING</code>.
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteIndex'
    };
    await _protocol.send(
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

  /// Deletes a block list used for query suggestions for an index.
  ///
  /// A deleted block list might not take effect right away. Amazon Kendra needs
  /// to refresh the entire suggestions list to add back the queries that were
  /// previously blocked.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the block list that needs to be deleted.
  ///
  /// Parameter [indexId] :
  /// The identifier of the you want to delete a block list from.
  Future<void> deleteQuerySuggestionsBlockList({
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteQuerySuggestionsBlockList'
    };
    await _protocol.send(
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

  /// Deletes an existing Amazon Kendra thesaurus.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the thesaurus to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index associated with the thesaurus to delete.
  Future<void> deleteThesaurus({
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteThesaurus'
    };
    await _protocol.send(
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
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    required String id,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
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

  /// Describes a block list used for query suggestions for an index.
  ///
  /// This is used to check the current settings that are applied to a block
  /// list.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The unique identifier of the block list.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the block list.
  Future<DescribeQuerySuggestionsBlockListResponse>
      describeQuerySuggestionsBlockList({
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSKendraFrontendService.DescribeQuerySuggestionsBlockList'
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

    return DescribeQuerySuggestionsBlockListResponse.fromJson(
        jsonResponse.body);
  }

  /// Describes the settings of query suggestions for an index.
  ///
  /// This is used to check the current settings applied to query suggestions.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index you want to describe query suggestions
  /// settings for.
  Future<DescribeQuerySuggestionsConfigResponse>
      describeQuerySuggestionsConfig({
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DescribeQuerySuggestionsConfig'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
      },
    );

    return DescribeQuerySuggestionsConfigResponse.fromJson(jsonResponse.body);
  }

  /// Describes an existing Amazon Kendra thesaurus.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the thesaurus to describe.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index associated with the thesaurus to describe.
  Future<DescribeThesaurusResponse> describeThesaurus({
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DescribeThesaurus'
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

    return DescribeThesaurusResponse.fromJson(jsonResponse.body);
  }

  /// Fetches the queries that are suggested to your users.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index you want to get query suggestions from.
  ///
  /// Parameter [queryText] :
  /// The text of a user's query to generate query suggestions.
  ///
  /// A query is suggested if the query prefix matches what a user starts to
  /// type as their query.
  ///
  /// Amazon Kendra does not show any suggestions if a user types fewer than two
  /// characters or more than 60 characters. A query must also have at least one
  /// search result and contain at least one word of more than four characters.
  ///
  /// Parameter [maxSuggestionsCount] :
  /// The maximum number of query suggestions you want to show to your users.
  Future<GetQuerySuggestionsResponse> getQuerySuggestions({
    required String indexId,
    required String queryText,
    int? maxSuggestionsCount,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    ArgumentError.checkNotNull(queryText, 'queryText');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.GetQuerySuggestions'
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
        if (maxSuggestionsCount != null)
          'MaxSuggestionsCount': maxSuggestionsCount,
      },
    );

    return GetQuerySuggestionsResponse.fromJson(jsonResponse.body);
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
    required String id,
    required String indexId,
    int? maxResults,
    String? nextToken,
    TimeRange? startTimeFilter,
    DataSourceSyncJobStatus? statusFilter,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
    int? maxResults,
    String? nextToken,
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

  /// Lists the block lists used for query suggestions for an index.
  ///
  /// For information on the current quota limits for block lists, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas for
  /// Amazon Kendra</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for a list of all block lists that exist for
  /// that index.
  ///
  /// For information on the current quota limits for block lists, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas for
  /// Amazon Kendra</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of block lists to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of block lists
  /// (<code>BlockListSummaryItems</code>).
  Future<ListQuerySuggestionsBlockListsResponse>
      listQuerySuggestionsBlockLists({
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
      'X-Amz-Target': 'AWSKendraFrontendService.ListQuerySuggestionsBlockLists'
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

    return ListQuerySuggestionsBlockListsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of tags associated with a specified resource. Indexes, FAQs,
  /// and data sources can have tags associated with them.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the index, FAQ, or data source to get a
  /// list of tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists the Amazon Kendra thesauri associated with an index.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index associated with the thesaurus to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of thesauri to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of thesauri
  /// (<code>ThesaurusSummaryItems</code>).
  Future<ListThesauriResponse> listThesauri({
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
      'X-Amz-Target': 'AWSKendraFrontendService.ListThesauri'
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

    return ListThesauriResponse.fromJson(jsonResponse.body);
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
  /// Each query returns the 100 most relevant results.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The unique identifier of the index to search. The identifier is returned
  /// in the response from the <code>CreateIndex</code> operation.
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
  /// Parameter [documentRelevanceOverrideConfigurations] :
  /// Overrides relevance tuning configurations of fields or attributes set at
  /// the index level.
  ///
  /// If you use this API to override the relevance tuning configured at the
  /// index level, but there is no relevance tuning configured at the index
  /// level, then Amazon Kendra does not apply any relevance tuning.
  ///
  /// If there is relevance tuning configured at the index level, but you do not
  /// use this API to override any relevance tuning in the index, then Amazon
  /// Kendra uses the relevance tuning that is configured at the index level.
  ///
  /// If there is relevance tuning configured for fields at the index level, but
  /// you use this API to override only some of these fields, then for the
  /// fields you did not override, the importance is set to 1.
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
  /// default page size is 10. The maximum number of results returned is 100. If
  /// you ask for more than 100 results, only 100 are returned.
  ///
  /// Parameter [queryResultTypeFilter] :
  /// Sets the type of query. Only results for the specified query type are
  /// returned.
  ///
  /// Parameter [requestedDocumentAttributes] :
  /// An array of document attributes to include in the response. No other
  /// document attributes are included in the response. By default all document
  /// attributes are included in the response.
  ///
  /// Parameter [sortingConfiguration] :
  /// Provides information that determines how the results of the query are
  /// sorted. You can set the field that Amazon Kendra should sort the results
  /// on, and specify whether the results should be sorted in ascending or
  /// descending order. In the case of ties in sorting the results, the results
  /// are sorted by relevance.
  ///
  /// If you don't provide sorting configuration, the results are sorted by the
  /// relevance that Amazon Kendra determines for the result.
  ///
  /// Parameter [userContext] :
  /// The user context token.
  ///
  /// Parameter [visitorId] :
  /// Provides an identifier for a specific user. The <code>VisitorId</code>
  /// should be a unique identifier, such as a GUID. Don't use personally
  /// identifiable information, such as the user's email address, as the
  /// <code>VisitorId</code>.
  Future<QueryResult> query({
    required String indexId,
    required String queryText,
    AttributeFilter? attributeFilter,
    List<DocumentRelevanceConfiguration>?
        documentRelevanceOverrideConfigurations,
    List<Facet>? facets,
    int? pageNumber,
    int? pageSize,
    QueryResultType? queryResultTypeFilter,
    List<String>? requestedDocumentAttributes,
    SortingConfiguration? sortingConfiguration,
    UserContext? userContext,
    String? visitorId,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
    _s.validateStringLength(
      'visitorId',
      visitorId,
      1,
      256,
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
        if (documentRelevanceOverrideConfigurations != null)
          'DocumentRelevanceOverrideConfigurations':
              documentRelevanceOverrideConfigurations,
        if (facets != null) 'Facets': facets,
        if (pageNumber != null) 'PageNumber': pageNumber,
        if (pageSize != null) 'PageSize': pageSize,
        if (queryResultTypeFilter != null)
          'QueryResultTypeFilter': queryResultTypeFilter.toValue(),
        if (requestedDocumentAttributes != null)
          'RequestedDocumentAttributes': requestedDocumentAttributes,
        if (sortingConfiguration != null)
          'SortingConfiguration': sortingConfiguration,
        if (userContext != null) 'UserContext': userContext,
        if (visitorId != null) 'VisitorId': visitorId,
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
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    required String id,
    required String indexId,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.StopDataSourceSyncJob'
    };
    await _protocol.send(
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
  /// feedback. The query ID is returned in the response to the
  /// <code>Query</code> operation.
  ///
  /// Parameter [clickFeedbackItems] :
  /// Tells Amazon Kendra that a particular search result link was chosen by the
  /// user.
  ///
  /// Parameter [relevanceFeedbackItems] :
  /// Provides Amazon Kendra with relevant or not relevant feedback for whether
  /// a particular item was relevant to the search.
  Future<void> submitFeedback({
    required String indexId,
    required String queryId,
    List<ClickFeedback>? clickFeedbackItems,
    List<RelevanceFeedback>? relevanceFeedbackItems,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
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
    await _protocol.send(
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

  /// Adds the specified tag to the specified index, FAQ, or data source
  /// resource. If the tag already exists, the existing value is replaced with
  /// the new value.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the index, FAQ, or data source to tag.
  ///
  /// Parameter [tags] :
  /// A list of tag keys to add to the index, FAQ, or data source. If a tag
  /// already exists, the existing value is replaced with the new value.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'Tags': tags,
      },
    );
  }

  /// Removes a tag from an index, FAQ, or a data source.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the index, FAQ, or data source to remove
  /// the tag from.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys to remove from the index, FAQ, or data source. If a tag
  /// key does not exist on the resource, it is ignored.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceARN': resourceARN,
        'TagKeys': tagKeys,
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
    required String id,
    required String indexId,
    DataSourceConfiguration? configuration,
    String? description,
    String? name,
    String? roleArn,
    String? schedule,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1000,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateDataSource'
    };
    await _protocol.send(
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the index to update.
  ///
  /// Parameter [capacityUnits] :
  /// Sets the number of additional storage and query capacity units that should
  /// be used by the index. You can change the capacity of the index up to 5
  /// times per day.
  ///
  /// If you are using extra storage units, you can't reduce the storage
  /// capacity below that required to meet the storage needs for your index.
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
  ///
  /// Parameter [userContextPolicy] :
  /// The user user token context policy.
  ///
  /// Parameter [userTokenConfigurations] :
  /// The user token configuration.
  Future<void> updateIndex({
    required String id,
    CapacityUnitsConfiguration? capacityUnits,
    String? description,
    List<DocumentMetadataConfiguration>? documentMetadataConfigurationUpdates,
    String? name,
    String? roleArn,
    UserContextPolicy? userContextPolicy,
    List<UserTokenConfiguration>? userTokenConfigurations,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
      isRequired: true,
    );
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      1000,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateIndex'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        if (capacityUnits != null) 'CapacityUnits': capacityUnits,
        if (description != null) 'Description': description,
        if (documentMetadataConfigurationUpdates != null)
          'DocumentMetadataConfigurationUpdates':
              documentMetadataConfigurationUpdates,
        if (name != null) 'Name': name,
        if (roleArn != null) 'RoleArn': roleArn,
        if (userContextPolicy != null)
          'UserContextPolicy': userContextPolicy.toValue(),
        if (userTokenConfigurations != null)
          'UserTokenConfigurations': userTokenConfigurations,
      },
    );
  }

  /// Updates a block list used for query suggestions for an index.
  ///
  /// Updates to a block list might not take effect right away. Amazon Kendra
  /// needs to refresh the entire suggestions list to apply any updates to the
  /// block list. Other changes not related to the block list apply immediately.
  ///
  /// If a block list is updating, then you need to wait for the first update to
  /// finish before submitting another update.
  ///
  /// Amazon Kendra supports partial updates, so you only need to provide the
  /// fields you want to update.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The unique identifier of a block list.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for a block list.
  ///
  /// Parameter [description] :
  /// The description for a block list.
  ///
  /// Parameter [name] :
  /// The name of a block list.
  ///
  /// Parameter [roleArn] :
  /// The IAM (Identity and Access Management) role used to access the block
  /// list text file in S3.
  ///
  /// Parameter [sourceS3Path] :
  /// The S3 path where your block list text file sits in S3.
  ///
  /// If you update your block list and provide the same path to the block list
  /// text file in S3, then Amazon Kendra reloads the file to refresh the block
  /// list. Amazon Kendra does not automatically refresh your block list. You
  /// need to call the <code>UpdateQuerySuggestionsBlockList</code> API to
  /// refresh you block list.
  ///
  /// If you update your block list, then Amazon Kendra asynchronously refreshes
  /// all query suggestions with the latest content in the S3 file. This means
  /// changes might not take effect immediately.
  Future<void> updateQuerySuggestionsBlockList({
    required String id,
    required String indexId,
    String? description,
    String? name,
    String? roleArn,
    S3Path? sourceS3Path,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      36,
      36,
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
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateQuerySuggestionsBlockList'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
        if (roleArn != null) 'RoleArn': roleArn,
        if (sourceS3Path != null) 'SourceS3Path': sourceS3Path,
      },
    );
  }

  /// Updates the settings of query suggestions for an index.
  ///
  /// Amazon Kendra supports partial updates, so you only need to provide the
  /// fields you want to update.
  ///
  /// If an update is currently processing (i.e. 'happening'), you need to wait
  /// for the update to finish before making another update.
  ///
  /// Updates to query suggestions settings might not take effect right away.
  /// The time for your updated settings to take effect depends on the updates
  /// made and the number of search queries in your index.
  ///
  /// You can still enable/disable query suggestions at any time.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index you want to update query suggestions settings
  /// for.
  ///
  /// Parameter [includeQueriesWithoutUserInformation] :
  /// <code>TRUE</code> to include queries without user information (i.e. all
  /// queries, irrespective of the user), otherwise <code>FALSE</code> to only
  /// include queries with user information.
  ///
  /// If you pass user information to Amazon Kendra along with the queries, you
  /// can set this flag to <code>FALSE</code> and instruct Amazon Kendra to only
  /// consider queries with user information.
  ///
  /// If you set to <code>FALSE</code>, Amazon Kendra only considers queries
  /// searched at least <code>MinimumQueryCount</code> times across
  /// <code>MinimumNumberOfQueryingUsers</code> unique users for suggestions.
  ///
  /// If you set to <code>TRUE</code>, Amazon Kendra ignores all user
  /// information and learns from all queries.
  ///
  /// Parameter [minimumNumberOfQueryingUsers] :
  /// The minimum number of unique users who must search a query in order for
  /// the query to be eligible to suggest to your users.
  ///
  /// Increasing this number might decrease the number of suggestions. However,
  /// this ensures a query is searched by many users and is truly popular to
  /// suggest to users.
  ///
  /// How you tune this setting depends on your specific needs.
  ///
  /// Parameter [minimumQueryCount] :
  /// The the minimum number of times a query must be searched in order to be
  /// eligible to suggest to your users.
  ///
  /// Decreasing this number increases the number of suggestions. However, this
  /// affects the quality of suggestions as it sets a low bar for a query to be
  /// considered popular to suggest to users.
  ///
  /// How you tune this setting depends on your specific needs.
  ///
  /// Parameter [mode] :
  /// Set the mode to <code>ENABLED</code> or <code>LEARN_ONLY</code>.
  ///
  /// By default, Amazon Kendra enables query suggestions.
  /// <code>LEARN_ONLY</code> mode allows you to turn off query suggestions. You
  /// can to update this at any time.
  ///
  /// In <code>LEARN_ONLY</code> mode, Amazon Kendra continues to learn from new
  /// queries to keep suggestions up to date for when you are ready to switch to
  /// ENABLED mode again.
  ///
  /// Parameter [queryLogLookBackWindowInDays] :
  /// How recent your queries are in your query log time window.
  ///
  /// The time window is the number of days from current day to past days.
  ///
  /// By default, Amazon Kendra sets this to 180.
  Future<void> updateQuerySuggestionsConfig({
    required String indexId,
    bool? includeQueriesWithoutUserInformation,
    int? minimumNumberOfQueryingUsers,
    int? minimumQueryCount,
    Mode? mode,
    int? queryLogLookBackWindowInDays,
  }) async {
    ArgumentError.checkNotNull(indexId, 'indexId');
    _s.validateStringLength(
      'indexId',
      indexId,
      36,
      36,
      isRequired: true,
    );
    _s.validateNumRange(
      'minimumNumberOfQueryingUsers',
      minimumNumberOfQueryingUsers,
      1,
      10000,
    );
    _s.validateNumRange(
      'minimumQueryCount',
      minimumQueryCount,
      1,
      10000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateQuerySuggestionsConfig'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
        if (includeQueriesWithoutUserInformation != null)
          'IncludeQueriesWithoutUserInformation':
              includeQueriesWithoutUserInformation,
        if (minimumNumberOfQueryingUsers != null)
          'MinimumNumberOfQueryingUsers': minimumNumberOfQueryingUsers,
        if (minimumQueryCount != null) 'MinimumQueryCount': minimumQueryCount,
        if (mode != null) 'Mode': mode.toValue(),
        if (queryLogLookBackWindowInDays != null)
          'QueryLogLookBackWindowInDays': queryLogLookBackWindowInDays,
      },
    );
  }

  /// Updates a thesaurus file associated with an index.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the thesaurus to update.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index associated with the thesaurus to update.
  ///
  /// Parameter [description] :
  /// The updated description of the thesaurus.
  ///
  /// Parameter [name] :
  /// The updated name of the thesaurus.
  ///
  /// Parameter [roleArn] :
  /// The updated role ARN of the thesaurus.
  Future<void> updateThesaurus({
    required String id,
    required String indexId,
    String? description,
    String? name,
    String? roleArn,
    S3Path? sourceS3Path,
  }) async {
    ArgumentError.checkNotNull(id, 'id');
    _s.validateStringLength(
      'id',
      id,
      1,
      100,
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
    _s.validateStringLength(
      'description',
      description,
      0,
      1000,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
    );
    _s.validateStringLength(
      'roleArn',
      roleArn,
      1,
      1284,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateThesaurus'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Id': id,
        'IndexId': indexId,
        if (description != null) 'Description': description,
        if (name != null) 'Name': name,
        if (roleArn != null) 'RoleArn': roleArn,
        if (sourceS3Path != null) 'SourceS3Path': sourceS3Path,
      },
    );
  }
}

/// Access Control List files for the documents in a data source. For the format
/// of the file, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html">Access
/// control for S3 data sources</a>.
class AccessControlListConfiguration {
  /// Path to the AWS S3 bucket that contains the ACL files.
  final String? keyPath;

  AccessControlListConfiguration({
    this.keyPath,
  });

  factory AccessControlListConfiguration.fromJson(Map<String, dynamic> json) {
    return AccessControlListConfiguration(
      keyPath: json['KeyPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPath = this.keyPath;
    return {
      if (keyPath != null) 'KeyPath': keyPath,
    };
  }
}

/// Provides information about the column that should be used for filtering the
/// query response by groups.
class AclConfiguration {
  /// A list of groups, separated by semi-colons, that filters a query response
  /// based on user context. The document is only returned to users that are in
  /// one of the groups specified in the <code>UserContext</code> field of the
  /// <code>Query</code> operation.
  final String allowedGroupsColumnName;

  AclConfiguration({
    required this.allowedGroupsColumnName,
  });

  factory AclConfiguration.fromJson(Map<String, dynamic> json) {
    return AclConfiguration(
      allowedGroupsColumnName: json['AllowedGroupsColumnName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final allowedGroupsColumnName = this.allowedGroupsColumnName;
    return {
      'AllowedGroupsColumnName': allowedGroupsColumnName,
    };
  }
}

/// An attribute returned from an index query.
class AdditionalResultAttribute {
  /// The key that identifies the attribute.
  final String key;

  /// An object that contains the attribute value.
  final AdditionalResultAttributeValue value;

  /// The data type of the <code>Value</code> property.
  final AdditionalResultAttributeValueType valueType;

  AdditionalResultAttribute({
    required this.key,
    required this.value,
    required this.valueType,
  });

  factory AdditionalResultAttribute.fromJson(Map<String, dynamic> json) {
    return AdditionalResultAttribute(
      key: json['Key'] as String,
      value: AdditionalResultAttributeValue.fromJson(
          json['Value'] as Map<String, dynamic>),
      valueType:
          (json['ValueType'] as String).toAdditionalResultAttributeValueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    final valueType = this.valueType;
    return {
      'Key': key,
      'Value': value,
      'ValueType': valueType.toValue(),
    };
  }
}

/// An attribute returned with a document from a search.
class AdditionalResultAttributeValue {
  /// The text associated with the attribute and information about the highlight
  /// to apply to the text.
  final TextWithHighlights? textWithHighlightsValue;

  AdditionalResultAttributeValue({
    this.textWithHighlightsValue,
  });

  factory AdditionalResultAttributeValue.fromJson(Map<String, dynamic> json) {
    return AdditionalResultAttributeValue(
      textWithHighlightsValue: json['TextWithHighlightsValue'] != null
          ? TextWithHighlights.fromJson(
              json['TextWithHighlightsValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final textWithHighlightsValue = this.textWithHighlightsValue;
    return {
      if (textWithHighlightsValue != null)
        'TextWithHighlightsValue': textWithHighlightsValue,
    };
  }
}

enum AdditionalResultAttributeValueType {
  textWithHighlightsValue,
}

extension on AdditionalResultAttributeValueType {
  String toValue() {
    switch (this) {
      case AdditionalResultAttributeValueType.textWithHighlightsValue:
        return 'TEXT_WITH_HIGHLIGHTS_VALUE';
    }
  }
}

extension on String {
  AdditionalResultAttributeValueType toAdditionalResultAttributeValueType() {
    switch (this) {
      case 'TEXT_WITH_HIGHLIGHTS_VALUE':
        return AdditionalResultAttributeValueType.textWithHighlightsValue;
    }
    throw Exception(
        '$this is not known in enum AdditionalResultAttributeValueType');
  }
}

/// Provides filtering the query results based on document attributes.
///
/// When you use the <code>AndAllFilters</code> or <code>OrAllFilters</code>,
/// filters you can use 2 layers under the first attribute filter. For example,
/// you can use:
///
/// <code>&lt;AndAllFilters&gt;</code>
/// <ol>
/// <li>
/// <code> &lt;OrAllFilters&gt;</code>
/// </li>
/// <li>
/// <code> &lt;EqualTo&gt;</code>
/// </li> </ol>
/// If you use more than 2 layers, you receive a
/// <code>ValidationException</code> exception with the message
/// "<code>AttributeFilter</code> cannot have a depth of more than 2."
class AttributeFilter {
  /// Performs a logical <code>AND</code> operation on all supplied filters.
  final List<AttributeFilter>? andAllFilters;

  /// Returns true when a document contains all of the specified document
  /// attributes. This filter is only applicable to <code>StringListValue</code>
  /// metadata.
  final DocumentAttribute? containsAll;

  /// Returns true when a document contains any of the specified document
  /// attributes. This filter is only applicable to <code>StringListValue</code>
  /// metadata.
  final DocumentAttribute? containsAny;

  /// Performs an equals operation on two document attributes.
  final DocumentAttribute? equalsTo;

  /// Performs a greater than operation on two document attributes. Use with a
  /// document attribute of type <code>Integer</code> or <code>Long</code>.
  final DocumentAttribute? greaterThan;

  /// Performs a greater or equals than operation on two document attributes. Use
  /// with a document attribute of type <code>Integer</code> or <code>Long</code>.
  final DocumentAttribute? greaterThanOrEquals;

  /// Performs a less than operation on two document attributes. Use with a
  /// document attribute of type <code>Integer</code> or <code>Long</code>.
  final DocumentAttribute? lessThan;

  /// Performs a less than or equals operation on two document attributes. Use
  /// with a document attribute of type <code>Integer</code> or <code>Long</code>.
  final DocumentAttribute? lessThanOrEquals;

  /// Performs a logical <code>NOT</code> operation on all supplied filters.
  final AttributeFilter? notFilter;

  /// Performs a logical <code>OR</code> operation on all supplied filters.
  final List<AttributeFilter>? orAllFilters;

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

  factory AttributeFilter.fromJson(Map<String, dynamic> json) {
    return AttributeFilter(
      andAllFilters: (json['AndAllFilters'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      containsAll: json['ContainsAll'] != null
          ? DocumentAttribute.fromJson(
              json['ContainsAll'] as Map<String, dynamic>)
          : null,
      containsAny: json['ContainsAny'] != null
          ? DocumentAttribute.fromJson(
              json['ContainsAny'] as Map<String, dynamic>)
          : null,
      equalsTo: json['EqualsTo'] != null
          ? DocumentAttribute.fromJson(json['EqualsTo'] as Map<String, dynamic>)
          : null,
      greaterThan: json['GreaterThan'] != null
          ? DocumentAttribute.fromJson(
              json['GreaterThan'] as Map<String, dynamic>)
          : null,
      greaterThanOrEquals: json['GreaterThanOrEquals'] != null
          ? DocumentAttribute.fromJson(
              json['GreaterThanOrEquals'] as Map<String, dynamic>)
          : null,
      lessThan: json['LessThan'] != null
          ? DocumentAttribute.fromJson(json['LessThan'] as Map<String, dynamic>)
          : null,
      lessThanOrEquals: json['LessThanOrEquals'] != null
          ? DocumentAttribute.fromJson(
              json['LessThanOrEquals'] as Map<String, dynamic>)
          : null,
      notFilter: json['NotFilter'] != null
          ? AttributeFilter.fromJson(json['NotFilter'] as Map<String, dynamic>)
          : null,
      orAllFilters: (json['OrAllFilters'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final andAllFilters = this.andAllFilters;
    final containsAll = this.containsAll;
    final containsAny = this.containsAny;
    final equalsTo = this.equalsTo;
    final greaterThan = this.greaterThan;
    final greaterThanOrEquals = this.greaterThanOrEquals;
    final lessThan = this.lessThan;
    final lessThanOrEquals = this.lessThanOrEquals;
    final notFilter = this.notFilter;
    final orAllFilters = this.orAllFilters;
    return {
      if (andAllFilters != null) 'AndAllFilters': andAllFilters,
      if (containsAll != null) 'ContainsAll': containsAll,
      if (containsAny != null) 'ContainsAny': containsAny,
      if (equalsTo != null) 'EqualsTo': equalsTo,
      if (greaterThan != null) 'GreaterThan': greaterThan,
      if (greaterThanOrEquals != null)
        'GreaterThanOrEquals': greaterThanOrEquals,
      if (lessThan != null) 'LessThan': lessThan,
      if (lessThanOrEquals != null) 'LessThanOrEquals': lessThanOrEquals,
      if (notFilter != null) 'NotFilter': notFilter,
      if (orAllFilters != null) 'OrAllFilters': orAllFilters,
    };
  }
}

/// Provides the configuration information to connect to websites that require
/// user authentication.
class AuthenticationConfiguration {
  /// The list of configuration information that's required to connect to and
  /// crawl a website host using basic authentication credentials.
  ///
  /// The list includes the name and port number of the website host.
  final List<BasicAuthenticationConfiguration>? basicAuthentication;

  AuthenticationConfiguration({
    this.basicAuthentication,
  });

  factory AuthenticationConfiguration.fromJson(Map<String, dynamic> json) {
    return AuthenticationConfiguration(
      basicAuthentication: (json['BasicAuthentication'] as List?)
          ?.whereNotNull()
          .map((e) => BasicAuthenticationConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final basicAuthentication = this.basicAuthentication;
    return {
      if (basicAuthentication != null)
        'BasicAuthentication': basicAuthentication,
    };
  }
}

/// Provides the configuration information to connect to websites that require
/// basic user authentication.
class BasicAuthenticationConfiguration {
  /// Your secret ARN, which you can create in <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">AWS
  /// Secrets Manager</a>
  ///
  /// You use a secret if basic authentication credentials are required to connect
  /// to a website. The secret stores your credentials of user name and password.
  final String credentials;

  /// The name of the website host you want to connect to using authentication
  /// credentials.
  ///
  /// For example, the host name of https://a.example.com/page1.html is
  /// "a.example.com".
  final String host;

  /// The port number of the website host you want to connect to using
  /// authentication credentials.
  ///
  /// For example, the port for https://a.example.com/page1.html is 443, the
  /// standard port for HTTPS.
  final int port;

  BasicAuthenticationConfiguration({
    required this.credentials,
    required this.host,
    required this.port,
  });

  factory BasicAuthenticationConfiguration.fromJson(Map<String, dynamic> json) {
    return BasicAuthenticationConfiguration(
      credentials: json['Credentials'] as String,
      host: json['Host'] as String,
      port: json['Port'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    final host = this.host;
    final port = this.port;
    return {
      'Credentials': credentials,
      'Host': host,
      'Port': port,
    };
  }
}

class BatchDeleteDocumentResponse {
  /// A list of documents that could not be removed from the index. Each entry
  /// contains an error message that indicates why the document couldn't be
  /// removed from the index.
  final List<BatchDeleteDocumentResponseFailedDocument>? failedDocuments;

  BatchDeleteDocumentResponse({
    this.failedDocuments,
  });

  factory BatchDeleteDocumentResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteDocumentResponse(
      failedDocuments: (json['FailedDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => BatchDeleteDocumentResponseFailedDocument.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedDocuments = this.failedDocuments;
    return {
      if (failedDocuments != null) 'FailedDocuments': failedDocuments,
    };
  }
}

/// Provides information about documents that could not be removed from an index
/// by the <code>BatchDeleteDocument</code> operation.
class BatchDeleteDocumentResponseFailedDocument {
  /// The error code for why the document couldn't be removed from the index.
  final ErrorCode? errorCode;

  /// An explanation for why the document couldn't be removed from the index.
  final String? errorMessage;

  /// The identifier of the document that couldn't be removed from the index.
  final String? id;

  BatchDeleteDocumentResponseFailedDocument({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory BatchDeleteDocumentResponseFailedDocument.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteDocumentResponseFailedDocument(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
    };
  }
}

class BatchGetDocumentStatusResponse {
  /// The status of documents. The status indicates if the document is waiting to
  /// be indexed, is in the process of indexing, has completed indexing, or failed
  /// indexing. If a document failed indexing, the status provides the reason why.
  final List<Status>? documentStatusList;

  /// A list of documents that Amazon Kendra couldn't get the status for. The list
  /// includes the ID of the document and the reason that the status couldn't be
  /// found.
  final List<BatchGetDocumentStatusResponseError>? errors;

  BatchGetDocumentStatusResponse({
    this.documentStatusList,
    this.errors,
  });

  factory BatchGetDocumentStatusResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetDocumentStatusResponse(
      documentStatusList: (json['DocumentStatusList'] as List?)
          ?.whereNotNull()
          .map((e) => Status.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchGetDocumentStatusResponseError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentStatusList = this.documentStatusList;
    final errors = this.errors;
    return {
      if (documentStatusList != null) 'DocumentStatusList': documentStatusList,
      if (errors != null) 'Errors': errors,
    };
  }
}

/// Provides a response when the status of a document could not be retrieved.
class BatchGetDocumentStatusResponseError {
  /// The unique identifier of the document whose status could not be retrieved.
  final String? documentId;

  /// Indicates the source of the error.
  final ErrorCode? errorCode;

  /// States that the API could not get the status of a document. This could be
  /// because the request is not valid or there is a system error.
  final String? errorMessage;

  BatchGetDocumentStatusResponseError({
    this.documentId,
    this.errorCode,
    this.errorMessage,
  });

  factory BatchGetDocumentStatusResponseError.fromJson(
      Map<String, dynamic> json) {
    return BatchGetDocumentStatusResponseError(
      documentId: json['DocumentId'] as String?,
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentId = this.documentId;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    return {
      if (documentId != null) 'DocumentId': documentId,
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

class BatchPutDocumentResponse {
  /// A list of documents that were not added to the index because the document
  /// failed a validation check. Each document contains an error message that
  /// indicates why the document couldn't be added to the index.
  ///
  /// If there was an error adding a document to an index the error is reported in
  /// your AWS CloudWatch log. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/cloudwatch-logs.html">Monitoring
  /// Amazon Kendra with Amazon CloudWatch Logs</a>
  final List<BatchPutDocumentResponseFailedDocument>? failedDocuments;

  BatchPutDocumentResponse({
    this.failedDocuments,
  });

  factory BatchPutDocumentResponse.fromJson(Map<String, dynamic> json) {
    return BatchPutDocumentResponse(
      failedDocuments: (json['FailedDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => BatchPutDocumentResponseFailedDocument.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedDocuments = this.failedDocuments;
    return {
      if (failedDocuments != null) 'FailedDocuments': failedDocuments,
    };
  }
}

/// Provides information about a document that could not be indexed.
class BatchPutDocumentResponseFailedDocument {
  /// The type of error that caused the document to fail to be indexed.
  final ErrorCode? errorCode;

  /// A description of the reason why the document could not be indexed.
  final String? errorMessage;

  /// The unique identifier of the document.
  final String? id;

  BatchPutDocumentResponseFailedDocument({
    this.errorCode,
    this.errorMessage,
    this.id,
  });

  factory BatchPutDocumentResponseFailedDocument.fromJson(
      Map<String, dynamic> json) {
    return BatchPutDocumentResponseFailedDocument(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
    };
  }
}

/// Specifies capacity units configured for your enterprise edition index. You
/// can add and remove capacity units to tune an index to your requirements.
class CapacityUnitsConfiguration {
  /// The amount of extra query capacity for an index and <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html">GetQuerySuggestions</a>
  /// capacity.
  ///
  /// A single extra capacity unit for an index provides 0.1 queries per second or
  /// approximately 8,000 queries per day.
  ///
  /// <code>GetQuerySuggestions</code> capacity is five times the provisioned
  /// query capacity for an index, or the base capacity of 2.5 calls per second,
  /// whichever is higher. For example, the base capacity for an index is 0.1
  /// queries per second, and <code>GetQuerySuggestions</code> capacity has a base
  /// of 2.5 calls per second. If you add another 0.1 queries per second to total
  /// 0.2 queries per second for an index, the <code>GetQuerySuggestions</code>
  /// capacity is 2.5 calls per second (higher than five times 0.2 queries per
  /// second).
  final int queryCapacityUnits;

  /// The amount of extra storage capacity for an index. A single capacity unit
  /// provides 30 GB of storage space or 100,000 documents, whichever is reached
  /// first.
  final int storageCapacityUnits;

  CapacityUnitsConfiguration({
    required this.queryCapacityUnits,
    required this.storageCapacityUnits,
  });

  factory CapacityUnitsConfiguration.fromJson(Map<String, dynamic> json) {
    return CapacityUnitsConfiguration(
      queryCapacityUnits: json['QueryCapacityUnits'] as int,
      storageCapacityUnits: json['StorageCapacityUnits'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final queryCapacityUnits = this.queryCapacityUnits;
    final storageCapacityUnits = this.storageCapacityUnits;
    return {
      'QueryCapacityUnits': queryCapacityUnits,
      'StorageCapacityUnits': storageCapacityUnits,
    };
  }
}

/// Gathers information about when a particular result was clicked by a user.
/// Your application uses the <code>SubmitFeedback</code> operation to provide
/// click information.
class ClickFeedback {
  /// The Unix timestamp of the date and time that the result was clicked.
  final DateTime clickTime;

  /// The unique identifier of the search result that was clicked.
  final String resultId;

  ClickFeedback({
    required this.clickTime,
    required this.resultId,
  });

  factory ClickFeedback.fromJson(Map<String, dynamic> json) {
    return ClickFeedback(
      clickTime: nonNullableTimeStampFromJson(json['ClickTime'] as Object),
      resultId: json['ResultId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final clickTime = this.clickTime;
    final resultId = this.resultId;
    return {
      'ClickTime': unixTimestampToJson(clickTime),
      'ResultId': resultId,
    };
  }
}

/// Provides information about how Amazon Kendra should use the columns of a
/// database in an index.
class ColumnConfiguration {
  /// One to five columns that indicate when a document in the database has
  /// changed.
  final List<String> changeDetectingColumns;

  /// The column that contains the contents of the document.
  final String documentDataColumnName;

  /// The column that provides the document's unique identifier.
  final String documentIdColumnName;

  /// The column that contains the title of the document.
  final String? documentTitleColumnName;

  /// An array of objects that map database column names to the corresponding
  /// fields in an index. You must first create the fields in the index using the
  /// <code>UpdateIndex</code> operation.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  ColumnConfiguration({
    required this.changeDetectingColumns,
    required this.documentDataColumnName,
    required this.documentIdColumnName,
    this.documentTitleColumnName,
    this.fieldMappings,
  });

  factory ColumnConfiguration.fromJson(Map<String, dynamic> json) {
    return ColumnConfiguration(
      changeDetectingColumns: (json['ChangeDetectingColumns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      documentDataColumnName: json['DocumentDataColumnName'] as String,
      documentIdColumnName: json['DocumentIdColumnName'] as String,
      documentTitleColumnName: json['DocumentTitleColumnName'] as String?,
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final changeDetectingColumns = this.changeDetectingColumns;
    final documentDataColumnName = this.documentDataColumnName;
    final documentIdColumnName = this.documentIdColumnName;
    final documentTitleColumnName = this.documentTitleColumnName;
    final fieldMappings = this.fieldMappings;
    return {
      'ChangeDetectingColumns': changeDetectingColumns,
      'DocumentDataColumnName': documentDataColumnName,
      'DocumentIdColumnName': documentIdColumnName,
      if (documentTitleColumnName != null)
        'DocumentTitleColumnName': documentTitleColumnName,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
    };
  }
}

/// Specifies the attachment settings for the Confluence data source. Attachment
/// settings are optional, if you don't specify settings attachments, Amazon
/// Kendra won't index them.
class ConfluenceAttachmentConfiguration {
  /// Defines how attachment metadata fields should be mapped to index fields.
  /// Before you can map a field, you must first create an index field with a
  /// matching type using the console or the <code>UpdateIndex</code> operation.
  ///
  /// If you specify the <code>AttachentFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  final List<ConfluenceAttachmentToIndexFieldMapping>? attachmentFieldMappings;

  /// Indicates whether Amazon Kendra indexes attachments to the pages and blogs
  /// in the Confluence data source.
  final bool? crawlAttachments;

  ConfluenceAttachmentConfiguration({
    this.attachmentFieldMappings,
    this.crawlAttachments,
  });

  factory ConfluenceAttachmentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ConfluenceAttachmentConfiguration(
      attachmentFieldMappings: (json['AttachmentFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) => ConfluenceAttachmentToIndexFieldMapping.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      crawlAttachments: json['CrawlAttachments'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final attachmentFieldMappings = this.attachmentFieldMappings;
    final crawlAttachments = this.crawlAttachments;
    return {
      if (attachmentFieldMappings != null)
        'AttachmentFieldMappings': attachmentFieldMappings,
      if (crawlAttachments != null) 'CrawlAttachments': crawlAttachments,
    };
  }
}

enum ConfluenceAttachmentFieldName {
  author,
  contentType,
  createdDate,
  displayUrl,
  fileSize,
  itemType,
  parentId,
  spaceKey,
  spaceName,
  url,
  version,
}

extension on ConfluenceAttachmentFieldName {
  String toValue() {
    switch (this) {
      case ConfluenceAttachmentFieldName.author:
        return 'AUTHOR';
      case ConfluenceAttachmentFieldName.contentType:
        return 'CONTENT_TYPE';
      case ConfluenceAttachmentFieldName.createdDate:
        return 'CREATED_DATE';
      case ConfluenceAttachmentFieldName.displayUrl:
        return 'DISPLAY_URL';
      case ConfluenceAttachmentFieldName.fileSize:
        return 'FILE_SIZE';
      case ConfluenceAttachmentFieldName.itemType:
        return 'ITEM_TYPE';
      case ConfluenceAttachmentFieldName.parentId:
        return 'PARENT_ID';
      case ConfluenceAttachmentFieldName.spaceKey:
        return 'SPACE_KEY';
      case ConfluenceAttachmentFieldName.spaceName:
        return 'SPACE_NAME';
      case ConfluenceAttachmentFieldName.url:
        return 'URL';
      case ConfluenceAttachmentFieldName.version:
        return 'VERSION';
    }
  }
}

extension on String {
  ConfluenceAttachmentFieldName toConfluenceAttachmentFieldName() {
    switch (this) {
      case 'AUTHOR':
        return ConfluenceAttachmentFieldName.author;
      case 'CONTENT_TYPE':
        return ConfluenceAttachmentFieldName.contentType;
      case 'CREATED_DATE':
        return ConfluenceAttachmentFieldName.createdDate;
      case 'DISPLAY_URL':
        return ConfluenceAttachmentFieldName.displayUrl;
      case 'FILE_SIZE':
        return ConfluenceAttachmentFieldName.fileSize;
      case 'ITEM_TYPE':
        return ConfluenceAttachmentFieldName.itemType;
      case 'PARENT_ID':
        return ConfluenceAttachmentFieldName.parentId;
      case 'SPACE_KEY':
        return ConfluenceAttachmentFieldName.spaceKey;
      case 'SPACE_NAME':
        return ConfluenceAttachmentFieldName.spaceName;
      case 'URL':
        return ConfluenceAttachmentFieldName.url;
      case 'VERSION':
        return ConfluenceAttachmentFieldName.version;
    }
    throw Exception('$this is not known in enum ConfluenceAttachmentFieldName');
  }
}

/// Defines the mapping between a field in the Confluence data source to a
/// Amazon Kendra index field.
///
/// You must first create the index field using the <code>UpdateIndex</code>
/// operation.
class ConfluenceAttachmentToIndexFieldMapping {
  /// The name of the field in the data source.
  ///
  /// You must first create the index field using the <code>UpdateIndex</code>
  /// operation.
  final ConfluenceAttachmentFieldName? dataSourceFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
  final String? dateFieldFormat;

  /// The name of the index field to map to the Confluence data source field. The
  /// index field type must match the Confluence field type.
  final String? indexFieldName;

  ConfluenceAttachmentToIndexFieldMapping({
    this.dataSourceFieldName,
    this.dateFieldFormat,
    this.indexFieldName,
  });

  factory ConfluenceAttachmentToIndexFieldMapping.fromJson(
      Map<String, dynamic> json) {
    return ConfluenceAttachmentToIndexFieldMapping(
      dataSourceFieldName: (json['DataSourceFieldName'] as String?)
          ?.toConfluenceAttachmentFieldName(),
      dateFieldFormat: json['DateFieldFormat'] as String?,
      indexFieldName: json['IndexFieldName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceFieldName = this.dataSourceFieldName;
    final dateFieldFormat = this.dateFieldFormat;
    final indexFieldName = this.indexFieldName;
    return {
      if (dataSourceFieldName != null)
        'DataSourceFieldName': dataSourceFieldName.toValue(),
      if (dateFieldFormat != null) 'DateFieldFormat': dateFieldFormat,
      if (indexFieldName != null) 'IndexFieldName': indexFieldName,
    };
  }
}

/// Specifies the blog settings for the Confluence data source. Blogs are always
/// indexed unless filtered from the index by the <code>ExclusionPatterns</code>
/// or <code>InclusionPatterns</code> fields in the
/// <code>ConfluenceConfiguration</code> type.
class ConfluenceBlogConfiguration {
  /// Defines how blog metadata fields should be mapped to index fields. Before
  /// you can map a field, you must first create an index field with a matching
  /// type using the console or the <code>UpdateIndex</code> operation.
  ///
  /// If you specify the <code>BlogFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  final List<ConfluenceBlogToIndexFieldMapping>? blogFieldMappings;

  ConfluenceBlogConfiguration({
    this.blogFieldMappings,
  });

  factory ConfluenceBlogConfiguration.fromJson(Map<String, dynamic> json) {
    return ConfluenceBlogConfiguration(
      blogFieldMappings: (json['BlogFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) => ConfluenceBlogToIndexFieldMapping.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final blogFieldMappings = this.blogFieldMappings;
    return {
      if (blogFieldMappings != null) 'BlogFieldMappings': blogFieldMappings,
    };
  }
}

enum ConfluenceBlogFieldName {
  author,
  displayUrl,
  itemType,
  labels,
  publishDate,
  spaceKey,
  spaceName,
  url,
  version,
}

extension on ConfluenceBlogFieldName {
  String toValue() {
    switch (this) {
      case ConfluenceBlogFieldName.author:
        return 'AUTHOR';
      case ConfluenceBlogFieldName.displayUrl:
        return 'DISPLAY_URL';
      case ConfluenceBlogFieldName.itemType:
        return 'ITEM_TYPE';
      case ConfluenceBlogFieldName.labels:
        return 'LABELS';
      case ConfluenceBlogFieldName.publishDate:
        return 'PUBLISH_DATE';
      case ConfluenceBlogFieldName.spaceKey:
        return 'SPACE_KEY';
      case ConfluenceBlogFieldName.spaceName:
        return 'SPACE_NAME';
      case ConfluenceBlogFieldName.url:
        return 'URL';
      case ConfluenceBlogFieldName.version:
        return 'VERSION';
    }
  }
}

extension on String {
  ConfluenceBlogFieldName toConfluenceBlogFieldName() {
    switch (this) {
      case 'AUTHOR':
        return ConfluenceBlogFieldName.author;
      case 'DISPLAY_URL':
        return ConfluenceBlogFieldName.displayUrl;
      case 'ITEM_TYPE':
        return ConfluenceBlogFieldName.itemType;
      case 'LABELS':
        return ConfluenceBlogFieldName.labels;
      case 'PUBLISH_DATE':
        return ConfluenceBlogFieldName.publishDate;
      case 'SPACE_KEY':
        return ConfluenceBlogFieldName.spaceKey;
      case 'SPACE_NAME':
        return ConfluenceBlogFieldName.spaceName;
      case 'URL':
        return ConfluenceBlogFieldName.url;
      case 'VERSION':
        return ConfluenceBlogFieldName.version;
    }
    throw Exception('$this is not known in enum ConfluenceBlogFieldName');
  }
}

/// Defines the mapping between a blog field in the Confluence data source to a
/// Amazon Kendra index field.
///
/// You must first create the index field using the <code>UpdateIndex</code>
/// operation.
class ConfluenceBlogToIndexFieldMapping {
  /// The name of the field in the data source.
  final ConfluenceBlogFieldName? dataSourceFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
  final String? dateFieldFormat;

  /// The name of the index field to map to the Confluence data source field. The
  /// index field type must match the Confluence field type.
  final String? indexFieldName;

  ConfluenceBlogToIndexFieldMapping({
    this.dataSourceFieldName,
    this.dateFieldFormat,
    this.indexFieldName,
  });

  factory ConfluenceBlogToIndexFieldMapping.fromJson(
      Map<String, dynamic> json) {
    return ConfluenceBlogToIndexFieldMapping(
      dataSourceFieldName:
          (json['DataSourceFieldName'] as String?)?.toConfluenceBlogFieldName(),
      dateFieldFormat: json['DateFieldFormat'] as String?,
      indexFieldName: json['IndexFieldName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceFieldName = this.dataSourceFieldName;
    final dateFieldFormat = this.dateFieldFormat;
    final indexFieldName = this.indexFieldName;
    return {
      if (dataSourceFieldName != null)
        'DataSourceFieldName': dataSourceFieldName.toValue(),
      if (dateFieldFormat != null) 'DateFieldFormat': dateFieldFormat,
      if (indexFieldName != null) 'IndexFieldName': indexFieldName,
    };
  }
}

/// Provides configuration information for data sources that connect to
/// Confluence.
class ConfluenceConfiguration {
  /// The Amazon Resource Name (ARN) of an AWS Secrets Manager secret that
  /// contains the key/value pairs required to connect to your Confluence server.
  /// The secret must contain a JSON structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// username - The user name or email address of a user with administrative
  /// privileges for the Confluence server.
  /// </li>
  /// <li>
  /// password - The password associated with the user logging in to the
  /// Confluence server.
  /// </li>
  /// </ul>
  final String secretArn;

  /// The URL of your Confluence instance. Use the full URL of the server. For
  /// example, <code>https://server.example.com:port/</code>. You can also use an
  /// IP address, for example, <code>https://192.168.1.113/</code>.
  final String serverUrl;

  /// Specifies the version of the Confluence installation that you are connecting
  /// to.
  final ConfluenceVersion version;

  /// Specifies configuration information for indexing attachments to Confluence
  /// blogs and pages.
  final ConfluenceAttachmentConfiguration? attachmentConfiguration;

  /// Specifies configuration information for indexing Confluence blogs.
  final ConfluenceBlogConfiguration? blogConfiguration;

  /// A list of regular expression patterns that apply to a URL on the Confluence
  /// server. An exclusion pattern can apply to a blog post, a page, a space, or
  /// an attachment. Items that match the pattern are excluded from the index.
  /// Items that don't match the pattern are included in the index. If a item
  /// matches both an exclusion pattern and an inclusion pattern, the item isn't
  /// included in the index.
  final List<String>? exclusionPatterns;

  /// A list of regular expression patterns that apply to a URL on the Confluence
  /// server. An inclusion pattern can apply to a blog post, a page, a space, or
  /// an attachment. Items that match the patterns are included in the index.
  /// Items that don't match the pattern are excluded from the index. If an item
  /// matches both an inclusion pattern and an exclusion pattern, the item isn't
  /// included in the index.
  final List<String>? inclusionPatterns;

  /// Specifies configuration information for indexing Confluence pages.
  final ConfluencePageConfiguration? pageConfiguration;

  /// Specifies configuration information for indexing Confluence spaces.
  final ConfluenceSpaceConfiguration? spaceConfiguration;

  /// Specifies the information for connecting to an Amazon VPC.
  final DataSourceVpcConfiguration? vpcConfiguration;

  ConfluenceConfiguration({
    required this.secretArn,
    required this.serverUrl,
    required this.version,
    this.attachmentConfiguration,
    this.blogConfiguration,
    this.exclusionPatterns,
    this.inclusionPatterns,
    this.pageConfiguration,
    this.spaceConfiguration,
    this.vpcConfiguration,
  });

  factory ConfluenceConfiguration.fromJson(Map<String, dynamic> json) {
    return ConfluenceConfiguration(
      secretArn: json['SecretArn'] as String,
      serverUrl: json['ServerUrl'] as String,
      version: (json['Version'] as String).toConfluenceVersion(),
      attachmentConfiguration: json['AttachmentConfiguration'] != null
          ? ConfluenceAttachmentConfiguration.fromJson(
              json['AttachmentConfiguration'] as Map<String, dynamic>)
          : null,
      blogConfiguration: json['BlogConfiguration'] != null
          ? ConfluenceBlogConfiguration.fromJson(
              json['BlogConfiguration'] as Map<String, dynamic>)
          : null,
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      pageConfiguration: json['PageConfiguration'] != null
          ? ConfluencePageConfiguration.fromJson(
              json['PageConfiguration'] as Map<String, dynamic>)
          : null,
      spaceConfiguration: json['SpaceConfiguration'] != null
          ? ConfluenceSpaceConfiguration.fromJson(
              json['SpaceConfiguration'] as Map<String, dynamic>)
          : null,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final serverUrl = this.serverUrl;
    final version = this.version;
    final attachmentConfiguration = this.attachmentConfiguration;
    final blogConfiguration = this.blogConfiguration;
    final exclusionPatterns = this.exclusionPatterns;
    final inclusionPatterns = this.inclusionPatterns;
    final pageConfiguration = this.pageConfiguration;
    final spaceConfiguration = this.spaceConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'SecretArn': secretArn,
      'ServerUrl': serverUrl,
      'Version': version.toValue(),
      if (attachmentConfiguration != null)
        'AttachmentConfiguration': attachmentConfiguration,
      if (blogConfiguration != null) 'BlogConfiguration': blogConfiguration,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (pageConfiguration != null) 'PageConfiguration': pageConfiguration,
      if (spaceConfiguration != null) 'SpaceConfiguration': spaceConfiguration,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// Specifies the page settings for the Confluence data source.
class ConfluencePageConfiguration {
  /// Defines how page metadata fields should be mapped to index fields. Before
  /// you can map a field, you must first create an index field with a matching
  /// type using the console or the <code>UpdateIndex</code> operation.
  ///
  /// If you specify the <code>PageFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  final List<ConfluencePageToIndexFieldMapping>? pageFieldMappings;

  ConfluencePageConfiguration({
    this.pageFieldMappings,
  });

  factory ConfluencePageConfiguration.fromJson(Map<String, dynamic> json) {
    return ConfluencePageConfiguration(
      pageFieldMappings: (json['PageFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) => ConfluencePageToIndexFieldMapping.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final pageFieldMappings = this.pageFieldMappings;
    return {
      if (pageFieldMappings != null) 'PageFieldMappings': pageFieldMappings,
    };
  }
}

enum ConfluencePageFieldName {
  author,
  contentStatus,
  createdDate,
  displayUrl,
  itemType,
  labels,
  modifiedDate,
  parentId,
  spaceKey,
  spaceName,
  url,
  version,
}

extension on ConfluencePageFieldName {
  String toValue() {
    switch (this) {
      case ConfluencePageFieldName.author:
        return 'AUTHOR';
      case ConfluencePageFieldName.contentStatus:
        return 'CONTENT_STATUS';
      case ConfluencePageFieldName.createdDate:
        return 'CREATED_DATE';
      case ConfluencePageFieldName.displayUrl:
        return 'DISPLAY_URL';
      case ConfluencePageFieldName.itemType:
        return 'ITEM_TYPE';
      case ConfluencePageFieldName.labels:
        return 'LABELS';
      case ConfluencePageFieldName.modifiedDate:
        return 'MODIFIED_DATE';
      case ConfluencePageFieldName.parentId:
        return 'PARENT_ID';
      case ConfluencePageFieldName.spaceKey:
        return 'SPACE_KEY';
      case ConfluencePageFieldName.spaceName:
        return 'SPACE_NAME';
      case ConfluencePageFieldName.url:
        return 'URL';
      case ConfluencePageFieldName.version:
        return 'VERSION';
    }
  }
}

extension on String {
  ConfluencePageFieldName toConfluencePageFieldName() {
    switch (this) {
      case 'AUTHOR':
        return ConfluencePageFieldName.author;
      case 'CONTENT_STATUS':
        return ConfluencePageFieldName.contentStatus;
      case 'CREATED_DATE':
        return ConfluencePageFieldName.createdDate;
      case 'DISPLAY_URL':
        return ConfluencePageFieldName.displayUrl;
      case 'ITEM_TYPE':
        return ConfluencePageFieldName.itemType;
      case 'LABELS':
        return ConfluencePageFieldName.labels;
      case 'MODIFIED_DATE':
        return ConfluencePageFieldName.modifiedDate;
      case 'PARENT_ID':
        return ConfluencePageFieldName.parentId;
      case 'SPACE_KEY':
        return ConfluencePageFieldName.spaceKey;
      case 'SPACE_NAME':
        return ConfluencePageFieldName.spaceName;
      case 'URL':
        return ConfluencePageFieldName.url;
      case 'VERSION':
        return ConfluencePageFieldName.version;
    }
    throw Exception('$this is not known in enum ConfluencePageFieldName');
  }
}

/// Defines the mapping between a field in the Confluence data source to a
/// Amazon Kendra index field.
///
/// You must first create the index field using the <code>UpdateIndex</code>
/// operation.
class ConfluencePageToIndexFieldMapping {
  /// The name of the field in the data source.
  final ConfluencePageFieldName? dataSourceFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
  final String? dateFieldFormat;

  /// The name of the index field to map to the Confluence data source field. The
  /// index field type must match the Confluence field type.
  final String? indexFieldName;

  ConfluencePageToIndexFieldMapping({
    this.dataSourceFieldName,
    this.dateFieldFormat,
    this.indexFieldName,
  });

  factory ConfluencePageToIndexFieldMapping.fromJson(
      Map<String, dynamic> json) {
    return ConfluencePageToIndexFieldMapping(
      dataSourceFieldName:
          (json['DataSourceFieldName'] as String?)?.toConfluencePageFieldName(),
      dateFieldFormat: json['DateFieldFormat'] as String?,
      indexFieldName: json['IndexFieldName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceFieldName = this.dataSourceFieldName;
    final dateFieldFormat = this.dateFieldFormat;
    final indexFieldName = this.indexFieldName;
    return {
      if (dataSourceFieldName != null)
        'DataSourceFieldName': dataSourceFieldName.toValue(),
      if (dateFieldFormat != null) 'DateFieldFormat': dateFieldFormat,
      if (indexFieldName != null) 'IndexFieldName': indexFieldName,
    };
  }
}

/// Specifies the configuration for indexing Confluence spaces.
class ConfluenceSpaceConfiguration {
  /// Specifies whether Amazon Kendra should index archived spaces.
  final bool? crawlArchivedSpaces;

  /// Specifies whether Amazon Kendra should index personal spaces. Users can add
  /// restrictions to items in personal spaces. If personal spaces are indexed,
  /// queries without user context information may return restricted items from a
  /// personal space in their results. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html">Filtering
  /// on user context</a>.
  final bool? crawlPersonalSpaces;

  /// A list of space keys of Confluence spaces. If you include a key, the blogs,
  /// documents, and attachments in the space are not indexed. If a space is in
  /// both the <code>ExcludeSpaces</code> and the <code>IncludeSpaces</code> list,
  /// the space is excluded.
  final List<String>? excludeSpaces;

  /// A list of space keys for Confluence spaces. If you include a key, the blogs,
  /// documents, and attachments in the space are indexed. Spaces that aren't in
  /// the list aren't indexed. A space in the list must exist. Otherwise, Amazon
  /// Kendra logs an error when the data source is synchronized. If a space is in
  /// both the <code>IncludeSpaces</code> and the <code>ExcludeSpaces</code> list,
  /// the space is excluded.
  final List<String>? includeSpaces;

  /// Defines how space metadata fields should be mapped to index fields. Before
  /// you can map a field, you must first create an index field with a matching
  /// type using the console or the <code>UpdateIndex</code> operation.
  ///
  /// If you specify the <code>SpaceFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  final List<ConfluenceSpaceToIndexFieldMapping>? spaceFieldMappings;

  ConfluenceSpaceConfiguration({
    this.crawlArchivedSpaces,
    this.crawlPersonalSpaces,
    this.excludeSpaces,
    this.includeSpaces,
    this.spaceFieldMappings,
  });

  factory ConfluenceSpaceConfiguration.fromJson(Map<String, dynamic> json) {
    return ConfluenceSpaceConfiguration(
      crawlArchivedSpaces: json['CrawlArchivedSpaces'] as bool?,
      crawlPersonalSpaces: json['CrawlPersonalSpaces'] as bool?,
      excludeSpaces: (json['ExcludeSpaces'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      includeSpaces: (json['IncludeSpaces'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      spaceFieldMappings: (json['SpaceFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) => ConfluenceSpaceToIndexFieldMapping.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final crawlArchivedSpaces = this.crawlArchivedSpaces;
    final crawlPersonalSpaces = this.crawlPersonalSpaces;
    final excludeSpaces = this.excludeSpaces;
    final includeSpaces = this.includeSpaces;
    final spaceFieldMappings = this.spaceFieldMappings;
    return {
      if (crawlArchivedSpaces != null)
        'CrawlArchivedSpaces': crawlArchivedSpaces,
      if (crawlPersonalSpaces != null)
        'CrawlPersonalSpaces': crawlPersonalSpaces,
      if (excludeSpaces != null) 'ExcludeSpaces': excludeSpaces,
      if (includeSpaces != null) 'IncludeSpaces': includeSpaces,
      if (spaceFieldMappings != null) 'SpaceFieldMappings': spaceFieldMappings,
    };
  }
}

enum ConfluenceSpaceFieldName {
  displayUrl,
  itemType,
  spaceKey,
  url,
}

extension on ConfluenceSpaceFieldName {
  String toValue() {
    switch (this) {
      case ConfluenceSpaceFieldName.displayUrl:
        return 'DISPLAY_URL';
      case ConfluenceSpaceFieldName.itemType:
        return 'ITEM_TYPE';
      case ConfluenceSpaceFieldName.spaceKey:
        return 'SPACE_KEY';
      case ConfluenceSpaceFieldName.url:
        return 'URL';
    }
  }
}

extension on String {
  ConfluenceSpaceFieldName toConfluenceSpaceFieldName() {
    switch (this) {
      case 'DISPLAY_URL':
        return ConfluenceSpaceFieldName.displayUrl;
      case 'ITEM_TYPE':
        return ConfluenceSpaceFieldName.itemType;
      case 'SPACE_KEY':
        return ConfluenceSpaceFieldName.spaceKey;
      case 'URL':
        return ConfluenceSpaceFieldName.url;
    }
    throw Exception('$this is not known in enum ConfluenceSpaceFieldName');
  }
}

/// Defines the mapping between a field in the Confluence data source to a
/// Amazon Kendra index field.
///
/// You must first create the index field using the <code>UpdateIndex</code>
/// operation.
class ConfluenceSpaceToIndexFieldMapping {
  /// The name of the field in the data source.
  final ConfluenceSpaceFieldName? dataSourceFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
  final String? dateFieldFormat;

  /// The name of the index field to map to the Confluence data source field. The
  /// index field type must match the Confluence field type.
  final String? indexFieldName;

  ConfluenceSpaceToIndexFieldMapping({
    this.dataSourceFieldName,
    this.dateFieldFormat,
    this.indexFieldName,
  });

  factory ConfluenceSpaceToIndexFieldMapping.fromJson(
      Map<String, dynamic> json) {
    return ConfluenceSpaceToIndexFieldMapping(
      dataSourceFieldName: (json['DataSourceFieldName'] as String?)
          ?.toConfluenceSpaceFieldName(),
      dateFieldFormat: json['DateFieldFormat'] as String?,
      indexFieldName: json['IndexFieldName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceFieldName = this.dataSourceFieldName;
    final dateFieldFormat = this.dateFieldFormat;
    final indexFieldName = this.indexFieldName;
    return {
      if (dataSourceFieldName != null)
        'DataSourceFieldName': dataSourceFieldName.toValue(),
      if (dateFieldFormat != null) 'DateFieldFormat': dateFieldFormat,
      if (indexFieldName != null) 'IndexFieldName': indexFieldName,
    };
  }
}

enum ConfluenceVersion {
  cloud,
  server,
}

extension on ConfluenceVersion {
  String toValue() {
    switch (this) {
      case ConfluenceVersion.cloud:
        return 'CLOUD';
      case ConfluenceVersion.server:
        return 'SERVER';
    }
  }
}

extension on String {
  ConfluenceVersion toConfluenceVersion() {
    switch (this) {
      case 'CLOUD':
        return ConfluenceVersion.cloud;
      case 'SERVER':
        return ConfluenceVersion.server;
    }
    throw Exception('$this is not known in enum ConfluenceVersion');
  }
}

/// Provides the information necessary to connect to a database.
class ConnectionConfiguration {
  /// The name of the host for the database. Can be either a string
  /// (host.subdomain.domain.tld) or an IPv4 or IPv6 address.
  final String databaseHost;

  /// The name of the database containing the document data.
  final String databaseName;

  /// The port that the database uses for connections.
  final int databasePort;

  /// The Amazon Resource Name (ARN) of credentials stored in AWS Secrets Manager.
  /// The credentials should be a user/password pair. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html">Using
  /// a Database Data Source</a>. For more information about AWS Secrets Manager,
  /// see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">
  /// What Is AWS Secrets Manager </a> in the <i>AWS Secrets Manager</i> user
  /// guide.
  final String secretArn;

  /// The name of the table that contains the document data.
  final String tableName;

  ConnectionConfiguration({
    required this.databaseHost,
    required this.databaseName,
    required this.databasePort,
    required this.secretArn,
    required this.tableName,
  });

  factory ConnectionConfiguration.fromJson(Map<String, dynamic> json) {
    return ConnectionConfiguration(
      databaseHost: json['DatabaseHost'] as String,
      databaseName: json['DatabaseName'] as String,
      databasePort: json['DatabasePort'] as int,
      secretArn: json['SecretArn'] as String,
      tableName: json['TableName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final databaseHost = this.databaseHost;
    final databaseName = this.databaseName;
    final databasePort = this.databasePort;
    final secretArn = this.secretArn;
    final tableName = this.tableName;
    return {
      'DatabaseHost': databaseHost,
      'DatabaseName': databaseName,
      'DatabasePort': databasePort,
      'SecretArn': secretArn,
      'TableName': tableName,
    };
  }
}

enum ContentType {
  pdf,
  html,
  msWord,
  plainText,
  ppt,
}

extension on ContentType {
  String toValue() {
    switch (this) {
      case ContentType.pdf:
        return 'PDF';
      case ContentType.html:
        return 'HTML';
      case ContentType.msWord:
        return 'MS_WORD';
      case ContentType.plainText:
        return 'PLAIN_TEXT';
      case ContentType.ppt:
        return 'PPT';
    }
  }
}

extension on String {
  ContentType toContentType() {
    switch (this) {
      case 'PDF':
        return ContentType.pdf;
      case 'HTML':
        return ContentType.html;
      case 'MS_WORD':
        return ContentType.msWord;
      case 'PLAIN_TEXT':
        return ContentType.plainText;
      case 'PPT':
        return ContentType.ppt;
    }
    throw Exception('$this is not known in enum ContentType');
  }
}

class CreateDataSourceResponse {
  /// A unique identifier for the data source.
  final String id;

  CreateDataSourceResponse({
    required this.id,
  });

  factory CreateDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataSourceResponse(
      id: json['Id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      'Id': id,
    };
  }
}

class CreateFaqResponse {
  /// The unique identifier of the FAQ.
  final String? id;

  CreateFaqResponse({
    this.id,
  });

  factory CreateFaqResponse.fromJson(Map<String, dynamic> json) {
    return CreateFaqResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

class CreateIndexResponse {
  /// The unique identifier of the index. Use this identifier when you query an
  /// index, set up a data source, or index a document.
  final String? id;

  CreateIndexResponse({
    this.id,
  });

  factory CreateIndexResponse.fromJson(Map<String, dynamic> json) {
    return CreateIndexResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

class CreateQuerySuggestionsBlockListResponse {
  /// The unique identifier of the created block list.
  final String? id;

  CreateQuerySuggestionsBlockListResponse({
    this.id,
  });

  factory CreateQuerySuggestionsBlockListResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateQuerySuggestionsBlockListResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

class CreateThesaurusResponse {
  /// The unique identifier of the thesaurus.
  final String? id;

  CreateThesaurusResponse({
    this.id,
  });

  factory CreateThesaurusResponse.fromJson(Map<String, dynamic> json) {
    return CreateThesaurusResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// Configuration information for a Amazon Kendra data source.
class DataSourceConfiguration {
  /// Provides configuration information for connecting to a Confluence data
  /// source.
  final ConfluenceConfiguration? confluenceConfiguration;

  /// Provides information necessary to create a data source connector for a
  /// database.
  final DatabaseConfiguration? databaseConfiguration;

  /// Provides configuration for data sources that connect to Google Drive.
  final GoogleDriveConfiguration? googleDriveConfiguration;

  /// Provides configuration for data sources that connect to Microsoft OneDrive.
  final OneDriveConfiguration? oneDriveConfiguration;

  /// Provides information to create a data source connector for a document
  /// repository in an Amazon S3 bucket.
  final S3DataSourceConfiguration? s3Configuration;

  /// Provides configuration information for data sources that connect to a
  /// Salesforce site.
  final SalesforceConfiguration? salesforceConfiguration;

  /// Provides configuration for data sources that connect to ServiceNow
  /// instances.
  final ServiceNowConfiguration? serviceNowConfiguration;

  /// Provides information necessary to create a data source connector for a
  /// Microsoft SharePoint site.
  final SharePointConfiguration? sharePointConfiguration;
  final WebCrawlerConfiguration? webCrawlerConfiguration;

  DataSourceConfiguration({
    this.confluenceConfiguration,
    this.databaseConfiguration,
    this.googleDriveConfiguration,
    this.oneDriveConfiguration,
    this.s3Configuration,
    this.salesforceConfiguration,
    this.serviceNowConfiguration,
    this.sharePointConfiguration,
    this.webCrawlerConfiguration,
  });

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceConfiguration(
      confluenceConfiguration: json['ConfluenceConfiguration'] != null
          ? ConfluenceConfiguration.fromJson(
              json['ConfluenceConfiguration'] as Map<String, dynamic>)
          : null,
      databaseConfiguration: json['DatabaseConfiguration'] != null
          ? DatabaseConfiguration.fromJson(
              json['DatabaseConfiguration'] as Map<String, dynamic>)
          : null,
      googleDriveConfiguration: json['GoogleDriveConfiguration'] != null
          ? GoogleDriveConfiguration.fromJson(
              json['GoogleDriveConfiguration'] as Map<String, dynamic>)
          : null,
      oneDriveConfiguration: json['OneDriveConfiguration'] != null
          ? OneDriveConfiguration.fromJson(
              json['OneDriveConfiguration'] as Map<String, dynamic>)
          : null,
      s3Configuration: json['S3Configuration'] != null
          ? S3DataSourceConfiguration.fromJson(
              json['S3Configuration'] as Map<String, dynamic>)
          : null,
      salesforceConfiguration: json['SalesforceConfiguration'] != null
          ? SalesforceConfiguration.fromJson(
              json['SalesforceConfiguration'] as Map<String, dynamic>)
          : null,
      serviceNowConfiguration: json['ServiceNowConfiguration'] != null
          ? ServiceNowConfiguration.fromJson(
              json['ServiceNowConfiguration'] as Map<String, dynamic>)
          : null,
      sharePointConfiguration: json['SharePointConfiguration'] != null
          ? SharePointConfiguration.fromJson(
              json['SharePointConfiguration'] as Map<String, dynamic>)
          : null,
      webCrawlerConfiguration: json['WebCrawlerConfiguration'] != null
          ? WebCrawlerConfiguration.fromJson(
              json['WebCrawlerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final confluenceConfiguration = this.confluenceConfiguration;
    final databaseConfiguration = this.databaseConfiguration;
    final googleDriveConfiguration = this.googleDriveConfiguration;
    final oneDriveConfiguration = this.oneDriveConfiguration;
    final s3Configuration = this.s3Configuration;
    final salesforceConfiguration = this.salesforceConfiguration;
    final serviceNowConfiguration = this.serviceNowConfiguration;
    final sharePointConfiguration = this.sharePointConfiguration;
    final webCrawlerConfiguration = this.webCrawlerConfiguration;
    return {
      if (confluenceConfiguration != null)
        'ConfluenceConfiguration': confluenceConfiguration,
      if (databaseConfiguration != null)
        'DatabaseConfiguration': databaseConfiguration,
      if (googleDriveConfiguration != null)
        'GoogleDriveConfiguration': googleDriveConfiguration,
      if (oneDriveConfiguration != null)
        'OneDriveConfiguration': oneDriveConfiguration,
      if (s3Configuration != null) 'S3Configuration': s3Configuration,
      if (salesforceConfiguration != null)
        'SalesforceConfiguration': salesforceConfiguration,
      if (serviceNowConfiguration != null)
        'ServiceNowConfiguration': serviceNowConfiguration,
      if (sharePointConfiguration != null)
        'SharePointConfiguration': sharePointConfiguration,
      if (webCrawlerConfiguration != null)
        'WebCrawlerConfiguration': webCrawlerConfiguration,
    };
  }
}

enum DataSourceStatus {
  creating,
  deleting,
  failed,
  updating,
  active,
}

extension on DataSourceStatus {
  String toValue() {
    switch (this) {
      case DataSourceStatus.creating:
        return 'CREATING';
      case DataSourceStatus.deleting:
        return 'DELETING';
      case DataSourceStatus.failed:
        return 'FAILED';
      case DataSourceStatus.updating:
        return 'UPDATING';
      case DataSourceStatus.active:
        return 'ACTIVE';
    }
  }
}

extension on String {
  DataSourceStatus toDataSourceStatus() {
    switch (this) {
      case 'CREATING':
        return DataSourceStatus.creating;
      case 'DELETING':
        return DataSourceStatus.deleting;
      case 'FAILED':
        return DataSourceStatus.failed;
      case 'UPDATING':
        return DataSourceStatus.updating;
      case 'ACTIVE':
        return DataSourceStatus.active;
    }
    throw Exception('$this is not known in enum DataSourceStatus');
  }
}

/// Summary information for a Amazon Kendra data source. Returned in a call to
/// the <code>DescribeDataSource</code> operation.
class DataSourceSummary {
  /// The UNIX datetime that the data source was created.
  final DateTime? createdAt;

  /// The unique identifier for the data source.
  final String? id;

  /// The name of the data source.
  final String? name;

  /// The status of the data source. When the status is <code>ACTIVE</code> the
  /// data source is ready to use.
  final DataSourceStatus? status;

  /// The type of the data source.
  final DataSourceType? type;

  /// The UNIX datetime that the data source was lasted updated.
  final DateTime? updatedAt;

  DataSourceSummary({
    this.createdAt,
    this.id,
    this.name,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory DataSourceSummary.fromJson(Map<String, dynamic> json) {
    return DataSourceSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toDataSourceStatus(),
      type: (json['Type'] as String?)?.toDataSourceType(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Provides information about a synchronization job.
class DataSourceSyncJob {
  /// If the reason that the synchronization failed is due to an error with the
  /// underlying data source, this field contains a code that identifies the
  /// error.
  final String? dataSourceErrorCode;

  /// The UNIX datetime that the synchronization job was completed.
  final DateTime? endTime;

  /// If the <code>Status</code> field is set to <code>FAILED</code>, the
  /// <code>ErrorCode</code> field contains a the reason that the synchronization
  /// failed.
  final ErrorCode? errorCode;

  /// If the <code>Status</code> field is set to <code>ERROR</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the synchronization to fail.
  final String? errorMessage;

  /// A unique identifier for the synchronization job.
  final String? executionId;

  /// Maps a batch delete document request to a specific data source sync job.
  /// This is optional and should only be supplied when documents are deleted by a
  /// data source connector.
  final DataSourceSyncJobMetrics? metrics;

  /// The UNIX datetime that the synchronization job was started.
  final DateTime? startTime;

  /// The execution status of the synchronization job. When the
  /// <code>Status</code> field is set to <code>SUCCEEDED</code>, the
  /// synchronization job is done. If the status code is set to
  /// <code>FAILED</code>, the <code>ErrorCode</code> and
  /// <code>ErrorMessage</code> fields give you the reason for the failure.
  final DataSourceSyncJobStatus? status;

  DataSourceSyncJob({
    this.dataSourceErrorCode,
    this.endTime,
    this.errorCode,
    this.errorMessage,
    this.executionId,
    this.metrics,
    this.startTime,
    this.status,
  });

  factory DataSourceSyncJob.fromJson(Map<String, dynamic> json) {
    return DataSourceSyncJob(
      dataSourceErrorCode: json['DataSourceErrorCode'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      executionId: json['ExecutionId'] as String?,
      metrics: json['Metrics'] != null
          ? DataSourceSyncJobMetrics.fromJson(
              json['Metrics'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toDataSourceSyncJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceErrorCode = this.dataSourceErrorCode;
    final endTime = this.endTime;
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final executionId = this.executionId;
    final metrics = this.metrics;
    final startTime = this.startTime;
    final status = this.status;
    return {
      if (dataSourceErrorCode != null)
        'DataSourceErrorCode': dataSourceErrorCode,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (executionId != null) 'ExecutionId': executionId,
      if (metrics != null) 'Metrics': metrics,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Maps a particular data source sync job to a particular data source.
class DataSourceSyncJobMetricTarget {
  /// The ID of the data source that is running the sync job.
  final String dataSourceId;

  /// The ID of the sync job that is running on the data source.
  ///
  /// If the ID of a sync job is not provided and there is a sync job running,
  /// then the ID of this sync job is used and metrics are generated for this sync
  /// job.
  ///
  /// If the ID of a sync job is not provided and there is no sync job running,
  /// then no metrics are generated and documents are indexed/deleted at the index
  /// level without sync job metrics included.
  final String? dataSourceSyncJobId;

  DataSourceSyncJobMetricTarget({
    required this.dataSourceId,
    this.dataSourceSyncJobId,
  });

  factory DataSourceSyncJobMetricTarget.fromJson(Map<String, dynamic> json) {
    return DataSourceSyncJobMetricTarget(
      dataSourceId: json['DataSourceId'] as String,
      dataSourceSyncJobId: json['DataSourceSyncJobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final dataSourceSyncJobId = this.dataSourceSyncJobId;
    return {
      'DataSourceId': dataSourceId,
      if (dataSourceSyncJobId != null)
        'DataSourceSyncJobId': dataSourceSyncJobId,
    };
  }
}

/// Maps a batch delete document request to a specific data source sync job.
/// This is optional and should only be supplied when documents are deleted by a
/// data source connector.
class DataSourceSyncJobMetrics {
  /// The number of documents added from the data source up to now in the data
  /// source sync.
  final String? documentsAdded;

  /// The number of documents deleted from the data source up to now in the data
  /// source sync run.
  final String? documentsDeleted;

  /// The number of documents that failed to sync from the data source up to now
  /// in the data source sync run.
  final String? documentsFailed;

  /// The number of documents modified in the data source up to now in the data
  /// source sync run.
  final String? documentsModified;

  /// The current number of documents crawled by the current sync job in the data
  /// source.
  final String? documentsScanned;

  DataSourceSyncJobMetrics({
    this.documentsAdded,
    this.documentsDeleted,
    this.documentsFailed,
    this.documentsModified,
    this.documentsScanned,
  });

  factory DataSourceSyncJobMetrics.fromJson(Map<String, dynamic> json) {
    return DataSourceSyncJobMetrics(
      documentsAdded: json['DocumentsAdded'] as String?,
      documentsDeleted: json['DocumentsDeleted'] as String?,
      documentsFailed: json['DocumentsFailed'] as String?,
      documentsModified: json['DocumentsModified'] as String?,
      documentsScanned: json['DocumentsScanned'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentsAdded = this.documentsAdded;
    final documentsDeleted = this.documentsDeleted;
    final documentsFailed = this.documentsFailed;
    final documentsModified = this.documentsModified;
    final documentsScanned = this.documentsScanned;
    return {
      if (documentsAdded != null) 'DocumentsAdded': documentsAdded,
      if (documentsDeleted != null) 'DocumentsDeleted': documentsDeleted,
      if (documentsFailed != null) 'DocumentsFailed': documentsFailed,
      if (documentsModified != null) 'DocumentsModified': documentsModified,
      if (documentsScanned != null) 'DocumentsScanned': documentsScanned,
    };
  }
}

enum DataSourceSyncJobStatus {
  failed,
  succeeded,
  syncing,
  incomplete,
  stopping,
  aborted,
  syncingIndexing,
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
      case DataSourceSyncJobStatus.syncingIndexing:
        return 'SYNCING_INDEXING';
    }
  }
}

extension on String {
  DataSourceSyncJobStatus toDataSourceSyncJobStatus() {
    switch (this) {
      case 'FAILED':
        return DataSourceSyncJobStatus.failed;
      case 'SUCCEEDED':
        return DataSourceSyncJobStatus.succeeded;
      case 'SYNCING':
        return DataSourceSyncJobStatus.syncing;
      case 'INCOMPLETE':
        return DataSourceSyncJobStatus.incomplete;
      case 'STOPPING':
        return DataSourceSyncJobStatus.stopping;
      case 'ABORTED':
        return DataSourceSyncJobStatus.aborted;
      case 'SYNCING_INDEXING':
        return DataSourceSyncJobStatus.syncingIndexing;
    }
    throw Exception('$this is not known in enum DataSourceSyncJobStatus');
  }
}

/// Maps a column or attribute in the data source to an index field. You must
/// first create the fields in the index using the <code>UpdateIndex</code>
/// operation.
class DataSourceToIndexFieldMapping {
  /// The name of the column or attribute in the data source.
  final String dataSourceFieldName;

  /// The name of the field in the index.
  final String indexFieldName;

  /// The type of data stored in the column or attribute.
  final String? dateFieldFormat;

  DataSourceToIndexFieldMapping({
    required this.dataSourceFieldName,
    required this.indexFieldName,
    this.dateFieldFormat,
  });

  factory DataSourceToIndexFieldMapping.fromJson(Map<String, dynamic> json) {
    return DataSourceToIndexFieldMapping(
      dataSourceFieldName: json['DataSourceFieldName'] as String,
      indexFieldName: json['IndexFieldName'] as String,
      dateFieldFormat: json['DateFieldFormat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceFieldName = this.dataSourceFieldName;
    final indexFieldName = this.indexFieldName;
    final dateFieldFormat = this.dateFieldFormat;
    return {
      'DataSourceFieldName': dataSourceFieldName,
      'IndexFieldName': indexFieldName,
      if (dateFieldFormat != null) 'DateFieldFormat': dateFieldFormat,
    };
  }
}

enum DataSourceType {
  s3,
  sharepoint,
  database,
  salesforce,
  onedrive,
  servicenow,
  custom,
  confluence,
  googledrive,
  webcrawler,
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
      case DataSourceType.salesforce:
        return 'SALESFORCE';
      case DataSourceType.onedrive:
        return 'ONEDRIVE';
      case DataSourceType.servicenow:
        return 'SERVICENOW';
      case DataSourceType.custom:
        return 'CUSTOM';
      case DataSourceType.confluence:
        return 'CONFLUENCE';
      case DataSourceType.googledrive:
        return 'GOOGLEDRIVE';
      case DataSourceType.webcrawler:
        return 'WEBCRAWLER';
    }
  }
}

extension on String {
  DataSourceType toDataSourceType() {
    switch (this) {
      case 'S3':
        return DataSourceType.s3;
      case 'SHAREPOINT':
        return DataSourceType.sharepoint;
      case 'DATABASE':
        return DataSourceType.database;
      case 'SALESFORCE':
        return DataSourceType.salesforce;
      case 'ONEDRIVE':
        return DataSourceType.onedrive;
      case 'SERVICENOW':
        return DataSourceType.servicenow;
      case 'CUSTOM':
        return DataSourceType.custom;
      case 'CONFLUENCE':
        return DataSourceType.confluence;
      case 'GOOGLEDRIVE':
        return DataSourceType.googledrive;
      case 'WEBCRAWLER':
        return DataSourceType.webcrawler;
    }
    throw Exception('$this is not known in enum DataSourceType');
  }
}

/// Provides information for connecting to an Amazon VPC.
class DataSourceVpcConfiguration {
  /// A list of identifiers of security groups within your Amazon VPC. The
  /// security groups should enable Amazon Kendra to connect to the data source.
  final List<String> securityGroupIds;

  /// A list of identifiers for subnets within your Amazon VPC. The subnets should
  /// be able to connect to each other in the VPC, and they should have outgoing
  /// access to the Internet through a NAT device.
  final List<String> subnetIds;

  DataSourceVpcConfiguration({
    required this.securityGroupIds,
    required this.subnetIds,
  });

  factory DataSourceVpcConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceVpcConfiguration(
      securityGroupIds: (json['SecurityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['SubnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      'SecurityGroupIds': securityGroupIds,
      'SubnetIds': subnetIds,
    };
  }
}

/// Provides the information necessary to connect a database to an index.
class DatabaseConfiguration {
  /// Information about where the index should get the document information from
  /// the database.
  final ColumnConfiguration columnConfiguration;

  /// The information necessary to connect to a database.
  final ConnectionConfiguration connectionConfiguration;

  /// The type of database engine that runs the database.
  final DatabaseEngineType databaseEngineType;

  /// Information about the database column that provides information for user
  /// context filtering.
  final AclConfiguration? aclConfiguration;

  /// Provides information about how Amazon Kendra uses quote marks around SQL
  /// identifiers when querying a database data source.
  final SqlConfiguration? sqlConfiguration;
  final DataSourceVpcConfiguration? vpcConfiguration;

  DatabaseConfiguration({
    required this.columnConfiguration,
    required this.connectionConfiguration,
    required this.databaseEngineType,
    this.aclConfiguration,
    this.sqlConfiguration,
    this.vpcConfiguration,
  });

  factory DatabaseConfiguration.fromJson(Map<String, dynamic> json) {
    return DatabaseConfiguration(
      columnConfiguration: ColumnConfiguration.fromJson(
          json['ColumnConfiguration'] as Map<String, dynamic>),
      connectionConfiguration: ConnectionConfiguration.fromJson(
          json['ConnectionConfiguration'] as Map<String, dynamic>),
      databaseEngineType:
          (json['DatabaseEngineType'] as String).toDatabaseEngineType(),
      aclConfiguration: json['AclConfiguration'] != null
          ? AclConfiguration.fromJson(
              json['AclConfiguration'] as Map<String, dynamic>)
          : null,
      sqlConfiguration: json['SqlConfiguration'] != null
          ? SqlConfiguration.fromJson(
              json['SqlConfiguration'] as Map<String, dynamic>)
          : null,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final columnConfiguration = this.columnConfiguration;
    final connectionConfiguration = this.connectionConfiguration;
    final databaseEngineType = this.databaseEngineType;
    final aclConfiguration = this.aclConfiguration;
    final sqlConfiguration = this.sqlConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'ColumnConfiguration': columnConfiguration,
      'ConnectionConfiguration': connectionConfiguration,
      'DatabaseEngineType': databaseEngineType.toValue(),
      if (aclConfiguration != null) 'AclConfiguration': aclConfiguration,
      if (sqlConfiguration != null) 'SqlConfiguration': sqlConfiguration,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

enum DatabaseEngineType {
  rdsAuroraMysql,
  rdsAuroraPostgresql,
  rdsMysql,
  rdsPostgresql,
}

extension on DatabaseEngineType {
  String toValue() {
    switch (this) {
      case DatabaseEngineType.rdsAuroraMysql:
        return 'RDS_AURORA_MYSQL';
      case DatabaseEngineType.rdsAuroraPostgresql:
        return 'RDS_AURORA_POSTGRESQL';
      case DatabaseEngineType.rdsMysql:
        return 'RDS_MYSQL';
      case DatabaseEngineType.rdsPostgresql:
        return 'RDS_POSTGRESQL';
    }
  }
}

extension on String {
  DatabaseEngineType toDatabaseEngineType() {
    switch (this) {
      case 'RDS_AURORA_MYSQL':
        return DatabaseEngineType.rdsAuroraMysql;
      case 'RDS_AURORA_POSTGRESQL':
        return DatabaseEngineType.rdsAuroraPostgresql;
      case 'RDS_MYSQL':
        return DatabaseEngineType.rdsMysql;
      case 'RDS_POSTGRESQL':
        return DatabaseEngineType.rdsPostgresql;
    }
    throw Exception('$this is not known in enum DatabaseEngineType');
  }
}

class DescribeDataSourceResponse {
  /// Information that describes where the data source is located and how the data
  /// source is configured. The specific information in the description depends on
  /// the data source provider.
  final DataSourceConfiguration? configuration;

  /// The Unix timestamp of when the data source was created.
  final DateTime? createdAt;

  /// The description of the data source.
  final String? description;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the data source to fail.
  final String? errorMessage;

  /// The identifier of the data source.
  final String? id;

  /// The identifier of the index that contains the data source.
  final String? indexId;

  /// The name that you gave the data source when it was created.
  final String? name;

  /// The Amazon Resource Name (ARN) of the role that enables the data source to
  /// access its resources.
  final String? roleArn;

  /// The schedule that Amazon Kendra will update the data source.
  final String? schedule;

  /// The current status of the data source. When the status is
  /// <code>ACTIVE</code> the data source is ready to use. When the status is
  /// <code>FAILED</code>, the <code>ErrorMessage</code> field contains the reason
  /// that the data source failed.
  final DataSourceStatus? status;

  /// The type of the data source.
  final DataSourceType? type;

  /// The Unix timestamp of when the data source was last updated.
  final DateTime? updatedAt;

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

  factory DescribeDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDataSourceResponse(
      configuration: json['Configuration'] != null
          ? DataSourceConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
      indexId: json['IndexId'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      schedule: json['Schedule'] as String?,
      status: (json['Status'] as String?)?.toDataSourceStatus(),
      type: (json['Type'] as String?)?.toDataSourceType(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final indexId = this.indexId;
    final name = this.name;
    final roleArn = this.roleArn;
    final schedule = this.schedule;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
      if (indexId != null) 'IndexId': indexId,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (schedule != null) 'Schedule': schedule,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DescribeFaqResponse {
  /// The date and time that the FAQ was created.
  final DateTime? createdAt;

  /// The description of the FAQ that you provided when it was created.
  final String? description;

  /// If the <code>Status</code> field is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains the reason why the FAQ failed.
  final String? errorMessage;

  /// The file format used by the input files for the FAQ.
  final FaqFileFormat? fileFormat;

  /// The identifier of the FAQ.
  final String? id;

  /// The identifier of the index that contains the FAQ.
  final String? indexId;

  /// The name that you gave the FAQ when it was created.
  final String? name;

  /// The Amazon Resource Name (ARN) of the role that provides access to the S3
  /// bucket containing the input files for the FAQ.
  final String? roleArn;
  final S3Path? s3Path;

  /// The status of the FAQ. It is ready to use when the status is
  /// <code>ACTIVE</code>.
  final FaqStatus? status;

  /// The date and time that the FAQ was last updated.
  final DateTime? updatedAt;

  DescribeFaqResponse({
    this.createdAt,
    this.description,
    this.errorMessage,
    this.fileFormat,
    this.id,
    this.indexId,
    this.name,
    this.roleArn,
    this.s3Path,
    this.status,
    this.updatedAt,
  });

  factory DescribeFaqResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFaqResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      fileFormat: (json['FileFormat'] as String?)?.toFaqFileFormat(),
      id: json['Id'] as String?,
      indexId: json['IndexId'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      s3Path: json['S3Path'] != null
          ? S3Path.fromJson(json['S3Path'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toFaqStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final fileFormat = this.fileFormat;
    final id = this.id;
    final indexId = this.indexId;
    final name = this.name;
    final roleArn = this.roleArn;
    final s3Path = this.s3Path;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (fileFormat != null) 'FileFormat': fileFormat.toValue(),
      if (id != null) 'Id': id,
      if (indexId != null) 'IndexId': indexId,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (s3Path != null) 'S3Path': s3Path,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DescribeIndexResponse {
  /// For Enterprise edition indexes, you can choose to use additional capacity to
  /// meet the needs of your application. This contains the capacity units used
  /// for the index. A 0 for the query capacity or the storage capacity indicates
  /// that the index is using the default capacity for the index.
  final CapacityUnitsConfiguration? capacityUnits;

  /// The Unix datetime that the index was created.
  final DateTime? createdAt;

  /// The description of the index.
  final String? description;

  /// Configuration settings for any metadata applied to the documents in the
  /// index.
  final List<DocumentMetadataConfiguration>? documentMetadataConfigurations;

  /// The Amazon Kendra edition used for the index. You decide the edition when
  /// you create the index.
  final IndexEdition? edition;

  /// When th e<code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a message that explains why.
  final String? errorMessage;

  /// The name of the index.
  final String? id;

  /// Provides information about the number of FAQ questions and answers and the
  /// number of text documents indexed.
  final IndexStatistics? indexStatistics;

  /// The name of the index.
  final String? name;

  /// The Amazon Resource Name (ARN) of the IAM role that gives Amazon Kendra
  /// permission to write to your Amazon Cloudwatch logs.
  final String? roleArn;

  /// The identifier of the AWS KMS customer master key (CMK) used to encrypt your
  /// data. Amazon Kendra doesn't support asymmetric CMKs.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// The current status of the index. When the value is <code>ACTIVE</code>, the
  /// index is ready for use. If the <code>Status</code> field value is
  /// <code>FAILED</code>, the <code>ErrorMessage</code> field contains a message
  /// that explains why.
  final IndexStatus? status;

  /// The Unix datetime that the index was last updated.
  final DateTime? updatedAt;

  /// The user context policy for the Amazon Kendra index.
  final UserContextPolicy? userContextPolicy;

  /// The user token configuration for the Amazon Kendra index.
  final List<UserTokenConfiguration>? userTokenConfigurations;

  DescribeIndexResponse({
    this.capacityUnits,
    this.createdAt,
    this.description,
    this.documentMetadataConfigurations,
    this.edition,
    this.errorMessage,
    this.id,
    this.indexStatistics,
    this.name,
    this.roleArn,
    this.serverSideEncryptionConfiguration,
    this.status,
    this.updatedAt,
    this.userContextPolicy,
    this.userTokenConfigurations,
  });

  factory DescribeIndexResponse.fromJson(Map<String, dynamic> json) {
    return DescribeIndexResponse(
      capacityUnits: json['CapacityUnits'] != null
          ? CapacityUnitsConfiguration.fromJson(
              json['CapacityUnits'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      documentMetadataConfigurations: (json['DocumentMetadataConfigurations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              DocumentMetadataConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      edition: (json['Edition'] as String?)?.toIndexEdition(),
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
      indexStatistics: json['IndexStatistics'] != null
          ? IndexStatistics.fromJson(
              json['IndexStatistics'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      serverSideEncryptionConfiguration:
          json['ServerSideEncryptionConfiguration'] != null
              ? ServerSideEncryptionConfiguration.fromJson(
                  json['ServerSideEncryptionConfiguration']
                      as Map<String, dynamic>)
              : null,
      status: (json['Status'] as String?)?.toIndexStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      userContextPolicy:
          (json['UserContextPolicy'] as String?)?.toUserContextPolicy(),
      userTokenConfigurations: (json['UserTokenConfigurations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => UserTokenConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final capacityUnits = this.capacityUnits;
    final createdAt = this.createdAt;
    final description = this.description;
    final documentMetadataConfigurations = this.documentMetadataConfigurations;
    final edition = this.edition;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final indexStatistics = this.indexStatistics;
    final name = this.name;
    final roleArn = this.roleArn;
    final serverSideEncryptionConfiguration =
        this.serverSideEncryptionConfiguration;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final userContextPolicy = this.userContextPolicy;
    final userTokenConfigurations = this.userTokenConfigurations;
    return {
      if (capacityUnits != null) 'CapacityUnits': capacityUnits,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (documentMetadataConfigurations != null)
        'DocumentMetadataConfigurations': documentMetadataConfigurations,
      if (edition != null) 'Edition': edition.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
      if (indexStatistics != null) 'IndexStatistics': indexStatistics,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (serverSideEncryptionConfiguration != null)
        'ServerSideEncryptionConfiguration': serverSideEncryptionConfiguration,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (userContextPolicy != null)
        'UserContextPolicy': userContextPolicy.toValue(),
      if (userTokenConfigurations != null)
        'UserTokenConfigurations': userTokenConfigurations,
    };
  }
}

class DescribeQuerySuggestionsBlockListResponse {
  /// Shows the date-time a block list for query suggestions was last created.
  final DateTime? createdAt;

  /// Shows the description for the block list.
  final String? description;

  /// Shows the error message with details when there are issues in processing the
  /// block list.
  final String? errorMessage;

  /// Shows the current size of the block list text file in S3.
  final int? fileSizeBytes;

  /// Shows the unique identifier of the block list.
  final String? id;

  /// Shows the identifier of the index for the block list.
  final String? indexId;

  /// Shows the current number of valid, non-empty words or phrases in the block
  /// list text file.
  final int? itemCount;

  /// Shows the name of the block list.
  final String? name;

  /// Shows the current IAM (Identity and Access Management) role used by Amazon
  /// Kendra to access the block list text file in S3.
  ///
  /// The role needs S3 read permissions to your file in S3 and needs to give STS
  /// (Security Token Service) assume role permissions to Amazon Kendra.
  final String? roleArn;

  /// Shows the current S3 path to your block list text file in your S3 bucket.
  ///
  /// Each block word or phrase should be on a separate line in a text file.
  ///
  /// For information on the current quota limits for block lists, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas for
  /// Amazon Kendra</a>.
  final S3Path? sourceS3Path;

  /// Shows whether the current status of the block list is <code>ACTIVE</code> or
  /// <code>INACTIVE</code>.
  final QuerySuggestionsBlockListStatus? status;

  /// Shows the date-time a block list for query suggestions was last updated.
  final DateTime? updatedAt;

  DescribeQuerySuggestionsBlockListResponse({
    this.createdAt,
    this.description,
    this.errorMessage,
    this.fileSizeBytes,
    this.id,
    this.indexId,
    this.itemCount,
    this.name,
    this.roleArn,
    this.sourceS3Path,
    this.status,
    this.updatedAt,
  });

  factory DescribeQuerySuggestionsBlockListResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeQuerySuggestionsBlockListResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      fileSizeBytes: json['FileSizeBytes'] as int?,
      id: json['Id'] as String?,
      indexId: json['IndexId'] as String?,
      itemCount: json['ItemCount'] as int?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      sourceS3Path: json['SourceS3Path'] != null
          ? S3Path.fromJson(json['SourceS3Path'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toQuerySuggestionsBlockListStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final fileSizeBytes = this.fileSizeBytes;
    final id = this.id;
    final indexId = this.indexId;
    final itemCount = this.itemCount;
    final name = this.name;
    final roleArn = this.roleArn;
    final sourceS3Path = this.sourceS3Path;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (fileSizeBytes != null) 'FileSizeBytes': fileSizeBytes,
      if (id != null) 'Id': id,
      if (indexId != null) 'IndexId': indexId,
      if (itemCount != null) 'ItemCount': itemCount,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (sourceS3Path != null) 'SourceS3Path': sourceS3Path,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DescribeQuerySuggestionsConfigResponse {
  /// Shows whether Amazon Kendra uses all queries or only uses queries that
  /// include user information to generate query suggestions.
  final bool? includeQueriesWithoutUserInformation;

  /// Shows the date-time query suggestions for an index was last cleared.
  ///
  /// After you clear suggestions, Amazon Kendra learns new suggestions based on
  /// new queries added to the query log from the time you cleared suggestions.
  /// Amazon Kendra only considers re-occurences of a query from the time you
  /// cleared suggestions.
  final DateTime? lastClearTime;

  /// Shows the date-time query suggestions for an index was last updated.
  final DateTime? lastSuggestionsBuildTime;

  /// Shows the minimum number of unique users who must search a query in order
  /// for the query to be eligible to suggest to your users.
  final int? minimumNumberOfQueryingUsers;

  /// Shows the minimum number of times a query must be searched in order for the
  /// query to be eligible to suggest to your users.
  final int? minimumQueryCount;

  /// Shows whether query suggestions are currently in <code>ENABLED</code> mode
  /// or <code>LEARN_ONLY</code> mode.
  ///
  /// By default, Amazon Kendra enables query suggestions.<code>LEARN_ONLY</code>
  /// turns off query suggestions for your users. You can change the mode using
  /// the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html">UpdateQuerySuggestionsConfig</a>
  /// operation.
  final Mode? mode;

  /// Shows how recent your queries are in your query log time window (in days).
  final int? queryLogLookBackWindowInDays;

  /// Shows whether the status of query suggestions settings is currently Active
  /// or Updating.
  ///
  /// Active means the current settings apply and Updating means your changed
  /// settings are in the process of applying.
  final QuerySuggestionsStatus? status;

  /// Shows the current total count of query suggestions for an index.
  ///
  /// This count can change when you update your query suggestions settings, if
  /// you filter out certain queries from suggestions using a block list, and as
  /// the query log accumulates more queries for Amazon Kendra to learn from.
  final int? totalSuggestionsCount;

  DescribeQuerySuggestionsConfigResponse({
    this.includeQueriesWithoutUserInformation,
    this.lastClearTime,
    this.lastSuggestionsBuildTime,
    this.minimumNumberOfQueryingUsers,
    this.minimumQueryCount,
    this.mode,
    this.queryLogLookBackWindowInDays,
    this.status,
    this.totalSuggestionsCount,
  });

  factory DescribeQuerySuggestionsConfigResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeQuerySuggestionsConfigResponse(
      includeQueriesWithoutUserInformation:
          json['IncludeQueriesWithoutUserInformation'] as bool?,
      lastClearTime: timeStampFromJson(json['LastClearTime']),
      lastSuggestionsBuildTime:
          timeStampFromJson(json['LastSuggestionsBuildTime']),
      minimumNumberOfQueryingUsers:
          json['MinimumNumberOfQueryingUsers'] as int?,
      minimumQueryCount: json['MinimumQueryCount'] as int?,
      mode: (json['Mode'] as String?)?.toMode(),
      queryLogLookBackWindowInDays:
          json['QueryLogLookBackWindowInDays'] as int?,
      status: (json['Status'] as String?)?.toQuerySuggestionsStatus(),
      totalSuggestionsCount: json['TotalSuggestionsCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final includeQueriesWithoutUserInformation =
        this.includeQueriesWithoutUserInformation;
    final lastClearTime = this.lastClearTime;
    final lastSuggestionsBuildTime = this.lastSuggestionsBuildTime;
    final minimumNumberOfQueryingUsers = this.minimumNumberOfQueryingUsers;
    final minimumQueryCount = this.minimumQueryCount;
    final mode = this.mode;
    final queryLogLookBackWindowInDays = this.queryLogLookBackWindowInDays;
    final status = this.status;
    final totalSuggestionsCount = this.totalSuggestionsCount;
    return {
      if (includeQueriesWithoutUserInformation != null)
        'IncludeQueriesWithoutUserInformation':
            includeQueriesWithoutUserInformation,
      if (lastClearTime != null)
        'LastClearTime': unixTimestampToJson(lastClearTime),
      if (lastSuggestionsBuildTime != null)
        'LastSuggestionsBuildTime':
            unixTimestampToJson(lastSuggestionsBuildTime),
      if (minimumNumberOfQueryingUsers != null)
        'MinimumNumberOfQueryingUsers': minimumNumberOfQueryingUsers,
      if (minimumQueryCount != null) 'MinimumQueryCount': minimumQueryCount,
      if (mode != null) 'Mode': mode.toValue(),
      if (queryLogLookBackWindowInDays != null)
        'QueryLogLookBackWindowInDays': queryLogLookBackWindowInDays,
      if (status != null) 'Status': status.toValue(),
      if (totalSuggestionsCount != null)
        'TotalSuggestionsCount': totalSuggestionsCount,
    };
  }
}

class DescribeThesaurusResponse {
  /// The Unix datetime that the thesaurus was created.
  final DateTime? createdAt;

  /// The thesaurus description.
  final String? description;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field provides more information.
  final String? errorMessage;

  /// The size of the thesaurus file in bytes.
  final int? fileSizeBytes;

  /// The identifier of the thesaurus.
  final String? id;

  /// The identifier of the index associated with the thesaurus to describe.
  final String? indexId;

  /// The thesaurus name.
  final String? name;

  /// An AWS Identity and Access Management (IAM) role that gives Amazon Kendra
  /// permissions to access thesaurus file specified in <code>SourceS3Path</code>.
  final String? roleArn;
  final S3Path? sourceS3Path;

  /// The current status of the thesaurus. When the value is <code>ACTIVE</code>,
  /// queries are able to use the thesaurus. If the <code>Status</code> field
  /// value is <code>FAILED</code>, the <code>ErrorMessage</code> field provides
  /// more information.
  ///
  /// If the status is <code>ACTIVE_BUT_UPDATE_FAILED</code>, it means that Amazon
  /// Kendra could not ingest the new thesaurus file. The old thesaurus file is
  /// still active.
  final ThesaurusStatus? status;

  /// The number of synonym rules in the thesaurus file.
  final int? synonymRuleCount;

  /// The number of unique terms in the thesaurus file. For example, the synonyms
  /// <code>a,b,c</code> and <code>a=&gt;d</code>, the term count would be 4.
  final int? termCount;

  /// The Unix datetime that the thesaurus was last updated.
  final DateTime? updatedAt;

  DescribeThesaurusResponse({
    this.createdAt,
    this.description,
    this.errorMessage,
    this.fileSizeBytes,
    this.id,
    this.indexId,
    this.name,
    this.roleArn,
    this.sourceS3Path,
    this.status,
    this.synonymRuleCount,
    this.termCount,
    this.updatedAt,
  });

  factory DescribeThesaurusResponse.fromJson(Map<String, dynamic> json) {
    return DescribeThesaurusResponse(
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      fileSizeBytes: json['FileSizeBytes'] as int?,
      id: json['Id'] as String?,
      indexId: json['IndexId'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      sourceS3Path: json['SourceS3Path'] != null
          ? S3Path.fromJson(json['SourceS3Path'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toThesaurusStatus(),
      synonymRuleCount: json['SynonymRuleCount'] as int?,
      termCount: json['TermCount'] as int?,
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final fileSizeBytes = this.fileSizeBytes;
    final id = this.id;
    final indexId = this.indexId;
    final name = this.name;
    final roleArn = this.roleArn;
    final sourceS3Path = this.sourceS3Path;
    final status = this.status;
    final synonymRuleCount = this.synonymRuleCount;
    final termCount = this.termCount;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (fileSizeBytes != null) 'FileSizeBytes': fileSizeBytes,
      if (id != null) 'Id': id,
      if (indexId != null) 'IndexId': indexId,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (sourceS3Path != null) 'SourceS3Path': sourceS3Path,
      if (status != null) 'Status': status.toValue(),
      if (synonymRuleCount != null) 'SynonymRuleCount': synonymRuleCount,
      if (termCount != null) 'TermCount': termCount,
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A document in an index.
class Document {
  /// A unique identifier of the document in the index.
  final String id;

  /// Information to use for user context filtering.
  final List<Principal>? accessControlList;

  /// Custom attributes to apply to the document. Use the custom attributes to
  /// provide additional information for searching, to provide facets for refining
  /// searches, and to provide additional information in the query response.
  final List<DocumentAttribute>? attributes;

  /// The contents of the document.
  ///
  /// Documents passed to the <code>Blob</code> parameter must be base64 encoded.
  /// Your code might not need to encode the document file bytes if you're using
  /// an AWS SDK to call Amazon Kendra operations. If you are calling the Amazon
  /// Kendra endpoint directly using REST, you must base64 encode the contents
  /// before sending.
  final Uint8List? blob;

  /// The file type of the document in the <code>Blob</code> field.
  final ContentType? contentType;
  final S3Path? s3Path;

  /// The title of the document.
  final String? title;

  Document({
    required this.id,
    this.accessControlList,
    this.attributes,
    this.blob,
    this.contentType,
    this.s3Path,
    this.title,
  });

  factory Document.fromJson(Map<String, dynamic> json) {
    return Document(
      id: json['Id'] as String,
      accessControlList: (json['AccessControlList'] as List?)
          ?.whereNotNull()
          .map((e) => Principal.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      blob: _s.decodeNullableUint8List(json['Blob'] as String?),
      contentType: (json['ContentType'] as String?)?.toContentType(),
      s3Path: json['S3Path'] != null
          ? S3Path.fromJson(json['S3Path'] as Map<String, dynamic>)
          : null,
      title: json['Title'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final accessControlList = this.accessControlList;
    final attributes = this.attributes;
    final blob = this.blob;
    final contentType = this.contentType;
    final s3Path = this.s3Path;
    final title = this.title;
    return {
      'Id': id,
      if (accessControlList != null) 'AccessControlList': accessControlList,
      if (attributes != null) 'Attributes': attributes,
      if (blob != null) 'Blob': base64Encode(blob),
      if (contentType != null) 'ContentType': contentType.toValue(),
      if (s3Path != null) 'S3Path': s3Path,
      if (title != null) 'Title': title,
    };
  }
}

/// A custom attribute value assigned to a document.
class DocumentAttribute {
  /// The identifier for the attribute.
  final String key;

  /// The value of the attribute.
  final DocumentAttributeValue value;

  DocumentAttribute({
    required this.key,
    required this.value,
  });

  factory DocumentAttribute.fromJson(Map<String, dynamic> json) {
    return DocumentAttribute(
      key: json['Key'] as String,
      value: DocumentAttributeValue.fromJson(
          json['Value'] as Map<String, dynamic>),
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

/// The value of a custom document attribute. You can only provide one value for
/// a custom attribute.
class DocumentAttributeValue {
  /// A date expressed as an ISO 8601 string.
  ///
  /// It is important for the time zone to be included in the ISO 8601 date-time
  /// format. For example, 20120325T123010+01:00 is the ISO 8601 date-time format
  /// for March 25th 2012 at 12:30PM (plus 10 seconds) in Central European Time.
  final DateTime? dateValue;

  /// A long integer value.
  final int? longValue;

  /// A list of strings.
  final List<String>? stringListValue;

  /// A string, such as "department".
  final String? stringValue;

  DocumentAttributeValue({
    this.dateValue,
    this.longValue,
    this.stringListValue,
    this.stringValue,
  });

  factory DocumentAttributeValue.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeValue(
      dateValue: timeStampFromJson(json['DateValue']),
      longValue: json['LongValue'] as int?,
      stringListValue: (json['StringListValue'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      stringValue: json['StringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dateValue = this.dateValue;
    final longValue = this.longValue;
    final stringListValue = this.stringListValue;
    final stringValue = this.stringValue;
    return {
      if (dateValue != null) 'DateValue': unixTimestampToJson(dateValue),
      if (longValue != null) 'LongValue': longValue,
      if (stringListValue != null) 'StringListValue': stringListValue,
      if (stringValue != null) 'StringValue': stringValue,
    };
  }
}

/// Provides the count of documents that match a particular attribute when doing
/// a faceted search.
class DocumentAttributeValueCountPair {
  /// The number of documents in the response that have the attribute value for
  /// the key.
  final int? count;

  /// The value of the attribute. For example, "HR."
  final DocumentAttributeValue? documentAttributeValue;

  DocumentAttributeValueCountPair({
    this.count,
    this.documentAttributeValue,
  });

  factory DocumentAttributeValueCountPair.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeValueCountPair(
      count: json['Count'] as int?,
      documentAttributeValue: json['DocumentAttributeValue'] != null
          ? DocumentAttributeValue.fromJson(
              json['DocumentAttributeValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final documentAttributeValue = this.documentAttributeValue;
    return {
      if (count != null) 'Count': count,
      if (documentAttributeValue != null)
        'DocumentAttributeValue': documentAttributeValue,
    };
  }
}

enum DocumentAttributeValueType {
  stringValue,
  stringListValue,
  longValue,
  dateValue,
}

extension on DocumentAttributeValueType {
  String toValue() {
    switch (this) {
      case DocumentAttributeValueType.stringValue:
        return 'STRING_VALUE';
      case DocumentAttributeValueType.stringListValue:
        return 'STRING_LIST_VALUE';
      case DocumentAttributeValueType.longValue:
        return 'LONG_VALUE';
      case DocumentAttributeValueType.dateValue:
        return 'DATE_VALUE';
    }
  }
}

extension on String {
  DocumentAttributeValueType toDocumentAttributeValueType() {
    switch (this) {
      case 'STRING_VALUE':
        return DocumentAttributeValueType.stringValue;
      case 'STRING_LIST_VALUE':
        return DocumentAttributeValueType.stringListValue;
      case 'LONG_VALUE':
        return DocumentAttributeValueType.longValue;
      case 'DATE_VALUE':
        return DocumentAttributeValueType.dateValue;
    }
    throw Exception('$this is not known in enum DocumentAttributeValueType');
  }
}

/// Identifies a document for which to retrieve status information
class DocumentInfo {
  /// The unique identifier of the document.
  final String documentId;

  /// Attributes that identify a specific version of a document to check.
  ///
  /// The only valid attributes are:
  ///
  /// <ul>
  /// <li>
  /// version
  /// </li>
  /// <li>
  /// datasourceId
  /// </li>
  /// <li>
  /// jobExecutionId
  /// </li>
  /// </ul>
  /// The attributes follow these rules:
  ///
  /// <ul>
  /// <li>
  /// <code>dataSourceId</code> and <code>jobExecutionId</code> must be used
  /// together.
  /// </li>
  /// <li>
  /// <code>version</code> is ignored if <code>dataSourceId</code> and
  /// <code>jobExecutionId</code> are not provided.
  /// </li>
  /// <li>
  /// If <code>dataSourceId</code> and <code>jobExecutionId</code> are provided,
  /// but <code>version</code> is not, the version defaults to "0".
  /// </li>
  /// </ul>
  final List<DocumentAttribute>? attributes;

  DocumentInfo({
    required this.documentId,
    this.attributes,
  });

  factory DocumentInfo.fromJson(Map<String, dynamic> json) {
    return DocumentInfo(
      documentId: json['DocumentId'] as String,
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentId = this.documentId;
    final attributes = this.attributes;
    return {
      'DocumentId': documentId,
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Specifies the properties of a custom index field.
class DocumentMetadataConfiguration {
  /// The name of the index field.
  final String name;

  /// The data type of the index field.
  final DocumentAttributeValueType type;

  /// Provides manual tuning parameters to determine how the field affects the
  /// search results.
  final Relevance? relevance;

  /// Provides information about how the field is used during a search.
  final Search? search;

  DocumentMetadataConfiguration({
    required this.name,
    required this.type,
    this.relevance,
    this.search,
  });

  factory DocumentMetadataConfiguration.fromJson(Map<String, dynamic> json) {
    return DocumentMetadataConfiguration(
      name: json['Name'] as String,
      type: (json['Type'] as String).toDocumentAttributeValueType(),
      relevance: json['Relevance'] != null
          ? Relevance.fromJson(json['Relevance'] as Map<String, dynamic>)
          : null,
      search: json['Search'] != null
          ? Search.fromJson(json['Search'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    final relevance = this.relevance;
    final search = this.search;
    return {
      'Name': name,
      'Type': type.toValue(),
      if (relevance != null) 'Relevance': relevance,
      if (search != null) 'Search': search,
    };
  }
}

/// Overrides the document relevance properties of a custom index field.
class DocumentRelevanceConfiguration {
  /// The name of the tuning configuration to override document relevance at the
  /// index level.
  final String name;
  final Relevance relevance;

  DocumentRelevanceConfiguration({
    required this.name,
    required this.relevance,
  });

  factory DocumentRelevanceConfiguration.fromJson(Map<String, dynamic> json) {
    return DocumentRelevanceConfiguration(
      name: json['Name'] as String,
      relevance: Relevance.fromJson(json['Relevance'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final relevance = this.relevance;
    return {
      'Name': name,
      'Relevance': relevance,
    };
  }
}

enum DocumentStatus {
  notFound,
  processing,
  indexed,
  updated,
  failed,
  updateFailed,
}

extension on DocumentStatus {
  String toValue() {
    switch (this) {
      case DocumentStatus.notFound:
        return 'NOT_FOUND';
      case DocumentStatus.processing:
        return 'PROCESSING';
      case DocumentStatus.indexed:
        return 'INDEXED';
      case DocumentStatus.updated:
        return 'UPDATED';
      case DocumentStatus.failed:
        return 'FAILED';
      case DocumentStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension on String {
  DocumentStatus toDocumentStatus() {
    switch (this) {
      case 'NOT_FOUND':
        return DocumentStatus.notFound;
      case 'PROCESSING':
        return DocumentStatus.processing;
      case 'INDEXED':
        return DocumentStatus.indexed;
      case 'UPDATED':
        return DocumentStatus.updated;
      case 'FAILED':
        return DocumentStatus.failed;
      case 'UPDATE_FAILED':
        return DocumentStatus.updateFailed;
    }
    throw Exception('$this is not known in enum DocumentStatus');
  }
}

/// Document metadata files that contain information such as the document access
/// control information, source URI, document author, and custom attributes.
/// Each metadata file contains metadata about a single document.
class DocumentsMetadataConfiguration {
  /// A prefix used to filter metadata configuration files in the AWS S3 bucket.
  /// The S3 bucket might contain multiple metadata files. Use
  /// <code>S3Prefix</code> to include only the desired metadata files.
  final String? s3Prefix;

  DocumentsMetadataConfiguration({
    this.s3Prefix,
  });

  factory DocumentsMetadataConfiguration.fromJson(Map<String, dynamic> json) {
    return DocumentsMetadataConfiguration(
      s3Prefix: json['S3Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Prefix = this.s3Prefix;
    return {
      if (s3Prefix != null) 'S3Prefix': s3Prefix,
    };
  }
}

enum ErrorCode {
  internalError,
  invalidRequest,
}

extension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.internalError:
        return 'InternalError';
      case ErrorCode.invalidRequest:
        return 'InvalidRequest';
    }
  }
}

extension on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'InternalError':
        return ErrorCode.internalError;
      case 'InvalidRequest':
        return ErrorCode.invalidRequest;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

/// Information about a document attribute
class Facet {
  /// The unique key for the document attribute.
  final String? documentAttributeKey;

  Facet({
    this.documentAttributeKey,
  });

  factory Facet.fromJson(Map<String, dynamic> json) {
    return Facet(
      documentAttributeKey: json['DocumentAttributeKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentAttributeKey = this.documentAttributeKey;
    return {
      if (documentAttributeKey != null)
        'DocumentAttributeKey': documentAttributeKey,
    };
  }
}

/// The facet values for the documents in the response.
class FacetResult {
  /// The key for the facet values. This is the same as the
  /// <code>DocumentAttributeKey</code> provided in the query.
  final String? documentAttributeKey;

  /// An array of key/value pairs, where the key is the value of the attribute and
  /// the count is the number of documents that share the key value.
  final List<DocumentAttributeValueCountPair>? documentAttributeValueCountPairs;

  /// The data type of the facet value. This is the same as the type defined for
  /// the index field when it was created.
  final DocumentAttributeValueType? documentAttributeValueType;

  FacetResult({
    this.documentAttributeKey,
    this.documentAttributeValueCountPairs,
    this.documentAttributeValueType,
  });

  factory FacetResult.fromJson(Map<String, dynamic> json) {
    return FacetResult(
      documentAttributeKey: json['DocumentAttributeKey'] as String?,
      documentAttributeValueCountPairs:
          (json['DocumentAttributeValueCountPairs'] as List?)
              ?.whereNotNull()
              .map((e) => DocumentAttributeValueCountPair.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      documentAttributeValueType:
          (json['DocumentAttributeValueType'] as String?)
              ?.toDocumentAttributeValueType(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentAttributeKey = this.documentAttributeKey;
    final documentAttributeValueCountPairs =
        this.documentAttributeValueCountPairs;
    final documentAttributeValueType = this.documentAttributeValueType;
    return {
      if (documentAttributeKey != null)
        'DocumentAttributeKey': documentAttributeKey,
      if (documentAttributeValueCountPairs != null)
        'DocumentAttributeValueCountPairs': documentAttributeValueCountPairs,
      if (documentAttributeValueType != null)
        'DocumentAttributeValueType': documentAttributeValueType.toValue(),
    };
  }
}

enum FaqFileFormat {
  csv,
  csvWithHeader,
  json,
}

extension on FaqFileFormat {
  String toValue() {
    switch (this) {
      case FaqFileFormat.csv:
        return 'CSV';
      case FaqFileFormat.csvWithHeader:
        return 'CSV_WITH_HEADER';
      case FaqFileFormat.json:
        return 'JSON';
    }
  }
}

extension on String {
  FaqFileFormat toFaqFileFormat() {
    switch (this) {
      case 'CSV':
        return FaqFileFormat.csv;
      case 'CSV_WITH_HEADER':
        return FaqFileFormat.csvWithHeader;
      case 'JSON':
        return FaqFileFormat.json;
    }
    throw Exception('$this is not known in enum FaqFileFormat');
  }
}

/// Provides statistical information about the FAQ questions and answers
/// contained in an index.
class FaqStatistics {
  /// The total number of FAQ questions and answers contained in the index.
  final int indexedQuestionAnswersCount;

  FaqStatistics({
    required this.indexedQuestionAnswersCount,
  });

  factory FaqStatistics.fromJson(Map<String, dynamic> json) {
    return FaqStatistics(
      indexedQuestionAnswersCount: json['IndexedQuestionAnswersCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final indexedQuestionAnswersCount = this.indexedQuestionAnswersCount;
    return {
      'IndexedQuestionAnswersCount': indexedQuestionAnswersCount,
    };
  }
}

enum FaqStatus {
  creating,
  updating,
  active,
  deleting,
  failed,
}

extension on FaqStatus {
  String toValue() {
    switch (this) {
      case FaqStatus.creating:
        return 'CREATING';
      case FaqStatus.updating:
        return 'UPDATING';
      case FaqStatus.active:
        return 'ACTIVE';
      case FaqStatus.deleting:
        return 'DELETING';
      case FaqStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  FaqStatus toFaqStatus() {
    switch (this) {
      case 'CREATING':
        return FaqStatus.creating;
      case 'UPDATING':
        return FaqStatus.updating;
      case 'ACTIVE':
        return FaqStatus.active;
      case 'DELETING':
        return FaqStatus.deleting;
      case 'FAILED':
        return FaqStatus.failed;
    }
    throw Exception('$this is not known in enum FaqStatus');
  }
}

/// Provides information about a frequently asked questions and answer contained
/// in an index.
class FaqSummary {
  /// The UNIX datetime that the FAQ was added to the index.
  final DateTime? createdAt;

  /// The file type used to create the FAQ.
  final FaqFileFormat? fileFormat;

  /// The unique identifier of the FAQ.
  final String? id;

  /// The name that you assigned the FAQ when you created or updated the FAQ.
  final String? name;

  /// The current status of the FAQ. When the status is <code>ACTIVE</code> the
  /// FAQ is ready for use.
  final FaqStatus? status;

  /// The UNIX datetime that the FAQ was last updated.
  final DateTime? updatedAt;

  FaqSummary({
    this.createdAt,
    this.fileFormat,
    this.id,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory FaqSummary.fromJson(Map<String, dynamic> json) {
    return FaqSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      fileFormat: (json['FileFormat'] as String?)?.toFaqFileFormat(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toFaqStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final fileFormat = this.fileFormat;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (fileFormat != null) 'FileFormat': fileFormat.toValue(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class GetQuerySuggestionsResponse {
  /// The unique identifier for a list of query suggestions for an index.
  final String? querySuggestionsId;

  /// A list of query suggestions for an index.
  final List<Suggestion>? suggestions;

  GetQuerySuggestionsResponse({
    this.querySuggestionsId,
    this.suggestions,
  });

  factory GetQuerySuggestionsResponse.fromJson(Map<String, dynamic> json) {
    return GetQuerySuggestionsResponse(
      querySuggestionsId: json['QuerySuggestionsId'] as String?,
      suggestions: (json['Suggestions'] as List?)
          ?.whereNotNull()
          .map((e) => Suggestion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final querySuggestionsId = this.querySuggestionsId;
    final suggestions = this.suggestions;
    return {
      if (querySuggestionsId != null) 'QuerySuggestionsId': querySuggestionsId,
      if (suggestions != null) 'Suggestions': suggestions,
    };
  }
}

/// Provides configuration information for data sources that connect to Google
/// Drive.
class GoogleDriveConfiguration {
  /// The Amazon Resource Name (ARN) of a AWS Secrets Manager secret that contains
  /// the credentials required to connect to Google Drive. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-google-drive.html">Using
  /// a Google Workspace Drive data source</a>.
  final String secretArn;

  /// A list of MIME types to exclude from the index. All documents matching the
  /// specified MIME type are excluded.
  ///
  /// For a list of MIME types, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-google-drive.html">Using
  /// a Google Workspace Drive data source</a>.
  final List<String>? excludeMimeTypes;

  /// A list of identifiers or shared drives to exclude from the index. All files
  /// and folders stored on the shared drive are excluded.
  final List<String>? excludeSharedDrives;

  /// A list of email addresses of the users. Documents owned by these users are
  /// excluded from the index. Documents shared with excluded users are indexed
  /// unless they are excluded in another way.
  final List<String>? excludeUserAccounts;

  /// A list of regular expression patterns that apply to the path on Google
  /// Drive. Items that match the pattern are excluded from the index from both
  /// shared drives and users' My Drives. Items that don't match the pattern are
  /// included in the index. If an item matches both an exclusion pattern and an
  /// inclusion pattern, it is excluded from the index.
  final List<String>? exclusionPatterns;

  /// Defines mapping between a field in the Google Drive and a Amazon Kendra
  /// index field.
  ///
  /// If you are using the console, you can define index fields when creating the
  /// mapping. If you are using the API, you must first create the field using the
  /// <code>UpdateIndex</code> operation.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns that apply to path on Google Drive.
  /// Items that match the pattern are included in the index from both shared
  /// drives and users' My Drives. Items that don't match the pattern are excluded
  /// from the index. If an item matches both an inclusion pattern and an
  /// exclusion pattern, it is excluded from the index.
  final List<String>? inclusionPatterns;

  GoogleDriveConfiguration({
    required this.secretArn,
    this.excludeMimeTypes,
    this.excludeSharedDrives,
    this.excludeUserAccounts,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
  });

  factory GoogleDriveConfiguration.fromJson(Map<String, dynamic> json) {
    return GoogleDriveConfiguration(
      secretArn: json['SecretArn'] as String,
      excludeMimeTypes: (json['ExcludeMimeTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      excludeSharedDrives: (json['ExcludeSharedDrives'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      excludeUserAccounts: (json['ExcludeUserAccounts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final excludeMimeTypes = this.excludeMimeTypes;
    final excludeSharedDrives = this.excludeSharedDrives;
    final excludeUserAccounts = this.excludeUserAccounts;
    final exclusionPatterns = this.exclusionPatterns;
    final fieldMappings = this.fieldMappings;
    final inclusionPatterns = this.inclusionPatterns;
    return {
      'SecretArn': secretArn,
      if (excludeMimeTypes != null) 'ExcludeMimeTypes': excludeMimeTypes,
      if (excludeSharedDrives != null)
        'ExcludeSharedDrives': excludeSharedDrives,
      if (excludeUserAccounts != null)
        'ExcludeUserAccounts': excludeUserAccounts,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
    };
  }
}

/// Provides information that you can use to highlight a search result so that
/// your users can quickly identify terms in the response.
class Highlight {
  /// The zero-based location in the response string where the highlight starts.
  final int beginOffset;

  /// The zero-based location in the response string where the highlight ends.
  final int endOffset;

  /// Indicates whether the response is the best response. True if this is the
  /// best response; otherwise, false.
  final bool? topAnswer;

  /// The highlight type.
  final HighlightType? type;

  Highlight({
    required this.beginOffset,
    required this.endOffset,
    this.topAnswer,
    this.type,
  });

  factory Highlight.fromJson(Map<String, dynamic> json) {
    return Highlight(
      beginOffset: json['BeginOffset'] as int,
      endOffset: json['EndOffset'] as int,
      topAnswer: json['TopAnswer'] as bool?,
      type: (json['Type'] as String?)?.toHighlightType(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    final topAnswer = this.topAnswer;
    final type = this.type;
    return {
      'BeginOffset': beginOffset,
      'EndOffset': endOffset,
      if (topAnswer != null) 'TopAnswer': topAnswer,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum HighlightType {
  standard,
  thesaurusSynonym,
}

extension on HighlightType {
  String toValue() {
    switch (this) {
      case HighlightType.standard:
        return 'STANDARD';
      case HighlightType.thesaurusSynonym:
        return 'THESAURUS_SYNONYM';
    }
  }
}

extension on String {
  HighlightType toHighlightType() {
    switch (this) {
      case 'STANDARD':
        return HighlightType.standard;
      case 'THESAURUS_SYNONYM':
        return HighlightType.thesaurusSynonym;
    }
    throw Exception('$this is not known in enum HighlightType');
  }
}

/// A summary of information about an index.
class IndexConfigurationSummary {
  /// The Unix timestamp when the index was created.
  final DateTime createdAt;

  /// The current status of the index. When the status is <code>ACTIVE</code>, the
  /// index is ready to search.
  final IndexStatus status;

  /// The Unix timestamp when the index was last updated by the
  /// <code>UpdateIndex</code> operation.
  final DateTime updatedAt;

  /// Indicates whether the index is a enterprise edition index or a developer
  /// edition index.
  final IndexEdition? edition;

  /// A unique identifier for the index. Use this to identify the index when you
  /// are using operations such as <code>Query</code>, <code>DescribeIndex</code>,
  /// <code>UpdateIndex</code>, and <code>DeleteIndex</code>.
  final String? id;

  /// The name of the index.
  final String? name;

  IndexConfigurationSummary({
    required this.createdAt,
    required this.status,
    required this.updatedAt,
    this.edition,
    this.id,
    this.name,
  });

  factory IndexConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return IndexConfigurationSummary(
      createdAt: nonNullableTimeStampFromJson(json['CreatedAt'] as Object),
      status: (json['Status'] as String).toIndexStatus(),
      updatedAt: nonNullableTimeStampFromJson(json['UpdatedAt'] as Object),
      edition: (json['Edition'] as String?)?.toIndexEdition(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final edition = this.edition;
    final id = this.id;
    final name = this.name;
    return {
      'CreatedAt': unixTimestampToJson(createdAt),
      'Status': status.toValue(),
      'UpdatedAt': unixTimestampToJson(updatedAt),
      if (edition != null) 'Edition': edition.toValue(),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
    };
  }
}

enum IndexEdition {
  developerEdition,
  enterpriseEdition,
}

extension on IndexEdition {
  String toValue() {
    switch (this) {
      case IndexEdition.developerEdition:
        return 'DEVELOPER_EDITION';
      case IndexEdition.enterpriseEdition:
        return 'ENTERPRISE_EDITION';
    }
  }
}

extension on String {
  IndexEdition toIndexEdition() {
    switch (this) {
      case 'DEVELOPER_EDITION':
        return IndexEdition.developerEdition;
      case 'ENTERPRISE_EDITION':
        return IndexEdition.enterpriseEdition;
    }
    throw Exception('$this is not known in enum IndexEdition');
  }
}

/// Provides information about the number of documents and the number of
/// questions and answers in an index.
class IndexStatistics {
  /// The number of question and answer topics in the index.
  final FaqStatistics faqStatistics;

  /// The number of text documents indexed.
  final TextDocumentStatistics textDocumentStatistics;

  IndexStatistics({
    required this.faqStatistics,
    required this.textDocumentStatistics,
  });

  factory IndexStatistics.fromJson(Map<String, dynamic> json) {
    return IndexStatistics(
      faqStatistics:
          FaqStatistics.fromJson(json['FaqStatistics'] as Map<String, dynamic>),
      textDocumentStatistics: TextDocumentStatistics.fromJson(
          json['TextDocumentStatistics'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final faqStatistics = this.faqStatistics;
    final textDocumentStatistics = this.textDocumentStatistics;
    return {
      'FaqStatistics': faqStatistics,
      'TextDocumentStatistics': textDocumentStatistics,
    };
  }
}

enum IndexStatus {
  creating,
  active,
  deleting,
  failed,
  updating,
  systemUpdating,
}

extension on IndexStatus {
  String toValue() {
    switch (this) {
      case IndexStatus.creating:
        return 'CREATING';
      case IndexStatus.active:
        return 'ACTIVE';
      case IndexStatus.deleting:
        return 'DELETING';
      case IndexStatus.failed:
        return 'FAILED';
      case IndexStatus.updating:
        return 'UPDATING';
      case IndexStatus.systemUpdating:
        return 'SYSTEM_UPDATING';
    }
  }
}

extension on String {
  IndexStatus toIndexStatus() {
    switch (this) {
      case 'CREATING':
        return IndexStatus.creating;
      case 'ACTIVE':
        return IndexStatus.active;
      case 'DELETING':
        return IndexStatus.deleting;
      case 'FAILED':
        return IndexStatus.failed;
      case 'UPDATING':
        return IndexStatus.updating;
      case 'SYSTEM_UPDATING':
        return IndexStatus.systemUpdating;
    }
    throw Exception('$this is not known in enum IndexStatus');
  }
}

/// Configuration information for the JSON token type.
class JsonTokenTypeConfiguration {
  /// The group attribute field.
  final String groupAttributeField;

  /// The user name attribute field.
  final String userNameAttributeField;

  JsonTokenTypeConfiguration({
    required this.groupAttributeField,
    required this.userNameAttributeField,
  });

  factory JsonTokenTypeConfiguration.fromJson(Map<String, dynamic> json) {
    return JsonTokenTypeConfiguration(
      groupAttributeField: json['GroupAttributeField'] as String,
      userNameAttributeField: json['UserNameAttributeField'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final groupAttributeField = this.groupAttributeField;
    final userNameAttributeField = this.userNameAttributeField;
    return {
      'GroupAttributeField': groupAttributeField,
      'UserNameAttributeField': userNameAttributeField,
    };
  }
}

/// Configuration information for the JWT token type.
class JwtTokenTypeConfiguration {
  /// The location of the key.
  final KeyLocation keyLocation;

  /// The regular expression that identifies the claim.
  final String? claimRegex;

  /// The group attribute field.
  final String? groupAttributeField;

  /// The issuer of the token.
  final String? issuer;

  /// The Amazon Resource Name (arn) of the secret.
  final String? secretManagerArn;

  /// The signing key URL.
  final String? url;

  /// The user name attribute field.
  final String? userNameAttributeField;

  JwtTokenTypeConfiguration({
    required this.keyLocation,
    this.claimRegex,
    this.groupAttributeField,
    this.issuer,
    this.secretManagerArn,
    this.url,
    this.userNameAttributeField,
  });

  factory JwtTokenTypeConfiguration.fromJson(Map<String, dynamic> json) {
    return JwtTokenTypeConfiguration(
      keyLocation: (json['KeyLocation'] as String).toKeyLocation(),
      claimRegex: json['ClaimRegex'] as String?,
      groupAttributeField: json['GroupAttributeField'] as String?,
      issuer: json['Issuer'] as String?,
      secretManagerArn: json['SecretManagerArn'] as String?,
      url: json['URL'] as String?,
      userNameAttributeField: json['UserNameAttributeField'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyLocation = this.keyLocation;
    final claimRegex = this.claimRegex;
    final groupAttributeField = this.groupAttributeField;
    final issuer = this.issuer;
    final secretManagerArn = this.secretManagerArn;
    final url = this.url;
    final userNameAttributeField = this.userNameAttributeField;
    return {
      'KeyLocation': keyLocation.toValue(),
      if (claimRegex != null) 'ClaimRegex': claimRegex,
      if (groupAttributeField != null)
        'GroupAttributeField': groupAttributeField,
      if (issuer != null) 'Issuer': issuer,
      if (secretManagerArn != null) 'SecretManagerArn': secretManagerArn,
      if (url != null) 'URL': url,
      if (userNameAttributeField != null)
        'UserNameAttributeField': userNameAttributeField,
    };
  }
}

enum KeyLocation {
  url,
  secretManager,
}

extension on KeyLocation {
  String toValue() {
    switch (this) {
      case KeyLocation.url:
        return 'URL';
      case KeyLocation.secretManager:
        return 'SECRET_MANAGER';
    }
  }
}

extension on String {
  KeyLocation toKeyLocation() {
    switch (this) {
      case 'URL':
        return KeyLocation.url;
      case 'SECRET_MANAGER':
        return KeyLocation.secretManager;
    }
    throw Exception('$this is not known in enum KeyLocation');
  }
}

class ListDataSourceSyncJobsResponse {
  /// A history of synchronization jobs for the data source.
  final List<DataSourceSyncJob>? history;

  /// The <code>GetDataSourceSyncJobHistory</code> operation returns a page of
  /// vocabularies at a time. The maximum size of the page is set by the
  /// <code>MaxResults</code> parameter. If there are more jobs in the list than
  /// the page size, Amazon Kendra returns the NextPage token. Include the token
  /// in the next request to the <code>GetDataSourceSyncJobHistory</code>
  /// operation to return in the next page of jobs.
  final String? nextToken;

  ListDataSourceSyncJobsResponse({
    this.history,
    this.nextToken,
  });

  factory ListDataSourceSyncJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSourceSyncJobsResponse(
      history: (json['History'] as List?)
          ?.whereNotNull()
          .map((e) => DataSourceSyncJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final history = this.history;
    final nextToken = this.nextToken;
    return {
      if (history != null) 'History': history,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDataSourcesResponse {
  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of data sources.
  final String? nextToken;

  /// An array of summary information for one or more data sources.
  final List<DataSourceSummary>? summaryItems;

  ListDataSourcesResponse({
    this.nextToken,
    this.summaryItems,
  });

  factory ListDataSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSourcesResponse(
      nextToken: json['NextToken'] as String?,
      summaryItems: (json['SummaryItems'] as List?)
          ?.whereNotNull()
          .map((e) => DataSourceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final summaryItems = this.summaryItems;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (summaryItems != null) 'SummaryItems': summaryItems,
    };
  }
}

class ListFaqsResponse {
  /// information about the FAQs associated with the specified index.
  final List<FaqSummary>? faqSummaryItems;

  /// The <code>ListFaqs</code> operation returns a page of FAQs at a time. The
  /// maximum size of the page is set by the <code>MaxResults</code> parameter. If
  /// there are more jobs in the list than the page size, Amazon Kendra returns
  /// the <code>NextPage</code> token. Include the token in the next request to
  /// the <code>ListFaqs</code> operation to return the next page of FAQs.
  final String? nextToken;

  ListFaqsResponse({
    this.faqSummaryItems,
    this.nextToken,
  });

  factory ListFaqsResponse.fromJson(Map<String, dynamic> json) {
    return ListFaqsResponse(
      faqSummaryItems: (json['FaqSummaryItems'] as List?)
          ?.whereNotNull()
          .map((e) => FaqSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final faqSummaryItems = this.faqSummaryItems;
    final nextToken = this.nextToken;
    return {
      if (faqSummaryItems != null) 'FaqSummaryItems': faqSummaryItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIndicesResponse {
  /// An array of summary information for one or more indexes.
  final List<IndexConfigurationSummary>? indexConfigurationSummaryItems;

  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of indexes.
  final String? nextToken;

  ListIndicesResponse({
    this.indexConfigurationSummaryItems,
    this.nextToken,
  });

  factory ListIndicesResponse.fromJson(Map<String, dynamic> json) {
    return ListIndicesResponse(
      indexConfigurationSummaryItems:
          (json['IndexConfigurationSummaryItems'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  IndexConfigurationSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final indexConfigurationSummaryItems = this.indexConfigurationSummaryItems;
    final nextToken = this.nextToken;
    return {
      if (indexConfigurationSummaryItems != null)
        'IndexConfigurationSummaryItems': indexConfigurationSummaryItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListQuerySuggestionsBlockListsResponse {
  /// Summary items for a block list.
  ///
  /// This includes summary items on the block list ID, block list name, when the
  /// block list was created, when the block list was last updated, and the count
  /// of block words/phrases in the block list.
  ///
  /// For information on the current quota limits for block lists, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas for
  /// Amazon Kendra</a>.
  final List<QuerySuggestionsBlockListSummary>? blockListSummaryItems;

  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of block lists.
  final String? nextToken;

  ListQuerySuggestionsBlockListsResponse({
    this.blockListSummaryItems,
    this.nextToken,
  });

  factory ListQuerySuggestionsBlockListsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListQuerySuggestionsBlockListsResponse(
      blockListSummaryItems: (json['BlockListSummaryItems'] as List?)
          ?.whereNotNull()
          .map((e) => QuerySuggestionsBlockListSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blockListSummaryItems = this.blockListSummaryItems;
    final nextToken = this.nextToken;
    return {
      if (blockListSummaryItems != null)
        'BlockListSummaryItems': blockListSummaryItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tags associated with the index, FAQ, or data source.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListThesauriResponse {
  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of thesauri.
  final String? nextToken;

  /// An array of summary information for one or more thesauruses.
  final List<ThesaurusSummary>? thesaurusSummaryItems;

  ListThesauriResponse({
    this.nextToken,
    this.thesaurusSummaryItems,
  });

  factory ListThesauriResponse.fromJson(Map<String, dynamic> json) {
    return ListThesauriResponse(
      nextToken: json['NextToken'] as String?,
      thesaurusSummaryItems: (json['ThesaurusSummaryItems'] as List?)
          ?.whereNotNull()
          .map((e) => ThesaurusSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final thesaurusSummaryItems = this.thesaurusSummaryItems;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (thesaurusSummaryItems != null)
        'ThesaurusSummaryItems': thesaurusSummaryItems,
    };
  }
}

enum Mode {
  enabled,
  learnOnly,
}

extension on Mode {
  String toValue() {
    switch (this) {
      case Mode.enabled:
        return 'ENABLED';
      case Mode.learnOnly:
        return 'LEARN_ONLY';
    }
  }
}

extension on String {
  Mode toMode() {
    switch (this) {
      case 'ENABLED':
        return Mode.enabled;
      case 'LEARN_ONLY':
        return Mode.learnOnly;
    }
    throw Exception('$this is not known in enum Mode');
  }
}

/// Provides configuration information for data sources that connect to
/// OneDrive.
class OneDriveConfiguration {
  /// A list of user accounts whose documents should be indexed.
  final OneDriveUsers oneDriveUsers;

  /// The Amazon Resource Name (ARN) of an AWS Secrets Manager secret that
  /// contains the user name and password to connect to OneDrive. The user namd
  /// should be the application ID for the OneDrive application, and the password
  /// is the application key for the OneDrive application.
  final String secretArn;

  /// The Azure Active Directory domain of the organization.
  final String tenantDomain;

  /// A Boolean value that specifies whether local groups are disabled
  /// (<code>True</code>) or enabled (<code>False</code>).
  final bool? disableLocalGroups;

  /// List of regular expressions applied to documents. Items that match the
  /// exclusion pattern are not indexed. If you provide both an inclusion pattern
  /// and an exclusion pattern, any item that matches the exclusion pattern isn't
  /// indexed.
  ///
  /// The exclusion pattern is applied to the file name.
  final List<String>? exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// Microsoft OneDrive fields to custom fields in the Amazon Kendra index. You
  /// must first create the index fields before you map OneDrive fields.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns. Documents that match the pattern are
  /// included in the index. Documents that don't match the pattern are excluded
  /// from the index. If a document matches both an inclusion pattern and an
  /// exclusion pattern, the document is not included in the index.
  ///
  /// The exclusion pattern is applied to the file name.
  final List<String>? inclusionPatterns;

  OneDriveConfiguration({
    required this.oneDriveUsers,
    required this.secretArn,
    required this.tenantDomain,
    this.disableLocalGroups,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
  });

  factory OneDriveConfiguration.fromJson(Map<String, dynamic> json) {
    return OneDriveConfiguration(
      oneDriveUsers:
          OneDriveUsers.fromJson(json['OneDriveUsers'] as Map<String, dynamic>),
      secretArn: json['SecretArn'] as String,
      tenantDomain: json['TenantDomain'] as String,
      disableLocalGroups: json['DisableLocalGroups'] as bool?,
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final oneDriveUsers = this.oneDriveUsers;
    final secretArn = this.secretArn;
    final tenantDomain = this.tenantDomain;
    final disableLocalGroups = this.disableLocalGroups;
    final exclusionPatterns = this.exclusionPatterns;
    final fieldMappings = this.fieldMappings;
    final inclusionPatterns = this.inclusionPatterns;
    return {
      'OneDriveUsers': oneDriveUsers,
      'SecretArn': secretArn,
      'TenantDomain': tenantDomain,
      if (disableLocalGroups != null) 'DisableLocalGroups': disableLocalGroups,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
    };
  }
}

/// User accounts whose documents should be indexed.
class OneDriveUsers {
  /// A list of users whose documents should be indexed. Specify the user names in
  /// email format, for example, <code>username@tenantdomain</code>. If you need
  /// to index the documents of more than 100 users, use the
  /// <code>OneDriveUserS3Path</code> field to specify the location of a file
  /// containing a list of users.
  final List<String>? oneDriveUserList;

  /// The S3 bucket location of a file containing a list of users whose documents
  /// should be indexed.
  final S3Path? oneDriveUserS3Path;

  OneDriveUsers({
    this.oneDriveUserList,
    this.oneDriveUserS3Path,
  });

  factory OneDriveUsers.fromJson(Map<String, dynamic> json) {
    return OneDriveUsers(
      oneDriveUserList: (json['OneDriveUserList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      oneDriveUserS3Path: json['OneDriveUserS3Path'] != null
          ? S3Path.fromJson(json['OneDriveUserS3Path'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final oneDriveUserList = this.oneDriveUserList;
    final oneDriveUserS3Path = this.oneDriveUserS3Path;
    return {
      if (oneDriveUserList != null) 'OneDriveUserList': oneDriveUserList,
      if (oneDriveUserS3Path != null) 'OneDriveUserS3Path': oneDriveUserS3Path,
    };
  }
}

enum Order {
  ascending,
  descending,
}

extension on Order {
  String toValue() {
    switch (this) {
      case Order.ascending:
        return 'ASCENDING';
      case Order.descending:
        return 'DESCENDING';
    }
  }
}

extension on String {
  Order toOrder() {
    switch (this) {
      case 'ASCENDING':
        return Order.ascending;
      case 'DESCENDING':
        return Order.descending;
    }
    throw Exception('$this is not known in enum Order');
  }
}

/// Provides user and group information for document access filtering.
class Principal {
  /// Whether to allow or deny access to the principal.
  final ReadAccessType access;

  /// The name of the user or group.
  final String name;

  /// The type of principal.
  final PrincipalType type;

  Principal({
    required this.access,
    required this.name,
    required this.type,
  });

  factory Principal.fromJson(Map<String, dynamic> json) {
    return Principal(
      access: (json['Access'] as String).toReadAccessType(),
      name: json['Name'] as String,
      type: (json['Type'] as String).toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final access = this.access;
    final name = this.name;
    final type = this.type;
    return {
      'Access': access.toValue(),
      'Name': name,
      'Type': type.toValue(),
    };
  }
}

enum PrincipalType {
  user,
  group,
}

extension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.user:
        return 'USER';
      case PrincipalType.group:
        return 'GROUP';
    }
  }
}

extension on String {
  PrincipalType toPrincipalType() {
    switch (this) {
      case 'USER':
        return PrincipalType.user;
      case 'GROUP':
        return PrincipalType.group;
    }
    throw Exception('$this is not known in enum PrincipalType');
  }
}

/// Provides the configuration information for a web proxy to connect to website
/// hosts.
class ProxyConfiguration {
  /// The name of the website host you want to connect to via a web proxy server.
  ///
  /// For example, the host name of https://a.example.com/page1.html is
  /// "a.example.com".
  final String host;

  /// The port number of the website host you want to connect to via a web proxy
  /// server.
  ///
  /// For example, the port for https://a.example.com/page1.html is 443, the
  /// standard port for HTTPS.
  final int port;

  /// Your secret ARN, which you can create in <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">AWS
  /// Secrets Manager</a>
  ///
  /// The credentials are optional. You use a secret if web proxy credentials are
  /// required to connect to a website host. Amazon Kendra currently support basic
  /// authentication to connect to a web proxy server. The secret stores your
  /// credentials.
  final String? credentials;

  ProxyConfiguration({
    required this.host,
    required this.port,
    this.credentials,
  });

  factory ProxyConfiguration.fromJson(Map<String, dynamic> json) {
    return ProxyConfiguration(
      host: json['Host'] as String,
      port: json['Port'] as int,
      credentials: json['Credentials'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final host = this.host;
    final port = this.port;
    final credentials = this.credentials;
    return {
      'Host': host,
      'Port': port,
      if (credentials != null) 'Credentials': credentials,
    };
  }
}

enum QueryIdentifiersEnclosingOption {
  doubleQuotes,
  none,
}

extension on QueryIdentifiersEnclosingOption {
  String toValue() {
    switch (this) {
      case QueryIdentifiersEnclosingOption.doubleQuotes:
        return 'DOUBLE_QUOTES';
      case QueryIdentifiersEnclosingOption.none:
        return 'NONE';
    }
  }
}

extension on String {
  QueryIdentifiersEnclosingOption toQueryIdentifiersEnclosingOption() {
    switch (this) {
      case 'DOUBLE_QUOTES':
        return QueryIdentifiersEnclosingOption.doubleQuotes;
      case 'NONE':
        return QueryIdentifiersEnclosingOption.none;
    }
    throw Exception(
        '$this is not known in enum QueryIdentifiersEnclosingOption');
  }
}

class QueryResult {
  /// Contains the facet results. A <code>FacetResult</code> contains the counts
  /// for each attribute key that was specified in the <code>Facets</code> input
  /// parameter.
  final List<FacetResult>? facetResults;

  /// The unique identifier for the search. You use <code>QueryId</code> to
  /// identify the search when using the feedback API.
  final String? queryId;

  /// The results of the search.
  final List<QueryResultItem>? resultItems;

  /// The total number of items found by the search; however, you can only
  /// retrieve up to 100 items. For example, if the search found 192 items, you
  /// can only retrieve the first 100 of the items.
  final int? totalNumberOfResults;

  QueryResult({
    this.facetResults,
    this.queryId,
    this.resultItems,
    this.totalNumberOfResults,
  });

  factory QueryResult.fromJson(Map<String, dynamic> json) {
    return QueryResult(
      facetResults: (json['FacetResults'] as List?)
          ?.whereNotNull()
          .map((e) => FacetResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryId: json['QueryId'] as String?,
      resultItems: (json['ResultItems'] as List?)
          ?.whereNotNull()
          .map((e) => QueryResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalNumberOfResults: json['TotalNumberOfResults'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final facetResults = this.facetResults;
    final queryId = this.queryId;
    final resultItems = this.resultItems;
    final totalNumberOfResults = this.totalNumberOfResults;
    return {
      if (facetResults != null) 'FacetResults': facetResults,
      if (queryId != null) 'QueryId': queryId,
      if (resultItems != null) 'ResultItems': resultItems,
      if (totalNumberOfResults != null)
        'TotalNumberOfResults': totalNumberOfResults,
    };
  }
}

/// A single query result.
///
/// A query result contains information about a document returned by the query.
/// This includes the original location of the document, a list of attributes
/// assigned to the document, and relevant text from the document that satisfies
/// the query.
class QueryResultItem {
  /// One or more additional attributes associated with the query result.
  final List<AdditionalResultAttribute>? additionalAttributes;

  /// An array of document attributes for the document that the query result maps
  /// to. For example, the document author (Author) or the source URI (SourceUri)
  /// of the document.
  final List<DocumentAttribute>? documentAttributes;

  /// An extract of the text in the document. Contains information about
  /// highlighting the relevant terms in the excerpt.
  final TextWithHighlights? documentExcerpt;

  /// The unique identifier for the document.
  final String? documentId;

  /// The title of the document. Contains the text of the title and information
  /// for highlighting the relevant terms in the title.
  final TextWithHighlights? documentTitle;

  /// The URI of the original location of the document.
  final String? documentURI;

  /// A token that identifies a particular result from a particular query. Use
  /// this token to provide click-through feedback for the result. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/submitting-feedback.html">
  /// Submitting feedback </a>.
  final String? feedbackToken;

  /// The unique identifier for the query result.
  final String? id;

  /// Indicates the confidence that Amazon Kendra has that a result matches the
  /// query that you provided. Each result is placed into a bin that indicates the
  /// confidence, <code>VERY_HIGH</code>, <code>HIGH</code>, <code>MEDIUM</code>
  /// and <code>LOW</code>. You can use the score to determine if a response meets
  /// the confidence needed for your application.
  ///
  /// The field is only set to <code>LOW</code> when the <code>Type</code> field
  /// is set to <code>DOCUMENT</code> and Amazon Kendra is not confident that the
  /// result matches the query.
  final ScoreAttributes? scoreAttributes;

  /// The type of document.
  final QueryResultType? type;

  QueryResultItem({
    this.additionalAttributes,
    this.documentAttributes,
    this.documentExcerpt,
    this.documentId,
    this.documentTitle,
    this.documentURI,
    this.feedbackToken,
    this.id,
    this.scoreAttributes,
    this.type,
  });

  factory QueryResultItem.fromJson(Map<String, dynamic> json) {
    return QueryResultItem(
      additionalAttributes: (json['AdditionalAttributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AdditionalResultAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentAttributes: (json['DocumentAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentExcerpt: json['DocumentExcerpt'] != null
          ? TextWithHighlights.fromJson(
              json['DocumentExcerpt'] as Map<String, dynamic>)
          : null,
      documentId: json['DocumentId'] as String?,
      documentTitle: json['DocumentTitle'] != null
          ? TextWithHighlights.fromJson(
              json['DocumentTitle'] as Map<String, dynamic>)
          : null,
      documentURI: json['DocumentURI'] as String?,
      feedbackToken: json['FeedbackToken'] as String?,
      id: json['Id'] as String?,
      scoreAttributes: json['ScoreAttributes'] != null
          ? ScoreAttributes.fromJson(
              json['ScoreAttributes'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toQueryResultType(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalAttributes = this.additionalAttributes;
    final documentAttributes = this.documentAttributes;
    final documentExcerpt = this.documentExcerpt;
    final documentId = this.documentId;
    final documentTitle = this.documentTitle;
    final documentURI = this.documentURI;
    final feedbackToken = this.feedbackToken;
    final id = this.id;
    final scoreAttributes = this.scoreAttributes;
    final type = this.type;
    return {
      if (additionalAttributes != null)
        'AdditionalAttributes': additionalAttributes,
      if (documentAttributes != null) 'DocumentAttributes': documentAttributes,
      if (documentExcerpt != null) 'DocumentExcerpt': documentExcerpt,
      if (documentId != null) 'DocumentId': documentId,
      if (documentTitle != null) 'DocumentTitle': documentTitle,
      if (documentURI != null) 'DocumentURI': documentURI,
      if (feedbackToken != null) 'FeedbackToken': feedbackToken,
      if (id != null) 'Id': id,
      if (scoreAttributes != null) 'ScoreAttributes': scoreAttributes,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum QueryResultType {
  document,
  questionAnswer,
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
  }
}

extension on String {
  QueryResultType toQueryResultType() {
    switch (this) {
      case 'DOCUMENT':
        return QueryResultType.document;
      case 'QUESTION_ANSWER':
        return QueryResultType.questionAnswer;
      case 'ANSWER':
        return QueryResultType.answer;
    }
    throw Exception('$this is not known in enum QueryResultType');
  }
}

enum QuerySuggestionsBlockListStatus {
  active,
  creating,
  deleting,
  updating,
  activeButUpdateFailed,
  failed,
}

extension on QuerySuggestionsBlockListStatus {
  String toValue() {
    switch (this) {
      case QuerySuggestionsBlockListStatus.active:
        return 'ACTIVE';
      case QuerySuggestionsBlockListStatus.creating:
        return 'CREATING';
      case QuerySuggestionsBlockListStatus.deleting:
        return 'DELETING';
      case QuerySuggestionsBlockListStatus.updating:
        return 'UPDATING';
      case QuerySuggestionsBlockListStatus.activeButUpdateFailed:
        return 'ACTIVE_BUT_UPDATE_FAILED';
      case QuerySuggestionsBlockListStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  QuerySuggestionsBlockListStatus toQuerySuggestionsBlockListStatus() {
    switch (this) {
      case 'ACTIVE':
        return QuerySuggestionsBlockListStatus.active;
      case 'CREATING':
        return QuerySuggestionsBlockListStatus.creating;
      case 'DELETING':
        return QuerySuggestionsBlockListStatus.deleting;
      case 'UPDATING':
        return QuerySuggestionsBlockListStatus.updating;
      case 'ACTIVE_BUT_UPDATE_FAILED':
        return QuerySuggestionsBlockListStatus.activeButUpdateFailed;
      case 'FAILED':
        return QuerySuggestionsBlockListStatus.failed;
    }
    throw Exception(
        '$this is not known in enum QuerySuggestionsBlockListStatus');
  }
}

/// Summary information on a query suggestions block list.
///
/// This includes information on the block list ID, block list name, when the
/// block list was created, when the block list was last updated, and the count
/// of block words/phrases in the block list.
///
/// For information on the current quota limits for block lists, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas for
/// Amazon Kendra</a>.
class QuerySuggestionsBlockListSummary {
  /// The date-time summary information for a query suggestions block list was
  /// last created.
  final DateTime? createdAt;

  /// The identifier of a block list.
  final String? id;

  /// The number of items in the block list file.
  final int? itemCount;

  /// The name of the block list.
  final String? name;

  /// The status of the block list.
  final QuerySuggestionsBlockListStatus? status;

  /// The date-time the block list was last updated.
  final DateTime? updatedAt;

  QuerySuggestionsBlockListSummary({
    this.createdAt,
    this.id,
    this.itemCount,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory QuerySuggestionsBlockListSummary.fromJson(Map<String, dynamic> json) {
    return QuerySuggestionsBlockListSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
      itemCount: json['ItemCount'] as int?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toQuerySuggestionsBlockListStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final itemCount = this.itemCount;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
      if (itemCount != null) 'ItemCount': itemCount,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

enum QuerySuggestionsStatus {
  active,
  updating,
}

extension on QuerySuggestionsStatus {
  String toValue() {
    switch (this) {
      case QuerySuggestionsStatus.active:
        return 'ACTIVE';
      case QuerySuggestionsStatus.updating:
        return 'UPDATING';
    }
  }
}

extension on String {
  QuerySuggestionsStatus toQuerySuggestionsStatus() {
    switch (this) {
      case 'ACTIVE':
        return QuerySuggestionsStatus.active;
      case 'UPDATING':
        return QuerySuggestionsStatus.updating;
    }
    throw Exception('$this is not known in enum QuerySuggestionsStatus');
  }
}

enum ReadAccessType {
  allow,
  deny,
}

extension on ReadAccessType {
  String toValue() {
    switch (this) {
      case ReadAccessType.allow:
        return 'ALLOW';
      case ReadAccessType.deny:
        return 'DENY';
    }
  }
}

extension on String {
  ReadAccessType toReadAccessType() {
    switch (this) {
      case 'ALLOW':
        return ReadAccessType.allow;
      case 'DENY':
        return ReadAccessType.deny;
    }
    throw Exception('$this is not known in enum ReadAccessType');
  }
}

/// Provides information for manually tuning the relevance of a field in a
/// search. When a query includes terms that match the field, the results are
/// given a boost in the response based on these tuning parameters.
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
  final String? duration;

  /// Indicates that this field determines how "fresh" a document is. For example,
  /// if document 1 was created on November 5, and document 2 was created on
  /// October 31, document 1 is "fresher" than document 2. You can only set the
  /// <code>Freshness</code> field on one <code>DATE</code> type field. Only
  /// applies to <code>DATE</code> fields.
  final bool? freshness;

  /// The relative importance of the field in the search. Larger numbers provide
  /// more of a boost than smaller numbers.
  final int? importance;

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
  final Order? rankOrder;

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
  final Map<String, int>? valueImportanceMap;

  Relevance({
    this.duration,
    this.freshness,
    this.importance,
    this.rankOrder,
    this.valueImportanceMap,
  });

  factory Relevance.fromJson(Map<String, dynamic> json) {
    return Relevance(
      duration: json['Duration'] as String?,
      freshness: json['Freshness'] as bool?,
      importance: json['Importance'] as int?,
      rankOrder: (json['RankOrder'] as String?)?.toOrder(),
      valueImportanceMap: (json['ValueImportanceMap'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final freshness = this.freshness;
    final importance = this.importance;
    final rankOrder = this.rankOrder;
    final valueImportanceMap = this.valueImportanceMap;
    return {
      if (duration != null) 'Duration': duration,
      if (freshness != null) 'Freshness': freshness,
      if (importance != null) 'Importance': importance,
      if (rankOrder != null) 'RankOrder': rankOrder.toValue(),
      if (valueImportanceMap != null) 'ValueImportanceMap': valueImportanceMap,
    };
  }
}

/// Provides feedback on how relevant a document is to a search. Your
/// application uses the <code>SubmitFeedback</code> operation to provide
/// relevance information.
class RelevanceFeedback {
  /// Whether to document was relevant or not relevant to the search.
  final RelevanceType relevanceValue;

  /// The unique identifier of the search result that the user provided relevance
  /// feedback for.
  final String resultId;

  RelevanceFeedback({
    required this.relevanceValue,
    required this.resultId,
  });

  factory RelevanceFeedback.fromJson(Map<String, dynamic> json) {
    return RelevanceFeedback(
      relevanceValue: (json['RelevanceValue'] as String).toRelevanceType(),
      resultId: json['ResultId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final relevanceValue = this.relevanceValue;
    final resultId = this.resultId;
    return {
      'RelevanceValue': relevanceValue.toValue(),
      'ResultId': resultId,
    };
  }
}

enum RelevanceType {
  relevant,
  notRelevant,
}

extension on RelevanceType {
  String toValue() {
    switch (this) {
      case RelevanceType.relevant:
        return 'RELEVANT';
      case RelevanceType.notRelevant:
        return 'NOT_RELEVANT';
    }
  }
}

extension on String {
  RelevanceType toRelevanceType() {
    switch (this) {
      case 'RELEVANT':
        return RelevanceType.relevant;
      case 'NOT_RELEVANT':
        return RelevanceType.notRelevant;
    }
    throw Exception('$this is not known in enum RelevanceType');
  }
}

/// Provides configuration information for a data source to index documents in
/// an Amazon S3 bucket.
class S3DataSourceConfiguration {
  /// The name of the bucket that contains the documents.
  final String bucketName;

  /// Provides the path to the S3 bucket that contains the user context filtering
  /// files for the data source. For the format of the file, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html">Access
  /// control for S3 data sources</a>.
  final AccessControlListConfiguration? accessControlListConfiguration;
  final DocumentsMetadataConfiguration? documentsMetadataConfiguration;

  /// A list of glob patterns for documents that should not be indexed. If a
  /// document that matches an inclusion prefix or inclusion pattern also matches
  /// an exclusion pattern, the document is not indexed.
  ///
  /// Some <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/s3/#use-of-exclude-and-include-filters">examples</a>
  /// are:
  ///
  /// <ul>
  /// <li>
  /// <i>*.png , *.jpg</i> will exclude all PNG and JPEG image files in a
  /// directory (files with the extensions .png and .jpg).
  /// </li>
  /// <li>
  /// <i>*internal*</i> will exclude all files in a directory that contain
  /// 'internal' in the file name, such as 'internal', 'internal_only',
  /// 'company_internal'.
  /// </li>
  /// <li>
  /// <i>**/*internal*</i> will exclude all internal-related files in a directory
  /// and its subdirectories.
  /// </li>
  /// </ul>
  final List<String>? exclusionPatterns;

  /// A list of glob patterns for documents that should be indexed. If a document
  /// that matches an inclusion pattern also matches an exclusion pattern, the
  /// document is not indexed.
  ///
  /// Some <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/s3/#use-of-exclude-and-include-filters">examples</a>
  /// are:
  ///
  /// <ul>
  /// <li>
  /// <i>*.txt</i> will include all text files in a directory (files with the
  /// extension .txt).
  /// </li>
  /// <li>
  /// <i>**/*.txt</i> will include all text files in a directory and its
  /// subdirectories.
  /// </li>
  /// <li>
  /// <i>*tax*</i> will include all files in a directory that contain 'tax' in the
  /// file name, such as 'tax', 'taxes', 'income_tax'.
  /// </li>
  /// </ul>
  final List<String>? inclusionPatterns;

  /// A list of S3 prefixes for the documents that should be included in the
  /// index.
  final List<String>? inclusionPrefixes;

  S3DataSourceConfiguration({
    required this.bucketName,
    this.accessControlListConfiguration,
    this.documentsMetadataConfiguration,
    this.exclusionPatterns,
    this.inclusionPatterns,
    this.inclusionPrefixes,
  });

  factory S3DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DataSourceConfiguration(
      bucketName: json['BucketName'] as String,
      accessControlListConfiguration: json['AccessControlListConfiguration'] !=
              null
          ? AccessControlListConfiguration.fromJson(
              json['AccessControlListConfiguration'] as Map<String, dynamic>)
          : null,
      documentsMetadataConfiguration: json['DocumentsMetadataConfiguration'] !=
              null
          ? DocumentsMetadataConfiguration.fromJson(
              json['DocumentsMetadataConfiguration'] as Map<String, dynamic>)
          : null,
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inclusionPrefixes: (json['InclusionPrefixes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final accessControlListConfiguration = this.accessControlListConfiguration;
    final documentsMetadataConfiguration = this.documentsMetadataConfiguration;
    final exclusionPatterns = this.exclusionPatterns;
    final inclusionPatterns = this.inclusionPatterns;
    final inclusionPrefixes = this.inclusionPrefixes;
    return {
      'BucketName': bucketName,
      if (accessControlListConfiguration != null)
        'AccessControlListConfiguration': accessControlListConfiguration,
      if (documentsMetadataConfiguration != null)
        'DocumentsMetadataConfiguration': documentsMetadataConfiguration,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (inclusionPrefixes != null) 'InclusionPrefixes': inclusionPrefixes,
    };
  }
}

/// Information required to find a specific file in an Amazon S3 bucket.
class S3Path {
  /// The name of the S3 bucket that contains the file.
  final String bucket;

  /// The name of the file.
  final String key;

  S3Path({
    required this.bucket,
    required this.key,
  });

  factory S3Path.fromJson(Map<String, dynamic> json) {
    return S3Path(
      bucket: json['Bucket'] as String,
      key: json['Key'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      'Bucket': bucket,
      'Key': key,
    };
  }
}

/// Defines configuration for syncing a Salesforce chatter feed. The contents of
/// the object comes from the Salesforce FeedItem table.
class SalesforceChatterFeedConfiguration {
  /// The name of the column in the Salesforce FeedItem table that contains the
  /// content to index. Typically this is the <code>Body</code> column.
  final String documentDataFieldName;

  /// The name of the column in the Salesforce FeedItem table that contains the
  /// title of the document. This is typically the <code>Title</code> column.
  final String? documentTitleFieldName;

  /// Maps fields from a Salesforce chatter feed into Amazon Kendra index fields.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// Filters the documents in the feed based on status of the user. When you
  /// specify <code>ACTIVE_USERS</code> only documents from users who have an
  /// active account are indexed. When you specify <code>STANDARD_USER</code> only
  /// documents for Salesforce standard users are documented. You can specify
  /// both.
  final List<SalesforceChatterFeedIncludeFilterType>? includeFilterTypes;

  SalesforceChatterFeedConfiguration({
    required this.documentDataFieldName,
    this.documentTitleFieldName,
    this.fieldMappings,
    this.includeFilterTypes,
  });

  factory SalesforceChatterFeedConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SalesforceChatterFeedConfiguration(
      documentDataFieldName: json['DocumentDataFieldName'] as String,
      documentTitleFieldName: json['DocumentTitleFieldName'] as String?,
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      includeFilterTypes: (json['IncludeFilterTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSalesforceChatterFeedIncludeFilterType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDataFieldName = this.documentDataFieldName;
    final documentTitleFieldName = this.documentTitleFieldName;
    final fieldMappings = this.fieldMappings;
    final includeFilterTypes = this.includeFilterTypes;
    return {
      'DocumentDataFieldName': documentDataFieldName,
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (includeFilterTypes != null)
        'IncludeFilterTypes':
            includeFilterTypes.map((e) => e.toValue()).toList(),
    };
  }
}

enum SalesforceChatterFeedIncludeFilterType {
  activeUser,
  standardUser,
}

extension on SalesforceChatterFeedIncludeFilterType {
  String toValue() {
    switch (this) {
      case SalesforceChatterFeedIncludeFilterType.activeUser:
        return 'ACTIVE_USER';
      case SalesforceChatterFeedIncludeFilterType.standardUser:
        return 'STANDARD_USER';
    }
  }
}

extension on String {
  SalesforceChatterFeedIncludeFilterType
      toSalesforceChatterFeedIncludeFilterType() {
    switch (this) {
      case 'ACTIVE_USER':
        return SalesforceChatterFeedIncludeFilterType.activeUser;
      case 'STANDARD_USER':
        return SalesforceChatterFeedIncludeFilterType.standardUser;
    }
    throw Exception(
        '$this is not known in enum SalesforceChatterFeedIncludeFilterType');
  }
}

/// Provides configuration information for connecting to a Salesforce data
/// source.
class SalesforceConfiguration {
  /// The Amazon Resource Name (ARN) of an AWS Secrets Manager secret that
  /// contains the key/value pairs required to connect to your Salesforce
  /// instance. The secret must contain a JSON structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// authenticationUrl - The OAUTH endpoint that Amazon Kendra connects to get an
  /// OAUTH token.
  /// </li>
  /// <li>
  /// consumerKey - The application public key generated when you created your
  /// Salesforce application.
  /// </li>
  /// <li>
  /// consumerSecret - The application private key generated when you created your
  /// Salesforce application.
  /// </li>
  /// <li>
  /// password - The password associated with the user logging in to the
  /// Salesforce instance.
  /// </li>
  /// <li>
  /// securityToken - The token associated with the user account logging in to the
  /// Salesforce instance.
  /// </li>
  /// <li>
  /// username - The user name of the user logging in to the Salesforce instance.
  /// </li>
  /// </ul>
  final String secretArn;

  /// The instance URL for the Salesforce site that you want to index.
  final String serverUrl;

  /// Specifies configuration information for Salesforce chatter feeds.
  final SalesforceChatterFeedConfiguration? chatterFeedConfiguration;

  /// Indicates whether Amazon Kendra should index attachments to Salesforce
  /// objects.
  final bool? crawlAttachments;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// excluded from the index. Documents that don't match the patterns are
  /// included in the index. If a document matches both an exclusion pattern and
  /// an inclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the name of the attached file.
  final List<String>? excludeAttachmentFilePatterns;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// included in the index. Documents that don't match the patterns are excluded
  /// from the index. If a document matches both an inclusion pattern and an
  /// exclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the name of the attached file.
  final List<String>? includeAttachmentFilePatterns;

  /// Specifies configuration information for the knowledge article types that
  /// Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and
  /// the standard fields of knowledge articles, or the custom fields of custom
  /// knowledge articles, but not both.
  final SalesforceKnowledgeArticleConfiguration? knowledgeArticleConfiguration;

  /// Provides configuration information for processing attachments to Salesforce
  /// standard objects.
  final SalesforceStandardObjectAttachmentConfiguration?
      standardObjectAttachmentConfiguration;

  /// Specifies the Salesforce standard objects that Amazon Kendra indexes.
  final List<SalesforceStandardObjectConfiguration>?
      standardObjectConfigurations;

  SalesforceConfiguration({
    required this.secretArn,
    required this.serverUrl,
    this.chatterFeedConfiguration,
    this.crawlAttachments,
    this.excludeAttachmentFilePatterns,
    this.includeAttachmentFilePatterns,
    this.knowledgeArticleConfiguration,
    this.standardObjectAttachmentConfiguration,
    this.standardObjectConfigurations,
  });

  factory SalesforceConfiguration.fromJson(Map<String, dynamic> json) {
    return SalesforceConfiguration(
      secretArn: json['SecretArn'] as String,
      serverUrl: json['ServerUrl'] as String,
      chatterFeedConfiguration: json['ChatterFeedConfiguration'] != null
          ? SalesforceChatterFeedConfiguration.fromJson(
              json['ChatterFeedConfiguration'] as Map<String, dynamic>)
          : null,
      crawlAttachments: json['CrawlAttachments'] as bool?,
      excludeAttachmentFilePatterns:
          (json['ExcludeAttachmentFilePatterns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      includeAttachmentFilePatterns:
          (json['IncludeAttachmentFilePatterns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      knowledgeArticleConfiguration:
          json['KnowledgeArticleConfiguration'] != null
              ? SalesforceKnowledgeArticleConfiguration.fromJson(
                  json['KnowledgeArticleConfiguration'] as Map<String, dynamic>)
              : null,
      standardObjectAttachmentConfiguration:
          json['StandardObjectAttachmentConfiguration'] != null
              ? SalesforceStandardObjectAttachmentConfiguration.fromJson(
                  json['StandardObjectAttachmentConfiguration']
                      as Map<String, dynamic>)
              : null,
      standardObjectConfigurations:
          (json['StandardObjectConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => SalesforceStandardObjectConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final serverUrl = this.serverUrl;
    final chatterFeedConfiguration = this.chatterFeedConfiguration;
    final crawlAttachments = this.crawlAttachments;
    final excludeAttachmentFilePatterns = this.excludeAttachmentFilePatterns;
    final includeAttachmentFilePatterns = this.includeAttachmentFilePatterns;
    final knowledgeArticleConfiguration = this.knowledgeArticleConfiguration;
    final standardObjectAttachmentConfiguration =
        this.standardObjectAttachmentConfiguration;
    final standardObjectConfigurations = this.standardObjectConfigurations;
    return {
      'SecretArn': secretArn,
      'ServerUrl': serverUrl,
      if (chatterFeedConfiguration != null)
        'ChatterFeedConfiguration': chatterFeedConfiguration,
      if (crawlAttachments != null) 'CrawlAttachments': crawlAttachments,
      if (excludeAttachmentFilePatterns != null)
        'ExcludeAttachmentFilePatterns': excludeAttachmentFilePatterns,
      if (includeAttachmentFilePatterns != null)
        'IncludeAttachmentFilePatterns': includeAttachmentFilePatterns,
      if (knowledgeArticleConfiguration != null)
        'KnowledgeArticleConfiguration': knowledgeArticleConfiguration,
      if (standardObjectAttachmentConfiguration != null)
        'StandardObjectAttachmentConfiguration':
            standardObjectAttachmentConfiguration,
      if (standardObjectConfigurations != null)
        'StandardObjectConfigurations': standardObjectConfigurations,
    };
  }
}

/// Provides configuration information for indexing Salesforce custom articles.
class SalesforceCustomKnowledgeArticleTypeConfiguration {
  /// The name of the field in the custom knowledge article that contains the
  /// document data to index.
  final String documentDataFieldName;

  /// The name of the configuration.
  final String name;

  /// The name of the field in the custom knowledge article that contains the
  /// document title.
  final String? documentTitleFieldName;

  /// One or more objects that map fields in the custom knowledge article to
  /// fields in the Amazon Kendra index.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  SalesforceCustomKnowledgeArticleTypeConfiguration({
    required this.documentDataFieldName,
    required this.name,
    this.documentTitleFieldName,
    this.fieldMappings,
  });

  factory SalesforceCustomKnowledgeArticleTypeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SalesforceCustomKnowledgeArticleTypeConfiguration(
      documentDataFieldName: json['DocumentDataFieldName'] as String,
      name: json['Name'] as String,
      documentTitleFieldName: json['DocumentTitleFieldName'] as String?,
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDataFieldName = this.documentDataFieldName;
    final name = this.name;
    final documentTitleFieldName = this.documentTitleFieldName;
    final fieldMappings = this.fieldMappings;
    return {
      'DocumentDataFieldName': documentDataFieldName,
      'Name': name,
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
    };
  }
}

/// Specifies configuration information for the knowledge article types that
/// Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and
/// the standard fields of knowledge articles, or the custom fields of custom
/// knowledge articles, but not both
class SalesforceKnowledgeArticleConfiguration {
  /// Specifies the document states that should be included when Amazon Kendra
  /// indexes knowledge articles. You must specify at least one state.
  final List<SalesforceKnowledgeArticleState> includedStates;

  /// Provides configuration information for custom Salesforce knowledge articles.
  final List<SalesforceCustomKnowledgeArticleTypeConfiguration>?
      customKnowledgeArticleTypeConfigurations;

  /// Provides configuration information for standard Salesforce knowledge
  /// articles.
  final SalesforceStandardKnowledgeArticleTypeConfiguration?
      standardKnowledgeArticleTypeConfiguration;

  SalesforceKnowledgeArticleConfiguration({
    required this.includedStates,
    this.customKnowledgeArticleTypeConfigurations,
    this.standardKnowledgeArticleTypeConfiguration,
  });

  factory SalesforceKnowledgeArticleConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SalesforceKnowledgeArticleConfiguration(
      includedStates: (json['IncludedStates'] as List)
          .whereNotNull()
          .map((e) => (e as String).toSalesforceKnowledgeArticleState())
          .toList(),
      customKnowledgeArticleTypeConfigurations:
          (json['CustomKnowledgeArticleTypeConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  SalesforceCustomKnowledgeArticleTypeConfiguration.fromJson(
                      e as Map<String, dynamic>))
              .toList(),
      standardKnowledgeArticleTypeConfiguration:
          json['StandardKnowledgeArticleTypeConfiguration'] != null
              ? SalesforceStandardKnowledgeArticleTypeConfiguration.fromJson(
                  json['StandardKnowledgeArticleTypeConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final includedStates = this.includedStates;
    final customKnowledgeArticleTypeConfigurations =
        this.customKnowledgeArticleTypeConfigurations;
    final standardKnowledgeArticleTypeConfiguration =
        this.standardKnowledgeArticleTypeConfiguration;
    return {
      'IncludedStates': includedStates.map((e) => e.toValue()).toList(),
      if (customKnowledgeArticleTypeConfigurations != null)
        'CustomKnowledgeArticleTypeConfigurations':
            customKnowledgeArticleTypeConfigurations,
      if (standardKnowledgeArticleTypeConfiguration != null)
        'StandardKnowledgeArticleTypeConfiguration':
            standardKnowledgeArticleTypeConfiguration,
    };
  }
}

enum SalesforceKnowledgeArticleState {
  draft,
  published,
  archived,
}

extension on SalesforceKnowledgeArticleState {
  String toValue() {
    switch (this) {
      case SalesforceKnowledgeArticleState.draft:
        return 'DRAFT';
      case SalesforceKnowledgeArticleState.published:
        return 'PUBLISHED';
      case SalesforceKnowledgeArticleState.archived:
        return 'ARCHIVED';
    }
  }
}

extension on String {
  SalesforceKnowledgeArticleState toSalesforceKnowledgeArticleState() {
    switch (this) {
      case 'DRAFT':
        return SalesforceKnowledgeArticleState.draft;
      case 'PUBLISHED':
        return SalesforceKnowledgeArticleState.published;
      case 'ARCHIVED':
        return SalesforceKnowledgeArticleState.archived;
    }
    throw Exception(
        '$this is not known in enum SalesforceKnowledgeArticleState');
  }
}

/// Provides configuration information for standard Salesforce knowledge
/// articles.
class SalesforceStandardKnowledgeArticleTypeConfiguration {
  /// The name of the field that contains the document data to index.
  final String documentDataFieldName;

  /// The name of the field that contains the document title.
  final String? documentTitleFieldName;

  /// One or more objects that map fields in the knowledge article to Amazon
  /// Kendra index fields. The index field must exist before you can map a
  /// Salesforce field to it.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  SalesforceStandardKnowledgeArticleTypeConfiguration({
    required this.documentDataFieldName,
    this.documentTitleFieldName,
    this.fieldMappings,
  });

  factory SalesforceStandardKnowledgeArticleTypeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SalesforceStandardKnowledgeArticleTypeConfiguration(
      documentDataFieldName: json['DocumentDataFieldName'] as String,
      documentTitleFieldName: json['DocumentTitleFieldName'] as String?,
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDataFieldName = this.documentDataFieldName;
    final documentTitleFieldName = this.documentTitleFieldName;
    final fieldMappings = this.fieldMappings;
    return {
      'DocumentDataFieldName': documentDataFieldName,
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
    };
  }
}

/// Provides configuration information for processing attachments to Salesforce
/// standard objects.
class SalesforceStandardObjectAttachmentConfiguration {
  /// The name of the field used for the document title.
  final String? documentTitleFieldName;

  /// One or more objects that map fields in attachments to Amazon Kendra index
  /// fields.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  SalesforceStandardObjectAttachmentConfiguration({
    this.documentTitleFieldName,
    this.fieldMappings,
  });

  factory SalesforceStandardObjectAttachmentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SalesforceStandardObjectAttachmentConfiguration(
      documentTitleFieldName: json['DocumentTitleFieldName'] as String?,
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentTitleFieldName = this.documentTitleFieldName;
    final fieldMappings = this.fieldMappings;
    return {
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
    };
  }
}

/// Specifies configuration information for indexing a single standard object.
class SalesforceStandardObjectConfiguration {
  /// The name of the field in the standard object table that contains the
  /// document contents.
  final String documentDataFieldName;

  /// The name of the standard object.
  final SalesforceStandardObjectName name;

  /// The name of the field in the standard object table that contains the
  /// document title.
  final String? documentTitleFieldName;

  /// One or more objects that map fields in the standard object to Amazon Kendra
  /// index fields. The index field must exist before you can map a Salesforce
  /// field to it.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  SalesforceStandardObjectConfiguration({
    required this.documentDataFieldName,
    required this.name,
    this.documentTitleFieldName,
    this.fieldMappings,
  });

  factory SalesforceStandardObjectConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SalesforceStandardObjectConfiguration(
      documentDataFieldName: json['DocumentDataFieldName'] as String,
      name: (json['Name'] as String).toSalesforceStandardObjectName(),
      documentTitleFieldName: json['DocumentTitleFieldName'] as String?,
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDataFieldName = this.documentDataFieldName;
    final name = this.name;
    final documentTitleFieldName = this.documentTitleFieldName;
    final fieldMappings = this.fieldMappings;
    return {
      'DocumentDataFieldName': documentDataFieldName,
      'Name': name.toValue(),
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
    };
  }
}

enum SalesforceStandardObjectName {
  account,
  campaign,
  $case,
  contact,
  contract,
  document,
  group,
  idea,
  lead,
  opportunity,
  partner,
  pricebook,
  product,
  profile,
  solution,
  task,
  user,
}

extension on SalesforceStandardObjectName {
  String toValue() {
    switch (this) {
      case SalesforceStandardObjectName.account:
        return 'ACCOUNT';
      case SalesforceStandardObjectName.campaign:
        return 'CAMPAIGN';
      case SalesforceStandardObjectName.$case:
        return 'CASE';
      case SalesforceStandardObjectName.contact:
        return 'CONTACT';
      case SalesforceStandardObjectName.contract:
        return 'CONTRACT';
      case SalesforceStandardObjectName.document:
        return 'DOCUMENT';
      case SalesforceStandardObjectName.group:
        return 'GROUP';
      case SalesforceStandardObjectName.idea:
        return 'IDEA';
      case SalesforceStandardObjectName.lead:
        return 'LEAD';
      case SalesforceStandardObjectName.opportunity:
        return 'OPPORTUNITY';
      case SalesforceStandardObjectName.partner:
        return 'PARTNER';
      case SalesforceStandardObjectName.pricebook:
        return 'PRICEBOOK';
      case SalesforceStandardObjectName.product:
        return 'PRODUCT';
      case SalesforceStandardObjectName.profile:
        return 'PROFILE';
      case SalesforceStandardObjectName.solution:
        return 'SOLUTION';
      case SalesforceStandardObjectName.task:
        return 'TASK';
      case SalesforceStandardObjectName.user:
        return 'USER';
    }
  }
}

extension on String {
  SalesforceStandardObjectName toSalesforceStandardObjectName() {
    switch (this) {
      case 'ACCOUNT':
        return SalesforceStandardObjectName.account;
      case 'CAMPAIGN':
        return SalesforceStandardObjectName.campaign;
      case 'CASE':
        return SalesforceStandardObjectName.$case;
      case 'CONTACT':
        return SalesforceStandardObjectName.contact;
      case 'CONTRACT':
        return SalesforceStandardObjectName.contract;
      case 'DOCUMENT':
        return SalesforceStandardObjectName.document;
      case 'GROUP':
        return SalesforceStandardObjectName.group;
      case 'IDEA':
        return SalesforceStandardObjectName.idea;
      case 'LEAD':
        return SalesforceStandardObjectName.lead;
      case 'OPPORTUNITY':
        return SalesforceStandardObjectName.opportunity;
      case 'PARTNER':
        return SalesforceStandardObjectName.partner;
      case 'PRICEBOOK':
        return SalesforceStandardObjectName.pricebook;
      case 'PRODUCT':
        return SalesforceStandardObjectName.product;
      case 'PROFILE':
        return SalesforceStandardObjectName.profile;
      case 'SOLUTION':
        return SalesforceStandardObjectName.solution;
      case 'TASK':
        return SalesforceStandardObjectName.task;
      case 'USER':
        return SalesforceStandardObjectName.user;
    }
    throw Exception('$this is not known in enum SalesforceStandardObjectName');
  }
}

/// Provides a relative ranking that indicates how confident Amazon Kendra is
/// that the response matches the query.
class ScoreAttributes {
  /// A relative ranking for how well the response matches the query.
  final ScoreConfidence? scoreConfidence;

  ScoreAttributes({
    this.scoreConfidence,
  });

  factory ScoreAttributes.fromJson(Map<String, dynamic> json) {
    return ScoreAttributes(
      scoreConfidence:
          (json['ScoreConfidence'] as String?)?.toScoreConfidence(),
    );
  }

  Map<String, dynamic> toJson() {
    final scoreConfidence = this.scoreConfidence;
    return {
      if (scoreConfidence != null) 'ScoreConfidence': scoreConfidence.toValue(),
    };
  }
}

/// Enumeration for query score confidence.
enum ScoreConfidence {
  veryHigh,
  high,
  medium,
  low,
}

extension on ScoreConfidence {
  String toValue() {
    switch (this) {
      case ScoreConfidence.veryHigh:
        return 'VERY_HIGH';
      case ScoreConfidence.high:
        return 'HIGH';
      case ScoreConfidence.medium:
        return 'MEDIUM';
      case ScoreConfidence.low:
        return 'LOW';
    }
  }
}

extension on String {
  ScoreConfidence toScoreConfidence() {
    switch (this) {
      case 'VERY_HIGH':
        return ScoreConfidence.veryHigh;
      case 'HIGH':
        return ScoreConfidence.high;
      case 'MEDIUM':
        return ScoreConfidence.medium;
      case 'LOW':
        return ScoreConfidence.low;
    }
    throw Exception('$this is not known in enum ScoreConfidence');
  }
}

/// Provides information about how a custom index field is used during a search.
class Search {
  /// Determines whether the field is returned in the query response. The default
  /// is <code>true</code>.
  final bool? displayable;

  /// Indicates that the field can be used to create search facets, a count of
  /// results for each value in the field. The default is <code>false</code> .
  final bool? facetable;

  /// Determines whether the field is used in the search. If the
  /// <code>Searchable</code> field is <code>true</code>, you can use relevance
  /// tuning to manually tune how Amazon Kendra weights the field in the search.
  /// The default is <code>true</code> for string fields and <code>false</code>
  /// for number and date fields.
  final bool? searchable;

  /// Determines whether the field can be used to sort the results of a query. If
  /// you specify sorting on a field that does not have <code>Sortable</code> set
  /// to <code>true</code>, Amazon Kendra returns an exception. The default is
  /// <code>false</code>.
  final bool? sortable;

  Search({
    this.displayable,
    this.facetable,
    this.searchable,
    this.sortable,
  });

  factory Search.fromJson(Map<String, dynamic> json) {
    return Search(
      displayable: json['Displayable'] as bool?,
      facetable: json['Facetable'] as bool?,
      searchable: json['Searchable'] as bool?,
      sortable: json['Sortable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final displayable = this.displayable;
    final facetable = this.facetable;
    final searchable = this.searchable;
    final sortable = this.sortable;
    return {
      if (displayable != null) 'Displayable': displayable,
      if (facetable != null) 'Facetable': facetable,
      if (searchable != null) 'Searchable': searchable,
      if (sortable != null) 'Sortable': sortable,
    };
  }
}

/// Provides the configuration information of the seed or starting point URLs to
/// crawl.
///
/// <i>When selecting websites to index, you must adhere to the <a
/// href="https://aws.amazon.com/aup/">Amazon Acceptable Use Policy</a> and all
/// other Amazon terms. Remember that you must only use the Amazon Kendra web
/// crawler to index your own webpages, or webpages that you have authorization
/// to index.</i>
class SeedUrlConfiguration {
  /// The list of seed or starting point URLs of the websites you want to crawl.
  ///
  /// The list can include a maximum of 100 seed URLs.
  final List<String> seedUrls;

  /// You can choose one of the following modes:
  ///
  /// <ul>
  /// <li>
  /// <code>HOST_ONLY</code> – crawl only the website host names. For example, if
  /// the seed URL is "abc.example.com", then only URLs with host name
  /// "abc.example.com" are crawled.
  /// </li>
  /// <li>
  /// <code>SUBDOMAINS</code> – crawl the website host names with subdomains. For
  /// example, if the seed URL is "abc.example.com", then "a.abc.example.com" and
  /// "b.abc.example.com" are also crawled.
  /// </li>
  /// <li>
  /// <code>EVERYTHING</code> – crawl the website host names with subdomains and
  /// other domains that the webpages link to.
  /// </li>
  /// </ul>
  /// The default mode is set to <code>HOST_ONLY</code>.
  final WebCrawlerMode? webCrawlerMode;

  SeedUrlConfiguration({
    required this.seedUrls,
    this.webCrawlerMode,
  });

  factory SeedUrlConfiguration.fromJson(Map<String, dynamic> json) {
    return SeedUrlConfiguration(
      seedUrls: (json['SeedUrls'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      webCrawlerMode: (json['WebCrawlerMode'] as String?)?.toWebCrawlerMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final seedUrls = this.seedUrls;
    final webCrawlerMode = this.webCrawlerMode;
    return {
      'SeedUrls': seedUrls,
      if (webCrawlerMode != null) 'WebCrawlerMode': webCrawlerMode.toValue(),
    };
  }
}

/// Provides the identifier of the AWS KMS customer master key (CMK) used to
/// encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support
/// asymmetric CMKs.
class ServerSideEncryptionConfiguration {
  /// The identifier of the AWS KMS customer master key (CMK). Amazon Kendra
  /// doesn't support asymmetric CMKs.
  final String? kmsKeyId;

  ServerSideEncryptionConfiguration({
    this.kmsKeyId,
  });

  factory ServerSideEncryptionConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServerSideEncryptionConfiguration(
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    return {
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

enum ServiceNowAuthenticationType {
  httpBasic,
  oauth2,
}

extension on ServiceNowAuthenticationType {
  String toValue() {
    switch (this) {
      case ServiceNowAuthenticationType.httpBasic:
        return 'HTTP_BASIC';
      case ServiceNowAuthenticationType.oauth2:
        return 'OAUTH2';
    }
  }
}

extension on String {
  ServiceNowAuthenticationType toServiceNowAuthenticationType() {
    switch (this) {
      case 'HTTP_BASIC':
        return ServiceNowAuthenticationType.httpBasic;
      case 'OAUTH2':
        return ServiceNowAuthenticationType.oauth2;
    }
    throw Exception('$this is not known in enum ServiceNowAuthenticationType');
  }
}

enum ServiceNowBuildVersionType {
  london,
  others,
}

extension on ServiceNowBuildVersionType {
  String toValue() {
    switch (this) {
      case ServiceNowBuildVersionType.london:
        return 'LONDON';
      case ServiceNowBuildVersionType.others:
        return 'OTHERS';
    }
  }
}

extension on String {
  ServiceNowBuildVersionType toServiceNowBuildVersionType() {
    switch (this) {
      case 'LONDON':
        return ServiceNowBuildVersionType.london;
      case 'OTHERS':
        return ServiceNowBuildVersionType.others;
    }
    throw Exception('$this is not known in enum ServiceNowBuildVersionType');
  }
}

/// Provides configuration information required to connect to a ServiceNow data
/// source.
class ServiceNowConfiguration {
  /// The ServiceNow instance that the data source connects to. The host endpoint
  /// should look like the following: <code>{instance}.service-now.com.</code>
  final String hostUrl;

  /// The Amazon Resource Name (ARN) of the AWS Secret Manager secret that
  /// contains the user name and password required to connect to the ServiceNow
  /// instance.
  final String secretArn;

  /// The identifier of the release that the ServiceNow host is running. If the
  /// host is not running the <code>LONDON</code> release, use
  /// <code>OTHERS</code>.
  final ServiceNowBuildVersionType serviceNowBuildVersion;

  /// Determines the type of authentication used to connect to the ServiceNow
  /// instance. If you choose <code>HTTP_BASIC</code>, Amazon Kendra is
  /// authenticated using the user name and password provided in the AWS Secrets
  /// Manager secret in the <code>SecretArn</code> field. When you choose
  /// <code>OAUTH2</code>, Amazon Kendra is authenticated using the OAuth token
  /// and secret provided in the Secrets Manager secret, and the user name and
  /// password are used to determine which information Amazon Kendra has access
  /// to.
  ///
  /// When you use <code>OAUTH2</code> authentication, you must generate a token
  /// and a client secret using the ServiceNow console. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-servicenow.html">Using
  /// a ServiceNow data source</a>.
  final ServiceNowAuthenticationType? authenticationType;

  /// Provides configuration information for crawling knowledge articles in the
  /// ServiceNow site.
  final ServiceNowKnowledgeArticleConfiguration? knowledgeArticleConfiguration;

  /// Provides configuration information for crawling service catalogs in the
  /// ServiceNow site.
  final ServiceNowServiceCatalogConfiguration? serviceCatalogConfiguration;

  ServiceNowConfiguration({
    required this.hostUrl,
    required this.secretArn,
    required this.serviceNowBuildVersion,
    this.authenticationType,
    this.knowledgeArticleConfiguration,
    this.serviceCatalogConfiguration,
  });

  factory ServiceNowConfiguration.fromJson(Map<String, dynamic> json) {
    return ServiceNowConfiguration(
      hostUrl: json['HostUrl'] as String,
      secretArn: json['SecretArn'] as String,
      serviceNowBuildVersion: (json['ServiceNowBuildVersion'] as String)
          .toServiceNowBuildVersionType(),
      authenticationType: (json['AuthenticationType'] as String?)
          ?.toServiceNowAuthenticationType(),
      knowledgeArticleConfiguration:
          json['KnowledgeArticleConfiguration'] != null
              ? ServiceNowKnowledgeArticleConfiguration.fromJson(
                  json['KnowledgeArticleConfiguration'] as Map<String, dynamic>)
              : null,
      serviceCatalogConfiguration: json['ServiceCatalogConfiguration'] != null
          ? ServiceNowServiceCatalogConfiguration.fromJson(
              json['ServiceCatalogConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hostUrl = this.hostUrl;
    final secretArn = this.secretArn;
    final serviceNowBuildVersion = this.serviceNowBuildVersion;
    final authenticationType = this.authenticationType;
    final knowledgeArticleConfiguration = this.knowledgeArticleConfiguration;
    final serviceCatalogConfiguration = this.serviceCatalogConfiguration;
    return {
      'HostUrl': hostUrl,
      'SecretArn': secretArn,
      'ServiceNowBuildVersion': serviceNowBuildVersion.toValue(),
      if (authenticationType != null)
        'AuthenticationType': authenticationType.toValue(),
      if (knowledgeArticleConfiguration != null)
        'KnowledgeArticleConfiguration': knowledgeArticleConfiguration,
      if (serviceCatalogConfiguration != null)
        'ServiceCatalogConfiguration': serviceCatalogConfiguration,
    };
  }
}

/// Provides configuration information for crawling knowledge articles in the
/// ServiceNow site.
class ServiceNowKnowledgeArticleConfiguration {
  /// The name of the ServiceNow field that is mapped to the index document
  /// contents field in the Amazon Kendra index.
  final String documentDataFieldName;

  /// Indicates whether Amazon Kendra should index attachments to knowledge
  /// articles.
  final bool? crawlAttachments;

  /// The name of the ServiceNow field that is mapped to the index document title
  /// field.
  final String? documentTitleFieldName;

  /// List of regular expressions applied to knowledge articles. Items that don't
  /// match the inclusion pattern are not indexed. The regex is applied to the
  /// field specified in the <code>PatternTargetField</code>
  final List<String>? excludeAttachmentFilePatterns;

  /// Mapping between ServiceNow fields and Amazon Kendra index fields. You must
  /// create the index field before you map the field.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A query that selects the knowledge articles to index. The query can return
  /// articles from multiple knowledge bases, and the knowledge bases can be
  /// public or private.
  ///
  /// The query string must be one generated by the ServiceNow console. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/servicenow-query.html">Specifying
  /// documents to index with a query</a>.
  final String? filterQuery;

  /// List of regular expressions applied to knowledge articles. Items that don't
  /// match the inclusion pattern are not indexed. The regex is applied to the
  /// field specified in the <code>PatternTargetField</code>.
  final List<String>? includeAttachmentFilePatterns;

  ServiceNowKnowledgeArticleConfiguration({
    required this.documentDataFieldName,
    this.crawlAttachments,
    this.documentTitleFieldName,
    this.excludeAttachmentFilePatterns,
    this.fieldMappings,
    this.filterQuery,
    this.includeAttachmentFilePatterns,
  });

  factory ServiceNowKnowledgeArticleConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServiceNowKnowledgeArticleConfiguration(
      documentDataFieldName: json['DocumentDataFieldName'] as String,
      crawlAttachments: json['CrawlAttachments'] as bool?,
      documentTitleFieldName: json['DocumentTitleFieldName'] as String?,
      excludeAttachmentFilePatterns:
          (json['ExcludeAttachmentFilePatterns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      filterQuery: json['FilterQuery'] as String?,
      includeAttachmentFilePatterns:
          (json['IncludeAttachmentFilePatterns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDataFieldName = this.documentDataFieldName;
    final crawlAttachments = this.crawlAttachments;
    final documentTitleFieldName = this.documentTitleFieldName;
    final excludeAttachmentFilePatterns = this.excludeAttachmentFilePatterns;
    final fieldMappings = this.fieldMappings;
    final filterQuery = this.filterQuery;
    final includeAttachmentFilePatterns = this.includeAttachmentFilePatterns;
    return {
      'DocumentDataFieldName': documentDataFieldName,
      if (crawlAttachments != null) 'CrawlAttachments': crawlAttachments,
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (excludeAttachmentFilePatterns != null)
        'ExcludeAttachmentFilePatterns': excludeAttachmentFilePatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (filterQuery != null) 'FilterQuery': filterQuery,
      if (includeAttachmentFilePatterns != null)
        'IncludeAttachmentFilePatterns': includeAttachmentFilePatterns,
    };
  }
}

/// Provides configuration information for crawling service catalog items in the
/// ServiceNow site
class ServiceNowServiceCatalogConfiguration {
  /// The name of the ServiceNow field that is mapped to the index document
  /// contents field in the Amazon Kendra index.
  final String documentDataFieldName;

  /// Indicates whether Amazon Kendra should crawl attachments to the service
  /// catalog items.
  final bool? crawlAttachments;

  /// The name of the ServiceNow field that is mapped to the index document title
  /// field.
  final String? documentTitleFieldName;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// excluded from the index. Documents that don't match the patterns are
  /// included in the index. If a document matches both an exclusion pattern and
  /// an inclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the file name of the attachment.
  final List<String>? excludeAttachmentFilePatterns;

  /// Mapping between ServiceNow fields and Amazon Kendra index fields. You must
  /// create the index field before you map the field.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// included in the index. Documents that don't match the patterns are excluded
  /// from the index. If a document matches both an exclusion pattern and an
  /// inclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the file name of the attachment.
  final List<String>? includeAttachmentFilePatterns;

  ServiceNowServiceCatalogConfiguration({
    required this.documentDataFieldName,
    this.crawlAttachments,
    this.documentTitleFieldName,
    this.excludeAttachmentFilePatterns,
    this.fieldMappings,
    this.includeAttachmentFilePatterns,
  });

  factory ServiceNowServiceCatalogConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServiceNowServiceCatalogConfiguration(
      documentDataFieldName: json['DocumentDataFieldName'] as String,
      crawlAttachments: json['CrawlAttachments'] as bool?,
      documentTitleFieldName: json['DocumentTitleFieldName'] as String?,
      excludeAttachmentFilePatterns:
          (json['ExcludeAttachmentFilePatterns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      includeAttachmentFilePatterns:
          (json['IncludeAttachmentFilePatterns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentDataFieldName = this.documentDataFieldName;
    final crawlAttachments = this.crawlAttachments;
    final documentTitleFieldName = this.documentTitleFieldName;
    final excludeAttachmentFilePatterns = this.excludeAttachmentFilePatterns;
    final fieldMappings = this.fieldMappings;
    final includeAttachmentFilePatterns = this.includeAttachmentFilePatterns;
    return {
      'DocumentDataFieldName': documentDataFieldName,
      if (crawlAttachments != null) 'CrawlAttachments': crawlAttachments,
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (excludeAttachmentFilePatterns != null)
        'ExcludeAttachmentFilePatterns': excludeAttachmentFilePatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (includeAttachmentFilePatterns != null)
        'IncludeAttachmentFilePatterns': includeAttachmentFilePatterns,
    };
  }
}

/// Provides configuration information for connecting to a Microsoft SharePoint
/// data source.
class SharePointConfiguration {
  /// The Amazon Resource Name (ARN) of credentials stored in AWS Secrets Manager.
  /// The credentials should be a user/password pair. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-sharepoint.html">Using
  /// a Microsoft SharePoint Data Source</a>. For more information about AWS
  /// Secrets Manager, see <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">
  /// What Is AWS Secrets Manager </a> in the <i>AWS Secrets Manager</i> user
  /// guide.
  final String secretArn;

  /// The version of Microsoft SharePoint that you are using as a data source.
  final SharePointVersion sharePointVersion;

  /// The URLs of the Microsoft SharePoint site that contains the documents that
  /// should be indexed.
  final List<String> urls;

  /// <code>TRUE</code> to include attachments to documents stored in your
  /// Microsoft SharePoint site in the index; otherwise, <code>FALSE</code>.
  final bool? crawlAttachments;

  /// A Boolean value that specifies whether local groups are disabled
  /// (<code>True</code>) or enabled (<code>False</code>).
  final bool? disableLocalGroups;

  /// The Microsoft SharePoint attribute field that contains the title of the
  /// document.
  final String? documentTitleFieldName;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// excluded from the index. Documents that don't match the patterns are
  /// included in the index. If a document matches both an exclusion pattern and
  /// an inclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the display URL of the SharePoint document.
  final List<String>? exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// Microsoft SharePoint attributes to custom fields in the Amazon Kendra index.
  /// You must first create the index fields using the <code>UpdateIndex</code>
  /// operation before you map SharePoint attributes. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// Data Source Fields</a>.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// included in the index. Documents that don't match the patterns are excluded
  /// from the index. If a document matches both an inclusion pattern and an
  /// exclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the display URL of the SharePoint document.
  final List<String>? inclusionPatterns;
  final S3Path? sslCertificateS3Path;

  /// Set to <code>TRUE</code> to use the Microsoft SharePoint change log to
  /// determine the documents that need to be updated in the index. Depending on
  /// the size of the SharePoint change log, it may take longer for Amazon Kendra
  /// to use the change log than it takes it to determine the changed documents
  /// using the Amazon Kendra document crawler.
  final bool? useChangeLog;
  final DataSourceVpcConfiguration? vpcConfiguration;

  SharePointConfiguration({
    required this.secretArn,
    required this.sharePointVersion,
    required this.urls,
    this.crawlAttachments,
    this.disableLocalGroups,
    this.documentTitleFieldName,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
    this.sslCertificateS3Path,
    this.useChangeLog,
    this.vpcConfiguration,
  });

  factory SharePointConfiguration.fromJson(Map<String, dynamic> json) {
    return SharePointConfiguration(
      secretArn: json['SecretArn'] as String,
      sharePointVersion:
          (json['SharePointVersion'] as String).toSharePointVersion(),
      urls: (json['Urls'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      crawlAttachments: json['CrawlAttachments'] as bool?,
      disableLocalGroups: json['DisableLocalGroups'] as bool?,
      documentTitleFieldName: json['DocumentTitleFieldName'] as String?,
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      fieldMappings: (json['FieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sslCertificateS3Path: json['SslCertificateS3Path'] != null
          ? S3Path.fromJson(
              json['SslCertificateS3Path'] as Map<String, dynamic>)
          : null,
      useChangeLog: json['UseChangeLog'] as bool?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final sharePointVersion = this.sharePointVersion;
    final urls = this.urls;
    final crawlAttachments = this.crawlAttachments;
    final disableLocalGroups = this.disableLocalGroups;
    final documentTitleFieldName = this.documentTitleFieldName;
    final exclusionPatterns = this.exclusionPatterns;
    final fieldMappings = this.fieldMappings;
    final inclusionPatterns = this.inclusionPatterns;
    final sslCertificateS3Path = this.sslCertificateS3Path;
    final useChangeLog = this.useChangeLog;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'SecretArn': secretArn,
      'SharePointVersion': sharePointVersion.toValue(),
      'Urls': urls,
      if (crawlAttachments != null) 'CrawlAttachments': crawlAttachments,
      if (disableLocalGroups != null) 'DisableLocalGroups': disableLocalGroups,
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (sslCertificateS3Path != null)
        'SslCertificateS3Path': sslCertificateS3Path,
      if (useChangeLog != null) 'UseChangeLog': useChangeLog,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

enum SharePointVersion {
  sharepoint_2013,
  sharepoint_2016,
  sharepointOnline,
}

extension on SharePointVersion {
  String toValue() {
    switch (this) {
      case SharePointVersion.sharepoint_2013:
        return 'SHAREPOINT_2013';
      case SharePointVersion.sharepoint_2016:
        return 'SHAREPOINT_2016';
      case SharePointVersion.sharepointOnline:
        return 'SHAREPOINT_ONLINE';
    }
  }
}

extension on String {
  SharePointVersion toSharePointVersion() {
    switch (this) {
      case 'SHAREPOINT_2013':
        return SharePointVersion.sharepoint_2013;
      case 'SHAREPOINT_2016':
        return SharePointVersion.sharepoint_2016;
      case 'SHAREPOINT_ONLINE':
        return SharePointVersion.sharepointOnline;
    }
    throw Exception('$this is not known in enum SharePointVersion');
  }
}

/// Provides the configuration information of the sitemap URLs to crawl.
///
/// <i>When selecting websites to index, you must adhere to the <a
/// href="https://aws.amazon.com/aup/">Amazon Acceptable Use Policy</a> and all
/// other Amazon terms. Remember that you must only use the Amazon Kendra web
/// crawler to index your own webpages, or webpages that you have authorization
/// to index.</i>
class SiteMapsConfiguration {
  /// The list of sitemap URLs of the websites you want to crawl.
  ///
  /// The list can include a maximum of three sitemap URLs.
  final List<String> siteMaps;

  SiteMapsConfiguration({
    required this.siteMaps,
  });

  factory SiteMapsConfiguration.fromJson(Map<String, dynamic> json) {
    return SiteMapsConfiguration(
      siteMaps: (json['SiteMaps'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final siteMaps = this.siteMaps;
    return {
      'SiteMaps': siteMaps,
    };
  }
}

enum SortOrder {
  desc,
  asc,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.desc:
        return 'DESC';
      case SortOrder.asc:
        return 'ASC';
    }
  }
}

extension on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'DESC':
        return SortOrder.desc;
      case 'ASC':
        return SortOrder.asc;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// Specifies the document attribute to use to sort the response to a Amazon
/// Kendra query. You can specify a single attribute for sorting. The attribute
/// must have the <code>Sortable</code> flag set to <code>true</code>, otherwise
/// Amazon Kendra returns an exception.
///
/// You can sort attributes of the following types.
///
/// <ul>
/// <li>
/// Date value
/// </li>
/// <li>
/// Long value
/// </li>
/// <li>
/// String value
/// </li>
/// </ul>
/// You can't sort attributes of the following type.
///
/// <ul>
/// <li>
/// String list value
/// </li>
/// </ul>
class SortingConfiguration {
  /// The name of the document attribute used to sort the response. You can use
  /// any field that has the <code>Sortable</code> flag set to true.
  ///
  /// You can also sort by any of the following built-in attributes:
  ///
  /// <ul>
  /// <li>
  /// _category
  /// </li>
  /// <li>
  /// _created_at
  /// </li>
  /// <li>
  /// _last_updated_at
  /// </li>
  /// <li>
  /// _version
  /// </li>
  /// <li>
  /// _view_count
  /// </li>
  /// </ul>
  final String documentAttributeKey;

  /// The order that the results should be returned in. In case of ties, the
  /// relevance assigned to the result by Amazon Kendra is used as the
  /// tie-breaker.
  final SortOrder sortOrder;

  SortingConfiguration({
    required this.documentAttributeKey,
    required this.sortOrder,
  });

  factory SortingConfiguration.fromJson(Map<String, dynamic> json) {
    return SortingConfiguration(
      documentAttributeKey: json['DocumentAttributeKey'] as String,
      sortOrder: (json['SortOrder'] as String).toSortOrder(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentAttributeKey = this.documentAttributeKey;
    final sortOrder = this.sortOrder;
    return {
      'DocumentAttributeKey': documentAttributeKey,
      'SortOrder': sortOrder.toValue(),
    };
  }
}

/// Provides information that configures Amazon Kendra to use a SQL database.
class SqlConfiguration {
  /// Determines whether Amazon Kendra encloses SQL identifiers for tables and
  /// column names in double quotes (") when making a database query.
  ///
  /// By default, Amazon Kendra passes SQL identifiers the way that they are
  /// entered into the data source configuration. It does not change the case of
  /// identifiers or enclose them in quotes.
  ///
  /// PostgreSQL internally converts uppercase characters to lower case characters
  /// in identifiers unless they are quoted. Choosing this option encloses
  /// identifiers in quotes so that PostgreSQL does not convert the character's
  /// case.
  ///
  /// For MySQL databases, you must enable the <code>ansi_quotes</code> option
  /// when you set this field to <code>DOUBLE_QUOTES</code>.
  final QueryIdentifiersEnclosingOption? queryIdentifiersEnclosingOption;

  SqlConfiguration({
    this.queryIdentifiersEnclosingOption,
  });

  factory SqlConfiguration.fromJson(Map<String, dynamic> json) {
    return SqlConfiguration(
      queryIdentifiersEnclosingOption:
          (json['QueryIdentifiersEnclosingOption'] as String?)
              ?.toQueryIdentifiersEnclosingOption(),
    );
  }

  Map<String, dynamic> toJson() {
    final queryIdentifiersEnclosingOption =
        this.queryIdentifiersEnclosingOption;
    return {
      if (queryIdentifiersEnclosingOption != null)
        'QueryIdentifiersEnclosingOption':
            queryIdentifiersEnclosingOption.toValue(),
    };
  }
}

class StartDataSourceSyncJobResponse {
  /// Identifies a particular synchronization job.
  final String? executionId;

  StartDataSourceSyncJobResponse({
    this.executionId,
  });

  factory StartDataSourceSyncJobResponse.fromJson(Map<String, dynamic> json) {
    return StartDataSourceSyncJobResponse(
      executionId: json['ExecutionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    return {
      if (executionId != null) 'ExecutionId': executionId,
    };
  }
}

/// Provides information about the status of documents submitted for indexing.
class Status {
  /// The unique identifier of the document.
  final String? documentId;

  /// The current status of a document.
  ///
  /// If the document was submitted for deletion, the status is
  /// <code>NOT_FOUND</code> after the document is deleted.
  final DocumentStatus? documentStatus;

  /// Indicates the source of the error.
  final String? failureCode;

  /// Provides detailed information about why the document couldn't be indexed.
  /// Use this information to correct the error before you resubmit the document
  /// for indexing.
  final String? failureReason;

  Status({
    this.documentId,
    this.documentStatus,
    this.failureCode,
    this.failureReason,
  });

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(
      documentId: json['DocumentId'] as String?,
      documentStatus: (json['DocumentStatus'] as String?)?.toDocumentStatus(),
      failureCode: json['FailureCode'] as String?,
      failureReason: json['FailureReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentId = this.documentId;
    final documentStatus = this.documentStatus;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    return {
      if (documentId != null) 'DocumentId': documentId,
      if (documentStatus != null) 'DocumentStatus': documentStatus.toValue(),
      if (failureCode != null) 'FailureCode': failureCode,
      if (failureReason != null) 'FailureReason': failureReason,
    };
  }
}

/// A single query suggestion.
class Suggestion {
  /// The unique UUID (universally unique identifier) of a single query
  /// suggestion.
  final String? id;

  /// The value for the unique UUID (universally unique identifier) of a single
  /// query suggestion.
  ///
  /// The value is the text string of a suggestion.
  final SuggestionValue? value;

  Suggestion({
    this.id,
    this.value,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      id: json['Id'] as String?,
      value: json['Value'] != null
          ? SuggestionValue.fromJson(json['Value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final value = this.value;
    return {
      if (id != null) 'Id': id,
      if (value != null) 'Value': value,
    };
  }
}

/// The text highlights for a single query suggestion.
class SuggestionHighlight {
  /// The zero-based location in the response string where the highlight starts.
  final int? beginOffset;

  /// The zero-based location in the response string where the highlight ends.
  final int? endOffset;

  SuggestionHighlight({
    this.beginOffset,
    this.endOffset,
  });

  factory SuggestionHighlight.fromJson(Map<String, dynamic> json) {
    return SuggestionHighlight(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (endOffset != null) 'EndOffset': endOffset,
    };
  }
}

/// Provides text and information about where to highlight the query suggestion
/// text.
class SuggestionTextWithHighlights {
  /// The beginning and end of the query suggestion text that should be
  /// highlighted.
  final List<SuggestionHighlight>? highlights;

  /// The query suggestion text to display to the user.
  final String? text;

  SuggestionTextWithHighlights({
    this.highlights,
    this.text,
  });

  factory SuggestionTextWithHighlights.fromJson(Map<String, dynamic> json) {
    return SuggestionTextWithHighlights(
      highlights: (json['Highlights'] as List?)
          ?.whereNotNull()
          .map((e) => SuggestionHighlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['Text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final highlights = this.highlights;
    final text = this.text;
    return {
      if (highlights != null) 'Highlights': highlights,
      if (text != null) 'Text': text,
    };
  }
}

/// The <code>SuggestionTextWithHighlights</code> structure information.
class SuggestionValue {
  /// The <code>SuggestionTextWithHighlights</code> structure that contains the
  /// query suggestion text and highlights.
  final SuggestionTextWithHighlights? text;

  SuggestionValue({
    this.text,
  });

  factory SuggestionValue.fromJson(Map<String, dynamic> json) {
    return SuggestionValue(
      text: json['Text'] != null
          ? SuggestionTextWithHighlights.fromJson(
              json['Text'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final text = this.text;
    return {
      if (text != null) 'Text': text,
    };
  }
}

/// A list of key/value pairs that identify an index, FAQ, or data source. Tag
/// keys and values can consist of Unicode letters, digits, white space, and any
/// of the following symbols: _ . : / = + - @.
class Tag {
  /// The key for the tag. Keys are not case sensitive and must be unique for the
  /// index, FAQ, or data source.
  final String key;

  /// The value associated with the tag. The value may be an empty string but it
  /// can't be null.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides information about text documents indexed in an index.
class TextDocumentStatistics {
  /// The total size, in bytes, of the indexed documents.
  final int indexedTextBytes;

  /// The number of text documents indexed.
  final int indexedTextDocumentsCount;

  TextDocumentStatistics({
    required this.indexedTextBytes,
    required this.indexedTextDocumentsCount,
  });

  factory TextDocumentStatistics.fromJson(Map<String, dynamic> json) {
    return TextDocumentStatistics(
      indexedTextBytes: json['IndexedTextBytes'] as int,
      indexedTextDocumentsCount: json['IndexedTextDocumentsCount'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final indexedTextBytes = this.indexedTextBytes;
    final indexedTextDocumentsCount = this.indexedTextDocumentsCount;
    return {
      'IndexedTextBytes': indexedTextBytes,
      'IndexedTextDocumentsCount': indexedTextDocumentsCount,
    };
  }
}

/// Provides text and information about where to highlight the text.
class TextWithHighlights {
  /// The beginning and end of the text that should be highlighted.
  final List<Highlight>? highlights;

  /// The text to display to the user.
  final String? text;

  TextWithHighlights({
    this.highlights,
    this.text,
  });

  factory TextWithHighlights.fromJson(Map<String, dynamic> json) {
    return TextWithHighlights(
      highlights: (json['Highlights'] as List?)
          ?.whereNotNull()
          .map((e) => Highlight.fromJson(e as Map<String, dynamic>))
          .toList(),
      text: json['Text'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final highlights = this.highlights;
    final text = this.text;
    return {
      if (highlights != null) 'Highlights': highlights,
      if (text != null) 'Text': text,
    };
  }
}

enum ThesaurusStatus {
  creating,
  active,
  deleting,
  updating,
  activeButUpdateFailed,
  failed,
}

extension on ThesaurusStatus {
  String toValue() {
    switch (this) {
      case ThesaurusStatus.creating:
        return 'CREATING';
      case ThesaurusStatus.active:
        return 'ACTIVE';
      case ThesaurusStatus.deleting:
        return 'DELETING';
      case ThesaurusStatus.updating:
        return 'UPDATING';
      case ThesaurusStatus.activeButUpdateFailed:
        return 'ACTIVE_BUT_UPDATE_FAILED';
      case ThesaurusStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  ThesaurusStatus toThesaurusStatus() {
    switch (this) {
      case 'CREATING':
        return ThesaurusStatus.creating;
      case 'ACTIVE':
        return ThesaurusStatus.active;
      case 'DELETING':
        return ThesaurusStatus.deleting;
      case 'UPDATING':
        return ThesaurusStatus.updating;
      case 'ACTIVE_BUT_UPDATE_FAILED':
        return ThesaurusStatus.activeButUpdateFailed;
      case 'FAILED':
        return ThesaurusStatus.failed;
    }
    throw Exception('$this is not known in enum ThesaurusStatus');
  }
}

/// An array of summary information for one or more thesauruses.
class ThesaurusSummary {
  /// The Unix datetime that the thesaurus was created.
  final DateTime? createdAt;

  /// The identifier of the thesaurus.
  final String? id;

  /// The name of the thesaurus.
  final String? name;

  /// The status of the thesaurus.
  final ThesaurusStatus? status;

  /// The Unix datetime that the thesaurus was last updated.
  final DateTime? updatedAt;

  ThesaurusSummary({
    this.createdAt,
    this.id,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory ThesaurusSummary.fromJson(Map<String, dynamic> json) {
    return ThesaurusSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toThesaurusStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Provides a range of time.
class TimeRange {
  /// The UNIX datetime of the end of the time range.
  final DateTime? endTime;

  /// The UNIX datetime of the beginning of the time range.
  final DateTime? startTime;

  TimeRange({
    this.endTime,
    this.startTime,
  });

  factory TimeRange.fromJson(Map<String, dynamic> json) {
    return TimeRange(
      endTime: timeStampFromJson(json['EndTime']),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
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

/// Provides the configuration information of the URLs to crawl.
///
/// <i>When selecting websites to index, you must adhere to the <a
/// href="https://aws.amazon.com/aup/">Amazon Acceptable Use Policy</a> and all
/// other Amazon terms. Remember that you must only use the Amazon Kendra web
/// crawler to index your own webpages, or webpages that you have authorization
/// to index.</i>
class Urls {
  /// Provides the configuration of the seed or starting point URLs of the
  /// websites you want to crawl.
  ///
  /// You can choose to crawl only the website host names, or the website host
  /// names with subdomains, or the website host names with subdomains and other
  /// domains that the webpages link to.
  ///
  /// You can list up to 100 seed URLs.
  final SeedUrlConfiguration? seedUrlConfiguration;

  /// Provides the configuration of the sitemap URLs of the websites you want to
  /// crawl.
  ///
  /// Only URLs belonging to the same website host names are crawled. You can list
  /// up to three sitemap URLs.
  final SiteMapsConfiguration? siteMapsConfiguration;

  Urls({
    this.seedUrlConfiguration,
    this.siteMapsConfiguration,
  });

  factory Urls.fromJson(Map<String, dynamic> json) {
    return Urls(
      seedUrlConfiguration: json['SeedUrlConfiguration'] != null
          ? SeedUrlConfiguration.fromJson(
              json['SeedUrlConfiguration'] as Map<String, dynamic>)
          : null,
      siteMapsConfiguration: json['SiteMapsConfiguration'] != null
          ? SiteMapsConfiguration.fromJson(
              json['SiteMapsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final seedUrlConfiguration = this.seedUrlConfiguration;
    final siteMapsConfiguration = this.siteMapsConfiguration;
    return {
      if (seedUrlConfiguration != null)
        'SeedUrlConfiguration': seedUrlConfiguration,
      if (siteMapsConfiguration != null)
        'SiteMapsConfiguration': siteMapsConfiguration,
    };
  }
}

/// Provides information about the user context for a Amazon Kendra index.
class UserContext {
  /// The user context token. It must be a JWT or a JSON token.
  final String? token;

  UserContext({
    this.token,
  });

  factory UserContext.fromJson(Map<String, dynamic> json) {
    return UserContext(
      token: json['Token'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final token = this.token;
    return {
      if (token != null) 'Token': token,
    };
  }
}

enum UserContextPolicy {
  attributeFilter,
  userToken,
}

extension on UserContextPolicy {
  String toValue() {
    switch (this) {
      case UserContextPolicy.attributeFilter:
        return 'ATTRIBUTE_FILTER';
      case UserContextPolicy.userToken:
        return 'USER_TOKEN';
    }
  }
}

extension on String {
  UserContextPolicy toUserContextPolicy() {
    switch (this) {
      case 'ATTRIBUTE_FILTER':
        return UserContextPolicy.attributeFilter;
      case 'USER_TOKEN':
        return UserContextPolicy.userToken;
    }
    throw Exception('$this is not known in enum UserContextPolicy');
  }
}

/// Provides configuration information for a token configuration.
class UserTokenConfiguration {
  /// Information about the JSON token type configuration.
  final JsonTokenTypeConfiguration? jsonTokenTypeConfiguration;

  /// Information about the JWT token type configuration.
  final JwtTokenTypeConfiguration? jwtTokenTypeConfiguration;

  UserTokenConfiguration({
    this.jsonTokenTypeConfiguration,
    this.jwtTokenTypeConfiguration,
  });

  factory UserTokenConfiguration.fromJson(Map<String, dynamic> json) {
    return UserTokenConfiguration(
      jsonTokenTypeConfiguration: json['JsonTokenTypeConfiguration'] != null
          ? JsonTokenTypeConfiguration.fromJson(
              json['JsonTokenTypeConfiguration'] as Map<String, dynamic>)
          : null,
      jwtTokenTypeConfiguration: json['JwtTokenTypeConfiguration'] != null
          ? JwtTokenTypeConfiguration.fromJson(
              json['JwtTokenTypeConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final jsonTokenTypeConfiguration = this.jsonTokenTypeConfiguration;
    final jwtTokenTypeConfiguration = this.jwtTokenTypeConfiguration;
    return {
      if (jsonTokenTypeConfiguration != null)
        'JsonTokenTypeConfiguration': jsonTokenTypeConfiguration,
      if (jwtTokenTypeConfiguration != null)
        'JwtTokenTypeConfiguration': jwtTokenTypeConfiguration,
    };
  }
}

/// Provides the configuration information required for Amazon Kendra web
/// crawler.
class WebCrawlerConfiguration {
  /// Specifies the seed or starting point URLs of the websites or the sitemap
  /// URLs of the websites you want to crawl.
  ///
  /// You can include website subdomains. You can list up to 100 seed URLs and up
  /// to three sitemap URLs.
  ///
  /// <i>When selecting websites to index, you must adhere to the <a
  /// href="https://aws.amazon.com/aup/">Amazon Acceptable Use Policy</a> and all
  /// other Amazon terms. Remember that you must only use the Amazon Kendra web
  /// crawler to index your own webpages, or webpages that you have authorization
  /// to index.</i>
  final Urls urls;

  /// Provides configuration information required to connect to websites using
  /// authentication.
  ///
  /// You can connect to websites using basic authentication of user name and
  /// password.
  ///
  /// You must provide the website host name and port number. For example, the
  /// host name of https://a.example.com/page1.html is "a.example.com" and the
  /// port is 443, the standard port for HTTPS. You use a secret in <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">AWS
  /// Secrets Manager</a> to store your authentication credentials.
  final AuthenticationConfiguration? authenticationConfiguration;

  /// Specifies the number of levels in a website that you want to crawl.
  ///
  /// The first level begins from the website seed or starting point URL. For
  /// example, if a website has 3 levels – index level (i.e. seed in this
  /// example), sections level, and subsections level – and you are only
  /// interested in crawling information up to the sections level (i.e. levels
  /// 0-1), you can set your depth to 1.
  ///
  /// The default crawl depth is set to 2.
  final int? crawlDepth;

  /// The maximum size (in MB) of a webpage or attachment to crawl.
  ///
  /// Files larger than this size (in MB) are skipped/not crawled.
  ///
  /// The default maximum size of a webpage or attachment is set to 50 MB.
  final double? maxContentSizePerPageInMegaBytes;

  /// The maximum number of URLs on a webpage to include when crawling a website.
  /// This number is per webpage.
  ///
  /// As a website’s webpages are crawled, any URLs the webpages link to are also
  /// crawled. URLs on a webpage are crawled in order of appearance.
  ///
  /// The default maximum links per page is 100.
  final int? maxLinksPerPage;

  /// The maximum number of URLs crawled per website host per minute.
  ///
  /// A minimum of one URL is required.
  ///
  /// The default maximum number of URLs crawled per website host per minute is
  /// 300.
  final int? maxUrlsPerMinuteCrawlRate;

  /// Provides configuration information required to connect to your internal
  /// websites via a web proxy.
  ///
  /// You must provide the website host name and port number. For example, the
  /// host name of https://a.example.com/page1.html is "a.example.com" and the
  /// port is 443, the standard port for HTTPS.
  ///
  /// Web proxy credentials are optional and you can use them to connect to a web
  /// proxy server that requires basic authentication. To store web proxy
  /// credentials, you use a secret in <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">AWS
  /// Secrets Manager</a>.
  final ProxyConfiguration? proxyConfiguration;

  /// The regular expression pattern to exclude certain URLs to crawl.
  ///
  /// If there is a regular expression pattern to include certain URLs that
  /// conflicts with the exclude pattern, the exclude pattern takes precedence.
  final List<String>? urlExclusionPatterns;

  /// The regular expression pattern to include certain URLs to crawl.
  ///
  /// If there is a regular expression pattern to exclude certain URLs that
  /// conflicts with the include pattern, the exclude pattern takes precedence.
  final List<String>? urlInclusionPatterns;

  WebCrawlerConfiguration({
    required this.urls,
    this.authenticationConfiguration,
    this.crawlDepth,
    this.maxContentSizePerPageInMegaBytes,
    this.maxLinksPerPage,
    this.maxUrlsPerMinuteCrawlRate,
    this.proxyConfiguration,
    this.urlExclusionPatterns,
    this.urlInclusionPatterns,
  });

  factory WebCrawlerConfiguration.fromJson(Map<String, dynamic> json) {
    return WebCrawlerConfiguration(
      urls: Urls.fromJson(json['Urls'] as Map<String, dynamic>),
      authenticationConfiguration: json['AuthenticationConfiguration'] != null
          ? AuthenticationConfiguration.fromJson(
              json['AuthenticationConfiguration'] as Map<String, dynamic>)
          : null,
      crawlDepth: json['CrawlDepth'] as int?,
      maxContentSizePerPageInMegaBytes:
          json['MaxContentSizePerPageInMegaBytes'] as double?,
      maxLinksPerPage: json['MaxLinksPerPage'] as int?,
      maxUrlsPerMinuteCrawlRate: json['MaxUrlsPerMinuteCrawlRate'] as int?,
      proxyConfiguration: json['ProxyConfiguration'] != null
          ? ProxyConfiguration.fromJson(
              json['ProxyConfiguration'] as Map<String, dynamic>)
          : null,
      urlExclusionPatterns: (json['UrlExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      urlInclusionPatterns: (json['UrlInclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final urls = this.urls;
    final authenticationConfiguration = this.authenticationConfiguration;
    final crawlDepth = this.crawlDepth;
    final maxContentSizePerPageInMegaBytes =
        this.maxContentSizePerPageInMegaBytes;
    final maxLinksPerPage = this.maxLinksPerPage;
    final maxUrlsPerMinuteCrawlRate = this.maxUrlsPerMinuteCrawlRate;
    final proxyConfiguration = this.proxyConfiguration;
    final urlExclusionPatterns = this.urlExclusionPatterns;
    final urlInclusionPatterns = this.urlInclusionPatterns;
    return {
      'Urls': urls,
      if (authenticationConfiguration != null)
        'AuthenticationConfiguration': authenticationConfiguration,
      if (crawlDepth != null) 'CrawlDepth': crawlDepth,
      if (maxContentSizePerPageInMegaBytes != null)
        'MaxContentSizePerPageInMegaBytes': maxContentSizePerPageInMegaBytes,
      if (maxLinksPerPage != null) 'MaxLinksPerPage': maxLinksPerPage,
      if (maxUrlsPerMinuteCrawlRate != null)
        'MaxUrlsPerMinuteCrawlRate': maxUrlsPerMinuteCrawlRate,
      if (proxyConfiguration != null) 'ProxyConfiguration': proxyConfiguration,
      if (urlExclusionPatterns != null)
        'UrlExclusionPatterns': urlExclusionPatterns,
      if (urlInclusionPatterns != null)
        'UrlInclusionPatterns': urlInclusionPatterns,
    };
  }
}

enum WebCrawlerMode {
  hostOnly,
  subdomains,
  everything,
}

extension on WebCrawlerMode {
  String toValue() {
    switch (this) {
      case WebCrawlerMode.hostOnly:
        return 'HOST_ONLY';
      case WebCrawlerMode.subdomains:
        return 'SUBDOMAINS';
      case WebCrawlerMode.everything:
        return 'EVERYTHING';
    }
  }
}

extension on String {
  WebCrawlerMode toWebCrawlerMode() {
    switch (this) {
      case 'HOST_ONLY':
        return WebCrawlerMode.hostOnly;
      case 'SUBDOMAINS':
        return WebCrawlerMode.subdomains;
      case 'EVERYTHING':
        return WebCrawlerMode.everything;
    }
    throw Exception('$this is not known in enum WebCrawlerMode');
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceAlreadyExistException extends _s.GenericAwsException {
  ResourceAlreadyExistException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistException',
            message: message);
}

class ResourceInUseException extends _s.GenericAwsException {
  ResourceInUseException({String? type, String? message})
      : super(type: type, code: 'ResourceInUseException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ResourceUnavailableException extends _s.GenericAwsException {
  ResourceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ResourceUnavailableException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
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
