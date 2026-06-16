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

/// The Application Migration Service service.
class Mgn {
  final _s.RestJsonProtocol _protocol;
  Mgn({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mgn',
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

  /// Initialize Application Migration Service.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  Future<void> initializeService() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/InitializeService',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists import file enrichment jobs with optional filtering by job IDs.
  ///
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing import file enrichment jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListImportFileEnrichmentsResponse> listImportFileEnrichments({
    ListImportFileEnrichmentsFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListImportFileEnrichments',
      exceptionFnMap: _exceptionFns,
    );
    return ListImportFileEnrichmentsResponse.fromJson(response);
  }

  /// List Managed Accounts.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// List managed accounts request max results.
  ///
  /// Parameter [nextToken] :
  /// List managed accounts request next token.
  Future<ListManagedAccountsResponse> listManagedAccounts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListManagedAccounts',
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedAccountsResponse.fromJson(response);
  }

  /// List all tags for your Application Migration Service resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// List tags for resource request by ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Starts an import file enrichment job to process and enrich network
  /// migration import files with additional metadata and IP assignment
  /// strategies.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [s3BucketSource] :
  /// The S3 configuration specifying the source location of the import file to
  /// be enriched.
  ///
  /// Parameter [s3BucketTarget] :
  /// The S3 configuration specifying the target location where the enriched
  /// import file will be stored.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [ipAssignmentStrategy] :
  /// The IP assignment strategy to use when enriching the import file. Can be
  /// STATIC or DYNAMIC.
  Future<StartImportFileEnrichmentResponse> startImportFileEnrichment({
    required EnrichmentSourceS3Configuration s3BucketSource,
    required EnrichmentTargetS3Configuration s3BucketTarget,
    String? clientToken,
    IpAssignmentStrategy? ipAssignmentStrategy,
  }) async {
    final $payload = <String, dynamic>{
      's3BucketSource': s3BucketSource,
      's3BucketTarget': s3BucketTarget,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (ipAssignmentStrategy != null)
        'ipAssignmentStrategy': ipAssignmentStrategy.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/StartImportFileEnrichment',
      exceptionFnMap: _exceptionFns,
    );
    return StartImportFileEnrichmentResponse.fromJson(response);
  }

  /// Adds or overwrites only the specified tags for the specified Application
  /// Migration Service resource or resources. When you specify an existing tag
  /// key, the value is overwritten with the new value. Each resource can have a
  /// maximum of 50 tags. Each tag consists of a key and optional value.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Tag resource by ARN.
  ///
  /// Parameter [tags] :
  /// Tag resource by Tags.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified set of tags from the specified set of Application
  /// Migration Service resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// Untag resource by ARN.
  ///
  /// Parameter [tagKeys] :
  /// Untag resource by Keys.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Create application.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [name] :
  /// Application name.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  ///
  /// Parameter [description] :
  /// Application description.
  ///
  /// Parameter [tags] :
  /// Application tags.
  Future<Application> createApplication({
    required String name,
    String? accountID,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (accountID != null) 'accountID': accountID,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateApplication',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Delete application.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> deleteApplication({
    required String applicationID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteApplication',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves all applications or multiple applications by ID.
  ///
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [accountID] :
  /// Applications list Account ID.
  ///
  /// Parameter [filters] :
  /// Applications list filters.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to return when listing applications.
  ///
  /// Parameter [nextToken] :
  /// Request next token.
  Future<ListApplicationsResponse> listApplications({
    String? accountID,
    ListApplicationsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (accountID != null) 'accountID': accountID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListApplications',
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Archive application.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<Application> archiveApplication({
    required String applicationID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ArchiveApplication',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Associate source servers to application.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [sourceServerIDs] :
  /// Source server IDs list.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> associateSourceServers({
    required String applicationID,
    required List<String> sourceServerIDs,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/AssociateSourceServers',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociate source servers from application.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [sourceServerIDs] :
  /// Source server IDs list.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> disassociateSourceServers({
    required String applicationID,
    required List<String> sourceServerIDs,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisassociateSourceServers',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Unarchive application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<Application> unarchiveApplication({
    required String applicationID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UnarchiveApplication',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Update application.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  ///
  /// Parameter [description] :
  /// Application description.
  ///
  /// Parameter [name] :
  /// Application name.
  Future<Application> updateApplication({
    required String applicationID,
    String? accountID,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      if (accountID != null) 'accountID': accountID,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateApplication',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Create Connector.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// Create Connector request name.
  ///
  /// Parameter [ssmInstanceID] :
  /// Create Connector request SSM instance ID.
  ///
  /// Parameter [ssmCommandConfig] :
  /// Create Connector request SSM command config.
  ///
  /// Parameter [tags] :
  /// Create Connector request tags.
  Future<Connector> createConnector({
    required String name,
    required String ssmInstanceID,
    ConnectorSsmCommandConfig? ssmCommandConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'ssmInstanceID': ssmInstanceID,
      if (ssmCommandConfig != null) 'ssmCommandConfig': ssmCommandConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateConnector',
      exceptionFnMap: _exceptionFns,
    );
    return Connector.fromJson(response);
  }

  /// Update Connector.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorID] :
  /// Update Connector request connector ID.
  ///
  /// Parameter [name] :
  /// Update Connector request name.
  ///
  /// Parameter [ssmCommandConfig] :
  /// Update Connector request SSM command config.
  Future<Connector> updateConnector({
    required String connectorID,
    String? name,
    ConnectorSsmCommandConfig? ssmCommandConfig,
  }) async {
    final $payload = <String, dynamic>{
      'connectorID': connectorID,
      if (name != null) 'name': name,
      if (ssmCommandConfig != null) 'ssmCommandConfig': ssmCommandConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateConnector',
      exceptionFnMap: _exceptionFns,
    );
    return Connector.fromJson(response);
  }

  /// Delete Connector.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorID] :
  /// Delete Connector request connector ID.
  Future<void> deleteConnector({
    required String connectorID,
  }) async {
    final $payload = <String, dynamic>{
      'connectorID': connectorID,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteConnector',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List Connectors.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// List Connectors Request filters.
  ///
  /// Parameter [maxResults] :
  /// List Connectors Request max results.
  ///
  /// Parameter [nextToken] :
  /// List Connectors Request next token.
  Future<ListConnectorsResponse> listConnectors({
    ListConnectorsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListConnectors',
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorsResponse.fromJson(response);
  }

  /// Start export.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [s3Bucket] :
  /// Start export request s3 bucket.
  ///
  /// Parameter [s3Key] :
  /// Start export request s3key.
  ///
  /// Parameter [s3BucketOwner] :
  /// Start export request s3 bucket owner.
  ///
  /// Parameter [tags] :
  /// Start import request tags.
  Future<StartExportResponse> startExport({
    required String s3Bucket,
    required String s3Key,
    String? s3BucketOwner,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      's3Bucket': s3Bucket,
      's3Key': s3Key,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartExport',
      exceptionFnMap: _exceptionFns,
    );
    return StartExportResponse.fromJson(response);
  }

  /// List exports.
  ///
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [maxResults] :
  /// List export request max results.
  ///
  /// Parameter [nextToken] :
  /// List export request next token.
  Future<ListExportsResponse> listExports({
    ListExportsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListExports',
      exceptionFnMap: _exceptionFns,
    );
    return ListExportsResponse.fromJson(response);
  }

  /// List export errors.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportID] :
  /// List export errors request export id.
  ///
  /// Parameter [maxResults] :
  /// List export errors request max results.
  ///
  /// Parameter [nextToken] :
  /// List export errors request next token.
  Future<ListExportErrorsResponse> listExportErrors({
    required String exportID,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'exportID': exportID,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListExportErrors',
      exceptionFnMap: _exceptionFns,
    );
    return ListExportErrorsResponse.fromJson(response);
  }

  /// Start import.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [s3BucketSource] :
  /// Start import request s3 bucket source.
  ///
  /// Parameter [clientToken] :
  /// Start import request client token.
  ///
  /// Parameter [tags] :
  /// Start import request tags.
  Future<StartImportResponse> startImport({
    required S3BucketSource s3BucketSource,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      's3BucketSource': s3BucketSource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartImport',
      exceptionFnMap: _exceptionFns,
    );
    return StartImportResponse.fromJson(response);
  }

  /// List imports.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// List imports request filters.
  ///
  /// Parameter [maxResults] :
  /// List imports request max results.
  ///
  /// Parameter [nextToken] :
  /// List imports request next token.
  Future<ListImportsResponse> listImports({
    ListImportsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImports',
      exceptionFnMap: _exceptionFns,
    );
    return ListImportsResponse.fromJson(response);
  }

  /// List import errors.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [importID] :
  /// List import errors request import id.
  ///
  /// Parameter [maxResults] :
  /// List import errors request max results.
  ///
  /// Parameter [nextToken] :
  /// List import errors request next token.
  Future<ListImportErrorsResponse> listImportErrors({
    required String importID,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'importID': importID,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImportErrors',
      exceptionFnMap: _exceptionFns,
    );
    return ListImportErrorsResponse.fromJson(response);
  }

  /// Deletes a single Job by ID.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [jobID] :
  /// Request to delete Job from service by Job ID.
  ///
  /// Parameter [accountID] :
  /// Request to delete Job from service by Account ID.
  Future<void> deleteJob({
    required String jobID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'jobID': jobID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of Jobs. Use the JobsID and fromDate and toData filters to
  /// limit which jobs are returned. The response is sorted by creationDataTime
  /// - latest date first. Jobs are normally created by the StartTest,
  /// StartCutover, and TerminateTargetInstances APIs. Jobs are also created by
  /// DiagnosticLaunch and TerminateDiagnosticInstances, which are APIs
  /// available only to *Support* and only used in response to relevant support
  /// tickets.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountID] :
  /// Request to describe job log items by Account ID.
  ///
  /// Parameter [filters] :
  /// Request to describe Job log filters.
  ///
  /// Parameter [maxResults] :
  /// Request to describe job log items by max results.
  ///
  /// Parameter [nextToken] :
  /// Request to describe job log items by next token.
  Future<DescribeJobsResponse> describeJobs({
    String? accountID,
    DescribeJobsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (accountID != null) 'accountID': accountID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeJobs',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobsResponse.fromJson(response);
  }

  /// Retrieves detailed job log items with paging.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobID] :
  /// Request to describe Job log job ID.
  ///
  /// Parameter [accountID] :
  /// Request to describe Job log Account ID.
  ///
  /// Parameter [maxResults] :
  /// Request to describe Job log item maximum results.
  ///
  /// Parameter [nextToken] :
  /// Request to describe Job log next token.
  Future<DescribeJobLogItemsResponse> describeJobLogItems({
    required String jobID,
    String? accountID,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'jobID': jobID,
      if (accountID != null) 'accountID': accountID,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeJobLogItems',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobLogItemsResponse.fromJson(response);
  }

  /// Creates a new Launch Configuration Template.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [associatePublicIpAddress] :
  /// Associate public Ip address.
  ///
  /// Parameter [bootMode] :
  /// Launch configuration template boot mode.
  ///
  /// Parameter [copyPrivateIp] :
  /// Copy private Ip.
  ///
  /// Parameter [copyTags] :
  /// Copy tags.
  ///
  /// Parameter [enableMapAutoTagging] :
  /// Enable map auto tagging.
  ///
  /// Parameter [enableParametersEncryption] :
  /// Enable parameters encryption.
  ///
  /// Parameter [largeVolumeConf] :
  /// Large volume config.
  ///
  /// Parameter [launchDisposition] :
  /// Launch disposition.
  ///
  /// Parameter [mapAutoTaggingMpeID] :
  /// Launch configuration template map auto tagging MPE ID.
  ///
  /// Parameter [parametersEncryptionKey] :
  /// Parameters encryption key.
  ///
  /// Parameter [postLaunchActions] :
  /// Launch configuration template post launch actions.
  ///
  /// Parameter [smallVolumeConf] :
  /// Small volume config.
  ///
  /// Parameter [smallVolumeMaxSize] :
  /// Small volume maximum size.
  ///
  /// Parameter [tags] :
  /// Request to associate tags during creation of a Launch Configuration
  /// Template.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Target instance type right-sizing method.
  Future<LaunchConfigurationTemplate> createLaunchConfigurationTemplate({
    bool? associatePublicIpAddress,
    BootMode? bootMode,
    bool? copyPrivateIp,
    bool? copyTags,
    bool? enableMapAutoTagging,
    bool? enableParametersEncryption,
    LaunchTemplateDiskConf? largeVolumeConf,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    String? mapAutoTaggingMpeID,
    String? parametersEncryptionKey,
    PostLaunchActions? postLaunchActions,
    LaunchTemplateDiskConf? smallVolumeConf,
    int? smallVolumeMaxSize,
    Map<String, String>? tags,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    _s.validateNumRange(
      'smallVolumeMaxSize',
      smallVolumeMaxSize,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (associatePublicIpAddress != null)
        'associatePublicIpAddress': associatePublicIpAddress,
      if (bootMode != null) 'bootMode': bootMode.value,
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (enableParametersEncryption != null)
        'enableParametersEncryption': enableParametersEncryption,
      if (largeVolumeConf != null) 'largeVolumeConf': largeVolumeConf,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.value,
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
      if (parametersEncryptionKey != null)
        'parametersEncryptionKey': parametersEncryptionKey,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (smallVolumeConf != null) 'smallVolumeConf': smallVolumeConf,
      if (smallVolumeMaxSize != null) 'smallVolumeMaxSize': smallVolumeMaxSize,
      if (tags != null) 'tags': tags,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateLaunchConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return LaunchConfigurationTemplate.fromJson(response);
  }

  /// Updates an existing Launch Configuration Template by ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch Configuration Template ID.
  ///
  /// Parameter [associatePublicIpAddress] :
  /// Associate public Ip address.
  ///
  /// Parameter [bootMode] :
  /// Launch configuration template boot mode.
  ///
  /// Parameter [copyPrivateIp] :
  /// Copy private Ip.
  ///
  /// Parameter [copyTags] :
  /// Copy tags.
  ///
  /// Parameter [enableMapAutoTagging] :
  /// Enable map auto tagging.
  ///
  /// Parameter [enableParametersEncryption] :
  /// Enable parameters encryption.
  ///
  /// Parameter [largeVolumeConf] :
  /// Large volume config.
  ///
  /// Parameter [launchDisposition] :
  /// Launch disposition.
  ///
  /// Parameter [mapAutoTaggingMpeID] :
  /// Launch configuration template map auto tagging MPE ID.
  ///
  /// Parameter [parametersEncryptionKey] :
  /// Parameters encryption key.
  ///
  /// Parameter [postLaunchActions] :
  /// Post Launch Action to execute on the Test or Cutover instance.
  ///
  /// Parameter [smallVolumeConf] :
  /// Small volume config.
  ///
  /// Parameter [smallVolumeMaxSize] :
  /// Small volume maximum size.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Target instance type right-sizing method.
  Future<LaunchConfigurationTemplate> updateLaunchConfigurationTemplate({
    required String launchConfigurationTemplateID,
    bool? associatePublicIpAddress,
    BootMode? bootMode,
    bool? copyPrivateIp,
    bool? copyTags,
    bool? enableMapAutoTagging,
    bool? enableParametersEncryption,
    LaunchTemplateDiskConf? largeVolumeConf,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    String? mapAutoTaggingMpeID,
    String? parametersEncryptionKey,
    PostLaunchActions? postLaunchActions,
    LaunchTemplateDiskConf? smallVolumeConf,
    int? smallVolumeMaxSize,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    _s.validateNumRange(
      'smallVolumeMaxSize',
      smallVolumeMaxSize,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (associatePublicIpAddress != null)
        'associatePublicIpAddress': associatePublicIpAddress,
      if (bootMode != null) 'bootMode': bootMode.value,
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (enableParametersEncryption != null)
        'enableParametersEncryption': enableParametersEncryption,
      if (largeVolumeConf != null) 'largeVolumeConf': largeVolumeConf,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.value,
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
      if (parametersEncryptionKey != null)
        'parametersEncryptionKey': parametersEncryptionKey,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (smallVolumeConf != null) 'smallVolumeConf': smallVolumeConf,
      if (smallVolumeMaxSize != null) 'smallVolumeMaxSize': smallVolumeMaxSize,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLaunchConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return LaunchConfigurationTemplate.fromJson(response);
  }

  /// Deletes a single Launch Configuration Template by ID.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// ID of resource to be deleted.
  Future<void> deleteLaunchConfigurationTemplate({
    required String launchConfigurationTemplateID,
  }) async {
    final $payload = <String, dynamic>{
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteLaunchConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all Launch Configuration Templates, filtered by Launch Configuration
  /// Template IDs
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [launchConfigurationTemplateIDs] :
  /// Request to filter Launch Configuration Templates list by Launch
  /// Configuration Template ID.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to be returned in DescribeLaunchConfigurationTemplates.
  ///
  /// Parameter [nextToken] :
  /// Next pagination token returned from DescribeLaunchConfigurationTemplates.
  Future<DescribeLaunchConfigurationTemplatesResponse>
      describeLaunchConfigurationTemplates({
    List<String>? launchConfigurationTemplateIDs,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (launchConfigurationTemplateIDs != null)
        'launchConfigurationTemplateIDs': launchConfigurationTemplateIDs,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeLaunchConfigurationTemplates',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLaunchConfigurationTemplatesResponse.fromJson(response);
  }

  /// List template post migration custom actions.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch configuration template ID.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing template post migration custom actions.
  ///
  /// Parameter [maxResults] :
  /// Maximum amount of items to return when listing template post migration
  /// custom actions.
  ///
  /// Parameter [nextToken] :
  /// Next token to use when listing template post migration custom actions.
  Future<ListTemplateActionsResponse> listTemplateActions({
    required String launchConfigurationTemplateID,
    TemplateActionsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTemplateActions',
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplateActionsResponse.fromJson(response);
  }

  /// Put template post migration custom action.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionID] :
  /// Template post migration custom action ID.
  ///
  /// Parameter [actionName] :
  /// Template post migration custom action name.
  ///
  /// Parameter [documentIdentifier] :
  /// Template post migration custom action document identifier.
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch configuration template ID.
  ///
  /// Parameter [order] :
  /// Template post migration custom action order.
  ///
  /// Parameter [active] :
  /// Template post migration custom action active status.
  ///
  /// Parameter [category] :
  /// Template post migration custom action category.
  ///
  /// Parameter [description] :
  /// Template post migration custom action description.
  ///
  /// Parameter [documentVersion] :
  /// Template post migration custom action document version.
  ///
  /// Parameter [externalParameters] :
  /// Template post migration custom action external parameters.
  ///
  /// Parameter [mustSucceedForCutover] :
  /// Template post migration custom action must succeed for cutover.
  ///
  /// Parameter [operatingSystem] :
  /// Operating system eligible for this template post migration custom action.
  ///
  /// Parameter [parameters] :
  /// Template post migration custom action parameters.
  ///
  /// Parameter [timeoutSeconds] :
  /// Template post migration custom action timeout in seconds.
  Future<TemplateActionDocument> putTemplateAction({
    required String actionID,
    required String actionName,
    required String documentIdentifier,
    required String launchConfigurationTemplateID,
    required int order,
    bool? active,
    ActionCategory? category,
    String? description,
    String? documentVersion,
    Map<String, SsmExternalParameter>? externalParameters,
    bool? mustSucceedForCutover,
    String? operatingSystem,
    Map<String, List<SsmParameterStoreParameter>>? parameters,
    int? timeoutSeconds,
  }) async {
    _s.validateNumRange(
      'order',
      order,
      1001,
      10000,
      isRequired: true,
    );
    _s.validateNumRange(
      'timeoutSeconds',
      timeoutSeconds,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'actionID': actionID,
      'actionName': actionName,
      'documentIdentifier': documentIdentifier,
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      'order': order,
      if (active != null) 'active': active,
      if (category != null) 'category': category.value,
      if (description != null) 'description': description,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (operatingSystem != null) 'operatingSystem': operatingSystem,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutTemplateAction',
      exceptionFnMap: _exceptionFns,
    );
    return TemplateActionDocument.fromJson(response);
  }

  /// Remove template post migration custom action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionID] :
  /// Template post migration custom action ID to remove.
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch configuration template ID of the post migration custom action to
  /// remove.
  Future<void> removeTemplateAction({
    required String actionID,
    required String launchConfigurationTemplateID,
  }) async {
    final $payload = <String, dynamic>{
      'actionID': actionID,
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RemoveTemplateAction',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new network migration definition that specifies the source and
  /// target network configuration for a migration.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the network migration definition.
  ///
  /// Parameter [targetNetwork] :
  /// The target network configuration including topology and CIDR ranges.
  ///
  /// Parameter [targetS3Configuration] :
  /// The S3 configuration for storing the target network artifacts.
  ///
  /// Parameter [description] :
  /// A description of the network migration definition.
  ///
  /// Parameter [scopeTags] :
  /// Scope tags for the network migration definition to control access and
  /// organization.
  ///
  /// Parameter [sourceConfigurations] :
  /// A list of source configurations for the network migration.
  ///
  /// Parameter [tags] :
  /// Tags to assign to the network migration definition.
  ///
  /// Parameter [targetDeployment] :
  /// The target deployment configuration for the migrated network.
  Future<NetworkMigrationDefinition> createNetworkMigrationDefinition({
    required String name,
    required TargetNetwork targetNetwork,
    required TargetS3Configuration targetS3Configuration,
    String? description,
    Map<String, String>? scopeTags,
    List<SourceConfiguration>? sourceConfigurations,
    Map<String, String>? tags,
    TargetDeployment? targetDeployment,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'targetNetwork': targetNetwork,
      'targetS3Configuration': targetS3Configuration,
      if (description != null) 'description': description,
      if (scopeTags != null) 'scopeTags': scopeTags,
      if (sourceConfigurations != null)
        'sourceConfigurations': sourceConfigurations,
      if (tags != null) 'tags': tags,
      if (targetDeployment != null) 'targetDeployment': targetDeployment.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/CreateNetworkMigrationDefinition',
      exceptionFnMap: _exceptionFns,
    );
    return NetworkMigrationDefinition.fromJson(response);
  }

  /// Updates an existing network migration definition with new source or target
  /// configurations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition to update.
  ///
  /// Parameter [description] :
  /// The updated description of the network migration definition.
  ///
  /// Parameter [name] :
  /// The updated name of the network migration definition.
  ///
  /// Parameter [scopeTags] :
  /// The updated scope tags for the network migration definition.
  ///
  /// Parameter [sourceConfigurations] :
  /// The updated list of source configurations.
  ///
  /// Parameter [targetDeployment] :
  /// The updated target deployment configuration.
  ///
  /// Parameter [targetNetwork] :
  /// The updated target network configuration.
  ///
  /// Parameter [targetS3Configuration] :
  /// The updated S3 configuration for storing the target network artifacts.
  Future<NetworkMigrationDefinition> updateNetworkMigrationDefinition({
    required String networkMigrationDefinitionID,
    String? description,
    String? name,
    Map<String, String>? scopeTags,
    List<SourceConfiguration>? sourceConfigurations,
    TargetDeployment? targetDeployment,
    TargetNetworkUpdate? targetNetwork,
    TargetS3ConfigurationUpdate? targetS3Configuration,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (scopeTags != null) 'scopeTags': scopeTags,
      if (sourceConfigurations != null)
        'sourceConfigurations': sourceConfigurations,
      if (targetDeployment != null) 'targetDeployment': targetDeployment.value,
      if (targetNetwork != null) 'targetNetwork': targetNetwork,
      if (targetS3Configuration != null)
        'targetS3Configuration': targetS3Configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/UpdateNetworkMigrationDefinition',
      exceptionFnMap: _exceptionFns,
    );
    return NetworkMigrationDefinition.fromJson(response);
  }

  /// Deletes a network migration definition. This operation removes the
  /// migration definition and all associated metadata.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition to delete.
  Future<void> deleteNetworkMigrationDefinition({
    required String networkMigrationDefinitionID,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/DeleteNetworkMigrationDefinition',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all network migration definitions in the account, with optional
  /// filtering.
  ///
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing network migration definitions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationDefinitionsResponse>
      listNetworkMigrationDefinitions({
    ListNetworkMigrationDefinitionsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationDefinitions',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationDefinitionsResponse.fromJson(response);
  }

  /// Retrieves the details of a network migration definition including source
  /// and target configurations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition to retrieve.
  Future<NetworkMigrationDefinition> getNetworkMigrationDefinition({
    required String networkMigrationDefinitionID,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/GetNetworkMigrationDefinition',
      exceptionFnMap: _exceptionFns,
    );
    return NetworkMigrationDefinition.fromJson(response);
  }

  /// Retrieves detailed information about a specific construct within a mapper
  /// segment, including its properties and configuration data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [constructID] :
  /// The unique identifier of the construct within the segment.
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [segmentID] :
  /// The unique identifier of the mapper segment.
  Future<GetNetworkMigrationMapperSegmentConstructResponse>
      getNetworkMigrationMapperSegmentConstruct({
    required String constructID,
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    required String segmentID,
  }) async {
    final $payload = <String, dynamic>{
      'constructID': constructID,
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      'segmentID': segmentID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/network-migration/GetNetworkMigrationMapperSegmentConstruct',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkMigrationMapperSegmentConstructResponse.fromJson(response);
  }

  /// Lists network migration analysis jobs for a specified execution. Returns
  /// information about analysis job status and results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution to list analyses
  /// for.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing analysis jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationAnalysesResponse> listNetworkMigrationAnalyses({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    ListNetworkMigrationAnalysesFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationAnalyses',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationAnalysesResponse.fromJson(response);
  }

  /// Lists the results of network migration analyses, showing connectivity and
  /// compatibility findings for migrated resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing analysis results, such as VPC IDs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationAnalysisResultsResponse>
      listNetworkMigrationAnalysisResults({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    ListNetworkMigrationAnalysisResultsFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationAnalysisResults',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationAnalysisResultsResponse.fromJson(response);
  }

  /// Lists network migration code generation jobs, which convert network
  /// mappings into infrastructure-as-code templates.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing code generation jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationCodeGenerationsResponse>
      listNetworkMigrationCodeGenerations({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    ListNetworkMigrationCodeGenerationsFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationCodeGenerations',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationCodeGenerationsResponse.fromJson(response);
  }

  /// Lists code generation segments, which represent individual infrastructure
  /// components generated as code templates.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing code generation segments.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationCodeGenerationSegmentsResponse>
      listNetworkMigrationCodeGenerationSegments({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    ListNetworkMigrationCodeGenerationSegmentsFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/network-migration/ListNetworkMigrationCodeGenerationSegments',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationCodeGenerationSegmentsResponse.fromJson(
        response);
  }

  /// Lists CloudFormation stacks that have been deployed as part of the network
  /// migration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationDeployedStacksResponse>
      listNetworkMigrationDeployedStacks({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationDeployedStacks',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationDeployedStacksResponse.fromJson(response);
  }

  /// Lists network migration deployment jobs and their current status.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing deployment jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationDeployerJobResponse>
      listNetworkMigrationDeployments({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    ListNetworkMigrationDeployerJobFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationDeployments',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationDeployerJobResponse.fromJson(response);
  }

  /// Lists network migration execution instances for a given definition,
  /// showing the status and progress of each execution.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition to list
  /// executions for.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing executions, such as status or execution ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationExecutionsResponse>
      listNetworkMigrationExecutions({
    required String networkMigrationDefinitionID,
    ListNetworkMigrationExecutionRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationExecutions',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationExecutionsResponse.fromJson(response);
  }

  /// Lists constructs within a mapper segment, representing individual
  /// infrastructure components like VPCs, subnets, or security groups.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [segmentID] :
  /// The unique identifier of the segment to list constructs for.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing constructs, such as construct type or ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationMapperSegmentConstructsResponse>
      listNetworkMigrationMapperSegmentConstructs({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    required String segmentID,
    ListNetworkMigrationMapperSegmentConstructsFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      'segmentID': segmentID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/network-migration/ListNetworkMigrationMapperSegmentConstructs',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationMapperSegmentConstructsResponse.fromJson(
        response);
  }

  /// Lists mapper segments, which represent logical groupings of network
  /// resources to be migrated together.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing segments.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationMapperSegmentsResponse>
      listNetworkMigrationMapperSegments({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    ListNetworkMigrationMapperSegmentsFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationMapperSegments',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationMapperSegmentsResponse.fromJson(response);
  }

  /// Lists network migration mapping jobs, which analyze and create
  /// relationships between source and target network resources.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing mapping jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationMappingsResponse> listNetworkMigrationMappings({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    ListNetworkMigrationMappingsFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationMappings',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationMappingsResponse.fromJson(response);
  }

  /// Lists mapping update jobs, which apply customer modifications to the
  /// generated network mappings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing mapping update jobs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListNetworkMigrationMappingUpdatesResponse>
      listNetworkMigrationMappingUpdates({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    ListNetworkMigrationMappingUpdatesFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/ListNetworkMigrationMappingUpdates',
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworkMigrationMappingUpdatesResponse.fromJson(response);
  }

  /// Starts a network migration analysis job to evaluate connectivity and
  /// compatibility of the migration mappings.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution to analyze.
  Future<StartNetworkMigrationAnalysisResponse> startNetworkMigrationAnalysis({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/StartNetworkMigrationAnalysis',
      exceptionFnMap: _exceptionFns,
    );
    return StartNetworkMigrationAnalysisResponse.fromJson(response);
  }

  /// Starts a code generation job to convert network migration mappings into
  /// infrastructure-as-code templates.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [codeGenerationOutputFormatTypes] :
  /// The output format types for code generation, such as CloudFormation or
  /// Terraform.
  Future<StartNetworkMigrationCodeGenerationResponse>
      startNetworkMigrationCodeGeneration({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    List<CodeGenerationOutputFormatType>? codeGenerationOutputFormatTypes,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (codeGenerationOutputFormatTypes != null)
        'codeGenerationOutputFormatTypes':
            codeGenerationOutputFormatTypes.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/StartNetworkMigrationCodeGeneration',
      exceptionFnMap: _exceptionFns,
    );
    return StartNetworkMigrationCodeGenerationResponse.fromJson(response);
  }

  /// Starts a deployment job to create the target network infrastructure based
  /// on the generated code templates.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  Future<StartNetworkMigrationDeployerJobResponse>
      startNetworkMigrationDeployment({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/StartNetworkMigrationDeployment',
      exceptionFnMap: _exceptionFns,
    );
    return StartNetworkMigrationDeployerJobResponse.fromJson(response);
  }

  /// Starts the network migration mapping process for a given network migration
  /// execution.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [securityGroupMappingStrategy] :
  /// The security group mapping strategy to use.
  Future<StartNetworkMigrationMappingResponse> startNetworkMigrationMapping({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    SecurityGroupMappingStrategy? securityGroupMappingStrategy,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (securityGroupMappingStrategy != null)
        'securityGroupMappingStrategy': securityGroupMappingStrategy.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/StartNetworkMigrationMapping',
      exceptionFnMap: _exceptionFns,
    );
    return StartNetworkMigrationMappingResponse.fromJson(response);
  }

  /// Starts a job to apply customer modifications to network migration
  /// mappings, such as changing properties.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [constructs] :
  /// A list of construct updates to apply.
  ///
  /// Parameter [segments] :
  /// A list of segment updates to apply.
  Future<StartNetworkMigrationMappingUpdateResponse>
      startNetworkMigrationMappingUpdate({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    List<StartNetworkMigrationMappingUpdateConstruct>? constructs,
    List<StartNetworkMigrationMappingUpdateSegment>? segments,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      if (constructs != null) 'constructs': constructs,
      if (segments != null) 'segments': segments,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/StartNetworkMigrationMappingUpdate',
      exceptionFnMap: _exceptionFns,
    );
    return StartNetworkMigrationMappingUpdateResponse.fromJson(response);
  }

  /// Updates a mapper segment's configuration, such as changing its scope tags.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [networkMigrationDefinitionID] :
  /// The unique identifier of the network migration definition.
  ///
  /// Parameter [networkMigrationExecutionID] :
  /// The unique identifier of the network migration execution.
  ///
  /// Parameter [segmentID] :
  /// The unique identifier of the segment to update.
  ///
  /// Parameter [scopeTags] :
  /// The updated scope tags for the segment.
  Future<NetworkMigrationMapperSegment> updateNetworkMigrationMapperSegment({
    required String networkMigrationDefinitionID,
    required String networkMigrationExecutionID,
    required String segmentID,
    Map<String, String>? scopeTags,
  }) async {
    final $payload = <String, dynamic>{
      'networkMigrationDefinitionID': networkMigrationDefinitionID,
      'networkMigrationExecutionID': networkMigrationExecutionID,
      'segmentID': segmentID,
      if (scopeTags != null) 'scopeTags': scopeTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/network-migration/UpdateNetworkMigrationMapperSegment',
      exceptionFnMap: _exceptionFns,
    );
    return NetworkMigrationMapperSegment.fromJson(response);
  }

  /// Creates a new ReplicationConfigurationTemplate.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Request to associate the default Application Migration Service Security
  /// group with the Replication Settings template.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Request to configure bandwidth throttling during Replication Settings
  /// template creation.
  ///
  /// Parameter [createPublicIP] :
  /// Request to create Public IP during Replication Settings template creation.
  ///
  /// Parameter [dataPlaneRouting] :
  /// Request to configure data plane routing during Replication Settings
  /// template creation.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// Request to configure the default large staging disk EBS volume type during
  /// Replication Settings template creation.
  ///
  /// Parameter [ebsEncryption] :
  /// Request to configure EBS encryption during Replication Settings template
  /// creation.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// Request to configure the Replication Server instance type during
  /// Replication Settings template creation.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// Request to configure the Replication Server Security group ID during
  /// Replication Settings template creation.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// Request to configure the Staging Area subnet ID during Replication
  /// Settings template creation.
  ///
  /// Parameter [stagingAreaTags] :
  /// Request to configure Staging Area tags during Replication Settings
  /// template creation.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Request to use Dedicated Replication Servers during Replication Settings
  /// template creation.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// Request to configure an EBS encryption key during Replication Settings
  /// template creation.
  ///
  /// Parameter [internetProtocol] :
  /// Request to configure the internet protocol to IPv4 or IPv6.
  ///
  /// Parameter [storeSnapshotOnLocalZone] :
  /// Request to store snapshot on local zone during Replication Settings
  /// template creation.
  ///
  /// Parameter [tags] :
  /// Request to configure tags during Replication Settings template creation.
  ///
  /// Parameter [useFipsEndpoint] :
  /// Request to use Fips Endpoint during Replication Settings template
  /// creation.
  Future<ReplicationConfigurationTemplate>
      createReplicationConfigurationTemplate({
    required bool associateDefaultSecurityGroup,
    required int bandwidthThrottling,
    required bool createPublicIP,
    required ReplicationConfigurationDataPlaneRouting dataPlaneRouting,
    required ReplicationConfigurationDefaultLargeStagingDiskType
        defaultLargeStagingDiskType,
    required ReplicationConfigurationEbsEncryption ebsEncryption,
    required String replicationServerInstanceType,
    required List<String> replicationServersSecurityGroupsIDs,
    required String stagingAreaSubnetId,
    required Map<String, String> stagingAreaTags,
    required bool useDedicatedReplicationServer,
    String? ebsEncryptionKeyArn,
    InternetProtocol? internetProtocol,
    bool? storeSnapshotOnLocalZone,
    Map<String, String>? tags,
    bool? useFipsEndpoint,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      10000,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      'bandwidthThrottling': bandwidthThrottling,
      'createPublicIP': createPublicIP,
      'dataPlaneRouting': dataPlaneRouting.value,
      'defaultLargeStagingDiskType': defaultLargeStagingDiskType.value,
      'ebsEncryption': ebsEncryption.value,
      'replicationServerInstanceType': replicationServerInstanceType,
      'replicationServersSecurityGroupsIDs':
          replicationServersSecurityGroupsIDs,
      'stagingAreaSubnetId': stagingAreaSubnetId,
      'stagingAreaTags': stagingAreaTags,
      'useDedicatedReplicationServer': useDedicatedReplicationServer,
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (internetProtocol != null) 'internetProtocol': internetProtocol.value,
      if (storeSnapshotOnLocalZone != null)
        'storeSnapshotOnLocalZone': storeSnapshotOnLocalZone,
      if (tags != null) 'tags': tags,
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateReplicationConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfigurationTemplate.fromJson(response);
  }

  /// Updates multiple ReplicationConfigurationTemplates by ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [replicationConfigurationTemplateID] :
  /// Update replication configuration template template ID request.
  ///
  /// Parameter [arn] :
  /// Update replication configuration template ARN request.
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Update replication configuration template associate default Application
  /// Migration Service Security group request.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Update replication configuration template bandwidth throttling request.
  ///
  /// Parameter [createPublicIP] :
  /// Update replication configuration template create Public IP request.
  ///
  /// Parameter [dataPlaneRouting] :
  /// Update replication configuration template data plane routing request.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// Update replication configuration template use default large Staging Disk
  /// type request.
  ///
  /// Parameter [ebsEncryption] :
  /// Update replication configuration template EBS encryption request.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// Update replication configuration template EBS encryption key ARN request.
  ///
  /// Parameter [internetProtocol] :
  /// Update replication configuration template internet protocol request.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// Update replication configuration template Replication Server instance type
  /// request.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// Update replication configuration template Replication Server Security
  /// groups IDs request.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// Update replication configuration template Staging Area subnet ID request.
  ///
  /// Parameter [stagingAreaTags] :
  /// Update replication configuration template Staging Area Tags request.
  ///
  /// Parameter [storeSnapshotOnLocalZone] :
  /// Update replication configuration template store snapshot on local zone
  /// request.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Update replication configuration template use dedicated Replication Server
  /// request.
  ///
  /// Parameter [useFipsEndpoint] :
  /// Update replication configuration template use Fips Endpoint request.
  Future<ReplicationConfigurationTemplate>
      updateReplicationConfigurationTemplate({
    required String replicationConfigurationTemplateID,
    String? arn,
    bool? associateDefaultSecurityGroup,
    int? bandwidthThrottling,
    bool? createPublicIP,
    ReplicationConfigurationDataPlaneRouting? dataPlaneRouting,
    ReplicationConfigurationDefaultLargeStagingDiskType?
        defaultLargeStagingDiskType,
    ReplicationConfigurationEbsEncryption? ebsEncryption,
    String? ebsEncryptionKeyArn,
    InternetProtocol? internetProtocol,
    String? replicationServerInstanceType,
    List<String>? replicationServersSecurityGroupsIDs,
    String? stagingAreaSubnetId,
    Map<String, String>? stagingAreaTags,
    bool? storeSnapshotOnLocalZone,
    bool? useDedicatedReplicationServer,
    bool? useFipsEndpoint,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      10000,
    );
    final $payload = <String, dynamic>{
      'replicationConfigurationTemplateID': replicationConfigurationTemplateID,
      if (arn != null) 'arn': arn,
      if (associateDefaultSecurityGroup != null)
        'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (createPublicIP != null) 'createPublicIP': createPublicIP,
      if (dataPlaneRouting != null) 'dataPlaneRouting': dataPlaneRouting.value,
      if (defaultLargeStagingDiskType != null)
        'defaultLargeStagingDiskType': defaultLargeStagingDiskType.value,
      if (ebsEncryption != null) 'ebsEncryption': ebsEncryption.value,
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (internetProtocol != null) 'internetProtocol': internetProtocol.value,
      if (replicationServerInstanceType != null)
        'replicationServerInstanceType': replicationServerInstanceType,
      if (replicationServersSecurityGroupsIDs != null)
        'replicationServersSecurityGroupsIDs':
            replicationServersSecurityGroupsIDs,
      if (stagingAreaSubnetId != null)
        'stagingAreaSubnetId': stagingAreaSubnetId,
      if (stagingAreaTags != null) 'stagingAreaTags': stagingAreaTags,
      if (storeSnapshotOnLocalZone != null)
        'storeSnapshotOnLocalZone': storeSnapshotOnLocalZone,
      if (useDedicatedReplicationServer != null)
        'useDedicatedReplicationServer': useDedicatedReplicationServer,
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateReplicationConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfigurationTemplate.fromJson(response);
  }

  /// Deletes a single Replication Configuration Template by ID
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [replicationConfigurationTemplateID] :
  /// Request to delete Replication Configuration Template from service by
  /// Replication Configuration Template ID.
  Future<void> deleteReplicationConfigurationTemplate({
    required String replicationConfigurationTemplateID,
  }) async {
    final $payload = <String, dynamic>{
      'replicationConfigurationTemplateID': replicationConfigurationTemplateID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteReplicationConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists all ReplicationConfigurationTemplates, filtered by Source Server
  /// IDs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Request to describe Replication Configuration template by max results.
  ///
  /// Parameter [nextToken] :
  /// Request to describe Replication Configuration template by next token.
  ///
  /// Parameter [replicationConfigurationTemplateIDs] :
  /// Request to describe Replication Configuration template by template IDs.
  Future<DescribeReplicationConfigurationTemplatesResponse>
      describeReplicationConfigurationTemplates({
    int? maxResults,
    String? nextToken,
    List<String>? replicationConfigurationTemplateIDs,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (replicationConfigurationTemplateIDs != null)
        'replicationConfigurationTemplateIDs':
            replicationConfigurationTemplateIDs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeReplicationConfigurationTemplates',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReplicationConfigurationTemplatesResponse.fromJson(response);
  }

  /// Update Source Server.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// Update Source Server request source server ID.
  ///
  /// Parameter [accountID] :
  /// Update Source Server request account ID.
  ///
  /// Parameter [connectorAction] :
  /// Update Source Server request connector action.
  Future<SourceServer> updateSourceServer({
    required String sourceServerID,
    String? accountID,
    SourceServerConnectorAction? connectorAction,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (connectorAction != null) 'connectorAction': connectorAction,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateSourceServer',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Deletes a single source server by ID.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to delete Source Server from service by Server ID.
  ///
  /// Parameter [accountID] :
  /// Request to delete Source Server from service by Account ID.
  Future<void> deleteSourceServer({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteSourceServer',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves all SourceServers or multiple SourceServers by ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accountID] :
  /// Request to filter Source Servers list by Accoun ID.
  ///
  /// Parameter [filters] :
  /// Request to filter Source Servers list.
  ///
  /// Parameter [maxResults] :
  /// Request to filter Source Servers list by maximum results.
  ///
  /// Parameter [nextToken] :
  /// Request to filter Source Servers list by next token.
  Future<DescribeSourceServersResponse> describeSourceServers({
    String? accountID,
    DescribeSourceServersRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (accountID != null) 'accountID': accountID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSourceServers',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSourceServersResponse.fromJson(response);
  }

  /// Allows the user to set the SourceServer.LifeCycle.state property for
  /// specific Source Server IDs to one of the following: READY_FOR_TEST or
  /// READY_FOR_CUTOVER. This command only works if the Source Server is already
  /// launchable (dataReplicationInfo.lagDuration is not null.)
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [lifeCycle] :
  /// The request to change the source server migration lifecycle state.
  ///
  /// Parameter [sourceServerID] :
  /// The request to change the source server migration lifecycle state by
  /// source server ID.
  ///
  /// Parameter [accountID] :
  /// The request to change the source server migration account ID.
  Future<SourceServer> changeServerLifeCycleState({
    required ChangeServerLifeCycleStateSourceServerLifecycle lifeCycle,
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'lifeCycle': lifeCycle,
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ChangeServerLifeCycleState',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Disconnects specific Source Servers from Application Migration Service.
  /// Data replication is stopped immediately. All AWS resources created by
  /// Application Migration Service for enabling the replication of these source
  /// servers will be terminated / deleted within 90 minutes. Launched Test or
  /// Cutover instances will NOT be terminated. If the agent on the source
  /// server has not been prevented from communicating with the Application
  /// Migration Service service, then it will receive a command to uninstall
  /// itself (within approximately 10 minutes). The following properties of the
  /// SourceServer will be changed immediately:
  /// dataReplicationInfo.dataReplicationState will be set to DISCONNECTED; The
  /// totalStorageBytes property for each of dataReplicationInfo.replicatedDisks
  /// will be set to zero; dataReplicationInfo.lagDuration and
  /// dataReplicationInfo.lagDuration will be nullified.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to disconnect Source Server from service by Server ID.
  ///
  /// Parameter [accountID] :
  /// Request to disconnect Source Server from service by Account ID.
  Future<SourceServer> disconnectFromService({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisconnectFromService',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Finalizes the cutover immediately for specific Source Servers. All AWS
  /// resources created by Application Migration Service for enabling the
  /// replication of these source servers will be terminated / deleted within 90
  /// minutes. Launched Test or Cutover instances will NOT be terminated. The
  /// AWS Replication Agent will receive a command to uninstall itself (within
  /// 10 minutes). The following properties of the SourceServer will be changed
  /// immediately: dataReplicationInfo.dataReplicationState will be changed to
  /// DISCONNECTED; The SourceServer.lifeCycle.state will be changed to CUTOVER;
  /// The totalStorageBytes property fo each of
  /// dataReplicationInfo.replicatedDisks will be set to zero;
  /// dataReplicationInfo.lagDuration and dataReplicationInfo.lagDuration will
  /// be nullified.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to finalize Cutover by Source Server ID.
  ///
  /// Parameter [accountID] :
  /// Request to finalize Cutover by Source Account ID.
  Future<SourceServer> finalizeCutover({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/FinalizeCutover',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Lists all LaunchConfigurations available, filtered by Source Server IDs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to get Launch Configuration information by Source Server ID.
  ///
  /// Parameter [accountID] :
  /// Request to get Launch Configuration information by Account ID.
  Future<LaunchConfiguration> getLaunchConfiguration({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetLaunchConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return LaunchConfiguration.fromJson(response);
  }

  /// Lists all ReplicationConfigurations, filtered by Source Server ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to get Replication Configuration by Source Server ID.
  ///
  /// Parameter [accountID] :
  /// Request to get Replication Configuration by Account ID.
  Future<ReplicationConfiguration> getReplicationConfiguration({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetReplicationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfiguration.fromJson(response);
  }

  /// List source server post migration custom actions.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// Source server ID.
  ///
  /// Parameter [accountID] :
  /// Account ID to return when listing source server post migration custom
  /// actions.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing source server post migration custom actions.
  ///
  /// Parameter [maxResults] :
  /// Maximum amount of items to return when listing source server post
  /// migration custom actions.
  ///
  /// Parameter [nextToken] :
  /// Next token to use when listing source server post migration custom
  /// actions.
  Future<ListSourceServerActionsResponse> listSourceServerActions({
    required String sourceServerID,
    String? accountID,
    SourceServerActionsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListSourceServerActions',
      exceptionFnMap: _exceptionFns,
    );
    return ListSourceServerActionsResponse.fromJson(response);
  }

  /// Archives specific Source Servers by setting the SourceServer.isArchived
  /// property to true for specified SourceServers by ID. This command only
  /// works for SourceServers with a lifecycle. state which equals DISCONNECTED
  /// or CUTOVER.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// Mark as archived by Source Server ID.
  ///
  /// Parameter [accountID] :
  /// Mark as archived by Account ID.
  Future<SourceServer> markAsArchived({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MarkAsArchived',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Pause Replication.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// Pause Replication Request source server ID.
  ///
  /// Parameter [accountID] :
  /// Pause Replication Request account ID.
  Future<SourceServer> pauseReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PauseReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Put source server post migration custom action.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionID] :
  /// Source server post migration custom action ID.
  ///
  /// Parameter [actionName] :
  /// Source server post migration custom action name.
  ///
  /// Parameter [documentIdentifier] :
  /// Source server post migration custom action document identifier.
  ///
  /// Parameter [order] :
  /// Source server post migration custom action order.
  ///
  /// Parameter [sourceServerID] :
  /// Source server ID.
  ///
  /// Parameter [accountID] :
  /// Source server post migration custom account ID.
  ///
  /// Parameter [active] :
  /// Source server post migration custom action active status.
  ///
  /// Parameter [category] :
  /// Source server post migration custom action category.
  ///
  /// Parameter [description] :
  /// Source server post migration custom action description.
  ///
  /// Parameter [documentVersion] :
  /// Source server post migration custom action document version.
  ///
  /// Parameter [externalParameters] :
  /// Source server post migration custom action external parameters.
  ///
  /// Parameter [mustSucceedForCutover] :
  /// Source server post migration custom action must succeed for cutover.
  ///
  /// Parameter [parameters] :
  /// Source server post migration custom action parameters.
  ///
  /// Parameter [timeoutSeconds] :
  /// Source server post migration custom action timeout in seconds.
  Future<SourceServerActionDocument> putSourceServerAction({
    required String actionID,
    required String actionName,
    required String documentIdentifier,
    required int order,
    required String sourceServerID,
    String? accountID,
    bool? active,
    ActionCategory? category,
    String? description,
    String? documentVersion,
    Map<String, SsmExternalParameter>? externalParameters,
    bool? mustSucceedForCutover,
    Map<String, List<SsmParameterStoreParameter>>? parameters,
    int? timeoutSeconds,
  }) async {
    _s.validateNumRange(
      'order',
      order,
      1001,
      10000,
      isRequired: true,
    );
    _s.validateNumRange(
      'timeoutSeconds',
      timeoutSeconds,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'actionID': actionID,
      'actionName': actionName,
      'documentIdentifier': documentIdentifier,
      'order': order,
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (active != null) 'active': active,
      if (category != null) 'category': category.value,
      if (description != null) 'description': description,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutSourceServerAction',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServerActionDocument.fromJson(response);
  }

  /// Remove source server post migration custom action.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionID] :
  /// Source server post migration custom action ID to remove.
  ///
  /// Parameter [sourceServerID] :
  /// Source server ID of the post migration custom action to remove.
  ///
  /// Parameter [accountID] :
  /// Source server post migration account ID.
  Future<void> removeSourceServerAction({
    required String actionID,
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'actionID': actionID,
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RemoveSourceServerAction',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Resume Replication.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// Resume Replication Request source server ID.
  ///
  /// Parameter [accountID] :
  /// Resume Replication Request account ID.
  Future<SourceServer> resumeReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ResumeReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Causes the data replication initiation sequence to begin immediately upon
  /// next Handshake for specified SourceServer IDs, regardless of when the
  /// previous initiation started. This command will not work if the
  /// SourceServer is not stalled or is in a DISCONNECTED or STOPPED state.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// Retry data replication for Source Server ID.
  ///
  /// Parameter [accountID] :
  /// Retry data replication for Account ID.
  Future<SourceServer> retryDataReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RetryDataReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Start replication for source server irrespective of its replication type.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// ID of source server on which to start replication.
  ///
  /// Parameter [accountID] :
  /// Account ID on which to start replication.
  Future<SourceServer> startReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Stop Replication.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// Stop Replication Request source server ID.
  ///
  /// Parameter [accountID] :
  /// Stop Replication Request account ID.
  Future<SourceServer> stopReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Updates multiple LaunchConfigurations by Source Server ID.
  /// <note>
  /// bootMode valid values are <code>LEGACY_BIOS | UEFI</code>
  /// </note>
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// Update Launch configuration by Source Server ID request.
  ///
  /// Parameter [accountID] :
  /// Update Launch configuration Account ID.
  ///
  /// Parameter [bootMode] :
  /// Update Launch configuration boot mode request.
  ///
  /// Parameter [copyPrivateIp] :
  /// Update Launch configuration copy Private IP request.
  ///
  /// Parameter [copyTags] :
  /// Update Launch configuration copy Tags request.
  ///
  /// Parameter [enableMapAutoTagging] :
  /// Enable map auto tagging.
  ///
  /// Parameter [launchDisposition] :
  /// Update Launch configuration launch disposition request.
  ///
  /// Parameter [licensing] :
  /// Update Launch configuration licensing request.
  ///
  /// Parameter [mapAutoTaggingMpeID] :
  /// Launch configuration map auto tagging MPE ID.
  ///
  /// Parameter [name] :
  /// Update Launch configuration name request.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Update Launch configuration Target instance right sizing request.
  Future<LaunchConfiguration> updateLaunchConfiguration({
    required String sourceServerID,
    String? accountID,
    BootMode? bootMode,
    bool? copyPrivateIp,
    bool? copyTags,
    bool? enableMapAutoTagging,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    String? mapAutoTaggingMpeID,
    String? name,
    PostLaunchActions? postLaunchActions,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (bootMode != null) 'bootMode': bootMode.value,
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.value,
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
      if (name != null) 'name': name,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLaunchConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return LaunchConfiguration.fromJson(response);
  }

  /// Allows you to update multiple ReplicationConfigurations by Source Server
  /// ID.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// Update replication configuration Source Server ID request.
  ///
  /// Parameter [accountID] :
  /// Update replication configuration Account ID request.
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Update replication configuration associate default Application Migration
  /// Service Security group request.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Update replication configuration bandwidth throttling request.
  ///
  /// Parameter [createPublicIP] :
  /// Update replication configuration create Public IP request.
  ///
  /// Parameter [dataPlaneRouting] :
  /// Update replication configuration data plane routing request.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// Update replication configuration use default large Staging Disk type
  /// request.
  ///
  /// Parameter [ebsEncryption] :
  /// Update replication configuration EBS encryption request.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// Update replication configuration EBS encryption key ARN request.
  ///
  /// Parameter [internetProtocol] :
  /// Update replication configuration internet protocol.
  ///
  /// Parameter [name] :
  /// Update replication configuration name request.
  ///
  /// Parameter [replicatedDisks] :
  /// Update replication configuration replicated disks request.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// Update replication configuration Replication Server instance type request.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// Update replication configuration Replication Server Security Groups IDs
  /// request.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// Update replication configuration Staging Area subnet request.
  ///
  /// Parameter [stagingAreaTags] :
  /// Update replication configuration Staging Area Tags request.
  ///
  /// Parameter [storeSnapshotOnLocalZone] :
  /// Update replication configuration store snapshot on local zone.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Update replication configuration use dedicated Replication Server request.
  ///
  /// Parameter [useFipsEndpoint] :
  /// Update replication configuration use Fips Endpoint.
  Future<ReplicationConfiguration> updateReplicationConfiguration({
    required String sourceServerID,
    String? accountID,
    bool? associateDefaultSecurityGroup,
    int? bandwidthThrottling,
    bool? createPublicIP,
    ReplicationConfigurationDataPlaneRouting? dataPlaneRouting,
    ReplicationConfigurationDefaultLargeStagingDiskType?
        defaultLargeStagingDiskType,
    ReplicationConfigurationEbsEncryption? ebsEncryption,
    String? ebsEncryptionKeyArn,
    InternetProtocol? internetProtocol,
    String? name,
    List<ReplicationConfigurationReplicatedDisk>? replicatedDisks,
    String? replicationServerInstanceType,
    List<String>? replicationServersSecurityGroupsIDs,
    String? stagingAreaSubnetId,
    Map<String, String>? stagingAreaTags,
    bool? storeSnapshotOnLocalZone,
    bool? useDedicatedReplicationServer,
    bool? useFipsEndpoint,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      10000,
    );
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (associateDefaultSecurityGroup != null)
        'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (createPublicIP != null) 'createPublicIP': createPublicIP,
      if (dataPlaneRouting != null) 'dataPlaneRouting': dataPlaneRouting.value,
      if (defaultLargeStagingDiskType != null)
        'defaultLargeStagingDiskType': defaultLargeStagingDiskType.value,
      if (ebsEncryption != null) 'ebsEncryption': ebsEncryption.value,
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (internetProtocol != null) 'internetProtocol': internetProtocol.value,
      if (name != null) 'name': name,
      if (replicatedDisks != null) 'replicatedDisks': replicatedDisks,
      if (replicationServerInstanceType != null)
        'replicationServerInstanceType': replicationServerInstanceType,
      if (replicationServersSecurityGroupsIDs != null)
        'replicationServersSecurityGroupsIDs':
            replicationServersSecurityGroupsIDs,
      if (stagingAreaSubnetId != null)
        'stagingAreaSubnetId': stagingAreaSubnetId,
      if (stagingAreaTags != null) 'stagingAreaTags': stagingAreaTags,
      if (storeSnapshotOnLocalZone != null)
        'storeSnapshotOnLocalZone': storeSnapshotOnLocalZone,
      if (useDedicatedReplicationServer != null)
        'useDedicatedReplicationServer': useDedicatedReplicationServer,
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateReplicationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfiguration.fromJson(response);
  }

  /// Allows you to change between the AGENT_BASED replication type and the
  /// SNAPSHOT_SHIPPING replication type.
  ///
  /// SNAPSHOT_SHIPPING should be used for agentless replication.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [replicationType] :
  /// Replication type to which to update source server.
  ///
  /// Parameter [sourceServerID] :
  /// ID of source server on which to update replication type.
  ///
  /// Parameter [accountID] :
  /// Account ID on which to update replication type.
  Future<SourceServer> updateSourceServerReplicationType({
    required ReplicationType replicationType,
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'replicationType': replicationType.value,
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateSourceServerReplicationType',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Launches a Cutover Instance for specific Source Servers. This command
  /// starts a LAUNCH job whose initiatedBy property is StartCutover and changes
  /// the SourceServer.lifeCycle.state property to CUTTING_OVER.
  ///
  /// May throw [ConflictException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerIDs] :
  /// Start Cutover by Source Server IDs.
  ///
  /// Parameter [accountID] :
  /// Start Cutover by Account IDs
  ///
  /// Parameter [tags] :
  /// Start Cutover by Tags.
  Future<StartCutoverResponse> startCutover({
    required List<String> sourceServerIDs,
    String? accountID,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartCutover',
      exceptionFnMap: _exceptionFns,
    );
    return StartCutoverResponse.fromJson(response);
  }

  /// Launches a Test Instance for specific Source Servers. This command starts
  /// a LAUNCH job whose initiatedBy property is StartTest and changes the
  /// SourceServer.lifeCycle.state property to TESTING.
  ///
  /// May throw [ConflictException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerIDs] :
  /// Start Test for Source Server IDs.
  ///
  /// Parameter [accountID] :
  /// Start Test for Account ID.
  ///
  /// Parameter [tags] :
  /// Start Test by Tags.
  Future<StartTestResponse> startTest({
    required List<String> sourceServerIDs,
    String? accountID,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartTest',
      exceptionFnMap: _exceptionFns,
    );
    return StartTestResponse.fromJson(response);
  }

  /// Starts a job that terminates specific launched EC2 Test and Cutover
  /// instances. This command will not work for any Source Server with a
  /// lifecycle.state of TESTING, CUTTING_OVER, or CUTOVER.
  ///
  /// May throw [ConflictException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerIDs] :
  /// Terminate Target instance by Source Server IDs.
  ///
  /// Parameter [accountID] :
  /// Terminate Target instance by Account ID
  ///
  /// Parameter [tags] :
  /// Terminate Target instance by Tags.
  Future<TerminateTargetInstancesResponse> terminateTargetInstances({
    required List<String> sourceServerIDs,
    String? accountID,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TerminateTargetInstances',
      exceptionFnMap: _exceptionFns,
    );
    return TerminateTargetInstancesResponse.fromJson(response);
  }

  /// Deletes a given vCenter client by ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [vcenterClientID] :
  /// ID of resource to be deleted.
  Future<void> deleteVcenterClient({
    required String vcenterClientID,
  }) async {
    final $payload = <String, dynamic>{
      'vcenterClientID': vcenterClientID,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteVcenterClient',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of the installed vCenter clients.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum results to be returned in DescribeVcenterClients.
  ///
  /// Parameter [nextToken] :
  /// Next pagination token to be provided for DescribeVcenterClients.
  Future<DescribeVcenterClientsResponse> describeVcenterClients({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/DescribeVcenterClients',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVcenterClientsResponse.fromJson(response);
  }

  /// Create wave.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [name] :
  /// Wave name.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  ///
  /// Parameter [description] :
  /// Wave description.
  ///
  /// Parameter [tags] :
  /// Wave tags.
  Future<Wave> createWave({
    required String name,
    String? accountID,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (accountID != null) 'accountID': accountID,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateWave',
      exceptionFnMap: _exceptionFns,
    );
    return Wave.fromJson(response);
  }

  /// Delete wave.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> deleteWave({
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteWave',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves all waves or multiple waves by ID.
  ///
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [accountID] :
  /// Request account ID.
  ///
  /// Parameter [filters] :
  /// Waves list filters.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to return when listing waves.
  ///
  /// Parameter [nextToken] :
  /// Request next token.
  Future<ListWavesResponse> listWaves({
    String? accountID,
    ListWavesRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (accountID != null) 'accountID': accountID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListWaves',
      exceptionFnMap: _exceptionFns,
    );
    return ListWavesResponse.fromJson(response);
  }

  /// Archive wave.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<Wave> archiveWave({
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ArchiveWave',
      exceptionFnMap: _exceptionFns,
    );
    return Wave.fromJson(response);
  }

  /// Associate applications to wave.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [applicationIDs] :
  /// Application IDs list.
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> associateApplications({
    required List<String> applicationIDs,
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationIDs': applicationIDs,
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/AssociateApplications',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociate applications from wave.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [applicationIDs] :
  /// Application IDs list.
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> disassociateApplications({
    required List<String> applicationIDs,
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationIDs': applicationIDs,
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisassociateApplications',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Unarchive wave.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<Wave> unarchiveWave({
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UnarchiveWave',
      exceptionFnMap: _exceptionFns,
    );
    return Wave.fromJson(response);
  }

  /// Update wave.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  ///
  /// Parameter [description] :
  /// Wave description.
  ///
  /// Parameter [name] :
  /// Wave name.
  Future<Wave> updateWave({
    required String waveID,
    String? accountID,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateWave',
      exceptionFnMap: _exceptionFns,
    );
    return Wave.fromJson(response);
  }
}

class InitializeServiceResponse {
  InitializeServiceResponse();

  factory InitializeServiceResponse.fromJson(Map<String, dynamic> _) {
    return InitializeServiceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListImportFileEnrichmentsResponse {
  /// A list of import file enrichment jobs.
  final List<ImportFileEnrichment>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListImportFileEnrichmentsResponse({
    this.items,
    this.nextToken,
  });

  factory ListImportFileEnrichmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListImportFileEnrichmentsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ImportFileEnrichment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// List managed accounts response.
class ListManagedAccountsResponse {
  /// List managed accounts response items.
  final List<ManagedAccount> items;

  /// List managed accounts response next token.
  final String? nextToken;

  ListManagedAccountsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListManagedAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedAccountsResponse(
      items: ((json['items'] as List?) ?? const [])
          .nonNulls
          .map((e) => ManagedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// List tags for resource response.
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

class StartImportFileEnrichmentResponse {
  /// The unique identifier of the import file enrichment job that was started.
  final String? jobID;

  StartImportFileEnrichmentResponse({
    this.jobID,
  });

  factory StartImportFileEnrichmentResponse.fromJson(
      Map<String, dynamic> json) {
    return StartImportFileEnrichmentResponse(
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    return {
      if (jobID != null) 'jobID': jobID,
    };
  }
}

class Application {
  /// Application aggregated status.
  final ApplicationAggregatedStatus? applicationAggregatedStatus;

  /// Application ID.
  final String? applicationID;

  /// Application ARN.
  final String? arn;

  /// Application creation dateTime.
  final String? creationDateTime;

  /// Application description.
  final String? description;

  /// Application archival status.
  final bool? isArchived;

  /// Application last modified dateTime.
  final String? lastModifiedDateTime;

  /// Application name.
  final String? name;

  /// Application tags.
  final Map<String, String>? tags;

  /// Application wave ID.
  final String? waveID;

  Application({
    this.applicationAggregatedStatus,
    this.applicationID,
    this.arn,
    this.creationDateTime,
    this.description,
    this.isArchived,
    this.lastModifiedDateTime,
    this.name,
    this.tags,
    this.waveID,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      applicationAggregatedStatus: json['applicationAggregatedStatus'] != null
          ? ApplicationAggregatedStatus.fromJson(
              json['applicationAggregatedStatus'] as Map<String, dynamic>)
          : null,
      applicationID: json['applicationID'] as String?,
      arn: json['arn'] as String?,
      creationDateTime: json['creationDateTime'] as String?,
      description: json['description'] as String?,
      isArchived: json['isArchived'] as bool?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      waveID: json['waveID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationAggregatedStatus = this.applicationAggregatedStatus;
    final applicationID = this.applicationID;
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final isArchived = this.isArchived;
    final lastModifiedDateTime = this.lastModifiedDateTime;
    final name = this.name;
    final tags = this.tags;
    final waveID = this.waveID;
    return {
      if (applicationAggregatedStatus != null)
        'applicationAggregatedStatus': applicationAggregatedStatus,
      if (applicationID != null) 'applicationID': applicationID,
      if (arn != null) 'arn': arn,
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (description != null) 'description': description,
      if (isArchived != null) 'isArchived': isArchived,
      if (lastModifiedDateTime != null)
        'lastModifiedDateTime': lastModifiedDateTime,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (waveID != null) 'waveID': waveID,
    };
  }
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListApplicationsResponse {
  /// Applications list.
  final List<Application>? items;

  /// Response next token.
  final String? nextToken;

  ListApplicationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AssociateSourceServersResponse {
  AssociateSourceServersResponse();

  factory AssociateSourceServersResponse.fromJson(Map<String, dynamic> _) {
    return AssociateSourceServersResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateSourceServersResponse {
  DisassociateSourceServersResponse();

  factory DisassociateSourceServersResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateSourceServersResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class Connector {
  /// Connector arn.
  final String? arn;

  /// Connector ID.
  final String? connectorID;

  /// Connector name.
  final String? name;

  /// Connector SSM command config.
  final ConnectorSsmCommandConfig? ssmCommandConfig;

  /// Connector SSM instance ID.
  final String? ssmInstanceID;

  /// Connector tags.
  final Map<String, String>? tags;

  Connector({
    this.arn,
    this.connectorID,
    this.name,
    this.ssmCommandConfig,
    this.ssmInstanceID,
    this.tags,
  });

  factory Connector.fromJson(Map<String, dynamic> json) {
    return Connector(
      arn: json['arn'] as String?,
      connectorID: json['connectorID'] as String?,
      name: json['name'] as String?,
      ssmCommandConfig: json['ssmCommandConfig'] != null
          ? ConnectorSsmCommandConfig.fromJson(
              json['ssmCommandConfig'] as Map<String, dynamic>)
          : null,
      ssmInstanceID: json['ssmInstanceID'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectorID = this.connectorID;
    final name = this.name;
    final ssmCommandConfig = this.ssmCommandConfig;
    final ssmInstanceID = this.ssmInstanceID;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (connectorID != null) 'connectorID': connectorID,
      if (name != null) 'name': name,
      if (ssmCommandConfig != null) 'ssmCommandConfig': ssmCommandConfig,
      if (ssmInstanceID != null) 'ssmInstanceID': ssmInstanceID,
      if (tags != null) 'tags': tags,
    };
  }
}

class ListConnectorsResponse {
  /// List connectors response items.
  final List<Connector>? items;

  /// List connectors response next token.
  final String? nextToken;

  ListConnectorsResponse({
    this.items,
    this.nextToken,
  });

  factory ListConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => Connector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Start export response.
class StartExportResponse {
  /// Start export response export task.
  final ExportTask? exportTask;

  StartExportResponse({
    this.exportTask,
  });

  factory StartExportResponse.fromJson(Map<String, dynamic> json) {
    return StartExportResponse(
      exportTask: json['exportTask'] != null
          ? ExportTask.fromJson(json['exportTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportTask = this.exportTask;
    return {
      if (exportTask != null) 'exportTask': exportTask,
    };
  }
}

/// List export response.
class ListExportsResponse {
  /// List export response items.
  final List<ExportTask>? items;

  /// List export response next token.
  final String? nextToken;

  ListExportsResponse({
    this.items,
    this.nextToken,
  });

  factory ListExportsResponse.fromJson(Map<String, dynamic> json) {
    return ListExportsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ExportTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// List export errors response.
class ListExportErrorsResponse {
  /// List export errors response items.
  final List<ExportTaskError>? items;

  /// List export errors response next token.
  final String? nextToken;

  ListExportErrorsResponse({
    this.items,
    this.nextToken,
  });

  factory ListExportErrorsResponse.fromJson(Map<String, dynamic> json) {
    return ListExportErrorsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ExportTaskError.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Start import response.
class StartImportResponse {
  /// Start import response import task.
  final ImportTask? importTask;

  StartImportResponse({
    this.importTask,
  });

  factory StartImportResponse.fromJson(Map<String, dynamic> json) {
    return StartImportResponse(
      importTask: json['importTask'] != null
          ? ImportTask.fromJson(json['importTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final importTask = this.importTask;
    return {
      if (importTask != null) 'importTask': importTask,
    };
  }
}

/// List import response.
class ListImportsResponse {
  /// List import response items.
  final List<ImportTask>? items;

  /// List import response next token.
  final String? nextToken;

  ListImportsResponse({
    this.items,
    this.nextToken,
  });

  factory ListImportsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ImportTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// List imports errors response.
class ListImportErrorsResponse {
  /// List imports errors response items.
  final List<ImportTaskError>? items;

  /// List imports errors response next token.
  final String? nextToken;

  ListImportErrorsResponse({
    this.items,
    this.nextToken,
  });

  factory ListImportErrorsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportErrorsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ImportTaskError.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DeleteJobResponse {
  DeleteJobResponse();

  factory DeleteJobResponse.fromJson(Map<String, dynamic> _) {
    return DeleteJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeJobsResponse {
  /// Request to describe Job log items.
  final List<Job>? items;

  /// Request to describe Job response by next token.
  final String? nextToken;

  DescribeJobsResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeJobsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeJobLogItemsResponse {
  /// Request to describe Job log response items.
  final List<JobLog>? items;

  /// Request to describe Job log response next token.
  final String? nextToken;

  DescribeJobLogItemsResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeJobLogItemsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobLogItemsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => JobLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class LaunchConfigurationTemplate {
  /// ID of the Launch Configuration Template.
  final String launchConfigurationTemplateID;

  /// ARN of the Launch Configuration Template.
  final String? arn;

  /// Associate public Ip address.
  final bool? associatePublicIpAddress;

  /// Launch configuration template boot mode.
  final BootMode? bootMode;

  /// Copy private Ip.
  final bool? copyPrivateIp;

  /// Copy tags.
  final bool? copyTags;

  /// EC2 launch template ID.
  final String? ec2LaunchTemplateID;

  /// Enable map auto tagging.
  final bool? enableMapAutoTagging;

  /// Enable parameters encryption.
  final bool? enableParametersEncryption;

  /// Large volume config.
  final LaunchTemplateDiskConf? largeVolumeConf;

  /// Launch disposition.
  final LaunchDisposition? launchDisposition;
  final Licensing? licensing;

  /// Launch configuration template map auto tagging MPE ID.
  final String? mapAutoTaggingMpeID;

  /// Parameters encryption key.
  final String? parametersEncryptionKey;

  /// Post Launch Actions of the Launch Configuration Template.
  final PostLaunchActions? postLaunchActions;

  /// Small volume config.
  final LaunchTemplateDiskConf? smallVolumeConf;

  /// Small volume maximum size.
  final int? smallVolumeMaxSize;

  /// Tags of the Launch Configuration Template.
  final Map<String, String>? tags;

  /// Target instance type right-sizing method.
  final TargetInstanceTypeRightSizingMethod?
      targetInstanceTypeRightSizingMethod;

  LaunchConfigurationTemplate({
    required this.launchConfigurationTemplateID,
    this.arn,
    this.associatePublicIpAddress,
    this.bootMode,
    this.copyPrivateIp,
    this.copyTags,
    this.ec2LaunchTemplateID,
    this.enableMapAutoTagging,
    this.enableParametersEncryption,
    this.largeVolumeConf,
    this.launchDisposition,
    this.licensing,
    this.mapAutoTaggingMpeID,
    this.parametersEncryptionKey,
    this.postLaunchActions,
    this.smallVolumeConf,
    this.smallVolumeMaxSize,
    this.tags,
    this.targetInstanceTypeRightSizingMethod,
  });

  factory LaunchConfigurationTemplate.fromJson(Map<String, dynamic> json) {
    return LaunchConfigurationTemplate(
      launchConfigurationTemplateID:
          (json['launchConfigurationTemplateID'] as String?) ?? '',
      arn: json['arn'] as String?,
      associatePublicIpAddress: json['associatePublicIpAddress'] as bool?,
      bootMode: (json['bootMode'] as String?)?.let(BootMode.fromString),
      copyPrivateIp: json['copyPrivateIp'] as bool?,
      copyTags: json['copyTags'] as bool?,
      ec2LaunchTemplateID: json['ec2LaunchTemplateID'] as String?,
      enableMapAutoTagging: json['enableMapAutoTagging'] as bool?,
      enableParametersEncryption: json['enableParametersEncryption'] as bool?,
      largeVolumeConf: json['largeVolumeConf'] != null
          ? LaunchTemplateDiskConf.fromJson(
              json['largeVolumeConf'] as Map<String, dynamic>)
          : null,
      launchDisposition: (json['launchDisposition'] as String?)
          ?.let(LaunchDisposition.fromString),
      licensing: json['licensing'] != null
          ? Licensing.fromJson(json['licensing'] as Map<String, dynamic>)
          : null,
      mapAutoTaggingMpeID: json['mapAutoTaggingMpeID'] as String?,
      parametersEncryptionKey: json['parametersEncryptionKey'] as String?,
      postLaunchActions: json['postLaunchActions'] != null
          ? PostLaunchActions.fromJson(
              json['postLaunchActions'] as Map<String, dynamic>)
          : null,
      smallVolumeConf: json['smallVolumeConf'] != null
          ? LaunchTemplateDiskConf.fromJson(
              json['smallVolumeConf'] as Map<String, dynamic>)
          : null,
      smallVolumeMaxSize: json['smallVolumeMaxSize'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetInstanceTypeRightSizingMethod:
          (json['targetInstanceTypeRightSizingMethod'] as String?)
              ?.let(TargetInstanceTypeRightSizingMethod.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final launchConfigurationTemplateID = this.launchConfigurationTemplateID;
    final arn = this.arn;
    final associatePublicIpAddress = this.associatePublicIpAddress;
    final bootMode = this.bootMode;
    final copyPrivateIp = this.copyPrivateIp;
    final copyTags = this.copyTags;
    final ec2LaunchTemplateID = this.ec2LaunchTemplateID;
    final enableMapAutoTagging = this.enableMapAutoTagging;
    final enableParametersEncryption = this.enableParametersEncryption;
    final largeVolumeConf = this.largeVolumeConf;
    final launchDisposition = this.launchDisposition;
    final licensing = this.licensing;
    final mapAutoTaggingMpeID = this.mapAutoTaggingMpeID;
    final parametersEncryptionKey = this.parametersEncryptionKey;
    final postLaunchActions = this.postLaunchActions;
    final smallVolumeConf = this.smallVolumeConf;
    final smallVolumeMaxSize = this.smallVolumeMaxSize;
    final tags = this.tags;
    final targetInstanceTypeRightSizingMethod =
        this.targetInstanceTypeRightSizingMethod;
    return {
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (arn != null) 'arn': arn,
      if (associatePublicIpAddress != null)
        'associatePublicIpAddress': associatePublicIpAddress,
      if (bootMode != null) 'bootMode': bootMode.value,
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (ec2LaunchTemplateID != null)
        'ec2LaunchTemplateID': ec2LaunchTemplateID,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (enableParametersEncryption != null)
        'enableParametersEncryption': enableParametersEncryption,
      if (largeVolumeConf != null) 'largeVolumeConf': largeVolumeConf,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.value,
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
      if (parametersEncryptionKey != null)
        'parametersEncryptionKey': parametersEncryptionKey,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (smallVolumeConf != null) 'smallVolumeConf': smallVolumeConf,
      if (smallVolumeMaxSize != null) 'smallVolumeMaxSize': smallVolumeMaxSize,
      if (tags != null) 'tags': tags,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.value,
    };
  }
}

class DeleteLaunchConfigurationTemplateResponse {
  DeleteLaunchConfigurationTemplateResponse();

  factory DeleteLaunchConfigurationTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteLaunchConfigurationTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeLaunchConfigurationTemplatesResponse {
  /// List of items returned by DescribeLaunchConfigurationTemplates.
  final List<LaunchConfigurationTemplate>? items;

  /// Next pagination token returned from DescribeLaunchConfigurationTemplates.
  final String? nextToken;

  DescribeLaunchConfigurationTemplatesResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeLaunchConfigurationTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLaunchConfigurationTemplatesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              LaunchConfigurationTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTemplateActionsResponse {
  /// List of template post migration custom actions.
  final List<TemplateActionDocument>? items;

  /// Next token returned when listing template post migration custom actions.
  final String? nextToken;

  ListTemplateActionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListTemplateActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplateActionsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map(
              (e) => TemplateActionDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class TemplateActionDocument {
  /// Template post migration custom action ID.
  final String? actionID;

  /// Template post migration custom action name.
  final String? actionName;

  /// Template post migration custom action active status.
  final bool? active;

  /// Template post migration custom action category.
  final ActionCategory? category;

  /// Template post migration custom action description.
  final String? description;

  /// Template post migration custom action document identifier.
  final String? documentIdentifier;

  /// Template post migration custom action document version.
  final String? documentVersion;

  /// Template post migration custom action external parameters.
  final Map<String, SsmExternalParameter>? externalParameters;

  /// Template post migration custom action must succeed for cutover.
  final bool? mustSucceedForCutover;

  /// Operating system eligible for this template post migration custom action.
  final String? operatingSystem;

  /// Template post migration custom action order.
  final int? order;

  /// Template post migration custom action parameters.
  final Map<String, List<SsmParameterStoreParameter>>? parameters;

  /// Template post migration custom action timeout in seconds.
  final int? timeoutSeconds;

  TemplateActionDocument({
    this.actionID,
    this.actionName,
    this.active,
    this.category,
    this.description,
    this.documentIdentifier,
    this.documentVersion,
    this.externalParameters,
    this.mustSucceedForCutover,
    this.operatingSystem,
    this.order,
    this.parameters,
    this.timeoutSeconds,
  });

  factory TemplateActionDocument.fromJson(Map<String, dynamic> json) {
    return TemplateActionDocument(
      actionID: json['actionID'] as String?,
      actionName: json['actionName'] as String?,
      active: json['active'] as bool?,
      category: (json['category'] as String?)?.let(ActionCategory.fromString),
      description: json['description'] as String?,
      documentIdentifier: json['documentIdentifier'] as String?,
      documentVersion: json['documentVersion'] as String?,
      externalParameters: (json['externalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, SsmExternalParameter.fromJson(e as Map<String, dynamic>))),
      mustSucceedForCutover: json['mustSucceedForCutover'] as bool?,
      operatingSystem: json['operatingSystem'] as String?,
      order: json['order'] as int?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => SsmParameterStoreParameter.fromJson(
                      e as Map<String, dynamic>))
                  .toList())),
      timeoutSeconds: json['timeoutSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionID = this.actionID;
    final actionName = this.actionName;
    final active = this.active;
    final category = this.category;
    final description = this.description;
    final documentIdentifier = this.documentIdentifier;
    final documentVersion = this.documentVersion;
    final externalParameters = this.externalParameters;
    final mustSucceedForCutover = this.mustSucceedForCutover;
    final operatingSystem = this.operatingSystem;
    final order = this.order;
    final parameters = this.parameters;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      if (actionID != null) 'actionID': actionID,
      if (actionName != null) 'actionName': actionName,
      if (active != null) 'active': active,
      if (category != null) 'category': category.value,
      if (description != null) 'description': description,
      if (documentIdentifier != null) 'documentIdentifier': documentIdentifier,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (operatingSystem != null) 'operatingSystem': operatingSystem,
      if (order != null) 'order': order,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
  }
}

class RemoveTemplateActionResponse {
  RemoveTemplateActionResponse();

  factory RemoveTemplateActionResponse.fromJson(Map<String, dynamic> _) {
    return RemoveTemplateActionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class NetworkMigrationDefinition {
  /// The Amazon Resource Name (ARN) of the network migration definition.
  final String? arn;

  /// The timestamp when the network migration definition was created.
  final DateTime? createdAt;

  /// A description of the network migration definition.
  final String? description;

  /// The name of the network migration definition.
  final String? name;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// Scope tags for the network migration definition.
  final Map<String, String>? scopeTags;

  /// A list of source configurations for the network migration.
  final List<SourceConfiguration>? sourceConfigurations;

  /// Tags assigned to the network migration definition.
  final Map<String, String>? tags;

  /// The target deployment configuration for the migrated network.
  final TargetDeployment? targetDeployment;

  /// The target network configuration including topology and CIDR ranges.
  final TargetNetwork? targetNetwork;

  /// The S3 configuration for storing the target network artifacts.
  final TargetS3Configuration? targetS3Configuration;

  /// The timestamp when the network migration definition was last updated.
  final DateTime? updatedAt;

  NetworkMigrationDefinition({
    this.arn,
    this.createdAt,
    this.description,
    this.name,
    this.networkMigrationDefinitionID,
    this.scopeTags,
    this.sourceConfigurations,
    this.tags,
    this.targetDeployment,
    this.targetNetwork,
    this.targetS3Configuration,
    this.updatedAt,
  });

  factory NetworkMigrationDefinition.fromJson(Map<String, dynamic> json) {
    return NetworkMigrationDefinition(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      name: json['name'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      scopeTags: (json['scopeTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sourceConfigurations: (json['sourceConfigurations'] as List?)
          ?.nonNulls
          .map((e) => SourceConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetDeployment: (json['targetDeployment'] as String?)
          ?.let(TargetDeployment.fromString),
      targetNetwork: json['targetNetwork'] != null
          ? TargetNetwork.fromJson(
              json['targetNetwork'] as Map<String, dynamic>)
          : null,
      targetS3Configuration: json['targetS3Configuration'] != null
          ? TargetS3Configuration.fromJson(
              json['targetS3Configuration'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final description = this.description;
    final name = this.name;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final scopeTags = this.scopeTags;
    final sourceConfigurations = this.sourceConfigurations;
    final tags = this.tags;
    final targetDeployment = this.targetDeployment;
    final targetNetwork = this.targetNetwork;
    final targetS3Configuration = this.targetS3Configuration;
    final updatedAt = this.updatedAt;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (name != null) 'name': name,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (scopeTags != null) 'scopeTags': scopeTags,
      if (sourceConfigurations != null)
        'sourceConfigurations': sourceConfigurations,
      if (tags != null) 'tags': tags,
      if (targetDeployment != null) 'targetDeployment': targetDeployment.value,
      if (targetNetwork != null) 'targetNetwork': targetNetwork,
      if (targetS3Configuration != null)
        'targetS3Configuration': targetS3Configuration,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class DeleteNetworkMigrationDefinitionResponse {
  DeleteNetworkMigrationDefinitionResponse();

  factory DeleteNetworkMigrationDefinitionResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteNetworkMigrationDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListNetworkMigrationDefinitionsResponse {
  /// A list of network migration definition summaries.
  final List<NetworkMigrationDefinitionSummary>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationDefinitionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationDefinitionsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationDefinitionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetNetworkMigrationMapperSegmentConstructResponse {
  /// The construct metadata including type, name, and configuration.
  final NetworkMigrationMapperSegmentConstruct? construct;

  GetNetworkMigrationMapperSegmentConstructResponse({
    this.construct,
  });

  factory GetNetworkMigrationMapperSegmentConstructResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNetworkMigrationMapperSegmentConstructResponse(
      construct: json['construct'] != null
          ? NetworkMigrationMapperSegmentConstruct.fromJson(
              json['construct'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final construct = this.construct;
    return {
      if (construct != null) 'construct': construct,
    };
  }
}

class ListNetworkMigrationAnalysesResponse {
  /// A list of network migration analysis job details.
  final List<NetworkMigrationAnalysisJobDetails>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationAnalysesResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationAnalysesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationAnalysesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationAnalysisJobDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationAnalysisResultsResponse {
  /// A list of network migration analysis results.
  final List<NetworkMigrationAnalysisResult>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationAnalysisResultsResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationAnalysisResultsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationAnalysisResultsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationAnalysisResult.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationCodeGenerationsResponse {
  /// A list of network migration code generation job details.
  final List<NetworkMigrationCodeGenerationJobDetails>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationCodeGenerationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationCodeGenerationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationCodeGenerationsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationCodeGenerationJobDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationCodeGenerationSegmentsResponse {
  /// A list of network migration code generation segments.
  final List<NetworkMigrationCodeGenerationSegment>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationCodeGenerationSegmentsResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationCodeGenerationSegmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationCodeGenerationSegmentsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationCodeGenerationSegment.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationDeployedStacksResponse {
  /// A list of deployed stack details including status and resources.
  final List<NetworkMigrationDeployedStackDetails>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationDeployedStacksResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationDeployedStacksResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationDeployedStacksResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationDeployedStackDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationDeployerJobResponse {
  /// A list of deployer job details.
  final List<NetworkMigrationDeployerJobDetails>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationDeployerJobResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationDeployerJobResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationDeployerJobResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationDeployerJobDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationExecutionsResponse {
  /// A list of network migration execution details.
  final List<NetworkMigrationExecution>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationExecutionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationExecutionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationExecutionsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              NetworkMigrationExecution.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationMapperSegmentConstructsResponse {
  /// A list of mapper segment constructs.
  final List<NetworkMigrationMapperSegmentConstruct>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationMapperSegmentConstructsResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationMapperSegmentConstructsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationMapperSegmentConstructsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationMapperSegmentConstruct.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationMapperSegmentsResponse {
  /// A list of mapper segments.
  final List<NetworkMigrationMapperSegment>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationMapperSegmentsResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationMapperSegmentsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationMapperSegmentsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              NetworkMigrationMapperSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationMappingsResponse {
  /// A list of network migration mapping job details.
  final List<NetworkMigrationMappingJobDetails>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationMappingsResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationMappingsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationMappingsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationMappingJobDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworkMigrationMappingUpdatesResponse {
  /// A list of mapping update job details.
  final List<NetworkMigrationMappingUpdateJobDetails>? items;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListNetworkMigrationMappingUpdatesResponse({
    this.items,
    this.nextToken,
  });

  factory ListNetworkMigrationMappingUpdatesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListNetworkMigrationMappingUpdatesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationMappingUpdateJobDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class StartNetworkMigrationAnalysisResponse {
  /// The unique identifier of the analysis job that was started.
  final String? jobID;

  StartNetworkMigrationAnalysisResponse({
    this.jobID,
  });

  factory StartNetworkMigrationAnalysisResponse.fromJson(
      Map<String, dynamic> json) {
    return StartNetworkMigrationAnalysisResponse(
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    return {
      if (jobID != null) 'jobID': jobID,
    };
  }
}

class StartNetworkMigrationCodeGenerationResponse {
  /// The unique identifier of the code generation job that was started.
  final String? jobID;

  StartNetworkMigrationCodeGenerationResponse({
    this.jobID,
  });

  factory StartNetworkMigrationCodeGenerationResponse.fromJson(
      Map<String, dynamic> json) {
    return StartNetworkMigrationCodeGenerationResponse(
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    return {
      if (jobID != null) 'jobID': jobID,
    };
  }
}

class StartNetworkMigrationDeployerJobResponse {
  /// The unique identifier of the deployer job that was started.
  final String? jobID;

  StartNetworkMigrationDeployerJobResponse({
    this.jobID,
  });

  factory StartNetworkMigrationDeployerJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartNetworkMigrationDeployerJobResponse(
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    return {
      if (jobID != null) 'jobID': jobID,
    };
  }
}

class StartNetworkMigrationMappingResponse {
  /// The unique identifier of the mapping job that was started.
  final String? jobID;

  StartNetworkMigrationMappingResponse({
    this.jobID,
  });

  factory StartNetworkMigrationMappingResponse.fromJson(
      Map<String, dynamic> json) {
    return StartNetworkMigrationMappingResponse(
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    return {
      if (jobID != null) 'jobID': jobID,
    };
  }
}

class StartNetworkMigrationMappingUpdateResponse {
  /// The unique identifier of the mapping update job that was started.
  final String? jobID;

  StartNetworkMigrationMappingUpdateResponse({
    this.jobID,
  });

  factory StartNetworkMigrationMappingUpdateResponse.fromJson(
      Map<String, dynamic> json) {
    return StartNetworkMigrationMappingUpdateResponse(
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    return {
      if (jobID != null) 'jobID': jobID,
    };
  }
}

class NetworkMigrationMapperSegment {
  /// The checksum of the segment data for integrity verification.
  final Checksum? checksum;

  /// The timestamp when the segment was created.
  final DateTime? createdAt;

  /// A description of the segment.
  final String? description;

  /// The unique identifier of the job that created this segment.
  final String? jobID;

  /// The logical identifier for the segment in the infrastructure code.
  final String? logicalID;

  /// The name of the segment.
  final String? name;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the network migration execution.
  final String? networkMigrationExecutionID;

  /// The S3 location where segment artifacts are stored.
  final S3Configuration? outputS3Configuration;

  /// A list of other segments that this segment depends on or references.
  final List<String>? referencedSegments;

  /// Scope tags for the segment.
  final Map<String, String>? scopeTags;

  /// The unique identifier of the segment.
  final String? segmentID;

  /// The type of the segment, such as VPC, subnet, or security group.
  final NetworkMigrationMapperSegmentType? segmentType;

  /// The target AWS account where this segment will be deployed.
  final String? targetAccount;

  /// The timestamp when the segment was last updated.
  final DateTime? updatedAt;

  NetworkMigrationMapperSegment({
    this.checksum,
    this.createdAt,
    this.description,
    this.jobID,
    this.logicalID,
    this.name,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.outputS3Configuration,
    this.referencedSegments,
    this.scopeTags,
    this.segmentID,
    this.segmentType,
    this.targetAccount,
    this.updatedAt,
  });

  factory NetworkMigrationMapperSegment.fromJson(Map<String, dynamic> json) {
    return NetworkMigrationMapperSegment(
      checksum: json['checksum'] != null
          ? Checksum.fromJson(json['checksum'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      jobID: json['jobID'] as String?,
      logicalID: json['logicalID'] as String?,
      name: json['name'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      outputS3Configuration: json['outputS3Configuration'] != null
          ? S3Configuration.fromJson(
              json['outputS3Configuration'] as Map<String, dynamic>)
          : null,
      referencedSegments: (json['referencedSegments'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      scopeTags: (json['scopeTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      segmentID: json['segmentID'] as String?,
      segmentType: (json['segmentType'] as String?)
          ?.let(NetworkMigrationMapperSegmentType.fromString),
      targetAccount: json['targetAccount'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final createdAt = this.createdAt;
    final description = this.description;
    final jobID = this.jobID;
    final logicalID = this.logicalID;
    final name = this.name;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final outputS3Configuration = this.outputS3Configuration;
    final referencedSegments = this.referencedSegments;
    final scopeTags = this.scopeTags;
    final segmentID = this.segmentID;
    final segmentType = this.segmentType;
    final targetAccount = this.targetAccount;
    final updatedAt = this.updatedAt;
    return {
      if (checksum != null) 'checksum': checksum,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (jobID != null) 'jobID': jobID,
      if (logicalID != null) 'logicalID': logicalID,
      if (name != null) 'name': name,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (outputS3Configuration != null)
        'outputS3Configuration': outputS3Configuration,
      if (referencedSegments != null) 'referencedSegments': referencedSegments,
      if (scopeTags != null) 'scopeTags': scopeTags,
      if (segmentID != null) 'segmentID': segmentID,
      if (segmentType != null) 'segmentType': segmentType.value,
      if (targetAccount != null) 'targetAccount': targetAccount,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ReplicationConfigurationTemplate {
  /// Replication Configuration template ID.
  final String replicationConfigurationTemplateID;

  /// Replication Configuration template ARN.
  final String? arn;

  /// Replication Configuration template associate default Application Migration
  /// Service Security group.
  final bool? associateDefaultSecurityGroup;

  /// Replication Configuration template bandwidth throttling.
  final int? bandwidthThrottling;

  /// Replication Configuration template create Public IP.
  final bool? createPublicIP;

  /// Replication Configuration template data plane routing.
  final ReplicationConfigurationDataPlaneRouting? dataPlaneRouting;

  /// Replication Configuration template use default large Staging Disk type.
  final ReplicationConfigurationDefaultLargeStagingDiskType?
      defaultLargeStagingDiskType;

  /// Replication Configuration template EBS encryption.
  final ReplicationConfigurationEbsEncryption? ebsEncryption;

  /// Replication Configuration template EBS encryption key ARN.
  final String? ebsEncryptionKeyArn;

  /// Replication Configuration template internet protocol.
  final InternetProtocol? internetProtocol;

  /// Replication Configuration template server instance type.
  final String? replicationServerInstanceType;

  /// Replication Configuration template server Security Groups IDs.
  final List<String>? replicationServersSecurityGroupsIDs;

  /// Replication Configuration template Staging Area subnet ID.
  final String? stagingAreaSubnetId;

  /// Replication Configuration template Staging Area Tags.
  final Map<String, String>? stagingAreaTags;

  /// Replication Configuration template store snapshot on local zone.
  final bool? storeSnapshotOnLocalZone;

  /// Replication Configuration template Tags.
  final Map<String, String>? tags;

  /// Replication Configuration template use Dedicated Replication Server.
  final bool? useDedicatedReplicationServer;

  /// Replication Configuration template use Fips Endpoint.
  final bool? useFipsEndpoint;

  ReplicationConfigurationTemplate({
    required this.replicationConfigurationTemplateID,
    this.arn,
    this.associateDefaultSecurityGroup,
    this.bandwidthThrottling,
    this.createPublicIP,
    this.dataPlaneRouting,
    this.defaultLargeStagingDiskType,
    this.ebsEncryption,
    this.ebsEncryptionKeyArn,
    this.internetProtocol,
    this.replicationServerInstanceType,
    this.replicationServersSecurityGroupsIDs,
    this.stagingAreaSubnetId,
    this.stagingAreaTags,
    this.storeSnapshotOnLocalZone,
    this.tags,
    this.useDedicatedReplicationServer,
    this.useFipsEndpoint,
  });

  factory ReplicationConfigurationTemplate.fromJson(Map<String, dynamic> json) {
    return ReplicationConfigurationTemplate(
      replicationConfigurationTemplateID:
          (json['replicationConfigurationTemplateID'] as String?) ?? '',
      arn: json['arn'] as String?,
      associateDefaultSecurityGroup:
          json['associateDefaultSecurityGroup'] as bool?,
      bandwidthThrottling: json['bandwidthThrottling'] as int?,
      createPublicIP: json['createPublicIP'] as bool?,
      dataPlaneRouting: (json['dataPlaneRouting'] as String?)
          ?.let(ReplicationConfigurationDataPlaneRouting.fromString),
      defaultLargeStagingDiskType: (json['defaultLargeStagingDiskType']
              as String?)
          ?.let(ReplicationConfigurationDefaultLargeStagingDiskType.fromString),
      ebsEncryption: (json['ebsEncryption'] as String?)
          ?.let(ReplicationConfigurationEbsEncryption.fromString),
      ebsEncryptionKeyArn: json['ebsEncryptionKeyArn'] as String?,
      internetProtocol: (json['internetProtocol'] as String?)
          ?.let(InternetProtocol.fromString),
      replicationServerInstanceType:
          json['replicationServerInstanceType'] as String?,
      replicationServersSecurityGroupsIDs:
          (json['replicationServersSecurityGroupsIDs'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      stagingAreaSubnetId: json['stagingAreaSubnetId'] as String?,
      stagingAreaTags: (json['stagingAreaTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      storeSnapshotOnLocalZone: json['storeSnapshotOnLocalZone'] as bool?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useDedicatedReplicationServer:
          json['useDedicatedReplicationServer'] as bool?,
      useFipsEndpoint: json['useFipsEndpoint'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationConfigurationTemplateID =
        this.replicationConfigurationTemplateID;
    final arn = this.arn;
    final associateDefaultSecurityGroup = this.associateDefaultSecurityGroup;
    final bandwidthThrottling = this.bandwidthThrottling;
    final createPublicIP = this.createPublicIP;
    final dataPlaneRouting = this.dataPlaneRouting;
    final defaultLargeStagingDiskType = this.defaultLargeStagingDiskType;
    final ebsEncryption = this.ebsEncryption;
    final ebsEncryptionKeyArn = this.ebsEncryptionKeyArn;
    final internetProtocol = this.internetProtocol;
    final replicationServerInstanceType = this.replicationServerInstanceType;
    final replicationServersSecurityGroupsIDs =
        this.replicationServersSecurityGroupsIDs;
    final stagingAreaSubnetId = this.stagingAreaSubnetId;
    final stagingAreaTags = this.stagingAreaTags;
    final storeSnapshotOnLocalZone = this.storeSnapshotOnLocalZone;
    final tags = this.tags;
    final useDedicatedReplicationServer = this.useDedicatedReplicationServer;
    final useFipsEndpoint = this.useFipsEndpoint;
    return {
      'replicationConfigurationTemplateID': replicationConfigurationTemplateID,
      if (arn != null) 'arn': arn,
      if (associateDefaultSecurityGroup != null)
        'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (createPublicIP != null) 'createPublicIP': createPublicIP,
      if (dataPlaneRouting != null) 'dataPlaneRouting': dataPlaneRouting.value,
      if (defaultLargeStagingDiskType != null)
        'defaultLargeStagingDiskType': defaultLargeStagingDiskType.value,
      if (ebsEncryption != null) 'ebsEncryption': ebsEncryption.value,
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (internetProtocol != null) 'internetProtocol': internetProtocol.value,
      if (replicationServerInstanceType != null)
        'replicationServerInstanceType': replicationServerInstanceType,
      if (replicationServersSecurityGroupsIDs != null)
        'replicationServersSecurityGroupsIDs':
            replicationServersSecurityGroupsIDs,
      if (stagingAreaSubnetId != null)
        'stagingAreaSubnetId': stagingAreaSubnetId,
      if (stagingAreaTags != null) 'stagingAreaTags': stagingAreaTags,
      if (storeSnapshotOnLocalZone != null)
        'storeSnapshotOnLocalZone': storeSnapshotOnLocalZone,
      if (tags != null) 'tags': tags,
      if (useDedicatedReplicationServer != null)
        'useDedicatedReplicationServer': useDedicatedReplicationServer,
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
    };
  }
}

class DeleteReplicationConfigurationTemplateResponse {
  DeleteReplicationConfigurationTemplateResponse();

  factory DeleteReplicationConfigurationTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteReplicationConfigurationTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeReplicationConfigurationTemplatesResponse {
  /// Request to describe Replication Configuration template by items.
  final List<ReplicationConfigurationTemplate>? items;

  /// Request to describe Replication Configuration template by next token.
  final String? nextToken;

  DescribeReplicationConfigurationTemplatesResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeReplicationConfigurationTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReplicationConfigurationTemplatesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => ReplicationConfigurationTemplate.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class SourceServer {
  /// Source server application ID.
  final String? applicationID;

  /// Source server ARN.
  final String? arn;

  /// Source Server connector action.
  final SourceServerConnectorAction? connectorAction;

  /// Source server data replication info.
  final DataReplicationInfo? dataReplicationInfo;

  /// Source server fqdn for action framework.
  final String? fqdnForActionFramework;

  /// Source server archived status.
  final bool? isArchived;

  /// Source server launched instance.
  final LaunchedInstance? launchedInstance;

  /// Source server lifecycle state.
  final LifeCycle? lifeCycle;

  /// Source server replication type.
  final ReplicationType? replicationType;

  /// Source server properties.
  final SourceProperties? sourceProperties;

  /// Source server ID.
  final String? sourceServerID;

  /// Source server Tags.
  final Map<String, String>? tags;

  /// Source server user provided ID.
  final String? userProvidedID;

  /// Source server vCenter client id.
  final String? vcenterClientID;

  SourceServer({
    this.applicationID,
    this.arn,
    this.connectorAction,
    this.dataReplicationInfo,
    this.fqdnForActionFramework,
    this.isArchived,
    this.launchedInstance,
    this.lifeCycle,
    this.replicationType,
    this.sourceProperties,
    this.sourceServerID,
    this.tags,
    this.userProvidedID,
    this.vcenterClientID,
  });

  factory SourceServer.fromJson(Map<String, dynamic> json) {
    return SourceServer(
      applicationID: json['applicationID'] as String?,
      arn: json['arn'] as String?,
      connectorAction: json['connectorAction'] != null
          ? SourceServerConnectorAction.fromJson(
              json['connectorAction'] as Map<String, dynamic>)
          : null,
      dataReplicationInfo: json['dataReplicationInfo'] != null
          ? DataReplicationInfo.fromJson(
              json['dataReplicationInfo'] as Map<String, dynamic>)
          : null,
      fqdnForActionFramework: json['fqdnForActionFramework'] as String?,
      isArchived: json['isArchived'] as bool?,
      launchedInstance: json['launchedInstance'] != null
          ? LaunchedInstance.fromJson(
              json['launchedInstance'] as Map<String, dynamic>)
          : null,
      lifeCycle: json['lifeCycle'] != null
          ? LifeCycle.fromJson(json['lifeCycle'] as Map<String, dynamic>)
          : null,
      replicationType:
          (json['replicationType'] as String?)?.let(ReplicationType.fromString),
      sourceProperties: json['sourceProperties'] != null
          ? SourceProperties.fromJson(
              json['sourceProperties'] as Map<String, dynamic>)
          : null,
      sourceServerID: json['sourceServerID'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      userProvidedID: json['userProvidedID'] as String?,
      vcenterClientID: json['vcenterClientID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationID = this.applicationID;
    final arn = this.arn;
    final connectorAction = this.connectorAction;
    final dataReplicationInfo = this.dataReplicationInfo;
    final fqdnForActionFramework = this.fqdnForActionFramework;
    final isArchived = this.isArchived;
    final launchedInstance = this.launchedInstance;
    final lifeCycle = this.lifeCycle;
    final replicationType = this.replicationType;
    final sourceProperties = this.sourceProperties;
    final sourceServerID = this.sourceServerID;
    final tags = this.tags;
    final userProvidedID = this.userProvidedID;
    final vcenterClientID = this.vcenterClientID;
    return {
      if (applicationID != null) 'applicationID': applicationID,
      if (arn != null) 'arn': arn,
      if (connectorAction != null) 'connectorAction': connectorAction,
      if (dataReplicationInfo != null)
        'dataReplicationInfo': dataReplicationInfo,
      if (fqdnForActionFramework != null)
        'fqdnForActionFramework': fqdnForActionFramework,
      if (isArchived != null) 'isArchived': isArchived,
      if (launchedInstance != null) 'launchedInstance': launchedInstance,
      if (lifeCycle != null) 'lifeCycle': lifeCycle,
      if (replicationType != null) 'replicationType': replicationType.value,
      if (sourceProperties != null) 'sourceProperties': sourceProperties,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (tags != null) 'tags': tags,
      if (userProvidedID != null) 'userProvidedID': userProvidedID,
      if (vcenterClientID != null) 'vcenterClientID': vcenterClientID,
    };
  }
}

class DeleteSourceServerResponse {
  DeleteSourceServerResponse();

  factory DeleteSourceServerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSourceServerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeSourceServersResponse {
  /// Request to filter Source Servers list by item.
  final List<SourceServer>? items;

  /// Request to filter Source Servers next token.
  final String? nextToken;

  DescribeSourceServersResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeSourceServersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSourceServersResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => SourceServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class LaunchConfiguration {
  /// Launch configuration boot mode.
  final BootMode? bootMode;

  /// Copy Private IP during Launch Configuration.
  final bool? copyPrivateIp;

  /// Copy Tags during Launch Configuration.
  final bool? copyTags;

  /// Launch configuration EC2 Launch template ID.
  final String? ec2LaunchTemplateID;

  /// Enable map auto tagging.
  final bool? enableMapAutoTagging;

  /// Launch disposition for launch configuration.
  final LaunchDisposition? launchDisposition;

  /// Launch configuration OS licensing.
  final Licensing? licensing;

  /// Map auto tagging MPE ID.
  final String? mapAutoTaggingMpeID;

  /// Launch configuration name.
  final String? name;
  final PostLaunchActions? postLaunchActions;

  /// Launch configuration Source Server ID.
  final String? sourceServerID;

  /// Launch configuration Target instance type right sizing method.
  final TargetInstanceTypeRightSizingMethod?
      targetInstanceTypeRightSizingMethod;

  LaunchConfiguration({
    this.bootMode,
    this.copyPrivateIp,
    this.copyTags,
    this.ec2LaunchTemplateID,
    this.enableMapAutoTagging,
    this.launchDisposition,
    this.licensing,
    this.mapAutoTaggingMpeID,
    this.name,
    this.postLaunchActions,
    this.sourceServerID,
    this.targetInstanceTypeRightSizingMethod,
  });

  factory LaunchConfiguration.fromJson(Map<String, dynamic> json) {
    return LaunchConfiguration(
      bootMode: (json['bootMode'] as String?)?.let(BootMode.fromString),
      copyPrivateIp: json['copyPrivateIp'] as bool?,
      copyTags: json['copyTags'] as bool?,
      ec2LaunchTemplateID: json['ec2LaunchTemplateID'] as String?,
      enableMapAutoTagging: json['enableMapAutoTagging'] as bool?,
      launchDisposition: (json['launchDisposition'] as String?)
          ?.let(LaunchDisposition.fromString),
      licensing: json['licensing'] != null
          ? Licensing.fromJson(json['licensing'] as Map<String, dynamic>)
          : null,
      mapAutoTaggingMpeID: json['mapAutoTaggingMpeID'] as String?,
      name: json['name'] as String?,
      postLaunchActions: json['postLaunchActions'] != null
          ? PostLaunchActions.fromJson(
              json['postLaunchActions'] as Map<String, dynamic>)
          : null,
      sourceServerID: json['sourceServerID'] as String?,
      targetInstanceTypeRightSizingMethod:
          (json['targetInstanceTypeRightSizingMethod'] as String?)
              ?.let(TargetInstanceTypeRightSizingMethod.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final bootMode = this.bootMode;
    final copyPrivateIp = this.copyPrivateIp;
    final copyTags = this.copyTags;
    final ec2LaunchTemplateID = this.ec2LaunchTemplateID;
    final enableMapAutoTagging = this.enableMapAutoTagging;
    final launchDisposition = this.launchDisposition;
    final licensing = this.licensing;
    final mapAutoTaggingMpeID = this.mapAutoTaggingMpeID;
    final name = this.name;
    final postLaunchActions = this.postLaunchActions;
    final sourceServerID = this.sourceServerID;
    final targetInstanceTypeRightSizingMethod =
        this.targetInstanceTypeRightSizingMethod;
    return {
      if (bootMode != null) 'bootMode': bootMode.value,
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (ec2LaunchTemplateID != null)
        'ec2LaunchTemplateID': ec2LaunchTemplateID,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.value,
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
      if (name != null) 'name': name,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.value,
    };
  }
}

class ReplicationConfiguration {
  /// Replication Configuration associate default Application Migration Service
  /// Security Group.
  final bool? associateDefaultSecurityGroup;

  /// Replication Configuration set bandwidth throttling.
  final int? bandwidthThrottling;

  /// Replication Configuration create Public IP.
  final bool? createPublicIP;

  /// Replication Configuration data plane routing.
  final ReplicationConfigurationDataPlaneRouting? dataPlaneRouting;

  /// Replication Configuration use default large Staging Disks.
  final ReplicationConfigurationDefaultLargeStagingDiskType?
      defaultLargeStagingDiskType;

  /// Replication Configuration EBS encryption.
  final ReplicationConfigurationEbsEncryption? ebsEncryption;

  /// Replication Configuration EBS encryption key ARN.
  final String? ebsEncryptionKeyArn;

  /// Replication Configuration internet protocol.
  final InternetProtocol? internetProtocol;

  /// Replication Configuration name.
  final String? name;

  /// Replication Configuration replicated disks.
  final List<ReplicationConfigurationReplicatedDisk>? replicatedDisks;

  /// Replication Configuration Replication Server instance type.
  final String? replicationServerInstanceType;

  /// Replication Configuration Replication Server Security Group IDs.
  final List<String>? replicationServersSecurityGroupsIDs;

  /// Replication Configuration Source Server ID.
  final String? sourceServerID;

  /// Replication Configuration Staging Area subnet ID.
  final String? stagingAreaSubnetId;

  /// Replication Configuration Staging Area tags.
  final Map<String, String>? stagingAreaTags;

  /// Replication Configuration store snapshot on local zone.
  final bool? storeSnapshotOnLocalZone;

  /// Replication Configuration use Dedicated Replication Server.
  final bool? useDedicatedReplicationServer;

  /// Replication Configuration use Fips Endpoint.
  final bool? useFipsEndpoint;

  ReplicationConfiguration({
    this.associateDefaultSecurityGroup,
    this.bandwidthThrottling,
    this.createPublicIP,
    this.dataPlaneRouting,
    this.defaultLargeStagingDiskType,
    this.ebsEncryption,
    this.ebsEncryptionKeyArn,
    this.internetProtocol,
    this.name,
    this.replicatedDisks,
    this.replicationServerInstanceType,
    this.replicationServersSecurityGroupsIDs,
    this.sourceServerID,
    this.stagingAreaSubnetId,
    this.stagingAreaTags,
    this.storeSnapshotOnLocalZone,
    this.useDedicatedReplicationServer,
    this.useFipsEndpoint,
  });

  factory ReplicationConfiguration.fromJson(Map<String, dynamic> json) {
    return ReplicationConfiguration(
      associateDefaultSecurityGroup:
          json['associateDefaultSecurityGroup'] as bool?,
      bandwidthThrottling: json['bandwidthThrottling'] as int?,
      createPublicIP: json['createPublicIP'] as bool?,
      dataPlaneRouting: (json['dataPlaneRouting'] as String?)
          ?.let(ReplicationConfigurationDataPlaneRouting.fromString),
      defaultLargeStagingDiskType: (json['defaultLargeStagingDiskType']
              as String?)
          ?.let(ReplicationConfigurationDefaultLargeStagingDiskType.fromString),
      ebsEncryption: (json['ebsEncryption'] as String?)
          ?.let(ReplicationConfigurationEbsEncryption.fromString),
      ebsEncryptionKeyArn: json['ebsEncryptionKeyArn'] as String?,
      internetProtocol: (json['internetProtocol'] as String?)
          ?.let(InternetProtocol.fromString),
      name: json['name'] as String?,
      replicatedDisks: (json['replicatedDisks'] as List?)
          ?.nonNulls
          .map((e) => ReplicationConfigurationReplicatedDisk.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      replicationServerInstanceType:
          json['replicationServerInstanceType'] as String?,
      replicationServersSecurityGroupsIDs:
          (json['replicationServersSecurityGroupsIDs'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      sourceServerID: json['sourceServerID'] as String?,
      stagingAreaSubnetId: json['stagingAreaSubnetId'] as String?,
      stagingAreaTags: (json['stagingAreaTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      storeSnapshotOnLocalZone: json['storeSnapshotOnLocalZone'] as bool?,
      useDedicatedReplicationServer:
          json['useDedicatedReplicationServer'] as bool?,
      useFipsEndpoint: json['useFipsEndpoint'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final associateDefaultSecurityGroup = this.associateDefaultSecurityGroup;
    final bandwidthThrottling = this.bandwidthThrottling;
    final createPublicIP = this.createPublicIP;
    final dataPlaneRouting = this.dataPlaneRouting;
    final defaultLargeStagingDiskType = this.defaultLargeStagingDiskType;
    final ebsEncryption = this.ebsEncryption;
    final ebsEncryptionKeyArn = this.ebsEncryptionKeyArn;
    final internetProtocol = this.internetProtocol;
    final name = this.name;
    final replicatedDisks = this.replicatedDisks;
    final replicationServerInstanceType = this.replicationServerInstanceType;
    final replicationServersSecurityGroupsIDs =
        this.replicationServersSecurityGroupsIDs;
    final sourceServerID = this.sourceServerID;
    final stagingAreaSubnetId = this.stagingAreaSubnetId;
    final stagingAreaTags = this.stagingAreaTags;
    final storeSnapshotOnLocalZone = this.storeSnapshotOnLocalZone;
    final useDedicatedReplicationServer = this.useDedicatedReplicationServer;
    final useFipsEndpoint = this.useFipsEndpoint;
    return {
      if (associateDefaultSecurityGroup != null)
        'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (createPublicIP != null) 'createPublicIP': createPublicIP,
      if (dataPlaneRouting != null) 'dataPlaneRouting': dataPlaneRouting.value,
      if (defaultLargeStagingDiskType != null)
        'defaultLargeStagingDiskType': defaultLargeStagingDiskType.value,
      if (ebsEncryption != null) 'ebsEncryption': ebsEncryption.value,
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (internetProtocol != null) 'internetProtocol': internetProtocol.value,
      if (name != null) 'name': name,
      if (replicatedDisks != null) 'replicatedDisks': replicatedDisks,
      if (replicationServerInstanceType != null)
        'replicationServerInstanceType': replicationServerInstanceType,
      if (replicationServersSecurityGroupsIDs != null)
        'replicationServersSecurityGroupsIDs':
            replicationServersSecurityGroupsIDs,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (stagingAreaSubnetId != null)
        'stagingAreaSubnetId': stagingAreaSubnetId,
      if (stagingAreaTags != null) 'stagingAreaTags': stagingAreaTags,
      if (storeSnapshotOnLocalZone != null)
        'storeSnapshotOnLocalZone': storeSnapshotOnLocalZone,
      if (useDedicatedReplicationServer != null)
        'useDedicatedReplicationServer': useDedicatedReplicationServer,
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
    };
  }
}

class ListSourceServerActionsResponse {
  /// List of source server post migration custom actions.
  final List<SourceServerActionDocument>? items;

  /// Next token returned when listing source server post migration custom
  /// actions.
  final String? nextToken;

  ListSourceServerActionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListSourceServerActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSourceServerActionsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) =>
              SourceServerActionDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class SourceServerActionDocument {
  /// Source server post migration custom action ID.
  final String? actionID;

  /// Source server post migration custom action name.
  final String? actionName;

  /// Source server post migration custom action active status.
  final bool? active;

  /// Source server post migration custom action category.
  final ActionCategory? category;

  /// Source server post migration custom action description.
  final String? description;

  /// Source server post migration custom action document identifier.
  final String? documentIdentifier;

  /// Source server post migration custom action document version.
  final String? documentVersion;

  /// Source server post migration custom action external parameters.
  final Map<String, SsmExternalParameter>? externalParameters;

  /// Source server post migration custom action must succeed for cutover.
  final bool? mustSucceedForCutover;

  /// Source server post migration custom action order.
  final int? order;

  /// Source server post migration custom action parameters.
  final Map<String, List<SsmParameterStoreParameter>>? parameters;

  /// Source server post migration custom action timeout in seconds.
  final int? timeoutSeconds;

  SourceServerActionDocument({
    this.actionID,
    this.actionName,
    this.active,
    this.category,
    this.description,
    this.documentIdentifier,
    this.documentVersion,
    this.externalParameters,
    this.mustSucceedForCutover,
    this.order,
    this.parameters,
    this.timeoutSeconds,
  });

  factory SourceServerActionDocument.fromJson(Map<String, dynamic> json) {
    return SourceServerActionDocument(
      actionID: json['actionID'] as String?,
      actionName: json['actionName'] as String?,
      active: json['active'] as bool?,
      category: (json['category'] as String?)?.let(ActionCategory.fromString),
      description: json['description'] as String?,
      documentIdentifier: json['documentIdentifier'] as String?,
      documentVersion: json['documentVersion'] as String?,
      externalParameters: (json['externalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, SsmExternalParameter.fromJson(e as Map<String, dynamic>))),
      mustSucceedForCutover: json['mustSucceedForCutover'] as bool?,
      order: json['order'] as int?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => SsmParameterStoreParameter.fromJson(
                      e as Map<String, dynamic>))
                  .toList())),
      timeoutSeconds: json['timeoutSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionID = this.actionID;
    final actionName = this.actionName;
    final active = this.active;
    final category = this.category;
    final description = this.description;
    final documentIdentifier = this.documentIdentifier;
    final documentVersion = this.documentVersion;
    final externalParameters = this.externalParameters;
    final mustSucceedForCutover = this.mustSucceedForCutover;
    final order = this.order;
    final parameters = this.parameters;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      if (actionID != null) 'actionID': actionID,
      if (actionName != null) 'actionName': actionName,
      if (active != null) 'active': active,
      if (category != null) 'category': category.value,
      if (description != null) 'description': description,
      if (documentIdentifier != null) 'documentIdentifier': documentIdentifier,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (order != null) 'order': order,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
  }
}

class RemoveSourceServerActionResponse {
  RemoveSourceServerActionResponse();

  factory RemoveSourceServerActionResponse.fromJson(Map<String, dynamic> _) {
    return RemoveSourceServerActionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartCutoverResponse {
  /// Start Cutover Job response.
  final Job? job;

  StartCutoverResponse({
    this.job,
  });

  factory StartCutoverResponse.fromJson(Map<String, dynamic> json) {
    return StartCutoverResponse(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

class StartTestResponse {
  /// Start Test Job response.
  final Job? job;

  StartTestResponse({
    this.job,
  });

  factory StartTestResponse.fromJson(Map<String, dynamic> json) {
    return StartTestResponse(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

class TerminateTargetInstancesResponse {
  /// Terminate Target instance Job response.
  final Job? job;

  TerminateTargetInstancesResponse({
    this.job,
  });

  factory TerminateTargetInstancesResponse.fromJson(Map<String, dynamic> json) {
    return TerminateTargetInstancesResponse(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

class DescribeVcenterClientsResponse {
  /// List of items returned by DescribeVcenterClients.
  final List<VcenterClient>? items;

  /// Next pagination token returned from DescribeVcenterClients.
  final String? nextToken;

  DescribeVcenterClientsResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeVcenterClientsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVcenterClientsResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => VcenterClient.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class Wave {
  /// Wave ARN.
  final String? arn;

  /// Wave creation dateTime.
  final String? creationDateTime;

  /// Wave description.
  final String? description;

  /// Wave archival status.
  final bool? isArchived;

  /// Wave last modified dateTime.
  final String? lastModifiedDateTime;

  /// Wave name.
  final String? name;

  /// Wave tags.
  final Map<String, String>? tags;

  /// Wave aggregated status.
  final WaveAggregatedStatus? waveAggregatedStatus;

  /// Wave ID.
  final String? waveID;

  Wave({
    this.arn,
    this.creationDateTime,
    this.description,
    this.isArchived,
    this.lastModifiedDateTime,
    this.name,
    this.tags,
    this.waveAggregatedStatus,
    this.waveID,
  });

  factory Wave.fromJson(Map<String, dynamic> json) {
    return Wave(
      arn: json['arn'] as String?,
      creationDateTime: json['creationDateTime'] as String?,
      description: json['description'] as String?,
      isArchived: json['isArchived'] as bool?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      waveAggregatedStatus: json['waveAggregatedStatus'] != null
          ? WaveAggregatedStatus.fromJson(
              json['waveAggregatedStatus'] as Map<String, dynamic>)
          : null,
      waveID: json['waveID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final isArchived = this.isArchived;
    final lastModifiedDateTime = this.lastModifiedDateTime;
    final name = this.name;
    final tags = this.tags;
    final waveAggregatedStatus = this.waveAggregatedStatus;
    final waveID = this.waveID;
    return {
      if (arn != null) 'arn': arn,
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (description != null) 'description': description,
      if (isArchived != null) 'isArchived': isArchived,
      if (lastModifiedDateTime != null)
        'lastModifiedDateTime': lastModifiedDateTime,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (waveAggregatedStatus != null)
        'waveAggregatedStatus': waveAggregatedStatus,
      if (waveID != null) 'waveID': waveID,
    };
  }
}

class DeleteWaveResponse {
  DeleteWaveResponse();

  factory DeleteWaveResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWaveResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ListWavesResponse {
  /// Waves list.
  final List<Wave>? items;

  /// Response next token.
  final String? nextToken;

  ListWavesResponse({
    this.items,
    this.nextToken,
  });

  factory ListWavesResponse.fromJson(Map<String, dynamic> json) {
    return ListWavesResponse(
      items: (json['items'] as List?)
          ?.nonNulls
          .map((e) => Wave.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class AssociateApplicationsResponse {
  AssociateApplicationsResponse();

  factory AssociateApplicationsResponse.fromJson(Map<String, dynamic> _) {
    return AssociateApplicationsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateApplicationsResponse {
  DisassociateApplicationsResponse();

  factory DisassociateApplicationsResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateApplicationsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Waves list filters.
class ListWavesRequestFilters {
  /// Filter waves list by archival status.
  final bool? isArchived;

  /// Filter waves list by wave ID.
  final List<String>? waveIDs;

  ListWavesRequestFilters({
    this.isArchived,
    this.waveIDs,
  });

  Map<String, dynamic> toJson() {
    final isArchived = this.isArchived;
    final waveIDs = this.waveIDs;
    return {
      if (isArchived != null) 'isArchived': isArchived,
      if (waveIDs != null) 'waveIDs': waveIDs,
    };
  }
}

/// Wave aggregated status.
class WaveAggregatedStatus {
  /// Wave aggregated status health status.
  final WaveHealthStatus? healthStatus;

  /// Wave aggregated status last update dateTime.
  final String? lastUpdateDateTime;

  /// Wave aggregated status progress status.
  final WaveProgressStatus? progressStatus;

  /// DateTime marking when the first source server in the wave started
  /// replication.
  final String? replicationStartedDateTime;

  /// Wave aggregated status total applications amount.
  final int? totalApplications;

  WaveAggregatedStatus({
    this.healthStatus,
    this.lastUpdateDateTime,
    this.progressStatus,
    this.replicationStartedDateTime,
    this.totalApplications,
  });

  factory WaveAggregatedStatus.fromJson(Map<String, dynamic> json) {
    return WaveAggregatedStatus(
      healthStatus:
          (json['healthStatus'] as String?)?.let(WaveHealthStatus.fromString),
      lastUpdateDateTime: json['lastUpdateDateTime'] as String?,
      progressStatus: (json['progressStatus'] as String?)
          ?.let(WaveProgressStatus.fromString),
      replicationStartedDateTime: json['replicationStartedDateTime'] as String?,
      totalApplications: json['totalApplications'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthStatus = this.healthStatus;
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final progressStatus = this.progressStatus;
    final replicationStartedDateTime = this.replicationStartedDateTime;
    final totalApplications = this.totalApplications;
    return {
      if (healthStatus != null) 'healthStatus': healthStatus.value,
      if (lastUpdateDateTime != null) 'lastUpdateDateTime': lastUpdateDateTime,
      if (progressStatus != null) 'progressStatus': progressStatus.value,
      if (replicationStartedDateTime != null)
        'replicationStartedDateTime': replicationStartedDateTime,
      if (totalApplications != null) 'totalApplications': totalApplications,
    };
  }
}

class WaveHealthStatus {
  static const healthy = WaveHealthStatus._('HEALTHY');
  static const lagging = WaveHealthStatus._('LAGGING');
  static const error = WaveHealthStatus._('ERROR');

  final String value;

  const WaveHealthStatus._(this.value);

  static const values = [healthy, lagging, error];

  static WaveHealthStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaveHealthStatus._(value));

  @override
  bool operator ==(other) => other is WaveHealthStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class WaveProgressStatus {
  static const notStarted = WaveProgressStatus._('NOT_STARTED');
  static const inProgress = WaveProgressStatus._('IN_PROGRESS');
  static const completed = WaveProgressStatus._('COMPLETED');

  final String value;

  const WaveProgressStatus._(this.value);

  static const values = [notStarted, inProgress, completed];

  static WaveProgressStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaveProgressStatus._(value));

  @override
  bool operator ==(other) =>
      other is WaveProgressStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// vCenter client.
class VcenterClient {
  /// Arn of vCenter client.
  final String? arn;

  /// Datacenter name of vCenter client.
  final String? datacenterName;

  /// Hostname of vCenter client .
  final String? hostname;

  /// Last seen time of vCenter client.
  final String? lastSeenDatetime;

  /// Tags for Source Server of vCenter client.
  final Map<String, String>? sourceServerTags;

  /// Tags for vCenter client.
  final Map<String, String>? tags;

  /// ID of vCenter client.
  final String? vcenterClientID;

  /// Vcenter UUID of vCenter client.
  final String? vcenterUUID;

  VcenterClient({
    this.arn,
    this.datacenterName,
    this.hostname,
    this.lastSeenDatetime,
    this.sourceServerTags,
    this.tags,
    this.vcenterClientID,
    this.vcenterUUID,
  });

  factory VcenterClient.fromJson(Map<String, dynamic> json) {
    return VcenterClient(
      arn: json['arn'] as String?,
      datacenterName: json['datacenterName'] as String?,
      hostname: json['hostname'] as String?,
      lastSeenDatetime: json['lastSeenDatetime'] as String?,
      sourceServerTags: (json['sourceServerTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vcenterClientID: json['vcenterClientID'] as String?,
      vcenterUUID: json['vcenterUUID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final datacenterName = this.datacenterName;
    final hostname = this.hostname;
    final lastSeenDatetime = this.lastSeenDatetime;
    final sourceServerTags = this.sourceServerTags;
    final tags = this.tags;
    final vcenterClientID = this.vcenterClientID;
    final vcenterUUID = this.vcenterUUID;
    return {
      if (arn != null) 'arn': arn,
      if (datacenterName != null) 'datacenterName': datacenterName,
      if (hostname != null) 'hostname': hostname,
      if (lastSeenDatetime != null) 'lastSeenDatetime': lastSeenDatetime,
      if (sourceServerTags != null) 'sourceServerTags': sourceServerTags,
      if (tags != null) 'tags': tags,
      if (vcenterClientID != null) 'vcenterClientID': vcenterClientID,
      if (vcenterUUID != null) 'vcenterUUID': vcenterUUID,
    };
  }
}

/// Job.
class Job {
  /// Job ID.
  final String jobID;

  /// the ARN of the specific Job.
  final String? arn;

  /// Job creation time.
  final String? creationDateTime;

  /// Job end time.
  final String? endDateTime;

  /// Job initiated by field.
  final InitiatedBy? initiatedBy;

  /// Servers participating in a specific Job.
  final List<ParticipatingServer>? participatingServers;

  /// Job status.
  final JobStatus? status;

  /// Tags associated with specific Job.
  final Map<String, String>? tags;

  /// Job type.
  final JobType? type;

  Job({
    required this.jobID,
    this.arn,
    this.creationDateTime,
    this.endDateTime,
    this.initiatedBy,
    this.participatingServers,
    this.status,
    this.tags,
    this.type,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      jobID: (json['jobID'] as String?) ?? '',
      arn: json['arn'] as String?,
      creationDateTime: json['creationDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      initiatedBy:
          (json['initiatedBy'] as String?)?.let(InitiatedBy.fromString),
      participatingServers: (json['participatingServers'] as List?)
          ?.nonNulls
          .map((e) => ParticipatingServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.let(JobStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.let(JobType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final initiatedBy = this.initiatedBy;
    final participatingServers = this.participatingServers;
    final status = this.status;
    final tags = this.tags;
    final type = this.type;
    return {
      'jobID': jobID,
      if (arn != null) 'arn': arn,
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (endDateTime != null) 'endDateTime': endDateTime,
      if (initiatedBy != null) 'initiatedBy': initiatedBy.value,
      if (participatingServers != null)
        'participatingServers': participatingServers,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
    };
  }
}

class JobType {
  static const launch = JobType._('LAUNCH');
  static const terminate = JobType._('TERMINATE');

  final String value;

  const JobType._(this.value);

  static const values = [launch, terminate];

  static JobType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobType._(value));

  @override
  bool operator ==(other) => other is JobType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class InitiatedBy {
  static const startTest = InitiatedBy._('START_TEST');
  static const startCutover = InitiatedBy._('START_CUTOVER');
  static const diagnostic = InitiatedBy._('DIAGNOSTIC');
  static const terminate = InitiatedBy._('TERMINATE');

  final String value;

  const InitiatedBy._(this.value);

  static const values = [startTest, startCutover, diagnostic, terminate];

  static InitiatedBy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InitiatedBy._(value));

  @override
  bool operator ==(other) => other is InitiatedBy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class JobStatus {
  static const pending = JobStatus._('PENDING');
  static const started = JobStatus._('STARTED');
  static const completed = JobStatus._('COMPLETED');

  final String value;

  const JobStatus._(this.value);

  static const values = [pending, started, completed];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Server participating in Job.
class ParticipatingServer {
  /// Participating server Source Server ID.
  final String sourceServerID;

  /// Participating server launch status.
  final LaunchStatus? launchStatus;

  /// Participating server's launched ec2 instance ID.
  final String? launchedEc2InstanceID;

  /// Participating server's Post Launch Actions Status.
  final PostLaunchActionsStatus? postLaunchActionsStatus;

  ParticipatingServer({
    required this.sourceServerID,
    this.launchStatus,
    this.launchedEc2InstanceID,
    this.postLaunchActionsStatus,
  });

  factory ParticipatingServer.fromJson(Map<String, dynamic> json) {
    return ParticipatingServer(
      sourceServerID: (json['sourceServerID'] as String?) ?? '',
      launchStatus:
          (json['launchStatus'] as String?)?.let(LaunchStatus.fromString),
      launchedEc2InstanceID: json['launchedEc2InstanceID'] as String?,
      postLaunchActionsStatus: json['postLaunchActionsStatus'] != null
          ? PostLaunchActionsStatus.fromJson(
              json['postLaunchActionsStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceServerID = this.sourceServerID;
    final launchStatus = this.launchStatus;
    final launchedEc2InstanceID = this.launchedEc2InstanceID;
    final postLaunchActionsStatus = this.postLaunchActionsStatus;
    return {
      'sourceServerID': sourceServerID,
      if (launchStatus != null) 'launchStatus': launchStatus.value,
      if (launchedEc2InstanceID != null)
        'launchedEc2InstanceID': launchedEc2InstanceID,
      if (postLaunchActionsStatus != null)
        'postLaunchActionsStatus': postLaunchActionsStatus,
    };
  }
}

class LaunchStatus {
  static const pending = LaunchStatus._('PENDING');
  static const inProgress = LaunchStatus._('IN_PROGRESS');
  static const launched = LaunchStatus._('LAUNCHED');
  static const failed = LaunchStatus._('FAILED');
  static const terminated = LaunchStatus._('TERMINATED');

  final String value;

  const LaunchStatus._(this.value);

  static const values = [pending, inProgress, launched, failed, terminated];

  static LaunchStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LaunchStatus._(value));

  @override
  bool operator ==(other) => other is LaunchStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Status of the Post Launch Actions running on the Test or Cutover instance.
class PostLaunchActionsStatus {
  /// List of Post Launch Action status.
  final List<JobPostLaunchActionsLaunchStatus>?
      postLaunchActionsLaunchStatusList;

  /// Time where the AWS Systems Manager was detected as running on the Test or
  /// Cutover instance.
  final String? ssmAgentDiscoveryDatetime;

  PostLaunchActionsStatus({
    this.postLaunchActionsLaunchStatusList,
    this.ssmAgentDiscoveryDatetime,
  });

  factory PostLaunchActionsStatus.fromJson(Map<String, dynamic> json) {
    return PostLaunchActionsStatus(
      postLaunchActionsLaunchStatusList:
          (json['postLaunchActionsLaunchStatusList'] as List?)
              ?.nonNulls
              .map((e) => JobPostLaunchActionsLaunchStatus.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      ssmAgentDiscoveryDatetime: json['ssmAgentDiscoveryDatetime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final postLaunchActionsLaunchStatusList =
        this.postLaunchActionsLaunchStatusList;
    final ssmAgentDiscoveryDatetime = this.ssmAgentDiscoveryDatetime;
    return {
      if (postLaunchActionsLaunchStatusList != null)
        'postLaunchActionsLaunchStatusList': postLaunchActionsLaunchStatusList,
      if (ssmAgentDiscoveryDatetime != null)
        'ssmAgentDiscoveryDatetime': ssmAgentDiscoveryDatetime,
    };
  }
}

/// Launch Status of the Job Post Launch Actions.
class JobPostLaunchActionsLaunchStatus {
  /// AWS Systems Manager Document's execution ID of the of the Job Post Launch
  /// Actions.
  final String? executionID;

  /// AWS Systems Manager Document's execution status.
  final PostLaunchActionExecutionStatus? executionStatus;

  /// AWS Systems Manager Document's failure reason.
  final String? failureReason;

  /// AWS Systems Manager's Document of the of the Job Post Launch Actions.
  final SsmDocument? ssmDocument;

  /// AWS Systems Manager Document type.
  final SsmDocumentType? ssmDocumentType;

  JobPostLaunchActionsLaunchStatus({
    this.executionID,
    this.executionStatus,
    this.failureReason,
    this.ssmDocument,
    this.ssmDocumentType,
  });

  factory JobPostLaunchActionsLaunchStatus.fromJson(Map<String, dynamic> json) {
    return JobPostLaunchActionsLaunchStatus(
      executionID: json['executionID'] as String?,
      executionStatus: (json['executionStatus'] as String?)
          ?.let(PostLaunchActionExecutionStatus.fromString),
      failureReason: json['failureReason'] as String?,
      ssmDocument: json['ssmDocument'] != null
          ? SsmDocument.fromJson(json['ssmDocument'] as Map<String, dynamic>)
          : null,
      ssmDocumentType:
          (json['ssmDocumentType'] as String?)?.let(SsmDocumentType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final executionID = this.executionID;
    final executionStatus = this.executionStatus;
    final failureReason = this.failureReason;
    final ssmDocument = this.ssmDocument;
    final ssmDocumentType = this.ssmDocumentType;
    return {
      if (executionID != null) 'executionID': executionID,
      if (executionStatus != null) 'executionStatus': executionStatus.value,
      if (failureReason != null) 'failureReason': failureReason,
      if (ssmDocument != null) 'ssmDocument': ssmDocument,
      if (ssmDocumentType != null) 'ssmDocumentType': ssmDocumentType.value,
    };
  }
}

/// AWS Systems Manager Document.
class SsmDocument {
  /// User-friendly name for the AWS Systems Manager Document.
  final String actionName;

  /// AWS Systems Manager Document name or full ARN.
  final String ssmDocumentName;

  /// AWS Systems Manager Document external parameters.
  final Map<String, SsmExternalParameter>? externalParameters;

  /// If true, Cutover will not be enabled if the document has failed.
  final bool? mustSucceedForCutover;

  /// AWS Systems Manager Document parameters.
  final Map<String, List<SsmParameterStoreParameter>>? parameters;

  /// AWS Systems Manager Document timeout seconds.
  final int? timeoutSeconds;

  SsmDocument({
    required this.actionName,
    required this.ssmDocumentName,
    this.externalParameters,
    this.mustSucceedForCutover,
    this.parameters,
    this.timeoutSeconds,
  });

  factory SsmDocument.fromJson(Map<String, dynamic> json) {
    return SsmDocument(
      actionName: (json['actionName'] as String?) ?? '',
      ssmDocumentName: (json['ssmDocumentName'] as String?) ?? '',
      externalParameters: (json['externalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, SsmExternalParameter.fromJson(e as Map<String, dynamic>))),
      mustSucceedForCutover: json['mustSucceedForCutover'] as bool?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => SsmParameterStoreParameter.fromJson(
                      e as Map<String, dynamic>))
                  .toList())),
      timeoutSeconds: json['timeoutSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final ssmDocumentName = this.ssmDocumentName;
    final externalParameters = this.externalParameters;
    final mustSucceedForCutover = this.mustSucceedForCutover;
    final parameters = this.parameters;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      'actionName': actionName,
      'ssmDocumentName': ssmDocumentName,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
  }
}

class SsmDocumentType {
  static const automation = SsmDocumentType._('AUTOMATION');
  static const command = SsmDocumentType._('COMMAND');

  final String value;

  const SsmDocumentType._(this.value);

  static const values = [automation, command];

  static SsmDocumentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SsmDocumentType._(value));

  @override
  bool operator ==(other) => other is SsmDocumentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PostLaunchActionExecutionStatus {
  static const inProgress = PostLaunchActionExecutionStatus._('IN_PROGRESS');
  static const success = PostLaunchActionExecutionStatus._('SUCCESS');
  static const failed = PostLaunchActionExecutionStatus._('FAILED');

  final String value;

  const PostLaunchActionExecutionStatus._(this.value);

  static const values = [inProgress, success, failed];

  static PostLaunchActionExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostLaunchActionExecutionStatus._(value));

  @override
  bool operator ==(other) =>
      other is PostLaunchActionExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// AWS Systems Manager Document external parameter.
class SsmExternalParameter {
  /// AWS Systems Manager Document external parameters dynamic path.
  final String? dynamicPath;

  SsmExternalParameter({
    this.dynamicPath,
  });

  factory SsmExternalParameter.fromJson(Map<String, dynamic> json) {
    return SsmExternalParameter(
      dynamicPath: json['dynamicPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dynamicPath = this.dynamicPath;
    return {
      if (dynamicPath != null) 'dynamicPath': dynamicPath,
    };
  }
}

/// AWS Systems Manager Parameter Store parameter.
class SsmParameterStoreParameter {
  /// AWS Systems Manager Parameter Store parameter name.
  final String parameterName;

  /// AWS Systems Manager Parameter Store parameter type.
  final SsmParameterStoreParameterType parameterType;

  SsmParameterStoreParameter({
    required this.parameterName,
    required this.parameterType,
  });

  factory SsmParameterStoreParameter.fromJson(Map<String, dynamic> json) {
    return SsmParameterStoreParameter(
      parameterName: (json['parameterName'] as String?) ?? '',
      parameterType: SsmParameterStoreParameterType.fromString(
          (json['parameterType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final parameterName = this.parameterName;
    final parameterType = this.parameterType;
    return {
      'parameterName': parameterName,
      'parameterType': parameterType.value,
    };
  }
}

class SsmParameterStoreParameterType {
  static const string = SsmParameterStoreParameterType._('STRING');
  static const secureString = SsmParameterStoreParameterType._('SECURE_STRING');

  final String value;

  const SsmParameterStoreParameterType._(this.value);

  static const values = [string, secureString];

  static SsmParameterStoreParameterType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SsmParameterStoreParameterType._(value));

  @override
  bool operator ==(other) =>
      other is SsmParameterStoreParameterType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ReplicationType {
  static const agentBased = ReplicationType._('AGENT_BASED');
  static const snapshotShipping = ReplicationType._('SNAPSHOT_SHIPPING');

  final String value;

  const ReplicationType._(this.value);

  static const values = [agentBased, snapshotShipping];

  static ReplicationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationType._(value));

  @override
  bool operator ==(other) => other is ReplicationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ReplicationConfigurationDefaultLargeStagingDiskType {
  static const gp2 =
      ReplicationConfigurationDefaultLargeStagingDiskType._('GP2');
  static const st1 =
      ReplicationConfigurationDefaultLargeStagingDiskType._('ST1');
  static const gp3 =
      ReplicationConfigurationDefaultLargeStagingDiskType._('GP3');

  final String value;

  const ReplicationConfigurationDefaultLargeStagingDiskType._(this.value);

  static const values = [gp2, st1, gp3];

  static ReplicationConfigurationDefaultLargeStagingDiskType fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              ReplicationConfigurationDefaultLargeStagingDiskType._(value));

  @override
  bool operator ==(other) =>
      other is ReplicationConfigurationDefaultLargeStagingDiskType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ReplicationConfigurationEbsEncryption {
  static const $default = ReplicationConfigurationEbsEncryption._('DEFAULT');
  static const custom = ReplicationConfigurationEbsEncryption._('CUSTOM');

  final String value;

  const ReplicationConfigurationEbsEncryption._(this.value);

  static const values = [$default, custom];

  static ReplicationConfigurationEbsEncryption fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationConfigurationEbsEncryption._(value));

  @override
  bool operator ==(other) =>
      other is ReplicationConfigurationEbsEncryption && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ReplicationConfigurationDataPlaneRouting {
  static const privateIp =
      ReplicationConfigurationDataPlaneRouting._('PRIVATE_IP');
  static const publicIp =
      ReplicationConfigurationDataPlaneRouting._('PUBLIC_IP');

  final String value;

  const ReplicationConfigurationDataPlaneRouting._(this.value);

  static const values = [privateIp, publicIp];

  static ReplicationConfigurationDataPlaneRouting fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationConfigurationDataPlaneRouting._(value));

  @override
  bool operator ==(other) =>
      other is ReplicationConfigurationDataPlaneRouting && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class InternetProtocol {
  static const ipv4 = InternetProtocol._('IPV4');
  static const ipv6 = InternetProtocol._('IPV6');

  final String value;

  const InternetProtocol._(this.value);

  static const values = [ipv4, ipv6];

  static InternetProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InternetProtocol._(value));

  @override
  bool operator ==(other) => other is InternetProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Replication Configuration replicated disk.
class ReplicationConfigurationReplicatedDisk {
  /// Replication Configuration replicated disk device name.
  final String? deviceName;

  /// Replication Configuration replicated disk IOPs.
  final int? iops;

  /// Replication Configuration replicated disk boot disk.
  final bool? isBootDisk;

  /// Replication Configuration replicated disk staging disk type.
  final ReplicationConfigurationReplicatedDiskStagingDiskType? stagingDiskType;

  /// Replication Configuration replicated disk throughput.
  final int? throughput;

  ReplicationConfigurationReplicatedDisk({
    this.deviceName,
    this.iops,
    this.isBootDisk,
    this.stagingDiskType,
    this.throughput,
  });

  factory ReplicationConfigurationReplicatedDisk.fromJson(
      Map<String, dynamic> json) {
    return ReplicationConfigurationReplicatedDisk(
      deviceName: json['deviceName'] as String?,
      iops: json['iops'] as int?,
      isBootDisk: json['isBootDisk'] as bool?,
      stagingDiskType: (json['stagingDiskType'] as String?)?.let(
          ReplicationConfigurationReplicatedDiskStagingDiskType.fromString),
      throughput: json['throughput'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final iops = this.iops;
    final isBootDisk = this.isBootDisk;
    final stagingDiskType = this.stagingDiskType;
    final throughput = this.throughput;
    return {
      if (deviceName != null) 'deviceName': deviceName,
      if (iops != null) 'iops': iops,
      if (isBootDisk != null) 'isBootDisk': isBootDisk,
      if (stagingDiskType != null) 'stagingDiskType': stagingDiskType.value,
      if (throughput != null) 'throughput': throughput,
    };
  }
}

class ReplicationConfigurationReplicatedDiskStagingDiskType {
  static const auto =
      ReplicationConfigurationReplicatedDiskStagingDiskType._('AUTO');
  static const gp2 =
      ReplicationConfigurationReplicatedDiskStagingDiskType._('GP2');
  static const io1 =
      ReplicationConfigurationReplicatedDiskStagingDiskType._('IO1');
  static const sc1 =
      ReplicationConfigurationReplicatedDiskStagingDiskType._('SC1');
  static const st1 =
      ReplicationConfigurationReplicatedDiskStagingDiskType._('ST1');
  static const standard =
      ReplicationConfigurationReplicatedDiskStagingDiskType._('STANDARD');
  static const gp3 =
      ReplicationConfigurationReplicatedDiskStagingDiskType._('GP3');
  static const io2 =
      ReplicationConfigurationReplicatedDiskStagingDiskType._('IO2');

  final String value;

  const ReplicationConfigurationReplicatedDiskStagingDiskType._(this.value);

  static const values = [auto, gp2, io1, sc1, st1, standard, gp3, io2];

  static ReplicationConfigurationReplicatedDiskStagingDiskType fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              ReplicationConfigurationReplicatedDiskStagingDiskType._(value));

  @override
  bool operator ==(other) =>
      other is ReplicationConfigurationReplicatedDiskStagingDiskType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class LaunchDisposition {
  static const stopped = LaunchDisposition._('STOPPED');
  static const started = LaunchDisposition._('STARTED');

  final String value;

  const LaunchDisposition._(this.value);

  static const values = [stopped, started];

  static LaunchDisposition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LaunchDisposition._(value));

  @override
  bool operator ==(other) => other is LaunchDisposition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class TargetInstanceTypeRightSizingMethod {
  static const none = TargetInstanceTypeRightSizingMethod._('NONE');
  static const basic = TargetInstanceTypeRightSizingMethod._('BASIC');

  final String value;

  const TargetInstanceTypeRightSizingMethod._(this.value);

  static const values = [none, basic];

  static TargetInstanceTypeRightSizingMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetInstanceTypeRightSizingMethod._(value));

  @override
  bool operator ==(other) =>
      other is TargetInstanceTypeRightSizingMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configure Licensing.
class Licensing {
  /// Configure BYOL OS licensing.
  final bool? osByol;

  Licensing({
    this.osByol,
  });

  factory Licensing.fromJson(Map<String, dynamic> json) {
    return Licensing(
      osByol: json['osByol'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final osByol = this.osByol;
    return {
      if (osByol != null) 'osByol': osByol,
    };
  }
}

class BootMode {
  static const legacyBios = BootMode._('LEGACY_BIOS');
  static const uefi = BootMode._('UEFI');
  static const useSource = BootMode._('USE_SOURCE');

  final String value;

  const BootMode._(this.value);

  static const values = [legacyBios, uefi, useSource];

  static BootMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BootMode._(value));

  @override
  bool operator ==(other) => other is BootMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Post Launch Actions to executed on the Test or Cutover instance.
class PostLaunchActions {
  /// AWS Systems Manager Command's CloudWatch log group name.
  final String? cloudWatchLogGroupName;

  /// Deployment type in which AWS Systems Manager Documents will be executed.
  final PostLaunchActionsDeploymentType? deployment;

  /// AWS Systems Manager Command's logs S3 log bucket.
  final String? s3LogBucket;

  /// AWS Systems Manager Command's logs S3 output key prefix.
  final String? s3OutputKeyPrefix;

  /// AWS Systems Manager Documents.
  final List<SsmDocument>? ssmDocuments;

  PostLaunchActions({
    this.cloudWatchLogGroupName,
    this.deployment,
    this.s3LogBucket,
    this.s3OutputKeyPrefix,
    this.ssmDocuments,
  });

  factory PostLaunchActions.fromJson(Map<String, dynamic> json) {
    return PostLaunchActions(
      cloudWatchLogGroupName: json['cloudWatchLogGroupName'] as String?,
      deployment: (json['deployment'] as String?)
          ?.let(PostLaunchActionsDeploymentType.fromString),
      s3LogBucket: json['s3LogBucket'] as String?,
      s3OutputKeyPrefix: json['s3OutputKeyPrefix'] as String?,
      ssmDocuments: (json['ssmDocuments'] as List?)
          ?.nonNulls
          .map((e) => SsmDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogGroupName = this.cloudWatchLogGroupName;
    final deployment = this.deployment;
    final s3LogBucket = this.s3LogBucket;
    final s3OutputKeyPrefix = this.s3OutputKeyPrefix;
    final ssmDocuments = this.ssmDocuments;
    return {
      if (cloudWatchLogGroupName != null)
        'cloudWatchLogGroupName': cloudWatchLogGroupName,
      if (deployment != null) 'deployment': deployment.value,
      if (s3LogBucket != null) 's3LogBucket': s3LogBucket,
      if (s3OutputKeyPrefix != null) 's3OutputKeyPrefix': s3OutputKeyPrefix,
      if (ssmDocuments != null) 'ssmDocuments': ssmDocuments,
    };
  }
}

class PostLaunchActionsDeploymentType {
  static const testAndCutover =
      PostLaunchActionsDeploymentType._('TEST_AND_CUTOVER');
  static const cutoverOnly = PostLaunchActionsDeploymentType._('CUTOVER_ONLY');
  static const testOnly = PostLaunchActionsDeploymentType._('TEST_ONLY');

  final String value;

  const PostLaunchActionsDeploymentType._(this.value);

  static const values = [testAndCutover, cutoverOnly, testOnly];

  static PostLaunchActionsDeploymentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PostLaunchActionsDeploymentType._(value));

  @override
  bool operator ==(other) =>
      other is PostLaunchActionsDeploymentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ActionCategory {
  static const disasterRecovery = ActionCategory._('DISASTER_RECOVERY');
  static const operatingSystem = ActionCategory._('OPERATING_SYSTEM');
  static const licenseAndSubscription =
      ActionCategory._('LICENSE_AND_SUBSCRIPTION');
  static const validation = ActionCategory._('VALIDATION');
  static const observability = ActionCategory._('OBSERVABILITY');
  static const refactoring = ActionCategory._('REFACTORING');
  static const security = ActionCategory._('SECURITY');
  static const networking = ActionCategory._('NETWORKING');
  static const configuration = ActionCategory._('CONFIGURATION');
  static const backup = ActionCategory._('BACKUP');
  static const other = ActionCategory._('OTHER');

  final String value;

  const ActionCategory._(this.value);

  static const values = [
    disasterRecovery,
    operatingSystem,
    licenseAndSubscription,
    validation,
    observability,
    refactoring,
    security,
    networking,
    configuration,
    backup,
    other
  ];

  static ActionCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActionCategory._(value));

  @override
  bool operator ==(other) => other is ActionCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Source server post migration custom action filters.
class SourceServerActionsRequestFilters {
  /// Action IDs to filter source server post migration custom actions by.
  final List<String>? actionIDs;

  SourceServerActionsRequestFilters({
    this.actionIDs,
  });

  Map<String, dynamic> toJson() {
    final actionIDs = this.actionIDs;
    return {
      if (actionIDs != null) 'actionIDs': actionIDs,
    };
  }
}

/// The request to change the source server migration lifecycle state.
class ChangeServerLifeCycleStateSourceServerLifecycle {
  /// The request to change the source server migration lifecycle state.
  final ChangeServerLifeCycleStateSourceServerLifecycleState state;

  ChangeServerLifeCycleStateSourceServerLifecycle({
    required this.state,
  });

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.value,
    };
  }
}

class ChangeServerLifeCycleStateSourceServerLifecycleState {
  static const readyForTest =
      ChangeServerLifeCycleStateSourceServerLifecycleState._('READY_FOR_TEST');
  static const readyForCutover =
      ChangeServerLifeCycleStateSourceServerLifecycleState._(
          'READY_FOR_CUTOVER');
  static const cutover =
      ChangeServerLifeCycleStateSourceServerLifecycleState._('CUTOVER');

  final String value;

  const ChangeServerLifeCycleStateSourceServerLifecycleState._(this.value);

  static const values = [readyForTest, readyForCutover, cutover];

  static ChangeServerLifeCycleStateSourceServerLifecycleState fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              ChangeServerLifeCycleStateSourceServerLifecycleState._(value));

  @override
  bool operator ==(other) =>
      other is ChangeServerLifeCycleStateSourceServerLifecycleState &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Request to filter Source Servers list.
class DescribeSourceServersRequestFilters {
  /// Request to filter Source Servers list by application IDs.
  final List<String>? applicationIDs;

  /// Request to filter Source Servers list by archived.
  final bool? isArchived;

  /// Request to filter Source Servers list by life cycle states.
  final List<LifeCycleState>? lifeCycleStates;

  /// Request to filter Source Servers list by replication type.
  final List<ReplicationType>? replicationTypes;

  /// Request to filter Source Servers list by Source Server ID.
  final List<String>? sourceServerIDs;

  DescribeSourceServersRequestFilters({
    this.applicationIDs,
    this.isArchived,
    this.lifeCycleStates,
    this.replicationTypes,
    this.sourceServerIDs,
  });

  Map<String, dynamic> toJson() {
    final applicationIDs = this.applicationIDs;
    final isArchived = this.isArchived;
    final lifeCycleStates = this.lifeCycleStates;
    final replicationTypes = this.replicationTypes;
    final sourceServerIDs = this.sourceServerIDs;
    return {
      if (applicationIDs != null) 'applicationIDs': applicationIDs,
      if (isArchived != null) 'isArchived': isArchived,
      if (lifeCycleStates != null)
        'lifeCycleStates': lifeCycleStates.map((e) => e.value).toList(),
      if (replicationTypes != null)
        'replicationTypes': replicationTypes.map((e) => e.value).toList(),
      if (sourceServerIDs != null) 'sourceServerIDs': sourceServerIDs,
    };
  }
}

class LifeCycleState {
  static const stopped = LifeCycleState._('STOPPED');
  static const notReady = LifeCycleState._('NOT_READY');
  static const readyForTest = LifeCycleState._('READY_FOR_TEST');
  static const testing = LifeCycleState._('TESTING');
  static const readyForCutover = LifeCycleState._('READY_FOR_CUTOVER');
  static const cuttingOver = LifeCycleState._('CUTTING_OVER');
  static const cutover = LifeCycleState._('CUTOVER');
  static const disconnected = LifeCycleState._('DISCONNECTED');
  static const discovered = LifeCycleState._('DISCOVERED');
  static const pendingInstallation = LifeCycleState._('PENDING_INSTALLATION');

  final String value;

  const LifeCycleState._(this.value);

  static const values = [
    stopped,
    notReady,
    readyForTest,
    testing,
    readyForCutover,
    cuttingOver,
    cutover,
    disconnected,
    discovered,
    pendingInstallation
  ];

  static LifeCycleState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LifeCycleState._(value));

  @override
  bool operator ==(other) => other is LifeCycleState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Launched instance.
class LaunchedInstance {
  /// Launched instance EC2 ID.
  final String? ec2InstanceID;

  /// Launched instance first boot.
  final FirstBoot? firstBoot;

  /// Launched instance Job ID.
  final String? jobID;

  LaunchedInstance({
    this.ec2InstanceID,
    this.firstBoot,
    this.jobID,
  });

  factory LaunchedInstance.fromJson(Map<String, dynamic> json) {
    return LaunchedInstance(
      ec2InstanceID: json['ec2InstanceID'] as String?,
      firstBoot: (json['firstBoot'] as String?)?.let(FirstBoot.fromString),
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2InstanceID = this.ec2InstanceID;
    final firstBoot = this.firstBoot;
    final jobID = this.jobID;
    return {
      if (ec2InstanceID != null) 'ec2InstanceID': ec2InstanceID,
      if (firstBoot != null) 'firstBoot': firstBoot.value,
      if (jobID != null) 'jobID': jobID,
    };
  }
}

/// Request data replication info.
class DataReplicationInfo {
  /// Error in obtaining data replication info.
  final DataReplicationError? dataReplicationError;

  /// Request to query whether data replication has been initiated.
  final DataReplicationInitiation? dataReplicationInitiation;

  /// Request to query the data replication state.
  final DataReplicationState? dataReplicationState;

  /// Request to query the time when data replication will be complete.
  final String? etaDateTime;

  /// Request to query data replication lag duration.
  final String? lagDuration;

  /// Request to query data replication last snapshot time.
  final String? lastSnapshotDateTime;

  /// Request to query disks replicated.
  final List<DataReplicationInfoReplicatedDisk>? replicatedDisks;

  /// Replication server instance ID.
  final String? replicatorId;

  DataReplicationInfo({
    this.dataReplicationError,
    this.dataReplicationInitiation,
    this.dataReplicationState,
    this.etaDateTime,
    this.lagDuration,
    this.lastSnapshotDateTime,
    this.replicatedDisks,
    this.replicatorId,
  });

  factory DataReplicationInfo.fromJson(Map<String, dynamic> json) {
    return DataReplicationInfo(
      dataReplicationError: json['dataReplicationError'] != null
          ? DataReplicationError.fromJson(
              json['dataReplicationError'] as Map<String, dynamic>)
          : null,
      dataReplicationInitiation: json['dataReplicationInitiation'] != null
          ? DataReplicationInitiation.fromJson(
              json['dataReplicationInitiation'] as Map<String, dynamic>)
          : null,
      dataReplicationState: (json['dataReplicationState'] as String?)
          ?.let(DataReplicationState.fromString),
      etaDateTime: json['etaDateTime'] as String?,
      lagDuration: json['lagDuration'] as String?,
      lastSnapshotDateTime: json['lastSnapshotDateTime'] as String?,
      replicatedDisks: (json['replicatedDisks'] as List?)
          ?.nonNulls
          .map((e) => DataReplicationInfoReplicatedDisk.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      replicatorId: json['replicatorId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataReplicationError = this.dataReplicationError;
    final dataReplicationInitiation = this.dataReplicationInitiation;
    final dataReplicationState = this.dataReplicationState;
    final etaDateTime = this.etaDateTime;
    final lagDuration = this.lagDuration;
    final lastSnapshotDateTime = this.lastSnapshotDateTime;
    final replicatedDisks = this.replicatedDisks;
    final replicatorId = this.replicatorId;
    return {
      if (dataReplicationError != null)
        'dataReplicationError': dataReplicationError,
      if (dataReplicationInitiation != null)
        'dataReplicationInitiation': dataReplicationInitiation,
      if (dataReplicationState != null)
        'dataReplicationState': dataReplicationState.value,
      if (etaDateTime != null) 'etaDateTime': etaDateTime,
      if (lagDuration != null) 'lagDuration': lagDuration,
      if (lastSnapshotDateTime != null)
        'lastSnapshotDateTime': lastSnapshotDateTime,
      if (replicatedDisks != null) 'replicatedDisks': replicatedDisks,
      if (replicatorId != null) 'replicatorId': replicatorId,
    };
  }
}

/// Lifecycle.
class LifeCycle {
  /// Lifecycle added to service data and time.
  final String? addedToServiceDateTime;

  /// Lifecycle elapsed time and duration.
  final String? elapsedReplicationDuration;

  /// Lifecycle replication initiation date and time.
  final String? firstByteDateTime;

  /// Lifecycle last Cutover.
  final LifeCycleLastCutover? lastCutover;

  /// Lifecycle last seen date and time.
  final String? lastSeenByServiceDateTime;

  /// Lifecycle last Test.
  final LifeCycleLastTest? lastTest;

  /// Lifecycle state.
  final LifeCycleState? state;

  LifeCycle({
    this.addedToServiceDateTime,
    this.elapsedReplicationDuration,
    this.firstByteDateTime,
    this.lastCutover,
    this.lastSeenByServiceDateTime,
    this.lastTest,
    this.state,
  });

  factory LifeCycle.fromJson(Map<String, dynamic> json) {
    return LifeCycle(
      addedToServiceDateTime: json['addedToServiceDateTime'] as String?,
      elapsedReplicationDuration: json['elapsedReplicationDuration'] as String?,
      firstByteDateTime: json['firstByteDateTime'] as String?,
      lastCutover: json['lastCutover'] != null
          ? LifeCycleLastCutover.fromJson(
              json['lastCutover'] as Map<String, dynamic>)
          : null,
      lastSeenByServiceDateTime: json['lastSeenByServiceDateTime'] as String?,
      lastTest: json['lastTest'] != null
          ? LifeCycleLastTest.fromJson(json['lastTest'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.let(LifeCycleState.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final addedToServiceDateTime = this.addedToServiceDateTime;
    final elapsedReplicationDuration = this.elapsedReplicationDuration;
    final firstByteDateTime = this.firstByteDateTime;
    final lastCutover = this.lastCutover;
    final lastSeenByServiceDateTime = this.lastSeenByServiceDateTime;
    final lastTest = this.lastTest;
    final state = this.state;
    return {
      if (addedToServiceDateTime != null)
        'addedToServiceDateTime': addedToServiceDateTime,
      if (elapsedReplicationDuration != null)
        'elapsedReplicationDuration': elapsedReplicationDuration,
      if (firstByteDateTime != null) 'firstByteDateTime': firstByteDateTime,
      if (lastCutover != null) 'lastCutover': lastCutover,
      if (lastSeenByServiceDateTime != null)
        'lastSeenByServiceDateTime': lastSeenByServiceDateTime,
      if (lastTest != null) 'lastTest': lastTest,
      if (state != null) 'state': state.value,
    };
  }
}

/// Source server properties.
class SourceProperties {
  /// Source Server CPUs.
  final List<CPU>? cpus;

  /// Source Server disks.
  final List<Disk>? disks;

  /// Source server identification hints.
  final IdentificationHints? identificationHints;

  /// Source server last update date and time.
  final String? lastUpdatedDateTime;

  /// Source server network interfaces.
  final List<NetworkInterface>? networkInterfaces;

  /// Source server OS.
  final OS? os;

  /// Source server RAM in bytes.
  final int? ramBytes;

  /// Source server recommended instance type.
  final String? recommendedInstanceType;

  SourceProperties({
    this.cpus,
    this.disks,
    this.identificationHints,
    this.lastUpdatedDateTime,
    this.networkInterfaces,
    this.os,
    this.ramBytes,
    this.recommendedInstanceType,
  });

  factory SourceProperties.fromJson(Map<String, dynamic> json) {
    return SourceProperties(
      cpus: (json['cpus'] as List?)
          ?.nonNulls
          .map((e) => CPU.fromJson(e as Map<String, dynamic>))
          .toList(),
      disks: (json['disks'] as List?)
          ?.nonNulls
          .map((e) => Disk.fromJson(e as Map<String, dynamic>))
          .toList(),
      identificationHints: json['identificationHints'] != null
          ? IdentificationHints.fromJson(
              json['identificationHints'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: json['lastUpdatedDateTime'] as String?,
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.nonNulls
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      os: json['os'] != null
          ? OS.fromJson(json['os'] as Map<String, dynamic>)
          : null,
      ramBytes: json['ramBytes'] as int?,
      recommendedInstanceType: json['recommendedInstanceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpus = this.cpus;
    final disks = this.disks;
    final identificationHints = this.identificationHints;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final networkInterfaces = this.networkInterfaces;
    final os = this.os;
    final ramBytes = this.ramBytes;
    final recommendedInstanceType = this.recommendedInstanceType;
    return {
      if (cpus != null) 'cpus': cpus,
      if (disks != null) 'disks': disks,
      if (identificationHints != null)
        'identificationHints': identificationHints,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': lastUpdatedDateTime,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (os != null) 'os': os,
      if (ramBytes != null) 'ramBytes': ramBytes,
      if (recommendedInstanceType != null)
        'recommendedInstanceType': recommendedInstanceType,
    };
  }
}

/// Source Server connector action.
class SourceServerConnectorAction {
  /// Source Server connector action connector arn.
  final String? connectorArn;

  /// Source Server connector action credentials secret arn.
  final String? credentialsSecretArn;

  SourceServerConnectorAction({
    this.connectorArn,
    this.credentialsSecretArn,
  });

  factory SourceServerConnectorAction.fromJson(Map<String, dynamic> json) {
    return SourceServerConnectorAction(
      connectorArn: json['connectorArn'] as String?,
      credentialsSecretArn: json['credentialsSecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    final credentialsSecretArn = this.credentialsSecretArn;
    return {
      if (connectorArn != null) 'connectorArn': connectorArn,
      if (credentialsSecretArn != null)
        'credentialsSecretArn': credentialsSecretArn,
    };
  }
}

/// Identification hints.
class IdentificationHints {
  /// AWS Instance ID identification hint.
  final String? awsInstanceID;

  /// FQDN address identification hint.
  final String? fqdn;

  /// Hostname identification hint.
  final String? hostname;

  /// vCenter VM path identification hint.
  final String? vmPath;

  /// vmWare UUID identification hint.
  final String? vmWareUuid;

  IdentificationHints({
    this.awsInstanceID,
    this.fqdn,
    this.hostname,
    this.vmPath,
    this.vmWareUuid,
  });

  factory IdentificationHints.fromJson(Map<String, dynamic> json) {
    return IdentificationHints(
      awsInstanceID: json['awsInstanceID'] as String?,
      fqdn: json['fqdn'] as String?,
      hostname: json['hostname'] as String?,
      vmPath: json['vmPath'] as String?,
      vmWareUuid: json['vmWareUuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsInstanceID = this.awsInstanceID;
    final fqdn = this.fqdn;
    final hostname = this.hostname;
    final vmPath = this.vmPath;
    final vmWareUuid = this.vmWareUuid;
    return {
      if (awsInstanceID != null) 'awsInstanceID': awsInstanceID,
      if (fqdn != null) 'fqdn': fqdn,
      if (hostname != null) 'hostname': hostname,
      if (vmPath != null) 'vmPath': vmPath,
      if (vmWareUuid != null) 'vmWareUuid': vmWareUuid,
    };
  }
}

/// Operating System.
class OS {
  /// OS full string.
  final String? fullString;

  OS({
    this.fullString,
  });

  factory OS.fromJson(Map<String, dynamic> json) {
    return OS(
      fullString: json['fullString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fullString = this.fullString;
    return {
      if (fullString != null) 'fullString': fullString,
    };
  }
}

/// Source server CPU information.
class CPU {
  /// The number of CPU cores on the source server.
  final int? cores;

  /// The source server's CPU model name.
  final String? modelName;

  CPU({
    this.cores,
    this.modelName,
  });

  factory CPU.fromJson(Map<String, dynamic> json) {
    return CPU(
      cores: json['cores'] as int?,
      modelName: json['modelName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cores = this.cores;
    final modelName = this.modelName;
    return {
      if (cores != null) 'cores': cores,
      if (modelName != null) 'modelName': modelName,
    };
  }
}

/// The disk identifier.
class Disk {
  /// The amount of storage on the disk in bytes.
  final int? bytes;

  /// The disk or device name.
  final String? deviceName;

  Disk({
    this.bytes,
    this.deviceName,
  });

  factory Disk.fromJson(Map<String, dynamic> json) {
    return Disk(
      bytes: json['bytes'] as int?,
      deviceName: json['deviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final deviceName = this.deviceName;
    return {
      if (bytes != null) 'bytes': bytes,
      if (deviceName != null) 'deviceName': deviceName,
    };
  }
}

/// Network interface.
class NetworkInterface {
  /// Network interface IPs.
  final List<String>? ips;

  /// Network interface primary IP.
  final bool? isPrimary;

  /// Network interface Mac address.
  final String? macAddress;

  NetworkInterface({
    this.ips,
    this.isPrimary,
    this.macAddress,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      ips: (json['ips'] as List?)?.nonNulls.map((e) => e as String).toList(),
      isPrimary: json['isPrimary'] as bool?,
      macAddress: json['macAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ips = this.ips;
    final isPrimary = this.isPrimary;
    final macAddress = this.macAddress;
    return {
      if (ips != null) 'ips': ips,
      if (isPrimary != null) 'isPrimary': isPrimary,
      if (macAddress != null) 'macAddress': macAddress,
    };
  }
}

/// Lifecycle last Test.
class LifeCycleLastTest {
  /// Lifecycle last Test finalized.
  final LifeCycleLastTestFinalized? finalized;

  /// Lifecycle last Test initiated.
  final LifeCycleLastTestInitiated? initiated;

  /// Lifecycle last Test reverted.
  final LifeCycleLastTestReverted? reverted;

  LifeCycleLastTest({
    this.finalized,
    this.initiated,
    this.reverted,
  });

  factory LifeCycleLastTest.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastTest(
      finalized: json['finalized'] != null
          ? LifeCycleLastTestFinalized.fromJson(
              json['finalized'] as Map<String, dynamic>)
          : null,
      initiated: json['initiated'] != null
          ? LifeCycleLastTestInitiated.fromJson(
              json['initiated'] as Map<String, dynamic>)
          : null,
      reverted: json['reverted'] != null
          ? LifeCycleLastTestReverted.fromJson(
              json['reverted'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final finalized = this.finalized;
    final initiated = this.initiated;
    final reverted = this.reverted;
    return {
      if (finalized != null) 'finalized': finalized,
      if (initiated != null) 'initiated': initiated,
      if (reverted != null) 'reverted': reverted,
    };
  }
}

/// Lifecycle last Cutover .
class LifeCycleLastCutover {
  /// Lifecycle Cutover finalized date and time.
  final LifeCycleLastCutoverFinalized? finalized;

  /// Lifecycle last Cutover initiated.
  final LifeCycleLastCutoverInitiated? initiated;

  /// Lifecycle last Cutover reverted.
  final LifeCycleLastCutoverReverted? reverted;

  LifeCycleLastCutover({
    this.finalized,
    this.initiated,
    this.reverted,
  });

  factory LifeCycleLastCutover.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastCutover(
      finalized: json['finalized'] != null
          ? LifeCycleLastCutoverFinalized.fromJson(
              json['finalized'] as Map<String, dynamic>)
          : null,
      initiated: json['initiated'] != null
          ? LifeCycleLastCutoverInitiated.fromJson(
              json['initiated'] as Map<String, dynamic>)
          : null,
      reverted: json['reverted'] != null
          ? LifeCycleLastCutoverReverted.fromJson(
              json['reverted'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final finalized = this.finalized;
    final initiated = this.initiated;
    final reverted = this.reverted;
    return {
      if (finalized != null) 'finalized': finalized,
      if (initiated != null) 'initiated': initiated,
      if (reverted != null) 'reverted': reverted,
    };
  }
}

/// Lifecycle last Cutover initiated.
class LifeCycleLastCutoverInitiated {
  /// <p/>
  final String? apiCallDateTime;

  /// Lifecycle last Cutover initiated by Job ID.
  final String? jobID;

  LifeCycleLastCutoverInitiated({
    this.apiCallDateTime,
    this.jobID,
  });

  factory LifeCycleLastCutoverInitiated.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastCutoverInitiated(
      apiCallDateTime: json['apiCallDateTime'] as String?,
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    final jobID = this.jobID;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
      if (jobID != null) 'jobID': jobID,
    };
  }
}

/// Lifecycle last Cutover reverted.
class LifeCycleLastCutoverReverted {
  /// Lifecycle last Cutover reverted API call date time.
  final String? apiCallDateTime;

  LifeCycleLastCutoverReverted({
    this.apiCallDateTime,
  });

  factory LifeCycleLastCutoverReverted.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastCutoverReverted(
      apiCallDateTime: json['apiCallDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
    };
  }
}

/// Lifecycle Cutover finalized
class LifeCycleLastCutoverFinalized {
  /// Lifecycle Cutover finalized date and time.
  final String? apiCallDateTime;

  LifeCycleLastCutoverFinalized({
    this.apiCallDateTime,
  });

  factory LifeCycleLastCutoverFinalized.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastCutoverFinalized(
      apiCallDateTime: json['apiCallDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
    };
  }
}

/// Lifecycle last Test initiated.
class LifeCycleLastTestInitiated {
  /// Lifecycle last Test initiated API call date and time.
  final String? apiCallDateTime;

  /// Lifecycle last Test initiated Job ID.
  final String? jobID;

  LifeCycleLastTestInitiated({
    this.apiCallDateTime,
    this.jobID,
  });

  factory LifeCycleLastTestInitiated.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastTestInitiated(
      apiCallDateTime: json['apiCallDateTime'] as String?,
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    final jobID = this.jobID;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
      if (jobID != null) 'jobID': jobID,
    };
  }
}

/// Lifecycle last Test reverted.
class LifeCycleLastTestReverted {
  /// Lifecycle last Test reverted API call date and time.
  final String? apiCallDateTime;

  LifeCycleLastTestReverted({
    this.apiCallDateTime,
  });

  factory LifeCycleLastTestReverted.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastTestReverted(
      apiCallDateTime: json['apiCallDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
    };
  }
}

/// Lifecycle last Test finalized.
class LifeCycleLastTestFinalized {
  /// Lifecycle Test failed API call date and time.
  final String? apiCallDateTime;

  LifeCycleLastTestFinalized({
    this.apiCallDateTime,
  });

  factory LifeCycleLastTestFinalized.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastTestFinalized(
      apiCallDateTime: json['apiCallDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
    };
  }
}

class DataReplicationState {
  static const stopped = DataReplicationState._('STOPPED');
  static const initiating = DataReplicationState._('INITIATING');
  static const initialSync = DataReplicationState._('INITIAL_SYNC');
  static const backlog = DataReplicationState._('BACKLOG');
  static const creatingSnapshot = DataReplicationState._('CREATING_SNAPSHOT');
  static const continuous = DataReplicationState._('CONTINUOUS');
  static const paused = DataReplicationState._('PAUSED');
  static const rescan = DataReplicationState._('RESCAN');
  static const stalled = DataReplicationState._('STALLED');
  static const disconnected = DataReplicationState._('DISCONNECTED');
  static const pendingSnapshotShipping =
      DataReplicationState._('PENDING_SNAPSHOT_SHIPPING');
  static const shippingSnapshot = DataReplicationState._('SHIPPING_SNAPSHOT');

  final String value;

  const DataReplicationState._(this.value);

  static const values = [
    stopped,
    initiating,
    initialSync,
    backlog,
    creatingSnapshot,
    continuous,
    paused,
    rescan,
    stalled,
    disconnected,
    pendingSnapshotShipping,
    shippingSnapshot
  ];

  static DataReplicationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataReplicationState._(value));

  @override
  bool operator ==(other) =>
      other is DataReplicationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Data replication initiation.
class DataReplicationInitiation {
  /// Request to query next data initiation date and time.
  final String? nextAttemptDateTime;

  /// Request to query data initiation start date and time.
  final String? startDateTime;

  /// Request to query data initiation steps.
  final List<DataReplicationInitiationStep>? steps;

  DataReplicationInitiation({
    this.nextAttemptDateTime,
    this.startDateTime,
    this.steps,
  });

  factory DataReplicationInitiation.fromJson(Map<String, dynamic> json) {
    return DataReplicationInitiation(
      nextAttemptDateTime: json['nextAttemptDateTime'] as String?,
      startDateTime: json['startDateTime'] as String?,
      steps: (json['steps'] as List?)
          ?.nonNulls
          .map((e) =>
              DataReplicationInitiationStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextAttemptDateTime = this.nextAttemptDateTime;
    final startDateTime = this.startDateTime;
    final steps = this.steps;
    return {
      if (nextAttemptDateTime != null)
        'nextAttemptDateTime': nextAttemptDateTime,
      if (startDateTime != null) 'startDateTime': startDateTime,
      if (steps != null) 'steps': steps,
    };
  }
}

/// Error in data replication.
class DataReplicationError {
  /// Error in data replication.
  final DataReplicationErrorString? error;

  /// Error in data replication.
  final String? rawError;

  DataReplicationError({
    this.error,
    this.rawError,
  });

  factory DataReplicationError.fromJson(Map<String, dynamic> json) {
    return DataReplicationError(
      error: (json['error'] as String?)
          ?.let(DataReplicationErrorString.fromString),
      rawError: json['rawError'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final rawError = this.rawError;
    return {
      if (error != null) 'error': error.value,
      if (rawError != null) 'rawError': rawError,
    };
  }
}

class DataReplicationErrorString {
  static const agentNotSeen = DataReplicationErrorString._('AGENT_NOT_SEEN');
  static const snapshotsFailure =
      DataReplicationErrorString._('SNAPSHOTS_FAILURE');
  static const notConverging = DataReplicationErrorString._('NOT_CONVERGING');
  static const unstableNetwork =
      DataReplicationErrorString._('UNSTABLE_NETWORK');
  static const failedToCreateSecurityGroup =
      DataReplicationErrorString._('FAILED_TO_CREATE_SECURITY_GROUP');
  static const failedToLaunchReplicationServer =
      DataReplicationErrorString._('FAILED_TO_LAUNCH_REPLICATION_SERVER');
  static const failedToBootReplicationServer =
      DataReplicationErrorString._('FAILED_TO_BOOT_REPLICATION_SERVER');
  static const failedToAuthenticateWithService =
      DataReplicationErrorString._('FAILED_TO_AUTHENTICATE_WITH_SERVICE');
  static const failedToDownloadReplicationSoftware =
      DataReplicationErrorString._('FAILED_TO_DOWNLOAD_REPLICATION_SOFTWARE');
  static const failedToCreateStagingDisks =
      DataReplicationErrorString._('FAILED_TO_CREATE_STAGING_DISKS');
  static const failedToAttachStagingDisks =
      DataReplicationErrorString._('FAILED_TO_ATTACH_STAGING_DISKS');
  static const failedToPairReplicationServerWithAgent =
      DataReplicationErrorString._(
          'FAILED_TO_PAIR_REPLICATION_SERVER_WITH_AGENT');
  static const failedToConnectAgentToReplicationServer =
      DataReplicationErrorString._(
          'FAILED_TO_CONNECT_AGENT_TO_REPLICATION_SERVER');
  static const failedToStartDataTransfer =
      DataReplicationErrorString._('FAILED_TO_START_DATA_TRANSFER');
  static const unsupportedVmConfiguration =
      DataReplicationErrorString._('UNSUPPORTED_VM_CONFIGURATION');
  static const lastSnapshotJobFailed =
      DataReplicationErrorString._('LAST_SNAPSHOT_JOB_FAILED');

  final String value;

  const DataReplicationErrorString._(this.value);

  static const values = [
    agentNotSeen,
    snapshotsFailure,
    notConverging,
    unstableNetwork,
    failedToCreateSecurityGroup,
    failedToLaunchReplicationServer,
    failedToBootReplicationServer,
    failedToAuthenticateWithService,
    failedToDownloadReplicationSoftware,
    failedToCreateStagingDisks,
    failedToAttachStagingDisks,
    failedToPairReplicationServerWithAgent,
    failedToConnectAgentToReplicationServer,
    failedToStartDataTransfer,
    unsupportedVmConfiguration,
    lastSnapshotJobFailed
  ];

  static DataReplicationErrorString fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataReplicationErrorString._(value));

  @override
  bool operator ==(other) =>
      other is DataReplicationErrorString && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Data replication initiation step.
class DataReplicationInitiationStep {
  /// Request to query data initiation step name.
  final DataReplicationInitiationStepName? name;

  /// Request to query data initiation status.
  final DataReplicationInitiationStepStatus? status;

  DataReplicationInitiationStep({
    this.name,
    this.status,
  });

  factory DataReplicationInitiationStep.fromJson(Map<String, dynamic> json) {
    return DataReplicationInitiationStep(
      name: (json['name'] as String?)
          ?.let(DataReplicationInitiationStepName.fromString),
      status: (json['status'] as String?)
          ?.let(DataReplicationInitiationStepStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    return {
      if (name != null) 'name': name.value,
      if (status != null) 'status': status.value,
    };
  }
}

class DataReplicationInitiationStepName {
  static const wait = DataReplicationInitiationStepName._('WAIT');
  static const createSecurityGroup =
      DataReplicationInitiationStepName._('CREATE_SECURITY_GROUP');
  static const launchReplicationServer =
      DataReplicationInitiationStepName._('LAUNCH_REPLICATION_SERVER');
  static const bootReplicationServer =
      DataReplicationInitiationStepName._('BOOT_REPLICATION_SERVER');
  static const authenticateWithService =
      DataReplicationInitiationStepName._('AUTHENTICATE_WITH_SERVICE');
  static const downloadReplicationSoftware =
      DataReplicationInitiationStepName._('DOWNLOAD_REPLICATION_SOFTWARE');
  static const createStagingDisks =
      DataReplicationInitiationStepName._('CREATE_STAGING_DISKS');
  static const attachStagingDisks =
      DataReplicationInitiationStepName._('ATTACH_STAGING_DISKS');
  static const pairReplicationServerWithAgent =
      DataReplicationInitiationStepName._('PAIR_REPLICATION_SERVER_WITH_AGENT');
  static const connectAgentToReplicationServer =
      DataReplicationInitiationStepName._(
          'CONNECT_AGENT_TO_REPLICATION_SERVER');
  static const startDataTransfer =
      DataReplicationInitiationStepName._('START_DATA_TRANSFER');

  final String value;

  const DataReplicationInitiationStepName._(this.value);

  static const values = [
    wait,
    createSecurityGroup,
    launchReplicationServer,
    bootReplicationServer,
    authenticateWithService,
    downloadReplicationSoftware,
    createStagingDisks,
    attachStagingDisks,
    pairReplicationServerWithAgent,
    connectAgentToReplicationServer,
    startDataTransfer
  ];

  static DataReplicationInitiationStepName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataReplicationInitiationStepName._(value));

  @override
  bool operator ==(other) =>
      other is DataReplicationInitiationStepName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DataReplicationInitiationStepStatus {
  static const notStarted =
      DataReplicationInitiationStepStatus._('NOT_STARTED');
  static const inProgress =
      DataReplicationInitiationStepStatus._('IN_PROGRESS');
  static const succeeded = DataReplicationInitiationStepStatus._('SUCCEEDED');
  static const failed = DataReplicationInitiationStepStatus._('FAILED');
  static const skipped = DataReplicationInitiationStepStatus._('SKIPPED');

  final String value;

  const DataReplicationInitiationStepStatus._(this.value);

  static const values = [notStarted, inProgress, succeeded, failed, skipped];

  static DataReplicationInitiationStepStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataReplicationInitiationStepStatus._(value));

  @override
  bool operator ==(other) =>
      other is DataReplicationInitiationStepStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Request to query disks replicated.
class DataReplicationInfoReplicatedDisk {
  /// Request to query data replication backlog size in bytes.
  final int? backloggedStorageBytes;

  /// Request to query device name.
  final String? deviceName;

  /// Request to query amount of data replicated in bytes.
  final int? replicatedStorageBytes;

  /// Request to query amount of data rescanned in bytes.
  final int? rescannedStorageBytes;

  /// Request to query total amount of data replicated in bytes.
  final int? totalStorageBytes;

  DataReplicationInfoReplicatedDisk({
    this.backloggedStorageBytes,
    this.deviceName,
    this.replicatedStorageBytes,
    this.rescannedStorageBytes,
    this.totalStorageBytes,
  });

  factory DataReplicationInfoReplicatedDisk.fromJson(
      Map<String, dynamic> json) {
    return DataReplicationInfoReplicatedDisk(
      backloggedStorageBytes: json['backloggedStorageBytes'] as int?,
      deviceName: json['deviceName'] as String?,
      replicatedStorageBytes: json['replicatedStorageBytes'] as int?,
      rescannedStorageBytes: json['rescannedStorageBytes'] as int?,
      totalStorageBytes: json['totalStorageBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backloggedStorageBytes = this.backloggedStorageBytes;
    final deviceName = this.deviceName;
    final replicatedStorageBytes = this.replicatedStorageBytes;
    final rescannedStorageBytes = this.rescannedStorageBytes;
    final totalStorageBytes = this.totalStorageBytes;
    return {
      if (backloggedStorageBytes != null)
        'backloggedStorageBytes': backloggedStorageBytes,
      if (deviceName != null) 'deviceName': deviceName,
      if (replicatedStorageBytes != null)
        'replicatedStorageBytes': replicatedStorageBytes,
      if (rescannedStorageBytes != null)
        'rescannedStorageBytes': rescannedStorageBytes,
      if (totalStorageBytes != null) 'totalStorageBytes': totalStorageBytes,
    };
  }
}

class FirstBoot {
  static const waiting = FirstBoot._('WAITING');
  static const succeeded = FirstBoot._('SUCCEEDED');
  static const unknown = FirstBoot._('UNKNOWN');
  static const stopped = FirstBoot._('STOPPED');

  final String value;

  const FirstBoot._(this.value);

  static const values = [waiting, succeeded, unknown, stopped];

  static FirstBoot fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FirstBoot._(value));

  @override
  bool operator ==(other) => other is FirstBoot && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NetworkMigrationMapperSegmentType {
  static const workload = NetworkMigrationMapperSegmentType._('WORKLOAD');
  static const appliance = NetworkMigrationMapperSegmentType._('APPLIANCE');

  final String value;

  const NetworkMigrationMapperSegmentType._(this.value);

  static const values = [workload, appliance];

  static NetworkMigrationMapperSegmentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkMigrationMapperSegmentType._(value));

  @override
  bool operator ==(other) =>
      other is NetworkMigrationMapperSegmentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A checksum structure used to verify data integrity.
class Checksum {
  /// The encryption algorithm used to generate the checksum.
  final EncryptionAlgorithm? encryptionAlgorithm;

  /// The hash value of the checksum.
  final String? hash;

  Checksum({
    this.encryptionAlgorithm,
    this.hash,
  });

  factory Checksum.fromJson(Map<String, dynamic> json) {
    return Checksum(
      encryptionAlgorithm: (json['encryptionAlgorithm'] as String?)
          ?.let(EncryptionAlgorithm.fromString),
      hash: json['hash'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionAlgorithm = this.encryptionAlgorithm;
    final hash = this.hash;
    return {
      if (encryptionAlgorithm != null)
        'encryptionAlgorithm': encryptionAlgorithm.value,
      if (hash != null) 'hash': hash,
    };
  }
}

/// Configuration for an S3 location.
class S3Configuration {
  /// The name of the S3 bucket.
  final String? s3Bucket;

  /// The AWS account ID of the S3 bucket owner.
  final String? s3BucketOwner;

  /// The S3 key (path) for the object.
  final String? s3Key;

  S3Configuration({
    this.s3Bucket,
    this.s3BucketOwner,
    this.s3Key,
  });

  factory S3Configuration.fromJson(Map<String, dynamic> json) {
    return S3Configuration(
      s3Bucket: json['s3Bucket'] as String?,
      s3BucketOwner: json['s3BucketOwner'] as String?,
      s3Key: json['s3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    final s3Key = this.s3Key;
    return {
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
      if (s3Key != null) 's3Key': s3Key,
    };
  }
}

class EncryptionAlgorithm {
  static const sha256 = EncryptionAlgorithm._('SHA256');

  final String value;

  const EncryptionAlgorithm._(this.value);

  static const values = [sha256];

  static EncryptionAlgorithm fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EncryptionAlgorithm._(value));

  @override
  bool operator ==(other) =>
      other is EncryptionAlgorithm && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A segment update to apply during a mapping update operation.
class StartNetworkMigrationMappingUpdateSegment {
  /// The ID of the segment to update.
  final String segmentID;

  /// The updated scope tags for the segment.
  final Map<String, String>? scopeTags;

  /// The updated target AWS account for the segment.
  final String? targetAccount;

  StartNetworkMigrationMappingUpdateSegment({
    required this.segmentID,
    this.scopeTags,
    this.targetAccount,
  });

  Map<String, dynamic> toJson() {
    final segmentID = this.segmentID;
    final scopeTags = this.scopeTags;
    final targetAccount = this.targetAccount;
    return {
      'segmentID': segmentID,
      if (scopeTags != null) 'scopeTags': scopeTags,
      if (targetAccount != null) 'targetAccount': targetAccount,
    };
  }
}

/// A construct update to apply during a mapping update operation.
class StartNetworkMigrationMappingUpdateConstruct {
  /// The ID of the construct to update.
  final String constructID;

  /// The type of the construct.
  final String constructType;

  /// The ID of the segment containing the construct.
  final String segmentID;

  /// The operation to perform on the construct.
  final OperationUnion? operation;

  StartNetworkMigrationMappingUpdateConstruct({
    required this.constructID,
    required this.constructType,
    required this.segmentID,
    this.operation,
  });

  Map<String, dynamic> toJson() {
    final constructID = this.constructID;
    final constructType = this.constructType;
    final segmentID = this.segmentID;
    final operation = this.operation;
    return {
      'constructID': constructID,
      'constructType': constructType,
      'segmentID': segmentID,
      if (operation != null) 'operation': operation,
    };
  }
}

/// A union type representing the operation to perform on a construct during a
/// mapping update.
class OperationUnion {
  /// A delete operation to remove a construct from the mapping.
  final DeleteOperation? delete;

  /// A merge operation to combine constructs from different segments.
  final MergeOperation? merge;

  /// A split operation to divide a construct into multiple constructs with
  /// specified CIDR blocks.
  final SplitOperation? split;

  /// An update operation to modify construct properties.
  final UpdateOperation? update;

  OperationUnion({
    this.delete,
    this.merge,
    this.split,
    this.update,
  });

  Map<String, dynamic> toJson() {
    final delete = this.delete;
    final merge = this.merge;
    final split = this.split;
    final update = this.update;
    return {
      if (delete != null) 'delete': delete,
      if (merge != null) 'merge': merge,
      if (split != null) 'split': split,
      if (update != null) 'update': update,
    };
  }
}

/// An operation that merges constructs from different segments into the target
/// construct.
class MergeOperation {
  /// The list of constructs to merge into the target.
  final List<MergeConstruct>? mergeConstructs;

  MergeOperation({
    this.mergeConstructs,
  });

  Map<String, dynamic> toJson() {
    final mergeConstructs = this.mergeConstructs;
    return {
      if (mergeConstructs != null) 'mergeConstructs': mergeConstructs,
    };
  }
}

/// An operation that splits a construct into multiple constructs with different
/// CIDR blocks.
class SplitOperation {
  /// The list of split targets with their CIDR blocks.
  final List<SplitConstruct>? splitConstructs;

  SplitOperation({
    this.splitConstructs,
  });

  Map<String, dynamic> toJson() {
    final splitConstructs = this.splitConstructs;
    return {
      if (splitConstructs != null) 'splitConstructs': splitConstructs,
    };
  }
}

/// An operation that deletes a construct from the mapping.
class DeleteOperation {
  DeleteOperation();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An operation that updates the properties of a construct.
class UpdateOperation {
  /// Whether to exclude this construct from the migration.
  final bool? excluded;

  /// The updated name for the construct.
  final String? name;

  /// The properties to update on the construct.
  final Map<String, String>? properties;

  UpdateOperation({
    this.excluded,
    this.name,
    this.properties,
  });

  Map<String, dynamic> toJson() {
    final excluded = this.excluded;
    final name = this.name;
    final properties = this.properties;
    return {
      if (excluded != null) 'excluded': excluded,
      if (name != null) 'name': name,
      if (properties != null) 'properties': properties,
    };
  }
}

/// A split target specifying the CIDR block for the new construct.
class SplitConstruct {
  /// The CIDR block for the split construct.
  final String? cidrBlock;

  SplitConstruct({
    this.cidrBlock,
  });

  Map<String, dynamic> toJson() {
    final cidrBlock = this.cidrBlock;
    return {
      if (cidrBlock != null) 'cidrBlock': cidrBlock,
    };
  }
}

/// A construct reference specifying the source segment and construct to merge.
class MergeConstruct {
  /// The construct ID to merge.
  final String? constructID;

  /// The segment ID of the construct to merge.
  final String? segmentID;

  MergeConstruct({
    this.constructID,
    this.segmentID,
  });

  Map<String, dynamic> toJson() {
    final constructID = this.constructID;
    final segmentID = this.segmentID;
    return {
      if (constructID != null) 'constructID': constructID,
      if (segmentID != null) 'segmentID': segmentID,
    };
  }
}

class SecurityGroupMappingStrategy {
  static const map = SecurityGroupMappingStrategy._('MAP');
  static const skip = SecurityGroupMappingStrategy._('SKIP');
  static const mapDhcp = SecurityGroupMappingStrategy._('MAP_DHCP');

  final String value;

  const SecurityGroupMappingStrategy._(this.value);

  static const values = [map, skip, mapDhcp];

  static SecurityGroupMappingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SecurityGroupMappingStrategy._(value));

  @override
  bool operator ==(other) =>
      other is SecurityGroupMappingStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class CodeGenerationOutputFormatType {
  static const cdkL1 = CodeGenerationOutputFormatType._('CDK_L1');
  static const cdkL2 = CodeGenerationOutputFormatType._('CDK_L2');
  static const terraform = CodeGenerationOutputFormatType._('TERRAFORM');
  static const lza = CodeGenerationOutputFormatType._('LZA');

  final String value;

  const CodeGenerationOutputFormatType._(this.value);

  static const values = [cdkL1, cdkL2, terraform, lza];

  static CodeGenerationOutputFormatType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeGenerationOutputFormatType._(value));

  @override
  bool operator ==(other) =>
      other is CodeGenerationOutputFormatType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a network migration mapping update job.
class NetworkMigrationMappingUpdateJobDetails {
  /// The timestamp when the job was created.
  final DateTime? createdAt;

  /// The timestamp when the job completed or failed.
  final DateTime? endedAt;

  /// The unique identifier of the mapping update job.
  final String? jobID;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the network migration execution.
  final String? networkMigrationExecutionID;

  /// The current status of the mapping update job.
  final NetworkMigrationJobStatus? status;

  /// Detailed status information about the job.
  final String? statusDetails;

  NetworkMigrationMappingUpdateJobDetails({
    this.createdAt,
    this.endedAt,
    this.jobID,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.status,
    this.statusDetails,
  });

  factory NetworkMigrationMappingUpdateJobDetails.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationMappingUpdateJobDetails(
      createdAt: timeStampFromJson(json['createdAt']),
      endedAt: timeStampFromJson(json['endedAt']),
      jobID: json['jobID'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      status: (json['status'] as String?)
          ?.let(NetworkMigrationJobStatus.fromString),
      statusDetails: json['statusDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final jobID = this.jobID;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final status = this.status;
    final statusDetails = this.statusDetails;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (jobID != null) 'jobID': jobID,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

class NetworkMigrationJobStatus {
  static const pending = NetworkMigrationJobStatus._('PENDING');
  static const started = NetworkMigrationJobStatus._('STARTED');
  static const succeeded = NetworkMigrationJobStatus._('SUCCEEDED');
  static const failed = NetworkMigrationJobStatus._('FAILED');

  final String value;

  const NetworkMigrationJobStatus._(this.value);

  static const values = [pending, started, succeeded, failed];

  static NetworkMigrationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkMigrationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is NetworkMigrationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters for listing mapping update jobs.
class ListNetworkMigrationMappingUpdatesFilters {
  /// A list of job IDs to filter by.
  final List<String>? jobIDs;

  ListNetworkMigrationMappingUpdatesFilters({
    this.jobIDs,
  });

  Map<String, dynamic> toJson() {
    final jobIDs = this.jobIDs;
    return {
      if (jobIDs != null) 'jobIDs': jobIDs,
    };
  }
}

/// Details about a network migration mapping job.
class NetworkMigrationMappingJobDetails {
  /// The timestamp when the job was created.
  final DateTime? createdAt;

  /// The timestamp when the job completed or failed.
  final DateTime? endedAt;

  /// The unique identifier of the mapping job.
  final String? jobID;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the network migration execution.
  final String? networkMigrationExecutionID;

  /// The current status of the mapping job.
  final NetworkMigrationJobStatus? status;

  /// Detailed status information about the job.
  final String? statusDetails;

  NetworkMigrationMappingJobDetails({
    this.createdAt,
    this.endedAt,
    this.jobID,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.status,
    this.statusDetails,
  });

  factory NetworkMigrationMappingJobDetails.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationMappingJobDetails(
      createdAt: timeStampFromJson(json['createdAt']),
      endedAt: timeStampFromJson(json['endedAt']),
      jobID: json['jobID'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      status: (json['status'] as String?)
          ?.let(NetworkMigrationJobStatus.fromString),
      statusDetails: json['statusDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final jobID = this.jobID;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final status = this.status;
    final statusDetails = this.statusDetails;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (jobID != null) 'jobID': jobID,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

/// Filters for listing network migration mapping jobs.
class ListNetworkMigrationMappingsFilters {
  /// A list of job IDs to filter by.
  final List<String>? jobIDs;

  ListNetworkMigrationMappingsFilters({
    this.jobIDs,
  });

  Map<String, dynamic> toJson() {
    final jobIDs = this.jobIDs;
    return {
      if (jobIDs != null) 'jobIDs': jobIDs,
    };
  }
}

/// Filters for listing mapper segments.
class ListNetworkMigrationMapperSegmentsFilters {
  /// A list of segment IDs to filter by.
  final List<String>? segmentIDs;

  ListNetworkMigrationMapperSegmentsFilters({
    this.segmentIDs,
  });

  Map<String, dynamic> toJson() {
    final segmentIDs = this.segmentIDs;
    return {
      if (segmentIDs != null) 'segmentIDs': segmentIDs,
    };
  }
}

/// Represents a construct within a mapper segment. A construct is an individual
/// infrastructure component such as a VPC, subnet, security group, route table,
/// or other network resource that is part of the network migration.
class NetworkMigrationMapperSegmentConstruct {
  /// The unique identifier of the construct.
  final String? constructID;

  /// The type of the construct, such as VPC, subnet, security group, or route
  /// table.
  final String? constructType;

  /// The timestamp when the construct was created.
  final DateTime? createdAt;

  /// A description of the construct.
  final String? description;

  /// Whether this construct is excluded from the migration.
  final bool? excluded;

  /// The logical identifier for the construct in the infrastructure code.
  final String? logicalID;

  /// The name of the construct.
  final String? name;

  /// The properties and configuration of the construct.
  final Map<String, String>? properties;

  /// The timestamp when the construct was last updated.
  final DateTime? updatedAt;

  NetworkMigrationMapperSegmentConstruct({
    this.constructID,
    this.constructType,
    this.createdAt,
    this.description,
    this.excluded,
    this.logicalID,
    this.name,
    this.properties,
    this.updatedAt,
  });

  factory NetworkMigrationMapperSegmentConstruct.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationMapperSegmentConstruct(
      constructID: json['constructID'] as String?,
      constructType: json['constructType'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      excluded: json['excluded'] as bool?,
      logicalID: json['logicalID'] as String?,
      name: json['name'] as String?,
      properties: (json['properties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final constructID = this.constructID;
    final constructType = this.constructType;
    final createdAt = this.createdAt;
    final description = this.description;
    final excluded = this.excluded;
    final logicalID = this.logicalID;
    final name = this.name;
    final properties = this.properties;
    final updatedAt = this.updatedAt;
    return {
      if (constructID != null) 'constructID': constructID,
      if (constructType != null) 'constructType': constructType,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (excluded != null) 'excluded': excluded,
      if (logicalID != null) 'logicalID': logicalID,
      if (name != null) 'name': name,
      if (properties != null) 'properties': properties,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

/// Filters for listing mapper segment constructs.
class ListNetworkMigrationMapperSegmentConstructsFilters {
  /// A list of construct IDs to filter by.
  final List<String>? constructIDs;

  /// A list of construct types to filter by.
  final List<String>? constructTypes;

  ListNetworkMigrationMapperSegmentConstructsFilters({
    this.constructIDs,
    this.constructTypes,
  });

  Map<String, dynamic> toJson() {
    final constructIDs = this.constructIDs;
    final constructTypes = this.constructTypes;
    return {
      if (constructIDs != null) 'constructIDs': constructIDs,
      if (constructTypes != null) 'constructTypes': constructTypes,
    };
  }
}

/// Details about a network migration execution instance.
class NetworkMigrationExecution {
  /// The current activity being performed in the execution.
  final ExecutionStageActivity? activity;

  /// The timestamp when the execution was created.
  final DateTime? createdAt;

  /// The unique identifier of the network migration definition used by this
  /// execution.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the execution.
  final String? networkMigrationExecutionID;

  /// The current stage of the execution in the migration workflow.
  final ExecutionStage? stage;

  /// The current status of the execution.
  final ExecutionStatus? status;

  /// Tags assigned to the execution.
  final Map<String, String>? tags;

  /// The timestamp when the execution was last updated.
  final DateTime? updatedAt;

  NetworkMigrationExecution({
    this.activity,
    this.createdAt,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.stage,
    this.status,
    this.tags,
    this.updatedAt,
  });

  factory NetworkMigrationExecution.fromJson(Map<String, dynamic> json) {
    return NetworkMigrationExecution(
      activity:
          (json['activity'] as String?)?.let(ExecutionStageActivity.fromString),
      createdAt: timeStampFromJson(json['createdAt']),
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      stage: (json['stage'] as String?)?.let(ExecutionStage.fromString),
      status: (json['status'] as String?)?.let(ExecutionStatus.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final activity = this.activity;
    final createdAt = this.createdAt;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final stage = this.stage;
    final status = this.status;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (activity != null) 'activity': activity.value,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (stage != null) 'stage': stage.value,
      if (status != null) 'status': status.value,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': unixTimestampToJson(updatedAt),
    };
  }
}

class ExecutionStatus {
  static const pending = ExecutionStatus._('PENDING');
  static const started = ExecutionStatus._('STARTED');
  static const succeeded = ExecutionStatus._('SUCCEEDED');
  static const failed = ExecutionStatus._('FAILED');

  final String value;

  const ExecutionStatus._(this.value);

  static const values = [pending, started, succeeded, failed];

  static ExecutionStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionStatus._(value));

  @override
  bool operator ==(other) => other is ExecutionStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ExecutionStage {
  static const mapping = ExecutionStage._('MAPPING');
  static const codeGeneration = ExecutionStage._('CODE_GENERATION');
  static const deploy = ExecutionStage._('DEPLOY');
  static const deployedStacksDeletion =
      ExecutionStage._('DEPLOYED_STACKS_DELETION');
  static const analyze = ExecutionStage._('ANALYZE');

  final String value;

  const ExecutionStage._(this.value);

  static const values = [
    mapping,
    codeGeneration,
    deploy,
    deployedStacksDeletion,
    analyze
  ];

  static ExecutionStage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionStage._(value));

  @override
  bool operator ==(other) => other is ExecutionStage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ExecutionStageActivity {
  static const mapping = ExecutionStageActivity._('MAPPING');
  static const mappingUpdate = ExecutionStageActivity._('MAPPING_UPDATE');
  static const codeGeneration = ExecutionStageActivity._('CODE_GENERATION');
  static const deploy = ExecutionStageActivity._('DEPLOY');
  static const deployedStacksDeletion =
      ExecutionStageActivity._('DEPLOYED_STACKS_DELETION');
  static const analyze = ExecutionStageActivity._('ANALYZE');

  final String value;

  const ExecutionStageActivity._(this.value);

  static const values = [
    mapping,
    mappingUpdate,
    codeGeneration,
    deploy,
    deployedStacksDeletion,
    analyze
  ];

  static ExecutionStageActivity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ExecutionStageActivity._(value));

  @override
  bool operator ==(other) =>
      other is ExecutionStageActivity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters for listing network migration executions.
class ListNetworkMigrationExecutionRequestFilters {
  /// A list of execution IDs to filter by.
  final List<String>? networkMigrationExecutionIDs;

  /// A list of execution statuses to filter by.
  final List<ExecutionStatus>? networkMigrationExecutionStatuses;

  ListNetworkMigrationExecutionRequestFilters({
    this.networkMigrationExecutionIDs,
    this.networkMigrationExecutionStatuses,
  });

  Map<String, dynamic> toJson() {
    final networkMigrationExecutionIDs = this.networkMigrationExecutionIDs;
    final networkMigrationExecutionStatuses =
        this.networkMigrationExecutionStatuses;
    return {
      if (networkMigrationExecutionIDs != null)
        'networkMigrationExecutionIDs': networkMigrationExecutionIDs,
      if (networkMigrationExecutionStatuses != null)
        'networkMigrationExecutionStatuses':
            networkMigrationExecutionStatuses.map((e) => e.value).toList(),
    };
  }
}

/// Details about a network migration deployer job.
class NetworkMigrationDeployerJobDetails {
  /// The timestamp when the job was created.
  final DateTime? createdAt;

  /// The timestamp when the job completed or failed.
  final DateTime? endedAt;

  /// The unique identifier of the deployer job.
  final String? jobID;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the network migration execution.
  final String? networkMigrationExecutionID;

  /// The current status of the deployer job.
  final NetworkMigrationJobStatus? status;

  /// Detailed status information about the job.
  final String? statusDetails;

  NetworkMigrationDeployerJobDetails({
    this.createdAt,
    this.endedAt,
    this.jobID,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.status,
    this.statusDetails,
  });

  factory NetworkMigrationDeployerJobDetails.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationDeployerJobDetails(
      createdAt: timeStampFromJson(json['createdAt']),
      endedAt: timeStampFromJson(json['endedAt']),
      jobID: json['jobID'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      status: (json['status'] as String?)
          ?.let(NetworkMigrationJobStatus.fromString),
      statusDetails: json['statusDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final jobID = this.jobID;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final status = this.status;
    final statusDetails = this.statusDetails;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (jobID != null) 'jobID': jobID,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

/// Filters for listing deployer jobs.
class ListNetworkMigrationDeployerJobFilters {
  /// A list of job IDs to filter by.
  final List<String>? jobIDs;

  ListNetworkMigrationDeployerJobFilters({
    this.jobIDs,
  });

  Map<String, dynamic> toJson() {
    final jobIDs = this.jobIDs;
    return {
      if (jobIDs != null) 'jobIDs': jobIDs,
    };
  }
}

/// Details about a CloudFormation stack that has been deployed as part of the
/// network migration.
class NetworkMigrationDeployedStackDetails {
  /// A list of resources that failed to deploy.
  final List<NetworkMigrationFailedResourceDetails>? failedResources;

  /// The ID of the segment that this stack was deployed for.
  final String? segmentID;

  /// The logical ID of the stack.
  final String? stackLogicalID;

  /// The physical ID of the CloudFormation stack.
  final String? stackPhysicalID;

  /// The current status of the deployed stack.
  final NetworkMigrationDeployedStackStatus? status;

  /// The target AWS account where the stack was deployed.
  final String? targetAccount;

  NetworkMigrationDeployedStackDetails({
    this.failedResources,
    this.segmentID,
    this.stackLogicalID,
    this.stackPhysicalID,
    this.status,
    this.targetAccount,
  });

  factory NetworkMigrationDeployedStackDetails.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationDeployedStackDetails(
      failedResources: (json['failedResources'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationFailedResourceDetails.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      segmentID: json['segmentID'] as String?,
      stackLogicalID: json['stackLogicalID'] as String?,
      stackPhysicalID: json['stackPhysicalID'] as String?,
      status: (json['status'] as String?)
          ?.let(NetworkMigrationDeployedStackStatus.fromString),
      targetAccount: json['targetAccount'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failedResources = this.failedResources;
    final segmentID = this.segmentID;
    final stackLogicalID = this.stackLogicalID;
    final stackPhysicalID = this.stackPhysicalID;
    final status = this.status;
    final targetAccount = this.targetAccount;
    return {
      if (failedResources != null) 'failedResources': failedResources,
      if (segmentID != null) 'segmentID': segmentID,
      if (stackLogicalID != null) 'stackLogicalID': stackLogicalID,
      if (stackPhysicalID != null) 'stackPhysicalID': stackPhysicalID,
      if (status != null) 'status': status.value,
      if (targetAccount != null) 'targetAccount': targetAccount,
    };
  }
}

class NetworkMigrationDeployedStackStatus {
  static const createComplete =
      NetworkMigrationDeployedStackStatus._('CREATE_COMPLETE');
  static const createFailed =
      NetworkMigrationDeployedStackStatus._('CREATE_FAILED');
  static const createStarted =
      NetworkMigrationDeployedStackStatus._('CREATE_STARTED');
  static const deleteComplete =
      NetworkMigrationDeployedStackStatus._('DELETE_COMPLETE');
  static const deleteFailed =
      NetworkMigrationDeployedStackStatus._('DELETE_FAILED');
  static const deleteStarted =
      NetworkMigrationDeployedStackStatus._('DELETE_STARTED');

  final String value;

  const NetworkMigrationDeployedStackStatus._(this.value);

  static const values = [
    createComplete,
    createFailed,
    createStarted,
    deleteComplete,
    deleteFailed,
    deleteStarted
  ];

  static NetworkMigrationDeployedStackStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkMigrationDeployedStackStatus._(value));

  @override
  bool operator ==(other) =>
      other is NetworkMigrationDeployedStackStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Details about a resource that failed to deploy.
class NetworkMigrationFailedResourceDetails {
  /// The logical ID of the failed resource.
  final String? logicalID;

  /// The status of the failed resource.
  final NetworkMigrationFailedResourceStatus? status;

  /// The reason why the resource failed.
  final String? statusReason;

  NetworkMigrationFailedResourceDetails({
    this.logicalID,
    this.status,
    this.statusReason,
  });

  factory NetworkMigrationFailedResourceDetails.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationFailedResourceDetails(
      logicalID: json['logicalID'] as String?,
      status: (json['status'] as String?)
          ?.let(NetworkMigrationFailedResourceStatus.fromString),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final logicalID = this.logicalID;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      if (logicalID != null) 'logicalID': logicalID,
      if (status != null) 'status': status.value,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class NetworkMigrationFailedResourceStatus {
  static const createFailed =
      NetworkMigrationFailedResourceStatus._('CREATE_FAILED');
  static const deleteFailed =
      NetworkMigrationFailedResourceStatus._('DELETE_FAILED');

  final String value;

  const NetworkMigrationFailedResourceStatus._(this.value);

  static const values = [createFailed, deleteFailed];

  static NetworkMigrationFailedResourceStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkMigrationFailedResourceStatus._(value));

  @override
  bool operator ==(other) =>
      other is NetworkMigrationFailedResourceStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A segment of generated code representing a logical grouping of
/// infrastructure resources.
class NetworkMigrationCodeGenerationSegment {
  /// A list of artifacts generated for this segment.
  final List<NetworkMigrationCodeGenerationArtifact>? artifacts;

  /// The timestamp when the segment was created.
  final DateTime? createdAt;

  /// The unique identifier of the code generation job.
  final String? jobID;

  /// The logical identifier for the segment.
  final String? logicalID;

  /// The ID of the mapper segment that this code generation segment was created
  /// from.
  final String? mapperSegmentID;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the network migration execution.
  final String? networkMigrationExecutionID;

  /// A list of other segments that this segment depends on or references.
  final List<String>? referencedSegments;

  /// The unique identifier of the segment.
  final String? segmentID;

  /// The type of the segment.
  final NetworkMigrationCodeGenerationSegmentType? segmentType;

  NetworkMigrationCodeGenerationSegment({
    this.artifacts,
    this.createdAt,
    this.jobID,
    this.logicalID,
    this.mapperSegmentID,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.referencedSegments,
    this.segmentID,
    this.segmentType,
  });

  factory NetworkMigrationCodeGenerationSegment.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationCodeGenerationSegment(
      artifacts: (json['artifacts'] as List?)
          ?.nonNulls
          .map((e) => NetworkMigrationCodeGenerationArtifact.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      createdAt: timeStampFromJson(json['createdAt']),
      jobID: json['jobID'] as String?,
      logicalID: json['logicalID'] as String?,
      mapperSegmentID: json['mapperSegmentID'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      referencedSegments: (json['referencedSegments'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      segmentID: json['segmentID'] as String?,
      segmentType: (json['segmentType'] as String?)
          ?.let(NetworkMigrationCodeGenerationSegmentType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final artifacts = this.artifacts;
    final createdAt = this.createdAt;
    final jobID = this.jobID;
    final logicalID = this.logicalID;
    final mapperSegmentID = this.mapperSegmentID;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final referencedSegments = this.referencedSegments;
    final segmentID = this.segmentID;
    final segmentType = this.segmentType;
    return {
      if (artifacts != null) 'artifacts': artifacts,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (jobID != null) 'jobID': jobID,
      if (logicalID != null) 'logicalID': logicalID,
      if (mapperSegmentID != null) 'mapperSegmentID': mapperSegmentID,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (referencedSegments != null) 'referencedSegments': referencedSegments,
      if (segmentID != null) 'segmentID': segmentID,
      if (segmentType != null) 'segmentType': segmentType.value,
    };
  }
}

class NetworkMigrationCodeGenerationSegmentType {
  static const workload =
      NetworkMigrationCodeGenerationSegmentType._('WORKLOAD');
  static const appliance =
      NetworkMigrationCodeGenerationSegmentType._('APPLIANCE');
  static const network = NetworkMigrationCodeGenerationSegmentType._('NETWORK');

  final String value;

  const NetworkMigrationCodeGenerationSegmentType._(this.value);

  static const values = [workload, appliance, network];

  static NetworkMigrationCodeGenerationSegmentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkMigrationCodeGenerationSegmentType._(value));

  @override
  bool operator ==(other) =>
      other is NetworkMigrationCodeGenerationSegmentType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An artifact generated during code generation, such as a CloudFormation
/// template or Terraform file.
class NetworkMigrationCodeGenerationArtifact {
  /// The unique identifier of the artifact.
  final String? artifactID;

  /// The sub-type of the artifact for further classification.
  final NetworkMigrationCodeGenerationArtifactSubType? artifactSubType;

  /// The type of the artifact, such as CLOUDFORMATION_TEMPLATE or
  /// TERRAFORM_MODULE.
  final NetworkMigrationCodeGenerationArtifactType? artifactType;

  /// The checksum of the artifact for integrity verification.
  final Checksum? checksum;

  /// The timestamp when the artifact was created.
  final DateTime? createdAt;

  /// The logical identifier for the artifact.
  final String? logicalID;

  /// The S3 location where the artifact is stored.
  final S3Configuration? outputS3Configuration;

  NetworkMigrationCodeGenerationArtifact({
    this.artifactID,
    this.artifactSubType,
    this.artifactType,
    this.checksum,
    this.createdAt,
    this.logicalID,
    this.outputS3Configuration,
  });

  factory NetworkMigrationCodeGenerationArtifact.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationCodeGenerationArtifact(
      artifactID: json['artifactID'] as String?,
      artifactSubType: (json['artifactSubType'] as String?)
          ?.let(NetworkMigrationCodeGenerationArtifactSubType.fromString),
      artifactType: (json['artifactType'] as String?)
          ?.let(NetworkMigrationCodeGenerationArtifactType.fromString),
      checksum: json['checksum'] != null
          ? Checksum.fromJson(json['checksum'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      logicalID: json['logicalID'] as String?,
      outputS3Configuration: json['outputS3Configuration'] != null
          ? S3Configuration.fromJson(
              json['outputS3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactID = this.artifactID;
    final artifactSubType = this.artifactSubType;
    final artifactType = this.artifactType;
    final checksum = this.checksum;
    final createdAt = this.createdAt;
    final logicalID = this.logicalID;
    final outputS3Configuration = this.outputS3Configuration;
    return {
      if (artifactID != null) 'artifactID': artifactID,
      if (artifactSubType != null) 'artifactSubType': artifactSubType.value,
      if (artifactType != null) 'artifactType': artifactType.value,
      if (checksum != null) 'checksum': checksum,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (logicalID != null) 'logicalID': logicalID,
      if (outputS3Configuration != null)
        'outputS3Configuration': outputS3Configuration,
    };
  }
}

class NetworkMigrationCodeGenerationArtifactType {
  static const cdkTypescript =
      NetworkMigrationCodeGenerationArtifactType._('CDK_TYPESCRIPT');
  static const cloudformationTemplate =
      NetworkMigrationCodeGenerationArtifactType._('CLOUDFORMATION_TEMPLATE');
  static const cdktfTypescript =
      NetworkMigrationCodeGenerationArtifactType._('CDKTF_TYPESCRIPT');
  static const terraformConfiguration =
      NetworkMigrationCodeGenerationArtifactType._('TERRAFORM_CONFIGURATION');
  static const cdkL2Typescript =
      NetworkMigrationCodeGenerationArtifactType._('CDK_L2_TYPESCRIPT');

  final String value;

  const NetworkMigrationCodeGenerationArtifactType._(this.value);

  static const values = [
    cdkTypescript,
    cloudformationTemplate,
    cdktfTypescript,
    terraformConfiguration,
    cdkL2Typescript
  ];

  static NetworkMigrationCodeGenerationArtifactType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkMigrationCodeGenerationArtifactType._(value));

  @override
  bool operator ==(other) =>
      other is NetworkMigrationCodeGenerationArtifactType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class NetworkMigrationCodeGenerationArtifactSubType {
  static const application =
      NetworkMigrationCodeGenerationArtifactSubType._('APPLICATION');
  static const nestedStack =
      NetworkMigrationCodeGenerationArtifactSubType._('NESTED_STACK');
  static const stack = NetworkMigrationCodeGenerationArtifactSubType._('STACK');

  final String value;

  const NetworkMigrationCodeGenerationArtifactSubType._(this.value);

  static const values = [application, nestedStack, stack];

  static NetworkMigrationCodeGenerationArtifactSubType fromString(
          String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkMigrationCodeGenerationArtifactSubType._(value));

  @override
  bool operator ==(other) =>
      other is NetworkMigrationCodeGenerationArtifactSubType &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters for listing code generation segments.
class ListNetworkMigrationCodeGenerationSegmentsFilters {
  /// A list of segment IDs to filter by.
  final List<String>? segmentIDs;

  ListNetworkMigrationCodeGenerationSegmentsFilters({
    this.segmentIDs,
  });

  Map<String, dynamic> toJson() {
    final segmentIDs = this.segmentIDs;
    return {
      if (segmentIDs != null) 'segmentIDs': segmentIDs,
    };
  }
}

/// Details about a network migration code generation job.
class NetworkMigrationCodeGenerationJobDetails {
  /// A map of output format types to their status details.
  final Map<CodeGenerationOutputFormatType,
          CodeGenerationOutputFormatStatusDetails>?
      codeGenerationOutputFormatStatusDetailsMap;

  /// The timestamp when the job was created.
  final DateTime? createdAt;

  /// The timestamp when the job completed or failed.
  final DateTime? endedAt;

  /// The unique identifier of the code generation job.
  final String? jobID;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the network migration execution.
  final String? networkMigrationExecutionID;

  /// The current status of the code generation job.
  final NetworkMigrationJobStatus? status;

  /// Detailed status information about the job.
  final String? statusDetails;

  NetworkMigrationCodeGenerationJobDetails({
    this.codeGenerationOutputFormatStatusDetailsMap,
    this.createdAt,
    this.endedAt,
    this.jobID,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.status,
    this.statusDetails,
  });

  factory NetworkMigrationCodeGenerationJobDetails.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationCodeGenerationJobDetails(
      codeGenerationOutputFormatStatusDetailsMap:
          (json['codeGenerationOutputFormatStatusDetailsMap']
                  as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(
                  CodeGenerationOutputFormatType.fromString(k),
                  CodeGenerationOutputFormatStatusDetails.fromJson(
                      e as Map<String, dynamic>))),
      createdAt: timeStampFromJson(json['createdAt']),
      endedAt: timeStampFromJson(json['endedAt']),
      jobID: json['jobID'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      status: (json['status'] as String?)
          ?.let(NetworkMigrationJobStatus.fromString),
      statusDetails: json['statusDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final codeGenerationOutputFormatStatusDetailsMap =
        this.codeGenerationOutputFormatStatusDetailsMap;
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final jobID = this.jobID;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final status = this.status;
    final statusDetails = this.statusDetails;
    return {
      if (codeGenerationOutputFormatStatusDetailsMap != null)
        'codeGenerationOutputFormatStatusDetailsMap':
            codeGenerationOutputFormatStatusDetailsMap
                .map((k, e) => MapEntry(k.value, e)),
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (jobID != null) 'jobID': jobID,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

/// Status details for a specific code generation output format.
class CodeGenerationOutputFormatStatusDetails {
  /// The status of the code generation for this output format.
  final CodeGenerationOutputFormatStatus? status;

  /// A list of detailed status information for the code generation.
  final String? statusDetailList;

  CodeGenerationOutputFormatStatusDetails({
    this.status,
    this.statusDetailList,
  });

  factory CodeGenerationOutputFormatStatusDetails.fromJson(
      Map<String, dynamic> json) {
    return CodeGenerationOutputFormatStatusDetails(
      status: (json['status'] as String?)
          ?.let(CodeGenerationOutputFormatStatus.fromString),
      statusDetailList: json['statusDetailList'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusDetailList = this.statusDetailList;
    return {
      if (status != null) 'status': status.value,
      if (statusDetailList != null) 'statusDetailList': statusDetailList,
    };
  }
}

class CodeGenerationOutputFormatStatus {
  static const succeeded = CodeGenerationOutputFormatStatus._('SUCCEEDED');
  static const failed = CodeGenerationOutputFormatStatus._('FAILED');

  final String value;

  const CodeGenerationOutputFormatStatus._(this.value);

  static const values = [succeeded, failed];

  static CodeGenerationOutputFormatStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CodeGenerationOutputFormatStatus._(value));

  @override
  bool operator ==(other) =>
      other is CodeGenerationOutputFormatStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters for listing code generation jobs.
class ListNetworkMigrationCodeGenerationsFilters {
  /// A list of job IDs to filter by.
  final List<String>? jobIDs;

  ListNetworkMigrationCodeGenerationsFilters({
    this.jobIDs,
  });

  Map<String, dynamic> toJson() {
    final jobIDs = this.jobIDs;
    return {
      if (jobIDs != null) 'jobIDs': jobIDs,
    };
  }
}

/// The result of a network migration analysis operation.
class NetworkMigrationAnalysisResult {
  /// The detailed analysis findings and recommendations.
  final String? analysisResult;

  /// The type of analyzer that generated this result.
  final AnalyzerType? analyzerType;

  /// The unique identifier of the analysis job that generated this result.
  final String? jobID;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the network migration execution.
  final String? networkMigrationExecutionID;

  /// The source resource that was analyzed.
  final NetworkMigrationAnalysisResultSource? source;

  /// The status of the analysis result.
  final NetworkMigrationAnalysisResultStatus? status;

  /// The target resource in the analysis.
  final NetworkMigrationAnalysisResultTarget? target;

  NetworkMigrationAnalysisResult({
    this.analysisResult,
    this.analyzerType,
    this.jobID,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.source,
    this.status,
    this.target,
  });

  factory NetworkMigrationAnalysisResult.fromJson(Map<String, dynamic> json) {
    return NetworkMigrationAnalysisResult(
      analysisResult: json['analysisResult'] as String?,
      analyzerType:
          (json['analyzerType'] as String?)?.let(AnalyzerType.fromString),
      jobID: json['jobID'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      source: json['source'] != null
          ? NetworkMigrationAnalysisResultSource.fromJson(
              json['source'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)
          ?.let(NetworkMigrationAnalysisResultStatus.fromString),
      target: json['target'] != null
          ? NetworkMigrationAnalysisResultTarget.fromJson(
              json['target'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final analysisResult = this.analysisResult;
    final analyzerType = this.analyzerType;
    final jobID = this.jobID;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final source = this.source;
    final status = this.status;
    final target = this.target;
    return {
      if (analysisResult != null) 'analysisResult': analysisResult,
      if (analyzerType != null) 'analyzerType': analyzerType.value,
      if (jobID != null) 'jobID': jobID,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (source != null) 'source': source,
      if (status != null) 'status': status.value,
      if (target != null) 'target': target,
    };
  }
}

class AnalyzerType {
  static const reachabilityAnalyzer = AnalyzerType._('REACHABILITY_ANALYZER');

  final String value;

  const AnalyzerType._(this.value);

  static const values = [reachabilityAnalyzer];

  static AnalyzerType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AnalyzerType._(value));

  @override
  bool operator ==(other) => other is AnalyzerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The source resource information for an analysis result.
class NetworkMigrationAnalysisResultSource {
  /// The subnet ID of the source resource.
  final String? subnetID;

  /// The VPC ID of the source resource.
  final String? vpcID;

  NetworkMigrationAnalysisResultSource({
    this.subnetID,
    this.vpcID,
  });

  factory NetworkMigrationAnalysisResultSource.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationAnalysisResultSource(
      subnetID: json['subnetID'] as String?,
      vpcID: json['vpcID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetID = this.subnetID;
    final vpcID = this.vpcID;
    return {
      if (subnetID != null) 'subnetID': subnetID,
      if (vpcID != null) 'vpcID': vpcID,
    };
  }
}

/// The target resource information for an analysis result.
class NetworkMigrationAnalysisResultTarget {
  /// The subnet ID of the target resource.
  final String? subnetID;

  /// The VPC ID of the target resource.
  final String? vpcID;

  NetworkMigrationAnalysisResultTarget({
    this.subnetID,
    this.vpcID,
  });

  factory NetworkMigrationAnalysisResultTarget.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationAnalysisResultTarget(
      subnetID: json['subnetID'] as String?,
      vpcID: json['vpcID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final subnetID = this.subnetID;
    final vpcID = this.vpcID;
    return {
      if (subnetID != null) 'subnetID': subnetID,
      if (vpcID != null) 'vpcID': vpcID,
    };
  }
}

class NetworkMigrationAnalysisResultStatus {
  static const pending = NetworkMigrationAnalysisResultStatus._('PENDING');
  static const started = NetworkMigrationAnalysisResultStatus._('STARTED');
  static const succeeded = NetworkMigrationAnalysisResultStatus._('SUCCEEDED');
  static const failed = NetworkMigrationAnalysisResultStatus._('FAILED');

  final String value;

  const NetworkMigrationAnalysisResultStatus._(this.value);

  static const values = [pending, started, succeeded, failed];

  static NetworkMigrationAnalysisResultStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => NetworkMigrationAnalysisResultStatus._(value));

  @override
  bool operator ==(other) =>
      other is NetworkMigrationAnalysisResultStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters for listing network migration analysis results.
class ListNetworkMigrationAnalysisResultsFilters {
  /// A list of VPC IDs to filter results by.
  final List<String>? vpcIDs;

  ListNetworkMigrationAnalysisResultsFilters({
    this.vpcIDs,
  });

  Map<String, dynamic> toJson() {
    final vpcIDs = this.vpcIDs;
    return {
      if (vpcIDs != null) 'vpcIDs': vpcIDs,
    };
  }
}

/// Details about a network migration analysis job.
class NetworkMigrationAnalysisJobDetails {
  /// The timestamp when the job was created.
  final DateTime? createdAt;

  /// The timestamp when the job completed or failed.
  final DateTime? endedAt;

  /// The unique identifier of the analysis job.
  final String? jobID;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// The unique identifier of the network migration execution.
  final String? networkMigrationExecutionID;

  /// The current status of the analysis job.
  final NetworkMigrationJobStatus? status;

  /// Detailed status information about the job.
  final String? statusDetails;

  NetworkMigrationAnalysisJobDetails({
    this.createdAt,
    this.endedAt,
    this.jobID,
    this.networkMigrationDefinitionID,
    this.networkMigrationExecutionID,
    this.status,
    this.statusDetails,
  });

  factory NetworkMigrationAnalysisJobDetails.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationAnalysisJobDetails(
      createdAt: timeStampFromJson(json['createdAt']),
      endedAt: timeStampFromJson(json['endedAt']),
      jobID: json['jobID'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      networkMigrationExecutionID:
          json['networkMigrationExecutionID'] as String?,
      status: (json['status'] as String?)
          ?.let(NetworkMigrationJobStatus.fromString),
      statusDetails: json['statusDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final jobID = this.jobID;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final networkMigrationExecutionID = this.networkMigrationExecutionID;
    final status = this.status;
    final statusDetails = this.statusDetails;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (jobID != null) 'jobID': jobID,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (networkMigrationExecutionID != null)
        'networkMigrationExecutionID': networkMigrationExecutionID,
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

/// Filters for listing network migration analysis jobs.
class ListNetworkMigrationAnalysesFilters {
  /// A list of job IDs to filter by.
  final List<String>? jobIDs;

  ListNetworkMigrationAnalysesFilters({
    this.jobIDs,
  });

  Map<String, dynamic> toJson() {
    final jobIDs = this.jobIDs;
    return {
      if (jobIDs != null) 'jobIDs': jobIDs,
    };
  }
}

/// A summary of a network migration definition.
class NetworkMigrationDefinitionSummary {
  /// The Amazon Resource Name (ARN) of the network migration definition.
  final String? arn;

  /// The name of the network migration definition.
  final String? name;

  /// The unique identifier of the network migration definition.
  final String? networkMigrationDefinitionID;

  /// Scope tags for the network migration definition.
  final Map<String, String>? scopeTags;

  /// The source environment configuration.
  final SourceEnvironment? sourceEnvironment;

  /// Tags assigned to the network migration definition.
  final Map<String, String>? tags;

  NetworkMigrationDefinitionSummary({
    this.arn,
    this.name,
    this.networkMigrationDefinitionID,
    this.scopeTags,
    this.sourceEnvironment,
    this.tags,
  });

  factory NetworkMigrationDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return NetworkMigrationDefinitionSummary(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
      networkMigrationDefinitionID:
          json['networkMigrationDefinitionID'] as String?,
      scopeTags: (json['scopeTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      sourceEnvironment: (json['sourceEnvironment'] as String?)
          ?.let(SourceEnvironment.fromString),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final networkMigrationDefinitionID = this.networkMigrationDefinitionID;
    final scopeTags = this.scopeTags;
    final sourceEnvironment = this.sourceEnvironment;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (networkMigrationDefinitionID != null)
        'networkMigrationDefinitionID': networkMigrationDefinitionID,
      if (scopeTags != null) 'scopeTags': scopeTags,
      if (sourceEnvironment != null)
        'sourceEnvironment': sourceEnvironment.value,
      if (tags != null) 'tags': tags,
    };
  }
}

class SourceEnvironment {
  static const nsx = SourceEnvironment._('NSX');
  static const vsphere = SourceEnvironment._('VSPHERE');
  static const fortigateFirewall = SourceEnvironment._('FORTIGATE_FIREWALL');
  static const paloAltoFirewall = SourceEnvironment._('PALO_ALTO_FIREWALL');
  static const ciscoAci = SourceEnvironment._('CISCO_ACI');
  static const logicalModel = SourceEnvironment._('LOGICAL_MODEL');
  static const modelizeIt = SourceEnvironment._('MODELIZE_IT');

  final String value;

  const SourceEnvironment._(this.value);

  static const values = [
    nsx,
    vsphere,
    fortigateFirewall,
    paloAltoFirewall,
    ciscoAci,
    logicalModel,
    modelizeIt
  ];

  static SourceEnvironment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SourceEnvironment._(value));

  @override
  bool operator ==(other) => other is SourceEnvironment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters for listing network migration definitions.
class ListNetworkMigrationDefinitionsRequestFilters {
  /// A list of definition IDs to filter by.
  final List<String>? networkMigrationDefinitionIDs;

  ListNetworkMigrationDefinitionsRequestFilters({
    this.networkMigrationDefinitionIDs,
  });

  Map<String, dynamic> toJson() {
    final networkMigrationDefinitionIDs = this.networkMigrationDefinitionIDs;
    return {
      if (networkMigrationDefinitionIDs != null)
        'networkMigrationDefinitionIDs': networkMigrationDefinitionIDs,
    };
  }
}

/// Updated S3 configuration for storing target network artifacts.
class TargetS3ConfigurationUpdate {
  /// The updated name of the S3 bucket.
  final String? s3Bucket;

  /// The updated AWS account ID of the S3 bucket owner.
  final String? s3BucketOwner;

  TargetS3ConfigurationUpdate({
    this.s3Bucket,
    this.s3BucketOwner,
  });

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    return {
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
    };
  }
}

/// Updated configuration for the target network topology and addressing.
class TargetNetworkUpdate {
  /// The updated CIDR block for inbound traffic.
  final String? inboundCidr;

  /// The updated CIDR block for inspection traffic.
  final String? inspectionCidr;

  /// The updated CIDR block for outbound traffic.
  final String? outboundCidr;

  /// The updated network topology type.
  final TargetNetworkTopology? topology;

  TargetNetworkUpdate({
    this.inboundCidr,
    this.inspectionCidr,
    this.outboundCidr,
    this.topology,
  });

  Map<String, dynamic> toJson() {
    final inboundCidr = this.inboundCidr;
    final inspectionCidr = this.inspectionCidr;
    final outboundCidr = this.outboundCidr;
    final topology = this.topology;
    return {
      if (inboundCidr != null) 'inboundCidr': inboundCidr,
      if (inspectionCidr != null) 'inspectionCidr': inspectionCidr,
      if (outboundCidr != null) 'outboundCidr': outboundCidr,
      if (topology != null) 'topology': topology.value,
    };
  }
}

class TargetDeployment {
  static const singleAccount = TargetDeployment._('SINGLE_ACCOUNT');
  static const multiAccount = TargetDeployment._('MULTI_ACCOUNT');

  final String value;

  const TargetDeployment._(this.value);

  static const values = [singleAccount, multiAccount];

  static TargetDeployment fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetDeployment._(value));

  @override
  bool operator ==(other) => other is TargetDeployment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class TargetNetworkTopology {
  static const isolatedVpc = TargetNetworkTopology._('ISOLATED_VPC');
  static const hubAndSpoke = TargetNetworkTopology._('HUB_AND_SPOKE');

  final String value;

  const TargetNetworkTopology._(this.value);

  static const values = [isolatedVpc, hubAndSpoke];

  static TargetNetworkTopology fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TargetNetworkTopology._(value));

  @override
  bool operator ==(other) =>
      other is TargetNetworkTopology && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration for a migration source environment.
class SourceConfiguration {
  /// The source environment type.
  final SourceEnvironment sourceEnvironment;

  /// The S3 configuration for the source data.
  final SourceS3Configuration sourceS3Configuration;

  SourceConfiguration({
    required this.sourceEnvironment,
    required this.sourceS3Configuration,
  });

  factory SourceConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceConfiguration(
      sourceEnvironment: SourceEnvironment.fromString(
          (json['sourceEnvironment'] as String?) ?? ''),
      sourceS3Configuration: SourceS3Configuration.fromJson(
          (json['sourceS3Configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceEnvironment = this.sourceEnvironment;
    final sourceS3Configuration = this.sourceS3Configuration;
    return {
      'sourceEnvironment': sourceEnvironment.value,
      'sourceS3Configuration': sourceS3Configuration,
    };
  }
}

/// S3 configuration for source network data.
class SourceS3Configuration {
  /// The name of the S3 bucket containing source data.
  final String s3Bucket;

  /// The AWS account ID of the S3 bucket owner.
  final String s3BucketOwner;

  /// The S3 key (path) for the source data.
  final String s3Key;

  SourceS3Configuration({
    required this.s3Bucket,
    required this.s3BucketOwner,
    required this.s3Key,
  });

  factory SourceS3Configuration.fromJson(Map<String, dynamic> json) {
    return SourceS3Configuration(
      s3Bucket: (json['s3Bucket'] as String?) ?? '',
      s3BucketOwner: (json['s3BucketOwner'] as String?) ?? '',
      s3Key: (json['s3Key'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    final s3Key = this.s3Key;
    return {
      's3Bucket': s3Bucket,
      's3BucketOwner': s3BucketOwner,
      's3Key': s3Key,
    };
  }
}

/// S3 configuration for storing target network artifacts.
class TargetS3Configuration {
  /// The name of the S3 bucket for target artifacts.
  final String s3Bucket;

  /// The AWS account ID of the S3 bucket owner.
  final String s3BucketOwner;

  TargetS3Configuration({
    required this.s3Bucket,
    required this.s3BucketOwner,
  });

  factory TargetS3Configuration.fromJson(Map<String, dynamic> json) {
    return TargetS3Configuration(
      s3Bucket: (json['s3Bucket'] as String?) ?? '',
      s3BucketOwner: (json['s3BucketOwner'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    return {
      's3Bucket': s3Bucket,
      's3BucketOwner': s3BucketOwner,
    };
  }
}

/// Configuration for the target network topology and addressing.
class TargetNetwork {
  /// The network topology type for the target environment.
  final TargetNetworkTopology topology;

  /// The CIDR block for inbound traffic in the target network.
  final String? inboundCidr;

  /// The CIDR block for inspection traffic in the target network.
  final String? inspectionCidr;

  /// The CIDR block for outbound traffic in the target network.
  final String? outboundCidr;

  TargetNetwork({
    required this.topology,
    this.inboundCidr,
    this.inspectionCidr,
    this.outboundCidr,
  });

  factory TargetNetwork.fromJson(Map<String, dynamic> json) {
    return TargetNetwork(
      topology:
          TargetNetworkTopology.fromString((json['topology'] as String?) ?? ''),
      inboundCidr: json['inboundCidr'] as String?,
      inspectionCidr: json['inspectionCidr'] as String?,
      outboundCidr: json['outboundCidr'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final topology = this.topology;
    final inboundCidr = this.inboundCidr;
    final inspectionCidr = this.inspectionCidr;
    final outboundCidr = this.outboundCidr;
    return {
      'topology': topology.value,
      if (inboundCidr != null) 'inboundCidr': inboundCidr,
      if (inspectionCidr != null) 'inspectionCidr': inspectionCidr,
      if (outboundCidr != null) 'outboundCidr': outboundCidr,
    };
  }
}

/// Template post migration custom action filters.
class TemplateActionsRequestFilters {
  /// Action IDs to filter template post migration custom actions by.
  final List<String>? actionIDs;

  TemplateActionsRequestFilters({
    this.actionIDs,
  });

  Map<String, dynamic> toJson() {
    final actionIDs = this.actionIDs;
    return {
      if (actionIDs != null) 'actionIDs': actionIDs,
    };
  }
}

/// Launch template disk configuration.
class LaunchTemplateDiskConf {
  /// Launch template disk iops configuration.
  final int? iops;

  /// Launch template disk throughput configuration.
  final int? throughput;

  /// Launch template disk volume type configuration.
  final VolumeType? volumeType;

  LaunchTemplateDiskConf({
    this.iops,
    this.throughput,
    this.volumeType,
  });

  factory LaunchTemplateDiskConf.fromJson(Map<String, dynamic> json) {
    return LaunchTemplateDiskConf(
      iops: json['iops'] as int?,
      throughput: json['throughput'] as int?,
      volumeType: (json['volumeType'] as String?)?.let(VolumeType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final throughput = this.throughput;
    final volumeType = this.volumeType;
    return {
      if (iops != null) 'iops': iops,
      if (throughput != null) 'throughput': throughput,
      if (volumeType != null) 'volumeType': volumeType.value,
    };
  }
}

class VolumeType {
  static const io1 = VolumeType._('io1');
  static const io2 = VolumeType._('io2');
  static const gp3 = VolumeType._('gp3');
  static const gp2 = VolumeType._('gp2');
  static const st1 = VolumeType._('st1');
  static const sc1 = VolumeType._('sc1');
  static const standard = VolumeType._('standard');

  final String value;

  const VolumeType._(this.value);

  static const values = [io1, io2, gp3, gp2, st1, sc1, standard];

  static VolumeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VolumeType._(value));

  @override
  bool operator ==(other) => other is VolumeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Job log.
class JobLog {
  /// Job log event.
  final JobLogEvent? event;

  /// Job event data
  final JobLogEventData? eventData;

  /// Job log event date and time.
  final String? logDateTime;

  JobLog({
    this.event,
    this.eventData,
    this.logDateTime,
  });

  factory JobLog.fromJson(Map<String, dynamic> json) {
    return JobLog(
      event: (json['event'] as String?)?.let(JobLogEvent.fromString),
      eventData: json['eventData'] != null
          ? JobLogEventData.fromJson(json['eventData'] as Map<String, dynamic>)
          : null,
      logDateTime: json['logDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final eventData = this.eventData;
    final logDateTime = this.logDateTime;
    return {
      if (event != null) 'event': event.value,
      if (eventData != null) 'eventData': eventData,
      if (logDateTime != null) 'logDateTime': logDateTime,
    };
  }
}

class JobLogEvent {
  static const jobStart = JobLogEvent._('JOB_START');
  static const serverSkipped = JobLogEvent._('SERVER_SKIPPED');
  static const cleanupStart = JobLogEvent._('CLEANUP_START');
  static const cleanupEnd = JobLogEvent._('CLEANUP_END');
  static const cleanupFail = JobLogEvent._('CLEANUP_FAIL');
  static const snapshotStart = JobLogEvent._('SNAPSHOT_START');
  static const snapshotEnd = JobLogEvent._('SNAPSHOT_END');
  static const snapshotFail = JobLogEvent._('SNAPSHOT_FAIL');
  static const usingPreviousSnapshot = JobLogEvent._('USING_PREVIOUS_SNAPSHOT');
  static const conversionStart = JobLogEvent._('CONVERSION_START');
  static const conversionEnd = JobLogEvent._('CONVERSION_END');
  static const conversionFail = JobLogEvent._('CONVERSION_FAIL');
  static const launchStart = JobLogEvent._('LAUNCH_START');
  static const launchFailed = JobLogEvent._('LAUNCH_FAILED');
  static const jobCancel = JobLogEvent._('JOB_CANCEL');
  static const jobEnd = JobLogEvent._('JOB_END');

  final String value;

  const JobLogEvent._(this.value);

  static const values = [
    jobStart,
    serverSkipped,
    cleanupStart,
    cleanupEnd,
    cleanupFail,
    snapshotStart,
    snapshotEnd,
    snapshotFail,
    usingPreviousSnapshot,
    conversionStart,
    conversionEnd,
    conversionFail,
    launchStart,
    launchFailed,
    jobCancel,
    jobEnd
  ];

  static JobLogEvent fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobLogEvent._(value));

  @override
  bool operator ==(other) => other is JobLogEvent && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Job log data
class JobLogEventData {
  /// Retries for this operation.
  final int? attemptCount;

  /// Job Event conversion Server ID.
  final String? conversionServerID;

  /// The maximum number of retries that will be attempted if this operation
  /// failed.
  final int? maxAttemptsCount;

  /// Job error.
  final String? rawError;

  /// Job Event Source Server ID.
  final String? sourceServerID;

  /// Job Event Target instance ID.
  final String? targetInstanceID;

  JobLogEventData({
    this.attemptCount,
    this.conversionServerID,
    this.maxAttemptsCount,
    this.rawError,
    this.sourceServerID,
    this.targetInstanceID,
  });

  factory JobLogEventData.fromJson(Map<String, dynamic> json) {
    return JobLogEventData(
      attemptCount: json['attemptCount'] as int?,
      conversionServerID: json['conversionServerID'] as String?,
      maxAttemptsCount: json['maxAttemptsCount'] as int?,
      rawError: json['rawError'] as String?,
      sourceServerID: json['sourceServerID'] as String?,
      targetInstanceID: json['targetInstanceID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attemptCount = this.attemptCount;
    final conversionServerID = this.conversionServerID;
    final maxAttemptsCount = this.maxAttemptsCount;
    final rawError = this.rawError;
    final sourceServerID = this.sourceServerID;
    final targetInstanceID = this.targetInstanceID;
    return {
      if (attemptCount != null) 'attemptCount': attemptCount,
      if (conversionServerID != null) 'conversionServerID': conversionServerID,
      if (maxAttemptsCount != null) 'maxAttemptsCount': maxAttemptsCount,
      if (rawError != null) 'rawError': rawError,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (targetInstanceID != null) 'targetInstanceID': targetInstanceID,
    };
  }
}

/// Request to describe Job log filters.
class DescribeJobsRequestFilters {
  /// Request to describe Job log filters by date.
  final String? fromDate;

  /// Request to describe Job log filters by job ID.
  final List<String>? jobIDs;

  /// Request to describe job log items by last date.
  final String? toDate;

  DescribeJobsRequestFilters({
    this.fromDate,
    this.jobIDs,
    this.toDate,
  });

  Map<String, dynamic> toJson() {
    final fromDate = this.fromDate;
    final jobIDs = this.jobIDs;
    final toDate = this.toDate;
    return {
      if (fromDate != null) 'fromDate': fromDate,
      if (jobIDs != null) 'jobIDs': jobIDs,
      if (toDate != null) 'toDate': toDate,
    };
  }
}

/// Import task error.
class ImportTaskError {
  /// Import task error data.
  final ImportErrorData? errorData;

  /// Import task error datetime.
  final String? errorDateTime;

  /// Import task error type.
  final ImportErrorType? errorType;

  ImportTaskError({
    this.errorData,
    this.errorDateTime,
    this.errorType,
  });

  factory ImportTaskError.fromJson(Map<String, dynamic> json) {
    return ImportTaskError(
      errorData: json['errorData'] != null
          ? ImportErrorData.fromJson(json['errorData'] as Map<String, dynamic>)
          : null,
      errorDateTime: json['errorDateTime'] as String?,
      errorType:
          (json['errorType'] as String?)?.let(ImportErrorType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final errorData = this.errorData;
    final errorDateTime = this.errorDateTime;
    final errorType = this.errorType;
    return {
      if (errorData != null) 'errorData': errorData,
      if (errorDateTime != null) 'errorDateTime': errorDateTime,
      if (errorType != null) 'errorType': errorType.value,
    };
  }
}

class ImportErrorType {
  static const validationError = ImportErrorType._('VALIDATION_ERROR');
  static const processingError = ImportErrorType._('PROCESSING_ERROR');

  final String value;

  const ImportErrorType._(this.value);

  static const values = [validationError, processingError];

  static ImportErrorType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImportErrorType._(value));

  @override
  bool operator ==(other) => other is ImportErrorType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Import error data.
class ImportErrorData {
  /// Import error data source account ID.
  final String? accountID;

  /// Import error data application ID.
  final String? applicationID;

  /// Import error data ec2 LaunchTemplate ID.
  final String? ec2LaunchTemplateID;

  /// Import error data raw error.
  final String? rawError;

  /// Import error data row number.
  final int? rowNumber;

  /// Import error data source server ID.
  final String? sourceServerID;

  /// Import error data wave id.
  final String? waveID;

  ImportErrorData({
    this.accountID,
    this.applicationID,
    this.ec2LaunchTemplateID,
    this.rawError,
    this.rowNumber,
    this.sourceServerID,
    this.waveID,
  });

  factory ImportErrorData.fromJson(Map<String, dynamic> json) {
    return ImportErrorData(
      accountID: json['accountID'] as String?,
      applicationID: json['applicationID'] as String?,
      ec2LaunchTemplateID: json['ec2LaunchTemplateID'] as String?,
      rawError: json['rawError'] as String?,
      rowNumber: json['rowNumber'] as int?,
      sourceServerID: json['sourceServerID'] as String?,
      waveID: json['waveID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountID = this.accountID;
    final applicationID = this.applicationID;
    final ec2LaunchTemplateID = this.ec2LaunchTemplateID;
    final rawError = this.rawError;
    final rowNumber = this.rowNumber;
    final sourceServerID = this.sourceServerID;
    final waveID = this.waveID;
    return {
      if (accountID != null) 'accountID': accountID,
      if (applicationID != null) 'applicationID': applicationID,
      if (ec2LaunchTemplateID != null)
        'ec2LaunchTemplateID': ec2LaunchTemplateID,
      if (rawError != null) 'rawError': rawError,
      if (rowNumber != null) 'rowNumber': rowNumber,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (waveID != null) 'waveID': waveID,
    };
  }
}

/// Import task.
class ImportTask {
  /// ImportTask arn.
  final String? arn;

  /// Import task creation datetime.
  final String? creationDateTime;

  /// Import task end datetime.
  final String? endDateTime;

  /// Import task id.
  final String? importID;

  /// Import task progress percentage.
  final double? progressPercentage;

  /// Import task s3 bucket source.
  final S3BucketSource? s3BucketSource;

  /// Import task status.
  final ImportStatus? status;

  /// Import task summary.
  final ImportTaskSummary? summary;

  /// Import task tags.
  final Map<String, String>? tags;

  ImportTask({
    this.arn,
    this.creationDateTime,
    this.endDateTime,
    this.importID,
    this.progressPercentage,
    this.s3BucketSource,
    this.status,
    this.summary,
    this.tags,
  });

  factory ImportTask.fromJson(Map<String, dynamic> json) {
    return ImportTask(
      arn: json['arn'] as String?,
      creationDateTime: json['creationDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      importID: json['importID'] as String?,
      progressPercentage: json['progressPercentage'] as double?,
      s3BucketSource: json['s3BucketSource'] != null
          ? S3BucketSource.fromJson(
              json['s3BucketSource'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.let(ImportStatus.fromString),
      summary: json['summary'] != null
          ? ImportTaskSummary.fromJson(json['summary'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final importID = this.importID;
    final progressPercentage = this.progressPercentage;
    final s3BucketSource = this.s3BucketSource;
    final status = this.status;
    final summary = this.summary;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (endDateTime != null) 'endDateTime': endDateTime,
      if (importID != null) 'importID': importID,
      if (progressPercentage != null) 'progressPercentage': progressPercentage,
      if (s3BucketSource != null) 's3BucketSource': s3BucketSource,
      if (status != null) 'status': status.value,
      if (summary != null) 'summary': summary,
      if (tags != null) 'tags': tags,
    };
  }
}

/// S3 bucket source.
class S3BucketSource {
  /// S3 bucket source s3 bucket.
  final String s3Bucket;

  /// S3 bucket source s3 key.
  final String s3Key;

  /// S3 bucket source s3 bucket owner.
  final String? s3BucketOwner;

  S3BucketSource({
    required this.s3Bucket,
    required this.s3Key,
    this.s3BucketOwner,
  });

  factory S3BucketSource.fromJson(Map<String, dynamic> json) {
    return S3BucketSource(
      s3Bucket: (json['s3Bucket'] as String?) ?? '',
      s3Key: (json['s3Key'] as String?) ?? '',
      s3BucketOwner: json['s3BucketOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3BucketOwner = this.s3BucketOwner;
    return {
      's3Bucket': s3Bucket,
      's3Key': s3Key,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
    };
  }
}

class ImportStatus {
  static const pending = ImportStatus._('PENDING');
  static const started = ImportStatus._('STARTED');
  static const failed = ImportStatus._('FAILED');
  static const succeeded = ImportStatus._('SUCCEEDED');

  final String value;

  const ImportStatus._(this.value);

  static const values = [pending, started, failed, succeeded];

  static ImportStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ImportStatus._(value));

  @override
  bool operator ==(other) => other is ImportStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Import task summary.
class ImportTaskSummary {
  /// Import task summary applications.
  final ImportTaskSummaryApplications? applications;

  /// Import task summary servers.
  final ImportTaskSummaryServers? servers;

  /// Import task summary waves.
  final ImportTaskSummaryWaves? waves;

  ImportTaskSummary({
    this.applications,
    this.servers,
    this.waves,
  });

  factory ImportTaskSummary.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummary(
      applications: json['applications'] != null
          ? ImportTaskSummaryApplications.fromJson(
              json['applications'] as Map<String, dynamic>)
          : null,
      servers: json['servers'] != null
          ? ImportTaskSummaryServers.fromJson(
              json['servers'] as Map<String, dynamic>)
          : null,
      waves: json['waves'] != null
          ? ImportTaskSummaryWaves.fromJson(
              json['waves'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final servers = this.servers;
    final waves = this.waves;
    return {
      if (applications != null) 'applications': applications,
      if (servers != null) 'servers': servers,
      if (waves != null) 'waves': waves,
    };
  }
}

/// Import task summery waves.
class ImportTaskSummaryWaves {
  /// Import task summery waves created count.
  final int? createdCount;

  /// Import task summery waves modified count.
  final int? modifiedCount;

  ImportTaskSummaryWaves({
    this.createdCount,
    this.modifiedCount,
  });

  factory ImportTaskSummaryWaves.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummaryWaves(
      createdCount: json['createdCount'] as int?,
      modifiedCount: json['modifiedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdCount = this.createdCount;
    final modifiedCount = this.modifiedCount;
    return {
      if (createdCount != null) 'createdCount': createdCount,
      if (modifiedCount != null) 'modifiedCount': modifiedCount,
    };
  }
}

/// Import task summary applications.
class ImportTaskSummaryApplications {
  /// Import task summary applications created count.
  final int? createdCount;

  /// Import task summary applications modified count.
  final int? modifiedCount;

  ImportTaskSummaryApplications({
    this.createdCount,
    this.modifiedCount,
  });

  factory ImportTaskSummaryApplications.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummaryApplications(
      createdCount: json['createdCount'] as int?,
      modifiedCount: json['modifiedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdCount = this.createdCount;
    final modifiedCount = this.modifiedCount;
    return {
      if (createdCount != null) 'createdCount': createdCount,
      if (modifiedCount != null) 'modifiedCount': modifiedCount,
    };
  }
}

/// Import task summary servers.
class ImportTaskSummaryServers {
  /// Import task summary servers created count.
  final int? createdCount;

  /// Import task summary servers modified count.
  final int? modifiedCount;

  ImportTaskSummaryServers({
    this.createdCount,
    this.modifiedCount,
  });

  factory ImportTaskSummaryServers.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummaryServers(
      createdCount: json['createdCount'] as int?,
      modifiedCount: json['modifiedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdCount = this.createdCount;
    final modifiedCount = this.modifiedCount;
    return {
      if (createdCount != null) 'createdCount': createdCount,
      if (modifiedCount != null) 'modifiedCount': modifiedCount,
    };
  }
}

/// List imports request filters.
class ListImportsRequestFilters {
  /// List imports request filters import IDs.
  final List<String>? importIDs;

  ListImportsRequestFilters({
    this.importIDs,
  });

  Map<String, dynamic> toJson() {
    final importIDs = this.importIDs;
    return {
      if (importIDs != null) 'importIDs': importIDs,
    };
  }
}

/// Export task error.
class ExportTaskError {
  /// Export task error data.
  final ExportErrorData? errorData;

  /// Export task error datetime.
  final String? errorDateTime;

  ExportTaskError({
    this.errorData,
    this.errorDateTime,
  });

  factory ExportTaskError.fromJson(Map<String, dynamic> json) {
    return ExportTaskError(
      errorData: json['errorData'] != null
          ? ExportErrorData.fromJson(json['errorData'] as Map<String, dynamic>)
          : null,
      errorDateTime: json['errorDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorData = this.errorData;
    final errorDateTime = this.errorDateTime;
    return {
      if (errorData != null) 'errorData': errorData,
      if (errorDateTime != null) 'errorDateTime': errorDateTime,
    };
  }
}

/// Export errors data.
class ExportErrorData {
  /// Export errors data raw error.
  final String? rawError;

  ExportErrorData({
    this.rawError,
  });

  factory ExportErrorData.fromJson(Map<String, dynamic> json) {
    return ExportErrorData(
      rawError: json['rawError'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rawError = this.rawError;
    return {
      if (rawError != null) 'rawError': rawError,
    };
  }
}

/// Export task.
class ExportTask {
  /// ExportTask arn.
  final String? arn;

  /// Export task creation datetime.
  final String? creationDateTime;

  /// Export task end datetime.
  final String? endDateTime;

  /// Export task id.
  final String? exportID;

  /// Export task progress percentage.
  final double? progressPercentage;

  /// Export task s3 bucket.
  final String? s3Bucket;

  /// Export task s3 bucket owner.
  final String? s3BucketOwner;

  /// Export task s3 key.
  final String? s3Key;

  /// Export task status.
  final ExportStatus? status;

  /// Export task summary.
  final ExportTaskSummary? summary;

  /// Export task tags.
  final Map<String, String>? tags;

  ExportTask({
    this.arn,
    this.creationDateTime,
    this.endDateTime,
    this.exportID,
    this.progressPercentage,
    this.s3Bucket,
    this.s3BucketOwner,
    this.s3Key,
    this.status,
    this.summary,
    this.tags,
  });

  factory ExportTask.fromJson(Map<String, dynamic> json) {
    return ExportTask(
      arn: json['arn'] as String?,
      creationDateTime: json['creationDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      exportID: json['exportID'] as String?,
      progressPercentage: json['progressPercentage'] as double?,
      s3Bucket: json['s3Bucket'] as String?,
      s3BucketOwner: json['s3BucketOwner'] as String?,
      s3Key: json['s3Key'] as String?,
      status: (json['status'] as String?)?.let(ExportStatus.fromString),
      summary: json['summary'] != null
          ? ExportTaskSummary.fromJson(json['summary'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final exportID = this.exportID;
    final progressPercentage = this.progressPercentage;
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    final s3Key = this.s3Key;
    final status = this.status;
    final summary = this.summary;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (endDateTime != null) 'endDateTime': endDateTime,
      if (exportID != null) 'exportID': exportID,
      if (progressPercentage != null) 'progressPercentage': progressPercentage,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
      if (s3Key != null) 's3Key': s3Key,
      if (status != null) 'status': status.value,
      if (summary != null) 'summary': summary,
      if (tags != null) 'tags': tags,
    };
  }
}

class ExportStatus {
  static const pending = ExportStatus._('PENDING');
  static const started = ExportStatus._('STARTED');
  static const failed = ExportStatus._('FAILED');
  static const succeeded = ExportStatus._('SUCCEEDED');

  final String value;

  const ExportStatus._(this.value);

  static const values = [pending, started, failed, succeeded];

  static ExportStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ExportStatus._(value));

  @override
  bool operator ==(other) => other is ExportStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Export task summary.
class ExportTaskSummary {
  /// Export task summary applications count.
  final int? applicationsCount;

  /// Export task summary servers count.
  final int? serversCount;

  /// Export task summary waves count.
  final int? wavesCount;

  ExportTaskSummary({
    this.applicationsCount,
    this.serversCount,
    this.wavesCount,
  });

  factory ExportTaskSummary.fromJson(Map<String, dynamic> json) {
    return ExportTaskSummary(
      applicationsCount: json['applicationsCount'] as int?,
      serversCount: json['serversCount'] as int?,
      wavesCount: json['wavesCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationsCount = this.applicationsCount;
    final serversCount = this.serversCount;
    final wavesCount = this.wavesCount;
    return {
      if (applicationsCount != null) 'applicationsCount': applicationsCount,
      if (serversCount != null) 'serversCount': serversCount,
      if (wavesCount != null) 'wavesCount': wavesCount,
    };
  }
}

/// List exports request filters.
class ListExportsRequestFilters {
  /// List exports request filters export ids.
  final List<String>? exportIDs;

  ListExportsRequestFilters({
    this.exportIDs,
  });

  Map<String, dynamic> toJson() {
    final exportIDs = this.exportIDs;
    return {
      if (exportIDs != null) 'exportIDs': exportIDs,
    };
  }
}

/// List Connectors Request Filters.
class ListConnectorsRequestFilters {
  /// List Connectors Request Filters connector IDs.
  final List<String>? connectorIDs;

  ListConnectorsRequestFilters({
    this.connectorIDs,
  });

  Map<String, dynamic> toJson() {
    final connectorIDs = this.connectorIDs;
    return {
      if (connectorIDs != null) 'connectorIDs': connectorIDs,
    };
  }
}

/// Connector SSM command config.
class ConnectorSsmCommandConfig {
  /// Connector SSM command config CloudWatch output enabled.
  final bool cloudWatchOutputEnabled;

  /// Connector SSM command config S3 output enabled.
  final bool s3OutputEnabled;

  /// Connector SSM command config CloudWatch log group name.
  final String? cloudWatchLogGroupName;

  /// Connector SSM command config output S3 bucket name.
  final String? outputS3BucketName;

  ConnectorSsmCommandConfig({
    required this.cloudWatchOutputEnabled,
    required this.s3OutputEnabled,
    this.cloudWatchLogGroupName,
    this.outputS3BucketName,
  });

  factory ConnectorSsmCommandConfig.fromJson(Map<String, dynamic> json) {
    return ConnectorSsmCommandConfig(
      cloudWatchOutputEnabled:
          (json['cloudWatchOutputEnabled'] as bool?) ?? false,
      s3OutputEnabled: (json['s3OutputEnabled'] as bool?) ?? false,
      cloudWatchLogGroupName: json['cloudWatchLogGroupName'] as String?,
      outputS3BucketName: json['outputS3BucketName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchOutputEnabled = this.cloudWatchOutputEnabled;
    final s3OutputEnabled = this.s3OutputEnabled;
    final cloudWatchLogGroupName = this.cloudWatchLogGroupName;
    final outputS3BucketName = this.outputS3BucketName;
    return {
      'cloudWatchOutputEnabled': cloudWatchOutputEnabled,
      's3OutputEnabled': s3OutputEnabled,
      if (cloudWatchLogGroupName != null)
        'cloudWatchLogGroupName': cloudWatchLogGroupName,
      if (outputS3BucketName != null) 'outputS3BucketName': outputS3BucketName,
    };
  }
}

/// Applications list filters.
class ListApplicationsRequestFilters {
  /// Filter applications list by application ID.
  final List<String>? applicationIDs;

  /// Filter applications list by archival status.
  final bool? isArchived;

  /// Filter applications list by wave ID.
  final List<String>? waveIDs;

  ListApplicationsRequestFilters({
    this.applicationIDs,
    this.isArchived,
    this.waveIDs,
  });

  Map<String, dynamic> toJson() {
    final applicationIDs = this.applicationIDs;
    final isArchived = this.isArchived;
    final waveIDs = this.waveIDs;
    return {
      if (applicationIDs != null) 'applicationIDs': applicationIDs,
      if (isArchived != null) 'isArchived': isArchived,
      if (waveIDs != null) 'waveIDs': waveIDs,
    };
  }
}

/// Application aggregated status.
class ApplicationAggregatedStatus {
  /// Application aggregated status health status.
  final ApplicationHealthStatus? healthStatus;

  /// Application aggregated status last update dateTime.
  final String? lastUpdateDateTime;

  /// Application aggregated status progress status.
  final ApplicationProgressStatus? progressStatus;

  /// Application aggregated status total source servers amount.
  final int? totalSourceServers;

  ApplicationAggregatedStatus({
    this.healthStatus,
    this.lastUpdateDateTime,
    this.progressStatus,
    this.totalSourceServers,
  });

  factory ApplicationAggregatedStatus.fromJson(Map<String, dynamic> json) {
    return ApplicationAggregatedStatus(
      healthStatus: (json['healthStatus'] as String?)
          ?.let(ApplicationHealthStatus.fromString),
      lastUpdateDateTime: json['lastUpdateDateTime'] as String?,
      progressStatus: (json['progressStatus'] as String?)
          ?.let(ApplicationProgressStatus.fromString),
      totalSourceServers: json['totalSourceServers'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthStatus = this.healthStatus;
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final progressStatus = this.progressStatus;
    final totalSourceServers = this.totalSourceServers;
    return {
      if (healthStatus != null) 'healthStatus': healthStatus.value,
      if (lastUpdateDateTime != null) 'lastUpdateDateTime': lastUpdateDateTime,
      if (progressStatus != null) 'progressStatus': progressStatus.value,
      if (totalSourceServers != null) 'totalSourceServers': totalSourceServers,
    };
  }
}

class ApplicationHealthStatus {
  static const healthy = ApplicationHealthStatus._('HEALTHY');
  static const lagging = ApplicationHealthStatus._('LAGGING');
  static const error = ApplicationHealthStatus._('ERROR');

  final String value;

  const ApplicationHealthStatus._(this.value);

  static const values = [healthy, lagging, error];

  static ApplicationHealthStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationHealthStatus._(value));

  @override
  bool operator ==(other) =>
      other is ApplicationHealthStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ApplicationProgressStatus {
  static const notStarted = ApplicationProgressStatus._('NOT_STARTED');
  static const inProgress = ApplicationProgressStatus._('IN_PROGRESS');
  static const completed = ApplicationProgressStatus._('COMPLETED');

  final String value;

  const ApplicationProgressStatus._(this.value);

  static const values = [notStarted, inProgress, completed];

  static ApplicationProgressStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationProgressStatus._(value));

  @override
  bool operator ==(other) =>
      other is ApplicationProgressStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// S3 configuration for the source import file to be enriched.
class EnrichmentSourceS3Configuration {
  /// The name of the S3 bucket containing the source import file.
  final String s3Bucket;

  /// The AWS account ID of the S3 bucket owner.
  final String s3BucketOwner;

  /// The S3 key (path) for the source import file.
  final String s3Key;

  EnrichmentSourceS3Configuration({
    required this.s3Bucket,
    required this.s3BucketOwner,
    required this.s3Key,
  });

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    final s3Key = this.s3Key;
    return {
      's3Bucket': s3Bucket,
      's3BucketOwner': s3BucketOwner,
      's3Key': s3Key,
    };
  }
}

/// S3 configuration for storing the enriched import file.
class EnrichmentTargetS3Configuration {
  /// The name of the S3 bucket where the enriched import file will be stored.
  final String s3Bucket;

  /// The AWS account ID of the target S3 bucket owner.
  final String s3BucketOwner;

  /// The S3 key (path) where the enriched import file will be stored.
  final String s3Key;

  EnrichmentTargetS3Configuration({
    required this.s3Bucket,
    required this.s3BucketOwner,
    required this.s3Key,
  });

  factory EnrichmentTargetS3Configuration.fromJson(Map<String, dynamic> json) {
    return EnrichmentTargetS3Configuration(
      s3Bucket: (json['s3Bucket'] as String?) ?? '',
      s3BucketOwner: (json['s3BucketOwner'] as String?) ?? '',
      s3Key: (json['s3Key'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    final s3Key = this.s3Key;
    return {
      's3Bucket': s3Bucket,
      's3BucketOwner': s3BucketOwner,
      's3Key': s3Key,
    };
  }
}

/// The strategy for assigning IP addresses during the enrichment process.
/// STATIC assigns fixed IP addresses, while DYNAMIC allows for dynamic IP
/// allocation.
class IpAssignmentStrategy {
  static const static = IpAssignmentStrategy._('STATIC');
  static const $dynamic = IpAssignmentStrategy._('DYNAMIC');

  final String value;

  const IpAssignmentStrategy._(this.value);

  static const values = [static, $dynamic];

  static IpAssignmentStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IpAssignmentStrategy._(value));

  @override
  bool operator ==(other) =>
      other is IpAssignmentStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Managed account.
class ManagedAccount {
  /// Managed account, account ID.
  final String? accountId;

  ManagedAccount({
    this.accountId,
  });

  factory ManagedAccount.fromJson(Map<String, dynamic> json) {
    return ManagedAccount(
      accountId: json['accountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      if (accountId != null) 'accountId': accountId,
    };
  }
}

/// Details about an import file enrichment job.
class ImportFileEnrichment {
  /// The checksum of the enriched file for integrity verification.
  final Checksum? checksum;

  /// The timestamp when the enrichment job was created.
  final DateTime? createdAt;

  /// The timestamp when the enrichment job completed or failed.
  final DateTime? endedAt;

  /// The unique identifier of the import file enrichment job.
  final String? jobID;

  /// The target S3 configuration for the enriched import file.
  final EnrichmentTargetS3Configuration? s3BucketTarget;

  /// The current status of the import file enrichment job.
  final ImportFileEnrichmentStatus? status;

  /// Detailed status information about the enrichment job.
  final String? statusDetails;

  ImportFileEnrichment({
    this.checksum,
    this.createdAt,
    this.endedAt,
    this.jobID,
    this.s3BucketTarget,
    this.status,
    this.statusDetails,
  });

  factory ImportFileEnrichment.fromJson(Map<String, dynamic> json) {
    return ImportFileEnrichment(
      checksum: json['checksum'] != null
          ? Checksum.fromJson(json['checksum'] as Map<String, dynamic>)
          : null,
      createdAt: timeStampFromJson(json['createdAt']),
      endedAt: timeStampFromJson(json['endedAt']),
      jobID: json['jobID'] as String?,
      s3BucketTarget: json['s3BucketTarget'] != null
          ? EnrichmentTargetS3Configuration.fromJson(
              json['s3BucketTarget'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)
          ?.let(ImportFileEnrichmentStatus.fromString),
      statusDetails: json['statusDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final checksum = this.checksum;
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final jobID = this.jobID;
    final s3BucketTarget = this.s3BucketTarget;
    final status = this.status;
    final statusDetails = this.statusDetails;
    return {
      if (checksum != null) 'checksum': checksum,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (endedAt != null) 'endedAt': unixTimestampToJson(endedAt),
      if (jobID != null) 'jobID': jobID,
      if (s3BucketTarget != null) 's3BucketTarget': s3BucketTarget,
      if (status != null) 'status': status.value,
      if (statusDetails != null) 'statusDetails': statusDetails,
    };
  }
}

/// The status of an import file enrichment job. Can be PENDING, STARTED,
/// FAILED, SUCCEEDED, or SUCCEEDED_WITH_WARNINGS.
class ImportFileEnrichmentStatus {
  static const pending = ImportFileEnrichmentStatus._('PENDING');
  static const started = ImportFileEnrichmentStatus._('STARTED');
  static const failed = ImportFileEnrichmentStatus._('FAILED');
  static const succeeded = ImportFileEnrichmentStatus._('SUCCEEDED');
  static const succeededWithWarnings =
      ImportFileEnrichmentStatus._('SUCCEEDED_WITH_WARNINGS');

  final String value;

  const ImportFileEnrichmentStatus._(this.value);

  static const values = [
    pending,
    started,
    failed,
    succeeded,
    succeededWithWarnings
  ];

  static ImportFileEnrichmentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ImportFileEnrichmentStatus._(value));

  @override
  bool operator ==(other) =>
      other is ImportFileEnrichmentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters for listing import file enrichment jobs.
class ListImportFileEnrichmentsFilters {
  /// A list of job IDs to filter by.
  final List<String>? jobIDs;

  ListImportFileEnrichmentsFilters({
    this.jobIDs,
  });

  Map<String, dynamic> toJson() {
    final jobIDs = this.jobIDs;
    return {
      if (jobIDs != null) 'jobIDs': jobIDs,
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

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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

class UninitializedAccountException extends _s.GenericAwsException {
  UninitializedAccountException({String? type, String? message})
      : super(
            type: type,
            code: 'UninitializedAccountException',
            message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UninitializedAccountException': (type, message) =>
      UninitializedAccountException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
