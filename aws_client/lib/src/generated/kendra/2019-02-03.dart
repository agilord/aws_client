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

part '2019-02-03.g.dart';

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
    DataSourceSyncJobMetricTarget dataSourceSyncJobMetricTarget,
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
        if (dataSourceSyncJobMetricTarget != null)
          'DataSourceSyncJobMetricTarget': dataSourceSyncJobMetricTarget,
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
    @_s.required String indexId,
    @_s.required String name,
    @_s.required DataSourceType type,
    String clientToken,
    DataSourceConfiguration configuration,
    String description,
    String roleArn,
    String schedule,
    List<Tag> tags,
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
      1000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
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
    _s.validateStringPattern(
      'description',
      description,
      r'''^\P{C}*$''',
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
        'Type': type?.toValue() ?? '',
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
    @_s.required String indexId,
    @_s.required String name,
    @_s.required String roleArn,
    @_s.required S3Path s3Path,
    String clientToken,
    String description,
    FaqFileFormat fileFormat,
    List<Tag> tags,
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
    @_s.required String name,
    @_s.required String roleArn,
    String clientToken,
    String description,
    IndexEdition edition,
    ServerSideEncryptionConfiguration serverSideEncryptionConfiguration,
    List<Tag> tags,
    UserContextPolicy userContextPolicy,
    List<UserTokenConfiguration> userTokenConfigurations,
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
      0,
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
    @_s.required String indexId,
    @_s.required String name,
    @_s.required String roleArn,
    @_s.required S3Path sourceS3Path,
    String clientToken,
    String description,
    List<Tag> tags,
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
    _s.validateStringPattern(
      'description',
      description,
      r'''^\P{C}*$''',
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
  /// deleted, the <code>Status</code> field returned by a call to the operation
  /// is set to <code>DELETING</code>. For more information, see <a
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
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteDataSource'
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
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteThesaurus'
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
    @_s.required String resourceARN,
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
    @_s.required String indexId,
    @_s.required String queryText,
    AttributeFilter attributeFilter,
    List<Facet> facets,
    int pageNumber,
    int pageSize,
    QueryResultType queryResultTypeFilter,
    List<String> requestedDocumentAttributes,
    SortingConfiguration sortingConfiguration,
    UserContext userContext,
    String visitorId,
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
    _s.validateStringLength(
      'visitorId',
      visitorId,
      1,
      256,
    );
    _s.validateStringPattern(
      'visitorId',
      visitorId,
      r'''[a-zA-Z0-9][a-zA-Z0-9_-]*''',
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
    _s.validateStringPattern(
      'queryId',
      queryId,
      r'''[a-zA-Z0-9][a-zA-Z0-9-]*''',
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
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
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
    final jsonResponse = await _protocol.send(
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

    return TagResourceResponse.fromJson(jsonResponse.body);
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
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
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
    final jsonResponse = await _protocol.send(
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

    return UntagResourceResponse.fromJson(jsonResponse.body);
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
      0,
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the index to update.
  ///
  /// Parameter [capacityUnits] :
  /// Sets the number of addtional storage and query capacity units that should
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
    @_s.required String id,
    CapacityUnitsConfiguration capacityUnits,
    String description,
    List<DocumentMetadataConfiguration> documentMetadataConfigurationUpdates,
    String name,
    String roleArn,
    UserContextPolicy userContextPolicy,
    List<UserTokenConfiguration> userTokenConfigurations,
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
      0,
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
    @_s.required String id,
    @_s.required String indexId,
    String description,
    String name,
    String roleArn,
    S3Path sourceS3Path,
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
      0,
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
      100,
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
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateThesaurus'
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

/// An attribute returned from an index query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AdditionalResultAttribute {
  /// The key that identifies the attribute.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// An object that contains the attribute value.
  @_s.JsonKey(name: 'Value')
  final AdditionalResultAttributeValue value;

  /// The data type of the <code>Value</code> property.
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
  /// attributes. This filter is only applicable to <code>StringListValue</code>
  /// metadata.
  @_s.JsonKey(name: 'ContainsAll')
  final DocumentAttribute containsAll;

  /// Returns true when a document contains any of the specified document
  /// attributes. This filter is only applicable to <code>StringListValue</code>
  /// metadata.
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
  /// your AWS CloudWatch log. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/cloudwatch-logs.html">Monitoring
  /// Amazon Kendra with Amazon CloudWatch Logs</a>
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

/// Specifies capacity units configured for your index. You can add and remove
/// capacity units to tune an index to your requirements.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class CapacityUnitsConfiguration {
  /// The amount of extra query capacity for an index. Each capacity unit provides
  /// 0.5 queries per second and 40,000 queries per day.
  @_s.JsonKey(name: 'QueryCapacityUnits')
  final int queryCapacityUnits;

  /// The amount of extra storage capacity for an index. Each capacity unit
  /// provides 150 Gb of storage space or 500,000 documents, whichever is reached
  /// first.
  @_s.JsonKey(name: 'StorageCapacityUnits')
  final int storageCapacityUnits;

  CapacityUnitsConfiguration({
    @_s.required this.queryCapacityUnits,
    @_s.required this.storageCapacityUnits,
  });
  factory CapacityUnitsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$CapacityUnitsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$CapacityUnitsConfigurationToJson(this);
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
  /// The Unix timestamp of the date and time that the result was clicked.
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

/// Specifies the attachment settings for the Confluence data source. Attachment
/// settings are optional, if you don't specify settings attachments, Amazon
/// Kendra won't index them.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfluenceAttachmentConfiguration {
  /// Defines how attachment metadata fields should be mapped to index fields.
  /// Before you can map a field, you must first create an index field with a
  /// matching type using the console or the <code>UpdateIndex</code> operation.
  ///
  /// If you specify the <code>AttachentFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  @_s.JsonKey(name: 'AttachmentFieldMappings')
  final List<ConfluenceAttachmentToIndexFieldMapping> attachmentFieldMappings;

  /// Indicates whether Amazon Kendra indexes attachments to the pages and blogs
  /// in the Confluence data source.
  @_s.JsonKey(name: 'CrawlAttachments')
  final bool crawlAttachments;

  ConfluenceAttachmentConfiguration({
    this.attachmentFieldMappings,
    this.crawlAttachments,
  });
  factory ConfluenceAttachmentConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$ConfluenceAttachmentConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfluenceAttachmentConfigurationToJson(this);
}

enum ConfluenceAttachmentFieldName {
  @_s.JsonValue('AUTHOR')
  author,
  @_s.JsonValue('CONTENT_TYPE')
  contentType,
  @_s.JsonValue('CREATED_DATE')
  createdDate,
  @_s.JsonValue('DISPLAY_URL')
  displayUrl,
  @_s.JsonValue('FILE_SIZE')
  fileSize,
  @_s.JsonValue('ITEM_TYPE')
  itemType,
  @_s.JsonValue('PARENT_ID')
  parentId,
  @_s.JsonValue('SPACE_KEY')
  spaceKey,
  @_s.JsonValue('SPACE_NAME')
  spaceName,
  @_s.JsonValue('URL')
  url,
  @_s.JsonValue('VERSION')
  version,
}

/// Defines the mapping between a field in the Confluence data source to a
/// Amazon Kendra index field.
///
/// You must first create the index field using the operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfluenceAttachmentToIndexFieldMapping {
  /// The name of the field in the data source.
  ///
  /// You must first create the index field using the operation.
  @_s.JsonKey(name: 'DataSourceFieldName')
  final ConfluenceAttachmentFieldName dataSourceFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
  @_s.JsonKey(name: 'DateFieldFormat')
  final String dateFieldFormat;

  /// The name of the index field to map to the Confluence data source field. The
  /// index field type must match the Confluence field type.
  @_s.JsonKey(name: 'IndexFieldName')
  final String indexFieldName;

  ConfluenceAttachmentToIndexFieldMapping({
    this.dataSourceFieldName,
    this.dateFieldFormat,
    this.indexFieldName,
  });
  factory ConfluenceAttachmentToIndexFieldMapping.fromJson(
          Map<String, dynamic> json) =>
      _$ConfluenceAttachmentToIndexFieldMappingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfluenceAttachmentToIndexFieldMappingToJson(this);
}

/// Specifies the blog settings for the Confluence data source. Blogs are always
/// indexed unless filtered from the index by the <code>ExclusionPatterns</code>
/// or <code>InclusionPatterns</code> fields in the data type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfluenceBlogConfiguration {
  /// Defines how blog metadata fields should be mapped to index fields. Before
  /// you can map a field, you must first create an index field with a matching
  /// type using the console or the <code>UpdateIndex</code> operation.
  ///
  /// If you specify the <code>BlogFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  @_s.JsonKey(name: 'BlogFieldMappings')
  final List<ConfluenceBlogToIndexFieldMapping> blogFieldMappings;

  ConfluenceBlogConfiguration({
    this.blogFieldMappings,
  });
  factory ConfluenceBlogConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ConfluenceBlogConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfluenceBlogConfigurationToJson(this);
}

enum ConfluenceBlogFieldName {
  @_s.JsonValue('AUTHOR')
  author,
  @_s.JsonValue('DISPLAY_URL')
  displayUrl,
  @_s.JsonValue('ITEM_TYPE')
  itemType,
  @_s.JsonValue('LABELS')
  labels,
  @_s.JsonValue('PUBLISH_DATE')
  publishDate,
  @_s.JsonValue('SPACE_KEY')
  spaceKey,
  @_s.JsonValue('SPACE_NAME')
  spaceName,
  @_s.JsonValue('URL')
  url,
  @_s.JsonValue('VERSION')
  version,
}

/// Defines the mapping between a blog field in the Confluence data source to a
/// Amazon Kendra index field.
///
/// You must first create the index field using the operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfluenceBlogToIndexFieldMapping {
  /// The name of the field in the data source.
  @_s.JsonKey(name: 'DataSourceFieldName')
  final ConfluenceBlogFieldName dataSourceFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
  @_s.JsonKey(name: 'DateFieldFormat')
  final String dateFieldFormat;

  /// The name of the index field to map to the Confluence data source field. The
  /// index field type must match the Confluence field type.
  @_s.JsonKey(name: 'IndexFieldName')
  final String indexFieldName;

  ConfluenceBlogToIndexFieldMapping({
    this.dataSourceFieldName,
    this.dateFieldFormat,
    this.indexFieldName,
  });
  factory ConfluenceBlogToIndexFieldMapping.fromJson(
          Map<String, dynamic> json) =>
      _$ConfluenceBlogToIndexFieldMappingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfluenceBlogToIndexFieldMappingToJson(this);
}

/// Provides configuration information for data sources that connect to
/// Confluence.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  /// The URL of your Confluence instance. Use the full URL of the server. For
  /// example, <code>https://server.example.com:port/</code>. You can also use an
  /// IP address, for example, <code>https://192.168.1.113/</code>.
  @_s.JsonKey(name: 'ServerUrl')
  final String serverUrl;

  /// Specifies the version of the Confluence installation that you are connecting
  /// to.
  @_s.JsonKey(name: 'Version')
  final ConfluenceVersion version;

  /// Specifies configuration information for indexing attachments to Confluence
  /// blogs and pages.
  @_s.JsonKey(name: 'AttachmentConfiguration')
  final ConfluenceAttachmentConfiguration attachmentConfiguration;

  /// Specifies configuration information for indexing Confluence blogs.
  @_s.JsonKey(name: 'BlogConfiguration')
  final ConfluenceBlogConfiguration blogConfiguration;

  /// A list of regular expression patterns that apply to a URL on the Confluence
  /// server. An exclusion pattern can apply to a blog post, a page, a space, or
  /// an attachment. Items that match the pattern are excluded from the index.
  /// Items that don't match the pattern are included in the index. If a item
  /// matches both an exclusion pattern and an inclusion pattern, the item isn't
  /// included in the index.
  @_s.JsonKey(name: 'ExclusionPatterns')
  final List<String> exclusionPatterns;

  /// A list of regular expression patterns that apply to a URL on the Confluence
  /// server. An inclusion pattern can apply to a blog post, a page, a space, or
  /// an attachment. Items that match the patterns are included in the index.
  /// Items that don't match the pattern are excluded from the index. If an item
  /// matches both an inclusion pattern and an exclusion pattern, the item isn't
  /// included in the index.
  @_s.JsonKey(name: 'InclusionPatterns')
  final List<String> inclusionPatterns;

  /// Specifies configuration information for indexing Confluence pages.
  @_s.JsonKey(name: 'PageConfiguration')
  final ConfluencePageConfiguration pageConfiguration;

  /// Specifies configuration information for indexing Confluence spaces.
  @_s.JsonKey(name: 'SpaceConfiguration')
  final ConfluenceSpaceConfiguration spaceConfiguration;

  /// Specifies the information for connecting to an Amazon VPC.
  @_s.JsonKey(name: 'VpcConfiguration')
  final DataSourceVpcConfiguration vpcConfiguration;

  ConfluenceConfiguration({
    @_s.required this.secretArn,
    @_s.required this.serverUrl,
    @_s.required this.version,
    this.attachmentConfiguration,
    this.blogConfiguration,
    this.exclusionPatterns,
    this.inclusionPatterns,
    this.pageConfiguration,
    this.spaceConfiguration,
    this.vpcConfiguration,
  });
  factory ConfluenceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ConfluenceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfluenceConfigurationToJson(this);
}

/// Specifies the page settings for the Confluence data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfluencePageConfiguration {
  /// Defines how page metadata fields should be mapped to index fields. Before
  /// you can map a field, you must first create an index field with a matching
  /// type using the console or the <code>UpdateIndex</code> operation.
  ///
  /// If you specify the <code>PageFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  @_s.JsonKey(name: 'PageFieldMappings')
  final List<ConfluencePageToIndexFieldMapping> pageFieldMappings;

  ConfluencePageConfiguration({
    this.pageFieldMappings,
  });
  factory ConfluencePageConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ConfluencePageConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfluencePageConfigurationToJson(this);
}

enum ConfluencePageFieldName {
  @_s.JsonValue('AUTHOR')
  author,
  @_s.JsonValue('CONTENT_STATUS')
  contentStatus,
  @_s.JsonValue('CREATED_DATE')
  createdDate,
  @_s.JsonValue('DISPLAY_URL')
  displayUrl,
  @_s.JsonValue('ITEM_TYPE')
  itemType,
  @_s.JsonValue('LABELS')
  labels,
  @_s.JsonValue('MODIFIED_DATE')
  modifiedDate,
  @_s.JsonValue('PARENT_ID')
  parentId,
  @_s.JsonValue('SPACE_KEY')
  spaceKey,
  @_s.JsonValue('SPACE_NAME')
  spaceName,
  @_s.JsonValue('URL')
  url,
  @_s.JsonValue('VERSION')
  version,
}

/// Defines the mapping between a field in the Confluence data source to a
/// Amazon Kendra index field.
///
/// You must first create the index field using the operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfluencePageToIndexFieldMapping {
  /// The name of the field in the data source.
  @_s.JsonKey(name: 'DataSourceFieldName')
  final ConfluencePageFieldName dataSourceFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
  @_s.JsonKey(name: 'DateFieldFormat')
  final String dateFieldFormat;

  /// The name of the index field to map to the Confluence data source field. The
  /// index field type must match the Confluence field type.
  @_s.JsonKey(name: 'IndexFieldName')
  final String indexFieldName;

  ConfluencePageToIndexFieldMapping({
    this.dataSourceFieldName,
    this.dateFieldFormat,
    this.indexFieldName,
  });
  factory ConfluencePageToIndexFieldMapping.fromJson(
          Map<String, dynamic> json) =>
      _$ConfluencePageToIndexFieldMappingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfluencePageToIndexFieldMappingToJson(this);
}

/// Specifies the configuration for indexing Confluence spaces.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfluenceSpaceConfiguration {
  /// Specifies whether Amazon Kendra should index archived spaces.
  @_s.JsonKey(name: 'CrawlArchivedSpaces')
  final bool crawlArchivedSpaces;

  /// Specifies whether Amazon Kendra should index personal spaces. Users can add
  /// restrictions to items in personal spaces. If personal spaces are indexed,
  /// queries without user context information may return restricted items from a
  /// personal space in their results. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html">Filtering
  /// on user context</a>.
  @_s.JsonKey(name: 'CrawlPersonalSpaces')
  final bool crawlPersonalSpaces;

  /// A list of space keys of Confluence spaces. If you include a key, the blogs,
  /// documents, and attachments in the space are not indexed. If a space is in
  /// both the <code>ExcludeSpaces</code> and the <code>IncludeSpaces</code> list,
  /// the space is excluded.
  @_s.JsonKey(name: 'ExcludeSpaces')
  final List<String> excludeSpaces;

  /// A list of space keys for Confluence spaces. If you include a key, the blogs,
  /// documents, and attachments in the space are indexed. Spaces that aren't in
  /// the list aren't indexed. A space in the list must exist. Otherwise, Amazon
  /// Kendra logs an error when the data source is synchronized. If a space is in
  /// both the <code>IncludeSpaces</code> and the <code>ExcludeSpaces</code> list,
  /// the space is excluded.
  @_s.JsonKey(name: 'IncludeSpaces')
  final List<String> includeSpaces;

  /// Defines how space metadata fields should be mapped to index fields. Before
  /// you can map a field, you must first create an index field with a matching
  /// type using the console or the <code>UpdateIndex</code> operation.
  ///
  /// If you specify the <code>SpaceFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  @_s.JsonKey(name: 'SpaceFieldMappings')
  final List<ConfluenceSpaceToIndexFieldMapping> spaceFieldMappings;

  ConfluenceSpaceConfiguration({
    this.crawlArchivedSpaces,
    this.crawlPersonalSpaces,
    this.excludeSpaces,
    this.includeSpaces,
    this.spaceFieldMappings,
  });
  factory ConfluenceSpaceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ConfluenceSpaceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ConfluenceSpaceConfigurationToJson(this);
}

enum ConfluenceSpaceFieldName {
  @_s.JsonValue('DISPLAY_URL')
  displayUrl,
  @_s.JsonValue('ITEM_TYPE')
  itemType,
  @_s.JsonValue('SPACE_KEY')
  spaceKey,
  @_s.JsonValue('URL')
  url,
}

/// Defines the mapping between a field in the Confluence data source to a
/// Amazon Kendra index field.
///
/// You must first create the index field using the operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConfluenceSpaceToIndexFieldMapping {
  /// The name of the field in the data source.
  @_s.JsonKey(name: 'DataSourceFieldName')
  final ConfluenceSpaceFieldName dataSourceFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
  @_s.JsonKey(name: 'DateFieldFormat')
  final String dateFieldFormat;

  /// The name of the index field to map to the Confluence data source field. The
  /// index field type must match the Confluence field type.
  @_s.JsonKey(name: 'IndexFieldName')
  final String indexFieldName;

  ConfluenceSpaceToIndexFieldMapping({
    this.dataSourceFieldName,
    this.dateFieldFormat,
    this.indexFieldName,
  });
  factory ConfluenceSpaceToIndexFieldMapping.fromJson(
          Map<String, dynamic> json) =>
      _$ConfluenceSpaceToIndexFieldMappingFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ConfluenceSpaceToIndexFieldMappingToJson(this);
}

enum ConfluenceVersion {
  @_s.JsonValue('CLOUD')
  cloud,
  @_s.JsonValue('SERVER')
  server,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateThesaurusResponse {
  /// The unique identifier of the thesaurus.
  @_s.JsonKey(name: 'Id')
  final String id;

  CreateThesaurusResponse({
    this.id,
  });
  factory CreateThesaurusResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateThesaurusResponseFromJson(json);
}

/// Configuration information for a Amazon Kendra data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSourceConfiguration {
  /// Provides configuration information for connecting to a Confluence data
  /// source.
  @_s.JsonKey(name: 'ConfluenceConfiguration')
  final ConfluenceConfiguration confluenceConfiguration;

  /// Provides information necessary to create a data source connector for a
  /// database.
  @_s.JsonKey(name: 'DatabaseConfiguration')
  final DatabaseConfiguration databaseConfiguration;

  /// Provides configuration for data sources that connect to Google Drive.
  @_s.JsonKey(name: 'GoogleDriveConfiguration')
  final GoogleDriveConfiguration googleDriveConfiguration;

  /// Provides configuration for data sources that connect to Microsoft OneDrive.
  @_s.JsonKey(name: 'OneDriveConfiguration')
  final OneDriveConfiguration oneDriveConfiguration;

  /// Provides information to create a data source connector for a document
  /// repository in an Amazon S3 bucket.
  @_s.JsonKey(name: 'S3Configuration')
  final S3DataSourceConfiguration s3Configuration;

  /// Provides configuration information for data sources that connect to a
  /// Salesforce site.
  @_s.JsonKey(name: 'SalesforceConfiguration')
  final SalesforceConfiguration salesforceConfiguration;

  /// Provides configuration for data sources that connect to ServiceNow
  /// instances.
  @_s.JsonKey(name: 'ServiceNowConfiguration')
  final ServiceNowConfiguration serviceNowConfiguration;

  /// Provides information necessary to create a data source connector for a
  /// Microsoft SharePoint site.
  @_s.JsonKey(name: 'SharePointConfiguration')
  final SharePointConfiguration sharePointConfiguration;

  DataSourceConfiguration({
    this.confluenceConfiguration,
    this.databaseConfiguration,
    this.googleDriveConfiguration,
    this.oneDriveConfiguration,
    this.s3Configuration,
    this.salesforceConfiguration,
    this.serviceNowConfiguration,
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

  /// Maps a batch delete document request to a specific data source sync job.
  /// This is optional and should only be supplied when documents are deleted by a
  /// data source connector.
  @_s.JsonKey(name: 'Metrics')
  final DataSourceSyncJobMetrics metrics;

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
    this.metrics,
    this.startTime,
    this.status,
  });
  factory DataSourceSyncJob.fromJson(Map<String, dynamic> json) =>
      _$DataSourceSyncJobFromJson(json);
}

/// Maps a particular data source sync job to a particular data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DataSourceSyncJobMetricTarget {
  /// The ID of the data source that is running the sync job.
  @_s.JsonKey(name: 'DataSourceId')
  final String dataSourceId;

  /// The ID of the sync job that is running on the data source.
  @_s.JsonKey(name: 'DataSourceSyncJobId')
  final String dataSourceSyncJobId;

  DataSourceSyncJobMetricTarget({
    @_s.required this.dataSourceId,
    @_s.required this.dataSourceSyncJobId,
  });
  Map<String, dynamic> toJson() => _$DataSourceSyncJobMetricTargetToJson(this);
}

/// Maps a batch delete document request to a specific data source sync job.
/// This is optional and should only be supplied when documents are deleted by a
/// data source connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSourceSyncJobMetrics {
  /// The number of documents added from the data source up to now in the data
  /// source sync.
  @_s.JsonKey(name: 'DocumentsAdded')
  final String documentsAdded;

  /// The number of documents deleted from the data source up to now in the data
  /// source sync run.
  @_s.JsonKey(name: 'DocumentsDeleted')
  final String documentsDeleted;

  /// The number of documents that failed to sync from the data source up to now
  /// in the data source sync run.
  @_s.JsonKey(name: 'DocumentsFailed')
  final String documentsFailed;

  /// The number of documents modified in the data source up to now in the data
  /// source sync run.
  @_s.JsonKey(name: 'DocumentsModified')
  final String documentsModified;

  /// The current number of documents crawled by the current sync job in the data
  /// source.
  @_s.JsonKey(name: 'DocumentsScanned')
  final String documentsScanned;

  DataSourceSyncJobMetrics({
    this.documentsAdded,
    this.documentsDeleted,
    this.documentsFailed,
    this.documentsModified,
    this.documentsScanned,
  });
  factory DataSourceSyncJobMetrics.fromJson(Map<String, dynamic> json) =>
      _$DataSourceSyncJobMetricsFromJson(json);
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
  @_s.JsonValue('SYNCING_INDEXING')
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
  @_s.JsonValue('SALESFORCE')
  salesforce,
  @_s.JsonValue('ONEDRIVE')
  onedrive,
  @_s.JsonValue('SERVICENOW')
  servicenow,
  @_s.JsonValue('CUSTOM')
  custom,
  @_s.JsonValue('CONFLUENCE')
  confluence,
  @_s.JsonValue('GOOGLEDRIVE')
  googledrive,
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

  /// Provides information about how Amazon Kendra uses quote marks around SQL
  /// identifiers when querying a database data source.
  @_s.JsonKey(name: 'SqlConfiguration')
  final SqlConfiguration sqlConfiguration;
  @_s.JsonKey(name: 'VpcConfiguration')
  final DataSourceVpcConfiguration vpcConfiguration;

  DatabaseConfiguration({
    @_s.required this.columnConfiguration,
    @_s.required this.connectionConfiguration,
    @_s.required this.databaseEngineType,
    this.aclConfiguration,
    this.sqlConfiguration,
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

  /// The file format used by the input files for the FAQ.
  @_s.JsonKey(name: 'FileFormat')
  final FaqFileFormat fileFormat;

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
    this.fileFormat,
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
  /// For enterprise edtion indexes, you can choose to use additional capacity to
  /// meet the needs of your application. This contains the capacity units used
  /// for the index. A 0 for the query capacity or the storage capacity indicates
  /// that the index is using the default capacity for the index.
  @_s.JsonKey(name: 'CapacityUnits')
  final CapacityUnitsConfiguration capacityUnits;

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

  /// The Amazon Kendra edition used for the index. You decide the edition when
  /// you create the index.
  @_s.JsonKey(name: 'Edition')
  final IndexEdition edition;

  /// When th e<code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a message that explains why.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The name of the index.
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

  /// The user context policy for the Amazon Kendra index.
  @_s.JsonKey(name: 'UserContextPolicy')
  final UserContextPolicy userContextPolicy;

  /// The user token configuration for the Amazon Kendra index.
  @_s.JsonKey(name: 'UserTokenConfigurations')
  final List<UserTokenConfiguration> userTokenConfigurations;

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
  factory DescribeIndexResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeIndexResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeThesaurusResponse {
  /// The Unix datetime that the thesaurus was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The thesaurus description.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field provides more information.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The size of the thesaurus file in bytes.
  @_s.JsonKey(name: 'FileSizeBytes')
  final int fileSizeBytes;

  /// The identifier of the thesaurus.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The identifier of the index associated with the thesaurus to describe.
  @_s.JsonKey(name: 'IndexId')
  final String indexId;

  /// The thesaurus name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// An AWS Identity and Access Management (IAM) role that gives Amazon Kendra
  /// permissions to access thesaurus file specified in <code>SourceS3Path</code>.
  @_s.JsonKey(name: 'RoleArn')
  final String roleArn;
  @_s.JsonKey(name: 'SourceS3Path')
  final S3Path sourceS3Path;

  /// The current status of the thesaurus. When the value is <code>ACTIVE</code>,
  /// queries are able to use the thesaurus. If the <code>Status</code> field
  /// value is <code>FAILED</code>, the <code>ErrorMessage</code> field provides
  /// more information.
  ///
  /// If the status is <code>ACTIVE_BUT_UPDATE_FAILED</code>, it means that Amazon
  /// Kendra could not ingest the new thesaurus file. The old thesaurus file is
  /// still active.
  @_s.JsonKey(name: 'Status')
  final ThesaurusStatus status;

  /// The number of synonym rules in the thesaurus file.
  @_s.JsonKey(name: 'SynonymRuleCount')
  final int synonymRuleCount;

  /// The number of unique terms in the thesaurus file. For example, the synonyms
  /// <code>a,b,c</code> and <code>a=&gt;d</code>, the term count would be 4.
  @_s.JsonKey(name: 'TermCount')
  final int termCount;

  /// The Unix datetime that the thesaurus was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

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
  factory DescribeThesaurusResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeThesaurusResponseFromJson(json);
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
  /// A date expressed as an ISO 8601 string.
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

/// Information about a document attribute
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

  /// The data type of the facet value. This is the same as the type defined for
  /// the index field when it was created.
  @_s.JsonKey(name: 'DocumentAttributeValueType')
  final DocumentAttributeValueType documentAttributeValueType;

  FacetResult({
    this.documentAttributeKey,
    this.documentAttributeValueCountPairs,
    this.documentAttributeValueType,
  });
  factory FacetResult.fromJson(Map<String, dynamic> json) =>
      _$FacetResultFromJson(json);
}

enum FaqFileFormat {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('CSV_WITH_HEADER')
  csvWithHeader,
  @_s.JsonValue('JSON')
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
    throw Exception('Unknown enum value: $this');
  }
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

  /// The file type used to create the FAQ.
  @_s.JsonKey(name: 'FileFormat')
  final FaqFileFormat fileFormat;

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
    this.fileFormat,
    this.id,
    this.name,
    this.status,
    this.updatedAt,
  });
  factory FaqSummary.fromJson(Map<String, dynamic> json) =>
      _$FaqSummaryFromJson(json);
}

/// Provides configuration information for data sources that connect to Google
/// Drive.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GoogleDriveConfiguration {
  /// The Amazon Resource Name (ARN) of a AWS Secrets Manager secret that contains
  /// the credentials required to connect to Google Drive. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-google-drive.html">Using
  /// a Google Workspace Drive data source</a>.
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  /// A list of MIME types to exclude from the index. All documents matching the
  /// specified MIME type are excluded.
  ///
  /// For a list of MIME types, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-google-drive.html">Using
  /// a Google Workspace Drive data source</a>.
  @_s.JsonKey(name: 'ExcludeMimeTypes')
  final List<String> excludeMimeTypes;

  /// A list of identifiers or shared drives to exclude from the index. All files
  /// and folders stored on the shared drive are excluded.
  @_s.JsonKey(name: 'ExcludeSharedDrives')
  final List<String> excludeSharedDrives;

  /// A list of email addresses of the users. Documents owned by these users are
  /// excluded from the index. Documents shared with excluded users are indexed
  /// unless they are excluded in another way.
  @_s.JsonKey(name: 'ExcludeUserAccounts')
  final List<String> excludeUserAccounts;

  /// A list of regular expression patterns that apply to the path on Google
  /// Drive. Items that match the pattern are excluded from the index from both
  /// shared drives and users' My Drives. Items that don't match the pattern are
  /// included in the index. If an item matches both an exclusion pattern and an
  /// inclusion pattern, it is excluded from the index.
  @_s.JsonKey(name: 'ExclusionPatterns')
  final List<String> exclusionPatterns;

  /// Defines mapping between a field in the Google Drive and a Amazon Kendra
  /// index field.
  ///
  /// If you are using the console, you can define index fields when creating the
  /// mapping. If you are using the API, you must first create the field using the
  /// <a>UpdateIndex</a> operation.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  /// A list of regular expression patterns that apply to path on Google Drive.
  /// Items that match the pattern are included in the index from both shared
  /// drives and users' My Drives. Items that don't match the pattern are excluded
  /// from the index. If an item matches both an inclusion pattern and an
  /// exclusion pattern, it is excluded from the index.
  @_s.JsonKey(name: 'InclusionPatterns')
  final List<String> inclusionPatterns;

  GoogleDriveConfiguration({
    @_s.required this.secretArn,
    this.excludeMimeTypes,
    this.excludeSharedDrives,
    this.excludeUserAccounts,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
  });
  factory GoogleDriveConfiguration.fromJson(Map<String, dynamic> json) =>
      _$GoogleDriveConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$GoogleDriveConfigurationToJson(this);
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

  /// The highlight type.
  @_s.JsonKey(name: 'Type')
  final HighlightType type;

  Highlight({
    @_s.required this.beginOffset,
    @_s.required this.endOffset,
    this.topAnswer,
    this.type,
  });
  factory Highlight.fromJson(Map<String, dynamic> json) =>
      _$HighlightFromJson(json);
}

enum HighlightType {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('THESAURUS_SYNONYM')
  thesaurusSynonym,
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

  /// Indicates whether the index is a enterprise edition index or a developer
  /// edition index.
  @_s.JsonKey(name: 'Edition')
  final IndexEdition edition;

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
    this.edition,
    this.id,
    this.name,
  });
  factory IndexConfigurationSummary.fromJson(Map<String, dynamic> json) =>
      _$IndexConfigurationSummaryFromJson(json);
}

enum IndexEdition {
  @_s.JsonValue('DEVELOPER_EDITION')
  developerEdition,
  @_s.JsonValue('ENTERPRISE_EDITION')
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
    throw Exception('Unknown enum value: $this');
  }
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
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('SYSTEM_UPDATING')
  systemUpdating,
}

/// Configuration information for the JSON token type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JsonTokenTypeConfiguration {
  /// The group attribute field.
  @_s.JsonKey(name: 'GroupAttributeField')
  final String groupAttributeField;

  /// The user name attribute field.
  @_s.JsonKey(name: 'UserNameAttributeField')
  final String userNameAttributeField;

  JsonTokenTypeConfiguration({
    @_s.required this.groupAttributeField,
    @_s.required this.userNameAttributeField,
  });
  factory JsonTokenTypeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$JsonTokenTypeConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$JsonTokenTypeConfigurationToJson(this);
}

/// Configuration information for the JWT token type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class JwtTokenTypeConfiguration {
  /// The location of the key.
  @_s.JsonKey(name: 'KeyLocation')
  final KeyLocation keyLocation;

  /// The regular expression that identifies the claim.
  @_s.JsonKey(name: 'ClaimRegex')
  final String claimRegex;

  /// The group attribute field.
  @_s.JsonKey(name: 'GroupAttributeField')
  final String groupAttributeField;

  /// The issuer of the token.
  @_s.JsonKey(name: 'Issuer')
  final String issuer;

  /// The Amazon Resource Name (arn) of the secret.
  @_s.JsonKey(name: 'SecretManagerArn')
  final String secretManagerArn;

  /// The signing key URL.
  @_s.JsonKey(name: 'URL')
  final String url;

  /// The user name attribute field.
  @_s.JsonKey(name: 'UserNameAttributeField')
  final String userNameAttributeField;

  JwtTokenTypeConfiguration({
    @_s.required this.keyLocation,
    this.claimRegex,
    this.groupAttributeField,
    this.issuer,
    this.secretManagerArn,
    this.url,
    this.userNameAttributeField,
  });
  factory JwtTokenTypeConfiguration.fromJson(Map<String, dynamic> json) =>
      _$JwtTokenTypeConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$JwtTokenTypeConfigurationToJson(this);
}

enum KeyLocation {
  @_s.JsonValue('URL')
  url,
  @_s.JsonValue('SECRET_MANAGER')
  secretManager,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A list of tags associated with the index, FAQ, or data source.
  @_s.JsonKey(name: 'Tags')
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
class ListThesauriResponse {
  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of thesauri.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// An array of summary information for one or more thesauruses.
  @_s.JsonKey(name: 'ThesaurusSummaryItems')
  final List<ThesaurusSummary> thesaurusSummaryItems;

  ListThesauriResponse({
    this.nextToken,
    this.thesaurusSummaryItems,
  });
  factory ListThesauriResponse.fromJson(Map<String, dynamic> json) =>
      _$ListThesauriResponseFromJson(json);
}

/// Provides configuration information for data sources that connect to
/// OneDrive.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OneDriveConfiguration {
  /// A list of user accounts whose documents should be indexed.
  @_s.JsonKey(name: 'OneDriveUsers')
  final OneDriveUsers oneDriveUsers;

  /// The Amazon Resource Name (ARN) of an AWS Secrets Manager secret that
  /// contains the user name and password to connect to OneDrive. The user namd
  /// should be the application ID for the OneDrive application, and the password
  /// is the application key for the OneDrive application.
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  /// The Azure Active Directory domain of the organization.
  @_s.JsonKey(name: 'TenantDomain')
  final String tenantDomain;

  /// A Boolean value that specifies whether local groups are disabled
  /// (<code>True</code>) or enabled (<code>False</code>).
  @_s.JsonKey(name: 'DisableLocalGroups')
  final bool disableLocalGroups;

  /// List of regular expressions applied to documents. Items that match the
  /// exclusion pattern are not indexed. If you provide both an inclusion pattern
  /// and an exclusion pattern, any item that matches the exclusion pattern isn't
  /// indexed.
  ///
  /// The exclusion pattern is applied to the file name.
  @_s.JsonKey(name: 'ExclusionPatterns')
  final List<String> exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// Microsoft OneDrive fields to custom fields in the Amazon Kendra index. You
  /// must first create the index fields before you map OneDrive fields.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  /// A list of regular expression patterns. Documents that match the pattern are
  /// included in the index. Documents that don't match the pattern are excluded
  /// from the index. If a document matches both an inclusion pattern and an
  /// exclusion pattern, the document is not included in the index.
  ///
  /// The exclusion pattern is applied to the file name.
  @_s.JsonKey(name: 'InclusionPatterns')
  final List<String> inclusionPatterns;

  OneDriveConfiguration({
    @_s.required this.oneDriveUsers,
    @_s.required this.secretArn,
    @_s.required this.tenantDomain,
    this.disableLocalGroups,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
  });
  factory OneDriveConfiguration.fromJson(Map<String, dynamic> json) =>
      _$OneDriveConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$OneDriveConfigurationToJson(this);
}

/// User accounts whose documents should be indexed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OneDriveUsers {
  /// A list of users whose documents should be indexed. Specify the user names in
  /// email format, for example, <code>username@tenantdomain</code>. If you need
  /// to index the documents of more than 100 users, use the
  /// <code>OneDriveUserS3Path</code> field to specify the location of a file
  /// containing a list of users.
  @_s.JsonKey(name: 'OneDriveUserList')
  final List<String> oneDriveUserList;

  /// The S3 bucket location of a file containing a list of users whose documents
  /// should be indexed.
  @_s.JsonKey(name: 'OneDriveUserS3Path')
  final S3Path oneDriveUserS3Path;

  OneDriveUsers({
    this.oneDriveUserList,
    this.oneDriveUserS3Path,
  });
  factory OneDriveUsers.fromJson(Map<String, dynamic> json) =>
      _$OneDriveUsersFromJson(json);

  Map<String, dynamic> toJson() => _$OneDriveUsersToJson(this);
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

enum QueryIdentifiersEnclosingOption {
  @_s.JsonValue('DOUBLE_QUOTES')
  doubleQuotes,
  @_s.JsonValue('NONE')
  none,
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

  /// The total number of items found by the search; however, you can only
  /// retrieve up to 100 items. For example, if the search found 192 items, you
  /// can only retrieve the first 100 of the items.
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
  /// One or more additional attributes associated with the query result.
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

  /// A token that identifies a particular result from a particular query. Use
  /// this token to provide click-through feedback for the result. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/submitting-feedback.html">
  /// Submitting feedback </a>.
  @_s.JsonKey(name: 'FeedbackToken')
  final String feedbackToken;

  /// The unique identifier for the query result.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// Indicates the confidence that Amazon Kendra has that a result matches the
  /// query that you provided. Each result is placed into a bin that indicates the
  /// confidence, <code>VERY_HIGH</code>, <code>HIGH</code>, <code>MEDIUM</code>
  /// and <code>LOW</code>. You can use the score to determine if a response meets
  /// the confidence needed for your application.
  ///
  /// The field is only set to <code>LOW</code> when the <code>Type</code> field
  /// is set to <code>DOCUMENT</code> and Amazon Kendra is not confident that the
  /// result matches the query.
  @_s.JsonKey(name: 'ScoreAttributes')
  final ScoreAttributes scoreAttributes;

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
    this.feedbackToken,
    this.id,
    this.scoreAttributes,
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
  /// files for the data source. For the format of the file, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html">Access
  /// control for S3 data sources</a>.
  @_s.JsonKey(name: 'AccessControlListConfiguration')
  final AccessControlListConfiguration accessControlListConfiguration;
  @_s.JsonKey(name: 'DocumentsMetadataConfiguration')
  final DocumentsMetadataConfiguration documentsMetadataConfiguration;

  /// A list of glob patterns for documents that should not be indexed. If a
  /// document that matches an inclusion prefix or inclusion pattern also matches
  /// an exclusion pattern, the document is not indexed.
  ///
  /// For more information about glob patterns, see <a
  /// href="https://en.wikipedia.org/wiki/Glob_(programming)">glob
  /// (programming)</a> in <i>Wikipedia</i>.
  @_s.JsonKey(name: 'ExclusionPatterns')
  final List<String> exclusionPatterns;

  /// A list of glob patterns for documents that should be indexed. If a document
  /// that matches an inclusion pattern also matches an exclusion pattern, the
  /// document is not indexed.
  ///
  /// For more information about glob patterns, see <a
  /// href="https://en.wikipedia.org/wiki/Glob_(programming)">glob
  /// (programming)</a> in <i>Wikipedia</i>.
  @_s.JsonKey(name: 'InclusionPatterns')
  final List<String> inclusionPatterns;

  /// A list of S3 prefixes for the documents that should be included in the
  /// index.
  @_s.JsonKey(name: 'InclusionPrefixes')
  final List<String> inclusionPrefixes;

  S3DataSourceConfiguration({
    @_s.required this.bucketName,
    this.accessControlListConfiguration,
    this.documentsMetadataConfiguration,
    this.exclusionPatterns,
    this.inclusionPatterns,
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

/// Defines configuration for syncing a Salesforce chatter feed. The contents of
/// the object comes from the Salesforce FeedItem table.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceChatterFeedConfiguration {
  /// The name of the column in the Salesforce FeedItem table that contains the
  /// content to index. Typically this is the <code>Body</code> column.
  @_s.JsonKey(name: 'DocumentDataFieldName')
  final String documentDataFieldName;

  /// The name of the column in the Salesforce FeedItem table that contains the
  /// title of the document. This is typically the <code>Title</code> collumn.
  @_s.JsonKey(name: 'DocumentTitleFieldName')
  final String documentTitleFieldName;

  /// Maps fields from a Salesforce chatter feed into Amazon Kendra index fields.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  /// Filters the documents in the feed based on status of the user. When you
  /// specify <code>ACTIVE_USERS</code> only documents from users who have an
  /// active account are indexed. When you specify <code>STANDARD_USER</code> only
  /// documents for Salesforce standard users are documented. You can specify
  /// both.
  @_s.JsonKey(name: 'IncludeFilterTypes')
  final List<SalesforceChatterFeedIncludeFilterType> includeFilterTypes;

  SalesforceChatterFeedConfiguration({
    @_s.required this.documentDataFieldName,
    this.documentTitleFieldName,
    this.fieldMappings,
    this.includeFilterTypes,
  });
  factory SalesforceChatterFeedConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$SalesforceChatterFeedConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SalesforceChatterFeedConfigurationToJson(this);
}

enum SalesforceChatterFeedIncludeFilterType {
  @_s.JsonValue('ACTIVE_USER')
  activeUser,
  @_s.JsonValue('STANDARD_USER')
  standardUser,
}

/// Provides configuration information for connecting to a Salesforce data
/// source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  /// The instance URL for the Salesforce site that you want to index.
  @_s.JsonKey(name: 'ServerUrl')
  final String serverUrl;

  /// Specifies configuration information for Salesforce chatter feeds.
  @_s.JsonKey(name: 'ChatterFeedConfiguration')
  final SalesforceChatterFeedConfiguration chatterFeedConfiguration;

  /// Indicates whether Amazon Kendra should index attachments to Salesforce
  /// objects.
  @_s.JsonKey(name: 'CrawlAttachments')
  final bool crawlAttachments;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// excluded from the index. Documents that don't match the patterns are
  /// included in the index. If a document matches both an exclusion pattern and
  /// an inclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the name of the attached file.
  @_s.JsonKey(name: 'ExcludeAttachmentFilePatterns')
  final List<String> excludeAttachmentFilePatterns;

  /// A list of regular expression patterns. Documents that match the patterns are
  /// included in the index. Documents that don't match the patterns are excluded
  /// from the index. If a document matches both an inclusion pattern and an
  /// exclusion pattern, the document is not included in the index.
  ///
  /// The regex is applied to the name of the attached file.
  @_s.JsonKey(name: 'IncludeAttachmentFilePatterns')
  final List<String> includeAttachmentFilePatterns;

  /// Specifies configuration information for the knowlege article types that
  /// Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and
  /// the standard fields of knowledge articles, or the custom fields of custom
  /// knowledge articles, but not both.
  @_s.JsonKey(name: 'KnowledgeArticleConfiguration')
  final SalesforceKnowledgeArticleConfiguration knowledgeArticleConfiguration;

  /// Provides configuration information for processing attachments to Salesforce
  /// standard objects.
  @_s.JsonKey(name: 'StandardObjectAttachmentConfiguration')
  final SalesforceStandardObjectAttachmentConfiguration
      standardObjectAttachmentConfiguration;

  /// Specifies the Salesforce standard objects that Amazon Kendra indexes.
  @_s.JsonKey(name: 'StandardObjectConfigurations')
  final List<SalesforceStandardObjectConfiguration>
      standardObjectConfigurations;

  SalesforceConfiguration({
    @_s.required this.secretArn,
    @_s.required this.serverUrl,
    this.chatterFeedConfiguration,
    this.crawlAttachments,
    this.excludeAttachmentFilePatterns,
    this.includeAttachmentFilePatterns,
    this.knowledgeArticleConfiguration,
    this.standardObjectAttachmentConfiguration,
    this.standardObjectConfigurations,
  });
  factory SalesforceConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SalesforceConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SalesforceConfigurationToJson(this);
}

/// Provides configuration information for indexing Salesforce custom articles.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceCustomKnowledgeArticleTypeConfiguration {
  /// The name of the field in the custom knowledge article that contains the
  /// document data to index.
  @_s.JsonKey(name: 'DocumentDataFieldName')
  final String documentDataFieldName;

  /// The name of the configuration.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The name of the field in the custom knowledge article that contains the
  /// document title.
  @_s.JsonKey(name: 'DocumentTitleFieldName')
  final String documentTitleFieldName;

  /// One or more objects that map fields in the custom knowledge article to
  /// fields in the Amazon Kendra index.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  SalesforceCustomKnowledgeArticleTypeConfiguration({
    @_s.required this.documentDataFieldName,
    @_s.required this.name,
    this.documentTitleFieldName,
    this.fieldMappings,
  });
  factory SalesforceCustomKnowledgeArticleTypeConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$SalesforceCustomKnowledgeArticleTypeConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SalesforceCustomKnowledgeArticleTypeConfigurationToJson(this);
}

/// Specifies configuration information for the knowlege article types that
/// Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and
/// the standard fields of knowledge articles, or the custom fields of custom
/// knowledge articles, but not both
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceKnowledgeArticleConfiguration {
  /// Specifies the document states that should be included when Amazon Kendra
  /// indexes knowledge articles. You must specify at least one state.
  @_s.JsonKey(name: 'IncludedStates')
  final List<SalesforceKnowledgeArticleState> includedStates;

  /// Provides configuration information for custom Salesforce knowledge articles.
  @_s.JsonKey(name: 'CustomKnowledgeArticleTypeConfigurations')
  final List<SalesforceCustomKnowledgeArticleTypeConfiguration>
      customKnowledgeArticleTypeConfigurations;

  /// Provides configuration information for standard Salesforce knowledge
  /// articles.
  @_s.JsonKey(name: 'StandardKnowledgeArticleTypeConfiguration')
  final SalesforceStandardKnowledgeArticleTypeConfiguration
      standardKnowledgeArticleTypeConfiguration;

  SalesforceKnowledgeArticleConfiguration({
    @_s.required this.includedStates,
    this.customKnowledgeArticleTypeConfigurations,
    this.standardKnowledgeArticleTypeConfiguration,
  });
  factory SalesforceKnowledgeArticleConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$SalesforceKnowledgeArticleConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SalesforceKnowledgeArticleConfigurationToJson(this);
}

enum SalesforceKnowledgeArticleState {
  @_s.JsonValue('DRAFT')
  draft,
  @_s.JsonValue('PUBLISHED')
  published,
  @_s.JsonValue('ARCHIVED')
  archived,
}

/// Provides configuration information for standard Salesforce knowledge
/// articles.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceStandardKnowledgeArticleTypeConfiguration {
  /// The name of the field that contains the document data to index.
  @_s.JsonKey(name: 'DocumentDataFieldName')
  final String documentDataFieldName;

  /// The name of the field that contains the document title.
  @_s.JsonKey(name: 'DocumentTitleFieldName')
  final String documentTitleFieldName;

  /// One or more objects that map fields in the knowledge article to Amazon
  /// Kendra index fields. The index field must exist before you can map a
  /// Salesforce field to it.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  SalesforceStandardKnowledgeArticleTypeConfiguration({
    @_s.required this.documentDataFieldName,
    this.documentTitleFieldName,
    this.fieldMappings,
  });
  factory SalesforceStandardKnowledgeArticleTypeConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$SalesforceStandardKnowledgeArticleTypeConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SalesforceStandardKnowledgeArticleTypeConfigurationToJson(this);
}

/// Provides configuration information for processing attachments to Salesforce
/// standard objects.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceStandardObjectAttachmentConfiguration {
  /// The name of the field used for the document title.
  @_s.JsonKey(name: 'DocumentTitleFieldName')
  final String documentTitleFieldName;

  /// One or more objects that map fields in attachments to Amazon Kendra index
  /// fields.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  SalesforceStandardObjectAttachmentConfiguration({
    this.documentTitleFieldName,
    this.fieldMappings,
  });
  factory SalesforceStandardObjectAttachmentConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$SalesforceStandardObjectAttachmentConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SalesforceStandardObjectAttachmentConfigurationToJson(this);
}

/// Specifies confguration information for indexing a single standard object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SalesforceStandardObjectConfiguration {
  /// The name of the field in the standard object table that contains the
  /// document contents.
  @_s.JsonKey(name: 'DocumentDataFieldName')
  final String documentDataFieldName;

  /// The name of the standard object.
  @_s.JsonKey(name: 'Name')
  final SalesforceStandardObjectName name;

  /// The name of the field in the standard object table that contains the
  /// document titleB.
  @_s.JsonKey(name: 'DocumentTitleFieldName')
  final String documentTitleFieldName;

  /// One or more objects that map fields in the standard object to Amazon Kendra
  /// index fields. The index field must exist before you can map a Salesforce
  /// field to it.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  SalesforceStandardObjectConfiguration({
    @_s.required this.documentDataFieldName,
    @_s.required this.name,
    this.documentTitleFieldName,
    this.fieldMappings,
  });
  factory SalesforceStandardObjectConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$SalesforceStandardObjectConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SalesforceStandardObjectConfigurationToJson(this);
}

enum SalesforceStandardObjectName {
  @_s.JsonValue('ACCOUNT')
  account,
  @_s.JsonValue('CAMPAIGN')
  campaign,
  @_s.JsonValue('CASE')
  $case,
  @_s.JsonValue('CONTACT')
  contact,
  @_s.JsonValue('CONTRACT')
  contract,
  @_s.JsonValue('DOCUMENT')
  document,
  @_s.JsonValue('GROUP')
  group,
  @_s.JsonValue('IDEA')
  idea,
  @_s.JsonValue('LEAD')
  lead,
  @_s.JsonValue('OPPORTUNITY')
  opportunity,
  @_s.JsonValue('PARTNER')
  partner,
  @_s.JsonValue('PRICEBOOK')
  pricebook,
  @_s.JsonValue('PRODUCT')
  product,
  @_s.JsonValue('PROFILE')
  profile,
  @_s.JsonValue('SOLUTION')
  solution,
  @_s.JsonValue('TASK')
  task,
  @_s.JsonValue('USER')
  user,
}

/// Provides a relative ranking that indicates how confident Amazon Kendra is
/// that the response matches the query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ScoreAttributes {
  /// A relative ranking for how well the response matches the query.
  @_s.JsonKey(name: 'ScoreConfidence')
  final ScoreConfidence scoreConfidence;

  ScoreAttributes({
    this.scoreConfidence,
  });
  factory ScoreAttributes.fromJson(Map<String, dynamic> json) =>
      _$ScoreAttributesFromJson(json);
}

/// Enumeration for query score confidence.
enum ScoreConfidence {
  @_s.JsonValue('VERY_HIGH')
  veryHigh,
  @_s.JsonValue('HIGH')
  high,
  @_s.JsonValue('MEDIUM')
  medium,
  @_s.JsonValue('LOW')
  low,
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

  /// Determines whether the field can be used to sort the results of a query. If
  /// you specify sorting on a field that does not have <code>Sortable</code> set
  /// to <code>true</code>, Amazon Kendra returns an exception. The default is
  /// <code>false</code>.
  @_s.JsonKey(name: 'Sortable')
  final bool sortable;

  Search({
    this.displayable,
    this.facetable,
    this.searchable,
    this.sortable,
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

enum ServiceNowBuildVersionType {
  @_s.JsonValue('LONDON')
  london,
  @_s.JsonValue('OTHERS')
  others,
}

/// Provides configuration information required to connect to a ServiceNow data
/// source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceNowConfiguration {
  /// The ServiceNow instance that the data source connects to. The host endpoint
  /// should look like the following: <code>{instance}.service-now.com.</code>
  @_s.JsonKey(name: 'HostUrl')
  final String hostUrl;

  /// The Amazon Resource Name (ARN) of the AWS Secret Manager secret that
  /// contains the user name and password required to connect to the ServiceNow
  /// instance.
  @_s.JsonKey(name: 'SecretArn')
  final String secretArn;

  /// The identifier of the release that the ServiceNow host is running. If the
  /// host is not running the <code>LONDON</code> release, use
  /// <code>OTHERS</code>.
  @_s.JsonKey(name: 'ServiceNowBuildVersion')
  final ServiceNowBuildVersionType serviceNowBuildVersion;

  /// Provides configuration information for crawling knowledge articles in the
  /// ServiceNow site.
  @_s.JsonKey(name: 'KnowledgeArticleConfiguration')
  final ServiceNowKnowledgeArticleConfiguration knowledgeArticleConfiguration;

  /// Provides configuration information for crawling service catalogs in the
  /// ServiceNow site.
  @_s.JsonKey(name: 'ServiceCatalogConfiguration')
  final ServiceNowServiceCatalogConfiguration serviceCatalogConfiguration;

  ServiceNowConfiguration({
    @_s.required this.hostUrl,
    @_s.required this.secretArn,
    @_s.required this.serviceNowBuildVersion,
    this.knowledgeArticleConfiguration,
    this.serviceCatalogConfiguration,
  });
  factory ServiceNowConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ServiceNowConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceNowConfigurationToJson(this);
}

/// Provides configuration information for crawling knowledge articles in the
/// ServiceNow site.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceNowKnowledgeArticleConfiguration {
  /// The name of the ServiceNow field that is mapped to the index document
  /// contents field in the Amazon Kendra index.
  @_s.JsonKey(name: 'DocumentDataFieldName')
  final String documentDataFieldName;

  /// Indicates whether Amazon Kendra should index attachments to knowledge
  /// articles.
  @_s.JsonKey(name: 'CrawlAttachments')
  final bool crawlAttachments;

  /// The name of the ServiceNow field that is mapped to the index document title
  /// field.
  @_s.JsonKey(name: 'DocumentTitleFieldName')
  final String documentTitleFieldName;

  /// List of regular expressions applied to knowledge articles. Items that don't
  /// match the inclusion pattern are not indexed. The regex is applied to the
  /// field specified in the <code>PatternTargetField</code>
  @_s.JsonKey(name: 'ExcludeAttachmentFilePatterns')
  final List<String> excludeAttachmentFilePatterns;

  /// Mapping between ServiceNow fields and Amazon Kendra index fields. You must
  /// create the index field before you map the field.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  /// List of regular expressions applied to knowledge articles. Items that don't
  /// match the inclusion pattern are not indexed. The regex is applied to the
  /// field specified in the <code>PatternTargetField</code>.
  @_s.JsonKey(name: 'IncludeAttachmentFilePatterns')
  final List<String> includeAttachmentFilePatterns;

  ServiceNowKnowledgeArticleConfiguration({
    @_s.required this.documentDataFieldName,
    this.crawlAttachments,
    this.documentTitleFieldName,
    this.excludeAttachmentFilePatterns,
    this.fieldMappings,
    this.includeAttachmentFilePatterns,
  });
  factory ServiceNowKnowledgeArticleConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$ServiceNowKnowledgeArticleConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ServiceNowKnowledgeArticleConfigurationToJson(this);
}

/// Provides configuration information for crawling service catalog items in the
/// ServiceNow site
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServiceNowServiceCatalogConfiguration {
  /// The name of the ServiceNow field that is mapped to the index document
  /// contents field in the Amazon Kendra index.
  @_s.JsonKey(name: 'DocumentDataFieldName')
  final String documentDataFieldName;

  /// Indicates whether Amazon Kendra should crawl attachments to the service
  /// catalog items.
  @_s.JsonKey(name: 'CrawlAttachments')
  final bool crawlAttachments;

  /// The name of the ServiceNow field that is mapped to the index document title
  /// field.
  @_s.JsonKey(name: 'DocumentTitleFieldName')
  final String documentTitleFieldName;

  /// Determines the types of file attachments that are excluded from the index.
  @_s.JsonKey(name: 'ExcludeAttachmentFilePatterns')
  final List<String> excludeAttachmentFilePatterns;

  /// Mapping between ServiceNow fields and Amazon Kendra index fields. You must
  /// create the index field before you map the field.
  @_s.JsonKey(name: 'FieldMappings')
  final List<DataSourceToIndexFieldMapping> fieldMappings;

  /// Determines the types of file attachments that are included in the index.
  @_s.JsonKey(name: 'IncludeAttachmentFilePatterns')
  final List<String> includeAttachmentFilePatterns;

  ServiceNowServiceCatalogConfiguration({
    @_s.required this.documentDataFieldName,
    this.crawlAttachments,
    this.documentTitleFieldName,
    this.excludeAttachmentFilePatterns,
    this.fieldMappings,
    this.includeAttachmentFilePatterns,
  });
  factory ServiceNowServiceCatalogConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$ServiceNowServiceCatalogConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ServiceNowServiceCatalogConfigurationToJson(this);
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

  /// A Boolean value that specifies whether local groups are disabled
  /// (<code>True</code>) or enabled (<code>False</code>).
  @_s.JsonKey(name: 'DisableLocalGroups')
  final bool disableLocalGroups;

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
    this.disableLocalGroups,
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

enum SortOrder {
  @_s.JsonValue('DESC')
  desc,
  @_s.JsonValue('ASC')
  asc,
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
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
  @_s.JsonKey(name: 'DocumentAttributeKey')
  final String documentAttributeKey;

  /// The order that the results should be returned in. In case of ties, the
  /// relevance assigned to the result by Amazon Kendra is used as the
  /// tie-breaker.
  @_s.JsonKey(name: 'SortOrder')
  final SortOrder sortOrder;

  SortingConfiguration({
    @_s.required this.documentAttributeKey,
    @_s.required this.sortOrder,
  });
  Map<String, dynamic> toJson() => _$SortingConfigurationToJson(this);
}

/// Provides information that configures Amazon Kendra to use a SQL database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
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
  @_s.JsonKey(name: 'QueryIdentifiersEnclosingOption')
  final QueryIdentifiersEnclosingOption queryIdentifiersEnclosingOption;

  SqlConfiguration({
    this.queryIdentifiersEnclosingOption,
  });
  factory SqlConfiguration.fromJson(Map<String, dynamic> json) =>
      _$SqlConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$SqlConfigurationToJson(this);
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

/// A list of key/value pairs that identify an index, FAQ, or data source. Tag
/// keys and values can consist of Unicode letters, digits, white space, and any
/// of the following symbols: _ . : / = + - @.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key for the tag. Keys are not case sensitive and must be unique for the
  /// index, FAQ, or data source.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value associated with the tag. The value may be an empty string but it
  /// can't be null.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
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

/// Provides information about text documents indexed in an index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TextDocumentStatistics {
  /// The total size, in bytes, of the indexed documents.
  @_s.JsonKey(name: 'IndexedTextBytes')
  final int indexedTextBytes;

  /// The number of text documents indexed.
  @_s.JsonKey(name: 'IndexedTextDocumentsCount')
  final int indexedTextDocumentsCount;

  TextDocumentStatistics({
    @_s.required this.indexedTextBytes,
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

enum ThesaurusStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('ACTIVE_BUT_UPDATE_FAILED')
  activeButUpdateFailed,
  @_s.JsonValue('FAILED')
  failed,
}

/// An array of summary information for one or more thesauruses.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThesaurusSummary {
  /// The Unix datetime that the thesaurus was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The identifier of the thesaurus.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The name of the thesaurus.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The status of the thesaurus.
  @_s.JsonKey(name: 'Status')
  final ThesaurusStatus status;

  /// The Unix datetime that the thesaurus was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedAt')
  final DateTime updatedAt;

  ThesaurusSummary({
    this.createdAt,
    this.id,
    this.name,
    this.status,
    this.updatedAt,
  });
  factory ThesaurusSummary.fromJson(Map<String, dynamic> json) =>
      _$ThesaurusSummaryFromJson(json);
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

/// Provides information about the user context for a Amazon Kendra index.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UserContext {
  /// The user context token. It must be a JWT or a JSON token.
  @_s.JsonKey(name: 'Token')
  final String token;

  UserContext({
    this.token,
  });
  Map<String, dynamic> toJson() => _$UserContextToJson(this);
}

enum UserContextPolicy {
  @_s.JsonValue('ATTRIBUTE_FILTER')
  attributeFilter,
  @_s.JsonValue('USER_TOKEN')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides configuration information for a token configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserTokenConfiguration {
  /// Information about the JSON token type configuration.
  @_s.JsonKey(name: 'JsonTokenTypeConfiguration')
  final JsonTokenTypeConfiguration jsonTokenTypeConfiguration;

  /// Information about the JWT token type configuration.
  @_s.JsonKey(name: 'JwtTokenTypeConfiguration')
  final JwtTokenTypeConfiguration jwtTokenTypeConfiguration;

  UserTokenConfiguration({
    this.jsonTokenTypeConfiguration,
    this.jwtTokenTypeConfiguration,
  });
  factory UserTokenConfiguration.fromJson(Map<String, dynamic> json) =>
      _$UserTokenConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$UserTokenConfigurationToJson(this);
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
