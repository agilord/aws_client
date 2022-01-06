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

/// Operations and objects for transcribing speech to text.
class Transcribe {
  final _s.JsonProtocol _protocol;
  Transcribe({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'transcribe',
            signingName: 'transcribe',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Creates an analytics category. Amazon Transcribe applies the conditions
  /// specified by your analytics categories to your call analytics jobs. For
  /// each analytics category, you specify one or more rules. For example, you
  /// can specify a rule that the customer sentiment was neutral or negative
  /// within that category. If you start a call analytics job, Amazon Transcribe
  /// applies the category to the analytics job that you've specified.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [categoryName] :
  /// The name that you choose for your category when you create it.
  ///
  /// Parameter [rules] :
  /// To create a category, you must specify between 1 and 20 rules. For each
  /// rule, you specify a filter to be applied to the attributes of the call.
  /// For example, you can specify a sentiment filter to detect if the
  /// customer's sentiment was negative or neutral.
  Future<CreateCallAnalyticsCategoryResponse> createCallAnalyticsCategory({
    required String categoryName,
    required List<Rule> rules,
  }) async {
    ArgumentError.checkNotNull(categoryName, 'categoryName');
    ArgumentError.checkNotNull(rules, 'rules');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.CreateCallAnalyticsCategory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CategoryName': categoryName,
        'Rules': rules,
      },
    );

    return CreateCallAnalyticsCategoryResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new custom language model. Use Amazon S3 prefixes to provide the
  /// location of your input files. The time it takes to create your model
  /// depends on the size of your training data.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [baseModelName] :
  /// The Amazon Transcribe standard language model, or base model used to
  /// create your custom language model.
  ///
  /// If you want to use your custom language model to transcribe audio with a
  /// sample rate of 16,000 Hz or greater, choose <code>Wideband</code>.
  ///
  /// If you want to use your custom language model to transcribe audio with a
  /// sample rate that is less than 16,000 Hz, choose <code>Narrowband</code>.
  ///
  /// Parameter [inputDataConfig] :
  /// Contains the data access role and the Amazon S3 prefixes to read the
  /// required input files to create a custom language model.
  ///
  /// Parameter [languageCode] :
  /// The language of the input text you're using to train your custom language
  /// model.
  ///
  /// Parameter [modelName] :
  /// The name you choose for your custom language model when you create it.
  ///
  /// Parameter [tags] :
  /// Adds one or more tags, each in the form of a key:value pair, to a new
  /// language model at the time you create this new model.
  Future<CreateLanguageModelResponse> createLanguageModel({
    required BaseModelName baseModelName,
    required InputDataConfig inputDataConfig,
    required CLMLanguageCode languageCode,
    required String modelName,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(baseModelName, 'baseModelName');
    ArgumentError.checkNotNull(inputDataConfig, 'inputDataConfig');
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(modelName, 'modelName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.CreateLanguageModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'BaseModelName': baseModelName.toValue(),
        'InputDataConfig': inputDataConfig,
        'LanguageCode': languageCode.toValue(),
        'ModelName': modelName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateLanguageModelResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new custom vocabulary that you can use to modify how Amazon
  /// Transcribe Medical transcribes your audio file.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code for the language used for the entries in your custom
  /// vocabulary. The language code of your custom vocabulary must match the
  /// language code of your transcription job. US English (en-US) is the only
  /// language code available for Amazon Transcribe Medical.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The location in Amazon S3 of the text file you use to define your custom
  /// vocabulary. The URI must be in the same Amazon Web Services Region as the
  /// resource that you're calling. Enter information about your
  /// <code>VocabularyFileUri</code> in the following format:
  ///
  /// <code>
  /// https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt;
  /// </code>
  ///
  /// The following is an example URI for a vocabulary file that is stored in
  /// Amazon S3:
  ///
  /// <code>https://s3.us-east-1.amazonaws.com/AWSDOC-EXAMPLE-BUCKET/vocab.txt</code>
  ///
  /// For more information about Amazon S3 object names, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object
  /// Keys</a> in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// For more information about custom vocabularies, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary-med">Medical
  /// Custom Vocabularies</a>.
  ///
  /// Parameter [vocabularyName] :
  /// The name of the custom vocabulary. This case-sensitive name must be unique
  /// within an Amazon Web Services account. If you try to create a vocabulary
  /// with the same name as a previous vocabulary, you get a
  /// <code>ConflictException</code> error.
  ///
  /// Parameter [tags] :
  /// Adds one or more tags, each in the form of a key:value pair, to a new
  /// medical vocabulary at the time you create this new vocabulary.
  Future<CreateMedicalVocabularyResponse> createMedicalVocabulary({
    required LanguageCode languageCode,
    required String vocabularyFileUri,
    required String vocabularyName,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyFileUri, 'vocabularyFileUri');
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.CreateMedicalVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'VocabularyFileUri': vocabularyFileUri,
        'VocabularyName': vocabularyName,
        if (tags != null) 'Tags': tags,
      },
    );

    return CreateMedicalVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new custom vocabulary that you can use to change the way Amazon
  /// Transcribe handles transcription of an audio file.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a>transcribe-whatis</a>.
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary. The name must be unique within an Amazon Web
  /// Services account. The name is case sensitive. If you try to create a
  /// vocabulary with the same name as a previous vocabulary you will receive a
  /// <code>ConflictException</code> error.
  ///
  /// Parameter [phrases] :
  /// An array of strings that contains the vocabulary entries.
  ///
  /// Parameter [tags] :
  /// Adds one or more tags, each in the form of a key:value pair, to a new
  /// Amazon Transcribe vocabulary at the time you create this new vocabulary.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The S3 location of the text file that contains the definition of the
  /// custom vocabulary. The URI must be in the same region as the API endpoint
  /// that you are calling. The general form is:
  ///
  /// For more information about S3 object names, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object
  /// Keys</a> in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// For more information about custom vocabularies, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary">Custom
  /// vocabularies</a>.
  Future<CreateVocabularyResponse> createVocabulary({
    required LanguageCode languageCode,
    required String vocabularyName,
    List<String>? phrases,
    List<Tag>? tags,
    String? vocabularyFileUri,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.CreateVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'VocabularyName': vocabularyName,
        if (phrases != null) 'Phrases': phrases,
        if (tags != null) 'Tags': tags,
        if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
      },
    );

    return CreateVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new vocabulary filter that you can use to filter words, such as
  /// profane words, from the output of a transcription job.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the words in the vocabulary filter. All words in the
  /// filter must be in the same language. The vocabulary filter can only be
  /// used with transcription jobs in the specified language.
  ///
  /// Parameter [vocabularyFilterName] :
  /// The vocabulary filter name. The name must be unique within the account
  /// that contains it. If you try to create a vocabulary filter with the same
  /// name as another vocabulary filter, you get a
  /// <code>ConflictException</code> error.
  ///
  /// Parameter [tags] :
  /// Adds one or more tags, each in the form of a key:value pair, to a new
  /// Amazon Transcribe vocabulary filter at the time you create this new
  /// vocabulary filter.
  ///
  /// Parameter [vocabularyFilterFileUri] :
  /// The Amazon S3 location of a text file used as input to create the
  /// vocabulary filter. Only use characters from the character set defined for
  /// custom vocabularies. For a list of character sets, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character
  /// Sets for Custom Vocabularies</a>.
  ///
  /// The specified file must be less than 50 KB of UTF-8 characters.
  ///
  /// If you provide the location of a list of words in the
  /// <code>VocabularyFilterFileUri</code> parameter, you can't use the
  /// <code>Words</code> parameter.
  ///
  /// Parameter [words] :
  /// The words to use in the vocabulary filter. Only use characters from the
  /// character set defined for custom vocabularies. For a list of character
  /// sets, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character
  /// Sets for Custom Vocabularies</a>.
  ///
  /// If you provide a list of words in the <code>Words</code> parameter, you
  /// can't use the <code>VocabularyFilterFileUri</code> parameter.
  Future<CreateVocabularyFilterResponse> createVocabularyFilter({
    required LanguageCode languageCode,
    required String vocabularyFilterName,
    List<Tag>? tags,
    String? vocabularyFilterFileUri,
    List<String>? words,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyFilterName, 'vocabularyFilterName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.CreateVocabularyFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'VocabularyFilterName': vocabularyFilterName,
        if (tags != null) 'Tags': tags,
        if (vocabularyFilterFileUri != null)
          'VocabularyFilterFileUri': vocabularyFilterFileUri,
        if (words != null) 'Words': words,
      },
    );

    return CreateVocabularyFilterResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a call analytics category using its name.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [categoryName] :
  /// The name of the call analytics category that you're choosing to delete.
  /// The value is case sensitive.
  Future<void> deleteCallAnalyticsCategory({
    required String categoryName,
  }) async {
    ArgumentError.checkNotNull(categoryName, 'categoryName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteCallAnalyticsCategory'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CategoryName': categoryName,
      },
    );
  }

  /// Deletes a call analytics job using its name.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [callAnalyticsJobName] :
  /// The name of the call analytics job you want to delete.
  Future<void> deleteCallAnalyticsJob({
    required String callAnalyticsJobName,
  }) async {
    ArgumentError.checkNotNull(callAnalyticsJobName, 'callAnalyticsJobName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteCallAnalyticsJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CallAnalyticsJobName': callAnalyticsJobName,
      },
    );
  }

  /// Deletes a custom language model using its name.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [modelName] :
  /// The name of the model you're choosing to delete.
  Future<void> deleteLanguageModel({
    required String modelName,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteLanguageModel'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );
  }

  /// Deletes a transcription job generated by Amazon Transcribe Medical and any
  /// related information.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// The name you provide to the <code>DeleteMedicalTranscriptionJob</code>
  /// object to delete a transcription job.
  Future<void> deleteMedicalTranscriptionJob({
    required String medicalTranscriptionJobName,
  }) async {
    ArgumentError.checkNotNull(
        medicalTranscriptionJobName, 'medicalTranscriptionJobName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteMedicalTranscriptionJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MedicalTranscriptionJobName': medicalTranscriptionJobName,
      },
    );
  }

  /// Deletes a vocabulary from Amazon Transcribe Medical.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary that you want to delete.
  Future<void> deleteMedicalVocabulary({
    required String vocabularyName,
  }) async {
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteMedicalVocabulary'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyName': vocabularyName,
      },
    );
  }

  /// Deletes a previously submitted transcription job along with any other
  /// generated results such as the transcription, models, and so on.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [transcriptionJobName] :
  /// The name of the transcription job to be deleted.
  Future<void> deleteTranscriptionJob({
    required String transcriptionJobName,
  }) async {
    ArgumentError.checkNotNull(transcriptionJobName, 'transcriptionJobName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteTranscriptionJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TranscriptionJobName': transcriptionJobName,
      },
    );
  }

  /// Deletes a vocabulary from Amazon Transcribe.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary to delete.
  Future<void> deleteVocabulary({
    required String vocabularyName,
  }) async {
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteVocabulary'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyName': vocabularyName,
      },
    );
  }

  /// Removes a vocabulary filter.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the vocabulary filter to remove.
  Future<void> deleteVocabularyFilter({
    required String vocabularyFilterName,
  }) async {
    ArgumentError.checkNotNull(vocabularyFilterName, 'vocabularyFilterName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteVocabularyFilter'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyFilterName': vocabularyFilterName,
      },
    );
  }

  /// Gets information about a single custom language model. Use this
  /// information to see details about the language model in your Amazon Web
  /// Services account. You can also see whether the base language model used to
  /// create your custom language model has been updated. If Amazon Transcribe
  /// has updated the base model, you can create a new custom language model
  /// using the updated base model. If the language model wasn't created, you
  /// can use this operation to understand why Amazon Transcribe couldn't create
  /// it.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [modelName] :
  /// The name of the custom language model you submit to get more information.
  Future<DescribeLanguageModelResponse> describeLanguageModel({
    required String modelName,
  }) async {
    ArgumentError.checkNotNull(modelName, 'modelName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DescribeLanguageModel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ModelName': modelName,
      },
    );

    return DescribeLanguageModelResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a call analytics category.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [categoryName] :
  /// The name of the category you want information about. This value is case
  /// sensitive.
  Future<GetCallAnalyticsCategoryResponse> getCallAnalyticsCategory({
    required String categoryName,
  }) async {
    ArgumentError.checkNotNull(categoryName, 'categoryName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetCallAnalyticsCategory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CategoryName': categoryName,
      },
    );

    return GetCallAnalyticsCategoryResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a call analytics job. To see the status of the
  /// job, check the <code>CallAnalyticsJobStatus</code> field. If the status is
  /// <code>COMPLETED</code>, the job is finished and you can find the results
  /// at the location specified in the <code>TranscriptFileUri</code> field. If
  /// you enable personally identifiable information (PII) redaction, the
  /// redacted transcript appears in the <code>RedactedTranscriptFileUri</code>
  /// field.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [callAnalyticsJobName] :
  /// The name of the analytics job you want information about. This value is
  /// case sensitive.
  Future<GetCallAnalyticsJobResponse> getCallAnalyticsJob({
    required String callAnalyticsJobName,
  }) async {
    ArgumentError.checkNotNull(callAnalyticsJobName, 'callAnalyticsJobName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetCallAnalyticsJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CallAnalyticsJobName': callAnalyticsJobName,
      },
    );

    return GetCallAnalyticsJobResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a transcription job from Amazon Transcribe
  /// Medical. To see the status of the job, check the
  /// <code>TranscriptionJobStatus</code> field. If the status is
  /// <code>COMPLETED</code>, the job is finished. You find the results of the
  /// completed job in the <code>TranscriptFileUri</code> field.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// The name of the medical transcription job.
  Future<GetMedicalTranscriptionJobResponse> getMedicalTranscriptionJob({
    required String medicalTranscriptionJobName,
  }) async {
    ArgumentError.checkNotNull(
        medicalTranscriptionJobName, 'medicalTranscriptionJobName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetMedicalTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MedicalTranscriptionJobName': medicalTranscriptionJobName,
      },
    );

    return GetMedicalTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a medical vocabulary.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary that you want information about. The value is
  /// case sensitive.
  Future<GetMedicalVocabularyResponse> getMedicalVocabulary({
    required String vocabularyName,
  }) async {
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetMedicalVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyName': vocabularyName,
      },
    );

    return GetMedicalVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a transcription job. To see the status of the
  /// job, check the <code>TranscriptionJobStatus</code> field. If the status is
  /// <code>COMPLETED</code>, the job is finished and you can find the results
  /// at the location specified in the <code>TranscriptFileUri</code> field. If
  /// you enable content redaction, the redacted transcript appears in
  /// <code>RedactedTranscriptFileUri</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [transcriptionJobName] :
  /// The name of the job.
  Future<GetTranscriptionJobResponse> getTranscriptionJob({
    required String transcriptionJobName,
  }) async {
    ArgumentError.checkNotNull(transcriptionJobName, 'transcriptionJobName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'TranscriptionJobName': transcriptionJobName,
      },
    );

    return GetTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a vocabulary.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary to return information about. The name is case
  /// sensitive.
  Future<GetVocabularyResponse> getVocabulary({
    required String vocabularyName,
  }) async {
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyName': vocabularyName,
      },
    );

    return GetVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Returns information about a vocabulary filter.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the vocabulary filter for which to return information.
  Future<GetVocabularyFilterResponse> getVocabularyFilter({
    required String vocabularyFilterName,
  }) async {
    ArgumentError.checkNotNull(vocabularyFilterName, 'vocabularyFilterName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetVocabularyFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyFilterName': vocabularyFilterName,
      },
    );

    return GetVocabularyFilterResponse.fromJson(jsonResponse.body);
  }

  /// Provides more information about the call analytics categories that you've
  /// created. You can use the information in this list to find a specific
  /// category. You can then use the operation to get more information about it.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of categories to return in each page of results. If
  /// there are fewer results than the value you specify, only the actual
  /// results are returned. If you do not specify a value, the default of 5 is
  /// used.
  ///
  /// Parameter [nextToken] :
  /// When included, <code>NextToken</code>fetches the next set of categories if
  /// the result of the previous request was truncated.
  Future<ListCallAnalyticsCategoriesResponse> listCallAnalyticsCategories({
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
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListCallAnalyticsCategories'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListCallAnalyticsCategoriesResponse.fromJson(jsonResponse.body);
  }

  /// List call analytics jobs with a specified status or substring that matches
  /// their names.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// When specified, the jobs returned in the list are limited to jobs whose
  /// name contains the specified string.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of call analytics jobs to return in each page of
  /// results. If there are fewer results than the value you specify, only the
  /// actual results are returned. If you do not specify a value, the default of
  /// 5 is used.
  ///
  /// Parameter [nextToken] :
  /// If you receive a truncated result in the previous request of , include
  /// <code>NextToken</code> to fetch the next set of jobs.
  ///
  /// Parameter [status] :
  /// When specified, returns only call analytics jobs with the specified
  /// status. Jobs are ordered by creation date, with the most recent jobs
  /// returned first. If you don't specify a status, Amazon Transcribe returns
  /// all analytics jobs ordered by creation date.
  Future<ListCallAnalyticsJobsResponse> listCallAnalyticsJobs({
    String? jobNameContains,
    int? maxResults,
    String? nextToken,
    CallAnalyticsJobStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListCallAnalyticsJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (jobNameContains != null) 'JobNameContains': jobNameContains,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListCallAnalyticsJobsResponse.fromJson(jsonResponse.body);
  }

  /// Provides more information about the custom language models you've created.
  /// You can use the information in this list to find a specific custom
  /// language model. You can then use the operation to get more information
  /// about it.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of language models to return in each page of results.
  /// If there are fewer results than the value you specify, only the actual
  /// results are returned. If you do not specify a value, the default of 5 is
  /// used.
  ///
  /// Parameter [nameContains] :
  /// When specified, the custom language model names returned contain the
  /// substring you've specified.
  ///
  /// Parameter [nextToken] :
  /// When included, fetches the next set of jobs if the result of the previous
  /// request was truncated.
  ///
  /// Parameter [statusEquals] :
  /// When specified, returns only custom language models with the specified
  /// status. Language models are ordered by creation date, with the newest
  /// models first. If you don't specify a status, Amazon Transcribe returns all
  /// custom language models ordered by date.
  Future<ListLanguageModelsResponse> listLanguageModels({
    int? maxResults,
    String? nameContains,
    String? nextToken,
    ModelStatus? statusEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListLanguageModels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nameContains != null) 'NameContains': nameContains,
        if (nextToken != null) 'NextToken': nextToken,
        if (statusEquals != null) 'StatusEquals': statusEquals.toValue(),
      },
    );

    return ListLanguageModelsResponse.fromJson(jsonResponse.body);
  }

  /// Lists medical transcription jobs with a specified status or substring that
  /// matches their names.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// When specified, the jobs returned in the list are limited to jobs whose
  /// name contains the specified string.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of medical transcription jobs to return in each page of
  /// results. If there are fewer results than the value you specify, only the
  /// actual results are returned. If you do not specify a value, the default of
  /// 5 is used.
  ///
  /// Parameter [nextToken] :
  /// If you a receive a truncated result in the previous request of
  /// <code>ListMedicalTranscriptionJobs</code>, include <code>NextToken</code>
  /// to fetch the next set of jobs.
  ///
  /// Parameter [status] :
  /// When specified, returns only medical transcription jobs with the specified
  /// status. Jobs are ordered by creation date, with the newest jobs returned
  /// first. If you don't specify a status, Amazon Transcribe Medical returns
  /// all transcription jobs ordered by creation date.
  Future<ListMedicalTranscriptionJobsResponse> listMedicalTranscriptionJobs({
    String? jobNameContains,
    int? maxResults,
    String? nextToken,
    TranscriptionJobStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListMedicalTranscriptionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (jobNameContains != null) 'JobNameContains': jobNameContains,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListMedicalTranscriptionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of vocabularies that match the specified criteria. If you
  /// don't enter a value in any of the request parameters, returns the entire
  /// list of vocabularies.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of vocabularies to return in each page of results. If
  /// there are fewer results than the value you specify, only the actual
  /// results are returned. If you do not specify a value, the default of 5 is
  /// used.
  ///
  /// Parameter [nameContains] :
  /// Returns vocabularies whose names contain the specified string. The search
  /// is not case sensitive. <code>ListMedicalVocabularies</code> returns both
  /// "<code>vocabularyname</code>" and "<code>VocabularyName</code>".
  ///
  /// Parameter [nextToken] :
  /// If the result of your previous request to
  /// <code>ListMedicalVocabularies</code> was truncated, include the
  /// <code>NextToken</code> to fetch the next set of vocabularies.
  ///
  /// Parameter [stateEquals] :
  /// When specified, returns only vocabularies with the
  /// <code>VocabularyState</code> equal to the specified vocabulary state. Use
  /// this field to see which vocabularies are ready for your medical
  /// transcription jobs.
  Future<ListMedicalVocabulariesResponse> listMedicalVocabularies({
    int? maxResults,
    String? nameContains,
    String? nextToken,
    VocabularyState? stateEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListMedicalVocabularies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nameContains != null) 'NameContains': nameContains,
        if (nextToken != null) 'NextToken': nextToken,
        if (stateEquals != null) 'StateEquals': stateEquals.toValue(),
      },
    );

    return ListMedicalVocabulariesResponse.fromJson(jsonResponse.body);
  }

  /// Lists all tags associated with a given transcription job, vocabulary, or
  /// resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// Lists all tags associated with a given Amazon Resource Name (ARN). ARNs
  /// have the format
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>
  /// (for example,
  /// <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>).
  /// Valid values for <code>resource-type</code> are:
  /// <code>transcription-job</code>, <code>medical-transcription-job</code>,
  /// <code>vocabulary</code>, <code>medical-vocabulary</code>,
  /// <code>vocabulary-filter</code>, and <code>language-model</code>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// Lists transcription jobs with the specified status.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// When specified, the jobs returned in the list are limited to jobs whose
  /// name contains the specified string.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of jobs to return in each page of results. If there are
  /// fewer results than the value you specify, only the actual results are
  /// returned. If you do not specify a value, the default of 5 is used.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request to
  /// <code>ListTranscriptionJobs</code> is truncated, include the
  /// <code>NextToken</code> to fetch the next set of jobs.
  ///
  /// Parameter [status] :
  /// When specified, returns only transcription jobs with the specified status.
  /// Jobs are ordered by creation date, with the newest jobs returned first. If
  /// you don’t specify a status, Amazon Transcribe returns all transcription
  /// jobs ordered by creation date.
  Future<ListTranscriptionJobsResponse> listTranscriptionJobs({
    String? jobNameContains,
    int? maxResults,
    String? nextToken,
    TranscriptionJobStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListTranscriptionJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (jobNameContains != null) 'JobNameContains': jobNameContains,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (status != null) 'Status': status.toValue(),
      },
    );

    return ListTranscriptionJobsResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of vocabularies that match the specified criteria. If no
  /// criteria are specified, returns the entire list of vocabularies.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of vocabularies to return in each page of results. If
  /// there are fewer results than the value you specify, only the actual
  /// results are returned. If you do not specify a value, the default of 5 is
  /// used.
  ///
  /// Parameter [nameContains] :
  /// When specified, the vocabularies returned in the list are limited to
  /// vocabularies whose name contains the specified string. The search is not
  /// case sensitive, <code>ListVocabularies</code> returns both
  /// "vocabularyname" and "VocabularyName" in the response list.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request to <code>ListVocabularies</code> was
  /// truncated, include the <code>NextToken</code> to fetch the next set of
  /// jobs.
  ///
  /// Parameter [stateEquals] :
  /// When specified, only returns vocabularies with the
  /// <code>VocabularyState</code> field equal to the specified state.
  Future<ListVocabulariesResponse> listVocabularies({
    int? maxResults,
    String? nameContains,
    String? nextToken,
    VocabularyState? stateEquals,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListVocabularies'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nameContains != null) 'NameContains': nameContains,
        if (nextToken != null) 'NextToken': nextToken,
        if (stateEquals != null) 'StateEquals': stateEquals.toValue(),
      },
    );

    return ListVocabulariesResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about vocabulary filters.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of filters to return in each page of results. If there
  /// are fewer results than the value you specify, only the actual results are
  /// returned. If you do not specify a value, the default of 5 is used.
  ///
  /// Parameter [nameContains] :
  /// Filters the response so that it only contains vocabulary filters whose
  /// name contains the specified string.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request to
  /// <code>ListVocabularyFilters</code> was truncated, include the
  /// <code>NextToken</code> to fetch the next set of collections.
  Future<ListVocabularyFiltersResponse> listVocabularyFilters({
    int? maxResults,
    String? nameContains,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListVocabularyFilters'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'MaxResults': maxResults,
        if (nameContains != null) 'NameContains': nameContains,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return ListVocabularyFiltersResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous analytics job that not only transcribes the audio
  /// recording of a caller and agent, but also returns additional insights.
  /// These insights include how quickly or loudly the caller or agent was
  /// speaking. To retrieve additional insights with your analytics jobs, create
  /// categories. A category is a way to classify analytics jobs based on
  /// attributes, such as a customer's sentiment or a particular phrase being
  /// used during the call. For more information, see the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [callAnalyticsJobName] :
  /// The name of the call analytics job. You can't use the string "." or ".."
  /// by themselves as the job name. The name must also be unique within an
  /// Amazon Web Services account. If you try to create a call analytics job
  /// with the same name as a previous call analytics job, you get a
  /// <code>ConflictException</code> error.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of a role that has access to the S3 bucket
  /// that contains your input files. Amazon Transcribe assumes this role to
  /// read queued audio files. If you have specified an output S3 bucket for
  /// your transcription results, this role should have access to the output
  /// bucket as well.
  ///
  /// Parameter [channelDefinitions] :
  /// When you start a call analytics job, you must pass an array that maps the
  /// agent and the customer to specific audio channels. The values you can
  /// assign to a channel are 0 and 1. The agent and the customer must each have
  /// their own channel. You can't assign more than one channel to an agent or
  /// customer.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Key Management
  /// Service key used to encrypt the output of the call analytics job. The user
  /// calling the operation must have permission to use the specified KMS key.
  ///
  /// You use either of the following to identify an Amazon Web Services KMS key
  /// in the current account:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// KMS Key Alias: "alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// You can use either of the following to identify a KMS key in the current
  /// account or another account:
  ///
  /// <ul>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS key in the current account or another
  /// account: "arn:aws:kms:region:account
  /// ID:key/1234abcd-12ab-34cd-56ef1234567890ab"
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias: "arn:aws:kms:region:account ID:alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// If you don't specify an encryption key, the output of the call analytics
  /// job is encrypted with the default Amazon S3 key (SSE-S3).
  ///
  /// If you specify a KMS key to encrypt your output, you must also specify an
  /// output location in the <code>OutputLocation</code> parameter.
  ///
  /// Parameter [outputLocation] :
  /// The Amazon S3 location where the output of the call analytics job is
  /// stored. You can provide the following location types to store the output
  /// of call analytics job:
  ///
  /// <ul>
  /// <li>
  /// s3://DOC-EXAMPLE-BUCKET1
  ///
  /// If you specify a bucket, Amazon Transcribe saves the output of the
  /// analytics job as a JSON file at the root level of the bucket.
  /// </li>
  /// <li>
  /// s3://DOC-EXAMPLE-BUCKET1/folder/
  ///
  /// f you specify a path, Amazon Transcribe saves the output of the analytics
  /// job as s3://DOC-EXAMPLE-BUCKET1/folder/your-transcription-job-name.json
  ///
  /// If you specify a folder, you must provide a trailing slash.
  /// </li>
  /// <li>
  /// s3://DOC-EXAMPLE-BUCKET1/folder/filename.json
  ///
  /// If you provide a path that has the filename specified, Amazon Transcribe
  /// saves the output of the analytics job as
  /// s3://DOC-EXAMPLEBUCKET1/folder/filename.json
  /// </li>
  /// </ul>
  /// You can specify an Amazon Web Services Key Management Service (KMS) key to
  /// encrypt the output of our analytics job using the
  /// <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a
  /// KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side
  /// encryption of the analytics job output that is placed in your S3 bucket.
  ///
  /// Parameter [settings] :
  /// A <code>Settings</code> object that provides optional settings for a call
  /// analytics job.
  Future<StartCallAnalyticsJobResponse> startCallAnalyticsJob({
    required String callAnalyticsJobName,
    required String dataAccessRoleArn,
    required Media media,
    List<ChannelDefinition>? channelDefinitions,
    String? outputEncryptionKMSKeyId,
    String? outputLocation,
    CallAnalyticsJobSettings? settings,
  }) async {
    ArgumentError.checkNotNull(callAnalyticsJobName, 'callAnalyticsJobName');
    ArgumentError.checkNotNull(dataAccessRoleArn, 'dataAccessRoleArn');
    ArgumentError.checkNotNull(media, 'media');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.StartCallAnalyticsJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CallAnalyticsJobName': callAnalyticsJobName,
        'DataAccessRoleArn': dataAccessRoleArn,
        'Media': media,
        if (channelDefinitions != null)
          'ChannelDefinitions': channelDefinitions,
        if (outputEncryptionKMSKeyId != null)
          'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
        if (outputLocation != null) 'OutputLocation': outputLocation,
        if (settings != null) 'Settings': settings,
      },
    );

    return StartCallAnalyticsJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts a batch job to transcribe medical speech to text.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code for the language spoken in the input media file. US
  /// English (en-US) is the valid value for medical transcription jobs. Any
  /// other value you enter for language code results in a
  /// <code>BadRequestException</code> error.
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// The name of the medical transcription job. You can't use the strings
  /// "<code>.</code>" or "<code>..</code>" by themselves as the job name. The
  /// name must also be unique within an Amazon Web Services account. If you try
  /// to create a medical transcription job with the same name as a previous
  /// medical transcription job, you get a <code>ConflictException</code> error.
  ///
  /// Parameter [outputBucketName] :
  /// The Amazon S3 location where the transcription is stored.
  ///
  /// You must set <code>OutputBucketName</code> for Amazon Transcribe Medical
  /// to store the transcription results. Your transcript appears in the S3
  /// location you specify. When you call the <a>GetMedicalTranscriptionJob</a>,
  /// the operation returns this location in the <code>TranscriptFileUri</code>
  /// field. The S3 bucket must have permissions that allow Amazon Transcribe
  /// Medical to put files in the bucket. For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions
  /// Required for IAM User Roles</a>.
  ///
  /// You can specify an Amazon Web Services Key Management Service (KMS) key to
  /// encrypt the output of your transcription using the
  /// <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a
  /// KMS key, Amazon Transcribe Medical uses the default Amazon S3 key for
  /// server-side encryption of transcripts that are placed in your S3 bucket.
  ///
  /// Parameter [specialty] :
  /// The medical specialty of any clinician speaking in the input media.
  ///
  /// Parameter [type] :
  /// The type of speech in the input audio. <code>CONVERSATION</code> refers to
  /// conversations between two or more speakers, e.g., a conversations between
  /// doctors and patients. <code>DICTATION</code> refers to single-speaker
  /// dictated speech, such as clinical notes.
  ///
  /// Parameter [contentIdentificationType] :
  /// You can configure Amazon Transcribe Medical to label content in the
  /// transcription output. If you specify <code>PHI</code>, Amazon Transcribe
  /// Medical labels the personal health information (PHI) that it identifies in
  /// the transcription output.
  ///
  /// Parameter [kMSEncryptionContext] :
  /// A map of plain text, non-secret key:value pairs, known as encryption
  /// context pairs, that provide an added layer of security for your data.
  ///
  /// Parameter [mediaFormat] :
  /// The audio format of the input media file.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate, in Hertz, of the audio track in the input media file.
  ///
  /// If you do not specify the media sample rate, Amazon Transcribe Medical
  /// determines the sample rate. If you specify the sample rate, it must match
  /// the rate detected by Amazon Transcribe Medical. In most cases, you should
  /// leave the <code>MediaSampleRateHertz</code> field blank and let Amazon
  /// Transcribe Medical determine the sample rate.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Key Management
  /// Service (KMS) key used to encrypt the output of the transcription job. The
  /// user calling the <a>StartMedicalTranscriptionJob</a> operation must have
  /// permission to use the specified KMS key.
  ///
  /// You use either of the following to identify a KMS key in the current
  /// account:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// KMS Key Alias: "alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// You can use either of the following to identify a KMS key in the current
  /// account or another account:
  ///
  /// <ul>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS key in the current account or another
  /// account:
  /// "arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias: "arn:aws:kms:region:account ID:alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// If you don't specify an encryption key, the output of the medical
  /// transcription job is encrypted with the default Amazon S3 key (SSE-S3).
  ///
  /// If you specify a KMS key to encrypt your output, you must also specify an
  /// output location in the <code>OutputBucketName</code> parameter.
  ///
  /// Parameter [outputKey] :
  /// You can specify a location in an Amazon S3 bucket to store the output of
  /// your medical transcription job.
  ///
  /// If you don't specify an output key, Amazon Transcribe Medical stores the
  /// output of your transcription job in the Amazon S3 bucket you specified. By
  /// default, the object key is "your-transcription-job-name.json".
  ///
  /// You can use output keys to specify the Amazon S3 prefix and file name of
  /// the transcription output. For example, specifying the Amazon S3 prefix,
  /// "folder1/folder2/", as an output key would lead to the output being stored
  /// as "folder1/folder2/your-transcription-job-name.json". If you specify
  /// "my-other-job-name.json" as the output key, the object key is changed to
  /// "my-other-job-name.json". You can use an output key to change both the
  /// prefix and the file name, for example "folder/my-other-job-name.json".
  ///
  /// If you specify an output key, you must also specify an S3 bucket in the
  /// <code>OutputBucketName</code> parameter.
  ///
  /// Parameter [settings] :
  /// Optional settings for the medical transcription job.
  ///
  /// Parameter [tags] :
  /// Add tags to an Amazon Transcribe medical transcription job.
  Future<StartMedicalTranscriptionJobResponse> startMedicalTranscriptionJob({
    required LanguageCode languageCode,
    required Media media,
    required String medicalTranscriptionJobName,
    required String outputBucketName,
    required Specialty specialty,
    required Type type,
    MedicalContentIdentificationType? contentIdentificationType,
    Map<String, String>? kMSEncryptionContext,
    MediaFormat? mediaFormat,
    int? mediaSampleRateHertz,
    String? outputEncryptionKMSKeyId,
    String? outputKey,
    MedicalTranscriptionSetting? settings,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(media, 'media');
    ArgumentError.checkNotNull(
        medicalTranscriptionJobName, 'medicalTranscriptionJobName');
    ArgumentError.checkNotNull(outputBucketName, 'outputBucketName');
    ArgumentError.checkNotNull(specialty, 'specialty');
    ArgumentError.checkNotNull(type, 'type');
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      8000,
      48000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.StartMedicalTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'Media': media,
        'MedicalTranscriptionJobName': medicalTranscriptionJobName,
        'OutputBucketName': outputBucketName,
        'Specialty': specialty.toValue(),
        'Type': type.toValue(),
        if (contentIdentificationType != null)
          'ContentIdentificationType': contentIdentificationType.toValue(),
        if (kMSEncryptionContext != null)
          'KMSEncryptionContext': kMSEncryptionContext,
        if (mediaFormat != null) 'MediaFormat': mediaFormat.toValue(),
        if (mediaSampleRateHertz != null)
          'MediaSampleRateHertz': mediaSampleRateHertz,
        if (outputEncryptionKMSKeyId != null)
          'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
        if (outputKey != null) 'OutputKey': outputKey,
        if (settings != null) 'Settings': settings,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartMedicalTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Starts an asynchronous job to transcribe speech to text.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [media] :
  /// An object that describes the input media for a transcription job.
  ///
  /// Parameter [transcriptionJobName] :
  /// The name of the job. You can't use the strings "<code>.</code>" or
  /// "<code>..</code>" by themselves as the job name. The name must also be
  /// unique within an Amazon Web Services account. If you try to create a
  /// transcription job with the same name as a previous transcription job, you
  /// get a <code>ConflictException</code> error.
  ///
  /// Parameter [contentRedaction] :
  /// An object that contains the request parameters for content redaction.
  ///
  /// Parameter [identifyLanguage] :
  /// Set this field to <code>true</code> to enable automatic language
  /// identification. Automatic language identification is disabled by default.
  /// You receive a <code>BadRequestException</code> error if you enter a value
  /// for a <code>LanguageCode</code>.
  ///
  /// Parameter [jobExecutionSettings] :
  /// Provides information about how a transcription job is executed. Use this
  /// field to indicate that the job can be queued for deferred execution if the
  /// concurrency limit is reached and there are no slots available to
  /// immediately run the job.
  ///
  /// Parameter [kMSEncryptionContext] :
  /// A map of plain text, non-secret key:value pairs, known as encryption
  /// context pairs, that provide an added layer of security for your data.
  ///
  /// Parameter [languageCode] :
  /// The language code for the language used in the input media file.
  ///
  /// To transcribe speech in Modern Standard Arabic (ar-SA), your audio or
  /// video file must be encoded at a sample rate of 16,000 Hz or higher.
  ///
  /// Parameter [languageIdSettings] :
  /// The language identification settings associated with your transcription
  /// job. These settings include <code>VocabularyName</code>,
  /// <code>VocabularyFilterName</code>, and <code>LanguageModelName</code>.
  ///
  /// Parameter [languageOptions] :
  /// An object containing a list of languages that might be present in your
  /// collection of audio files. Automatic language identification chooses a
  /// language that best matches the source audio from that list.
  ///
  /// To transcribe speech in Modern Standard Arabic (ar-SA), your audio or
  /// video file must be encoded at a sample rate of 16,000 Hz or higher.
  ///
  /// Parameter [mediaFormat] :
  /// The format of the input media file.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate, in Hertz, of the audio track in the input media file.
  ///
  /// If you do not specify the media sample rate, Amazon Transcribe determines
  /// the sample rate. If you specify the sample rate, it must match the sample
  /// rate detected by Amazon Transcribe. In most cases, you should leave the
  /// <code>MediaSampleRateHertz</code> field blank and let Amazon Transcribe
  /// determine the sample rate.
  ///
  /// Parameter [modelSettings] :
  /// Choose the custom language model you use for your transcription job in
  /// this parameter.
  ///
  /// Parameter [outputBucketName] :
  /// The location where the transcription is stored.
  ///
  /// If you set the <code>OutputBucketName</code>, Amazon Transcribe puts the
  /// transcript in the specified S3 bucket. When you call the
  /// <a>GetTranscriptionJob</a> operation, the operation returns this location
  /// in the <code>TranscriptFileUri</code> field. If you enable content
  /// redaction, the redacted transcript appears in
  /// <code>RedactedTranscriptFileUri</code>. If you enable content redaction
  /// and choose to output an unredacted transcript, that transcript's location
  /// still appears in the <code>TranscriptFileUri</code>. The S3 bucket must
  /// have permissions that allow Amazon Transcribe to put files in the bucket.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions
  /// Required for IAM User Roles</a>.
  ///
  /// You can specify an Amazon Web Services Key Management Service (KMS) key to
  /// encrypt the output of your transcription using the
  /// <code>OutputEncryptionKMSKeyId</code> parameter. If you don't specify a
  /// KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side
  /// encryption of transcripts that are placed in your S3 bucket.
  ///
  /// If you don't set the <code>OutputBucketName</code>, Amazon Transcribe
  /// generates a pre-signed URL, a shareable URL that provides secure access to
  /// your transcription, and returns it in the <code>TranscriptFileUri</code>
  /// field. Use this URL to download the transcription.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services Key Management
  /// Service (KMS) key used to encrypt the output of the transcription job. The
  /// user calling the <code>StartTranscriptionJob</code> operation must have
  /// permission to use the specified KMS key.
  ///
  /// You can use either of the following to identify a KMS key in the current
  /// account:
  ///
  /// <ul>
  /// <li>
  /// KMS Key ID: "1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// KMS Key Alias: "alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// You can use either of the following to identify a KMS key in the current
  /// account or another account:
  ///
  /// <ul>
  /// <li>
  /// Amazon Resource Name (ARN) of a KMS Key: "arn:aws:kms:region:account
  /// ID:key/1234abcd-12ab-34cd-56ef-1234567890ab"
  /// </li>
  /// <li>
  /// ARN of a KMS Key Alias: "arn:aws:kms:region:account-ID:alias/ExampleAlias"
  /// </li>
  /// </ul>
  /// If you don't specify an encryption key, the output of the transcription
  /// job is encrypted with the default Amazon S3 key (SSE-S3).
  ///
  /// If you specify a KMS key to encrypt your output, you must also specify an
  /// output location in the <code>OutputBucketName</code> parameter.
  ///
  /// Parameter [outputKey] :
  /// You can specify a location in an Amazon S3 bucket to store the output of
  /// your transcription job.
  ///
  /// If you don't specify an output key, Amazon Transcribe stores the output of
  /// your transcription job in the Amazon S3 bucket you specified. By default,
  /// the object key is "your-transcription-job-name.json".
  ///
  /// You can use output keys to specify the Amazon S3 prefix and file name of
  /// the transcription output. For example, specifying the Amazon S3 prefix,
  /// "folder1/folder2/", as an output key would lead to the output being stored
  /// as "folder1/folder2/your-transcription-job-name.json". If you specify
  /// "my-other-job-name.json" as the output key, the object key is changed to
  /// "my-other-job-name.json". You can use an output key to change both the
  /// prefix and the file name, for example "folder/my-other-job-name.json".
  ///
  /// If you specify an output key, you must also specify an S3 bucket in the
  /// <code>OutputBucketName</code> parameter.
  ///
  /// Parameter [settings] :
  /// A <code>Settings</code> object that provides optional settings for a
  /// transcription job.
  ///
  /// Parameter [subtitles] :
  /// Add subtitles to your batch transcription job.
  ///
  /// Parameter [tags] :
  /// Add tags to an Amazon Transcribe transcription job.
  Future<StartTranscriptionJobResponse> startTranscriptionJob({
    required Media media,
    required String transcriptionJobName,
    ContentRedaction? contentRedaction,
    bool? identifyLanguage,
    JobExecutionSettings? jobExecutionSettings,
    Map<String, String>? kMSEncryptionContext,
    LanguageCode? languageCode,
    Map<LanguageCode, LanguageIdSettings>? languageIdSettings,
    List<LanguageCode>? languageOptions,
    MediaFormat? mediaFormat,
    int? mediaSampleRateHertz,
    ModelSettings? modelSettings,
    String? outputBucketName,
    String? outputEncryptionKMSKeyId,
    String? outputKey,
    Settings? settings,
    Subtitles? subtitles,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(media, 'media');
    ArgumentError.checkNotNull(transcriptionJobName, 'transcriptionJobName');
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      8000,
      48000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.StartTranscriptionJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'Media': media,
        'TranscriptionJobName': transcriptionJobName,
        if (contentRedaction != null) 'ContentRedaction': contentRedaction,
        if (identifyLanguage != null) 'IdentifyLanguage': identifyLanguage,
        if (jobExecutionSettings != null)
          'JobExecutionSettings': jobExecutionSettings,
        if (kMSEncryptionContext != null)
          'KMSEncryptionContext': kMSEncryptionContext,
        if (languageCode != null) 'LanguageCode': languageCode.toValue(),
        if (languageIdSettings != null)
          'LanguageIdSettings':
              languageIdSettings.map((k, e) => MapEntry(k.toValue(), e)),
        if (languageOptions != null)
          'LanguageOptions': languageOptions.map((e) => e.toValue()).toList(),
        if (mediaFormat != null) 'MediaFormat': mediaFormat.toValue(),
        if (mediaSampleRateHertz != null)
          'MediaSampleRateHertz': mediaSampleRateHertz,
        if (modelSettings != null) 'ModelSettings': modelSettings,
        if (outputBucketName != null) 'OutputBucketName': outputBucketName,
        if (outputEncryptionKMSKeyId != null)
          'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
        if (outputKey != null) 'OutputKey': outputKey,
        if (settings != null) 'Settings': settings,
        if (subtitles != null) 'Subtitles': subtitles,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Tags an Amazon Transcribe resource with the given list of tags.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want
  /// to tag. ARNs have the format
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>
  /// (for example,
  /// <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>).
  /// Valid values for <code>resource-type</code> are:
  /// <code>transcription-job</code>, <code>medical-transcription-job</code>,
  /// <code>vocabulary</code>, <code>medical-vocabulary</code>,
  /// <code>vocabulary-filter</code>, and <code>language-model</code>.
  ///
  /// Parameter [tags] :
  /// The tags you are assigning to a given Amazon Transcribe resource.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.TagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'Tags': tags,
      },
    );
  }

  /// Removes specified tags from a specified Amazon Transcribe resource.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Transcribe resource you want
  /// to remove tags from. ARNs have the format
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>
  /// (for example,
  /// <code>arn:aws:transcribe:us-east-1:account-id:transcription-job/your-job-name</code>).
  /// Valid values for <code>resource-type</code> are:
  /// <code>transcription-job</code>, <code>medical-transcription-job</code>,
  /// <code>vocabulary</code>, <code>medical-vocabulary</code>,
  /// <code>vocabulary-filter</code>, and <code>language-model</code>.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys you want to remove from a specified Amazon Transcribe
  /// resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.UntagResource'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ResourceArn': resourceArn,
        'TagKeys': tagKeys,
      },
    );
  }

  /// Updates the call analytics category with new values. The
  /// <code>UpdateCallAnalyticsCategory</code> operation overwrites all of the
  /// existing information with the values that you provide in the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [categoryName] :
  /// The name of the analytics category to update. The name is case sensitive.
  /// If you try to update a call analytics category with the same name as a
  /// previous category you will receive a <code>ConflictException</code> error.
  ///
  /// Parameter [rules] :
  /// The rules used for the updated analytics category. The rules that you
  /// provide in this field replace the ones that are currently being used.
  Future<UpdateCallAnalyticsCategoryResponse> updateCallAnalyticsCategory({
    required String categoryName,
    required List<Rule> rules,
  }) async {
    ArgumentError.checkNotNull(categoryName, 'categoryName');
    ArgumentError.checkNotNull(rules, 'rules');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.UpdateCallAnalyticsCategory'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CategoryName': categoryName,
        'Rules': rules,
      },
    );

    return UpdateCallAnalyticsCategoryResponse.fromJson(jsonResponse.body);
  }

  /// Updates a vocabulary with new values that you provide in a different text
  /// file from the one you used to create the vocabulary. The
  /// <code>UpdateMedicalVocabulary</code> operation overwrites all of the
  /// existing information with the values that you provide in the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the language used for the entries in the updated
  /// vocabulary. US English (en-US) is the only valid language code in Amazon
  /// Transcribe Medical.
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary to update. The name is case sensitive. If you
  /// try to update a vocabulary with the same name as a vocabulary you've
  /// already made, you get a <code>ConflictException</code> error.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The location in Amazon S3 of the text file that contains your custom
  /// vocabulary. The URI must be in the same Amazon Web Services Region as the
  /// resource that you are calling. The following is the format for a URI:
  ///
  /// <code>
  /// https://s3.&lt;aws-region&gt;.amazonaws.com/&lt;bucket-name&gt;/&lt;keyprefix&gt;/&lt;objectkey&gt;
  /// </code>
  ///
  /// For example:
  ///
  /// <code>https://s3.us-east-1.amazonaws.com/AWSDOC-EXAMPLE-BUCKET/vocab.txt</code>
  ///
  /// For more information about Amazon S3 object names, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object
  /// Keys</a> in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// For more information about custom vocabularies in Amazon Transcribe
  /// Medical, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Medical
  /// Custom Vocabularies</a>.
  Future<UpdateMedicalVocabularyResponse> updateMedicalVocabulary({
    required LanguageCode languageCode,
    required String vocabularyName,
    String? vocabularyFileUri,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.UpdateMedicalVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'VocabularyName': vocabularyName,
        if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
      },
    );

    return UpdateMedicalVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing vocabulary with new values. The
  /// <code>UpdateVocabulary</code> operation overwrites all of the existing
  /// information with the values that you provide in the request.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code of the vocabulary entries. For a list of languages and
  /// their corresponding language codes, see <a>transcribe-whatis</a>.
  ///
  /// Parameter [vocabularyName] :
  /// The name of the vocabulary to update. The name is case sensitive. If you
  /// try to update a vocabulary with the same name as a previous vocabulary you
  /// will receive a <code>ConflictException</code> error.
  ///
  /// Parameter [phrases] :
  /// An array of strings containing the vocabulary entries.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The S3 location of the text file that contains the definition of the
  /// custom vocabulary. The URI must be in the same region as the API endpoint
  /// that you are calling. The general form is
  ///
  /// For example:
  ///
  /// For more information about S3 object names, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object
  /// Keys</a> in the <i>Amazon S3 Developer Guide</i>.
  ///
  /// For more information about custom vocabularies, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html#how-vocabulary">Custom
  /// Vocabularies</a>.
  Future<UpdateVocabularyResponse> updateVocabulary({
    required LanguageCode languageCode,
    required String vocabularyName,
    List<String>? phrases,
    String? vocabularyFileUri,
  }) async {
    ArgumentError.checkNotNull(languageCode, 'languageCode');
    ArgumentError.checkNotNull(vocabularyName, 'vocabularyName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.UpdateVocabulary'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'LanguageCode': languageCode.toValue(),
        'VocabularyName': vocabularyName,
        if (phrases != null) 'Phrases': phrases,
        if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
      },
    );

    return UpdateVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Updates a vocabulary filter with a new list of filtered words.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the vocabulary filter to update. If you try to update a
  /// vocabulary filter with the same name as another vocabulary filter, you get
  /// a <code>ConflictException</code> error.
  ///
  /// Parameter [vocabularyFilterFileUri] :
  /// The Amazon S3 location of a text file used as input to create the
  /// vocabulary filter. Only use characters from the character set defined for
  /// custom vocabularies. For a list of character sets, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character
  /// Sets for Custom Vocabularies</a>.
  ///
  /// The specified file must be less than 50 KB of UTF-8 characters.
  ///
  /// If you provide the location of a list of words in the
  /// <code>VocabularyFilterFileUri</code> parameter, you can't use the
  /// <code>Words</code> parameter.
  ///
  /// Parameter [words] :
  /// The words to use in the vocabulary filter. Only use characters from the
  /// character set defined for custom vocabularies. For a list of character
  /// sets, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-vocabulary.html#charsets">Character
  /// Sets for Custom Vocabularies</a>.
  ///
  /// If you provide a list of words in the <code>Words</code> parameter, you
  /// can't use the <code>VocabularyFilterFileUri</code> parameter.
  Future<UpdateVocabularyFilterResponse> updateVocabularyFilter({
    required String vocabularyFilterName,
    String? vocabularyFilterFileUri,
    List<String>? words,
  }) async {
    ArgumentError.checkNotNull(vocabularyFilterName, 'vocabularyFilterName');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.UpdateVocabularyFilter'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'VocabularyFilterName': vocabularyFilterName,
        if (vocabularyFilterFileUri != null)
          'VocabularyFilterFileUri': vocabularyFilterFileUri,
        if (words != null) 'Words': words,
      },
    );

    return UpdateVocabularyFilterResponse.fromJson(jsonResponse.body);
  }
}

/// A time range, set in seconds, between two points in the call.
class AbsoluteTimeRange {
  /// A value that indicates the end of the time range in milliseconds. To set
  /// absolute time range, you must specify a start time and an end time. For
  /// example, if you specify the following values:
  ///
  /// <ul>
  /// <li>
  /// StartTime - 10000
  /// </li>
  /// <li>
  /// Endtime - 50000
  /// </li>
  /// </ul>
  /// The time range is set between 10,000 milliseconds and 50,000 milliseconds
  /// into the call.
  final int? endTime;

  /// A time range from the beginning of the call to the value that you've
  /// specified. For example, if you specify 100000, the time range is set to the
  /// first 100,000 milliseconds of the call.
  final int? first;

  /// A time range from the value that you've specified to the end of the call.
  /// For example, if you specify 100000, the time range is set to the last
  /// 100,000 milliseconds of the call.
  final int? last;

  /// A value that indicates the beginning of the time range in seconds. To set
  /// absolute time range, you must specify a start time and an end time. For
  /// example, if you specify the following values:
  ///
  /// <ul>
  /// <li>
  /// StartTime - 10000
  /// </li>
  /// <li>
  /// Endtime - 50000
  /// </li>
  /// </ul>
  /// The time range is set between 10,000 milliseconds and 50,000 milliseconds
  /// into the call.
  final int? startTime;

  AbsoluteTimeRange({
    this.endTime,
    this.first,
    this.last,
    this.startTime,
  });

  factory AbsoluteTimeRange.fromJson(Map<String, dynamic> json) {
    return AbsoluteTimeRange(
      endTime: json['EndTime'] as int?,
      first: json['First'] as int?,
      last: json['Last'] as int?,
      startTime: json['StartTime'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final first = this.first;
    final last = this.last;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': endTime,
      if (first != null) 'First': first,
      if (last != null) 'Last': last,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

enum BaseModelName {
  narrowBand,
  wideBand,
}

extension on BaseModelName {
  String toValue() {
    switch (this) {
      case BaseModelName.narrowBand:
        return 'NarrowBand';
      case BaseModelName.wideBand:
        return 'WideBand';
    }
  }
}

extension on String {
  BaseModelName toBaseModelName() {
    switch (this) {
      case 'NarrowBand':
        return BaseModelName.narrowBand;
      case 'WideBand':
        return BaseModelName.wideBand;
    }
    throw Exception('$this is not known in enum BaseModelName');
  }
}

enum CLMLanguageCode {
  enUs,
  hiIn,
  esUs,
  enGb,
  enAu,
}

extension on CLMLanguageCode {
  String toValue() {
    switch (this) {
      case CLMLanguageCode.enUs:
        return 'en-US';
      case CLMLanguageCode.hiIn:
        return 'hi-IN';
      case CLMLanguageCode.esUs:
        return 'es-US';
      case CLMLanguageCode.enGb:
        return 'en-GB';
      case CLMLanguageCode.enAu:
        return 'en-AU';
    }
  }
}

extension on String {
  CLMLanguageCode toCLMLanguageCode() {
    switch (this) {
      case 'en-US':
        return CLMLanguageCode.enUs;
      case 'hi-IN':
        return CLMLanguageCode.hiIn;
      case 'es-US':
        return CLMLanguageCode.esUs;
      case 'en-GB':
        return CLMLanguageCode.enGb;
      case 'en-AU':
        return CLMLanguageCode.enAu;
    }
    throw Exception('$this is not known in enum CLMLanguageCode');
  }
}

/// Describes an asynchronous analytics job that was created with the
/// <code>StartAnalyticsJob</code> operation.
class CallAnalyticsJob {
  /// The name of the call analytics job.
  final String? callAnalyticsJobName;

  /// The status of the analytics job.
  final CallAnalyticsJobStatus? callAnalyticsJobStatus;

  /// Shows numeric values to indicate the channel assigned to the agent's audio
  /// and the channel assigned to the customer's audio.
  final List<ChannelDefinition>? channelDefinitions;

  /// A timestamp that shows when the analytics job was completed.
  final DateTime? completionTime;

  /// A timestamp that shows when the analytics job was created.
  final DateTime? creationTime;

  /// The Amazon Resource Number (ARN) that you use to access the analytics job.
  /// ARNs have the format
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.
  final String? dataAccessRoleArn;

  /// If the <code>AnalyticsJobStatus</code> is <code>FAILED</code>, this field
  /// contains information about why the job failed.
  ///
  /// The <code>FailureReason</code> field can contain one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>Unsupported media format</code>: The media format specified in the
  /// <code>MediaFormat</code> field of the request isn't valid. See the
  /// description of the <code>MediaFormat</code> field for a list of valid
  /// values.
  /// </li>
  /// <li>
  /// <code>The media format provided does not match the detected media
  /// format</code>: The media format of the audio file doesn't match the format
  /// specified in the <code>MediaFormat</code> field in the request. Check the
  /// media format of your media file and make sure the two values match.
  /// </li>
  /// <li>
  /// <code>Invalid sample rate for audio file</code>: The sample rate specified
  /// in the <code>MediaSampleRateHertz</code> of the request isn't valid. The
  /// sample rate must be between 8,000 and 48,000 Hertz.
  /// </li>
  /// <li>
  /// <code>The sample rate provided does not match the detected sample
  /// rate</code>: The sample rate in the audio file doesn't match the sample rate
  /// specified in the <code>MediaSampleRateHertz</code> field in the request.
  /// Check the sample rate of your media file and make sure that the two values
  /// match.
  /// </li>
  /// <li>
  /// <code>Invalid file size: file size too large</code>: The size of your audio
  /// file is larger than what Amazon Transcribe Medical can process. For more
  /// information, see <i>Guidelines and Quotas</i> in the Amazon Transcribe
  /// Medical Guide.
  /// </li>
  /// <li>
  /// <code>Invalid number of channels: number of channels too large</code>: Your
  /// audio contains more channels than Amazon Transcribe Medical is configured to
  /// process. To request additional channels, see Amazon Transcribe Medical
  /// Endpoints and Quotas in the <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/Welcome.html">Amazon Web
  /// Services General Reference</a>.
  /// </li>
  /// </ul>
  final String? failureReason;

  /// A value between zero and one that Amazon Transcribe assigned to the language
  /// that it identified in the source audio. This value appears only when you
  /// don't provide a single language code. Larger values indicate that Amazon
  /// Transcribe has higher confidence in the language that it identified
  final double? identifiedLanguageScore;

  /// If you know the language spoken between the customer and the agent, specify
  /// a language code for this field.
  ///
  /// If you don't know the language, you can leave this field blank, and Amazon
  /// Transcribe will use machine learning to automatically identify the language.
  /// To improve the accuracy of language identification, you can provide an array
  /// containing the possible language codes for the language spoken in your
  /// audio. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html">Supported
  /// languages and language-specific features</a> for additional information.
  final LanguageCode? languageCode;
  final Media? media;

  /// The format of the input audio file. Note: for call analytics jobs, only the
  /// following media formats are supported: MP3, MP4, WAV, FLAC, OGG, and WebM.
  final MediaFormat? mediaFormat;

  /// The sample rate, in Hertz, of the audio.
  final int? mediaSampleRateHertz;

  /// Provides information about the settings used to run a transcription job.
  final CallAnalyticsJobSettings? settings;

  /// A timestamp that shows when the analytics job started processing.
  final DateTime? startTime;
  final Transcript? transcript;

  CallAnalyticsJob({
    this.callAnalyticsJobName,
    this.callAnalyticsJobStatus,
    this.channelDefinitions,
    this.completionTime,
    this.creationTime,
    this.dataAccessRoleArn,
    this.failureReason,
    this.identifiedLanguageScore,
    this.languageCode,
    this.media,
    this.mediaFormat,
    this.mediaSampleRateHertz,
    this.settings,
    this.startTime,
    this.transcript,
  });

  factory CallAnalyticsJob.fromJson(Map<String, dynamic> json) {
    return CallAnalyticsJob(
      callAnalyticsJobName: json['CallAnalyticsJobName'] as String?,
      callAnalyticsJobStatus: (json['CallAnalyticsJobStatus'] as String?)
          ?.toCallAnalyticsJobStatus(),
      channelDefinitions: (json['ChannelDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      completionTime: timeStampFromJson(json['CompletionTime']),
      creationTime: timeStampFromJson(json['CreationTime']),
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      failureReason: json['FailureReason'] as String?,
      identifiedLanguageScore: json['IdentifiedLanguageScore'] as double?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      media: json['Media'] != null
          ? Media.fromJson(json['Media'] as Map<String, dynamic>)
          : null,
      mediaFormat: (json['MediaFormat'] as String?)?.toMediaFormat(),
      mediaSampleRateHertz: json['MediaSampleRateHertz'] as int?,
      settings: json['Settings'] != null
          ? CallAnalyticsJobSettings.fromJson(
              json['Settings'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      transcript: json['Transcript'] != null
          ? Transcript.fromJson(json['Transcript'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final callAnalyticsJobName = this.callAnalyticsJobName;
    final callAnalyticsJobStatus = this.callAnalyticsJobStatus;
    final channelDefinitions = this.channelDefinitions;
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final failureReason = this.failureReason;
    final identifiedLanguageScore = this.identifiedLanguageScore;
    final languageCode = this.languageCode;
    final media = this.media;
    final mediaFormat = this.mediaFormat;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final settings = this.settings;
    final startTime = this.startTime;
    final transcript = this.transcript;
    return {
      if (callAnalyticsJobName != null)
        'CallAnalyticsJobName': callAnalyticsJobName,
      if (callAnalyticsJobStatus != null)
        'CallAnalyticsJobStatus': callAnalyticsJobStatus.toValue(),
      if (channelDefinitions != null) 'ChannelDefinitions': channelDefinitions,
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (failureReason != null) 'FailureReason': failureReason,
      if (identifiedLanguageScore != null)
        'IdentifiedLanguageScore': identifiedLanguageScore,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (media != null) 'Media': media,
      if (mediaFormat != null) 'MediaFormat': mediaFormat.toValue(),
      if (mediaSampleRateHertz != null)
        'MediaSampleRateHertz': mediaSampleRateHertz,
      if (settings != null) 'Settings': settings,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (transcript != null) 'Transcript': transcript,
    };
  }
}

/// Provides optional settings for the <code>CallAnalyticsJob</code> operation.
class CallAnalyticsJobSettings {
  final ContentRedaction? contentRedaction;

  /// The language identification settings associated with your call analytics
  /// job. These settings include <code>VocabularyName</code>,
  /// <code>VocabularyFilterName</code>, and <code>LanguageModelName</code>.
  final Map<LanguageCode, LanguageIdSettings>? languageIdSettings;

  /// The structure used to describe a custom language model.
  final String? languageModelName;

  /// When you run a call analytics job, you can specify the language spoken in
  /// the audio, or you can have Amazon Transcribe identify the language for you.
  ///
  /// To specify a language, specify an array with one language code. If you don't
  /// know the language, you can leave this field blank and Amazon Transcribe will
  /// use machine learning to identify the language for you. To improve the
  /// ability of Amazon Transcribe to correctly identify the language, you can
  /// provide an array of the languages that can be present in the audio. Refer to
  /// <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works.html">Supported
  /// languages and language-specific features</a> for additional information.
  final List<LanguageCode>? languageOptions;

  /// Set to mask to remove filtered text from the transcript and replace it with
  /// three asterisks ("***") as placeholder text. Set to <code>remove</code> to
  /// remove filtered text from the transcript without using placeholder text. Set
  /// to <code>tag</code> to mark the word in the transcription output that
  /// matches the vocabulary filter. When you set the filter method to
  /// <code>tag</code>, the words matching your vocabulary filter are not masked
  /// or removed.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// The name of the vocabulary filter to use when running a call analytics job.
  /// The filter that you specify must have the same language code as the
  /// analytics job.
  final String? vocabularyFilterName;

  /// The name of a vocabulary to use when processing the call analytics job.
  final String? vocabularyName;

  CallAnalyticsJobSettings({
    this.contentRedaction,
    this.languageIdSettings,
    this.languageModelName,
    this.languageOptions,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyName,
  });

  factory CallAnalyticsJobSettings.fromJson(Map<String, dynamic> json) {
    return CallAnalyticsJobSettings(
      contentRedaction: json['ContentRedaction'] != null
          ? ContentRedaction.fromJson(
              json['ContentRedaction'] as Map<String, dynamic>)
          : null,
      languageIdSettings: (json['LanguageIdSettings'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toLanguageCode(),
              LanguageIdSettings.fromJson(e as Map<String, dynamic>))),
      languageModelName: json['LanguageModelName'] as String?,
      languageOptions: (json['LanguageOptions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLanguageCode())
          .toList(),
      vocabularyFilterMethod: (json['VocabularyFilterMethod'] as String?)
          ?.toVocabularyFilterMethod(),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentRedaction = this.contentRedaction;
    final languageIdSettings = this.languageIdSettings;
    final languageModelName = this.languageModelName;
    final languageOptions = this.languageOptions;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyName = this.vocabularyName;
    return {
      if (contentRedaction != null) 'ContentRedaction': contentRedaction,
      if (languageIdSettings != null)
        'LanguageIdSettings':
            languageIdSettings.map((k, e) => MapEntry(k.toValue(), e)),
      if (languageModelName != null) 'LanguageModelName': languageModelName,
      if (languageOptions != null)
        'LanguageOptions': languageOptions.map((e) => e.toValue()).toList(),
      if (vocabularyFilterMethod != null)
        'VocabularyFilterMethod': vocabularyFilterMethod.toValue(),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

enum CallAnalyticsJobStatus {
  queued,
  inProgress,
  failed,
  completed,
}

extension on CallAnalyticsJobStatus {
  String toValue() {
    switch (this) {
      case CallAnalyticsJobStatus.queued:
        return 'QUEUED';
      case CallAnalyticsJobStatus.inProgress:
        return 'IN_PROGRESS';
      case CallAnalyticsJobStatus.failed:
        return 'FAILED';
      case CallAnalyticsJobStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension on String {
  CallAnalyticsJobStatus toCallAnalyticsJobStatus() {
    switch (this) {
      case 'QUEUED':
        return CallAnalyticsJobStatus.queued;
      case 'IN_PROGRESS':
        return CallAnalyticsJobStatus.inProgress;
      case 'FAILED':
        return CallAnalyticsJobStatus.failed;
      case 'COMPLETED':
        return CallAnalyticsJobStatus.completed;
    }
    throw Exception('$this is not known in enum CallAnalyticsJobStatus');
  }
}

/// Provides summary information about a call analytics job.
class CallAnalyticsJobSummary {
  /// The name of the call analytics job.
  final String? callAnalyticsJobName;

  /// The status of the call analytics job.
  final CallAnalyticsJobStatus? callAnalyticsJobStatus;

  /// A timestamp that shows when the job was completed.
  final DateTime? completionTime;

  /// A timestamp that shows when the call analytics job was created.
  final DateTime? creationTime;

  /// If the <code>CallAnalyticsJobStatus</code> is <code>FAILED</code>, a
  /// description of the error.
  final String? failureReason;

  /// The language of the transcript in the source audio file.
  final LanguageCode? languageCode;

  /// A timestamp that shows when the job began processing.
  final DateTime? startTime;

  CallAnalyticsJobSummary({
    this.callAnalyticsJobName,
    this.callAnalyticsJobStatus,
    this.completionTime,
    this.creationTime,
    this.failureReason,
    this.languageCode,
    this.startTime,
  });

  factory CallAnalyticsJobSummary.fromJson(Map<String, dynamic> json) {
    return CallAnalyticsJobSummary(
      callAnalyticsJobName: json['CallAnalyticsJobName'] as String?,
      callAnalyticsJobStatus: (json['CallAnalyticsJobStatus'] as String?)
          ?.toCallAnalyticsJobStatus(),
      completionTime: timeStampFromJson(json['CompletionTime']),
      creationTime: timeStampFromJson(json['CreationTime']),
      failureReason: json['FailureReason'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final callAnalyticsJobName = this.callAnalyticsJobName;
    final callAnalyticsJobStatus = this.callAnalyticsJobStatus;
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final startTime = this.startTime;
    return {
      if (callAnalyticsJobName != null)
        'CallAnalyticsJobName': callAnalyticsJobName,
      if (callAnalyticsJobStatus != null)
        'CallAnalyticsJobStatus': callAnalyticsJobStatus.toValue(),
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// An object that contains the rules and additional information about a call
/// analytics category.
class CategoryProperties {
  /// The name of the call analytics category.
  final String? categoryName;

  /// A timestamp that shows when the call analytics category was created.
  final DateTime? createTime;

  /// A timestamp that shows when the call analytics category was most recently
  /// updated.
  final DateTime? lastUpdateTime;

  /// The rules used to create a call analytics category.
  final List<Rule>? rules;

  CategoryProperties({
    this.categoryName,
    this.createTime,
    this.lastUpdateTime,
    this.rules,
  });

  factory CategoryProperties.fromJson(Map<String, dynamic> json) {
    return CategoryProperties(
      categoryName: json['CategoryName'] as String?,
      createTime: timeStampFromJson(json['CreateTime']),
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => Rule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final categoryName = this.categoryName;
    final createTime = this.createTime;
    final lastUpdateTime = this.lastUpdateTime;
    final rules = this.rules;
    return {
      if (categoryName != null) 'CategoryName': categoryName,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (rules != null) 'Rules': rules,
    };
  }
}

/// For a call analytics job, an object that indicates the audio channel that
/// belongs to the agent and the audio channel that belongs to the customer.
class ChannelDefinition {
  /// A value that indicates the audio channel.
  final int? channelId;

  /// Indicates whether the person speaking on the audio channel is the agent or
  /// customer.
  final ParticipantRole? participantRole;

  ChannelDefinition({
    this.channelId,
    this.participantRole,
  });

  factory ChannelDefinition.fromJson(Map<String, dynamic> json) {
    return ChannelDefinition(
      channelId: json['ChannelId'] as int?,
      participantRole:
          (json['ParticipantRole'] as String?)?.toParticipantRole(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final participantRole = this.participantRole;
    return {
      if (channelId != null) 'ChannelId': channelId,
      if (participantRole != null) 'ParticipantRole': participantRole.toValue(),
    };
  }
}

/// Settings for content redaction within a transcription job.
class ContentRedaction {
  /// The output transcript file stored in either the default S3 bucket or in a
  /// bucket you specify.
  ///
  /// When you choose <code>redacted</code> Amazon Transcribe outputs only the
  /// redacted transcript.
  ///
  /// When you choose <code>redacted_and_unredacted</code> Amazon Transcribe
  /// outputs both the redacted and unredacted transcripts.
  final RedactionOutput redactionOutput;

  /// Request parameter that defines the entities to be redacted. The only
  /// accepted value is <code>PII</code>.
  final RedactionType redactionType;

  ContentRedaction({
    required this.redactionOutput,
    required this.redactionType,
  });

  factory ContentRedaction.fromJson(Map<String, dynamic> json) {
    return ContentRedaction(
      redactionOutput: (json['RedactionOutput'] as String).toRedactionOutput(),
      redactionType: (json['RedactionType'] as String).toRedactionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final redactionOutput = this.redactionOutput;
    final redactionType = this.redactionType;
    return {
      'RedactionOutput': redactionOutput.toValue(),
      'RedactionType': redactionType.toValue(),
    };
  }
}

class CreateCallAnalyticsCategoryResponse {
  /// The rules and associated metadata used to create a category.
  final CategoryProperties? categoryProperties;

  CreateCallAnalyticsCategoryResponse({
    this.categoryProperties,
  });

  factory CreateCallAnalyticsCategoryResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateCallAnalyticsCategoryResponse(
      categoryProperties: json['CategoryProperties'] != null
          ? CategoryProperties.fromJson(
              json['CategoryProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final categoryProperties = this.categoryProperties;
    return {
      if (categoryProperties != null) 'CategoryProperties': categoryProperties,
    };
  }
}

class CreateLanguageModelResponse {
  /// The Amazon Transcribe standard language model, or base model you've used to
  /// create a custom language model.
  final BaseModelName? baseModelName;

  /// The data access role and Amazon S3 prefixes you've chosen to create your
  /// custom language model.
  final InputDataConfig? inputDataConfig;

  /// The language code of the text you've used to create a custom language model.
  final CLMLanguageCode? languageCode;

  /// The name you've chosen for your custom language model.
  final String? modelName;

  /// The status of the custom language model. When the status is
  /// <code>COMPLETED</code> the model is ready to use.
  final ModelStatus? modelStatus;

  CreateLanguageModelResponse({
    this.baseModelName,
    this.inputDataConfig,
    this.languageCode,
    this.modelName,
    this.modelStatus,
  });

  factory CreateLanguageModelResponse.fromJson(Map<String, dynamic> json) {
    return CreateLanguageModelResponse(
      baseModelName: (json['BaseModelName'] as String?)?.toBaseModelName(),
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)?.toCLMLanguageCode(),
      modelName: json['ModelName'] as String?,
      modelStatus: (json['ModelStatus'] as String?)?.toModelStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final baseModelName = this.baseModelName;
    final inputDataConfig = this.inputDataConfig;
    final languageCode = this.languageCode;
    final modelName = this.modelName;
    final modelStatus = this.modelStatus;
    return {
      if (baseModelName != null) 'BaseModelName': baseModelName.toValue(),
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (modelName != null) 'ModelName': modelName,
      if (modelStatus != null) 'ModelStatus': modelStatus.toValue(),
    };
  }
}

class CreateMedicalVocabularyResponse {
  /// If the <code>VocabularyState</code> field is <code>FAILED</code>, this field
  /// contains information about why the job failed.
  final String? failureReason;

  /// The language code for the entries in your custom vocabulary. US English
  /// (en-US) is the only valid language code for Amazon Transcribe Medical.
  final LanguageCode? languageCode;

  /// The date and time that you created the vocabulary.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary. The name must be unique within an Amazon Web
  /// Services account and is case sensitive.
  final String? vocabularyName;

  /// The processing state of your custom vocabulary in Amazon Transcribe Medical.
  /// If the state is <code>READY</code>, you can use the vocabulary in a
  /// <code>StartMedicalTranscriptionJob</code> request.
  final VocabularyState? vocabularyState;

  CreateMedicalVocabularyResponse({
    this.failureReason,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });

  factory CreateMedicalVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return CreateMedicalVocabularyResponse(
      failureReason: json['FailureReason'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyName: json['VocabularyName'] as String?,
      vocabularyState:
          (json['VocabularyState'] as String?)?.toVocabularyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyName = this.vocabularyName;
    final vocabularyState = this.vocabularyState;
    return {
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyState != null) 'VocabularyState': vocabularyState.toValue(),
    };
  }
}

class CreateVocabularyFilterResponse {
  /// The language code of the words in the collection.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary filter was modified.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary filter.
  final String? vocabularyFilterName;

  CreateVocabularyFilterResponse({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyFilterName,
  });

  factory CreateVocabularyFilterResponse.fromJson(Map<String, dynamic> json) {
    return CreateVocabularyFilterResponse(
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyFilterName = this.vocabularyFilterName;
    return {
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
    };
  }
}

class CreateVocabularyResponse {
  /// If the <code>VocabularyState</code> field is <code>FAILED</code>, this field
  /// contains information about why the job failed.
  final String? failureReason;

  /// The language code of the vocabulary entries.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary was created.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary.
  final String? vocabularyName;

  /// The processing state of the vocabulary. When the
  /// <code>VocabularyState</code> field contains <code>READY</code> the
  /// vocabulary is ready to be used in a <code>StartTranscriptionJob</code>
  /// request.
  final VocabularyState? vocabularyState;

  CreateVocabularyResponse({
    this.failureReason,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });

  factory CreateVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return CreateVocabularyResponse(
      failureReason: json['FailureReason'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyName: json['VocabularyName'] as String?,
      vocabularyState:
          (json['VocabularyState'] as String?)?.toVocabularyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyName = this.vocabularyName;
    final vocabularyState = this.vocabularyState;
    return {
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyState != null) 'VocabularyState': vocabularyState.toValue(),
    };
  }
}

class DeleteCallAnalyticsCategoryResponse {
  DeleteCallAnalyticsCategoryResponse();

  factory DeleteCallAnalyticsCategoryResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCallAnalyticsCategoryResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteCallAnalyticsJobResponse {
  DeleteCallAnalyticsJobResponse();

  factory DeleteCallAnalyticsJobResponse.fromJson(Map<String, dynamic> _) {
    return DeleteCallAnalyticsJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeLanguageModelResponse {
  /// The name of the custom language model you requested more information about.
  final LanguageModel? languageModel;

  DescribeLanguageModelResponse({
    this.languageModel,
  });

  factory DescribeLanguageModelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLanguageModelResponse(
      languageModel: json['LanguageModel'] != null
          ? LanguageModel.fromJson(
              json['LanguageModel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final languageModel = this.languageModel;
    return {
      if (languageModel != null) 'LanguageModel': languageModel,
    };
  }
}

class GetCallAnalyticsCategoryResponse {
  /// The rules you've defined for a category.
  final CategoryProperties? categoryProperties;

  GetCallAnalyticsCategoryResponse({
    this.categoryProperties,
  });

  factory GetCallAnalyticsCategoryResponse.fromJson(Map<String, dynamic> json) {
    return GetCallAnalyticsCategoryResponse(
      categoryProperties: json['CategoryProperties'] != null
          ? CategoryProperties.fromJson(
              json['CategoryProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final categoryProperties = this.categoryProperties;
    return {
      if (categoryProperties != null) 'CategoryProperties': categoryProperties,
    };
  }
}

class GetCallAnalyticsJobResponse {
  /// An object that contains the results of your call analytics job.
  final CallAnalyticsJob? callAnalyticsJob;

  GetCallAnalyticsJobResponse({
    this.callAnalyticsJob,
  });

  factory GetCallAnalyticsJobResponse.fromJson(Map<String, dynamic> json) {
    return GetCallAnalyticsJobResponse(
      callAnalyticsJob: json['CallAnalyticsJob'] != null
          ? CallAnalyticsJob.fromJson(
              json['CallAnalyticsJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final callAnalyticsJob = this.callAnalyticsJob;
    return {
      if (callAnalyticsJob != null) 'CallAnalyticsJob': callAnalyticsJob,
    };
  }
}

class GetMedicalTranscriptionJobResponse {
  /// An object that contains the results of the medical transcription job.
  final MedicalTranscriptionJob? medicalTranscriptionJob;

  GetMedicalTranscriptionJobResponse({
    this.medicalTranscriptionJob,
  });

  factory GetMedicalTranscriptionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMedicalTranscriptionJobResponse(
      medicalTranscriptionJob: json['MedicalTranscriptionJob'] != null
          ? MedicalTranscriptionJob.fromJson(
              json['MedicalTranscriptionJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final medicalTranscriptionJob = this.medicalTranscriptionJob;
    return {
      if (medicalTranscriptionJob != null)
        'MedicalTranscriptionJob': medicalTranscriptionJob,
    };
  }
}

class GetMedicalVocabularyResponse {
  /// The location in Amazon S3 where the vocabulary is stored. Use this URI to
  /// get the contents of the vocabulary. You can download your vocabulary from
  /// the URI for a limited time.
  final String? downloadUri;

  /// If the <code>VocabularyState</code> is <code>FAILED</code>, this field
  /// contains information about why the job failed.
  final String? failureReason;

  /// The valid language code for your vocabulary entries.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary was last modified with a text file
  /// different from the one that was previously used.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary returned by Amazon Transcribe Medical.
  final String? vocabularyName;

  /// The processing state of the vocabulary. If the <code>VocabularyState</code>
  /// is <code>READY</code> then you can use it in the
  /// <code>StartMedicalTranscriptionJob</code> operation.
  final VocabularyState? vocabularyState;

  GetMedicalVocabularyResponse({
    this.downloadUri,
    this.failureReason,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });

  factory GetMedicalVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return GetMedicalVocabularyResponse(
      downloadUri: json['DownloadUri'] as String?,
      failureReason: json['FailureReason'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyName: json['VocabularyName'] as String?,
      vocabularyState:
          (json['VocabularyState'] as String?)?.toVocabularyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final downloadUri = this.downloadUri;
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyName = this.vocabularyName;
    final vocabularyState = this.vocabularyState;
    return {
      if (downloadUri != null) 'DownloadUri': downloadUri,
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyState != null) 'VocabularyState': vocabularyState.toValue(),
    };
  }
}

class GetTranscriptionJobResponse {
  /// An object that contains the results of the transcription job.
  final TranscriptionJob? transcriptionJob;

  GetTranscriptionJobResponse({
    this.transcriptionJob,
  });

  factory GetTranscriptionJobResponse.fromJson(Map<String, dynamic> json) {
    return GetTranscriptionJobResponse(
      transcriptionJob: json['TranscriptionJob'] != null
          ? TranscriptionJob.fromJson(
              json['TranscriptionJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transcriptionJob = this.transcriptionJob;
    return {
      if (transcriptionJob != null) 'TranscriptionJob': transcriptionJob,
    };
  }
}

class GetVocabularyFilterResponse {
  /// The URI of the list of words in the vocabulary filter. You can use this URI
  /// to get the list of words.
  final String? downloadUri;

  /// The language code of the words in the vocabulary filter.
  final LanguageCode? languageCode;

  /// The date and time that the contents of the vocabulary filter were updated.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary filter.
  final String? vocabularyFilterName;

  GetVocabularyFilterResponse({
    this.downloadUri,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyFilterName,
  });

  factory GetVocabularyFilterResponse.fromJson(Map<String, dynamic> json) {
    return GetVocabularyFilterResponse(
      downloadUri: json['DownloadUri'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final downloadUri = this.downloadUri;
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyFilterName = this.vocabularyFilterName;
    return {
      if (downloadUri != null) 'DownloadUri': downloadUri,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
    };
  }
}

class GetVocabularyResponse {
  /// The S3 location where the vocabulary is stored. Use this URI to get the
  /// contents of the vocabulary. The URI is available for a limited time.
  final String? downloadUri;

  /// If the <code>VocabularyState</code> field is <code>FAILED</code>, this field
  /// contains information about why the job failed.
  final String? failureReason;

  /// The language code of the vocabulary entries.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary to return.
  final String? vocabularyName;

  /// The processing state of the vocabulary.
  final VocabularyState? vocabularyState;

  GetVocabularyResponse({
    this.downloadUri,
    this.failureReason,
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });

  factory GetVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return GetVocabularyResponse(
      downloadUri: json['DownloadUri'] as String?,
      failureReason: json['FailureReason'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyName: json['VocabularyName'] as String?,
      vocabularyState:
          (json['VocabularyState'] as String?)?.toVocabularyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final downloadUri = this.downloadUri;
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyName = this.vocabularyName;
    final vocabularyState = this.vocabularyState;
    return {
      if (downloadUri != null) 'DownloadUri': downloadUri,
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyState != null) 'VocabularyState': vocabularyState.toValue(),
    };
  }
}

/// The object that contains the Amazon S3 object location and access role
/// required to train and tune your custom language model.
class InputDataConfig {
  /// The Amazon Resource Name (ARN) that uniquely identifies the permissions
  /// you've given Amazon Transcribe to access your Amazon S3 buckets containing
  /// your media files or text data. ARNs have the format
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.
  final String dataAccessRoleArn;

  /// The Amazon S3 prefix you specify to access the plain text files that you use
  /// to train your custom language model.
  final String s3Uri;

  /// The Amazon S3 prefix you specify to access the plain text files that you use
  /// to tune your custom language model.
  final String? tuningDataS3Uri;

  InputDataConfig({
    required this.dataAccessRoleArn,
    required this.s3Uri,
    this.tuningDataS3Uri,
  });

  factory InputDataConfig.fromJson(Map<String, dynamic> json) {
    return InputDataConfig(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String,
      s3Uri: json['S3Uri'] as String,
      tuningDataS3Uri: json['TuningDataS3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final s3Uri = this.s3Uri;
    final tuningDataS3Uri = this.tuningDataS3Uri;
    return {
      'DataAccessRoleArn': dataAccessRoleArn,
      'S3Uri': s3Uri,
      if (tuningDataS3Uri != null) 'TuningDataS3Uri': tuningDataS3Uri,
    };
  }
}

/// An object that enables you to configure your category to be applied to call
/// analytics jobs where either the customer or agent was interrupted.
class InterruptionFilter {
  /// An object you can use to specify a time range (in milliseconds) for when
  /// you'd want to find the interruption. For example, you could search for an
  /// interruption between the 30,000 millisecond mark and the 45,000 millisecond
  /// mark. You could also specify the time period as the first 15,000
  /// milliseconds or the last 15,000 milliseconds.
  final AbsoluteTimeRange? absoluteTimeRange;

  /// Set to <code>TRUE</code> to look for a time period where there was no
  /// interruption.
  final bool? negate;

  /// Indicates whether the caller or customer was interrupting.
  final ParticipantRole? participantRole;

  /// An object that allows percentages to specify the proportion of the call
  /// where there was a interruption. For example, you can specify the first half
  /// of the call. You can also specify the period of time between halfway through
  /// to three-quarters of the way through the call. Because the length of
  /// conversation can vary between calls, you can apply relative time ranges
  /// across all calls.
  final RelativeTimeRange? relativeTimeRange;

  /// The duration of the interruption.
  final int? threshold;

  InterruptionFilter({
    this.absoluteTimeRange,
    this.negate,
    this.participantRole,
    this.relativeTimeRange,
    this.threshold,
  });

  factory InterruptionFilter.fromJson(Map<String, dynamic> json) {
    return InterruptionFilter(
      absoluteTimeRange: json['AbsoluteTimeRange'] != null
          ? AbsoluteTimeRange.fromJson(
              json['AbsoluteTimeRange'] as Map<String, dynamic>)
          : null,
      negate: json['Negate'] as bool?,
      participantRole:
          (json['ParticipantRole'] as String?)?.toParticipantRole(),
      relativeTimeRange: json['RelativeTimeRange'] != null
          ? RelativeTimeRange.fromJson(
              json['RelativeTimeRange'] as Map<String, dynamic>)
          : null,
      threshold: json['Threshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final absoluteTimeRange = this.absoluteTimeRange;
    final negate = this.negate;
    final participantRole = this.participantRole;
    final relativeTimeRange = this.relativeTimeRange;
    final threshold = this.threshold;
    return {
      if (absoluteTimeRange != null) 'AbsoluteTimeRange': absoluteTimeRange,
      if (negate != null) 'Negate': negate,
      if (participantRole != null) 'ParticipantRole': participantRole.toValue(),
      if (relativeTimeRange != null) 'RelativeTimeRange': relativeTimeRange,
      if (threshold != null) 'Threshold': threshold,
    };
  }
}

/// Provides information about when a transcription job should be executed.
class JobExecutionSettings {
  /// Indicates whether a job should be queued by Amazon Transcribe when the
  /// concurrent execution limit is exceeded. When the
  /// <code>AllowDeferredExecution</code> field is true, jobs are queued and
  /// executed when the number of executing jobs falls below the concurrent
  /// execution limit. If the field is false, Amazon Transcribe returns a
  /// <code>LimitExceededException</code> exception.
  ///
  /// Note that job queuing is enabled by default for call analytics jobs.
  ///
  /// If you specify the <code>AllowDeferredExecution</code> field, you must
  /// specify the <code>DataAccessRoleArn</code> field.
  final bool? allowDeferredExecution;

  /// The Amazon Resource Name (ARN), in the form
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>,
  /// of a role that has access to the S3 bucket that contains the input files.
  /// Amazon Transcribe assumes this role to read queued media files. If you have
  /// specified an output S3 bucket for the transcription results, this role
  /// should have access to the output bucket as well.
  ///
  /// If you specify the <code>AllowDeferredExecution</code> field, you must
  /// specify the <code>DataAccessRoleArn</code> field.
  final String? dataAccessRoleArn;

  JobExecutionSettings({
    this.allowDeferredExecution,
    this.dataAccessRoleArn,
  });

  factory JobExecutionSettings.fromJson(Map<String, dynamic> json) {
    return JobExecutionSettings(
      allowDeferredExecution: json['AllowDeferredExecution'] as bool?,
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowDeferredExecution = this.allowDeferredExecution;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    return {
      if (allowDeferredExecution != null)
        'AllowDeferredExecution': allowDeferredExecution,
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
    };
  }
}

enum LanguageCode {
  afZa,
  arAe,
  arSa,
  cyGb,
  daDk,
  deCh,
  deDe,
  enAb,
  enAu,
  enGb,
  enIe,
  enIn,
  enUs,
  enWl,
  esEs,
  esUs,
  faIr,
  frCa,
  frFr,
  gaIe,
  gdGb,
  heIl,
  hiIn,
  idId,
  itIt,
  jaJp,
  koKr,
  msMy,
  nlNl,
  ptBr,
  ptPt,
  ruRu,
  taIn,
  teIn,
  trTr,
  zhCn,
  zhTw,
  thTh,
  enZa,
  enNz,
}

extension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.afZa:
        return 'af-ZA';
      case LanguageCode.arAe:
        return 'ar-AE';
      case LanguageCode.arSa:
        return 'ar-SA';
      case LanguageCode.cyGb:
        return 'cy-GB';
      case LanguageCode.daDk:
        return 'da-DK';
      case LanguageCode.deCh:
        return 'de-CH';
      case LanguageCode.deDe:
        return 'de-DE';
      case LanguageCode.enAb:
        return 'en-AB';
      case LanguageCode.enAu:
        return 'en-AU';
      case LanguageCode.enGb:
        return 'en-GB';
      case LanguageCode.enIe:
        return 'en-IE';
      case LanguageCode.enIn:
        return 'en-IN';
      case LanguageCode.enUs:
        return 'en-US';
      case LanguageCode.enWl:
        return 'en-WL';
      case LanguageCode.esEs:
        return 'es-ES';
      case LanguageCode.esUs:
        return 'es-US';
      case LanguageCode.faIr:
        return 'fa-IR';
      case LanguageCode.frCa:
        return 'fr-CA';
      case LanguageCode.frFr:
        return 'fr-FR';
      case LanguageCode.gaIe:
        return 'ga-IE';
      case LanguageCode.gdGb:
        return 'gd-GB';
      case LanguageCode.heIl:
        return 'he-IL';
      case LanguageCode.hiIn:
        return 'hi-IN';
      case LanguageCode.idId:
        return 'id-ID';
      case LanguageCode.itIt:
        return 'it-IT';
      case LanguageCode.jaJp:
        return 'ja-JP';
      case LanguageCode.koKr:
        return 'ko-KR';
      case LanguageCode.msMy:
        return 'ms-MY';
      case LanguageCode.nlNl:
        return 'nl-NL';
      case LanguageCode.ptBr:
        return 'pt-BR';
      case LanguageCode.ptPt:
        return 'pt-PT';
      case LanguageCode.ruRu:
        return 'ru-RU';
      case LanguageCode.taIn:
        return 'ta-IN';
      case LanguageCode.teIn:
        return 'te-IN';
      case LanguageCode.trTr:
        return 'tr-TR';
      case LanguageCode.zhCn:
        return 'zh-CN';
      case LanguageCode.zhTw:
        return 'zh-TW';
      case LanguageCode.thTh:
        return 'th-TH';
      case LanguageCode.enZa:
        return 'en-ZA';
      case LanguageCode.enNz:
        return 'en-NZ';
    }
  }
}

extension on String {
  LanguageCode toLanguageCode() {
    switch (this) {
      case 'af-ZA':
        return LanguageCode.afZa;
      case 'ar-AE':
        return LanguageCode.arAe;
      case 'ar-SA':
        return LanguageCode.arSa;
      case 'cy-GB':
        return LanguageCode.cyGb;
      case 'da-DK':
        return LanguageCode.daDk;
      case 'de-CH':
        return LanguageCode.deCh;
      case 'de-DE':
        return LanguageCode.deDe;
      case 'en-AB':
        return LanguageCode.enAb;
      case 'en-AU':
        return LanguageCode.enAu;
      case 'en-GB':
        return LanguageCode.enGb;
      case 'en-IE':
        return LanguageCode.enIe;
      case 'en-IN':
        return LanguageCode.enIn;
      case 'en-US':
        return LanguageCode.enUs;
      case 'en-WL':
        return LanguageCode.enWl;
      case 'es-ES':
        return LanguageCode.esEs;
      case 'es-US':
        return LanguageCode.esUs;
      case 'fa-IR':
        return LanguageCode.faIr;
      case 'fr-CA':
        return LanguageCode.frCa;
      case 'fr-FR':
        return LanguageCode.frFr;
      case 'ga-IE':
        return LanguageCode.gaIe;
      case 'gd-GB':
        return LanguageCode.gdGb;
      case 'he-IL':
        return LanguageCode.heIl;
      case 'hi-IN':
        return LanguageCode.hiIn;
      case 'id-ID':
        return LanguageCode.idId;
      case 'it-IT':
        return LanguageCode.itIt;
      case 'ja-JP':
        return LanguageCode.jaJp;
      case 'ko-KR':
        return LanguageCode.koKr;
      case 'ms-MY':
        return LanguageCode.msMy;
      case 'nl-NL':
        return LanguageCode.nlNl;
      case 'pt-BR':
        return LanguageCode.ptBr;
      case 'pt-PT':
        return LanguageCode.ptPt;
      case 'ru-RU':
        return LanguageCode.ruRu;
      case 'ta-IN':
        return LanguageCode.taIn;
      case 'te-IN':
        return LanguageCode.teIn;
      case 'tr-TR':
        return LanguageCode.trTr;
      case 'zh-CN':
        return LanguageCode.zhCn;
      case 'zh-TW':
        return LanguageCode.zhTw;
      case 'th-TH':
        return LanguageCode.thTh;
      case 'en-ZA':
        return LanguageCode.enZa;
      case 'en-NZ':
        return LanguageCode.enNz;
    }
    throw Exception('$this is not known in enum LanguageCode');
  }
}

/// Language-specific settings that can be specified when language
/// identification is enabled.
class LanguageIdSettings {
  /// The name of the language model you want to use when transcribing your audio.
  /// The model you specify must have the same language code as the transcription
  /// job; if the languages don't match, the language model won't be applied.
  final String? languageModelName;

  /// The name of the vocabulary filter you want to use when transcribing your
  /// audio. The filter you specify must have the same language code as the
  /// transcription job; if the languages don't match, the vocabulary filter won't
  /// be applied.
  final String? vocabularyFilterName;

  /// The name of the vocabulary you want to use when processing your
  /// transcription job. The vocabulary you specify must have the same language
  /// code as the transcription job; if the languages don't match, the vocabulary
  /// won't be applied.
  final String? vocabularyName;

  LanguageIdSettings({
    this.languageModelName,
    this.vocabularyFilterName,
    this.vocabularyName,
  });

  factory LanguageIdSettings.fromJson(Map<String, dynamic> json) {
    return LanguageIdSettings(
      languageModelName: json['LanguageModelName'] as String?,
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageModelName = this.languageModelName;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyName = this.vocabularyName;
    return {
      if (languageModelName != null) 'LanguageModelName': languageModelName,
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

/// The structure used to describe a custom language model.
class LanguageModel {
  /// The Amazon Transcribe standard language model, or base model used to create
  /// the custom language model.
  final BaseModelName? baseModelName;

  /// The time the custom language model was created.
  final DateTime? createTime;

  /// The reason why the custom language model couldn't be created.
  final String? failureReason;

  /// The data access role and Amazon S3 prefixes for the input files used to
  /// train the custom language model.
  final InputDataConfig? inputDataConfig;

  /// The language code you used to create your custom language model.
  final CLMLanguageCode? languageCode;

  /// The most recent time the custom language model was modified.
  final DateTime? lastModifiedTime;

  /// The name of the custom language model.
  final String? modelName;

  /// The creation status of a custom language model. When the status is
  /// <code>COMPLETED</code> the model is ready for use.
  final ModelStatus? modelStatus;

  /// Whether the base model used for the custom language model is up to date. If
  /// this field is <code>true</code> then you are running the most up-to-date
  /// version of the base model in your custom language model.
  final bool? upgradeAvailability;

  LanguageModel({
    this.baseModelName,
    this.createTime,
    this.failureReason,
    this.inputDataConfig,
    this.languageCode,
    this.lastModifiedTime,
    this.modelName,
    this.modelStatus,
    this.upgradeAvailability,
  });

  factory LanguageModel.fromJson(Map<String, dynamic> json) {
    return LanguageModel(
      baseModelName: (json['BaseModelName'] as String?)?.toBaseModelName(),
      createTime: timeStampFromJson(json['CreateTime']),
      failureReason: json['FailureReason'] as String?,
      inputDataConfig: json['InputDataConfig'] != null
          ? InputDataConfig.fromJson(
              json['InputDataConfig'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)?.toCLMLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      modelName: json['ModelName'] as String?,
      modelStatus: (json['ModelStatus'] as String?)?.toModelStatus(),
      upgradeAvailability: json['UpgradeAvailability'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseModelName = this.baseModelName;
    final createTime = this.createTime;
    final failureReason = this.failureReason;
    final inputDataConfig = this.inputDataConfig;
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final modelName = this.modelName;
    final modelStatus = this.modelStatus;
    final upgradeAvailability = this.upgradeAvailability;
    return {
      if (baseModelName != null) 'BaseModelName': baseModelName.toValue(),
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (inputDataConfig != null) 'InputDataConfig': inputDataConfig,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (modelName != null) 'ModelName': modelName,
      if (modelStatus != null) 'ModelStatus': modelStatus.toValue(),
      if (upgradeAvailability != null)
        'UpgradeAvailability': upgradeAvailability,
    };
  }
}

class ListCallAnalyticsCategoriesResponse {
  /// A list of objects containing information about analytics categories.
  final List<CategoryProperties>? categories;

  /// The operation returns a page of jobs at a time. The maximum size of the list
  /// is set by the <code>MaxResults</code> parameter. If there are more
  /// categories in the list than the page size, Amazon Transcribe returns the
  /// <code>NextPage</code> token. Include the token in the next request to the
  /// operation to return the next page of analytics categories.
  final String? nextToken;

  ListCallAnalyticsCategoriesResponse({
    this.categories,
    this.nextToken,
  });

  factory ListCallAnalyticsCategoriesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListCallAnalyticsCategoriesResponse(
      categories: (json['Categories'] as List?)
          ?.whereNotNull()
          .map((e) => CategoryProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final nextToken = this.nextToken;
    return {
      if (categories != null) 'Categories': categories,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListCallAnalyticsJobsResponse {
  /// A list of objects containing summary information for a transcription job.
  final List<CallAnalyticsJobSummary>? callAnalyticsJobSummaries;

  /// The operation returns a page of jobs at a time. The maximum size of the page
  /// is set by the <code>MaxResults</code> parameter. If there are more jobs in
  /// the list than the page size, Amazon Transcribe returns the
  /// <code>NextPage</code> token. Include the token in your next request to the
  /// operation to return next page of jobs.
  final String? nextToken;

  /// When specified, returns only call analytics jobs with that status. Jobs are
  /// ordered by creation date, with the most recent jobs returned first. If you
  /// don't specify a status, Amazon Transcribe returns all transcription jobs
  /// ordered by creation date.
  final CallAnalyticsJobStatus? status;

  ListCallAnalyticsJobsResponse({
    this.callAnalyticsJobSummaries,
    this.nextToken,
    this.status,
  });

  factory ListCallAnalyticsJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListCallAnalyticsJobsResponse(
      callAnalyticsJobSummaries: (json['CallAnalyticsJobSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CallAnalyticsJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      status: (json['Status'] as String?)?.toCallAnalyticsJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final callAnalyticsJobSummaries = this.callAnalyticsJobSummaries;
    final nextToken = this.nextToken;
    final status = this.status;
    return {
      if (callAnalyticsJobSummaries != null)
        'CallAnalyticsJobSummaries': callAnalyticsJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ListLanguageModelsResponse {
  /// A list of objects containing information about custom language models.
  final List<LanguageModel>? models;

  /// The operation returns a page of jobs at a time. The maximum size of the list
  /// is set by the MaxResults parameter. If there are more language models in the
  /// list than the page size, Amazon Transcribe returns the <code>NextPage</code>
  /// token. Include the token in the next request to the operation to return the
  /// next page of language models.
  final String? nextToken;

  ListLanguageModelsResponse({
    this.models,
    this.nextToken,
  });

  factory ListLanguageModelsResponse.fromJson(Map<String, dynamic> json) {
    return ListLanguageModelsResponse(
      models: (json['Models'] as List?)
          ?.whereNotNull()
          .map((e) => LanguageModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final models = this.models;
    final nextToken = this.nextToken;
    return {
      if (models != null) 'Models': models,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMedicalTranscriptionJobsResponse {
  /// A list of objects containing summary information for a transcription job.
  final List<MedicalTranscriptionJobSummary>? medicalTranscriptionJobSummaries;

  /// The <code>ListMedicalTranscriptionJobs</code> operation returns a page of
  /// jobs at a time. The maximum size of the page is set by the
  /// <code>MaxResults</code> parameter. If the number of jobs exceeds what can
  /// fit on a page, Amazon Transcribe Medical returns the <code>NextPage</code>
  /// token. Include the token in the next request to the
  /// <code>ListMedicalTranscriptionJobs</code> operation to return in the next
  /// page of jobs.
  final String? nextToken;

  /// The requested status of the medical transcription jobs returned.
  final TranscriptionJobStatus? status;

  ListMedicalTranscriptionJobsResponse({
    this.medicalTranscriptionJobSummaries,
    this.nextToken,
    this.status,
  });

  factory ListMedicalTranscriptionJobsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMedicalTranscriptionJobsResponse(
      medicalTranscriptionJobSummaries:
          (json['MedicalTranscriptionJobSummaries'] as List?)
              ?.whereNotNull()
              .map((e) => MedicalTranscriptionJobSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
      status: (json['Status'] as String?)?.toTranscriptionJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final medicalTranscriptionJobSummaries =
        this.medicalTranscriptionJobSummaries;
    final nextToken = this.nextToken;
    final status = this.status;
    return {
      if (medicalTranscriptionJobSummaries != null)
        'MedicalTranscriptionJobSummaries': medicalTranscriptionJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ListMedicalVocabulariesResponse {
  /// The <code>ListMedicalVocabularies</code> operation returns a page of
  /// vocabularies at a time. You set the maximum number of vocabularies to return
  /// on a page with the <code>MaxResults</code> parameter. If there are more jobs
  /// in the list will fit on a page, Amazon Transcribe Medical returns the
  /// <code>NextPage</code> token. To return the next page of vocabularies,
  /// include the token in the next request to the
  /// <code>ListMedicalVocabularies</code> operation .
  final String? nextToken;

  /// The requested vocabulary state.
  final VocabularyState? status;

  /// A list of objects that describe the vocabularies that match your search
  /// criteria.
  final List<VocabularyInfo>? vocabularies;

  ListMedicalVocabulariesResponse({
    this.nextToken,
    this.status,
    this.vocabularies,
  });

  factory ListMedicalVocabulariesResponse.fromJson(Map<String, dynamic> json) {
    return ListMedicalVocabulariesResponse(
      nextToken: json['NextToken'] as String?,
      status: (json['Status'] as String?)?.toVocabularyState(),
      vocabularies: (json['Vocabularies'] as List?)
          ?.whereNotNull()
          .map((e) => VocabularyInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final status = this.status;
    final vocabularies = this.vocabularies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (status != null) 'Status': status.toValue(),
      if (vocabularies != null) 'Vocabularies': vocabularies,
    };
  }
}

class ListTagsForResourceResponse {
  /// Lists all tags associated with the given Amazon Resource Name (ARN).
  final String? resourceArn;

  /// Lists all tags associated with the given transcription job, vocabulary, or
  /// resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.resourceArn,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceArn: json['ResourceArn'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (tags != null) 'Tags': tags,
    };
  }
}

class ListTranscriptionJobsResponse {
  /// The <code>ListTranscriptionJobs</code> operation returns a page of jobs at a
  /// time. The maximum size of the page is set by the <code>MaxResults</code>
  /// parameter. If there are more jobs in the list than the page size, Amazon
  /// Transcribe returns the <code>NextPage</code> token. Include the token in the
  /// next request to the <code>ListTranscriptionJobs</code> operation to return
  /// in the next page of jobs.
  final String? nextToken;

  /// The requested status of the jobs returned.
  final TranscriptionJobStatus? status;

  /// A list of objects containing summary information for a transcription job.
  final List<TranscriptionJobSummary>? transcriptionJobSummaries;

  ListTranscriptionJobsResponse({
    this.nextToken,
    this.status,
    this.transcriptionJobSummaries,
  });

  factory ListTranscriptionJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListTranscriptionJobsResponse(
      nextToken: json['NextToken'] as String?,
      status: (json['Status'] as String?)?.toTranscriptionJobStatus(),
      transcriptionJobSummaries: (json['TranscriptionJobSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              TranscriptionJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final status = this.status;
    final transcriptionJobSummaries = this.transcriptionJobSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (status != null) 'Status': status.toValue(),
      if (transcriptionJobSummaries != null)
        'TranscriptionJobSummaries': transcriptionJobSummaries,
    };
  }
}

class ListVocabulariesResponse {
  /// The <code>ListVocabularies</code> operation returns a page of vocabularies
  /// at a time. The maximum size of the page is set in the
  /// <code>MaxResults</code> parameter. If there are more jobs in the list than
  /// will fit on the page, Amazon Transcribe returns the <code>NextPage</code>
  /// token. To return in the next page of jobs, include the token in the next
  /// request to the <code>ListVocabularies</code> operation.
  final String? nextToken;

  /// The requested vocabulary state.
  final VocabularyState? status;

  /// A list of objects that describe the vocabularies that match the search
  /// criteria in the request.
  final List<VocabularyInfo>? vocabularies;

  ListVocabulariesResponse({
    this.nextToken,
    this.status,
    this.vocabularies,
  });

  factory ListVocabulariesResponse.fromJson(Map<String, dynamic> json) {
    return ListVocabulariesResponse(
      nextToken: json['NextToken'] as String?,
      status: (json['Status'] as String?)?.toVocabularyState(),
      vocabularies: (json['Vocabularies'] as List?)
          ?.whereNotNull()
          .map((e) => VocabularyInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final status = this.status;
    final vocabularies = this.vocabularies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (status != null) 'Status': status.toValue(),
      if (vocabularies != null) 'Vocabularies': vocabularies,
    };
  }
}

class ListVocabularyFiltersResponse {
  /// The <code>ListVocabularyFilters</code> operation returns a page of
  /// collections at a time. The maximum size of the page is set by the
  /// <code>MaxResults</code> parameter. If there are more jobs in the list than
  /// the page size, Amazon Transcribe returns the <code>NextPage</code> token.
  /// Include the token in the next request to the
  /// <code>ListVocabularyFilters</code> operation to return in the next page of
  /// jobs.
  final String? nextToken;

  /// The list of vocabulary filters. It contains at most <code>MaxResults</code>
  /// number of filters. If there are more filters, call the
  /// <code>ListVocabularyFilters</code> operation again with the
  /// <code>NextToken</code> parameter in the request set to the value of the
  /// <code>NextToken</code> field in the response.
  final List<VocabularyFilterInfo>? vocabularyFilters;

  ListVocabularyFiltersResponse({
    this.nextToken,
    this.vocabularyFilters,
  });

  factory ListVocabularyFiltersResponse.fromJson(Map<String, dynamic> json) {
    return ListVocabularyFiltersResponse(
      nextToken: json['NextToken'] as String?,
      vocabularyFilters: (json['VocabularyFilters'] as List?)
          ?.whereNotNull()
          .map((e) => VocabularyFilterInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final vocabularyFilters = this.vocabularyFilters;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (vocabularyFilters != null) 'VocabularyFilters': vocabularyFilters,
    };
  }
}

/// Describes the input media file in a transcription request.
class Media {
  /// The S3 object location of the input media file. The URI must be in the same
  /// region as the API endpoint that you are calling. The general form is:
  ///
  /// For example:
  ///
  /// For more information about S3 object names, see <a
  /// href="https://docs.aws.amazon.com/AmazonS3/latest/dev/UsingMetadata.html#object-keys">Object
  /// Keys</a> in the <i>Amazon S3 Developer Guide</i>.
  final String? mediaFileUri;

  /// The S3 object location for your redacted output media file. This is only
  /// supported for call analytics jobs.
  final String? redactedMediaFileUri;

  Media({
    this.mediaFileUri,
    this.redactedMediaFileUri,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      mediaFileUri: json['MediaFileUri'] as String?,
      redactedMediaFileUri: json['RedactedMediaFileUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaFileUri = this.mediaFileUri;
    final redactedMediaFileUri = this.redactedMediaFileUri;
    return {
      if (mediaFileUri != null) 'MediaFileUri': mediaFileUri,
      if (redactedMediaFileUri != null)
        'RedactedMediaFileUri': redactedMediaFileUri,
    };
  }
}

enum MediaFormat {
  mp3,
  mp4,
  wav,
  flac,
  ogg,
  amr,
  webm,
}

extension on MediaFormat {
  String toValue() {
    switch (this) {
      case MediaFormat.mp3:
        return 'mp3';
      case MediaFormat.mp4:
        return 'mp4';
      case MediaFormat.wav:
        return 'wav';
      case MediaFormat.flac:
        return 'flac';
      case MediaFormat.ogg:
        return 'ogg';
      case MediaFormat.amr:
        return 'amr';
      case MediaFormat.webm:
        return 'webm';
    }
  }
}

extension on String {
  MediaFormat toMediaFormat() {
    switch (this) {
      case 'mp3':
        return MediaFormat.mp3;
      case 'mp4':
        return MediaFormat.mp4;
      case 'wav':
        return MediaFormat.wav;
      case 'flac':
        return MediaFormat.flac;
      case 'ogg':
        return MediaFormat.ogg;
      case 'amr':
        return MediaFormat.amr;
      case 'webm':
        return MediaFormat.webm;
    }
    throw Exception('$this is not known in enum MediaFormat');
  }
}

enum MedicalContentIdentificationType {
  phi,
}

extension on MedicalContentIdentificationType {
  String toValue() {
    switch (this) {
      case MedicalContentIdentificationType.phi:
        return 'PHI';
    }
  }
}

extension on String {
  MedicalContentIdentificationType toMedicalContentIdentificationType() {
    switch (this) {
      case 'PHI':
        return MedicalContentIdentificationType.phi;
    }
    throw Exception(
        '$this is not known in enum MedicalContentIdentificationType');
  }
}

/// Identifies the location of a medical transcript.
class MedicalTranscript {
  /// The S3 object location of the medical transcript.
  ///
  /// Use this URI to access the medical transcript. This URI points to the S3
  /// bucket you created to store the medical transcript.
  final String? transcriptFileUri;

  MedicalTranscript({
    this.transcriptFileUri,
  });

  factory MedicalTranscript.fromJson(Map<String, dynamic> json) {
    return MedicalTranscript(
      transcriptFileUri: json['TranscriptFileUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transcriptFileUri = this.transcriptFileUri;
    return {
      if (transcriptFileUri != null) 'TranscriptFileUri': transcriptFileUri,
    };
  }
}

/// The data structure that contains the information for a medical transcription
/// job.
class MedicalTranscriptionJob {
  /// A timestamp that shows when the job was completed.
  final DateTime? completionTime;

  /// Shows the type of content that you've configured Amazon Transcribe Medical
  /// to identify in a transcription job. If the value is <code>PHI</code>, you've
  /// configured the job to identify personal health information (PHI) in the
  /// transcription output.
  final MedicalContentIdentificationType? contentIdentificationType;

  /// A timestamp that shows when the job was created.
  final DateTime? creationTime;

  /// If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>,
  /// this field contains information about why the job failed.
  ///
  /// The <code>FailureReason</code> field contains one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Unsupported media format</code>- The media format specified in the
  /// <code>MediaFormat</code> field of the request isn't valid. See the
  /// description of the <code>MediaFormat</code> field for a list of valid
  /// values.
  /// </li>
  /// <li>
  /// <code>The media format provided does not match the detected media
  /// format</code>- The media format of the audio file doesn't match the format
  /// specified in the <code>MediaFormat</code> field in the request. Check the
  /// media format of your media file and make sure the two values match.
  /// </li>
  /// <li>
  /// <code>Invalid sample rate for audio file</code>- The sample rate specified
  /// in the <code>MediaSampleRateHertz</code> of the request isn't valid. The
  /// sample rate must be between 8,000 and 48,000 Hertz.
  /// </li>
  /// <li>
  /// <code>The sample rate provided does not match the detected sample
  /// rate</code>- The sample rate in the audio file doesn't match the sample rate
  /// specified in the <code>MediaSampleRateHertz</code> field in the request.
  /// Check the sample rate of your media file and make sure that the two values
  /// match.
  /// </li>
  /// <li>
  /// <code>Invalid file size: file size too large</code>- The size of your audio
  /// file is larger than what Amazon Transcribe Medical can process. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits">Guidelines
  /// and Quotas</a> in the <i>Amazon Transcribe Medical Guide</i>
  /// </li>
  /// <li>
  /// <code>Invalid number of channels: number of channels too large</code>- Your
  /// audio contains more channels than Amazon Transcribe Medical is configured to
  /// process. To request additional channels, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe-medical.html">Amazon
  /// Transcribe Medical Endpoints and Quotas</a> in the <i>Amazon Web Services
  /// General Reference</i>
  /// </li>
  /// </ul>
  final String? failureReason;

  /// The language code for the language spoken in the source audio file. US
  /// English (en-US) is the only supported language for medical transcriptions.
  /// Any other value you enter for language code results in a
  /// <code>BadRequestException</code> error.
  final LanguageCode? languageCode;
  final Media? media;

  /// The format of the input media file.
  final MediaFormat? mediaFormat;

  /// The sample rate, in Hertz, of the source audio containing medical
  /// information.
  ///
  /// If you don't specify the sample rate, Amazon Transcribe Medical determines
  /// it for you. If you choose to specify the sample rate, it must match the rate
  /// detected by Amazon Transcribe Medical. In most cases, you should leave the
  /// <code>MedicalMediaSampleHertz</code> blank and let Amazon Transcribe Medical
  /// determine the sample rate.
  final int? mediaSampleRateHertz;

  /// The name for a given medical transcription job.
  final String? medicalTranscriptionJobName;

  /// Object that contains object.
  final MedicalTranscriptionSetting? settings;

  /// The medical specialty of any clinicians providing a dictation or having a
  /// conversation. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-medical-conversation.html">Transcribing
  /// a medical conversation</a>for a list of supported specialties.
  final Specialty? specialty;

  /// A timestamp that shows when the job started processing.
  final DateTime? startTime;

  /// A key:value pair assigned to a given medical transcription job.
  final List<Tag>? tags;

  /// An object that contains the <code>MedicalTranscript</code>. The
  /// <code>MedicalTranscript</code> contains the <code>TranscriptFileUri</code>.
  final MedicalTranscript? transcript;

  /// The completion status of a medical transcription job.
  final TranscriptionJobStatus? transcriptionJobStatus;

  /// The type of speech in the transcription job. <code>CONVERSATION</code> is
  /// generally used for patient-physician dialogues. <code>DICTATION</code> is
  /// the setting for physicians speaking their notes after seeing a patient. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/what-is-transcribe-med.html">What
  /// is Amazon Transcribe Medical?</a>.
  final Type? type;

  MedicalTranscriptionJob({
    this.completionTime,
    this.contentIdentificationType,
    this.creationTime,
    this.failureReason,
    this.languageCode,
    this.media,
    this.mediaFormat,
    this.mediaSampleRateHertz,
    this.medicalTranscriptionJobName,
    this.settings,
    this.specialty,
    this.startTime,
    this.tags,
    this.transcript,
    this.transcriptionJobStatus,
    this.type,
  });

  factory MedicalTranscriptionJob.fromJson(Map<String, dynamic> json) {
    return MedicalTranscriptionJob(
      completionTime: timeStampFromJson(json['CompletionTime']),
      contentIdentificationType: (json['ContentIdentificationType'] as String?)
          ?.toMedicalContentIdentificationType(),
      creationTime: timeStampFromJson(json['CreationTime']),
      failureReason: json['FailureReason'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      media: json['Media'] != null
          ? Media.fromJson(json['Media'] as Map<String, dynamic>)
          : null,
      mediaFormat: (json['MediaFormat'] as String?)?.toMediaFormat(),
      mediaSampleRateHertz: json['MediaSampleRateHertz'] as int?,
      medicalTranscriptionJobName:
          json['MedicalTranscriptionJobName'] as String?,
      settings: json['Settings'] != null
          ? MedicalTranscriptionSetting.fromJson(
              json['Settings'] as Map<String, dynamic>)
          : null,
      specialty: (json['Specialty'] as String?)?.toSpecialty(),
      startTime: timeStampFromJson(json['StartTime']),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      transcript: json['Transcript'] != null
          ? MedicalTranscript.fromJson(
              json['Transcript'] as Map<String, dynamic>)
          : null,
      transcriptionJobStatus: (json['TranscriptionJobStatus'] as String?)
          ?.toTranscriptionJobStatus(),
      type: (json['Type'] as String?)?.toType(),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final contentIdentificationType = this.contentIdentificationType;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final media = this.media;
    final mediaFormat = this.mediaFormat;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final medicalTranscriptionJobName = this.medicalTranscriptionJobName;
    final settings = this.settings;
    final specialty = this.specialty;
    final startTime = this.startTime;
    final tags = this.tags;
    final transcript = this.transcript;
    final transcriptionJobStatus = this.transcriptionJobStatus;
    final type = this.type;
    return {
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (contentIdentificationType != null)
        'ContentIdentificationType': contentIdentificationType.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (media != null) 'Media': media,
      if (mediaFormat != null) 'MediaFormat': mediaFormat.toValue(),
      if (mediaSampleRateHertz != null)
        'MediaSampleRateHertz': mediaSampleRateHertz,
      if (medicalTranscriptionJobName != null)
        'MedicalTranscriptionJobName': medicalTranscriptionJobName,
      if (settings != null) 'Settings': settings,
      if (specialty != null) 'Specialty': specialty.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (tags != null) 'Tags': tags,
      if (transcript != null) 'Transcript': transcript,
      if (transcriptionJobStatus != null)
        'TranscriptionJobStatus': transcriptionJobStatus.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Provides summary information about a transcription job.
class MedicalTranscriptionJobSummary {
  /// A timestamp that shows when the job was completed.
  final DateTime? completionTime;

  /// Shows the type of information you've configured Amazon Transcribe Medical to
  /// identify in a transcription job. If the value is <code>PHI</code>, you've
  /// configured the transcription job to identify personal health information
  /// (PHI).
  final MedicalContentIdentificationType? contentIdentificationType;

  /// A timestamp that shows when the medical transcription job was created.
  final DateTime? creationTime;

  /// If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a
  /// description of the error.
  final String? failureReason;

  /// The language of the transcript in the source audio file.
  final LanguageCode? languageCode;

  /// The name of a medical transcription job.
  final String? medicalTranscriptionJobName;

  /// Indicates the location of the transcription job's output. This field must be
  /// the path of an S3 bucket; if you don't already have an S3 bucket, one is
  /// created based on the path you add.
  final OutputLocationType? outputLocationType;

  /// The medical specialty of the transcription job. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/transcribe-medical-conversation.html">Transcribing
  /// a medical conversation</a>for a list of supported specialties.
  final Specialty? specialty;

  /// A timestamp that shows when the job began processing.
  final DateTime? startTime;

  /// The status of the medical transcription job.
  final TranscriptionJobStatus? transcriptionJobStatus;

  /// The speech of the clinician in the input audio.
  final Type? type;

  MedicalTranscriptionJobSummary({
    this.completionTime,
    this.contentIdentificationType,
    this.creationTime,
    this.failureReason,
    this.languageCode,
    this.medicalTranscriptionJobName,
    this.outputLocationType,
    this.specialty,
    this.startTime,
    this.transcriptionJobStatus,
    this.type,
  });

  factory MedicalTranscriptionJobSummary.fromJson(Map<String, dynamic> json) {
    return MedicalTranscriptionJobSummary(
      completionTime: timeStampFromJson(json['CompletionTime']),
      contentIdentificationType: (json['ContentIdentificationType'] as String?)
          ?.toMedicalContentIdentificationType(),
      creationTime: timeStampFromJson(json['CreationTime']),
      failureReason: json['FailureReason'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      medicalTranscriptionJobName:
          json['MedicalTranscriptionJobName'] as String?,
      outputLocationType:
          (json['OutputLocationType'] as String?)?.toOutputLocationType(),
      specialty: (json['Specialty'] as String?)?.toSpecialty(),
      startTime: timeStampFromJson(json['StartTime']),
      transcriptionJobStatus: (json['TranscriptionJobStatus'] as String?)
          ?.toTranscriptionJobStatus(),
      type: (json['Type'] as String?)?.toType(),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final contentIdentificationType = this.contentIdentificationType;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final medicalTranscriptionJobName = this.medicalTranscriptionJobName;
    final outputLocationType = this.outputLocationType;
    final specialty = this.specialty;
    final startTime = this.startTime;
    final transcriptionJobStatus = this.transcriptionJobStatus;
    final type = this.type;
    return {
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (contentIdentificationType != null)
        'ContentIdentificationType': contentIdentificationType.toValue(),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (medicalTranscriptionJobName != null)
        'MedicalTranscriptionJobName': medicalTranscriptionJobName,
      if (outputLocationType != null)
        'OutputLocationType': outputLocationType.toValue(),
      if (specialty != null) 'Specialty': specialty.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (transcriptionJobStatus != null)
        'TranscriptionJobStatus': transcriptionJobStatus.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Optional settings for the <a>StartMedicalTranscriptionJob</a> operation.
class MedicalTranscriptionSetting {
  /// Instructs Amazon Transcribe Medical to process each audio channel separately
  /// and then merge the transcription output of each channel into a single
  /// transcription.
  ///
  /// Amazon Transcribe Medical also produces a transcription of each item
  /// detected on an audio channel, including the start time and end time of the
  /// item and alternative transcriptions of item. The alternative transcriptions
  /// also come with confidence scores provided by Amazon Transcribe Medical.
  ///
  /// You can't set both <code>ShowSpeakerLabels</code> and
  /// <code>ChannelIdentification</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>
  final bool? channelIdentification;

  /// The maximum number of alternatives that you tell the service to return. If
  /// you specify the <code>MaxAlternatives</code> field, you must set the
  /// <code>ShowAlternatives</code> field to true.
  final int? maxAlternatives;

  /// The maximum number of speakers to identify in the input audio. If there are
  /// more speakers in the audio than this number, multiple speakers are
  /// identified as a single speaker. If you specify the
  /// <code>MaxSpeakerLabels</code> field, you must set the
  /// <code>ShowSpeakerLabels</code> field to true.
  final int? maxSpeakerLabels;

  /// Determines whether alternative transcripts are generated along with the
  /// transcript that has the highest confidence. If you set
  /// <code>ShowAlternatives</code> field to true, you must also set the maximum
  /// number of alternatives to return in the <code>MaxAlternatives</code> field.
  final bool? showAlternatives;

  /// Determines whether the transcription job uses speaker recognition to
  /// identify different speakers in the input audio. Speaker recognition labels
  /// individual speakers in the audio file. If you set the
  /// <code>ShowSpeakerLabels</code> field to true, you must also set the maximum
  /// number of speaker labels in the <code>MaxSpeakerLabels</code> field.
  ///
  /// You can't set both <code>ShowSpeakerLabels</code> and
  /// <code>ChannelIdentification</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  final bool? showSpeakerLabels;

  /// The name of the vocabulary to use when processing a medical transcription
  /// job.
  final String? vocabularyName;

  MedicalTranscriptionSetting({
    this.channelIdentification,
    this.maxAlternatives,
    this.maxSpeakerLabels,
    this.showAlternatives,
    this.showSpeakerLabels,
    this.vocabularyName,
  });

  factory MedicalTranscriptionSetting.fromJson(Map<String, dynamic> json) {
    return MedicalTranscriptionSetting(
      channelIdentification: json['ChannelIdentification'] as bool?,
      maxAlternatives: json['MaxAlternatives'] as int?,
      maxSpeakerLabels: json['MaxSpeakerLabels'] as int?,
      showAlternatives: json['ShowAlternatives'] as bool?,
      showSpeakerLabels: json['ShowSpeakerLabels'] as bool?,
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelIdentification = this.channelIdentification;
    final maxAlternatives = this.maxAlternatives;
    final maxSpeakerLabels = this.maxSpeakerLabels;
    final showAlternatives = this.showAlternatives;
    final showSpeakerLabels = this.showSpeakerLabels;
    final vocabularyName = this.vocabularyName;
    return {
      if (channelIdentification != null)
        'ChannelIdentification': channelIdentification,
      if (maxAlternatives != null) 'MaxAlternatives': maxAlternatives,
      if (maxSpeakerLabels != null) 'MaxSpeakerLabels': maxSpeakerLabels,
      if (showAlternatives != null) 'ShowAlternatives': showAlternatives,
      if (showSpeakerLabels != null) 'ShowSpeakerLabels': showSpeakerLabels,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

/// The object used to call your custom language model to your transcription
/// job.
class ModelSettings {
  /// The name of your custom language model.
  final String? languageModelName;

  ModelSettings({
    this.languageModelName,
  });

  factory ModelSettings.fromJson(Map<String, dynamic> json) {
    return ModelSettings(
      languageModelName: json['LanguageModelName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageModelName = this.languageModelName;
    return {
      if (languageModelName != null) 'LanguageModelName': languageModelName,
    };
  }
}

enum ModelStatus {
  inProgress,
  failed,
  completed,
}

extension on ModelStatus {
  String toValue() {
    switch (this) {
      case ModelStatus.inProgress:
        return 'IN_PROGRESS';
      case ModelStatus.failed:
        return 'FAILED';
      case ModelStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension on String {
  ModelStatus toModelStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return ModelStatus.inProgress;
      case 'FAILED':
        return ModelStatus.failed;
      case 'COMPLETED':
        return ModelStatus.completed;
    }
    throw Exception('$this is not known in enum ModelStatus');
  }
}

/// An object that enables you to configure your category to be applied to call
/// analytics jobs where either the customer or agent was interrupted.
class NonTalkTimeFilter {
  /// An object you can use to specify a time range (in milliseconds) for when no
  /// one is talking. For example, you could specify a time period between the
  /// 30,000 millisecond mark and the 45,000 millisecond mark. You could also
  /// specify the time period as the first 15,000 milliseconds or the last 15,000
  /// milliseconds.
  final AbsoluteTimeRange? absoluteTimeRange;

  /// Set to <code>TRUE</code> to look for a time period when people were talking.
  final bool? negate;

  /// An object that allows percentages to specify the proportion of the call
  /// where there was silence. For example, you can specify the first half of the
  /// call. You can also specify the period of time between halfway through to
  /// three-quarters of the way through the call. Because the length of
  /// conversation can vary between calls, you can apply relative time ranges
  /// across all calls.
  final RelativeTimeRange? relativeTimeRange;

  /// The duration of the period when neither the customer nor agent was talking.
  final int? threshold;

  NonTalkTimeFilter({
    this.absoluteTimeRange,
    this.negate,
    this.relativeTimeRange,
    this.threshold,
  });

  factory NonTalkTimeFilter.fromJson(Map<String, dynamic> json) {
    return NonTalkTimeFilter(
      absoluteTimeRange: json['AbsoluteTimeRange'] != null
          ? AbsoluteTimeRange.fromJson(
              json['AbsoluteTimeRange'] as Map<String, dynamic>)
          : null,
      negate: json['Negate'] as bool?,
      relativeTimeRange: json['RelativeTimeRange'] != null
          ? RelativeTimeRange.fromJson(
              json['RelativeTimeRange'] as Map<String, dynamic>)
          : null,
      threshold: json['Threshold'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final absoluteTimeRange = this.absoluteTimeRange;
    final negate = this.negate;
    final relativeTimeRange = this.relativeTimeRange;
    final threshold = this.threshold;
    return {
      if (absoluteTimeRange != null) 'AbsoluteTimeRange': absoluteTimeRange,
      if (negate != null) 'Negate': negate,
      if (relativeTimeRange != null) 'RelativeTimeRange': relativeTimeRange,
      if (threshold != null) 'Threshold': threshold,
    };
  }
}

enum OutputLocationType {
  customerBucket,
  serviceBucket,
}

extension on OutputLocationType {
  String toValue() {
    switch (this) {
      case OutputLocationType.customerBucket:
        return 'CUSTOMER_BUCKET';
      case OutputLocationType.serviceBucket:
        return 'SERVICE_BUCKET';
    }
  }
}

extension on String {
  OutputLocationType toOutputLocationType() {
    switch (this) {
      case 'CUSTOMER_BUCKET':
        return OutputLocationType.customerBucket;
      case 'SERVICE_BUCKET':
        return OutputLocationType.serviceBucket;
    }
    throw Exception('$this is not known in enum OutputLocationType');
  }
}

enum ParticipantRole {
  agent,
  customer,
}

extension on ParticipantRole {
  String toValue() {
    switch (this) {
      case ParticipantRole.agent:
        return 'AGENT';
      case ParticipantRole.customer:
        return 'CUSTOMER';
    }
  }
}

extension on String {
  ParticipantRole toParticipantRole() {
    switch (this) {
      case 'AGENT':
        return ParticipantRole.agent;
      case 'CUSTOMER':
        return ParticipantRole.customer;
    }
    throw Exception('$this is not known in enum ParticipantRole');
  }
}

enum RedactionOutput {
  redacted,
  redactedAndUnredacted,
}

extension on RedactionOutput {
  String toValue() {
    switch (this) {
      case RedactionOutput.redacted:
        return 'redacted';
      case RedactionOutput.redactedAndUnredacted:
        return 'redacted_and_unredacted';
    }
  }
}

extension on String {
  RedactionOutput toRedactionOutput() {
    switch (this) {
      case 'redacted':
        return RedactionOutput.redacted;
      case 'redacted_and_unredacted':
        return RedactionOutput.redactedAndUnredacted;
    }
    throw Exception('$this is not known in enum RedactionOutput');
  }
}

enum RedactionType {
  pii,
}

extension on RedactionType {
  String toValue() {
    switch (this) {
      case RedactionType.pii:
        return 'PII';
    }
  }
}

extension on String {
  RedactionType toRedactionType() {
    switch (this) {
      case 'PII':
        return RedactionType.pii;
    }
    throw Exception('$this is not known in enum RedactionType');
  }
}

/// An object that allows percentages to specify the proportion of the call
/// where you would like to apply a filter. For example, you can specify the
/// first half of the call. You can also specify the period of time between
/// halfway through to three-quarters of the way through the call. Because the
/// length of conversation can vary between calls, you can apply relative time
/// ranges across all calls.
class RelativeTimeRange {
  /// A value that indicates the percentage of the end of the time range. To set a
  /// relative time range, you must specify a start percentage and an end
  /// percentage. For example, if you specify the following values:
  ///
  /// <ul>
  /// <li>
  /// StartPercentage - 10
  /// </li>
  /// <li>
  /// EndPercentage - 50
  /// </li>
  /// </ul>
  /// This looks at the time range starting from 10% of the way into the call to
  /// 50% of the way through the call. For a call that lasts 100,000 milliseconds,
  /// this example range would apply from the 10,000 millisecond mark to the
  /// 50,000 millisecond mark.
  final int? endPercentage;

  /// A range that takes the portion of the call up to the time in milliseconds
  /// set by the value that you've specified. For example, if you specify
  /// <code>120000</code>, the time range is set for the first 120,000
  /// milliseconds of the call.
  final int? first;

  /// A range that takes the portion of the call from the time in milliseconds set
  /// by the value that you've specified to the end of the call. For example, if
  /// you specify <code>120000</code>, the time range is set for the last 120,000
  /// milliseconds of the call.
  final int? last;

  /// A value that indicates the percentage of the beginning of the time range. To
  /// set a relative time range, you must specify a start percentage and an end
  /// percentage. For example, if you specify the following values:
  ///
  /// <ul>
  /// <li>
  /// StartPercentage - 10
  /// </li>
  /// <li>
  /// EndPercentage - 50
  /// </li>
  /// </ul>
  /// This looks at the time range starting from 10% of the way into the call to
  /// 50% of the way through the call. For a call that lasts 100,000 milliseconds,
  /// this example range would apply from the 10,000 millisecond mark to the
  /// 50,000 millisecond mark.
  final int? startPercentage;

  RelativeTimeRange({
    this.endPercentage,
    this.first,
    this.last,
    this.startPercentage,
  });

  factory RelativeTimeRange.fromJson(Map<String, dynamic> json) {
    return RelativeTimeRange(
      endPercentage: json['EndPercentage'] as int?,
      first: json['First'] as int?,
      last: json['Last'] as int?,
      startPercentage: json['StartPercentage'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final endPercentage = this.endPercentage;
    final first = this.first;
    final last = this.last;
    final startPercentage = this.startPercentage;
    return {
      if (endPercentage != null) 'EndPercentage': endPercentage,
      if (first != null) 'First': first,
      if (last != null) 'Last': last,
      if (startPercentage != null) 'StartPercentage': startPercentage,
    };
  }
}

/// A condition in the call between the customer and the agent that you want to
/// filter for.
class Rule {
  /// A condition for a time period when either the customer or agent was
  /// interrupting the other person.
  final InterruptionFilter? interruptionFilter;

  /// A condition for a time period when neither the customer nor the agent was
  /// talking.
  final NonTalkTimeFilter? nonTalkTimeFilter;

  /// A condition that is applied to a particular customer sentiment.
  final SentimentFilter? sentimentFilter;

  /// A condition that catches particular words or phrases based on a exact match.
  /// For example, if you set the phrase "I want to speak to the manager", only
  /// that exact phrase will be returned.
  final TranscriptFilter? transcriptFilter;

  Rule({
    this.interruptionFilter,
    this.nonTalkTimeFilter,
    this.sentimentFilter,
    this.transcriptFilter,
  });

  factory Rule.fromJson(Map<String, dynamic> json) {
    return Rule(
      interruptionFilter: json['InterruptionFilter'] != null
          ? InterruptionFilter.fromJson(
              json['InterruptionFilter'] as Map<String, dynamic>)
          : null,
      nonTalkTimeFilter: json['NonTalkTimeFilter'] != null
          ? NonTalkTimeFilter.fromJson(
              json['NonTalkTimeFilter'] as Map<String, dynamic>)
          : null,
      sentimentFilter: json['SentimentFilter'] != null
          ? SentimentFilter.fromJson(
              json['SentimentFilter'] as Map<String, dynamic>)
          : null,
      transcriptFilter: json['TranscriptFilter'] != null
          ? TranscriptFilter.fromJson(
              json['TranscriptFilter'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final interruptionFilter = this.interruptionFilter;
    final nonTalkTimeFilter = this.nonTalkTimeFilter;
    final sentimentFilter = this.sentimentFilter;
    final transcriptFilter = this.transcriptFilter;
    return {
      if (interruptionFilter != null) 'InterruptionFilter': interruptionFilter,
      if (nonTalkTimeFilter != null) 'NonTalkTimeFilter': nonTalkTimeFilter,
      if (sentimentFilter != null) 'SentimentFilter': sentimentFilter,
      if (transcriptFilter != null) 'TranscriptFilter': transcriptFilter,
    };
  }
}

/// An object that enables you to specify a particular customer or agent
/// sentiment. If at least 50 percent of the conversation turns (the
/// back-and-forth between two speakers) in a specified time period match the
/// specified sentiment, Amazon Transcribe will consider the sentiment a match.
class SentimentFilter {
  /// An array that enables you to specify sentiments for the customer or agent.
  /// You can specify one or more values.
  final List<SentimentValue> sentiments;

  /// The time range, measured in seconds, of the sentiment.
  final AbsoluteTimeRange? absoluteTimeRange;

  /// Set to <code>TRUE</code> to look for sentiments that weren't specified in
  /// the request.
  final bool? negate;

  /// A value that determines whether the sentiment belongs to the customer or the
  /// agent.
  final ParticipantRole? participantRole;

  /// The time range, set in percentages, that correspond to proportion of the
  /// call.
  final RelativeTimeRange? relativeTimeRange;

  SentimentFilter({
    required this.sentiments,
    this.absoluteTimeRange,
    this.negate,
    this.participantRole,
    this.relativeTimeRange,
  });

  factory SentimentFilter.fromJson(Map<String, dynamic> json) {
    return SentimentFilter(
      sentiments: (json['Sentiments'] as List)
          .whereNotNull()
          .map((e) => (e as String).toSentimentValue())
          .toList(),
      absoluteTimeRange: json['AbsoluteTimeRange'] != null
          ? AbsoluteTimeRange.fromJson(
              json['AbsoluteTimeRange'] as Map<String, dynamic>)
          : null,
      negate: json['Negate'] as bool?,
      participantRole:
          (json['ParticipantRole'] as String?)?.toParticipantRole(),
      relativeTimeRange: json['RelativeTimeRange'] != null
          ? RelativeTimeRange.fromJson(
              json['RelativeTimeRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sentiments = this.sentiments;
    final absoluteTimeRange = this.absoluteTimeRange;
    final negate = this.negate;
    final participantRole = this.participantRole;
    final relativeTimeRange = this.relativeTimeRange;
    return {
      'Sentiments': sentiments.map((e) => e.toValue()).toList(),
      if (absoluteTimeRange != null) 'AbsoluteTimeRange': absoluteTimeRange,
      if (negate != null) 'Negate': negate,
      if (participantRole != null) 'ParticipantRole': participantRole.toValue(),
      if (relativeTimeRange != null) 'RelativeTimeRange': relativeTimeRange,
    };
  }
}

enum SentimentValue {
  positive,
  negative,
  neutral,
  mixed,
}

extension on SentimentValue {
  String toValue() {
    switch (this) {
      case SentimentValue.positive:
        return 'POSITIVE';
      case SentimentValue.negative:
        return 'NEGATIVE';
      case SentimentValue.neutral:
        return 'NEUTRAL';
      case SentimentValue.mixed:
        return 'MIXED';
    }
  }
}

extension on String {
  SentimentValue toSentimentValue() {
    switch (this) {
      case 'POSITIVE':
        return SentimentValue.positive;
      case 'NEGATIVE':
        return SentimentValue.negative;
      case 'NEUTRAL':
        return SentimentValue.neutral;
      case 'MIXED':
        return SentimentValue.mixed;
    }
    throw Exception('$this is not known in enum SentimentValue');
  }
}

/// Provides optional settings for the <code>StartTranscriptionJob</code>
/// operation.
class Settings {
  /// Instructs Amazon Transcribe to process each audio channel separately and
  /// then merge the transcription output of each channel into a single
  /// transcription.
  ///
  /// Amazon Transcribe also produces a transcription of each item detected on an
  /// audio channel, including the start time and end time of the item and
  /// alternative transcriptions of the item including the confidence that Amazon
  /// Transcribe has in the transcription.
  ///
  /// You can't set both <code>ShowSpeakerLabels</code> and
  /// <code>ChannelIdentification</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  final bool? channelIdentification;

  /// The number of alternative transcriptions that the service should return. If
  /// you specify the <code>MaxAlternatives</code> field, you must set the
  /// <code>ShowAlternatives</code> field to true.
  final int? maxAlternatives;

  /// The maximum number of speakers to identify in the input audio. If there are
  /// more speakers in the audio than this number, multiple speakers are
  /// identified as a single speaker. If you specify the
  /// <code>MaxSpeakerLabels</code> field, you must set the
  /// <code>ShowSpeakerLabels</code> field to true.
  final int? maxSpeakerLabels;

  /// Determines whether the transcription contains alternative transcriptions. If
  /// you set the <code>ShowAlternatives</code> field to true, you must also set
  /// the maximum number of alternatives to return in the
  /// <code>MaxAlternatives</code> field.
  final bool? showAlternatives;

  /// Determines whether the transcription job uses speaker recognition to
  /// identify different speakers in the input audio. Speaker recognition labels
  /// individual speakers in the audio file. If you set the
  /// <code>ShowSpeakerLabels</code> field to true, you must also set the maximum
  /// number of speaker labels <code>MaxSpeakerLabels</code> field.
  ///
  /// You can't set both <code>ShowSpeakerLabels</code> and
  /// <code>ChannelIdentification</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  final bool? showSpeakerLabels;

  /// Set to <code>mask</code> to remove filtered text from the transcript and
  /// replace it with three asterisks ("***") as placeholder text. Set to
  /// <code>remove</code> to remove filtered text from the transcript without
  /// using placeholder text. Set to <code>tag</code> to mark the word in the
  /// transcription output that matches the vocabulary filter. When you set the
  /// filter method to <code>tag</code>, the words matching your vocabulary filter
  /// are not masked or removed.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// The name of the vocabulary filter to use when transcribing the audio. The
  /// filter that you specify must have the same language code as the
  /// transcription job.
  final String? vocabularyFilterName;

  /// The name of a vocabulary to use when processing the transcription job.
  final String? vocabularyName;

  Settings({
    this.channelIdentification,
    this.maxAlternatives,
    this.maxSpeakerLabels,
    this.showAlternatives,
    this.showSpeakerLabels,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyName,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      channelIdentification: json['ChannelIdentification'] as bool?,
      maxAlternatives: json['MaxAlternatives'] as int?,
      maxSpeakerLabels: json['MaxSpeakerLabels'] as int?,
      showAlternatives: json['ShowAlternatives'] as bool?,
      showSpeakerLabels: json['ShowSpeakerLabels'] as bool?,
      vocabularyFilterMethod: (json['VocabularyFilterMethod'] as String?)
          ?.toVocabularyFilterMethod(),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelIdentification = this.channelIdentification;
    final maxAlternatives = this.maxAlternatives;
    final maxSpeakerLabels = this.maxSpeakerLabels;
    final showAlternatives = this.showAlternatives;
    final showSpeakerLabels = this.showSpeakerLabels;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyName = this.vocabularyName;
    return {
      if (channelIdentification != null)
        'ChannelIdentification': channelIdentification,
      if (maxAlternatives != null) 'MaxAlternatives': maxAlternatives,
      if (maxSpeakerLabels != null) 'MaxSpeakerLabels': maxSpeakerLabels,
      if (showAlternatives != null) 'ShowAlternatives': showAlternatives,
      if (showSpeakerLabels != null) 'ShowSpeakerLabels': showSpeakerLabels,
      if (vocabularyFilterMethod != null)
        'VocabularyFilterMethod': vocabularyFilterMethod.toValue(),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

enum Specialty {
  primarycare,
}

extension on Specialty {
  String toValue() {
    switch (this) {
      case Specialty.primarycare:
        return 'PRIMARYCARE';
    }
  }
}

extension on String {
  Specialty toSpecialty() {
    switch (this) {
      case 'PRIMARYCARE':
        return Specialty.primarycare;
    }
    throw Exception('$this is not known in enum Specialty');
  }
}

class StartCallAnalyticsJobResponse {
  /// An object containing the details of the asynchronous call analytics job.
  final CallAnalyticsJob? callAnalyticsJob;

  StartCallAnalyticsJobResponse({
    this.callAnalyticsJob,
  });

  factory StartCallAnalyticsJobResponse.fromJson(Map<String, dynamic> json) {
    return StartCallAnalyticsJobResponse(
      callAnalyticsJob: json['CallAnalyticsJob'] != null
          ? CallAnalyticsJob.fromJson(
              json['CallAnalyticsJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final callAnalyticsJob = this.callAnalyticsJob;
    return {
      if (callAnalyticsJob != null) 'CallAnalyticsJob': callAnalyticsJob,
    };
  }
}

class StartMedicalTranscriptionJobResponse {
  /// A batch job submitted to transcribe medical speech to text.
  final MedicalTranscriptionJob? medicalTranscriptionJob;

  StartMedicalTranscriptionJobResponse({
    this.medicalTranscriptionJob,
  });

  factory StartMedicalTranscriptionJobResponse.fromJson(
      Map<String, dynamic> json) {
    return StartMedicalTranscriptionJobResponse(
      medicalTranscriptionJob: json['MedicalTranscriptionJob'] != null
          ? MedicalTranscriptionJob.fromJson(
              json['MedicalTranscriptionJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final medicalTranscriptionJob = this.medicalTranscriptionJob;
    return {
      if (medicalTranscriptionJob != null)
        'MedicalTranscriptionJob': medicalTranscriptionJob,
    };
  }
}

class StartTranscriptionJobResponse {
  /// An object containing details of the asynchronous transcription job.
  final TranscriptionJob? transcriptionJob;

  StartTranscriptionJobResponse({
    this.transcriptionJob,
  });

  factory StartTranscriptionJobResponse.fromJson(Map<String, dynamic> json) {
    return StartTranscriptionJobResponse(
      transcriptionJob: json['TranscriptionJob'] != null
          ? TranscriptionJob.fromJson(
              json['TranscriptionJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transcriptionJob = this.transcriptionJob;
    return {
      if (transcriptionJob != null) 'TranscriptionJob': transcriptionJob,
    };
  }
}

enum SubtitleFormat {
  vtt,
  srt,
}

extension on SubtitleFormat {
  String toValue() {
    switch (this) {
      case SubtitleFormat.vtt:
        return 'vtt';
      case SubtitleFormat.srt:
        return 'srt';
    }
  }
}

extension on String {
  SubtitleFormat toSubtitleFormat() {
    switch (this) {
      case 'vtt':
        return SubtitleFormat.vtt;
      case 'srt':
        return SubtitleFormat.srt;
    }
    throw Exception('$this is not known in enum SubtitleFormat');
  }
}

/// Generate subtitles for your batch transcription job.
class Subtitles {
  /// Specify the output format for your subtitle file.
  final List<SubtitleFormat>? formats;

  Subtitles({
    this.formats,
  });

  factory Subtitles.fromJson(Map<String, dynamic> json) {
    return Subtitles(
      formats: (json['Formats'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSubtitleFormat())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final formats = this.formats;
    return {
      if (formats != null) 'Formats': formats.map((e) => e.toValue()).toList(),
    };
  }
}

/// Specify the output format for your subtitle file.
class SubtitlesOutput {
  /// Specify the output format for your subtitle file; if you select both SRT and
  /// VTT formats, two output files are genereated.
  final List<SubtitleFormat>? formats;

  /// Choose the output location for your subtitle file. This location must be an
  /// S3 bucket.
  final List<String>? subtitleFileUris;

  SubtitlesOutput({
    this.formats,
    this.subtitleFileUris,
  });

  factory SubtitlesOutput.fromJson(Map<String, dynamic> json) {
    return SubtitlesOutput(
      formats: (json['Formats'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSubtitleFormat())
          .toList(),
      subtitleFileUris: (json['SubtitleFileUris'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final formats = this.formats;
    final subtitleFileUris = this.subtitleFileUris;
    return {
      if (formats != null) 'Formats': formats.map((e) => e.toValue()).toList(),
      if (subtitleFileUris != null) 'SubtitleFileUris': subtitleFileUris,
    };
  }
}

/// A key:value pair that adds metadata to a resource used by Amazon Transcribe.
/// For example, a tag with the key:value pair ‘Department’:’Sales’ might be
/// added to a resource to indicate its use by your organization's sales
/// department.
class Tag {
  /// The first part of a key:value pair that forms a tag associated with a given
  /// resource. For example, in the tag ‘Department’:’Sales’, the key is
  /// 'Department'.
  final String key;

  /// The second part of a key:value pair that forms a tag associated with a given
  /// resource. For example, in the tag ‘Department’:’Sales’, the value is
  /// 'Sales'.
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

/// Identifies the location of a transcription.
class Transcript {
  /// The S3 object location of the redacted transcript.
  ///
  /// Use this URI to access the redacted transcript. If you specified an S3
  /// bucket in the <code>OutputBucketName</code> field when you created the job,
  /// this is the URI of that bucket. If you chose to store the transcript in
  /// Amazon Transcribe, this is a shareable URL that provides secure access to
  /// that location.
  final String? redactedTranscriptFileUri;

  /// The S3 object location of the transcript.
  ///
  /// Use this URI to access the transcript. If you specified an S3 bucket in the
  /// <code>OutputBucketName</code> field when you created the job, this is the
  /// URI of that bucket. If you chose to store the transcript in Amazon
  /// Transcribe, this is a shareable URL that provides secure access to that
  /// location.
  final String? transcriptFileUri;

  Transcript({
    this.redactedTranscriptFileUri,
    this.transcriptFileUri,
  });

  factory Transcript.fromJson(Map<String, dynamic> json) {
    return Transcript(
      redactedTranscriptFileUri: json['RedactedTranscriptFileUri'] as String?,
      transcriptFileUri: json['TranscriptFileUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final redactedTranscriptFileUri = this.redactedTranscriptFileUri;
    final transcriptFileUri = this.transcriptFileUri;
    return {
      if (redactedTranscriptFileUri != null)
        'RedactedTranscriptFileUri': redactedTranscriptFileUri,
      if (transcriptFileUri != null) 'TranscriptFileUri': transcriptFileUri,
    };
  }
}

/// Matches the output of the transcription to either the specific phrases that
/// you specify, or the intent of the phrases that you specify.
class TranscriptFilter {
  /// The phrases that you're specifying for the transcript filter to match.
  final List<String> targets;

  /// Matches the phrase to the transcription output in a word for word fashion.
  /// For example, if you specify the phrase "I want to speak to the manager."
  /// Amazon Transcribe attempts to match that specific phrase to the
  /// transcription.
  final TranscriptFilterType transcriptFilterType;

  /// A time range, set in seconds, between two points in the call.
  final AbsoluteTimeRange? absoluteTimeRange;

  /// If <code>TRUE</code>, the rule that you specify is applied to everything
  /// except for the phrases that you specify.
  final bool? negate;

  /// Determines whether the customer or the agent is speaking the phrases that
  /// you've specified.
  final ParticipantRole? participantRole;

  /// An object that allows percentages to specify the proportion of the call
  /// where you would like to apply a filter. For example, you can specify the
  /// first half of the call. You can also specify the period of time between
  /// halfway through to three-quarters of the way through the call. Because the
  /// length of conversation can vary between calls, you can apply relative time
  /// ranges across all calls.
  final RelativeTimeRange? relativeTimeRange;

  TranscriptFilter({
    required this.targets,
    required this.transcriptFilterType,
    this.absoluteTimeRange,
    this.negate,
    this.participantRole,
    this.relativeTimeRange,
  });

  factory TranscriptFilter.fromJson(Map<String, dynamic> json) {
    return TranscriptFilter(
      targets: (json['Targets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      transcriptFilterType:
          (json['TranscriptFilterType'] as String).toTranscriptFilterType(),
      absoluteTimeRange: json['AbsoluteTimeRange'] != null
          ? AbsoluteTimeRange.fromJson(
              json['AbsoluteTimeRange'] as Map<String, dynamic>)
          : null,
      negate: json['Negate'] as bool?,
      participantRole:
          (json['ParticipantRole'] as String?)?.toParticipantRole(),
      relativeTimeRange: json['RelativeTimeRange'] != null
          ? RelativeTimeRange.fromJson(
              json['RelativeTimeRange'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final targets = this.targets;
    final transcriptFilterType = this.transcriptFilterType;
    final absoluteTimeRange = this.absoluteTimeRange;
    final negate = this.negate;
    final participantRole = this.participantRole;
    final relativeTimeRange = this.relativeTimeRange;
    return {
      'Targets': targets,
      'TranscriptFilterType': transcriptFilterType.toValue(),
      if (absoluteTimeRange != null) 'AbsoluteTimeRange': absoluteTimeRange,
      if (negate != null) 'Negate': negate,
      if (participantRole != null) 'ParticipantRole': participantRole.toValue(),
      if (relativeTimeRange != null) 'RelativeTimeRange': relativeTimeRange,
    };
  }
}

enum TranscriptFilterType {
  exact,
}

extension on TranscriptFilterType {
  String toValue() {
    switch (this) {
      case TranscriptFilterType.exact:
        return 'EXACT';
    }
  }
}

extension on String {
  TranscriptFilterType toTranscriptFilterType() {
    switch (this) {
      case 'EXACT':
        return TranscriptFilterType.exact;
    }
    throw Exception('$this is not known in enum TranscriptFilterType');
  }
}

/// Describes an asynchronous transcription job that was created with the
/// <code>StartTranscriptionJob</code> operation.
class TranscriptionJob {
  /// A timestamp that shows when the job completed.
  final DateTime? completionTime;

  /// An object that describes content redaction settings for the transcription
  /// job.
  final ContentRedaction? contentRedaction;

  /// A timestamp that shows when the job was created.
  final DateTime? creationTime;

  /// If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>,
  /// this field contains information about why the job failed.
  ///
  /// The <code>FailureReason</code> field can contain one of the following
  /// values:
  ///
  /// <ul>
  /// <li>
  /// <code>Unsupported media format</code> - The media format specified in the
  /// <code>MediaFormat</code> field of the request isn't valid. See the
  /// description of the <code>MediaFormat</code> field for a list of valid
  /// values.
  /// </li>
  /// <li>
  /// <code>The media format provided does not match the detected media
  /// format</code> - The media format of the audio file doesn't match the format
  /// specified in the <code>MediaFormat</code> field in the request. Check the
  /// media format of your media file and make sure that the two values match.
  /// </li>
  /// <li>
  /// <code>Invalid sample rate for audio file</code> - The sample rate specified
  /// in the <code>MediaSampleRateHertz</code> of the request isn't valid. The
  /// sample rate must be between 8,000 and 48,000 Hertz.
  /// </li>
  /// <li>
  /// <code>The sample rate provided does not match the detected sample
  /// rate</code> - The sample rate in the audio file doesn't match the sample
  /// rate specified in the <code>MediaSampleRateHertz</code> field in the
  /// request. Check the sample rate of your media file and make sure that the two
  /// values match.
  /// </li>
  /// <li>
  /// <code>Invalid file size: file size too large</code> - The size of your audio
  /// file is larger than Amazon Transcribe can process. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/limits-guidelines.html#limits">Limits</a>
  /// in the <i>Amazon Transcribe Developer Guide</i>.
  /// </li>
  /// <li>
  /// <code>Invalid number of channels: number of channels too large</code> - Your
  /// audio contains more channels than Amazon Transcribe is configured to
  /// process. To request additional channels, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_service_limits.html#limits-amazon-transcribe">Amazon
  /// Transcribe Limits</a> in the <i>Amazon Web Services General Reference</i>.
  /// </li>
  /// </ul>
  final String? failureReason;

  /// A value between zero and one that Amazon Transcribe assigned to the language
  /// that it identified in the source audio. Larger values indicate that Amazon
  /// Transcribe has higher confidence in the language it identified.
  final double? identifiedLanguageScore;

  /// A value that shows if automatic language identification was enabled for a
  /// transcription job.
  final bool? identifyLanguage;

  /// Provides information about how a transcription job is executed.
  final JobExecutionSettings? jobExecutionSettings;

  /// The language code for the input speech.
  final LanguageCode? languageCode;

  /// Language-specific settings that can be specified when language
  /// identification is enabled for your transcription job. These settings include
  /// <code>VocabularyName</code>, <code>VocabularyFilterName</code>, and
  /// <code>LanguageModelName</code>LanguageModelName.
  final Map<LanguageCode, LanguageIdSettings>? languageIdSettings;

  /// An object that shows the optional array of languages inputted for
  /// transcription jobs with automatic language identification enabled.
  final List<LanguageCode>? languageOptions;

  /// An object that describes the input media for the transcription job.
  final Media? media;

  /// The format of the input media file.
  final MediaFormat? mediaFormat;

  /// The sample rate, in Hertz, of the audio track in the input media file.
  final int? mediaSampleRateHertz;

  /// An object containing the details of your custom language model.
  final ModelSettings? modelSettings;

  /// Optional settings for the transcription job. Use these settings to turn on
  /// speaker recognition, to set the maximum number of speakers that should be
  /// identified and to specify a custom vocabulary to use when processing the
  /// transcription job.
  final Settings? settings;

  /// A timestamp that shows when the job started processing.
  final DateTime? startTime;

  /// Generate subtitles for your batch transcription job.
  final SubtitlesOutput? subtitles;

  /// A key:value pair assigned to a given transcription job.
  final List<Tag>? tags;

  /// An object that describes the output of the transcription job.
  final Transcript? transcript;

  /// The name of the transcription job.
  final String? transcriptionJobName;

  /// The status of the transcription job.
  final TranscriptionJobStatus? transcriptionJobStatus;

  TranscriptionJob({
    this.completionTime,
    this.contentRedaction,
    this.creationTime,
    this.failureReason,
    this.identifiedLanguageScore,
    this.identifyLanguage,
    this.jobExecutionSettings,
    this.languageCode,
    this.languageIdSettings,
    this.languageOptions,
    this.media,
    this.mediaFormat,
    this.mediaSampleRateHertz,
    this.modelSettings,
    this.settings,
    this.startTime,
    this.subtitles,
    this.tags,
    this.transcript,
    this.transcriptionJobName,
    this.transcriptionJobStatus,
  });

  factory TranscriptionJob.fromJson(Map<String, dynamic> json) {
    return TranscriptionJob(
      completionTime: timeStampFromJson(json['CompletionTime']),
      contentRedaction: json['ContentRedaction'] != null
          ? ContentRedaction.fromJson(
              json['ContentRedaction'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      failureReason: json['FailureReason'] as String?,
      identifiedLanguageScore: json['IdentifiedLanguageScore'] as double?,
      identifyLanguage: json['IdentifyLanguage'] as bool?,
      jobExecutionSettings: json['JobExecutionSettings'] != null
          ? JobExecutionSettings.fromJson(
              json['JobExecutionSettings'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      languageIdSettings: (json['LanguageIdSettings'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toLanguageCode(),
              LanguageIdSettings.fromJson(e as Map<String, dynamic>))),
      languageOptions: (json['LanguageOptions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLanguageCode())
          .toList(),
      media: json['Media'] != null
          ? Media.fromJson(json['Media'] as Map<String, dynamic>)
          : null,
      mediaFormat: (json['MediaFormat'] as String?)?.toMediaFormat(),
      mediaSampleRateHertz: json['MediaSampleRateHertz'] as int?,
      modelSettings: json['ModelSettings'] != null
          ? ModelSettings.fromJson(
              json['ModelSettings'] as Map<String, dynamic>)
          : null,
      settings: json['Settings'] != null
          ? Settings.fromJson(json['Settings'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      subtitles: json['Subtitles'] != null
          ? SubtitlesOutput.fromJson(json['Subtitles'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      transcript: json['Transcript'] != null
          ? Transcript.fromJson(json['Transcript'] as Map<String, dynamic>)
          : null,
      transcriptionJobName: json['TranscriptionJobName'] as String?,
      transcriptionJobStatus: (json['TranscriptionJobStatus'] as String?)
          ?.toTranscriptionJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final contentRedaction = this.contentRedaction;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final identifiedLanguageScore = this.identifiedLanguageScore;
    final identifyLanguage = this.identifyLanguage;
    final jobExecutionSettings = this.jobExecutionSettings;
    final languageCode = this.languageCode;
    final languageIdSettings = this.languageIdSettings;
    final languageOptions = this.languageOptions;
    final media = this.media;
    final mediaFormat = this.mediaFormat;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final modelSettings = this.modelSettings;
    final settings = this.settings;
    final startTime = this.startTime;
    final subtitles = this.subtitles;
    final tags = this.tags;
    final transcript = this.transcript;
    final transcriptionJobName = this.transcriptionJobName;
    final transcriptionJobStatus = this.transcriptionJobStatus;
    return {
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (contentRedaction != null) 'ContentRedaction': contentRedaction,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (identifiedLanguageScore != null)
        'IdentifiedLanguageScore': identifiedLanguageScore,
      if (identifyLanguage != null) 'IdentifyLanguage': identifyLanguage,
      if (jobExecutionSettings != null)
        'JobExecutionSettings': jobExecutionSettings,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (languageIdSettings != null)
        'LanguageIdSettings':
            languageIdSettings.map((k, e) => MapEntry(k.toValue(), e)),
      if (languageOptions != null)
        'LanguageOptions': languageOptions.map((e) => e.toValue()).toList(),
      if (media != null) 'Media': media,
      if (mediaFormat != null) 'MediaFormat': mediaFormat.toValue(),
      if (mediaSampleRateHertz != null)
        'MediaSampleRateHertz': mediaSampleRateHertz,
      if (modelSettings != null) 'ModelSettings': modelSettings,
      if (settings != null) 'Settings': settings,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (subtitles != null) 'Subtitles': subtitles,
      if (tags != null) 'Tags': tags,
      if (transcript != null) 'Transcript': transcript,
      if (transcriptionJobName != null)
        'TranscriptionJobName': transcriptionJobName,
      if (transcriptionJobStatus != null)
        'TranscriptionJobStatus': transcriptionJobStatus.toValue(),
    };
  }
}

enum TranscriptionJobStatus {
  queued,
  inProgress,
  failed,
  completed,
}

extension on TranscriptionJobStatus {
  String toValue() {
    switch (this) {
      case TranscriptionJobStatus.queued:
        return 'QUEUED';
      case TranscriptionJobStatus.inProgress:
        return 'IN_PROGRESS';
      case TranscriptionJobStatus.failed:
        return 'FAILED';
      case TranscriptionJobStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension on String {
  TranscriptionJobStatus toTranscriptionJobStatus() {
    switch (this) {
      case 'QUEUED':
        return TranscriptionJobStatus.queued;
      case 'IN_PROGRESS':
        return TranscriptionJobStatus.inProgress;
      case 'FAILED':
        return TranscriptionJobStatus.failed;
      case 'COMPLETED':
        return TranscriptionJobStatus.completed;
    }
    throw Exception('$this is not known in enum TranscriptionJobStatus');
  }
}

/// Provides a summary of information about a transcription job.
class TranscriptionJobSummary {
  /// A timestamp that shows when the job was completed.
  final DateTime? completionTime;

  /// The content redaction settings of the transcription job.
  final ContentRedaction? contentRedaction;

  /// A timestamp that shows when the job was created.
  final DateTime? creationTime;

  /// If the <code>TranscriptionJobStatus</code> field is <code>FAILED</code>, a
  /// description of the error.
  final String? failureReason;

  /// A value between zero and one that Amazon Transcribe assigned to the language
  /// it identified in the source audio. A higher score indicates that Amazon
  /// Transcribe is more confident in the language it identified.
  final double? identifiedLanguageScore;

  /// Whether automatic language identification was enabled for a transcription
  /// job.
  final bool? identifyLanguage;

  /// The language code for the input speech.
  final LanguageCode? languageCode;
  final ModelSettings? modelSettings;

  /// Indicates the location of the output of the transcription job.
  ///
  /// If the value is <code>CUSTOMER_BUCKET</code> then the location is the S3
  /// bucket specified in the <code>outputBucketName</code> field when the
  /// transcription job was started with the <code>StartTranscriptionJob</code>
  /// operation.
  ///
  /// If the value is <code>SERVICE_BUCKET</code> then the output is stored by
  /// Amazon Transcribe and can be retrieved using the URI in the
  /// <code>GetTranscriptionJob</code> response's <code>TranscriptFileUri</code>
  /// field.
  final OutputLocationType? outputLocationType;

  /// A timestamp that shows when the job started processing.
  final DateTime? startTime;

  /// The name of the transcription job.
  final String? transcriptionJobName;

  /// The status of the transcription job. When the status is
  /// <code>COMPLETED</code>, use the <code>GetTranscriptionJob</code> operation
  /// to get the results of the transcription.
  final TranscriptionJobStatus? transcriptionJobStatus;

  TranscriptionJobSummary({
    this.completionTime,
    this.contentRedaction,
    this.creationTime,
    this.failureReason,
    this.identifiedLanguageScore,
    this.identifyLanguage,
    this.languageCode,
    this.modelSettings,
    this.outputLocationType,
    this.startTime,
    this.transcriptionJobName,
    this.transcriptionJobStatus,
  });

  factory TranscriptionJobSummary.fromJson(Map<String, dynamic> json) {
    return TranscriptionJobSummary(
      completionTime: timeStampFromJson(json['CompletionTime']),
      contentRedaction: json['ContentRedaction'] != null
          ? ContentRedaction.fromJson(
              json['ContentRedaction'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      failureReason: json['FailureReason'] as String?,
      identifiedLanguageScore: json['IdentifiedLanguageScore'] as double?,
      identifyLanguage: json['IdentifyLanguage'] as bool?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      modelSettings: json['ModelSettings'] != null
          ? ModelSettings.fromJson(
              json['ModelSettings'] as Map<String, dynamic>)
          : null,
      outputLocationType:
          (json['OutputLocationType'] as String?)?.toOutputLocationType(),
      startTime: timeStampFromJson(json['StartTime']),
      transcriptionJobName: json['TranscriptionJobName'] as String?,
      transcriptionJobStatus: (json['TranscriptionJobStatus'] as String?)
          ?.toTranscriptionJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final contentRedaction = this.contentRedaction;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final identifiedLanguageScore = this.identifiedLanguageScore;
    final identifyLanguage = this.identifyLanguage;
    final languageCode = this.languageCode;
    final modelSettings = this.modelSettings;
    final outputLocationType = this.outputLocationType;
    final startTime = this.startTime;
    final transcriptionJobName = this.transcriptionJobName;
    final transcriptionJobStatus = this.transcriptionJobStatus;
    return {
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (contentRedaction != null) 'ContentRedaction': contentRedaction,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (identifiedLanguageScore != null)
        'IdentifiedLanguageScore': identifiedLanguageScore,
      if (identifyLanguage != null) 'IdentifyLanguage': identifyLanguage,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (modelSettings != null) 'ModelSettings': modelSettings,
      if (outputLocationType != null)
        'OutputLocationType': outputLocationType.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (transcriptionJobName != null)
        'TranscriptionJobName': transcriptionJobName,
      if (transcriptionJobStatus != null)
        'TranscriptionJobStatus': transcriptionJobStatus.toValue(),
    };
  }
}

enum Type {
  conversation,
  dictation,
}

extension on Type {
  String toValue() {
    switch (this) {
      case Type.conversation:
        return 'CONVERSATION';
      case Type.dictation:
        return 'DICTATION';
    }
  }
}

extension on String {
  Type toType() {
    switch (this) {
      case 'CONVERSATION':
        return Type.conversation;
      case 'DICTATION':
        return Type.dictation;
    }
    throw Exception('$this is not known in enum Type');
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

class UpdateCallAnalyticsCategoryResponse {
  /// The attributes describing the analytics category. You can see information
  /// such as the rules that you've used to update the category and when the
  /// category was originally created.
  final CategoryProperties? categoryProperties;

  UpdateCallAnalyticsCategoryResponse({
    this.categoryProperties,
  });

  factory UpdateCallAnalyticsCategoryResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateCallAnalyticsCategoryResponse(
      categoryProperties: json['CategoryProperties'] != null
          ? CategoryProperties.fromJson(
              json['CategoryProperties'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final categoryProperties = this.categoryProperties;
    return {
      if (categoryProperties != null) 'CategoryProperties': categoryProperties,
    };
  }
}

class UpdateMedicalVocabularyResponse {
  /// The language code for the language of the text file used to update the
  /// custom vocabulary. US English (en-US) is the only language supported in
  /// Amazon Transcribe Medical.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary was updated.
  final DateTime? lastModifiedTime;

  /// The name of the updated vocabulary.
  final String? vocabularyName;

  /// The processing state of the update to the vocabulary. When the
  /// <code>VocabularyState</code> field is <code>READY</code>, the vocabulary is
  /// ready to be used in a <code>StartMedicalTranscriptionJob</code> request.
  final VocabularyState? vocabularyState;

  UpdateMedicalVocabularyResponse({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });

  factory UpdateMedicalVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMedicalVocabularyResponse(
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyName: json['VocabularyName'] as String?,
      vocabularyState:
          (json['VocabularyState'] as String?)?.toVocabularyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyName = this.vocabularyName;
    final vocabularyState = this.vocabularyState;
    return {
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyState != null) 'VocabularyState': vocabularyState.toValue(),
    };
  }
}

class UpdateVocabularyFilterResponse {
  /// The language code of the words in the vocabulary filter.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary filter was updated.
  final DateTime? lastModifiedTime;

  /// The name of the updated vocabulary filter.
  final String? vocabularyFilterName;

  UpdateVocabularyFilterResponse({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyFilterName,
  });

  factory UpdateVocabularyFilterResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVocabularyFilterResponse(
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyFilterName = this.vocabularyFilterName;
    return {
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
    };
  }
}

class UpdateVocabularyResponse {
  /// The language code of the vocabulary entries.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary was updated.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary that was updated.
  final String? vocabularyName;

  /// The processing state of the vocabulary. When the
  /// <code>VocabularyState</code> field contains <code>READY</code> the
  /// vocabulary is ready to be used in a <code>StartTranscriptionJob</code>
  /// request.
  final VocabularyState? vocabularyState;

  UpdateVocabularyResponse({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });

  factory UpdateVocabularyResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVocabularyResponse(
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyName: json['VocabularyName'] as String?,
      vocabularyState:
          (json['VocabularyState'] as String?)?.toVocabularyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyName = this.vocabularyName;
    final vocabularyState = this.vocabularyState;
    return {
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyState != null) 'VocabularyState': vocabularyState.toValue(),
    };
  }
}

/// Provides information about a vocabulary filter.
class VocabularyFilterInfo {
  /// The language code of the words in the vocabulary filter.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary was last updated.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary filter. The name must be unique in the account
  /// that holds the filter.
  final String? vocabularyFilterName;

  VocabularyFilterInfo({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyFilterName,
  });

  factory VocabularyFilterInfo.fromJson(Map<String, dynamic> json) {
    return VocabularyFilterInfo(
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyFilterName = this.vocabularyFilterName;
    return {
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
    };
  }
}

enum VocabularyFilterMethod {
  remove,
  mask,
  tag,
}

extension on VocabularyFilterMethod {
  String toValue() {
    switch (this) {
      case VocabularyFilterMethod.remove:
        return 'remove';
      case VocabularyFilterMethod.mask:
        return 'mask';
      case VocabularyFilterMethod.tag:
        return 'tag';
    }
  }
}

extension on String {
  VocabularyFilterMethod toVocabularyFilterMethod() {
    switch (this) {
      case 'remove':
        return VocabularyFilterMethod.remove;
      case 'mask':
        return VocabularyFilterMethod.mask;
      case 'tag':
        return VocabularyFilterMethod.tag;
    }
    throw Exception('$this is not known in enum VocabularyFilterMethod');
  }
}

/// Provides information about a custom vocabulary.
class VocabularyInfo {
  /// The language code of the vocabulary entries.
  final LanguageCode? languageCode;

  /// The date and time that the vocabulary was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the vocabulary.
  final String? vocabularyName;

  /// The processing state of the vocabulary. If the state is <code>READY</code>
  /// you can use the vocabulary in a <code>StartTranscriptionJob</code> request.
  final VocabularyState? vocabularyState;

  VocabularyInfo({
    this.languageCode,
    this.lastModifiedTime,
    this.vocabularyName,
    this.vocabularyState,
  });

  factory VocabularyInfo.fromJson(Map<String, dynamic> json) {
    return VocabularyInfo(
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      vocabularyName: json['VocabularyName'] as String?,
      vocabularyState:
          (json['VocabularyState'] as String?)?.toVocabularyState(),
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final lastModifiedTime = this.lastModifiedTime;
    final vocabularyName = this.vocabularyName;
    final vocabularyState = this.vocabularyState;
    return {
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyState != null) 'VocabularyState': vocabularyState.toValue(),
    };
  }
}

enum VocabularyState {
  pending,
  ready,
  failed,
}

extension on VocabularyState {
  String toValue() {
    switch (this) {
      case VocabularyState.pending:
        return 'PENDING';
      case VocabularyState.ready:
        return 'READY';
      case VocabularyState.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  VocabularyState toVocabularyState() {
    switch (this) {
      case 'PENDING':
        return VocabularyState.pending;
      case 'READY':
        return VocabularyState.ready;
      case 'FAILED':
        return VocabularyState.failed;
    }
    throw Exception('$this is not known in enum VocabularyState');
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalFailureException extends _s.GenericAwsException {
  InternalFailureException({String? type, String? message})
      : super(type: type, code: 'InternalFailureException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
};
