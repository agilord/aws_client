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

/// Amazon Kendra is a service for indexing large document sets.
class Kendra {
  final _s.JsonProtocol _protocol;
  Kendra({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Grants users or groups in your IAM Identity Center identity source access
  /// to your Amazon Kendra experience. You can create an Amazon Kendra
  /// experience such as a search application. For more information on creating
  /// a search application experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityList] :
  /// Lists users or groups in your IAM Identity Center identity source.
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  Future<AssociateEntitiesToExperienceResponse> associateEntitiesToExperience({
    required List<EntityConfiguration> entityList,
    required String id,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.AssociateEntitiesToExperience'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityList': entityList,
        'Id': id,
        'IndexId': indexId,
      },
    );

    return AssociateEntitiesToExperienceResponse.fromJson(jsonResponse.body);
  }

  /// Defines the specific permissions of users or groups in your IAM Identity
  /// Center identity source with access to your Amazon Kendra experience. You
  /// can create an Amazon Kendra experience such as a search application. For
  /// more information on creating a search application experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceAlreadyExistException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  ///
  /// Parameter [personas] :
  /// The personas that define the specific permissions of users or groups in
  /// your IAM Identity Center identity source. The available personas or access
  /// roles are <code>Owner</code> and <code>Viewer</code>. For more information
  /// on these personas, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience">Providing
  /// access to your search page</a>.
  Future<AssociatePersonasToEntitiesResponse> associatePersonasToEntities({
    required String id,
    required String indexId,
    required List<EntityPersonaConfiguration> personas,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.AssociatePersonasToEntities'
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
        'Personas': personas,
      },
    );

    return AssociatePersonasToEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Removes one or more documents from an index. The documents must have been
  /// added with the <code>BatchPutDocument</code> API.
  ///
  /// The documents are deleted asynchronously. You can see the progress of the
  /// deletion by using Amazon Web Services CloudWatch. Any error messages
  /// related to the processing of the batch are sent to your Amazon Web
  /// Services CloudWatch log. You can also use the
  /// <code>BatchGetDocumentStatus</code> API to monitor the progress of
  /// deleting your documents.
  ///
  /// Deleting documents from an index using <code>BatchDeleteDocument</code>
  /// could take up to an hour or more, depending on the number of documents you
  /// want to delete.
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

  /// Removes one or more sets of featured results. Features results are placed
  /// above all other results for certain queries. If there's an exact match of
  /// a query, then one or more specific documents are featured in the search
  /// results.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [featuredResultsSetIds] :
  /// The identifiers of the featured results sets that you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used for featuring results.
  Future<BatchDeleteFeaturedResultsSetResponse> batchDeleteFeaturedResultsSet({
    required List<String> featuredResultsSetIds,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.BatchDeleteFeaturedResultsSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FeaturedResultsSetIds': featuredResultsSetIds,
        'IndexId': indexId,
      },
    );

    return BatchDeleteFeaturedResultsSetResponse.fromJson(jsonResponse.body);
  }

  /// Returns the indexing status for one or more documents submitted with the
  /// <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html">
  /// BatchPutDocument</a> API.
  ///
  /// When you use the <code>BatchPutDocument</code> API, documents are indexed
  /// asynchronously. You can use the <code>BatchGetDocumentStatus</code> API to
  /// get the current status of a list of documents so that you can determine if
  /// they have been successfully indexed.
  ///
  /// You can also use the <code>BatchGetDocumentStatus</code> API to check the
  /// status of the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteDocument.html">
  /// BatchDeleteDocument</a> API. When a document is deleted from the index,
  /// Amazon Kendra returns <code>NOT_FOUND</code> as the status.
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
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_CreateIndex.html">CreateIndex
  /// </a> API.
  Future<BatchGetDocumentStatusResponse> batchGetDocumentStatus({
    required List<DocumentInfo> documentInfoList,
    required String indexId,
  }) async {
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
  /// The <code>BatchPutDocument</code> API enables you to ingest inline
  /// documents or a set of documents stored in an Amazon S3 bucket. Use this
  /// API to ingest your text and unstructured text into an index, add custom
  /// attributes to the documents, and to attach an access control list to the
  /// documents added to the index.
  ///
  /// The documents are indexed asynchronously. You can see the progress of the
  /// batch using Amazon Web Services CloudWatch. Any error messages related to
  /// processing the batch are sent to your Amazon Web Services CloudWatch log.
  /// You can also use the <code>BatchGetDocumentStatus</code> API to monitor
  /// the progress of indexing your documents.
  ///
  /// For an example of ingesting inline documents using Python and Java SDKs,
  /// see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-adding-binary-doc.html">Adding
  /// files directly to an index</a>.
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
  /// 50 MB total size for any file
  /// </li>
  /// <li>
  /// 5 MB extracted text for any file
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas</a>.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index to add the documents to. You need to create
  /// the index first using the <code>CreateIndex</code> API.
  ///
  /// Parameter [customDocumentEnrichmentConfiguration] :
  /// Configuration information for altering your document metadata and content
  /// during the document ingestion process when you use the
  /// <code>BatchPutDocument</code> API.
  ///
  /// For more information on how to create, modify and delete document
  /// metadata, or make other content alterations when you ingest documents into
  /// Amazon Kendra, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html">Customizing
  /// document metadata during the ingestion process</a>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// your S3 bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// access roles for Amazon Kendra</a>.
  Future<BatchPutDocumentResponse> batchPutDocument({
    required List<Document> documents,
    required String indexId,
    CustomDocumentEnrichmentConfiguration?
        customDocumentEnrichmentConfiguration,
    String? roleArn,
  }) async {
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
        if (customDocumentEnrichmentConfiguration != null)
          'CustomDocumentEnrichmentConfiguration':
              customDocumentEnrichmentConfiguration,
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
  /// <code>ClearQuerySuggestions</code> is currently not supported in the
  /// Amazon Web Services GovCloud (US-West) region.
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

  /// Creates an access configuration for your documents. This includes user and
  /// group access information for your documents. This is useful for user
  /// context filtering, where search results are filtered based on the user or
  /// their group access to documents.
  ///
  /// You can use this to re-configure your existing document level access
  /// control without indexing all of your documents again. For example, your
  /// index contains top-secret company documents that only certain employees or
  /// users should access. One of these users leaves the company or switches to
  /// a team that should be blocked from accessing top-secret documents. The
  /// user still has access to top-secret documents because the user had access
  /// when your documents were previously indexed. You can create a specific
  /// access control configuration for the user with deny access. You can later
  /// update the access control configuration to allow access if the user
  /// returns to the company and re-joins the 'top-secret' team. You can
  /// re-configure access control for your documents as circumstances change.
  ///
  /// To apply your access control configuration to certain documents, you call
  /// the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html">BatchPutDocument</a>
  /// API with the <code>AccessControlConfigurationId</code> included in the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Document.html">Document</a>
  /// object. If you use an S3 bucket as a data source, you update the
  /// <code>.metadata.json</code> with the
  /// <code>AccessControlConfigurationId</code> and synchronize your data
  /// source. Amazon Kendra currently only supports access control configuration
  /// for S3 data sources and documents indexed using the
  /// <code>BatchPutDocument</code> API.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index to create an access control configuration for
  /// your documents.
  ///
  /// Parameter [name] :
  /// A name for the access control configuration.
  ///
  /// Parameter [accessControlList] :
  /// Information on principals (users and/or groups) and which documents they
  /// should have access to. This is useful for user context filtering, where
  /// search results are filtered based on the user or their group access to
  /// documents.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create an access
  /// control configuration. Multiple calls to the
  /// <code>CreateAccessControlConfiguration</code> API with the same client
  /// token will create only one access control configuration.
  ///
  /// Parameter [description] :
  /// A description for the access control configuration.
  ///
  /// Parameter [hierarchicalAccessControlList] :
  /// The list of <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html">principal</a>
  /// lists that define the hierarchy for which documents users should have
  /// access to.
  Future<CreateAccessControlConfigurationResponse>
      createAccessControlConfiguration({
    required String indexId,
    required String name,
    List<Principal>? accessControlList,
    String? clientToken,
    String? description,
    List<HierarchicalPrincipal>? hierarchicalAccessControlList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSKendraFrontendService.CreateAccessControlConfiguration'
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
        if (accessControlList != null) 'AccessControlList': accessControlList,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (description != null) 'Description': description,
        if (hierarchicalAccessControlList != null)
          'HierarchicalAccessControlList': hierarchicalAccessControlList,
      },
    );

    return CreateAccessControlConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Creates a data source connector that you want to use with an Amazon Kendra
  /// index.
  ///
  /// You specify a name, data source connector type and description for your
  /// data source. You also specify configuration information for the data
  /// source connector.
  ///
  /// <code>CreateDataSource</code> is a synchronous operation. The operation
  /// returns 200 if the data source was successfully created. Otherwise, an
  /// exception is raised.
  ///
  /// For an example of creating an index and data source using the Python SDK,
  /// see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/gs-python.html">Getting
  /// started with Python SDK</a>. For an example of creating an index and data
  /// source using the Java SDK, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/gs-java.html">Getting
  /// started with Java SDK</a>.
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
  /// The identifier of the index you want to use with the data source
  /// connector.
  ///
  /// Parameter [name] :
  /// A name for the data source connector.
  ///
  /// Parameter [type] :
  /// The type of data source repository. For example, <code>SHAREPOINT</code>.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a data source
  /// connector. Multiple calls to the <code>CreateDataSource</code> API with
  /// the same client token will create only one data source connector.
  ///
  /// Parameter [configuration] :
  /// Configuration information to connect to your data source repository.
  ///
  /// You can't specify the <code>Configuration</code> parameter when the
  /// <code>Type</code> parameter is set to <code>CUSTOM</code>. If you do, you
  /// receive a <code>ValidationException</code> exception.
  ///
  /// The <code>Configuration</code> parameter is required for all other data
  /// sources.
  ///
  /// Parameter [customDocumentEnrichmentConfiguration] :
  /// Configuration information for altering document metadata and content
  /// during the document ingestion process.
  ///
  /// For more information on how to create, modify and delete document
  /// metadata, or make other content alterations when you ingest documents into
  /// Amazon Kendra, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html">Customizing
  /// document metadata during the ingestion process</a>.
  ///
  /// Parameter [description] :
  /// A description for the data source connector.
  ///
  /// Parameter [languageCode] :
  /// The code for a language. This allows you to support a language for all
  /// documents when creating the data source connector. English is supported by
  /// default. For more information on supported languages, including their
  /// codes, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html">Adding
  /// documents in languages other than English</a>.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// the data source and required resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// access roles for Amazon Kendra.</a>.
  ///
  /// You can't specify the <code>RoleArn</code> parameter when the
  /// <code>Type</code> parameter is set to <code>CUSTOM</code>. If you do, you
  /// receive a <code>ValidationException</code> exception.
  ///
  /// The <code>RoleArn</code> parameter is required for all other data sources.
  ///
  /// Parameter [schedule] :
  /// Sets the frequency for Amazon Kendra to check the documents in your data
  /// source repository and update the index. If you don't set a schedule Amazon
  /// Kendra will not periodically update the index. You can call the
  /// <code>StartDataSourceSyncJob</code> API to update the index.
  ///
  /// Specify a <code>cron-</code> format schedule string or an empty string to
  /// indicate that the index is updated on demand.
  ///
  /// You can't specify the <code>Schedule</code> parameter when the
  /// <code>Type</code> parameter is set to <code>CUSTOM</code>. If you do, you
  /// receive a <code>ValidationException</code> exception.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the data source
  /// connector. You can also use tags to help control access to the data source
  /// connector. Tag keys and values can consist of Unicode letters, digits,
  /// white space, and any of the following symbols: _ . : / = + - @.
  ///
  /// Parameter [vpcConfiguration] :
  /// Configuration information for an Amazon Virtual Private Cloud to connect
  /// to your data source. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  Future<CreateDataSourceResponse> createDataSource({
    required String indexId,
    required String name,
    required DataSourceType type,
    String? clientToken,
    DataSourceConfiguration? configuration,
    CustomDocumentEnrichmentConfiguration?
        customDocumentEnrichmentConfiguration,
    String? description,
    String? languageCode,
    String? roleArn,
    String? schedule,
    List<Tag>? tags,
    DataSourceVpcConfiguration? vpcConfiguration,
  }) async {
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
        if (customDocumentEnrichmentConfiguration != null)
          'CustomDocumentEnrichmentConfiguration':
              customDocumentEnrichmentConfiguration,
        if (description != null) 'Description': description,
        if (languageCode != null) 'LanguageCode': languageCode,
        if (roleArn != null) 'RoleArn': roleArn,
        if (schedule != null) 'Schedule': schedule,
        if (tags != null) 'Tags': tags,
        if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
      },
    );

    return CreateDataSourceResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Kendra experience such as a search application. For more
  /// information on creating a search application experience, including using
  /// the Python and Java SDKs, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  ///
  /// Parameter [name] :
  /// A name for your Amazon Kendra experience.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create your Amazon
  /// Kendra experience. Multiple calls to the <code>CreateExperience</code> API
  /// with the same client token creates only one Amazon Kendra experience.
  ///
  /// Parameter [configuration] :
  /// Configuration information for your Amazon Kendra experience. This includes
  /// <code>ContentSourceConfiguration</code>, which specifies the data source
  /// IDs and/or FAQ IDs, and <code>UserIdentityConfiguration</code>, which
  /// specifies the user or group information to grant access to your Amazon
  /// Kendra experience.
  ///
  /// Parameter [description] :
  /// A description for your Amazon Kendra experience.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// <code>Query</code> API, <code>GetQuerySuggestions</code> API, and other
  /// required APIs. The role also must include permission to access IAM
  /// Identity Center that stores your user and group information. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// access roles for Amazon Kendra</a>.
  Future<CreateExperienceResponse> createExperience({
    required String indexId,
    required String name,
    String? clientToken,
    ExperienceConfiguration? configuration,
    String? description,
    String? roleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.CreateExperience'
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (configuration != null) 'Configuration': configuration,
        if (description != null) 'Description': description,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );

    return CreateExperienceResponse.fromJson(jsonResponse.body);
  }

  /// Creates a set of frequently ask questions (FAQs) using a specified FAQ
  /// file stored in an Amazon S3 bucket.
  ///
  /// Adding FAQs to an index is an asynchronous operation.
  ///
  /// For an example of adding an FAQ to an index using Python and Java SDKs,
  /// see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html#using-faq-file">Using
  /// your FAQ file</a>.
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
  /// The identifier of the index for the FAQ.
  ///
  /// Parameter [name] :
  /// A name for the FAQ.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// the S3 bucket that contains the FAQs. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// access roles for Amazon Kendra</a>.
  ///
  /// Parameter [s3Path] :
  /// The path to the FAQ file in S3.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a FAQ. Multiple
  /// calls to the <code>CreateFaqRequest</code> API with the same client token
  /// will create only one FAQ.
  ///
  /// Parameter [description] :
  /// A description for the FAQ.
  ///
  /// Parameter [fileFormat] :
  /// The format of the FAQ input file. You can choose between a basic CSV
  /// format, a CSV format that includes customs attributes in a header, and a
  /// JSON format that includes custom attributes.
  ///
  /// The default format is CSV.
  ///
  /// The format must match the format of the file stored in the S3 bucket
  /// identified in the <code>S3Path</code> parameter.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-creating-faq.html">Adding
  /// questions and answers</a>.
  ///
  /// Parameter [languageCode] :
  /// The code for a language. This allows you to support a language for the FAQ
  /// document. English is supported by default. For more information on
  /// supported languages, including their codes, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html">Adding
  /// documents in languages other than English</a>.
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
    String? languageCode,
    List<Tag>? tags,
  }) async {
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
        if (languageCode != null) 'LanguageCode': languageCode,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFaqResponse.fromJson(jsonResponse.body);
  }

  /// Creates a set of featured results to display at the top of the search
  /// results page. Featured results are placed above all other results for
  /// certain queries. You map specific queries to specific documents for
  /// featuring in the results. If a query contains an exact match, then one or
  /// more specific documents are featured in the search results.
  ///
  /// You can create up to 50 sets of featured results per index. You can
  /// request to increase this limit by contacting <a
  /// href="http://aws.amazon.com/contact-us/">Support</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [FeaturedResultsConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [featuredResultsSetName] :
  /// A name for the set of featured results.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index that you want to use for featuring results.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a set of
  /// featured results. Multiple calls to the
  /// <code>CreateFeaturedResultsSet</code> API with the same client token will
  /// create only one featured results set.
  ///
  /// Parameter [description] :
  /// A description for the set of featured results.
  ///
  /// Parameter [featuredDocuments] :
  /// A list of document IDs for the documents you want to feature at the top of
  /// the search results page. For more information on the list of documents,
  /// see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html">FeaturedResultsSet</a>.
  ///
  /// Parameter [queryTexts] :
  /// A list of queries for featuring results. For more information on the list
  /// of queries, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html">FeaturedResultsSet</a>.
  ///
  /// Parameter [status] :
  /// The current status of the set of featured results. When the value is
  /// <code>ACTIVE</code>, featured results are ready for use. You can still
  /// configure your settings before setting the status to <code>ACTIVE</code>.
  /// You can set the status to <code>ACTIVE</code> or <code>INACTIVE</code>
  /// using the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html">UpdateFeaturedResultsSet</a>
  /// API. The queries you specify for featured results must be unique per
  /// featured results set for each index, whether the status is
  /// <code>ACTIVE</code> or <code>INACTIVE</code>.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the featured results
  /// set. You can also use tags to help control access to the featured results
  /// set. Tag keys and values can consist of Unicode letters, digits, white
  /// space, and any of the following symbols:_ . : / = + - @.
  Future<CreateFeaturedResultsSetResponse> createFeaturedResultsSet({
    required String featuredResultsSetName,
    required String indexId,
    String? clientToken,
    String? description,
    List<FeaturedDocument>? featuredDocuments,
    List<String>? queryTexts,
    FeaturedResultsSetStatus? status,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.CreateFeaturedResultsSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FeaturedResultsSetName': featuredResultsSetName,
        'IndexId': indexId,
        if (clientToken != null) 'ClientToken': clientToken,
        if (description != null) 'Description': description,
        if (featuredDocuments != null) 'FeaturedDocuments': featuredDocuments,
        if (queryTexts != null) 'QueryTexts': queryTexts,
        if (status != null) 'Status': status.toValue(),
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFeaturedResultsSetResponse.fromJson(jsonResponse.body);
  }

  /// Creates an Amazon Kendra index. Index creation is an asynchronous API. To
  /// determine if index creation has completed, check the <code>Status</code>
  /// field returned from a call to <code>DescribeIndex</code>. The
  /// <code>Status</code> field is set to <code>ACTIVE</code> when the index is
  /// ready to use.
  ///
  /// Once the index is active, you can index your documents using the
  /// <code>BatchPutDocument</code> API or using one of the supported <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-sources.html">data
  /// sources</a>.
  ///
  /// For an example of creating an index and data source using the Python SDK,
  /// see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/gs-python.html">Getting
  /// started with Python SDK</a>. For an example of creating an index and data
  /// source using the Java SDK, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/gs-java.html">Getting
  /// started with Java SDK</a>.
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
  /// A name for the index.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// your Amazon CloudWatch logs and metrics. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// access roles for Amazon Kendra</a>.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create an index.
  /// Multiple calls to the <code>CreateIndex</code> API with the same client
  /// token will create only one index.
  ///
  /// Parameter [description] :
  /// A description for the index.
  ///
  /// Parameter [edition] :
  /// The Amazon Kendra edition to use for the index. Choose
  /// <code>DEVELOPER_EDITION</code> for indexes intended for development,
  /// testing, or proof of concept. Use <code>ENTERPRISE_EDITION</code> for
  /// production. Once you set the edition for an index, it can't be changed.
  ///
  /// The <code>Edition</code> parameter is optional. If you don't supply a
  /// value, the default is <code>ENTERPRISE_EDITION</code>.
  ///
  /// For more information on quota limits for Enterprise and Developer
  /// editions, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/quotas.html">Quotas</a>.
  ///
  /// Parameter [serverSideEncryptionConfiguration] :
  /// The identifier of the KMS customer managed key (CMK) that's used to
  /// encrypt data indexed by Amazon Kendra. Amazon Kendra doesn't support
  /// asymmetric CMKs.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the index. You can
  /// also use tags to help control access to the index. Tag keys and values can
  /// consist of Unicode letters, digits, white space, and any of the following
  /// symbols: _ . : / = + - @.
  ///
  /// Parameter [userContextPolicy] :
  /// The user context policy.
  /// <dl> <dt>ATTRIBUTE_FILTER</dt> <dd>
  /// All indexed content is searchable and displayable for all users. If you
  /// want to filter search results on user context, you can use the attribute
  /// filters of <code>_user_id</code> and <code>_group_ids</code> or you can
  /// provide user and group information in <code>UserContext</code>.
  /// </dd> <dt>USER_TOKEN</dt> <dd>
  /// Enables token-based user access control to filter search results on user
  /// context. All documents with no access control and all documents accessible
  /// to the user will be searchable and displayable.
  /// </dd> </dl>
  ///
  /// Parameter [userGroupResolutionConfiguration] :
  /// Gets users and groups from IAM Identity Center identity source. To
  /// configure this, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UserGroupResolutionConfiguration.html">UserGroupResolutionConfiguration</a>.
  /// This is useful for user context filtering, where search results are
  /// filtered based on the user or their group access to documents.
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
    UserGroupResolutionConfiguration? userGroupResolutionConfiguration,
    List<UserTokenConfiguration>? userTokenConfigurations,
  }) async {
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
        if (userGroupResolutionConfiguration != null)
          'UserGroupResolutionConfiguration': userGroupResolutionConfiguration,
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
  /// <code>CreateQuerySuggestionsBlockList</code> is currently not supported in
  /// the Amazon Web Services GovCloud (US-West) region.
  ///
  /// For an example of creating a block list for query suggestions using the
  /// Python SDK, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/query-suggestions.html#query-suggestions-blocklist">Query
  /// suggestions block list</a>.
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
  /// A name for the block list.
  ///
  /// For example, the name 'offensive-words', which includes all offensive
  /// words that could appear in user queries and need to be blocked from
  /// suggestions.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// your S3 bucket that contains the block list text file. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// access roles for Amazon Kendra</a>.
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
  /// A description for the block list.
  ///
  /// For example, the description "List of all offensive words that can appear
  /// in user queries and need to be blocked from suggestions."
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the block list. Tag
  /// keys and values can consist of Unicode letters, digits, white space, and
  /// any of the following symbols: _ . : / = + - @.
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
  /// For an example of adding a thesaurus file to an index, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/index-synonyms-adding-thesaurus-file.html">Adding
  /// custom synonyms to an index</a>.
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
  /// The identifier of the index for the thesaurus.
  ///
  /// Parameter [name] :
  /// A name for the thesaurus.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role with permission to access
  /// your S3 bucket that contains the thesaurus file. For more information, see
  /// <a href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// access roles for Amazon Kendra</a>.
  ///
  /// Parameter [sourceS3Path] :
  /// The path to the thesaurus file in S3.
  ///
  /// Parameter [clientToken] :
  /// A token that you provide to identify the request to create a thesaurus.
  /// Multiple calls to the <code>CreateThesaurus</code> API with the same
  /// client token will create only one thesaurus.
  ///
  /// Parameter [description] :
  /// A description for the thesaurus.
  ///
  /// Parameter [tags] :
  /// A list of key-value pairs that identify or categorize the thesaurus. You
  /// can also use tags to help control access to the thesaurus. Tag keys and
  /// values can consist of Unicode letters, digits, white space, and any of the
  /// following symbols: _ . : / = + - @.
  Future<CreateThesaurusResponse> createThesaurus({
    required String indexId,
    required String name,
    required String roleArn,
    required S3Path sourceS3Path,
    String? clientToken,
    String? description,
    List<Tag>? tags,
  }) async {
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

  /// Deletes an access control configuration that you created for your
  /// documents in an index. This includes user and group access information for
  /// your documents. This is useful for user context filtering, where search
  /// results are filtered based on the user or their group access to documents.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the access control configuration you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for an access control configuration.
  Future<void> deleteAccessControlConfiguration({
    required String id,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSKendraFrontendService.DeleteAccessControlConfiguration'
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

  /// Deletes an Amazon Kendra data source connector. An exception is not thrown
  /// if the data source is already being deleted. While the data source is
  /// being deleted, the <code>Status</code> field returned by a call to the
  /// <code>DescribeDataSource</code> API is set to <code>DELETING</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/delete-data-source.html">Deleting
  /// Data Sources</a>.
  ///
  /// Deleting an entire data source or re-syncing your index after deleting
  /// specific documents from a data source could take up to an hour or more,
  /// depending on the number of documents you want to delete.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the data source connector you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the data source connector.
  Future<void> deleteDataSource({
    required String id,
    required String indexId,
  }) async {
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

  /// Deletes your Amazon Kendra experience such as a search application. For
  /// more information on creating a search application experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  Future<void> deleteExperience({
    required String id,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeleteExperience'
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
  /// The identifier of the FAQ you want to remove.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the FAQ.
  Future<void> deleteFaq({
    required String id,
    required String indexId,
  }) async {
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

  /// Deletes an Amazon Kendra index. An exception is not thrown if the index is
  /// already being deleted. While the index is being deleted, the
  /// <code>Status</code> field returned by a call to the
  /// <code>DescribeIndex</code> API is set to <code>DELETING</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the index you want to delete.
  Future<void> deleteIndex({
    required String id,
  }) async {
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

  /// Deletes a group so that all users and sub groups that belong to the group
  /// can no longer access documents only available to that group.
  ///
  /// For example, after deleting the group "Summer Interns", all interns who
  /// belonged to that group no longer see intern-only documents in their search
  /// results.
  ///
  /// If you want to delete or replace users or sub groups of a group, you need
  /// to use the <code>PutPrincipalMapping</code> operation. For example, if a
  /// user in the group "Engineering" leaves the engineering team and another
  /// user takes their place, you provide an updated list of users or sub groups
  /// that belong to the "Engineering" group when calling
  /// <code>PutPrincipalMapping</code>. You can update your internal list of
  /// users or sub groups and input this list when calling
  /// <code>PutPrincipalMapping</code>.
  ///
  /// <code>DeletePrincipalMapping</code> is currently not supported in the
  /// Amazon Web Services GovCloud (US-West) region.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the group you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index you want to delete a group from.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source you want to delete a group from.
  ///
  /// A group can be tied to multiple data sources. You can delete a group from
  /// accessing documents in a certain data source. For example, the groups
  /// "Research", "Engineering", and "Sales and Marketing" are all tied to the
  /// company's documents stored in the data sources Confluence and Salesforce.
  /// You want to delete "Research" and "Engineering" groups from Salesforce, so
  /// that these groups cannot access customer-related documents stored in
  /// Salesforce. Only "Sales and Marketing" should access documents in the
  /// Salesforce data source.
  ///
  /// Parameter [orderingId] :
  /// The timestamp identifier you specify to ensure Amazon Kendra does not
  /// override the latest <code>DELETE</code> action with previous actions. The
  /// highest number ID, which is the ordering ID, is the latest action you want
  /// to process and apply on top of other actions with lower number IDs. This
  /// prevents previous actions with lower number IDs from possibly overriding
  /// the latest action.
  ///
  /// The ordering ID can be the Unix time of the last update you made to a
  /// group members list. You would then provide this list when calling
  /// <code>PutPrincipalMapping</code>. This ensures your <code>DELETE</code>
  /// action for that updated group with the latest members list doesn't get
  /// overwritten by earlier <code>DELETE</code> actions for the same group
  /// which are yet to be processed.
  ///
  /// The default ordering ID is the current Unix time in milliseconds that the
  /// action was received by Amazon Kendra.
  Future<void> deletePrincipalMapping({
    required String groupId,
    required String indexId,
    String? dataSourceId,
    int? orderingId,
  }) async {
    _s.validateNumRange(
      'orderingId',
      orderingId,
      0,
      32535158400000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DeletePrincipalMapping'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'IndexId': indexId,
        if (dataSourceId != null) 'DataSourceId': dataSourceId,
        if (orderingId != null) 'OrderingId': orderingId,
      },
    );
  }

  /// Deletes a block list used for query suggestions for an index.
  ///
  /// A deleted block list might not take effect right away. Amazon Kendra needs
  /// to refresh the entire suggestions list to add back the queries that were
  /// previously blocked.
  ///
  /// <code>DeleteQuerySuggestionsBlockList</code> is currently not supported in
  /// the Amazon Web Services GovCloud (US-West) region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the block list you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the block list.
  Future<void> deleteQuerySuggestionsBlockList({
    required String id,
    required String indexId,
  }) async {
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

  /// Deletes an Amazon Kendra thesaurus.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the thesaurus you want to delete.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the thesaurus.
  Future<void> deleteThesaurus({
    required String id,
    required String indexId,
  }) async {
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

  /// Gets information about an access control configuration that you created
  /// for your documents in an index. This includes user and group access
  /// information for your documents. This is useful for user context filtering,
  /// where search results are filtered based on the user or their group access
  /// to documents.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the access control configuration you want to get
  /// information on.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for an access control configuration.
  Future<DescribeAccessControlConfigurationResponse>
      describeAccessControlConfiguration({
    required String id,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSKendraFrontendService.DescribeAccessControlConfiguration'
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

    return DescribeAccessControlConfigurationResponse.fromJson(
        jsonResponse.body);
  }

  /// Gets information about an Amazon Kendra data source connector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the data source connector.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the data source connector.
  Future<DescribeDataSourceResponse> describeDataSource({
    required String id,
    required String indexId,
  }) async {
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

  /// Gets information about your Amazon Kendra experience such as a search
  /// application. For more information on creating a search application
  /// experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience you want to get
  /// information on.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  Future<DescribeExperienceResponse> describeExperience({
    required String id,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DescribeExperience'
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

    return DescribeExperienceResponse.fromJson(jsonResponse.body);
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
  /// The identifier of the FAQ you want to get information on.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the FAQ.
  Future<DescribeFaqResponse> describeFaq({
    required String id,
    required String indexId,
  }) async {
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

  /// Gets information about a set of featured results. Features results are
  /// placed above all other results for certain queries. If there's an exact
  /// match of a query, then one or more specific documents are featured in the
  /// search results.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [featuredResultsSetId] :
  /// The identifier of the set of featured results that you want to get
  /// information on.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used for featuring results.
  Future<DescribeFeaturedResultsSetResponse> describeFeaturedResultsSet({
    required String featuredResultsSetId,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DescribeFeaturedResultsSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FeaturedResultsSetId': featuredResultsSetId,
        'IndexId': indexId,
      },
    );

    return DescribeFeaturedResultsSetResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about an Amazon Kendra index.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the index you want to get information on.
  Future<DescribeIndexResponse> describeIndex({
    required String id,
  }) async {
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

  /// Describes the processing of <code>PUT</code> and <code>DELETE</code>
  /// actions for mapping users to their groups. This includes information on
  /// the status of actions currently processing or yet to be processed, when
  /// actions were last updated, when actions were received by Amazon Kendra,
  /// the latest action that should process and apply after other actions, and
  /// useful error messages if an action could not be processed.
  ///
  /// <code>DescribePrincipalMapping</code> is currently not supported in the
  /// Amazon Web Services GovCloud (US-West) region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the group required to check the processing of
  /// <code>PUT</code> and <code>DELETE</code> actions for mapping users to
  /// their groups.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index required to check the processing of
  /// <code>PUT</code> and <code>DELETE</code> actions for mapping users to
  /// their groups.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source to check the processing of
  /// <code>PUT</code> and <code>DELETE</code> actions for mapping users to
  /// their groups.
  Future<DescribePrincipalMappingResponse> describePrincipalMapping({
    required String groupId,
    required String indexId,
    String? dataSourceId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.DescribePrincipalMapping'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'IndexId': indexId,
        if (dataSourceId != null) 'DataSourceId': dataSourceId,
      },
    );

    return DescribePrincipalMappingResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a block list used for query suggestions for an
  /// index.
  ///
  /// This is used to check the current settings that are applied to a block
  /// list.
  ///
  /// <code>DescribeQuerySuggestionsBlockList</code> is currently not supported
  /// in the Amazon Web Services GovCloud (US-West) region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the block list you want to get information on.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the block list.
  Future<DescribeQuerySuggestionsBlockListResponse>
      describeQuerySuggestionsBlockList({
    required String id,
    required String indexId,
  }) async {
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

  /// Gets information on the settings of query suggestions for an index.
  ///
  /// This is used to check the current settings applied to query suggestions.
  ///
  /// <code>DescribeQuerySuggestionsConfig</code> is currently not supported in
  /// the Amazon Web Services GovCloud (US-West) region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index with query suggestions that you want to get
  /// information on.
  Future<DescribeQuerySuggestionsConfigResponse>
      describeQuerySuggestionsConfig({
    required String indexId,
  }) async {
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

  /// Gets information about an Amazon Kendra thesaurus.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the thesaurus you want to get information on.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the thesaurus.
  Future<DescribeThesaurusResponse> describeThesaurus({
    required String id,
    required String indexId,
  }) async {
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

  /// Prevents users or groups in your IAM Identity Center identity source from
  /// accessing your Amazon Kendra experience. You can create an Amazon Kendra
  /// experience such as a search application. For more information on creating
  /// a search application experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityList] :
  /// Lists users or groups in your IAM Identity Center identity source.
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  Future<DisassociateEntitiesFromExperienceResponse>
      disassociateEntitiesFromExperience({
    required List<EntityConfiguration> entityList,
    required String id,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSKendraFrontendService.DisassociateEntitiesFromExperience'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityList': entityList,
        'Id': id,
        'IndexId': indexId,
      },
    );

    return DisassociateEntitiesFromExperienceResponse.fromJson(
        jsonResponse.body);
  }

  /// Removes the specific permissions of users or groups in your IAM Identity
  /// Center identity source with access to your Amazon Kendra experience. You
  /// can create an Amazon Kendra experience such as a search application. For
  /// more information on creating a search application experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [entityIds] :
  /// The identifiers of users or groups in your IAM Identity Center identity
  /// source. For example, user IDs could be user emails.
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  Future<DisassociatePersonasFromEntitiesResponse>
      disassociatePersonasFromEntities({
    required List<String> entityIds,
    required String id,
    required String indexId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSKendraFrontendService.DisassociatePersonasFromEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'EntityIds': entityIds,
        'Id': id,
        'IndexId': indexId,
      },
    );

    return DisassociatePersonasFromEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Fetches the queries that are suggested to your users.
  ///
  /// <code>GetQuerySuggestions</code> is currently not supported in the Amazon
  /// Web Services GovCloud (US-West) region.
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
  /// Parameter [attributeSuggestionsConfig] :
  /// Configuration information for the document fields/attributes that you want
  /// to base query suggestions on.
  ///
  /// Parameter [maxSuggestionsCount] :
  /// The maximum number of query suggestions you want to show to your users.
  ///
  /// Parameter [suggestionTypes] :
  /// The suggestions type to base query suggestions on. The suggestion types
  /// are query history or document fields/attributes. You can set one type or
  /// the other.
  ///
  /// If you set query history as your suggestions type, Amazon Kendra suggests
  /// queries relevant to your users based on popular queries in the query
  /// history.
  ///
  /// If you set document fields/attributes as your suggestions type, Amazon
  /// Kendra suggests queries relevant to your users based on the contents of
  /// document fields.
  Future<GetQuerySuggestionsResponse> getQuerySuggestions({
    required String indexId,
    required String queryText,
    AttributeSuggestionsGetConfig? attributeSuggestionsConfig,
    int? maxSuggestionsCount,
    List<SuggestionType>? suggestionTypes,
  }) async {
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
        if (attributeSuggestionsConfig != null)
          'AttributeSuggestionsConfig': attributeSuggestionsConfig,
        if (maxSuggestionsCount != null)
          'MaxSuggestionsCount': maxSuggestionsCount,
        if (suggestionTypes != null)
          'SuggestionTypes': suggestionTypes.map((e) => e.toValue()).toList(),
      },
    );

    return GetQuerySuggestionsResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves search metrics data. The data provides a snapshot of how your
  /// users interact with your search application and how effective the
  /// application is.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index to get search metrics data.
  ///
  /// Parameter [interval] :
  /// The time interval or time window to get search metrics data. The time
  /// interval uses the time zone of your index. You can view data in the
  /// following time windows:
  ///
  /// <ul>
  /// <li>
  /// <code>THIS_WEEK</code>: The current week, starting on the Sunday and
  /// ending on the day before the current date.
  /// </li>
  /// <li>
  /// <code>ONE_WEEK_AGO</code>: The previous week, starting on the Sunday and
  /// ending on the following Saturday.
  /// </li>
  /// <li>
  /// <code>TWO_WEEKS_AGO</code>: The week before the previous week, starting on
  /// the Sunday and ending on the following Saturday.
  /// </li>
  /// <li>
  /// <code>THIS_MONTH</code>: The current month, starting on the first day of
  /// the month and ending on the day before the current date.
  /// </li>
  /// <li>
  /// <code>ONE_MONTH_AGO</code>: The previous month, starting on the first day
  /// of the month and ending on the last day of the month.
  /// </li>
  /// <li>
  /// <code>TWO_MONTHS_AGO</code>: The month before the previous month, starting
  /// on the first day of the month and ending on last day of the month.
  /// </li>
  /// </ul>
  ///
  /// Parameter [metricType] :
  /// The metric you want to retrieve. You can specify only one metric per call.
  ///
  /// For more information about the metrics you can view, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/search-analytics.html">Gaining
  /// insights with search analytics</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of returned data for the metric.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of search metrics
  /// data.
  Future<GetSnapshotsResponse> getSnapshots({
    required String indexId,
    required Interval interval,
    required MetricType metricType,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.GetSnapshots'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
        'Interval': interval.toValue(),
        'MetricType': metricType.toValue(),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetSnapshotsResponse.fromJson(jsonResponse.body);
  }

  /// Lists one or more access control configurations for an index. This
  /// includes user and group access information for your documents. This is
  /// useful for user context filtering, where search results are filtered based
  /// on the user or their group access to documents.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the access control configuration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of access control configurations to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there's more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of access control
  /// configurations.
  Future<ListAccessControlConfigurationsResponse>
      listAccessControlConfigurations({
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListAccessControlConfigurations'
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

    return ListAccessControlConfigurationsResponse.fromJson(jsonResponse.body);
  }

  /// Gets statistics about synchronizing a data source connector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the data source connector.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the data source connector.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of synchronization jobs to return in the response. If
  /// there are fewer results in the list, this response contains only the
  /// actual results.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of jobs.
  ///
  /// Parameter [startTimeFilter] :
  /// When specified, the synchronization jobs returned in the list are limited
  /// to jobs between the specified dates.
  ///
  /// Parameter [statusFilter] :
  /// Only returns synchronization jobs with the <code>Status</code> field equal
  /// to the specified status.
  Future<ListDataSourceSyncJobsResponse> listDataSourceSyncJobs({
    required String id,
    required String indexId,
    int? maxResults,
    String? nextToken,
    TimeRange? startTimeFilter,
    DataSourceSyncJobStatus? statusFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
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

  /// Lists the data source connectors that you have created.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with one or more data source connectors.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data source connectors to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of data source
  /// connectors.
  Future<ListDataSourcesResponse> listDataSources({
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Lists specific permissions of users and groups with access to your Amazon
  /// Kendra experience.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of returned users or groups.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of users or groups.
  Future<ListEntityPersonasResponse> listEntityPersonas({
    required String id,
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListEntityPersonas'
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
      },
    );

    return ListEntityPersonasResponse.fromJson(jsonResponse.body);
  }

  /// Lists users or groups in your IAM Identity Center identity source that are
  /// granted access to your Amazon Kendra experience. You can create an Amazon
  /// Kendra experience such as a search application. For more information on
  /// creating a search application experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of users or groups.
  Future<ListExperienceEntitiesResponse> listExperienceEntities({
    required String id,
    required String indexId,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListExperienceEntities'
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
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListExperienceEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Lists one or more Amazon Kendra experiences. You can create an Amazon
  /// Kendra experience such as a search application. For more information on
  /// creating a search application experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of returned Amazon Kendra experiences.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of Amazon Kendra
  /// experiences.
  Future<ListExperiencesResponse> listExperiences({
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListExperiences'
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

    return ListExperiencesResponse.fromJson(jsonResponse.body);
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
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of FAQs.
  Future<ListFaqsResponse> listFaqs({
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Lists all your sets of featured results for a given index. Features
  /// results are placed above all other results for certain queries. If there's
  /// an exact match of a query, then one or more specific documents are
  /// featured in the search results.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used for featuring results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of featured results sets to return.
  ///
  /// Parameter [nextToken] :
  /// If the response is truncated, Amazon Kendra returns a pagination token in
  /// the response. You can use this pagination token to retrieve the next set
  /// of featured results sets.
  Future<ListFeaturedResultsSetsResponse> listFeaturedResultsSets({
    required String indexId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListFeaturedResultsSets'
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

    return ListFeaturedResultsSetsResponse.fromJson(jsonResponse.body);
  }

  /// Provides a list of groups that are mapped to users before a given ordering
  /// or timestamp identifier.
  ///
  /// <code>ListGroupsOlderThanOrderingId</code> is currently not supported in
  /// the Amazon Web Services GovCloud (US-West) region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for getting a list of groups mapped to users
  /// before a given ordering or timestamp identifier.
  ///
  /// Parameter [orderingId] :
  /// The timestamp identifier used for the latest <code>PUT</code> or
  /// <code>DELETE</code> action for mapping users to their groups.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source for getting a list of groups mapped to
  /// users before a given ordering timestamp identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of returned groups that are mapped to users before a
  /// given ordering or timestamp identifier.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of groups that are
  /// mapped to users before a given ordering or timestamp identifier.
  Future<ListGroupsOlderThanOrderingIdResponse> listGroupsOlderThanOrderingId({
    required String indexId,
    required int orderingId,
    String? dataSourceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'orderingId',
      orderingId,
      0,
      32535158400000,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      10,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.ListGroupsOlderThanOrderingId'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'IndexId': indexId,
        'OrderingId': orderingId,
        if (dataSourceId != null) 'DataSourceId': dataSourceId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListGroupsOlderThanOrderingIdResponse.fromJson(jsonResponse.body);
  }

  /// Lists the Amazon Kendra indexes that you created.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of indices to return.
  ///
  /// Parameter [nextToken] :
  /// If the previous response was incomplete (because there is more data to
  /// retrieve), Amazon Kendra returns a pagination token in the response. You
  /// can use this pagination token to retrieve the next set of indexes.
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
  /// <code>ListQuerySuggestionsBlockLists</code> is currently not supported in
  /// the Amazon Web Services GovCloud (US-West) region.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Lists the thesauri for an index.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index with one or more thesauri.
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
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
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

  /// Maps users to their groups so that you only need to provide the user ID
  /// when you issue the query.
  ///
  /// You can also map sub groups to groups. For example, the group "Company
  /// Intellectual Property Teams" includes sub groups "Research" and
  /// "Engineering". These sub groups include their own list of users or people
  /// who work in these teams. Only users who work in research and engineering,
  /// and therefore belong in the intellectual property group, can see
  /// top-secret company documents in their search results.
  ///
  /// This is useful for user context filtering, where search results are
  /// filtered based on the user or their group access to documents. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html">Filtering
  /// on user context</a>.
  ///
  /// If more than five <code>PUT</code> actions for a group are currently
  /// processing, a validation exception is thrown.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [groupId] :
  /// The identifier of the group you want to map its users to.
  ///
  /// Parameter [groupMembers] :
  /// The list that contains your users or sub groups that belong the same
  /// group.
  ///
  /// For example, the group "Company" includes the user "CEO" and the sub
  /// groups "Research", "Engineering", and "Sales and Marketing".
  ///
  /// If you have more than 1000 users and/or sub groups for a single group, you
  /// need to provide the path to the S3 file that lists your users and sub
  /// groups for a group. Your sub groups can contain more than 1000 users, but
  /// the list of sub groups that belong to a group (and/or users) must be no
  /// more than 1000.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index you want to map users to their groups.
  ///
  /// Parameter [dataSourceId] :
  /// The identifier of the data source you want to map users to their groups.
  ///
  /// This is useful if a group is tied to multiple data sources, but you only
  /// want the group to access documents of a certain data source. For example,
  /// the groups "Research", "Engineering", and "Sales and Marketing" are all
  /// tied to the company's documents stored in the data sources Confluence and
  /// Salesforce. However, "Sales and Marketing" team only needs access to
  /// customer-related documents stored in Salesforce.
  ///
  /// Parameter [orderingId] :
  /// The timestamp identifier you specify to ensure Amazon Kendra does not
  /// override the latest <code>PUT</code> action with previous actions. The
  /// highest number ID, which is the ordering ID, is the latest action you want
  /// to process and apply on top of other actions with lower number IDs. This
  /// prevents previous actions with lower number IDs from possibly overriding
  /// the latest action.
  ///
  /// The ordering ID can be the Unix time of the last update you made to a
  /// group members list. You would then provide this list when calling
  /// <code>PutPrincipalMapping</code>. This ensures your <code>PUT</code>
  /// action for that updated group with the latest members list doesn't get
  /// overwritten by earlier <code>PUT</code> actions for the same group which
  /// are yet to be processed.
  ///
  /// The default ordering ID is the current Unix time in milliseconds that the
  /// action was received by Amazon Kendra.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role that has access to the S3 file
  /// that contains your list of users or sub groups that belong to a group.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html#iam-roles-ds">IAM
  /// roles for Amazon Kendra</a>.
  Future<void> putPrincipalMapping({
    required String groupId,
    required GroupMembers groupMembers,
    required String indexId,
    String? dataSourceId,
    int? orderingId,
    String? roleArn,
  }) async {
    _s.validateNumRange(
      'orderingId',
      orderingId,
      0,
      32535158400000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.PutPrincipalMapping'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'GroupId': groupId,
        'GroupMembers': groupMembers,
        'IndexId': indexId,
        if (dataSourceId != null) 'DataSourceId': dataSourceId,
        if (orderingId != null) 'OrderingId': orderingId,
        if (roleArn != null) 'RoleArn': roleArn,
      },
    );
  }

  /// Searches an index given an input query.
  /// <note>
  /// If you are working with large language models (LLMs) or implementing
  /// retrieval augmented generation (RAG) systems, you can use Amazon Kendra's
  /// <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_Retrieve.html">Retrieve</a>
  /// API, which can return longer semantically relevant passages. We recommend
  /// using the <code>Retrieve</code> API instead of filing a service limit
  /// increase to increase the <code>Query</code> API document excerpt length.
  /// </note>
  /// You can configure boosting or relevance tuning at the query level to
  /// override boosting at the index level, filter based on document
  /// fields/attributes and faceted search, and filter based on the user or
  /// their group access to documents. You can also include certain fields in
  /// the response that might provide useful additional information.
  ///
  /// A query response contains three types of results.
  ///
  /// <ul>
  /// <li>
  /// Relevant suggested answers. The answers can be either a text excerpt or
  /// table excerpt. The answer can be highlighted in the excerpt.
  /// </li>
  /// <li>
  /// Matching FAQs or questions-answer from your FAQ file.
  /// </li>
  /// <li>
  /// Relevant documents. This result type includes an excerpt of the document
  /// with the document title. The searched terms can be highlighted in the
  /// excerpt.
  /// </li>
  /// </ul>
  /// You can specify that the query return only one type of result using the
  /// <code>QueryResultTypeFilter</code> parameter. Each query returns the 100
  /// most relevant results. If you filter result type to only question-answers,
  /// a maximum of four results are returned. If you filter result type to only
  /// answers, a maximum of three results are returned.
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
  /// The identifier of the index for the search.
  ///
  /// Parameter [attributeFilter] :
  /// Filters search results by document fields/attributes. You can only provide
  /// one attribute filter; however, the <code>AndAllFilters</code>,
  /// <code>NotFilter</code>, and <code>OrAllFilters</code> parameters contain a
  /// list of other filters.
  ///
  /// The <code>AttributeFilter</code> parameter means you can create a set of
  /// filtering rules that a document must satisfy to be included in the query
  /// results.
  ///
  /// Parameter [collapseConfiguration] :
  /// Provides configuration to determine how to group results by document
  /// attribute value, and how to display them (collapsed or expanded) under a
  /// designated primary document for each group.
  ///
  /// Parameter [documentRelevanceOverrideConfigurations] :
  /// Overrides relevance tuning configurations of fields/attributes set at the
  /// index level.
  ///
  /// If you use this API to override the relevance tuning configured at the
  /// index level, but there is no relevance tuning configured at the index
  /// level, then Amazon Kendra does not apply any relevance tuning.
  ///
  /// If there is relevance tuning configured for fields at the index level, and
  /// you use this API to override only some of these fields, then for the
  /// fields you did not override, the importance is set to 1.
  ///
  /// Parameter [facets] :
  /// An array of documents fields/attributes for faceted search. Amazon Kendra
  /// returns a count for each field key specified. This helps your users narrow
  /// their search.
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
  /// Sets the type of query result or response. Only results for the specified
  /// type are returned.
  ///
  /// Parameter [queryText] :
  /// The input query text for the search. Amazon Kendra truncates queries at 30
  /// token words, which excludes punctuation and stop words. Truncation still
  /// applies if you use Boolean or more advanced, complex queries. For example,
  /// <code>Timeoff AND October AND Category:HR</code> is counted as 3 tokens:
  /// <code>timeoff</code>, <code>october</code>, <code>hr</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax">Searching
  /// with advanced query syntax</a> in the Amazon Kendra Developer Guide.
  ///
  /// Parameter [requestedDocumentAttributes] :
  /// An array of document fields/attributes to include in the response. You can
  /// limit the response to include certain document fields. By default, all
  /// document attributes are included in the response.
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
  /// Parameter [sortingConfigurations] :
  /// Provides configuration information to determine how the results of a query
  /// are sorted.
  ///
  /// You can set upto 3 fields that Amazon Kendra should sort the results on,
  /// and specify whether the results should be sorted in ascending or
  /// descending order. The sort field quota can be increased.
  ///
  /// If you don't provide a sorting configuration, the results are sorted by
  /// the relevance that Amazon Kendra determines for the result. In the case of
  /// ties in sorting the results, the results are sorted by relevance.
  ///
  /// Parameter [spellCorrectionConfiguration] :
  /// Enables suggested spell corrections for queries.
  ///
  /// Parameter [userContext] :
  /// The user context token or user and group information.
  ///
  /// Parameter [visitorId] :
  /// Provides an identifier for a specific user. The <code>VisitorId</code>
  /// should be a unique identifier, such as a GUID. Don't use personally
  /// identifiable information, such as the user's email address, as the
  /// <code>VisitorId</code>.
  Future<QueryResult> query({
    required String indexId,
    AttributeFilter? attributeFilter,
    CollapseConfiguration? collapseConfiguration,
    List<DocumentRelevanceConfiguration>?
        documentRelevanceOverrideConfigurations,
    List<Facet>? facets,
    int? pageNumber,
    int? pageSize,
    QueryResultType? queryResultTypeFilter,
    String? queryText,
    List<String>? requestedDocumentAttributes,
    SortingConfiguration? sortingConfiguration,
    List<SortingConfiguration>? sortingConfigurations,
    SpellCorrectionConfiguration? spellCorrectionConfiguration,
    UserContext? userContext,
    String? visitorId,
  }) async {
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
        if (attributeFilter != null) 'AttributeFilter': attributeFilter,
        if (collapseConfiguration != null)
          'CollapseConfiguration': collapseConfiguration,
        if (documentRelevanceOverrideConfigurations != null)
          'DocumentRelevanceOverrideConfigurations':
              documentRelevanceOverrideConfigurations,
        if (facets != null) 'Facets': facets,
        if (pageNumber != null) 'PageNumber': pageNumber,
        if (pageSize != null) 'PageSize': pageSize,
        if (queryResultTypeFilter != null)
          'QueryResultTypeFilter': queryResultTypeFilter.toValue(),
        if (queryText != null) 'QueryText': queryText,
        if (requestedDocumentAttributes != null)
          'RequestedDocumentAttributes': requestedDocumentAttributes,
        if (sortingConfiguration != null)
          'SortingConfiguration': sortingConfiguration,
        if (sortingConfigurations != null)
          'SortingConfigurations': sortingConfigurations,
        if (spellCorrectionConfiguration != null)
          'SpellCorrectionConfiguration': spellCorrectionConfiguration,
        if (userContext != null) 'UserContext': userContext,
        if (visitorId != null) 'VisitorId': visitorId,
      },
    );

    return QueryResult.fromJson(jsonResponse.body);
  }

  /// Retrieves relevant passages or text excerpts given an input query.
  ///
  /// This API is similar to the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_Query.html">Query</a>
  /// API. However, by default, the <code>Query</code> API only returns excerpt
  /// passages of up to 100 token words. With the <code>Retrieve</code> API, you
  /// can retrieve longer passages of up to 200 token words and up to 100
  /// semantically relevant passages. This doesn't include question-answer or
  /// FAQ type responses from your index. The passages are text excerpts that
  /// can be semantically extracted from multiple documents and multiple parts
  /// of the same document. If in extreme cases your documents produce zero
  /// passages using the <code>Retrieve</code> API, you can alternatively use
  /// the <code>Query</code> API and its types of responses.
  ///
  /// You can also do the following:
  ///
  /// <ul>
  /// <li>
  /// Override boosting at the index level
  /// </li>
  /// <li>
  /// Filter based on document fields or attributes
  /// </li>
  /// <li>
  /// Filter based on the user or their group access to documents
  /// </li>
  /// <li>
  /// View the confidence score bucket for a retrieved passage result. The
  /// confidence bucket provides a relative ranking that indicates how confident
  /// Amazon Kendra is that the response is relevant to the query.
  /// <note>
  /// Confidence score buckets are currently available only for English.
  /// </note> </li>
  /// </ul>
  /// You can also include certain fields in the response that might provide
  /// useful additional information.
  ///
  /// The <code>Retrieve</code> API shares the number of <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_CapacityUnitsConfiguration.html">query
  /// capacity units</a> that you set for your index. For more information on
  /// what's included in a single capacity unit and the default base capacity
  /// for an index, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html">Adjusting
  /// capacity</a>.
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
  /// The identifier of the index to retrieve relevant passages for the search.
  ///
  /// Parameter [queryText] :
  /// The input query text to retrieve relevant passages for the search. Amazon
  /// Kendra truncates queries at 30 token words, which excludes punctuation and
  /// stop words. Truncation still applies if you use Boolean or more advanced,
  /// complex queries. For example, <code>Timeoff AND October AND
  /// Category:HR</code> is counted as 3 tokens: <code>timeoff</code>,
  /// <code>october</code>, <code>hr</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax">Searching
  /// with advanced query syntax</a> in the Amazon Kendra Developer Guide.
  ///
  /// Parameter [attributeFilter] :
  /// Filters search results by document fields/attributes. You can only provide
  /// one attribute filter; however, the <code>AndAllFilters</code>,
  /// <code>NotFilter</code>, and <code>OrAllFilters</code> parameters contain a
  /// list of other filters.
  ///
  /// The <code>AttributeFilter</code> parameter means you can create a set of
  /// filtering rules that a document must satisfy to be included in the query
  /// results.
  ///
  /// Parameter [documentRelevanceOverrideConfigurations] :
  /// Overrides relevance tuning configurations of fields/attributes set at the
  /// index level.
  ///
  /// If you use this API to override the relevance tuning configured at the
  /// index level, but there is no relevance tuning configured at the index
  /// level, then Amazon Kendra does not apply any relevance tuning.
  ///
  /// If there is relevance tuning configured for fields at the index level, and
  /// you use this API to override only some of these fields, then for the
  /// fields you did not override, the importance is set to 1.
  ///
  /// Parameter [pageNumber] :
  /// Retrieved relevant passages are returned in pages the size of the
  /// <code>PageSize</code> parameter. By default, Amazon Kendra returns the
  /// first page of results. Use this parameter to get result pages after the
  /// first one.
  ///
  /// Parameter [pageSize] :
  /// Sets the number of retrieved relevant passages that are returned in each
  /// page of results. The default page size is 10. The maximum number of
  /// results returned is 100. If you ask for more than 100 results, only 100
  /// are returned.
  ///
  /// Parameter [requestedDocumentAttributes] :
  /// A list of document fields/attributes to include in the response. You can
  /// limit the response to include certain document fields. By default, all
  /// document fields are included in the response.
  ///
  /// Parameter [userContext] :
  /// The user context token or user and group information.
  Future<RetrieveResult> retrieve({
    required String indexId,
    required String queryText,
    AttributeFilter? attributeFilter,
    List<DocumentRelevanceConfiguration>?
        documentRelevanceOverrideConfigurations,
    int? pageNumber,
    int? pageSize,
    List<String>? requestedDocumentAttributes,
    UserContext? userContext,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.Retrieve'
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
        if (pageNumber != null) 'PageNumber': pageNumber,
        if (pageSize != null) 'PageSize': pageSize,
        if (requestedDocumentAttributes != null)
          'RequestedDocumentAttributes': requestedDocumentAttributes,
        if (userContext != null) 'UserContext': userContext,
      },
    );

    return RetrieveResult.fromJson(jsonResponse.body);
  }

  /// Starts a synchronization job for a data source connector. If a
  /// synchronization job is already in progress, Amazon Kendra returns a
  /// <code>ResourceInUseException</code> exception.
  ///
  /// Re-syncing your data source with your index after modifying, adding, or
  /// deleting documents from your data source respository could take up to an
  /// hour or more, depending on the number of documents to sync.
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
  /// The identifier of the data source connector to synchronize.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the data source connector.
  Future<StartDataSourceSyncJobResponse> startDataSourceSyncJob({
    required String id,
    required String indexId,
  }) async {
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

  /// Stops a synchronization job that is currently running. You can't stop a
  /// scheduled synchronization job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the data source connector for which to stop the
  /// synchronization jobs.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the data source connector.
  Future<void> stopDataSourceSyncJob({
    required String id,
    required String indexId,
  }) async {
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
  /// performance of your index.
  ///
  /// <code>SubmitFeedback</code> is currently not supported in the Amazon Web
  /// Services GovCloud (US-West) region.
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
  /// <code>Query</code> API.
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

  /// Updates an access control configuration for your documents in an index.
  /// This includes user and group access information for your documents. This
  /// is useful for user context filtering, where search results are filtered
  /// based on the user or their group access to documents.
  ///
  /// You can update an access control configuration you created without
  /// indexing all of your documents again. For example, your index contains
  /// top-secret company documents that only certain employees or users should
  /// access. You created an 'allow' access control configuration for one user
  /// who recently joined the 'top-secret' team, switching from a team with
  /// 'deny' access to top-secret documents. However, the user suddenly returns
  /// to their previous team and should no longer have access to top secret
  /// documents. You can update the access control configuration to re-configure
  /// access control for your documents as circumstances change.
  ///
  /// You call the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html">BatchPutDocument</a>
  /// API to apply the updated access control configuration, with the
  /// <code>AccessControlConfigurationId</code> included in the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Document.html">Document</a>
  /// object. If you use an S3 bucket as a data source, you synchronize your
  /// data source to apply the <code>AccessControlConfigurationId</code> in the
  /// <code>.metadata.json</code> file. Amazon Kendra currently only supports
  /// access control configuration for S3 data sources and documents indexed
  /// using the <code>BatchPutDocument</code> API.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the access control configuration you want to update.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for an access control configuration.
  ///
  /// Parameter [accessControlList] :
  /// Information you want to update on principals (users and/or groups) and
  /// which documents they should have access to. This is useful for user
  /// context filtering, where search results are filtered based on the user or
  /// their group access to documents.
  ///
  /// Parameter [description] :
  /// A new description for the access control configuration.
  ///
  /// Parameter [hierarchicalAccessControlList] :
  /// The updated list of <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html">principal</a>
  /// lists that define the hierarchy for which documents users should have
  /// access to.
  ///
  /// Parameter [name] :
  /// A new name for the access control configuration.
  Future<void> updateAccessControlConfiguration({
    required String id,
    required String indexId,
    List<Principal>? accessControlList,
    String? description,
    List<HierarchicalPrincipal>? hierarchicalAccessControlList,
    String? name,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSKendraFrontendService.UpdateAccessControlConfiguration'
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
        if (accessControlList != null) 'AccessControlList': accessControlList,
        if (description != null) 'Description': description,
        if (hierarchicalAccessControlList != null)
          'HierarchicalAccessControlList': hierarchicalAccessControlList,
        if (name != null) 'Name': name,
      },
    );
  }

  /// Updates an Amazon Kendra data source connector.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the data source connector you want to update.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used with the data source connector.
  ///
  /// Parameter [configuration] :
  /// Configuration information you want to update for the data source
  /// connector.
  ///
  /// Parameter [customDocumentEnrichmentConfiguration] :
  /// Configuration information you want to update for altering document
  /// metadata and content during the document ingestion process.
  ///
  /// For more information on how to create, modify and delete document
  /// metadata, or make other content alterations when you ingest documents into
  /// Amazon Kendra, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html">Customizing
  /// document metadata during the ingestion process</a>.
  ///
  /// Parameter [description] :
  /// A new description for the data source connector.
  ///
  /// Parameter [languageCode] :
  /// The code for a language you want to update for the data source connector.
  /// This allows you to support a language for all documents when updating the
  /// data source. English is supported by default. For more information on
  /// supported languages, including their codes, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html">Adding
  /// documents in languages other than English</a>.
  ///
  /// Parameter [name] :
  /// A new name for the data source connector.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access the
  /// data source and required resources. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// roles for Amazon Kendra</a>.
  ///
  /// Parameter [schedule] :
  /// The sync schedule you want to update for the data source connector.
  ///
  /// Parameter [vpcConfiguration] :
  /// Configuration information for an Amazon Virtual Private Cloud to connect
  /// to your data source. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  Future<void> updateDataSource({
    required String id,
    required String indexId,
    DataSourceConfiguration? configuration,
    CustomDocumentEnrichmentConfiguration?
        customDocumentEnrichmentConfiguration,
    String? description,
    String? languageCode,
    String? name,
    String? roleArn,
    String? schedule,
    DataSourceVpcConfiguration? vpcConfiguration,
  }) async {
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
        if (customDocumentEnrichmentConfiguration != null)
          'CustomDocumentEnrichmentConfiguration':
              customDocumentEnrichmentConfiguration,
        if (description != null) 'Description': description,
        if (languageCode != null) 'LanguageCode': languageCode,
        if (name != null) 'Name': name,
        if (roleArn != null) 'RoleArn': roleArn,
        if (schedule != null) 'Schedule': schedule,
        if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
      },
    );
  }

  /// Updates your Amazon Kendra experience such as a search application. For
  /// more information on creating a search application experience, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
  /// a search experience with no code</a>.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of your Amazon Kendra experience you want to update.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for your Amazon Kendra experience.
  ///
  /// Parameter [configuration] :
  /// Configuration information you want to update for your Amazon Kendra
  /// experience.
  ///
  /// Parameter [description] :
  /// A new description for your Amazon Kendra experience.
  ///
  /// Parameter [name] :
  /// A new name for your Amazon Kendra experience.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of a role with permission to access
  /// <code>Query</code> API, <code>QuerySuggestions</code> API,
  /// <code>SubmitFeedback</code> API, and IAM Identity Center that stores your
  /// user and group information. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// roles for Amazon Kendra</a>.
  Future<void> updateExperience({
    required String id,
    required String indexId,
    ExperienceConfiguration? configuration,
    String? description,
    String? name,
    String? roleArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateExperience'
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
      },
    );
  }

  /// Updates a set of featured results. Features results are placed above all
  /// other results for certain queries. You map specific queries to specific
  /// documents for featuring in the results. If a query contains an exact match
  /// of a query, then one or more specific documents are featured in the search
  /// results.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [FeaturedResultsConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [featuredResultsSetId] :
  /// The identifier of the set of featured results that you want to update.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index used for featuring results.
  ///
  /// Parameter [description] :
  /// A new description for the set of featured results.
  ///
  /// Parameter [featuredDocuments] :
  /// A list of document IDs for the documents you want to feature at the top of
  /// the search results page. For more information on the list of featured
  /// documents, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html">FeaturedResultsSet</a>.
  ///
  /// Parameter [featuredResultsSetName] :
  /// A new name for the set of featured results.
  ///
  /// Parameter [queryTexts] :
  /// A list of queries for featuring results. For more information on the list
  /// of queries, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html">FeaturedResultsSet</a>.
  ///
  /// Parameter [status] :
  /// You can set the status to <code>ACTIVE</code> or <code>INACTIVE</code>.
  /// When the value is <code>ACTIVE</code>, featured results are ready for use.
  /// You can still configure your settings before setting the status to
  /// <code>ACTIVE</code>. The queries you specify for featured results must be
  /// unique per featured results set for each index, whether the status is
  /// <code>ACTIVE</code> or <code>INACTIVE</code>.
  Future<UpdateFeaturedResultsSetResponse> updateFeaturedResultsSet({
    required String featuredResultsSetId,
    required String indexId,
    String? description,
    List<FeaturedDocument>? featuredDocuments,
    String? featuredResultsSetName,
    List<String>? queryTexts,
    FeaturedResultsSetStatus? status,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSKendraFrontendService.UpdateFeaturedResultsSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FeaturedResultsSetId': featuredResultsSetId,
        'IndexId': indexId,
        if (description != null) 'Description': description,
        if (featuredDocuments != null) 'FeaturedDocuments': featuredDocuments,
        if (featuredResultsSetName != null)
          'FeaturedResultsSetName': featuredResultsSetName,
        if (queryTexts != null) 'QueryTexts': queryTexts,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return UpdateFeaturedResultsSetResponse.fromJson(jsonResponse.body);
  }

  /// Updates an Amazon Kendra index.
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
  /// The identifier of the index you want to update.
  ///
  /// Parameter [capacityUnits] :
  /// Sets the number of additional document storage and query capacity units
  /// that should be used by the index. You can change the capacity of the index
  /// up to 5 times per day, or make 5 API calls.
  ///
  /// If you are using extra storage units, you can't reduce the storage
  /// capacity below what is required to meet the storage needs for your index.
  ///
  /// Parameter [description] :
  /// A new description for the index.
  ///
  /// Parameter [documentMetadataConfigurationUpdates] :
  /// The document metadata configuration you want to update for the index.
  /// Document metadata are fields or attributes associated with your documents.
  /// For example, the company department name associated with each document.
  ///
  /// Parameter [name] :
  /// A new name for the index.
  ///
  /// Parameter [roleArn] :
  /// An Identity and Access Management (IAM) role that gives Amazon Kendra
  /// permission to access Amazon CloudWatch logs and metrics.
  ///
  /// Parameter [userContextPolicy] :
  /// The user context policy.
  ///
  /// Parameter [userGroupResolutionConfiguration] :
  /// Gets users and groups from IAM Identity Center identity source. To
  /// configure this, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UserGroupResolutionConfiguration.html">UserGroupResolutionConfiguration</a>.
  /// This is useful for user context filtering, where search results are
  /// filtered based on the user or their group access to documents.
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
    UserGroupResolutionConfiguration? userGroupResolutionConfiguration,
    List<UserTokenConfiguration>? userTokenConfigurations,
  }) async {
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
        if (userGroupResolutionConfiguration != null)
          'UserGroupResolutionConfiguration': userGroupResolutionConfiguration,
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
  /// <code>UpdateQuerySuggestionsBlockList</code> is currently not supported in
  /// the Amazon Web Services GovCloud (US-West) region.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the block list you want to update.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the block list.
  ///
  /// Parameter [description] :
  /// A new description for the block list.
  ///
  /// Parameter [name] :
  /// A new name for the block list.
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
  /// If an update is currently processing, you need to wait for the update to
  /// finish before making another update.
  ///
  /// Updates to query suggestions settings might not take effect right away.
  /// The time for your updated settings to take effect depends on the updates
  /// made and the number of search queries in your index.
  ///
  /// You can still enable/disable query suggestions at any time.
  ///
  /// <code>UpdateQuerySuggestionsConfig</code> is currently not supported in
  /// the Amazon Web Services GovCloud (US-West) region.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [indexId] :
  /// The identifier of the index with query suggestions you want to update.
  ///
  /// Parameter [attributeSuggestionsConfig] :
  /// Configuration information for the document fields/attributes that you want
  /// to base query suggestions on.
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
    AttributeSuggestionsUpdateConfig? attributeSuggestionsConfig,
    bool? includeQueriesWithoutUserInformation,
    int? minimumNumberOfQueryingUsers,
    int? minimumQueryCount,
    Mode? mode,
    int? queryLogLookBackWindowInDays,
  }) async {
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
        if (attributeSuggestionsConfig != null)
          'AttributeSuggestionsConfig': attributeSuggestionsConfig,
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

  /// Updates a thesaurus for an index.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [id] :
  /// The identifier of the thesaurus you want to update.
  ///
  /// Parameter [indexId] :
  /// The identifier of the index for the thesaurus.
  ///
  /// Parameter [description] :
  /// A new description for the thesaurus.
  ///
  /// Parameter [name] :
  /// A new name for the thesaurus.
  ///
  /// Parameter [roleArn] :
  /// An IAM role that gives Amazon Kendra permissions to access thesaurus file
  /// specified in <code>SourceS3Path</code>.
  Future<void> updateThesaurus({
    required String id,
    required String indexId,
    String? description,
    String? name,
    String? roleArn,
    S3Path? sourceS3Path,
  }) async {
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

/// Summary information on an access control configuration that you created for
/// your documents in an index.
class AccessControlConfigurationSummary {
  /// The identifier of the access control configuration.
  final String id;

  AccessControlConfigurationSummary({
    required this.id,
  });

  factory AccessControlConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return AccessControlConfigurationSummary(
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

/// Access Control List files for the documents in a data source. For the format
/// of the file, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html">Access
/// control for S3 data sources</a>.
class AccessControlListConfiguration {
  /// Path to the Amazon S3 bucket that contains the ACL files.
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
  /// <code>Query</code> API.
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

extension AdditionalResultAttributeValueTypeValueExtension
    on AdditionalResultAttributeValueType {
  String toValue() {
    switch (this) {
      case AdditionalResultAttributeValueType.textWithHighlightsValue:
        return 'TEXT_WITH_HIGHLIGHTS_VALUE';
    }
  }
}

extension AdditionalResultAttributeValueTypeFromString on String {
  AdditionalResultAttributeValueType toAdditionalResultAttributeValueType() {
    switch (this) {
      case 'TEXT_WITH_HIGHLIGHTS_VALUE':
        return AdditionalResultAttributeValueType.textWithHighlightsValue;
    }
    throw Exception(
        '$this is not known in enum AdditionalResultAttributeValueType');
  }
}

/// Provides the configuration information to connect to Alfresco as your data
/// source.
/// <note>
/// Support for <code>AlfrescoConfiguration</code> ended May 2023. We recommend
/// migrating to or using the Alfresco data source template schema / <a
/// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
/// API.
/// </note>
class AlfrescoConfiguration {
  /// The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
  /// the key-value pairs required to connect to your Alfresco data source. The
  /// secret must contain a JSON structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// username—The user name of the Alfresco account.
  /// </li>
  /// <li>
  /// password—The password of the Alfresco account.
  /// </li>
  /// </ul>
  final String secretArn;

  /// The identifier of the Alfresco site. For example, <i>my-site</i>.
  final String siteId;

  /// The URL of the Alfresco site. For example, <i>https://hostname:8080</i>.
  final String siteUrl;

  /// The path to the SSL certificate stored in an Amazon S3 bucket. You use this
  /// to connect to Alfresco if you require a secure SSL connection.
  ///
  /// You can simply generate a self-signed X509 certificate on any computer using
  /// OpenSSL. For an example of using OpenSSL to create an X509 certificate, see
  /// <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html">Create
  /// and sign an X509 certificate</a>.
  final S3Path sslCertificateS3Path;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Alfresco blogs to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Alfresco fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">
  /// Mapping data source fields</a>. The Alfresco data source field names must
  /// exist in your Alfresco custom metadata.
  final List<DataSourceToIndexFieldMapping>? blogFieldMappings;

  /// <code>TRUE</code> to index comments of blogs and other content.
  final bool? crawlComments;

  /// <code>TRUE</code> to index shared files.
  final bool? crawlSystemFolders;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Alfresco document libraries to Amazon Kendra
  /// index field names. To create custom fields, use the <code>UpdateIndex</code>
  /// API before you map to Alfresco fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">
  /// Mapping data source fields</a>. The Alfresco data source field names must
  /// exist in your Alfresco custom metadata.
  final List<DataSourceToIndexFieldMapping>? documentLibraryFieldMappings;

  /// Specify whether to index document libraries, wikis, or blogs. You can
  /// specify one or more of these options.
  final List<AlfrescoEntity>? entityFilter;

  /// A list of regular expression patterns to exclude certain files in your
  /// Alfresco data source. Files that match the patterns are excluded from the
  /// index. Files that don't match the patterns are included in the index. If a
  /// file matches both an inclusion pattern and an exclusion pattern, the
  /// exclusion pattern takes precedence and the file isn't included in the index.
  final List<String>? exclusionPatterns;

  /// A list of regular expression patterns to include certain files in your
  /// Alfresco data source. Files that match the patterns are included in the
  /// index. Files that don't match the patterns are excluded from the index. If a
  /// file matches both an inclusion pattern and an exclusion pattern, the
  /// exclusion pattern takes precedence and the file isn't included in the index.
  final List<String>? inclusionPatterns;

  /// Configuration information for an Amazon Virtual Private Cloud to connect to
  /// your Alfresco. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Alfresco wikis to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Alfresco fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">
  /// Mapping data source fields</a>. The Alfresco data source field names must
  /// exist in your Alfresco custom metadata.
  final List<DataSourceToIndexFieldMapping>? wikiFieldMappings;

  AlfrescoConfiguration({
    required this.secretArn,
    required this.siteId,
    required this.siteUrl,
    required this.sslCertificateS3Path,
    this.blogFieldMappings,
    this.crawlComments,
    this.crawlSystemFolders,
    this.documentLibraryFieldMappings,
    this.entityFilter,
    this.exclusionPatterns,
    this.inclusionPatterns,
    this.vpcConfiguration,
    this.wikiFieldMappings,
  });

  factory AlfrescoConfiguration.fromJson(Map<String, dynamic> json) {
    return AlfrescoConfiguration(
      secretArn: json['SecretArn'] as String,
      siteId: json['SiteId'] as String,
      siteUrl: json['SiteUrl'] as String,
      sslCertificateS3Path:
          S3Path.fromJson(json['SslCertificateS3Path'] as Map<String, dynamic>),
      blogFieldMappings: (json['BlogFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      crawlComments: json['CrawlComments'] as bool?,
      crawlSystemFolders: json['CrawlSystemFolders'] as bool?,
      documentLibraryFieldMappings: (json['DocumentLibraryFieldMappings']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      entityFilter: (json['EntityFilter'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAlfrescoEntity())
          .toList(),
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
      wikiFieldMappings: (json['WikiFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final siteId = this.siteId;
    final siteUrl = this.siteUrl;
    final sslCertificateS3Path = this.sslCertificateS3Path;
    final blogFieldMappings = this.blogFieldMappings;
    final crawlComments = this.crawlComments;
    final crawlSystemFolders = this.crawlSystemFolders;
    final documentLibraryFieldMappings = this.documentLibraryFieldMappings;
    final entityFilter = this.entityFilter;
    final exclusionPatterns = this.exclusionPatterns;
    final inclusionPatterns = this.inclusionPatterns;
    final vpcConfiguration = this.vpcConfiguration;
    final wikiFieldMappings = this.wikiFieldMappings;
    return {
      'SecretArn': secretArn,
      'SiteId': siteId,
      'SiteUrl': siteUrl,
      'SslCertificateS3Path': sslCertificateS3Path,
      if (blogFieldMappings != null) 'BlogFieldMappings': blogFieldMappings,
      if (crawlComments != null) 'CrawlComments': crawlComments,
      if (crawlSystemFolders != null) 'CrawlSystemFolders': crawlSystemFolders,
      if (documentLibraryFieldMappings != null)
        'DocumentLibraryFieldMappings': documentLibraryFieldMappings,
      if (entityFilter != null)
        'EntityFilter': entityFilter.map((e) => e.toValue()).toList(),
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
      if (wikiFieldMappings != null) 'WikiFieldMappings': wikiFieldMappings,
    };
  }
}

enum AlfrescoEntity {
  wiki,
  blog,
  documentLibrary,
}

extension AlfrescoEntityValueExtension on AlfrescoEntity {
  String toValue() {
    switch (this) {
      case AlfrescoEntity.wiki:
        return 'wiki';
      case AlfrescoEntity.blog:
        return 'blog';
      case AlfrescoEntity.documentLibrary:
        return 'documentLibrary';
    }
  }
}

extension AlfrescoEntityFromString on String {
  AlfrescoEntity toAlfrescoEntity() {
    switch (this) {
      case 'wiki':
        return AlfrescoEntity.wiki;
      case 'blog':
        return AlfrescoEntity.blog;
      case 'documentLibrary':
        return AlfrescoEntity.documentLibrary;
    }
    throw Exception('$this is not known in enum AlfrescoEntity');
  }
}

class AssociateEntitiesToExperienceResponse {
  /// Lists the users or groups in your IAM Identity Center identity source that
  /// failed to properly configure with your Amazon Kendra experience.
  final List<FailedEntity>? failedEntityList;

  AssociateEntitiesToExperienceResponse({
    this.failedEntityList,
  });

  factory AssociateEntitiesToExperienceResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateEntitiesToExperienceResponse(
      failedEntityList: (json['FailedEntityList'] as List?)
          ?.whereNotNull()
          .map((e) => FailedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedEntityList = this.failedEntityList;
    return {
      if (failedEntityList != null) 'FailedEntityList': failedEntityList,
    };
  }
}

class AssociatePersonasToEntitiesResponse {
  /// Lists the users or groups in your IAM Identity Center identity source that
  /// failed to properly configure with your Amazon Kendra experience.
  final List<FailedEntity>? failedEntityList;

  AssociatePersonasToEntitiesResponse({
    this.failedEntityList,
  });

  factory AssociatePersonasToEntitiesResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociatePersonasToEntitiesResponse(
      failedEntityList: (json['FailedEntityList'] as List?)
          ?.whereNotNull()
          .map((e) => FailedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedEntityList = this.failedEntityList;
    return {
      if (failedEntityList != null) 'FailedEntityList': failedEntityList,
    };
  }
}

/// Filters the search results based on document attributes or fields.
///
/// You can filter results using attributes for your particular documents. The
/// attributes must exist in your index. For example, if your documents include
/// the custom attribute "Department", you can filter documents that belong to
/// the "HR" department. You would use the <code>EqualsTo</code> operation to
/// filter results or documents with "Department" equals to "HR".
///
/// You can use <code>AndAllFilters</code> and <code>AndOrFilters</code> in
/// combination with each other or with other operations such as
/// <code>EqualsTo</code>. For example:
///
/// <code>AndAllFilters</code>
///
/// <ul>
/// <li>
/// <code>EqualsTo</code>: "Department", "HR"
/// </li>
/// <li>
/// <code>AndOrFilters</code>
///
/// <ul>
/// <li>
/// <code>ContainsAny</code>: "Project Name", ["new hires", "new hiring"]
/// </li>
/// </ul> </li>
/// </ul>
/// This example filters results or documents that belong to the HR department
/// <i>and</i> belong to projects that contain "new hires" <i>or</i> "new
/// hiring" in the project name (must use <code>ContainAny</code> with
/// <code>StringListValue</code>). This example is filtering with a depth of 2.
///
/// You cannot filter more than a depth of 2, otherwise you receive a
/// <code>ValidationException</code> exception with the message "AttributeFilter
/// cannot have a depth of more than 2." Also, if you use more than 10 attribute
/// filters in a given list for <code>AndAllFilters</code> or
/// <code>OrAllFilters</code>, you receive a <code>ValidationException</code>
/// with the message "AttributeFilter cannot have a length of more than 10".
///
/// For examples of using <code>AttributeFilter</code>, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/filtering.html#search-filtering">Using
/// document attributes to filter search results</a>.
class AttributeFilter {
  /// Performs a logical <code>AND</code> operation on all filters that you
  /// specify.
  final List<AttributeFilter>? andAllFilters;

  /// Returns true when a document contains all of the specified document
  /// attributes/fields. This filter is only applicable to <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html">StringListValue</a>.
  final DocumentAttribute? containsAll;

  /// Returns true when a document contains any of the specified document
  /// attributes/fields. This filter is only applicable to <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html">StringListValue</a>.
  final DocumentAttribute? containsAny;

  /// Performs an equals operation on document attributes/fields and their values.
  final DocumentAttribute? equalsTo;

  /// Performs a greater than operation on document attributes/fields and their
  /// values. Use with the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html">document
  /// attribute type</a> <code>Date</code> or <code>Long</code>.
  final DocumentAttribute? greaterThan;

  /// Performs a greater or equals than operation on document attributes/fields
  /// and their values. Use with the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html">document
  /// attribute type</a> <code>Date</code> or <code>Long</code>.
  final DocumentAttribute? greaterThanOrEquals;

  /// Performs a less than operation on document attributes/fields and their
  /// values. Use with the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html">document
  /// attribute type</a> <code>Date</code> or <code>Long</code>.
  final DocumentAttribute? lessThan;

  /// Performs a less than or equals operation on document attributes/fields and
  /// their values. Use with the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_DocumentAttributeValue.html">document
  /// attribute type</a> <code>Date</code> or <code>Long</code>.
  final DocumentAttribute? lessThanOrEquals;

  /// Performs a logical <code>NOT</code> operation on all filters that you
  /// specify.
  final AttributeFilter? notFilter;

  /// Performs a logical <code>OR</code> operation on all filters that you
  /// specify.
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

/// Gets information on the configuration of document fields/attributes that you
/// want to base query suggestions on. To change your configuration, use <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_AttributeSuggestionsUpdateConfig.html">AttributeSuggestionsUpdateConfig</a>
/// and then call <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html">UpdateQuerySuggestionsConfig</a>.
class AttributeSuggestionsDescribeConfig {
  /// The mode is set to either <code>ACTIVE</code> or <code>INACTIVE</code>. If
  /// the <code>Mode</code> for query history is set to <code>ENABLED</code> when
  /// calling <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html">UpdateQuerySuggestionsConfig</a>
  /// and <code>AttributeSuggestionsMode</code> to use fields/attributes is set to
  /// <code>ACTIVE</code>, and you haven't set your <code>SuggestionTypes</code>
  /// preference to <code>DOCUMENT_ATTRIBUTES</code>, then Amazon Kendra uses the
  /// query history.
  final AttributeSuggestionsMode? attributeSuggestionsMode;

  /// The list of fields/attributes that you want to set as suggestible for query
  /// suggestions.
  final List<SuggestableConfig>? suggestableConfigList;

  AttributeSuggestionsDescribeConfig({
    this.attributeSuggestionsMode,
    this.suggestableConfigList,
  });

  factory AttributeSuggestionsDescribeConfig.fromJson(
      Map<String, dynamic> json) {
    return AttributeSuggestionsDescribeConfig(
      attributeSuggestionsMode: (json['AttributeSuggestionsMode'] as String?)
          ?.toAttributeSuggestionsMode(),
      suggestableConfigList: (json['SuggestableConfigList'] as List?)
          ?.whereNotNull()
          .map((e) => SuggestableConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributeSuggestionsMode = this.attributeSuggestionsMode;
    final suggestableConfigList = this.suggestableConfigList;
    return {
      if (attributeSuggestionsMode != null)
        'AttributeSuggestionsMode': attributeSuggestionsMode.toValue(),
      if (suggestableConfigList != null)
        'SuggestableConfigList': suggestableConfigList,
    };
  }
}

/// Provides the configuration information for the document fields/attributes
/// that you want to base query suggestions on.
class AttributeSuggestionsGetConfig {
  /// The list of additional document field/attribute keys or field names to
  /// include in the response. You can use additional fields to provide extra
  /// information in the response. Additional fields are not used to based
  /// suggestions on.
  final List<String>? additionalResponseAttributes;

  /// Filters the search results based on document fields/attributes.
  final AttributeFilter? attributeFilter;

  /// The list of document field/attribute keys or field names to use for query
  /// suggestions. If the content within any of the fields match what your user
  /// starts typing as their query, then the field content is returned as a query
  /// suggestion.
  final List<String>? suggestionAttributes;

  /// Applies user context filtering so that only users who are given access to
  /// certain documents see these document in their search results.
  final UserContext? userContext;

  AttributeSuggestionsGetConfig({
    this.additionalResponseAttributes,
    this.attributeFilter,
    this.suggestionAttributes,
    this.userContext,
  });

  Map<String, dynamic> toJson() {
    final additionalResponseAttributes = this.additionalResponseAttributes;
    final attributeFilter = this.attributeFilter;
    final suggestionAttributes = this.suggestionAttributes;
    final userContext = this.userContext;
    return {
      if (additionalResponseAttributes != null)
        'AdditionalResponseAttributes': additionalResponseAttributes,
      if (attributeFilter != null) 'AttributeFilter': attributeFilter,
      if (suggestionAttributes != null)
        'SuggestionAttributes': suggestionAttributes,
      if (userContext != null) 'UserContext': userContext,
    };
  }
}

enum AttributeSuggestionsMode {
  active,
  inactive,
}

extension AttributeSuggestionsModeValueExtension on AttributeSuggestionsMode {
  String toValue() {
    switch (this) {
      case AttributeSuggestionsMode.active:
        return 'ACTIVE';
      case AttributeSuggestionsMode.inactive:
        return 'INACTIVE';
    }
  }
}

extension AttributeSuggestionsModeFromString on String {
  AttributeSuggestionsMode toAttributeSuggestionsMode() {
    switch (this) {
      case 'ACTIVE':
        return AttributeSuggestionsMode.active;
      case 'INACTIVE':
        return AttributeSuggestionsMode.inactive;
    }
    throw Exception('$this is not known in enum AttributeSuggestionsMode');
  }
}

/// Updates the configuration information for the document fields/attributes
/// that you want to base query suggestions on.
///
/// To deactivate using documents fields for query suggestions, set the mode to
/// <code>INACTIVE</code>. You must also set <code>SuggestionTypes</code> as
/// either <code>QUERY</code> or <code>DOCUMENT_ATTRIBUTES</code> and then call
/// <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html">GetQuerySuggestions</a>.
/// If you set to <code>QUERY</code>, then Amazon Kendra uses the query history
/// to base suggestions on. If you set to <code>DOCUMENT_ATTRIBUTES</code>, then
/// Amazon Kendra uses the contents of document fields to base suggestions on.
class AttributeSuggestionsUpdateConfig {
  /// You can set the mode to <code>ACTIVE</code> or <code>INACTIVE</code>. You
  /// must also set <code>SuggestionTypes</code> as either <code>QUERY</code> or
  /// <code>DOCUMENT_ATTRIBUTES</code> and then call <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html">GetQuerySuggestions</a>.
  /// If <code>Mode</code> to use query history is set to <code>ENABLED</code>
  /// when calling <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html">UpdateQuerySuggestionsConfig</a>
  /// and <code>AttributeSuggestionsMode</code> to use fields/attributes is set to
  /// <code>ACTIVE</code>, and you haven't set your <code>SuggestionTypes</code>
  /// preference to <code>DOCUMENT_ATTRIBUTES</code>, then Amazon Kendra uses the
  /// query history.
  final AttributeSuggestionsMode? attributeSuggestionsMode;

  /// The list of fields/attributes that you want to set as suggestible for query
  /// suggestions.
  final List<SuggestableConfig>? suggestableConfigList;

  AttributeSuggestionsUpdateConfig({
    this.attributeSuggestionsMode,
    this.suggestableConfigList,
  });

  Map<String, dynamic> toJson() {
    final attributeSuggestionsMode = this.attributeSuggestionsMode;
    final suggestableConfigList = this.suggestableConfigList;
    return {
      if (attributeSuggestionsMode != null)
        'AttributeSuggestionsMode': attributeSuggestionsMode.toValue(),
      if (suggestableConfigList != null)
        'SuggestableConfigList': suggestableConfigList,
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
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">Secrets
  /// Manager</a>
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
/// by the <code>BatchDeleteDocument</code> API.
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

/// Provides information about a set of featured results that couldn't be
/// removed from an index by the <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchDeleteFeaturedResultsSet.html">BatchDeleteFeaturedResultsSet</a>
/// API.
class BatchDeleteFeaturedResultsSetError {
  /// The error code for why the set of featured results couldn't be removed from
  /// the index.
  final ErrorCode errorCode;

  /// An explanation for why the set of featured results couldn't be removed from
  /// the index.
  final String errorMessage;

  /// The identifier of the set of featured results that couldn't be removed from
  /// the index.
  final String id;

  BatchDeleteFeaturedResultsSetError({
    required this.errorCode,
    required this.errorMessage,
    required this.id,
  });

  factory BatchDeleteFeaturedResultsSetError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteFeaturedResultsSetError(
      errorCode: (json['ErrorCode'] as String).toErrorCode(),
      errorMessage: json['ErrorMessage'] as String,
      id: json['Id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final id = this.id;
    return {
      'ErrorCode': errorCode.toValue(),
      'ErrorMessage': errorMessage,
      'Id': id,
    };
  }
}

class BatchDeleteFeaturedResultsSetResponse {
  /// The list of errors for the featured results set IDs, explaining why they
  /// couldn't be removed from the index.
  final List<BatchDeleteFeaturedResultsSetError> errors;

  BatchDeleteFeaturedResultsSetResponse({
    required this.errors,
  });

  factory BatchDeleteFeaturedResultsSetResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteFeaturedResultsSetResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) => BatchDeleteFeaturedResultsSetError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      'Errors': errors,
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
  /// The identifier of the document whose status could not be retrieved.
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
  /// your Amazon Web Services CloudWatch log. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/cloudwatch-logs.html">Monitoring
  /// Amazon Kendra with Amazon CloudWatch logs</a>.
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

  /// The identifier of the document.
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

/// Provides the configuration information to connect to Box as your data
/// source.
class BoxConfiguration {
  /// The identifier of the Box Enterprise platform. You can find the enterprise
  /// ID in the Box Developer Console settings or when you create an app in Box
  /// and download your authentication credentials. For example, <i>801234567</i>.
  final String enterpriseId;

  /// The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
  /// the key-value pairs required to connect to your Box platform. The secret
  /// must contain a JSON structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// clientID—The identifier of the client OAuth 2.0 authentication application
  /// created in Box.
  /// </li>
  /// <li>
  /// clientSecret—A set of characters known only to the OAuth 2.0 authentication
  /// application created in Box.
  /// </li>
  /// <li>
  /// publicKeyId—The identifier of the public key contained within an identity
  /// certificate.
  /// </li>
  /// <li>
  /// privateKey—A set of characters that make up an encryption key.
  /// </li>
  /// <li>
  /// passphrase—A set of characters that act like a password.
  /// </li>
  /// </ul>
  /// You create an application in Box to generate the keys or credentials
  /// required for the secret. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-box.html">Using
  /// a Box data source</a>.
  final String secretArn;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Box comments to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Box fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Box field names must exist in your Box custom
  /// metadata.
  final List<DataSourceToIndexFieldMapping>? commentFieldMappings;

  /// <code>TRUE</code> to index comments.
  final bool? crawlComments;

  /// <code>TRUE</code> to index the contents of tasks.
  final bool? crawlTasks;

  /// <code>TRUE</code> to index web links.
  final bool? crawlWebLinks;

  /// A list of regular expression patterns to exclude certain files and folders
  /// from your Box platform. Files and folders that match the patterns are
  /// excluded from the index.Files and folders that don't match the patterns are
  /// included in the index. If a file or folder matches both an inclusion and
  /// exclusion pattern, the exclusion pattern takes precedence and the file or
  /// folder isn't included in the index.
  final List<String>? exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Box files to Amazon Kendra index field names.
  /// To create custom fields, use the <code>UpdateIndex</code> API before you map
  /// to Box fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Box field names must exist in your Box custom
  /// metadata.
  final List<DataSourceToIndexFieldMapping>? fileFieldMappings;

  /// A list of regular expression patterns to include certain files and folders
  /// in your Box platform. Files and folders that match the patterns are included
  /// in the index. Files and folders that don't match the patterns are excluded
  /// from the index. If a file or folder matches both an inclusion and exclusion
  /// pattern, the exclusion pattern takes precedence and the file or folder isn't
  /// included in the index.
  final List<String>? inclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Box tasks to Amazon Kendra index field names.
  /// To create custom fields, use the <code>UpdateIndex</code> API before you map
  /// to Box fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Box field names must exist in your Box custom
  /// metadata.
  final List<DataSourceToIndexFieldMapping>? taskFieldMappings;

  /// <code>TRUE</code> to use the Slack change log to determine which documents
  /// require updating in the index. Depending on the data source change log's
  /// size, it may take longer for Amazon Kendra to use the change log than to
  /// scan all of your documents.
  final bool? useChangeLog;

  /// Configuration information for an Amazon VPC to connect to your Box. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Box web links to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Box fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Box field names must exist in your Box custom
  /// metadata.
  final List<DataSourceToIndexFieldMapping>? webLinkFieldMappings;

  BoxConfiguration({
    required this.enterpriseId,
    required this.secretArn,
    this.commentFieldMappings,
    this.crawlComments,
    this.crawlTasks,
    this.crawlWebLinks,
    this.exclusionPatterns,
    this.fileFieldMappings,
    this.inclusionPatterns,
    this.taskFieldMappings,
    this.useChangeLog,
    this.vpcConfiguration,
    this.webLinkFieldMappings,
  });

  factory BoxConfiguration.fromJson(Map<String, dynamic> json) {
    return BoxConfiguration(
      enterpriseId: json['EnterpriseId'] as String,
      secretArn: json['SecretArn'] as String,
      commentFieldMappings: (json['CommentFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      crawlComments: json['CrawlComments'] as bool?,
      crawlTasks: json['CrawlTasks'] as bool?,
      crawlWebLinks: json['CrawlWebLinks'] as bool?,
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      fileFieldMappings: (json['FileFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      taskFieldMappings: (json['TaskFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      useChangeLog: json['UseChangeLog'] as bool?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
      webLinkFieldMappings: (json['WebLinkFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final enterpriseId = this.enterpriseId;
    final secretArn = this.secretArn;
    final commentFieldMappings = this.commentFieldMappings;
    final crawlComments = this.crawlComments;
    final crawlTasks = this.crawlTasks;
    final crawlWebLinks = this.crawlWebLinks;
    final exclusionPatterns = this.exclusionPatterns;
    final fileFieldMappings = this.fileFieldMappings;
    final inclusionPatterns = this.inclusionPatterns;
    final taskFieldMappings = this.taskFieldMappings;
    final useChangeLog = this.useChangeLog;
    final vpcConfiguration = this.vpcConfiguration;
    final webLinkFieldMappings = this.webLinkFieldMappings;
    return {
      'EnterpriseId': enterpriseId,
      'SecretArn': secretArn,
      if (commentFieldMappings != null)
        'CommentFieldMappings': commentFieldMappings,
      if (crawlComments != null) 'CrawlComments': crawlComments,
      if (crawlTasks != null) 'CrawlTasks': crawlTasks,
      if (crawlWebLinks != null) 'CrawlWebLinks': crawlWebLinks,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (fileFieldMappings != null) 'FileFieldMappings': fileFieldMappings,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (taskFieldMappings != null) 'TaskFieldMappings': taskFieldMappings,
      if (useChangeLog != null) 'UseChangeLog': useChangeLog,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
      if (webLinkFieldMappings != null)
        'WebLinkFieldMappings': webLinkFieldMappings,
    };
  }
}

/// Specifies additional capacity units configured for your Enterprise Edition
/// index. You can add and remove capacity units to fit your usage requirements.
class CapacityUnitsConfiguration {
  /// The amount of extra query capacity for an index and <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_GetQuerySuggestions.html">GetQuerySuggestions</a>
  /// capacity.
  ///
  /// A single extra capacity unit for an index provides 0.1 queries per second or
  /// approximately 8,000 queries per day. You can add up to 100 extra capacity
  /// units.
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
  /// first. You can add up to 100 extra capacity units.
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
/// Your application uses the <code>SubmitFeedback</code> API to provide click
/// information.
class ClickFeedback {
  /// The Unix timestamp when the result was clicked.
  final DateTime clickTime;

  /// The identifier of the search result that was clicked.
  final String resultId;

  ClickFeedback({
    required this.clickTime,
    required this.resultId,
  });

  Map<String, dynamic> toJson() {
    final clickTime = this.clickTime;
    final resultId = this.resultId;
    return {
      'ClickTime': unixTimestampToJson(clickTime),
      'ResultId': resultId,
    };
  }
}

/// Specifies how to group results by document attribute value, and how to
/// display them collapsed/expanded under a designated primary document for each
/// group.
class CollapseConfiguration {
  /// The document attribute used to group search results. You can use any
  /// attribute that has the <code>Sortable</code> flag set to true. You can also
  /// sort by any of the following built-in attributes:"_category","_created_at",
  /// "_last_updated_at", "_version", "_view_count".
  final String documentAttributeKey;

  /// Specifies whether to expand the collapsed results.
  final bool? expand;

  /// Provides configuration information to customize expansion options for a
  /// collapsed group.
  final ExpandConfiguration? expandConfiguration;

  /// Specifies the behavior for documents without a value for the collapse
  /// attribute.
  ///
  /// Amazon Kendra offers three customization options:
  ///
  /// <ul>
  /// <li>
  /// Choose to <code>COLLAPSE</code> all documents with null or missing values in
  /// one group. This is the default configuration.
  /// </li>
  /// <li>
  /// Choose to <code>IGNORE</code> documents with null or missing values. Ignored
  /// documents will not appear in query results.
  /// </li>
  /// <li>
  /// Choose to <code>EXPAND</code> each document with a null or missing value
  /// into a group of its own.
  /// </li>
  /// </ul>
  final MissingAttributeKeyStrategy? missingAttributeKeyStrategy;

  /// A prioritized list of document attributes/fields that determine the primary
  /// document among those in a collapsed group.
  final List<SortingConfiguration>? sortingConfigurations;

  CollapseConfiguration({
    required this.documentAttributeKey,
    this.expand,
    this.expandConfiguration,
    this.missingAttributeKeyStrategy,
    this.sortingConfigurations,
  });

  Map<String, dynamic> toJson() {
    final documentAttributeKey = this.documentAttributeKey;
    final expand = this.expand;
    final expandConfiguration = this.expandConfiguration;
    final missingAttributeKeyStrategy = this.missingAttributeKeyStrategy;
    final sortingConfigurations = this.sortingConfigurations;
    return {
      'DocumentAttributeKey': documentAttributeKey,
      if (expand != null) 'Expand': expand,
      if (expandConfiguration != null)
        'ExpandConfiguration': expandConfiguration,
      if (missingAttributeKeyStrategy != null)
        'MissingAttributeKeyStrategy': missingAttributeKeyStrategy.toValue(),
      if (sortingConfigurations != null)
        'SortingConfigurations': sortingConfigurations,
    };
  }
}

/// Provides details about a collapsed group of search results.
class CollapsedResultDetail {
  /// The value of the document attribute that results are collapsed on.
  final DocumentAttribute documentAttribute;

  /// A list of results in the collapsed group.
  final List<ExpandedResultItem>? expandedResults;

  CollapsedResultDetail({
    required this.documentAttribute,
    this.expandedResults,
  });

  factory CollapsedResultDetail.fromJson(Map<String, dynamic> json) {
    return CollapsedResultDetail(
      documentAttribute: DocumentAttribute.fromJson(
          json['DocumentAttribute'] as Map<String, dynamic>),
      expandedResults: (json['ExpandedResults'] as List?)
          ?.whereNotNull()
          .map((e) => ExpandedResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final documentAttribute = this.documentAttribute;
    final expandedResults = this.expandedResults;
    return {
      'DocumentAttribute': documentAttribute,
      if (expandedResults != null) 'ExpandedResults': expandedResults,
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

  /// The column that provides the document's identifier.
  final String documentIdColumnName;

  /// The column that contains the title of the document.
  final String? documentTitleColumnName;

  /// An array of objects that map database column names to the corresponding
  /// fields in an index. You must first create the fields in the index using the
  /// <code>UpdateIndex</code> API.
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

enum ConditionOperator {
  greaterThan,
  greaterThanOrEquals,
  lessThan,
  lessThanOrEquals,
  equals,
  notEquals,
  contains,
  notContains,
  exists,
  notExists,
  beginsWith,
}

extension ConditionOperatorValueExtension on ConditionOperator {
  String toValue() {
    switch (this) {
      case ConditionOperator.greaterThan:
        return 'GreaterThan';
      case ConditionOperator.greaterThanOrEquals:
        return 'GreaterThanOrEquals';
      case ConditionOperator.lessThan:
        return 'LessThan';
      case ConditionOperator.lessThanOrEquals:
        return 'LessThanOrEquals';
      case ConditionOperator.equals:
        return 'Equals';
      case ConditionOperator.notEquals:
        return 'NotEquals';
      case ConditionOperator.contains:
        return 'Contains';
      case ConditionOperator.notContains:
        return 'NotContains';
      case ConditionOperator.exists:
        return 'Exists';
      case ConditionOperator.notExists:
        return 'NotExists';
      case ConditionOperator.beginsWith:
        return 'BeginsWith';
    }
  }
}

extension ConditionOperatorFromString on String {
  ConditionOperator toConditionOperator() {
    switch (this) {
      case 'GreaterThan':
        return ConditionOperator.greaterThan;
      case 'GreaterThanOrEquals':
        return ConditionOperator.greaterThanOrEquals;
      case 'LessThan':
        return ConditionOperator.lessThan;
      case 'LessThanOrEquals':
        return ConditionOperator.lessThanOrEquals;
      case 'Equals':
        return ConditionOperator.equals;
      case 'NotEquals':
        return ConditionOperator.notEquals;
      case 'Contains':
        return ConditionOperator.contains;
      case 'NotContains':
        return ConditionOperator.notContains;
      case 'Exists':
        return ConditionOperator.exists;
      case 'NotExists':
        return ConditionOperator.notExists;
      case 'BeginsWith':
        return ConditionOperator.beginsWith;
    }
    throw Exception('$this is not known in enum ConditionOperator');
  }
}

/// Configuration of attachment settings for the Confluence data source.
/// Attachment settings are optional, if you don't specify settings attachments,
/// Amazon Kendra won't index them.
class ConfluenceAttachmentConfiguration {
  /// Maps attributes or field names of Confluence attachments to Amazon Kendra
  /// index field names. To create custom fields, use the <code>UpdateIndex</code>
  /// API before you map to Confluence fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Confluence data source field names must exist in
  /// your Confluence custom metadata.
  ///
  /// If you specify the <code>AttachentFieldMappings</code> parameter, you must
  /// specify at least one field mapping.
  final List<ConfluenceAttachmentToIndexFieldMapping>? attachmentFieldMappings;

  /// <code>TRUE</code> to index attachments of pages and blogs in Confluence.
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

extension ConfluenceAttachmentFieldNameValueExtension
    on ConfluenceAttachmentFieldName {
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

extension ConfluenceAttachmentFieldNameFromString on String {
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

/// Maps attributes or field names of Confluence attachments to Amazon Kendra
/// index field names. To create custom fields, use the <code>UpdateIndex</code>
/// API before you map to Confluence fields. For more information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
/// data source fields</a>. The Confuence data source field names must exist in
/// your Confluence custom metadata.
class ConfluenceAttachmentToIndexFieldMapping {
  /// The name of the field in the data source.
  ///
  /// You must first create the index field using the <code>UpdateIndex</code>
  /// API.
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

enum ConfluenceAuthenticationType {
  httpBasic,
  pat,
}

extension ConfluenceAuthenticationTypeValueExtension
    on ConfluenceAuthenticationType {
  String toValue() {
    switch (this) {
      case ConfluenceAuthenticationType.httpBasic:
        return 'HTTP_BASIC';
      case ConfluenceAuthenticationType.pat:
        return 'PAT';
    }
  }
}

extension ConfluenceAuthenticationTypeFromString on String {
  ConfluenceAuthenticationType toConfluenceAuthenticationType() {
    switch (this) {
      case 'HTTP_BASIC':
        return ConfluenceAuthenticationType.httpBasic;
      case 'PAT':
        return ConfluenceAuthenticationType.pat;
    }
    throw Exception('$this is not known in enum ConfluenceAuthenticationType');
  }
}

/// Configuration of blog settings for the Confluence data source. Blogs are
/// always indexed unless filtered from the index by the
/// <code>ExclusionPatterns</code> or <code>InclusionPatterns</code> fields in
/// the <code>ConfluenceConfiguration</code> object.
class ConfluenceBlogConfiguration {
  /// Maps attributes or field names of Confluence blogs to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to Confluence fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Confluence data source field names must exist in
  /// your Confluence custom metadata.
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

extension ConfluenceBlogFieldNameValueExtension on ConfluenceBlogFieldName {
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

extension ConfluenceBlogFieldNameFromString on String {
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

/// Maps attributes or field names of Confluence blog to Amazon Kendra index
/// field names. To create custom fields, use the <code>UpdateIndex</code> API
/// before you map to Confluence fields. For more information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
/// data source fields</a>. The Confluence data source field names must exist in
/// your Confluence custom metadata.
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

/// Provides the configuration information to connect to Confluence as your data
/// source.
class ConfluenceConfiguration {
  /// The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
  /// the user name and password required to connect to the Confluence instance.
  /// If you use Confluence Cloud, you use a generated API token as the password.
  ///
  /// You can also provide authentication credentials in the form of a personal
  /// access token. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-confluence.html">Using
  /// a Confluence data source</a>.
  final String secretArn;

  /// The URL of your Confluence instance. Use the full URL of the server. For
  /// example, <i>https://server.example.com:port/</i>. You can also use an IP
  /// address, for example, <i>https://192.168.1.113/</i>.
  final String serverUrl;

  /// The version or the type of Confluence installation to connect to.
  final ConfluenceVersion version;

  /// Configuration information for indexing attachments to Confluence blogs and
  /// pages.
  final ConfluenceAttachmentConfiguration? attachmentConfiguration;

  /// Whether you want to connect to Confluence using basic authentication of user
  /// name and password, or a personal access token. You can use a personal access
  /// token for Confluence Server.
  final ConfluenceAuthenticationType? authenticationType;

  /// Configuration information for indexing Confluence blogs.
  final ConfluenceBlogConfiguration? blogConfiguration;

  /// A list of regular expression patterns to exclude certain blog posts, pages,
  /// spaces, or attachments in your Confluence. Content that matches the patterns
  /// are excluded from the index. Content that doesn't match the patterns is
  /// included in the index. If content matches both an inclusion and exclusion
  /// pattern, the exclusion pattern takes precedence and the content isn't
  /// included in the index.
  final List<String>? exclusionPatterns;

  /// A list of regular expression patterns to include certain blog posts, pages,
  /// spaces, or attachments in your Confluence. Content that matches the patterns
  /// are included in the index. Content that doesn't match the patterns is
  /// excluded from the index. If content matches both an inclusion and exclusion
  /// pattern, the exclusion pattern takes precedence and the content isn't
  /// included in the index.
  final List<String>? inclusionPatterns;

  /// Configuration information for indexing Confluence pages.
  final ConfluencePageConfiguration? pageConfiguration;

  /// Configuration information to connect to your Confluence URL instance via a
  /// web proxy. You can use this option for Confluence Server.
  ///
  /// You must provide the website host name and port number. For example, the
  /// host name of <i>https://a.example.com/page1.html</i> is "a.example.com" and
  /// the port is 443, the standard port for HTTPS.
  ///
  /// Web proxy credentials are optional and you can use them to connect to a web
  /// proxy server that requires basic authentication of user name and password.
  /// To store web proxy credentials, you use a secret in Secrets Manager.
  ///
  /// It is recommended that you follow best security practices when configuring
  /// your web proxy. This includes setting up throttling, setting up logging and
  /// monitoring, and applying security patches on a regular basis. If you use
  /// your web proxy with multiple data sources, sync jobs that occur at the same
  /// time could strain the load on your proxy. It is recommended you prepare your
  /// proxy beforehand for any security and load requirements.
  final ProxyConfiguration? proxyConfiguration;

  /// Configuration information for indexing Confluence spaces.
  final ConfluenceSpaceConfiguration? spaceConfiguration;

  /// Configuration information for an Amazon Virtual Private Cloud to connect to
  /// your Confluence. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  ConfluenceConfiguration({
    required this.secretArn,
    required this.serverUrl,
    required this.version,
    this.attachmentConfiguration,
    this.authenticationType,
    this.blogConfiguration,
    this.exclusionPatterns,
    this.inclusionPatterns,
    this.pageConfiguration,
    this.proxyConfiguration,
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
      authenticationType: (json['AuthenticationType'] as String?)
          ?.toConfluenceAuthenticationType(),
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
      proxyConfiguration: json['ProxyConfiguration'] != null
          ? ProxyConfiguration.fromJson(
              json['ProxyConfiguration'] as Map<String, dynamic>)
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
    final authenticationType = this.authenticationType;
    final blogConfiguration = this.blogConfiguration;
    final exclusionPatterns = this.exclusionPatterns;
    final inclusionPatterns = this.inclusionPatterns;
    final pageConfiguration = this.pageConfiguration;
    final proxyConfiguration = this.proxyConfiguration;
    final spaceConfiguration = this.spaceConfiguration;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'SecretArn': secretArn,
      'ServerUrl': serverUrl,
      'Version': version.toValue(),
      if (attachmentConfiguration != null)
        'AttachmentConfiguration': attachmentConfiguration,
      if (authenticationType != null)
        'AuthenticationType': authenticationType.toValue(),
      if (blogConfiguration != null) 'BlogConfiguration': blogConfiguration,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (pageConfiguration != null) 'PageConfiguration': pageConfiguration,
      if (proxyConfiguration != null) 'ProxyConfiguration': proxyConfiguration,
      if (spaceConfiguration != null) 'SpaceConfiguration': spaceConfiguration,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// Configuration of the page settings for the Confluence data source.
class ConfluencePageConfiguration {
  /// Maps attributes or field names of Confluence pages to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to Confluence fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Confluence data source field names must exist in
  /// your Confluence custom metadata.
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

extension ConfluencePageFieldNameValueExtension on ConfluencePageFieldName {
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

extension ConfluencePageFieldNameFromString on String {
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

/// Maps attributes or field names of Confluence pages to Amazon Kendra index
/// field names. To create custom fields, use the <code>UpdateIndex</code> API
/// before you map to Confluence fields. For more information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
/// data source fields</a>. The Confluence data source field names must exist in
/// your Confluence custom metadata.
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

/// Configuration information for indexing Confluence spaces.
class ConfluenceSpaceConfiguration {
  /// <code>TRUE</code> to index archived spaces.
  final bool? crawlArchivedSpaces;

  /// <code>TRUE</code> to index personal spaces. You can add restrictions to
  /// items in personal spaces. If personal spaces are indexed, queries without
  /// user context information may return restricted items from a personal space
  /// in their results. For more information, see <a
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

  /// Maps attributes or field names of Confluence spaces to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to Confluence fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Confluence data source field names must exist in
  /// your Confluence custom metadata.
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

extension ConfluenceSpaceFieldNameValueExtension on ConfluenceSpaceFieldName {
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

extension ConfluenceSpaceFieldNameFromString on String {
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

/// Maps attributes or field names of Confluence spaces to Amazon Kendra index
/// field names. To create custom fields, use the <code>UpdateIndex</code> API
/// before you map to Confluence fields. For more information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
/// data source fields</a>. The Confluence data source field names must exist in
/// your Confluence custom metadata.
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

extension ConfluenceVersionValueExtension on ConfluenceVersion {
  String toValue() {
    switch (this) {
      case ConfluenceVersion.cloud:
        return 'CLOUD';
      case ConfluenceVersion.server:
        return 'SERVER';
    }
  }
}

extension ConfluenceVersionFromString on String {
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

/// Provides the configuration information that's required to connect to a
/// database.
class ConnectionConfiguration {
  /// The name of the host for the database. Can be either a string
  /// (host.subdomain.domain.tld) or an IPv4 or IPv6 address.
  final String databaseHost;

  /// The name of the database containing the document data.
  final String databaseName;

  /// The port that the database uses for connections.
  final int databasePort;

  /// The Amazon Resource Name (ARN) of credentials stored in Secrets Manager. The
  /// credentials should be a user/password pair. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html">Using
  /// a Database Data Source</a>. For more information about Secrets Manager, see
  /// <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">
  /// What Is Secrets Manager</a> in the <i> Secrets Manager </i> user guide.
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

/// Provides the configuration information for your content sources, such as
/// data sources, FAQs, and content indexed directly via <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchPutDocument.html">BatchPutDocument</a>.
class ContentSourceConfiguration {
  /// The identifier of the data sources you want to use for your Amazon Kendra
  /// experience.
  final List<String>? dataSourceIds;

  /// <code>TRUE</code> to use documents you indexed directly using the
  /// <code>BatchPutDocument</code> API.
  final bool? directPutContent;

  /// The identifier of the FAQs that you want to use for your Amazon Kendra
  /// experience.
  final List<String>? faqIds;

  ContentSourceConfiguration({
    this.dataSourceIds,
    this.directPutContent,
    this.faqIds,
  });

  factory ContentSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return ContentSourceConfiguration(
      dataSourceIds: (json['DataSourceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      directPutContent: json['DirectPutContent'] as bool?,
      faqIds: (json['FaqIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceIds = this.dataSourceIds;
    final directPutContent = this.directPutContent;
    final faqIds = this.faqIds;
    return {
      if (dataSourceIds != null) 'DataSourceIds': dataSourceIds,
      if (directPutContent != null) 'DirectPutContent': directPutContent,
      if (faqIds != null) 'FaqIds': faqIds,
    };
  }
}

enum ContentType {
  pdf,
  html,
  msWord,
  plainText,
  ppt,
  rtf,
  xml,
  xslt,
  msExcel,
  csv,
  json,
  md,
}

extension ContentTypeValueExtension on ContentType {
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
      case ContentType.rtf:
        return 'RTF';
      case ContentType.xml:
        return 'XML';
      case ContentType.xslt:
        return 'XSLT';
      case ContentType.msExcel:
        return 'MS_EXCEL';
      case ContentType.csv:
        return 'CSV';
      case ContentType.json:
        return 'JSON';
      case ContentType.md:
        return 'MD';
    }
  }
}

extension ContentTypeFromString on String {
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
      case 'RTF':
        return ContentType.rtf;
      case 'XML':
        return ContentType.xml;
      case 'XSLT':
        return ContentType.xslt;
      case 'MS_EXCEL':
        return ContentType.msExcel;
      case 'CSV':
        return ContentType.csv;
      case 'JSON':
        return ContentType.json;
      case 'MD':
        return ContentType.md;
    }
    throw Exception('$this is not known in enum ContentType');
  }
}

/// A corrected misspelled word in a query.
class Correction {
  /// The zero-based location in the response string or text where the corrected
  /// word starts.
  final int? beginOffset;

  /// The string or text of a corrected misspelled word in a query.
  final String? correctedTerm;

  /// The zero-based location in the response string or text where the corrected
  /// word ends.
  final int? endOffset;

  /// The string or text of a misspelled word in a query.
  final String? term;

  Correction({
    this.beginOffset,
    this.correctedTerm,
    this.endOffset,
    this.term,
  });

  factory Correction.fromJson(Map<String, dynamic> json) {
    return Correction(
      beginOffset: json['BeginOffset'] as int?,
      correctedTerm: json['CorrectedTerm'] as String?,
      endOffset: json['EndOffset'] as int?,
      term: json['Term'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final correctedTerm = this.correctedTerm;
    final endOffset = this.endOffset;
    final term = this.term;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (correctedTerm != null) 'CorrectedTerm': correctedTerm,
      if (endOffset != null) 'EndOffset': endOffset,
      if (term != null) 'Term': term,
    };
  }
}

class CreateAccessControlConfigurationResponse {
  /// The identifier of the access control configuration for your documents in an
  /// index.
  final String id;

  CreateAccessControlConfigurationResponse({
    required this.id,
  });

  factory CreateAccessControlConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateAccessControlConfigurationResponse(
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

class CreateDataSourceResponse {
  /// The identifier of the data source connector.
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

class CreateExperienceResponse {
  /// The identifier of your Amazon Kendra experience.
  final String id;

  CreateExperienceResponse({
    required this.id,
  });

  factory CreateExperienceResponse.fromJson(Map<String, dynamic> json) {
    return CreateExperienceResponse(
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
  /// The identifier of the FAQ.
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

class CreateFeaturedResultsSetResponse {
  /// Information on the set of featured results. This includes the identifier of
  /// the featured results set, whether the featured results set is active or
  /// inactive, when the featured results set was created, and more.
  final FeaturedResultsSet? featuredResultsSet;

  CreateFeaturedResultsSetResponse({
    this.featuredResultsSet,
  });

  factory CreateFeaturedResultsSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateFeaturedResultsSetResponse(
      featuredResultsSet: json['FeaturedResultsSet'] != null
          ? FeaturedResultsSet.fromJson(
              json['FeaturedResultsSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final featuredResultsSet = this.featuredResultsSet;
    return {
      if (featuredResultsSet != null) 'FeaturedResultsSet': featuredResultsSet,
    };
  }
}

class CreateIndexResponse {
  /// The identifier of the index. Use this identifier when you query an index,
  /// set up a data source, or index a document.
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
  /// The identifier of the block list.
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
  /// The identifier of the thesaurus.
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

/// Provides the configuration information for altering document metadata and
/// content during the document ingestion process.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html">Customizing
/// document metadata during the ingestion process</a>.
class CustomDocumentEnrichmentConfiguration {
  /// Configuration information to alter document attributes or metadata fields
  /// and content when ingesting documents into Amazon Kendra.
  final List<InlineCustomDocumentEnrichmentConfiguration>? inlineConfigurations;

  /// Configuration information for invoking a Lambda function in Lambda on the
  /// structured documents with their metadata and text extracted. You can use a
  /// Lambda function to apply advanced logic for creating, modifying, or deleting
  /// document metadata and content. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#advanced-data-manipulation">Advanced
  /// data manipulation</a>.
  final HookConfiguration? postExtractionHookConfiguration;

  /// Configuration information for invoking a Lambda function in Lambda on the
  /// original or raw documents before extracting their metadata and text. You can
  /// use a Lambda function to apply advanced logic for creating, modifying, or
  /// deleting document metadata and content. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#advanced-data-manipulation">Advanced
  /// data manipulation</a>.
  final HookConfiguration? preExtractionHookConfiguration;

  /// The Amazon Resource Name (ARN) of a role with permission to run
  /// <code>PreExtractionHookConfiguration</code> and
  /// <code>PostExtractionHookConfiguration</code> for altering document metadata
  /// and content during the document ingestion process. For more information, see
  /// <a href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM
  /// roles for Amazon Kendra</a>.
  final String? roleArn;

  CustomDocumentEnrichmentConfiguration({
    this.inlineConfigurations,
    this.postExtractionHookConfiguration,
    this.preExtractionHookConfiguration,
    this.roleArn,
  });

  factory CustomDocumentEnrichmentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CustomDocumentEnrichmentConfiguration(
      inlineConfigurations: (json['InlineConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => InlineCustomDocumentEnrichmentConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      postExtractionHookConfiguration:
          json['PostExtractionHookConfiguration'] != null
              ? HookConfiguration.fromJson(
                  json['PostExtractionHookConfiguration']
                      as Map<String, dynamic>)
              : null,
      preExtractionHookConfiguration: json['PreExtractionHookConfiguration'] !=
              null
          ? HookConfiguration.fromJson(
              json['PreExtractionHookConfiguration'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final inlineConfigurations = this.inlineConfigurations;
    final postExtractionHookConfiguration =
        this.postExtractionHookConfiguration;
    final preExtractionHookConfiguration = this.preExtractionHookConfiguration;
    final roleArn = this.roleArn;
    return {
      if (inlineConfigurations != null)
        'InlineConfigurations': inlineConfigurations,
      if (postExtractionHookConfiguration != null)
        'PostExtractionHookConfiguration': postExtractionHookConfiguration,
      if (preExtractionHookConfiguration != null)
        'PreExtractionHookConfiguration': preExtractionHookConfiguration,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// Provides the configuration information for an Amazon Kendra data source.
class DataSourceConfiguration {
  /// Provides the configuration information to connect to Alfresco as your data
  /// source.
  /// <note>
  /// Support for <code>AlfrescoConfiguration</code> ended May 2023. We recommend
  /// migrating to or using the Alfresco data source template schema / <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
  /// API.
  /// </note>
  final AlfrescoConfiguration? alfrescoConfiguration;

  /// Provides the configuration information to connect to Box as your data
  /// source.
  final BoxConfiguration? boxConfiguration;

  /// Provides the configuration information to connect to Confluence as your data
  /// source.
  final ConfluenceConfiguration? confluenceConfiguration;

  /// Provides the configuration information to connect to a database as your data
  /// source.
  final DatabaseConfiguration? databaseConfiguration;

  /// Provides the configuration information to connect to Amazon FSx as your data
  /// source.
  /// <note>
  /// Amazon Kendra now supports an upgraded Amazon FSx Windows connector.
  ///
  /// You must now use the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
  /// object instead of the <code>FsxConfiguration</code> object to configure your
  /// connector.
  ///
  /// Connectors configured using the older console and API architecture will
  /// continue to function as configured. However, you won't be able to edit or
  /// update them. If you want to edit or update your connector configuration, you
  /// must create a new connector.
  ///
  /// We recommended migrating your connector workflow to the upgraded version.
  /// Support for connectors configured using the older architecture is scheduled
  /// to end by June 2024.
  /// </note>
  final FsxConfiguration? fsxConfiguration;

  /// Provides the configuration information to connect to GitHub as your data
  /// source.
  /// <note>
  /// Amazon Kendra now supports an upgraded GitHub connector.
  ///
  /// You must now use the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
  /// object instead of the <code>GitHubConfiguration</code> object to configure
  /// your connector.
  ///
  /// Connectors configured using the older console and API architecture will
  /// continue to function as configured. However, you won’t be able to edit or
  /// update them. If you want to edit or update your connector configuration, you
  /// must create a new connector.
  ///
  /// We recommended migrating your connector workflow to the upgraded version.
  /// Support for connectors configured using the older architecture is scheduled
  /// to end by June 2024.
  /// </note>
  final GitHubConfiguration? gitHubConfiguration;

  /// Provides the configuration information to connect to Google Drive as your
  /// data source.
  final GoogleDriveConfiguration? googleDriveConfiguration;

  /// Provides the configuration information to connect to Jira as your data
  /// source.
  final JiraConfiguration? jiraConfiguration;

  /// Provides the configuration information to connect to Microsoft OneDrive as
  /// your data source.
  final OneDriveConfiguration? oneDriveConfiguration;

  /// Provides the configuration information to connect to Quip as your data
  /// source.
  final QuipConfiguration? quipConfiguration;

  /// Provides the configuration information to connect to an Amazon S3 bucket as
  /// your data source.
  /// <note>
  /// Amazon Kendra now supports an upgraded Amazon S3 connector.
  ///
  /// You must now use the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
  /// object instead of the <code>S3DataSourceConfiguration</code> object to
  /// configure your connector.
  ///
  /// Connectors configured using the older console and API architecture will
  /// continue to function as configured. However, you won't be able to edit or
  /// update them. If you want to edit or update your connector configuration, you
  /// must create a new connector.
  ///
  /// We recommended migrating your connector workflow to the upgraded version.
  /// Support for connectors configured using the older architecture is scheduled
  /// to end by June 2024.
  /// </note>
  final S3DataSourceConfiguration? s3Configuration;

  /// Provides the configuration information to connect to Salesforce as your data
  /// source.
  final SalesforceConfiguration? salesforceConfiguration;

  /// Provides the configuration information to connect to ServiceNow as your data
  /// source.
  final ServiceNowConfiguration? serviceNowConfiguration;

  /// Provides the configuration information to connect to Microsoft SharePoint as
  /// your data source.
  final SharePointConfiguration? sharePointConfiguration;

  /// Provides the configuration information to connect to Slack as your data
  /// source.
  /// <note>
  /// Amazon Kendra now supports an upgraded Slack connector.
  ///
  /// You must now use the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
  /// object instead of the <code>SlackConfiguration</code> object to configure
  /// your connector.
  ///
  /// Connectors configured using the older console and API architecture will
  /// continue to function as configured. However, you won't be able to edit or
  /// update them. If you want to edit or update your connector configuration, you
  /// must create a new connector.
  ///
  /// We recommended migrating your connector workflow to the upgraded version.
  /// Support for connectors configured using the older architecture is scheduled
  /// to end by June 2024.
  /// </note>
  final SlackConfiguration? slackConfiguration;

  /// Provides a template for the configuration information to connect to your
  /// data source.
  final TemplateConfiguration? templateConfiguration;
  final WebCrawlerConfiguration? webCrawlerConfiguration;

  /// Provides the configuration information to connect to Amazon WorkDocs as your
  /// data source.
  final WorkDocsConfiguration? workDocsConfiguration;

  DataSourceConfiguration({
    this.alfrescoConfiguration,
    this.boxConfiguration,
    this.confluenceConfiguration,
    this.databaseConfiguration,
    this.fsxConfiguration,
    this.gitHubConfiguration,
    this.googleDriveConfiguration,
    this.jiraConfiguration,
    this.oneDriveConfiguration,
    this.quipConfiguration,
    this.s3Configuration,
    this.salesforceConfiguration,
    this.serviceNowConfiguration,
    this.sharePointConfiguration,
    this.slackConfiguration,
    this.templateConfiguration,
    this.webCrawlerConfiguration,
    this.workDocsConfiguration,
  });

  factory DataSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return DataSourceConfiguration(
      alfrescoConfiguration: json['AlfrescoConfiguration'] != null
          ? AlfrescoConfiguration.fromJson(
              json['AlfrescoConfiguration'] as Map<String, dynamic>)
          : null,
      boxConfiguration: json['BoxConfiguration'] != null
          ? BoxConfiguration.fromJson(
              json['BoxConfiguration'] as Map<String, dynamic>)
          : null,
      confluenceConfiguration: json['ConfluenceConfiguration'] != null
          ? ConfluenceConfiguration.fromJson(
              json['ConfluenceConfiguration'] as Map<String, dynamic>)
          : null,
      databaseConfiguration: json['DatabaseConfiguration'] != null
          ? DatabaseConfiguration.fromJson(
              json['DatabaseConfiguration'] as Map<String, dynamic>)
          : null,
      fsxConfiguration: json['FsxConfiguration'] != null
          ? FsxConfiguration.fromJson(
              json['FsxConfiguration'] as Map<String, dynamic>)
          : null,
      gitHubConfiguration: json['GitHubConfiguration'] != null
          ? GitHubConfiguration.fromJson(
              json['GitHubConfiguration'] as Map<String, dynamic>)
          : null,
      googleDriveConfiguration: json['GoogleDriveConfiguration'] != null
          ? GoogleDriveConfiguration.fromJson(
              json['GoogleDriveConfiguration'] as Map<String, dynamic>)
          : null,
      jiraConfiguration: json['JiraConfiguration'] != null
          ? JiraConfiguration.fromJson(
              json['JiraConfiguration'] as Map<String, dynamic>)
          : null,
      oneDriveConfiguration: json['OneDriveConfiguration'] != null
          ? OneDriveConfiguration.fromJson(
              json['OneDriveConfiguration'] as Map<String, dynamic>)
          : null,
      quipConfiguration: json['QuipConfiguration'] != null
          ? QuipConfiguration.fromJson(
              json['QuipConfiguration'] as Map<String, dynamic>)
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
      slackConfiguration: json['SlackConfiguration'] != null
          ? SlackConfiguration.fromJson(
              json['SlackConfiguration'] as Map<String, dynamic>)
          : null,
      templateConfiguration: json['TemplateConfiguration'] != null
          ? TemplateConfiguration.fromJson(
              json['TemplateConfiguration'] as Map<String, dynamic>)
          : null,
      webCrawlerConfiguration: json['WebCrawlerConfiguration'] != null
          ? WebCrawlerConfiguration.fromJson(
              json['WebCrawlerConfiguration'] as Map<String, dynamic>)
          : null,
      workDocsConfiguration: json['WorkDocsConfiguration'] != null
          ? WorkDocsConfiguration.fromJson(
              json['WorkDocsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alfrescoConfiguration = this.alfrescoConfiguration;
    final boxConfiguration = this.boxConfiguration;
    final confluenceConfiguration = this.confluenceConfiguration;
    final databaseConfiguration = this.databaseConfiguration;
    final fsxConfiguration = this.fsxConfiguration;
    final gitHubConfiguration = this.gitHubConfiguration;
    final googleDriveConfiguration = this.googleDriveConfiguration;
    final jiraConfiguration = this.jiraConfiguration;
    final oneDriveConfiguration = this.oneDriveConfiguration;
    final quipConfiguration = this.quipConfiguration;
    final s3Configuration = this.s3Configuration;
    final salesforceConfiguration = this.salesforceConfiguration;
    final serviceNowConfiguration = this.serviceNowConfiguration;
    final sharePointConfiguration = this.sharePointConfiguration;
    final slackConfiguration = this.slackConfiguration;
    final templateConfiguration = this.templateConfiguration;
    final webCrawlerConfiguration = this.webCrawlerConfiguration;
    final workDocsConfiguration = this.workDocsConfiguration;
    return {
      if (alfrescoConfiguration != null)
        'AlfrescoConfiguration': alfrescoConfiguration,
      if (boxConfiguration != null) 'BoxConfiguration': boxConfiguration,
      if (confluenceConfiguration != null)
        'ConfluenceConfiguration': confluenceConfiguration,
      if (databaseConfiguration != null)
        'DatabaseConfiguration': databaseConfiguration,
      if (fsxConfiguration != null) 'FsxConfiguration': fsxConfiguration,
      if (gitHubConfiguration != null)
        'GitHubConfiguration': gitHubConfiguration,
      if (googleDriveConfiguration != null)
        'GoogleDriveConfiguration': googleDriveConfiguration,
      if (jiraConfiguration != null) 'JiraConfiguration': jiraConfiguration,
      if (oneDriveConfiguration != null)
        'OneDriveConfiguration': oneDriveConfiguration,
      if (quipConfiguration != null) 'QuipConfiguration': quipConfiguration,
      if (s3Configuration != null) 'S3Configuration': s3Configuration,
      if (salesforceConfiguration != null)
        'SalesforceConfiguration': salesforceConfiguration,
      if (serviceNowConfiguration != null)
        'ServiceNowConfiguration': serviceNowConfiguration,
      if (sharePointConfiguration != null)
        'SharePointConfiguration': sharePointConfiguration,
      if (slackConfiguration != null) 'SlackConfiguration': slackConfiguration,
      if (templateConfiguration != null)
        'TemplateConfiguration': templateConfiguration,
      if (webCrawlerConfiguration != null)
        'WebCrawlerConfiguration': webCrawlerConfiguration,
      if (workDocsConfiguration != null)
        'WorkDocsConfiguration': workDocsConfiguration,
    };
  }
}

/// Data source information for user context filtering.
class DataSourceGroup {
  /// The identifier of the data source group you want to add to your list of data
  /// source groups. This is for filtering search results based on the groups'
  /// access to documents in that data source.
  final String dataSourceId;

  /// The identifier of the group you want to add to your list of groups. This is
  /// for filtering search results based on the groups' access to documents.
  final String groupId;

  DataSourceGroup({
    required this.dataSourceId,
    required this.groupId,
  });

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final groupId = this.groupId;
    return {
      'DataSourceId': dataSourceId,
      'GroupId': groupId,
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

extension DataSourceStatusValueExtension on DataSourceStatus {
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

extension DataSourceStatusFromString on String {
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

/// Summary information for a Amazon Kendra data source.
class DataSourceSummary {
  /// The Unix timestamp when the data source connector was created.
  final DateTime? createdAt;

  /// The identifier for the data source.
  final String? id;

  /// The code for a language. This shows a supported language for all documents
  /// in the data source. English is supported by default. For more information on
  /// supported languages, including their codes, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html">Adding
  /// documents in languages other than English</a>.
  final String? languageCode;

  /// The name of the data source.
  final String? name;

  /// The status of the data source. When the status is <code>ACTIVE</code> the
  /// data source is ready to use.
  final DataSourceStatus? status;

  /// The type of the data source.
  final DataSourceType? type;

  /// The Unix timestamp when the data source connector was last updated.
  final DateTime? updatedAt;

  DataSourceSummary({
    this.createdAt,
    this.id,
    this.languageCode,
    this.name,
    this.status,
    this.type,
    this.updatedAt,
  });

  factory DataSourceSummary.fromJson(Map<String, dynamic> json) {
    return DataSourceSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      id: json['Id'] as String?,
      languageCode: json['LanguageCode'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toDataSourceStatus(),
      type: (json['Type'] as String?)?.toDataSourceType(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final id = this.id;
    final languageCode = this.languageCode;
    final name = this.name;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (id != null) 'Id': id,
      if (languageCode != null) 'LanguageCode': languageCode,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Provides information about a data source synchronization job.
class DataSourceSyncJob {
  /// If the reason that the synchronization failed is due to an error with the
  /// underlying data source, this field contains a code that identifies the
  /// error.
  final String? dataSourceErrorCode;

  /// The Unix timestamp when the synchronization job completed.
  final DateTime? endTime;

  /// If the <code>Status</code> field is set to <code>FAILED</code>, the
  /// <code>ErrorCode</code> field indicates the reason the synchronization
  /// failed.
  final ErrorCode? errorCode;

  /// If the <code>Status</code> field is set to <code>ERROR</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the synchronization to fail.
  final String? errorMessage;

  /// A identifier for the synchronization job.
  final String? executionId;

  /// Maps a batch delete document request to a specific data source sync job.
  /// This is optional and should only be supplied when documents are deleted by a
  /// data source connector.
  final DataSourceSyncJobMetrics? metrics;

  /// The Unix timestamp when the synchronization job started.
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

extension DataSourceSyncJobStatusValueExtension on DataSourceSyncJobStatus {
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

extension DataSourceSyncJobStatusFromString on String {
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

/// Maps attributes or field names of the documents synced from the data source
/// to Amazon Kendra index field names. You can set up field mappings for each
/// data source when calling <a
/// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_CreateDataSource.html">CreateDataSource</a>
/// or <a
/// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_UpdateDataSource.html">UpdateDataSource</a>
/// API. To create custom fields, use the <code>UpdateIndex</code> API to first
/// create an index field and then map to the data source field. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
/// data source fields</a>.
class DataSourceToIndexFieldMapping {
  /// The name of the field in the data source. You must first create the index
  /// field using the <code>UpdateIndex</code> API.
  final String dataSourceFieldName;

  /// The name of the index field to map to the data source field. The index field
  /// type must match the data source field type.
  final String indexFieldName;

  /// The format for date fields in the data source. If the field specified in
  /// <code>DataSourceFieldName</code> is a date field, you must specify the date
  /// format. If the field is not a date field, an exception is thrown.
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
  workdocs,
  fsx,
  slack,
  box,
  quip,
  jira,
  github,
  alfresco,
  template,
}

extension DataSourceTypeValueExtension on DataSourceType {
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
      case DataSourceType.workdocs:
        return 'WORKDOCS';
      case DataSourceType.fsx:
        return 'FSX';
      case DataSourceType.slack:
        return 'SLACK';
      case DataSourceType.box:
        return 'BOX';
      case DataSourceType.quip:
        return 'QUIP';
      case DataSourceType.jira:
        return 'JIRA';
      case DataSourceType.github:
        return 'GITHUB';
      case DataSourceType.alfresco:
        return 'ALFRESCO';
      case DataSourceType.template:
        return 'TEMPLATE';
    }
  }
}

extension DataSourceTypeFromString on String {
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
      case 'WORKDOCS':
        return DataSourceType.workdocs;
      case 'FSX':
        return DataSourceType.fsx;
      case 'SLACK':
        return DataSourceType.slack;
      case 'BOX':
        return DataSourceType.box;
      case 'QUIP':
        return DataSourceType.quip;
      case 'JIRA':
        return DataSourceType.jira;
      case 'GITHUB':
        return DataSourceType.github;
      case 'ALFRESCO':
        return DataSourceType.alfresco;
      case 'TEMPLATE':
        return DataSourceType.template;
    }
    throw Exception('$this is not known in enum DataSourceType');
  }
}

/// Provides the configuration information to connect to an Amazon VPC.
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

/// Provides the configuration information to an <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-database.html">Amazon
/// Kendra supported database</a>.
class DatabaseConfiguration {
  /// Information about where the index should get the document information from
  /// the database.
  final ColumnConfiguration columnConfiguration;

  /// Configuration information that's required to connect to a database.
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

extension DatabaseEngineTypeValueExtension on DatabaseEngineType {
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

extension DatabaseEngineTypeFromString on String {
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

class DeleteAccessControlConfigurationResponse {
  DeleteAccessControlConfigurationResponse();

  factory DeleteAccessControlConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAccessControlConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteExperienceResponse {
  DeleteExperienceResponse();

  factory DeleteExperienceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteExperienceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAccessControlConfigurationResponse {
  /// The name for the access control configuration.
  final String name;

  /// Information on principals (users and/or groups) and which documents they
  /// should have access to. This is useful for user context filtering, where
  /// search results are filtered based on the user or their group access to
  /// documents.
  final List<Principal>? accessControlList;

  /// The description for the access control configuration.
  final String? description;

  /// The error message containing details if there are issues processing the
  /// access control configuration.
  final String? errorMessage;

  /// The list of <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html">principal</a>
  /// lists that define the hierarchy for which documents users should have access
  /// to.
  final List<HierarchicalPrincipal>? hierarchicalAccessControlList;

  DescribeAccessControlConfigurationResponse({
    required this.name,
    this.accessControlList,
    this.description,
    this.errorMessage,
    this.hierarchicalAccessControlList,
  });

  factory DescribeAccessControlConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAccessControlConfigurationResponse(
      name: json['Name'] as String,
      accessControlList: (json['AccessControlList'] as List?)
          ?.whereNotNull()
          .map((e) => Principal.fromJson(e as Map<String, dynamic>))
          .toList(),
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      hierarchicalAccessControlList: (json['HierarchicalAccessControlList']
              as List?)
          ?.whereNotNull()
          .map((e) => HierarchicalPrincipal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final accessControlList = this.accessControlList;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final hierarchicalAccessControlList = this.hierarchicalAccessControlList;
    return {
      'Name': name,
      if (accessControlList != null) 'AccessControlList': accessControlList,
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (hierarchicalAccessControlList != null)
        'HierarchicalAccessControlList': hierarchicalAccessControlList,
    };
  }
}

class DescribeDataSourceResponse {
  /// Configuration details for the data source connector. This shows how the data
  /// source is configured. The configuration options for a data source depend on
  /// the data source provider.
  final DataSourceConfiguration? configuration;

  /// The Unix timestamp when the data source connector was created.
  final DateTime? createdAt;

  /// Configuration information for altering document metadata and content during
  /// the document ingestion process when you describe a data source.
  ///
  /// For more information on how to create, modify and delete document metadata,
  /// or make other content alterations when you ingest documents into Amazon
  /// Kendra, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html">Customizing
  /// document metadata during the ingestion process</a>.
  final CustomDocumentEnrichmentConfiguration?
      customDocumentEnrichmentConfiguration;

  /// The description for the data source connector.
  final String? description;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a description of the error that
  /// caused the data source to fail.
  final String? errorMessage;

  /// The identifier of the data source connector.
  final String? id;

  /// The identifier of the index used with the data source connector.
  final String? indexId;

  /// The code for a language. This shows a supported language for all documents
  /// in the data source. English is supported by default. For more information on
  /// supported languages, including their codes, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html">Adding
  /// documents in languages other than English</a>.
  final String? languageCode;

  /// The name for the data source connector.
  final String? name;

  /// The Amazon Resource Name (ARN) of the role with permission to access the
  /// data source and required resources.
  final String? roleArn;

  /// The schedule for Amazon Kendra to update the index.
  final String? schedule;

  /// The current status of the data source connector. When the status is
  /// <code>ACTIVE</code> the data source is ready to use. When the status is
  /// <code>FAILED</code>, the <code>ErrorMessage</code> field contains the reason
  /// that the data source failed.
  final DataSourceStatus? status;

  /// The type of the data source. For example, <code>SHAREPOINT</code>.
  final DataSourceType? type;

  /// The Unix timestamp when the data source connector was last updated.
  final DateTime? updatedAt;

  /// Configuration information for an Amazon Virtual Private Cloud to connect to
  /// your data source. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  DescribeDataSourceResponse({
    this.configuration,
    this.createdAt,
    this.customDocumentEnrichmentConfiguration,
    this.description,
    this.errorMessage,
    this.id,
    this.indexId,
    this.languageCode,
    this.name,
    this.roleArn,
    this.schedule,
    this.status,
    this.type,
    this.updatedAt,
    this.vpcConfiguration,
  });

  factory DescribeDataSourceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDataSourceResponse(
      configuration: json['Configuration'] != null
          ? DataSourceConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      customDocumentEnrichmentConfiguration:
          json['CustomDocumentEnrichmentConfiguration'] != null
              ? CustomDocumentEnrichmentConfiguration.fromJson(
                  json['CustomDocumentEnrichmentConfiguration']
                      as Map<String, dynamic>)
              : null,
      description: json['Description'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
      indexId: json['IndexId'] as String?,
      languageCode: json['LanguageCode'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      schedule: json['Schedule'] as String?,
      status: (json['Status'] as String?)?.toDataSourceStatus(),
      type: (json['Type'] as String?)?.toDataSourceType(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final customDocumentEnrichmentConfiguration =
        this.customDocumentEnrichmentConfiguration;
    final description = this.description;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final indexId = this.indexId;
    final languageCode = this.languageCode;
    final name = this.name;
    final roleArn = this.roleArn;
    final schedule = this.schedule;
    final status = this.status;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (customDocumentEnrichmentConfiguration != null)
        'CustomDocumentEnrichmentConfiguration':
            customDocumentEnrichmentConfiguration,
      if (description != null) 'Description': description,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
      if (indexId != null) 'IndexId': indexId,
      if (languageCode != null) 'LanguageCode': languageCode,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (schedule != null) 'Schedule': schedule,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

class DescribeExperienceResponse {
  /// Shows the configuration information for your Amazon Kendra experience. This
  /// includes <code>ContentSourceConfiguration</code>, which specifies the data
  /// source IDs and/or FAQ IDs, and <code>UserIdentityConfiguration</code>, which
  /// specifies the user or group information to grant access to your Amazon
  /// Kendra experience.
  final ExperienceConfiguration? configuration;

  /// The Unix timestamp when your Amazon Kendra experience was created.
  final DateTime? createdAt;

  /// Shows the description for your Amazon Kendra experience.
  final String? description;

  /// Shows the endpoint URLs for your Amazon Kendra experiences. The URLs are
  /// unique and fully hosted by Amazon Web Services.
  final List<ExperienceEndpoint>? endpoints;

  /// The reason your Amazon Kendra experience could not properly process.
  final String? errorMessage;

  /// Shows the identifier of your Amazon Kendra experience.
  final String? id;

  /// Shows the identifier of the index for your Amazon Kendra experience.
  final String? indexId;

  /// Shows the name of your Amazon Kendra experience.
  final String? name;

  /// Shows the Amazon Resource Name (ARN) of a role with permission to access
  /// <code>Query</code> API, <code>QuerySuggestions</code> API,
  /// <code>SubmitFeedback</code> API, and IAM Identity Center that stores your
  /// user and group information.
  final String? roleArn;

  /// The current processing status of your Amazon Kendra experience. When the
  /// status is <code>ACTIVE</code>, your Amazon Kendra experience is ready to
  /// use. When the status is <code>FAILED</code>, the <code>ErrorMessage</code>
  /// field contains the reason that this failed.
  final ExperienceStatus? status;

  /// The Unix timestamp when your Amazon Kendra experience was last updated.
  final DateTime? updatedAt;

  DescribeExperienceResponse({
    this.configuration,
    this.createdAt,
    this.description,
    this.endpoints,
    this.errorMessage,
    this.id,
    this.indexId,
    this.name,
    this.roleArn,
    this.status,
    this.updatedAt,
  });

  factory DescribeExperienceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeExperienceResponse(
      configuration: json['Configuration'] != null
          ? ExperienceConfiguration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['CreatedAt']),
      description: json['Description'] as String?,
      endpoints: (json['Endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ExperienceEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      errorMessage: json['ErrorMessage'] as String?,
      id: json['Id'] as String?,
      indexId: json['IndexId'] as String?,
      name: json['Name'] as String?,
      roleArn: json['RoleArn'] as String?,
      status: (json['Status'] as String?)?.toExperienceStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final description = this.description;
    final endpoints = this.endpoints;
    final errorMessage = this.errorMessage;
    final id = this.id;
    final indexId = this.indexId;
    final name = this.name;
    final roleArn = this.roleArn;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (configuration != null) 'Configuration': configuration,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (description != null) 'Description': description,
      if (endpoints != null) 'Endpoints': endpoints,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (id != null) 'Id': id,
      if (indexId != null) 'IndexId': indexId,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DescribeFaqResponse {
  /// The Unix timestamp when the FAQ was created.
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

  /// The identifier of the index for the FAQ.
  final String? indexId;

  /// The code for a language. This shows a supported language for the FAQ
  /// document. English is supported by default. For more information on supported
  /// languages, including their codes, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html">Adding
  /// documents in languages other than English</a>.
  final String? languageCode;

  /// The name that you gave the FAQ when it was created.
  final String? name;

  /// The Amazon Resource Name (ARN) of the role that provides access to the S3
  /// bucket containing the input files for the FAQ.
  final String? roleArn;
  final S3Path? s3Path;

  /// The status of the FAQ. It is ready to use when the status is
  /// <code>ACTIVE</code>.
  final FaqStatus? status;

  /// The Unix timestamp when the FAQ was last updated.
  final DateTime? updatedAt;

  DescribeFaqResponse({
    this.createdAt,
    this.description,
    this.errorMessage,
    this.fileFormat,
    this.id,
    this.indexId,
    this.languageCode,
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
      languageCode: json['LanguageCode'] as String?,
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
    final languageCode = this.languageCode;
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
      if (languageCode != null) 'LanguageCode': languageCode,
      if (name != null) 'Name': name,
      if (roleArn != null) 'RoleArn': roleArn,
      if (s3Path != null) 'S3Path': s3Path,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DescribeFeaturedResultsSetResponse {
  /// The Unix timestamp when the set of the featured results was created.
  final int? creationTimestamp;

  /// The description for the set of featured results.
  final String? description;

  /// The list of document IDs that don't exist but you have specified as featured
  /// documents. Amazon Kendra cannot feature these documents if they don't exist
  /// in the index. You can check the status of a document and its ID or check for
  /// documents with status errors using the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchGetDocumentStatus.html">BatchGetDocumentStatus</a>
  /// API.
  final List<FeaturedDocumentMissing>? featuredDocumentsMissing;

  /// The list of document IDs for the documents you want to feature with their
  /// metadata information. For more information on the list of featured
  /// documents, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html">FeaturedResultsSet</a>.
  final List<FeaturedDocumentWithMetadata>? featuredDocumentsWithMetadata;

  /// The identifier of the set of featured results.
  final String? featuredResultsSetId;

  /// The name for the set of featured results.
  final String? featuredResultsSetName;

  /// The timestamp when the set of featured results was last updated.
  final int? lastUpdatedTimestamp;

  /// The list of queries for featuring results. For more information on the list
  /// of queries, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_FeaturedResultsSet.html">FeaturedResultsSet</a>.
  final List<String>? queryTexts;

  /// The current status of the set of featured results. When the value is
  /// <code>ACTIVE</code>, featured results are ready for use. You can still
  /// configure your settings before setting the status to <code>ACTIVE</code>.
  /// You can set the status to <code>ACTIVE</code> or <code>INACTIVE</code> using
  /// the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html">UpdateFeaturedResultsSet</a>
  /// API. The queries you specify for featured results must be unique per
  /// featured results set for each index, whether the status is
  /// <code>ACTIVE</code> or <code>INACTIVE</code>.
  final FeaturedResultsSetStatus? status;

  DescribeFeaturedResultsSetResponse({
    this.creationTimestamp,
    this.description,
    this.featuredDocumentsMissing,
    this.featuredDocumentsWithMetadata,
    this.featuredResultsSetId,
    this.featuredResultsSetName,
    this.lastUpdatedTimestamp,
    this.queryTexts,
    this.status,
  });

  factory DescribeFeaturedResultsSetResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeFeaturedResultsSetResponse(
      creationTimestamp: json['CreationTimestamp'] as int?,
      description: json['Description'] as String?,
      featuredDocumentsMissing: (json['FeaturedDocumentsMissing'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FeaturedDocumentMissing.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredDocumentsWithMetadata: (json['FeaturedDocumentsWithMetadata']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              FeaturedDocumentWithMetadata.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredResultsSetId: json['FeaturedResultsSetId'] as String?,
      featuredResultsSetName: json['FeaturedResultsSetName'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as int?,
      queryTexts: (json['QueryTexts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.toFeaturedResultsSetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final description = this.description;
    final featuredDocumentsMissing = this.featuredDocumentsMissing;
    final featuredDocumentsWithMetadata = this.featuredDocumentsWithMetadata;
    final featuredResultsSetId = this.featuredResultsSetId;
    final featuredResultsSetName = this.featuredResultsSetName;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final queryTexts = this.queryTexts;
    final status = this.status;
    return {
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (description != null) 'Description': description,
      if (featuredDocumentsMissing != null)
        'FeaturedDocumentsMissing': featuredDocumentsMissing,
      if (featuredDocumentsWithMetadata != null)
        'FeaturedDocumentsWithMetadata': featuredDocumentsWithMetadata,
      if (featuredResultsSetId != null)
        'FeaturedResultsSetId': featuredResultsSetId,
      if (featuredResultsSetName != null)
        'FeaturedResultsSetName': featuredResultsSetName,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (queryTexts != null) 'QueryTexts': queryTexts,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribeIndexResponse {
  /// For Enterprise Edition indexes, you can choose to use additional capacity to
  /// meet the needs of your application. This contains the capacity units used
  /// for the index. A query or document storage capacity of zero indicates that
  /// the index is using the default capacity. For more information on the default
  /// capacity for an index and adjusting this, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/adjusting-capacity.html">Adjusting
  /// capacity</a>.
  final CapacityUnitsConfiguration? capacityUnits;

  /// The Unix timestamp when the index was created.
  final DateTime? createdAt;

  /// The description for the index.
  final String? description;

  /// Configuration information for document metadata or fields. Document metadata
  /// are fields or attributes associated with your documents. For example, the
  /// company department name associated with each document.
  final List<DocumentMetadataConfiguration>? documentMetadataConfigurations;

  /// The Amazon Kendra edition used for the index. You decide the edition when
  /// you create the index.
  final IndexEdition? edition;

  /// When the <code>Status</code> field value is <code>FAILED</code>, the
  /// <code>ErrorMessage</code> field contains a message that explains why.
  final String? errorMessage;

  /// The identifier of the index.
  final String? id;

  /// Provides information about the number of FAQ questions and answers and the
  /// number of text documents indexed.
  final IndexStatistics? indexStatistics;

  /// The name of the index.
  final String? name;

  /// The Amazon Resource Name (ARN) of the IAM role that gives Amazon Kendra
  /// permission to write to your Amazon CloudWatch logs.
  final String? roleArn;

  /// The identifier of the KMS customer master key (CMK) that is used to encrypt
  /// your data. Amazon Kendra doesn't support asymmetric CMKs.
  final ServerSideEncryptionConfiguration? serverSideEncryptionConfiguration;

  /// The current status of the index. When the value is <code>ACTIVE</code>, the
  /// index is ready for use. If the <code>Status</code> field value is
  /// <code>FAILED</code>, the <code>ErrorMessage</code> field contains a message
  /// that explains why.
  final IndexStatus? status;

  /// The Unix timestamp when the index was last updated.
  final DateTime? updatedAt;

  /// The user context policy for the Amazon Kendra index.
  final UserContextPolicy? userContextPolicy;

  /// Whether you have enabled IAM Identity Center identity source for your users
  /// and groups. This is useful for user context filtering, where search results
  /// are filtered based on the user or their group access to documents.
  final UserGroupResolutionConfiguration? userGroupResolutionConfiguration;

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
    this.userGroupResolutionConfiguration,
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
      userGroupResolutionConfiguration:
          json['UserGroupResolutionConfiguration'] != null
              ? UserGroupResolutionConfiguration.fromJson(
                  json['UserGroupResolutionConfiguration']
                      as Map<String, dynamic>)
              : null,
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
    final userGroupResolutionConfiguration =
        this.userGroupResolutionConfiguration;
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
      if (userGroupResolutionConfiguration != null)
        'UserGroupResolutionConfiguration': userGroupResolutionConfiguration,
      if (userTokenConfigurations != null)
        'UserTokenConfigurations': userTokenConfigurations,
    };
  }
}

class DescribePrincipalMappingResponse {
  /// Shows the identifier of the data source to see information on the processing
  /// of <code>PUT</code> and <code>DELETE</code> actions for mapping users to
  /// their groups.
  final String? dataSourceId;

  /// Shows the identifier of the group to see information on the processing of
  /// <code>PUT</code> and <code>DELETE</code> actions for mapping users to their
  /// groups.
  final String? groupId;

  /// Shows the following information on the processing of <code>PUT</code> and
  /// <code>DELETE</code> actions for mapping users to their groups:
  ///
  /// <ul>
  /// <li>
  /// Status—the status can be either <code>PROCESSING</code>,
  /// <code>SUCCEEDED</code>, <code>DELETING</code>, <code>DELETED</code>, or
  /// <code>FAILED</code>.
  /// </li>
  /// <li>
  /// Last updated—the last date-time an action was updated.
  /// </li>
  /// <li>
  /// Received—the last date-time an action was received or submitted.
  /// </li>
  /// <li>
  /// Ordering ID—the latest action that should process and apply after other
  /// actions.
  /// </li>
  /// <li>
  /// Failure reason—the reason an action could not be processed.
  /// </li>
  /// </ul>
  final List<GroupOrderingIdSummary>? groupOrderingIdSummaries;

  /// Shows the identifier of the index to see information on the processing of
  /// <code>PUT</code> and <code>DELETE</code> actions for mapping users to their
  /// groups.
  final String? indexId;

  DescribePrincipalMappingResponse({
    this.dataSourceId,
    this.groupId,
    this.groupOrderingIdSummaries,
    this.indexId,
  });

  factory DescribePrincipalMappingResponse.fromJson(Map<String, dynamic> json) {
    return DescribePrincipalMappingResponse(
      dataSourceId: json['DataSourceId'] as String?,
      groupId: json['GroupId'] as String?,
      groupOrderingIdSummaries: (json['GroupOrderingIdSummaries'] as List?)
          ?.whereNotNull()
          .map(
              (e) => GroupOrderingIdSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      indexId: json['IndexId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSourceId = this.dataSourceId;
    final groupId = this.groupId;
    final groupOrderingIdSummaries = this.groupOrderingIdSummaries;
    final indexId = this.indexId;
    return {
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
      if (groupId != null) 'GroupId': groupId,
      if (groupOrderingIdSummaries != null)
        'GroupOrderingIdSummaries': groupOrderingIdSummaries,
      if (indexId != null) 'IndexId': indexId,
    };
  }
}

class DescribeQuerySuggestionsBlockListResponse {
  /// The Unix timestamp when a block list for query suggestions was created.
  final DateTime? createdAt;

  /// The description for the block list.
  final String? description;

  /// The error message containing details if there are issues processing the
  /// block list.
  final String? errorMessage;

  /// The current size of the block list text file in S3.
  final int? fileSizeBytes;

  /// The identifier of the block list.
  final String? id;

  /// The identifier of the index for the block list.
  final String? indexId;

  /// The current number of valid, non-empty words or phrases in the block list
  /// text file.
  final int? itemCount;

  /// The name of the block list.
  final String? name;

  /// The IAM (Identity and Access Management) role used by Amazon Kendra to
  /// access the block list text file in S3.
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

  /// The current status of the block list. When the value is <code>ACTIVE</code>,
  /// the block list is ready for use.
  final QuerySuggestionsBlockListStatus? status;

  /// The Unix timestamp when a block list for query suggestions was last updated.
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
  /// Configuration information for the document fields/attributes that you want
  /// to base query suggestions on.
  final AttributeSuggestionsDescribeConfig? attributeSuggestionsConfig;

  /// <code>TRUE</code> to use all queries, otherwise use only queries that
  /// include user information to generate the query suggestions.
  final bool? includeQueriesWithoutUserInformation;

  /// The Unix timestamp when query suggestions for an index was last cleared.
  ///
  /// After you clear suggestions, Amazon Kendra learns new suggestions based on
  /// new queries added to the query log from the time you cleared suggestions.
  /// Amazon Kendra only considers re-occurences of a query from the time you
  /// cleared suggestions.
  final DateTime? lastClearTime;

  /// The Unix timestamp when query suggestions for an index was last updated.
  ///
  /// Amazon Kendra automatically updates suggestions every 24 hours, after you
  /// change a setting or after you apply a <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/query-suggestions.html#query-suggestions-blocklist">block
  /// list</a>.
  final DateTime? lastSuggestionsBuildTime;

  /// The minimum number of unique users who must search a query in order for the
  /// query to be eligible to suggest to your users.
  final int? minimumNumberOfQueryingUsers;

  /// The minimum number of times a query must be searched in order for the query
  /// to be eligible to suggest to your users.
  final int? minimumQueryCount;

  /// Whether query suggestions are currently in <code>ENABLED</code> mode or
  /// <code>LEARN_ONLY</code> mode.
  ///
  /// By default, Amazon Kendra enables query suggestions.<code>LEARN_ONLY</code>
  /// turns off query suggestions for your users. You can change the mode using
  /// the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateQuerySuggestionsConfig.html">UpdateQuerySuggestionsConfig</a>
  /// API.
  final Mode? mode;

  /// How recent your queries are in your query log time window (in days).
  final int? queryLogLookBackWindowInDays;

  /// Whether the status of query suggestions settings is currently
  /// <code>ACTIVE</code> or <code>UPDATING</code>.
  ///
  /// Active means the current settings apply and Updating means your changed
  /// settings are in the process of applying.
  final QuerySuggestionsStatus? status;

  /// The current total count of query suggestions for an index.
  ///
  /// This count can change when you update your query suggestions settings, if
  /// you filter out certain queries from suggestions using a block list, and as
  /// the query log accumulates more queries for Amazon Kendra to learn from.
  ///
  /// If the count is much lower than you expected, it could be because Amazon
  /// Kendra needs more queries in the query history to learn from or your current
  /// query suggestions settings are too strict.
  final int? totalSuggestionsCount;

  DescribeQuerySuggestionsConfigResponse({
    this.attributeSuggestionsConfig,
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
      attributeSuggestionsConfig: json['AttributeSuggestionsConfig'] != null
          ? AttributeSuggestionsDescribeConfig.fromJson(
              json['AttributeSuggestionsConfig'] as Map<String, dynamic>)
          : null,
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
    final attributeSuggestionsConfig = this.attributeSuggestionsConfig;
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
      if (attributeSuggestionsConfig != null)
        'AttributeSuggestionsConfig': attributeSuggestionsConfig,
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
  /// The Unix timestamp when the thesaurus was created.
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

  /// The identifier of the index for the thesaurus.
  final String? indexId;

  /// The thesaurus name.
  final String? name;

  /// An IAM role that gives Amazon Kendra permissions to access thesaurus file
  /// specified in <code>SourceS3Path</code>.
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

  /// The Unix timestamp when the thesaurus was last updated.
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

class DisassociateEntitiesFromExperienceResponse {
  /// Lists the users or groups in your IAM Identity Center identity source that
  /// failed to properly remove access to your Amazon Kendra experience.
  final List<FailedEntity>? failedEntityList;

  DisassociateEntitiesFromExperienceResponse({
    this.failedEntityList,
  });

  factory DisassociateEntitiesFromExperienceResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateEntitiesFromExperienceResponse(
      failedEntityList: (json['FailedEntityList'] as List?)
          ?.whereNotNull()
          .map((e) => FailedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedEntityList = this.failedEntityList;
    return {
      if (failedEntityList != null) 'FailedEntityList': failedEntityList,
    };
  }
}

class DisassociatePersonasFromEntitiesResponse {
  /// Lists the users or groups in your IAM Identity Center identity source that
  /// failed to properly remove access to your Amazon Kendra experience.
  final List<FailedEntity>? failedEntityList;

  DisassociatePersonasFromEntitiesResponse({
    this.failedEntityList,
  });

  factory DisassociatePersonasFromEntitiesResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociatePersonasFromEntitiesResponse(
      failedEntityList: (json['FailedEntityList'] as List?)
          ?.whereNotNull()
          .map((e) => FailedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failedEntityList = this.failedEntityList;
    return {
      if (failedEntityList != null) 'FailedEntityList': failedEntityList,
    };
  }
}

/// A document in an index.
class Document {
  /// A identifier of the document in the index.
  ///
  /// Note, each document ID must be unique per index. You cannot create a data
  /// source to index your documents with their unique IDs and then use the
  /// <code>BatchPutDocument</code> API to index the same documents, or vice
  /// versa. You can delete a data source and then use the
  /// <code>BatchPutDocument</code> API to index the same documents, or vice
  /// versa.
  final String id;

  /// The identifier of the access control configuration that you want to apply to
  /// the document.
  final String? accessControlConfigurationId;

  /// Information on principals (users and/or groups) and which documents they
  /// should have access to. This is useful for user context filtering, where
  /// search results are filtered based on the user or their group access to
  /// documents.
  final List<Principal>? accessControlList;

  /// Custom attributes to apply to the document. Use the custom attributes to
  /// provide additional information for searching, to provide facets for refining
  /// searches, and to provide additional information in the query response.
  ///
  /// For example, 'DataSourceId' and 'DataSourceSyncJobId' are custom attributes
  /// that provide information on the synchronization of documents running on a
  /// data source. Note, 'DataSourceSyncJobId' could be an optional custom
  /// attribute as Amazon Kendra will use the ID of a running sync job.
  final List<DocumentAttribute>? attributes;

  /// The contents of the document.
  ///
  /// Documents passed to the <code>Blob</code> parameter must be base64 encoded.
  /// Your code might not need to encode the document file bytes if you're using
  /// an Amazon Web Services SDK to call Amazon Kendra APIs. If you are calling
  /// the Amazon Kendra endpoint directly using REST, you must base64 encode the
  /// contents before sending.
  final Uint8List? blob;

  /// The file type of the document in the <code>Blob</code> field.
  ///
  /// If you want to index snippets or subsets of HTML documents instead of the
  /// entirety of the HTML documents, you must add the <code>HTML</code> start and
  /// closing tags (<code>&lt;HTML&gt;content&lt;/HTML&gt;</code>) around the
  /// content.
  final ContentType? contentType;

  /// The list of <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html">principal</a>
  /// lists that define the hierarchy for which documents users should have access
  /// to.
  final List<HierarchicalPrincipal>? hierarchicalAccessControlList;
  final S3Path? s3Path;

  /// The title of the document.
  final String? title;

  Document({
    required this.id,
    this.accessControlConfigurationId,
    this.accessControlList,
    this.attributes,
    this.blob,
    this.contentType,
    this.hierarchicalAccessControlList,
    this.s3Path,
    this.title,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final accessControlConfigurationId = this.accessControlConfigurationId;
    final accessControlList = this.accessControlList;
    final attributes = this.attributes;
    final blob = this.blob;
    final contentType = this.contentType;
    final hierarchicalAccessControlList = this.hierarchicalAccessControlList;
    final s3Path = this.s3Path;
    final title = this.title;
    return {
      'Id': id,
      if (accessControlConfigurationId != null)
        'AccessControlConfigurationId': accessControlConfigurationId,
      if (accessControlList != null) 'AccessControlList': accessControlList,
      if (attributes != null) 'Attributes': attributes,
      if (blob != null) 'Blob': base64Encode(blob),
      if (contentType != null) 'ContentType': contentType.toValue(),
      if (hierarchicalAccessControlList != null)
        'HierarchicalAccessControlList': hierarchicalAccessControlList,
      if (s3Path != null) 'S3Path': s3Path,
      if (title != null) 'Title': title,
    };
  }
}

/// A document attribute or metadata field. To create custom document
/// attributes, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-attributes.html">Custom
/// attributes</a>.
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

/// The condition used for the target document attribute or metadata field when
/// ingesting documents into Amazon Kendra. You use this with <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_DocumentAttributeTarget.html">DocumentAttributeTarget
/// to apply the condition</a>.
///
/// For example, you can create the 'Department' target field and have it
/// prefill department names associated with the documents based on information
/// in the 'Source_URI' field. Set the condition that if the 'Source_URI' field
/// contains 'financial' in its URI value, then prefill the target field
/// 'Department' with the target value 'Finance' for the document.
///
/// Amazon Kendra cannot create a target field if it has not already been
/// created as an index field. After you create your index field, you can create
/// a document metadata field using <code>DocumentAttributeTarget</code>. Amazon
/// Kendra then will map your newly created metadata field to your index field.
class DocumentAttributeCondition {
  /// The identifier of the document attribute used for the condition.
  ///
  /// For example, 'Source_URI' could be an identifier for the attribute or
  /// metadata field that contains source URIs associated with the documents.
  ///
  /// Amazon Kendra currently does not support <code>_document_body</code> as an
  /// attribute key used for the condition.
  final String conditionDocumentAttributeKey;

  /// The condition operator.
  ///
  /// For example, you can use 'Contains' to partially match a string.
  final ConditionOperator operator;

  /// The value used by the operator.
  ///
  /// For example, you can specify the value 'financial' for strings in the
  /// 'Source_URI' field that partially match or contain this value.
  final DocumentAttributeValue? conditionOnValue;

  DocumentAttributeCondition({
    required this.conditionDocumentAttributeKey,
    required this.operator,
    this.conditionOnValue,
  });

  factory DocumentAttributeCondition.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeCondition(
      conditionDocumentAttributeKey:
          json['ConditionDocumentAttributeKey'] as String,
      operator: (json['Operator'] as String).toConditionOperator(),
      conditionOnValue: json['ConditionOnValue'] != null
          ? DocumentAttributeValue.fromJson(
              json['ConditionOnValue'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conditionDocumentAttributeKey = this.conditionDocumentAttributeKey;
    final operator = this.operator;
    final conditionOnValue = this.conditionOnValue;
    return {
      'ConditionDocumentAttributeKey': conditionDocumentAttributeKey,
      'Operator': operator.toValue(),
      if (conditionOnValue != null) 'ConditionOnValue': conditionOnValue,
    };
  }
}

/// The target document attribute or metadata field you want to alter when
/// ingesting documents into Amazon Kendra.
///
/// For example, you can delete customer identification numbers associated with
/// the documents, stored in the document metadata field called 'Customer_ID'.
/// You set the target key as 'Customer_ID' and the deletion flag to
/// <code>TRUE</code>. This removes all customer ID values in the field
/// 'Customer_ID'. This would scrub personally identifiable information from
/// each document's metadata.
///
/// Amazon Kendra cannot create a target field if it has not already been
/// created as an index field. After you create your index field, you can create
/// a document metadata field using <code>DocumentAttributeTarget</code>. Amazon
/// Kendra then will map your newly created metadata field to your index field.
///
/// You can also use this with <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_DocumentAttributeCondition.html">DocumentAttributeCondition</a>.
class DocumentAttributeTarget {
  /// The identifier of the target document attribute or metadata field.
  ///
  /// For example, 'Department' could be an identifier for the target attribute or
  /// metadata field that includes the department names associated with the
  /// documents.
  final String? targetDocumentAttributeKey;

  /// The target value you want to create for the target attribute.
  ///
  /// For example, 'Finance' could be the target value for the target attribute
  /// key 'Department'.
  final DocumentAttributeValue? targetDocumentAttributeValue;

  /// <code>TRUE</code> to delete the existing target value for your specified
  /// target attribute key. You cannot create a target value and set this to
  /// <code>TRUE</code>. To create a target value
  /// (<code>TargetDocumentAttributeValue</code>), set this to <code>FALSE</code>.
  final bool? targetDocumentAttributeValueDeletion;

  DocumentAttributeTarget({
    this.targetDocumentAttributeKey,
    this.targetDocumentAttributeValue,
    this.targetDocumentAttributeValueDeletion,
  });

  factory DocumentAttributeTarget.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeTarget(
      targetDocumentAttributeKey: json['TargetDocumentAttributeKey'] as String?,
      targetDocumentAttributeValue: json['TargetDocumentAttributeValue'] != null
          ? DocumentAttributeValue.fromJson(
              json['TargetDocumentAttributeValue'] as Map<String, dynamic>)
          : null,
      targetDocumentAttributeValueDeletion:
          json['TargetDocumentAttributeValueDeletion'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetDocumentAttributeKey = this.targetDocumentAttributeKey;
    final targetDocumentAttributeValue = this.targetDocumentAttributeValue;
    final targetDocumentAttributeValueDeletion =
        this.targetDocumentAttributeValueDeletion;
    return {
      if (targetDocumentAttributeKey != null)
        'TargetDocumentAttributeKey': targetDocumentAttributeKey,
      if (targetDocumentAttributeValue != null)
        'TargetDocumentAttributeValue': targetDocumentAttributeValue,
      if (targetDocumentAttributeValueDeletion != null)
        'TargetDocumentAttributeValueDeletion':
            targetDocumentAttributeValueDeletion,
    };
  }
}

/// The value of a document attribute. You can only provide one value for a
/// document attribute.
class DocumentAttributeValue {
  /// A date expressed as an ISO 8601 string.
  ///
  /// It is important for the time zone to be included in the ISO 8601 date-time
  /// format. For example, 2012-03-25T12:30:10+01:00 is the ISO 8601 date-time
  /// format for March 25th 2012 at 12:30PM (plus 10 seconds) in Central European
  /// Time.
  final DateTime? dateValue;

  /// A long integer value.
  final int? longValue;

  /// A list of strings. The default maximum length or number of strings is 10.
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

/// Provides the count of documents that match a particular document attribute
/// or field when doing a faceted search.
class DocumentAttributeValueCountPair {
  /// The number of documents in the response that have the attribute/field value
  /// for the key.
  final int? count;

  /// The value of the attribute/field. For example, "HR".
  final DocumentAttributeValue? documentAttributeValue;

  /// Contains the results of a document attribute/field that is a nested facet. A
  /// <code>FacetResult</code> contains the counts for each facet nested within a
  /// facet.
  ///
  /// For example, the document attribute or facet "Department" includes a value
  /// called "Engineering". In addition, the document attribute or facet
  /// "SubDepartment" includes the values "Frontend" and "Backend" for documents
  /// assigned to "Engineering". You can display nested facets in the search
  /// results so that documents can be searched not only by department but also by
  /// a sub department within a department. The counts for documents that belong
  /// to "Frontend" and "Backend" within "Engineering" are returned for a query.
  /// <p/> <p/>
  final List<FacetResult>? facetResults;

  DocumentAttributeValueCountPair({
    this.count,
    this.documentAttributeValue,
    this.facetResults,
  });

  factory DocumentAttributeValueCountPair.fromJson(Map<String, dynamic> json) {
    return DocumentAttributeValueCountPair(
      count: json['Count'] as int?,
      documentAttributeValue: json['DocumentAttributeValue'] != null
          ? DocumentAttributeValue.fromJson(
              json['DocumentAttributeValue'] as Map<String, dynamic>)
          : null,
      facetResults: (json['FacetResults'] as List?)
          ?.whereNotNull()
          .map((e) => FacetResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final documentAttributeValue = this.documentAttributeValue;
    final facetResults = this.facetResults;
    return {
      if (count != null) 'Count': count,
      if (documentAttributeValue != null)
        'DocumentAttributeValue': documentAttributeValue,
      if (facetResults != null) 'FacetResults': facetResults,
    };
  }
}

enum DocumentAttributeValueType {
  stringValue,
  stringListValue,
  longValue,
  dateValue,
}

extension DocumentAttributeValueTypeValueExtension
    on DocumentAttributeValueType {
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

extension DocumentAttributeValueTypeFromString on String {
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
  /// The identifier of the document.
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

  Map<String, dynamic> toJson() {
    final documentId = this.documentId;
    final attributes = this.attributes;
    return {
      'DocumentId': documentId,
      if (attributes != null) 'Attributes': attributes,
    };
  }
}

/// Specifies the properties, such as relevance tuning and searchability, of an
/// index field.
class DocumentMetadataConfiguration {
  /// The name of the index field.
  final String name;

  /// The data type of the index field.
  final DocumentAttributeValueType type;

  /// Provides tuning parameters to determine how the field affects the search
  /// results.
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
  /// The name of the index field.
  final String name;

  /// Provides information for tuning the relevance of a field in a search. When a
  /// query includes terms that match the field, the results are given a boost in
  /// the response based on these tuning parameters.
  final Relevance relevance;

  DocumentRelevanceConfiguration({
    required this.name,
    required this.relevance,
  });

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

extension DocumentStatusValueExtension on DocumentStatus {
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

extension DocumentStatusFromString on String {
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
  /// A prefix used to filter metadata configuration files in the Amazon Web
  /// Services S3 bucket. The S3 bucket might contain multiple metadata files. Use
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

enum EndpointType {
  home,
}

extension EndpointTypeValueExtension on EndpointType {
  String toValue() {
    switch (this) {
      case EndpointType.home:
        return 'HOME';
    }
  }
}

extension EndpointTypeFromString on String {
  EndpointType toEndpointType() {
    switch (this) {
      case 'HOME':
        return EndpointType.home;
    }
    throw Exception('$this is not known in enum EndpointType');
  }
}

/// Provides the configuration information for users or groups in your IAM
/// Identity Center identity source to grant access your Amazon Kendra
/// experience.
class EntityConfiguration {
  /// The identifier of a user or group in your IAM Identity Center identity
  /// source. For example, a user ID could be an email.
  final String entityId;

  /// Specifies whether you are configuring a <code>User</code> or a
  /// <code>Group</code>.
  final EntityType entityType;

  EntityConfiguration({
    required this.entityId,
    required this.entityType,
  });

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final entityType = this.entityType;
    return {
      'EntityId': entityId,
      'EntityType': entityType.toValue(),
    };
  }
}

/// Information about the user entity.
class EntityDisplayData {
  /// The first name of the user.
  final String? firstName;

  /// The name of the group.
  final String? groupName;

  /// The user name of the user.
  final String? identifiedUserName;

  /// The last name of the user.
  final String? lastName;

  /// The name of the user.
  final String? userName;

  EntityDisplayData({
    this.firstName,
    this.groupName,
    this.identifiedUserName,
    this.lastName,
    this.userName,
  });

  factory EntityDisplayData.fromJson(Map<String, dynamic> json) {
    return EntityDisplayData(
      firstName: json['FirstName'] as String?,
      groupName: json['GroupName'] as String?,
      identifiedUserName: json['IdentifiedUserName'] as String?,
      lastName: json['LastName'] as String?,
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstName = this.firstName;
    final groupName = this.groupName;
    final identifiedUserName = this.identifiedUserName;
    final lastName = this.lastName;
    final userName = this.userName;
    return {
      if (firstName != null) 'FirstName': firstName,
      if (groupName != null) 'GroupName': groupName,
      if (identifiedUserName != null) 'IdentifiedUserName': identifiedUserName,
      if (lastName != null) 'LastName': lastName,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Provides the configuration information for users or groups in your IAM
/// Identity Center identity source for access to your Amazon Kendra experience.
/// Specific permissions are defined for each user or group once they are
/// granted access to your Amazon Kendra experience.
class EntityPersonaConfiguration {
  /// The identifier of a user or group in your IAM Identity Center identity
  /// source. For example, a user ID could be an email.
  final String entityId;

  /// The persona that defines the specific permissions of the user or group in
  /// your IAM Identity Center identity source. The available personas or access
  /// roles are <code>Owner</code> and <code>Viewer</code>. For more information
  /// on these personas, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience">Providing
  /// access to your search page</a>.
  final Persona persona;

  EntityPersonaConfiguration({
    required this.entityId,
    required this.persona,
  });

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final persona = this.persona;
    return {
      'EntityId': entityId,
      'Persona': persona.toValue(),
    };
  }
}

enum EntityType {
  user,
  group,
}

extension EntityTypeValueExtension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.user:
        return 'USER';
      case EntityType.group:
        return 'GROUP';
    }
  }
}

extension EntityTypeFromString on String {
  EntityType toEntityType() {
    switch (this) {
      case 'USER':
        return EntityType.user;
      case 'GROUP':
        return EntityType.group;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

enum ErrorCode {
  internalError,
  invalidRequest,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.internalError:
        return 'InternalError';
      case ErrorCode.invalidRequest:
        return 'InvalidRequest';
    }
  }
}

extension ErrorCodeFromString on String {
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

/// Specifies the configuration information needed to customize how collapsed
/// search result groups expand.
class ExpandConfiguration {
  /// The number of expanded results to show per collapsed primary document. For
  /// instance, if you set this value to 3, then at most 3 results per collapsed
  /// group will be displayed.
  final int? maxExpandedResultsPerItem;

  /// The number of collapsed search result groups to expand. If you set this
  /// value to 10, for example, only the first 10 out of 100 result groups will
  /// have expand functionality.
  final int? maxResultItemsToExpand;

  ExpandConfiguration({
    this.maxExpandedResultsPerItem,
    this.maxResultItemsToExpand,
  });

  Map<String, dynamic> toJson() {
    final maxExpandedResultsPerItem = this.maxExpandedResultsPerItem;
    final maxResultItemsToExpand = this.maxResultItemsToExpand;
    return {
      if (maxExpandedResultsPerItem != null)
        'MaxExpandedResultsPerItem': maxExpandedResultsPerItem,
      if (maxResultItemsToExpand != null)
        'MaxResultItemsToExpand': maxResultItemsToExpand,
    };
  }
}

/// A single expanded result in a collapsed group of search results.
///
/// An expanded result item contains information about an expanded result
/// document within a collapsed group of search results. This includes the
/// original location of the document, a list of attributes assigned to the
/// document, and relevant text from the document that satisfies the query.
class ExpandedResultItem {
  /// An array of document attributes assigned to a document in the search
  /// results. For example, the document author ("_author") or the source URI
  /// ("_source_uri") of the document.
  final List<DocumentAttribute>? documentAttributes;
  final TextWithHighlights? documentExcerpt;

  /// The idenitifier of the document.
  final String? documentId;
  final TextWithHighlights? documentTitle;

  /// The URI of the original location of the document.
  final String? documentURI;

  /// The identifier for the expanded result.
  final String? id;

  ExpandedResultItem({
    this.documentAttributes,
    this.documentExcerpt,
    this.documentId,
    this.documentTitle,
    this.documentURI,
    this.id,
  });

  factory ExpandedResultItem.fromJson(Map<String, dynamic> json) {
    return ExpandedResultItem(
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
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final documentAttributes = this.documentAttributes;
    final documentExcerpt = this.documentExcerpt;
    final documentId = this.documentId;
    final documentTitle = this.documentTitle;
    final documentURI = this.documentURI;
    final id = this.id;
    return {
      if (documentAttributes != null) 'DocumentAttributes': documentAttributes,
      if (documentExcerpt != null) 'DocumentExcerpt': documentExcerpt,
      if (documentId != null) 'DocumentId': documentId,
      if (documentTitle != null) 'DocumentTitle': documentTitle,
      if (documentURI != null) 'DocumentURI': documentURI,
      if (id != null) 'Id': id,
    };
  }
}

/// Provides the configuration information for your Amazon Kendra experience.
/// This includes the data source IDs and/or FAQ IDs, and user or group
/// information to grant access to your Amazon Kendra experience.
class ExperienceConfiguration {
  /// The identifiers of your data sources and FAQs. Or, you can specify that you
  /// want to use documents indexed via the <code>BatchPutDocument</code> API.
  /// This is the content you want to use for your Amazon Kendra experience.
  final ContentSourceConfiguration? contentSourceConfiguration;

  /// The IAM Identity Center field name that contains the identifiers of your
  /// users, such as their emails.
  final UserIdentityConfiguration? userIdentityConfiguration;

  ExperienceConfiguration({
    this.contentSourceConfiguration,
    this.userIdentityConfiguration,
  });

  factory ExperienceConfiguration.fromJson(Map<String, dynamic> json) {
    return ExperienceConfiguration(
      contentSourceConfiguration: json['ContentSourceConfiguration'] != null
          ? ContentSourceConfiguration.fromJson(
              json['ContentSourceConfiguration'] as Map<String, dynamic>)
          : null,
      userIdentityConfiguration: json['UserIdentityConfiguration'] != null
          ? UserIdentityConfiguration.fromJson(
              json['UserIdentityConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentSourceConfiguration = this.contentSourceConfiguration;
    final userIdentityConfiguration = this.userIdentityConfiguration;
    return {
      if (contentSourceConfiguration != null)
        'ContentSourceConfiguration': contentSourceConfiguration,
      if (userIdentityConfiguration != null)
        'UserIdentityConfiguration': userIdentityConfiguration,
    };
  }
}

/// Provides the configuration information for the endpoint for your Amazon
/// Kendra experience.
class ExperienceEndpoint {
  /// The endpoint of your Amazon Kendra experience.
  final String? endpoint;

  /// The type of endpoint for your Amazon Kendra experience. The type currently
  /// available is <code>HOME</code>, which is a unique and fully hosted URL to
  /// the home page of your Amazon Kendra experience.
  final EndpointType? endpointType;

  ExperienceEndpoint({
    this.endpoint,
    this.endpointType,
  });

  factory ExperienceEndpoint.fromJson(Map<String, dynamic> json) {
    return ExperienceEndpoint(
      endpoint: json['Endpoint'] as String?,
      endpointType: (json['EndpointType'] as String?)?.toEndpointType(),
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final endpointType = this.endpointType;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
      if (endpointType != null) 'EndpointType': endpointType.toValue(),
    };
  }
}

/// Summary information for users or groups in your IAM Identity Center identity
/// source with granted access to your Amazon Kendra experience. You can create
/// an Amazon Kendra experience such as a search application. For more
/// information on creating a search application experience, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
/// a search experience with no code</a>.
class ExperienceEntitiesSummary {
  /// Information about the user entity.
  final EntityDisplayData? displayData;

  /// The identifier of a user or group in your IAM Identity Center identity
  /// source. For example, a user ID could be an email.
  final String? entityId;

  /// Shows the type as <code>User</code> or <code>Group</code>.
  final EntityType? entityType;

  ExperienceEntitiesSummary({
    this.displayData,
    this.entityId,
    this.entityType,
  });

  factory ExperienceEntitiesSummary.fromJson(Map<String, dynamic> json) {
    return ExperienceEntitiesSummary(
      displayData: json['DisplayData'] != null
          ? EntityDisplayData.fromJson(
              json['DisplayData'] as Map<String, dynamic>)
          : null,
      entityId: json['EntityId'] as String?,
      entityType: (json['EntityType'] as String?)?.toEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final displayData = this.displayData;
    final entityId = this.entityId;
    final entityType = this.entityType;
    return {
      if (displayData != null) 'DisplayData': displayData,
      if (entityId != null) 'EntityId': entityId,
      if (entityType != null) 'EntityType': entityType.toValue(),
    };
  }
}

enum ExperienceStatus {
  creating,
  active,
  deleting,
  failed,
}

extension ExperienceStatusValueExtension on ExperienceStatus {
  String toValue() {
    switch (this) {
      case ExperienceStatus.creating:
        return 'CREATING';
      case ExperienceStatus.active:
        return 'ACTIVE';
      case ExperienceStatus.deleting:
        return 'DELETING';
      case ExperienceStatus.failed:
        return 'FAILED';
    }
  }
}

extension ExperienceStatusFromString on String {
  ExperienceStatus toExperienceStatus() {
    switch (this) {
      case 'CREATING':
        return ExperienceStatus.creating;
      case 'ACTIVE':
        return ExperienceStatus.active;
      case 'DELETING':
        return ExperienceStatus.deleting;
      case 'FAILED':
        return ExperienceStatus.failed;
    }
    throw Exception('$this is not known in enum ExperienceStatus');
  }
}

/// Summary information for your Amazon Kendra experience. You can create an
/// Amazon Kendra experience such as a search application. For more information
/// on creating a search application experience, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
/// a search experience with no code</a>.
class ExperiencesSummary {
  /// The Unix timestamp when your Amazon Kendra experience was created.
  final DateTime? createdAt;

  /// The endpoint URLs for your Amazon Kendra experiences. The URLs are unique
  /// and fully hosted by Amazon Web Services.
  final List<ExperienceEndpoint>? endpoints;

  /// The identifier of your Amazon Kendra experience.
  final String? id;

  /// The name of your Amazon Kendra experience.
  final String? name;

  /// The processing status of your Amazon Kendra experience.
  final ExperienceStatus? status;

  ExperiencesSummary({
    this.createdAt,
    this.endpoints,
    this.id,
    this.name,
    this.status,
  });

  factory ExperiencesSummary.fromJson(Map<String, dynamic> json) {
    return ExperiencesSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      endpoints: (json['Endpoints'] as List?)
          ?.whereNotNull()
          .map((e) => ExperienceEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toExperienceStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endpoints = this.endpoints;
    final id = this.id;
    final name = this.name;
    final status = this.status;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (endpoints != null) 'Endpoints': endpoints,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Information about a document attribute or field. You can use document
/// attributes as facets.
///
/// For example, the document attribute or facet "Department" includes the
/// values "HR", "Engineering", and "Accounting". You can display these values
/// in the search results so that documents can be searched by department.
///
/// You can display up to 10 facet values per facet for a query. If you want to
/// increase this limit, contact <a
/// href="http://aws.amazon.com/contact-us/">Support</a>.
class Facet {
  /// The unique key for the document attribute.
  final String? documentAttributeKey;

  /// An array of document attributes that are nested facets within a facet.
  ///
  /// For example, the document attribute or facet "Department" includes a value
  /// called "Engineering". In addition, the document attribute or facet
  /// "SubDepartment" includes the values "Frontend" and "Backend" for documents
  /// assigned to "Engineering". You can display nested facets in the search
  /// results so that documents can be searched not only by department but also by
  /// a sub department within a department. This helps your users further narrow
  /// their search.
  ///
  /// You can only have one nested facet within a facet. If you want to increase
  /// this limit, contact <a href="http://aws.amazon.com/contact-us/">Support</a>.
  final List<Facet>? facets;

  /// Maximum number of facet values per facet. The default is 10. You can use
  /// this to limit the number of facet values to less than 10. If you want to
  /// increase the default, contact <a
  /// href="http://aws.amazon.com/contact-us/">Support</a>.
  final int? maxResults;

  Facet({
    this.documentAttributeKey,
    this.facets,
    this.maxResults,
  });

  Map<String, dynamic> toJson() {
    final documentAttributeKey = this.documentAttributeKey;
    final facets = this.facets;
    final maxResults = this.maxResults;
    return {
      if (documentAttributeKey != null)
        'DocumentAttributeKey': documentAttributeKey,
      if (facets != null) 'Facets': facets,
      if (maxResults != null) 'MaxResults': maxResults,
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

/// Information on the users or groups in your IAM Identity Center identity
/// source that failed to properly configure with your Amazon Kendra experience.
class FailedEntity {
  /// The identifier of the user or group in your IAM Identity Center identity
  /// source. For example, a user ID could be an email.
  final String? entityId;

  /// The reason the user or group in your IAM Identity Center identity source
  /// failed to properly configure with your Amazon Kendra experience.
  final String? errorMessage;

  FailedEntity({
    this.entityId,
    this.errorMessage,
  });

  factory FailedEntity.fromJson(Map<String, dynamic> json) {
    return FailedEntity(
      entityId: json['EntityId'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entityId = this.entityId;
    final errorMessage = this.errorMessage;
    return {
      if (entityId != null) 'EntityId': entityId,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

enum FaqFileFormat {
  csv,
  csvWithHeader,
  json,
}

extension FaqFileFormatValueExtension on FaqFileFormat {
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

extension FaqFileFormatFromString on String {
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

extension FaqStatusValueExtension on FaqStatus {
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

extension FaqStatusFromString on String {
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

/// Summary information for frequently asked questions and answers included in
/// an index.
class FaqSummary {
  /// The Unix timestamp when the FAQ was created.
  final DateTime? createdAt;

  /// The file type used to create the FAQ.
  final FaqFileFormat? fileFormat;

  /// The identifier of the FAQ.
  final String? id;

  /// The code for a language. This shows a supported language for the FAQ
  /// document as part of the summary information for FAQs. English is supported
  /// by default. For more information on supported languages, including their
  /// codes, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/in-adding-languages.html">Adding
  /// documents in languages other than English</a>.
  final String? languageCode;

  /// The name that you assigned the FAQ when you created or updated the FAQ.
  final String? name;

  /// The current status of the FAQ. When the status is <code>ACTIVE</code> the
  /// FAQ is ready for use.
  final FaqStatus? status;

  /// The Unix timestamp when the FAQ was last updated.
  final DateTime? updatedAt;

  FaqSummary({
    this.createdAt,
    this.fileFormat,
    this.id,
    this.languageCode,
    this.name,
    this.status,
    this.updatedAt,
  });

  factory FaqSummary.fromJson(Map<String, dynamic> json) {
    return FaqSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      fileFormat: (json['FileFormat'] as String?)?.toFaqFileFormat(),
      id: json['Id'] as String?,
      languageCode: json['LanguageCode'] as String?,
      name: json['Name'] as String?,
      status: (json['Status'] as String?)?.toFaqStatus(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final fileFormat = this.fileFormat;
    final id = this.id;
    final languageCode = this.languageCode;
    final name = this.name;
    final status = this.status;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (fileFormat != null) 'FileFormat': fileFormat.toValue(),
      if (id != null) 'Id': id,
      if (languageCode != null) 'LanguageCode': languageCode,
      if (name != null) 'Name': name,
      if (status != null) 'Status': status.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// A featured document. This document is displayed at the top of the search
/// results page, placed above all other results for certain queries. If there's
/// an exact match of a query, then the document is featured in the search
/// results.
class FeaturedDocument {
  /// The identifier of the document to feature in the search results. You can use
  /// the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html">Query</a>
  /// API to search for specific documents with their document IDs included in the
  /// result items, or you can use the console.
  final String? id;

  FeaturedDocument({
    this.id,
  });

  factory FeaturedDocument.fromJson(Map<String, dynamic> json) {
    return FeaturedDocument(
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

/// A document ID doesn't exist but you have specified as a featured document.
/// Amazon Kendra cannot feature the document if it doesn't exist in the index.
/// You can check the status of a document and its ID or check for documents
/// with status errors using the <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_BatchGetDocumentStatus.html">BatchGetDocumentStatus</a>
/// API.
class FeaturedDocumentMissing {
  /// The identifier of the document that doesn't exist but you have specified as
  /// a featured document.
  final String? id;

  FeaturedDocumentMissing({
    this.id,
  });

  factory FeaturedDocumentMissing.fromJson(Map<String, dynamic> json) {
    return FeaturedDocumentMissing(
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

/// A featured document with its metadata information. This document is
/// displayed at the top of the search results page, placed above all other
/// results for certain queries. If there's an exact match of a query, then the
/// document is featured in the search results.
class FeaturedDocumentWithMetadata {
  /// The identifier of the featured document with its metadata. You can use the
  /// <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html">Query</a>
  /// API to search for specific documents with their document IDs included in the
  /// result items, or you can use the console.
  final String? id;

  /// The main title of the featured document.
  final String? title;

  /// The source URI location of the featured document.
  final String? uri;

  FeaturedDocumentWithMetadata({
    this.id,
    this.title,
    this.uri,
  });

  factory FeaturedDocumentWithMetadata.fromJson(Map<String, dynamic> json) {
    return FeaturedDocumentWithMetadata(
      id: json['Id'] as String?,
      title: json['Title'] as String?,
      uri: json['URI'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final title = this.title;
    final uri = this.uri;
    return {
      if (id != null) 'Id': id,
      if (title != null) 'Title': title,
      if (uri != null) 'URI': uri,
    };
  }
}

/// A single featured result item. A featured result is displayed at the top of
/// the search results page, placed above all other results for certain queries.
/// If there's an exact match of a query, then certain documents are featured in
/// the search results.
class FeaturedResultsItem {
  /// One or more additional attributes associated with the featured result.
  final List<AdditionalResultAttribute>? additionalAttributes;

  /// An array of document attributes assigned to a featured document in the
  /// search results. For example, the document author (<code>_author</code>) or
  /// the source URI (<code>_source_uri</code>) of the document.
  final List<DocumentAttribute>? documentAttributes;
  final TextWithHighlights? documentExcerpt;

  /// The identifier of the featured document.
  final String? documentId;
  final TextWithHighlights? documentTitle;

  /// The source URI location of the featured document.
  final String? documentURI;

  /// A token that identifies a particular featured result from a particular
  /// query. Use this token to provide click-through feedback for the result. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/submitting-feedback.html">Submitting
  /// feedback</a>.
  final String? feedbackToken;

  /// The identifier of the featured result.
  final String? id;

  /// The type of document within the featured result response. For example, a
  /// response could include a question-answer type that's relevant to the query.
  final QueryResultType? type;

  FeaturedResultsItem({
    this.additionalAttributes,
    this.documentAttributes,
    this.documentExcerpt,
    this.documentId,
    this.documentTitle,
    this.documentURI,
    this.feedbackToken,
    this.id,
    this.type,
  });

  factory FeaturedResultsItem.fromJson(Map<String, dynamic> json) {
    return FeaturedResultsItem(
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
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// A set of featured results that are displayed at the top of your search
/// results. Featured results are placed above all other results for certain
/// queries. If there's an exact match of a query, then one or more specific
/// documents are featured in the search results.
class FeaturedResultsSet {
  /// The Unix timestamp when the set of featured results was created.
  final int? creationTimestamp;

  /// The description for the set of featured results.
  final String? description;

  /// The list of document IDs for the documents you want to feature at the top of
  /// the search results page. You can use the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Query.html">Query</a>
  /// API to search for specific documents with their document IDs included in the
  /// result items, or you can use the console.
  ///
  /// You can add up to four featured documents. You can request to increase this
  /// limit by contacting <a href="http://aws.amazon.com/contact-us/">Support</a>.
  ///
  /// Specific queries are mapped to specific documents for featuring in the
  /// results. If a query contains an exact match, then one or more specific
  /// documents are featured in the results. The exact match applies to the full
  /// query. For example, if you only specify 'Kendra', queries such as 'How does
  /// kendra semantically rank results?' will not render the featured results.
  /// Featured results are designed for specific queries, rather than queries that
  /// are too broad in scope.
  final List<FeaturedDocument>? featuredDocuments;

  /// The identifier of the set of featured results.
  final String? featuredResultsSetId;

  /// The name for the set of featured results.
  final String? featuredResultsSetName;

  /// The Unix timestamp when the set of featured results was last updated.
  final int? lastUpdatedTimestamp;

  /// The list of queries for featuring results.
  ///
  /// Specific queries are mapped to specific documents for featuring in the
  /// results. If a query contains an exact match, then one or more specific
  /// documents are featured in the results. The exact match applies to the full
  /// query. For example, if you only specify 'Kendra', queries such as 'How does
  /// kendra semantically rank results?' will not render the featured results.
  /// Featured results are designed for specific queries, rather than queries that
  /// are too broad in scope.
  final List<String>? queryTexts;

  /// The current status of the set of featured results. When the value is
  /// <code>ACTIVE</code>, featured results are ready for use. You can still
  /// configure your settings before setting the status to <code>ACTIVE</code>.
  /// You can set the status to <code>ACTIVE</code> or <code>INACTIVE</code> using
  /// the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html">UpdateFeaturedResultsSet</a>
  /// API. The queries you specify for featured results must be unique per
  /// featured results set for each index, whether the status is
  /// <code>ACTIVE</code> or <code>INACTIVE</code>.
  final FeaturedResultsSetStatus? status;

  FeaturedResultsSet({
    this.creationTimestamp,
    this.description,
    this.featuredDocuments,
    this.featuredResultsSetId,
    this.featuredResultsSetName,
    this.lastUpdatedTimestamp,
    this.queryTexts,
    this.status,
  });

  factory FeaturedResultsSet.fromJson(Map<String, dynamic> json) {
    return FeaturedResultsSet(
      creationTimestamp: json['CreationTimestamp'] as int?,
      description: json['Description'] as String?,
      featuredDocuments: (json['FeaturedDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => FeaturedDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredResultsSetId: json['FeaturedResultsSetId'] as String?,
      featuredResultsSetName: json['FeaturedResultsSetName'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as int?,
      queryTexts: (json['QueryTexts'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?)?.toFeaturedResultsSetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final description = this.description;
    final featuredDocuments = this.featuredDocuments;
    final featuredResultsSetId = this.featuredResultsSetId;
    final featuredResultsSetName = this.featuredResultsSetName;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final queryTexts = this.queryTexts;
    final status = this.status;
    return {
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (description != null) 'Description': description,
      if (featuredDocuments != null) 'FeaturedDocuments': featuredDocuments,
      if (featuredResultsSetId != null)
        'FeaturedResultsSetId': featuredResultsSetId,
      if (featuredResultsSetName != null)
        'FeaturedResultsSetName': featuredResultsSetName,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (queryTexts != null) 'QueryTexts': queryTexts,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum FeaturedResultsSetStatus {
  active,
  inactive,
}

extension FeaturedResultsSetStatusValueExtension on FeaturedResultsSetStatus {
  String toValue() {
    switch (this) {
      case FeaturedResultsSetStatus.active:
        return 'ACTIVE';
      case FeaturedResultsSetStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension FeaturedResultsSetStatusFromString on String {
  FeaturedResultsSetStatus toFeaturedResultsSetStatus() {
    switch (this) {
      case 'ACTIVE':
        return FeaturedResultsSetStatus.active;
      case 'INACTIVE':
        return FeaturedResultsSetStatus.inactive;
    }
    throw Exception('$this is not known in enum FeaturedResultsSetStatus');
  }
}

/// Summary information for a set of featured results. Featured results are
/// placed above all other results for certain queries. If there's an exact
/// match of a query, then one or more specific documents are featured in the
/// search results.
class FeaturedResultsSetSummary {
  /// The Unix timestamp when the set of featured results was created.
  final int? creationTimestamp;

  /// The identifier of the set of featured results.
  final String? featuredResultsSetId;

  /// The name for the set of featured results.
  final String? featuredResultsSetName;

  /// The Unix timestamp when the set of featured results was last updated.
  final int? lastUpdatedTimestamp;

  /// The current status of the set of featured results. When the value is
  /// <code>ACTIVE</code>, featured results are ready for use. You can still
  /// configure your settings before setting the status to <code>ACTIVE</code>.
  /// You can set the status to <code>ACTIVE</code> or <code>INACTIVE</code> using
  /// the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_UpdateFeaturedResultsSet.html">UpdateFeaturedResultsSet</a>
  /// API. The queries you specify for featured results must be unique per
  /// featured results set for each index, whether the status is
  /// <code>ACTIVE</code> or <code>INACTIVE</code>.
  final FeaturedResultsSetStatus? status;

  FeaturedResultsSetSummary({
    this.creationTimestamp,
    this.featuredResultsSetId,
    this.featuredResultsSetName,
    this.lastUpdatedTimestamp,
    this.status,
  });

  factory FeaturedResultsSetSummary.fromJson(Map<String, dynamic> json) {
    return FeaturedResultsSetSummary(
      creationTimestamp: json['CreationTimestamp'] as int?,
      featuredResultsSetId: json['FeaturedResultsSetId'] as String?,
      featuredResultsSetName: json['FeaturedResultsSetName'] as String?,
      lastUpdatedTimestamp: json['LastUpdatedTimestamp'] as int?,
      status: (json['Status'] as String?)?.toFeaturedResultsSetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTimestamp = this.creationTimestamp;
    final featuredResultsSetId = this.featuredResultsSetId;
    final featuredResultsSetName = this.featuredResultsSetName;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final status = this.status;
    return {
      if (creationTimestamp != null) 'CreationTimestamp': creationTimestamp,
      if (featuredResultsSetId != null)
        'FeaturedResultsSetId': featuredResultsSetId,
      if (featuredResultsSetName != null)
        'FeaturedResultsSetName': featuredResultsSetName,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': lastUpdatedTimestamp,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Provides the configuration information to connect to Amazon FSx as your data
/// source.
/// <note>
/// Amazon Kendra now supports an upgraded Amazon FSx Windows connector.
///
/// You must now use the <a
/// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
/// object instead of the <code>FsxConfiguration</code> object to configure your
/// connector.
///
/// Connectors configured using the older console and API architecture will
/// continue to function as configured. However, you won't be able to edit or
/// update them. If you want to edit or update your connector configuration, you
/// must create a new connector.
///
/// We recommended migrating your connector workflow to the upgraded version.
/// Support for connectors configured using the older architecture is scheduled
/// to end by June 2024.
/// </note>
class FsxConfiguration {
  /// The identifier of the Amazon FSx file system.
  ///
  /// You can find your file system ID on the file system dashboard in the Amazon
  /// FSx console. For information on how to create a file system in Amazon FSx
  /// console, using Windows File Server as an example, see <a
  /// href="https://docs.aws.amazon.com/fsx/latest/WindowsGuide/getting-started-step1.html">Amazon
  /// FSx Getting started guide</a>.
  final String fileSystemId;

  /// The Amazon FSx file system type. Windows is currently the only supported
  /// type.
  final FsxFileSystemType fileSystemType;

  /// Configuration information for an Amazon Virtual Private Cloud to connect to
  /// your Amazon FSx. Your Amazon FSx instance must reside inside your VPC.
  final DataSourceVpcConfiguration vpcConfiguration;

  /// A list of regular expression patterns to exclude certain files in your
  /// Amazon FSx file system. Files that match the patterns are excluded from the
  /// index. Files that don't match the patterns are included in the index. If a
  /// file matches both an inclusion and exclusion pattern, the exclusion pattern
  /// takes precedence and the file isn't included in the index.
  final List<String>? exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map Amazon
  /// FSx data source attributes or field names to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Amazon FSx fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Amazon FSx data source field names must exist in
  /// your Amazon FSx custom metadata.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns to include certain files in your
  /// Amazon FSx file system. Files that match the patterns are included in the
  /// index. Files that don't match the patterns are excluded from the index. If a
  /// file matches both an inclusion and exclusion pattern, the exclusion pattern
  /// takes precedence and the file isn't included in the index.
  final List<String>? inclusionPatterns;

  /// The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
  /// the key-value pairs required to connect to your Amazon FSx file system.
  /// Windows is currently the only supported type. The secret must contain a JSON
  /// structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// username—The Active Directory user name, along with the Domain Name System
  /// (DNS) domain name. For example, <i>user@corp.example.com</i>. The Active
  /// Directory user account must have read and mounting access to the Amazon FSx
  /// file system for Windows.
  /// </li>
  /// <li>
  /// password—The password of the Active Directory user account with read and
  /// mounting access to the Amazon FSx Windows file system.
  /// </li>
  /// </ul>
  final String? secretArn;

  FsxConfiguration({
    required this.fileSystemId,
    required this.fileSystemType,
    required this.vpcConfiguration,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
    this.secretArn,
  });

  factory FsxConfiguration.fromJson(Map<String, dynamic> json) {
    return FsxConfiguration(
      fileSystemId: json['FileSystemId'] as String,
      fileSystemType: (json['FileSystemType'] as String).toFsxFileSystemType(),
      vpcConfiguration: DataSourceVpcConfiguration.fromJson(
          json['VpcConfiguration'] as Map<String, dynamic>),
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
      secretArn: json['SecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final fileSystemType = this.fileSystemType;
    final vpcConfiguration = this.vpcConfiguration;
    final exclusionPatterns = this.exclusionPatterns;
    final fieldMappings = this.fieldMappings;
    final inclusionPatterns = this.inclusionPatterns;
    final secretArn = this.secretArn;
    return {
      'FileSystemId': fileSystemId,
      'FileSystemType': fileSystemType.toValue(),
      'VpcConfiguration': vpcConfiguration,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (secretArn != null) 'SecretArn': secretArn,
    };
  }
}

enum FsxFileSystemType {
  windows,
}

extension FsxFileSystemTypeValueExtension on FsxFileSystemType {
  String toValue() {
    switch (this) {
      case FsxFileSystemType.windows:
        return 'WINDOWS';
    }
  }
}

extension FsxFileSystemTypeFromString on String {
  FsxFileSystemType toFsxFileSystemType() {
    switch (this) {
      case 'WINDOWS':
        return FsxFileSystemType.windows;
    }
    throw Exception('$this is not known in enum FsxFileSystemType');
  }
}

class GetQuerySuggestionsResponse {
  /// The identifier for a list of query suggestions for an index.
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

class GetSnapshotsResponse {
  /// If the response is truncated, Amazon Kendra returns this token, which you
  /// can use in a later request to retrieve the next set of search metrics data.
  final String? nextToken;

  /// The Unix timestamp for the beginning and end of the time window for the
  /// search metrics data.
  final TimeRange? snapShotTimeFilter;

  /// The search metrics data. The data returned depends on the metric type you
  /// requested.
  final List<List<String>>? snapshotsData;

  /// The column headers for the search metrics data.
  final List<String>? snapshotsDataHeader;

  GetSnapshotsResponse({
    this.nextToken,
    this.snapShotTimeFilter,
    this.snapshotsData,
    this.snapshotsDataHeader,
  });

  factory GetSnapshotsResponse.fromJson(Map<String, dynamic> json) {
    return GetSnapshotsResponse(
      nextToken: json['NextToken'] as String?,
      snapShotTimeFilter: json['SnapShotTimeFilter'] != null
          ? TimeRange.fromJson(
              json['SnapShotTimeFilter'] as Map<String, dynamic>)
          : null,
      snapshotsData: (json['SnapshotsData'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
          .toList(),
      snapshotsDataHeader: (json['SnapshotsDataHeader'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final snapShotTimeFilter = this.snapShotTimeFilter;
    final snapshotsData = this.snapshotsData;
    final snapshotsDataHeader = this.snapshotsDataHeader;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (snapShotTimeFilter != null) 'SnapShotTimeFilter': snapShotTimeFilter,
      if (snapshotsData != null) 'SnapshotsData': snapshotsData,
      if (snapshotsDataHeader != null)
        'SnapshotsDataHeader': snapshotsDataHeader,
    };
  }
}

/// Provides the configuration information to connect to GitHub as your data
/// source.
/// <note>
/// Amazon Kendra now supports an upgraded GitHub connector.
///
/// You must now use the <a
/// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
/// object instead of the <code>GitHubConfiguration</code> object to configure
/// your connector.
///
/// Connectors configured using the older console and API architecture will
/// continue to function as configured. However, you won’t be able to edit or
/// update them. If you want to edit or update your connector configuration, you
/// must create a new connector.
///
/// We recommended migrating your connector workflow to the upgraded version.
/// Support for connectors configured using the older architecture is scheduled
/// to end by June 2024.
/// </note>
class GitHubConfiguration {
  /// The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
  /// the key-value pairs required to connect to your GitHub. The secret must
  /// contain a JSON structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// personalToken—The access token created in GitHub. For more information on
  /// creating a token in GitHub, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-github.html">Using
  /// a GitHub data source</a>.
  /// </li>
  /// </ul>
  final String secretArn;

  /// A list of regular expression patterns to exclude certain file names in your
  /// GitHub repository or repositories. File names that match the patterns are
  /// excluded from the index. File names that don't match the patterns are
  /// included in the index. If a file matches both an exclusion and inclusion
  /// pattern, the exclusion pattern takes precedence and the file isn't included
  /// in the index.
  final List<String>? exclusionFileNamePatterns;

  /// A list of regular expression patterns to exclude certain file types in your
  /// GitHub repository or repositories. File types that match the patterns are
  /// excluded from the index. File types that don't match the patterns are
  /// included in the index. If a file matches both an exclusion and inclusion
  /// pattern, the exclusion pattern takes precedence and the file isn't included
  /// in the index.
  final List<String>? exclusionFileTypePatterns;

  /// A list of regular expression patterns to exclude certain folder names in
  /// your GitHub repository or repositories. Folder names that match the patterns
  /// are excluded from the index. Folder names that don't match the patterns are
  /// included in the index. If a folder matches both an exclusion and inclusion
  /// pattern, the exclusion pattern takes precedence and the folder isn't
  /// included in the index.
  final List<String>? exclusionFolderNamePatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of GitHub commits to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to GitHub fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The GitHub data source field names must exist in
  /// your GitHub custom metadata.
  final List<DataSourceToIndexFieldMapping>?
      gitHubCommitConfigurationFieldMappings;

  /// Configuration information to include certain types of GitHub content. You
  /// can configure to index repository files only, or also include issues and
  /// pull requests, comments, and comment attachments.
  final GitHubDocumentCrawlProperties? gitHubDocumentCrawlProperties;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of GitHub issue attachments to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to GitHub fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The GitHub data source field names must exist in
  /// your GitHub custom metadata.
  final List<DataSourceToIndexFieldMapping>?
      gitHubIssueAttachmentConfigurationFieldMappings;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of GitHub issue comments to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to GitHub fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The GitHub data source field names must exist in
  /// your GitHub custom metadata.
  final List<DataSourceToIndexFieldMapping>?
      gitHubIssueCommentConfigurationFieldMappings;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of GitHub issues to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to GitHub fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The GitHub data source field names must exist in
  /// your GitHub custom metadata.
  final List<DataSourceToIndexFieldMapping>?
      gitHubIssueDocumentConfigurationFieldMappings;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of GitHub pull request comments to Amazon Kendra
  /// index field names. To create custom fields, use the <code>UpdateIndex</code>
  /// API before you map to GitHub fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The GitHub data source field names must exist in
  /// your GitHub custom metadata.
  final List<DataSourceToIndexFieldMapping>?
      gitHubPullRequestCommentConfigurationFieldMappings;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of GitHub pull request attachments to Amazon
  /// Kendra index field names. To create custom fields, use the
  /// <code>UpdateIndex</code> API before you map to GitHub fields. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The GitHub data source field names must exist in
  /// your GitHub custom metadata.
  final List<DataSourceToIndexFieldMapping>?
      gitHubPullRequestDocumentAttachmentConfigurationFieldMappings;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of GitHub pull requests to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to GitHub fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The GitHub data source field names must exist in
  /// your GitHub custom metadata.
  final List<DataSourceToIndexFieldMapping>?
      gitHubPullRequestDocumentConfigurationFieldMappings;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map GitHub
  /// repository attributes or field names to Amazon Kendra index field names. To
  /// create custom fields, use the <code>UpdateIndex</code> API before you map to
  /// GitHub fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The GitHub data source field names must exist in
  /// your GitHub custom metadata.
  final List<DataSourceToIndexFieldMapping>?
      gitHubRepositoryConfigurationFieldMappings;

  /// A list of regular expression patterns to include certain file names in your
  /// GitHub repository or repositories. File names that match the patterns are
  /// included in the index. File names that don't match the patterns are excluded
  /// from the index. If a file matches both an inclusion and exclusion pattern,
  /// the exclusion pattern takes precedence and the file isn't included in the
  /// index.
  final List<String>? inclusionFileNamePatterns;

  /// A list of regular expression patterns to include certain file types in your
  /// GitHub repository or repositories. File types that match the patterns are
  /// included in the index. File types that don't match the patterns are excluded
  /// from the index. If a file matches both an inclusion and exclusion pattern,
  /// the exclusion pattern takes precedence and the file isn't included in the
  /// index.
  final List<String>? inclusionFileTypePatterns;

  /// A list of regular expression patterns to include certain folder names in
  /// your GitHub repository or repositories. Folder names that match the patterns
  /// are included in the index. Folder names that don't match the patterns are
  /// excluded from the index. If a folder matches both an inclusion and exclusion
  /// pattern, the exclusion pattern takes precedence and the folder isn't
  /// included in the index.
  final List<String>? inclusionFolderNamePatterns;

  /// Configuration information to connect to GitHub Enterprise Server (on
  /// premises).
  final OnPremiseConfiguration? onPremiseConfiguration;

  /// A list of names of the specific repositories you want to index.
  final List<String>? repositoryFilter;

  /// Configuration information to connect to GitHub Enterprise Cloud (SaaS).
  final SaaSConfiguration? saaSConfiguration;

  /// The type of GitHub service you want to connect to—GitHub Enterprise Cloud
  /// (SaaS) or GitHub Enterprise Server (on premises).
  final Type? type;

  /// <code>TRUE</code> to use the GitHub change log to determine which documents
  /// require updating in the index. Depending on the GitHub change log's size, it
  /// may take longer for Amazon Kendra to use the change log than to scan all of
  /// your documents in GitHub.
  final bool? useChangeLog;

  /// Configuration information of an Amazon Virtual Private Cloud to connect to
  /// your GitHub. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  GitHubConfiguration({
    required this.secretArn,
    this.exclusionFileNamePatterns,
    this.exclusionFileTypePatterns,
    this.exclusionFolderNamePatterns,
    this.gitHubCommitConfigurationFieldMappings,
    this.gitHubDocumentCrawlProperties,
    this.gitHubIssueAttachmentConfigurationFieldMappings,
    this.gitHubIssueCommentConfigurationFieldMappings,
    this.gitHubIssueDocumentConfigurationFieldMappings,
    this.gitHubPullRequestCommentConfigurationFieldMappings,
    this.gitHubPullRequestDocumentAttachmentConfigurationFieldMappings,
    this.gitHubPullRequestDocumentConfigurationFieldMappings,
    this.gitHubRepositoryConfigurationFieldMappings,
    this.inclusionFileNamePatterns,
    this.inclusionFileTypePatterns,
    this.inclusionFolderNamePatterns,
    this.onPremiseConfiguration,
    this.repositoryFilter,
    this.saaSConfiguration,
    this.type,
    this.useChangeLog,
    this.vpcConfiguration,
  });

  factory GitHubConfiguration.fromJson(Map<String, dynamic> json) {
    return GitHubConfiguration(
      secretArn: json['SecretArn'] as String,
      exclusionFileNamePatterns: (json['ExclusionFileNamePatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      exclusionFileTypePatterns: (json['ExclusionFileTypePatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      exclusionFolderNamePatterns:
          (json['ExclusionFolderNamePatterns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      gitHubCommitConfigurationFieldMappings:
          (json['GitHubCommitConfigurationFieldMappings'] as List?)
              ?.whereNotNull()
              .map((e) => DataSourceToIndexFieldMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      gitHubDocumentCrawlProperties:
          json['GitHubDocumentCrawlProperties'] != null
              ? GitHubDocumentCrawlProperties.fromJson(
                  json['GitHubDocumentCrawlProperties'] as Map<String, dynamic>)
              : null,
      gitHubIssueAttachmentConfigurationFieldMappings:
          (json['GitHubIssueAttachmentConfigurationFieldMappings'] as List?)
              ?.whereNotNull()
              .map((e) => DataSourceToIndexFieldMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      gitHubIssueCommentConfigurationFieldMappings:
          (json['GitHubIssueCommentConfigurationFieldMappings'] as List?)
              ?.whereNotNull()
              .map((e) => DataSourceToIndexFieldMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      gitHubIssueDocumentConfigurationFieldMappings:
          (json['GitHubIssueDocumentConfigurationFieldMappings'] as List?)
              ?.whereNotNull()
              .map((e) => DataSourceToIndexFieldMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      gitHubPullRequestCommentConfigurationFieldMappings:
          (json['GitHubPullRequestCommentConfigurationFieldMappings'] as List?)
              ?.whereNotNull()
              .map((e) => DataSourceToIndexFieldMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      gitHubPullRequestDocumentAttachmentConfigurationFieldMappings:
          (json['GitHubPullRequestDocumentAttachmentConfigurationFieldMappings']
                  as List?)
              ?.whereNotNull()
              .map((e) => DataSourceToIndexFieldMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      gitHubPullRequestDocumentConfigurationFieldMappings:
          (json['GitHubPullRequestDocumentConfigurationFieldMappings'] as List?)
              ?.whereNotNull()
              .map((e) => DataSourceToIndexFieldMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      gitHubRepositoryConfigurationFieldMappings:
          (json['GitHubRepositoryConfigurationFieldMappings'] as List?)
              ?.whereNotNull()
              .map((e) => DataSourceToIndexFieldMapping.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      inclusionFileNamePatterns: (json['InclusionFileNamePatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inclusionFileTypePatterns: (json['InclusionFileTypePatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inclusionFolderNamePatterns:
          (json['InclusionFolderNamePatterns'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      onPremiseConfiguration: json['OnPremiseConfiguration'] != null
          ? OnPremiseConfiguration.fromJson(
              json['OnPremiseConfiguration'] as Map<String, dynamic>)
          : null,
      repositoryFilter: (json['RepositoryFilter'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      saaSConfiguration: json['SaaSConfiguration'] != null
          ? SaaSConfiguration.fromJson(
              json['SaaSConfiguration'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toType(),
      useChangeLog: json['UseChangeLog'] as bool?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final exclusionFileNamePatterns = this.exclusionFileNamePatterns;
    final exclusionFileTypePatterns = this.exclusionFileTypePatterns;
    final exclusionFolderNamePatterns = this.exclusionFolderNamePatterns;
    final gitHubCommitConfigurationFieldMappings =
        this.gitHubCommitConfigurationFieldMappings;
    final gitHubDocumentCrawlProperties = this.gitHubDocumentCrawlProperties;
    final gitHubIssueAttachmentConfigurationFieldMappings =
        this.gitHubIssueAttachmentConfigurationFieldMappings;
    final gitHubIssueCommentConfigurationFieldMappings =
        this.gitHubIssueCommentConfigurationFieldMappings;
    final gitHubIssueDocumentConfigurationFieldMappings =
        this.gitHubIssueDocumentConfigurationFieldMappings;
    final gitHubPullRequestCommentConfigurationFieldMappings =
        this.gitHubPullRequestCommentConfigurationFieldMappings;
    final gitHubPullRequestDocumentAttachmentConfigurationFieldMappings =
        this.gitHubPullRequestDocumentAttachmentConfigurationFieldMappings;
    final gitHubPullRequestDocumentConfigurationFieldMappings =
        this.gitHubPullRequestDocumentConfigurationFieldMappings;
    final gitHubRepositoryConfigurationFieldMappings =
        this.gitHubRepositoryConfigurationFieldMappings;
    final inclusionFileNamePatterns = this.inclusionFileNamePatterns;
    final inclusionFileTypePatterns = this.inclusionFileTypePatterns;
    final inclusionFolderNamePatterns = this.inclusionFolderNamePatterns;
    final onPremiseConfiguration = this.onPremiseConfiguration;
    final repositoryFilter = this.repositoryFilter;
    final saaSConfiguration = this.saaSConfiguration;
    final type = this.type;
    final useChangeLog = this.useChangeLog;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'SecretArn': secretArn,
      if (exclusionFileNamePatterns != null)
        'ExclusionFileNamePatterns': exclusionFileNamePatterns,
      if (exclusionFileTypePatterns != null)
        'ExclusionFileTypePatterns': exclusionFileTypePatterns,
      if (exclusionFolderNamePatterns != null)
        'ExclusionFolderNamePatterns': exclusionFolderNamePatterns,
      if (gitHubCommitConfigurationFieldMappings != null)
        'GitHubCommitConfigurationFieldMappings':
            gitHubCommitConfigurationFieldMappings,
      if (gitHubDocumentCrawlProperties != null)
        'GitHubDocumentCrawlProperties': gitHubDocumentCrawlProperties,
      if (gitHubIssueAttachmentConfigurationFieldMappings != null)
        'GitHubIssueAttachmentConfigurationFieldMappings':
            gitHubIssueAttachmentConfigurationFieldMappings,
      if (gitHubIssueCommentConfigurationFieldMappings != null)
        'GitHubIssueCommentConfigurationFieldMappings':
            gitHubIssueCommentConfigurationFieldMappings,
      if (gitHubIssueDocumentConfigurationFieldMappings != null)
        'GitHubIssueDocumentConfigurationFieldMappings':
            gitHubIssueDocumentConfigurationFieldMappings,
      if (gitHubPullRequestCommentConfigurationFieldMappings != null)
        'GitHubPullRequestCommentConfigurationFieldMappings':
            gitHubPullRequestCommentConfigurationFieldMappings,
      if (gitHubPullRequestDocumentAttachmentConfigurationFieldMappings != null)
        'GitHubPullRequestDocumentAttachmentConfigurationFieldMappings':
            gitHubPullRequestDocumentAttachmentConfigurationFieldMappings,
      if (gitHubPullRequestDocumentConfigurationFieldMappings != null)
        'GitHubPullRequestDocumentConfigurationFieldMappings':
            gitHubPullRequestDocumentConfigurationFieldMappings,
      if (gitHubRepositoryConfigurationFieldMappings != null)
        'GitHubRepositoryConfigurationFieldMappings':
            gitHubRepositoryConfigurationFieldMappings,
      if (inclusionFileNamePatterns != null)
        'InclusionFileNamePatterns': inclusionFileNamePatterns,
      if (inclusionFileTypePatterns != null)
        'InclusionFileTypePatterns': inclusionFileTypePatterns,
      if (inclusionFolderNamePatterns != null)
        'InclusionFolderNamePatterns': inclusionFolderNamePatterns,
      if (onPremiseConfiguration != null)
        'OnPremiseConfiguration': onPremiseConfiguration,
      if (repositoryFilter != null) 'RepositoryFilter': repositoryFilter,
      if (saaSConfiguration != null) 'SaaSConfiguration': saaSConfiguration,
      if (type != null) 'Type': type.toValue(),
      if (useChangeLog != null) 'UseChangeLog': useChangeLog,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// Provides the configuration information to include certain types of GitHub
/// content. You can configure to index repository files only, or also include
/// issues and pull requests, comments, and comment attachments.
class GitHubDocumentCrawlProperties {
  /// <code>TRUE</code> to index all issues within a repository.
  final bool? crawlIssue;

  /// <code>TRUE</code> to index all comments on issues.
  final bool? crawlIssueComment;

  /// <code>TRUE</code> to include all comment attachments for issues.
  final bool? crawlIssueCommentAttachment;

  /// <code>TRUE</code> to index all pull requests within a repository.
  final bool? crawlPullRequest;

  /// <code>TRUE</code> to index all comments on pull requests.
  final bool? crawlPullRequestComment;

  /// <code>TRUE</code> to include all comment attachments for pull requests.
  final bool? crawlPullRequestCommentAttachment;

  /// <code>TRUE</code> to index all files with a repository.
  final bool? crawlRepositoryDocuments;

  GitHubDocumentCrawlProperties({
    this.crawlIssue,
    this.crawlIssueComment,
    this.crawlIssueCommentAttachment,
    this.crawlPullRequest,
    this.crawlPullRequestComment,
    this.crawlPullRequestCommentAttachment,
    this.crawlRepositoryDocuments,
  });

  factory GitHubDocumentCrawlProperties.fromJson(Map<String, dynamic> json) {
    return GitHubDocumentCrawlProperties(
      crawlIssue: json['CrawlIssue'] as bool?,
      crawlIssueComment: json['CrawlIssueComment'] as bool?,
      crawlIssueCommentAttachment: json['CrawlIssueCommentAttachment'] as bool?,
      crawlPullRequest: json['CrawlPullRequest'] as bool?,
      crawlPullRequestComment: json['CrawlPullRequestComment'] as bool?,
      crawlPullRequestCommentAttachment:
          json['CrawlPullRequestCommentAttachment'] as bool?,
      crawlRepositoryDocuments: json['CrawlRepositoryDocuments'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final crawlIssue = this.crawlIssue;
    final crawlIssueComment = this.crawlIssueComment;
    final crawlIssueCommentAttachment = this.crawlIssueCommentAttachment;
    final crawlPullRequest = this.crawlPullRequest;
    final crawlPullRequestComment = this.crawlPullRequestComment;
    final crawlPullRequestCommentAttachment =
        this.crawlPullRequestCommentAttachment;
    final crawlRepositoryDocuments = this.crawlRepositoryDocuments;
    return {
      if (crawlIssue != null) 'CrawlIssue': crawlIssue,
      if (crawlIssueComment != null) 'CrawlIssueComment': crawlIssueComment,
      if (crawlIssueCommentAttachment != null)
        'CrawlIssueCommentAttachment': crawlIssueCommentAttachment,
      if (crawlPullRequest != null) 'CrawlPullRequest': crawlPullRequest,
      if (crawlPullRequestComment != null)
        'CrawlPullRequestComment': crawlPullRequestComment,
      if (crawlPullRequestCommentAttachment != null)
        'CrawlPullRequestCommentAttachment': crawlPullRequestCommentAttachment,
      if (crawlRepositoryDocuments != null)
        'CrawlRepositoryDocuments': crawlRepositoryDocuments,
    };
  }
}

/// Provides the configuration information to connect to Google Drive as your
/// data source.
class GoogleDriveConfiguration {
  /// The Amazon Resource Name (ARN) of a Secrets Managersecret that contains the
  /// credentials required to connect to Google Drive. For more information, see
  /// <a
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

  /// A list of regular expression patterns to exclude certain items in your
  /// Google Drive, including shared drives and users' My Drives. Items that match
  /// the patterns are excluded from the index. Items that don't match the
  /// patterns are included in the index. If an item matches both an inclusion and
  /// exclusion pattern, the exclusion pattern takes precedence and the item isn't
  /// included in the index.
  final List<String>? exclusionPatterns;

  /// Maps Google Drive data source attributes or field names to Amazon Kendra
  /// index field names. To create custom fields, use the <code>UpdateIndex</code>
  /// API before you map to Google Drive fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Google Drive data source field names must exist
  /// in your Google Drive custom metadata.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns to include certain items in your
  /// Google Drive, including shared drives and users' My Drives. Items that match
  /// the patterns are included in the index. Items that don't match the patterns
  /// are excluded from the index. If an item matches both an inclusion and
  /// exclusion pattern, the exclusion pattern takes precedence and the item isn't
  /// included in the index.
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

/// A list of users or sub groups that belong to a group. This is useful for
/// user context filtering, where search results are filtered based on the user
/// or their group access to documents.
class GroupMembers {
  /// A list of sub groups that belong to a group. For example, the sub groups
  /// "Research", "Engineering", and "Sales and Marketing" all belong to the group
  /// "Company".
  final List<MemberGroup>? memberGroups;

  /// A list of users that belong to a group. For example, a list of interns all
  /// belong to the "Interns" group.
  final List<MemberUser>? memberUsers;

  /// If you have more than 1000 users and/or sub groups for a single group, you
  /// need to provide the path to the S3 file that lists your users and sub groups
  /// for a group. Your sub groups can contain more than 1000 users, but the list
  /// of sub groups that belong to a group (and/or users) must be no more than
  /// 1000.
  ///
  /// You can download this <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/samples/group_members.zip">example
  /// S3 file</a> that uses the correct format for listing group members. Note,
  /// <code>dataSourceId</code> is optional. The value of <code>type</code> for a
  /// group is always <code>GROUP</code> and for a user it is always
  /// <code>USER</code>.
  final S3Path? s3PathforGroupMembers;

  GroupMembers({
    this.memberGroups,
    this.memberUsers,
    this.s3PathforGroupMembers,
  });

  Map<String, dynamic> toJson() {
    final memberGroups = this.memberGroups;
    final memberUsers = this.memberUsers;
    final s3PathforGroupMembers = this.s3PathforGroupMembers;
    return {
      if (memberGroups != null) 'MemberGroups': memberGroups,
      if (memberUsers != null) 'MemberUsers': memberUsers,
      if (s3PathforGroupMembers != null)
        'S3PathforGroupMembers': s3PathforGroupMembers,
    };
  }
}

/// Summary information on the processing of <code>PUT</code> and
/// <code>DELETE</code> actions for mapping users to their groups.
class GroupOrderingIdSummary {
  /// The reason an action could not be processed. An action can be a
  /// <code>PUT</code> or <code>DELETE</code> action for mapping users to their
  /// groups.
  final String? failureReason;

  /// The Unix timestamp when an action was last updated. An action can be a
  /// <code>PUT</code> or <code>DELETE</code> action for mapping users to their
  /// groups.
  final DateTime? lastUpdatedAt;

  /// The order in which actions should complete processing. An action can be a
  /// <code>PUT</code> or <code>DELETE</code> action for mapping users to their
  /// groups.
  final int? orderingId;

  /// The Unix timestamp when an action was received by Amazon Kendra. An action
  /// can be a <code>PUT</code> or <code>DELETE</code> action for mapping users to
  /// their groups.
  final DateTime? receivedAt;

  /// The current processing status of actions for mapping users to their groups.
  /// The status can be either <code>PROCESSING</code>, <code>SUCCEEDED</code>,
  /// <code>DELETING</code>, <code>DELETED</code>, or <code>FAILED</code>.
  final PrincipalMappingStatus? status;

  GroupOrderingIdSummary({
    this.failureReason,
    this.lastUpdatedAt,
    this.orderingId,
    this.receivedAt,
    this.status,
  });

  factory GroupOrderingIdSummary.fromJson(Map<String, dynamic> json) {
    return GroupOrderingIdSummary(
      failureReason: json['FailureReason'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      orderingId: json['OrderingId'] as int?,
      receivedAt: timeStampFromJson(json['ReceivedAt']),
      status: (json['Status'] as String?)?.toPrincipalMappingStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final lastUpdatedAt = this.lastUpdatedAt;
    final orderingId = this.orderingId;
    final receivedAt = this.receivedAt;
    final status = this.status;
    return {
      if (failureReason != null) 'FailureReason': failureReason,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (orderingId != null) 'OrderingId': orderingId,
      if (receivedAt != null) 'ReceivedAt': unixTimestampToJson(receivedAt),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// Summary information for groups.
class GroupSummary {
  /// The identifier of the group you want group summary information on.
  final String? groupId;

  /// The timestamp identifier used for the latest <code>PUT</code> or
  /// <code>DELETE</code> action.
  final int? orderingId;

  GroupSummary({
    this.groupId,
    this.orderingId,
  });

  factory GroupSummary.fromJson(Map<String, dynamic> json) {
    return GroupSummary(
      groupId: json['GroupId'] as String?,
      orderingId: json['OrderingId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final orderingId = this.orderingId;
    return {
      if (groupId != null) 'GroupId': groupId,
      if (orderingId != null) 'OrderingId': orderingId,
    };
  }
}

/// Information to define the hierarchy for which documents users should have
/// access to.
class HierarchicalPrincipal {
  /// A list of <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/API_Principal.html">principal</a>
  /// lists that define the hierarchy for which documents users should have access
  /// to. Each hierarchical list specifies which user or group has allow or deny
  /// access for each document.
  final List<Principal> principalList;

  HierarchicalPrincipal({
    required this.principalList,
  });

  factory HierarchicalPrincipal.fromJson(Map<String, dynamic> json) {
    return HierarchicalPrincipal(
      principalList: (json['PrincipalList'] as List)
          .whereNotNull()
          .map((e) => Principal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final principalList = this.principalList;
    return {
      'PrincipalList': principalList,
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

extension HighlightTypeValueExtension on HighlightType {
  String toValue() {
    switch (this) {
      case HighlightType.standard:
        return 'STANDARD';
      case HighlightType.thesaurusSynonym:
        return 'THESAURUS_SYNONYM';
    }
  }
}

extension HighlightTypeFromString on String {
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

/// Provides the configuration information for invoking a Lambda function in
/// Lambda to alter document metadata and content when ingesting documents into
/// Amazon Kendra. You can configure your Lambda function using <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_CustomDocumentEnrichmentConfiguration.html">PreExtractionHookConfiguration</a>
/// if you want to apply advanced alterations on the original or raw documents.
/// If you want to apply advanced alterations on the Amazon Kendra structured
/// documents, you must configure your Lambda function using <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_CustomDocumentEnrichmentConfiguration.html">PostExtractionHookConfiguration</a>.
/// You can only invoke one Lambda function. However, this function can invoke
/// other functions it requires.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html">Customizing
/// document metadata during the ingestion process</a>.
class HookConfiguration {
  /// The Amazon Resource Name (ARN) of a role with permission to run a Lambda
  /// function during ingestion. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html">IAM roles
  /// for Amazon Kendra</a>.
  final String lambdaArn;

  /// Stores the original, raw documents or the structured, parsed documents
  /// before and after altering them. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html#cde-data-contracts-lambda">Data
  /// contracts for Lambda functions</a>.
  final String s3Bucket;

  /// The condition used for when a Lambda function should be invoked.
  ///
  /// For example, you can specify a condition that if there are empty date-time
  /// values, then Amazon Kendra should invoke a function that inserts the current
  /// date-time.
  final DocumentAttributeCondition? invocationCondition;

  HookConfiguration({
    required this.lambdaArn,
    required this.s3Bucket,
    this.invocationCondition,
  });

  factory HookConfiguration.fromJson(Map<String, dynamic> json) {
    return HookConfiguration(
      lambdaArn: json['LambdaArn'] as String,
      s3Bucket: json['S3Bucket'] as String,
      invocationCondition: json['InvocationCondition'] != null
          ? DocumentAttributeCondition.fromJson(
              json['InvocationCondition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    final s3Bucket = this.s3Bucket;
    final invocationCondition = this.invocationCondition;
    return {
      'LambdaArn': lambdaArn,
      'S3Bucket': s3Bucket,
      if (invocationCondition != null)
        'InvocationCondition': invocationCondition,
    };
  }
}

/// Summary information on the configuration of an index.
class IndexConfigurationSummary {
  /// The Unix timestamp when the index was created.
  final DateTime createdAt;

  /// The current status of the index. When the status is <code>ACTIVE</code>, the
  /// index is ready to search.
  final IndexStatus status;

  /// The Unix timestamp when the index was last updated.
  final DateTime updatedAt;

  /// Indicates whether the index is a Enterprise Edition index or a Developer
  /// Edition index.
  final IndexEdition? edition;

  /// A identifier for the index. Use this to identify the index when you are
  /// using APIs such as <code>Query</code>, <code>DescribeIndex</code>,
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

extension IndexEditionValueExtension on IndexEdition {
  String toValue() {
    switch (this) {
      case IndexEdition.developerEdition:
        return 'DEVELOPER_EDITION';
      case IndexEdition.enterpriseEdition:
        return 'ENTERPRISE_EDITION';
    }
  }
}

extension IndexEditionFromString on String {
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

extension IndexStatusValueExtension on IndexStatus {
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

extension IndexStatusFromString on String {
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

/// Provides the configuration information for applying basic logic to alter
/// document metadata and content when ingesting documents into Amazon Kendra.
/// To apply advanced logic, to go beyond what you can do with basic logic, see
/// <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_HookConfiguration.html">HookConfiguration</a>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/custom-document-enrichment.html">Customizing
/// document metadata during the ingestion process</a>.
class InlineCustomDocumentEnrichmentConfiguration {
  /// Configuration of the condition used for the target document attribute or
  /// metadata field when ingesting documents into Amazon Kendra.
  final DocumentAttributeCondition? condition;

  /// <code>TRUE</code> to delete content if the condition used for the target
  /// attribute is met.
  final bool? documentContentDeletion;

  /// Configuration of the target document attribute or metadata field when
  /// ingesting documents into Amazon Kendra. You can also include a value.
  final DocumentAttributeTarget? target;

  InlineCustomDocumentEnrichmentConfiguration({
    this.condition,
    this.documentContentDeletion,
    this.target,
  });

  factory InlineCustomDocumentEnrichmentConfiguration.fromJson(
      Map<String, dynamic> json) {
    return InlineCustomDocumentEnrichmentConfiguration(
      condition: json['Condition'] != null
          ? DocumentAttributeCondition.fromJson(
              json['Condition'] as Map<String, dynamic>)
          : null,
      documentContentDeletion: json['DocumentContentDeletion'] as bool?,
      target: json['Target'] != null
          ? DocumentAttributeTarget.fromJson(
              json['Target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final condition = this.condition;
    final documentContentDeletion = this.documentContentDeletion;
    final target = this.target;
    return {
      if (condition != null) 'Condition': condition,
      if (documentContentDeletion != null)
        'DocumentContentDeletion': documentContentDeletion,
      if (target != null) 'Target': target,
    };
  }
}

enum Interval {
  thisMonth,
  thisWeek,
  oneWeekAgo,
  twoWeeksAgo,
  oneMonthAgo,
  twoMonthsAgo,
}

extension IntervalValueExtension on Interval {
  String toValue() {
    switch (this) {
      case Interval.thisMonth:
        return 'THIS_MONTH';
      case Interval.thisWeek:
        return 'THIS_WEEK';
      case Interval.oneWeekAgo:
        return 'ONE_WEEK_AGO';
      case Interval.twoWeeksAgo:
        return 'TWO_WEEKS_AGO';
      case Interval.oneMonthAgo:
        return 'ONE_MONTH_AGO';
      case Interval.twoMonthsAgo:
        return 'TWO_MONTHS_AGO';
    }
  }
}

extension IntervalFromString on String {
  Interval toInterval() {
    switch (this) {
      case 'THIS_MONTH':
        return Interval.thisMonth;
      case 'THIS_WEEK':
        return Interval.thisWeek;
      case 'ONE_WEEK_AGO':
        return Interval.oneWeekAgo;
      case 'TWO_WEEKS_AGO':
        return Interval.twoWeeksAgo;
      case 'ONE_MONTH_AGO':
        return Interval.oneMonthAgo;
      case 'TWO_MONTHS_AGO':
        return Interval.twoMonthsAgo;
    }
    throw Exception('$this is not known in enum Interval');
  }
}

enum IssueSubEntity {
  comments,
  attachments,
  worklogs,
}

extension IssueSubEntityValueExtension on IssueSubEntity {
  String toValue() {
    switch (this) {
      case IssueSubEntity.comments:
        return 'COMMENTS';
      case IssueSubEntity.attachments:
        return 'ATTACHMENTS';
      case IssueSubEntity.worklogs:
        return 'WORKLOGS';
    }
  }
}

extension IssueSubEntityFromString on String {
  IssueSubEntity toIssueSubEntity() {
    switch (this) {
      case 'COMMENTS':
        return IssueSubEntity.comments;
      case 'ATTACHMENTS':
        return IssueSubEntity.attachments;
      case 'WORKLOGS':
        return IssueSubEntity.worklogs;
    }
    throw Exception('$this is not known in enum IssueSubEntity');
  }
}

/// Provides the configuration information to connect to Jira as your data
/// source.
class JiraConfiguration {
  /// The URL of the Jira account. For example, <i>company.atlassian.net</i>.
  final String jiraAccountUrl;

  /// The Amazon Resource Name (ARN) of a secret in Secrets Manager contains the
  /// key-value pairs required to connect to your Jira data source. The secret
  /// must contain a JSON structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// jiraId—The Jira user name or email.
  /// </li>
  /// <li>
  /// jiraCredentials—The Jira API token. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-jira.html">Using
  /// a Jira data source</a>.
  /// </li>
  /// </ul>
  final String secretArn;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Jira attachments to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Jira fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">
  /// Mapping data source fields</a>. The Jira data source field names must exist
  /// in your Jira custom metadata.
  final List<DataSourceToIndexFieldMapping>? attachmentFieldMappings;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Jira comments to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Jira fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">
  /// Mapping data source fields</a>. The Jira data source field names must exist
  /// in your Jira custom metadata.
  final List<DataSourceToIndexFieldMapping>? commentFieldMappings;

  /// A list of regular expression patterns to exclude certain file paths, file
  /// names, and file types in your Jira data source. Files that match the
  /// patterns are excluded from the index. Files that don’t match the patterns
  /// are included in the index. If a file matches both an inclusion pattern and
  /// an exclusion pattern, the exclusion pattern takes precedence and the file
  /// isn't included in the index.
  final List<String>? exclusionPatterns;

  /// A list of regular expression patterns to include certain file paths, file
  /// names, and file types in your Jira data source. Files that match the
  /// patterns are included in the index. Files that don't match the patterns are
  /// excluded from the index. If a file matches both an inclusion pattern and an
  /// exclusion pattern, the exclusion pattern takes precedence and the file isn't
  /// included in the index.
  final List<String>? inclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Jira issues to Amazon Kendra index field names.
  /// To create custom fields, use the <code>UpdateIndex</code> API before you map
  /// to Jira fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">
  /// Mapping data source fields</a>. The Jira data source field names must exist
  /// in your Jira custom metadata.
  final List<DataSourceToIndexFieldMapping>? issueFieldMappings;

  /// Specify whether to crawl comments, attachments, and work logs. You can
  /// specify one or more of these options.
  final List<IssueSubEntity>? issueSubEntityFilter;

  /// Specify which issue types to crawl in your Jira data source. You can specify
  /// one or more of these options to crawl.
  final List<String>? issueType;

  /// Specify which projects to crawl in your Jira data source. You can specify
  /// one or more Jira project IDs.
  final List<String>? project;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Jira projects to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Jira fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">
  /// Mapping data source fields</a>. The Jira data source field names must exist
  /// in your Jira custom metadata.
  final List<DataSourceToIndexFieldMapping>? projectFieldMappings;

  /// Specify which statuses to crawl in your Jira data source. You can specify
  /// one or more of these options to crawl.
  final List<String>? status;

  /// <code>TRUE</code> to use the Jira change log to determine which documents
  /// require updating in the index. Depending on the change log's size, it may
  /// take longer for Amazon Kendra to use the change log than to scan all of your
  /// documents in Jira.
  final bool? useChangeLog;

  /// Configuration information for an Amazon Virtual Private Cloud to connect to
  /// your Jira. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Jira work logs to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Jira fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">
  /// Mapping data source fields</a>. The Jira data source field names must exist
  /// in your Jira custom metadata.
  final List<DataSourceToIndexFieldMapping>? workLogFieldMappings;

  JiraConfiguration({
    required this.jiraAccountUrl,
    required this.secretArn,
    this.attachmentFieldMappings,
    this.commentFieldMappings,
    this.exclusionPatterns,
    this.inclusionPatterns,
    this.issueFieldMappings,
    this.issueSubEntityFilter,
    this.issueType,
    this.project,
    this.projectFieldMappings,
    this.status,
    this.useChangeLog,
    this.vpcConfiguration,
    this.workLogFieldMappings,
  });

  factory JiraConfiguration.fromJson(Map<String, dynamic> json) {
    return JiraConfiguration(
      jiraAccountUrl: json['JiraAccountUrl'] as String,
      secretArn: json['SecretArn'] as String,
      attachmentFieldMappings: (json['AttachmentFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      commentFieldMappings: (json['CommentFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      issueFieldMappings: (json['IssueFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      issueSubEntityFilter: (json['IssueSubEntityFilter'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toIssueSubEntity())
          .toList(),
      issueType: (json['IssueType'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      project: (json['Project'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      projectFieldMappings: (json['ProjectFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      useChangeLog: json['UseChangeLog'] as bool?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
      workLogFieldMappings: (json['WorkLogFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jiraAccountUrl = this.jiraAccountUrl;
    final secretArn = this.secretArn;
    final attachmentFieldMappings = this.attachmentFieldMappings;
    final commentFieldMappings = this.commentFieldMappings;
    final exclusionPatterns = this.exclusionPatterns;
    final inclusionPatterns = this.inclusionPatterns;
    final issueFieldMappings = this.issueFieldMappings;
    final issueSubEntityFilter = this.issueSubEntityFilter;
    final issueType = this.issueType;
    final project = this.project;
    final projectFieldMappings = this.projectFieldMappings;
    final status = this.status;
    final useChangeLog = this.useChangeLog;
    final vpcConfiguration = this.vpcConfiguration;
    final workLogFieldMappings = this.workLogFieldMappings;
    return {
      'JiraAccountUrl': jiraAccountUrl,
      'SecretArn': secretArn,
      if (attachmentFieldMappings != null)
        'AttachmentFieldMappings': attachmentFieldMappings,
      if (commentFieldMappings != null)
        'CommentFieldMappings': commentFieldMappings,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (issueFieldMappings != null) 'IssueFieldMappings': issueFieldMappings,
      if (issueSubEntityFilter != null)
        'IssueSubEntityFilter':
            issueSubEntityFilter.map((e) => e.toValue()).toList(),
      if (issueType != null) 'IssueType': issueType,
      if (project != null) 'Project': project,
      if (projectFieldMappings != null)
        'ProjectFieldMappings': projectFieldMappings,
      if (status != null) 'Status': status,
      if (useChangeLog != null) 'UseChangeLog': useChangeLog,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
      if (workLogFieldMappings != null)
        'WorkLogFieldMappings': workLogFieldMappings,
    };
  }
}

/// Provides the configuration information for the JSON token type.
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

/// Provides the configuration information for the JWT token type.
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

extension KeyLocationValueExtension on KeyLocation {
  String toValue() {
    switch (this) {
      case KeyLocation.url:
        return 'URL';
      case KeyLocation.secretManager:
        return 'SECRET_MANAGER';
    }
  }
}

extension KeyLocationFromString on String {
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

class ListAccessControlConfigurationsResponse {
  /// The details of your access control configurations.
  final List<AccessControlConfigurationSummary> accessControlConfigurations;

  /// If the response is truncated, Amazon Kendra returns this token, which you
  /// can use in the subsequent request to retrieve the next set of access control
  /// configurations.
  final String? nextToken;

  ListAccessControlConfigurationsResponse({
    required this.accessControlConfigurations,
    this.nextToken,
  });

  factory ListAccessControlConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAccessControlConfigurationsResponse(
      accessControlConfigurations: (json['AccessControlConfigurations'] as List)
          .whereNotNull()
          .map((e) => AccessControlConfigurationSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessControlConfigurations = this.accessControlConfigurations;
    final nextToken = this.nextToken;
    return {
      'AccessControlConfigurations': accessControlConfigurations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDataSourceSyncJobsResponse {
  /// A history of synchronization jobs for the data source connector.
  final List<DataSourceSyncJob>? history;

  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of jobs.
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
  /// use in the subsequent request to retrieve the next set of data source
  /// connectors.
  final String? nextToken;

  /// An array of summary information for one or more data source connector.
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

class ListEntityPersonasResponse {
  /// If the response is truncated, Amazon Kendra returns this token, which you
  /// can use in a later request to retrieve the next set of users or groups.
  final String? nextToken;

  /// An array of summary information for one or more users or groups.
  final List<PersonasSummary>? summaryItems;

  ListEntityPersonasResponse({
    this.nextToken,
    this.summaryItems,
  });

  factory ListEntityPersonasResponse.fromJson(Map<String, dynamic> json) {
    return ListEntityPersonasResponse(
      nextToken: json['NextToken'] as String?,
      summaryItems: (json['SummaryItems'] as List?)
          ?.whereNotNull()
          .map((e) => PersonasSummary.fromJson(e as Map<String, dynamic>))
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

class ListExperienceEntitiesResponse {
  /// If the response is truncated, Amazon Kendra returns this token, which you
  /// can use in a later request to retrieve the next set of users or groups.
  final String? nextToken;

  /// An array of summary information for one or more users or groups.
  final List<ExperienceEntitiesSummary>? summaryItems;

  ListExperienceEntitiesResponse({
    this.nextToken,
    this.summaryItems,
  });

  factory ListExperienceEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return ListExperienceEntitiesResponse(
      nextToken: json['NextToken'] as String?,
      summaryItems: (json['SummaryItems'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ExperienceEntitiesSummary.fromJson(e as Map<String, dynamic>))
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

class ListExperiencesResponse {
  /// If the response is truncated, Amazon Kendra returns this token, which you
  /// can use in a later request to retrieve the next set of Amazon Kendra
  /// experiences.
  final String? nextToken;

  /// An array of summary information for one or more Amazon Kendra experiences.
  final List<ExperiencesSummary>? summaryItems;

  ListExperiencesResponse({
    this.nextToken,
    this.summaryItems,
  });

  factory ListExperiencesResponse.fromJson(Map<String, dynamic> json) {
    return ListExperiencesResponse(
      nextToken: json['NextToken'] as String?,
      summaryItems: (json['SummaryItems'] as List?)
          ?.whereNotNull()
          .map((e) => ExperiencesSummary.fromJson(e as Map<String, dynamic>))
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

  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of FAQs.
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

class ListFeaturedResultsSetsResponse {
  /// An array of summary information for one or more featured results sets.
  final List<FeaturedResultsSetSummary>? featuredResultsSetSummaryItems;

  /// If the response is truncated, Amazon Kendra returns a pagination token in
  /// the response.
  final String? nextToken;

  ListFeaturedResultsSetsResponse({
    this.featuredResultsSetSummaryItems,
    this.nextToken,
  });

  factory ListFeaturedResultsSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListFeaturedResultsSetsResponse(
      featuredResultsSetSummaryItems:
          (json['FeaturedResultsSetSummaryItems'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  FeaturedResultsSetSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final featuredResultsSetSummaryItems = this.featuredResultsSetSummaryItems;
    final nextToken = this.nextToken;
    return {
      if (featuredResultsSetSummaryItems != null)
        'FeaturedResultsSetSummaryItems': featuredResultsSetSummaryItems,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListGroupsOlderThanOrderingIdResponse {
  /// Summary information for list of groups that are mapped to users before a
  /// given ordering or timestamp identifier.
  final List<GroupSummary>? groupsSummaries;

  /// If the response is truncated, Amazon Kendra returns this token that you can
  /// use in the subsequent request to retrieve the next set of groups that are
  /// mapped to users before a given ordering or timestamp identifier.
  final String? nextToken;

  ListGroupsOlderThanOrderingIdResponse({
    this.groupsSummaries,
    this.nextToken,
  });

  factory ListGroupsOlderThanOrderingIdResponse.fromJson(
      Map<String, dynamic> json) {
    return ListGroupsOlderThanOrderingIdResponse(
      groupsSummaries: (json['GroupsSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => GroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupsSummaries = this.groupsSummaries;
    final nextToken = this.nextToken;
    return {
      if (groupsSummaries != null) 'GroupsSummaries': groupsSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListIndicesResponse {
  /// An array of summary information on the configuration of one or more indexes.
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

  /// An array of summary information for a thesaurus or multiple thesauri.
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

/// The sub groups that belong to a group.
class MemberGroup {
  /// The identifier of the sub group you want to map to a group.
  final String groupId;

  /// The identifier of the data source for the sub group you want to map to a
  /// group.
  final String? dataSourceId;

  MemberGroup({
    required this.groupId,
    this.dataSourceId,
  });

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final dataSourceId = this.dataSourceId;
    return {
      'GroupId': groupId,
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
    };
  }
}

/// The users that belong to a group.
class MemberUser {
  /// The identifier of the user you want to map to a group.
  final String userId;

  MemberUser({
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      'UserId': userId,
    };
  }
}

enum MetricType {
  queriesByCount,
  queriesByZeroClickRate,
  queriesByZeroResultRate,
  docsByClickCount,
  aggQueryDocMetrics,
  trendQueryDocMetrics,
}

extension MetricTypeValueExtension on MetricType {
  String toValue() {
    switch (this) {
      case MetricType.queriesByCount:
        return 'QUERIES_BY_COUNT';
      case MetricType.queriesByZeroClickRate:
        return 'QUERIES_BY_ZERO_CLICK_RATE';
      case MetricType.queriesByZeroResultRate:
        return 'QUERIES_BY_ZERO_RESULT_RATE';
      case MetricType.docsByClickCount:
        return 'DOCS_BY_CLICK_COUNT';
      case MetricType.aggQueryDocMetrics:
        return 'AGG_QUERY_DOC_METRICS';
      case MetricType.trendQueryDocMetrics:
        return 'TREND_QUERY_DOC_METRICS';
    }
  }
}

extension MetricTypeFromString on String {
  MetricType toMetricType() {
    switch (this) {
      case 'QUERIES_BY_COUNT':
        return MetricType.queriesByCount;
      case 'QUERIES_BY_ZERO_CLICK_RATE':
        return MetricType.queriesByZeroClickRate;
      case 'QUERIES_BY_ZERO_RESULT_RATE':
        return MetricType.queriesByZeroResultRate;
      case 'DOCS_BY_CLICK_COUNT':
        return MetricType.docsByClickCount;
      case 'AGG_QUERY_DOC_METRICS':
        return MetricType.aggQueryDocMetrics;
      case 'TREND_QUERY_DOC_METRICS':
        return MetricType.trendQueryDocMetrics;
    }
    throw Exception('$this is not known in enum MetricType');
  }
}

enum MissingAttributeKeyStrategy {
  ignore,
  collapse,
  expand,
}

extension MissingAttributeKeyStrategyValueExtension
    on MissingAttributeKeyStrategy {
  String toValue() {
    switch (this) {
      case MissingAttributeKeyStrategy.ignore:
        return 'IGNORE';
      case MissingAttributeKeyStrategy.collapse:
        return 'COLLAPSE';
      case MissingAttributeKeyStrategy.expand:
        return 'EXPAND';
    }
  }
}

extension MissingAttributeKeyStrategyFromString on String {
  MissingAttributeKeyStrategy toMissingAttributeKeyStrategy() {
    switch (this) {
      case 'IGNORE':
        return MissingAttributeKeyStrategy.ignore;
      case 'COLLAPSE':
        return MissingAttributeKeyStrategy.collapse;
      case 'EXPAND':
        return MissingAttributeKeyStrategy.expand;
    }
    throw Exception('$this is not known in enum MissingAttributeKeyStrategy');
  }
}

enum Mode {
  enabled,
  learnOnly,
}

extension ModeValueExtension on Mode {
  String toValue() {
    switch (this) {
      case Mode.enabled:
        return 'ENABLED';
      case Mode.learnOnly:
        return 'LEARN_ONLY';
    }
  }
}

extension ModeFromString on String {
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

/// Provides the configuration information to connect to GitHub Enterprise
/// Server (on premises).
class OnPremiseConfiguration {
  /// The GitHub host URL or API endpoint URL. For example,
  /// <i>https://on-prem-host-url/api/v3/</i>
  final String hostUrl;

  /// The name of the organization of the GitHub Enterprise Server (on-premises)
  /// account you want to connect to. You can find your organization name by
  /// logging into GitHub desktop and selecting <b>Your organizations</b> under
  /// your profile picture dropdown.
  final String organizationName;

  /// The path to the SSL certificate stored in an Amazon S3 bucket. You use this
  /// to connect to GitHub if you require a secure SSL connection.
  ///
  /// You can simply generate a self-signed X509 certificate on any computer using
  /// OpenSSL. For an example of using OpenSSL to create an X509 certificate, see
  /// <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html">Create
  /// and sign an X509 certificate</a>.
  final S3Path sslCertificateS3Path;

  OnPremiseConfiguration({
    required this.hostUrl,
    required this.organizationName,
    required this.sslCertificateS3Path,
  });

  factory OnPremiseConfiguration.fromJson(Map<String, dynamic> json) {
    return OnPremiseConfiguration(
      hostUrl: json['HostUrl'] as String,
      organizationName: json['OrganizationName'] as String,
      sslCertificateS3Path:
          S3Path.fromJson(json['SslCertificateS3Path'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final hostUrl = this.hostUrl;
    final organizationName = this.organizationName;
    final sslCertificateS3Path = this.sslCertificateS3Path;
    return {
      'HostUrl': hostUrl,
      'OrganizationName': organizationName,
      'SslCertificateS3Path': sslCertificateS3Path,
    };
  }
}

/// Provides the configuration information to connect to OneDrive as your data
/// source.
class OneDriveConfiguration {
  /// A list of user accounts whose documents should be indexed.
  final OneDriveUsers oneDriveUsers;

  /// The Amazon Resource Name (ARN) of an Secrets Managersecret that contains the
  /// user name and password to connect to OneDrive. The user name should be the
  /// application ID for the OneDrive application, and the password is the
  /// application key for the OneDrive application.
  final String secretArn;

  /// The Azure Active Directory domain of the organization.
  final String tenantDomain;

  /// <code>TRUE</code> to disable local groups information.
  final bool? disableLocalGroups;

  /// A list of regular expression patterns to exclude certain documents in your
  /// OneDrive. Documents that match the patterns are excluded from the index.
  /// Documents that don't match the patterns are included in the index. If a
  /// document matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the document isn't included in the index.
  ///
  /// The pattern is applied to the file name.
  final List<String>? exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// OneDrive data source attributes or field names to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to OneDrive fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The OneDrive data source field names must exist in
  /// your OneDrive custom metadata.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns to include certain documents in your
  /// OneDrive. Documents that match the patterns are included in the index.
  /// Documents that don't match the patterns are excluded from the index. If a
  /// document matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the document isn't included in the index.
  ///
  /// The pattern is applied to the file name.
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

extension OrderValueExtension on Order {
  String toValue() {
    switch (this) {
      case Order.ascending:
        return 'ASCENDING';
      case Order.descending:
        return 'DESCENDING';
    }
  }
}

extension OrderFromString on String {
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

enum Persona {
  owner,
  viewer,
}

extension PersonaValueExtension on Persona {
  String toValue() {
    switch (this) {
      case Persona.owner:
        return 'OWNER';
      case Persona.viewer:
        return 'VIEWER';
    }
  }
}

extension PersonaFromString on String {
  Persona toPersona() {
    switch (this) {
      case 'OWNER':
        return Persona.owner;
      case 'VIEWER':
        return Persona.viewer;
    }
    throw Exception('$this is not known in enum Persona');
  }
}

/// Summary information for users or groups in your IAM Identity Center identity
/// source. This applies to users and groups with specific permissions that
/// define their level of access to your Amazon Kendra experience. You can
/// create an Amazon Kendra experience such as a search application. For more
/// information on creating a search application experience, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html">Building
/// a search experience with no code</a>.
class PersonasSummary {
  /// The Unix timestamp when the summary information was created.
  final DateTime? createdAt;

  /// The identifier of a user or group in your IAM Identity Center identity
  /// source. For example, a user ID could be an email.
  final String? entityId;

  /// The persona that defines the specific permissions of the user or group in
  /// your IAM Identity Center identity source. The available personas or access
  /// roles are <code>Owner</code> and <code>Viewer</code>. For more information
  /// on these personas, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/deploying-search-experience-no-code.html#access-search-experience">Providing
  /// access to your search page</a>.
  final Persona? persona;

  /// The Unix timestamp when the summary information was last updated.
  final DateTime? updatedAt;

  PersonasSummary({
    this.createdAt,
    this.entityId,
    this.persona,
    this.updatedAt,
  });

  factory PersonasSummary.fromJson(Map<String, dynamic> json) {
    return PersonasSummary(
      createdAt: timeStampFromJson(json['CreatedAt']),
      entityId: json['EntityId'] as String?,
      persona: (json['Persona'] as String?)?.toPersona(),
      updatedAt: timeStampFromJson(json['UpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final entityId = this.entityId;
    final persona = this.persona;
    final updatedAt = this.updatedAt;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (entityId != null) 'EntityId': entityId,
      if (persona != null) 'Persona': persona.toValue(),
      if (updatedAt != null) 'UpdatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Provides user and group information for <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html">user
/// context filtering</a>.
class Principal {
  /// Whether to allow or deny document access to the principal.
  final ReadAccessType access;

  /// The name of the user or group.
  final String name;

  /// The type of principal.
  final PrincipalType type;

  /// The identifier of the data source the principal should access documents
  /// from.
  final String? dataSourceId;

  Principal({
    required this.access,
    required this.name,
    required this.type,
    this.dataSourceId,
  });

  factory Principal.fromJson(Map<String, dynamic> json) {
    return Principal(
      access: (json['Access'] as String).toReadAccessType(),
      name: json['Name'] as String,
      type: (json['Type'] as String).toPrincipalType(),
      dataSourceId: json['DataSourceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final access = this.access;
    final name = this.name;
    final type = this.type;
    final dataSourceId = this.dataSourceId;
    return {
      'Access': access.toValue(),
      'Name': name,
      'Type': type.toValue(),
      if (dataSourceId != null) 'DataSourceId': dataSourceId,
    };
  }
}

enum PrincipalMappingStatus {
  failed,
  succeeded,
  processing,
  deleting,
  deleted,
}

extension PrincipalMappingStatusValueExtension on PrincipalMappingStatus {
  String toValue() {
    switch (this) {
      case PrincipalMappingStatus.failed:
        return 'FAILED';
      case PrincipalMappingStatus.succeeded:
        return 'SUCCEEDED';
      case PrincipalMappingStatus.processing:
        return 'PROCESSING';
      case PrincipalMappingStatus.deleting:
        return 'DELETING';
      case PrincipalMappingStatus.deleted:
        return 'DELETED';
    }
  }
}

extension PrincipalMappingStatusFromString on String {
  PrincipalMappingStatus toPrincipalMappingStatus() {
    switch (this) {
      case 'FAILED':
        return PrincipalMappingStatus.failed;
      case 'SUCCEEDED':
        return PrincipalMappingStatus.succeeded;
      case 'PROCESSING':
        return PrincipalMappingStatus.processing;
      case 'DELETING':
        return PrincipalMappingStatus.deleting;
      case 'DELETED':
        return PrincipalMappingStatus.deleted;
    }
    throw Exception('$this is not known in enum PrincipalMappingStatus');
  }
}

enum PrincipalType {
  user,
  group,
}

extension PrincipalTypeValueExtension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.user:
        return 'USER';
      case PrincipalType.group:
        return 'GROUP';
    }
  }
}

extension PrincipalTypeFromString on String {
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
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">Secrets
  /// Manager</a>
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

extension QueryIdentifiersEnclosingOptionValueExtension
    on QueryIdentifiersEnclosingOption {
  String toValue() {
    switch (this) {
      case QueryIdentifiersEnclosingOption.doubleQuotes:
        return 'DOUBLE_QUOTES';
      case QueryIdentifiersEnclosingOption.none:
        return 'NONE';
    }
  }
}

extension QueryIdentifiersEnclosingOptionFromString on String {
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
  /// for each field/attribute key that was specified in the <code>Facets</code>
  /// input parameter.
  final List<FacetResult>? facetResults;

  /// The list of featured result items. Featured results are displayed at the top
  /// of the search results page, placed above all other results for certain
  /// queries. If there's an exact match of a query, then certain documents are
  /// featured in the search results.
  final List<FeaturedResultsItem>? featuredResultsItems;

  /// The identifier for the search. You also use <code>QueryId</code> to identify
  /// the search when using the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_SubmitFeedback.html">SubmitFeedback</a>
  /// API.
  final String? queryId;

  /// The results of the search.
  final List<QueryResultItem>? resultItems;

  /// A list of information related to suggested spell corrections for a query.
  final List<SpellCorrectedQuery>? spellCorrectedQueries;

  /// The total number of items found by the search. However, you can only
  /// retrieve up to 100 items. For example, if the search found 192 items, you
  /// can only retrieve the first 100 of the items.
  final int? totalNumberOfResults;

  /// A list of warning codes and their messages on problems with your query.
  ///
  /// Amazon Kendra currently only supports one type of warning, which is a
  /// warning on invalid syntax used in the query. For examples of invalid query
  /// syntax, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/searching-example.html#searching-index-query-syntax">Searching
  /// with advanced query syntax</a>.
  final List<Warning>? warnings;

  QueryResult({
    this.facetResults,
    this.featuredResultsItems,
    this.queryId,
    this.resultItems,
    this.spellCorrectedQueries,
    this.totalNumberOfResults,
    this.warnings,
  });

  factory QueryResult.fromJson(Map<String, dynamic> json) {
    return QueryResult(
      facetResults: (json['FacetResults'] as List?)
          ?.whereNotNull()
          .map((e) => FacetResult.fromJson(e as Map<String, dynamic>))
          .toList(),
      featuredResultsItems: (json['FeaturedResultsItems'] as List?)
          ?.whereNotNull()
          .map((e) => FeaturedResultsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      queryId: json['QueryId'] as String?,
      resultItems: (json['ResultItems'] as List?)
          ?.whereNotNull()
          .map((e) => QueryResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      spellCorrectedQueries: (json['SpellCorrectedQueries'] as List?)
          ?.whereNotNull()
          .map((e) => SpellCorrectedQuery.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalNumberOfResults: json['TotalNumberOfResults'] as int?,
      warnings: (json['Warnings'] as List?)
          ?.whereNotNull()
          .map((e) => Warning.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final facetResults = this.facetResults;
    final featuredResultsItems = this.featuredResultsItems;
    final queryId = this.queryId;
    final resultItems = this.resultItems;
    final spellCorrectedQueries = this.spellCorrectedQueries;
    final totalNumberOfResults = this.totalNumberOfResults;
    final warnings = this.warnings;
    return {
      if (facetResults != null) 'FacetResults': facetResults,
      if (featuredResultsItems != null)
        'FeaturedResultsItems': featuredResultsItems,
      if (queryId != null) 'QueryId': queryId,
      if (resultItems != null) 'ResultItems': resultItems,
      if (spellCorrectedQueries != null)
        'SpellCorrectedQueries': spellCorrectedQueries,
      if (totalNumberOfResults != null)
        'TotalNumberOfResults': totalNumberOfResults,
      if (warnings != null) 'Warnings': warnings,
    };
  }
}

enum QueryResultFormat {
  table,
  text,
}

extension QueryResultFormatValueExtension on QueryResultFormat {
  String toValue() {
    switch (this) {
      case QueryResultFormat.table:
        return 'TABLE';
      case QueryResultFormat.text:
        return 'TEXT';
    }
  }
}

extension QueryResultFormatFromString on String {
  QueryResultFormat toQueryResultFormat() {
    switch (this) {
      case 'TABLE':
        return QueryResultFormat.table;
      case 'TEXT':
        return QueryResultFormat.text;
    }
    throw Exception('$this is not known in enum QueryResultFormat');
  }
}

/// A single query result.
///
/// A query result contains information about a document returned by the query.
/// This includes the original location of the document, a list of attributes
/// assigned to the document, and relevant text from the document that satisfies
/// the query.
class QueryResultItem {
  /// One or more additional fields/attributes associated with the query result.
  final List<AdditionalResultAttribute>? additionalAttributes;

  /// Provides details about a collapsed group of search results.
  final CollapsedResultDetail? collapsedResultDetail;

  /// An array of document fields/attributes assigned to a document in the search
  /// results. For example, the document author (<code>_author</code>) or the
  /// source URI (<code>_source_uri</code>) of the document.
  final List<DocumentAttribute>? documentAttributes;

  /// An extract of the text in the document. Contains information about
  /// highlighting the relevant terms in the excerpt.
  final TextWithHighlights? documentExcerpt;

  /// The identifier for the document.
  final String? documentId;

  /// The title of the document. Contains the text of the title and information
  /// for highlighting the relevant terms in the title.
  final TextWithHighlights? documentTitle;

  /// The URI of the original location of the document.
  final String? documentURI;

  /// A token that identifies a particular result from a particular query. Use
  /// this token to provide click-through feedback for the result. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/submitting-feedback.html">Submitting
  /// feedback</a>.
  final String? feedbackToken;

  /// If the <code>Type</code> of document within the response is
  /// <code>ANSWER</code>, then it is either a <code>TABLE</code> answer or
  /// <code>TEXT</code> answer. If it's a table answer, a table excerpt is
  /// returned in <code>TableExcerpt</code>. If it's a text answer, a text excerpt
  /// is returned in <code>DocumentExcerpt</code>.
  final QueryResultFormat? format;

  /// The unique identifier for the query result item id (<code>Id</code>) and the
  /// query result item document id (<code>DocumentId</code>) combined. The value
  /// of this field changes with every request, even when you have the same
  /// documents.
  final String? id;

  /// Indicates the confidence level of Amazon Kendra providing a relevant result
  /// for the query. Each result is placed into a bin that indicates the
  /// confidence, <code>VERY_HIGH</code>, <code>HIGH</code>, <code>MEDIUM</code>
  /// and <code>LOW</code>. You can use the score to determine if a response meets
  /// the confidence needed for your application.
  ///
  /// The field is only set to <code>LOW</code> when the <code>Type</code> field
  /// is set to <code>DOCUMENT</code> and Amazon Kendra is not confident that the
  /// result is relevant to the query.
  final ScoreAttributes? scoreAttributes;

  /// An excerpt from a table within a document.
  final TableExcerpt? tableExcerpt;

  /// The type of document within the response. For example, a response could
  /// include a question-answer that's relevant to the query.
  final QueryResultType? type;

  QueryResultItem({
    this.additionalAttributes,
    this.collapsedResultDetail,
    this.documentAttributes,
    this.documentExcerpt,
    this.documentId,
    this.documentTitle,
    this.documentURI,
    this.feedbackToken,
    this.format,
    this.id,
    this.scoreAttributes,
    this.tableExcerpt,
    this.type,
  });

  factory QueryResultItem.fromJson(Map<String, dynamic> json) {
    return QueryResultItem(
      additionalAttributes: (json['AdditionalAttributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AdditionalResultAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      collapsedResultDetail: json['CollapsedResultDetail'] != null
          ? CollapsedResultDetail.fromJson(
              json['CollapsedResultDetail'] as Map<String, dynamic>)
          : null,
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
      format: (json['Format'] as String?)?.toQueryResultFormat(),
      id: json['Id'] as String?,
      scoreAttributes: json['ScoreAttributes'] != null
          ? ScoreAttributes.fromJson(
              json['ScoreAttributes'] as Map<String, dynamic>)
          : null,
      tableExcerpt: json['TableExcerpt'] != null
          ? TableExcerpt.fromJson(json['TableExcerpt'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toQueryResultType(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalAttributes = this.additionalAttributes;
    final collapsedResultDetail = this.collapsedResultDetail;
    final documentAttributes = this.documentAttributes;
    final documentExcerpt = this.documentExcerpt;
    final documentId = this.documentId;
    final documentTitle = this.documentTitle;
    final documentURI = this.documentURI;
    final feedbackToken = this.feedbackToken;
    final format = this.format;
    final id = this.id;
    final scoreAttributes = this.scoreAttributes;
    final tableExcerpt = this.tableExcerpt;
    final type = this.type;
    return {
      if (additionalAttributes != null)
        'AdditionalAttributes': additionalAttributes,
      if (collapsedResultDetail != null)
        'CollapsedResultDetail': collapsedResultDetail,
      if (documentAttributes != null) 'DocumentAttributes': documentAttributes,
      if (documentExcerpt != null) 'DocumentExcerpt': documentExcerpt,
      if (documentId != null) 'DocumentId': documentId,
      if (documentTitle != null) 'DocumentTitle': documentTitle,
      if (documentURI != null) 'DocumentURI': documentURI,
      if (feedbackToken != null) 'FeedbackToken': feedbackToken,
      if (format != null) 'Format': format.toValue(),
      if (id != null) 'Id': id,
      if (scoreAttributes != null) 'ScoreAttributes': scoreAttributes,
      if (tableExcerpt != null) 'TableExcerpt': tableExcerpt,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum QueryResultType {
  document,
  questionAnswer,
  answer,
}

extension QueryResultTypeValueExtension on QueryResultType {
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

extension QueryResultTypeFromString on String {
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

extension QuerySuggestionsBlockListStatusValueExtension
    on QuerySuggestionsBlockListStatus {
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

extension QuerySuggestionsBlockListStatusFromString on String {
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
  /// The Unix timestamp when the block list was created.
  final DateTime? createdAt;

  /// The identifier of a block list.
  final String? id;

  /// The number of items in the block list file.
  final int? itemCount;

  /// The name of the block list.
  final String? name;

  /// The status of the block list.
  final QuerySuggestionsBlockListStatus? status;

  /// The Unix timestamp when the block list was last updated.
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

extension QuerySuggestionsStatusValueExtension on QuerySuggestionsStatus {
  String toValue() {
    switch (this) {
      case QuerySuggestionsStatus.active:
        return 'ACTIVE';
      case QuerySuggestionsStatus.updating:
        return 'UPDATING';
    }
  }
}

extension QuerySuggestionsStatusFromString on String {
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

/// Provides the configuration information to connect to Quip as your data
/// source.
class QuipConfiguration {
  /// The Quip site domain. For example,
  /// <i>https://quip-company.quipdomain.com/browse</i>. The domain in this
  /// example is "quipdomain".
  final String domain;

  /// The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
  /// the key-value pairs that are required to connect to your Quip. The secret
  /// must contain a JSON structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// accessToken—The token created in Quip. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-slack.html">Using
  /// a Quip data source</a>.
  /// </li>
  /// </ul>
  final String secretArn;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Quip attachments to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Quip fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Quip field names must exist in your Quip custom
  /// metadata.
  final List<DataSourceToIndexFieldMapping>? attachmentFieldMappings;

  /// <code>TRUE</code> to index attachments.
  final bool? crawlAttachments;

  /// <code>TRUE</code> to index the contents of chat rooms.
  final bool? crawlChatRooms;

  /// <code>TRUE</code> to index file comments.
  final bool? crawlFileComments;

  /// A list of regular expression patterns to exclude certain files in your Quip
  /// file system. Files that match the patterns are excluded from the index.
  /// Files that don’t match the patterns are included in the index. If a file
  /// matches both an inclusion pattern and an exclusion pattern, the exclusion
  /// pattern takes precedence, and the file isn't included in the index.
  final List<String>? exclusionPatterns;

  /// The identifiers of the Quip folders you want to index. You can find the
  /// folder ID in your browser URL when you access your folder in Quip. For
  /// example,
  /// <i>https://quip-company.quipdomain.com/zlLuOVNSarTL/folder-name</i>. The
  /// folder ID in this example is "zlLuOVNSarTL".
  final List<String>? folderIds;

  /// A list of regular expression patterns to include certain files in your Quip
  /// file system. Files that match the patterns are included in the index. Files
  /// that don't match the patterns are excluded from the index. If a file matches
  /// both an inclusion pattern and an exclusion pattern, the exclusion pattern
  /// takes precedence, and the file isn't included in the index.
  final List<String>? inclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Quip messages to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Quip fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Quip field names must exist in your Quip custom
  /// metadata.
  final List<DataSourceToIndexFieldMapping>? messageFieldMappings;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// attributes or field names of Quip threads to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Quip fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Quip field names must exist in your Quip custom
  /// metadata.
  final List<DataSourceToIndexFieldMapping>? threadFieldMappings;

  /// Configuration information for an Amazon Virtual Private Cloud (VPC) to
  /// connect to your Quip. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  QuipConfiguration({
    required this.domain,
    required this.secretArn,
    this.attachmentFieldMappings,
    this.crawlAttachments,
    this.crawlChatRooms,
    this.crawlFileComments,
    this.exclusionPatterns,
    this.folderIds,
    this.inclusionPatterns,
    this.messageFieldMappings,
    this.threadFieldMappings,
    this.vpcConfiguration,
  });

  factory QuipConfiguration.fromJson(Map<String, dynamic> json) {
    return QuipConfiguration(
      domain: json['Domain'] as String,
      secretArn: json['SecretArn'] as String,
      attachmentFieldMappings: (json['AttachmentFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      crawlAttachments: json['CrawlAttachments'] as bool?,
      crawlChatRooms: json['CrawlChatRooms'] as bool?,
      crawlFileComments: json['CrawlFileComments'] as bool?,
      exclusionPatterns: (json['ExclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      folderIds: (json['FolderIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      inclusionPatterns: (json['InclusionPatterns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      messageFieldMappings: (json['MessageFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      threadFieldMappings: (json['ThreadFieldMappings'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataSourceToIndexFieldMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final secretArn = this.secretArn;
    final attachmentFieldMappings = this.attachmentFieldMappings;
    final crawlAttachments = this.crawlAttachments;
    final crawlChatRooms = this.crawlChatRooms;
    final crawlFileComments = this.crawlFileComments;
    final exclusionPatterns = this.exclusionPatterns;
    final folderIds = this.folderIds;
    final inclusionPatterns = this.inclusionPatterns;
    final messageFieldMappings = this.messageFieldMappings;
    final threadFieldMappings = this.threadFieldMappings;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'Domain': domain,
      'SecretArn': secretArn,
      if (attachmentFieldMappings != null)
        'AttachmentFieldMappings': attachmentFieldMappings,
      if (crawlAttachments != null) 'CrawlAttachments': crawlAttachments,
      if (crawlChatRooms != null) 'CrawlChatRooms': crawlChatRooms,
      if (crawlFileComments != null) 'CrawlFileComments': crawlFileComments,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (folderIds != null) 'FolderIds': folderIds,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (messageFieldMappings != null)
        'MessageFieldMappings': messageFieldMappings,
      if (threadFieldMappings != null)
        'ThreadFieldMappings': threadFieldMappings,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

enum ReadAccessType {
  allow,
  deny,
}

extension ReadAccessTypeValueExtension on ReadAccessType {
  String toValue() {
    switch (this) {
      case ReadAccessType.allow:
        return 'ALLOW';
      case ReadAccessType.deny:
        return 'DENY';
    }
  }
}

extension ReadAccessTypeFromString on String {
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

/// Provides information for tuning the relevance of a field in a search. When a
/// query includes terms that match the field, the results are given a boost in
/// the response based on these tuning parameters.
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
  /// October 31, document 1 is "fresher" than document 2. Only applies to
  /// <code>DATE</code> fields.
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
  /// Only applies to <code>LONG</code> fields.
  final Order? rankOrder;

  /// A list of values that should be given a different boost when they appear in
  /// the result list. For example, if you are boosting a field called
  /// "department", query terms that match the department field are boosted in the
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
/// application uses the <code>SubmitFeedback</code> API to provide relevance
/// information.
class RelevanceFeedback {
  /// Whether the document was relevant or not relevant to the search.
  final RelevanceType relevanceValue;

  /// The identifier of the search result that the user provided relevance
  /// feedback for.
  final String resultId;

  RelevanceFeedback({
    required this.relevanceValue,
    required this.resultId,
  });

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

extension RelevanceTypeValueExtension on RelevanceType {
  String toValue() {
    switch (this) {
      case RelevanceType.relevant:
        return 'RELEVANT';
      case RelevanceType.notRelevant:
        return 'NOT_RELEVANT';
    }
  }
}

extension RelevanceTypeFromString on String {
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

class RetrieveResult {
  /// The identifier of query used for the search. You also use
  /// <code>QueryId</code> to identify the search when using the <a
  /// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_SubmitFeedback.html">Submitfeedback</a>
  /// API.
  final String? queryId;

  /// The results of the retrieved relevant passages for the search.
  final List<RetrieveResultItem>? resultItems;

  RetrieveResult({
    this.queryId,
    this.resultItems,
  });

  factory RetrieveResult.fromJson(Map<String, dynamic> json) {
    return RetrieveResult(
      queryId: json['QueryId'] as String?,
      resultItems: (json['ResultItems'] as List?)
          ?.whereNotNull()
          .map((e) => RetrieveResultItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final queryId = this.queryId;
    final resultItems = this.resultItems;
    return {
      if (queryId != null) 'QueryId': queryId,
      if (resultItems != null) 'ResultItems': resultItems,
    };
  }
}

/// A single retrieved relevant passage result.
class RetrieveResultItem {
  /// The contents of the relevant passage.
  final String? content;

  /// An array of document fields/attributes assigned to a document in the search
  /// results. For example, the document author (<code>_author</code>) or the
  /// source URI (<code>_source_uri</code>) of the document.
  final List<DocumentAttribute>? documentAttributes;

  /// The identifier of the document.
  final String? documentId;

  /// The title of the document.
  final String? documentTitle;

  /// The URI of the original location of the document.
  final String? documentURI;

  /// The identifier of the relevant passage result.
  final String? id;

  /// The confidence score bucket for a retrieved passage result. The confidence
  /// bucket provides a relative ranking that indicates how confident Amazon
  /// Kendra is that the response is relevant to the query.
  final ScoreAttributes? scoreAttributes;

  RetrieveResultItem({
    this.content,
    this.documentAttributes,
    this.documentId,
    this.documentTitle,
    this.documentURI,
    this.id,
    this.scoreAttributes,
  });

  factory RetrieveResultItem.fromJson(Map<String, dynamic> json) {
    return RetrieveResultItem(
      content: json['Content'] as String?,
      documentAttributes: (json['DocumentAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentId: json['DocumentId'] as String?,
      documentTitle: json['DocumentTitle'] as String?,
      documentURI: json['DocumentURI'] as String?,
      id: json['Id'] as String?,
      scoreAttributes: json['ScoreAttributes'] != null
          ? ScoreAttributes.fromJson(
              json['ScoreAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final documentAttributes = this.documentAttributes;
    final documentId = this.documentId;
    final documentTitle = this.documentTitle;
    final documentURI = this.documentURI;
    final id = this.id;
    final scoreAttributes = this.scoreAttributes;
    return {
      if (content != null) 'Content': content,
      if (documentAttributes != null) 'DocumentAttributes': documentAttributes,
      if (documentId != null) 'DocumentId': documentId,
      if (documentTitle != null) 'DocumentTitle': documentTitle,
      if (documentURI != null) 'DocumentURI': documentURI,
      if (id != null) 'Id': id,
      if (scoreAttributes != null) 'ScoreAttributes': scoreAttributes,
    };
  }
}

/// Provides the configuration information to connect to an Amazon S3 bucket.
/// <note>
/// Amazon Kendra now supports an upgraded Amazon S3 connector.
///
/// You must now use the <a
/// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
/// object instead of the <code>S3DataSourceConfiguration</code> object to
/// configure your connector.
///
/// Connectors configured using the older console and API architecture will
/// continue to function as configured. However, you won't be able to edit or
/// update them. If you want to edit or update your connector configuration, you
/// must create a new connector.
///
/// We recommended migrating your connector workflow to the upgraded version.
/// Support for connectors configured using the older architecture is scheduled
/// to end by June 2024.
/// </note>
class S3DataSourceConfiguration {
  /// The name of the bucket that contains the documents.
  final String bucketName;

  /// Provides the path to the S3 bucket that contains the user context filtering
  /// files for the data source. For the format of the file, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/s3-acl.html">Access
  /// control for S3 data sources</a>.
  final AccessControlListConfiguration? accessControlListConfiguration;
  final DocumentsMetadataConfiguration? documentsMetadataConfiguration;

  /// A list of glob patterns (patterns that can expand a wildcard pattern into a
  /// list of path names that match the given pattern) for certain file names and
  /// file types to exclude from your index. If a document matches both an
  /// inclusion and exclusion prefix or pattern, the exclusion prefix takes
  /// precendence and the document is not indexed. Examples of glob patterns
  /// include:
  ///
  /// <ul>
  /// <li>
  /// <i>/myapp/config/*</i>—All files inside config directory.
  /// </li>
  /// <li>
  /// <i>**/*.png</i>—All .png files in all directories.
  /// </li>
  /// <li>
  /// <i>**/*.{png, ico, md}</i>—All .png, .ico or .md files in all directories.
  /// </li>
  /// <li>
  /// <i>/myapp/src/**/*.ts</i>—All .ts files inside src directory (and all its
  /// subdirectories).
  /// </li>
  /// <li>
  /// <i>**/!(*.module).ts</i>—All .ts files but not .module.ts
  /// </li>
  /// <li>
  /// <i>*.png , *.jpg</i>—All PNG and JPEG image files in a directory (files with
  /// the extensions .png and .jpg).
  /// </li>
  /// <li>
  /// <i>*internal*</i>—All files in a directory that contain 'internal' in the
  /// file name, such as 'internal', 'internal_only', 'company_internal'.
  /// </li>
  /// <li>
  /// <i>**/*internal*</i>—All internal-related files in a directory and its
  /// subdirectories.
  /// </li>
  /// </ul>
  /// For more examples, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/s3/#use-of-exclude-and-include-filters">Use
  /// of Exclude and Include Filters</a> in the Amazon Web Services CLI Command
  /// Reference.
  final List<String>? exclusionPatterns;

  /// A list of glob patterns (patterns that can expand a wildcard pattern into a
  /// list of path names that match the given pattern) for certain file names and
  /// file types to include in your index. If a document matches both an inclusion
  /// and exclusion prefix or pattern, the exclusion prefix takes precendence and
  /// the document is not indexed. Examples of glob patterns include:
  ///
  /// <ul>
  /// <li>
  /// <i>/myapp/config/*</i>—All files inside config directory.
  /// </li>
  /// <li>
  /// <i>**/*.png</i>—All .png files in all directories.
  /// </li>
  /// <li>
  /// <i>**/*.{png, ico, md}</i>—All .png, .ico or .md files in all directories.
  /// </li>
  /// <li>
  /// <i>/myapp/src/**/*.ts</i>—All .ts files inside src directory (and all its
  /// subdirectories).
  /// </li>
  /// <li>
  /// <i>**/!(*.module).ts</i>—All .ts files but not .module.ts
  /// </li>
  /// <li>
  /// <i>*.png , *.jpg</i>—All PNG and JPEG image files in a directory (files with
  /// the extensions .png and .jpg).
  /// </li>
  /// <li>
  /// <i>*internal*</i>—All files in a directory that contain 'internal' in the
  /// file name, such as 'internal', 'internal_only', 'company_internal'.
  /// </li>
  /// <li>
  /// <i>**/*internal*</i>—All internal-related files in a directory and its
  /// subdirectories.
  /// </li>
  /// </ul>
  /// For more examples, see <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/s3/#use-of-exclude-and-include-filters">Use
  /// of Exclude and Include Filters</a> in the Amazon Web Services CLI Command
  /// Reference.
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

/// Provides the configuration information to connect to GitHub Enterprise Cloud
/// (SaaS).
class SaaSConfiguration {
  /// The GitHub host URL or API endpoint URL. For example,
  /// <i>https://api.github.com</i>.
  final String hostUrl;

  /// The name of the organization of the GitHub Enterprise Cloud (SaaS) account
  /// you want to connect to. You can find your organization name by logging into
  /// GitHub desktop and selecting <b>Your organizations</b> under your profile
  /// picture dropdown.
  final String organizationName;

  SaaSConfiguration({
    required this.hostUrl,
    required this.organizationName,
  });

  factory SaaSConfiguration.fromJson(Map<String, dynamic> json) {
    return SaaSConfiguration(
      hostUrl: json['HostUrl'] as String,
      organizationName: json['OrganizationName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final hostUrl = this.hostUrl;
    final organizationName = this.organizationName;
    return {
      'HostUrl': hostUrl,
      'OrganizationName': organizationName,
    };
  }
}

/// The configuration information for syncing a Salesforce chatter feed. The
/// contents of the object comes from the Salesforce FeedItem table.
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

extension SalesforceChatterFeedIncludeFilterTypeValueExtension
    on SalesforceChatterFeedIncludeFilterType {
  String toValue() {
    switch (this) {
      case SalesforceChatterFeedIncludeFilterType.activeUser:
        return 'ACTIVE_USER';
      case SalesforceChatterFeedIncludeFilterType.standardUser:
        return 'STANDARD_USER';
    }
  }
}

extension SalesforceChatterFeedIncludeFilterTypeFromString on String {
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

/// Provides the configuration information to connect to Salesforce as your data
/// source.
class SalesforceConfiguration {
  /// The Amazon Resource Name (ARN) of an Secrets Managersecret that contains the
  /// key/value pairs required to connect to your Salesforce instance. The secret
  /// must contain a JSON structure with the following keys:
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
  /// securityToken - The token associated with the user logging in to the
  /// Salesforce instance.
  /// </li>
  /// <li>
  /// username - The user name of the user logging in to the Salesforce instance.
  /// </li>
  /// </ul>
  final String secretArn;

  /// The instance URL for the Salesforce site that you want to index.
  final String serverUrl;

  /// Configuration information for Salesforce chatter feeds.
  final SalesforceChatterFeedConfiguration? chatterFeedConfiguration;

  /// Indicates whether Amazon Kendra should index attachments to Salesforce
  /// objects.
  final bool? crawlAttachments;

  /// A list of regular expression patterns to exclude certain documents in your
  /// Salesforce. Documents that match the patterns are excluded from the index.
  /// Documents that don't match the patterns are included in the index. If a
  /// document matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the document isn't included in the index.
  ///
  /// The pattern is applied to the name of the attached file.
  final List<String>? excludeAttachmentFilePatterns;

  /// A list of regular expression patterns to include certain documents in your
  /// Salesforce. Documents that match the patterns are included in the index.
  /// Documents that don't match the patterns are excluded from the index. If a
  /// document matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the document isn't included in the index.
  ///
  /// The pattern is applied to the name of the attached file.
  final List<String>? includeAttachmentFilePatterns;

  /// Configuration information for the knowledge article types that Amazon Kendra
  /// indexes. Amazon Kendra indexes standard knowledge articles and the standard
  /// fields of knowledge articles, or the custom fields of custom knowledge
  /// articles, but not both.
  final SalesforceKnowledgeArticleConfiguration? knowledgeArticleConfiguration;

  /// Configuration information for processing attachments to Salesforce standard
  /// objects.
  final SalesforceStandardObjectAttachmentConfiguration?
      standardObjectAttachmentConfiguration;

  /// Configuration of the Salesforce standard objects that Amazon Kendra indexes.
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

/// Provides the configuration information for indexing Salesforce custom
/// articles.
class SalesforceCustomKnowledgeArticleTypeConfiguration {
  /// The name of the field in the custom knowledge article that contains the
  /// document data to index.
  final String documentDataFieldName;

  /// The name of the configuration.
  final String name;

  /// The name of the field in the custom knowledge article that contains the
  /// document title.
  final String? documentTitleFieldName;

  /// Maps attributes or field names of the custom knowledge article to Amazon
  /// Kendra index field names. To create custom fields, use the
  /// <code>UpdateIndex</code> API before you map to Salesforce fields. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Salesforce data source field names must exist in
  /// your Salesforce custom metadata.
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

/// Provides the configuration information for the knowledge article types that
/// Amazon Kendra indexes. Amazon Kendra indexes standard knowledge articles and
/// the standard fields of knowledge articles, or the custom fields of custom
/// knowledge articles, but not both
class SalesforceKnowledgeArticleConfiguration {
  /// Specifies the document states that should be included when Amazon Kendra
  /// indexes knowledge articles. You must specify at least one state.
  final List<SalesforceKnowledgeArticleState> includedStates;

  /// Configuration information for custom Salesforce knowledge articles.
  final List<SalesforceCustomKnowledgeArticleTypeConfiguration>?
      customKnowledgeArticleTypeConfigurations;

  /// Configuration information for standard Salesforce knowledge articles.
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

extension SalesforceKnowledgeArticleStateValueExtension
    on SalesforceKnowledgeArticleState {
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

extension SalesforceKnowledgeArticleStateFromString on String {
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

/// Provides the configuration information for standard Salesforce knowledge
/// articles.
class SalesforceStandardKnowledgeArticleTypeConfiguration {
  /// The name of the field that contains the document data to index.
  final String documentDataFieldName;

  /// The name of the field that contains the document title.
  final String? documentTitleFieldName;

  /// Maps attributes or field names of the knowledge article to Amazon Kendra
  /// index field names. To create custom fields, use the <code>UpdateIndex</code>
  /// API before you map to Salesforce fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Salesforce data source field names must exist in
  /// your Salesforce custom metadata.
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

/// Provides the configuration information for processing attachments to
/// Salesforce standard objects.
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

/// Provides the configuration information for indexing a single standard
/// object.
class SalesforceStandardObjectConfiguration {
  /// The name of the field in the standard object table that contains the
  /// document contents.
  final String documentDataFieldName;

  /// The name of the standard object.
  final SalesforceStandardObjectName name;

  /// The name of the field in the standard object table that contains the
  /// document title.
  final String? documentTitleFieldName;

  /// Maps attributes or field names of the standard object to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to Salesforce fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Salesforce data source field names must exist in
  /// your Salesforce custom metadata.
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

extension SalesforceStandardObjectNameValueExtension
    on SalesforceStandardObjectName {
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

extension SalesforceStandardObjectNameFromString on String {
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
/// that the response is relevant to the query.
class ScoreAttributes {
  /// A relative ranking for how relevant the response is to the query.
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
  notAvailable,
}

extension ScoreConfidenceValueExtension on ScoreConfidence {
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
      case ScoreConfidence.notAvailable:
        return 'NOT_AVAILABLE';
    }
  }
}

extension ScoreConfidenceFromString on String {
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
      case 'NOT_AVAILABLE':
        return ScoreConfidence.notAvailable;
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

/// Provides the configuration information for the seed or starting point URLs
/// to crawl.
///
/// <i>When selecting websites to index, you must adhere to the <a
/// href="https://aws.amazon.com/aup/">Amazon Acceptable Use Policy</a> and all
/// other Amazon terms. Remember that you must only use Amazon Kendra Web
/// Crawler to index your own web pages, or web pages that you have
/// authorization to index.</i>
class SeedUrlConfiguration {
  /// The list of seed or starting point URLs of the websites you want to crawl.
  ///
  /// The list can include a maximum of 100 seed URLs.
  final List<String> seedUrls;

  /// You can choose one of the following modes:
  ///
  /// <ul>
  /// <li>
  /// <code>HOST_ONLY</code>—crawl only the website host names. For example, if
  /// the seed URL is "abc.example.com", then only URLs with host name
  /// "abc.example.com" are crawled.
  /// </li>
  /// <li>
  /// <code>SUBDOMAINS</code>—crawl the website host names with subdomains. For
  /// example, if the seed URL is "abc.example.com", then "a.abc.example.com" and
  /// "b.abc.example.com" are also crawled.
  /// </li>
  /// <li>
  /// <code>EVERYTHING</code>—crawl the website host names with subdomains and
  /// other domains that the web pages link to.
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

/// Provides the identifier of the KMS key used to encrypt data indexed by
/// Amazon Kendra. Amazon Kendra doesn't support asymmetric keys.
class ServerSideEncryptionConfiguration {
  /// The identifier of the KMS key. Amazon Kendra doesn't support asymmetric
  /// keys.
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

extension ServiceNowAuthenticationTypeValueExtension
    on ServiceNowAuthenticationType {
  String toValue() {
    switch (this) {
      case ServiceNowAuthenticationType.httpBasic:
        return 'HTTP_BASIC';
      case ServiceNowAuthenticationType.oauth2:
        return 'OAUTH2';
    }
  }
}

extension ServiceNowAuthenticationTypeFromString on String {
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

extension ServiceNowBuildVersionTypeValueExtension
    on ServiceNowBuildVersionType {
  String toValue() {
    switch (this) {
      case ServiceNowBuildVersionType.london:
        return 'LONDON';
      case ServiceNowBuildVersionType.others:
        return 'OTHERS';
    }
  }
}

extension ServiceNowBuildVersionTypeFromString on String {
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

/// Provides the configuration information to connect to ServiceNow as your data
/// source.
class ServiceNowConfiguration {
  /// The ServiceNow instance that the data source connects to. The host endpoint
  /// should look like the following: <i>{instance}.service-now.com.</i>
  final String hostUrl;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret that contains
  /// the user name and password required to connect to the ServiceNow instance.
  /// You can also provide OAuth authentication credentials of user name,
  /// password, client ID, and client secret. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-servicenow.html">Using
  /// a ServiceNow data source</a>.
  final String secretArn;

  /// The identifier of the release that the ServiceNow host is running. If the
  /// host is not running the <code>LONDON</code> release, use
  /// <code>OTHERS</code>.
  final ServiceNowBuildVersionType serviceNowBuildVersion;

  /// The type of authentication used to connect to the ServiceNow instance. If
  /// you choose <code>HTTP_BASIC</code>, Amazon Kendra is authenticated using the
  /// user name and password provided in the Secrets Manager secret in the
  /// <code>SecretArn</code> field. If you choose <code>OAUTH2</code>, Amazon
  /// Kendra is authenticated using the credentials of client ID, client secret,
  /// user name and password.
  ///
  /// When you use <code>OAUTH2</code> authentication, you must generate a token
  /// and a client secret using the ServiceNow console. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-servicenow.html">Using
  /// a ServiceNow data source</a>.
  final ServiceNowAuthenticationType? authenticationType;

  /// Configuration information for crawling knowledge articles in the ServiceNow
  /// site.
  final ServiceNowKnowledgeArticleConfiguration? knowledgeArticleConfiguration;

  /// Configuration information for crawling service catalogs in the ServiceNow
  /// site.
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

/// Provides the configuration information for crawling knowledge articles in
/// the ServiceNow site.
class ServiceNowKnowledgeArticleConfiguration {
  /// The name of the ServiceNow field that is mapped to the index document
  /// contents field in the Amazon Kendra index.
  final String documentDataFieldName;

  /// <code>TRUE</code> to index attachments to knowledge articles.
  final bool? crawlAttachments;

  /// The name of the ServiceNow field that is mapped to the index document title
  /// field.
  final String? documentTitleFieldName;

  /// A list of regular expression patterns applied to exclude certain knowledge
  /// article attachments. Attachments that match the patterns are excluded from
  /// the index. Items that don't match the patterns are included in the index. If
  /// an item matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the item isn't included in the index.
  final List<String>? excludeAttachmentFilePatterns;

  /// Maps attributes or field names of knoweldge articles to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to ServiceNow fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The ServiceNow data source field names must exist in
  /// your ServiceNow custom metadata.
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

  /// A list of regular expression patterns applied to include knowledge article
  /// attachments. Attachments that match the patterns are included in the index.
  /// Items that don't match the patterns are excluded from the index. If an item
  /// matches both an inclusion and exclusion pattern, the exclusion pattern takes
  /// precedence and the item isn't included in the index.
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

/// Provides the configuration information for crawling service catalog items in
/// the ServiceNow site
class ServiceNowServiceCatalogConfiguration {
  /// The name of the ServiceNow field that is mapped to the index document
  /// contents field in the Amazon Kendra index.
  final String documentDataFieldName;

  /// <code>TRUE</code> to index attachments to service catalog items.
  final bool? crawlAttachments;

  /// The name of the ServiceNow field that is mapped to the index document title
  /// field.
  final String? documentTitleFieldName;

  /// A list of regular expression patterns to exclude certain attachments of
  /// catalogs in your ServiceNow. Item that match the patterns are excluded from
  /// the index. Items that don't match the patterns are included in the index. If
  /// an item matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the item isn't included in the index.
  ///
  /// The regex is applied to the file name of the attachment.
  final List<String>? excludeAttachmentFilePatterns;

  /// Maps attributes or field names of catalogs to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to ServiceNow fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The ServiceNow data source field names must exist in
  /// your ServiceNow custom metadata.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns to include certain attachments of
  /// catalogs in your ServiceNow. Item that match the patterns are included in
  /// the index. Items that don't match the patterns are excluded from the index.
  /// If an item matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the item isn't included in the index.
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

/// Provides the configuration information to connect to Microsoft SharePoint as
/// your data source.
class SharePointConfiguration {
  /// The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
  /// the user name and password required to connect to the SharePoint instance.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-sharepoint.html">Microsoft
  /// SharePoint</a>.
  final String secretArn;

  /// The version of Microsoft SharePoint that you use.
  final SharePointVersion sharePointVersion;

  /// The Microsoft SharePoint site URLs for the documents you want to index.
  final List<String> urls;

  /// Whether you want to connect to SharePoint Online using basic authentication
  /// of user name and password, or OAuth authentication of user name, password,
  /// client ID, and client secret, or AD App-only authentication of client
  /// secret.
  final SharePointOnlineAuthenticationType? authenticationType;

  /// <code>TRUE</code> to index document attachments.
  final bool? crawlAttachments;

  /// <code>TRUE</code> to disable local groups information.
  final bool? disableLocalGroups;

  /// The Microsoft SharePoint attribute field that contains the title of the
  /// document.
  final String? documentTitleFieldName;

  /// A list of regular expression patterns to exclude certain documents in your
  /// SharePoint. Documents that match the patterns are excluded from the index.
  /// Documents that don't match the patterns are included in the index. If a
  /// document matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the document isn't included in the index.
  ///
  /// The regex applies to the display URL of the SharePoint document.
  final List<String>? exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map
  /// SharePoint data source attributes or field names to Amazon Kendra index
  /// field names. To create custom fields, use the <code>UpdateIndex</code> API
  /// before you map to SharePoint fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The SharePoint data source field names must exist in
  /// your SharePoint custom metadata.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns to include certain documents in your
  /// SharePoint. Documents that match the patterns are included in the index.
  /// Documents that don't match the patterns are excluded from the index. If a
  /// document matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the document isn't included in the index.
  ///
  /// The regex applies to the display URL of the SharePoint document.
  final List<String>? inclusionPatterns;

  /// Configuration information to connect to your Microsoft SharePoint site URLs
  /// via instance via a web proxy. You can use this option for SharePoint Server.
  ///
  /// You must provide the website host name and port number. For example, the
  /// host name of <i>https://a.example.com/page1.html</i> is "a.example.com" and
  /// the port is 443, the standard port for HTTPS.
  ///
  /// Web proxy credentials are optional and you can use them to connect to a web
  /// proxy server that requires basic authentication of user name and password.
  /// To store web proxy credentials, you use a secret in Secrets Manager.
  ///
  /// It is recommended that you follow best security practices when configuring
  /// your web proxy. This includes setting up throttling, setting up logging and
  /// monitoring, and applying security patches on a regular basis. If you use
  /// your web proxy with multiple data sources, sync jobs that occur at the same
  /// time could strain the load on your proxy. It is recommended you prepare your
  /// proxy beforehand for any security and load requirements.
  final ProxyConfiguration? proxyConfiguration;

  /// The path to the SSL certificate stored in an Amazon S3 bucket. You use this
  /// to connect to SharePoint Server if you require a secure SSL connection.
  ///
  /// You can generate a self-signed X509 certificate on any computer using
  /// OpenSSL. For an example of using OpenSSL to create an X509 certificate, see
  /// <a
  /// href="https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html">Create
  /// and sign an X509 certificate</a>.
  final S3Path? sslCertificateS3Path;

  /// <code>TRUE</code> to use the SharePoint change log to determine which
  /// documents require updating in the index. Depending on the change log's size,
  /// it may take longer for Amazon Kendra to use the change log than to scan all
  /// of your documents in SharePoint.
  final bool? useChangeLog;

  /// Configuration information for an Amazon Virtual Private Cloud to connect to
  /// your Microsoft SharePoint. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  SharePointConfiguration({
    required this.secretArn,
    required this.sharePointVersion,
    required this.urls,
    this.authenticationType,
    this.crawlAttachments,
    this.disableLocalGroups,
    this.documentTitleFieldName,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
    this.proxyConfiguration,
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
      authenticationType: (json['AuthenticationType'] as String?)
          ?.toSharePointOnlineAuthenticationType(),
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
      proxyConfiguration: json['ProxyConfiguration'] != null
          ? ProxyConfiguration.fromJson(
              json['ProxyConfiguration'] as Map<String, dynamic>)
          : null,
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
    final authenticationType = this.authenticationType;
    final crawlAttachments = this.crawlAttachments;
    final disableLocalGroups = this.disableLocalGroups;
    final documentTitleFieldName = this.documentTitleFieldName;
    final exclusionPatterns = this.exclusionPatterns;
    final fieldMappings = this.fieldMappings;
    final inclusionPatterns = this.inclusionPatterns;
    final proxyConfiguration = this.proxyConfiguration;
    final sslCertificateS3Path = this.sslCertificateS3Path;
    final useChangeLog = this.useChangeLog;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'SecretArn': secretArn,
      'SharePointVersion': sharePointVersion.toValue(),
      'Urls': urls,
      if (authenticationType != null)
        'AuthenticationType': authenticationType.toValue(),
      if (crawlAttachments != null) 'CrawlAttachments': crawlAttachments,
      if (disableLocalGroups != null) 'DisableLocalGroups': disableLocalGroups,
      if (documentTitleFieldName != null)
        'DocumentTitleFieldName': documentTitleFieldName,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (proxyConfiguration != null) 'ProxyConfiguration': proxyConfiguration,
      if (sslCertificateS3Path != null)
        'SslCertificateS3Path': sslCertificateS3Path,
      if (useChangeLog != null) 'UseChangeLog': useChangeLog,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

enum SharePointOnlineAuthenticationType {
  httpBasic,
  oauth2,
}

extension SharePointOnlineAuthenticationTypeValueExtension
    on SharePointOnlineAuthenticationType {
  String toValue() {
    switch (this) {
      case SharePointOnlineAuthenticationType.httpBasic:
        return 'HTTP_BASIC';
      case SharePointOnlineAuthenticationType.oauth2:
        return 'OAUTH2';
    }
  }
}

extension SharePointOnlineAuthenticationTypeFromString on String {
  SharePointOnlineAuthenticationType toSharePointOnlineAuthenticationType() {
    switch (this) {
      case 'HTTP_BASIC':
        return SharePointOnlineAuthenticationType.httpBasic;
      case 'OAUTH2':
        return SharePointOnlineAuthenticationType.oauth2;
    }
    throw Exception(
        '$this is not known in enum SharePointOnlineAuthenticationType');
  }
}

enum SharePointVersion {
  sharepoint_2013,
  sharepoint_2016,
  sharepointOnline,
  sharepoint_2019,
}

extension SharePointVersionValueExtension on SharePointVersion {
  String toValue() {
    switch (this) {
      case SharePointVersion.sharepoint_2013:
        return 'SHAREPOINT_2013';
      case SharePointVersion.sharepoint_2016:
        return 'SHAREPOINT_2016';
      case SharePointVersion.sharepointOnline:
        return 'SHAREPOINT_ONLINE';
      case SharePointVersion.sharepoint_2019:
        return 'SHAREPOINT_2019';
    }
  }
}

extension SharePointVersionFromString on String {
  SharePointVersion toSharePointVersion() {
    switch (this) {
      case 'SHAREPOINT_2013':
        return SharePointVersion.sharepoint_2013;
      case 'SHAREPOINT_2016':
        return SharePointVersion.sharepoint_2016;
      case 'SHAREPOINT_ONLINE':
        return SharePointVersion.sharepointOnline;
      case 'SHAREPOINT_2019':
        return SharePointVersion.sharepoint_2019;
    }
    throw Exception('$this is not known in enum SharePointVersion');
  }
}

/// Provides the configuration information for the sitemap URLs to crawl.
///
/// <i>When selecting websites to index, you must adhere to the <a
/// href="https://aws.amazon.com/aup/">Amazon Acceptable Use Policy</a> and all
/// other Amazon terms. Remember that you must only use Amazon Kendra Web
/// Crawler to index your own web pages, or web pages that you have
/// authorization to index.</i>
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

/// Provides the configuration information to connect to Slack as your data
/// source.
/// <note>
/// Amazon Kendra now supports an upgraded Slack connector.
///
/// You must now use the <a
/// href="https://docs.aws.amazon.com/kendra/latest/APIReference/API_TemplateConfiguration.html">TemplateConfiguration</a>
/// object instead of the <code>SlackConfiguration</code> object to configure
/// your connector.
///
/// Connectors configured using the older console and API architecture will
/// continue to function as configured. However, you won’t be able to edit or
/// update them. If you want to edit or update your connector configuration, you
/// must create a new connector.
///
/// We recommended migrating your connector workflow to the upgraded version.
/// Support for connectors configured using the older architecture is scheduled
/// to end by June 2024.
/// </note>
class SlackConfiguration {
  /// The Amazon Resource Name (ARN) of an Secrets Manager secret that contains
  /// the key-value pairs required to connect to your Slack workspace team. The
  /// secret must contain a JSON structure with the following keys:
  ///
  /// <ul>
  /// <li>
  /// slackToken—The user or bot token created in Slack. For more information on
  /// creating a token in Slack, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/data-source-slack.html#slack-authentication">Authentication
  /// for a Slack data source</a>.
  /// </li>
  /// </ul>
  final String secretArn;

  /// The date to start crawling your data from your Slack workspace team. The
  /// date must follow this format: <code>yyyy-mm-dd</code>.
  final String sinceCrawlDate;

  /// Specify whether to index public channels, private channels, group messages,
  /// and direct messages. You can specify one or more of these options.
  final List<SlackEntity> slackEntityList;

  /// The identifier of the team in the Slack workspace. For example,
  /// <i>T0123456789</i>.
  ///
  /// You can find your team ID in the URL of the main page of your Slack
  /// workspace. When you log in to Slack via a browser, you are directed to the
  /// URL of the main page. For example,
  /// <i>https://app.slack.com/client/<b>T0123456789</b>/...</i>.
  final String teamId;

  /// <code>TRUE</code> to index bot messages from your Slack workspace team.
  final bool? crawlBotMessage;

  /// <code>TRUE</code> to exclude archived messages to index from your Slack
  /// workspace team.
  final bool? excludeArchived;

  /// A list of regular expression patterns to exclude certain attached files in
  /// your Slack workspace team. Files that match the patterns are excluded from
  /// the index. Files that don’t match the patterns are included in the index. If
  /// a file matches both an inclusion and exclusion pattern, the exclusion
  /// pattern takes precedence and the file isn't included in the index.
  final List<String>? exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map Slack
  /// data source attributes or field names to Amazon Kendra index field names. To
  /// create custom fields, use the <code>UpdateIndex</code> API before you map to
  /// Slack fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Slack data source field names must exist in your
  /// Slack custom metadata.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns to include certain attached files in
  /// your Slack workspace team. Files that match the patterns are included in the
  /// index. Files that don't match the patterns are excluded from the index. If a
  /// file matches both an inclusion and exclusion pattern, the exclusion pattern
  /// takes precedence and the file isn't included in the index.
  final List<String>? inclusionPatterns;

  /// The number of hours for change log to look back from when you last
  /// synchronized your data. You can look back up to 7 days or 168 hours.
  ///
  /// Change log updates your index only if new content was added since you last
  /// synced your data. Updated or deleted content from before you last synced
  /// does not get updated in your index. To capture updated or deleted content
  /// before you last synced, set the <code>LookBackPeriod</code> to the number of
  /// hours you want change log to look back.
  final int? lookBackPeriod;

  /// The list of private channel names from your Slack workspace team. You use
  /// this if you want to index specific private channels, not all private
  /// channels. You can also use regular expression patterns to filter private
  /// channels.
  final List<String>? privateChannelFilter;

  /// The list of public channel names to index from your Slack workspace team.
  /// You use this if you want to index specific public channels, not all public
  /// channels. You can also use regular expression patterns to filter public
  /// channels.
  final List<String>? publicChannelFilter;

  /// <code>TRUE</code> to use the Slack change log to determine which documents
  /// require updating in the index. Depending on the Slack change log's size, it
  /// may take longer for Amazon Kendra to use the change log than to scan all of
  /// your documents in Slack.
  final bool? useChangeLog;

  /// Configuration information for an Amazon Virtual Private Cloud to connect to
  /// your Slack. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/vpc-configuration.html">Configuring
  /// a VPC</a>.
  final DataSourceVpcConfiguration? vpcConfiguration;

  SlackConfiguration({
    required this.secretArn,
    required this.sinceCrawlDate,
    required this.slackEntityList,
    required this.teamId,
    this.crawlBotMessage,
    this.excludeArchived,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
    this.lookBackPeriod,
    this.privateChannelFilter,
    this.publicChannelFilter,
    this.useChangeLog,
    this.vpcConfiguration,
  });

  factory SlackConfiguration.fromJson(Map<String, dynamic> json) {
    return SlackConfiguration(
      secretArn: json['SecretArn'] as String,
      sinceCrawlDate: json['SinceCrawlDate'] as String,
      slackEntityList: (json['SlackEntityList'] as List)
          .whereNotNull()
          .map((e) => (e as String).toSlackEntity())
          .toList(),
      teamId: json['TeamId'] as String,
      crawlBotMessage: json['CrawlBotMessage'] as bool?,
      excludeArchived: json['ExcludeArchived'] as bool?,
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
      lookBackPeriod: json['LookBackPeriod'] as int?,
      privateChannelFilter: (json['PrivateChannelFilter'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      publicChannelFilter: (json['PublicChannelFilter'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      useChangeLog: json['UseChangeLog'] as bool?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? DataSourceVpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final secretArn = this.secretArn;
    final sinceCrawlDate = this.sinceCrawlDate;
    final slackEntityList = this.slackEntityList;
    final teamId = this.teamId;
    final crawlBotMessage = this.crawlBotMessage;
    final excludeArchived = this.excludeArchived;
    final exclusionPatterns = this.exclusionPatterns;
    final fieldMappings = this.fieldMappings;
    final inclusionPatterns = this.inclusionPatterns;
    final lookBackPeriod = this.lookBackPeriod;
    final privateChannelFilter = this.privateChannelFilter;
    final publicChannelFilter = this.publicChannelFilter;
    final useChangeLog = this.useChangeLog;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      'SecretArn': secretArn,
      'SinceCrawlDate': sinceCrawlDate,
      'SlackEntityList': slackEntityList.map((e) => e.toValue()).toList(),
      'TeamId': teamId,
      if (crawlBotMessage != null) 'CrawlBotMessage': crawlBotMessage,
      if (excludeArchived != null) 'ExcludeArchived': excludeArchived,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (lookBackPeriod != null) 'LookBackPeriod': lookBackPeriod,
      if (privateChannelFilter != null)
        'PrivateChannelFilter': privateChannelFilter,
      if (publicChannelFilter != null)
        'PublicChannelFilter': publicChannelFilter,
      if (useChangeLog != null) 'UseChangeLog': useChangeLog,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

enum SlackEntity {
  publicChannel,
  privateChannel,
  groupMessage,
  directMessage,
}

extension SlackEntityValueExtension on SlackEntity {
  String toValue() {
    switch (this) {
      case SlackEntity.publicChannel:
        return 'PUBLIC_CHANNEL';
      case SlackEntity.privateChannel:
        return 'PRIVATE_CHANNEL';
      case SlackEntity.groupMessage:
        return 'GROUP_MESSAGE';
      case SlackEntity.directMessage:
        return 'DIRECT_MESSAGE';
    }
  }
}

extension SlackEntityFromString on String {
  SlackEntity toSlackEntity() {
    switch (this) {
      case 'PUBLIC_CHANNEL':
        return SlackEntity.publicChannel;
      case 'PRIVATE_CHANNEL':
        return SlackEntity.privateChannel;
      case 'GROUP_MESSAGE':
        return SlackEntity.groupMessage;
      case 'DIRECT_MESSAGE':
        return SlackEntity.directMessage;
    }
    throw Exception('$this is not known in enum SlackEntity');
  }
}

enum SortOrder {
  desc,
  asc,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.desc:
        return 'DESC';
      case SortOrder.asc:
        return 'ASC';
    }
  }
}

extension SortOrderFromString on String {
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

  Map<String, dynamic> toJson() {
    final documentAttributeKey = this.documentAttributeKey;
    final sortOrder = this.sortOrder;
    return {
      'DocumentAttributeKey': documentAttributeKey,
      'SortOrder': sortOrder.toValue(),
    };
  }
}

/// The document ID and its fields/attributes that are used for a query
/// suggestion, if document fields set to use for query suggestions.
class SourceDocument {
  /// The additional fields/attributes to include in the response. You can use
  /// additional fields to provide extra information in the response. Additional
  /// fields are not used to based suggestions on.
  final List<DocumentAttribute>? additionalAttributes;

  /// The identifier of the document used for a query suggestion.
  final String? documentId;

  /// The document fields/attributes used for a query suggestion.
  final List<String>? suggestionAttributes;

  SourceDocument({
    this.additionalAttributes,
    this.documentId,
    this.suggestionAttributes,
  });

  factory SourceDocument.fromJson(Map<String, dynamic> json) {
    return SourceDocument(
      additionalAttributes: (json['AdditionalAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => DocumentAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      documentId: json['DocumentId'] as String?,
      suggestionAttributes: (json['SuggestionAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalAttributes = this.additionalAttributes;
    final documentId = this.documentId;
    final suggestionAttributes = this.suggestionAttributes;
    return {
      if (additionalAttributes != null)
        'AdditionalAttributes': additionalAttributes,
      if (documentId != null) 'DocumentId': documentId,
      if (suggestionAttributes != null)
        'SuggestionAttributes': suggestionAttributes,
    };
  }
}

/// A query with suggested spell corrections.
class SpellCorrectedQuery {
  /// The corrected misspelled word or words in a query.
  final List<Correction>? corrections;

  /// The query with the suggested spell corrections.
  final String? suggestedQueryText;

  SpellCorrectedQuery({
    this.corrections,
    this.suggestedQueryText,
  });

  factory SpellCorrectedQuery.fromJson(Map<String, dynamic> json) {
    return SpellCorrectedQuery(
      corrections: (json['Corrections'] as List?)
          ?.whereNotNull()
          .map((e) => Correction.fromJson(e as Map<String, dynamic>))
          .toList(),
      suggestedQueryText: json['SuggestedQueryText'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final corrections = this.corrections;
    final suggestedQueryText = this.suggestedQueryText;
    return {
      if (corrections != null) 'Corrections': corrections,
      if (suggestedQueryText != null) 'SuggestedQueryText': suggestedQueryText,
    };
  }
}

/// Provides the configuration information for suggested query spell
/// corrections.
///
/// Suggested spell corrections are based on words that appear in your indexed
/// documents and how closely a corrected word matches a misspelled word.
///
/// This feature is designed with certain defaults or limits. For information on
/// the current limits and how to request more support for some limits, see the
/// <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/query-spell-check.html">Spell
/// Checker documentation</a>.
class SpellCorrectionConfiguration {
  /// <code>TRUE</code> to suggest spell corrections for queries.
  final bool includeQuerySpellCheckSuggestions;

  SpellCorrectionConfiguration({
    required this.includeQuerySpellCheckSuggestions,
  });

  Map<String, dynamic> toJson() {
    final includeQuerySpellCheckSuggestions =
        this.includeQuerySpellCheckSuggestions;
    return {
      'IncludeQuerySpellCheckSuggestions': includeQuerySpellCheckSuggestions,
    };
  }
}

/// Provides the configuration information to use a SQL database.
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
  /// The identifier of the document.
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

/// Provides the configuration information for a document field/attribute that
/// you want to base query suggestions on.
class SuggestableConfig {
  /// The name of the document field/attribute.
  final String? attributeName;

  /// <code>TRUE</code> means the document field/attribute is suggestible, so the
  /// contents within the field can be used for query suggestions.
  final bool? suggestable;

  SuggestableConfig({
    this.attributeName,
    this.suggestable,
  });

  factory SuggestableConfig.fromJson(Map<String, dynamic> json) {
    return SuggestableConfig(
      attributeName: json['AttributeName'] as String?,
      suggestable: json['Suggestable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributeName = this.attributeName;
    final suggestable = this.suggestable;
    return {
      if (attributeName != null) 'AttributeName': attributeName,
      if (suggestable != null) 'Suggestable': suggestable,
    };
  }
}

/// A single query suggestion.
class Suggestion {
  /// The UUID (universally unique identifier) of a single query suggestion.
  final String? id;

  /// The list of document IDs and their fields/attributes that are used for a
  /// single query suggestion, if document fields set to use for query
  /// suggestions.
  final List<SourceDocument>? sourceDocuments;

  /// The value for the UUID (universally unique identifier) of a single query
  /// suggestion.
  ///
  /// The value is the text string of a suggestion.
  final SuggestionValue? value;

  Suggestion({
    this.id,
    this.sourceDocuments,
    this.value,
  });

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return Suggestion(
      id: json['Id'] as String?,
      sourceDocuments: (json['SourceDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => SourceDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      value: json['Value'] != null
          ? SuggestionValue.fromJson(json['Value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final sourceDocuments = this.sourceDocuments;
    final value = this.value;
    return {
      if (id != null) 'Id': id,
      if (sourceDocuments != null) 'SourceDocuments': sourceDocuments,
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

enum SuggestionType {
  query,
  documentAttributes,
}

extension SuggestionTypeValueExtension on SuggestionType {
  String toValue() {
    switch (this) {
      case SuggestionType.query:
        return 'QUERY';
      case SuggestionType.documentAttributes:
        return 'DOCUMENT_ATTRIBUTES';
    }
  }
}

extension SuggestionTypeFromString on String {
  SuggestionType toSuggestionType() {
    switch (this) {
      case 'QUERY':
        return SuggestionType.query;
      case 'DOCUMENT_ATTRIBUTES':
        return SuggestionType.documentAttributes;
    }
    throw Exception('$this is not known in enum SuggestionType');
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

/// Provides information about a table cell in a table excerpt.
class TableCell {
  /// <code>TRUE</code> means that the table cell should be treated as a header.
  final bool? header;

  /// <code>TRUE</code> means that the table cell has a high enough confidence and
  /// is relevant to the query, so the value or content should be highlighted.
  final bool? highlighted;

  /// <code>TRUE</code> if the response of the table cell is the top answer. This
  /// is the cell value or content with the highest confidence score or is the
  /// most relevant to the query.
  final bool? topAnswer;

  /// The actual value or content within a table cell. A table cell could contain
  /// a date value of a year, or a string value of text, for example.
  final String? value;

  TableCell({
    this.header,
    this.highlighted,
    this.topAnswer,
    this.value,
  });

  factory TableCell.fromJson(Map<String, dynamic> json) {
    return TableCell(
      header: json['Header'] as bool?,
      highlighted: json['Highlighted'] as bool?,
      topAnswer: json['TopAnswer'] as bool?,
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final header = this.header;
    final highlighted = this.highlighted;
    final topAnswer = this.topAnswer;
    final value = this.value;
    return {
      if (header != null) 'Header': header,
      if (highlighted != null) 'Highlighted': highlighted,
      if (topAnswer != null) 'TopAnswer': topAnswer,
      if (value != null) 'Value': value,
    };
  }
}

/// An excerpt from a table within a document. The table excerpt displays up to
/// five columns and three rows, depending on how many table cells are relevant
/// to the query and how many columns are available in the original table. The
/// top most relevant cell is displayed in the table excerpt, along with the
/// next most relevant cells.
class TableExcerpt {
  /// A list of rows in the table excerpt.
  final List<TableRow>? rows;

  /// A count of the number of rows in the original table within the document.
  final int? totalNumberOfRows;

  TableExcerpt({
    this.rows,
    this.totalNumberOfRows,
  });

  factory TableExcerpt.fromJson(Map<String, dynamic> json) {
    return TableExcerpt(
      rows: (json['Rows'] as List?)
          ?.whereNotNull()
          .map((e) => TableRow.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalNumberOfRows: json['TotalNumberOfRows'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final rows = this.rows;
    final totalNumberOfRows = this.totalNumberOfRows;
    return {
      if (rows != null) 'Rows': rows,
      if (totalNumberOfRows != null) 'TotalNumberOfRows': totalNumberOfRows,
    };
  }
}

/// Information about a row in a table excerpt.
class TableRow {
  /// A list of table cells in a row.
  final List<TableCell>? cells;

  TableRow({
    this.cells,
  });

  factory TableRow.fromJson(Map<String, dynamic> json) {
    return TableRow(
      cells: (json['Cells'] as List?)
          ?.whereNotNull()
          .map((e) => TableCell.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cells = this.cells;
    return {
      if (cells != null) 'Cells': cells,
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

/// The template schema used for the data source, where templates schemas are
/// supported.
///
/// See <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/ds-schemas.html">Data
/// source template schemas</a>.
class Template {
  Template();

  factory Template.fromJson(Map<String, dynamic> _) {
    return Template();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Provides a template for the configuration information to connect to your
/// data source.
class TemplateConfiguration {
  /// The template schema used for the data source, where templates schemas are
  /// supported.
  ///
  /// See <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/ds-schemas.html">Data
  /// source template schemas</a>.
  final Template? template;

  TemplateConfiguration({
    this.template,
  });

  factory TemplateConfiguration.fromJson(Map<String, dynamic> json) {
    return TemplateConfiguration(
      template: json['Template'] != null
          ? Template.fromJson(json['Template'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final template = this.template;
    return {
      if (template != null) 'Template': template,
    };
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

extension ThesaurusStatusValueExtension on ThesaurusStatus {
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

extension ThesaurusStatusFromString on String {
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

/// An array of summary information for a thesaurus or multiple thesauri.
class ThesaurusSummary {
  /// The Unix timestamp when the thesaurus was created.
  final DateTime? createdAt;

  /// The identifier of the thesaurus.
  final String? id;

  /// The name of the thesaurus.
  final String? name;

  /// The status of the thesaurus.
  final ThesaurusStatus? status;

  /// The Unix timestamp when the thesaurus was last updated.
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
  /// The Unix timestamp for the end of the time range.
  final DateTime? endTime;

  /// The Unix timestamp for the beginning of the time range.
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

enum Type {
  saas,
  onPremise,
}

extension TypeValueExtension on Type {
  String toValue() {
    switch (this) {
      case Type.saas:
        return 'SAAS';
      case Type.onPremise:
        return 'ON_PREMISE';
    }
  }
}

extension TypeFromString on String {
  Type toType() {
    switch (this) {
      case 'SAAS':
        return Type.saas;
      case 'ON_PREMISE':
        return Type.onPremise;
    }
    throw Exception('$this is not known in enum Type');
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

class UpdateAccessControlConfigurationResponse {
  UpdateAccessControlConfigurationResponse();

  factory UpdateAccessControlConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return UpdateAccessControlConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateFeaturedResultsSetResponse {
  /// Information on the set of featured results. This includes the identifier of
  /// the featured results set, whether the featured results set is active or
  /// inactive, when the featured results set was last updated, and more.
  final FeaturedResultsSet? featuredResultsSet;

  UpdateFeaturedResultsSetResponse({
    this.featuredResultsSet,
  });

  factory UpdateFeaturedResultsSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFeaturedResultsSetResponse(
      featuredResultsSet: json['FeaturedResultsSet'] != null
          ? FeaturedResultsSet.fromJson(
              json['FeaturedResultsSet'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final featuredResultsSet = this.featuredResultsSet;
    return {
      if (featuredResultsSet != null) 'FeaturedResultsSet': featuredResultsSet,
    };
  }
}

/// Provides the configuration information of the URLs to crawl.
///
/// You can only crawl websites that use the secure communication protocol,
/// Hypertext Transfer Protocol Secure (HTTPS). If you receive an error when
/// crawling a website, it could be that the website is blocked from crawling.
///
/// <i>When selecting websites to index, you must adhere to the <a
/// href="https://aws.amazon.com/aup/">Amazon Acceptable Use Policy</a> and all
/// other Amazon terms. Remember that you must only use Amazon Kendra Web
/// Crawler to index your own web pages, or web pages that you have
/// authorization to index.</i>
class Urls {
  /// Configuration of the seed or starting point URLs of the websites you want to
  /// crawl.
  ///
  /// You can choose to crawl only the website host names, or the website host
  /// names with subdomains, or the website host names with subdomains and other
  /// domains that the web pages link to.
  ///
  /// You can list up to 100 seed URLs.
  final SeedUrlConfiguration? seedUrlConfiguration;

  /// Configuration of the sitemap URLs of the websites you want to crawl.
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

/// Provides information about the user context for an Amazon Kendra index.
///
/// User context filtering is a kind of personalized search with the benefit of
/// controlling access to documents. For example, not all teams that search the
/// company portal for information should access top-secret company documents,
/// nor are these documents relevant to all users. Only specific users or groups
/// of teams given access to top-secret documents should see these documents in
/// their search results.
///
/// You provide one of the following:
///
/// <ul>
/// <li>
/// User token
/// </li>
/// <li>
/// User ID, the groups the user belongs to, and any data sources the groups can
/// access.
/// </li>
/// </ul>
/// If you provide both, an exception is thrown.
class UserContext {
  /// The list of data source groups you want to filter search results based on
  /// groups' access to documents in that data source.
  final List<DataSourceGroup>? dataSourceGroups;

  /// The list of groups you want to filter search results based on the groups'
  /// access to documents.
  final List<String>? groups;

  /// The user context token for filtering search results for a user. It must be a
  /// JWT or a JSON token.
  final String? token;

  /// The identifier of the user you want to filter search results based on their
  /// access to documents.
  final String? userId;

  UserContext({
    this.dataSourceGroups,
    this.groups,
    this.token,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    final dataSourceGroups = this.dataSourceGroups;
    final groups = this.groups;
    final token = this.token;
    final userId = this.userId;
    return {
      if (dataSourceGroups != null) 'DataSourceGroups': dataSourceGroups,
      if (groups != null) 'Groups': groups,
      if (token != null) 'Token': token,
      if (userId != null) 'UserId': userId,
    };
  }
}

enum UserContextPolicy {
  attributeFilter,
  userToken,
}

extension UserContextPolicyValueExtension on UserContextPolicy {
  String toValue() {
    switch (this) {
      case UserContextPolicy.attributeFilter:
        return 'ATTRIBUTE_FILTER';
      case UserContextPolicy.userToken:
        return 'USER_TOKEN';
    }
  }
}

extension UserContextPolicyFromString on String {
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

/// Provides the configuration information to get users and groups from an IAM
/// Identity Center identity source. This is useful for user context filtering,
/// where search results are filtered based on the user or their group access to
/// documents. You can also use the <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/API_PutPrincipalMapping.html">PutPrincipalMapping</a>
/// API to map users to their groups so that you only need to provide the user
/// ID when you issue the query.
///
/// To set up an IAM Identity Center identity source in the console to use with
/// Amazon Kendra, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/getting-started-aws-sso.html">Getting
/// started with an IAM Identity Center identity source</a>. You must also grant
/// the required permissions to use IAM Identity Center with Amazon Kendra. For
/// more information, see <a
/// href="https://docs.aws.amazon.com/kendra/latest/dg/iam-roles.html#iam-roles-aws-sso">IAM
/// roles for IAM Identity Center</a>.
///
/// Amazon Kendra currently does not support using
/// <code>UserGroupResolutionConfiguration</code> with an Amazon Web Services
/// organization member account for your IAM Identity Center identify source.
/// You must create your index in the management account for the organization in
/// order to use <code>UserGroupResolutionConfiguration</code>.
class UserGroupResolutionConfiguration {
  /// The identity store provider (mode) you want to use to get users and groups.
  /// IAM Identity Center is currently the only available mode. Your users and
  /// groups must exist in an IAM Identity Center identity source in order to use
  /// this mode.
  final UserGroupResolutionMode userGroupResolutionMode;

  UserGroupResolutionConfiguration({
    required this.userGroupResolutionMode,
  });

  factory UserGroupResolutionConfiguration.fromJson(Map<String, dynamic> json) {
    return UserGroupResolutionConfiguration(
      userGroupResolutionMode: (json['UserGroupResolutionMode'] as String)
          .toUserGroupResolutionMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final userGroupResolutionMode = this.userGroupResolutionMode;
    return {
      'UserGroupResolutionMode': userGroupResolutionMode.toValue(),
    };
  }
}

enum UserGroupResolutionMode {
  awsSso,
  none,
}

extension UserGroupResolutionModeValueExtension on UserGroupResolutionMode {
  String toValue() {
    switch (this) {
      case UserGroupResolutionMode.awsSso:
        return 'AWS_SSO';
      case UserGroupResolutionMode.none:
        return 'NONE';
    }
  }
}

extension UserGroupResolutionModeFromString on String {
  UserGroupResolutionMode toUserGroupResolutionMode() {
    switch (this) {
      case 'AWS_SSO':
        return UserGroupResolutionMode.awsSso;
      case 'NONE':
        return UserGroupResolutionMode.none;
    }
    throw Exception('$this is not known in enum UserGroupResolutionMode');
  }
}

/// Provides the configuration information for the identifiers of your users.
class UserIdentityConfiguration {
  /// The IAM Identity Center field name that contains the identifiers of your
  /// users, such as their emails. This is used for <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/user-context-filter.html">user
  /// context filtering</a> and for granting access to your Amazon Kendra
  /// experience. You must set up IAM Identity Center with Amazon Kendra. You must
  /// include your users and groups in your Access Control List when you ingest
  /// documents into your index. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/getting-started-aws-sso.html">Getting
  /// started with an IAM Identity Center identity source</a>.
  final String? identityAttributeName;

  UserIdentityConfiguration({
    this.identityAttributeName,
  });

  factory UserIdentityConfiguration.fromJson(Map<String, dynamic> json) {
    return UserIdentityConfiguration(
      identityAttributeName: json['IdentityAttributeName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityAttributeName = this.identityAttributeName;
    return {
      if (identityAttributeName != null)
        'IdentityAttributeName': identityAttributeName,
    };
  }
}

/// Provides the configuration information for a token.
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

/// The warning code and message that explains a problem with a query.
class Warning {
  /// The code used to show the type of warning for the query.
  final WarningCode? code;

  /// The message that explains the problem with the query.
  final String? message;

  Warning({
    this.code,
    this.message,
  });

  factory Warning.fromJson(Map<String, dynamic> json) {
    return Warning(
      code: (json['Code'] as String?)?.toWarningCode(),
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final message = this.message;
    return {
      if (code != null) 'Code': code.toValue(),
      if (message != null) 'Message': message,
    };
  }
}

enum WarningCode {
  queryLanguageInvalidSyntax,
}

extension WarningCodeValueExtension on WarningCode {
  String toValue() {
    switch (this) {
      case WarningCode.queryLanguageInvalidSyntax:
        return 'QUERY_LANGUAGE_INVALID_SYNTAX';
    }
  }
}

extension WarningCodeFromString on String {
  WarningCode toWarningCode() {
    switch (this) {
      case 'QUERY_LANGUAGE_INVALID_SYNTAX':
        return WarningCode.queryLanguageInvalidSyntax;
    }
    throw Exception('$this is not known in enum WarningCode');
  }
}

/// Provides the configuration information required for Amazon Kendra Web
/// Crawler.
class WebCrawlerConfiguration {
  /// Specifies the seed or starting point URLs of the websites or the sitemap
  /// URLs of the websites you want to crawl.
  ///
  /// You can include website subdomains. You can list up to 100 seed URLs and up
  /// to three sitemap URLs.
  ///
  /// You can only crawl websites that use the secure communication protocol,
  /// Hypertext Transfer Protocol Secure (HTTPS). If you receive an error when
  /// crawling a website, it could be that the website is blocked from crawling.
  ///
  /// <i>When selecting websites to index, you must adhere to the <a
  /// href="https://aws.amazon.com/aup/">Amazon Acceptable Use Policy</a> and all
  /// other Amazon terms. Remember that you must only use Amazon Kendra Web
  /// Crawler to index your own web pages, or web pages that you have
  /// authorization to index.</i>
  final Urls urls;

  /// Configuration information required to connect to websites using
  /// authentication.
  ///
  /// You can connect to websites using basic authentication of user name and
  /// password. You use a secret in <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">Secrets
  /// Manager</a> to store your authentication credentials.
  ///
  /// You must provide the website host name and port number. For example, the
  /// host name of https://a.example.com/page1.html is "a.example.com" and the
  /// port is 443, the standard port for HTTPS.
  final AuthenticationConfiguration? authenticationConfiguration;

  /// The 'depth' or number of levels from the seed level to crawl. For example,
  /// the seed URL page is depth 1 and any hyperlinks on this page that are also
  /// crawled are depth 2.
  final int? crawlDepth;

  /// The maximum size (in MB) of a web page or attachment to crawl.
  ///
  /// Files larger than this size (in MB) are skipped/not crawled.
  ///
  /// The default maximum size of a web page or attachment is set to 50 MB.
  final double? maxContentSizePerPageInMegaBytes;

  /// The maximum number of URLs on a web page to include when crawling a website.
  /// This number is per web page.
  ///
  /// As a website’s web pages are crawled, any URLs the web pages link to are
  /// also crawled. URLs on a web page are crawled in order of appearance.
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

  /// Configuration information required to connect to your internal websites via
  /// a web proxy.
  ///
  /// You must provide the website host name and port number. For example, the
  /// host name of https://a.example.com/page1.html is "a.example.com" and the
  /// port is 443, the standard port for HTTPS.
  ///
  /// Web proxy credentials are optional and you can use them to connect to a web
  /// proxy server that requires basic authentication. To store web proxy
  /// credentials, you use a secret in <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/userguide/intro.html">Secrets
  /// Manager</a>.
  final ProxyConfiguration? proxyConfiguration;

  /// A list of regular expression patterns to exclude certain URLs to crawl. URLs
  /// that match the patterns are excluded from the index. URLs that don't match
  /// the patterns are included in the index. If a URL matches both an inclusion
  /// and exclusion pattern, the exclusion pattern takes precedence and the URL
  /// file isn't included in the index.
  final List<String>? urlExclusionPatterns;

  /// A list of regular expression patterns to include certain URLs to crawl. URLs
  /// that match the patterns are included in the index. URLs that don't match the
  /// patterns are excluded from the index. If a URL matches both an inclusion and
  /// exclusion pattern, the exclusion pattern takes precedence and the URL file
  /// isn't included in the index.
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

extension WebCrawlerModeValueExtension on WebCrawlerMode {
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

extension WebCrawlerModeFromString on String {
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

/// Provides the configuration information to connect to Amazon WorkDocs as your
/// data source.
///
/// Amazon WorkDocs connector is available in Oregon, North Virginia, Sydney,
/// Singapore and Ireland regions.
class WorkDocsConfiguration {
  /// The identifier of the directory corresponding to your Amazon WorkDocs site
  /// repository.
  ///
  /// You can find the organization ID in the <a
  /// href="https://console.aws.amazon.com/directoryservicev2/">Directory
  /// Service</a> by going to <b>Active Directory</b>, then <b>Directories</b>.
  /// Your Amazon WorkDocs site directory has an ID, which is the organization ID.
  /// You can also set up a new Amazon WorkDocs directory in the Directory Service
  /// console and enable a Amazon WorkDocs site for the directory in the Amazon
  /// WorkDocs console.
  final String organizationId;

  /// <code>TRUE</code> to include comments on documents in your index. Including
  /// comments in your index means each comment is a document that can be searched
  /// on.
  ///
  /// The default is set to <code>FALSE</code>.
  final bool? crawlComments;

  /// A list of regular expression patterns to exclude certain files in your
  /// Amazon WorkDocs site repository. Files that match the patterns are excluded
  /// from the index. Files that don’t match the patterns are included in the
  /// index. If a file matches both an inclusion and exclusion pattern, the
  /// exclusion pattern takes precedence and the file isn't included in the index.
  final List<String>? exclusionPatterns;

  /// A list of <code>DataSourceToIndexFieldMapping</code> objects that map Amazon
  /// WorkDocs data source attributes or field names to Amazon Kendra index field
  /// names. To create custom fields, use the <code>UpdateIndex</code> API before
  /// you map to Amazon WorkDocs fields. For more information, see <a
  /// href="https://docs.aws.amazon.com/kendra/latest/dg/field-mapping.html">Mapping
  /// data source fields</a>. The Amazon WorkDocs data source field names must
  /// exist in your Amazon WorkDocs custom metadata.
  final List<DataSourceToIndexFieldMapping>? fieldMappings;

  /// A list of regular expression patterns to include certain files in your
  /// Amazon WorkDocs site repository. Files that match the patterns are included
  /// in the index. Files that don't match the patterns are excluded from the
  /// index. If a file matches both an inclusion and exclusion pattern, the
  /// exclusion pattern takes precedence and the file isn't included in the index.
  final List<String>? inclusionPatterns;

  /// <code>TRUE</code> to use the Amazon WorkDocs change log to determine which
  /// documents require updating in the index. Depending on the change log's size,
  /// it may take longer for Amazon Kendra to use the change log than to scan all
  /// of your documents in Amazon WorkDocs.
  final bool? useChangeLog;

  WorkDocsConfiguration({
    required this.organizationId,
    this.crawlComments,
    this.exclusionPatterns,
    this.fieldMappings,
    this.inclusionPatterns,
    this.useChangeLog,
  });

  factory WorkDocsConfiguration.fromJson(Map<String, dynamic> json) {
    return WorkDocsConfiguration(
      organizationId: json['OrganizationId'] as String,
      crawlComments: json['CrawlComments'] as bool?,
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
      useChangeLog: json['UseChangeLog'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final organizationId = this.organizationId;
    final crawlComments = this.crawlComments;
    final exclusionPatterns = this.exclusionPatterns;
    final fieldMappings = this.fieldMappings;
    final inclusionPatterns = this.inclusionPatterns;
    final useChangeLog = this.useChangeLog;
    return {
      'OrganizationId': organizationId,
      if (crawlComments != null) 'CrawlComments': crawlComments,
      if (exclusionPatterns != null) 'ExclusionPatterns': exclusionPatterns,
      if (fieldMappings != null) 'FieldMappings': fieldMappings,
      if (inclusionPatterns != null) 'InclusionPatterns': inclusionPatterns,
      if (useChangeLog != null) 'UseChangeLog': useChangeLog,
    };
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

class FeaturedResultsConflictException extends _s.GenericAwsException {
  FeaturedResultsConflictException({String? type, String? message})
      : super(
            type: type,
            code: 'FeaturedResultsConflictException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
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
  'FeaturedResultsConflictException': (type, message) =>
      FeaturedResultsConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
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
