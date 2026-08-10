// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2017_07_01.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// This is the <i>AWS HealthLake API Reference</i>. For an introduction to the
/// service, see <a
/// href="https://docs.aws.amazon.com/healthlake/latest/devguide/what-is.html">What
/// is AWS HealthLake?</a> in the <i>AWS HealthLake Developer Guide</i>.
class HealthLake {
  final _s.JsonProtocol _protocol;
  factory HealthLake({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
    bool disableHostPrefix = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'healthlake',
    );
    return HealthLake._(
      protocol: _s.JsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
        disableHostPrefix: disableHostPrefix,
      ),
    );
  }
  HealthLake._({
    required _s.JsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Creates a data transformation profile in DRAFT state. Specify a built-in
  /// starter profile, an existing profile version, raw profile content, or a
  /// sample data file as the source.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileName] :
  /// A name for the data transformation profile.
  ///
  /// Parameter [source] :
  /// The source for the initial profile content. Specify a built-in starter
  /// profile, an existing profile version to clone, raw profile content for
  /// CI/CD workflows, or a sample data file in Amazon S3.
  ///
  /// Parameter [sourceFormat] :
  /// The source data format that this profile converts from (Consolidated
  /// Clinical Document Architecture (C-CDA) or Comma-separated values (CSV)).
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, the
  /// service ignores the request but does not return an error.
  ///
  /// Parameter [kmsKeyId] :
  /// The AWS Key Management Service (AWS KMS) key identifier used to encrypt
  /// the profile content at rest.
  ///
  /// Parameter [profileDescription] :
  /// A human-readable description of the profile's purpose.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the profile at creation time.
  Future<CreateDataTransformationProfileResponse>
      createDataTransformationProfile({
    required String profileName,
    required CreateDataTransformationProfileSource source,
    required SourceFormat sourceFormat,
    String? clientToken,
    String? kmsKeyId,
    String? profileDescription,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.CreateDataTransformationProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileName': profileName,
        'Source': source,
        'SourceFormat': sourceFormat.value,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (kmsKeyId != null) 'KmsKeyId': kmsKeyId,
        if (profileDescription != null)
          'ProfileDescription': profileDescription,
        if (tags != null) 'Tags': tags,
      },

      hostPrefix: 'datatransformation.',
    );

    return CreateDataTransformationProfileResponse.fromJson(jsonResponse.body);
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
  /// Parameter [analyticsConfiguration] :
  /// The analytics configuration for the data store.
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
  /// Parameter [nlpConfiguration] :
  /// The natural language processing (NLP) configuration for the data store.
  ///
  /// Parameter [preloadDataConfig] :
  /// An optional parameter to preload (import) open source Synthea FHIR data
  /// upon creation of the data store.
  ///
  /// Parameter [profileConfiguration] :
  /// The profile configuration for the data store.
  ///
  /// Parameter [sseConfiguration] :
  /// The server-side encryption key configuration for a customer-provided
  /// encryption key specified for creating a data store.
  ///
  /// Parameter [tags] :
  /// The resource tags applied to a data store when it is created.
  Future<CreateFHIRDatastoreResponse> createFHIRDatastore({
    required FHIRVersion datastoreTypeVersion,
    AnalyticsConfiguration? analyticsConfiguration,
    String? clientToken,
    String? datastoreName,
    IdentityProviderConfiguration? identityProviderConfiguration,
    NlpConfiguration? nlpConfiguration,
    PreloadDataConfig? preloadDataConfig,
    ProfileConfiguration? profileConfiguration,
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
        if (analyticsConfiguration != null)
          'AnalyticsConfiguration': analyticsConfiguration,
        'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
        if (datastoreName != null) 'DatastoreName': datastoreName,
        if (identityProviderConfiguration != null)
          'IdentityProviderConfiguration': identityProviderConfiguration,
        if (nlpConfiguration != null) 'NlpConfiguration': nlpConfiguration,
        if (preloadDataConfig != null) 'PreloadDataConfig': preloadDataConfig,
        if (profileConfiguration != null)
          'ProfileConfiguration': profileConfiguration,
        if (sseConfiguration != null) 'SseConfiguration': sseConfiguration,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateFHIRDatastoreResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a data transformation profile and all its versions, including the
  /// DRAFT and all published versions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile to delete.
  Future<DeleteDataTransformationProfileResponse>
      deleteDataTransformationProfile({
    required String profileId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.DeleteDataTransformationProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileId': profileId,
      },

      hostPrefix: 'datatransformation.',
    );

    return DeleteDataTransformationProfileResponse.fromJson(jsonResponse.body);
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

  /// Describes a data transformation job, including its current status,
  /// configuration, and progress information.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobId] :
  /// The unique identifier of the data transformation job to describe.
  Future<DescribeDataTransformationJobResponse> describeDataTransformationJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.DescribeDataTransformationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'JobId': jobId,
      },

      hostPrefix: 'datatransformation.',
    );

    return DescribeDataTransformationJobResponse.fromJson(jsonResponse.body);
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

  /// Retrieves a data transformation profile's metadata and profile content at
  /// a specific version. Specify version 0 to retrieve the DRAFT, a version
  /// number between 1 and 99 to retrieve a specific published version, or omit
  /// the version to retrieve the latest published version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile to retrieve.
  ///
  /// Parameter [profileVersion] :
  /// The version number to retrieve. Specify 0 to retrieve the DRAFT version.
  /// If you omit this parameter, the service returns the latest published
  /// version.
  Future<GetDataTransformationProfileResponse> getDataTransformationProfile({
    required String profileId,
    int? profileVersion,
  }) async {
    _s.validateNumRange(
      'profileVersion',
      profileVersion,
      0,
      99,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.GetDataTransformationProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileId': profileId,
        if (profileVersion != null) 'ProfileVersion': profileVersion,
      },

      hostPrefix: 'datatransformation.',
    );

    return GetDataTransformationProfileResponse.fromJson(jsonResponse.body);
  }

  /// Lists data transformation jobs for your AWS account. Results can be
  /// filtered by status, job name, and submit time window. Results are
  /// paginated. Use the <code>NextToken</code> parameter to retrieve additional
  /// results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobName] :
  /// Filters the results to include only jobs with the specified name.
  ///
  /// Parameter [jobStatus] :
  /// Filters the results to include only jobs with the specified status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return per page. If you don't specify a
  /// value, the service returns up to 100 results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous response. Pass this value to retrieve
  /// the next page of results.
  ///
  /// Parameter [submittedAfter] :
  /// Filters the results to include only jobs submitted at or after this
  /// timestamp.
  ///
  /// Parameter [submittedBefore] :
  /// Filters the results to include only jobs submitted at or before this
  /// timestamp.
  Future<ListDataTransformationJobsResponse> listDataTransformationJobs({
    String? jobName,
    TransformationJobStatus? jobStatus,
    int? maxResults,
    String? nextToken,
    DateTime? submittedAfter,
    DateTime? submittedBefore,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.ListDataTransformationJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (jobName != null) 'JobName': jobName,
        if (jobStatus != null) 'JobStatus': jobStatus.value,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (submittedAfter != null)
          'SubmittedAfter': unixTimestampToJson(submittedAfter),
        if (submittedBefore != null)
          'SubmittedBefore': unixTimestampToJson(submittedBefore),
      },

      hostPrefix: 'datatransformation.',
    );

    return ListDataTransformationJobsResponse.fromJson(jsonResponse.body);
  }

  /// Lists all data transformation profiles in your account, returning the
  /// latest version summary for each. Use
  /// <code>GetDataTransformationProfile</code> to retrieve profile content.
  /// Results are paginated. Use the <code>NextToken</code> parameter to
  /// retrieve additional results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceFormat] :
  /// Filters the results by source data format.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of profiles to return per page. If you don't specify a
  /// value, the service returns up to 100 results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous response. Pass this value to retrieve
  /// the next page of results.
  Future<ListDataTransformationProfilesResponse>
      listDataTransformationProfiles({
    required SourceFormat sourceFormat,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.ListDataTransformationProfiles'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'SourceFormat': sourceFormat.value,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },

      hostPrefix: 'datatransformation.',
    );

    return ListDataTransformationProfilesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all versions of a specific data transformation profile (DRAFT and
  /// published), in reverse chronological order (newest first). Use
  /// <code>GetDataTransformationProfile</code> to retrieve profile content.
  /// Results are paginated. Use the <code>NextToken</code> parameter to
  /// retrieve additional results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile whose versions to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of profile versions to return per page. If you don't
  /// specify a value, the service returns up to 100 results.
  ///
  /// Parameter [nextToken] :
  /// The pagination token from a previous response. Pass this value to retrieve
  /// the next page of results.
  Future<ListDataTransformationProfileVersionsResponse>
      listDataTransformationProfileVersions({
    required String profileId,
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
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.ListDataTransformationProfileVersions'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileId': profileId,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },

      hostPrefix: 'datatransformation.',
    );

    return ListDataTransformationProfileVersionsResponse.fromJson(
        jsonResponse.body);
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

  /// Promotes the current DRAFT version of a data transformation profile to a
  /// new immutable published version. Also supports rollback by publishing from
  /// a previously published version.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile to publish.
  ///
  /// Parameter [sourceFormat] :
  /// The source data format of the profile.
  ///
  /// Parameter [changeDescription] :
  /// A description of what changed or why this version is being published.
  ///
  /// Parameter [fromExistingVersion] :
  /// The version number of a previously published version to republish as the
  /// new latest version. Use this parameter for rollback scenarios. If you omit
  /// this parameter, the service publishes the current DRAFT version.
  Future<PublishDataTransformationProfileResponse>
      publishDataTransformationProfile({
    required String profileId,
    required SourceFormat sourceFormat,
    String? changeDescription,
    int? fromExistingVersion,
  }) async {
    _s.validateNumRange(
      'fromExistingVersion',
      fromExistingVersion,
      0,
      99,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.PublishDataTransformationProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileId': profileId,
        'SourceFormat': sourceFormat.value,
        if (changeDescription != null) 'ChangeDescription': changeDescription,
        if (fromExistingVersion != null)
          'FromExistingVersion': fromExistingVersion,
      },

      hostPrefix: 'datatransformation.',
    );

    return PublishDataTransformationProfileResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous data transformation job that converts source files
  /// from Amazon Simple Storage Service (Amazon S3) and writes the output to
  /// Amazon S3 or AWS HealthLake.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier to ensure that the operation completes
  /// no more than one time. If this token matches a previous request, the
  /// service ignores the request but does not return an error.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that AWS HealthLake assumes to read from and write to the
  /// specified Amazon S3 locations.
  ///
  /// Parameter [inputDataConfig] :
  /// The Amazon S3 location and format of the source files to transform.
  ///
  /// Parameter [outputDataConfig] :
  /// The Amazon S3 output location and AWS Key Management Service (AWS KMS)
  /// encryption configuration.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the data transformation profile to use for
  /// conversion.
  ///
  /// Parameter [driftDetectionEnabled] :
  /// Specifies whether drift detection is enabled for this job. When enabled,
  /// AWS HealthLake writes a drift report to the output Amazon S3 location
  /// alongside the converted files.
  ///
  /// Parameter [jobName] :
  /// A descriptive name for the data transformation job.
  ///
  /// Parameter [provenanceEnabled] :
  /// Specifies whether FHIR R4 Provenance resource generation is enabled for
  /// this transformation job. When provenance is enabled, the service also
  /// generates related DocumentReference and Device resources. If you don't
  /// specify a value, the default is <code>true</code>. To disable provenance
  /// output, set this parameter to <code>false</code>.
  Future<StartDataTransformationJobResponse> startDataTransformationJob({
    required String clientToken,
    required String dataAccessRoleArn,
    required TransformationInputDataConfig inputDataConfig,
    required TransformationOutputDataConfig outputDataConfig,
    required String profileId,
    bool? driftDetectionEnabled,
    String? jobName,
    bool? provenanceEnabled,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.StartDataTransformationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ClientToken': clientToken,
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'OutputDataConfig': outputDataConfig,
        'ProfileId': profileId,
        if (driftDetectionEnabled != null)
          'DriftDetectionEnabled': driftDetectionEnabled,
        if (jobName != null) 'JobName': jobName,
        if (provenanceEnabled != null) 'ProvenanceEnabled': provenanceEnabled,
      },

      hostPrefix: 'datatransformation.',
    );

    return StartDataTransformationJobResponse.fromJson(jsonResponse.body);
  }

  /// Start a FHIR export job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [FailedDependencyException].
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
  /// May throw [FailedDependencyException].
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
  /// Parameter [provenanceEnabled] :
  /// Specifies whether to enable provenance for the import job.
  ///
  /// Parameter [validationLevel] :
  /// The validation level of the import job.
  Future<StartFHIRImportJobResponse> startFHIRImportJob({
    required String dataAccessRoleArn,
    required String datastoreId,
    required InputDataConfig inputDataConfig,
    required OutputDataConfig jobOutputDataConfig,
    String? clientToken,
    bool? driftDetectionEnabled,
    String? inputFormat,
    String? jobName,
    String? profileId,
    bool? provenanceEnabled,
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
        if (driftDetectionEnabled != null)
          'DriftDetectionEnabled': driftDetectionEnabled,
        if (inputFormat != null) 'InputFormat': inputFormat,
        if (jobName != null) 'JobName': jobName,
        if (profileId != null) 'ProfileId': profileId,
        if (provenanceEnabled != null) 'ProvenanceEnabled': provenanceEnabled,
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

  /// Updates the DRAFT version (version 0) of a data transformation profile
  /// with new profile content. The update replaces all existing DRAFT content.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile to update.
  ///
  /// Parameter [profileMapping] :
  /// The new profile content for the DRAFT version. This is a full replacement
  /// of all profile files.
  ///
  /// Parameter [changeDescription] :
  /// A description of what changed in this update.
  Future<UpdateDataTransformationProfileResponse>
      updateDataTransformationProfile({
    required String profileId,
    required Map<String, String> profileMapping,
    String? changeDescription,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.UpdateDataTransformationProfile'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProfileId': profileId,
        'ProfileMapping': profileMapping,
        if (changeDescription != null) 'ChangeDescription': changeDescription,
      },

      hostPrefix: 'datatransformation.',
    );

    return UpdateDataTransformationProfileResponse.fromJson(jsonResponse.body);
  }

  /// Update the properties of a FHIR-enabled data store.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [datastoreId] :
  /// The data store identifier.
  ///
  /// Parameter [analyticsConfiguration] :
  /// The analytics configuration for the data store.
  ///
  /// Parameter [datastoreName] :
  /// The data store name.
  ///
  /// Parameter [identityProviderConfiguration] :
  /// The identity provider configuration for the data store.
  ///
  /// Parameter [nlpConfiguration] :
  /// The natural language processing (NLP) configuration for the data store.
  ///
  /// Parameter [profileConfiguration] :
  /// The profile configuration for the data store.
  Future<UpdateFHIRDatastoreResponse> updateFHIRDatastore({
    required String datastoreId,
    AnalyticsConfiguration? analyticsConfiguration,
    String? datastoreName,
    IdentityProviderConfiguration? identityProviderConfiguration,
    NlpConfiguration? nlpConfiguration,
    ProfileConfiguration? profileConfiguration,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.UpdateFHIRDatastore'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DatastoreId': datastoreId,
        if (analyticsConfiguration != null)
          'AnalyticsConfiguration': analyticsConfiguration,
        if (datastoreName != null) 'DatastoreName': datastoreName,
        if (identityProviderConfiguration != null)
          'IdentityProviderConfiguration': identityProviderConfiguration,
        if (nlpConfiguration != null) 'NlpConfiguration': nlpConfiguration,
        if (profileConfiguration != null)
          'ProfileConfiguration': profileConfiguration,
      },
    );

    return UpdateFHIRDatastoreResponse.fromJson(jsonResponse.body);
  }

  /// Updates a data transformation profile using chat-based interaction with an
  /// agent. Supports multi-turn conversations for iteratively customizing
  /// profiles.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [AgentMessageOutOfContextException].
  /// May throw [ConversationNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [NotImplementedOperationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [UnauthorizedException].
  /// May throw [UnsupportedMIMETypeException].
  /// May throw [ValidationException].
  ///
  /// Parameter [inputMessage] :
  /// The message to send to the agent.
  ///
  /// Parameter [profileId] :
  /// The unique identifier of the profile to update via the agent.
  ///
  /// Parameter [sourceFormat] :
  /// The source data format for the transformation.
  ///
  /// Parameter [conversationId] :
  /// The conversation identifier for multi-turn interactions. Omit to start a
  /// new conversation.
  Future<UpdateProfileWithAgentResponse> updateProfileWithAgent({
    required AgentInputMessage inputMessage,
    required String profileId,
    required SourceFormat sourceFormat,
    String? conversationId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'HealthLake.UpdateProfileWithAgent'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'InputMessage': inputMessage,
        'ProfileId': profileId,
        'SourceFormat': sourceFormat.value,
        if (conversationId != null) 'ConversationId': conversationId,
      },

      hostPrefix: 'datatransformation.',
    );

    return UpdateProfileWithAgentResponse.fromJson(jsonResponse.body);
  }
}

/// The response from the <code>CreateDataTransformationProfile</code>
/// operation.
///
/// @nodoc
class CreateDataTransformationProfileResponse {
  /// The timestamp when the profile was last updated.
  final DateTime lastUpdatedAt;

  /// The unique identifier of the created profile.
  final String profileId;

  /// The name of the created profile.
  final String profileName;

  /// The source data format of the profile.
  final SourceFormat sourceFormat;

  /// The target output format. Always <code>FHIR_R4</code>.
  final TargetFormat targetFormat;

  /// The version number of the newly created profile. The starting version is
  /// always 0, which indicates the profile is in DRAFT state.
  final int version;

  CreateDataTransformationProfileResponse({
    required this.lastUpdatedAt,
    required this.profileId,
    required this.profileName,
    required this.sourceFormat,
    required this.targetFormat,
    required this.version,
  });

  factory CreateDataTransformationProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDataTransformationProfileResponse(
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      profileId: (json['ProfileId'] as String?) ?? '',
      profileName: (json['ProfileName'] as String?) ?? '',
      sourceFormat:
          SourceFormat.fromString((json['SourceFormat'] as String?) ?? ''),
      targetFormat:
          TargetFormat.fromString((json['TargetFormat'] as String?) ?? ''),
      version: (json['Version'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedAt = this.lastUpdatedAt;
    final profileId = this.profileId;
    final profileName = this.profileName;
    final sourceFormat = this.sourceFormat;
    final targetFormat = this.targetFormat;
    final version = this.version;
    return {
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'ProfileId': profileId,
      'ProfileName': profileName,
      'SourceFormat': sourceFormat.value,
      'TargetFormat': targetFormat.value,
      'Version': version,
    };
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

/// The response from the <code>DeleteDataTransformationProfile</code>
/// operation.
///
/// @nodoc
class DeleteDataTransformationProfileResponse {
  /// The timestamp when the profile was deleted.
  final DateTime deletionTime;

  /// The unique identifier of the deleted profile.
  final String profileId;

  /// The name of the deleted profile.
  final String? profileName;

  DeleteDataTransformationProfileResponse({
    required this.deletionTime,
    required this.profileId,
    this.profileName,
  });

  factory DeleteDataTransformationProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteDataTransformationProfileResponse(
      deletionTime: nonNullableTimeStampFromJson(json['DeletionTime'] ?? 0),
      profileId: (json['ProfileId'] as String?) ?? '',
      profileName: json['ProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deletionTime = this.deletionTime;
    final profileId = this.profileId;
    final profileName = this.profileName;
    return {
      'DeletionTime': unixTimestampToJson(deletionTime),
      'ProfileId': profileId,
      if (profileName != null) 'ProfileName': profileName,
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

/// The response from the <code>DescribeDataTransformationJob</code> operation.
///
/// @nodoc
class DescribeDataTransformationJobResponse {
  /// The properties of the data transformation job, including status,
  /// configuration, and progress information.
  final TransformationJobProperties transformationJobProperties;

  DescribeDataTransformationJobResponse({
    required this.transformationJobProperties,
  });

  factory DescribeDataTransformationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeDataTransformationJobResponse(
      transformationJobProperties: TransformationJobProperties.fromJson(
          (json['TransformationJobProperties'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final transformationJobProperties = this.transformationJobProperties;
    return {
      'TransformationJobProperties': transformationJobProperties,
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

/// The response from the <code>GetDataTransformationProfile</code> operation.
///
/// @nodoc
class GetDataTransformationProfileResponse {
  /// The timestamp when this version was last updated.
  final DateTime lastUpdatedAt;

  /// The unique identifier of the profile.
  final String profileId;

  /// The profile content as a map of file paths to content strings.
  final Map<String, String> profileMapping;

  /// The source data format of the profile.
  final SourceFormat sourceFormat;

  /// The target output format of the profile.
  final TargetFormat targetFormat;

  /// The version number of the retrieved profile.
  final int version;

  /// A description of what changed in this version.
  final String? changeDescription;

  /// The description of the profile.
  final String? profileDescription;

  /// The name of the profile.
  final String? profileName;

  GetDataTransformationProfileResponse({
    required this.lastUpdatedAt,
    required this.profileId,
    required this.profileMapping,
    required this.sourceFormat,
    required this.targetFormat,
    required this.version,
    this.changeDescription,
    this.profileDescription,
    this.profileName,
  });

  factory GetDataTransformationProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return GetDataTransformationProfileResponse(
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      profileId: (json['ProfileId'] as String?) ?? '',
      profileMapping: ((json['ProfileMapping'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(k, e as String)),
      sourceFormat:
          SourceFormat.fromString((json['SourceFormat'] as String?) ?? ''),
      targetFormat:
          TargetFormat.fromString((json['TargetFormat'] as String?) ?? ''),
      version: (json['Version'] as int?) ?? 0,
      changeDescription: json['ChangeDescription'] as String?,
      profileDescription: json['ProfileDescription'] as String?,
      profileName: json['ProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedAt = this.lastUpdatedAt;
    final profileId = this.profileId;
    final profileMapping = this.profileMapping;
    final sourceFormat = this.sourceFormat;
    final targetFormat = this.targetFormat;
    final version = this.version;
    final changeDescription = this.changeDescription;
    final profileDescription = this.profileDescription;
    final profileName = this.profileName;
    return {
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'ProfileId': profileId,
      'ProfileMapping': profileMapping,
      'SourceFormat': sourceFormat.value,
      'TargetFormat': targetFormat.value,
      'Version': version,
      if (changeDescription != null) 'ChangeDescription': changeDescription,
      if (profileDescription != null) 'ProfileDescription': profileDescription,
      if (profileName != null) 'ProfileName': profileName,
    };
  }
}

/// The response from the <code>ListDataTransformationJobs</code> operation.
///
/// @nodoc
class ListDataTransformationJobsResponse {
  /// The list of data transformation job summaries.
  final List<TransformationJobSummary> items;

  /// The pagination token to use in the next request. If this value is
  /// <code>null</code>, there are no more results.
  final String? nextToken;

  ListDataTransformationJobsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListDataTransformationJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataTransformationJobsResponse(
      items: ((json['Items'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              TransformationJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response from the <code>ListDataTransformationProfiles</code> operation.
///
/// @nodoc
class ListDataTransformationProfilesResponse {
  /// The list of data transformation profile summaries.
  final List<DataTransformationProfileSummary> items;

  /// The pagination token to use in the next request. If this value is
  /// <code>null</code>, there are no more results.
  final String? nextToken;

  ListDataTransformationProfilesResponse({
    required this.items,
    this.nextToken,
  });

  factory ListDataTransformationProfilesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataTransformationProfilesResponse(
      items: ((json['Items'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataTransformationProfileSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The response from the <code>ListDataTransformationProfileVersions</code>
/// operation.
///
/// @nodoc
class ListDataTransformationProfileVersionsResponse {
  /// The list of data transformation profile version summaries.
  final List<DataTransformationProfileVersionSummary> items;

  /// The pagination token to use in the next request. If this value is
  /// <code>null</code>, there are no more results.
  final String? nextToken;

  ListDataTransformationProfileVersionsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListDataTransformationProfileVersionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListDataTransformationProfileVersionsResponse(
      items: ((json['Items'] as List?) ?? const [])
          .nonNulls
          .map((e) => DataTransformationProfileVersionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
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

/// The response from the <code>PublishDataTransformationProfile</code>
/// operation.
///
/// @nodoc
class PublishDataTransformationProfileResponse {
  /// The timestamp when the profile was last updated.
  final DateTime lastUpdatedAt;

  /// The unique identifier of the published profile.
  final String profileId;

  /// The source data format of the profile.
  final SourceFormat sourceFormat;

  /// The target output format of the profile.
  final TargetFormat targetFormat;

  /// The new version number that was created.
  final int version;

  /// The name of the published profile.
  final String? profileName;

  PublishDataTransformationProfileResponse({
    required this.lastUpdatedAt,
    required this.profileId,
    required this.sourceFormat,
    required this.targetFormat,
    required this.version,
    this.profileName,
  });

  factory PublishDataTransformationProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return PublishDataTransformationProfileResponse(
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      profileId: (json['ProfileId'] as String?) ?? '',
      sourceFormat:
          SourceFormat.fromString((json['SourceFormat'] as String?) ?? ''),
      targetFormat:
          TargetFormat.fromString((json['TargetFormat'] as String?) ?? ''),
      version: (json['Version'] as int?) ?? 0,
      profileName: json['ProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedAt = this.lastUpdatedAt;
    final profileId = this.profileId;
    final sourceFormat = this.sourceFormat;
    final targetFormat = this.targetFormat;
    final version = this.version;
    final profileName = this.profileName;
    return {
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'ProfileId': profileId,
      'SourceFormat': sourceFormat.value,
      'TargetFormat': targetFormat.value,
      'Version': version,
      if (profileName != null) 'ProfileName': profileName,
    };
  }
}

/// The response from the <code>StartDataTransformationJob</code> operation.
///
/// @nodoc
class StartDataTransformationJobResponse {
  /// The unique identifier assigned to the data transformation job.
  final String jobId;

  /// The initial status of the data transformation job.
  final TransformationJobStatus jobStatus;

  StartDataTransformationJobResponse({
    required this.jobId,
    required this.jobStatus,
  });

  factory StartDataTransformationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartDataTransformationJobResponse(
      jobId: (json['JobId'] as String?) ?? '',
      jobStatus: TransformationJobStatus.fromString(
          (json['JobStatus'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    return {
      'JobId': jobId,
      'JobStatus': jobStatus.value,
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

/// The response from the <code>UpdateDataTransformationProfile</code>
/// operation.
///
/// @nodoc
class UpdateDataTransformationProfileResponse {
  /// The timestamp when the profile was last updated.
  final DateTime lastUpdatedAt;

  /// The unique identifier of the updated profile.
  final String profileId;

  /// The source data format of the profile.
  final SourceFormat sourceFormat;

  /// The target output format of the profile.
  final TargetFormat targetFormat;

  /// The name of the updated profile.
  final String? profileName;

  UpdateDataTransformationProfileResponse({
    required this.lastUpdatedAt,
    required this.profileId,
    required this.sourceFormat,
    required this.targetFormat,
    this.profileName,
  });

  factory UpdateDataTransformationProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateDataTransformationProfileResponse(
      lastUpdatedAt: nonNullableTimeStampFromJson(json['LastUpdatedAt'] ?? 0),
      profileId: (json['ProfileId'] as String?) ?? '',
      sourceFormat:
          SourceFormat.fromString((json['SourceFormat'] as String?) ?? ''),
      targetFormat:
          TargetFormat.fromString((json['TargetFormat'] as String?) ?? ''),
      profileName: json['ProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedAt = this.lastUpdatedAt;
    final profileId = this.profileId;
    final sourceFormat = this.sourceFormat;
    final targetFormat = this.targetFormat;
    final profileName = this.profileName;
    return {
      'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      'ProfileId': profileId,
      'SourceFormat': sourceFormat.value,
      'TargetFormat': targetFormat.value,
      if (profileName != null) 'ProfileName': profileName,
    };
  }
}

/// @nodoc
class UpdateFHIRDatastoreResponse {
  /// The data store properties.
  final DatastoreProperties datastoreProperties;

  UpdateFHIRDatastoreResponse({
    required this.datastoreProperties,
  });

  factory UpdateFHIRDatastoreResponse.fromJson(Map<String, dynamic> json) {
    return UpdateFHIRDatastoreResponse(
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

/// The response from the <code>UpdateProfileWithAgent</code> operation.
///
/// @nodoc
class UpdateProfileWithAgentResponse {
  /// The response message from the agent.
  final AgentOutputMessage agentResponse;

  /// The conversation identifier to use for follow-up messages in this
  /// conversation.
  final String conversationId;

  UpdateProfileWithAgentResponse({
    required this.agentResponse,
    required this.conversationId,
  });

  factory UpdateProfileWithAgentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileWithAgentResponse(
      agentResponse: AgentOutputMessage.fromJson(
          (json['AgentResponse'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      conversationId: (json['ConversationId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final agentResponse = this.agentResponse;
    final conversationId = this.conversationId;
    return {
      'AgentResponse': agentResponse,
      'ConversationId': conversationId,
    };
  }
}

/// Represents a response message from the agent during chat-based profile
/// customization.
///
/// @nodoc
class AgentOutputMessage {
  /// The text of the agent's response.
  final String body;

  /// The type of output message, which indicates how to interpret the agent's
  /// response.
  final AgentOutputMessageType type;

  /// A list of selectable options presented when the response type is
  /// <code>options</code>.
  final List<String>? optionsList;

  AgentOutputMessage({
    required this.body,
    required this.type,
    this.optionsList,
  });

  factory AgentOutputMessage.fromJson(Map<String, dynamic> json) {
    return AgentOutputMessage(
      body: (json['Body'] as String?) ?? '',
      type: AgentOutputMessageType.fromString((json['Type'] as String?) ?? ''),
      optionsList: (json['OptionsList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final type = this.type;
    final optionsList = this.optionsList;
    return {
      'Body': body,
      'Type': type.value,
      if (optionsList != null) 'OptionsList': optionsList,
    };
  }
}

/// @nodoc
class AgentOutputMessageType {
  static const initialGreeting = AgentOutputMessageType._('INITIAL_GREETING');
  static const normal = AgentOutputMessageType._('normal');
  static const confirmation = AgentOutputMessageType._('confirmation');
  static const complete = AgentOutputMessageType._('complete');
  static const error = AgentOutputMessageType._('error');
  static const options = AgentOutputMessageType._('options');
  static const choices = AgentOutputMessageType._('choices');

  final String value;

  const AgentOutputMessageType._(this.value);

  static const values = [
    initialGreeting,
    normal,
    confirmation,
    complete,
    error,
    options,
    choices
  ];

  static AgentOutputMessageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgentOutputMessageType._(value));

  @override
  bool operator ==(other) =>
      other is AgentOutputMessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SourceFormat {
  static const ccda = SourceFormat._('CCDA');
  static const csv = SourceFormat._('CSV');

  final String value;

  const SourceFormat._(this.value);

  static const values = [ccda, csv];

  static SourceFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => SourceFormat._(value));

  @override
  bool operator ==(other) => other is SourceFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a message sent to the agent during chat-based profile
/// customization.
///
/// @nodoc
class AgentInputMessage {
  /// The text of your message to the agent.
  final String body;

  /// The type of input message, which determines how the agent processes your
  /// request. Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>normal</code>: A regular message to the agent.
  /// </li>
  /// <li>
  /// <code>confirmation_response</code>: A response to a confirmation request
  /// from the agent.
  /// </li>
  /// </ul>
  final AgentInputMessageType type;

  AgentInputMessage({
    required this.body,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final type = this.type;
    return {
      'Body': body,
      'Type': type.value,
    };
  }
}

/// @nodoc
class AgentInputMessageType {
  static const normal = AgentInputMessageType._('normal');
  static const confirmationResponse =
      AgentInputMessageType._('confirmation_response');

  final String value;

  const AgentInputMessageType._(this.value);

  static const values = [normal, confirmationResponse];

  static AgentInputMessageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AgentInputMessageType._(value));

  @override
  bool operator ==(other) =>
      other is AgentInputMessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

  /// The analytics configuration for the data store.
  final AnalyticsConfiguration? analyticsConfiguration;

  /// The time the data store was created.
  final DateTime? createdAt;

  /// The data store name.
  final String? datastoreName;

  /// The error cause for the current data store operation.
  final ErrorCause? errorCause;

  /// The identity provider selected during data store creation.
  final IdentityProviderConfiguration? identityProviderConfiguration;

  /// The natural language processing (NLP) configuration for the data store.
  final NlpConfiguration? nlpConfiguration;

  /// The preloaded Synthea data configuration for the data store.
  final PreloadDataConfig? preloadDataConfig;

  /// The profile configuration for the data store.
  final ProfileConfiguration? profileConfiguration;

  /// The server-side encryption key configuration for a customer provided
  /// encryption key.
  final SseConfiguration? sseConfiguration;

  DatastoreProperties({
    required this.datastoreArn,
    required this.datastoreEndpoint,
    required this.datastoreId,
    required this.datastoreStatus,
    required this.datastoreTypeVersion,
    this.analyticsConfiguration,
    this.createdAt,
    this.datastoreName,
    this.errorCause,
    this.identityProviderConfiguration,
    this.nlpConfiguration,
    this.preloadDataConfig,
    this.profileConfiguration,
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
      analyticsConfiguration: json['AnalyticsConfiguration'] != null
          ? AnalyticsConfiguration.fromJson(
              json['AnalyticsConfiguration'] as Map<String, dynamic>)
          : null,
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
      nlpConfiguration: json['NlpConfiguration'] != null
          ? NlpConfiguration.fromJson(
              json['NlpConfiguration'] as Map<String, dynamic>)
          : null,
      preloadDataConfig: json['PreloadDataConfig'] != null
          ? PreloadDataConfig.fromJson(
              json['PreloadDataConfig'] as Map<String, dynamic>)
          : null,
      profileConfiguration: json['ProfileConfiguration'] != null
          ? ProfileConfiguration.fromJson(
              json['ProfileConfiguration'] as Map<String, dynamic>)
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
    final analyticsConfiguration = this.analyticsConfiguration;
    final createdAt = this.createdAt;
    final datastoreName = this.datastoreName;
    final errorCause = this.errorCause;
    final identityProviderConfiguration = this.identityProviderConfiguration;
    final nlpConfiguration = this.nlpConfiguration;
    final preloadDataConfig = this.preloadDataConfig;
    final profileConfiguration = this.profileConfiguration;
    final sseConfiguration = this.sseConfiguration;
    return {
      'DatastoreArn': datastoreArn,
      'DatastoreEndpoint': datastoreEndpoint,
      'DatastoreId': datastoreId,
      'DatastoreStatus': datastoreStatus.value,
      'DatastoreTypeVersion': datastoreTypeVersion.value,
      if (analyticsConfiguration != null)
        'AnalyticsConfiguration': analyticsConfiguration,
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (datastoreName != null) 'DatastoreName': datastoreName,
      if (errorCause != null) 'ErrorCause': errorCause,
      if (identityProviderConfiguration != null)
        'IdentityProviderConfiguration': identityProviderConfiguration,
      if (nlpConfiguration != null) 'NlpConfiguration': nlpConfiguration,
      if (preloadDataConfig != null) 'PreloadDataConfig': preloadDataConfig,
      if (profileConfiguration != null)
        'ProfileConfiguration': profileConfiguration,
      if (sseConfiguration != null) 'SseConfiguration': sseConfiguration,
    };
  }
}

/// The status of a data store.
///
/// @nodoc
class DatastoreStatus {
  static const creating = DatastoreStatus._('CREATING');
  static const active = DatastoreStatus._('ACTIVE');
  static const deleting = DatastoreStatus._('DELETING');
  static const deleted = DatastoreStatus._('DELETED');
  static const createFailed = DatastoreStatus._('CREATE_FAILED');
  static const updating = DatastoreStatus._('UPDATING');
  static const updateFailed = DatastoreStatus._('UPDATE_FAILED');

  final String value;

  const DatastoreStatus._(this.value);

  static const values = [
    creating,
    active,
    deleting,
    deleted,
    createFailed,
    updating,
    updateFailed
  ];

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

/// The FHIR version supported by the data store.
///
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

/// The natural language processing (NLP) configuration for a data store.
///
/// @nodoc
class NlpConfiguration {
  /// The status of the NLP configuration.
  final NlpStatus? status;

  NlpConfiguration({
    this.status,
  });

  factory NlpConfiguration.fromJson(Map<String, dynamic> json) {
    return NlpConfiguration(
      status: (json['Status'] as String?)?.let(NlpStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.value,
    };
  }
}

/// The analytics configuration for a data store.
///
/// @nodoc
class AnalyticsConfiguration {
  /// The status of the analytics configuration.
  final AnalyticsStatus? status;

  AnalyticsConfiguration({
    this.status,
  });

  factory AnalyticsConfiguration.fromJson(Map<String, dynamic> json) {
    return AnalyticsConfiguration(
      status: (json['Status'] as String?)?.let(AnalyticsStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.value,
    };
  }
}

/// The profile configuration for a data store.
///
/// @nodoc
class ProfileConfiguration {
  /// The list of default profiles for the data store.
  final List<String>? defaultProfiles;

  ProfileConfiguration({
    this.defaultProfiles,
  });

  factory ProfileConfiguration.fromJson(Map<String, dynamic> json) {
    return ProfileConfiguration(
      defaultProfiles: (json['DefaultProfiles'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultProfiles = this.defaultProfiles;
    return {
      if (defaultProfiles != null) 'DefaultProfiles': defaultProfiles,
    };
  }
}

/// @nodoc
class AnalyticsStatus {
  static const enabled = AnalyticsStatus._('ENABLED');
  static const enabling = AnalyticsStatus._('ENABLING');
  static const disabled = AnalyticsStatus._('DISABLED');
  static const disabling = AnalyticsStatus._('DISABLING');
  static const pausing = AnalyticsStatus._('PAUSING');
  static const paused = AnalyticsStatus._('PAUSED');

  final String value;

  const AnalyticsStatus._(this.value);

  static const values = [
    enabled,
    enabling,
    disabled,
    disabling,
    pausing,
    paused
  ];

  static AnalyticsStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AnalyticsStatus._(value));

  @override
  bool operator ==(other) => other is AnalyticsStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class NlpStatus {
  static const enabled = NlpStatus._('ENABLED');
  static const enabling = NlpStatus._('ENABLING');
  static const disabled = NlpStatus._('DISABLED');
  static const disabling = NlpStatus._('DISABLING');

  final String value;

  const NlpStatus._(this.value);

  static const values = [enabled, enabling, disabled, disabling];

  static NlpStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => NlpStatus._(value));

  @override
  bool operator ==(other) => other is NlpStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

/// The type of preloaded data.
///
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

/// @nodoc
class TargetFormat {
  static const fhirR4 = TargetFormat._('FHIR_R4');

  final String value;

  const TargetFormat._(this.value);

  static const values = [fhirR4];

  static TargetFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TargetFormat._(value));

  @override
  bool operator ==(other) => other is TargetFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

/// The status of a job.
///
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

/// The level of FHIR validation to apply.
///
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

/// @nodoc
class TransformationJobStatus {
  static const submitted = TransformationJobStatus._('SUBMITTED');
  static const queued = TransformationJobStatus._('QUEUED');
  static const inProgress = TransformationJobStatus._('IN_PROGRESS');
  static const completed = TransformationJobStatus._('COMPLETED');
  static const completedWithErrors =
      TransformationJobStatus._('COMPLETED_WITH_ERRORS');
  static const failed = TransformationJobStatus._('FAILED');

  final String value;

  const TransformationJobStatus._(this.value);

  static const values = [
    submitted,
    queued,
    inProgress,
    completed,
    completedWithErrors,
    failed
  ];

  static TransformationJobStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TransformationJobStatus._(value));

  @override
  bool operator ==(other) =>
      other is TransformationJobStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The Amazon S3 location and source format configuration for input data in a
/// transformation job.
///
/// @nodoc
class TransformationInputDataConfig {
  /// The Amazon S3 URI of the input data to transform.
  final String s3Uri;

  /// The format of the source data files (C-CDA or CSV).
  final SourceFormat? sourceFormat;

  TransformationInputDataConfig({
    required this.s3Uri,
    this.sourceFormat,
  });

  factory TransformationInputDataConfig.fromJson(Map<String, dynamic> json) {
    return TransformationInputDataConfig(
      s3Uri: (json['S3Uri'] as String?) ?? '',
      sourceFormat:
          (json['SourceFormat'] as String?)?.let(SourceFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    final sourceFormat = this.sourceFormat;
    return {
      'S3Uri': s3Uri,
      if (sourceFormat != null) 'SourceFormat': sourceFormat.value,
    };
  }
}

/// The Amazon S3 output location and encryption configuration for a
/// transformation job.
///
/// @nodoc
class TransformationOutputDataConfig {
  /// The Amazon S3 output location and AWS Key Management Service (AWS KMS)
  /// encryption configuration.
  final DataTransformationS3Configuration s3Configuration;

  TransformationOutputDataConfig({
    required this.s3Configuration,
  });

  factory TransformationOutputDataConfig.fromJson(Map<String, dynamic> json) {
    return TransformationOutputDataConfig(
      s3Configuration: DataTransformationS3Configuration.fromJson(
          (json['S3Configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final s3Configuration = this.s3Configuration;
    return {
      'S3Configuration': s3Configuration,
    };
  }
}

/// The Amazon S3 output configuration for a data transformation job, including
/// the output location and encryption settings.
///
/// @nodoc
class DataTransformationS3Configuration {
  /// The AWS Key Management Service (AWS KMS) key identifier used to encrypt the
  /// transformation job output written to Amazon S3.
  final String kmsKeyId;

  /// The Amazon S3 URI where AWS HealthLake writes the converted output files.
  final String s3Uri;

  DataTransformationS3Configuration({
    required this.kmsKeyId,
    required this.s3Uri,
  });

  factory DataTransformationS3Configuration.fromJson(
      Map<String, dynamic> json) {
    return DataTransformationS3Configuration(
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

  /// Number of CCDA files successfully transformed during the import's
  /// transformation phase. Populated only for import jobs that use the
  /// two-Step-Function (transformation + ingestion) flow; null for legacy
  /// single-SF imports and for pure FHIR imports that skip transformation.
  final int? totalFilesConverted;

  /// The number of files that failed to be read from the S3 input bucket due to
  /// customer error.
  final int? totalNumberOfFilesReadWithCustomerError;

  /// The number of files imported.
  final int? totalNumberOfImportedFiles;

  /// The number of non-FHIR files imported.
  final int? totalNumberOfImportedNonFhirFiles;

  /// The number of non-FHIR files that failed to be read from the S3 input bucket
  /// due to customer error.
  final int? totalNumberOfNonFhirFilesReadWithCustomerError;

  /// The number of non-FHIR resources imported.
  final int? totalNumberOfNonFhirResourcesImported;

  /// The number of non-FHIR resources scanned from the S3 input bucket.
  final int? totalNumberOfNonFhirResourcesScanned;

  /// The number of non-FHIR resources that failed due to customer error.
  final int? totalNumberOfNonFhirResourcesWithCustomerError;

  /// The number of resources imported.
  final int? totalNumberOfResourcesImported;

  /// The number of resources scanned from the S3 input bucket.
  final int? totalNumberOfResourcesScanned;

  /// The number of resources that failed due to customer error.
  final int? totalNumberOfResourcesWithCustomerError;

  /// The number of files scanned from the S3 input bucket.
  final int? totalNumberOfScannedFiles;

  /// The number of non-FHIR files scanned from the S3 input bucket.
  final int? totalNumberOfScannedNonFhirFiles;

  /// Number of FHIR resources produced by the transformation phase. Populated
  /// only for import jobs that use the two-Step-Function flow; null for legacy
  /// single-SF imports and for pure FHIR imports.
  final int? totalResourcesGenerated;

  /// The size (in MB) of files scanned from the S3 input bucket.
  final double? totalSizeOfScannedFilesInMB;

  /// The size (in MB) of non-FHIR files scanned from the S3 input bucket.
  final double? totalSizeOfScannedNonFhirFilesInMB;

  JobProgressReport({
    this.throughput,
    this.totalFilesConverted,
    this.totalNumberOfFilesReadWithCustomerError,
    this.totalNumberOfImportedFiles,
    this.totalNumberOfImportedNonFhirFiles,
    this.totalNumberOfNonFhirFilesReadWithCustomerError,
    this.totalNumberOfNonFhirResourcesImported,
    this.totalNumberOfNonFhirResourcesScanned,
    this.totalNumberOfNonFhirResourcesWithCustomerError,
    this.totalNumberOfResourcesImported,
    this.totalNumberOfResourcesScanned,
    this.totalNumberOfResourcesWithCustomerError,
    this.totalNumberOfScannedFiles,
    this.totalNumberOfScannedNonFhirFiles,
    this.totalResourcesGenerated,
    this.totalSizeOfScannedFilesInMB,
    this.totalSizeOfScannedNonFhirFilesInMB,
  });

  factory JobProgressReport.fromJson(Map<String, dynamic> json) {
    return JobProgressReport(
      throughput: _s.parseJsonDouble(json['Throughput']),
      totalFilesConverted: json['TotalFilesConverted'] as int?,
      totalNumberOfFilesReadWithCustomerError:
          json['TotalNumberOfFilesReadWithCustomerError'] as int?,
      totalNumberOfImportedFiles: json['TotalNumberOfImportedFiles'] as int?,
      totalNumberOfImportedNonFhirFiles:
          json['TotalNumberOfImportedNonFhirFiles'] as int?,
      totalNumberOfNonFhirFilesReadWithCustomerError:
          json['TotalNumberOfNonFhirFilesReadWithCustomerError'] as int?,
      totalNumberOfNonFhirResourcesImported:
          json['TotalNumberOfNonFhirResourcesImported'] as int?,
      totalNumberOfNonFhirResourcesScanned:
          json['TotalNumberOfNonFhirResourcesScanned'] as int?,
      totalNumberOfNonFhirResourcesWithCustomerError:
          json['TotalNumberOfNonFhirResourcesWithCustomerError'] as int?,
      totalNumberOfResourcesImported:
          json['TotalNumberOfResourcesImported'] as int?,
      totalNumberOfResourcesScanned:
          json['TotalNumberOfResourcesScanned'] as int?,
      totalNumberOfResourcesWithCustomerError:
          json['TotalNumberOfResourcesWithCustomerError'] as int?,
      totalNumberOfScannedFiles: json['TotalNumberOfScannedFiles'] as int?,
      totalNumberOfScannedNonFhirFiles:
          json['TotalNumberOfScannedNonFhirFiles'] as int?,
      totalResourcesGenerated: json['TotalResourcesGenerated'] as int?,
      totalSizeOfScannedFilesInMB:
          _s.parseJsonDouble(json['TotalSizeOfScannedFilesInMB']),
      totalSizeOfScannedNonFhirFilesInMB:
          _s.parseJsonDouble(json['TotalSizeOfScannedNonFhirFilesInMB']),
    );
  }

  Map<String, dynamic> toJson() {
    final throughput = this.throughput;
    final totalFilesConverted = this.totalFilesConverted;
    final totalNumberOfFilesReadWithCustomerError =
        this.totalNumberOfFilesReadWithCustomerError;
    final totalNumberOfImportedFiles = this.totalNumberOfImportedFiles;
    final totalNumberOfImportedNonFhirFiles =
        this.totalNumberOfImportedNonFhirFiles;
    final totalNumberOfNonFhirFilesReadWithCustomerError =
        this.totalNumberOfNonFhirFilesReadWithCustomerError;
    final totalNumberOfNonFhirResourcesImported =
        this.totalNumberOfNonFhirResourcesImported;
    final totalNumberOfNonFhirResourcesScanned =
        this.totalNumberOfNonFhirResourcesScanned;
    final totalNumberOfNonFhirResourcesWithCustomerError =
        this.totalNumberOfNonFhirResourcesWithCustomerError;
    final totalNumberOfResourcesImported = this.totalNumberOfResourcesImported;
    final totalNumberOfResourcesScanned = this.totalNumberOfResourcesScanned;
    final totalNumberOfResourcesWithCustomerError =
        this.totalNumberOfResourcesWithCustomerError;
    final totalNumberOfScannedFiles = this.totalNumberOfScannedFiles;
    final totalNumberOfScannedNonFhirFiles =
        this.totalNumberOfScannedNonFhirFiles;
    final totalResourcesGenerated = this.totalResourcesGenerated;
    final totalSizeOfScannedFilesInMB = this.totalSizeOfScannedFilesInMB;
    final totalSizeOfScannedNonFhirFilesInMB =
        this.totalSizeOfScannedNonFhirFilesInMB;
    return {
      if (throughput != null) 'Throughput': _s.encodeJsonDouble(throughput),
      if (totalFilesConverted != null)
        'TotalFilesConverted': totalFilesConverted,
      if (totalNumberOfFilesReadWithCustomerError != null)
        'TotalNumberOfFilesReadWithCustomerError':
            totalNumberOfFilesReadWithCustomerError,
      if (totalNumberOfImportedFiles != null)
        'TotalNumberOfImportedFiles': totalNumberOfImportedFiles,
      if (totalNumberOfImportedNonFhirFiles != null)
        'TotalNumberOfImportedNonFhirFiles': totalNumberOfImportedNonFhirFiles,
      if (totalNumberOfNonFhirFilesReadWithCustomerError != null)
        'TotalNumberOfNonFhirFilesReadWithCustomerError':
            totalNumberOfNonFhirFilesReadWithCustomerError,
      if (totalNumberOfNonFhirResourcesImported != null)
        'TotalNumberOfNonFhirResourcesImported':
            totalNumberOfNonFhirResourcesImported,
      if (totalNumberOfNonFhirResourcesScanned != null)
        'TotalNumberOfNonFhirResourcesScanned':
            totalNumberOfNonFhirResourcesScanned,
      if (totalNumberOfNonFhirResourcesWithCustomerError != null)
        'TotalNumberOfNonFhirResourcesWithCustomerError':
            totalNumberOfNonFhirResourcesWithCustomerError,
      if (totalNumberOfResourcesImported != null)
        'TotalNumberOfResourcesImported': totalNumberOfResourcesImported,
      if (totalNumberOfResourcesScanned != null)
        'TotalNumberOfResourcesScanned': totalNumberOfResourcesScanned,
      if (totalNumberOfResourcesWithCustomerError != null)
        'TotalNumberOfResourcesWithCustomerError':
            totalNumberOfResourcesWithCustomerError,
      if (totalNumberOfScannedFiles != null)
        'TotalNumberOfScannedFiles': totalNumberOfScannedFiles,
      if (totalNumberOfScannedNonFhirFiles != null)
        'TotalNumberOfScannedNonFhirFiles': totalNumberOfScannedNonFhirFiles,
      if (totalResourcesGenerated != null)
        'TotalResourcesGenerated': totalResourcesGenerated,
      if (totalSizeOfScannedFilesInMB != null)
        'TotalSizeOfScannedFilesInMB':
            _s.encodeJsonDouble(totalSizeOfScannedFilesInMB),
      if (totalSizeOfScannedNonFhirFilesInMB != null)
        'TotalSizeOfScannedNonFhirFilesInMB':
            _s.encodeJsonDouble(totalSizeOfScannedNonFhirFilesInMB),
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

/// Contains summary information about a specific version of a data
/// transformation profile. To retrieve profile content, call
/// <code>GetDataTransformationProfile</code>.
///
/// @nodoc
class DataTransformationProfileVersionSummary {
  /// The unique identifier of the profile.
  final String profileId;

  /// The source data format that this profile converts from.
  final SourceFormat sourceFormat;

  /// The target output format of the profile.
  final TargetFormat targetFormat;

  /// The version number.
  final int version;

  /// A description of what changed in this version.
  final String? changeDescription;

  /// The timestamp when this version was last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the profile.
  final String? profileName;

  DataTransformationProfileVersionSummary({
    required this.profileId,
    required this.sourceFormat,
    required this.targetFormat,
    required this.version,
    this.changeDescription,
    this.lastUpdatedAt,
    this.profileName,
  });

  factory DataTransformationProfileVersionSummary.fromJson(
      Map<String, dynamic> json) {
    return DataTransformationProfileVersionSummary(
      profileId: (json['ProfileId'] as String?) ?? '',
      sourceFormat:
          SourceFormat.fromString((json['SourceFormat'] as String?) ?? ''),
      targetFormat:
          TargetFormat.fromString((json['TargetFormat'] as String?) ?? ''),
      version: (json['Version'] as int?) ?? 0,
      changeDescription: json['ChangeDescription'] as String?,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      profileName: json['ProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    final sourceFormat = this.sourceFormat;
    final targetFormat = this.targetFormat;
    final version = this.version;
    final changeDescription = this.changeDescription;
    final lastUpdatedAt = this.lastUpdatedAt;
    final profileName = this.profileName;
    return {
      'ProfileId': profileId,
      'SourceFormat': sourceFormat.value,
      'TargetFormat': targetFormat.value,
      'Version': version,
      if (changeDescription != null) 'ChangeDescription': changeDescription,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (profileName != null) 'ProfileName': profileName,
    };
  }
}

/// Contains summary information about a data transformation profile. To
/// retrieve profile content, call <code>GetDataTransformationProfile</code>.
///
/// @nodoc
class DataTransformationProfileSummary {
  /// The unique identifier of the profile.
  final String profileId;

  /// The source data format that this profile converts from.
  final SourceFormat sourceFormat;

  /// The target output format of the profile.
  final TargetFormat targetFormat;

  /// The latest version number of the profile.
  final int version;

  /// The timestamp when the profile was last updated.
  final DateTime? lastUpdatedAt;

  /// A description of the profile's purpose.
  final String? profileDescription;

  /// The name of the profile.
  final String? profileName;

  DataTransformationProfileSummary({
    required this.profileId,
    required this.sourceFormat,
    required this.targetFormat,
    required this.version,
    this.lastUpdatedAt,
    this.profileDescription,
    this.profileName,
  });

  factory DataTransformationProfileSummary.fromJson(Map<String, dynamic> json) {
    return DataTransformationProfileSummary(
      profileId: (json['ProfileId'] as String?) ?? '',
      sourceFormat:
          SourceFormat.fromString((json['SourceFormat'] as String?) ?? ''),
      targetFormat:
          TargetFormat.fromString((json['TargetFormat'] as String?) ?? ''),
      version: (json['Version'] as int?) ?? 0,
      lastUpdatedAt: timeStampFromJson(json['LastUpdatedAt']),
      profileDescription: json['ProfileDescription'] as String?,
      profileName: json['ProfileName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    final sourceFormat = this.sourceFormat;
    final targetFormat = this.targetFormat;
    final version = this.version;
    final lastUpdatedAt = this.lastUpdatedAt;
    final profileDescription = this.profileDescription;
    final profileName = this.profileName;
    return {
      'ProfileId': profileId,
      'SourceFormat': sourceFormat.value,
      'TargetFormat': targetFormat.value,
      'Version': version,
      if (lastUpdatedAt != null)
        'LastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (profileDescription != null) 'ProfileDescription': profileDescription,
      if (profileName != null) 'ProfileName': profileName,
    };
  }
}

/// Contains summary information about a data transformation job. To retrieve
/// full job details, call <code>DescribeDataTransformationJob</code>.
///
/// @nodoc
class TransformationJobSummary {
  /// The unique identifier of the job.
  final String jobId;

  /// The current status of the job.
  final TransformationJobStatus jobStatus;

  /// The timestamp when the job was submitted.
  final DateTime submitTime;

  /// The timestamp when the job completed.
  final DateTime? endTime;

  /// The name of the job.
  final String? jobName;

  /// The source data format for this job.
  final SourceFormat? sourceFormat;

  TransformationJobSummary({
    required this.jobId,
    required this.jobStatus,
    required this.submitTime,
    this.endTime,
    this.jobName,
    this.sourceFormat,
  });

  factory TransformationJobSummary.fromJson(Map<String, dynamic> json) {
    return TransformationJobSummary(
      jobId: (json['JobId'] as String?) ?? '',
      jobStatus: TransformationJobStatus.fromString(
          (json['JobStatus'] as String?) ?? ''),
      submitTime: nonNullableTimeStampFromJson(json['SubmitTime'] ?? 0),
      endTime: timeStampFromJson(json['EndTime']),
      jobName: json['JobName'] as String?,
      sourceFormat:
          (json['SourceFormat'] as String?)?.let(SourceFormat.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final submitTime = this.submitTime;
    final endTime = this.endTime;
    final jobName = this.jobName;
    final sourceFormat = this.sourceFormat;
    return {
      'JobId': jobId,
      'JobStatus': jobStatus.value,
      'SubmitTime': unixTimestampToJson(submitTime),
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (jobName != null) 'JobName': jobName,
      if (sourceFormat != null) 'SourceFormat': sourceFormat.value,
    };
  }
}

/// Contains the properties of a data transformation job, including its status,
/// configuration, and progress information. You retrieve this structure by
/// calling <code>DescribeDataTransformationJob</code>.
///
/// @nodoc
class TransformationJobProperties {
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants AWS HealthLake access to the specified Amazon S3
  /// locations. AWS HealthLake assumes this role to read input files and write
  /// output files.
  final String dataAccessRoleArn;

  /// The Amazon S3 location and format of the source files for this job.
  final TransformationInputDataConfig inputDataConfig;

  /// The unique identifier of the data transformation job.
  final String jobId;

  /// The current status of the data transformation job.
  final TransformationJobStatus jobStatus;

  /// The Amazon S3 location and encryption configuration for the converted
  /// output.
  final TransformationOutputDataConfig outputDataConfig;

  /// The timestamp when the job was submitted.
  final DateTime submitTime;

  /// Specifies whether drift detection is enabled for this job. When enabled, AWS
  /// HealthLake writes a drift report to the output Amazon S3 location alongside
  /// the converted files.
  final bool? driftDetectionEnabled;

  /// The timestamp when the job completed or failed.
  final DateTime? endTime;

  /// The name of the data transformation job.
  final String? jobName;

  /// The progress report for the data transformation job, including counts of
  /// files processed and resources generated.
  final TransformationJobProgressReport? jobProgressReport;

  /// An informational message about the job, such as an error description if the
  /// job failed.
  final String? message;

  /// The unique identifier of the data transformation profile used for this job.
  final String? profileId;

  /// The name of the data transformation profile used for this job.
  final String? profileName;

  /// The version number of the data transformation profile used for this job.
  final int? profileVersion;

  /// Specifies whether FHIR R4 Provenance resource generation is enabled for this
  /// transformation job. When provenance is enabled, the service also generates
  /// related DocumentReference and Device resources.
  final bool? provenanceEnabled;

  TransformationJobProperties({
    required this.dataAccessRoleArn,
    required this.inputDataConfig,
    required this.jobId,
    required this.jobStatus,
    required this.outputDataConfig,
    required this.submitTime,
    this.driftDetectionEnabled,
    this.endTime,
    this.jobName,
    this.jobProgressReport,
    this.message,
    this.profileId,
    this.profileName,
    this.profileVersion,
    this.provenanceEnabled,
  });

  factory TransformationJobProperties.fromJson(Map<String, dynamic> json) {
    return TransformationJobProperties(
      dataAccessRoleArn: (json['DataAccessRoleArn'] as String?) ?? '',
      inputDataConfig: TransformationInputDataConfig.fromJson(
          (json['InputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      jobId: (json['JobId'] as String?) ?? '',
      jobStatus: TransformationJobStatus.fromString(
          (json['JobStatus'] as String?) ?? ''),
      outputDataConfig: TransformationOutputDataConfig.fromJson(
          (json['OutputDataConfig'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      submitTime: nonNullableTimeStampFromJson(json['SubmitTime'] ?? 0),
      driftDetectionEnabled: json['DriftDetectionEnabled'] as bool?,
      endTime: timeStampFromJson(json['EndTime']),
      jobName: json['JobName'] as String?,
      jobProgressReport: json['JobProgressReport'] != null
          ? TransformationJobProgressReport.fromJson(
              json['JobProgressReport'] as Map<String, dynamic>)
          : null,
      message: json['Message'] as String?,
      profileId: json['ProfileId'] as String?,
      profileName: json['ProfileName'] as String?,
      profileVersion: json['ProfileVersion'] as int?,
      provenanceEnabled: json['ProvenanceEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final inputDataConfig = this.inputDataConfig;
    final jobId = this.jobId;
    final jobStatus = this.jobStatus;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    final driftDetectionEnabled = this.driftDetectionEnabled;
    final endTime = this.endTime;
    final jobName = this.jobName;
    final jobProgressReport = this.jobProgressReport;
    final message = this.message;
    final profileId = this.profileId;
    final profileName = this.profileName;
    final profileVersion = this.profileVersion;
    final provenanceEnabled = this.provenanceEnabled;
    return {
      'DataAccessRoleArn': dataAccessRoleArn,
      'InputDataConfig': inputDataConfig,
      'JobId': jobId,
      'JobStatus': jobStatus.value,
      'OutputDataConfig': outputDataConfig,
      'SubmitTime': unixTimestampToJson(submitTime),
      if (driftDetectionEnabled != null)
        'DriftDetectionEnabled': driftDetectionEnabled,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (jobName != null) 'JobName': jobName,
      if (jobProgressReport != null) 'JobProgressReport': jobProgressReport,
      if (message != null) 'Message': message,
      if (profileId != null) 'ProfileId': profileId,
      if (profileName != null) 'ProfileName': profileName,
      if (profileVersion != null) 'ProfileVersion': profileVersion,
      if (provenanceEnabled != null) 'ProvenanceEnabled': provenanceEnabled,
    };
  }
}

/// Contains progress metrics for a data transformation job, including counts of
/// files scanned, converted, and failed.
///
/// @nodoc
class TransformationJobProgressReport {
  /// The total number of source files successfully converted.
  final int totalFilesConverted;

  /// The total number of source files that failed conversion.
  final int totalFilesFailed;

  /// The total number of source files scanned by the job.
  final int totalFilesScanned;

  /// The total number of FHIR R4 resources generated across all converted files.
  final int totalResourcesGenerated;

  TransformationJobProgressReport({
    required this.totalFilesConverted,
    required this.totalFilesFailed,
    required this.totalFilesScanned,
    required this.totalResourcesGenerated,
  });

  factory TransformationJobProgressReport.fromJson(Map<String, dynamic> json) {
    return TransformationJobProgressReport(
      totalFilesConverted: (json['TotalFilesConverted'] as int?) ?? 0,
      totalFilesFailed: (json['TotalFilesFailed'] as int?) ?? 0,
      totalFilesScanned: (json['TotalFilesScanned'] as int?) ?? 0,
      totalResourcesGenerated: (json['TotalResourcesGenerated'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final totalFilesConverted = this.totalFilesConverted;
    final totalFilesFailed = this.totalFilesFailed;
    final totalFilesScanned = this.totalFilesScanned;
    final totalResourcesGenerated = this.totalResourcesGenerated;
    return {
      'TotalFilesConverted': totalFilesConverted,
      'TotalFilesFailed': totalFilesFailed,
      'TotalFilesScanned': totalFilesScanned,
      'TotalResourcesGenerated': totalResourcesGenerated,
    };
  }
}

/// The source for initial content when creating a data transformation profile.
/// Specify exactly one variant: a built-in starter profile, an existing profile
/// version to clone, raw profile content, or a sample data file.
///
/// @nodoc
class CreateDataTransformationProfileSource {
  /// Creates the profile by cloning an existing profile at a specific version.
  final ExistingVersionedProfileSource? existingVersionedProfileId;

  /// Creates the profile from raw profile content that you provide directly. Use
  /// this variant for continuous integration and continuous delivery (CI/CD)
  /// workflows.
  final ProfileMappingSource? profileMapping;

  /// Creates the profile from a sample data file stored in Amazon S3. Valid only
  /// when the source format is Comma-separated values (CSV).
  final SampleDataSource? sampleData;

  /// Creates the profile from a built-in starter profile. Valid only when the
  /// source format is Consolidated Clinical Document Architecture (C-CDA).
  final StarterProfileSource? starterProfile;

  CreateDataTransformationProfileSource({
    this.existingVersionedProfileId,
    this.profileMapping,
    this.sampleData,
    this.starterProfile,
  });

  Map<String, dynamic> toJson() {
    final existingVersionedProfileId = this.existingVersionedProfileId;
    final profileMapping = this.profileMapping;
    final sampleData = this.sampleData;
    final starterProfile = this.starterProfile;
    return {
      if (existingVersionedProfileId != null)
        'ExistingVersionedProfileId': existingVersionedProfileId,
      if (profileMapping != null) 'ProfileMapping': profileMapping,
      if (sampleData != null) 'SampleData': sampleData,
      if (starterProfile != null) 'StarterProfile': starterProfile,
    };
  }
}

/// Identifies a built-in starter profile to use as the source when creating a
/// data transformation profile. Valid only when the source format is
/// Consolidated Clinical Document Architecture (C-CDA).
///
/// @nodoc
class StarterProfileSource {
  /// The name of the built-in starter profile.
  final String starterProfileName;

  StarterProfileSource({
    required this.starterProfileName,
  });

  Map<String, dynamic> toJson() {
    final starterProfileName = this.starterProfileName;
    return {
      'StarterProfileName': starterProfileName,
    };
  }
}

/// Identifies an existing data transformation profile and version to clone when
/// creating a new profile.
///
/// @nodoc
class ExistingVersionedProfileSource {
  /// The unique identifier of the existing profile to clone from.
  final String profileId;

  /// The version number of the existing profile to clone from.
  final int version;

  ExistingVersionedProfileSource({
    required this.profileId,
    required this.version,
  });

  Map<String, dynamic> toJson() {
    final profileId = this.profileId;
    final version = this.version;
    return {
      'ProfileId': profileId,
      'Version': version,
    };
  }
}

/// Contains raw content to use as the source when creating a data
/// transformation profile directly from a mapping.
///
/// @nodoc
class ProfileMappingSource {
  /// The content as a map of file paths to profile strings.
  final Map<String, String> profileMapping;

  ProfileMappingSource({
    required this.profileMapping,
  });

  Map<String, dynamic> toJson() {
    final profileMapping = this.profileMapping;
    return {
      'ProfileMapping': profileMapping,
    };
  }
}

/// Identifies a sample data file in Amazon S3 to use as the source when
/// creating a data transformation profile. Valid only when the source format is
/// Comma-separated values (CSV).
///
/// @nodoc
class SampleDataSource {
  /// The Amazon S3 URI of the sample data file.
  final String s3Uri;

  SampleDataSource({
    required this.s3Uri,
  });

  Map<String, dynamic> toJson() {
    final s3Uri = this.s3Uri;
    return {
      'S3Uri': s3Uri,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class AgentMessageOutOfContextException extends _s.GenericAwsException {
  AgentMessageOutOfContextException({String? type, String? message})
      : super(
            type: type,
            code: 'AgentMessageOutOfContextException',
            message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class ConversationNotFoundException extends _s.GenericAwsException {
  ConversationNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ConversationNotFoundException',
            message: message);
}

/// @nodoc
class FailedDependencyException extends _s.GenericAwsException {
  FailedDependencyException({String? type, String? message})
      : super(type: type, code: 'FailedDependencyException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class NotImplementedOperationException extends _s.GenericAwsException {
  NotImplementedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'NotImplementedOperationException',
            message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
}

/// @nodoc
class UnsupportedMIMETypeException extends _s.GenericAwsException {
  UnsupportedMIMETypeException({String? type, String? message})
      : super(
            type: type, code: 'UnsupportedMIMETypeException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'AgentMessageOutOfContextException': (type, message) =>
      AgentMessageOutOfContextException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ConversationNotFoundException': (type, message) =>
      ConversationNotFoundException(type: type, message: message),
  'FailedDependencyException': (type, message) =>
      FailedDependencyException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'NotImplementedOperationException': (type, message) =>
      NotImplementedOperationException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'UnsupportedMIMETypeException': (type, message) =>
      UnsupportedMIMETypeException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
