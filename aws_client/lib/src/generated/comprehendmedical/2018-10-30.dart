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

part '2018-10-30.g.dart';

/// Amazon Comprehend Medical extracts structured information from unstructured
/// clinical text. Use these actions to gain insight in your documents.
class ComprehendMedical {
  final _s.JsonProtocol _protocol;
  ComprehendMedical({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'comprehendmedical',
            signingName: 'comprehendmedical',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String jobId,
  }) async {
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
    @_s.required String jobId,
  }) async {
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
    @_s.required String jobId,
  }) async {
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
    @_s.required String jobId,
  }) async {
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

  /// The <code>DetectEntities</code> operation is deprecated. You should use
  /// the <a>DetectEntitiesV2</a> operation instead.
  ///
  /// Inspects the clinical text for a variety of medical entities and returns
  /// specific information about them such as entity category, location, and
  /// confidence score on that information .
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
  /// entities. Each string must contain fewer than 20,000 bytes of characters.
  @Deprecated('Deprecated')
  Future<DetectEntitiesResponse> detectEntities({
    @_s.required String text,
  }) async {
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      20000,
      isRequired: true,
    );
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
  /// entities. Each string must contain fewer than 20,000 bytes of characters.
  Future<DetectEntitiesV2Response> detectEntitiesV2({
    @_s.required String text,
  }) async {
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      20000,
      isRequired: true,
    );
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
  /// entities. Each string must contain fewer than 20,000 bytes of characters.
  Future<DetectPHIResponse> detectPHI({
    @_s.required String text,
  }) async {
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      20000,
      isRequired: true,
    );
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
  /// The input text used for analysis. The input for InferICD10CM is a string
  /// from 1 to 10000 characters.
  Future<InferICD10CMResponse> inferICD10CM({
    @_s.required String text,
  }) async {
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      10000,
      isRequired: true,
    );
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
  /// The input text used for analysis. The input for InferRxNorm is a string
  /// from 1 to 10000 characters.
  Future<InferRxNormResponse> inferRxNorm({
    @_s.required String text,
  }) async {
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      10000,
      isRequired: true,
    );
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
    ComprehendMedicalAsyncJobFilter filter,
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
      1,
      1152921504606846976,
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
    ComprehendMedicalAsyncJobFilter filter,
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
      1,
      1152921504606846976,
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

  /// Gets a list of protected health information (PHI) detection jobs that you
  /// have submitted.
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
    ComprehendMedicalAsyncJobFilter filter,
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
      1,
      1152921504606846976,
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
    ComprehendMedicalAsyncJobFilter filter,
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
      1,
      1152921504606846976,
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
  Future<StartEntitiesDetectionV2JobResponse> startEntitiesDetectionV2Job({
    @_s.required String dataAccessRoleArn,
    @_s.required InputDataConfig inputDataConfig,
    @_s.required LanguageCode languageCode,
    @_s.required OutputDataConfig outputDataConfig,
    String clientRequestToken,
    String jobName,
    String kMSKey,
  }) async {
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
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      1,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''.*''',
    );
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
        'LanguageCode': languageCode?.toValue() ?? '',
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
    @_s.required String dataAccessRoleArn,
    @_s.required InputDataConfig inputDataConfig,
    @_s.required LanguageCode languageCode,
    @_s.required OutputDataConfig outputDataConfig,
    String clientRequestToken,
    String jobName,
    String kMSKey,
  }) async {
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
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      1,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''.*''',
    );
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
        'LanguageCode': languageCode?.toValue() ?? '',
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
    @_s.required String dataAccessRoleArn,
    @_s.required InputDataConfig inputDataConfig,
    @_s.required LanguageCode languageCode,
    @_s.required OutputDataConfig outputDataConfig,
    String clientRequestToken,
    String jobName,
    String kMSKey,
  }) async {
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
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      1,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''.*''',
    );
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
        'LanguageCode': languageCode?.toValue() ?? '',
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
    @_s.required String dataAccessRoleArn,
    @_s.required InputDataConfig inputDataConfig,
    @_s.required LanguageCode languageCode,
    @_s.required OutputDataConfig outputDataConfig,
    String clientRequestToken,
    String jobName,
    String kMSKey,
  }) async {
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
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''^[a-zA-Z0-9-]+$''',
    );
    _s.validateStringLength(
      'jobName',
      jobName,
      1,
      256,
    );
    _s.validateStringPattern(
      'jobName',
      jobName,
      r'''^([\p{L}\p{Z}\p{N}_.:/=+\-%@]*)$''',
    );
    _s.validateStringLength(
      'kMSKey',
      kMSKey,
      1,
      2048,
    );
    _s.validateStringPattern(
      'kMSKey',
      kMSKey,
      r'''.*''',
    );
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
        'LanguageCode': languageCode?.toValue() ?? '',
        'OutputDataConfig': outputDataConfig,
        'ClientRequestToken':
            clientRequestToken ?? _s.generateIdempotencyToken(),
        if (jobName != null) 'JobName': jobName,
        if (kMSKey != null) 'KMSKey': kMSKey,
      },
    );

    return StartRxNormInferenceJobResponse.fromJson(jsonResponse.body);
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
    @_s.required String jobId,
  }) async {
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
    @_s.required String jobId,
  }) async {
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
    @_s.required String jobId,
  }) async {
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
    @_s.required String jobId,
  }) async {
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
}

/// An extracted segment of the text that is an attribute of an entity, or
/// otherwise related to an entity, such as the dosage of a medication taken. It
/// contains information about the attribute such as id, begin and end offset
/// within the input text, and the segment of the input text.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Attribute {
  /// The 0-based character offset in the input text that shows where the
  /// attribute begins. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'BeginOffset')
  final int beginOffset;

  /// The category of attribute.
  @_s.JsonKey(name: 'Category')
  final EntityType category;

  /// The 0-based character offset in the input text that shows where the
  /// attribute ends. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'EndOffset')
  final int endOffset;

  /// The numeric identifier for this attribute. This is a monotonically
  /// increasing id unique within this response rather than a global unique
  /// identifier.
  @_s.JsonKey(name: 'Id')
  final int id;

  /// The level of confidence that Amazon Comprehend Medical has that this
  /// attribute is correctly related to this entity.
  @_s.JsonKey(name: 'RelationshipScore')
  final double relationshipScore;

  /// The type of relationship between the entity and attribute. Type for the
  /// relationship is <code>OVERLAP</code>, indicating that the entity occurred at
  /// the same time as the <code>Date_Expression</code>.
  @_s.JsonKey(name: 'RelationshipType')
  final RelationshipType relationshipType;

  /// The level of confidence that Amazon Comprehend Medical has that the segment
  /// of text is correctly recognized as an attribute.
  @_s.JsonKey(name: 'Score')
  final double score;

  /// The segment of input text extracted as this attribute.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// Contextual information for this attribute.
  @_s.JsonKey(name: 'Traits')
  final List<Trait> traits;

  /// The type of attribute.
  @_s.JsonKey(name: 'Type')
  final EntitySubType type;

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
  factory Attribute.fromJson(Map<String, dynamic> json) =>
      _$AttributeFromJson(json);
}

enum AttributeName {
  @_s.JsonValue('SIGN')
  sign,
  @_s.JsonValue('SYMPTOM')
  symptom,
  @_s.JsonValue('DIAGNOSIS')
  diagnosis,
  @_s.JsonValue('NEGATION')
  negation,
}

/// Provides information for filtering a list of detection jobs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ComprehendMedicalAsyncJobFilter {
  /// Filters on the name of the job.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// Filters the list of jobs based on job status. Returns only jobs with the
  /// specified status.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted after the specified time. Jobs are
  /// returned in descending order, newest to oldest.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubmitTimeAfter')
  final DateTime submitTimeAfter;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing. Returns only jobs submitted before the specified time. Jobs are
  /// returned in ascending order, oldest to newest.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubmitTimeBefore')
  final DateTime submitTimeBefore;

  ComprehendMedicalAsyncJobFilter({
    this.jobName,
    this.jobStatus,
    this.submitTimeAfter,
    this.submitTimeBefore,
  });
  Map<String, dynamic> toJson() =>
      _$ComprehendMedicalAsyncJobFilterToJson(this);
}

/// Provides information about a detection job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComprehendMedicalAsyncJobProperties {
  /// The Amazon Resource Name (ARN) that gives Amazon Comprehend Medical read
  /// access to your input data.
  @_s.JsonKey(name: 'DataAccessRoleArn')
  final String dataAccessRoleArn;

  /// The time that the detection job completed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The date and time that job metadata is deleted from the server. Output files
  /// in your S3 bucket will not be deleted. After the metadata is deleted, the
  /// job will no longer appear in the results of the
  /// <code>ListEntitiesDetectionV2Job</code> or the
  /// <code>ListPHIDetectionJobs</code> operation.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationTime')
  final DateTime expirationTime;

  /// The input data configuration that you supplied when you created the
  /// detection job.
  @_s.JsonKey(name: 'InputDataConfig')
  final InputDataConfig inputDataConfig;

  /// The identifier assigned to the detection job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The name that you assigned to the detection job.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The current status of the detection job. If the status is
  /// <code>FAILED</code>, the <code>Message</code> field shows the reason for the
  /// failure.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// The AWS Key Management Service key, if any, used to encrypt the output
  /// files.
  @_s.JsonKey(name: 'KMSKey')
  final String kMSKey;

  /// The language code of the input documents.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// The path to the file that describes the results of a batch job.
  @_s.JsonKey(name: 'ManifestFilePath')
  final String manifestFilePath;

  /// A description of the status of a job.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The version of the model used to analyze the documents. The version number
  /// looks like X.X.X. You can use this information to track the model used for a
  /// particular batch of documents.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// The output data configuration that you supplied when you created the
  /// detection job.
  @_s.JsonKey(name: 'OutputDataConfig')
  final OutputDataConfig outputDataConfig;

  /// The time that the detection job was submitted for processing.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'SubmitTime')
  final DateTime submitTime;

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
          Map<String, dynamic> json) =>
      _$ComprehendMedicalAsyncJobPropertiesFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeEntitiesDetectionV2JobResponse {
  /// An object that contains the properties associated with a detection job.
  @_s.JsonKey(name: 'ComprehendMedicalAsyncJobProperties')
  final ComprehendMedicalAsyncJobProperties comprehendMedicalAsyncJobProperties;

  DescribeEntitiesDetectionV2JobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });
  factory DescribeEntitiesDetectionV2JobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeEntitiesDetectionV2JobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeICD10CMInferenceJobResponse {
  /// An object that contains the properties associated with a detection job.
  @_s.JsonKey(name: 'ComprehendMedicalAsyncJobProperties')
  final ComprehendMedicalAsyncJobProperties comprehendMedicalAsyncJobProperties;

  DescribeICD10CMInferenceJobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });
  factory DescribeICD10CMInferenceJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeICD10CMInferenceJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribePHIDetectionJobResponse {
  /// An object that contains the properties associated with a detection job.
  @_s.JsonKey(name: 'ComprehendMedicalAsyncJobProperties')
  final ComprehendMedicalAsyncJobProperties comprehendMedicalAsyncJobProperties;

  DescribePHIDetectionJobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });
  factory DescribePHIDetectionJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribePHIDetectionJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRxNormInferenceJobResponse {
  /// An object that contains the properties associated with a detection job.
  @_s.JsonKey(name: 'ComprehendMedicalAsyncJobProperties')
  final ComprehendMedicalAsyncJobProperties comprehendMedicalAsyncJobProperties;

  DescribeRxNormInferenceJobResponse({
    this.comprehendMedicalAsyncJobProperties,
  });
  factory DescribeRxNormInferenceJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRxNormInferenceJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectEntitiesResponse {
  /// The collection of medical entities extracted from the input text and their
  /// associated information. For each entity, the response provides the entity
  /// text, the entity category, where the entity text begins and ends, and the
  /// level of confidence that Amazon Comprehend Medical has in the detection and
  /// analysis. Attributes and traits of the entity are also returned.
  @_s.JsonKey(name: 'Entities')
  final List<Entity> entities;

  /// The version of the model used to analyze the documents. The version number
  /// looks like X.X.X. You can use this information to track the model used for a
  /// particular batch of documents.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// If the result of the previous request to <code>DetectEntities</code> was
  /// truncated, include the <code>PaginationToken</code> to fetch the next page
  /// of entities.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  /// Attributes extracted from the input text that we were unable to relate to an
  /// entity.
  @_s.JsonKey(name: 'UnmappedAttributes')
  final List<UnmappedAttribute> unmappedAttributes;

  DetectEntitiesResponse({
    @_s.required this.entities,
    @_s.required this.modelVersion,
    this.paginationToken,
    this.unmappedAttributes,
  });
  factory DetectEntitiesResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectEntitiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectEntitiesV2Response {
  /// The collection of medical entities extracted from the input text and their
  /// associated information. For each entity, the response provides the entity
  /// text, the entity category, where the entity text begins and ends, and the
  /// level of confidence in the detection and analysis. Attributes and traits of
  /// the entity are also returned.
  @_s.JsonKey(name: 'Entities')
  final List<Entity> entities;

  /// The version of the model used to analyze the documents. The version number
  /// looks like X.X.X. You can use this information to track the model used for a
  /// particular batch of documents.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// If the result to the <code>DetectEntitiesV2</code> operation was truncated,
  /// include the <code>PaginationToken</code> to fetch the next page of entities.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  /// Attributes extracted from the input text that couldn't be related to an
  /// entity.
  @_s.JsonKey(name: 'UnmappedAttributes')
  final List<UnmappedAttribute> unmappedAttributes;

  DetectEntitiesV2Response({
    @_s.required this.entities,
    @_s.required this.modelVersion,
    this.paginationToken,
    this.unmappedAttributes,
  });
  factory DetectEntitiesV2Response.fromJson(Map<String, dynamic> json) =>
      _$DetectEntitiesV2ResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DetectPHIResponse {
  /// The collection of PHI entities extracted from the input text and their
  /// associated information. For each entity, the response provides the entity
  /// text, the entity category, where the entity text begins and ends, and the
  /// level of confidence that Amazon Comprehend Medical has in its detection.
  @_s.JsonKey(name: 'Entities')
  final List<Entity> entities;

  /// The version of the model used to analyze the documents. The version number
  /// looks like X.X.X. You can use this information to track the model used for a
  /// particular batch of documents.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// If the result of the previous request to <code>DetectPHI</code> was
  /// truncated, include the <code>PaginationToken</code> to fetch the next page
  /// of PHI entities.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  DetectPHIResponse({
    @_s.required this.entities,
    @_s.required this.modelVersion,
    this.paginationToken,
  });
  factory DetectPHIResponse.fromJson(Map<String, dynamic> json) =>
      _$DetectPHIResponseFromJson(json);
}

/// Provides information about an extracted medical entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Entity {
  /// The extracted attributes that relate to this entity.
  @_s.JsonKey(name: 'Attributes')
  final List<Attribute> attributes;

  /// The 0-based character offset in the input text that shows where the entity
  /// begins. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'BeginOffset')
  final int beginOffset;

  /// The category of the entity.
  @_s.JsonKey(name: 'Category')
  final EntityType category;

  /// The 0-based character offset in the input text that shows where the entity
  /// ends. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'EndOffset')
  final int endOffset;

  /// The numeric identifier for the entity. This is a monotonically increasing id
  /// unique within this response rather than a global unique identifier.
  @_s.JsonKey(name: 'Id')
  final int id;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detection.
  @_s.JsonKey(name: 'Score')
  final double score;

  /// The segment of input text extracted as this entity.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// Contextual information for the entity.
  @_s.JsonKey(name: 'Traits')
  final List<Trait> traits;

  /// Describes the specific type of entity with category of entities.
  @_s.JsonKey(name: 'Type')
  final EntitySubType type;

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
  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
}

enum EntitySubType {
  @_s.JsonValue('NAME')
  name,
  @_s.JsonValue('DOSAGE')
  dosage,
  @_s.JsonValue('ROUTE_OR_MODE')
  routeOrMode,
  @_s.JsonValue('FORM')
  form,
  @_s.JsonValue('FREQUENCY')
  frequency,
  @_s.JsonValue('DURATION')
  duration,
  @_s.JsonValue('GENERIC_NAME')
  genericName,
  @_s.JsonValue('BRAND_NAME')
  brandName,
  @_s.JsonValue('STRENGTH')
  strength,
  @_s.JsonValue('RATE')
  rate,
  @_s.JsonValue('ACUITY')
  acuity,
  @_s.JsonValue('TEST_NAME')
  testName,
  @_s.JsonValue('TEST_VALUE')
  testValue,
  @_s.JsonValue('TEST_UNITS')
  testUnits,
  @_s.JsonValue('PROCEDURE_NAME')
  procedureName,
  @_s.JsonValue('TREATMENT_NAME')
  treatmentName,
  @_s.JsonValue('DATE')
  date,
  @_s.JsonValue('AGE')
  age,
  @_s.JsonValue('CONTACT_POINT')
  contactPoint,
  @_s.JsonValue('EMAIL')
  email,
  @_s.JsonValue('IDENTIFIER')
  identifier,
  @_s.JsonValue('URL')
  url,
  @_s.JsonValue('ADDRESS')
  address,
  @_s.JsonValue('PROFESSION')
  profession,
  @_s.JsonValue('SYSTEM_ORGAN_SITE')
  systemOrganSite,
  @_s.JsonValue('DIRECTION')
  direction,
  @_s.JsonValue('QUALITY')
  quality,
  @_s.JsonValue('QUANTITY')
  quantity,
  @_s.JsonValue('TIME_EXPRESSION')
  timeExpression,
  @_s.JsonValue('TIME_TO_MEDICATION_NAME')
  timeToMedicationName,
  @_s.JsonValue('TIME_TO_DX_NAME')
  timeToDxName,
  @_s.JsonValue('TIME_TO_TEST_NAME')
  timeToTestName,
  @_s.JsonValue('TIME_TO_PROCEDURE_NAME')
  timeToProcedureName,
  @_s.JsonValue('TIME_TO_TREATMENT_NAME')
  timeToTreatmentName,
}

enum EntityType {
  @_s.JsonValue('MEDICATION')
  medication,
  @_s.JsonValue('MEDICAL_CONDITION')
  medicalCondition,
  @_s.JsonValue('PROTECTED_HEALTH_INFORMATION')
  protectedHealthInformation,
  @_s.JsonValue('TEST_TREATMENT_PROCEDURE')
  testTreatmentProcedure,
  @_s.JsonValue('ANATOMY')
  anatomy,
  @_s.JsonValue('TIME_EXPRESSION')
  timeExpression,
}

/// The detected attributes that relate to an entity. This includes an extracted
/// segment of the text that is an attribute of an entity, or otherwise related
/// to an entity. InferICD10CM detects the following attributes:
/// <code>Direction</code>, <code>System, Organ or Site</code>, and
/// <code>Acuity</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ICD10CMAttribute {
  /// The 0-based character offset in the input text that shows where the
  /// attribute begins. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'BeginOffset')
  final int beginOffset;

  /// The 0-based character offset in the input text that shows where the
  /// attribute ends. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'EndOffset')
  final int endOffset;

  /// The numeric identifier for this attribute. This is a monotonically
  /// increasing id unique within this response rather than a global unique
  /// identifier.
  @_s.JsonKey(name: 'Id')
  final int id;

  /// The level of confidence that Amazon Comprehend Medical has that this
  /// attribute is correctly related to this entity.
  @_s.JsonKey(name: 'RelationshipScore')
  final double relationshipScore;

  /// The level of confidence that Amazon Comprehend Medical has that the segment
  /// of text is correctly recognized as an attribute.
  @_s.JsonKey(name: 'Score')
  final double score;

  /// The segment of input text which contains the detected attribute.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// The contextual information for the attribute. The traits recognized by
  /// InferICD10CM are <code>DIAGNOSIS</code>, <code>SIGN</code>,
  /// <code>SYMPTOM</code>, and <code>NEGATION</code>.
  @_s.JsonKey(name: 'Traits')
  final List<ICD10CMTrait> traits;

  /// The type of attribute. InferICD10CM detects entities of the type
  /// <code>DX_NAME</code>.
  @_s.JsonKey(name: 'Type')
  final ICD10CMAttributeType type;

  ICD10CMAttribute({
    this.beginOffset,
    this.endOffset,
    this.id,
    this.relationshipScore,
    this.score,
    this.text,
    this.traits,
    this.type,
  });
  factory ICD10CMAttribute.fromJson(Map<String, dynamic> json) =>
      _$ICD10CMAttributeFromJson(json);
}

enum ICD10CMAttributeType {
  @_s.JsonValue('ACUITY')
  acuity,
  @_s.JsonValue('DIRECTION')
  direction,
  @_s.JsonValue('SYSTEM_ORGAN_SITE')
  systemOrganSite,
  @_s.JsonValue('QUALITY')
  quality,
  @_s.JsonValue('QUANTITY')
  quantity,
}

/// The ICD-10-CM concepts that the entity could refer to, along with a score
/// indicating the likelihood of the match.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ICD10CMConcept {
  /// The ICD-10-CM code that identifies the concept found in the knowledge base
  /// from the Centers for Disease Control.
  @_s.JsonKey(name: 'Code')
  final String code;

  /// The long description of the ICD-10-CM code in the ontology.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The level of confidence that Amazon Comprehend Medical has that the entity
  /// is accurately linked to an ICD-10-CM concept.
  @_s.JsonKey(name: 'Score')
  final double score;

  ICD10CMConcept({
    this.code,
    this.description,
    this.score,
  });
  factory ICD10CMConcept.fromJson(Map<String, dynamic> json) =>
      _$ICD10CMConceptFromJson(json);
}

/// The collection of medical entities extracted from the input text and their
/// associated information. For each entity, the response provides the entity
/// text, the entity category, where the entity text begins and ends, and the
/// level of confidence that Amazon Comprehend Medical has in the detection and
/// analysis. Attributes and traits of the entity are also returned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ICD10CMEntity {
  /// The detected attributes that relate to the entity. An extracted segment of
  /// the text that is an attribute of an entity, or otherwise related to an
  /// entity, such as the nature of a medical condition.
  @_s.JsonKey(name: 'Attributes')
  final List<ICD10CMAttribute> attributes;

  /// The 0-based character offset in the input text that shows where the entity
  /// begins. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'BeginOffset')
  final int beginOffset;

  /// The category of the entity. InferICD10CM detects entities in the
  /// <code>MEDICAL_CONDITION</code> category.
  @_s.JsonKey(name: 'Category')
  final ICD10CMEntityCategory category;

  /// The 0-based character offset in the input text that shows where the entity
  /// ends. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'EndOffset')
  final int endOffset;

  /// The ICD-10-CM concepts that the entity could refer to, along with a score
  /// indicating the likelihood of the match.
  @_s.JsonKey(name: 'ICD10CMConcepts')
  final List<ICD10CMConcept> iCD10CMConcepts;

  /// The numeric identifier for the entity. This is a monotonically increasing id
  /// unique within this response rather than a global unique identifier.
  @_s.JsonKey(name: 'Id')
  final int id;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detection.
  @_s.JsonKey(name: 'Score')
  final double score;

  /// The segment of input text that is matched to the detected entity.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// Provides Contextual information for the entity. The traits recognized by
  /// InferICD10CM are <code>DIAGNOSIS</code>, <code>SIGN</code>,
  /// <code>SYMPTOM</code>, and <code>NEGATION.</code>
  @_s.JsonKey(name: 'Traits')
  final List<ICD10CMTrait> traits;

  /// Describes the specific type of entity with category of entities.
  /// InferICD10CM detects entities of the type <code>DX_NAME</code>.
  @_s.JsonKey(name: 'Type')
  final ICD10CMEntityType type;

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
  factory ICD10CMEntity.fromJson(Map<String, dynamic> json) =>
      _$ICD10CMEntityFromJson(json);
}

enum ICD10CMEntityCategory {
  @_s.JsonValue('MEDICAL_CONDITION')
  medicalCondition,
}

enum ICD10CMEntityType {
  @_s.JsonValue('DX_NAME')
  dxName,
}

/// Contextual information for the entity. The traits recognized by InferICD10CM
/// are <code>DIAGNOSIS</code>, <code>SIGN</code>, <code>SYMPTOM</code>, and
/// <code>NEGATION</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ICD10CMTrait {
  /// Provides a name or contextual description about the trait.
  @_s.JsonKey(name: 'Name')
  final ICD10CMTraitName name;

  /// The level of confidence that Amazon Comprehend Medical has that the segment
  /// of text is correctly recognized as a trait.
  @_s.JsonKey(name: 'Score')
  final double score;

  ICD10CMTrait({
    this.name,
    this.score,
  });
  factory ICD10CMTrait.fromJson(Map<String, dynamic> json) =>
      _$ICD10CMTraitFromJson(json);
}

enum ICD10CMTraitName {
  @_s.JsonValue('NEGATION')
  negation,
  @_s.JsonValue('DIAGNOSIS')
  diagnosis,
  @_s.JsonValue('SIGN')
  sign,
  @_s.JsonValue('SYMPTOM')
  symptom,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InferICD10CMResponse {
  /// The medical conditions detected in the text linked to ICD-10-CM concepts. If
  /// the action is successful, the service sends back an HTTP 200 response, as
  /// well as the entities detected.
  @_s.JsonKey(name: 'Entities')
  final List<ICD10CMEntity> entities;

  /// The version of the model used to analyze the documents, in the format
  /// <i>n</i>.<i>n</i>.<i>n</i> You can use this information to track the model
  /// used for a particular batch of documents.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// If the result of the previous request to <code>InferICD10CM</code> was
  /// truncated, include the <code>PaginationToken</code> to fetch the next page
  /// of medical condition entities.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  InferICD10CMResponse({
    @_s.required this.entities,
    this.modelVersion,
    this.paginationToken,
  });
  factory InferICD10CMResponse.fromJson(Map<String, dynamic> json) =>
      _$InferICD10CMResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InferRxNormResponse {
  /// The medication entities detected in the text linked to RxNorm concepts. If
  /// the action is successful, the service sends back an HTTP 200 response, as
  /// well as the entities detected.
  @_s.JsonKey(name: 'Entities')
  final List<RxNormEntity> entities;

  /// The version of the model used to analyze the documents, in the format
  /// <i>n</i>.<i>n</i>.<i>n</i> You can use this information to track the model
  /// used for a particular batch of documents.
  @_s.JsonKey(name: 'ModelVersion')
  final String modelVersion;

  /// If the result of the previous request to <code>InferRxNorm</code> was
  /// truncated, include the <code>PaginationToken</code> to fetch the next page
  /// of medication entities.
  @_s.JsonKey(name: 'PaginationToken')
  final String paginationToken;

  InferRxNormResponse({
    @_s.required this.entities,
    this.modelVersion,
    this.paginationToken,
  });
  factory InferRxNormResponse.fromJson(Map<String, dynamic> json) =>
      _$InferRxNormResponseFromJson(json);
}

/// The input properties for an entities detection job. This includes the name
/// of the S3 bucket and the path to the files to be analyzed. See
/// <a>batch-manifest</a> for more information.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputDataConfig {
  /// The URI of the S3 bucket that contains the input data. The bucket must be in
  /// the same region as the API endpoint that you are calling.
  ///
  /// Each file in the document collection must be less than 40 KB. You can store
  /// a maximum of 30 GB in the bucket.
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The path to the input data files in the S3 bucket.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  InputDataConfig({
    @_s.required this.s3Bucket,
    this.s3Key,
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
  @_s.JsonValue('PARTIAL_SUCCESS')
  partialSuccess,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('STOP_REQUESTED')
  stopRequested,
  @_s.JsonValue('STOPPED')
  stopped,
}

enum LanguageCode {
  @_s.JsonValue('en')
  en,
}

extension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.en:
        return 'en';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListEntitiesDetectionV2JobsResponse {
  /// A list containing the properties of each job returned.
  @_s.JsonKey(name: 'ComprehendMedicalAsyncJobPropertiesList')
  final List<ComprehendMedicalAsyncJobProperties>
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListEntitiesDetectionV2JobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });
  factory ListEntitiesDetectionV2JobsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListEntitiesDetectionV2JobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListICD10CMInferenceJobsResponse {
  /// A list containing the properties of each job that is returned.
  @_s.JsonKey(name: 'ComprehendMedicalAsyncJobPropertiesList')
  final List<ComprehendMedicalAsyncJobProperties>
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListICD10CMInferenceJobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });
  factory ListICD10CMInferenceJobsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListICD10CMInferenceJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPHIDetectionJobsResponse {
  /// A list containing the properties of each job returned.
  @_s.JsonKey(name: 'ComprehendMedicalAsyncJobPropertiesList')
  final List<ComprehendMedicalAsyncJobProperties>
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListPHIDetectionJobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });
  factory ListPHIDetectionJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPHIDetectionJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRxNormInferenceJobsResponse {
  /// The maximum number of results to return in each page. The default is 100.
  @_s.JsonKey(name: 'ComprehendMedicalAsyncJobPropertiesList')
  final List<ComprehendMedicalAsyncJobProperties>
      comprehendMedicalAsyncJobPropertiesList;

  /// Identifies the next page of results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListRxNormInferenceJobsResponse({
    this.comprehendMedicalAsyncJobPropertiesList,
    this.nextToken,
  });
  factory ListRxNormInferenceJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRxNormInferenceJobsResponseFromJson(json);
}

/// The output properties for a detection job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputDataConfig {
  /// When you use the <code>OutputDataConfig</code> object with asynchronous
  /// operations, you specify the Amazon S3 location where you want to write the
  /// output data. The URI must be in the same region as the API endpoint that you
  /// are calling. The location is used as the prefix for the actual location of
  /// the output.
  @_s.JsonKey(name: 'S3Bucket')
  final String s3Bucket;

  /// The path to the output data files in the S3 bucket. Amazon Comprehend
  /// Medical creates an output directory using the job ID so that the output from
  /// one job does not overwrite the output of another.
  @_s.JsonKey(name: 'S3Key')
  final String s3Key;

  OutputDataConfig({
    @_s.required this.s3Bucket,
    this.s3Key,
  });
  factory OutputDataConfig.fromJson(Map<String, dynamic> json) =>
      _$OutputDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OutputDataConfigToJson(this);
}

enum RelationshipType {
  @_s.JsonValue('EVERY')
  every,
  @_s.JsonValue('WITH_DOSAGE')
  withDosage,
  @_s.JsonValue('ADMINISTERED_VIA')
  administeredVia,
  @_s.JsonValue('FOR')
  $for,
  @_s.JsonValue('NEGATIVE')
  negative,
  @_s.JsonValue('OVERLAP')
  overlap,
  @_s.JsonValue('DOSAGE')
  dosage,
  @_s.JsonValue('ROUTE_OR_MODE')
  routeOrMode,
  @_s.JsonValue('FORM')
  form,
  @_s.JsonValue('FREQUENCY')
  frequency,
  @_s.JsonValue('DURATION')
  duration,
  @_s.JsonValue('STRENGTH')
  strength,
  @_s.JsonValue('RATE')
  rate,
  @_s.JsonValue('ACUITY')
  acuity,
  @_s.JsonValue('TEST_VALUE')
  testValue,
  @_s.JsonValue('TEST_UNITS')
  testUnits,
  @_s.JsonValue('DIRECTION')
  direction,
  @_s.JsonValue('SYSTEM_ORGAN_SITE')
  systemOrganSite,
}

/// The extracted attributes that relate to this entity. The attributes
/// recognized by InferRxNorm are <code>DOSAGE</code>, <code>DURATION</code>,
/// <code>FORM</code>, <code>FREQUENCY</code>, <code>RATE</code>,
/// <code>ROUTE_OR_MODE</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RxNormAttribute {
  /// The 0-based character offset in the input text that shows where the
  /// attribute begins. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'BeginOffset')
  final int beginOffset;

  /// The 0-based character offset in the input text that shows where the
  /// attribute ends. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'EndOffset')
  final int endOffset;

  /// The numeric identifier for this attribute. This is a monotonically
  /// increasing id unique within this response rather than a global unique
  /// identifier.
  @_s.JsonKey(name: 'Id')
  final int id;

  /// The level of confidence that Amazon Comprehend Medical has that the
  /// attribute is accurately linked to an entity.
  @_s.JsonKey(name: 'RelationshipScore')
  final double relationshipScore;

  /// The level of confidence that Comprehend Medical has that the segment of text
  /// is correctly recognized as an attribute.
  @_s.JsonKey(name: 'Score')
  final double score;

  /// The segment of input text which corresponds to the detected attribute.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// Contextual information for the attribute. InferRxNorm recognizes the trait
  /// <code>NEGATION</code> for attributes, i.e. that the patient is not taking a
  /// specific dose or form of a medication.
  @_s.JsonKey(name: 'Traits')
  final List<RxNormTrait> traits;

  /// The type of attribute. The types of attributes recognized by InferRxNorm are
  /// <code>BRAND_NAME</code> and <code>GENERIC_NAME</code>.
  @_s.JsonKey(name: 'Type')
  final RxNormAttributeType type;

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
  factory RxNormAttribute.fromJson(Map<String, dynamic> json) =>
      _$RxNormAttributeFromJson(json);
}

enum RxNormAttributeType {
  @_s.JsonValue('DOSAGE')
  dosage,
  @_s.JsonValue('DURATION')
  duration,
  @_s.JsonValue('FORM')
  form,
  @_s.JsonValue('FREQUENCY')
  frequency,
  @_s.JsonValue('RATE')
  rate,
  @_s.JsonValue('ROUTE_OR_MODE')
  routeOrMode,
  @_s.JsonValue('STRENGTH')
  strength,
}

/// The RxNorm concept that the entity could refer to, along with a score
/// indicating the likelihood of the match.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RxNormConcept {
  /// RxNorm concept ID, also known as the RxCUI.
  @_s.JsonKey(name: 'Code')
  final String code;

  /// The description of the RxNorm concept.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The level of confidence that Amazon Comprehend Medical has that the entity
  /// is accurately linked to the reported RxNorm concept.
  @_s.JsonKey(name: 'Score')
  final double score;

  RxNormConcept({
    this.code,
    this.description,
    this.score,
  });
  factory RxNormConcept.fromJson(Map<String, dynamic> json) =>
      _$RxNormConceptFromJson(json);
}

/// The collection of medical entities extracted from the input text and their
/// associated information. For each entity, the response provides the entity
/// text, the entity category, where the entity text begins and ends, and the
/// level of confidence that Amazon Comprehend Medical has in the detection and
/// analysis. Attributes and traits of the entity are also returned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RxNormEntity {
  /// The extracted attributes that relate to the entity. The attributes
  /// recognized by InferRxNorm are <code>DOSAGE</code>, <code>DURATION</code>,
  /// <code>FORM</code>, <code>FREQUENCY</code>, <code>RATE</code>,
  /// <code>ROUTE_OR_MODE</code>, and <code>STRENGTH</code>.
  @_s.JsonKey(name: 'Attributes')
  final List<RxNormAttribute> attributes;

  /// The 0-based character offset in the input text that shows where the entity
  /// begins. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'BeginOffset')
  final int beginOffset;

  /// The category of the entity. The recognized categories are
  /// <code>GENERIC</code> or <code>BRAND_NAME</code>.
  @_s.JsonKey(name: 'Category')
  final RxNormEntityCategory category;

  /// The 0-based character offset in the input text that shows where the entity
  /// ends. The offset returns the UTF-8 code point in the string.
  @_s.JsonKey(name: 'EndOffset')
  final int endOffset;

  /// The numeric identifier for the entity. This is a monotonically increasing id
  /// unique within this response rather than a global unique identifier.
  @_s.JsonKey(name: 'Id')
  final int id;

  /// The RxNorm concepts that the entity could refer to, along with a score
  /// indicating the likelihood of the match.
  @_s.JsonKey(name: 'RxNormConcepts')
  final List<RxNormConcept> rxNormConcepts;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detected entity.
  @_s.JsonKey(name: 'Score')
  final double score;

  /// The segment of input text extracted from which the entity was detected.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// Contextual information for the entity.
  @_s.JsonKey(name: 'Traits')
  final List<RxNormTrait> traits;

  /// Describes the specific type of entity. For InferRxNorm, the recognized
  /// entity type is <code>MEDICATION</code>.
  @_s.JsonKey(name: 'Type')
  final RxNormEntityType type;

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
  factory RxNormEntity.fromJson(Map<String, dynamic> json) =>
      _$RxNormEntityFromJson(json);
}

enum RxNormEntityCategory {
  @_s.JsonValue('MEDICATION')
  medication,
}

enum RxNormEntityType {
  @_s.JsonValue('BRAND_NAME')
  brandName,
  @_s.JsonValue('GENERIC_NAME')
  genericName,
}

/// The contextual information for the entity. InferRxNorm recognizes the trait
/// <code>NEGATION</code>, which is any indication that the patient is not
/// taking a medication.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RxNormTrait {
  /// Provides a name or contextual description about the trait.
  @_s.JsonKey(name: 'Name')
  final RxNormTraitName name;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of the detected trait.
  @_s.JsonKey(name: 'Score')
  final double score;

  RxNormTrait({
    this.name,
    this.score,
  });
  factory RxNormTrait.fromJson(Map<String, dynamic> json) =>
      _$RxNormTraitFromJson(json);
}

enum RxNormTraitName {
  @_s.JsonValue('NEGATION')
  negation,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartEntitiesDetectionV2JobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the <code>DescribeEntitiesDetectionV2Job</code> operation.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartEntitiesDetectionV2JobResponse({
    this.jobId,
  });
  factory StartEntitiesDetectionV2JobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartEntitiesDetectionV2JobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartICD10CMInferenceJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the <code>StartICD10CMInferenceJob</code> operation.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartICD10CMInferenceJobResponse({
    this.jobId,
  });
  factory StartICD10CMInferenceJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartICD10CMInferenceJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartPHIDetectionJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// identifier with the <code>DescribePHIDetectionJob</code> operation.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartPHIDetectionJobResponse({
    this.jobId,
  });
  factory StartPHIDetectionJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartPHIDetectionJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartRxNormInferenceJobResponse {
  /// The identifier of the job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StartRxNormInferenceJobResponse({
    this.jobId,
  });
  factory StartRxNormInferenceJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartRxNormInferenceJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopEntitiesDetectionV2JobResponse {
  /// The identifier of the medical entities detection job that was stopped.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StopEntitiesDetectionV2JobResponse({
    this.jobId,
  });
  factory StopEntitiesDetectionV2JobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StopEntitiesDetectionV2JobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopICD10CMInferenceJobResponse {
  /// The identifier generated for the job. To get the status of job, use this
  /// identifier with the <code>DescribeICD10CMInferenceJob</code> operation.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StopICD10CMInferenceJobResponse({
    this.jobId,
  });
  factory StopICD10CMInferenceJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StopICD10CMInferenceJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopPHIDetectionJobResponse {
  /// The identifier of the PHI detection job that was stopped.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StopPHIDetectionJobResponse({
    this.jobId,
  });
  factory StopPHIDetectionJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StopPHIDetectionJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopRxNormInferenceJobResponse {
  /// The identifier generated for the job. To get the status of job, use this
  /// identifier with the <code>DescribeRxNormInferenceJob</code> operation.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StopRxNormInferenceJobResponse({
    this.jobId,
  });
  factory StopRxNormInferenceJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StopRxNormInferenceJobResponseFromJson(json);
}

/// Provides contextual information about the extracted entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Trait {
  /// Provides a name or contextual description about the trait.
  @_s.JsonKey(name: 'Name')
  final AttributeName name;

  /// The level of confidence that Amazon Comprehend Medical has in the accuracy
  /// of this trait.
  @_s.JsonKey(name: 'Score')
  final double score;

  Trait({
    this.name,
    this.score,
  });
  factory Trait.fromJson(Map<String, dynamic> json) => _$TraitFromJson(json);
}

/// An attribute that we extracted, but were unable to relate to an entity.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnmappedAttribute {
  /// The specific attribute that has been extracted but not mapped to an entity.
  @_s.JsonKey(name: 'Attribute')
  final Attribute attribute;

  /// The type of the attribute, could be one of the following values:
  /// "MEDICATION", "MEDICAL_CONDITION", "ANATOMY", "TEST_AND_TREATMENT_PROCEDURE"
  /// or "PROTECTED_HEALTH_INFORMATION".
  @_s.JsonKey(name: 'Type')
  final EntityType type;

  UnmappedAttribute({
    this.attribute,
    this.type,
  });
  factory UnmappedAttribute.fromJson(Map<String, dynamic> json) =>
      _$UnmappedAttributeFromJson(json);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidEncodingException extends _s.GenericAwsException {
  InvalidEncodingException({String type, String message})
      : super(type: type, code: 'InvalidEncodingException', message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TextSizeLimitExceededException extends _s.GenericAwsException {
  TextSizeLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'TextSizeLimitExceededException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String type, String message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
