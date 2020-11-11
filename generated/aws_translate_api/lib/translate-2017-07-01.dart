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
        Uint8ListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'translate-2017-07-01.g.dart';

/// Provides translation between one source language and another of the same set
/// of languages.
class Translate {
  final _s.JsonProtocol _protocol;
  Translate({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: 'translate',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// A synchronous action that deletes a custom terminology.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the custom terminology being deleted.
  Future<void> deleteTerminology({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z0-9-]_?)+$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShineFrontendService_20170701.DeleteTerminology'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DeleteTerminologyRequest(
        name: name,
      ),
    );
  }

  /// Gets the properties associated with an asycnhronous batch translation job
  /// including name, ID, status, source and target languages, input/output S3
  /// buckets, and so on.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The identifier that Amazon Translate generated for the job. The
  /// <a>StartTextTranslationJob</a> operation returns this identifier in its
  /// response.
  Future<DescribeTextTranslationJobResponse> describeTextTranslationJob({
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
          'AWSShineFrontendService_20170701.DescribeTextTranslationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: DescribeTextTranslationJobRequest(
        jobId: jobId,
      ),
    );

    return DescribeTextTranslationJobResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves a custom terminology.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [name] :
  /// The name of the custom terminology being retrieved.
  ///
  /// Parameter [terminologyDataFormat] :
  /// The data format of the custom terminology being retrieved, either CSV or
  /// TMX.
  Future<GetTerminologyResponse> getTerminology({
    @_s.required String name,
    @_s.required TerminologyDataFormat terminologyDataFormat,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z0-9-]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(terminologyDataFormat, 'terminologyDataFormat');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShineFrontendService_20170701.GetTerminology'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: GetTerminologyRequest(
        name: name,
        terminologyDataFormat: terminologyDataFormat,
      ),
    );

    return GetTerminologyResponse.fromJson(jsonResponse.body);
  }

  /// Creates or updates a custom terminology, depending on whether or not one
  /// already exists for the given terminology name. Importing a terminology
  /// with the same name as an existing one will merge the terminologies based
  /// on the chosen merge strategy. Currently, the only supported merge strategy
  /// is OVERWRITE, and so the imported terminology will overwrite an existing
  /// terminology of the same name.
  ///
  /// If you import a terminology that overwrites an existing one, the new
  /// terminology take up to 10 minutes to fully propagate and be available for
  /// use in a translation due to cache policies with the DataPlane service that
  /// performs the translations.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [LimitExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [mergeStrategy] :
  /// The merge strategy of the custom terminology being imported. Currently,
  /// only the OVERWRITE merge strategy is supported. In this case, the imported
  /// terminology will overwrite an existing terminology of the same name.
  ///
  /// Parameter [name] :
  /// The name of the custom terminology being imported.
  ///
  /// Parameter [terminologyData] :
  /// The terminology data for the custom terminology being imported.
  ///
  /// Parameter [description] :
  /// The description of the custom terminology being imported.
  ///
  /// Parameter [encryptionKey] :
  /// The encryption key for the custom terminology being imported.
  Future<ImportTerminologyResponse> importTerminology({
    @_s.required MergeStrategy mergeStrategy,
    @_s.required String name,
    @_s.required TerminologyData terminologyData,
    String description,
    EncryptionKey encryptionKey,
  }) async {
    ArgumentError.checkNotNull(mergeStrategy, 'mergeStrategy');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^([A-Za-z0-9-]_?)+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(terminologyData, 'terminologyData');
    _s.validateStringLength(
      'description',
      description,
      0,
      256,
    );
    _s.validateStringPattern(
      'description',
      description,
      r'''[\P{M}\p{M}]{0,256}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShineFrontendService_20170701.ImportTerminology'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ImportTerminologyRequest(
        mergeStrategy: mergeStrategy,
        name: name,
        terminologyData: terminologyData,
        description: description,
        encryptionKey: encryptionKey,
      ),
    );

    return ImportTerminologyResponse.fromJson(jsonResponse.body);
  }

  /// Provides a list of custom terminologies associated with your account.
  ///
  /// May throw [InvalidParameterValueException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom terminologies returned per list request.
  ///
  /// Parameter [nextToken] :
  /// If the result of the request to ListTerminologies was truncated, include
  /// the NextToken to fetch the next group of custom terminologies.
  Future<ListTerminologiesResponse> listTerminologies({
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShineFrontendService_20170701.ListTerminologies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListTerminologiesRequest(
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListTerminologiesResponse.fromJson(jsonResponse.body);
  }

  /// Gets a list of the batch translation jobs that you have submitted.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TooManyRequestsException].
  /// May throw [InvalidFilterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filter] :
  /// The parameters that specify which batch translation jobs to retrieve.
  /// Filters include job name, job status, and submission time. You can only
  /// set one filter at a time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in each page. The default value is
  /// 100.
  ///
  /// Parameter [nextToken] :
  /// The token to request the next page of results.
  Future<ListTextTranslationJobsResponse> listTextTranslationJobs({
    TextTranslationJobFilter filter,
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShineFrontendService_20170701.ListTextTranslationJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: ListTextTranslationJobsRequest(
        filter: filter,
        maxResults: maxResults,
        nextToken: nextToken,
      ),
    );

    return ListTextTranslationJobsResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous batch translation job. Batch translation jobs can
  /// be used to translate large volumes of text across multiple documents at
  /// once. For more information, see <a>async</a>.
  ///
  /// Batch translation jobs can be described with the
  /// <a>DescribeTextTranslationJob</a> operation, listed with the
  /// <a>ListTextTranslationJobs</a> operation, and stopped with the
  /// <a>StopTextTranslationJob</a> operation.
  /// <note>
  /// Amazon Translate does not support batch translation of multiple source
  /// languages at once.
  /// </note>
  ///
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedLanguagePairException].
  /// May throw [InvalidRequestException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [clientToken] :
  /// The client token of the EC2 instance calling the request. This token is
  /// auto-generated when using the Amazon Translate SDK. Otherwise, use the <a
  /// href="docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a>
  /// EC2 operation to retreive an instance's client token. For more
  /// information, see <a
  /// href="docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html#client-tokens">Client
  /// Tokens</a> in the EC2 User Guide.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of an AWS Identity Access and Management
  /// (IAM) role that grants Amazon Translate read access to your input data.
  /// For more nformation, see <a>identity-and-access-management</a>.
  ///
  /// Parameter [inputDataConfig] :
  /// Specifies the format and S3 location of the input documents for the
  /// translation job.
  ///
  /// Parameter [outputDataConfig] :
  /// Specifies the S3 folder to which your job output will be saved.
  ///
  /// Parameter [sourceLanguageCode] :
  /// The language code of the input language. For a list of language codes, see
  /// <a>what-is-languages</a>.
  ///
  /// Amazon Translate does not automatically detect a source language during
  /// batch translation jobs.
  ///
  /// Parameter [targetLanguageCodes] :
  /// The language code of the output language.
  ///
  /// Parameter [jobName] :
  /// The name of the batch translation job to be performed.
  ///
  /// Parameter [terminologyNames] :
  /// The name of the terminology to use in the batch translation job. For a
  /// list of available terminologies, use the <a>ListTerminologies</a>
  /// operation.
  Future<StartTextTranslationJobResponse> startTextTranslationJob({
    @_s.required String clientToken,
    @_s.required String dataAccessRoleArn,
    @_s.required InputDataConfig inputDataConfig,
    @_s.required OutputDataConfig outputDataConfig,
    @_s.required String sourceLanguageCode,
    @_s.required List<String> targetLanguageCodes,
    String jobName,
    List<String> terminologyNames,
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
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(outputDataConfig, 'outputDataConfig');
    ArgumentError.checkNotNull(sourceLanguageCode, 'sourceLanguageCode');
    _s.validateStringLength(
      'sourceLanguageCode',
      sourceLanguageCode,
      2,
      5,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetLanguageCodes, 'targetLanguageCodes');
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
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShineFrontendService_20170701.StartTextTranslationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StartTextTranslationJobRequest(
        clientToken: clientToken,
        dataAccessRoleArn: dataAccessRoleArn,
        inputDataConfig: inputDataConfig,
        outputDataConfig: outputDataConfig,
        sourceLanguageCode: sourceLanguageCode,
        targetLanguageCodes: targetLanguageCodes,
        jobName: jobName,
        terminologyNames: terminologyNames,
      ),
    );

    return StartTextTranslationJobResponse.fromJson(jsonResponse.body);
  }

  /// Stops an asynchronous batch translation job that is in progress.
  ///
  /// If the job's state is <code>IN_PROGRESS</code>, the job will be marked for
  /// termination and put into the <code>STOP_REQUESTED</code> state. If the job
  /// completes before it can be stopped, it is put into the
  /// <code>COMPLETED</code> state. Otherwise, the job is put into the
  /// <code>STOPPED</code> state.
  ///
  /// Asynchronous batch translation jobs are started with the
  /// <a>StartTextTranslationJob</a> operation. You can use the
  /// <a>DescribeTextTranslationJob</a> or <a>ListTextTranslationJobs</a>
  /// operations to get a batch translation job's <code>JobId</code>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [jobId] :
  /// The job ID of the job to be stopped.
  Future<StopTextTranslationJobResponse> stopTextTranslationJob({
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
      'X-Amz-Target': 'AWSShineFrontendService_20170701.StopTextTranslationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: StopTextTranslationJobRequest(
        jobId: jobId,
      ),
    );

    return StopTextTranslationJobResponse.fromJson(jsonResponse.body);
  }

  /// Translates input text from the source language to the target language. For
  /// a list of available languages and language codes, see
  /// <a>what-is-languages</a>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [TextSizeLimitExceededException].
  /// May throw [TooManyRequestsException].
  /// May throw [UnsupportedLanguagePairException].
  /// May throw [DetectedLanguageLowConfidenceException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [sourceLanguageCode] :
  /// The language code for the language of the source text. The language must
  /// be a language supported by Amazon Translate. For a list of language codes,
  /// see <a>what-is-languages</a>.
  ///
  /// To have Amazon Translate determine the source language of your text, you
  /// can specify <code>auto</code> in the <code>SourceLanguageCode</code>
  /// field. If you specify <code>auto</code>, Amazon Translate will call <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/comprehend-general.html">Amazon
  /// Comprehend</a> to determine the source language.
  ///
  /// Parameter [targetLanguageCode] :
  /// The language code requested for the language of the target text. The
  /// language must be a language supported by Amazon Translate.
  ///
  /// Parameter [text] :
  /// The text to translate. The text string can be a maximum of 5,000 bytes
  /// long. Depending on your character set, this may be fewer than 5,000
  /// characters.
  ///
  /// Parameter [terminologyNames] :
  /// The name of the terminology list file to be used in the TranslateText
  /// request. You can use 1 terminology list at most in a
  /// <code>TranslateText</code> request. Terminology lists can contain a
  /// maximum of 256 terms.
  Future<TranslateTextResponse> translateText({
    @_s.required String sourceLanguageCode,
    @_s.required String targetLanguageCode,
    @_s.required String text,
    List<String> terminologyNames,
  }) async {
    ArgumentError.checkNotNull(sourceLanguageCode, 'sourceLanguageCode');
    _s.validateStringLength(
      'sourceLanguageCode',
      sourceLanguageCode,
      2,
      5,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetLanguageCode, 'targetLanguageCode');
    _s.validateStringLength(
      'targetLanguageCode',
      targetLanguageCode,
      2,
      5,
      isRequired: true,
    );
    ArgumentError.checkNotNull(text, 'text');
    _s.validateStringLength(
      'text',
      text,
      1,
      5000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'text',
      text,
      r'''[\P{M}\p{M}]{1,5000}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSShineFrontendService_20170701.TranslateText'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: TranslateTextRequest(
        sourceLanguageCode: sourceLanguageCode,
        targetLanguageCode: targetLanguageCode,
        text: text,
        terminologyNames: terminologyNames,
      ),
    );

    return TranslateTextResponse.fromJson(jsonResponse.body);
  }
}

/// The custom terminology applied to the input text by Amazon Translate for the
/// translated text response. This is optional in the response and will only be
/// present if you specified terminology input in the request. Currently, only
/// one terminology can be applied per TranslateText request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppliedTerminology {
  /// The name of the custom terminology applied to the input text by Amazon
  /// Translate for the translated text response.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The specific terms of the custom terminology applied to the input text by
  /// Amazon Translate for the translated text response. A maximum of 250 terms
  /// will be returned, and the specific terms applied will be the first 250 terms
  /// in the source text.
  @_s.JsonKey(name: 'Terms')
  final List<Term> terms;

  AppliedTerminology({
    this.name,
    this.terms,
  });
  factory AppliedTerminology.fromJson(Map<String, dynamic> json) =>
      _$AppliedTerminologyFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DeleteTerminologyRequest {
  /// The name of the custom terminology being deleted.
  @_s.JsonKey(name: 'Name')
  final String name;

  DeleteTerminologyRequest({
    @_s.required this.name,
  });
  Map<String, dynamic> toJson() => _$DeleteTerminologyRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DescribeTextTranslationJobRequest {
  /// The identifier that Amazon Translate generated for the job. The
  /// <a>StartTextTranslationJob</a> operation returns this identifier in its
  /// response.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  DescribeTextTranslationJobRequest({
    @_s.required this.jobId,
  });
  Map<String, dynamic> toJson() =>
      _$DescribeTextTranslationJobRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTextTranslationJobResponse {
  /// An object that contains the properties associated with an asynchronous batch
  /// translation job.
  @_s.JsonKey(name: 'TextTranslationJobProperties')
  final TextTranslationJobProperties textTranslationJobProperties;

  DescribeTextTranslationJobResponse({
    this.textTranslationJobProperties,
  });
  factory DescribeTextTranslationJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeTextTranslationJobResponseFromJson(json);
}

/// The encryption key used to encrypt the custom terminologies used by Amazon
/// Translate.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EncryptionKey {
  /// The Amazon Resource Name (ARN) of the encryption key being used to encrypt
  /// the custom terminology.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The type of encryption key used by Amazon Translate to encrypt custom
  /// terminologies.
  @_s.JsonKey(name: 'Type')
  final EncryptionKeyType type;

  EncryptionKey({
    @_s.required this.id,
    @_s.required this.type,
  });
  factory EncryptionKey.fromJson(Map<String, dynamic> json) =>
      _$EncryptionKeyFromJson(json);

  Map<String, dynamic> toJson() => _$EncryptionKeyToJson(this);
}

enum EncryptionKeyType {
  @_s.JsonValue('KMS')
  kms,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class GetTerminologyRequest {
  /// The name of the custom terminology being retrieved.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The data format of the custom terminology being retrieved, either CSV or
  /// TMX.
  @_s.JsonKey(name: 'TerminologyDataFormat')
  final TerminologyDataFormat terminologyDataFormat;

  GetTerminologyRequest({
    @_s.required this.name,
    @_s.required this.terminologyDataFormat,
  });
  Map<String, dynamic> toJson() => _$GetTerminologyRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTerminologyResponse {
  /// The data location of the custom terminology being retrieved. The custom
  /// terminology file is returned in a presigned url that has a 30 minute
  /// expiration.
  @_s.JsonKey(name: 'TerminologyDataLocation')
  final TerminologyDataLocation terminologyDataLocation;

  /// The properties of the custom terminology being retrieved.
  @_s.JsonKey(name: 'TerminologyProperties')
  final TerminologyProperties terminologyProperties;

  GetTerminologyResponse({
    this.terminologyDataLocation,
    this.terminologyProperties,
  });
  factory GetTerminologyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetTerminologyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ImportTerminologyRequest {
  /// The merge strategy of the custom terminology being imported. Currently, only
  /// the OVERWRITE merge strategy is supported. In this case, the imported
  /// terminology will overwrite an existing terminology of the same name.
  @_s.JsonKey(name: 'MergeStrategy')
  final MergeStrategy mergeStrategy;

  /// The name of the custom terminology being imported.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The terminology data for the custom terminology being imported.
  @_s.JsonKey(name: 'TerminologyData')
  final TerminologyData terminologyData;

  /// The description of the custom terminology being imported.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The encryption key for the custom terminology being imported.
  @_s.JsonKey(name: 'EncryptionKey')
  final EncryptionKey encryptionKey;

  ImportTerminologyRequest({
    @_s.required this.mergeStrategy,
    @_s.required this.name,
    @_s.required this.terminologyData,
    this.description,
    this.encryptionKey,
  });
  Map<String, dynamic> toJson() => _$ImportTerminologyRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportTerminologyResponse {
  /// The properties of the custom terminology being imported.
  @_s.JsonKey(name: 'TerminologyProperties')
  final TerminologyProperties terminologyProperties;

  ImportTerminologyResponse({
    this.terminologyProperties,
  });
  factory ImportTerminologyResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportTerminologyResponseFromJson(json);
}

/// The input configuration properties for requesting a batch translation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InputDataConfig {
  /// The multipurpose internet mail extension (MIME) type of the input files.
  /// Valid values are <code>text/plain</code> for plaintext files and
  /// <code>text/html</code> for HTML files.
  @_s.JsonKey(name: 'ContentType')
  final String contentType;

  /// The URI of the AWS S3 folder that contains the input file. The folder must
  /// be in the same Region as the API endpoint you are calling.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  InputDataConfig({
    @_s.required this.contentType,
    @_s.required this.s3Uri,
  });
  factory InputDataConfig.fromJson(Map<String, dynamic> json) =>
      _$InputDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$InputDataConfigToJson(this);
}

/// The number of documents successfully and unsuccessfully processed during a
/// translation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class JobDetails {
  /// The number of documents that could not be processed during a translation
  /// job.
  @_s.JsonKey(name: 'DocumentsWithErrorsCount')
  final int documentsWithErrorsCount;

  /// The number of documents used as input in a translation job.
  @_s.JsonKey(name: 'InputDocumentsCount')
  final int inputDocumentsCount;

  /// The number of documents successfully processed during a translation job.
  @_s.JsonKey(name: 'TranslatedDocumentsCount')
  final int translatedDocumentsCount;

  JobDetails({
    this.documentsWithErrorsCount,
    this.inputDocumentsCount,
    this.translatedDocumentsCount,
  });
  factory JobDetails.fromJson(Map<String, dynamic> json) =>
      _$JobDetailsFromJson(json);
}

enum JobStatus {
  @_s.JsonValue('SUBMITTED')
  submitted,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('COMPLETED_WITH_ERROR')
  completedWithError,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('STOP_REQUESTED')
  stopRequested,
  @_s.JsonValue('STOPPED')
  stopped,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTerminologiesRequest {
  /// The maximum number of custom terminologies returned per list request.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// If the result of the request to ListTerminologies was truncated, include the
  /// NextToken to fetch the next group of custom terminologies.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTerminologiesRequest({
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListTerminologiesRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTerminologiesResponse {
  /// If the response to the ListTerminologies was truncated, the NextToken
  /// fetches the next group of custom terminologies.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The properties list of the custom terminologies returned on the list
  /// request.
  @_s.JsonKey(name: 'TerminologyPropertiesList')
  final List<TerminologyProperties> terminologyPropertiesList;

  ListTerminologiesResponse({
    this.nextToken,
    this.terminologyPropertiesList,
  });
  factory ListTerminologiesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTerminologiesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ListTextTranslationJobsRequest {
  /// The parameters that specify which batch translation jobs to retrieve.
  /// Filters include job name, job status, and submission time. You can only set
  /// one filter at a time.
  @_s.JsonKey(name: 'Filter')
  final TextTranslationJobFilter filter;

  /// The maximum number of results to return in each page. The default value is
  /// 100.
  @_s.JsonKey(name: 'MaxResults')
  final int maxResults;

  /// The token to request the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListTextTranslationJobsRequest({
    this.filter,
    this.maxResults,
    this.nextToken,
  });
  Map<String, dynamic> toJson() => _$ListTextTranslationJobsRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTextTranslationJobsResponse {
  /// The token to use to retreive the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list containing the properties of each job that is returned.
  @_s.JsonKey(name: 'TextTranslationJobPropertiesList')
  final List<TextTranslationJobProperties> textTranslationJobPropertiesList;

  ListTextTranslationJobsResponse({
    this.nextToken,
    this.textTranslationJobPropertiesList,
  });
  factory ListTextTranslationJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTextTranslationJobsResponseFromJson(json);
}

enum MergeStrategy {
  @_s.JsonValue('OVERWRITE')
  overwrite,
}

/// The output configuration properties for a batch translation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputDataConfig {
  /// The URI of the S3 folder that contains a translation job's output file. The
  /// folder must be in the same Region as the API endpoint that you are calling.
  @_s.JsonKey(name: 'S3Uri')
  final String s3Uri;

  OutputDataConfig({
    @_s.required this.s3Uri,
  });
  factory OutputDataConfig.fromJson(Map<String, dynamic> json) =>
      _$OutputDataConfigFromJson(json);

  Map<String, dynamic> toJson() => _$OutputDataConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StartTextTranslationJobRequest {
  /// The client token of the EC2 instance calling the request. This token is
  /// auto-generated when using the Amazon Translate SDK. Otherwise, use the <a
  /// href="docs.aws.amazon.com/AWSEC2/latest/APIReference/API_DescribeInstances.html">DescribeInstances</a>
  /// EC2 operation to retreive an instance's client token. For more information,
  /// see <a
  /// href="docs.aws.amazon.com/AWSEC2/latest/APIReference/Run_Instance_Idempotency.html#client-tokens">Client
  /// Tokens</a> in the EC2 User Guide.
  @_s.JsonKey(name: 'ClientToken')
  final String clientToken;

  /// The Amazon Resource Name (ARN) of an AWS Identity Access and Management
  /// (IAM) role that grants Amazon Translate read access to your input data. For
  /// more nformation, see <a>identity-and-access-management</a>.
  @_s.JsonKey(name: 'DataAccessRoleArn')
  final String dataAccessRoleArn;

  /// Specifies the format and S3 location of the input documents for the
  /// translation job.
  @_s.JsonKey(name: 'InputDataConfig')
  final InputDataConfig inputDataConfig;

  /// Specifies the S3 folder to which your job output will be saved.
  @_s.JsonKey(name: 'OutputDataConfig')
  final OutputDataConfig outputDataConfig;

  /// The language code of the input language. For a list of language codes, see
  /// <a>what-is-languages</a>.
  ///
  /// Amazon Translate does not automatically detect a source language during
  /// batch translation jobs.
  @_s.JsonKey(name: 'SourceLanguageCode')
  final String sourceLanguageCode;

  /// The language code of the output language.
  @_s.JsonKey(name: 'TargetLanguageCodes')
  final List<String> targetLanguageCodes;

  /// The name of the batch translation job to be performed.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The name of the terminology to use in the batch translation job. For a list
  /// of available terminologies, use the <a>ListTerminologies</a> operation.
  @_s.JsonKey(name: 'TerminologyNames')
  final List<String> terminologyNames;

  StartTextTranslationJobRequest({
    @_s.required this.clientToken,
    @_s.required this.dataAccessRoleArn,
    @_s.required this.inputDataConfig,
    @_s.required this.outputDataConfig,
    @_s.required this.sourceLanguageCode,
    @_s.required this.targetLanguageCodes,
    this.jobName,
    this.terminologyNames,
  });
  Map<String, dynamic> toJson() => _$StartTextTranslationJobRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartTextTranslationJobResponse {
  /// The identifier generated for the job. To get the status of a job, use this
  /// ID with the <a>DescribeTextTranslationJob</a> operation.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The status of the job. Possible values include:
  ///
  /// <ul>
  /// <li>
  /// <code>SUBMITTED</code> - The job has been received and is queued for
  /// processing.
  /// </li>
  /// <li>
  /// <code>IN_PROGRESS</code> - Amazon Translate is processing the job.
  /// </li>
  /// <li>
  /// <code>COMPLETED</code> - The job was successfully completed and the output
  /// is available.
  /// </li>
  /// <li>
  /// <code>COMPLETED_WITH_ERRORS</code> - The job was completed with errors. The
  /// errors can be analyzed in the job's output.
  /// </li>
  /// <li>
  /// <code>FAILED</code> - The job did not complete. To get details, use the
  /// <a>DescribeTextTranslationJob</a> operation.
  /// </li>
  /// <li>
  /// <code>STOP_REQUESTED</code> - The user who started the job has requested
  /// that it be stopped.
  /// </li>
  /// <li>
  /// <code>STOPPED</code> - The job has been stopped.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  StartTextTranslationJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StartTextTranslationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StartTextTranslationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class StopTextTranslationJobRequest {
  /// The job ID of the job to be stopped.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  StopTextTranslationJobRequest({
    @_s.required this.jobId,
  });
  Map<String, dynamic> toJson() => _$StopTextTranslationJobRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopTextTranslationJobResponse {
  /// The job ID of the stopped batch translation job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The status of the designated job. Upon successful completion, the job's
  /// status will be <code>STOPPED</code>.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  StopTextTranslationJobResponse({
    this.jobId,
    this.jobStatus,
  });
  factory StopTextTranslationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$StopTextTranslationJobResponseFromJson(json);
}

/// The term being translated by the custom terminology.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Term {
  /// The source text of the term being translated by the custom terminology.
  @_s.JsonKey(name: 'SourceText')
  final String sourceText;

  /// The target text of the term being translated by the custom terminology.
  @_s.JsonKey(name: 'TargetText')
  final String targetText;

  Term({
    this.sourceText,
    this.targetText,
  });
  factory Term.fromJson(Map<String, dynamic> json) => _$TermFromJson(json);
}

/// The data associated with the custom terminology.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TerminologyData {
  /// The file containing the custom terminology data. Your version of the AWS SDK
  /// performs a Base64-encoding on this field before sending a request to the AWS
  /// service. Users of the SDK should not perform Base64-encoding themselves.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'File')
  final Uint8List file;

  /// The data format of the custom terminology. Either CSV or TMX.
  @_s.JsonKey(name: 'Format')
  final TerminologyDataFormat format;

  TerminologyData({
    @_s.required this.file,
    @_s.required this.format,
  });
  Map<String, dynamic> toJson() => _$TerminologyDataToJson(this);
}

enum TerminologyDataFormat {
  @_s.JsonValue('CSV')
  csv,
  @_s.JsonValue('TMX')
  tmx,
}

/// The location of the custom terminology data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminologyDataLocation {
  /// The location of the custom terminology data.
  @_s.JsonKey(name: 'Location')
  final String location;

  /// The repository type for the custom terminology data.
  @_s.JsonKey(name: 'RepositoryType')
  final String repositoryType;

  TerminologyDataLocation({
    @_s.required this.location,
    @_s.required this.repositoryType,
  });
  factory TerminologyDataLocation.fromJson(Map<String, dynamic> json) =>
      _$TerminologyDataLocationFromJson(json);
}

/// The properties of the custom terminology.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminologyProperties {
  /// The Amazon Resource Name (ARN) of the custom terminology.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The time at which the custom terminology was created, based on the
  /// timestamp.
  @_s.JsonKey(
      name: 'CreatedAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime createdAt;

  /// The description of the custom terminology properties.
  @_s.JsonKey(name: 'Description')
  final String description;

  /// The encryption key for the custom terminology.
  @_s.JsonKey(name: 'EncryptionKey')
  final EncryptionKey encryptionKey;

  /// The time at which the custom terminology was last update, based on the
  /// timestamp.
  @_s.JsonKey(
      name: 'LastUpdatedAt',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime lastUpdatedAt;

  /// The name of the custom terminology.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The size of the file used when importing a custom terminology.
  @_s.JsonKey(name: 'SizeBytes')
  final int sizeBytes;

  /// The language code for the source text of the translation request for which
  /// the custom terminology is being used.
  @_s.JsonKey(name: 'SourceLanguageCode')
  final String sourceLanguageCode;

  /// The language codes for the target languages available with the custom
  /// terminology file. All possible target languages are returned in array.
  @_s.JsonKey(name: 'TargetLanguageCodes')
  final List<String> targetLanguageCodes;

  /// The number of terms included in the custom terminology.
  @_s.JsonKey(name: 'TermCount')
  final int termCount;

  TerminologyProperties({
    this.arn,
    this.createdAt,
    this.description,
    this.encryptionKey,
    this.lastUpdatedAt,
    this.name,
    this.sizeBytes,
    this.sourceLanguageCode,
    this.targetLanguageCodes,
    this.termCount,
  });
  factory TerminologyProperties.fromJson(Map<String, dynamic> json) =>
      _$TerminologyPropertiesFromJson(json);
}

/// Provides information for filtering a list of translation jobs. For more
/// information, see <a>ListTextTranslationJobs</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TextTranslationJobFilter {
  /// Filters the list of jobs by name.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// Filters the list of jobs based by job status.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing and returns only the jobs submitted after the specified time.
  /// Jobs are returned in descending order, newest to oldest.
  @_s.JsonKey(
      name: 'SubmittedAfterTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime submittedAfterTime;

  /// Filters the list of jobs based on the time that the job was submitted for
  /// processing and returns only the jobs submitted before the specified time.
  /// Jobs are returned in ascending order, oldest to newest.
  @_s.JsonKey(
      name: 'SubmittedBeforeTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime submittedBeforeTime;

  TextTranslationJobFilter({
    this.jobName,
    this.jobStatus,
    this.submittedAfterTime,
    this.submittedBeforeTime,
  });
  Map<String, dynamic> toJson() => _$TextTranslationJobFilterToJson(this);
}

/// Provides information about a translation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TextTranslationJobProperties {
  /// The Amazon Resource Name (ARN) of an AWS Identity Access and Management
  /// (IAM) role that granted Amazon Translate read access to the job's input
  /// data.
  @_s.JsonKey(name: 'DataAccessRoleArn')
  final String dataAccessRoleArn;

  /// The time at which the translation job ended.
  @_s.JsonKey(
      name: 'EndTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime endTime;

  /// The input configuration properties that were specified when the job was
  /// requested.
  @_s.JsonKey(name: 'InputDataConfig')
  final InputDataConfig inputDataConfig;

  /// The number of documents successfully and unsuccessfully processed during the
  /// translation job.
  @_s.JsonKey(name: 'JobDetails')
  final JobDetails jobDetails;

  /// The ID of the translation job.
  @_s.JsonKey(name: 'JobId')
  final String jobId;

  /// The user-defined name of the translation job.
  @_s.JsonKey(name: 'JobName')
  final String jobName;

  /// The status of the translation job.
  @_s.JsonKey(name: 'JobStatus')
  final JobStatus jobStatus;

  /// An explanation of any errors that may have occured during the translation
  /// job.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The output configuration properties that were specified when the job was
  /// requested.
  @_s.JsonKey(name: 'OutputDataConfig')
  final OutputDataConfig outputDataConfig;

  /// The language code of the language of the source text. The language must be a
  /// language supported by Amazon Translate.
  @_s.JsonKey(name: 'SourceLanguageCode')
  final String sourceLanguageCode;

  /// The time at which the translation job was submitted.
  @_s.JsonKey(
      name: 'SubmittedTime',
      fromJson: unixTimestampFromJson,
      toJson: unixTimestampToJson)
  final DateTime submittedTime;

  /// The language code of the language of the target text. The language must be a
  /// language supported by Amazon Translate.
  @_s.JsonKey(name: 'TargetLanguageCodes')
  final List<String> targetLanguageCodes;

  /// A list containing the names of the terminologies applied to a translation
  /// job. Only one terminology can be applied per <a>StartTextTranslationJob</a>
  /// request at this time.
  @_s.JsonKey(name: 'TerminologyNames')
  final List<String> terminologyNames;

  TextTranslationJobProperties({
    this.dataAccessRoleArn,
    this.endTime,
    this.inputDataConfig,
    this.jobDetails,
    this.jobId,
    this.jobName,
    this.jobStatus,
    this.message,
    this.outputDataConfig,
    this.sourceLanguageCode,
    this.submittedTime,
    this.targetLanguageCodes,
    this.terminologyNames,
  });
  factory TextTranslationJobProperties.fromJson(Map<String, dynamic> json) =>
      _$TextTranslationJobPropertiesFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TranslateTextRequest {
  /// The language code for the language of the source text. The language must be
  /// a language supported by Amazon Translate. For a list of language codes, see
  /// <a>what-is-languages</a>.
  ///
  /// To have Amazon Translate determine the source language of your text, you can
  /// specify <code>auto</code> in the <code>SourceLanguageCode</code> field. If
  /// you specify <code>auto</code>, Amazon Translate will call <a
  /// href="https://docs.aws.amazon.com/comprehend/latest/dg/comprehend-general.html">Amazon
  /// Comprehend</a> to determine the source language.
  @_s.JsonKey(name: 'SourceLanguageCode')
  final String sourceLanguageCode;

  /// The language code requested for the language of the target text. The
  /// language must be a language supported by Amazon Translate.
  @_s.JsonKey(name: 'TargetLanguageCode')
  final String targetLanguageCode;

  /// The text to translate. The text string can be a maximum of 5,000 bytes long.
  /// Depending on your character set, this may be fewer than 5,000 characters.
  @_s.JsonKey(name: 'Text')
  final String text;

  /// The name of the terminology list file to be used in the TranslateText
  /// request. You can use 1 terminology list at most in a
  /// <code>TranslateText</code> request. Terminology lists can contain a maximum
  /// of 256 terms.
  @_s.JsonKey(name: 'TerminologyNames')
  final List<String> terminologyNames;

  TranslateTextRequest({
    @_s.required this.sourceLanguageCode,
    @_s.required this.targetLanguageCode,
    @_s.required this.text,
    this.terminologyNames,
  });
  Map<String, dynamic> toJson() => _$TranslateTextRequestToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TranslateTextResponse {
  /// The language code for the language of the source text.
  @_s.JsonKey(name: 'SourceLanguageCode')
  final String sourceLanguageCode;

  /// The language code for the language of the target text.
  @_s.JsonKey(name: 'TargetLanguageCode')
  final String targetLanguageCode;

  /// The translated text.
  @_s.JsonKey(name: 'TranslatedText')
  final String translatedText;

  /// The names of the custom terminologies applied to the input text by Amazon
  /// Translate for the translated text response.
  @_s.JsonKey(name: 'AppliedTerminologies')
  final List<AppliedTerminology> appliedTerminologies;

  TranslateTextResponse({
    @_s.required this.sourceLanguageCode,
    @_s.required this.targetLanguageCode,
    @_s.required this.translatedText,
    this.appliedTerminologies,
  });
  factory TranslateTextResponse.fromJson(Map<String, dynamic> json) =>
      _$TranslateTextResponseFromJson(json);
}

class DetectedLanguageLowConfidenceException extends _s.GenericAwsException {
  DetectedLanguageLowConfidenceException({String type, String message})
      : super(
            type: type,
            code: 'DetectedLanguageLowConfidenceException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidFilterException extends _s.GenericAwsException {
  InvalidFilterException({String type, String message})
      : super(type: type, code: 'InvalidFilterException', message: message);
}

class InvalidParameterValueException extends _s.GenericAwsException {
  InvalidParameterValueException({String type, String message})
      : super(
            type: type,
            code: 'InvalidParameterValueException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
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

class UnsupportedLanguagePairException extends _s.GenericAwsException {
  UnsupportedLanguagePairException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedLanguagePairException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DetectedLanguageLowConfidenceException': (type, message) =>
      DetectedLanguageLowConfidenceException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidFilterException': (type, message) =>
      InvalidFilterException(type: type, message: message),
  'InvalidParameterValueException': (type, message) =>
      InvalidParameterValueException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TextSizeLimitExceededException': (type, message) =>
      TextSizeLimitExceededException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'UnsupportedLanguagePairException': (type, message) =>
      UnsupportedLanguagePairException(type: type, message: message),
};
