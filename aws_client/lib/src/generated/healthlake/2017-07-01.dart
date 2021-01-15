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

part '2017-07-01.g.dart';

/// Amazon HealthLake is a HIPAA eligibile service that allows customers to
/// store, transform, query, and analyze their FHIR-formatted data in a
/// consistent fashion in the cloud.
class HealthLake {
  final _s.JsonProtocol _protocol;
  HealthLake({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required FHIRVersion datastoreTypeVersion,
    String clientToken,
    String datastoreName,
    PreloadDataConfig preloadDataConfig,
  }) async {
    ArgumentError.checkNotNull(datastoreTypeVersion, 'datastoreTypeVersion');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'datastoreName',
      datastoreName,
      1,
      256,
    );
    _s.validateStringPattern(
      'datastoreName',
      datastoreName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
        'DatastoreTypeVersion': datastoreTypeVersion?.toValue() ?? '',
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
    String datastoreId,
  }) async {
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
    );
    _s.validateStringPattern(
      'datastoreId',
      datastoreId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
    String datastoreId,
  }) async {
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
    );
    _s.validateStringPattern(
      'datastoreId',
      datastoreId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
    @_s.required String datastoreId,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(datastoreId, 'datastoreId');
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datastoreId',
      datastoreId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
    @_s.required String datastoreId,
    @_s.required String jobId,
  }) async {
    ArgumentError.checkNotNull(datastoreId, 'datastoreId');
    _s.validateStringLength(
      'datastoreId',
      datastoreId,
      1,
      32,
      isRequired: true,
    );
    _s.validateStringPattern(
      'datastoreId',
      datastoreId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
    _s.validateStringPattern(
      'jobId',
      jobId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
    DatastoreFilter filter,
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''\p{ASCII}{0,8192}''',
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
  /// Parameter [clientToken] :
  /// An optional user provided token used for ensuring idempotency.
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
  /// Parameter [jobName] :
  /// The user generated name for an export job.
  Future<StartFHIRExportJobResponse> startFHIRExportJob({
    @_s.required String clientToken,
    @_s.required String dataAccessRoleArn,
    @_s.required String datastoreId,
    @_s.required OutputDataConfig outputDataConfig,
    String jobName,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      r'''arn:aws(-[^:]+)?:iam::[0-9]{12}:role/.+''',
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
    _s.validateStringPattern(
      'datastoreId',
      datastoreId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      64,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        'DataAccessRoleArn': dataAccessRoleArn,
        'DatastoreId': datastoreId,
        'OutputDataConfig': outputDataConfig,
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
  /// Parameter [clientToken] :
  /// Optional user provided token used for ensuring idempotency.
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
  /// Parameter [jobName] :
  /// The name of the FHIR Import job in the StartFHIRImport job request.
  Future<StartFHIRImportJobResponse> startFHIRImportJob({
    @_s.required String clientToken,
    @_s.required String dataAccessRoleArn,
    @_s.required String datastoreId,
    @_s.required InputDataConfig inputDataConfig,
    String jobName,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    _s.validateStringLength(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      20,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'dataAccessRoleArn',
      dataAccessRoleArn,
      r'''arn:aws(-[^:]+)?:iam::[0-9]{12}:role/.+''',
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
    _s.validateStringPattern(
      'datastoreId',
      datastoreId,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      64,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
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
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        'DataAccessRoleArn': dataAccessRoleArn,
        'DatastoreId': datastoreId,
        'InputDataConfig': inputDataConfig,
        if (jobName != null) 'JobName': jobName,
      },
    );

    return StartFHIRImportJobResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFHIRDatastoreResponse {
  /// The datastore ARN is generated during the creation of the Data Store and can
  /// be found in the output from the initial Data Store creation call.
  @_s.JsonKey(name: 'DatastoreArn')
  final String datastoreArn;

  /// The AWS endpoint for the created Data Store. For preview, only US-east-1
  /// endpoints are supported.
  @_s.JsonKey(name: 'DatastoreEndpoint')
  final String datastoreEndpoint;

  /// The AWS-generated Data Store id. This id is in the output from the initial
  /// Data Store creation call.
  @_s.JsonKey(name: 'DatastoreId')
  final String datastoreId;

  /// The status of the FHIR Data Store. Possible statuses are ‘CREATING’,
  /// ‘ACTIVE’, ‘DELETING’, ‘DELETED’.
  @_s.JsonKey(name: 'DatastoreStatus')
  final DatastoreStatus datastoreStatus;

  CreateFHIRDatastoreResponse({
    @_s.required this.datastoreArn,
    @_s.required this.datastoreEndpoint,
    @_s.required this.datastoreId,
    @_s.required this.datastoreStatus,
  });
  factory CreateFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFHIRDatastoreResponseFromJson(json);
}

/// The filters applied to Data Store query.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DatastoreFilter {
  /// A filter that allows the user to set cutoff dates for records. All Data
  /// Stores created after the specified date will be included in the results.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAfter')
  final DateTime createdAfter;

  /// A filter that allows the user to set cutoff dates for records. All Data
  /// Stores created before the specified date will be included in the results.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedBefore')
  final DateTime createdBefore;

  /// Allows the user to filter Data Store results by name.
  @_s.JsonKey(name: 'DatastoreName')
  final String datastoreName;

  /// Allows the user to filter Data Store results by status.
  @_s.JsonKey(name: 'DatastoreStatus')
  final DatastoreStatus datastoreStatus;

  DatastoreFilter({
    this.createdAfter,
    this.createdBefore,
    this.datastoreName,
    this.datastoreStatus,
  });
  Map<String, dynamic> toJson() => _$DatastoreFilterToJson(this);
}

/// Displays the properties of the Data Store, including the ID, Arn, name, and
/// the status of the Data Store.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DatastoreProperties {
  /// The Amazon Resource Name used in the creation of the Data Store.
  @_s.JsonKey(name: 'DatastoreArn')
  final String datastoreArn;

  /// The AWS endpoint for the Data Store. Each Data Store will have it's own
  /// endpoint with Data Store ID in the endpoint URL.
  @_s.JsonKey(name: 'DatastoreEndpoint')
  final String datastoreEndpoint;

  /// The AWS-generated ID number for the Data Store.
  @_s.JsonKey(name: 'DatastoreId')
  final String datastoreId;

  /// The status of the Data Store. Possible statuses are 'CREATING', 'ACTIVE',
  /// 'DELETING', or 'DELETED'.
  @_s.JsonKey(name: 'DatastoreStatus')
  final DatastoreStatus datastoreStatus;

  /// The FHIR version. Only R4 version data is supported.
  @_s.JsonKey(name: 'DatastoreTypeVersion')
  final FHIRVersion datastoreTypeVersion;

  /// The time that a Data Store was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// The user-generated name for the Data Store.
  @_s.JsonKey(name: 'DatastoreName')
  final String datastoreName;

  /// The preloaded data configuration for the Data Store. Only data preloaded
  /// from Synthea is supported.
  @_s.JsonKey(name: 'PreloadDataConfig')
  final PreloadDataConfig preloadDataConfig;

  DatastoreProperties({
    @_s.required this.datastoreArn,
    @_s.required this.datastoreEndpoint,
    @_s.required this.datastoreId,
    @_s.required this.datastoreStatus,
    @_s.required this.datastoreTypeVersion,
    this.createdAt,
    this.datastoreName,
    this.preloadDataConfig,
  });
  factory DatastoreProperties.fromJson(Map<String, dynamic> json) =>
      _$DatastorePropertiesFromJson(json);
}

enum DatastoreStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFHIRDatastoreResponse {
  /// The Amazon Resource Name (ARN) that gives Amazon HealthLake access
  /// permission.
  @_s.JsonKey(name: 'DatastoreArn')
  final String datastoreArn;

  /// The AWS endpoint for the Data Store the user has requested to be deleted.
  @_s.JsonKey(name: 'DatastoreEndpoint')
  final String datastoreEndpoint;

  /// The AWS-generated ID for the Data Store to be deleted.
  @_s.JsonKey(name: 'DatastoreId')
  final String datastoreId;

  /// The status of the Data Store that the user has requested to be deleted.
  @_s.JsonKey(name: 'DatastoreStatus')
  final DatastoreStatus datastoreStatus;

  DeleteFHIRDatastoreResponse({
    @_s.required this.datastoreArn,
    @_s.required this.datastoreEndpoint,
    @_s.required this.datastoreId,
    @_s.required this.datastoreStatus,
  });
  factory DeleteFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFHIRDatastoreResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFHIRDatastoreResponse {
  /// All properties associated with a Data Store, including the Data Store ID,
  /// Data Store ARN, Data Store name, Data Store status, created at, Data Store
  /// type version, and Data Store endpoint.
  @_s.JsonKey(name: 'DatastoreProperties')
  final DatastoreProperties datastoreProperties;

  DescribeFHIRDatastoreResponse({
    @_s.required this.datastoreProperties,
  });
  factory DescribeFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFHIRDatastoreResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFHIRExportJobResponse {
  /// Displays the properties of the export job, including the ID, Arn, Name, and
  /// the status of the job.
  @_s.JsonKey(name: 'ExportJobProperties')
  final ExportJobProperties exportJobProperties;

  DescribeFHIRExportJobResponse({
    @_s.required this.exportJobProperties,
  });
  factory DescribeFHIRExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFHIRExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFHIRImportJobResponse {
  /// The properties of the Import job request, including the ID, ARN, name, and
  /// the status of the job.
  @_s.JsonKey(name: 'ImportJobProperties')
  final ImportJobProperties importJobProperties;

  DescribeFHIRImportJobResponse({
    @_s.required this.importJobProperties,
  });
  factory DescribeFHIRImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFHIRImportJobResponseFromJson(json);
}

/// The properties of a FHIR export job, including the ID, ARN, name, and the
/// status of the job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ExportJobProperties {
  /// The AWS generated ID for the Data Store from which files are being exported
  /// for an export job.
  @_s.JsonKey(name: 'DatastoreId')
  final String datastoreId;

  /// The AWS generated ID for an export job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The status of a FHIR export job. Possible statuses are SUBMITTED,
  /// IN_PROGRESS, COMPLETED, or FAILED.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// The output data configuration that was supplied when the export job was
  /// created.
  @_s.JsonKey(name: 'OutputDataConfig')
  final OutputDataConfig outputDataConfig;

  /// The time an export job was initiated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubmitTime')
  final DateTime submitTime;

  /// The Amazon Resource Name used during the initiation of the job.
  @_s.JsonKey(name: 'DataAccessRoleArn')
  final String dataAccessRoleArn;

  /// The time an export job completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The user generated name for an export job.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// An explanation of any errors that may have occurred during the export job.
  @_s.JsonKey(name: 'Message')
  final String message;

  ExportJobProperties({
    @_s.required this.datastoreId,
    @_s.required this.jobId,
    @_s.required this.jobStatus,
    @_s.required this.outputDataConfig,
    @_s.required this.submitTime,
    this.dataAccessRoleArn,
    this.endTime,
    this.jobName,
    this.message,
  });
  factory ExportJobProperties.fromJson(Map<String, dynamic> json) =>
      _$ExportJobPropertiesFromJson(json);
}

enum FHIRVersion {
  @_s.JsonValue('R4')
  r4,
}

extension on FHIRVersion {
  String toValue() {
    switch (this) {
      case FHIRVersion.r4:
        return 'R4';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Displays the properties of the import job, including the ID, Arn, Name, and
/// the status of the Data Store.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportJobProperties {
  /// The datastore id used when the Import job was created.
  @_s.JsonKey(name: 'DatastoreId')
  final String datastoreId;

  /// The input data configuration that was supplied when the Import job was
  /// created.
  @_s.JsonKey(name: 'InputDataConfig')
  final InputDataConfig inputDataConfig;

  /// The AWS-generated id number for the Import job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The job status for an Import job. Possible statuses are SUBMITTED,
  /// IN_PROGRESS, COMPLETED, FAILED.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// The time that the Import job was submitted for processing.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubmitTime')
  final DateTime submitTime;

  /// The Amazon Resource Name (ARN) that gives Amazon HealthLake access to your
  /// input data.
  @_s.JsonKey(name: 'DataAccessRoleArn')
  final String dataAccessRoleArn;

  /// The time that the Import job was completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The user-generated name for an Import job.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// An explanation of any errors that may have occurred during the FHIR import
  /// job.
  @_s.JsonKey(name: 'Message')
  final String message;

  ImportJobProperties({
    @_s.required this.datastoreId,
    @_s.required this.inputDataConfig,
    @_s.required this.jobId,
    @_s.required this.jobStatus,
    @_s.required this.submitTime,
    this.dataAccessRoleArn,
    this.endTime,
    this.jobName,
    this.message,
  });
  factory ImportJobProperties.fromJson(Map<String, dynamic> json) =>
      _$ImportJobPropertiesFromJson(json);
}

/// The input properties for an import job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputDataConfig {
  /// The S3Uri is the user specified S3 location of the FHIR data to be imported
  /// into Amazon HealthLake.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  InputDataConfig({
    this.s3Uri,
  });
  factory InputDataConfig.fromJson(Map<String, dynamic> json) =>
      _$InputDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InputDataConfigToJson(this);
}

enum JobStatus {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('FAILED')
  failed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFHIRDatastoresResponse {
  /// All properties associated with the listed Data Stores.
  @_s.JsonKey(name: 'DatastorePropertiesList')
  final List<DatastoreProperties> datastorePropertiesList;

  /// Pagination token that can be used to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFHIRDatastoresResponse({
    @_s.required this.datastorePropertiesList,
    this.nextToken,
  });
  factory ListFHIRDatastoresResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFHIRDatastoresResponseFromJson(json);
}

/// The output data configuration that was supplied when the export job was
/// created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputDataConfig {
  /// The S3Uri is the user specified S3 location to which data will be exported
  /// from a FHIR Data Store.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  OutputDataConfig({
    this.s3Uri,
  });
  factory OutputDataConfig.fromJson(Map<String, dynamic> json) =>
      _$OutputDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OutputDataConfigToJson(this);
}

/// The input properties for the preloaded Data Store. Only data preloaded from
/// Synthea is supported.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PreloadDataConfig {
  /// The type of preloaded data. Only Synthea preloaded data is supported.
  @_s.JsonKey(name: 'PreloadDataType')
  final PreloadDataType preloadDataType;

  PreloadDataConfig({
    @_s.required this.preloadDataType,
  });
  factory PreloadDataConfig.fromJson(Map<String, dynamic> json) =>
      _$PreloadDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PreloadDataConfigToJson(this);
}

enum PreloadDataType {
  @_s.JsonValue('SYNTHEA')
  synthea,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartFHIRExportJobResponse {
  /// The AWS generated ID for an export job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The status of a FHIR export job. Possible statuses are SUBMITTED,
  /// IN_PROGRESS, COMPLETED, or FAILED.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// The AWS generated ID for the Data Store from which files are being exported
  /// for an export job.
  @_s.JsonKey(name: 'DatastoreId')
  final String datastoreId;

  StartFHIRExportJobResponse({
    @_s.required this.jobId,
    @_s.required this.jobStatus,
    this.datastoreId,
  });
  factory StartFHIRExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartFHIRExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartFHIRImportJobResponse {
  /// The AWS-generated job ID.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The status of an import job.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// The AWS-generated Data Store ID.
  @_s.JsonKey(name: 'DatastoreId')
  final String datastoreId;

  StartFHIRImportJobResponse({
    @_s.required this.jobId,
    @_s.required this.jobStatus,
    this.datastoreId,
  });
  factory StartFHIRImportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartFHIRImportJobResponseFromJson(json);
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

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
