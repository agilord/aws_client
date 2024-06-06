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

/// Amazon Comprehend Medical extracts structured information from unstructured
/// clinical text. Use these actions to gain insight in your documents. Amazon
/// Comprehend Medical only detects entities in English language texts. Amazon
/// Comprehend Medical places limits on the sizes of files allowed for different
/// API operations. To learn more, see <a
/// href="https://docs.aws.amazon.com/comprehend-medical/latest/dev/comprehendmedical-quotas.html">Guidelines
/// and quotas</a> in the <i>Amazon Comprehend Medical Developer Guide</i>.
class ComprehendMedical {
  final _s.JsonProtocol _protocol;
  ComprehendMedical({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'comprehendmedical',
            signingName: 'comprehendmedical',
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

  /// Gets the properties associated with a medical entities detection job. Use
  /// this operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend Medical generated for the job. The
  /// <code>StartEntitiesDetectionV2Job</code> operation returns this identifier
  /// in its response.
  Future<DescribeEntitiesDetectionV2JobResponse>
      describeEntitiesDetectionV2Job({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'ComprehendMedical_20181030.DescribeEntitiesDetectionV2Job'
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
    );

    return DescribeEntitiesDetectionV2JobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with an InferICD10CM job. Use this
  /// operation to get the status of an inference job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend Medical generated for the job.
  /// <code>The StartICD10CMInferenceJob</code> operation returns this
  /// identifier in its response.
  Future<DescribeICD10CMInferenceJobResponse> describeICD10CMInferenceJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.DescribeICD10CMInferenceJob'
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
    );

    return DescribeICD10CMInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with a protected health information (PHI)
  /// detection job. Use this operation to get the status of a detection job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend Medical generated for the job. The
  /// <code>StartPHIDetectionJob</code> operation returns this identifier in its
  /// response.
  Future<DescribePHIDetectionJobResponse> describePHIDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.DescribePHIDetectionJob'
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
    );

    return DescribePHIDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with an InferRxNorm job. Use this operation
  /// to get the status of an inference job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend Medical generated for the job. The
  /// StartRxNormInferenceJob operation returns this identifier in its response.
  Future<DescribeRxNormInferenceJobResponse> describeRxNormInferenceJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.DescribeRxNormInferenceJob'
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
    );

    return DescribeRxNormInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets the properties associated with an InferSNOMEDCT job. Use this
  /// operation to get the status of an inference job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Comprehend Medical generated for the job. The
  /// StartSNOMEDCTInferenceJob operation returns this identifier in its
  /// response.
  Future<DescribeSNOMEDCTInferenceJobResponse> describeSNOMEDCTInferenceJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.DescribeSNOMEDCTInferenceJob'
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
    );

    return DescribeSNOMEDCTInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// The <code>DetectEntities</code> operation is deprecated. You should use
  /// the <a>DetectEntitiesV2</a> operation instead.
  ///
  /// Inspects the clinical text for a variety of medical entities and returns
  /// specific information about them such as entity category, location, and
  /// confidence score on that information.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidEncodingException].
  /// May throw [TextSizeLimitExceededException].
  ///
  /// Parameter [text] :
  /// A UTF-8 text string containing the clinical content being examined for
  /// entities.
  @Deprecated('This operation is deprecated, use DetectEntitiesV2 instead.')
  Future<DetectEntitiesResponse> detectEntities({
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.DetectEntities'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
      },
    );

    return DetectEntitiesResponse.fromJson(jsonResponse.body);
  }

  /// Inspects the clinical text for a variety of medical entities and returns
  /// specific information about them such as entity category, location, and
  /// confidence score on that information. Amazon Comprehend Medical only
  /// detects medical entities in English language texts.
  ///
  /// The <code>DetectEntitiesV2</code> operation replaces the
  /// <a>DetectEntities</a> operation. This new action uses a different model
  /// for determining the entities in your medical text and changes the way that
  /// some entities are returned in the output. You should use the
  /// <code>DetectEntitiesV2</code> operation in all new applications.
  ///
  /// The <code>DetectEntitiesV2</code> operation returns the
  /// <code>Acuity</code> and <code>Direction</code> entities as attributes
  /// instead of types.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidEncodingException].
  /// May throw [TextSizeLimitExceededException].
  ///
  /// Parameter [text] :
  /// A UTF-8 string containing the clinical content being examined for
  /// entities.
  Future<DetectEntitiesV2Response> detectEntitiesV2({
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.DetectEntitiesV2'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
      },
    );

    return DetectEntitiesV2Response.fromJson(jsonResponse.body);
  }

  /// Inspects the clinical text for protected health information (PHI) entities
  /// and returns the entity category, location, and confidence score for each
  /// entity. Amazon Comprehend Medical only detects entities in English
  /// language texts.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidEncodingException].
  /// May throw [TextSizeLimitExceededException].
  ///
  /// Parameter [text] :
  /// A UTF-8 text string containing the clinical content being examined for PHI
  /// entities.
  Future<DetectPHIResponse> detectPHI({
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.DetectPHI'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
      },
    );

    return DetectPHIResponse.fromJson(jsonResponse.body);
  }

  /// InferICD10CM detects medical conditions as entities listed in a patient
  /// record and links those entities to normalized concept identifiers in the
  /// ICD-10-CM knowledge base from the Centers for Disease Control. Amazon
  /// Comprehend Medical only detects medical entities in English language
  /// texts.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidEncodingException].
  /// May throw [TextSizeLimitExceededException].
  ///
  /// Parameter [text] :
  /// The input text used for analysis.
  Future<InferICD10CMResponse> inferICD10CM({
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.InferICD10CM'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
      },
    );

    return InferICD10CMResponse.fromJson(jsonResponse.body);
  }

  /// InferRxNorm detects medications as entities listed in a patient record and
  /// links to the normalized concept identifiers in the RxNorm database from
  /// the National Library of Medicine. Amazon Comprehend Medical only detects
  /// medical entities in English language texts.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidEncodingException].
  /// May throw [TextSizeLimitExceededException].
  ///
  /// Parameter [text] :
  /// The input text used for analysis.
  Future<InferRxNormResponse> inferRxNorm({
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.InferRxNorm'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
      },
    );

    return InferRxNormResponse.fromJson(jsonResponse.body);
  }

  /// InferSNOMEDCT detects possible medical concepts as entities and links them
  /// to codes from the Systematized Nomenclature of Medicine, Clinical Terms
  /// (SNOMED-CT) ontology
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidRequestException].
  /// May throw [InvalidEncodingException].
  /// May throw [TextSizeLimitExceededException].
  ///
  /// Parameter [text] :
  /// The input text to be analyzed using InferSNOMEDCT.
  Future<InferSNOMEDCTResponse> inferSNOMEDCT({
    required String text,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.InferSNOMEDCT'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Text': text,
      },
    );

    return InferSNOMEDCTResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of medical entity detection jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs based on their
  /// names, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListEntitiesDetectionV2JobsResponse> listEntitiesDetectionV2Jobs({
    ComprehendMedicalAsyncJobFilter? filter,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.ListEntitiesDetectionV2Jobs'
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

    return ListEntitiesDetectionV2JobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of InferICD10CM jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs based on their
  /// names, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListICD10CMInferenceJobsResponse> listICD10CMInferenceJobs({
    ComprehendMedicalAsyncJobFilter? filter,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.ListICD10CMInferenceJobs'
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

    return ListICD10CMInferenceJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of protected health information (PHI) detection jobs you have
  /// submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs based on their
  /// names, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListPHIDetectionJobsResponse> listPHIDetectionJobs({
    ComprehendMedicalAsyncJobFilter? filter,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.ListPHIDetectionJobs'
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

    return ListPHIDetectionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of InferRxNorm jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// Filters the jobs that are returned. You can filter jobs based on their
  /// names, status, or the date and time that they were submitted. You can only
  /// set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// Identifies the next page of results to return.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of results to return.
  Future<ListRxNormInferenceJobsResponse> listRxNormInferenceJobs({
    ComprehendMedicalAsyncJobFilter? filter,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.ListRxNormInferenceJobs'
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

    return ListRxNormInferenceJobsResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of InferSNOMEDCT jobs a user has submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default is 100.
  ///
  /// Parameter [nextToken] :
  /// Identifies the next page of InferSNOMEDCT results to return.
  Future<ListSNOMEDCTInferenceJobsResponse> listSNOMEDCTInferenceJobs({
    ComprehendMedicalAsyncJobFilter? filter,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.ListSNOMEDCTInferenceJobs'
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

    return ListSNOMEDCTInferenceJobsResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous medical entity detection job for a collection of
  /// documents. Use the <code>DescribeEntitiesDetectionV2Job</code> operation
  /// to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend Medical read access to your input
  /// data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med">Role-Based
  /// Permissions Required for Asynchronous Operations</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// The input configuration that specifies the format and location of the
  /// input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. All documents must be in the same
  /// language. Amazon Comprehend Medical processes files in US English (en).
  ///
  /// Parameter [outputDataConfig] :
  /// The output configuration that specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend Medical generates one for you.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [kMSKey] :
  /// An AWS Key Management Service key to encrypt your output files. If you do
  /// not specify a key, the files are written in plain text.
  Future<StartEntitiesDetectionV2JobResponse> startEntitiesDetectionV2Job({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? kMSKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StartEntitiesDetectionV2Job'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (kMSKey != null) 'KMSKey': kMSKey,
      },
    );

    return StartEntitiesDetectionV2JobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous job to detect medical conditions and link them to
  /// the ICD-10-CM ontology. Use the <code>DescribeICD10CMInferenceJob</code>
  /// operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend Medical read access to your input
  /// data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med">
  /// Role-Based Permissions Required for Asynchronous Operations</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. All documents must be in the same
  /// language.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend Medical generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [kMSKey] :
  /// An AWS Key Management Service key to encrypt your output files. If you do
  /// not specify a key, the files are written in plain text.
  Future<StartICD10CMInferenceJobResponse> startICD10CMInferenceJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? kMSKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StartICD10CMInferenceJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (kMSKey != null) 'KMSKey': kMSKey,
      },
    );

    return StartICD10CMInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous job to detect protected health information (PHI).
  /// Use the <code>DescribePHIDetectionJob</code> operation to track the status
  /// of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend Medical read access to your input
  /// data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med">
  /// Role-Based Permissions Required for Asynchronous Operations</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. All documents must be in the same
  /// language.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend Medical generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [kMSKey] :
  /// An AWS Key Management Service key to encrypt your output files. If you do
  /// not specify a key, the files are written in plain text.
  Future<StartPHIDetectionJobResponse> startPHIDetectionJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? kMSKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StartPHIDetectionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (kMSKey != null) 'KMSKey': kMSKey,
      },
    );

    return StartPHIDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous job to detect medication entities and link them to
  /// the RxNorm ontology. Use the <code>DescribeRxNormInferenceJob</code>
  /// operation to track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend Medical read access to your input
  /// data. For more information, see <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/access-control-managing-permissions-med.html#auth-role-permissions-med">
  /// Role-Based Permissions Required for Asynchronous Operations</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and location of the input data for the job.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. All documents must be in the same
  /// language.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies where to send the output files.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend Medical generates one.
  ///
  /// Parameter [jobName] :
  /// The identifier of the job.
  ///
  /// Parameter [kMSKey] :
  /// An AWS Key Management Service key to encrypt your output files. If you do
  /// not specify a key, the files are written in plain text.
  Future<StartRxNormInferenceJobResponse> startRxNormInferenceJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? kMSKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StartRxNormInferenceJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (kMSKey != null) 'KMSKey': kMSKey,
      },
    );

    return StartRxNormInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous job to detect medical concepts and link them to the
  /// SNOMED-CT ontology. Use the DescribeSNOMEDCTInferenceJob operation to
  /// track the status of a job.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of the AWS Identity and Access Management
  /// (IAM) role that grants Amazon Comprehend Medical read access to your input
  /// data.
  ///
  /// Parameter [languageCode] :
  /// The language of the input documents. All documents must be in the same
  /// language.
  ///
  /// Parameter [clientRequestToken] :
  /// A unique identifier for the request. If you don't set the client request
  /// token, Amazon Comprehend Medical generates one.
  ///
  /// Parameter [jobName] :
  /// The user generated name the asynchronous InferSNOMEDCT job.
  ///
  /// Parameter [kMSKey] :
  /// An AWS Key Management Service key used to encrypt your output files. If
  /// you do not specify a key, the files are written in plain text.
  Future<StartSNOMEDCTInferenceJobResponse> startSNOMEDCTInferenceJob({
    required String dataAccessRoleArn,
    required InputDataConfig inputDataConfig,
    required LanguageCode languageCode,
    required OutputDataConfig outputDataConfig,
    String? clientRequestToken,
    String? jobName,
    String? kMSKey,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StartSNOMEDCTInferenceJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (kMSKey != null) 'KMSKey': kMSKey,
      },
    );

    return StartSNOMEDCTInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a medical entities detection job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the medical entities job to stop.
  Future<StopEntitiesDetectionV2JobResponse> stopEntitiesDetectionV2Job({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StopEntitiesDetectionV2Job'
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
    );

    return StopEntitiesDetectionV2JobResponse.fromJson(jsonResponse.body);
  }

  /// Stops an InferICD10CM inference job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the job.
  Future<StopICD10CMInferenceJobResponse> stopICD10CMInferenceJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StopICD10CMInferenceJob'
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
    );

    return StopICD10CMInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops a protected health information (PHI) detection job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the PHI detection job to stop.
  Future<StopPHIDetectionJobResponse> stopPHIDetectionJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StopPHIDetectionJob'
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
    );

    return StopPHIDetectionJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops an InferRxNorm inference job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier of the job.
  Future<StopRxNormInferenceJobResponse> stopRxNormInferenceJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StopRxNormInferenceJob'
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
    );

    return StopRxNormInferenceJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops an InferSNOMEDCT inference job in progress.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The job id of the asynchronous InferSNOMEDCT job to be stopped.
  Future<StopSNOMEDCTInferenceJobResponse> stopSNOMEDCTInferenceJob({
    required String jobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'ComprehendMedical_20181030.StopSNOMEDCTInferenceJob'
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
    );

    return StopSNOMEDCTInferenceJobResponse.fromJson(jsonResponse.body);
  }
}

/// An extracted segment of the text that is an attribute of an entity, or
/// otherwise related to an entity, such as the dosage of a medication taken. It
/// contains information about the attribute such as id, begin and end offset
/// within the input text, and the segment of the input text.
class Attribute {
  /// The 0-based character offset in the input text that shows where the
  /// attribute begins. The offset returns the UTF-8 code point in the string.
  final int? beginOffset;

  /// The category of attribute.
  final EntityType? category;

  /// The 0-based character offset in the input text that shows where the
  /// attribute ends. The offset returns the UTF-8 code point in the string.
  final int? endOffset;

  /// The numeric identifier for this attribute. This is a monotonically
  /// increasing id unique within this response rather than a global unique
  /// identifier.
  final int? id;

  /// The level of confidence that Amazon Comprehend Medical has that this
  /// attribute is correctly related to this entity.
  final double? relationshipScore;

  /// The type of relationship between the entity and attribute. Type for the
  /// relationship is <code>OVERLAP</code>, indicating that the entity occurred at
  /// the same time as the <code>Date_Expression</code>.
  final RelationshipType? relationshipType;

  /// The level of confidence that Amazon Comprehend Medical has that the segment
  /// of text is correctly recognized as an attribute.
  final double? score;

  /// The segment of input text extracted as this attribute.
  final String? text;

  /// Contextual information for this attribute.
  final List<Trait>? traits;

  /// The type of attribute.
  final EntitySubType? type;

  Attribute({
    this.beginOffset,
    this.category,
    this.endOffset,
    this.id,
    this.relationshipScore,
    this.relationshipType,
    this.score,
    this.text,
    this.traits,
    this.type,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      beginOffset: json['BeginOffset'] as int?,
      category: (json['Category'] as String?)?.toEntityType(),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      relationshipScore: json['RelationshipScore'] as double?,
      relationshipType:
          (json['RelationshipType'] as String?)?.toRelationshipType(),
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toEntitySubType(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final category = this.category;
    final endOffset = this.endOffset;
    final id = this.id;
    final relationshipScore = this.relationshipScore;
    final relationshipType = this.relationshipType;
    final score = this.score;
    final text = this.text;
    final traits = this.traits;
    final type = this.type;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (category != null) 'Category': category.toValue(),
      if (endOffset != null) 'EndOffset': endOffset,
      if (id != null) 'Id': id,
      if (relationshipScore != null) 'RelationshipScore': relationshipScore,
      if (relationshipType != null)
        'RelationshipType': relationshipType.toValue(),
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (traits != null) 'Traits': traits,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AttributeName {
  sign,
  symptom,
  diagnosis,
  negation,
  pertainsToFamily,
  hypothetical,
  lowConfidence,
  pastHistory,
  future,
}

extension AttributeNameValueExtension on AttributeName {
  String toValue() {
    switch (this) {
      case AttributeName.sign:
        return 'SIGN';
      case AttributeName.symptom:
        return 'SYMPTOM';
      case AttributeName.diagnosis:
        return 'DIAGNOSIS';
      case AttributeName.negation:
        return 'NEGATION';
      case AttributeName.pertainsToFamily:
        return 'PERTAINS_TO_FAMILY';
      case AttributeName.hypothetical:
        return 'HYPOTHETICAL';
      case AttributeName.lowConfidence:
        return 'LOW_CONFIDENCE';
      case AttributeName.pastHistory:
        return 'PAST_HISTORY';
      case AttributeName.future:
        return 'FUTURE';
    }
  }
}

extension AttributeNameFromString on String {
  AttributeName toAttributeName() {
    switch (this) {
      case 'SIGN':
        return AttributeName.sign;
      case 'SYMPTOM':
        return AttributeName.symptom;
      case 'DIAGNOSIS':
        return AttributeName.diagnosis;
      case 'NEGATION':
        return AttributeName.negation;
      case 'PERTAINS_TO_FAMILY':
        return AttributeName.pertainsToFamily;
      case 'HYPOTHETICAL':
        return AttributeName.hypothetical;
      case 'LOW_CONFIDENCE':
        return AttributeName.lowConfidence;
      case 'PAST_HISTORY':
        return AttributeName.pastHistory;
      case 'FUTURE':
        return AttributeName.future;
    }
    throw Exception('$this is not known in enum AttributeName');
  }
}

/// The number of characters in the input text to be analyzed.
class Characters {
  /// The number of characters present in the input text document as processed by
  /// Amazon Comprehend Medical.
  final int? originalTextCharacters;

  Characters({
    this.originalTextCharacters,
  });

  factory Characters.fromJson(Map<String, dynamic> json) {
    return Characters(
      originalTextCharacters: json['OriginalTextCharacters'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final originalTextCharacters = this.originalTextCharacters;
    return {
      if (originalTextCharacters != null)
        'OriginalTextCharacters': originalTextCharacters,
    };
  }
}

/// Provides information for filtering a list of detection jobs.
class ComprehendMedicalAsyncJobFilter {
  /// Filters on the name of the job.
  final String? jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  final JobStatus? jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  final DateTime? submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  final DateTime? submitTimeBefore;

  ComprehendMedicalAsyncJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });

  Map<String, dynamic> toJson() {
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final submitTimeAfter = this.submitTimeAfter;
    final submitTimeBefore = this.submitTimeBefore;
    return {
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (submitTimeAfter != null)
        'SubmitTimeAfter': unixTimestampToJson(submitTimeAfter),
      if (submitTimeBefore != null)
        'SubmitTimeBefore': unixTimestampToJson(submitTimeBefore),
    };
  }
}

/// Provides information about a detection job.
class ComprehendMedicalAsyncJobProperties {
  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend Medical read
  /// access to your input data.
  final String? dataAccessRoleArn;

  /// The time that the detection job completed.
  final DateTime? endTime;

  /// The date and time that job metadata is deleted from the server. Output files
  /// in your S3 bucket will not be deleted. After the metadata is deleted, the
  /// job will no longer appear in the results of the
  /// <code>ListEntitiesDetectionV2Job</code> or the
  /// <code>ListPHIDetectionJobs</code> operation.
  final DateTime? expirationTime;

  /// The input data configuration that you supplied when you created the
  /// detection job.
  final InputDataConfig? inputDataConfig;

  /// The identifier assigned to the detection job.
  final String? jobId;

  /// The name that you assigned to the detection job.
  final String? jobName;

  /// The current status of the detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  final JobStatus? jobStatus;

  /// The AWS Key Management Service key, if any, used to encrypt the output
  /// files.
  final String? kMSKey;

  /// The language code of the input documents.
  final LanguageCode? languageCode;

  /// The path to the file that describes the results of a batch job.
  final String? manifestFilePath;

  /// A description of the status of a job.
  final String? message;

  /// The version of the model used to analyze the documents. The version number
  /// looks like X.X.X. You can use this information to track the model used for a
  /// particular batch of documents.
  final String? modelVersion;

  /// The output data configuration that you supplied when you created the
  /// detection job.
  final OutputDataConfig? outputDataConfig;

  /// The time that the detection job was submitted for processing.
  final DateTime? submitTime;

  ComprehendMedicalAsyncJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.expirationTime,
    this.inputDataConfig,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.kMSKey,
    this.languageCode,
    this.manifestFilePath,
    this.message,
    this.modelVersion,
    this.outputDataConfig,
    this.submitTime,
  });

  factory ComprehendMedicalAsyncJobProperties.fromJson(
      Map<String, dynamic> json) {
    return ComprehendMedicalAsyncJobProperties(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      expirationTime: timeStampFromJson(json['ExpirationTime']),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      jobId: json['JobId'] as String?,
      jobName: json['JobName'] as String?,
      jobStatus: (json['JobStatus'] as String?)?.toJobStatus(),
      kMSKey: json['KMSKey'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      manifestFilePath: json['ManifestFilePath'] as String?,
      message: json['Message'] as String?,
      modelVersion: json['ModelVersion'] as String?,
      outputDataConfig: json['OutputDataConfig'] != null
          ? OutputDataConfig.fromJson(
              json['OutputDataConfig'] as Map<String, dynamic>)
          : null,
      submitTime: timeStampFromJson(json['SubmitTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final endTime = this.endTime;
    final expirationTime = this.expirationTime;
    final inputDataConfig = this.inputDataConfig;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStatus = this.jobStatus;
    final kMSKey = this.kMSKey;
    final languageCode = this.languageCode;
    final manifestFilePath = this.manifestFilePath;
    final message = this.message;
    final modelVersion = this.modelVersion;
    final outputDataConfig = this.outputDataConfig;
    final submitTime = this.submitTime;
    return {
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (expirationTime != null)
        'ExpirationTime': unixTimestampToJson(expirationTime),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (jobId != null) 'JobId': jobId,
      if (jobName != null) 'JobName': jobName,
      if (jobStatus != null) 'JobStatus': jobStatus.toValue(),
      if (kMSKey != null) 'KMSKey': kMSKey,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (manifestFilePath != null) 'ManifestFilePath': manifestFilePath,
      if (message != null) 'Message': message,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (outputDataConfig != null) 'OutputDataConfig': outputDataConfig,
      if (submitTime != null) 'SubmitTime': unixTimestampToJson(submitTime),
    };
  }
}

class DescribeEntitiesDetectionV2JobResponse {
  /// An object that contains the properties associated with a detection job.
  final ComprehendMedicalAsyncJobProperties?
      comprehendMedicalAsyncJobProperties;

  DescribeEntitiesDetectionV2JobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });

  factory DescribeEntitiesDetectionV2JobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeEntitiesDetectionV2JobResponse(
      comprehendMedicalAsyncJobProperties:
          json['ComprehendMedicalAsyncJobProperties'] != null
              ? ComprehendMedicalAsyncJobProperties.fromJson(
                  json['ComprehendMedicalAsyncJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobProperties =
        this.comprehendMedicalAsyncJobProperties;
    return {
      if (comprehendMedicalAsyncJobProperties != null)
        'ComprehendMedicalAsyncJobProperties':
            comprehendMedicalAsyncJobProperties,
    };
  }
}

class DescribeICD10CMInferenceJobResponse {
  /// An object that contains the properties associated with a detection job.
  final ComprehendMedicalAsyncJobProperties?
      comprehendMedicalAsyncJobProperties;

  DescribeICD10CMInferenceJobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });

  factory DescribeICD10CMInferenceJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeICD10CMInferenceJobResponse(
      comprehendMedicalAsyncJobProperties:
          json['ComprehendMedicalAsyncJobProperties'] != null
              ? ComprehendMedicalAsyncJobProperties.fromJson(
                  json['ComprehendMedicalAsyncJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobProperties =
        this.comprehendMedicalAsyncJobProperties;
    return {
      if (comprehendMedicalAsyncJobProperties != null)
        'ComprehendMedicalAsyncJobProperties':
            comprehendMedicalAsyncJobProperties,
    };
  }
}

class DescribePHIDetectionJobResponse {
  /// An object that contains the properties associated with a detection job.
  final ComprehendMedicalAsyncJobProperties?
      comprehendMedicalAsyncJobProperties;

  DescribePHIDetectionJobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });

  factory DescribePHIDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribePHIDetectionJobResponse(
      comprehendMedicalAsyncJobProperties:
          json['ComprehendMedicalAsyncJobProperties'] != null
              ? ComprehendMedicalAsyncJobProperties.fromJson(
                  json['ComprehendMedicalAsyncJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobProperties =
        this.comprehendMedicalAsyncJobProperties;
    return {
      if (comprehendMedicalAsyncJobProperties != null)
        'ComprehendMedicalAsyncJobProperties':
            comprehendMedicalAsyncJobProperties,
    };
  }
}

class DescribeRxNormInferenceJobResponse {
  /// An object that contains the properties associated with a detection job.
  final ComprehendMedicalAsyncJobProperties?
      comprehendMedicalAsyncJobProperties;

  DescribeRxNormInferenceJobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });

  factory DescribeRxNormInferenceJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRxNormInferenceJobResponse(
      comprehendMedicalAsyncJobProperties:
          json['ComprehendMedicalAsyncJobProperties'] != null
              ? ComprehendMedicalAsyncJobProperties.fromJson(
                  json['ComprehendMedicalAsyncJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobProperties =
        this.comprehendMedicalAsyncJobProperties;
    return {
      if (comprehendMedicalAsyncJobProperties != null)
        'ComprehendMedicalAsyncJobProperties':
            comprehendMedicalAsyncJobProperties,
    };
  }
}

class DescribeSNOMEDCTInferenceJobResponse {
  final ComprehendMedicalAsyncJobProperties?
      comprehendMedicalAsyncJobProperties;

  DescribeSNOMEDCTInferenceJobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });

  factory DescribeSNOMEDCTInferenceJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSNOMEDCTInferenceJobResponse(
      comprehendMedicalAsyncJobProperties:
          json['ComprehendMedicalAsyncJobProperties'] != null
              ? ComprehendMedicalAsyncJobProperties.fromJson(
                  json['ComprehendMedicalAsyncJobProperties']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobProperties =
        this.comprehendMedicalAsyncJobProperties;
    return {
      if (comprehendMedicalAsyncJobProperties != null)
        'ComprehendMedicalAsyncJobProperties':
            comprehendMedicalAsyncJobProperties,
    };
  }
}

class DetectEntitiesResponse {
  /// The collection of medical entities extracted from the input text and their
  /// associated information. For each entity, the response provides the entity
  /// text, the entity category, where the entity text begins and ends, and the
  /// level of confidence that Amazon Comprehend Medical has in the detection and
  /// analysis. Attributes and traits of the entity are also returned.
  final List<Entity> entities;

  /// The version of the model used to analyze the documents. The version number
  /// looks like X.X.X. You can use this information to track the model used for a
  /// particular batch of documents.
  final String modelVersion;

  /// If the result of the previous request to <code>DetectEntities</code> was
  /// truncated, include the <code>PaginationToken</code> to fetch the next page
  /// of entities.
  final String? paginationToken;

  /// Attributes extracted from the input text that we were unable to relate to an
  /// entity.
  final List<UnmappedAttribute>? unmappedAttributes;

  DetectEntitiesResponse({
    required this.entities,
    required this.modelVersion,
    this.paginationToken,
    this.unmappedAttributes,
  });

  factory DetectEntitiesResponse.fromJson(Map<String, dynamic> json) {
    return DetectEntitiesResponse(
      entities: (json['Entities'] as List)
          .whereNotNull()
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelVersion: json['ModelVersion'] as String,
      paginationToken: json['PaginationToken'] as String?,
      unmappedAttributes: (json['UnmappedAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => UnmappedAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final modelVersion = this.modelVersion;
    final paginationToken = this.paginationToken;
    final unmappedAttributes = this.unmappedAttributes;
    return {
      'Entities': entities,
      'ModelVersion': modelVersion,
      if (paginationToken != null) 'PaginationToken': paginationToken,
      if (unmappedAttributes != null) 'UnmappedAttributes': unmappedAttributes,
    };
  }
}

class DetectEntitiesV2Response {
  /// The collection of medical entities extracted from the input text and their
  /// associated information. For each entity, the response provides the entity
  /// text, the entity category, where the entity text begins and ends, and the
  /// level of confidence in the detection and analysis. Attributes and traits of
  /// the entity are also returned.
  final List<Entity> entities;

  /// The version of the model used to analyze the documents. The version number
  /// looks like X.X.X. You can use this information to track the model used for a
  /// particular batch of documents.
  final String modelVersion;

  /// If the result to the <code>DetectEntitiesV2</code> operation was truncated,
  /// include the <code>PaginationToken</code> to fetch the next page of entities.
  final String? paginationToken;

  /// Attributes extracted from the input text that couldn't be related to an
  /// entity.
  final List<UnmappedAttribute>? unmappedAttributes;

  DetectEntitiesV2Response({
    required this.entities,
    required this.modelVersion,
    this.paginationToken,
    this.unmappedAttributes,
  });

  factory DetectEntitiesV2Response.fromJson(Map<String, dynamic> json) {
    return DetectEntitiesV2Response(
      entities: (json['Entities'] as List)
          .whereNotNull()
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelVersion: json['ModelVersion'] as String,
      paginationToken: json['PaginationToken'] as String?,
      unmappedAttributes: (json['UnmappedAttributes'] as List?)
          ?.whereNotNull()
          .map((e) => UnmappedAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final modelVersion = this.modelVersion;
    final paginationToken = this.paginationToken;
    final unmappedAttributes = this.unmappedAttributes;
    return {
      'Entities': entities,
      'ModelVersion': modelVersion,
      if (paginationToken != null) 'PaginationToken': paginationToken,
      if (unmappedAttributes != null) 'UnmappedAttributes': unmappedAttributes,
    };
  }
}

class DetectPHIResponse {
  /// The collection of PHI entities extracted from the input text and their
  /// associated information. For each entity, the response provides the entity
  /// text, the entity category, where the entity text begins and ends, and the
  /// level of confidence that Amazon Comprehend Medical has in its detection.
  final List<Entity> entities;

  /// The version of the model used to analyze the documents. The version number
  /// looks like X.X.X. You can use this information to track the model used for a
  /// particular batch of documents.
  final String modelVersion;

  /// If the result of the previous request to <code>DetectPHI</code> was
  /// truncated, include the <code>PaginationToken</code> to fetch the next page
  /// of PHI entities.
  final String? paginationToken;

  DetectPHIResponse({
    required this.entities,
    required this.modelVersion,
    this.paginationToken,
  });

  factory DetectPHIResponse.fromJson(Map<String, dynamic> json) {
    return DetectPHIResponse(
      entities: (json['Entities'] as List)
          .whereNotNull()
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelVersion: json['ModelVersion'] as String,
      paginationToken: json['PaginationToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final modelVersion = this.modelVersion;
    final paginationToken = this.paginationToken;
    return {
      'Entities': entities,
      'ModelVersion': modelVersion,
      if (paginationToken != null) 'PaginationToken': paginationToken,
    };
  }
}

/// Provides information about an extracted medical entity.
class Entity {
  /// The extracted attributes that relate to this entity.
  final List<Attribute>? attributes;

  /// The 0-based character offset in the input text that shows where the entity
  /// begins. The offset returns the UTF-8 code point in the string.
  final int? beginOffset;

  /// The category of the entity.
  final EntityType? category;

  /// The 0-based character offset in the input text that shows where the entity
  /// ends. The offset returns the UTF-8 code point in the string.
  final int? endOffset;

  /// The numeric identifier for the entity. This is a monotonically increasing id
  /// unique within this response rather than a global unique identifier.
  final int? id;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detection.
  final double? score;

  /// The segment of input text extracted as this entity.
  final String? text;

  /// Contextual information for the entity.
  final List<Trait>? traits;

  /// Describes the specific type of entity with category of entities.
  final EntitySubType? type;

  Entity({
    this.attributes,
    this.beginOffset,
    this.category,
    this.endOffset,
    this.id,
    this.score,
    this.text,
    this.traits,
    this.type,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => Attribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      beginOffset: json['BeginOffset'] as int?,
      category: (json['Category'] as String?)?.toEntityType(),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toEntitySubType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final beginOffset = this.beginOffset;
    final category = this.category;
    final endOffset = this.endOffset;
    final id = this.id;
    final score = this.score;
    final text = this.text;
    final traits = this.traits;
    final type = this.type;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (category != null) 'Category': category.toValue(),
      if (endOffset != null) 'EndOffset': endOffset,
      if (id != null) 'Id': id,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (traits != null) 'Traits': traits,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum EntitySubType {
  name,
  dxName,
  dosage,
  routeOrMode,
  form,
  frequency,
  duration,
  genericName,
  brandName,
  strength,
  rate,
  acuity,
  testName,
  testValue,
  testUnits,
  testUnit,
  procedureName,
  treatmentName,
  date,
  age,
  contactPoint,
  phoneOrFax,
  email,
  identifier,
  id,
  url,
  address,
  profession,
  systemOrganSite,
  direction,
  quality,
  quantity,
  timeExpression,
  timeToMedicationName,
  timeToDxName,
  timeToTestName,
  timeToProcedureName,
  timeToTreatmentName,
  amount,
  gender,
  raceEthnicity,
  allergies,
  tobaccoUse,
  alcoholConsumption,
  recDrugUse,
}

extension EntitySubTypeValueExtension on EntitySubType {
  String toValue() {
    switch (this) {
      case EntitySubType.name:
        return 'NAME';
      case EntitySubType.dxName:
        return 'DX_NAME';
      case EntitySubType.dosage:
        return 'DOSAGE';
      case EntitySubType.routeOrMode:
        return 'ROUTE_OR_MODE';
      case EntitySubType.form:
        return 'FORM';
      case EntitySubType.frequency:
        return 'FREQUENCY';
      case EntitySubType.duration:
        return 'DURATION';
      case EntitySubType.genericName:
        return 'GENERIC_NAME';
      case EntitySubType.brandName:
        return 'BRAND_NAME';
      case EntitySubType.strength:
        return 'STRENGTH';
      case EntitySubType.rate:
        return 'RATE';
      case EntitySubType.acuity:
        return 'ACUITY';
      case EntitySubType.testName:
        return 'TEST_NAME';
      case EntitySubType.testValue:
        return 'TEST_VALUE';
      case EntitySubType.testUnits:
        return 'TEST_UNITS';
      case EntitySubType.testUnit:
        return 'TEST_UNIT';
      case EntitySubType.procedureName:
        return 'PROCEDURE_NAME';
      case EntitySubType.treatmentName:
        return 'TREATMENT_NAME';
      case EntitySubType.date:
        return 'DATE';
      case EntitySubType.age:
        return 'AGE';
      case EntitySubType.contactPoint:
        return 'CONTACT_POINT';
      case EntitySubType.phoneOrFax:
        return 'PHONE_OR_FAX';
      case EntitySubType.email:
        return 'EMAIL';
      case EntitySubType.identifier:
        return 'IDENTIFIER';
      case EntitySubType.id:
        return 'ID';
      case EntitySubType.url:
        return 'URL';
      case EntitySubType.address:
        return 'ADDRESS';
      case EntitySubType.profession:
        return 'PROFESSION';
      case EntitySubType.systemOrganSite:
        return 'SYSTEM_ORGAN_SITE';
      case EntitySubType.direction:
        return 'DIRECTION';
      case EntitySubType.quality:
        return 'QUALITY';
      case EntitySubType.quantity:
        return 'QUANTITY';
      case EntitySubType.timeExpression:
        return 'TIME_EXPRESSION';
      case EntitySubType.timeToMedicationName:
        return 'TIME_TO_MEDICATION_NAME';
      case EntitySubType.timeToDxName:
        return 'TIME_TO_DX_NAME';
      case EntitySubType.timeToTestName:
        return 'TIME_TO_TEST_NAME';
      case EntitySubType.timeToProcedureName:
        return 'TIME_TO_PROCEDURE_NAME';
      case EntitySubType.timeToTreatmentName:
        return 'TIME_TO_TREATMENT_NAME';
      case EntitySubType.amount:
        return 'AMOUNT';
      case EntitySubType.gender:
        return 'GENDER';
      case EntitySubType.raceEthnicity:
        return 'RACE_ETHNICITY';
      case EntitySubType.allergies:
        return 'ALLERGIES';
      case EntitySubType.tobaccoUse:
        return 'TOBACCO_USE';
      case EntitySubType.alcoholConsumption:
        return 'ALCOHOL_CONSUMPTION';
      case EntitySubType.recDrugUse:
        return 'REC_DRUG_USE';
    }
  }
}

extension EntitySubTypeFromString on String {
  EntitySubType toEntitySubType() {
    switch (this) {
      case 'NAME':
        return EntitySubType.name;
      case 'DX_NAME':
        return EntitySubType.dxName;
      case 'DOSAGE':
        return EntitySubType.dosage;
      case 'ROUTE_OR_MODE':
        return EntitySubType.routeOrMode;
      case 'FORM':
        return EntitySubType.form;
      case 'FREQUENCY':
        return EntitySubType.frequency;
      case 'DURATION':
        return EntitySubType.duration;
      case 'GENERIC_NAME':
        return EntitySubType.genericName;
      case 'BRAND_NAME':
        return EntitySubType.brandName;
      case 'STRENGTH':
        return EntitySubType.strength;
      case 'RATE':
        return EntitySubType.rate;
      case 'ACUITY':
        return EntitySubType.acuity;
      case 'TEST_NAME':
        return EntitySubType.testName;
      case 'TEST_VALUE':
        return EntitySubType.testValue;
      case 'TEST_UNITS':
        return EntitySubType.testUnits;
      case 'TEST_UNIT':
        return EntitySubType.testUnit;
      case 'PROCEDURE_NAME':
        return EntitySubType.procedureName;
      case 'TREATMENT_NAME':
        return EntitySubType.treatmentName;
      case 'DATE':
        return EntitySubType.date;
      case 'AGE':
        return EntitySubType.age;
      case 'CONTACT_POINT':
        return EntitySubType.contactPoint;
      case 'PHONE_OR_FAX':
        return EntitySubType.phoneOrFax;
      case 'EMAIL':
        return EntitySubType.email;
      case 'IDENTIFIER':
        return EntitySubType.identifier;
      case 'ID':
        return EntitySubType.id;
      case 'URL':
        return EntitySubType.url;
      case 'ADDRESS':
        return EntitySubType.address;
      case 'PROFESSION':
        return EntitySubType.profession;
      case 'SYSTEM_ORGAN_SITE':
        return EntitySubType.systemOrganSite;
      case 'DIRECTION':
        return EntitySubType.direction;
      case 'QUALITY':
        return EntitySubType.quality;
      case 'QUANTITY':
        return EntitySubType.quantity;
      case 'TIME_EXPRESSION':
        return EntitySubType.timeExpression;
      case 'TIME_TO_MEDICATION_NAME':
        return EntitySubType.timeToMedicationName;
      case 'TIME_TO_DX_NAME':
        return EntitySubType.timeToDxName;
      case 'TIME_TO_TEST_NAME':
        return EntitySubType.timeToTestName;
      case 'TIME_TO_PROCEDURE_NAME':
        return EntitySubType.timeToProcedureName;
      case 'TIME_TO_TREATMENT_NAME':
        return EntitySubType.timeToTreatmentName;
      case 'AMOUNT':
        return EntitySubType.amount;
      case 'GENDER':
        return EntitySubType.gender;
      case 'RACE_ETHNICITY':
        return EntitySubType.raceEthnicity;
      case 'ALLERGIES':
        return EntitySubType.allergies;
      case 'TOBACCO_USE':
        return EntitySubType.tobaccoUse;
      case 'ALCOHOL_CONSUMPTION':
        return EntitySubType.alcoholConsumption;
      case 'REC_DRUG_USE':
        return EntitySubType.recDrugUse;
    }
    throw Exception('$this is not known in enum EntitySubType');
  }
}

enum EntityType {
  medication,
  medicalCondition,
  protectedHealthInformation,
  testTreatmentProcedure,
  anatomy,
  timeExpression,
  behavioralEnvironmentalSocial,
}

extension EntityTypeValueExtension on EntityType {
  String toValue() {
    switch (this) {
      case EntityType.medication:
        return 'MEDICATION';
      case EntityType.medicalCondition:
        return 'MEDICAL_CONDITION';
      case EntityType.protectedHealthInformation:
        return 'PROTECTED_HEALTH_INFORMATION';
      case EntityType.testTreatmentProcedure:
        return 'TEST_TREATMENT_PROCEDURE';
      case EntityType.anatomy:
        return 'ANATOMY';
      case EntityType.timeExpression:
        return 'TIME_EXPRESSION';
      case EntityType.behavioralEnvironmentalSocial:
        return 'BEHAVIORAL_ENVIRONMENTAL_SOCIAL';
    }
  }
}

extension EntityTypeFromString on String {
  EntityType toEntityType() {
    switch (this) {
      case 'MEDICATION':
        return EntityType.medication;
      case 'MEDICAL_CONDITION':
        return EntityType.medicalCondition;
      case 'PROTECTED_HEALTH_INFORMATION':
        return EntityType.protectedHealthInformation;
      case 'TEST_TREATMENT_PROCEDURE':
        return EntityType.testTreatmentProcedure;
      case 'ANATOMY':
        return EntityType.anatomy;
      case 'TIME_EXPRESSION':
        return EntityType.timeExpression;
      case 'BEHAVIORAL_ENVIRONMENTAL_SOCIAL':
        return EntityType.behavioralEnvironmentalSocial;
    }
    throw Exception('$this is not known in enum EntityType');
  }
}

/// The detected attributes that relate to an entity. This includes an extracted
/// segment of the text that is an attribute of an entity, or otherwise related
/// to an entity. InferICD10CM detects the following attributes:
/// <code>Direction</code>, <code>System, Organ or Site</code>, and
/// <code>Acuity</code>.
class ICD10CMAttribute {
  /// The 0-based character offset in the input text that shows where the
  /// attribute begins. The offset returns the UTF-8 code point in the string.
  final int? beginOffset;

  /// The category of attribute. Can be either of <code>DX_NAME</code> or
  /// <code>TIME_EXPRESSION</code>.
  final ICD10CMEntityType? category;

  /// The 0-based character offset in the input text that shows where the
  /// attribute ends. The offset returns the UTF-8 code point in the string.
  final int? endOffset;

  /// The numeric identifier for this attribute. This is a monotonically
  /// increasing id unique within this response rather than a global unique
  /// identifier.
  final int? id;

  /// The level of confidence that Amazon Comprehend Medical has that this
  /// attribute is correctly related to this entity.
  final double? relationshipScore;

  /// The type of relationship between the entity and attribute. Type for the
  /// relationship can be either of <code>OVERLAP</code> or
  /// <code>SYSTEM_ORGAN_SITE</code>.
  final ICD10CMRelationshipType? relationshipType;

  /// The level of confidence that Amazon Comprehend Medical has that the segment
  /// of text is correctly recognized as an attribute.
  final double? score;

  /// The segment of input text which contains the detected attribute.
  final String? text;

  /// The contextual information for the attribute. The traits recognized by
  /// InferICD10CM are <code>DIAGNOSIS</code>, <code>SIGN</code>,
  /// <code>SYMPTOM</code>, and <code>NEGATION</code>.
  final List<ICD10CMTrait>? traits;

  /// The type of attribute. InferICD10CM detects entities of the type
  /// <code>DX_NAME</code>.
  final ICD10CMAttributeType? type;

  ICD10CMAttribute({
    this.beginOffset,
    this.category,
    this.endOffset,
    this.id,
    this.relationshipScore,
    this.relationshipType,
    this.score,
    this.text,
    this.traits,
    this.type,
  });

  factory ICD10CMAttribute.fromJson(Map<String, dynamic> json) {
    return ICD10CMAttribute(
      beginOffset: json['BeginOffset'] as int?,
      category: (json['Category'] as String?)?.toICD10CMEntityType(),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      relationshipScore: json['RelationshipScore'] as double?,
      relationshipType:
          (json['RelationshipType'] as String?)?.toICD10CMRelationshipType(),
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => ICD10CMTrait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toICD10CMAttributeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final category = this.category;
    final endOffset = this.endOffset;
    final id = this.id;
    final relationshipScore = this.relationshipScore;
    final relationshipType = this.relationshipType;
    final score = this.score;
    final text = this.text;
    final traits = this.traits;
    final type = this.type;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (category != null) 'Category': category.toValue(),
      if (endOffset != null) 'EndOffset': endOffset,
      if (id != null) 'Id': id,
      if (relationshipScore != null) 'RelationshipScore': relationshipScore,
      if (relationshipType != null)
        'RelationshipType': relationshipType.toValue(),
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (traits != null) 'Traits': traits,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ICD10CMAttributeType {
  acuity,
  direction,
  systemOrganSite,
  quality,
  quantity,
  timeToDxName,
  timeExpression,
}

extension ICD10CMAttributeTypeValueExtension on ICD10CMAttributeType {
  String toValue() {
    switch (this) {
      case ICD10CMAttributeType.acuity:
        return 'ACUITY';
      case ICD10CMAttributeType.direction:
        return 'DIRECTION';
      case ICD10CMAttributeType.systemOrganSite:
        return 'SYSTEM_ORGAN_SITE';
      case ICD10CMAttributeType.quality:
        return 'QUALITY';
      case ICD10CMAttributeType.quantity:
        return 'QUANTITY';
      case ICD10CMAttributeType.timeToDxName:
        return 'TIME_TO_DX_NAME';
      case ICD10CMAttributeType.timeExpression:
        return 'TIME_EXPRESSION';
    }
  }
}

extension ICD10CMAttributeTypeFromString on String {
  ICD10CMAttributeType toICD10CMAttributeType() {
    switch (this) {
      case 'ACUITY':
        return ICD10CMAttributeType.acuity;
      case 'DIRECTION':
        return ICD10CMAttributeType.direction;
      case 'SYSTEM_ORGAN_SITE':
        return ICD10CMAttributeType.systemOrganSite;
      case 'QUALITY':
        return ICD10CMAttributeType.quality;
      case 'QUANTITY':
        return ICD10CMAttributeType.quantity;
      case 'TIME_TO_DX_NAME':
        return ICD10CMAttributeType.timeToDxName;
      case 'TIME_EXPRESSION':
        return ICD10CMAttributeType.timeExpression;
    }
    throw Exception('$this is not known in enum ICD10CMAttributeType');
  }
}

/// The ICD-10-CM concepts that the entity could refer to, along with a score
/// indicating the likelihood of the match.
class ICD10CMConcept {
  /// The ICD-10-CM code that identifies the concept found in the knowledge base
  /// from the Centers for Disease Control.
  final String? code;

  /// The long description of the ICD-10-CM code in the ontology.
  final String? description;

  /// The level of confidence that Amazon Comprehend Medical has that the entity
  /// is accurately linked to an ICD-10-CM concept.
  final double? score;

  ICD10CMConcept({
    this.code,
    this.description,
    this.score,
  });

  factory ICD10CMConcept.fromJson(Map<String, dynamic> json) {
    return ICD10CMConcept(
      code: json['Code'] as String?,
      description: json['Description'] as String?,
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final description = this.description;
    final score = this.score;
    return {
      if (code != null) 'Code': code,
      if (description != null) 'Description': description,
      if (score != null) 'Score': score,
    };
  }
}

/// The collection of medical entities extracted from the input text and their
/// associated information. For each entity, the response provides the entity
/// text, the entity category, where the entity text begins and ends, and the
/// level of confidence that Amazon Comprehend Medical has in the detection and
/// analysis. Attributes and traits of the entity are also returned.
class ICD10CMEntity {
  /// The detected attributes that relate to the entity. An extracted segment of
  /// the text that is an attribute of an entity, or otherwise related to an
  /// entity, such as the nature of a medical condition.
  final List<ICD10CMAttribute>? attributes;

  /// The 0-based character offset in the input text that shows where the entity
  /// begins. The offset returns the UTF-8 code point in the string.
  final int? beginOffset;

  /// The category of the entity. InferICD10CM detects entities in the
  /// <code>MEDICAL_CONDITION</code> category.
  final ICD10CMEntityCategory? category;

  /// The 0-based character offset in the input text that shows where the entity
  /// ends. The offset returns the UTF-8 code point in the string.
  final int? endOffset;

  /// The ICD-10-CM concepts that the entity could refer to, along with a score
  /// indicating the likelihood of the match.
  final List<ICD10CMConcept>? iCD10CMConcepts;

  /// The numeric identifier for the entity. This is a monotonically increasing id
  /// unique within this response rather than a global unique identifier.
  final int? id;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detection.
  final double? score;

  /// The segment of input text that is matched to the detected entity.
  final String? text;

  /// Provides Contextual information for the entity. The traits recognized by
  /// InferICD10CM are <code>DIAGNOSIS</code>, <code>SIGN</code>,
  /// <code>SYMPTOM</code>, and <code>NEGATION.</code>
  final List<ICD10CMTrait>? traits;

  /// Describes the specific type of entity with category of entities.
  /// InferICD10CM detects entities of the type <code>DX_NAME</code> and
  /// <code>TIME_EXPRESSION</code>.
  final ICD10CMEntityType? type;

  ICD10CMEntity({
    this.attributes,
    this.beginOffset,
    this.category,
    this.endOffset,
    this.iCD10CMConcepts,
    this.id,
    this.score,
    this.text,
    this.traits,
    this.type,
  });

  factory ICD10CMEntity.fromJson(Map<String, dynamic> json) {
    return ICD10CMEntity(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => ICD10CMAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      beginOffset: json['BeginOffset'] as int?,
      category: (json['Category'] as String?)?.toICD10CMEntityCategory(),
      endOffset: json['EndOffset'] as int?,
      iCD10CMConcepts: (json['ICD10CMConcepts'] as List?)
          ?.whereNotNull()
          .map((e) => ICD10CMConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['Id'] as int?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => ICD10CMTrait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toICD10CMEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final beginOffset = this.beginOffset;
    final category = this.category;
    final endOffset = this.endOffset;
    final iCD10CMConcepts = this.iCD10CMConcepts;
    final id = this.id;
    final score = this.score;
    final text = this.text;
    final traits = this.traits;
    final type = this.type;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (category != null) 'Category': category.toValue(),
      if (endOffset != null) 'EndOffset': endOffset,
      if (iCD10CMConcepts != null) 'ICD10CMConcepts': iCD10CMConcepts,
      if (id != null) 'Id': id,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (traits != null) 'Traits': traits,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ICD10CMEntityCategory {
  medicalCondition,
}

extension ICD10CMEntityCategoryValueExtension on ICD10CMEntityCategory {
  String toValue() {
    switch (this) {
      case ICD10CMEntityCategory.medicalCondition:
        return 'MEDICAL_CONDITION';
    }
  }
}

extension ICD10CMEntityCategoryFromString on String {
  ICD10CMEntityCategory toICD10CMEntityCategory() {
    switch (this) {
      case 'MEDICAL_CONDITION':
        return ICD10CMEntityCategory.medicalCondition;
    }
    throw Exception('$this is not known in enum ICD10CMEntityCategory');
  }
}

enum ICD10CMEntityType {
  dxName,
  timeExpression,
}

extension ICD10CMEntityTypeValueExtension on ICD10CMEntityType {
  String toValue() {
    switch (this) {
      case ICD10CMEntityType.dxName:
        return 'DX_NAME';
      case ICD10CMEntityType.timeExpression:
        return 'TIME_EXPRESSION';
    }
  }
}

extension ICD10CMEntityTypeFromString on String {
  ICD10CMEntityType toICD10CMEntityType() {
    switch (this) {
      case 'DX_NAME':
        return ICD10CMEntityType.dxName;
      case 'TIME_EXPRESSION':
        return ICD10CMEntityType.timeExpression;
    }
    throw Exception('$this is not known in enum ICD10CMEntityType');
  }
}

enum ICD10CMRelationshipType {
  overlap,
  systemOrganSite,
  quality,
}

extension ICD10CMRelationshipTypeValueExtension on ICD10CMRelationshipType {
  String toValue() {
    switch (this) {
      case ICD10CMRelationshipType.overlap:
        return 'OVERLAP';
      case ICD10CMRelationshipType.systemOrganSite:
        return 'SYSTEM_ORGAN_SITE';
      case ICD10CMRelationshipType.quality:
        return 'QUALITY';
    }
  }
}

extension ICD10CMRelationshipTypeFromString on String {
  ICD10CMRelationshipType toICD10CMRelationshipType() {
    switch (this) {
      case 'OVERLAP':
        return ICD10CMRelationshipType.overlap;
      case 'SYSTEM_ORGAN_SITE':
        return ICD10CMRelationshipType.systemOrganSite;
      case 'QUALITY':
        return ICD10CMRelationshipType.quality;
    }
    throw Exception('$this is not known in enum ICD10CMRelationshipType');
  }
}

/// Contextual information for the entity. The traits recognized by InferICD10CM
/// are <code>DIAGNOSIS</code>, <code>SIGN</code>, <code>SYMPTOM</code>, and
/// <code>NEGATION</code>.
class ICD10CMTrait {
  /// Provides a name or contextual description about the trait.
  final ICD10CMTraitName? name;

  /// The level of confidence that Amazon Comprehend Medical has that the segment
  /// of text is correctly recognized as a trait.
  final double? score;

  ICD10CMTrait({
    this.name,
    this.score,
  });

  factory ICD10CMTrait.fromJson(Map<String, dynamic> json) {
    return ICD10CMTrait(
      name: (json['Name'] as String?)?.toICD10CMTraitName(),
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final score = this.score;
    return {
      if (name != null) 'Name': name.toValue(),
      if (score != null) 'Score': score,
    };
  }
}

enum ICD10CMTraitName {
  negation,
  diagnosis,
  sign,
  symptom,
  pertainsToFamily,
  hypothetical,
  lowConfidence,
}

extension ICD10CMTraitNameValueExtension on ICD10CMTraitName {
  String toValue() {
    switch (this) {
      case ICD10CMTraitName.negation:
        return 'NEGATION';
      case ICD10CMTraitName.diagnosis:
        return 'DIAGNOSIS';
      case ICD10CMTraitName.sign:
        return 'SIGN';
      case ICD10CMTraitName.symptom:
        return 'SYMPTOM';
      case ICD10CMTraitName.pertainsToFamily:
        return 'PERTAINS_TO_FAMILY';
      case ICD10CMTraitName.hypothetical:
        return 'HYPOTHETICAL';
      case ICD10CMTraitName.lowConfidence:
        return 'LOW_CONFIDENCE';
    }
  }
}

extension ICD10CMTraitNameFromString on String {
  ICD10CMTraitName toICD10CMTraitName() {
    switch (this) {
      case 'NEGATION':
        return ICD10CMTraitName.negation;
      case 'DIAGNOSIS':
        return ICD10CMTraitName.diagnosis;
      case 'SIGN':
        return ICD10CMTraitName.sign;
      case 'SYMPTOM':
        return ICD10CMTraitName.symptom;
      case 'PERTAINS_TO_FAMILY':
        return ICD10CMTraitName.pertainsToFamily;
      case 'HYPOTHETICAL':
        return ICD10CMTraitName.hypothetical;
      case 'LOW_CONFIDENCE':
        return ICD10CMTraitName.lowConfidence;
    }
    throw Exception('$this is not known in enum ICD10CMTraitName');
  }
}

class InferICD10CMResponse {
  /// The medical conditions detected in the text linked to ICD-10-CM concepts. If
  /// the action is successful, the service sends back an HTTP 200 response, as
  /// well as the entities detected.
  final List<ICD10CMEntity> entities;

  /// The version of the model used to analyze the documents, in the format
  /// <i>n</i>.<i>n</i>.<i>n</i> You can use this information to track the model
  /// used for a particular batch of documents.
  final String? modelVersion;

  /// If the result of the previous request to <code>InferICD10CM</code> was
  /// truncated, include the <code>PaginationToken</code> to fetch the next page
  /// of medical condition entities.
  final String? paginationToken;

  InferICD10CMResponse({
    required this.entities,
    this.modelVersion,
    this.paginationToken,
  });

  factory InferICD10CMResponse.fromJson(Map<String, dynamic> json) {
    return InferICD10CMResponse(
      entities: (json['Entities'] as List)
          .whereNotNull()
          .map((e) => ICD10CMEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelVersion: json['ModelVersion'] as String?,
      paginationToken: json['PaginationToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final modelVersion = this.modelVersion;
    final paginationToken = this.paginationToken;
    return {
      'Entities': entities,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (paginationToken != null) 'PaginationToken': paginationToken,
    };
  }
}

class InferRxNormResponse {
  /// The medication entities detected in the text linked to RxNorm concepts. If
  /// the action is successful, the service sends back an HTTP 200 response, as
  /// well as the entities detected.
  final List<RxNormEntity> entities;

  /// The version of the model used to analyze the documents, in the format
  /// <i>n</i>.<i>n</i>.<i>n</i> You can use this information to track the model
  /// used for a particular batch of documents.
  final String? modelVersion;

  /// If the result of the previous request to <code>InferRxNorm</code> was
  /// truncated, include the <code>PaginationToken</code> to fetch the next page
  /// of medication entities.
  final String? paginationToken;

  InferRxNormResponse({
    required this.entities,
    this.modelVersion,
    this.paginationToken,
  });

  factory InferRxNormResponse.fromJson(Map<String, dynamic> json) {
    return InferRxNormResponse(
      entities: (json['Entities'] as List)
          .whereNotNull()
          .map((e) => RxNormEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelVersion: json['ModelVersion'] as String?,
      paginationToken: json['PaginationToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final modelVersion = this.modelVersion;
    final paginationToken = this.paginationToken;
    return {
      'Entities': entities,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (paginationToken != null) 'PaginationToken': paginationToken,
    };
  }
}

class InferSNOMEDCTResponse {
  /// The collection of medical concept entities extracted from the input text and
  /// their associated information. For each entity, the response provides the
  /// entity text, the entity category, where the entity text begins and ends, and
  /// the level of confidence that Amazon Comprehend Medical has in the detection
  /// and analysis. Attributes and traits of the entity are also returned.
  final List<SNOMEDCTEntity> entities;

  /// The number of characters in the input request documentation.
  final Characters? characters;

  /// The version of the model used to analyze the documents, in the format n.n.n
  /// You can use this information to track the model used for a particular batch
  /// of documents.
  final String? modelVersion;

  /// If the result of the request is truncated, the pagination token can be used
  /// to fetch the next page of entities.
  final String? paginationToken;

  /// The details of the SNOMED-CT revision, including the edition, language, and
  /// version date.
  final SNOMEDCTDetails? sNOMEDCTDetails;

  InferSNOMEDCTResponse({
    required this.entities,
    this.characters,
    this.modelVersion,
    this.paginationToken,
    this.sNOMEDCTDetails,
  });

  factory InferSNOMEDCTResponse.fromJson(Map<String, dynamic> json) {
    return InferSNOMEDCTResponse(
      entities: (json['Entities'] as List)
          .whereNotNull()
          .map((e) => SNOMEDCTEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      characters: json['Characters'] != null
          ? Characters.fromJson(json['Characters'] as Map<String, dynamic>)
          : null,
      modelVersion: json['ModelVersion'] as String?,
      paginationToken: json['PaginationToken'] as String?,
      sNOMEDCTDetails: json['SNOMEDCTDetails'] != null
          ? SNOMEDCTDetails.fromJson(
              json['SNOMEDCTDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final characters = this.characters;
    final modelVersion = this.modelVersion;
    final paginationToken = this.paginationToken;
    final sNOMEDCTDetails = this.sNOMEDCTDetails;
    return {
      'Entities': entities,
      if (characters != null) 'Characters': characters,
      if (modelVersion != null) 'ModelVersion': modelVersion,
      if (paginationToken != null) 'PaginationToken': paginationToken,
      if (sNOMEDCTDetails != null) 'SNOMEDCTDetails': sNOMEDCTDetails,
    };
  }
}

/// The input properties for an entities detection job. This includes the name
/// of the S3 bucket and the path to the files to be analyzed.
class InputDataConfig {
  /// The URI of the S3 bucket that contains the input data. The bucket must be in
  /// the same region as the API endpoint that you are calling.
  final String s3Bucket;

  /// The path to the input data files in the S3 bucket.
  final String? s3Key;

  InputDataConfig({
    required this.s3Bucket,
    this.s3Key,
  });

  factory InputDataConfig.fromJson(Map<String, dynamic> json) {
    return InputDataConfig(
      s3Bucket: json['S3Bucket'] as String,
      s3Key: json['S3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    return {
      'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
    };
  }
}

enum JobStatus {
  submitted,
  inProgress,
  completed,
  partialSuccess,
  failed,
  stopRequested,
  stopped,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.submitted:
        return 'SUBMITTED';
      case JobStatus.inProgress:
        return 'IN_PROGRESS';
      case JobStatus.completed:
        return 'COMPLETED';
      case JobStatus.partialSuccess:
        return 'PARTIAL_SUCCESS';
      case JobStatus.failed:
        return 'FAILED';
      case JobStatus.stopRequested:
        return 'STOP_REQUESTED';
      case JobStatus.stopped:
        return 'STOPPED';
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
      case 'COMPLETED':
        return JobStatus.completed;
      case 'PARTIAL_SUCCESS':
        return JobStatus.partialSuccess;
      case 'FAILED':
        return JobStatus.failed;
      case 'STOP_REQUESTED':
        return JobStatus.stopRequested;
      case 'STOPPED':
        return JobStatus.stopped;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

enum LanguageCode {
  en,
}

extension LanguageCodeValueExtension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.en:
        return 'en';
    }
  }
}

extension LanguageCodeFromString on String {
  LanguageCode toLanguageCode() {
    switch (this) {
      case 'en':
        return LanguageCode.en;
    }
    throw Exception('$this is not known in enum LanguageCode');
  }
}

class ListEntitiesDetectionV2JobsResponse {
  /// A list containing the properties of each job returned.
  final List<ComprehendMedicalAsyncJobProperties>?
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListEntitiesDetectionV2JobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });

  factory ListEntitiesDetectionV2JobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEntitiesDetectionV2JobsResponse(
      comprehendMedicalAsyncJobPropertiesList:
          (json['ComprehendMedicalAsyncJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => ComprehendMedicalAsyncJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobPropertiesList =
        this.comprehendMedicalAsyncJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (comprehendMedicalAsyncJobPropertiesList != null)
        'ComprehendMedicalAsyncJobPropertiesList':
            comprehendMedicalAsyncJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListICD10CMInferenceJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<ComprehendMedicalAsyncJobProperties>?
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListICD10CMInferenceJobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });

  factory ListICD10CMInferenceJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListICD10CMInferenceJobsResponse(
      comprehendMedicalAsyncJobPropertiesList:
          (json['ComprehendMedicalAsyncJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => ComprehendMedicalAsyncJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobPropertiesList =
        this.comprehendMedicalAsyncJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (comprehendMedicalAsyncJobPropertiesList != null)
        'ComprehendMedicalAsyncJobPropertiesList':
            comprehendMedicalAsyncJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPHIDetectionJobsResponse {
  /// A list containing the properties of each job returned.
  final List<ComprehendMedicalAsyncJobProperties>?
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListPHIDetectionJobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });

  factory ListPHIDetectionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListPHIDetectionJobsResponse(
      comprehendMedicalAsyncJobPropertiesList:
          (json['ComprehendMedicalAsyncJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => ComprehendMedicalAsyncJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobPropertiesList =
        this.comprehendMedicalAsyncJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (comprehendMedicalAsyncJobPropertiesList != null)
        'ComprehendMedicalAsyncJobPropertiesList':
            comprehendMedicalAsyncJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRxNormInferenceJobsResponse {
  /// The maximum number of results to return in each page. The default is 100.
  final List<ComprehendMedicalAsyncJobProperties>?
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListRxNormInferenceJobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });

  factory ListRxNormInferenceJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListRxNormInferenceJobsResponse(
      comprehendMedicalAsyncJobPropertiesList:
          (json['ComprehendMedicalAsyncJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => ComprehendMedicalAsyncJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobPropertiesList =
        this.comprehendMedicalAsyncJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (comprehendMedicalAsyncJobPropertiesList != null)
        'ComprehendMedicalAsyncJobPropertiesList':
            comprehendMedicalAsyncJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSNOMEDCTInferenceJobsResponse {
  /// A list containing the properties of each job that is returned.
  final List<ComprehendMedicalAsyncJobProperties>?
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  final String? nextToken;

  ListSNOMEDCTInferenceJobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });

  factory ListSNOMEDCTInferenceJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSNOMEDCTInferenceJobsResponse(
      comprehendMedicalAsyncJobPropertiesList:
          (json['ComprehendMedicalAsyncJobPropertiesList'] as List?)
              ?.whereNotNull()
              .map((e) => ComprehendMedicalAsyncJobProperties.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final comprehendMedicalAsyncJobPropertiesList =
        this.comprehendMedicalAsyncJobPropertiesList;
    final nextToken = this.nextToken;
    return {
      if (comprehendMedicalAsyncJobPropertiesList != null)
        'ComprehendMedicalAsyncJobPropertiesList':
            comprehendMedicalAsyncJobPropertiesList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The output properties for a detection job.
class OutputDataConfig {
  /// When you use the <code>OutputDataConfig</code> object with asynchronous
  /// operations, you specify the Amazon S3 location where you want to write the
  /// output data. The URI must be in the same region as the API endpoint that you
  /// are calling. The location is used as the prefix for the actual location of
  /// the output.
  final String s3Bucket;

  /// The path to the output data files in the S3 bucket. Amazon Comprehend
  /// Medical creates an output directory using the job ID so that the output from
  /// one job does not overwrite the output of another.
  final String? s3Key;

  OutputDataConfig({
    required this.s3Bucket,
    this.s3Key,
  });

  factory OutputDataConfig.fromJson(Map<String, dynamic> json) {
    return OutputDataConfig(
      s3Bucket: json['S3Bucket'] as String,
      s3Key: json['S3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    return {
      'S3Bucket': s3Bucket,
      if (s3Key != null) 'S3Key': s3Key,
    };
  }
}

enum RelationshipType {
  every,
  withDosage,
  administeredVia,
  $for,
  negative,
  overlap,
  dosage,
  routeOrMode,
  form,
  frequency,
  duration,
  strength,
  rate,
  acuity,
  testValue,
  testUnits,
  testUnit,
  direction,
  systemOrganSite,
  amount,
  usage,
  quality,
}

extension RelationshipTypeValueExtension on RelationshipType {
  String toValue() {
    switch (this) {
      case RelationshipType.every:
        return 'EVERY';
      case RelationshipType.withDosage:
        return 'WITH_DOSAGE';
      case RelationshipType.administeredVia:
        return 'ADMINISTERED_VIA';
      case RelationshipType.$for:
        return 'FOR';
      case RelationshipType.negative:
        return 'NEGATIVE';
      case RelationshipType.overlap:
        return 'OVERLAP';
      case RelationshipType.dosage:
        return 'DOSAGE';
      case RelationshipType.routeOrMode:
        return 'ROUTE_OR_MODE';
      case RelationshipType.form:
        return 'FORM';
      case RelationshipType.frequency:
        return 'FREQUENCY';
      case RelationshipType.duration:
        return 'DURATION';
      case RelationshipType.strength:
        return 'STRENGTH';
      case RelationshipType.rate:
        return 'RATE';
      case RelationshipType.acuity:
        return 'ACUITY';
      case RelationshipType.testValue:
        return 'TEST_VALUE';
      case RelationshipType.testUnits:
        return 'TEST_UNITS';
      case RelationshipType.testUnit:
        return 'TEST_UNIT';
      case RelationshipType.direction:
        return 'DIRECTION';
      case RelationshipType.systemOrganSite:
        return 'SYSTEM_ORGAN_SITE';
      case RelationshipType.amount:
        return 'AMOUNT';
      case RelationshipType.usage:
        return 'USAGE';
      case RelationshipType.quality:
        return 'QUALITY';
    }
  }
}

extension RelationshipTypeFromString on String {
  RelationshipType toRelationshipType() {
    switch (this) {
      case 'EVERY':
        return RelationshipType.every;
      case 'WITH_DOSAGE':
        return RelationshipType.withDosage;
      case 'ADMINISTERED_VIA':
        return RelationshipType.administeredVia;
      case 'FOR':
        return RelationshipType.$for;
      case 'NEGATIVE':
        return RelationshipType.negative;
      case 'OVERLAP':
        return RelationshipType.overlap;
      case 'DOSAGE':
        return RelationshipType.dosage;
      case 'ROUTE_OR_MODE':
        return RelationshipType.routeOrMode;
      case 'FORM':
        return RelationshipType.form;
      case 'FREQUENCY':
        return RelationshipType.frequency;
      case 'DURATION':
        return RelationshipType.duration;
      case 'STRENGTH':
        return RelationshipType.strength;
      case 'RATE':
        return RelationshipType.rate;
      case 'ACUITY':
        return RelationshipType.acuity;
      case 'TEST_VALUE':
        return RelationshipType.testValue;
      case 'TEST_UNITS':
        return RelationshipType.testUnits;
      case 'TEST_UNIT':
        return RelationshipType.testUnit;
      case 'DIRECTION':
        return RelationshipType.direction;
      case 'SYSTEM_ORGAN_SITE':
        return RelationshipType.systemOrganSite;
      case 'AMOUNT':
        return RelationshipType.amount;
      case 'USAGE':
        return RelationshipType.usage;
      case 'QUALITY':
        return RelationshipType.quality;
    }
    throw Exception('$this is not known in enum RelationshipType');
  }
}

/// The extracted attributes that relate to this entity. The attributes
/// recognized by InferRxNorm are <code>DOSAGE</code>, <code>DURATION</code>,
/// <code>FORM</code>, <code>FREQUENCY</code>, <code>RATE</code>,
/// <code>ROUTE_OR_MODE</code>.
class RxNormAttribute {
  /// The 0-based character offset in the input text that shows where the
  /// attribute begins. The offset returns the UTF-8 code point in the string.
  final int? beginOffset;

  /// The 0-based character offset in the input text that shows where the
  /// attribute ends. The offset returns the UTF-8 code point in the string.
  final int? endOffset;

  /// The numeric identifier for this attribute. This is a monotonically
  /// increasing id unique within this response rather than a global unique
  /// identifier.
  final int? id;

  /// The level of confidence that Amazon Comprehend Medical has that the
  /// attribute is accurately linked to an entity.
  final double? relationshipScore;

  /// The level of confidence that Amazon Comprehend Medical has that the segment
  /// of text is correctly recognized as an attribute.
  final double? score;

  /// The segment of input text which corresponds to the detected attribute.
  final String? text;

  /// Contextual information for the attribute. InferRxNorm recognizes the trait
  /// <code>NEGATION</code> for attributes, i.e. that the patient is not taking a
  /// specific dose or form of a medication.
  final List<RxNormTrait>? traits;

  /// The type of attribute. The types of attributes recognized by InferRxNorm are
  /// <code>BRAND_NAME</code> and <code>GENERIC_NAME</code>.
  final RxNormAttributeType? type;

  RxNormAttribute({
    this.beginOffset,
    this.endOffset,
    this.id,
    this.relationshipScore,
    this.score,
    this.text,
    this.traits,
    this.type,
  });

  factory RxNormAttribute.fromJson(Map<String, dynamic> json) {
    return RxNormAttribute(
      beginOffset: json['BeginOffset'] as int?,
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      relationshipScore: json['RelationshipScore'] as double?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => RxNormTrait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toRxNormAttributeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final endOffset = this.endOffset;
    final id = this.id;
    final relationshipScore = this.relationshipScore;
    final score = this.score;
    final text = this.text;
    final traits = this.traits;
    final type = this.type;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (endOffset != null) 'EndOffset': endOffset,
      if (id != null) 'Id': id,
      if (relationshipScore != null) 'RelationshipScore': relationshipScore,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (traits != null) 'Traits': traits,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RxNormAttributeType {
  dosage,
  duration,
  form,
  frequency,
  rate,
  routeOrMode,
  strength,
}

extension RxNormAttributeTypeValueExtension on RxNormAttributeType {
  String toValue() {
    switch (this) {
      case RxNormAttributeType.dosage:
        return 'DOSAGE';
      case RxNormAttributeType.duration:
        return 'DURATION';
      case RxNormAttributeType.form:
        return 'FORM';
      case RxNormAttributeType.frequency:
        return 'FREQUENCY';
      case RxNormAttributeType.rate:
        return 'RATE';
      case RxNormAttributeType.routeOrMode:
        return 'ROUTE_OR_MODE';
      case RxNormAttributeType.strength:
        return 'STRENGTH';
    }
  }
}

extension RxNormAttributeTypeFromString on String {
  RxNormAttributeType toRxNormAttributeType() {
    switch (this) {
      case 'DOSAGE':
        return RxNormAttributeType.dosage;
      case 'DURATION':
        return RxNormAttributeType.duration;
      case 'FORM':
        return RxNormAttributeType.form;
      case 'FREQUENCY':
        return RxNormAttributeType.frequency;
      case 'RATE':
        return RxNormAttributeType.rate;
      case 'ROUTE_OR_MODE':
        return RxNormAttributeType.routeOrMode;
      case 'STRENGTH':
        return RxNormAttributeType.strength;
    }
    throw Exception('$this is not known in enum RxNormAttributeType');
  }
}

/// The RxNorm concept that the entity could refer to, along with a score
/// indicating the likelihood of the match.
class RxNormConcept {
  /// RxNorm concept ID, also known as the RxCUI.
  final String? code;

  /// The description of the RxNorm concept.
  final String? description;

  /// The level of confidence that Amazon Comprehend Medical has that the entity
  /// is accurately linked to the reported RxNorm concept.
  final double? score;

  RxNormConcept({
    this.code,
    this.description,
    this.score,
  });

  factory RxNormConcept.fromJson(Map<String, dynamic> json) {
    return RxNormConcept(
      code: json['Code'] as String?,
      description: json['Description'] as String?,
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final description = this.description;
    final score = this.score;
    return {
      if (code != null) 'Code': code,
      if (description != null) 'Description': description,
      if (score != null) 'Score': score,
    };
  }
}

/// The collection of medical entities extracted from the input text and their
/// associated information. For each entity, the response provides the entity
/// text, the entity category, where the entity text begins and ends, and the
/// level of confidence that Amazon Comprehend Medical has in the detection and
/// analysis. Attributes and traits of the entity are also returned.
class RxNormEntity {
  /// The extracted attributes that relate to the entity. The attributes
  /// recognized by InferRxNorm are <code>DOSAGE</code>, <code>DURATION</code>,
  /// <code>FORM</code>, <code>FREQUENCY</code>, <code>RATE</code>,
  /// <code>ROUTE_OR_MODE</code>, and <code>STRENGTH</code>.
  final List<RxNormAttribute>? attributes;

  /// The 0-based character offset in the input text that shows where the entity
  /// begins. The offset returns the UTF-8 code point in the string.
  final int? beginOffset;

  /// The category of the entity. The recognized categories are
  /// <code>GENERIC</code> or <code>BRAND_NAME</code>.
  final RxNormEntityCategory? category;

  /// The 0-based character offset in the input text that shows where the entity
  /// ends. The offset returns the UTF-8 code point in the string.
  final int? endOffset;

  /// The numeric identifier for the entity. This is a monotonically increasing id
  /// unique within this response rather than a global unique identifier.
  final int? id;

  /// The RxNorm concepts that the entity could refer to, along with a score
  /// indicating the likelihood of the match.
  final List<RxNormConcept>? rxNormConcepts;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detected entity.
  final double? score;

  /// The segment of input text extracted from which the entity was detected.
  final String? text;

  /// Contextual information for the entity.
  final List<RxNormTrait>? traits;

  /// Describes the specific type of entity. For InferRxNorm, the recognized
  /// entity type is <code>MEDICATION</code>.
  final RxNormEntityType? type;

  RxNormEntity({
    this.attributes,
    this.beginOffset,
    this.category,
    this.endOffset,
    this.id,
    this.rxNormConcepts,
    this.score,
    this.text,
    this.traits,
    this.type,
  });

  factory RxNormEntity.fromJson(Map<String, dynamic> json) {
    return RxNormEntity(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => RxNormAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      beginOffset: json['BeginOffset'] as int?,
      category: (json['Category'] as String?)?.toRxNormEntityCategory(),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      rxNormConcepts: (json['RxNormConcepts'] as List?)
          ?.whereNotNull()
          .map((e) => RxNormConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => RxNormTrait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toRxNormEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final beginOffset = this.beginOffset;
    final category = this.category;
    final endOffset = this.endOffset;
    final id = this.id;
    final rxNormConcepts = this.rxNormConcepts;
    final score = this.score;
    final text = this.text;
    final traits = this.traits;
    final type = this.type;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (category != null) 'Category': category.toValue(),
      if (endOffset != null) 'EndOffset': endOffset,
      if (id != null) 'Id': id,
      if (rxNormConcepts != null) 'RxNormConcepts': rxNormConcepts,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (traits != null) 'Traits': traits,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum RxNormEntityCategory {
  medication,
}

extension RxNormEntityCategoryValueExtension on RxNormEntityCategory {
  String toValue() {
    switch (this) {
      case RxNormEntityCategory.medication:
        return 'MEDICATION';
    }
  }
}

extension RxNormEntityCategoryFromString on String {
  RxNormEntityCategory toRxNormEntityCategory() {
    switch (this) {
      case 'MEDICATION':
        return RxNormEntityCategory.medication;
    }
    throw Exception('$this is not known in enum RxNormEntityCategory');
  }
}

enum RxNormEntityType {
  brandName,
  genericName,
}

extension RxNormEntityTypeValueExtension on RxNormEntityType {
  String toValue() {
    switch (this) {
      case RxNormEntityType.brandName:
        return 'BRAND_NAME';
      case RxNormEntityType.genericName:
        return 'GENERIC_NAME';
    }
  }
}

extension RxNormEntityTypeFromString on String {
  RxNormEntityType toRxNormEntityType() {
    switch (this) {
      case 'BRAND_NAME':
        return RxNormEntityType.brandName;
      case 'GENERIC_NAME':
        return RxNormEntityType.genericName;
    }
    throw Exception('$this is not known in enum RxNormEntityType');
  }
}

/// The contextual information for the entity. InferRxNorm recognizes the trait
/// <code>NEGATION</code>, which is any indication that the patient is not
/// taking a medication.
class RxNormTrait {
  /// Provides a name or contextual description about the trait.
  final RxNormTraitName? name;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detected trait.
  final double? score;

  RxNormTrait({
    this.name,
    this.score,
  });

  factory RxNormTrait.fromJson(Map<String, dynamic> json) {
    return RxNormTrait(
      name: (json['Name'] as String?)?.toRxNormTraitName(),
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final score = this.score;
    return {
      if (name != null) 'Name': name.toValue(),
      if (score != null) 'Score': score,
    };
  }
}

enum RxNormTraitName {
  negation,
  pastHistory,
}

extension RxNormTraitNameValueExtension on RxNormTraitName {
  String toValue() {
    switch (this) {
      case RxNormTraitName.negation:
        return 'NEGATION';
      case RxNormTraitName.pastHistory:
        return 'PAST_HISTORY';
    }
  }
}

extension RxNormTraitNameFromString on String {
  RxNormTraitName toRxNormTraitName() {
    switch (this) {
      case 'NEGATION':
        return RxNormTraitName.negation;
      case 'PAST_HISTORY':
        return RxNormTraitName.pastHistory;
    }
    throw Exception('$this is not known in enum RxNormTraitName');
  }
}

/// The extracted attributes that relate to an entity. An extracted segment of
/// the text that is an attribute of an entity, or otherwise related to an
/// entity, such as the dosage of a medication taken.
class SNOMEDCTAttribute {
  /// The 0-based character offset in the input text that shows where the
  /// attribute begins. The offset returns the UTF-8 code point in the string.
  final int? beginOffset;

  /// The category of the detected attribute. Possible categories include
  /// MEDICAL_CONDITION, ANATOMY, and TEST_TREATMENT_PROCEDURE.
  final SNOMEDCTEntityCategory? category;

  /// The 0-based character offset in the input text that shows where the
  /// attribute ends. The offset returns the UTF-8 code point in the string.
  final int? endOffset;

  /// The numeric identifier for this attribute. This is a monotonically
  /// increasing id unique within this response rather than a global unique
  /// identifier.
  final int? id;

  /// The level of confidence that Amazon Comprehend Medical has that this
  /// attribute is correctly related to this entity.
  final double? relationshipScore;

  /// The type of relationship that exists between the entity and the related
  /// attribute.
  final SNOMEDCTRelationshipType? relationshipType;

  /// The SNOMED-CT concepts specific to an attribute, along with a score
  /// indicating the likelihood of the match.
  final List<SNOMEDCTConcept>? sNOMEDCTConcepts;

  /// The level of confidence that Amazon Comprehend Medical has that the segment
  /// of text is correctly recognized as an attribute.
  final double? score;

  /// The segment of input text extracted as this attribute.
  final String? text;

  /// Contextual information for an attribute. Examples include signs, symptoms,
  /// diagnosis, and negation.
  final List<SNOMEDCTTrait>? traits;

  /// The type of attribute. Possible types include DX_NAME, ACUITY, DIRECTION,
  /// SYSTEM_ORGAN_SITE,TEST_NAME, TEST_VALUE, TEST_UNIT, PROCEDURE_NAME, and
  /// TREATMENT_NAME.
  final SNOMEDCTAttributeType? type;

  SNOMEDCTAttribute({
    this.beginOffset,
    this.category,
    this.endOffset,
    this.id,
    this.relationshipScore,
    this.relationshipType,
    this.sNOMEDCTConcepts,
    this.score,
    this.text,
    this.traits,
    this.type,
  });

  factory SNOMEDCTAttribute.fromJson(Map<String, dynamic> json) {
    return SNOMEDCTAttribute(
      beginOffset: json['BeginOffset'] as int?,
      category: (json['Category'] as String?)?.toSNOMEDCTEntityCategory(),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      relationshipScore: json['RelationshipScore'] as double?,
      relationshipType:
          (json['RelationshipType'] as String?)?.toSNOMEDCTRelationshipType(),
      sNOMEDCTConcepts: (json['SNOMEDCTConcepts'] as List?)
          ?.whereNotNull()
          .map((e) => SNOMEDCTConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => SNOMEDCTTrait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toSNOMEDCTAttributeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffset = this.beginOffset;
    final category = this.category;
    final endOffset = this.endOffset;
    final id = this.id;
    final relationshipScore = this.relationshipScore;
    final relationshipType = this.relationshipType;
    final sNOMEDCTConcepts = this.sNOMEDCTConcepts;
    final score = this.score;
    final text = this.text;
    final traits = this.traits;
    final type = this.type;
    return {
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (category != null) 'Category': category.toValue(),
      if (endOffset != null) 'EndOffset': endOffset,
      if (id != null) 'Id': id,
      if (relationshipScore != null) 'RelationshipScore': relationshipScore,
      if (relationshipType != null)
        'RelationshipType': relationshipType.toValue(),
      if (sNOMEDCTConcepts != null) 'SNOMEDCTConcepts': sNOMEDCTConcepts,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (traits != null) 'Traits': traits,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum SNOMEDCTAttributeType {
  acuity,
  quality,
  direction,
  systemOrganSite,
  testValue,
  testUnit,
}

extension SNOMEDCTAttributeTypeValueExtension on SNOMEDCTAttributeType {
  String toValue() {
    switch (this) {
      case SNOMEDCTAttributeType.acuity:
        return 'ACUITY';
      case SNOMEDCTAttributeType.quality:
        return 'QUALITY';
      case SNOMEDCTAttributeType.direction:
        return 'DIRECTION';
      case SNOMEDCTAttributeType.systemOrganSite:
        return 'SYSTEM_ORGAN_SITE';
      case SNOMEDCTAttributeType.testValue:
        return 'TEST_VALUE';
      case SNOMEDCTAttributeType.testUnit:
        return 'TEST_UNIT';
    }
  }
}

extension SNOMEDCTAttributeTypeFromString on String {
  SNOMEDCTAttributeType toSNOMEDCTAttributeType() {
    switch (this) {
      case 'ACUITY':
        return SNOMEDCTAttributeType.acuity;
      case 'QUALITY':
        return SNOMEDCTAttributeType.quality;
      case 'DIRECTION':
        return SNOMEDCTAttributeType.direction;
      case 'SYSTEM_ORGAN_SITE':
        return SNOMEDCTAttributeType.systemOrganSite;
      case 'TEST_VALUE':
        return SNOMEDCTAttributeType.testValue;
      case 'TEST_UNIT':
        return SNOMEDCTAttributeType.testUnit;
    }
    throw Exception('$this is not known in enum SNOMEDCTAttributeType');
  }
}

/// The SNOMED-CT concepts that the entity could refer to, along with a score
/// indicating the likelihood of the match.
class SNOMEDCTConcept {
  /// The numeric ID for the SNOMED-CT concept.
  final String? code;

  /// The description of the SNOMED-CT concept.
  final String? description;

  /// The level of confidence Amazon Comprehend Medical has that the entity should
  /// be linked to the identified SNOMED-CT concept.
  final double? score;

  SNOMEDCTConcept({
    this.code,
    this.description,
    this.score,
  });

  factory SNOMEDCTConcept.fromJson(Map<String, dynamic> json) {
    return SNOMEDCTConcept(
      code: json['Code'] as String?,
      description: json['Description'] as String?,
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final description = this.description;
    final score = this.score;
    return {
      if (code != null) 'Code': code,
      if (description != null) 'Description': description,
      if (score != null) 'Score': score,
    };
  }
}

/// The information about the revision of the SNOMED-CT ontology in the
/// response. Specifically, the details include the SNOMED-CT edition, language,
/// and version date.
class SNOMEDCTDetails {
  /// The edition of SNOMED-CT used. The edition used for the InferSNOMEDCT
  /// editions is the US edition.
  final String? edition;

  /// The language used in the SNOMED-CT ontology. All Amazon Comprehend Medical
  /// operations are US English (en).
  final String? language;

  /// The version date of the SNOMED-CT ontology used.
  final String? versionDate;

  SNOMEDCTDetails({
    this.edition,
    this.language,
    this.versionDate,
  });

  factory SNOMEDCTDetails.fromJson(Map<String, dynamic> json) {
    return SNOMEDCTDetails(
      edition: json['Edition'] as String?,
      language: json['Language'] as String?,
      versionDate: json['VersionDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final edition = this.edition;
    final language = this.language;
    final versionDate = this.versionDate;
    return {
      if (edition != null) 'Edition': edition,
      if (language != null) 'Language': language,
      if (versionDate != null) 'VersionDate': versionDate,
    };
  }
}

/// The collection of medical entities extracted from the input text and their
/// associated information. For each entity, the response provides the entity
/// text, the entity category, where the entity text begins and ends, and the
/// level of confidence that Amazon Comprehend Medical has in the detection and
/// analysis. Attributes and traits of the entity are also returned.
class SNOMEDCTEntity {
  /// An extracted segment of the text that is an attribute of an entity, or
  /// otherwise related to an entity, such as the dosage of a medication taken.
  final List<SNOMEDCTAttribute>? attributes;

  /// The 0-based character offset in the input text that shows where the entity
  /// begins. The offset returns the UTF-8 code point in the string.
  final int? beginOffset;

  /// The category of the detected entity. Possible categories are
  /// MEDICAL_CONDITION, ANATOMY, or TEST_TREATMENT_PROCEDURE.
  final SNOMEDCTEntityCategory? category;

  /// The 0-based character offset in the input text that shows where the entity
  /// ends. The offset returns the UTF-8 code point in the string.
  final int? endOffset;

  /// The numeric identifier for the entity. This is a monotonically increasing id
  /// unique within this response rather than a global unique identifier.
  final int? id;

  /// The SNOMED concepts that the entity could refer to, along with a score
  /// indicating the likelihood of the match.
  final List<SNOMEDCTConcept>? sNOMEDCTConcepts;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detected entity.
  final double? score;

  /// The segment of input text extracted as this entity.
  final String? text;

  /// Contextual information for the entity.
  final List<SNOMEDCTTrait>? traits;

  /// Describes the specific type of entity with category of entities. Possible
  /// types include DX_NAME, ACUITY, DIRECTION, SYSTEM_ORGAN_SITE, TEST_NAME,
  /// TEST_VALUE, TEST_UNIT, PROCEDURE_NAME, or TREATMENT_NAME.
  final SNOMEDCTEntityType? type;

  SNOMEDCTEntity({
    this.attributes,
    this.beginOffset,
    this.category,
    this.endOffset,
    this.id,
    this.sNOMEDCTConcepts,
    this.score,
    this.text,
    this.traits,
    this.type,
  });

  factory SNOMEDCTEntity.fromJson(Map<String, dynamic> json) {
    return SNOMEDCTEntity(
      attributes: (json['Attributes'] as List?)
          ?.whereNotNull()
          .map((e) => SNOMEDCTAttribute.fromJson(e as Map<String, dynamic>))
          .toList(),
      beginOffset: json['BeginOffset'] as int?,
      category: (json['Category'] as String?)?.toSNOMEDCTEntityCategory(),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      sNOMEDCTConcepts: (json['SNOMEDCTConcepts'] as List?)
          ?.whereNotNull()
          .map((e) => SNOMEDCTConcept.fromJson(e as Map<String, dynamic>))
          .toList(),
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => SNOMEDCTTrait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toSNOMEDCTEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final beginOffset = this.beginOffset;
    final category = this.category;
    final endOffset = this.endOffset;
    final id = this.id;
    final sNOMEDCTConcepts = this.sNOMEDCTConcepts;
    final score = this.score;
    final text = this.text;
    final traits = this.traits;
    final type = this.type;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (beginOffset != null) 'BeginOffset': beginOffset,
      if (category != null) 'Category': category.toValue(),
      if (endOffset != null) 'EndOffset': endOffset,
      if (id != null) 'Id': id,
      if (sNOMEDCTConcepts != null) 'SNOMEDCTConcepts': sNOMEDCTConcepts,
      if (score != null) 'Score': score,
      if (text != null) 'Text': text,
      if (traits != null) 'Traits': traits,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum SNOMEDCTEntityCategory {
  medicalCondition,
  anatomy,
  testTreatmentProcedure,
}

extension SNOMEDCTEntityCategoryValueExtension on SNOMEDCTEntityCategory {
  String toValue() {
    switch (this) {
      case SNOMEDCTEntityCategory.medicalCondition:
        return 'MEDICAL_CONDITION';
      case SNOMEDCTEntityCategory.anatomy:
        return 'ANATOMY';
      case SNOMEDCTEntityCategory.testTreatmentProcedure:
        return 'TEST_TREATMENT_PROCEDURE';
    }
  }
}

extension SNOMEDCTEntityCategoryFromString on String {
  SNOMEDCTEntityCategory toSNOMEDCTEntityCategory() {
    switch (this) {
      case 'MEDICAL_CONDITION':
        return SNOMEDCTEntityCategory.medicalCondition;
      case 'ANATOMY':
        return SNOMEDCTEntityCategory.anatomy;
      case 'TEST_TREATMENT_PROCEDURE':
        return SNOMEDCTEntityCategory.testTreatmentProcedure;
    }
    throw Exception('$this is not known in enum SNOMEDCTEntityCategory');
  }
}

enum SNOMEDCTEntityType {
  dxName,
  testName,
  procedureName,
  treatmentName,
}

extension SNOMEDCTEntityTypeValueExtension on SNOMEDCTEntityType {
  String toValue() {
    switch (this) {
      case SNOMEDCTEntityType.dxName:
        return 'DX_NAME';
      case SNOMEDCTEntityType.testName:
        return 'TEST_NAME';
      case SNOMEDCTEntityType.procedureName:
        return 'PROCEDURE_NAME';
      case SNOMEDCTEntityType.treatmentName:
        return 'TREATMENT_NAME';
    }
  }
}

extension SNOMEDCTEntityTypeFromString on String {
  SNOMEDCTEntityType toSNOMEDCTEntityType() {
    switch (this) {
      case 'DX_NAME':
        return SNOMEDCTEntityType.dxName;
      case 'TEST_NAME':
        return SNOMEDCTEntityType.testName;
      case 'PROCEDURE_NAME':
        return SNOMEDCTEntityType.procedureName;
      case 'TREATMENT_NAME':
        return SNOMEDCTEntityType.treatmentName;
    }
    throw Exception('$this is not known in enum SNOMEDCTEntityType');
  }
}

enum SNOMEDCTRelationshipType {
  acuity,
  quality,
  testValue,
  testUnits,
  direction,
  systemOrganSite,
  testUnit,
}

extension SNOMEDCTRelationshipTypeValueExtension on SNOMEDCTRelationshipType {
  String toValue() {
    switch (this) {
      case SNOMEDCTRelationshipType.acuity:
        return 'ACUITY';
      case SNOMEDCTRelationshipType.quality:
        return 'QUALITY';
      case SNOMEDCTRelationshipType.testValue:
        return 'TEST_VALUE';
      case SNOMEDCTRelationshipType.testUnits:
        return 'TEST_UNITS';
      case SNOMEDCTRelationshipType.direction:
        return 'DIRECTION';
      case SNOMEDCTRelationshipType.systemOrganSite:
        return 'SYSTEM_ORGAN_SITE';
      case SNOMEDCTRelationshipType.testUnit:
        return 'TEST_UNIT';
    }
  }
}

extension SNOMEDCTRelationshipTypeFromString on String {
  SNOMEDCTRelationshipType toSNOMEDCTRelationshipType() {
    switch (this) {
      case 'ACUITY':
        return SNOMEDCTRelationshipType.acuity;
      case 'QUALITY':
        return SNOMEDCTRelationshipType.quality;
      case 'TEST_VALUE':
        return SNOMEDCTRelationshipType.testValue;
      case 'TEST_UNITS':
        return SNOMEDCTRelationshipType.testUnits;
      case 'DIRECTION':
        return SNOMEDCTRelationshipType.direction;
      case 'SYSTEM_ORGAN_SITE':
        return SNOMEDCTRelationshipType.systemOrganSite;
      case 'TEST_UNIT':
        return SNOMEDCTRelationshipType.testUnit;
    }
    throw Exception('$this is not known in enum SNOMEDCTRelationshipType');
  }
}

/// Contextual information for an entity.
class SNOMEDCTTrait {
  /// The name or contextual description of a detected trait.
  final SNOMEDCTTraitName? name;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of a detected trait.
  final double? score;

  SNOMEDCTTrait({
    this.name,
    this.score,
  });

  factory SNOMEDCTTrait.fromJson(Map<String, dynamic> json) {
    return SNOMEDCTTrait(
      name: (json['Name'] as String?)?.toSNOMEDCTTraitName(),
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final score = this.score;
    return {
      if (name != null) 'Name': name.toValue(),
      if (score != null) 'Score': score,
    };
  }
}

enum SNOMEDCTTraitName {
  negation,
  diagnosis,
  sign,
  symptom,
  pertainsToFamily,
  hypothetical,
  lowConfidence,
  pastHistory,
  future,
}

extension SNOMEDCTTraitNameValueExtension on SNOMEDCTTraitName {
  String toValue() {
    switch (this) {
      case SNOMEDCTTraitName.negation:
        return 'NEGATION';
      case SNOMEDCTTraitName.diagnosis:
        return 'DIAGNOSIS';
      case SNOMEDCTTraitName.sign:
        return 'SIGN';
      case SNOMEDCTTraitName.symptom:
        return 'SYMPTOM';
      case SNOMEDCTTraitName.pertainsToFamily:
        return 'PERTAINS_TO_FAMILY';
      case SNOMEDCTTraitName.hypothetical:
        return 'HYPOTHETICAL';
      case SNOMEDCTTraitName.lowConfidence:
        return 'LOW_CONFIDENCE';
      case SNOMEDCTTraitName.pastHistory:
        return 'PAST_HISTORY';
      case SNOMEDCTTraitName.future:
        return 'FUTURE';
    }
  }
}

extension SNOMEDCTTraitNameFromString on String {
  SNOMEDCTTraitName toSNOMEDCTTraitName() {
    switch (this) {
      case 'NEGATION':
        return SNOMEDCTTraitName.negation;
      case 'DIAGNOSIS':
        return SNOMEDCTTraitName.diagnosis;
      case 'SIGN':
        return SNOMEDCTTraitName.sign;
      case 'SYMPTOM':
        return SNOMEDCTTraitName.symptom;
      case 'PERTAINS_TO_FAMILY':
        return SNOMEDCTTraitName.pertainsToFamily;
      case 'HYPOTHETICAL':
        return SNOMEDCTTraitName.hypothetical;
      case 'LOW_CONFIDENCE':
        return SNOMEDCTTraitName.lowConfidence;
      case 'PAST_HISTORY':
        return SNOMEDCTTraitName.pastHistory;
      case 'FUTURE':
        return SNOMEDCTTraitName.future;
    }
    throw Exception('$this is not known in enum SNOMEDCTTraitName');
  }
}

class StartEntitiesDetectionV2JobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the <code>DescribeEntitiesDetectionV2Job</code> operation.
  final String? jobId;

  StartEntitiesDetectionV2JobResponse({
    this.jobId,
  });

  factory StartEntitiesDetectionV2JobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartEntitiesDetectionV2JobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartICD10CMInferenceJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the <code>StartICD10CMInferenceJob</code> operation.
  final String? jobId;

  StartICD10CMInferenceJobResponse({
    this.jobId,
  });

  factory StartICD10CMInferenceJobResponse.fromJson(Map<String, dynamic> json) {
    return StartICD10CMInferenceJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartPHIDetectionJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the <code>DescribePHIDetectionJob</code> operation.
  final String? jobId;

  StartPHIDetectionJobResponse({
    this.jobId,
  });

  factory StartPHIDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartPHIDetectionJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartRxNormInferenceJobResponse {
  /// The identifier of the job.
  final String? jobId;

  StartRxNormInferenceJobResponse({
    this.jobId,
  });

  factory StartRxNormInferenceJobResponse.fromJson(Map<String, dynamic> json) {
    return StartRxNormInferenceJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StartSNOMEDCTInferenceJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the StartSNOMEDCTInferenceJob operation.
  final String? jobId;

  StartSNOMEDCTInferenceJobResponse({
    this.jobId,
  });

  factory StartSNOMEDCTInferenceJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartSNOMEDCTInferenceJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StopEntitiesDetectionV2JobResponse {
  /// The identifier of the medical entities detection job that was stopped.
  final String? jobId;

  StopEntitiesDetectionV2JobResponse({
    this.jobId,
  });

  factory StopEntitiesDetectionV2JobResponse.fromJson(
      Map<String, dynamic> json) {
    return StopEntitiesDetectionV2JobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StopICD10CMInferenceJobResponse {
  /// The identifier generated for the job. To get the status of job, use this
  /// identifier with the <code>DescribeICD10CMInferenceJob</code> operation.
  final String? jobId;

  StopICD10CMInferenceJobResponse({
    this.jobId,
  });

  factory StopICD10CMInferenceJobResponse.fromJson(Map<String, dynamic> json) {
    return StopICD10CMInferenceJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StopPHIDetectionJobResponse {
  /// The identifier of the PHI detection job that was stopped.
  final String? jobId;

  StopPHIDetectionJobResponse({
    this.jobId,
  });

  factory StopPHIDetectionJobResponse.fromJson(Map<String, dynamic> json) {
    return StopPHIDetectionJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StopRxNormInferenceJobResponse {
  /// The identifier generated for the job. To get the status of job, use this
  /// identifier with the <code>DescribeRxNormInferenceJob</code> operation.
  final String? jobId;

  StopRxNormInferenceJobResponse({
    this.jobId,
  });

  factory StopRxNormInferenceJobResponse.fromJson(Map<String, dynamic> json) {
    return StopRxNormInferenceJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

class StopSNOMEDCTInferenceJobResponse {
  /// The identifier generated for the job. To get the status of job, use this
  /// identifier with the DescribeSNOMEDCTInferenceJob operation.
  final String? jobId;

  StopSNOMEDCTInferenceJobResponse({
    this.jobId,
  });

  factory StopSNOMEDCTInferenceJobResponse.fromJson(Map<String, dynamic> json) {
    return StopSNOMEDCTInferenceJobResponse(
      jobId: json['JobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      if (jobId != null) 'JobId': jobId,
    };
  }
}

/// Provides contextual information about the extracted entity.
class Trait {
  /// Provides a name or contextual description about the trait.
  final AttributeName? name;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of this trait.
  final double? score;

  Trait({
    this.name,
    this.score,
  });

  factory Trait.fromJson(Map<String, dynamic> json) {
    return Trait(
      name: (json['Name'] as String?)?.toAttributeName(),
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final score = this.score;
    return {
      if (name != null) 'Name': name.toValue(),
      if (score != null) 'Score': score,
    };
  }
}

/// An attribute that was extracted, but Amazon Comprehend Medical was unable to
/// relate to an entity.
class UnmappedAttribute {
  /// The specific attribute that has been extracted but not mapped to an entity.
  final Attribute? attribute;

  /// The type of the unmapped attribute, could be one of the following values:
  /// "MEDICATION", "MEDICAL_CONDITION", "ANATOMY", "TEST_AND_TREATMENT_PROCEDURE"
  /// or "PROTECTED_HEALTH_INFORMATION".
  final EntityType? type;

  UnmappedAttribute({
    this.attribute,
    this.type,
  });

  factory UnmappedAttribute.fromJson(Map<String, dynamic> json) {
    return UnmappedAttribute(
      attribute: json['Attribute'] != null
          ? Attribute.fromJson(json['Attribute'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toEntityType(),
    );
  }

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final type = this.type;
    return {
      if (attribute != null) 'Attribute': attribute,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidEncodingException extends _s.GenericAwsException {
  InvalidEncodingException({String? type, String? message})
      : super(type: type, code: 'InvalidEncodingException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TextSizeLimitExceededException extends _s.GenericAwsException {
  TextSizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'TextSizeLimitExceededException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidEncodingException': (type, message) =>
      InvalidEncodingException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TextSizeLimitExceededException': (type, message) =>
      TextSizeLimitExceededException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
