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

/// AWS HealthLake is a HIPAA eligibile service that allows customers to store,
/// transform, query, and analyze their FHIR-formatted data in a consistent
/// fashion in the cloud.
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
            signingName: 'healthlake',
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

  /// Creates a data store that can ingest and export FHIR formatted data.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreTypeVersion] :
  /// The FHIR version of the data store. The only supported version is R4.
  ///
  /// Parameter [clientToken] :
  /// Optional user provided token used for ensuring idempotency.
  ///
  /// Parameter [datastoreName] :
  /// The user generated name for the data store.
  ///
  /// Parameter [identityProviderConfiguration] :
  /// The configuration of the identity provider that you want to use for your
  /// data store.
  ///
  /// Parameter [preloadDataConfig] :
  /// Optional parameter to preload data upon creation of the data store.
  /// Currently, the only supported preloaded data is synthetic data generated
  /// from Synthea.
  ///
  /// Parameter [sseConfiguration] :
  /// The server-side encryption key configuration for a customer provided
  /// encryption key specified for creating a data store.
  ///
  /// Parameter [tags] :
  /// Resource tags that are applied to a data store when it is created.
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
        'DatastoreTypeVersion': datastoreTypeVersion.toValue(),
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

  /// Deletes a data store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreId] :
  /// The AWS-generated ID for the data store to be deleted.
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

  /// Gets the properties associated with the FHIR data store, including the
  /// data store ID, data store ARN, data store name, data store status, when
  /// the data store was created, data store type version, and the data store's
  /// endpoint.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreId] :
  /// The AWS-generated data store ID.
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

  /// Displays the properties of a FHIR export job, including the ID, ARN, name,
  /// and the status of the job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreId] :
  /// The AWS generated ID for the data store from which files are being
  /// exported from for an export job.
  ///
  /// Parameter [jobId] :
  /// The AWS generated ID for an export job.
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

  /// Displays the properties of a FHIR import job, including the ID, ARN, name,
  /// and the status of the job.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreId] :
  /// The AWS-generated ID of the data store.
  ///
  /// Parameter [jobId] :
  /// The AWS-generated job ID.
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

  /// Lists all FHIR data stores that are in the user’s account, regardless of
  /// data store status.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Lists all filters associated with a FHIR data store request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of data stores returned in a single page of a
  /// ListFHIRDatastoresRequest call.
  ///
  /// Parameter [nextToken] :
  /// Fetches the next page of data stores when results are paginated.
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreId] :
  /// This parameter limits the response to the export job with the specified
  /// data store ID.
  ///
  /// Parameter [jobName] :
  /// This parameter limits the response to the export job with the specified
  /// job name.
  ///
  /// Parameter [jobStatus] :
  /// This parameter limits the response to the export jobs with the specified
  /// job status.
  ///
  /// Parameter [maxResults] :
  /// This parameter limits the number of results returned for a
  /// ListFHIRExportJobs to a maximum quantity specified by the user.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to identify the next page of results to return for
  /// a ListFHIRExportJobs query.
  ///
  /// Parameter [submittedAfter] :
  /// This parameter limits the response to FHIR export jobs submitted after a
  /// user specified date.
  ///
  /// Parameter [submittedBefore] :
  /// This parameter limits the response to FHIR export jobs submitted before a
  /// user specified date.
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
        if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
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

  /// Lists all FHIR import jobs associated with an account and their statuses.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreId] :
  /// This parameter limits the response to the import job with the specified
  /// data store ID.
  ///
  /// Parameter [jobName] :
  /// This parameter limits the response to the import job with the specified
  /// job name.
  ///
  /// Parameter [jobStatus] :
  /// This parameter limits the response to the import job with the specified
  /// job status.
  ///
  /// Parameter [maxResults] :
  /// This parameter limits the number of results returned for a
  /// ListFHIRImportJobs to a maximum quantity specified by the user.
  ///
  /// Parameter [nextToken] :
  /// A pagination token used to identify the next page of results to return for
  /// a ListFHIRImportJobs query.
  ///
  /// Parameter [submittedAfter] :
  /// This parameter limits the response to FHIR import jobs submitted after a
  /// user specified date.
  ///
  /// Parameter [submittedBefore] :
  /// This parameter limits the response to FHIR import jobs submitted before a
  /// user specified date.
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
        if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name(ARN) of the data store for which tags are being
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

  /// Begins a FHIR export job.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name used during the initiation of the job.
  ///
  /// Parameter [datastoreId] :
  /// The AWS generated ID for the data store from which files are being
  /// exported for an export job.
  ///
  /// Parameter [outputDataConfig] :
  /// The output data configuration that was supplied when the export job was
  /// created.
  ///
  /// Parameter [clientToken] :
  /// An optional user provided token used for ensuring idempotency.
  ///
  /// Parameter [jobName] :
  /// The user generated name for an export job.
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

  /// Begins a FHIR Import job.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) that gives AWS HealthLake access
  /// permission.
  ///
  /// Parameter [datastoreId] :
  /// The AWS-generated data store ID.
  ///
  /// Parameter [inputDataConfig] :
  /// The input properties of the FHIR Import job in the StartFHIRImport job
  /// request.
  ///
  /// Parameter [clientToken] :
  /// Optional user provided token used for ensuring idempotency.
  ///
  /// Parameter [jobName] :
  /// The name of the FHIR Import job in the StartFHIRImport job request.
  Future<StartFHIRImportJobResponse> startFHIRImportJob({
    required String dataAccessRoleArn,
    required String datastoreId,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig jobOutputDataConfig,
    String? clientToken,
    String? jobName,
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
      },
    );

    return StartFHIRImportJobResponse.fromJson(jsonResponse.body);
  }

  /// Adds a user specified key and value tag to a data store.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name(ARN)that gives AWS HealthLake access to the data
  /// store which tags are being added to.
  ///
  /// Parameter [tags] :
  /// The user specified key and value pair tags being added to a data store.
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

  /// Removes tags from a data store.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Name(ARN) of the data store for which tags are being
  /// removed.
  ///
  /// Parameter [tagKeys] :
  /// The keys for the tags to be removed from the HealthLake data store.
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

enum AuthorizationStrategy {
  smartOnFhirV1,
  awsAuth,
}

extension AuthorizationStrategyValueExtension on AuthorizationStrategy {
  String toValue() {
    switch (this) {
      case AuthorizationStrategy.smartOnFhirV1:
        return 'SMART_ON_FHIR_V1';
      case AuthorizationStrategy.awsAuth:
        return 'AWS_AUTH';
    }
  }
}

extension AuthorizationStrategyFromString on String {
  AuthorizationStrategy toAuthorizationStrategy() {
    switch (this) {
      case 'SMART_ON_FHIR_V1':
        return AuthorizationStrategy.smartOnFhirV1;
      case 'AWS_AUTH':
        return AuthorizationStrategy.awsAuth;
    }
    throw Exception('$this is not known in enum AuthorizationStrategy');
  }
}

enum CmkType {
  customerManagedKmsKey,
  awsOwnedKmsKey,
}

extension CmkTypeValueExtension on CmkType {
  String toValue() {
    switch (this) {
      case CmkType.customerManagedKmsKey:
        return 'CUSTOMER_MANAGED_KMS_KEY';
      case CmkType.awsOwnedKmsKey:
        return 'AWS_OWNED_KMS_KEY';
    }
  }
}

extension CmkTypeFromString on String {
  CmkType toCmkType() {
    switch (this) {
      case 'CUSTOMER_MANAGED_KMS_KEY':
        return CmkType.customerManagedKmsKey;
      case 'AWS_OWNED_KMS_KEY':
        return CmkType.awsOwnedKmsKey;
    }
    throw Exception('$this is not known in enum CmkType');
  }
}

class CreateFHIRDatastoreResponse {
  /// The data store ARN is generated during the creation of the data store and
  /// can be found in the output from the initial data store creation call.
  final String datastoreArn;

  /// The AWS endpoint for the created data store.
  final String datastoreEndpoint;

  /// The AWS-generated data store id. This id is in the output from the initial
  /// data store creation call.
  final String datastoreId;

  /// The status of the FHIR data store.
  final DatastoreStatus datastoreStatus;

  CreateFHIRDatastoreResponse({
    required this.datastoreArn,
    required this.datastoreEndpoint,
    required this.datastoreId,
    required this.datastoreStatus,
  });

  factory CreateFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return CreateFHIRDatastoreResponse(
      datastoreArn: json['DatastoreArn'] as String,
      datastoreEndpoint: json['DatastoreEndpoint'] as String,
      datastoreId: json['DatastoreId'] as String,
      datastoreStatus: (json['DatastoreStatus'] as String).toDatastoreStatus(),
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
      'DatastoreStatus': datastoreStatus.toValue(),
    };
  }
}

/// The filters applied to data store query.
class DatastoreFilter {
  /// A filter that allows the user to set cutoff dates for records. All data
  /// stores created after the specified date will be included in the results.
  final DateTime? createdAfter;

  /// A filter that allows the user to set cutoff dates for records. All data
  /// stores created before the specified date will be included in the results.
  final DateTime? createdBefore;

  /// Allows the user to filter data store results by name.
  final String? datastoreName;

  /// Allows the user to filter data store results by status.
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
      if (datastoreStatus != null) 'DatastoreStatus': datastoreStatus.toValue(),
    };
  }
}

/// Displays the properties of the data store, including the ID, ARN, name, and
/// the status of the data store.
class DatastoreProperties {
  /// The Amazon Resource Name used in the creation of the data store.
  final String datastoreArn;

  /// The AWS endpoint for the data store. Each data store will have it's own
  /// endpoint with data store ID in the endpoint URL.
  final String datastoreEndpoint;

  /// The AWS-generated ID number for the data store.
  final String datastoreId;

  /// The status of the data store.
  final DatastoreStatus datastoreStatus;

  /// The FHIR version. Only R4 version data is supported.
  final FHIRVersion datastoreTypeVersion;

  /// The time that a data store was created.
  final DateTime? createdAt;

  /// The user-generated name for the data store.
  final String? datastoreName;

  /// The error cause for the current data store operation.
  final ErrorCause? errorCause;

  /// The identity provider that you selected when you created the data store.
  final IdentityProviderConfiguration? identityProviderConfiguration;

  /// The preloaded data configuration for the data store. Only data preloaded
  /// from Synthea is supported.
  final PreloadDataConfig? preloadDataConfig;

  /// The server-side encryption key configuration for a customer provided
  /// encryption key (CMK).
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
      datastoreArn: json['DatastoreArn'] as String,
      datastoreEndpoint: json['DatastoreEndpoint'] as String,
      datastoreId: json['DatastoreId'] as String,
      datastoreStatus: (json['DatastoreStatus'] as String).toDatastoreStatus(),
      datastoreTypeVersion:
          (json['DatastoreTypeVersion'] as String).toFHIRVersion(),
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
      'DatastoreStatus': datastoreStatus.toValue(),
      'DatastoreTypeVersion': datastoreTypeVersion.toValue(),
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

enum DatastoreStatus {
  creating,
  active,
  deleting,
  deleted,
  createFailed,
}

extension DatastoreStatusValueExtension on DatastoreStatus {
  String toValue() {
    switch (this) {
      case DatastoreStatus.creating:
        return 'CREATING';
      case DatastoreStatus.active:
        return 'ACTIVE';
      case DatastoreStatus.deleting:
        return 'DELETING';
      case DatastoreStatus.deleted:
        return 'DELETED';
      case DatastoreStatus.createFailed:
        return 'CREATE_FAILED';
    }
  }
}

extension DatastoreStatusFromString on String {
  DatastoreStatus toDatastoreStatus() {
    switch (this) {
      case 'CREATING':
        return DatastoreStatus.creating;
      case 'ACTIVE':
        return DatastoreStatus.active;
      case 'DELETING':
        return DatastoreStatus.deleting;
      case 'DELETED':
        return DatastoreStatus.deleted;
      case 'CREATE_FAILED':
        return DatastoreStatus.createFailed;
    }
    throw Exception('$this is not known in enum DatastoreStatus');
  }
}

class DeleteFHIRDatastoreResponse {
  /// The Amazon Resource Name (ARN) that gives AWS HealthLake access permission.
  final String datastoreArn;

  /// The AWS endpoint for the data store the user has requested to be deleted.
  final String datastoreEndpoint;

  /// The AWS-generated ID for the data store to be deleted.
  final String datastoreId;

  /// The status of the data store that the user has requested to be deleted.
  final DatastoreStatus datastoreStatus;

  DeleteFHIRDatastoreResponse({
    required this.datastoreArn,
    required this.datastoreEndpoint,
    required this.datastoreId,
    required this.datastoreStatus,
  });

  factory DeleteFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return DeleteFHIRDatastoreResponse(
      datastoreArn: json['DatastoreArn'] as String,
      datastoreEndpoint: json['DatastoreEndpoint'] as String,
      datastoreId: json['DatastoreId'] as String,
      datastoreStatus: (json['DatastoreStatus'] as String).toDatastoreStatus(),
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
      'DatastoreStatus': datastoreStatus.toValue(),
    };
  }
}

class DescribeFHIRDatastoreResponse {
  /// All properties associated with a data store, including the data store ID,
  /// data store ARN, data store name, data store status, when the data store was
  /// created, data store type version, and the data store's endpoint.
  final DatastoreProperties datastoreProperties;

  DescribeFHIRDatastoreResponse({
    required this.datastoreProperties,
  });

  factory DescribeFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFHIRDatastoreResponse(
      datastoreProperties: DatastoreProperties.fromJson(
          json['DatastoreProperties'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final datastoreProperties = this.datastoreProperties;
    return {
      'DatastoreProperties': datastoreProperties,
    };
  }
}

class DescribeFHIRExportJobResponse {
  /// Displays the properties of the export job, including the ID, Arn, Name, and
  /// the status of the job.
  final ExportJobProperties exportJobProperties;

  DescribeFHIRExportJobResponse({
    required this.exportJobProperties,
  });

  factory DescribeFHIRExportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFHIRExportJobResponse(
      exportJobProperties: ExportJobProperties.fromJson(
          json['ExportJobProperties'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final exportJobProperties = this.exportJobProperties;
    return {
      'ExportJobProperties': exportJobProperties,
    };
  }
}

class DescribeFHIRImportJobResponse {
  /// The properties of the Import job request, including the ID, ARN, name,
  /// status of the job, and the progress report of the job.
  final ImportJobProperties importJobProperties;

  DescribeFHIRImportJobResponse({
    required this.importJobProperties,
  });

  factory DescribeFHIRImportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFHIRImportJobResponse(
      importJobProperties: ImportJobProperties.fromJson(
          json['ImportJobProperties'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final importJobProperties = this.importJobProperties;
    return {
      'ImportJobProperties': importJobProperties,
    };
  }
}

enum ErrorCategory {
  retryableError,
  nonRetryableError,
}

extension ErrorCategoryValueExtension on ErrorCategory {
  String toValue() {
    switch (this) {
      case ErrorCategory.retryableError:
        return 'RETRYABLE_ERROR';
      case ErrorCategory.nonRetryableError:
        return 'NON_RETRYABLE_ERROR';
    }
  }
}

extension ErrorCategoryFromString on String {
  ErrorCategory toErrorCategory() {
    switch (this) {
      case 'RETRYABLE_ERROR':
        return ErrorCategory.retryableError;
      case 'NON_RETRYABLE_ERROR':
        return ErrorCategory.nonRetryableError;
    }
    throw Exception('$this is not known in enum ErrorCategory');
  }
}

/// The error info of the create/delete data store operation.
class ErrorCause {
  /// The error category of the create/delete data store operation. Possible
  /// statuses are RETRYABLE_ERROR or NON_RETRYABLE_ERROR.
  final ErrorCategory? errorCategory;

  /// The text of the error message.
  final String? errorMessage;

  ErrorCause({
    this.errorCategory,
    this.errorMessage,
  });

  factory ErrorCause.fromJson(Map<String, dynamic> json) {
    return ErrorCause(
      errorCategory: (json['ErrorCategory'] as String?)?.toErrorCategory(),
      errorMessage: json['ErrorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCategory = this.errorCategory;
    final errorMessage = this.errorMessage;
    return {
      if (errorCategory != null) 'ErrorCategory': errorCategory.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
    };
  }
}

/// The properties of a FHIR export job, including the ID, ARN, name, and the
/// status of the job.
class ExportJobProperties {
  /// The AWS generated ID for the data store from which files are being exported
  /// for an export job.
  final String datastoreId;

  /// The AWS generated ID for an export job.
  final String jobId;

  /// The status of a FHIR export job. Possible statuses are SUBMITTED,
  /// IN_PROGRESS, COMPLETED, or FAILED.
  final JobStatus jobStatus;

  /// The output data configuration that was supplied when the export job was
  /// created.
  final OutputDataConfig outputDataConfig;

  /// The time an export job was initiated.
  final DateTime submitTime;

  /// The Amazon Resource Name used during the initiation of the job.
  final String? dataAccessRoleArn;

  /// The time an export job completed.
  final DateTime? endTime;

  /// The user generated name for an export job.
  final String? jobName;

  /// An explanation of any errors that may have occurred during the export job.
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
      datastoreId: json['DatastoreId'] as String,
      jobId: json['JobId'] as String,
      jobStatus: (json['JobStatus'] as String).toJobStatus(),
      outputDataConfig: OutputDataConfig.fromJson(
          json['OutputDataConfig'] as Map<String, dynamic>),
      submitTime: nonNullableTimeStampFromJson(json['SubmitTime'] as Object),
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
      'JobStatus': jobStatus.toValue(),
      'OutputDataConfig': outputDataConfig,
      'SubmitTime': unixTimestampToJson(submitTime),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (jobName != null) 'JobName': jobName,
      if (message != null) 'Message': message,
    };
  }
}

enum FHIRVersion {
  r4,
}

extension FHIRVersionValueExtension on FHIRVersion {
  String toValue() {
    switch (this) {
      case FHIRVersion.r4:
        return 'R4';
    }
  }
}

extension FHIRVersionFromString on String {
  FHIRVersion toFHIRVersion() {
    switch (this) {
      case 'R4':
        return FHIRVersion.r4;
    }
    throw Exception('$this is not known in enum FHIRVersion');
  }
}

/// The identity provider configuration that you gave when the data store was
/// created.
class IdentityProviderConfiguration {
  /// The authorization strategy that you selected when you created the data
  /// store.
  final AuthorizationStrategy authorizationStrategy;

  /// If you enabled fine-grained authorization when you created the data store.
  final bool? fineGrainedAuthorizationEnabled;

  /// The Amazon Resource Name (ARN) of the Lambda function that you want to use
  /// to decode the access token created by the authorization server.
  final String? idpLambdaArn;

  /// The JSON metadata elements that you want to use in your identity provider
  /// configuration. Required elements are listed based on the launch
  /// specification of the SMART application. For more information on all possible
  /// elements, see <a
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
      authorizationStrategy:
          (json['AuthorizationStrategy'] as String).toAuthorizationStrategy(),
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
      'AuthorizationStrategy': authorizationStrategy.toValue(),
      if (fineGrainedAuthorizationEnabled != null)
        'FineGrainedAuthorizationEnabled': fineGrainedAuthorizationEnabled,
      if (idpLambdaArn != null) 'IdpLambdaArn': idpLambdaArn,
      if (metadata != null) 'Metadata': metadata,
    };
  }
}

/// Displays the properties of the import job, including the ID, Arn, Name, the
/// status of the job, and the progress report of the job.
class ImportJobProperties {
  /// The datastore id used when the Import job was created.
  final String datastoreId;

  /// The input data configuration that was supplied when the Import job was
  /// created.
  final InputDataConfig inputDataConfig;

  /// The AWS-generated id number for the Import job.
  final String jobId;

  /// The job status for an Import job. Possible statuses are SUBMITTED,
  /// IN_PROGRESS, COMPLETED_WITH_ERRORS, COMPLETED, FAILED.
  final JobStatus jobStatus;

  /// The time that the Import job was submitted for processing.
  final DateTime submitTime;

  /// The Amazon Resource Name (ARN) that gives AWS HealthLake access to your
  /// input data.
  final String? dataAccessRoleArn;

  /// The time that the Import job was completed.
  final DateTime? endTime;

  /// The user-generated name for an Import job.
  final String? jobName;
  final OutputDataConfig? jobOutputDataConfig;

  /// Displays the progress of the import job, including total resources scanned,
  /// total resources ingested, and total size of data ingested.
  final JobProgressReport? jobProgressReport;

  /// An explanation of any errors that may have occurred during the FHIR import
  /// job.
  final String? message;

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
  });

  factory ImportJobProperties.fromJson(Map<String, dynamic> json) {
    return ImportJobProperties(
      datastoreId: json['DatastoreId'] as String,
      inputDataConfig: InputDataConfig.fromJson(
          json['InputDataConfig'] as Map<String, dynamic>),
      jobId: json['JobId'] as String,
      jobStatus: (json['JobStatus'] as String).toJobStatus(),
      submitTime: nonNullableTimeStampFromJson(json['SubmitTime'] as Object),
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
    return {
      'DatastoreId': datastoreId,
      'InputDataConfig': inputDataConfig,
      'JobId': jobId,
      'JobStatus': jobStatus.toValue(),
      'SubmitTime': unixTimestampToJson(submitTime),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (jobName != null) 'JobName': jobName,
      if (jobOutputDataConfig != null)
        'JobOutputDataConfig': jobOutputDataConfig,
      if (jobProgressReport != null) 'JobProgressReport': jobProgressReport,
      if (message != null) 'Message': message,
    };
  }
}

/// The input properties for an import job.
class InputDataConfig {
  /// The S3Uri is the user specified S3 location of the FHIR data to be imported
  /// into AWS HealthLake.
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

/// The progress report of an import job.
class JobProgressReport {
  /// The throughput (in MB/sec) of the import job.
  final double? throughput;

  /// The number of files that failed to be read from the input S3 bucket due to
  /// customer error.
  final int? totalNumberOfFilesReadWithCustomerError;

  /// The number of files imported so far.
  final int? totalNumberOfImportedFiles;

  /// The number of resources imported so far.
  final int? totalNumberOfResourcesImported;

  /// The number of resources scanned from the input S3 bucket.
  final int? totalNumberOfResourcesScanned;

  /// The number of resources that failed due to customer error.
  final int? totalNumberOfResourcesWithCustomerError;

  /// The number of files scanned from input S3 bucket.
  final int? totalNumberOfScannedFiles;

  /// The size (in MB) of the files scanned from the input S3 bucket.
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

enum JobStatus {
  submitted,
  inProgress,
  completedWithErrors,
  completed,
  failed,
  cancelSubmitted,
  cancelInProgress,
  cancelCompleted,
  cancelFailed,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.completedWithErrors:
        return 'COMPLETED_WITH_ERRORS';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.cancelSubmitted:
        return 'CANCEL_SUBMITTED';
      case JobStatus.cancelInProgress:
        return 'CANCEL_IN_PROGRESS';
      case JobStatus.cancelCompleted:
        return 'CANCEL_COMPLETED';
      case JobStatus.cancelFailed:
        return 'CANCEL_FAILED';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return JobStatus.submitted;
      case 'IN_PROGRESS':
        return JobStatus.inProgress;
      case 'COMPLETED_WITH_ERRORS':
        return JobStatus.completedWithErrors;
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILED':
        return JobStatus.failed;
      case 'CANCEL_SUBMITTED':
        return JobStatus.cancelSubmitted;
      case 'CANCEL_IN_PROGRESS':
        return JobStatus.cancelInProgress;
      case 'CANCEL_COMPLETED':
        return JobStatus.cancelCompleted;
      case 'CANCEL_FAILED':
        return JobStatus.cancelFailed;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

/// The customer-managed-key(CMK) used when creating a data store. If a customer
/// owned key is not specified, an AWS owned key will be used for encryption.
class KmsEncryptionConfig {
  /// The type of customer-managed-key(CMK) used for encryption. The two types of
  /// supported CMKs are customer owned CMKs and AWS owned CMKs.
  final CmkType cmkType;

  /// The KMS encryption key id/alias used to encrypt the data store contents at
  /// rest.
  final String? kmsKeyId;

  KmsEncryptionConfig({
    required this.cmkType,
    this.kmsKeyId,
  });

  factory KmsEncryptionConfig.fromJson(Map<String, dynamic> json) {
    return KmsEncryptionConfig(
      cmkType: (json['CmkType'] as String).toCmkType(),
      kmsKeyId: json['KmsKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cmkType = this.cmkType;
    final kmsKeyId = this.kmsKeyId;
    return {
      'CmkType': cmkType.toValue(),
      if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
    };
  }
}

class ListFHIRDatastoresResponse {
  /// All properties associated with the listed data stores.
  final List<DatastoreProperties> datastorePropertiesList;

  /// Pagination token that can be used to retrieve the next page of results.
  final String? nextToken;

  ListFHIRDatastoresResponse({
    required this.datastorePropertiesList,
    this.nextToken,
  });

  factory ListFHIRDatastoresResponse.fromJson(Map<String, dynamic> json) {
    return ListFHIRDatastoresResponse(
      datastorePropertiesList: (json['DatastorePropertiesList'] as List)
          .whereNotNull()
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

class ListFHIRExportJobsResponse {
  /// The properties of listed FHIR export jobs, including the ID, ARN, name, and
  /// the status of the job.
  final List<ExportJobProperties> exportJobPropertiesList;

  /// A pagination token used to identify the next page of results to return for a
  /// ListFHIRExportJobs query.
  final String? nextToken;

  ListFHIRExportJobsResponse({
    required this.exportJobPropertiesList,
    this.nextToken,
  });

  factory ListFHIRExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListFHIRExportJobsResponse(
      exportJobPropertiesList: (json['ExportJobPropertiesList'] as List)
          .whereNotNull()
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

class ListFHIRImportJobsResponse {
  /// The properties of a listed FHIR import jobs, including the ID, ARN, name,
  /// the status of the job, and the progress report of the job.
  final List<ImportJobProperties> importJobPropertiesList;

  /// A pagination token used to identify the next page of results to return for a
  /// ListFHIRImportJobs query.
  final String? nextToken;

  ListFHIRImportJobsResponse({
    required this.importJobPropertiesList,
    this.nextToken,
  });

  factory ListFHIRImportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListFHIRImportJobsResponse(
      importJobPropertiesList: (json['ImportJobPropertiesList'] as List)
          .whereNotNull()
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

class ListTagsForResourceResponse {
  /// Returns a list of tags associated with a data store.
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

/// The output data configuration that was supplied when the export job was
/// created.
class OutputDataConfig {
  /// The output data configuration that was supplied when the export job was
  /// created.
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

/// The input properties for the preloaded data store. Only data preloaded from
/// Synthea is supported.
class PreloadDataConfig {
  /// The type of preloaded data. Only Synthea preloaded data is supported.
  final PreloadDataType preloadDataType;

  PreloadDataConfig({
    required this.preloadDataType,
  });

  factory PreloadDataConfig.fromJson(Map<String, dynamic> json) {
    return PreloadDataConfig(
      preloadDataType: (json['PreloadDataType'] as String).toPreloadDataType(),
    );
  }

  Map<String, dynamic> toJson() {
    final preloadDataType = this.preloadDataType;
    return {
      'PreloadDataType': preloadDataType.toValue(),
    };
  }
}

enum PreloadDataType {
  synthea,
}

extension PreloadDataTypeValueExtension on PreloadDataType {
  String toValue() {
    switch (this) {
      case PreloadDataType.synthea:
        return 'SYNTHEA';
    }
  }
}

extension PreloadDataTypeFromString on String {
  PreloadDataType toPreloadDataType() {
    switch (this) {
      case 'SYNTHEA':
        return PreloadDataType.synthea;
    }
    throw Exception('$this is not known in enum PreloadDataType');
  }
}

/// The configuration of the S3 bucket for either an import or export job. This
/// includes assigning permissions for access.
class S3Configuration {
  /// The KMS key ID used to access the S3 bucket.
  final String kmsKeyId;

  /// The S3Uri is the user specified S3 location of the FHIR data to be imported
  /// into AWS HealthLake.
  final String s3Uri;

  S3Configuration({
    required this.kmsKeyId,
    required this.s3Uri,
  });

  factory S3Configuration.fromJson(Map<String, dynamic> json) {
    return S3Configuration(
      kmsKeyId: json['KmsKeyId'] as String,
      s3Uri: json['S3Uri'] as String,
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

/// The server-side encryption key configuration for a customer provided
/// encryption key.
class SseConfiguration {
  /// The KMS encryption configuration used to provide details for data
  /// encryption.
  final KmsEncryptionConfig kmsEncryptionConfig;

  SseConfiguration({
    required this.kmsEncryptionConfig,
  });

  factory SseConfiguration.fromJson(Map<String, dynamic> json) {
    return SseConfiguration(
      kmsEncryptionConfig: KmsEncryptionConfig.fromJson(
          json['KmsEncryptionConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsEncryptionConfig = this.kmsEncryptionConfig;
    return {
      'KmsEncryptionConfig': kmsEncryptionConfig,
    };
  }
}

class StartFHIRExportJobResponse {
  /// The AWS generated ID for an export job.
  final String jobId;

  /// The status of a FHIR export job. Possible statuses are SUBMITTED,
  /// IN_PROGRESS, COMPLETED, or FAILED.
  final JobStatus jobStatus;

  /// The AWS generated ID for the data store from which files are being exported
  /// for an export job.
  final String? datastoreId;

  StartFHIRExportJobResponse({
    required this.jobId,
    required this.jobStatus,
    this.datastoreId,
  });

  factory StartFHIRExportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartFHIRExportJobResponse(
      jobId: json['JobId'] as String,
      jobStatus: (json['JobStatus'] as String).toJobStatus(),
      datastoreId: json['DatastoreId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final datastoreId = this.datastoreId;
    return {
      'JobId': jobId,
      'JobStatus': jobStatus.toValue(),
      if (datastoreId != null) 'DatastoreId': datastoreId,
    };
  }
}

class StartFHIRImportJobResponse {
  /// The AWS-generated job ID.
  final String jobId;

  /// The status of an import job.
  final JobStatus jobStatus;

  /// The AWS-generated data store ID.
  final String? datastoreId;

  StartFHIRImportJobResponse({
    required this.jobId,
    required this.jobStatus,
    this.datastoreId,
  });

  factory StartFHIRImportJobResponse.fromJson(Map<String, dynamic> json) {
    return StartFHIRImportJobResponse(
      jobId: json['JobId'] as String,
      jobStatus: (json['JobStatus'] as String).toJobStatus(),
      datastoreId: json['DatastoreId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final datastoreId = this.datastoreId;
    return {
      'JobId': jobId,
      'JobStatus': jobStatus.toValue(),
      if (datastoreId != null) 'DatastoreId': datastoreId,
    };
  }
}

/// A tag is a label consisting of a user-defined key and value. The form for
/// tags is {"Key", "Value"}
class Tag {
  /// The key portion of a tag. Tag keys are case sensitive.
  final String key;

  /// The value portion of a tag. Tag values are case sensitive.
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
