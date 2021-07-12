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

/// Amazon HealthLake is a HIPAA eligibile service that allows customers to
/// store, transform, query, and analyze their FHIR-formatted data in a
/// consistent fashion in the cloud.
class HealthLake {
  final _s.JsonProtocol _protocol;
  HealthLake({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Creates a Data Store that can ingest and export FHIR formatted data.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreTypeVersion] :
  /// The FHIR version of the Data Store. The only supported version is R4.
  ///
  /// Parameter [clientToken] :
  /// Optional user provided token used for ensuring idempotency.
  ///
  /// Parameter [datastoreName] :
  /// The user generated name for the Data Store.
  ///
  /// Parameter [preloadDataConfig] :
  /// Optional parameter to preload data upon creation of the Data Store.
  /// Currently, the only supported preloaded data is synthetic data generated
  /// from Synthea.
  Future<CreateFHIRDatastoreResponse> createFHIRDatastore({
    required FHIRVersion datastoreTypeVersion,
    String? clientToken,
    String? datastoreName,
    PreloadDataConfig? preloadDataConfig,
  }) async {
    ArgumentError.checkNotNull(datastoreTypeVersion, 'datastoreTypeVersion');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'datastoreName',
      datastoreName,
      1,
      256,
    );
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
        if (preloadDataConfig != null) 'PreloadDataConfig': preloadDataConfig,
      },
    );

    return CreateFHIRDatastoreResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a Data Store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreId] :
  /// The AWS-generated ID for the Data Store to be deleted.
  Future<DeleteFHIRDatastoreResponse> deleteFHIRDatastore({
    String? datastoreId,
  }) async {
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
    );
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
        if (datastoreId != null) 'DatastoreId': datastoreId,
      },
    );

    return DeleteFHIRDatastoreResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with the FHIR Data Store, including the
  /// Data Store ID, Data Store ARN, Data Store name, Data Store status, created
  /// at, Data Store type version, and Data Store endpoint.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [datastoreId] :
  /// The AWS-generated Data Store id. This is part of the ‘CreateFHIRDatastore’
  /// output.
  Future<DescribeFHIRDatastoreResponse> describeFHIRDatastore({
    String? datastoreId,
  }) async {
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
    );
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
        if (datastoreId != null) 'DatastoreId': datastoreId,
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
  /// The AWS generated ID for the Data Store from which files are being
  /// exported from for an export job.
  ///
  /// Parameter [jobId] :
  /// The AWS generated ID for an export job.
  Future<DescribeFHIRExportJobResponse> describeFHIRExportJob({
    required String datastoreId,
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(datastoreId, 'datastoreId');
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
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
  /// The AWS-generated ID of the Data Store.
  ///
  /// Parameter [jobId] :
  /// The AWS-generated job ID.
  Future<DescribeFHIRImportJobResponse> describeFHIRImportJob({
    required String datastoreId,
    required String jobId,
  }) async {
    ArgumentError.checkNotNull(datastoreId, 'datastoreId');
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(jobId, 'jobId');
    _s.validateStringLength(
      'jobId',
      jobId,
      1,
      32,
      isRequired: true,
    );
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

  /// Lists all FHIR Data Stores that are in the user’s account, regardless of
  /// Data Store status.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Lists all filters associated with a FHIR Data Store request.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Data Stores returned in a single page of a
  /// ListFHIRDatastoresRequest call.
  ///
  /// Parameter [nextToken] :
  /// Fetches the next page of Data Stores when results are paginated.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      8192,
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
  /// The AWS generated ID for the Data Store from which files are being
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
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(datastoreId, 'datastoreId');
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      64,
    );
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
  /// The Amazon Resource Name (ARN) that gives Amazon HealthLake access
  /// permission.
  ///
  /// Parameter [datastoreId] :
  /// The AWS-generated Data Store ID.
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
    String? clientToken,
    String? jobName,
  }) async {
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(datastoreId, 'datastoreId');
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      64,
    );
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
      },
    );

    return StartFHIRImportJobResponse.fromJson(jsonResponse.body);
  }
}

class CreateFHIRDatastoreResponse {
  /// The datastore ARN is generated during the creation of the Data Store and can
  /// be found in the output from the initial Data Store creation call.
  final String datastoreArn;

  /// The AWS endpoint for the created Data Store. For preview, only US-east-1
  /// endpoints are supported.
  final String datastoreEndpoint;

  /// The AWS-generated Data Store id. This id is in the output from the initial
  /// Data Store creation call.
  final String datastoreId;

  /// The status of the FHIR Data Store. Possible statuses are ‘CREATING’,
  /// ‘ACTIVE’, ‘DELETING’, ‘DELETED’.
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

/// The filters applied to Data Store query.
class DatastoreFilter {
  /// A filter that allows the user to set cutoff dates for records. All Data
  /// Stores created after the specified date will be included in the results.
  final DateTime? createdAfter;

  /// A filter that allows the user to set cutoff dates for records. All Data
  /// Stores created before the specified date will be included in the results.
  final DateTime? createdBefore;

  /// Allows the user to filter Data Store results by name.
  final String? datastoreName;

  /// Allows the user to filter Data Store results by status.
  final DatastoreStatus? datastoreStatus;

  DatastoreFilter({
    this.createdAfter,
    this.createdBefore,
    this.datastoreName,
    this.datastoreStatus,
  });

  factory DatastoreFilter.fromJson(Map<String, dynamic> json) {
    return DatastoreFilter(
      createdAfter: timeStampFromJson(json['CreatedAfter']),
      createdBefore: timeStampFromJson(json['CreatedBefore']),
      datastoreName: json['DatastoreName'] as String?,
      datastoreStatus:
          (json['DatastoreStatus'] as String?)?.toDatastoreStatus(),
    );
  }

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

/// Displays the properties of the Data Store, including the ID, Arn, name, and
/// the status of the Data Store.
class DatastoreProperties {
  /// The Amazon Resource Name used in the creation of the Data Store.
  final String datastoreArn;

  /// The AWS endpoint for the Data Store. Each Data Store will have it's own
  /// endpoint with Data Store ID in the endpoint URL.
  final String datastoreEndpoint;

  /// The AWS-generated ID number for the Data Store.
  final String datastoreId;

  /// The status of the Data Store. Possible statuses are 'CREATING', 'ACTIVE',
  /// 'DELETING', or 'DELETED'.
  final DatastoreStatus datastoreStatus;

  /// The FHIR version. Only R4 version data is supported.
  final FHIRVersion datastoreTypeVersion;

  /// The time that a Data Store was created.
  final DateTime? createdAt;

  /// The user-generated name for the Data Store.
  final String? datastoreName;

  /// The preloaded data configuration for the Data Store. Only data preloaded
  /// from Synthea is supported.
  final PreloadDataConfig? preloadDataConfig;

  DatastoreProperties({
    required this.datastoreArn,
    required this.datastoreEndpoint,
    required this.datastoreId,
    required this.datastoreStatus,
    required this.datastoreTypeVersion,
    this.createdAt,
    this.datastoreName,
    this.preloadDataConfig,
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
      preloadDataConfig: json['PreloadDataConfig'] != null
          ? PreloadDataConfig.fromJson(
              json['PreloadDataConfig'] as Map<String, dynamic>)
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
    final preloadDataConfig = this.preloadDataConfig;
    return {
      'DatastoreArn': datastoreArn,
      'DatastoreEndpoint': datastoreEndpoint,
      'DatastoreId': datastoreId,
      'DatastoreStatus': datastoreStatus.toValue(),
      'DatastoreTypeVersion': datastoreTypeVersion.toValue(),
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (datastoreName != null) 'DatastoreName': datastoreName,
      if (preloadDataConfig != null) 'PreloadDataConfig': preloadDataConfig,
    };
  }
}

enum DatastoreStatus {
  creating,
  active,
  deleting,
  deleted,
}

extension on DatastoreStatus {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum DatastoreStatus');
  }
}

class DeleteFHIRDatastoreResponse {
  /// The Amazon Resource Name (ARN) that gives Amazon HealthLake access
  /// permission.
  final String datastoreArn;

  /// The AWS endpoint for the Data Store the user has requested to be deleted.
  final String datastoreEndpoint;

  /// The AWS-generated ID for the Data Store to be deleted.
  final String datastoreId;

  /// The status of the Data Store that the user has requested to be deleted.
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
  /// All properties associated with a Data Store, including the Data Store ID,
  /// Data Store ARN, Data Store name, Data Store status, created at, Data Store
  /// type version, and Data Store endpoint.
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
  /// The properties of the Import job request, including the ID, ARN, name, and
  /// the status of the job.
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

/// The properties of a FHIR export job, including the ID, ARN, name, and the
/// status of the job.
class ExportJobProperties {
  /// The AWS generated ID for the Data Store from which files are being exported
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

extension on FHIRVersion {
  String toValue() {
    switch (this) {
      case FHIRVersion.r4:
        return 'R4';
    }
  }
}

extension on String {
  FHIRVersion toFHIRVersion() {
    switch (this) {
      case 'R4':
        return FHIRVersion.r4;
    }
    throw Exception('$this is not known in enum FHIRVersion');
  }
}

/// Displays the properties of the import job, including the ID, Arn, Name, and
/// the status of the Data Store.
class ImportJobProperties {
  /// The datastore id used when the Import job was created.
  final String datastoreId;

  /// The input data configuration that was supplied when the Import job was
  /// created.
  final InputDataConfig inputDataConfig;

  /// The AWS-generated id number for the Import job.
  final String jobId;

  /// The job status for an Import job. Possible statuses are SUBMITTED,
  /// IN_PROGRESS, COMPLETED, FAILED.
  final JobStatus jobStatus;

  /// The time that the Import job was submitted for processing.
  final DateTime submitTime;

  /// The Amazon Resource Name (ARN) that gives Amazon HealthLake access to your
  /// input data.
  final String? dataAccessRoleArn;

  /// The time that the Import job was completed.
  final DateTime? endTime;

  /// The user-generated name for an Import job.
  final String? jobName;

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
      if (message != null) 'Message': message,
    };
  }
}

/// The input properties for an import job.
class InputDataConfig {
  /// The S3Uri is the user specified S3 location of the FHIR data to be imported
  /// into Amazon HealthLake.
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

enum JobStatus {
  submitted,
  inProgress,
  completed,
  failed,
}

extension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'SUBMITTED':
        return JobStatus.submitted;
      case 'IN_PROGRESS':
        return JobStatus.inProgress;
      case 'COMPLETED':
        return JobStatus.completed;
      case 'FAILED':
        return JobStatus.failed;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

class ListFHIRDatastoresResponse {
  /// All properties associated with the listed Data Stores.
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

/// The output data configuration that was supplied when the export job was
/// created.
class OutputDataConfig {
  /// The S3Uri is the user specified S3 location to which data will be exported
  /// from a FHIR Data Store.
  final String? s3Uri;

  OutputDataConfig({
    this.s3Uri,
  });

  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
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

/// The input properties for the preloaded Data Store. Only data preloaded from
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

extension on PreloadDataType {
  String toValue() {
    switch (this) {
      case PreloadDataType.synthea:
        return 'SYNTHEA';
    }
  }
}

extension on String {
  PreloadDataType toPreloadDataType() {
    switch (this) {
      case 'SYNTHEA':
        return PreloadDataType.synthea;
    }
    throw Exception('$this is not known in enum PreloadDataType');
  }
}

class StartFHIRExportJobResponse {
  /// The AWS generated ID for an export job.
  final String jobId;

  /// The status of a FHIR export job. Possible statuses are SUBMITTED,
  /// IN_PROGRESS, COMPLETED, or FAILED.
  final JobStatus jobStatus;

  /// The AWS generated ID for the Data Store from which files are being exported
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

  /// The AWS-generated Data Store ID.
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
