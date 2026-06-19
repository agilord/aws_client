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

/// This is the <i>AWS HealthLake API Reference</i>. For an introduction to the
/// service, see <a
/// href="https://docs.aws.amazon.com/healthlake/latest/devguide/what-is.html">What
/// is AWS HealthLake?</a> in the <i>AWS HealthLake Developer Guide</i>.
class HealthLake {
  final _s.JsonProtocol _protocol;
  HealthLake({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'healthlake',
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

  /// Create a FHIR-enabled data store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreTypeVersion] :
  /// The FHIR release version supported by the data store. Current support is
  /// for version <code>R4</code>.
  ///
  /// Parameter [clientToken] :
  /// An optional user-provided token to ensure API idempotency.
  ///
  /// Parameter [datastoreName] :
  /// The data store name (user-generated).
  ///
  /// Parameter [identityProviderConfiguration] :
  /// The identity provider configuration to use for the data store.
  ///
  /// Parameter [preloadDataConfig] :
  /// An optional parameter to preload (import) open source Synthea FHIR data
  /// upon creation of the data store.
  ///
  /// Parameter [sseConfiguration] :
  /// The server-side encryption key configuration for a customer-provided
  /// encryption key specified for creating a data store.
  ///
  /// Parameter [tags] :
  /// The resource tags applied to a data store when it is created.
  Future<CreateFHIRDatastoreResponse> createFHIRDatastore({
    required FHIRVersion datastoreTypeVersion,
    String? clientToken,
    String? datastoreName,
    IdentityProviderConfiguration? identityProviderConfiguration,
    PreloadDataConfig? preloadDataConfig,
    SseConfiguration? sseConfiguration,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.CreateFHIRDatastore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatastoreTypeVersion': datastoreTypeVersion.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (datastoreName != null) 'DatastoreName': datastoreName,
        if (identityProviderConfiguration != null)
          'IdentityProviderConfiguration': identityProviderConfiguration,
        if (preloadDataConfig != null) 'PreloadDataConfig': preloadDataConfig,
        if (sseConfiguration != null) 'SseConfiguration': sseConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFHIRDatastoreResponse.fromJson(jsonResponse.body);
  }

  /// Delete a FHIR-enabled data store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The AWS-generated identifier for the data store to be deleted.
  Future<DeleteFHIRDatastoreResponse> deleteFHIRDatastore({
    required String datastoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.DeleteFHIRDatastore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatastoreId': datastoreId,
      },
    );

    return DeleteFHIRDatastoreResponse.fromJson(jsonResponse.body);
  }

  /// Get properties for a FHIR-enabled data store.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  Future<DescribeFHIRDatastoreResponse> describeFHIRDatastore({
    required String datastoreId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.DescribeFHIRDatastore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatastoreId': datastoreId,
      },
    );

    return DescribeFHIRDatastoreResponse.fromJson(jsonResponse.body);
  }

  /// Get FHIR export job properties.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier from which FHIR data is being exported from.
  ///
  /// Parameter [jobId] :
  /// The export job identifier.
  Future<DescribeFHIRExportJobResponse> describeFHIRExportJob({
    required String datastoreId,
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.DescribeFHIRExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatastoreId': datastoreId,
        'JobId': jobId,
      },
    );

    return DescribeFHIRExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Get the import job properties to learn more about the job or job progress.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [jobId] :
  /// The import job identifier.
  Future<DescribeFHIRImportJobResponse> describeFHIRImportJob({
    required String datastoreId,
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.DescribeFHIRImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatastoreId': datastoreId,
        'JobId': jobId,
      },
    );

    return DescribeFHIRImportJobResponse.fromJson(jsonResponse.body);
  }

  /// List all FHIR-enabled data stores in a user’s account, regardless of data
  /// store status.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filter] :
  /// List all filters associated with a FHIR data store request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data stores returned on a page.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of data stores when results are
  /// paginated.
  Future<ListFHIRDatastoresResponse> listFHIRDatastores({
    DatastoreFilter? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.ListFHIRDatastores'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'Filter': filter,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListFHIRDatastoresResponse.fromJson(jsonResponse.body);
  }

  /// Lists all FHIR export jobs associated with an account and their statuses.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// Limits the response to the export job with the specified data store ID.
  ///
  /// Parameter [jobName] :
  /// Limits the response to the export job with the specified job name.
  ///
  /// Parameter [jobStatus] :
  /// Limits the response to export jobs with the specified job status.
  ///
  /// Parameter [maxResults] :
  /// Limits the number of results returned for a ListFHIRExportJobs to a
  /// maximum quantity specified by the user.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to identify the next page of results to return.
  ///
  /// Parameter [submittedAfter] :
  /// Limits the response to FHIR export jobs submitted after a user-specified
  /// date.
  ///
  /// Parameter [submittedBefore] :
  /// Limits the response to FHIR export jobs submitted before a user- specified
  /// date.
  Future<ListFHIRExportJobsResponse> listFHIRExportJobs({
    required String datastoreId,
    String? jobName,
    JobStatus? jobStatus,
    int? maxResults,
    String? nextToken,
    DateTime? submittedAfter,
    DateTime? submittedBefore,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.ListFHIRExportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatastoreId': datastoreId,
        if (jobName != null) 'JobName': jobName,
        if (jobStatus != null) 'JobStatus': jobStatus.value,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (submittedAfter != null)
          'SubmittedAfter': unixTimestampToJson(submittedAfter),
        if (submittedBefore != null)
          'SubmittedBefore': unixTimestampToJson(submittedBefore),
      },
    );

    return ListFHIRExportJobsResponse.fromJson(jsonResponse.body);
  }

  /// List all FHIR import jobs associated with an account and their statuses.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// Limits the response to the import job with the specified data store ID.
  ///
  /// Parameter [jobName] :
  /// Limits the response to the import job with the specified job name.
  ///
  /// Parameter [jobStatus] :
  /// Limits the response to the import job with the specified job status.
  ///
  /// Parameter [maxResults] :
  /// Limits the number of results returned for <code>ListFHIRImportJobs</code>
  /// to a maximum quantity specified by the user.
  ///
  /// Parameter [nextToken] :
  /// The pagination token used to identify the next page of results to return.
  ///
  /// Parameter [submittedAfter] :
  /// Limits the response to FHIR import jobs submitted after a user-specified
  /// date.
  ///
  /// Parameter [submittedBefore] :
  /// Limits the response to FHIR import jobs submitted before a user- specified
  /// date.
  Future<ListFHIRImportJobsResponse> listFHIRImportJobs({
    required String datastoreId,
    String? jobName,
    JobStatus? jobStatus,
    int? maxResults,
    String? nextToken,
    DateTime? submittedAfter,
    DateTime? submittedBefore,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.ListFHIRImportJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatastoreId': datastoreId,
        if (jobName != null) 'JobName': jobName,
        if (jobStatus != null) 'JobStatus': jobStatus.value,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (submittedAfter != null)
          'SubmittedAfter': unixTimestampToJson(submittedAfter),
        if (submittedBefore != null)
          'SubmittedBefore': unixTimestampToJson(submittedBefore),
      },
    );

    return ListFHIRImportJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all existing tags associated with a data store.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the data store to which tags are being
  /// added.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.ListTagsForResource'
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

  /// Start a FHIR export job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) used during initiation of the export job.
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier from which files are being exported.
  ///
  /// Parameter [outputDataConfig] :
  /// The output data configuration supplied when the export job was started.
  ///
  /// Parameter [clientToken] :
  /// An optional user provided token used for ensuring API idempotency.
  ///
  /// Parameter [jobName] :
  /// The export job name.
  Future<StartFHIRExportJobResponse> startFHIRExportJob({
    required String dataAccessRoleArn,
    required String datastoreId,
    required OutputDataConfig outputDataConfig,
    String? clientToken,
    String? jobName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.StartFHIRExportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'DatastoreId': datastoreId,
        'OutputDataConfig': outputDataConfig,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
      },
    );

    return StartFHIRExportJobResponse.fromJson(jsonResponse.body);
  }

  /// Start importing bulk FHIR data into an ACTIVE data store. The import job
  /// imports FHIR data found in the <code>InputDataConfig</code> object and
  /// stores processing results in the <code>JobOutputDataConfig</code> object.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) that grants access permission to AWS
  /// HealthLake.
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [inputDataConfig] :
  /// The input properties for the import job request.
  ///
  /// Parameter [clientToken] :
  /// The optional user-provided token used for ensuring API idempotency.
  ///
  /// Parameter [jobName] :
  /// The import job name.
  ///
  /// Parameter [validationLevel] :
  /// The validation level of the import job.
  Future<StartFHIRImportJobResponse> startFHIRImportJob({
    required String dataAccessRoleArn,
    required String datastoreId,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig jobOutputDataConfig,
    String? clientToken,
    String? jobName,
    ValidationLevel? validationLevel,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.StartFHIRImportJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'DatastoreId': datastoreId,
        'InputDataConfig': inputDataConfig,
        'JobOutputDataConfig': jobOutputDataConfig,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (validationLevel != null) 'ValidationLevel': validationLevel.value,
      },
    );

    return StartFHIRImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Add a user-specifed key and value tag to a data store.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) that grants access to the data store tags
  /// are being added to.
  ///
  /// Parameter [tags] :
  /// The user-specified key and value pair tags being added to a data store.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.TagResource'
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

  /// Remove a user-specifed key and value tag from a data store.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name (ARN) of the data store from which tags are being
  /// removed.
  ///
  /// Parameter [tagKeys] :
  /// The keys for the tags to be removed from the data store.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.UntagResource'
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
}

/// @nodoc
class CreateFHIRDatastoreResponse {
  /// The Amazon Resource Name (ARN) for the data store.
  final String datastoreArn;

  /// The AWS endpoint created for the data store.
  final String datastoreEndpoint;

  /// The data store identifier.
  final String datastoreId;

  /// The data store status.
  final DatastoreStatus datastoreStatus;

  CreateFHIRDatastoreResponse({
    required this.datastoreArn,
    required this.datastoreEndpoint,
    required this.datastoreId,
    required this.datastoreStatus,
  });

  factory CreateFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateFHIRDatastoreResponse(
      datastoreArn: (json['DatastoreArn'] as String?) ?? '',
      datastoreEndpoint: (json['DatastoreEndpoint'] as String?) ?? '',
      datastoreId: (json['DatastoreId'] as String?) ?? '',
      datastoreStatus: DatastoreStatus.fromString(
          (json['DatastoreStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreArn = this.datastoreArn;
    final datastoreEndpoint = this.datastoreEndpoint;
    final datastoreId = this.datastoreId;
    final datastoreStatus = this.datastoreStatus;
    return {
      'DatastoreArn': datastoreArn,
      'DatastoreEndpoint': datastoreEndpoint,
      'DatastoreId': datastoreId,
      'DatastoreStatus': datastoreStatus.value,
    };
  }
}

/// @nodoc
class DeleteFHIRDatastoreResponse {
  /// The Amazon Resource Name (ARN) that grants access permission to AWS
  /// HealthLake.
  final String datastoreArn;

  /// The AWS endpoint of the data store to be deleted.
  final String datastoreEndpoint;

  /// The AWS-generated ID for the deleted data store.
  final String datastoreId;

  /// The data store status.
  final DatastoreStatus datastoreStatus;

  DeleteFHIRDatastoreResponse({
    required this.datastoreArn,
    required this.datastoreEndpoint,
    required this.datastoreId,
    required this.datastoreStatus,
  });

  factory DeleteFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFHIRDatastoreResponse(
      datastoreArn: (json['DatastoreArn'] as String?) ?? '',
      datastoreEndpoint: (json['DatastoreEndpoint'] as String?) ?? '',
      datastoreId: (json['DatastoreId'] as String?) ?? '',
      datastoreStatus: DatastoreStatus.fromString(
          (json['DatastoreStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreArn = this.datastoreArn;
    final datastoreEndpoint = this.datastoreEndpoint;
    final datastoreId = this.datastoreId;
    final datastoreStatus = this.datastoreStatus;
    return {
      'DatastoreArn': datastoreArn,
      'DatastoreEndpoint': datastoreEndpoint,
      'DatastoreId': datastoreId,
      'DatastoreStatus': datastoreStatus.value,
    };
  }
}

/// @nodoc
class DescribeFHIRDatastoreResponse {
  /// The data store properties.
  final DatastoreProperties datastoreProperties;

  DescribeFHIRDatastoreResponse({
    required this.datastoreProperties,
  });

  factory DescribeFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFHIRDatastoreResponse(
      datastoreProperties: DatastoreProperties.fromJson(
          (json['DatastoreProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreProperties = this.datastoreProperties;
    return {
      'DatastoreProperties': datastoreProperties,
    };
  }
}

/// @nodoc
class DescribeFHIRExportJobResponse {
  /// The export job properties.
  final ExportJobProperties exportJobProperties;

  DescribeFHIRExportJobResponse({
    required this.exportJobProperties,
  });

  factory DescribeFHIRExportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFHIRExportJobResponse(
      exportJobProperties: ExportJobProperties.fromJson(
          (json['ExportJobProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobProperties = this.exportJobProperties;
    return {
      'ExportJobProperties': exportJobProperties,
    };
  }
}

/// @nodoc
class DescribeFHIRImportJobResponse {
  /// The import job properties.
  final ImportJobProperties importJobProperties;

  DescribeFHIRImportJobResponse({
    required this.importJobProperties,
  });

  factory DescribeFHIRImportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFHIRImportJobResponse(
      importJobProperties: ImportJobProperties.fromJson(
          (json['ImportJobProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final importJobProperties = this.importJobProperties;
    return {
      'ImportJobProperties': importJobProperties,
    };
  }
}

/// @nodoc
class ListFHIRDatastoresResponse {
  /// The properties associated with all listed data stores.
  final List<DatastoreProperties> datastorePropertiesList;

  /// The pagination token used to retrieve the next page of results.
  final String? nextToken;

  ListFHIRDatastoresResponse({
    required this.datastorePropertiesList,
    this.nextToken,
  });

  factory ListFHIRDatastoresResponse.fromJson(Map<String, dynamic> json) {
    return ListFHIRDatastoresResponse(
      datastorePropertiesList: ((json['DatastorePropertiesList'] as List?) ??
              const [])
          .nonNulls
          .map((e) => DatastoreProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datastorePropertiesList = this.datastorePropertiesList;
    final nextToken = this.nextToken;
    return {
      'DatastorePropertiesList': datastorePropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListFHIRExportJobsResponse {
  /// The properties of listed FHIR export jobs.
  final List<ExportJobProperties> exportJobPropertiesList;

  /// The pagination token used to identify the next page of results to return.
  final String? nextToken;

  ListFHIRExportJobsResponse({
    required this.exportJobPropertiesList,
    this.nextToken,
  });

  factory ListFHIRExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListFHIRExportJobsResponse(
      exportJobPropertiesList: ((json['ExportJobPropertiesList'] as List?) ??
              const [])
          .nonNulls
          .map((e) => ExportJobProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobPropertiesList = this.exportJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      'ExportJobPropertiesList': exportJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListFHIRImportJobsResponse {
  /// The properties for listed import jobs.
  final List<ImportJobProperties> importJobPropertiesList;

  /// The pagination token used to identify the next page of results to return.
  final String? nextToken;

  ListFHIRImportJobsResponse({
    required this.importJobPropertiesList,
    this.nextToken,
  });

  factory ListFHIRImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListFHIRImportJobsResponse(
      importJobPropertiesList: ((json['ImportJobPropertiesList'] as List?) ??
              const [])
          .nonNulls
          .map((e) => ImportJobProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final importJobPropertiesList = this.importJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      'ImportJobPropertiesList': importJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Returns a list of tags associated with a data store.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.nonNulls
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

/// @nodoc
class StartFHIRExportJobResponse {
  /// The export job identifier.
  final String jobId;

  /// The export job status.
  final JobStatus jobStatus;

  /// The data store identifier from which files are being exported.
  final String? datastoreId;

  StartFHIRExportJobResponse({
    required this.jobId,
    required this.jobStatus,
    this.datastoreId,
  });

  factory StartFHIRExportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartFHIRExportJobResponse(
      jobId: (json['JobId'] as String?) ?? '',
      jobStatus: JobStatus.fromString((json['JobStatus'] as String?) ?? ''),
      datastoreId: json['DatastoreId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final datastoreId = this.datastoreId;
    return {
      'JobId': jobId,
      'JobStatus': jobStatus.value,
      if (datastoreId != null) 'DatastoreId': datastoreId,
    };
  }
}

/// @nodoc
class StartFHIRImportJobResponse {
  /// The import job identifier.
  final String jobId;

  /// The import job status.
  final JobStatus jobStatus;

  /// The data store identifier.
  final String? datastoreId;

  StartFHIRImportJobResponse({
    required this.jobId,
    required this.jobStatus,
    this.datastoreId,
  });

  factory StartFHIRImportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartFHIRImportJobResponse(
      jobId: (json['JobId'] as String?) ?? '',
      jobStatus: JobStatus.fromString((json['JobStatus'] as String?) ?? ''),
      datastoreId: json['DatastoreId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final datastoreId = this.datastoreId;
    return {
      'JobId': jobId,
      'JobStatus': jobStatus.value,
      if (datastoreId != null) 'DatastoreId': datastoreId,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A label consisting of a user-defined key and value. The form for tags is
/// {"Key", "Value"}
///
/// @nodoc
class Tag {
  /// The key portion of a tag. Tag keys are case sensitive.
  final String key;

  /// The value portion of a tag. Tag values are case-sensitive.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

/// @nodoc
class JobStatus {
  static const submitted = JobStatus._('SUBMITTED');
  static const queued = JobStatus._('QUEUED');
  static const inProgress = JobStatus._('IN_PROGRESS');
  static const completedWithErrors = JobStatus._('COMPLETED_WITH_ERRORS');
  static const completed = JobStatus._('COMPLETED');
  static const failed = JobStatus._('FAILED');
  static const cancelSubmitted = JobStatus._('CANCEL_SUBMITTED');
  static const cancelInProgress = JobStatus._('CANCEL_IN_PROGRESS');
  static const cancelCompleted = JobStatus._('CANCEL_COMPLETED');
  static const cancelFailed = JobStatus._('CANCEL_FAILED');

  final String value;

  const JobStatus._(this.value);

  static const values = [
    submitted,
    queued,
    inProgress,
    completedWithErrors,
    completed,
    failed,
    cancelSubmitted,
    cancelInProgress,
    cancelCompleted,
    cancelFailed
  ];

  static JobStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => JobStatus._(value));

  @override
  bool operator ==(other) => other is JobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The import job input properties.
///
/// @nodoc
class InputDataConfig {
  /// The <code>S3Uri</code> is the user-specified S3 location of the FHIR data to
  /// be imported into AWS HealthLake.
  final String? s3Uri;

  InputDataConfig({
    this.s3Uri,
  });

  factory InputDataConfig.fromJson(Map<String, dynamic> json) {
    return InputDataConfig(
      s3Uri: json['S3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      if (s3Uri != null) 'S3Uri': s3Uri,
    };
  }
}

/// The output data configuration supplied when the export job was created.
///
/// @nodoc
class OutputDataConfig {
  /// The output data configuration supplied when the export job was created.
  final S3Configuration? s3Configuration;

  OutputDataConfig({
    this.s3Configuration,
  });

  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
      s3Configuration: json['S3Configuration'] != null
          ? S3Configuration.fromJson(
              json['S3Configuration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Configuration = this.s3Configuration;
    return {
      if (s3Configuration != null) 'S3Configuration': s3Configuration,
    };
  }
}

/// @nodoc
class ValidationLevel {
  static const strict = ValidationLevel._('strict');
  static const structureOnly = ValidationLevel._('structure-only');
  static const minimal = ValidationLevel._('minimal');

  final String value;

  const ValidationLevel._(this.value);

  static const values = [strict, structureOnly, minimal];

  static ValidationLevel fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ValidationLevel._(value));

  @override
  bool operator ==(other) => other is ValidationLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration of the S3 bucket for either an import or export job. This
/// includes assigning access permissions.
///
/// @nodoc
class S3Configuration {
  /// The Key Management Service (KMS) key ID used to access the S3 bucket.
  final String kmsKeyId;

  /// The <code>S3Uri</code> is the user-specified S3 location of the FHIR data to
  /// be imported into AWS HealthLake.
  final String s3Uri;

  S3Configuration({
    required this.kmsKeyId,
    required this.s3Uri,
  });

  factory S3Configuration.fromJson(Map<String, dynamic> json) {
    return S3Configuration(
      kmsKeyId: (json['KmsKeyId'] as String?) ?? '',
      s3Uri: (json['S3Uri'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final s3Uri = this.s3Uri;
    return {
      'KmsKeyId': kmsKeyId,
      'S3Uri': s3Uri,
    };
  }
}

/// The import job properties.
///
/// @nodoc
class ImportJobProperties {
  /// The data store identifier.
  final String datastoreId;

  /// The input data configuration supplied when the import job was created.
  final InputDataConfig inputDataConfig;

  /// The import job identifier.
  final String jobId;

  /// The import job status.
  final JobStatus jobStatus;

  /// The time the import job was submitted for processing.
  final DateTime submitTime;

  /// The Amazon Resource Name (ARN) that grants AWS HealthLake access to the
  /// input data.
  final String? dataAccessRoleArn;

  /// The time the import job was completed.
  final DateTime? endTime;

  /// The import job name.
  final String? jobName;
  final OutputDataConfig? jobOutputDataConfig;

  /// Displays the progress of the import job, including total resources scanned,
  /// total resources imported, and total size of data imported.
  final JobProgressReport? jobProgressReport;

  /// An explanation of any errors that might have occurred during the FHIR import
  /// job.
  final String? message;

  /// The validation level of the import job.
  final ValidationLevel? validationLevel;

  ImportJobProperties({
    required this.datastoreId,
    required this.inputDataConfig,
    required this.jobId,
    required this.jobStatus,
    required this.submitTime,
    this.dataAccessRoleArn,
    this.endTime,
    this.jobName,
    this.jobOutputDataConfig,
    this.jobProgressReport,
    this.message,
    this.validationLevel,
  });

  factory ImportJobProperties.fromJson(Map<String, dynamic> json) {
    return ImportJobProperties(
      datastoreId: (json['DatastoreId'] as String?) ?? '',
      inputDataConfig: InputDataConfig.fromJson(
          (json['InputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobId: (json['JobId'] as String?) ?? '',
      jobStatus: JobStatus.fromString((json['JobStatus'] as String?) ?? ''),
      submitTime: nonNullableTimeStampFromJson(json['SubmitTime'] ?? 0),
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      jobName: json['JobName'] as String?,
      jobOutputDataConfig: json['JobOutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['JobOutputDataConfig'] as Map<String, dynamic>)
          : null,
      jobProgressReport: json['JobProgressReport'] != null
          ? JobProgressReport.fromJson(
              json['JobProgressReport'] as Map<String, dynamic>)
          : null,
      message: json['Message'] as String?,
      validationLevel:
          (json['ValidationLevel'] as String?)?.let(ValidationLevel.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final inputDataConfig = this.inputDataConfig;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final submitTime = this.submitTime;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final jobName = this.jobName;
    final jobOutputDataConfig = this.jobOutputDataConfig;
    final jobProgressReport = this.jobProgressReport;
    final message = this.message;
    final validationLevel = this.validationLevel;
    return {
      'DatastoreId': datastoreId,
      'InputDataConfig': inputDataConfig,
      'JobId': jobId,
      'JobStatus': jobStatus.value,
      'SubmitTime': unixTimestampToJson(submitTime),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (jobName != null) 'JobName': jobName,
      if (jobOutputDataConfig != null)
        'JobOutputDataConfig': jobOutputDataConfig,
      if (jobProgressReport != null) 'JobProgressReport': jobProgressReport,
      if (message != null) 'Message': message,
      if (validationLevel != null) 'ValidationLevel': validationLevel.value,
    };
  }
}

/// The progress report for the import job.
///
/// @nodoc
class JobProgressReport {
  /// The transaction rate the import job is processed at.
  final double? throughput;

  /// The number of files that failed to be read from the S3 input bucket due to
  /// customer error.
  final int? totalNumberOfFilesReadWithCustomerError;

  /// The number of files imported.
  final int? totalNumberOfImportedFiles;

  /// The number of resources imported.
  final int? totalNumberOfResourcesImported;

  /// The number of resources scanned from the S3 input bucket.
  final int? totalNumberOfResourcesScanned;

  /// The number of resources that failed due to customer error.
  final int? totalNumberOfResourcesWithCustomerError;

  /// The number of files scanned from the S3 input bucket.
  final int? totalNumberOfScannedFiles;

  /// The size (in MB) of files scanned from the S3 input bucket.
  final double? totalSizeOfScannedFilesInMB;

  JobProgressReport({
    this.throughput,
    this.totalNumberOfFilesReadWithCustomerError,
    this.totalNumberOfImportedFiles,
    this.totalNumberOfResourcesImported,
    this.totalNumberOfResourcesScanned,
    this.totalNumberOfResourcesWithCustomerError,
    this.totalNumberOfScannedFiles,
    this.totalSizeOfScannedFilesInMB,
  });

  factory JobProgressReport.fromJson(Map<String, dynamic> json) {
    return JobProgressReport(
      throughput: json['Throughput'] as double?,
      totalNumberOfFilesReadWithCustomerError:
          json['TotalNumberOfFilesReadWithCustomerError'] as int?,
      totalNumberOfImportedFiles: json['TotalNumberOfImportedFiles'] as int?,
      totalNumberOfResourcesImported:
          json['TotalNumberOfResourcesImported'] as int?,
      totalNumberOfResourcesScanned:
          json['TotalNumberOfResourcesScanned'] as int?,
      totalNumberOfResourcesWithCustomerError:
          json['TotalNumberOfResourcesWithCustomerError'] as int?,
      totalNumberOfScannedFiles: json['TotalNumberOfScannedFiles'] as int?,
      totalSizeOfScannedFilesInMB:
          json['TotalSizeOfScannedFilesInMB'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final throughput = this.throughput;
    final totalNumberOfFilesReadWithCustomerError =
        this.totalNumberOfFilesReadWithCustomerError;
    final totalNumberOfImportedFiles = this.totalNumberOfImportedFiles;
    final totalNumberOfResourcesImported = this.totalNumberOfResourcesImported;
    final totalNumberOfResourcesScanned = this.totalNumberOfResourcesScanned;
    final totalNumberOfResourcesWithCustomerError =
        this.totalNumberOfResourcesWithCustomerError;
    final totalNumberOfScannedFiles = this.totalNumberOfScannedFiles;
    final totalSizeOfScannedFilesInMB = this.totalSizeOfScannedFilesInMB;
    return {
      if (throughput != null) 'Throughput': throughput,
      if (totalNumberOfFilesReadWithCustomerError != null)
        'TotalNumberOfFilesReadWithCustomerError':
            totalNumberOfFilesReadWithCustomerError,
      if (totalNumberOfImportedFiles != null)
        'TotalNumberOfImportedFiles': totalNumberOfImportedFiles,
      if (totalNumberOfResourcesImported != null)
        'TotalNumberOfResourcesImported': totalNumberOfResourcesImported,
      if (totalNumberOfResourcesScanned != null)
        'TotalNumberOfResourcesScanned': totalNumberOfResourcesScanned,
      if (totalNumberOfResourcesWithCustomerError != null)
        'TotalNumberOfResourcesWithCustomerError':
            totalNumberOfResourcesWithCustomerError,
      if (totalNumberOfScannedFiles != null)
        'TotalNumberOfScannedFiles': totalNumberOfScannedFiles,
      if (totalSizeOfScannedFilesInMB != null)
        'TotalSizeOfScannedFilesInMB': totalSizeOfScannedFilesInMB,
    };
  }
}

/// The properties of a FHIR export job.
///
/// @nodoc
class ExportJobProperties {
  /// The data store identifier from which files are being exported.
  final String datastoreId;

  /// The export job identifier.
  final String jobId;

  /// The export job status.
  final JobStatus jobStatus;

  /// The output data configuration supplied when the export job was created.
  final OutputDataConfig outputDataConfig;

  /// The time the export job was initiated.
  final DateTime submitTime;

  /// The Amazon Resource Name (ARN) used during the initiation of the export job.
  final String? dataAccessRoleArn;

  /// The time the export job completed.
  final DateTime? endTime;

  /// The export job name.
  final String? jobName;

  /// An explanation of any errors that might have occurred during the export job.
  final String? message;

  ExportJobProperties({
    required this.datastoreId,
    required this.jobId,
    required this.jobStatus,
    required this.outputDataConfig,
    required this.submitTime,
    this.dataAccessRoleArn,
    this.endTime,
    this.jobName,
    this.message,
  });

  factory ExportJobProperties.fromJson(Map<String, dynamic> json) {
    return ExportJobProperties(
      datastoreId: (json['DatastoreId'] as String?) ?? '',
      jobId: (json['JobId'] as String?) ?? '',
      jobStatus: JobStatus.fromString((json['JobStatus'] as String?) ?? ''),
      outputDataConfig: OutputDataConfig.fromJson(
          (json['OutputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      submitTime: nonNullableTimeStampFromJson(json['SubmitTime'] ?? 0),
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      jobName: json['JobName'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreId = this.datastoreId;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final jobName = this.jobName;
    final message = this.message;
    return {
      'DatastoreId': datastoreId,
      'JobId': jobId,
      'JobStatus': jobStatus.value,
      'OutputDataConfig': outputDataConfig,
      'SubmitTime': unixTimestampToJson(submitTime),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (jobName != null) 'JobName': jobName,
      if (message != null) 'Message': message,
    };
  }
}

/// The data store properties.
///
/// @nodoc
class DatastoreProperties {
  /// The Amazon Resource Name (ARN) used in the creation of the data store.
  final String datastoreArn;

  /// The AWS endpoint for the data store.
  final String datastoreEndpoint;

  /// The data store identifier.
  final String datastoreId;

  /// The data store status.
  final DatastoreStatus datastoreStatus;

  /// The FHIR release version supported by the data store. Current support is for
  /// version <code>R4</code>.
  final FHIRVersion datastoreTypeVersion;

  /// The time the data store was created.
  final DateTime? createdAt;

  /// The data store name.
  final String? datastoreName;

  /// The error cause for the current data store operation.
  final ErrorCause? errorCause;

  /// The identity provider selected during data store creation.
  final IdentityProviderConfiguration? identityProviderConfiguration;

  /// The preloaded Synthea data configuration for the data store.
  final PreloadDataConfig? preloadDataConfig;

  /// The server-side encryption key configuration for a customer provided
  /// encryption key.
  final SseConfiguration? sseConfiguration;

  DatastoreProperties({
    required this.datastoreArn,
    required this.datastoreEndpoint,
    required this.datastoreId,
    required this.datastoreStatus,
    required this.datastoreTypeVersion,
    this.createdAt,
    this.datastoreName,
    this.errorCause,
    this.identityProviderConfiguration,
    this.preloadDataConfig,
    this.sseConfiguration,
  });

  factory DatastoreProperties.fromJson(Map<String, dynamic> json) {
    return DatastoreProperties(
      datastoreArn: (json['DatastoreArn'] as String?) ?? '',
      datastoreEndpoint: (json['DatastoreEndpoint'] as String?) ?? '',
      datastoreId: (json['DatastoreId'] as String?) ?? '',
      datastoreStatus: DatastoreStatus.fromString(
          (json['DatastoreStatus'] as String?) ?? ''),
      datastoreTypeVersion: FHIRVersion.fromString(
          (json['DatastoreTypeVersion'] as String?) ?? ''),
      createdAt: timeStampFromJson(json['CreatedAt']),
      datastoreName: json['DatastoreName'] as String?,
      errorCause: json['ErrorCause'] != null
          ? ErrorCause.fromJson(json['ErrorCause'] as Map<String, dynamic>)
          : null,
      identityProviderConfiguration:
          json['IdentityProviderConfiguration'] != null
              ? IdentityProviderConfiguration.fromJson(
                  json['IdentityProviderConfiguration'] as Map<String, dynamic>)
              : null,
      preloadDataConfig: json['PreloadDataConfig'] != null
          ? PreloadDataConfig.fromJson(
              json['PreloadDataConfig'] as Map<String, dynamic>)
          : null,
      sseConfiguration: json['SseConfiguration'] != null
          ? SseConfiguration.fromJson(
              json['SseConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreArn = this.datastoreArn;
    final datastoreEndpoint = this.datastoreEndpoint;
    final datastoreId = this.datastoreId;
    final datastoreStatus = this.datastoreStatus;
    final datastoreTypeVersion = this.datastoreTypeVersion;
    final createdAt = this.createdAt;
    final datastoreName = this.datastoreName;
    final errorCause = this.errorCause;
    final identityProviderConfiguration = this.identityProviderConfiguration;
    final preloadDataConfig = this.preloadDataConfig;
    final sseConfiguration = this.sseConfiguration;
    return {
      'DatastoreArn': datastoreArn,
      'DatastoreEndpoint': datastoreEndpoint,
      'DatastoreId': datastoreId,
      'DatastoreStatus': datastoreStatus.value,
      'DatastoreTypeVersion': datastoreTypeVersion.value,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (datastoreName != null) 'DatastoreName': datastoreName,
      if (errorCause != null) 'ErrorCause': errorCause,
      if (identityProviderConfiguration != null)
        'IdentityProviderConfiguration': identityProviderConfiguration,
      if (preloadDataConfig != null) 'PreloadDataConfig': preloadDataConfig,
      if (sseConfiguration != null) 'SseConfiguration': sseConfiguration,
    };
  }
}

/// @nodoc
class DatastoreStatus {
  static const creating = DatastoreStatus._('CREATING');
  static const active = DatastoreStatus._('ACTIVE');
  static const deleting = DatastoreStatus._('DELETING');
  static const deleted = DatastoreStatus._('DELETED');
  static const createFailed = DatastoreStatus._('CREATE_FAILED');

  final String value;

  const DatastoreStatus._(this.value);

  static const values = [creating, active, deleting, deleted, createFailed];

  static DatastoreStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DatastoreStatus._(value));

  @override
  bool operator ==(other) => other is DatastoreStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FHIRVersion {
  static const r4 = FHIRVersion._('R4');

  final String value;

  const FHIRVersion._(this.value);

  static const values = [r4];

  static FHIRVersion fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FHIRVersion._(value));

  @override
  bool operator ==(other) => other is FHIRVersion && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The server-side encryption key configuration for a customer-provided
/// encryption key.
///
/// @nodoc
class SseConfiguration {
  /// The Key Management Service (KMS) encryption configuration used to provide
  /// details for data encryption.
  final KmsEncryptionConfig kmsEncryptionConfig;

  SseConfiguration({
    required this.kmsEncryptionConfig,
  });

  factory SseConfiguration.fromJson(Map<String, dynamic> json) {
    return SseConfiguration(
      kmsEncryptionConfig: KmsEncryptionConfig.fromJson(
          (json['KmsEncryptionConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsEncryptionConfig = this.kmsEncryptionConfig;
    return {
      'KmsEncryptionConfig': kmsEncryptionConfig,
    };
  }
}

/// The input properties for the preloaded (Synthea) data store.
///
/// @nodoc
class PreloadDataConfig {
  /// The type of preloaded data. Only Synthea preloaded data is supported.
  final PreloadDataType preloadDataType;

  PreloadDataConfig({
    required this.preloadDataType,
  });

  factory PreloadDataConfig.fromJson(Map<String, dynamic> json) {
    return PreloadDataConfig(
      preloadDataType: PreloadDataType.fromString(
          (json['PreloadDataType'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final preloadDataType = this.preloadDataType;
    return {
      'PreloadDataType': preloadDataType.value,
    };
  }
}

/// The identity provider configuration selected when the data store was
/// created.
///
/// @nodoc
class IdentityProviderConfiguration {
  /// The authorization strategy selected when the HealthLake data store is
  /// created.
  /// <note>
  /// HealthLake provides support for both SMART on FHIR V1 and V2 as described
  /// below.
  ///
  /// <ul>
  /// <li>
  /// <code>SMART_ON_FHIR_V1</code> – Support for only SMART on FHIR V1, which
  /// includes <code>read</code> (read/search) and <code>write</code>
  /// (create/update/delete) permissions.
  /// </li>
  /// <li>
  /// <code>SMART_ON_FHIR</code> – Support for both SMART on FHIR V1 and V2, which
  /// includes <code>create</code>, <code>read</code>, <code>update</code>,
  /// <code>delete</code>, and <code>search</code> permissions.
  /// </li>
  /// <li>
  /// <code>AWS_AUTH</code> – The default HealthLake authorization strategy; not
  /// affiliated with SMART on FHIR.
  /// </li>
  /// </ul> </note>
  final AuthorizationStrategy authorizationStrategy;

  /// The parameter to enable SMART on FHIR fine-grained authorization for the
  /// data store.
  final bool? fineGrainedAuthorizationEnabled;

  /// The Amazon Resource Name (ARN) of the Lambda function to use to decode the
  /// access token created by the authorization server.
  final String? idpLambdaArn;

  /// The JSON metadata elements to use in your identity provider configuration.
  /// Required elements are listed based on the launch specification of the SMART
  /// application. For more information on all possible elements, see <a
  /// href="https://build.fhir.org/ig/HL7/smart-app-launch/conformance.html#metadata">Metadata</a>
  /// in SMART's App Launch specification.
  ///
  /// <code>authorization_endpoint</code>: The URL to the OAuth2 authorization
  /// endpoint.
  ///
  /// <code>grant_types_supported</code>: An array of grant types that are
  /// supported at the token endpoint. You must provide at least one grant type
  /// option. Valid options are <code>authorization_code</code> and
  /// <code>client_credentials</code>.
  ///
  /// <code>token_endpoint</code>: The URL to the OAuth2 token endpoint.
  ///
  /// <code>capabilities</code>: An array of strings of the SMART capabilities
  /// that the authorization server supports.
  ///
  /// <code>code_challenge_methods_supported</code>: An array of strings of
  /// supported PKCE code challenge methods. You must include the
  /// <code>S256</code> method in the array of PKCE code challenge methods.
  final String? metadata;

  IdentityProviderConfiguration({
    required this.authorizationStrategy,
    this.fineGrainedAuthorizationEnabled,
    this.idpLambdaArn,
    this.metadata,
  });

  factory IdentityProviderConfiguration.fromJson(Map<String, dynamic> json) {
    return IdentityProviderConfiguration(
      authorizationStrategy: AuthorizationStrategy.fromString(
          (json['AuthorizationStrategy'] as String?) ?? ''),
      fineGrainedAuthorizationEnabled:
          json['FineGrainedAuthorizationEnabled'] as bool?,
      idpLambdaArn: json['IdpLambdaArn'] as String?,
      metadata: json['Metadata'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationStrategy = this.authorizationStrategy;
    final fineGrainedAuthorizationEnabled =
        this.fineGrainedAuthorizationEnabled;
    final idpLambdaArn = this.idpLambdaArn;
    final metadata = this.metadata;
    return {
      'AuthorizationStrategy': authorizationStrategy.value,
      if (fineGrainedAuthorizationEnabled != null)
        'FineGrainedAuthorizationEnabled': fineGrainedAuthorizationEnabled,
      if (idpLambdaArn != null) 'IdpLambdaArn': idpLambdaArn,
      if (metadata != null) 'Metadata': metadata,
    };
  }
}

/// The error information for <code>CreateFHIRDatastore</code> and
/// <code>DeleteFHIRDatastore</code> actions.
///
/// @nodoc
class ErrorCause {
  /// The error category for <code>ErrorCause</code>.
  final ErrorCategory? errorCategory;

  /// The error message text for <code>ErrorCause</code>.
  final String? errorMessage;

  ErrorCause({
    this.errorCategory,
    this.errorMessage,
  });

  factory ErrorCause.fromJson(Map<String, dynamic> json) {
    return ErrorCause(
      errorCategory:
          (json['ErrorCategory'] as String?)?.let(ErrorCategory.fromString),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCategory = this.errorCategory;
    final errorMessage = this.errorMessage;
    return {
      if (errorCategory != null) 'ErrorCategory': errorCategory.value,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// @nodoc
class ErrorCategory {
  static const retryableError = ErrorCategory._('RETRYABLE_ERROR');
  static const nonRetryableError = ErrorCategory._('NON_RETRYABLE_ERROR');

  final String value;

  const ErrorCategory._(this.value);

  static const values = [retryableError, nonRetryableError];

  static ErrorCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ErrorCategory._(value));

  @override
  bool operator ==(other) => other is ErrorCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AuthorizationStrategy {
  static const smartOnFhirV1 = AuthorizationStrategy._('SMART_ON_FHIR_V1');
  static const smartOnFhir = AuthorizationStrategy._('SMART_ON_FHIR');
  static const awsAuth = AuthorizationStrategy._('AWS_AUTH');

  final String value;

  const AuthorizationStrategy._(this.value);

  static const values = [smartOnFhirV1, smartOnFhir, awsAuth];

  static AuthorizationStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AuthorizationStrategy._(value));

  @override
  bool operator ==(other) =>
      other is AuthorizationStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PreloadDataType {
  static const synthea = PreloadDataType._('SYNTHEA');

  final String value;

  const PreloadDataType._(this.value);

  static const values = [synthea];

  static PreloadDataType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PreloadDataType._(value));

  @override
  bool operator ==(other) => other is PreloadDataType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The customer-managed-key (CMK) used when creating a data store. If a
/// customer-owned key is not specified, an AWS-owned key is used for
/// encryption.
///
/// @nodoc
class KmsEncryptionConfig {
  /// The type of customer-managed-key (CMK) used for encryption.
  final CmkType cmkType;

  /// The Key Management Service (KMS) encryption key id/alias used to encrypt the
  /// data store contents at rest.
  final String? kmsKeyId;

  KmsEncryptionConfig({
    required this.cmkType,
    this.kmsKeyId,
  });

  factory KmsEncryptionConfig.fromJson(Map<String, dynamic> json) {
    return KmsEncryptionConfig(
      cmkType: CmkType.fromString((json['CmkType'] as String?) ?? ''),
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cmkType = this.cmkType;
    final kmsKeyId = this.kmsKeyId;
    return {
      'CmkType': cmkType.value,
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

/// @nodoc
class CmkType {
  static const customerManagedKmsKey = CmkType._('CUSTOMER_MANAGED_KMS_KEY');
  static const awsOwnedKmsKey = CmkType._('AWS_OWNED_KMS_KEY');

  final String value;

  const CmkType._(this.value);

  static const values = [customerManagedKmsKey, awsOwnedKmsKey];

  static CmkType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => CmkType._(value));

  @override
  bool operator ==(other) => other is CmkType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The filters applied to a data store query.
///
/// @nodoc
class DatastoreFilter {
  /// Filter to set cutoff dates for records. All data stores created after the
  /// specified date are included in the results.
  final DateTime? createdAfter;

  /// Filter to set cutoff dates for records. All data stores created before the
  /// specified date are included in the results.
  final DateTime? createdBefore;

  /// Filter data store results by name.
  final String? datastoreName;

  /// Filter data store results by status.
  final DatastoreStatus? datastoreStatus;

  DatastoreFilter({
    this.createdAfter,
    this.createdBefore,
    this.datastoreName,
    this.datastoreStatus,
  });

  Map<String, dynamic> toJson() {
    final createdAfter = this.createdAfter;
    final createdBefore = this.createdBefore;
    final datastoreName = this.datastoreName;
    final datastoreStatus = this.datastoreStatus;
    return {
      if (createdAfter != null)
        'CreatedAfter': unixTimestampToJson(createdAfter),
      if (createdBefore != null)
        'CreatedBefore': unixTimestampToJson(createdBefore),
      if (datastoreName != null) 'DatastoreName': datastoreName,
      if (datastoreStatus != null) 'DatastoreStatus': datastoreStatus.value,
    };
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
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
