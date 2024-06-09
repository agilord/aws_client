// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
        'LanguageCode': languageCode.value,
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
      category: (json['Category'] as String?)?.let(EntityType.fromString),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      relationshipScore: json['RelationshipScore'] as double?,
      relationshipType: (json['RelationshipType'] as String?)
          ?.let(RelationshipType.fromString),
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.let(EntitySubType.fromString),
    );
  }
}

enum AttributeName {
  sign('SIGN'),
  symptom('SYMPTOM'),
  diagnosis('DIAGNOSIS'),
  negation('NEGATION'),
  pertainsToFamily('PERTAINS_TO_FAMILY'),
  hypothetical('HYPOTHETICAL'),
  lowConfidence('LOW_CONFIDENCE'),
  pastHistory('PAST_HISTORY'),
  future('FUTURE'),
  ;

  final String value;

  const AttributeName(this.value);

  static AttributeName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum AttributeName'));
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
      if (jobStatus != null) 'JobStatus': jobStatus.value,
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
      jobStatus: (json['JobStatus'] as String?)?.let(JobStatus.fromString),
      kMSKey: json['KMSKey'] as String?,
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
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
      category: (json['Category'] as String?)?.let(EntityType.fromString),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => Trait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.let(EntitySubType.fromString),
    );
  }
}

enum EntitySubType {
  name('NAME'),
  dxName('DX_NAME'),
  dosage('DOSAGE'),
  routeOrMode('ROUTE_OR_MODE'),
  form('FORM'),
  frequency('FREQUENCY'),
  duration('DURATION'),
  genericName('GENERIC_NAME'),
  brandName('BRAND_NAME'),
  strength('STRENGTH'),
  rate('RATE'),
  acuity('ACUITY'),
  testName('TEST_NAME'),
  testValue('TEST_VALUE'),
  testUnits('TEST_UNITS'),
  testUnit('TEST_UNIT'),
  procedureName('PROCEDURE_NAME'),
  treatmentName('TREATMENT_NAME'),
  date('DATE'),
  age('AGE'),
  contactPoint('CONTACT_POINT'),
  phoneOrFax('PHONE_OR_FAX'),
  email('EMAIL'),
  identifier('IDENTIFIER'),
  id('ID'),
  url('URL'),
  address('ADDRESS'),
  profession('PROFESSION'),
  systemOrganSite('SYSTEM_ORGAN_SITE'),
  direction('DIRECTION'),
  quality('QUALITY'),
  quantity('QUANTITY'),
  timeExpression('TIME_EXPRESSION'),
  timeToMedicationName('TIME_TO_MEDICATION_NAME'),
  timeToDxName('TIME_TO_DX_NAME'),
  timeToTestName('TIME_TO_TEST_NAME'),
  timeToProcedureName('TIME_TO_PROCEDURE_NAME'),
  timeToTreatmentName('TIME_TO_TREATMENT_NAME'),
  amount('AMOUNT'),
  gender('GENDER'),
  raceEthnicity('RACE_ETHNICITY'),
  allergies('ALLERGIES'),
  tobaccoUse('TOBACCO_USE'),
  alcoholConsumption('ALCOHOL_CONSUMPTION'),
  recDrugUse('REC_DRUG_USE'),
  ;

  final String value;

  const EntitySubType(this.value);

  static EntitySubType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum EntitySubType'));
}

enum EntityType {
  medication('MEDICATION'),
  medicalCondition('MEDICAL_CONDITION'),
  protectedHealthInformation('PROTECTED_HEALTH_INFORMATION'),
  testTreatmentProcedure('TEST_TREATMENT_PROCEDURE'),
  anatomy('ANATOMY'),
  timeExpression('TIME_EXPRESSION'),
  behavioralEnvironmentalSocial('BEHAVIORAL_ENVIRONMENTAL_SOCIAL'),
  ;

  final String value;

  const EntityType(this.value);

  static EntityType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum EntityType'));
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
      category:
          (json['Category'] as String?)?.let(ICD10CMEntityType.fromString),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      relationshipScore: json['RelationshipScore'] as double?,
      relationshipType: (json['RelationshipType'] as String?)
          ?.let(ICD10CMRelationshipType.fromString),
      score: json['Score'] as double?,
      text: json['Text'] as String?,
      traits: (json['Traits'] as List?)
          ?.whereNotNull()
          .map((e) => ICD10CMTrait.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.let(ICD10CMAttributeType.fromString),
    );
  }
}

enum ICD10CMAttributeType {
  acuity('ACUITY'),
  direction('DIRECTION'),
  systemOrganSite('SYSTEM_ORGAN_SITE'),
  quality('QUALITY'),
  quantity('QUANTITY'),
  timeToDxName('TIME_TO_DX_NAME'),
  timeExpression('TIME_EXPRESSION'),
  ;

  final String value;

  const ICD10CMAttributeType(this.value);

  static ICD10CMAttributeType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ICD10CMAttributeType'));
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
      category:
          (json['Category'] as String?)?.let(ICD10CMEntityCategory.fromString),
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
      type: (json['Type'] as String?)?.let(ICD10CMEntityType.fromString),
    );
  }
}

enum ICD10CMEntityCategory {
  medicalCondition('MEDICAL_CONDITION'),
  ;

  final String value;

  const ICD10CMEntityCategory(this.value);

  static ICD10CMEntityCategory fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum ICD10CMEntityCategory'));
}

enum ICD10CMEntityType {
  dxName('DX_NAME'),
  timeExpression('TIME_EXPRESSION'),
  ;

  final String value;

  const ICD10CMEntityType(this.value);

  static ICD10CMEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ICD10CMEntityType'));
}

enum ICD10CMRelationshipType {
  overlap('OVERLAP'),
  systemOrganSite('SYSTEM_ORGAN_SITE'),
  quality('QUALITY'),
  ;

  final String value;

  const ICD10CMRelationshipType(this.value);

  static ICD10CMRelationshipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum ICD10CMRelationshipType'));
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
      name: (json['Name'] as String?)?.let(ICD10CMTraitName.fromString),
      score: json['Score'] as double?,
    );
  }
}

enum ICD10CMTraitName {
  negation('NEGATION'),
  diagnosis('DIAGNOSIS'),
  sign('SIGN'),
  symptom('SYMPTOM'),
  pertainsToFamily('PERTAINS_TO_FAMILY'),
  hypothetical('HYPOTHETICAL'),
  lowConfidence('LOW_CONFIDENCE'),
  ;

  final String value;

  const ICD10CMTraitName(this.value);

  static ICD10CMTraitName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum ICD10CMTraitName'));
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
  submitted('SUBMITTED'),
  inProgress('IN_PROGRESS'),
  completed('COMPLETED'),
  partialSuccess('PARTIAL_SUCCESS'),
  failed('FAILED'),
  stopRequested('STOP_REQUESTED'),
  stopped('STOPPED'),
  ;

  final String value;

  const JobStatus(this.value);

  static JobStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum JobStatus'));
}

enum LanguageCode {
  en('en'),
  ;

  final String value;

  const LanguageCode(this.value);

  static LanguageCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LanguageCode'));
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
  every('EVERY'),
  withDosage('WITH_DOSAGE'),
  administeredVia('ADMINISTERED_VIA'),
  $for('FOR'),
  negative('NEGATIVE'),
  overlap('OVERLAP'),
  dosage('DOSAGE'),
  routeOrMode('ROUTE_OR_MODE'),
  form('FORM'),
  frequency('FREQUENCY'),
  duration('DURATION'),
  strength('STRENGTH'),
  rate('RATE'),
  acuity('ACUITY'),
  testValue('TEST_VALUE'),
  testUnits('TEST_UNITS'),
  testUnit('TEST_UNIT'),
  direction('DIRECTION'),
  systemOrganSite('SYSTEM_ORGAN_SITE'),
  amount('AMOUNT'),
  usage('USAGE'),
  quality('QUALITY'),
  ;

  final String value;

  const RelationshipType(this.value);

  static RelationshipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum RelationshipType'));
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
      type: (json['Type'] as String?)?.let(RxNormAttributeType.fromString),
    );
  }
}

enum RxNormAttributeType {
  dosage('DOSAGE'),
  duration('DURATION'),
  form('FORM'),
  frequency('FREQUENCY'),
  rate('RATE'),
  routeOrMode('ROUTE_OR_MODE'),
  strength('STRENGTH'),
  ;

  final String value;

  const RxNormAttributeType(this.value);

  static RxNormAttributeType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RxNormAttributeType'));
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
      category:
          (json['Category'] as String?)?.let(RxNormEntityCategory.fromString),
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
      type: (json['Type'] as String?)?.let(RxNormEntityType.fromString),
    );
  }
}

enum RxNormEntityCategory {
  medication('MEDICATION'),
  ;

  final String value;

  const RxNormEntityCategory(this.value);

  static RxNormEntityCategory fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum RxNormEntityCategory'));
}

enum RxNormEntityType {
  brandName('BRAND_NAME'),
  genericName('GENERIC_NAME'),
  ;

  final String value;

  const RxNormEntityType(this.value);

  static RxNormEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum RxNormEntityType'));
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
      name: (json['Name'] as String?)?.let(RxNormTraitName.fromString),
      score: json['Score'] as double?,
    );
  }
}

enum RxNormTraitName {
  negation('NEGATION'),
  pastHistory('PAST_HISTORY'),
  ;

  final String value;

  const RxNormTraitName(this.value);

  static RxNormTraitName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum RxNormTraitName'));
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
      category:
          (json['Category'] as String?)?.let(SNOMEDCTEntityCategory.fromString),
      endOffset: json['EndOffset'] as int?,
      id: json['Id'] as int?,
      relationshipScore: json['RelationshipScore'] as double?,
      relationshipType: (json['RelationshipType'] as String?)
          ?.let(SNOMEDCTRelationshipType.fromString),
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
      type: (json['Type'] as String?)?.let(SNOMEDCTAttributeType.fromString),
    );
  }
}

enum SNOMEDCTAttributeType {
  acuity('ACUITY'),
  quality('QUALITY'),
  direction('DIRECTION'),
  systemOrganSite('SYSTEM_ORGAN_SITE'),
  testValue('TEST_VALUE'),
  testUnit('TEST_UNIT'),
  ;

  final String value;

  const SNOMEDCTAttributeType(this.value);

  static SNOMEDCTAttributeType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SNOMEDCTAttributeType'));
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
      category:
          (json['Category'] as String?)?.let(SNOMEDCTEntityCategory.fromString),
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
      type: (json['Type'] as String?)?.let(SNOMEDCTEntityType.fromString),
    );
  }
}

enum SNOMEDCTEntityCategory {
  medicalCondition('MEDICAL_CONDITION'),
  anatomy('ANATOMY'),
  testTreatmentProcedure('TEST_TREATMENT_PROCEDURE'),
  ;

  final String value;

  const SNOMEDCTEntityCategory(this.value);

  static SNOMEDCTEntityCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SNOMEDCTEntityCategory'));
}

enum SNOMEDCTEntityType {
  dxName('DX_NAME'),
  testName('TEST_NAME'),
  procedureName('PROCEDURE_NAME'),
  treatmentName('TREATMENT_NAME'),
  ;

  final String value;

  const SNOMEDCTEntityType(this.value);

  static SNOMEDCTEntityType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () =>
          throw Exception('$value is not known in enum SNOMEDCTEntityType'));
}

enum SNOMEDCTRelationshipType {
  acuity('ACUITY'),
  quality('QUALITY'),
  testValue('TEST_VALUE'),
  testUnits('TEST_UNITS'),
  direction('DIRECTION'),
  systemOrganSite('SYSTEM_ORGAN_SITE'),
  testUnit('TEST_UNIT'),
  ;

  final String value;

  const SNOMEDCTRelationshipType(this.value);

  static SNOMEDCTRelationshipType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SNOMEDCTRelationshipType'));
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
      name: (json['Name'] as String?)?.let(SNOMEDCTTraitName.fromString),
      score: json['Score'] as double?,
    );
  }
}

enum SNOMEDCTTraitName {
  negation('NEGATION'),
  diagnosis('DIAGNOSIS'),
  sign('SIGN'),
  symptom('SYMPTOM'),
  pertainsToFamily('PERTAINS_TO_FAMILY'),
  hypothetical('HYPOTHETICAL'),
  lowConfidence('LOW_CONFIDENCE'),
  pastHistory('PAST_HISTORY'),
  future('FUTURE'),
  ;

  final String value;

  const SNOMEDCTTraitName(this.value);

  static SNOMEDCTTraitName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SNOMEDCTTraitName'));
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
      name: (json['Name'] as String?)?.let(AttributeName.fromString),
      score: json['Score'] as double?,
    );
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
      type: (json['Type'] as String?)?.let(EntityType.fromString),
    );
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
