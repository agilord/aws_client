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

/// Amazon Transcribe offers three main types of batch transcription:
/// <b>Standard</b>, <b>Medical</b>, and <b>Call Analytics</b>.
///
/// <ul>
/// <li>
/// <b>Standard transcriptions</b> are the most common option. Refer to for
/// details.
/// </li>
/// <li>
/// <b>Medical transcriptions</b> are tailored to medical professionals and
/// incorporate medical terms. A common use case for this service is
/// transcribing doctor-patient dialogue into after-visit notes. Refer to for
/// details.
/// </li>
/// <li>
/// <b>Call Analytics transcriptions</b> are designed for use with call center
/// audio on two different channels; if you're looking for insight into customer
/// service calls, use this option. Refer to for details.
/// </li>
/// </ul>
class Transcribe {
  final _s.JsonProtocol _protocol;
  Transcribe({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Creates a new Call Analytics category.
  ///
  /// All categories are automatically applied to your Call Analytics
  /// transcriptions. Note that in order to apply categories to your
  /// transcriptions, you must create them before submitting your transcription
  /// request, as categories cannot be applied retroactively.
  ///
  /// When creating a new category, you can use the <code>InputType</code>
  /// parameter to label the category as a <code>POST_CALL</code> or a
  /// <code>REAL_TIME</code> category. <code>POST_CALL</code> categories can
  /// only be applied to post-call transcriptions and <code>REAL_TIME</code>
  /// categories can only be applied to real-time transcriptions. If you do not
  /// include <code>InputType</code>, your category is created as a
  /// <code>POST_CALL</code> category by default.
  ///
  /// Call Analytics categories are composed of rules. For each category, you
  /// must create between 1 and 20 rules. Rules can include these parameters: ,
  /// , , and .
  ///
  /// To update an existing category, see .
  ///
  /// To learn more about Call Analytics categories, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html">Creating
  /// categories for post-call transcriptions</a> and <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html">Creating
  /// categories for real-time transcriptions</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [categoryName] :
  /// A unique name, chosen by you, for your Call Analytics category. It's
  /// helpful to use a detailed naming system that will make sense to you in the
  /// future. For example, it's better to use
  /// <code>sentiment-positive-last30seconds</code> for a category over a
  /// generic name like <code>test-category</code>.
  ///
  /// Category names are case sensitive.
  ///
  /// Parameter [rules] :
  /// Rules define a Call Analytics category. When creating a new category, you
  /// must create between 1 and 20 rules for that category. For each rule, you
  /// specify a filter you want applied to the attributes of a call. For
  /// example, you can choose a sentiment filter that detects if a customer's
  /// sentiment was positive during the last 30 seconds of the call.
  ///
  /// Parameter [inputType] :
  /// Choose whether you want to create a real-time or a post-call category for
  /// your Call Analytics transcription.
  ///
  /// Specifying <code>POST_CALL</code> assigns your category to post-call
  /// transcriptions; categories with this input type cannot be applied to
  /// streaming (real-time) transcriptions.
  ///
  /// Specifying <code>REAL_TIME</code> assigns your category to streaming
  /// transcriptions; categories with this input type cannot be applied to
  /// post-call transcriptions.
  ///
  /// If you do not include <code>InputType</code>, your category is created as
  /// a post-call category by default.
  Future<CreateCallAnalyticsCategoryResponse> createCallAnalyticsCategory({
    required String categoryName,
    required List<Rule> rules,
    InputType? inputType,
  }) async {
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
        if (inputType != null) 'InputType': inputType.toValue(),
      },
    );

    return CreateCallAnalyticsCategoryResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new custom language model.
  ///
  /// When creating a new custom language model, you must specify:
  ///
  /// <ul>
  /// <li>
  /// If you want a Wideband (audio sample rates over 16,000 Hz) or Narrowband
  /// (audio sample rates under 16,000 Hz) base model
  /// </li>
  /// <li>
  /// The location of your training and tuning files (this must be an Amazon S3
  /// URI)
  /// </li>
  /// <li>
  /// The language of your model
  /// </li>
  /// <li>
  /// A unique name for your model
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [baseModelName] :
  /// The Amazon Transcribe standard language model, or base model, used to
  /// create your custom language model. Amazon Transcribe offers two options
  /// for base models: Wideband and Narrowband.
  ///
  /// If the audio you want to transcribe has a sample rate of 16,000 Hz or
  /// greater, choose <code>WideBand</code>. To transcribe audio with a sample
  /// rate less than 16,000 Hz, choose <code>NarrowBand</code>.
  ///
  /// Parameter [inputDataConfig] :
  /// Contains the Amazon S3 location of the training data you want to use to
  /// create a new custom language model, and permissions to access this
  /// location.
  ///
  /// When using <code>InputDataConfig</code>, you must include these
  /// sub-parameters: <code>S3Uri</code>, which is the Amazon S3 location of
  /// your training data, and <code>DataAccessRoleArn</code>, which is the
  /// Amazon Resource Name (ARN) of the role that has permission to access your
  /// specified Amazon S3 location. You can optionally include
  /// <code>TuningDataS3Uri</code>, which is the Amazon S3 location of your
  /// tuning data. If you specify different Amazon S3 locations for training and
  /// tuning data, the ARN you use must have permissions to access both
  /// locations.
  ///
  /// Parameter [languageCode] :
  /// The language code that represents the language of your model. Each custom
  /// language model must contain terms in only one language, and the language
  /// you select for your custom language model must match the language of your
  /// training and tuning data.
  ///
  /// For a list of supported languages and their associated language codes,
  /// refer to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table. Note that US English (<code>en-US</code>) is the only
  /// language supported with Amazon Transcribe Medical.
  ///
  /// A custom language model can only be used to transcribe files in the same
  /// language as the model. For example, if you create a custom language model
  /// using US English (<code>en-US</code>), you can only apply this model to
  /// files that contain English audio.
  ///
  /// Parameter [modelName] :
  /// A unique name, chosen by you, for your custom language model.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account. If you try to create a new custom
  /// language model with the same name as an existing custom language model,
  /// you get a <code>ConflictException</code> error.
  ///
  /// Parameter [tags] :
  /// Adds one or more custom tags, each in the form of a key:value pair, to a
  /// new custom language model at the time you create this new model.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  Future<CreateLanguageModelResponse> createLanguageModel({
    required BaseModelName baseModelName,
    required InputDataConfig inputDataConfig,
    required CLMLanguageCode languageCode,
    required String modelName,
    List<Tag>? tags,
  }) async {
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

  /// Creates a new custom medical vocabulary.
  ///
  /// Before creating a new custom medical vocabulary, you must first upload a
  /// text file that contains your vocabulary table into an Amazon S3 bucket.
  /// Note that this differs from , where you can include a list of terms within
  /// your request using the <code>Phrases</code> flag;
  /// <code>CreateMedicalVocabulary</code> does not support the
  /// <code>Phrases</code> flag and only accepts vocabularies in table format.
  ///
  /// Each language has a character set that contains all allowed characters for
  /// that specific language. If you use unsupported characters, your custom
  /// vocabulary request fails. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character
  /// Sets for Custom Vocabularies</a> to get the character set for your
  /// language.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom
  /// vocabularies</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code that represents the language of the entries in your
  /// custom vocabulary. US English (<code>en-US</code>) is the only language
  /// supported with Amazon Transcribe Medical.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The Amazon S3 location (URI) of the text file that contains your custom
  /// medical vocabulary. The URI must be in the same Amazon Web Services Region
  /// as the resource you're calling.
  ///
  /// Here's an example URI path:
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt</code>
  ///
  /// Parameter [vocabularyName] :
  /// A unique name, chosen by you, for your new custom medical vocabulary.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account. If you try to create a new custom
  /// medical vocabulary with the same name as an existing custom medical
  /// vocabulary, you get a <code>ConflictException</code> error.
  ///
  /// Parameter [tags] :
  /// Adds one or more custom tags, each in the form of a key:value pair, to a
  /// new custom medical vocabulary at the time you create this new custom
  /// vocabulary.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  Future<CreateMedicalVocabularyResponse> createMedicalVocabulary({
    required LanguageCode languageCode,
    required String vocabularyFileUri,
    required String vocabularyName,
    List<Tag>? tags,
  }) async {
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

  /// Creates a new custom vocabulary.
  ///
  /// When creating a new custom vocabulary, you can either upload a text file
  /// that contains your new entries, phrases, and terms into an Amazon S3
  /// bucket and include the URI in your request. Or you can include a list of
  /// terms directly in your request using the <code>Phrases</code> flag.
  ///
  /// Each language has a character set that contains all allowed characters for
  /// that specific language. If you use unsupported characters, your custom
  /// vocabulary request fails. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character
  /// Sets for Custom Vocabularies</a> to get the character set for your
  /// language.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom
  /// vocabularies</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code that represents the language of the entries in your
  /// custom vocabulary. Each custom vocabulary must contain terms in only one
  /// language.
  ///
  /// A custom vocabulary can only be used to transcribe files in the same
  /// language as the custom vocabulary. For example, if you create a custom
  /// vocabulary using US English (<code>en-US</code>), you can only apply this
  /// custom vocabulary to files that contain English audio.
  ///
  /// For a list of supported languages and their associated language codes,
  /// refer to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  ///
  /// Parameter [vocabularyName] :
  /// A unique name, chosen by you, for your new custom vocabulary.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account. If you try to create a new custom
  /// vocabulary with the same name as an existing custom vocabulary, you get a
  /// <code>ConflictException</code> error.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to
  /// access the Amazon S3 bucket that contains your input files (in this case,
  /// your custom vocabulary). If the role that you specify doesn’t have the
  /// appropriate permissions to access the specified Amazon S3 location, your
  /// request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  ///
  /// Parameter [phrases] :
  /// Use this parameter if you want to create your custom vocabulary by
  /// including all desired terms, as comma-separated values, within your
  /// request. The other option for creating your custom vocabulary is to save
  /// your entries in a text file and upload them to an Amazon S3 bucket, then
  /// specify the location of your file using the <code>VocabularyFileUri</code>
  /// parameter.
  ///
  /// Note that if you include <code>Phrases</code> in your request, you cannot
  /// use <code>VocabularyFileUri</code>; you must choose one or the other.
  ///
  /// Each language has a character set that contains all allowed characters for
  /// that specific language. If you use unsupported characters, your custom
  /// vocabulary filter request fails. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character
  /// Sets for Custom Vocabularies</a> to get the character set for your
  /// language.
  ///
  /// Parameter [tags] :
  /// Adds one or more custom tags, each in the form of a key:value pair, to a
  /// new custom vocabulary at the time you create this new custom vocabulary.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The Amazon S3 location of the text file that contains your custom
  /// vocabulary. The URI must be located in the same Amazon Web Services Region
  /// as the resource you're calling.
  ///
  /// Here's an example URI path:
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt</code>
  ///
  /// Note that if you include <code>VocabularyFileUri</code> in your request,
  /// you cannot use the <code>Phrases</code> flag; you must choose one or the
  /// other.
  Future<CreateVocabularyResponse> createVocabulary({
    required LanguageCode languageCode,
    required String vocabularyName,
    String? dataAccessRoleArn,
    List<String>? phrases,
    List<Tag>? tags,
    String? vocabularyFileUri,
  }) async {
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
        if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
        if (phrases != null) 'Phrases': phrases,
        if (tags != null) 'Tags': tags,
        if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
      },
    );

    return CreateVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new custom vocabulary filter.
  ///
  /// You can use custom vocabulary filters to mask, delete, or flag specific
  /// words from your transcript. Custom vocabulary filters are commonly used to
  /// mask profanity in transcripts.
  ///
  /// Each language has a character set that contains all allowed characters for
  /// that specific language. If you use unsupported characters, your custom
  /// vocabulary filter request fails. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character
  /// Sets for Custom Vocabularies</a> to get the character set for your
  /// language.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html">Vocabulary
  /// filtering</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code that represents the language of the entries in your
  /// vocabulary filter. Each custom vocabulary filter must contain terms in
  /// only one language.
  ///
  /// A custom vocabulary filter can only be used to transcribe files in the
  /// same language as the filter. For example, if you create a custom
  /// vocabulary filter using US English (<code>en-US</code>), you can only
  /// apply this filter to files that contain English audio.
  ///
  /// For a list of supported languages and their associated language codes,
  /// refer to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  ///
  /// Parameter [vocabularyFilterName] :
  /// A unique name, chosen by you, for your new custom vocabulary filter.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account. If you try to create a new custom
  /// vocabulary filter with the same name as an existing custom vocabulary
  /// filter, you get a <code>ConflictException</code> error.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to
  /// access the Amazon S3 bucket that contains your input files (in this case,
  /// your custom vocabulary filter). If the role that you specify doesn’t have
  /// the appropriate permissions to access the specified Amazon S3 location,
  /// your request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  ///
  /// Parameter [tags] :
  /// Adds one or more custom tags, each in the form of a key:value pair, to a
  /// new custom vocabulary filter at the time you create this new vocabulary
  /// filter.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  ///
  /// Parameter [vocabularyFilterFileUri] :
  /// The Amazon S3 location of the text file that contains your custom
  /// vocabulary filter terms. The URI must be located in the same Amazon Web
  /// Services Region as the resource you're calling.
  ///
  /// Here's an example URI path:
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt</code>
  ///
  /// Note that if you include <code>VocabularyFilterFileUri</code> in your
  /// request, you cannot use <code>Words</code>; you must choose one or the
  /// other.
  ///
  /// Parameter [words] :
  /// Use this parameter if you want to create your custom vocabulary filter by
  /// including all desired terms, as comma-separated values, within your
  /// request. The other option for creating your vocabulary filter is to save
  /// your entries in a text file and upload them to an Amazon S3 bucket, then
  /// specify the location of your file using the
  /// <code>VocabularyFilterFileUri</code> parameter.
  ///
  /// Note that if you include <code>Words</code> in your request, you cannot
  /// use <code>VocabularyFilterFileUri</code>; you must choose one or the
  /// other.
  ///
  /// Each language has a character set that contains all allowed characters for
  /// that specific language. If you use unsupported characters, your custom
  /// vocabulary filter request fails. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character
  /// Sets for Custom Vocabularies</a> to get the character set for your
  /// language.
  Future<CreateVocabularyFilterResponse> createVocabularyFilter({
    required LanguageCode languageCode,
    required String vocabularyFilterName,
    String? dataAccessRoleArn,
    List<Tag>? tags,
    String? vocabularyFilterFileUri,
    List<String>? words,
  }) async {
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
        if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
        if (tags != null) 'Tags': tags,
        if (vocabularyFilterFileUri != null)
          'VocabularyFilterFileUri': vocabularyFilterFileUri,
        if (words != null) 'Words': words,
      },
    );

    return CreateVocabularyFilterResponse.fromJson(jsonResponse.body);
  }

  /// Deletes a Call Analytics category. To use this operation, specify the name
  /// of the category you want to delete using <code>CategoryName</code>.
  /// Category names are case sensitive.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [categoryName] :
  /// The name of the Call Analytics category you want to delete. Category names
  /// are case sensitive.
  Future<void> deleteCallAnalyticsCategory({
    required String categoryName,
  }) async {
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

  /// Deletes a Call Analytics job. To use this operation, specify the name of
  /// the job you want to delete using <code>CallAnalyticsJobName</code>. Job
  /// names are case sensitive.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [callAnalyticsJobName] :
  /// The name of the Call Analytics job you want to delete. Job names are case
  /// sensitive.
  Future<void> deleteCallAnalyticsJob({
    required String callAnalyticsJobName,
  }) async {
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

  /// Deletes a custom language model. To use this operation, specify the name
  /// of the language model you want to delete using <code>ModelName</code>.
  /// custom language model names are case sensitive.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [modelName] :
  /// The name of the custom language model you want to delete. Model names are
  /// case sensitive.
  Future<void> deleteLanguageModel({
    required String modelName,
  }) async {
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

  /// Deletes a Medical Scribe job. To use this operation, specify the name of
  /// the job you want to delete using <code>MedicalScribeJobName</code>. Job
  /// names are case sensitive.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [medicalScribeJobName] :
  /// The name of the Medical Scribe job you want to delete. Job names are case
  /// sensitive.
  Future<void> deleteMedicalScribeJob({
    required String medicalScribeJobName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.DeleteMedicalScribeJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MedicalScribeJobName': medicalScribeJobName,
      },
    );
  }

  /// Deletes a medical transcription job. To use this operation, specify the
  /// name of the job you want to delete using
  /// <code>MedicalTranscriptionJobName</code>. Job names are case sensitive.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// The name of the medical transcription job you want to delete. Job names
  /// are case sensitive.
  Future<void> deleteMedicalTranscriptionJob({
    required String medicalTranscriptionJobName,
  }) async {
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

  /// Deletes a custom medical vocabulary. To use this operation, specify the
  /// name of the custom vocabulary you want to delete using
  /// <code>VocabularyName</code>. Custom vocabulary names are case sensitive.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the custom medical vocabulary you want to delete. Custom
  /// medical vocabulary names are case sensitive.
  Future<void> deleteMedicalVocabulary({
    required String vocabularyName,
  }) async {
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

  /// Deletes a transcription job. To use this operation, specify the name of
  /// the job you want to delete using <code>TranscriptionJobName</code>. Job
  /// names are case sensitive.
  ///
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [transcriptionJobName] :
  /// The name of the transcription job you want to delete. Job names are case
  /// sensitive.
  Future<void> deleteTranscriptionJob({
    required String transcriptionJobName,
  }) async {
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

  /// Deletes a custom vocabulary. To use this operation, specify the name of
  /// the custom vocabulary you want to delete using
  /// <code>VocabularyName</code>. Custom vocabulary names are case sensitive.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the custom vocabulary you want to delete. Custom vocabulary
  /// names are case sensitive.
  Future<void> deleteVocabulary({
    required String vocabularyName,
  }) async {
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

  /// Deletes a custom vocabulary filter. To use this operation, specify the
  /// name of the custom vocabulary filter you want to delete using
  /// <code>VocabularyFilterName</code>. Custom vocabulary filter names are case
  /// sensitive.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the custom vocabulary filter you want to delete. Custom
  /// vocabulary filter names are case sensitive.
  Future<void> deleteVocabularyFilter({
    required String vocabularyFilterName,
  }) async {
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

  /// Provides information about the specified custom language model.
  ///
  /// This operation also shows if the base language model that you used to
  /// create your custom language model has been updated. If Amazon Transcribe
  /// has updated the base model, you can create a new custom language model
  /// using the updated base model.
  ///
  /// If you tried to create a new custom language model and the request wasn't
  /// successful, you can use <code>DescribeLanguageModel</code> to help
  /// identify the reason for this failure.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [modelName] :
  /// The name of the custom language model you want information about. Model
  /// names are case sensitive.
  Future<DescribeLanguageModelResponse> describeLanguageModel({
    required String modelName,
  }) async {
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

  /// Provides information about the specified Call Analytics category.
  ///
  /// To get a list of your Call Analytics categories, use the operation.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [categoryName] :
  /// The name of the Call Analytics category you want information about.
  /// Category names are case sensitive.
  Future<GetCallAnalyticsCategoryResponse> getCallAnalyticsCategory({
    required String categoryName,
  }) async {
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

  /// Provides information about the specified Call Analytics job.
  ///
  /// To view the job's status, refer to <code>CallAnalyticsJobStatus</code>. If
  /// the status is <code>COMPLETED</code>, the job is finished. You can find
  /// your completed transcript at the URI specified in
  /// <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>,
  /// <code>FailureReason</code> provides details on why your transcription job
  /// failed.
  ///
  /// If you enabled personally identifiable information (PII) redaction, the
  /// redacted transcript appears at the location specified in
  /// <code>RedactedTranscriptFileUri</code>.
  ///
  /// If you chose to redact the audio in your media file, you can find your
  /// redacted media file at the location specified in
  /// <code>RedactedMediaFileUri</code>.
  ///
  /// To get a list of your Call Analytics jobs, use the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [callAnalyticsJobName] :
  /// The name of the Call Analytics job you want information about. Job names
  /// are case sensitive.
  Future<GetCallAnalyticsJobResponse> getCallAnalyticsJob({
    required String callAnalyticsJobName,
  }) async {
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

  /// Provides information about the specified Medical Scribe job.
  ///
  /// To view the status of the specified medical transcription job, check the
  /// <code>MedicalScribeJobStatus</code> field. If the status is
  /// <code>COMPLETED</code>, the job is finished. You can find the results at
  /// the location specified in <code>MedicalScribeOutput</code>. If the status
  /// is <code>FAILED</code>, <code>FailureReason</code> provides details on why
  /// your Medical Scribe job failed.
  ///
  /// To get a list of your Medical Scribe jobs, use the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [medicalScribeJobName] :
  /// The name of the Medical Scribe job you want information about. Job names
  /// are case sensitive.
  Future<GetMedicalScribeJobResponse> getMedicalScribeJob({
    required String medicalScribeJobName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.GetMedicalScribeJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'MedicalScribeJobName': medicalScribeJobName,
      },
    );

    return GetMedicalScribeJobResponse.fromJson(jsonResponse.body);
  }

  /// Provides information about the specified medical transcription job.
  ///
  /// To view the status of the specified medical transcription job, check the
  /// <code>TranscriptionJobStatus</code> field. If the status is
  /// <code>COMPLETED</code>, the job is finished. You can find the results at
  /// the location specified in <code>TranscriptFileUri</code>. If the status is
  /// <code>FAILED</code>, <code>FailureReason</code> provides details on why
  /// your transcription job failed.
  ///
  /// To get a list of your medical transcription jobs, use the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// The name of the medical transcription job you want information about. Job
  /// names are case sensitive.
  Future<GetMedicalTranscriptionJobResponse> getMedicalTranscriptionJob({
    required String medicalTranscriptionJobName,
  }) async {
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

  /// Provides information about the specified custom medical vocabulary.
  ///
  /// To view the status of the specified custom medical vocabulary, check the
  /// <code>VocabularyState</code> field. If the status is <code>READY</code>,
  /// your custom vocabulary is available to use. If the status is
  /// <code>FAILED</code>, <code>FailureReason</code> provides details on why
  /// your vocabulary failed.
  ///
  /// To get a list of your custom medical vocabularies, use the operation.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the custom medical vocabulary you want information about.
  /// Custom medical vocabulary names are case sensitive.
  Future<GetMedicalVocabularyResponse> getMedicalVocabulary({
    required String vocabularyName,
  }) async {
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

  /// Provides information about the specified transcription job.
  ///
  /// To view the status of the specified transcription job, check the
  /// <code>TranscriptionJobStatus</code> field. If the status is
  /// <code>COMPLETED</code>, the job is finished. You can find the results at
  /// the location specified in <code>TranscriptFileUri</code>. If the status is
  /// <code>FAILED</code>, <code>FailureReason</code> provides details on why
  /// your transcription job failed.
  ///
  /// If you enabled content redaction, the redacted transcript can be found at
  /// the location specified in <code>RedactedTranscriptFileUri</code>.
  ///
  /// To get a list of your transcription jobs, use the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [transcriptionJobName] :
  /// The name of the transcription job you want information about. Job names
  /// are case sensitive.
  Future<GetTranscriptionJobResponse> getTranscriptionJob({
    required String transcriptionJobName,
  }) async {
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

  /// Provides information about the specified custom vocabulary.
  ///
  /// To view the status of the specified custom vocabulary, check the
  /// <code>VocabularyState</code> field. If the status is <code>READY</code>,
  /// your custom vocabulary is available to use. If the status is
  /// <code>FAILED</code>, <code>FailureReason</code> provides details on why
  /// your custom vocabulary failed.
  ///
  /// To get a list of your custom vocabularies, use the operation.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vocabularyName] :
  /// The name of the custom vocabulary you want information about. Custom
  /// vocabulary names are case sensitive.
  Future<GetVocabularyResponse> getVocabulary({
    required String vocabularyName,
  }) async {
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

  /// Provides information about the specified custom vocabulary filter.
  ///
  /// To get a list of your custom vocabulary filters, use the operation.
  ///
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [BadRequestException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the custom vocabulary filter you want information about.
  /// Custom vocabulary filter names are case sensitive.
  Future<GetVocabularyFilterResponse> getVocabularyFilter({
    required String vocabularyFilterName,
  }) async {
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

  /// Provides a list of Call Analytics categories, including all rules that
  /// make up each category.
  ///
  /// To get detailed information about a specific Call Analytics category, use
  /// the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Call Analytics categories to return in each page of
  /// results. If there are fewer results than the value that you specify, only
  /// the actual results are returned. If you do not specify a value, a default
  /// of 5 is used.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListCallAnalyticsCategories</code> request returns more
  /// results than can be displayed, <code>NextToken</code> is displayed in the
  /// response with an associated string. To get the next page of results, copy
  /// this string and repeat your request, including <code>NextToken</code> with
  /// the value of the copied string. Repeat as needed to view all your results.
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

  /// Provides a list of Call Analytics jobs that match the specified criteria.
  /// If no criteria are specified, all Call Analytics jobs are returned.
  ///
  /// To get detailed information about a specific Call Analytics job, use the
  /// operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// Returns only the Call Analytics jobs that contain the specified string.
  /// The search is not case sensitive.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Call Analytics jobs to return in each page of
  /// results. If there are fewer results than the value that you specify, only
  /// the actual results are returned. If you do not specify a value, a default
  /// of 5 is used.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListCallAnalyticsJobs</code> request returns more results
  /// than can be displayed, <code>NextToken</code> is displayed in the response
  /// with an associated string. To get the next page of results, copy this
  /// string and repeat your request, including <code>NextToken</code> with the
  /// value of the copied string. Repeat as needed to view all your results.
  ///
  /// Parameter [status] :
  /// Returns only Call Analytics jobs with the specified status. Jobs are
  /// ordered by creation date, with the newest job first. If you do not include
  /// <code>Status</code>, all Call Analytics jobs are returned.
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

  /// Provides a list of custom language models that match the specified
  /// criteria. If no criteria are specified, all custom language models are
  /// returned.
  ///
  /// To get detailed information about a specific custom language model, use
  /// the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom language models to return in each page of
  /// results. If there are fewer results than the value that you specify, only
  /// the actual results are returned. If you do not specify a value, a default
  /// of 5 is used.
  ///
  /// Parameter [nameContains] :
  /// Returns only the custom language models that contain the specified string.
  /// The search is not case sensitive.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListLanguageModels</code> request returns more results than
  /// can be displayed, <code>NextToken</code> is displayed in the response with
  /// an associated string. To get the next page of results, copy this string
  /// and repeat your request, including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  ///
  /// Parameter [statusEquals] :
  /// Returns only custom language models with the specified status. Language
  /// models are ordered by creation date, with the newest model first. If you
  /// do not include <code>StatusEquals</code>, all custom language models are
  /// returned.
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

  /// Provides a list of Medical Scribe jobs that match the specified criteria.
  /// If no criteria are specified, all Medical Scribe jobs are returned.
  ///
  /// To get detailed information about a specific Medical Scribe job, use the
  /// operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// Returns only the Medical Scribe jobs that contain the specified string.
  /// The search is not case sensitive.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of Medical Scribe jobs to return in each page of
  /// results. If there are fewer results than the value that you specify, only
  /// the actual results are returned. If you do not specify a value, a default
  /// of 5 is used.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListMedicalScribeJobs</code> request returns more results
  /// than can be displayed, <code>NextToken</code> is displayed in the response
  /// with an associated string. To get the next page of results, copy this
  /// string and repeat your request, including <code>NextToken</code> with the
  /// value of the copied string. Repeat as needed to view all your results.
  ///
  /// Parameter [status] :
  /// Returns only Medical Scribe jobs with the specified status. Jobs are
  /// ordered by creation date, with the newest job first. If you do not include
  /// <code>Status</code>, all Medical Scribe jobs are returned.
  Future<ListMedicalScribeJobsResponse> listMedicalScribeJobs({
    String? jobNameContains,
    int? maxResults,
    String? nextToken,
    MedicalScribeJobStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.ListMedicalScribeJobs'
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

    return ListMedicalScribeJobsResponse.fromJson(jsonResponse.body);
  }

  /// Provides a list of medical transcription jobs that match the specified
  /// criteria. If no criteria are specified, all medical transcription jobs are
  /// returned.
  ///
  /// To get detailed information about a specific medical transcription job,
  /// use the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// Returns only the medical transcription jobs that contain the specified
  /// string. The search is not case sensitive.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of medical transcription jobs to return in each page of
  /// results. If there are fewer results than the value that you specify, only
  /// the actual results are returned. If you do not specify a value, a default
  /// of 5 is used.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListMedicalTranscriptionJobs</code> request returns more
  /// results than can be displayed, <code>NextToken</code> is displayed in the
  /// response with an associated string. To get the next page of results, copy
  /// this string and repeat your request, including <code>NextToken</code> with
  /// the value of the copied string. Repeat as needed to view all your results.
  ///
  /// Parameter [status] :
  /// Returns only medical transcription jobs with the specified status. Jobs
  /// are ordered by creation date, with the newest job first. If you do not
  /// include <code>Status</code>, all medical transcription jobs are returned.
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

  /// Provides a list of custom medical vocabularies that match the specified
  /// criteria. If no criteria are specified, all custom medical vocabularies
  /// are returned.
  ///
  /// To get detailed information about a specific custom medical vocabulary,
  /// use the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom medical vocabularies to return in each page
  /// of results. If there are fewer results than the value that you specify,
  /// only the actual results are returned. If you do not specify a value, a
  /// default of 5 is used.
  ///
  /// Parameter [nameContains] :
  /// Returns only the custom medical vocabularies that contain the specified
  /// string. The search is not case sensitive.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListMedicalVocabularies</code> request returns more results
  /// than can be displayed, <code>NextToken</code> is displayed in the response
  /// with an associated string. To get the next page of results, copy this
  /// string and repeat your request, including <code>NextToken</code> with the
  /// value of the copied string. Repeat as needed to view all your results.
  ///
  /// Parameter [stateEquals] :
  /// Returns only custom medical vocabularies with the specified state. Custom
  /// vocabularies are ordered by creation date, with the newest vocabulary
  /// first. If you do not include <code>StateEquals</code>, all custom medical
  /// vocabularies are returned.
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

  /// Lists all tags associated with the specified transcription job,
  /// vocabulary, model, or resource.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// Returns a list of all tags associated with the specified Amazon Resource
  /// Name (ARN). ARNs have the format
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.
  ///
  /// For example,
  /// <code>arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name</code>.
  ///
  /// Valid values for <code>resource-type</code> are:
  /// <code>transcription-job</code>, <code>medical-transcription-job</code>,
  /// <code>vocabulary</code>, <code>medical-vocabulary</code>,
  /// <code>vocabulary-filter</code>, and <code>language-model</code>.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
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

  /// Provides a list of transcription jobs that match the specified criteria.
  /// If no criteria are specified, all transcription jobs are returned.
  ///
  /// To get detailed information about a specific transcription job, use the
  /// operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [jobNameContains] :
  /// Returns only the transcription jobs that contain the specified string. The
  /// search is not case sensitive.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of transcription jobs to return in each page of
  /// results. If there are fewer results than the value that you specify, only
  /// the actual results are returned. If you do not specify a value, a default
  /// of 5 is used.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListTranscriptionJobs</code> request returns more results
  /// than can be displayed, <code>NextToken</code> is displayed in the response
  /// with an associated string. To get the next page of results, copy this
  /// string and repeat your request, including <code>NextToken</code> with the
  /// value of the copied string. Repeat as needed to view all your results.
  ///
  /// Parameter [status] :
  /// Returns only transcription jobs with the specified status. Jobs are
  /// ordered by creation date, with the newest job first. If you do not include
  /// <code>Status</code>, all transcription jobs are returned.
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

  /// Provides a list of custom vocabularies that match the specified criteria.
  /// If no criteria are specified, all custom vocabularies are returned.
  ///
  /// To get detailed information about a specific custom vocabulary, use the
  /// operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom vocabularies to return in each page of
  /// results. If there are fewer results than the value that you specify, only
  /// the actual results are returned. If you do not specify a value, a default
  /// of 5 is used.
  ///
  /// Parameter [nameContains] :
  /// Returns only the custom vocabularies that contain the specified string.
  /// The search is not case sensitive.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListVocabularies</code> request returns more results than
  /// can be displayed, <code>NextToken</code> is displayed in the response with
  /// an associated string. To get the next page of results, copy this string
  /// and repeat your request, including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  ///
  /// Parameter [stateEquals] :
  /// Returns only custom vocabularies with the specified state. Vocabularies
  /// are ordered by creation date, with the newest vocabulary first. If you do
  /// not include <code>StateEquals</code>, all custom medical vocabularies are
  /// returned.
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

  /// Provides a list of custom vocabulary filters that match the specified
  /// criteria. If no criteria are specified, all custom vocabularies are
  /// returned.
  ///
  /// To get detailed information about a specific custom vocabulary filter, use
  /// the operation.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of custom vocabulary filters to return in each page of
  /// results. If there are fewer results than the value that you specify, only
  /// the actual results are returned. If you do not specify a value, a default
  /// of 5 is used.
  ///
  /// Parameter [nameContains] :
  /// Returns only the custom vocabulary filters that contain the specified
  /// string. The search is not case sensitive.
  ///
  /// Parameter [nextToken] :
  /// If your <code>ListVocabularyFilters</code> request returns more results
  /// than can be displayed, <code>NextToken</code> is displayed in the response
  /// with an associated string. To get the next page of results, copy this
  /// string and repeat your request, including <code>NextToken</code> with the
  /// value of the copied string. Repeat as needed to view all your results.
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

  /// Transcribes the audio from a customer service call and applies any
  /// additional Request Parameters you choose to include in your request.
  ///
  /// In addition to many standard transcription features, Call Analytics
  /// provides you with call characteristics, call summarization, speaker
  /// sentiment, and optional redaction of your text transcript and your audio
  /// file. You can also apply custom categories to flag specified conditions.
  /// To learn more about these features and insights, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html">Analyzing
  /// call center audio with Call Analytics</a>.
  ///
  /// If you want to apply categories to your Call Analytics job, you must
  /// create them before submitting your job request. Categories cannot be
  /// retroactively applied to a job. To create a new category, use the
  /// operation. To learn more about Call Analytics categories, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html">Creating
  /// categories for post-call transcriptions</a> and <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html">Creating
  /// categories for real-time transcriptions</a>.
  ///
  /// To make a <code>StartCallAnalyticsJob</code> request, you must first
  /// upload your media file into an Amazon S3 bucket; you can then specify the
  /// Amazon S3 location of the file using the <code>Media</code> parameter.
  ///
  /// Note that job queuing is enabled by default for Call Analytics jobs.
  ///
  /// You must include the following parameters in your
  /// <code>StartCallAnalyticsJob</code> request:
  ///
  /// <ul>
  /// <li>
  /// <code>region</code>: The Amazon Web Services Region where you are making
  /// your request. For a list of Amazon Web Services Regions supported with
  /// Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon
  /// Transcribe endpoints and quotas</a>.
  /// </li>
  /// <li>
  /// <code>CallAnalyticsJobName</code>: A custom name that you create for your
  /// transcription job that's unique within your Amazon Web Services account.
  /// </li>
  /// <li>
  /// <code>DataAccessRoleArn</code>: The Amazon Resource Name (ARN) of an IAM
  /// role that has permissions to access the Amazon S3 bucket that contains
  /// your input files.
  /// </li>
  /// <li>
  /// <code>Media</code> (<code>MediaFileUri</code> or
  /// <code>RedactedMediaFileUri</code>): The Amazon S3 location of your media
  /// file.
  /// </li>
  /// </ul> <note>
  /// With Call Analytics, you can redact the audio contained in your media file
  /// by including <code>RedactedMediaFileUri</code>, instead of
  /// <code>MediaFileUri</code>, to specify the location of your input audio. If
  /// you choose to redact your audio, you can find your redacted media at the
  /// location specified in the <code>RedactedMediaFileUri</code> field of your
  /// response.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [callAnalyticsJobName] :
  /// A unique name, chosen by you, for your Call Analytics job.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account. If you try to create a new job with
  /// the same name as an existing job, you get a <code>ConflictException</code>
  /// error.
  ///
  /// Parameter [media] :
  /// Describes the Amazon S3 location of the media file you want to use in your
  /// Call Analytics request.
  ///
  /// Parameter [channelDefinitions] :
  /// Makes it possible to specify which speaker is on which channel. For
  /// example, if your agent is the first participant to speak, you would set
  /// <code>ChannelId</code> to <code>0</code> (to indicate the first channel)
  /// and <code>ParticipantRole</code> to <code>AGENT</code> (to indicate that
  /// it's the agent speaking).
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to
  /// access the Amazon S3 bucket that contains your input files. If the role
  /// that you specify doesn’t have the appropriate permissions to access the
  /// specified Amazon S3 location, your request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The KMS key you want to use to encrypt your Call Analytics output.
  ///
  /// If using a key located in the <b>current</b> Amazon Web Services account,
  /// you can specify your KMS key in one of four ways:
  /// <ol>
  /// <li>
  /// Use the KMS key ID itself. For example,
  /// <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use an alias for the KMS key ID. For example,
  /// <code>alias/ExampleAlias</code>.
  /// </li>
  /// <li>
  /// Use the Amazon Resource Name (ARN) for the KMS key ID. For example,
  /// <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use the ARN for the KMS key alias. For example,
  /// <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.
  /// </li> </ol>
  /// If using a key located in a <b>different</b> Amazon Web Services account
  /// than the current Amazon Web Services account, you can specify your KMS key
  /// in one of two ways:
  /// <ol>
  /// <li>
  /// Use the ARN for the KMS key ID. For example,
  /// <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use the ARN for the KMS key alias. For example,
  /// <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.
  /// </li> </ol>
  /// If you do not specify an encryption key, your output is encrypted with the
  /// default Amazon S3 key (SSE-S3).
  ///
  /// If you specify a KMS key to encrypt your output, you must also specify an
  /// output location using the <code>OutputLocation</code> parameter.
  ///
  /// Note that the role making the request must have permission to use the
  /// specified KMS key.
  ///
  /// Parameter [outputLocation] :
  /// The Amazon S3 location where you want your Call Analytics transcription
  /// output stored. You can use any of the following formats to specify the
  /// output location:
  /// <ol>
  /// <li>
  /// s3://DOC-EXAMPLE-BUCKET
  /// </li>
  /// <li>
  /// s3://DOC-EXAMPLE-BUCKET/my-output-folder/
  /// </li>
  /// <li>
  /// s3://DOC-EXAMPLE-BUCKET/my-output-folder/my-call-analytics-job.json
  /// </li> </ol>
  /// Unless you specify a file name (option 3), the name of your output file
  /// has a default value that matches the name you specified for your
  /// transcription job using the <code>CallAnalyticsJobName</code> parameter.
  ///
  /// You can specify a KMS key to encrypt your output using the
  /// <code>OutputEncryptionKMSKeyId</code> parameter. If you do not specify a
  /// KMS key, Amazon Transcribe uses the default Amazon S3 key for server-side
  /// encryption.
  ///
  /// If you do not specify <code>OutputLocation</code>, your transcript is
  /// placed in a service-managed Amazon S3 bucket and you are provided with a
  /// URI to access your transcript.
  ///
  /// Parameter [settings] :
  /// Specify additional optional settings in your request, including content
  /// redaction; allows you to apply custom language models, vocabulary filters,
  /// and custom vocabularies to your Call Analytics job.
  Future<StartCallAnalyticsJobResponse> startCallAnalyticsJob({
    required String callAnalyticsJobName,
    required Media media,
    List<ChannelDefinition>? channelDefinitions,
    String? dataAccessRoleArn,
    String? outputEncryptionKMSKeyId,
    String? outputLocation,
    CallAnalyticsJobSettings? settings,
  }) async {
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
        'Media': media,
        if (channelDefinitions != null)
          'ChannelDefinitions': channelDefinitions,
        if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
        if (outputEncryptionKMSKeyId != null)
          'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
        if (outputLocation != null) 'OutputLocation': outputLocation,
        if (settings != null) 'Settings': settings,
      },
    );

    return StartCallAnalyticsJobResponse.fromJson(jsonResponse.body);
  }

  /// Transcribes patient-clinician conversations and generates clinical notes.
  ///
  /// Amazon Web Services HealthScribe automatically provides rich conversation
  /// transcripts, identifies speaker roles, classifies dialogues, extracts
  /// medical terms, and generates preliminary clinical notes. To learn more
  /// about these features, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe.html">Amazon
  /// Web Services HealthScribe</a>.
  ///
  /// To make a <code>StartMedicalScribeJob</code> request, you must first
  /// upload your media file into an Amazon S3 bucket; you can then specify the
  /// Amazon S3 location of the file using the <code>Media</code> parameter.
  ///
  /// You must include the following parameters in your
  /// <code>StartMedicalTranscriptionJob</code> request:
  ///
  /// <ul>
  /// <li>
  /// <code>DataAccessRoleArn</code>: The ARN of an IAM role with the these
  /// minimum permissions: read permission on input file Amazon S3 bucket
  /// specified in <code>Media</code>, write permission on the Amazon S3 bucket
  /// specified in <code>OutputBucketName</code>, and full permissions on the
  /// KMS key specified in <code>OutputEncryptionKMSKeyId</code> (if set). The
  /// role should also allow <code>transcribe.amazonaws.com</code> to assume it.
  /// </li>
  /// <li>
  /// <code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of
  /// your media file.
  /// </li>
  /// <li>
  /// <code>MedicalScribeJobName</code>: A custom name you create for your
  /// MedicalScribe job that is unique within your Amazon Web Services account.
  /// </li>
  /// <li>
  /// <code>OutputBucketName</code>: The Amazon S3 bucket where you want your
  /// output files stored.
  /// </li>
  /// <li>
  /// <code>Settings</code>: A <code>MedicalScribeSettings</code> obect that
  /// must set exactly one of <code>ShowSpeakerLabels</code> or
  /// <code>ChannelIdentification</code> to true. If
  /// <code>ShowSpeakerLabels</code> is true, <code>MaxSpeakerLabels</code> must
  /// also be set.
  /// </li>
  /// <li>
  /// <code>ChannelDefinitions</code>: A
  /// <code>MedicalScribeChannelDefinitions</code> array should be set if and
  /// only if the <code>ChannelIdentification</code> value of
  /// <code>Settings</code> is set to true.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to
  /// access the Amazon S3 bucket that contains your input files, write to the
  /// output bucket, and use your KMS key if supplied. If the role that you
  /// specify doesn’t have the appropriate permissions your request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  ///
  /// Parameter [medicalScribeJobName] :
  /// A unique name, chosen by you, for your Medical Scribe job.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account. If you try to create a new job with
  /// the same name as an existing job, you get a <code>ConflictException</code>
  /// error.
  ///
  /// Parameter [outputBucketName] :
  /// The name of the Amazon S3 bucket where you want your Medical Scribe output
  /// stored. Do not include the <code>S3://</code> prefix of the specified
  /// bucket.
  ///
  /// Note that the role specified in the <code>DataAccessRoleArn</code> request
  /// parameter must have permission to use the specified location. You can
  /// change Amazon S3 permissions using the <a
  /// href="https://console.aws.amazon.com/s3">Amazon Web Services Management
  /// Console</a>. See also <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions
  /// Required for IAM User Roles</a>.
  ///
  /// Parameter [settings] :
  /// Makes it possible to control how your Medical Scribe job is processed
  /// using a <code>MedicalScribeSettings</code> object. Specify
  /// <code>ChannelIdentification</code> if <code>ChannelDefinitions</code> are
  /// set. Enabled <code>ShowSpeakerLabels</code> if
  /// <code>ChannelIdentification</code> and <code>ChannelDefinitions</code> are
  /// not set. One and only one of <code>ChannelIdentification</code> and
  /// <code>ShowSpeakerLabels</code> must be set. If
  /// <code>ShowSpeakerLabels</code> is set, <code>MaxSpeakerLabels</code> must
  /// also be set. Use <code>Settings</code> to specify a vocabulary or
  /// vocabulary filter or both using <code>VocabularyName</code>,
  /// <code>VocabularyFilterName</code>. <code>VocabularyFilterMethod</code>
  /// must be specified if <code>VocabularyFilterName</code> is set.
  ///
  /// Parameter [channelDefinitions] :
  /// Makes it possible to specify which speaker is on which channel. For
  /// example, if the clinician is the first participant to speak, you would set
  /// <code>ChannelId</code> of the first <code>ChannelDefinition</code> in the
  /// list to <code>0</code> (to indicate the first channel) and
  /// <code>ParticipantRole</code> to <code>CLINICIAN</code> (to indicate that
  /// it's the clinician speaking). Then you would set the
  /// <code>ChannelId</code> of the second <code>ChannelDefinition</code> in the
  /// list to <code>1</code> (to indicate the second channel) and
  /// <code>ParticipantRole</code> to <code>PATIENT</code> (to indicate that
  /// it's the patient speaking).
  ///
  /// Parameter [kMSEncryptionContext] :
  /// A map of plain text, non-secret key:value pairs, known as encryption
  /// context pairs, that provide an added layer of security for your data. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context">KMS
  /// encryption context</a> and <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html">Asymmetric
  /// keys in KMS</a>.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The KMS key you want to use to encrypt your Medical Scribe output.
  ///
  /// If using a key located in the <b>current</b> Amazon Web Services account,
  /// you can specify your KMS key in one of four ways:
  /// <ol>
  /// <li>
  /// Use the KMS key ID itself. For example,
  /// <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use an alias for the KMS key ID. For example,
  /// <code>alias/ExampleAlias</code>.
  /// </li>
  /// <li>
  /// Use the Amazon Resource Name (ARN) for the KMS key ID. For example,
  /// <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use the ARN for the KMS key alias. For example,
  /// <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.
  /// </li> </ol>
  /// If using a key located in a <b>different</b> Amazon Web Services account
  /// than the current Amazon Web Services account, you can specify your KMS key
  /// in one of two ways:
  /// <ol>
  /// <li>
  /// Use the ARN for the KMS key ID. For example,
  /// <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use the ARN for the KMS key alias. For example,
  /// <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.
  /// </li> </ol>
  /// If you do not specify an encryption key, your output is encrypted with the
  /// default Amazon S3 key (SSE-S3).
  ///
  /// Note that the role specified in the <code>DataAccessRoleArn</code> request
  /// parameter must have permission to use the specified KMS key.
  ///
  /// Parameter [tags] :
  /// Adds one or more custom tags, each in the form of a key:value pair, to the
  /// Medica Scribe job.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  Future<StartMedicalScribeJobResponse> startMedicalScribeJob({
    required String dataAccessRoleArn,
    required Media media,
    required String medicalScribeJobName,
    required String outputBucketName,
    required MedicalScribeSettings settings,
    List<MedicalScribeChannelDefinition>? channelDefinitions,
    Map<String, String>? kMSEncryptionContext,
    String? outputEncryptionKMSKeyId,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'Transcribe.StartMedicalScribeJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'DataAccessRoleArn': dataAccessRoleArn,
        'Media': media,
        'MedicalScribeJobName': medicalScribeJobName,
        'OutputBucketName': outputBucketName,
        'Settings': settings,
        if (channelDefinitions != null)
          'ChannelDefinitions': channelDefinitions,
        if (kMSEncryptionContext != null)
          'KMSEncryptionContext': kMSEncryptionContext,
        if (outputEncryptionKMSKeyId != null)
          'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
        if (tags != null) 'Tags': tags,
      },
    );

    return StartMedicalScribeJobResponse.fromJson(jsonResponse.body);
  }

  /// Transcribes the audio from a medical dictation or conversation and applies
  /// any additional Request Parameters you choose to include in your request.
  ///
  /// In addition to many standard transcription features, Amazon Transcribe
  /// Medical provides you with a robust medical vocabulary and, optionally,
  /// content identification, which adds flags to personal health information
  /// (PHI). To learn more about these features, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-it-works-med.html">How
  /// Amazon Transcribe Medical works</a>.
  ///
  /// To make a <code>StartMedicalTranscriptionJob</code> request, you must
  /// first upload your media file into an Amazon S3 bucket; you can then
  /// specify the Amazon S3 location of the file using the <code>Media</code>
  /// parameter.
  ///
  /// You must include the following parameters in your
  /// <code>StartMedicalTranscriptionJob</code> request:
  ///
  /// <ul>
  /// <li>
  /// <code>region</code>: The Amazon Web Services Region where you are making
  /// your request. For a list of Amazon Web Services Regions supported with
  /// Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon
  /// Transcribe endpoints and quotas</a>.
  /// </li>
  /// <li>
  /// <code>MedicalTranscriptionJobName</code>: A custom name you create for
  /// your transcription job that is unique within your Amazon Web Services
  /// account.
  /// </li>
  /// <li>
  /// <code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of
  /// your media file.
  /// </li>
  /// <li>
  /// <code>LanguageCode</code>: This must be <code>en-US</code>.
  /// </li>
  /// <li>
  /// <code>OutputBucketName</code>: The Amazon S3 bucket where you want your
  /// transcript stored. If you want your output stored in a sub-folder of this
  /// bucket, you must also include <code>OutputKey</code>.
  /// </li>
  /// <li>
  /// <code>Specialty</code>: This must be <code>PRIMARYCARE</code>.
  /// </li>
  /// <li>
  /// <code>Type</code>: Choose whether your audio is a conversation or a
  /// dictation.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code that represents the language spoken in the input media
  /// file. US English (<code>en-US</code>) is the only valid value for medical
  /// transcription jobs. Any other value you enter for language code results in
  /// a <code>BadRequestException</code> error.
  ///
  /// Parameter [medicalTranscriptionJobName] :
  /// A unique name, chosen by you, for your medical transcription job. The name
  /// that you specify is also used as the default name of your transcription
  /// output file. If you want to specify a different name for your
  /// transcription output, use the <code>OutputKey</code> parameter.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account. If you try to create a new job with
  /// the same name as an existing job, you get a <code>ConflictException</code>
  /// error.
  ///
  /// Parameter [outputBucketName] :
  /// The name of the Amazon S3 bucket where you want your medical transcription
  /// output stored. Do not include the <code>S3://</code> prefix of the
  /// specified bucket.
  ///
  /// If you want your output to go to a sub-folder of this bucket, specify it
  /// using the <code>OutputKey</code> parameter; <code>OutputBucketName</code>
  /// only accepts the name of a bucket.
  ///
  /// For example, if you want your output stored in
  /// <code>S3://DOC-EXAMPLE-BUCKET</code>, set <code>OutputBucketName</code> to
  /// <code>DOC-EXAMPLE-BUCKET</code>. However, if you want your output stored
  /// in <code>S3://DOC-EXAMPLE-BUCKET/test-files/</code>, set
  /// <code>OutputBucketName</code> to <code>DOC-EXAMPLE-BUCKET</code> and
  /// <code>OutputKey</code> to <code>test-files/</code>.
  ///
  /// Note that Amazon Transcribe must have permission to use the specified
  /// location. You can change Amazon S3 permissions using the <a
  /// href="https://console.aws.amazon.com/s3">Amazon Web Services Management
  /// Console</a>. See also <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions
  /// Required for IAM User Roles</a>.
  ///
  /// Parameter [specialty] :
  /// Specify the predominant medical specialty represented in your media. For
  /// batch transcriptions, <code>PRIMARYCARE</code> is the only valid value. If
  /// you require additional specialties, refer to .
  ///
  /// Parameter [type] :
  /// Specify whether your input media contains only one person
  /// (<code>DICTATION</code>) or contains a conversation between two people
  /// (<code>CONVERSATION</code>).
  ///
  /// For example, <code>DICTATION</code> could be used for a medical
  /// professional wanting to transcribe voice memos; <code>CONVERSATION</code>
  /// could be used for transcribing the doctor-patient dialogue during the
  /// patient's office visit.
  ///
  /// Parameter [contentIdentificationType] :
  /// Labels all personal health information (PHI) identified in your
  /// transcript. For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html">Identifying
  /// personal health information (PHI) in a transcription</a>.
  ///
  /// Parameter [kMSEncryptionContext] :
  /// A map of plain text, non-secret key:value pairs, known as encryption
  /// context pairs, that provide an added layer of security for your data. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context">KMS
  /// encryption context</a> and <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html">Asymmetric
  /// keys in KMS</a>.
  ///
  /// Parameter [mediaFormat] :
  /// Specify the format of your input media file.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate, in hertz, of the audio track in your input media file.
  ///
  /// If you do not specify the media sample rate, Amazon Transcribe Medical
  /// determines it for you. If you specify the sample rate, it must match the
  /// rate detected by Amazon Transcribe Medical; if there's a mismatch between
  /// the value that you specify and the value detected, your job fails.
  /// Therefore, in most cases, it's advised to omit
  /// <code>MediaSampleRateHertz</code> and let Amazon Transcribe Medical
  /// determine the sample rate.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The KMS key you want to use to encrypt your medical transcription output.
  ///
  /// If using a key located in the <b>current</b> Amazon Web Services account,
  /// you can specify your KMS key in one of four ways:
  /// <ol>
  /// <li>
  /// Use the KMS key ID itself. For example,
  /// <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use an alias for the KMS key ID. For example,
  /// <code>alias/ExampleAlias</code>.
  /// </li>
  /// <li>
  /// Use the Amazon Resource Name (ARN) for the KMS key ID. For example,
  /// <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use the ARN for the KMS key alias. For example,
  /// <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.
  /// </li> </ol>
  /// If using a key located in a <b>different</b> Amazon Web Services account
  /// than the current Amazon Web Services account, you can specify your KMS key
  /// in one of two ways:
  /// <ol>
  /// <li>
  /// Use the ARN for the KMS key ID. For example,
  /// <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use the ARN for the KMS key alias. For example,
  /// <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.
  /// </li> </ol>
  /// If you do not specify an encryption key, your output is encrypted with the
  /// default Amazon S3 key (SSE-S3).
  ///
  /// If you specify a KMS key to encrypt your output, you must also specify an
  /// output location using the <code>OutputLocation</code> parameter.
  ///
  /// Note that the role making the request must have permission to use the
  /// specified KMS key.
  ///
  /// Parameter [outputKey] :
  /// Use in combination with <code>OutputBucketName</code> to specify the
  /// output location of your transcript and, optionally, a unique name for your
  /// output file. The default name for your transcription output is the same as
  /// the name you specified for your medical transcription job
  /// (<code>MedicalTranscriptionJobName</code>).
  ///
  /// Here are some examples of how you can use <code>OutputKey</code>:
  ///
  /// <ul>
  /// <li>
  /// If you specify 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code>
  /// and 'my-transcript.json' as the <code>OutputKey</code>, your transcription
  /// output path is <code>s3://DOC-EXAMPLE-BUCKET/my-transcript.json</code>.
  /// </li>
  /// <li>
  /// If you specify 'my-first-transcription' as the
  /// <code>MedicalTranscriptionJobName</code>, 'DOC-EXAMPLE-BUCKET' as the
  /// <code>OutputBucketName</code>, and 'my-transcript' as the
  /// <code>OutputKey</code>, your transcription output path is
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json</code>.
  /// </li>
  /// <li>
  /// If you specify 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code>
  /// and 'test-files/my-transcript.json' as the <code>OutputKey</code>, your
  /// transcription output path is
  /// <code>s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json</code>.
  /// </li>
  /// <li>
  /// If you specify 'my-first-transcription' as the
  /// <code>MedicalTranscriptionJobName</code>, 'DOC-EXAMPLE-BUCKET' as the
  /// <code>OutputBucketName</code>, and 'test-files/my-transcript' as the
  /// <code>OutputKey</code>, your transcription output path is
  /// <code>s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json</code>.
  /// </li>
  /// </ul>
  /// If you specify the name of an Amazon S3 bucket sub-folder that doesn't
  /// exist, one is created for you.
  ///
  /// Parameter [settings] :
  /// Specify additional optional settings in your request, including channel
  /// identification, alternative transcriptions, and speaker partitioning. You
  /// can use that to apply custom vocabularies to your transcription job.
  ///
  /// Parameter [tags] :
  /// Adds one or more custom tags, each in the form of a key:value pair, to a
  /// new medical transcription job at the time you start this new job.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
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
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      16000,
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

  /// Transcribes the audio from a media file and applies any additional Request
  /// Parameters you choose to include in your request.
  ///
  /// To make a <code>StartTranscriptionJob</code> request, you must first
  /// upload your media file into an Amazon S3 bucket; you can then specify the
  /// Amazon S3 location of the file using the <code>Media</code> parameter.
  ///
  /// You must include the following parameters in your
  /// <code>StartTranscriptionJob</code> request:
  ///
  /// <ul>
  /// <li>
  /// <code>region</code>: The Amazon Web Services Region where you are making
  /// your request. For a list of Amazon Web Services Regions supported with
  /// Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html">Amazon
  /// Transcribe endpoints and quotas</a>.
  /// </li>
  /// <li>
  /// <code>TranscriptionJobName</code>: A custom name you create for your
  /// transcription job that is unique within your Amazon Web Services account.
  /// </li>
  /// <li>
  /// <code>Media</code> (<code>MediaFileUri</code>): The Amazon S3 location of
  /// your media file.
  /// </li>
  /// <li>
  /// One of <code>LanguageCode</code>, <code>IdentifyLanguage</code>, or
  /// <code>IdentifyMultipleLanguages</code>: If you know the language of your
  /// media file, specify it using the <code>LanguageCode</code> parameter; you
  /// can find all valid language codes in the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table. If you do not know the languages spoken in your
  /// media, use either <code>IdentifyLanguage</code> or
  /// <code>IdentifyMultipleLanguages</code> and let Amazon Transcribe identify
  /// the languages for you.
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [ConflictException].
  ///
  /// Parameter [media] :
  /// Describes the Amazon S3 location of the media file you want to use in your
  /// request.
  ///
  /// Parameter [transcriptionJobName] :
  /// A unique name, chosen by you, for your transcription job. The name that
  /// you specify is also used as the default name of your transcription output
  /// file. If you want to specify a different name for your transcription
  /// output, use the <code>OutputKey</code> parameter.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account. If you try to create a new job with
  /// the same name as an existing job, you get a <code>ConflictException</code>
  /// error.
  ///
  /// Parameter [contentRedaction] :
  /// Makes it possible to redact or flag specified personally identifiable
  /// information (PII) in your transcript. If you use
  /// <code>ContentRedaction</code>, you must also include the sub-parameters:
  /// <code>RedactionOutput</code> and <code>RedactionType</code>. You can
  /// optionally include <code>PiiEntityTypes</code> to choose which types of
  /// PII you want to redact. If you do not include <code>PiiEntityTypes</code>
  /// in your request, all PII is redacted.
  ///
  /// Parameter [identifyLanguage] :
  /// Enables automatic language identification in your transcription job
  /// request. Use this parameter if your media file contains only one language.
  /// If your media contains multiple languages, use
  /// <code>IdentifyMultipleLanguages</code> instead.
  ///
  /// If you include <code>IdentifyLanguage</code>, you can optionally include a
  /// list of language codes, using <code>LanguageOptions</code>, that you think
  /// may be present in your media file. Including <code>LanguageOptions</code>
  /// restricts <code>IdentifyLanguage</code> to only the language options that
  /// you specify, which can improve transcription accuracy.
  ///
  /// If you want to apply a custom language model, a custom vocabulary, or a
  /// custom vocabulary filter to your automatic language identification
  /// request, include <code>LanguageIdSettings</code> with the relevant
  /// sub-parameters (<code>VocabularyName</code>,
  /// <code>LanguageModelName</code>, and <code>VocabularyFilterName</code>). If
  /// you include <code>LanguageIdSettings</code>, also include
  /// <code>LanguageOptions</code>.
  ///
  /// Note that you must include one of <code>LanguageCode</code>,
  /// <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code>
  /// in your request. If you include more than one of these parameters, your
  /// transcription job fails.
  ///
  /// Parameter [identifyMultipleLanguages] :
  /// Enables automatic multi-language identification in your transcription job
  /// request. Use this parameter if your media file contains more than one
  /// language. If your media contains only one language, use
  /// <code>IdentifyLanguage</code> instead.
  ///
  /// If you include <code>IdentifyMultipleLanguages</code>, you can optionally
  /// include a list of language codes, using <code>LanguageOptions</code>, that
  /// you think may be present in your media file. Including
  /// <code>LanguageOptions</code> restricts <code>IdentifyLanguage</code> to
  /// only the language options that you specify, which can improve
  /// transcription accuracy.
  ///
  /// If you want to apply a custom vocabulary or a custom vocabulary filter to
  /// your automatic language identification request, include
  /// <code>LanguageIdSettings</code> with the relevant sub-parameters
  /// (<code>VocabularyName</code> and <code>VocabularyFilterName</code>). If
  /// you include <code>LanguageIdSettings</code>, also include
  /// <code>LanguageOptions</code>.
  ///
  /// Note that you must include one of <code>LanguageCode</code>,
  /// <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code>
  /// in your request. If you include more than one of these parameters, your
  /// transcription job fails.
  ///
  /// Parameter [jobExecutionSettings] :
  /// Makes it possible to control how your transcription job is processed.
  /// Currently, the only <code>JobExecutionSettings</code> modification you can
  /// choose is enabling job queueing using the
  /// <code>AllowDeferredExecution</code> sub-parameter.
  ///
  /// If you include <code>JobExecutionSettings</code> in your request, you must
  /// also include the sub-parameters: <code>AllowDeferredExecution</code> and
  /// <code>DataAccessRoleArn</code>.
  ///
  /// Parameter [kMSEncryptionContext] :
  /// A map of plain text, non-secret key:value pairs, known as encryption
  /// context pairs, that provide an added layer of security for your data. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context">KMS
  /// encryption context</a> and <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html">Asymmetric
  /// keys in KMS</a>.
  ///
  /// Parameter [languageCode] :
  /// The language code that represents the language spoken in the input media
  /// file.
  ///
  /// If you're unsure of the language spoken in your media file, consider using
  /// <code>IdentifyLanguage</code> or <code>IdentifyMultipleLanguages</code> to
  /// enable automatic language identification.
  ///
  /// Note that you must include one of <code>LanguageCode</code>,
  /// <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code>
  /// in your request. If you include more than one of these parameters, your
  /// transcription job fails.
  ///
  /// For a list of supported languages and their associated language codes,
  /// refer to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  /// <note>
  /// To transcribe speech in Modern Standard Arabic (<code>ar-SA</code>), your
  /// media file must be encoded at a sample rate of 16,000 Hz or higher.
  /// </note>
  ///
  /// Parameter [languageIdSettings] :
  /// If using automatic language identification in your request and you want to
  /// apply a custom language model, a custom vocabulary, or a custom vocabulary
  /// filter, include <code>LanguageIdSettings</code> with the relevant
  /// sub-parameters (<code>VocabularyName</code>,
  /// <code>LanguageModelName</code>, and <code>VocabularyFilterName</code>).
  /// Note that multi-language identification
  /// (<code>IdentifyMultipleLanguages</code>) doesn't support custom language
  /// models.
  ///
  /// <code>LanguageIdSettings</code> supports two to five language codes. Each
  /// language code you include can have an associated custom language model,
  /// custom vocabulary, and custom vocabulary filter. The language codes that
  /// you specify must match the languages of the associated custom language
  /// models, custom vocabularies, and custom vocabulary filters.
  ///
  /// It's recommended that you include <code>LanguageOptions</code> when using
  /// <code>LanguageIdSettings</code> to ensure that the correct language
  /// dialect is identified. For example, if you specify a custom vocabulary
  /// that is in <code>en-US</code> but Amazon Transcribe determines that the
  /// language spoken in your media is <code>en-AU</code>, your custom
  /// vocabulary <i>is not</i> applied to your transcription. If you include
  /// <code>LanguageOptions</code> and include <code>en-US</code> as the only
  /// English language dialect, your custom vocabulary <i>is</i> applied to your
  /// transcription.
  ///
  /// If you want to include a custom language model with your request but <b>do
  /// not</b> want to use automatic language identification, use instead the
  /// <code/> parameter with the <code>LanguageModelName</code> sub-parameter.
  /// If you want to include a custom vocabulary or a custom vocabulary filter
  /// (or both) with your request but <b>do not</b> want to use automatic
  /// language identification, use instead the <code/> parameter with the
  /// <code>VocabularyName</code> or <code>VocabularyFilterName</code> (or both)
  /// sub-parameter.
  ///
  /// Parameter [languageOptions] :
  /// You can specify two or more language codes that represent the languages
  /// you think may be present in your media. Including more than five is not
  /// recommended. If you're unsure what languages are present, do not include
  /// this parameter.
  ///
  /// If you include <code>LanguageOptions</code> in your request, you must also
  /// include <code>IdentifyLanguage</code>.
  ///
  /// For more information, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a>.
  ///
  /// To transcribe speech in Modern Standard Arabic (<code>ar-SA</code>), your
  /// media file must be encoded at a sample rate of 16,000 Hz or higher.
  ///
  /// Parameter [mediaFormat] :
  /// Specify the format of your input media file.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate, in hertz, of the audio track in your input media file.
  ///
  /// If you do not specify the media sample rate, Amazon Transcribe determines
  /// it for you. If you specify the sample rate, it must match the rate
  /// detected by Amazon Transcribe. If there's a mismatch between the value
  /// that you specify and the value detected, your job fails. In most cases,
  /// you can omit <code>MediaSampleRateHertz</code> and let Amazon Transcribe
  /// determine the sample rate.
  ///
  /// Parameter [modelSettings] :
  /// Specify the custom language model you want to include with your
  /// transcription job. If you include <code>ModelSettings</code> in your
  /// request, you must include the <code>LanguageModelName</code>
  /// sub-parameter.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html">Custom
  /// language models</a>.
  ///
  /// Parameter [outputBucketName] :
  /// The name of the Amazon S3 bucket where you want your transcription output
  /// stored. Do not include the <code>S3://</code> prefix of the specified
  /// bucket.
  ///
  /// If you want your output to go to a sub-folder of this bucket, specify it
  /// using the <code>OutputKey</code> parameter; <code>OutputBucketName</code>
  /// only accepts the name of a bucket.
  ///
  /// For example, if you want your output stored in
  /// <code>S3://DOC-EXAMPLE-BUCKET</code>, set <code>OutputBucketName</code> to
  /// <code>DOC-EXAMPLE-BUCKET</code>. However, if you want your output stored
  /// in <code>S3://DOC-EXAMPLE-BUCKET/test-files/</code>, set
  /// <code>OutputBucketName</code> to <code>DOC-EXAMPLE-BUCKET</code> and
  /// <code>OutputKey</code> to <code>test-files/</code>.
  ///
  /// Note that Amazon Transcribe must have permission to use the specified
  /// location. You can change Amazon S3 permissions using the <a
  /// href="https://console.aws.amazon.com/s3">Amazon Web Services Management
  /// Console</a>. See also <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions
  /// Required for IAM User Roles</a>.
  ///
  /// If you do not specify <code>OutputBucketName</code>, your transcript is
  /// placed in a service-managed Amazon S3 bucket and you are provided with a
  /// URI to access your transcript.
  ///
  /// Parameter [outputEncryptionKMSKeyId] :
  /// The KMS key you want to use to encrypt your transcription output.
  ///
  /// If using a key located in the <b>current</b> Amazon Web Services account,
  /// you can specify your KMS key in one of four ways:
  /// <ol>
  /// <li>
  /// Use the KMS key ID itself. For example,
  /// <code>1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use an alias for the KMS key ID. For example,
  /// <code>alias/ExampleAlias</code>.
  /// </li>
  /// <li>
  /// Use the Amazon Resource Name (ARN) for the KMS key ID. For example,
  /// <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use the ARN for the KMS key alias. For example,
  /// <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.
  /// </li> </ol>
  /// If using a key located in a <b>different</b> Amazon Web Services account
  /// than the current Amazon Web Services account, you can specify your KMS key
  /// in one of two ways:
  /// <ol>
  /// <li>
  /// Use the ARN for the KMS key ID. For example,
  /// <code>arn:aws:kms:region:account-ID:key/1234abcd-12ab-34cd-56ef-1234567890ab</code>.
  /// </li>
  /// <li>
  /// Use the ARN for the KMS key alias. For example,
  /// <code>arn:aws:kms:region:account-ID:alias/ExampleAlias</code>.
  /// </li> </ol>
  /// If you do not specify an encryption key, your output is encrypted with the
  /// default Amazon S3 key (SSE-S3).
  ///
  /// If you specify a KMS key to encrypt your output, you must also specify an
  /// output location using the <code>OutputLocation</code> parameter.
  ///
  /// Note that the role making the request must have permission to use the
  /// specified KMS key.
  ///
  /// Parameter [outputKey] :
  /// Use in combination with <code>OutputBucketName</code> to specify the
  /// output location of your transcript and, optionally, a unique name for your
  /// output file. The default name for your transcription output is the same as
  /// the name you specified for your transcription job
  /// (<code>TranscriptionJobName</code>).
  ///
  /// Here are some examples of how you can use <code>OutputKey</code>:
  ///
  /// <ul>
  /// <li>
  /// If you specify 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code>
  /// and 'my-transcript.json' as the <code>OutputKey</code>, your transcription
  /// output path is <code>s3://DOC-EXAMPLE-BUCKET/my-transcript.json</code>.
  /// </li>
  /// <li>
  /// If you specify 'my-first-transcription' as the
  /// <code>TranscriptionJobName</code>, 'DOC-EXAMPLE-BUCKET' as the
  /// <code>OutputBucketName</code>, and 'my-transcript' as the
  /// <code>OutputKey</code>, your transcription output path is
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-transcript/my-first-transcription.json</code>.
  /// </li>
  /// <li>
  /// If you specify 'DOC-EXAMPLE-BUCKET' as the <code>OutputBucketName</code>
  /// and 'test-files/my-transcript.json' as the <code>OutputKey</code>, your
  /// transcription output path is
  /// <code>s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript.json</code>.
  /// </li>
  /// <li>
  /// If you specify 'my-first-transcription' as the
  /// <code>TranscriptionJobName</code>, 'DOC-EXAMPLE-BUCKET' as the
  /// <code>OutputBucketName</code>, and 'test-files/my-transcript' as the
  /// <code>OutputKey</code>, your transcription output path is
  /// <code>s3://DOC-EXAMPLE-BUCKET/test-files/my-transcript/my-first-transcription.json</code>.
  /// </li>
  /// </ul>
  /// If you specify the name of an Amazon S3 bucket sub-folder that doesn't
  /// exist, one is created for you.
  ///
  /// Parameter [settings] :
  /// Specify additional optional settings in your request, including channel
  /// identification, alternative transcriptions, speaker partitioning. You can
  /// use that to apply custom vocabularies and vocabulary filters.
  ///
  /// If you want to include a custom vocabulary or a custom vocabulary filter
  /// (or both) with your request but <b>do not</b> want to use automatic
  /// language identification, use <code>Settings</code> with the
  /// <code>VocabularyName</code> or <code>VocabularyFilterName</code> (or both)
  /// sub-parameter.
  ///
  /// If you're using automatic language identification with your request and
  /// want to include a custom language model, a custom vocabulary, or a custom
  /// vocabulary filter, use instead the <code/> parameter with the
  /// <code>LanguageModelName</code>, <code>VocabularyName</code> or
  /// <code>VocabularyFilterName</code> sub-parameters.
  ///
  /// Parameter [subtitles] :
  /// Produces subtitle files for your input media. You can specify WebVTT
  /// (*.vtt) and SubRip (*.srt) formats.
  ///
  /// Parameter [tags] :
  /// Adds one or more custom tags, each in the form of a key:value pair, to a
  /// new transcription job at the time you start this new job.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  ///
  /// Parameter [toxicityDetection] :
  /// Enables toxic speech detection in your transcript. If you include
  /// <code>ToxicityDetection</code> in your request, you must also include
  /// <code>ToxicityCategories</code>.
  ///
  /// For information on the types of toxic speech Amazon Transcribe can detect,
  /// see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/toxic-language.html">Detecting
  /// toxic speech</a>.
  Future<StartTranscriptionJobResponse> startTranscriptionJob({
    required Media media,
    required String transcriptionJobName,
    ContentRedaction? contentRedaction,
    bool? identifyLanguage,
    bool? identifyMultipleLanguages,
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
    List<ToxicityDetectionSettings>? toxicityDetection,
  }) async {
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
        if (identifyMultipleLanguages != null)
          'IdentifyMultipleLanguages': identifyMultipleLanguages,
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
        if (toxicityDetection != null) 'ToxicityDetection': toxicityDetection,
      },
    );

    return StartTranscriptionJobResponse.fromJson(jsonResponse.body);
  }

  /// Adds one or more custom tags, each in the form of a key:value pair, to the
  /// specified resource.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [NotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource you want to tag. ARNs have
  /// the format
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.
  ///
  /// For example,
  /// <code>arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name</code>.
  ///
  /// Valid values for <code>resource-type</code> are:
  /// <code>transcription-job</code>, <code>medical-transcription-job</code>,
  /// <code>vocabulary</code>, <code>medical-vocabulary</code>,
  /// <code>vocabulary-filter</code>, and <code>language-model</code>.
  ///
  /// Parameter [tags] :
  /// Adds one or more custom tags, each in the form of a key:value pair, to the
  /// specified resource.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  Future<void> tagResource({
    required String resourceArn,
    required List<Tag> tags,
  }) async {
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

  /// Removes the specified tags from the specified Amazon Transcribe resource.
  ///
  /// If you include <code>UntagResource</code> in your request, you must also
  /// include <code>ResourceArn</code> and <code>TagKeys</code>.
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
  /// <code>arn:partition:service:region:account-id:resource-type/resource-id</code>.
  ///
  /// For example,
  /// <code>arn:aws:transcribe:us-west-2:111122223333:transcription-job/transcription-job-name</code>.
  ///
  /// Valid values for <code>resource-type</code> are:
  /// <code>transcription-job</code>, <code>medical-transcription-job</code>,
  /// <code>vocabulary</code>, <code>medical-vocabulary</code>,
  /// <code>vocabulary-filter</code>, and <code>language-model</code>.
  ///
  /// Parameter [tagKeys] :
  /// Removes the specified tag keys from the specified Amazon Transcribe
  /// resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
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

  /// Updates the specified Call Analytics category with new rules. Note that
  /// the <code>UpdateCallAnalyticsCategory</code> operation overwrites all
  /// existing rules contained in the specified category. You cannot append
  /// additional rules onto an existing category.
  ///
  /// To create a new category, see .
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [categoryName] :
  /// The name of the Call Analytics category you want to update. Category names
  /// are case sensitive.
  ///
  /// Parameter [rules] :
  /// The rules used for the updated Call Analytics category. The rules you
  /// provide in this field replace the ones that are currently being used in
  /// the specified category.
  ///
  /// Parameter [inputType] :
  /// Choose whether you want to update a real-time or a post-call category. The
  /// input type you specify must match the input type specified when the
  /// category was created. For example, if you created a category with the
  /// <code>POST_CALL</code> input type, you must use <code>POST_CALL</code> as
  /// the input type when updating this category.
  Future<UpdateCallAnalyticsCategoryResponse> updateCallAnalyticsCategory({
    required String categoryName,
    required List<Rule> rules,
    InputType? inputType,
  }) async {
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
        if (inputType != null) 'InputType': inputType.toValue(),
      },
    );

    return UpdateCallAnalyticsCategoryResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing custom medical vocabulary with new values. This
  /// operation overwrites all existing information with your new values; you
  /// cannot append new terms onto an existing custom vocabulary.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code that represents the language of the entries in the
  /// custom vocabulary you want to update. US English (<code>en-US</code>) is
  /// the only language supported with Amazon Transcribe Medical.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The Amazon S3 location of the text file that contains your custom medical
  /// vocabulary. The URI must be located in the same Amazon Web Services Region
  /// as the resource you're calling.
  ///
  /// Here's an example URI path:
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt</code>
  ///
  /// Parameter [vocabularyName] :
  /// The name of the custom medical vocabulary you want to update. Custom
  /// medical vocabulary names are case sensitive.
  Future<UpdateMedicalVocabularyResponse> updateMedicalVocabulary({
    required LanguageCode languageCode,
    required String vocabularyFileUri,
    required String vocabularyName,
  }) async {
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
        'VocabularyFileUri': vocabularyFileUri,
        'VocabularyName': vocabularyName,
      },
    );

    return UpdateMedicalVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing custom vocabulary with new values. This operation
  /// overwrites all existing information with your new values; you cannot
  /// append new terms onto an existing custom vocabulary.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [languageCode] :
  /// The language code that represents the language of the entries in the
  /// custom vocabulary you want to update. Each custom vocabulary must contain
  /// terms in only one language.
  ///
  /// A custom vocabulary can only be used to transcribe files in the same
  /// language as the custom vocabulary. For example, if you create a custom
  /// vocabulary using US English (<code>en-US</code>), you can only apply this
  /// custom vocabulary to files that contain English audio.
  ///
  /// For a list of supported languages and their associated language codes,
  /// refer to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  ///
  /// Parameter [vocabularyName] :
  /// The name of the custom vocabulary you want to update. Custom vocabulary
  /// names are case sensitive.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to
  /// access the Amazon S3 bucket that contains your input files (in this case,
  /// your custom vocabulary). If the role that you specify doesn’t have the
  /// appropriate permissions to access the specified Amazon S3 location, your
  /// request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  ///
  /// Parameter [phrases] :
  /// Use this parameter if you want to update your custom vocabulary by
  /// including all desired terms, as comma-separated values, within your
  /// request. The other option for updating your custom vocabulary is to save
  /// your entries in a text file and upload them to an Amazon S3 bucket, then
  /// specify the location of your file using the <code>VocabularyFileUri</code>
  /// parameter.
  ///
  /// Note that if you include <code>Phrases</code> in your request, you cannot
  /// use <code>VocabularyFileUri</code>; you must choose one or the other.
  ///
  /// Each language has a character set that contains all allowed characters for
  /// that specific language. If you use unsupported characters, your custom
  /// vocabulary filter request fails. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character
  /// Sets for Custom Vocabularies</a> to get the character set for your
  /// language.
  ///
  /// Parameter [vocabularyFileUri] :
  /// The Amazon S3 location of the text file that contains your custom
  /// vocabulary. The URI must be located in the same Amazon Web Services Region
  /// as the resource you're calling.
  ///
  /// Here's an example URI path:
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-file.txt</code>
  ///
  /// Note that if you include <code>VocabularyFileUri</code> in your request,
  /// you cannot use the <code>Phrases</code> flag; you must choose one or the
  /// other.
  Future<UpdateVocabularyResponse> updateVocabulary({
    required LanguageCode languageCode,
    required String vocabularyName,
    String? dataAccessRoleArn,
    List<String>? phrases,
    String? vocabularyFileUri,
  }) async {
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
        if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
        if (phrases != null) 'Phrases': phrases,
        if (vocabularyFileUri != null) 'VocabularyFileUri': vocabularyFileUri,
      },
    );

    return UpdateVocabularyResponse.fromJson(jsonResponse.body);
  }

  /// Updates an existing custom vocabulary filter with a new list of words. The
  /// new list you provide overwrites all previous entries; you cannot append
  /// new terms onto an existing custom vocabulary filter.
  ///
  /// May throw [BadRequestException].
  /// May throw [LimitExceededException].
  /// May throw [InternalFailureException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [vocabularyFilterName] :
  /// The name of the custom vocabulary filter you want to update. Custom
  /// vocabulary filter names are case sensitive.
  ///
  /// Parameter [dataAccessRoleArn] :
  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to
  /// access the Amazon S3 bucket that contains your input files (in this case,
  /// your custom vocabulary filter). If the role that you specify doesn’t have
  /// the appropriate permissions to access the specified Amazon S3 location,
  /// your request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  ///
  /// Parameter [vocabularyFilterFileUri] :
  /// The Amazon S3 location of the text file that contains your custom
  /// vocabulary filter terms. The URI must be located in the same Amazon Web
  /// Services Region as the resource you're calling.
  ///
  /// Here's an example URI path:
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-vocab-filter-file.txt</code>
  ///
  /// Note that if you include <code>VocabularyFilterFileUri</code> in your
  /// request, you cannot use <code>Words</code>; you must choose one or the
  /// other.
  ///
  /// Parameter [words] :
  /// Use this parameter if you want to update your custom vocabulary filter by
  /// including all desired terms, as comma-separated values, within your
  /// request. The other option for updating your vocabulary filter is to save
  /// your entries in a text file and upload them to an Amazon S3 bucket, then
  /// specify the location of your file using the
  /// <code>VocabularyFilterFileUri</code> parameter.
  ///
  /// Note that if you include <code>Words</code> in your request, you cannot
  /// use <code>VocabularyFilterFileUri</code>; you must choose one or the
  /// other.
  ///
  /// Each language has a character set that contains all allowed characters for
  /// that specific language. If you use unsupported characters, your custom
  /// vocabulary filter request fails. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/charsets.html">Character
  /// Sets for Custom Vocabularies</a> to get the character set for your
  /// language.
  Future<UpdateVocabularyFilterResponse> updateVocabularyFilter({
    required String vocabularyFilterName,
    String? dataAccessRoleArn,
    String? vocabularyFilterFileUri,
    List<String>? words,
  }) async {
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
        if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
        if (vocabularyFilterFileUri != null)
          'VocabularyFilterFileUri': vocabularyFilterFileUri,
        if (words != null) 'Words': words,
      },
    );

    return UpdateVocabularyFilterResponse.fromJson(jsonResponse.body);
  }
}

/// A time range, in milliseconds, between two points in your media file.
///
/// You can use <code>StartTime</code> and <code>EndTime</code> to search a
/// custom segment. For example, setting <code>StartTime</code> to 10000 and
/// <code>EndTime</code> to 50000 only searches for your specified criteria in
/// the audio contained between the 10,000 millisecond mark and the 50,000
/// millisecond mark of your media file. You must use <code>StartTime</code> and
/// <code>EndTime</code> as a set; that is, if you include one, you must include
/// both.
///
/// You can use also <code>First</code> to search from the start of the audio
/// until the time that you specify, or <code>Last</code> to search from the
/// time that you specify until the end of the audio. For example, setting
/// <code>First</code> to 50000 only searches for your specified criteria in the
/// audio contained between the start of the media file to the 50,000
/// millisecond mark. You can use <code>First</code> and <code>Last</code>
/// independently of each other.
///
/// If you prefer to use percentage instead of milliseconds, see .
class AbsoluteTimeRange {
  /// The time, in milliseconds, when Amazon Transcribe stops searching for the
  /// specified criteria in your audio. If you include <code>EndTime</code> in
  /// your request, you must also include <code>StartTime</code>.
  final int? endTime;

  /// The time, in milliseconds, from the start of your media file until the
  /// specified value. Amazon Transcribe searches for your specified criteria in
  /// this time segment.
  final int? first;

  /// The time, in milliseconds, from the specified value until the end of your
  /// media file. Amazon Transcribe searches for your specified criteria in this
  /// time segment.
  final int? last;

  /// The time, in milliseconds, when Amazon Transcribe starts searching for the
  /// specified criteria in your audio. If you include <code>StartTime</code> in
  /// your request, you must also include <code>EndTime</code>.
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

extension BaseModelNameValueExtension on BaseModelName {
  String toValue() {
    switch (this) {
      case BaseModelName.narrowBand:
        return 'NarrowBand';
      case BaseModelName.wideBand:
        return 'WideBand';
    }
  }
}

extension BaseModelNameFromString on String {
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
  deDe,
  jaJp,
}

extension CLMLanguageCodeValueExtension on CLMLanguageCode {
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
      case CLMLanguageCode.deDe:
        return 'de-DE';
      case CLMLanguageCode.jaJp:
        return 'ja-JP';
    }
  }
}

extension CLMLanguageCodeFromString on String {
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
      case 'de-DE':
        return CLMLanguageCode.deDe;
      case 'ja-JP':
        return CLMLanguageCode.jaJp;
    }
    throw Exception('$this is not known in enum CLMLanguageCode');
  }
}

enum CallAnalyticsFeature {
  generativeSummarization,
}

extension CallAnalyticsFeatureValueExtension on CallAnalyticsFeature {
  String toValue() {
    switch (this) {
      case CallAnalyticsFeature.generativeSummarization:
        return 'GENERATIVE_SUMMARIZATION';
    }
  }
}

extension CallAnalyticsFeatureFromString on String {
  CallAnalyticsFeature toCallAnalyticsFeature() {
    switch (this) {
      case 'GENERATIVE_SUMMARIZATION':
        return CallAnalyticsFeature.generativeSummarization;
    }
    throw Exception('$this is not known in enum CallAnalyticsFeature');
  }
}

/// Provides detailed information about a Call Analytics job.
///
/// To view the job's status, refer to <code>CallAnalyticsJobStatus</code>. If
/// the status is <code>COMPLETED</code>, the job is finished. You can find your
/// completed transcript at the URI specified in <code>TranscriptFileUri</code>.
/// If the status is <code>FAILED</code>, <code>FailureReason</code> provides
/// details on why your transcription job failed.
///
/// If you enabled personally identifiable information (PII) redaction, the
/// redacted transcript appears at the location specified in
/// <code>RedactedTranscriptFileUri</code>.
///
/// If you chose to redact the audio in your media file, you can find your
/// redacted media file at the location specified in the
/// <code>RedactedMediaFileUri</code> field of your response.
class CallAnalyticsJob {
  /// Provides detailed information about a call analytics job, including
  /// information about skipped analytics features.
  final CallAnalyticsJobDetails? callAnalyticsJobDetails;

  /// The name of the Call Analytics job. Job names are case sensitive and must be
  /// unique within an Amazon Web Services account.
  final String? callAnalyticsJobName;

  /// Provides the status of the specified Call Analytics job.
  ///
  /// If the status is <code>COMPLETED</code>, the job is finished and you can
  /// find the results at the location specified in <code>TranscriptFileUri</code>
  /// (or <code>RedactedTranscriptFileUri</code>, if you requested transcript
  /// redaction). If the status is <code>FAILED</code>, <code>FailureReason</code>
  /// provides details on why your transcription job failed.
  final CallAnalyticsJobStatus? callAnalyticsJobStatus;

  /// Indicates which speaker is on which channel.
  final List<ChannelDefinition>? channelDefinitions;

  /// The date and time the specified Call Analytics job finished processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a
  /// transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
  final DateTime? completionTime;

  /// The date and time the specified Call Analytics job request was made.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) you included in your request.
  final String? dataAccessRoleArn;

  /// If <code>CallAnalyticsJobStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the Call Analytics
  /// job request failed.
  ///
  /// The <code>FailureReason</code> field contains one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Unsupported media format</code>.
  ///
  /// The media format specified in <code>MediaFormat</code> isn't valid. Refer to
  /// refer to the <code>MediaFormat</code> parameter for a list of supported
  /// formats.
  /// </li>
  /// <li>
  /// <code>The media format provided does not match the detected media
  /// format</code>.
  ///
  /// The media format specified in <code>MediaFormat</code> doesn't match the
  /// format of the input file. Check the media format of your media file and
  /// correct the specified value.
  /// </li>
  /// <li>
  /// <code>Invalid sample rate for audio file</code>.
  ///
  /// The sample rate specified in <code>MediaSampleRateHertz</code> isn't valid.
  /// The sample rate must be between 8,000 and 48,000 hertz.
  /// </li>
  /// <li>
  /// <code>The sample rate provided does not match the detected sample
  /// rate</code>.
  ///
  /// The sample rate specified in <code>MediaSampleRateHertz</code> doesn't match
  /// the sample rate detected in your input media file. Check the sample rate of
  /// your media file and correct the specified value.
  /// </li>
  /// <li>
  /// <code>Invalid file size: file size too large</code>.
  ///
  /// The size of your media file is larger than what Amazon Transcribe can
  /// process. For more information, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe">Service
  /// quotas</a>.
  /// </li>
  /// <li>
  /// <code>Invalid number of channels: number of channels too large</code>.
  ///
  /// Your audio contains more channels than Amazon Transcribe is able to process.
  /// For more information, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe">Service
  /// quotas</a>.
  /// </li>
  /// </ul>
  final String? failureReason;

  /// The confidence score associated with the language identified in your media
  /// file.
  ///
  /// Confidence scores are values between 0 and 1; a larger value indicates a
  /// higher probability that the identified language correctly matches the
  /// language spoken in your media.
  final double? identifiedLanguageScore;

  /// The language code used to create your Call Analytics job. For a list of
  /// supported languages and their associated language codes, refer to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  ///
  /// If you do not know the language spoken in your media file, you can omit this
  /// field and let Amazon Transcribe automatically identify the language of your
  /// media. To improve the accuracy of language identification, you can include
  /// several language codes and Amazon Transcribe chooses the closest match for
  /// your transcription.
  final LanguageCode? languageCode;

  /// Provides the Amazon S3 location of the media file you used in your Call
  /// Analytics request.
  final Media? media;

  /// The format of the input media file.
  final MediaFormat? mediaFormat;

  /// The sample rate, in hertz, of the audio track in your input media file.
  final int? mediaSampleRateHertz;

  /// Provides information on any additional settings that were included in your
  /// request. Additional settings include content redaction and language
  /// identification settings.
  final CallAnalyticsJobSettings? settings;

  /// The date and time the specified Call Analytics job began processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? startTime;
  final Transcript? transcript;

  CallAnalyticsJob({
    this.callAnalyticsJobDetails,
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
      callAnalyticsJobDetails: json['CallAnalyticsJobDetails'] != null
          ? CallAnalyticsJobDetails.fromJson(
              json['CallAnalyticsJobDetails'] as Map<String, dynamic>)
          : null,
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
    final callAnalyticsJobDetails = this.callAnalyticsJobDetails;
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
      if (callAnalyticsJobDetails != null)
        'CallAnalyticsJobDetails': callAnalyticsJobDetails,
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

/// Contains details about a call analytics job, including information about
/// skipped analytics features.
class CallAnalyticsJobDetails {
  /// Contains information about any skipped analytics features during the
  /// analysis of a call analytics job.
  ///
  /// This array lists all the analytics features that were skipped, along with
  /// their corresponding reason code and message.
  final List<CallAnalyticsSkippedFeature>? skipped;

  CallAnalyticsJobDetails({
    this.skipped,
  });

  factory CallAnalyticsJobDetails.fromJson(Map<String, dynamic> json) {
    return CallAnalyticsJobDetails(
      skipped: (json['Skipped'] as List?)
          ?.whereNotNull()
          .map((e) =>
              CallAnalyticsSkippedFeature.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final skipped = this.skipped;
    return {
      if (skipped != null) 'Skipped': skipped,
    };
  }
}

/// Provides additional optional settings for your request, including content
/// redaction, automatic language identification; allows you to apply custom
/// language models, custom vocabulary filters, and custom vocabularies.
class CallAnalyticsJobSettings {
  final ContentRedaction? contentRedaction;

  /// If using automatic language identification in your request and you want to
  /// apply a custom language model, a custom vocabulary, or a custom vocabulary
  /// filter, include <code>LanguageIdSettings</code> with the relevant
  /// sub-parameters (<code>VocabularyName</code>, <code>LanguageModelName</code>,
  /// and <code>VocabularyFilterName</code>).
  ///
  /// <code>LanguageIdSettings</code> supports two to five language codes. Each
  /// language code you include can have an associated custom language model,
  /// custom vocabulary, and custom vocabulary filter. The language codes that you
  /// specify must match the languages of the associated custom language models,
  /// custom vocabularies, and custom vocabulary filters.
  ///
  /// It's recommended that you include <code>LanguageOptions</code> when using
  /// <code>LanguageIdSettings</code> to ensure that the correct language dialect
  /// is identified. For example, if you specify a custom vocabulary that is in
  /// <code>en-US</code> but Amazon Transcribe determines that the language spoken
  /// in your media is <code>en-AU</code>, your custom vocabulary <i>is not</i>
  /// applied to your transcription. If you include <code>LanguageOptions</code>
  /// and include <code>en-US</code> as the only English language dialect, your
  /// custom vocabulary <i>is</i> applied to your transcription.
  ///
  /// If you want to include a custom language model, custom vocabulary, or custom
  /// vocabulary filter with your request but <b>do not</b> want to use automatic
  /// language identification, use instead the <code/> parameter with the
  /// <code>LanguageModelName</code>, <code>VocabularyName</code>, or
  /// <code>VocabularyFilterName</code> sub-parameters.
  ///
  /// For a list of languages supported with Call Analytics, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages and language-specific features</a>.
  final Map<LanguageCode, LanguageIdSettings>? languageIdSettings;

  /// The name of the custom language model you want to use when processing your
  /// Call Analytics job. Note that custom language model names are case
  /// sensitive.
  ///
  /// The language of the specified custom language model must match the language
  /// code that you specify in your transcription request. If the languages do not
  /// match, the custom language model isn't applied. There are no errors or
  /// warnings associated with a language mismatch.
  final String? languageModelName;

  /// You can specify two or more language codes that represent the languages you
  /// think may be present in your media. Including more than five is not
  /// recommended. If you're unsure what languages are present, do not include
  /// this parameter.
  ///
  /// Including language options can improve the accuracy of language
  /// identification.
  ///
  /// For a list of languages supported with Call Analytics, refer to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  ///
  /// To transcribe speech in Modern Standard Arabic (<code>ar-SA</code>), your
  /// media file must be encoded at a sample rate of 16,000 Hz or higher.
  final List<LanguageCode>? languageOptions;

  /// Contains <code>GenerateAbstractiveSummary</code>, which is a required
  /// parameter if you want to enable Generative call summarization in your Call
  /// Analytics request.
  final Summarization? summarization;

  /// Specify how you want your custom vocabulary filter applied to your
  /// transcript.
  ///
  /// To replace words with <code>***</code>, choose <code>mask</code>.
  ///
  /// To delete words, choose <code>remove</code>.
  ///
  /// To flag words without changing them, choose <code>tag</code>.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// The name of the custom vocabulary filter you want to include in your Call
  /// Analytics transcription request. Custom vocabulary filter names are case
  /// sensitive.
  ///
  /// Note that if you include <code>VocabularyFilterName</code> in your request,
  /// you must also include <code>VocabularyFilterMethod</code>.
  final String? vocabularyFilterName;

  /// The name of the custom vocabulary you want to include in your Call Analytics
  /// transcription request. Custom vocabulary names are case sensitive.
  final String? vocabularyName;

  CallAnalyticsJobSettings({
    this.contentRedaction,
    this.languageIdSettings,
    this.languageModelName,
    this.languageOptions,
    this.summarization,
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
      summarization: json['Summarization'] != null
          ? Summarization.fromJson(
              json['Summarization'] as Map<String, dynamic>)
          : null,
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
    final summarization = this.summarization;
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
      if (summarization != null) 'Summarization': summarization,
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

extension CallAnalyticsJobStatusValueExtension on CallAnalyticsJobStatus {
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

extension CallAnalyticsJobStatusFromString on String {
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

/// Provides detailed information about a specific Call Analytics job.
class CallAnalyticsJobSummary {
  /// Provides detailed information about a call analytics job, including
  /// information about skipped analytics features.
  final CallAnalyticsJobDetails? callAnalyticsJobDetails;

  /// The name of the Call Analytics job. Job names are case sensitive and must be
  /// unique within an Amazon Web Services account.
  final String? callAnalyticsJobName;

  /// Provides the status of your Call Analytics job.
  ///
  /// If the status is <code>COMPLETED</code>, the job is finished and you can
  /// find the results at the location specified in <code>TranscriptFileUri</code>
  /// (or <code>RedactedTranscriptFileUri</code>, if you requested transcript
  /// redaction). If the status is <code>FAILED</code>, <code>FailureReason</code>
  /// provides details on why your transcription job failed.
  final CallAnalyticsJobStatus? callAnalyticsJobStatus;

  /// The date and time the specified Call Analytics job finished processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a
  /// transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
  final DateTime? completionTime;

  /// The date and time the specified Call Analytics job request was made.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? creationTime;

  /// If <code>CallAnalyticsJobStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the Call Analytics
  /// job failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The language code used to create your Call Analytics transcription.
  final LanguageCode? languageCode;

  /// The date and time your Call Analytics job began processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? startTime;

  CallAnalyticsJobSummary({
    this.callAnalyticsJobDetails,
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
      callAnalyticsJobDetails: json['CallAnalyticsJobDetails'] != null
          ? CallAnalyticsJobDetails.fromJson(
              json['CallAnalyticsJobDetails'] as Map<String, dynamic>)
          : null,
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
    final callAnalyticsJobDetails = this.callAnalyticsJobDetails;
    final callAnalyticsJobName = this.callAnalyticsJobName;
    final callAnalyticsJobStatus = this.callAnalyticsJobStatus;
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final startTime = this.startTime;
    return {
      if (callAnalyticsJobDetails != null)
        'CallAnalyticsJobDetails': callAnalyticsJobDetails,
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

/// Represents a skipped analytics feature during the analysis of a call
/// analytics job.
///
/// The <code>Feature</code> field indicates the type of analytics feature that
/// was skipped.
///
/// The <code>Message</code> field contains additional information or a message
/// explaining why the analytics feature was skipped.
///
/// The <code>ReasonCode</code> field provides a code indicating the reason why
/// the analytics feature was skipped.
class CallAnalyticsSkippedFeature {
  /// Indicates the type of analytics feature that was skipped during the analysis
  /// of a call analytics job.
  final CallAnalyticsFeature? feature;

  /// Contains additional information or a message explaining why a specific
  /// analytics feature was skipped during the analysis of a call analytics job.
  final String? message;

  /// Provides a code indicating the reason why a specific analytics feature was
  /// skipped during the analysis of a call analytics job.
  final CallAnalyticsSkippedReasonCode? reasonCode;

  CallAnalyticsSkippedFeature({
    this.feature,
    this.message,
    this.reasonCode,
  });

  factory CallAnalyticsSkippedFeature.fromJson(Map<String, dynamic> json) {
    return CallAnalyticsSkippedFeature(
      feature: (json['Feature'] as String?)?.toCallAnalyticsFeature(),
      message: json['Message'] as String?,
      reasonCode:
          (json['ReasonCode'] as String?)?.toCallAnalyticsSkippedReasonCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final feature = this.feature;
    final message = this.message;
    final reasonCode = this.reasonCode;
    return {
      if (feature != null) 'Feature': feature.toValue(),
      if (message != null) 'Message': message,
      if (reasonCode != null) 'ReasonCode': reasonCode.toValue(),
    };
  }
}

enum CallAnalyticsSkippedReasonCode {
  insufficientConversationContent,
  failedSafetyGuidelines,
}

extension CallAnalyticsSkippedReasonCodeValueExtension
    on CallAnalyticsSkippedReasonCode {
  String toValue() {
    switch (this) {
      case CallAnalyticsSkippedReasonCode.insufficientConversationContent:
        return 'INSUFFICIENT_CONVERSATION_CONTENT';
      case CallAnalyticsSkippedReasonCode.failedSafetyGuidelines:
        return 'FAILED_SAFETY_GUIDELINES';
    }
  }
}

extension CallAnalyticsSkippedReasonCodeFromString on String {
  CallAnalyticsSkippedReasonCode toCallAnalyticsSkippedReasonCode() {
    switch (this) {
      case 'INSUFFICIENT_CONVERSATION_CONTENT':
        return CallAnalyticsSkippedReasonCode.insufficientConversationContent;
      case 'FAILED_SAFETY_GUIDELINES':
        return CallAnalyticsSkippedReasonCode.failedSafetyGuidelines;
    }
    throw Exception(
        '$this is not known in enum CallAnalyticsSkippedReasonCode');
  }
}

/// Provides you with the properties of the Call Analytics category you
/// specified in your request. This includes the list of rules that define the
/// specified category.
class CategoryProperties {
  /// The name of the Call Analytics category. Category names are case sensitive
  /// and must be unique within an Amazon Web Services account.
  final String? categoryName;

  /// The date and time the specified Call Analytics category was created.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? createTime;

  /// The input type associated with the specified category.
  /// <code>POST_CALL</code> refers to a category that is applied to batch
  /// transcriptions; <code>REAL_TIME</code> refers to a category that is applied
  /// to streaming transcriptions.
  final InputType? inputType;

  /// The date and time the specified Call Analytics category was last updated.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-05T12:45:32.691000-07:00</code> represents 12:45
  /// PM UTC-7 on May 5, 2022.
  final DateTime? lastUpdateTime;

  /// The rules used to define a Call Analytics category. Each category can have
  /// between 1 and 20 rules.
  final List<Rule>? rules;

  CategoryProperties({
    this.categoryName,
    this.createTime,
    this.inputType,
    this.lastUpdateTime,
    this.rules,
  });

  factory CategoryProperties.fromJson(Map<String, dynamic> json) {
    return CategoryProperties(
      categoryName: json['CategoryName'] as String?,
      createTime: timeStampFromJson(json['CreateTime']),
      inputType: (json['InputType'] as String?)?.toInputType(),
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
    final inputType = this.inputType;
    final lastUpdateTime = this.lastUpdateTime;
    final rules = this.rules;
    return {
      if (categoryName != null) 'CategoryName': categoryName,
      if (createTime != null) 'CreateTime': unixTimestampToJson(createTime),
      if (inputType != null) 'InputType': inputType.toValue(),
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (rules != null) 'Rules': rules,
    };
  }
}

/// Makes it possible to specify which speaker is on which channel. For example,
/// if your agent is the first participant to speak, you would set
/// <code>ChannelId</code> to <code>0</code> (to indicate the first channel) and
/// <code>ParticipantRole</code> to <code>AGENT</code> (to indicate that it's
/// the agent speaking).
class ChannelDefinition {
  /// Specify the audio channel you want to define.
  final int? channelId;

  /// Specify the speaker you want to define. Omitting this parameter is
  /// equivalent to specifying both participants.
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

/// Makes it possible to redact or flag specified personally identifiable
/// information (PII) in your transcript. If you use
/// <code>ContentRedaction</code>, you must also include the sub-parameters:
/// <code>RedactionOutput</code> and <code>RedactionType</code>. You can
/// optionally include <code>PiiEntityTypes</code> to choose which types of PII
/// you want to redact.
class ContentRedaction {
  /// Specify if you want only a redacted transcript, or if you want a redacted
  /// and an unredacted transcript.
  ///
  /// When you choose <code>redacted</code> Amazon Transcribe creates only a
  /// redacted transcript.
  ///
  /// When you choose <code>redacted_and_unredacted</code> Amazon Transcribe
  /// creates a redacted and an unredacted transcript (as two separate files).
  final RedactionOutput redactionOutput;

  /// Specify the category of information you want to redact; <code>PII</code>
  /// (personally identifiable information) is the only valid value. You can use
  /// <code>PiiEntityTypes</code> to choose which types of PII you want to redact.
  /// If you do not include <code>PiiEntityTypes</code> in your request, all PII
  /// is redacted.
  final RedactionType redactionType;

  /// Specify which types of personally identifiable information (PII) you want to
  /// redact in your transcript. You can include as many types as you'd like, or
  /// you can select <code>ALL</code>. If you do not include
  /// <code>PiiEntityTypes</code> in your request, all PII is redacted.
  final List<PiiEntityType>? piiEntityTypes;

  ContentRedaction({
    required this.redactionOutput,
    required this.redactionType,
    this.piiEntityTypes,
  });

  factory ContentRedaction.fromJson(Map<String, dynamic> json) {
    return ContentRedaction(
      redactionOutput: (json['RedactionOutput'] as String).toRedactionOutput(),
      redactionType: (json['RedactionType'] as String).toRedactionType(),
      piiEntityTypes: (json['PiiEntityTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPiiEntityType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final redactionOutput = this.redactionOutput;
    final redactionType = this.redactionType;
    final piiEntityTypes = this.piiEntityTypes;
    return {
      'RedactionOutput': redactionOutput.toValue(),
      'RedactionType': redactionType.toValue(),
      if (piiEntityTypes != null)
        'PiiEntityTypes': piiEntityTypes.map((e) => e.toValue()).toList(),
    };
  }
}

class CreateCallAnalyticsCategoryResponse {
  /// Provides you with the properties of your new category, including its
  /// associated rules.
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
  /// The Amazon Transcribe standard language model, or base model, you specified
  /// when creating your custom language model.
  final BaseModelName? baseModelName;

  /// Lists your data access role ARN (Amazon Resource Name) and the Amazon S3
  /// locations you provided for your training (<code>S3Uri</code>) and tuning
  /// (<code>TuningDataS3Uri</code>) data.
  final InputDataConfig? inputDataConfig;

  /// The language code you selected for your custom language model.
  final CLMLanguageCode? languageCode;

  /// The name of your custom language model.
  final String? modelName;

  /// The status of your custom language model. When the status displays as
  /// <code>COMPLETED</code>, your model is ready to use.
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
  /// If <code>VocabularyState</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the medical
  /// transcription job request failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The language code you selected for your custom medical vocabulary. US
  /// English (<code>en-US</code>) is the only language supported with Amazon
  /// Transcribe Medical.
  final LanguageCode? languageCode;

  /// The date and time you created your custom medical vocabulary.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name you chose for your custom medical vocabulary.
  final String? vocabularyName;

  /// The processing state of your custom medical vocabulary. If the state is
  /// <code>READY</code>, you can use the custom vocabulary in a
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
  /// The language code you selected for your custom vocabulary filter.
  final LanguageCode? languageCode;

  /// The date and time you created your custom vocabulary filter.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name you chose for your custom vocabulary filter.
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
  /// If <code>VocabularyState</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the custom
  /// vocabulary request failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The language code you selected for your custom vocabulary.
  final LanguageCode? languageCode;

  /// The date and time you created your custom vocabulary.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name you chose for your custom vocabulary.
  final String? vocabularyName;

  /// The processing state of your custom vocabulary. If the state is
  /// <code>READY</code>, you can use the custom vocabulary in a
  /// <code>StartTranscriptionJob</code> request.
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
  /// Provides information about the specified custom language model.
  ///
  /// This parameter also shows if the base language model you used to create your
  /// custom language model has been updated. If Amazon Transcribe has updated the
  /// base model, you can create a new custom language model using the updated
  /// base model.
  ///
  /// If you tried to create a new custom language model and the request wasn't
  /// successful, you can use this <code>DescribeLanguageModel</code> to help
  /// identify the reason for this failure.
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
  /// Provides you with the properties of the Call Analytics category you
  /// specified in your <code>GetCallAnalyticsCategory</code> request.
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
  /// Provides detailed information about the specified Call Analytics job,
  /// including job status and, if applicable, failure reason.
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

class GetMedicalScribeJobResponse {
  /// Provides detailed information about the specified Medical Scribe job,
  /// including job status and, if applicable, failure reason
  final MedicalScribeJob? medicalScribeJob;

  GetMedicalScribeJobResponse({
    this.medicalScribeJob,
  });

  factory GetMedicalScribeJobResponse.fromJson(Map<String, dynamic> json) {
    return GetMedicalScribeJobResponse(
      medicalScribeJob: json['MedicalScribeJob'] != null
          ? MedicalScribeJob.fromJson(
              json['MedicalScribeJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final medicalScribeJob = this.medicalScribeJob;
    return {
      if (medicalScribeJob != null) 'MedicalScribeJob': medicalScribeJob,
    };
  }
}

class GetMedicalTranscriptionJobResponse {
  /// Provides detailed information about the specified medical transcription job,
  /// including job status and, if applicable, failure reason.
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
  /// The Amazon S3 location where the specified custom medical vocabulary is
  /// stored; use this URI to view or download the custom vocabulary.
  final String? downloadUri;

  /// If <code>VocabularyState</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the custom medical
  /// vocabulary request failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The language code you selected for your custom medical vocabulary. US
  /// English (<code>en-US</code>) is the only language supported with Amazon
  /// Transcribe Medical.
  final LanguageCode? languageCode;

  /// The date and time the specified custom medical vocabulary was last modified.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name of the custom medical vocabulary you requested information about.
  final String? vocabularyName;

  /// The processing state of your custom medical vocabulary. If the state is
  /// <code>READY</code>, you can use the custom vocabulary in a
  /// <code>StartMedicalTranscriptionJob</code> request.
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
  /// Provides detailed information about the specified transcription job,
  /// including job status and, if applicable, failure reason.
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
  /// The Amazon S3 location where the custom vocabulary filter is stored; use
  /// this URI to view or download the custom vocabulary filter.
  final String? downloadUri;

  /// The language code you selected for your custom vocabulary filter.
  final LanguageCode? languageCode;

  /// The date and time the specified custom vocabulary filter was last modified.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name of the custom vocabulary filter you requested information about.
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
  /// The Amazon S3 location where the custom vocabulary is stored; use this URI
  /// to view or download the custom vocabulary.
  final String? downloadUri;

  /// If <code>VocabularyState</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the custom
  /// vocabulary request failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The language code you selected for your custom vocabulary.
  final LanguageCode? languageCode;

  /// The date and time the specified custom vocabulary was last modified.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name of the custom vocabulary you requested information about.
  final String? vocabularyName;

  /// The processing state of your custom vocabulary. If the state is
  /// <code>READY</code>, you can use the custom vocabulary in a
  /// <code>StartTranscriptionJob</code> request.
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

/// Contains the Amazon S3 location of the training data you want to use to
/// create a new custom language model, and permissions to access this location.
///
/// When using <code>InputDataConfig</code>, you must include these
/// sub-parameters: <code>S3Uri</code> and <code>DataAccessRoleArn</code>. You
/// can optionally include <code>TuningDataS3Uri</code>.
class InputDataConfig {
  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to access
  /// the Amazon S3 bucket that contains your input files. If the role that you
  /// specify doesn’t have the appropriate permissions to access the specified
  /// Amazon S3 location, your request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  final String dataAccessRoleArn;

  /// The Amazon S3 location (URI) of the text files you want to use to train your
  /// custom language model.
  ///
  /// Here's an example URI path:
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-model-training-data/</code>
  final String s3Uri;

  /// The Amazon S3 location (URI) of the text files you want to use to tune your
  /// custom language model.
  ///
  /// Here's an example URI path:
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-model-tuning-data/</code>
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

enum InputType {
  realTime,
  postCall,
}

extension InputTypeValueExtension on InputType {
  String toValue() {
    switch (this) {
      case InputType.realTime:
        return 'REAL_TIME';
      case InputType.postCall:
        return 'POST_CALL';
    }
  }
}

extension InputTypeFromString on String {
  InputType toInputType() {
    switch (this) {
      case 'REAL_TIME':
        return InputType.realTime;
      case 'POST_CALL':
        return InputType.postCall;
    }
    throw Exception('$this is not known in enum InputType');
  }
}

/// Flag the presence or absence of interruptions in your Call Analytics
/// transcription output.
///
/// Rules using <code>InterruptionFilter</code> are designed to match:
///
/// <ul>
/// <li>
/// Instances where an agent interrupts a customer
/// </li>
/// <li>
/// Instances where a customer interrupts an agent
/// </li>
/// <li>
/// Either participant interrupting the other
/// </li>
/// <li>
/// A lack of interruptions
/// </li>
/// </ul>
/// See <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch">Rule
/// criteria for post-call categories</a> for usage examples.
class InterruptionFilter {
  /// Makes it possible to specify a time range (in milliseconds) in your audio,
  /// during which you want to search for an interruption. See for more detail.
  final AbsoluteTimeRange? absoluteTimeRange;

  /// Set to <code>TRUE</code> to flag speech that does not contain interruptions.
  /// Set to <code>FALSE</code> to flag speech that contains interruptions.
  final bool? negate;

  /// Specify the interrupter that you want to flag. Omitting this parameter is
  /// equivalent to specifying both participants.
  final ParticipantRole? participantRole;

  /// Makes it possible to specify a time range (in percentage) in your media
  /// file, during which you want to search for an interruption. See for more
  /// detail.
  final RelativeTimeRange? relativeTimeRange;

  /// Specify the duration of the interruptions in milliseconds. For example, you
  /// can flag speech that contains more than 10,000 milliseconds of
  /// interruptions.
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

/// Makes it possible to control how your transcription job is processed.
/// Currently, the only <code>JobExecutionSettings</code> modification you can
/// choose is enabling job queueing using the
/// <code>AllowDeferredExecution</code> sub-parameter.
///
/// If you include <code>JobExecutionSettings</code> in your request, you must
/// also include the sub-parameters: <code>AllowDeferredExecution</code> and
/// <code>DataAccessRoleArn</code>.
class JobExecutionSettings {
  /// Makes it possible to enable job queuing when your concurrent request limit
  /// is exceeded. When <code>AllowDeferredExecution</code> is set to
  /// <code>true</code>, transcription job requests are placed in a queue until
  /// the number of jobs falls below the concurrent request limit. If
  /// <code>AllowDeferredExecution</code> is set to <code>false</code> and the
  /// number of transcription job requests exceed the concurrent request limit,
  /// you get a <code>LimitExceededException</code> error.
  ///
  /// If you include <code>AllowDeferredExecution</code> in your request, you must
  /// also include <code>DataAccessRoleArn</code>.
  final bool? allowDeferredExecution;

  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to access
  /// the Amazon S3 bucket that contains your input files. If the role that you
  /// specify doesn’t have the appropriate permissions to access the specified
  /// Amazon S3 location, your request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  ///
  /// Note that if you include <code>DataAccessRoleArn</code> in your request, you
  /// must also include <code>AllowDeferredExecution</code>.
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
  viVn,
  svSe,
  abGe,
  astEs,
  azAz,
  baRu,
  beBy,
  bgBg,
  bnIn,
  bsBa,
  caEs,
  ckbIq,
  ckbIr,
  csCz,
  cyWl,
  elGr,
  etEt,
  euEs,
  fiFi,
  glEs,
  guIn,
  haNg,
  hrHr,
  huHu,
  hyAm,
  isIs,
  kaGe,
  kabDz,
  kkKz,
  knIn,
  kyKg,
  lgIn,
  ltLt,
  lvLv,
  mhrRu,
  miNz,
  mkMk,
  mlIn,
  mnMn,
  mrIn,
  mtMt,
  noNo,
  orIn,
  paIn,
  plPl,
  psAf,
  roRo,
  rwRw,
  siLk,
  skSk,
  slSi,
  soSo,
  srRs,
  suId,
  swBi,
  swKe,
  swRw,
  swTz,
  swUg,
  tlPh,
  ttRu,
  ugCn,
  ukUa,
  uzUz,
  woSn,
  zuZa,
}

extension LanguageCodeValueExtension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.afZa:
        return 'af-ZA';
      case LanguageCode.arAe:
        return 'ar-AE';
      case LanguageCode.arSa:
        return 'ar-SA';
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
      case LanguageCode.viVn:
        return 'vi-VN';
      case LanguageCode.svSe:
        return 'sv-SE';
      case LanguageCode.abGe:
        return 'ab-GE';
      case LanguageCode.astEs:
        return 'ast-ES';
      case LanguageCode.azAz:
        return 'az-AZ';
      case LanguageCode.baRu:
        return 'ba-RU';
      case LanguageCode.beBy:
        return 'be-BY';
      case LanguageCode.bgBg:
        return 'bg-BG';
      case LanguageCode.bnIn:
        return 'bn-IN';
      case LanguageCode.bsBa:
        return 'bs-BA';
      case LanguageCode.caEs:
        return 'ca-ES';
      case LanguageCode.ckbIq:
        return 'ckb-IQ';
      case LanguageCode.ckbIr:
        return 'ckb-IR';
      case LanguageCode.csCz:
        return 'cs-CZ';
      case LanguageCode.cyWl:
        return 'cy-WL';
      case LanguageCode.elGr:
        return 'el-GR';
      case LanguageCode.etEt:
        return 'et-ET';
      case LanguageCode.euEs:
        return 'eu-ES';
      case LanguageCode.fiFi:
        return 'fi-FI';
      case LanguageCode.glEs:
        return 'gl-ES';
      case LanguageCode.guIn:
        return 'gu-IN';
      case LanguageCode.haNg:
        return 'ha-NG';
      case LanguageCode.hrHr:
        return 'hr-HR';
      case LanguageCode.huHu:
        return 'hu-HU';
      case LanguageCode.hyAm:
        return 'hy-AM';
      case LanguageCode.isIs:
        return 'is-IS';
      case LanguageCode.kaGe:
        return 'ka-GE';
      case LanguageCode.kabDz:
        return 'kab-DZ';
      case LanguageCode.kkKz:
        return 'kk-KZ';
      case LanguageCode.knIn:
        return 'kn-IN';
      case LanguageCode.kyKg:
        return 'ky-KG';
      case LanguageCode.lgIn:
        return 'lg-IN';
      case LanguageCode.ltLt:
        return 'lt-LT';
      case LanguageCode.lvLv:
        return 'lv-LV';
      case LanguageCode.mhrRu:
        return 'mhr-RU';
      case LanguageCode.miNz:
        return 'mi-NZ';
      case LanguageCode.mkMk:
        return 'mk-MK';
      case LanguageCode.mlIn:
        return 'ml-IN';
      case LanguageCode.mnMn:
        return 'mn-MN';
      case LanguageCode.mrIn:
        return 'mr-IN';
      case LanguageCode.mtMt:
        return 'mt-MT';
      case LanguageCode.noNo:
        return 'no-NO';
      case LanguageCode.orIn:
        return 'or-IN';
      case LanguageCode.paIn:
        return 'pa-IN';
      case LanguageCode.plPl:
        return 'pl-PL';
      case LanguageCode.psAf:
        return 'ps-AF';
      case LanguageCode.roRo:
        return 'ro-RO';
      case LanguageCode.rwRw:
        return 'rw-RW';
      case LanguageCode.siLk:
        return 'si-LK';
      case LanguageCode.skSk:
        return 'sk-SK';
      case LanguageCode.slSi:
        return 'sl-SI';
      case LanguageCode.soSo:
        return 'so-SO';
      case LanguageCode.srRs:
        return 'sr-RS';
      case LanguageCode.suId:
        return 'su-ID';
      case LanguageCode.swBi:
        return 'sw-BI';
      case LanguageCode.swKe:
        return 'sw-KE';
      case LanguageCode.swRw:
        return 'sw-RW';
      case LanguageCode.swTz:
        return 'sw-TZ';
      case LanguageCode.swUg:
        return 'sw-UG';
      case LanguageCode.tlPh:
        return 'tl-PH';
      case LanguageCode.ttRu:
        return 'tt-RU';
      case LanguageCode.ugCn:
        return 'ug-CN';
      case LanguageCode.ukUa:
        return 'uk-UA';
      case LanguageCode.uzUz:
        return 'uz-UZ';
      case LanguageCode.woSn:
        return 'wo-SN';
      case LanguageCode.zuZa:
        return 'zu-ZA';
    }
  }
}

extension LanguageCodeFromString on String {
  LanguageCode toLanguageCode() {
    switch (this) {
      case 'af-ZA':
        return LanguageCode.afZa;
      case 'ar-AE':
        return LanguageCode.arAe;
      case 'ar-SA':
        return LanguageCode.arSa;
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
      case 'vi-VN':
        return LanguageCode.viVn;
      case 'sv-SE':
        return LanguageCode.svSe;
      case 'ab-GE':
        return LanguageCode.abGe;
      case 'ast-ES':
        return LanguageCode.astEs;
      case 'az-AZ':
        return LanguageCode.azAz;
      case 'ba-RU':
        return LanguageCode.baRu;
      case 'be-BY':
        return LanguageCode.beBy;
      case 'bg-BG':
        return LanguageCode.bgBg;
      case 'bn-IN':
        return LanguageCode.bnIn;
      case 'bs-BA':
        return LanguageCode.bsBa;
      case 'ca-ES':
        return LanguageCode.caEs;
      case 'ckb-IQ':
        return LanguageCode.ckbIq;
      case 'ckb-IR':
        return LanguageCode.ckbIr;
      case 'cs-CZ':
        return LanguageCode.csCz;
      case 'cy-WL':
        return LanguageCode.cyWl;
      case 'el-GR':
        return LanguageCode.elGr;
      case 'et-ET':
        return LanguageCode.etEt;
      case 'eu-ES':
        return LanguageCode.euEs;
      case 'fi-FI':
        return LanguageCode.fiFi;
      case 'gl-ES':
        return LanguageCode.glEs;
      case 'gu-IN':
        return LanguageCode.guIn;
      case 'ha-NG':
        return LanguageCode.haNg;
      case 'hr-HR':
        return LanguageCode.hrHr;
      case 'hu-HU':
        return LanguageCode.huHu;
      case 'hy-AM':
        return LanguageCode.hyAm;
      case 'is-IS':
        return LanguageCode.isIs;
      case 'ka-GE':
        return LanguageCode.kaGe;
      case 'kab-DZ':
        return LanguageCode.kabDz;
      case 'kk-KZ':
        return LanguageCode.kkKz;
      case 'kn-IN':
        return LanguageCode.knIn;
      case 'ky-KG':
        return LanguageCode.kyKg;
      case 'lg-IN':
        return LanguageCode.lgIn;
      case 'lt-LT':
        return LanguageCode.ltLt;
      case 'lv-LV':
        return LanguageCode.lvLv;
      case 'mhr-RU':
        return LanguageCode.mhrRu;
      case 'mi-NZ':
        return LanguageCode.miNz;
      case 'mk-MK':
        return LanguageCode.mkMk;
      case 'ml-IN':
        return LanguageCode.mlIn;
      case 'mn-MN':
        return LanguageCode.mnMn;
      case 'mr-IN':
        return LanguageCode.mrIn;
      case 'mt-MT':
        return LanguageCode.mtMt;
      case 'no-NO':
        return LanguageCode.noNo;
      case 'or-IN':
        return LanguageCode.orIn;
      case 'pa-IN':
        return LanguageCode.paIn;
      case 'pl-PL':
        return LanguageCode.plPl;
      case 'ps-AF':
        return LanguageCode.psAf;
      case 'ro-RO':
        return LanguageCode.roRo;
      case 'rw-RW':
        return LanguageCode.rwRw;
      case 'si-LK':
        return LanguageCode.siLk;
      case 'sk-SK':
        return LanguageCode.skSk;
      case 'sl-SI':
        return LanguageCode.slSi;
      case 'so-SO':
        return LanguageCode.soSo;
      case 'sr-RS':
        return LanguageCode.srRs;
      case 'su-ID':
        return LanguageCode.suId;
      case 'sw-BI':
        return LanguageCode.swBi;
      case 'sw-KE':
        return LanguageCode.swKe;
      case 'sw-RW':
        return LanguageCode.swRw;
      case 'sw-TZ':
        return LanguageCode.swTz;
      case 'sw-UG':
        return LanguageCode.swUg;
      case 'tl-PH':
        return LanguageCode.tlPh;
      case 'tt-RU':
        return LanguageCode.ttRu;
      case 'ug-CN':
        return LanguageCode.ugCn;
      case 'uk-UA':
        return LanguageCode.ukUa;
      case 'uz-UZ':
        return LanguageCode.uzUz;
      case 'wo-SN':
        return LanguageCode.woSn;
      case 'zu-ZA':
        return LanguageCode.zuZa;
    }
    throw Exception('$this is not known in enum LanguageCode');
  }
}

/// Provides information on the speech contained in a discreet utterance when
/// multi-language identification is enabled in your request. This utterance
/// represents a block of speech consisting of one language, preceded or
/// followed by a block of speech in a different language.
class LanguageCodeItem {
  /// Provides the total time, in seconds, each identified language is spoken in
  /// your media.
  final double? durationInSeconds;

  /// Provides the language code for each language identified in your media.
  final LanguageCode? languageCode;

  LanguageCodeItem({
    this.durationInSeconds,
    this.languageCode,
  });

  factory LanguageCodeItem.fromJson(Map<String, dynamic> json) {
    return LanguageCodeItem(
      durationInSeconds: json['DurationInSeconds'] as double?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
    );
  }

  Map<String, dynamic> toJson() {
    final durationInSeconds = this.durationInSeconds;
    final languageCode = this.languageCode;
    return {
      if (durationInSeconds != null) 'DurationInSeconds': durationInSeconds,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
    };
  }
}

/// If using automatic language identification in your request and you want to
/// apply a custom language model, a custom vocabulary, or a custom vocabulary
/// filter, include <code>LanguageIdSettings</code> with the relevant
/// sub-parameters (<code>VocabularyName</code>, <code>LanguageModelName</code>,
/// and <code>VocabularyFilterName</code>). Note that multi-language
/// identification (<code>IdentifyMultipleLanguages</code>) doesn't support
/// custom language models.
///
/// <code>LanguageIdSettings</code> supports two to five language codes. Each
/// language code you include can have an associated custom language model,
/// custom vocabulary, and custom vocabulary filter. The language codes that you
/// specify must match the languages of the associated custom language models,
/// custom vocabularies, and custom vocabulary filters.
///
/// It's recommended that you include <code>LanguageOptions</code> when using
/// <code>LanguageIdSettings</code> to ensure that the correct language dialect
/// is identified. For example, if you specify a custom vocabulary that is in
/// <code>en-US</code> but Amazon Transcribe determines that the language spoken
/// in your media is <code>en-AU</code>, your custom vocabulary <i>is not</i>
/// applied to your transcription. If you include <code>LanguageOptions</code>
/// and include <code>en-US</code> as the only English language dialect, your
/// custom vocabulary <i>is</i> applied to your transcription.
///
/// If you want to include a custom language model with your request but <b>do
/// not</b> want to use automatic language identification, use instead the
/// <code/> parameter with the <code>LanguageModelName</code> sub-parameter. If
/// you want to include a custom vocabulary or a custom vocabulary filter (or
/// both) with your request but <b>do not</b> want to use automatic language
/// identification, use instead the <code/> parameter with the
/// <code>VocabularyName</code> or <code>VocabularyFilterName</code> (or both)
/// sub-parameter.
class LanguageIdSettings {
  /// The name of the custom language model you want to use when processing your
  /// transcription job. Note that custom language model names are case sensitive.
  ///
  /// The language of the specified custom language model must match the language
  /// code that you specify in your transcription request. If the languages do not
  /// match, the custom language model isn't applied. There are no errors or
  /// warnings associated with a language mismatch.
  final String? languageModelName;

  /// The name of the custom vocabulary filter you want to use when processing
  /// your transcription job. Custom vocabulary filter names are case sensitive.
  ///
  /// The language of the specified custom vocabulary filter must match the
  /// language code that you specify in your transcription request. If the
  /// languages do not match, the custom vocabulary filter isn't applied. There
  /// are no errors or warnings associated with a language mismatch.
  ///
  /// Note that if you include <code>VocabularyFilterName</code> in your request,
  /// you must also include <code>VocabularyFilterMethod</code>.
  final String? vocabularyFilterName;

  /// The name of the custom vocabulary you want to use when processing your
  /// transcription job. Custom vocabulary names are case sensitive.
  ///
  /// The language of the specified custom vocabulary must match the language code
  /// that you specify in your transcription request. If the languages do not
  /// match, the custom vocabulary isn't applied. There are no errors or warnings
  /// associated with a language mismatch.
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

/// Provides information about a custom language model, including:
///
/// <ul>
/// <li>
/// The base model name
/// </li>
/// <li>
/// When the model was created
/// </li>
/// <li>
/// The location of the files used to train the model
/// </li>
/// <li>
/// When the model was last modified
/// </li>
/// <li>
/// The name you chose for the model
/// </li>
/// <li>
/// The model's language
/// </li>
/// <li>
/// The model's processing state
/// </li>
/// <li>
/// Any available upgrades for the base model
/// </li>
/// </ul>
class LanguageModel {
  /// The Amazon Transcribe standard language model, or base model, used to create
  /// your custom language model.
  final BaseModelName? baseModelName;

  /// The date and time the specified custom language model was created.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? createTime;

  /// If <code>ModelStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the custom
  /// language model request failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The Amazon S3 location of the input files used to train and tune your custom
  /// language model, in addition to the data access role ARN (Amazon Resource
  /// Name) that has permissions to access these data.
  final InputDataConfig? inputDataConfig;

  /// The language code used to create your custom language model. Each custom
  /// language model must contain terms in only one language, and the language you
  /// select for your custom language model must match the language of your
  /// training and tuning data.
  ///
  /// For a list of supported languages and their associated language codes, refer
  /// to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table. Note that US English (<code>en-US</code>) is the only
  /// language supported with Amazon Transcribe Medical.
  final CLMLanguageCode? languageCode;

  /// The date and time the specified custom language model was last modified.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// A unique name, chosen by you, for your custom language model.
  ///
  /// This name is case sensitive, cannot contain spaces, and must be unique
  /// within an Amazon Web Services account.
  final String? modelName;

  /// The status of the specified custom language model. When the status displays
  /// as <code>COMPLETED</code> the model is ready for use.
  final ModelStatus? modelStatus;

  /// Shows if a more current base model is available for use with the specified
  /// custom language model.
  ///
  /// If <code>false</code>, your custom language model is using the most
  /// up-to-date base model.
  ///
  /// If <code>true</code>, there is a newer base model available than the one
  /// your language model is using.
  ///
  /// Note that to update a base model, you must recreate the custom language
  /// model using the new base model. Base model upgrades for existing custom
  /// language models are not supported.
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
  /// Provides detailed information about your Call Analytics categories,
  /// including all the rules associated with each category.
  final List<CategoryProperties>? categories;

  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
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
  /// Provides a summary of information about each result.
  final List<CallAnalyticsJobSummary>? callAnalyticsJobSummaries;

  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  final String? nextToken;

  /// Lists all Call Analytics jobs that have the status specified in your
  /// request. Jobs are ordered by creation date, with the newest job first.
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
  /// Provides information about the custom language models that match the
  /// criteria specified in your request.
  final List<LanguageModel>? models;

  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
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

class ListMedicalScribeJobsResponse {
  /// Provides a summary of information about each result.
  final List<MedicalScribeJobSummary>? medicalScribeJobSummaries;

  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  final String? nextToken;

  /// Lists all Medical Scribe jobs that have the status specified in your
  /// request. Jobs are ordered by creation date, with the newest job first.
  final MedicalScribeJobStatus? status;

  ListMedicalScribeJobsResponse({
    this.medicalScribeJobSummaries,
    this.nextToken,
    this.status,
  });

  factory ListMedicalScribeJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListMedicalScribeJobsResponse(
      medicalScribeJobSummaries: (json['MedicalScribeJobSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MedicalScribeJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      status: (json['Status'] as String?)?.toMedicalScribeJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final medicalScribeJobSummaries = this.medicalScribeJobSummaries;
    final nextToken = this.nextToken;
    final status = this.status;
    return {
      if (medicalScribeJobSummaries != null)
        'MedicalScribeJobSummaries': medicalScribeJobSummaries,
      if (nextToken != null) 'NextToken': nextToken,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class ListMedicalTranscriptionJobsResponse {
  /// Provides a summary of information about each result.
  final List<MedicalTranscriptionJobSummary>? medicalTranscriptionJobSummaries;

  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  final String? nextToken;

  /// Lists all medical transcription jobs that have the status specified in your
  /// request. Jobs are ordered by creation date, with the newest job first.
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
  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  final String? nextToken;

  /// Lists all custom medical vocabularies that have the status specified in your
  /// request. Custom vocabularies are ordered by creation date, with the newest
  /// vocabulary first.
  final VocabularyState? status;

  /// Provides information about the custom medical vocabularies that match the
  /// criteria specified in your request.
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
  /// The Amazon Resource Name (ARN) specified in your request.
  final String? resourceArn;

  /// Lists all tags associated with the given transcription job, vocabulary,
  /// model, or resource.
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
  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  final String? nextToken;

  /// Lists all transcription jobs that have the status specified in your request.
  /// Jobs are ordered by creation date, with the newest job first.
  final TranscriptionJobStatus? status;

  /// Provides a summary of information about each result.
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
  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  final String? nextToken;

  /// Lists all custom vocabularies that have the status specified in your
  /// request. Vocabularies are ordered by creation date, with the newest
  /// vocabulary first.
  final VocabularyState? status;

  /// Provides information about the custom vocabularies that match the criteria
  /// specified in your request.
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
  /// If <code>NextToken</code> is present in your response, it indicates that not
  /// all results are displayed. To view the next set of results, copy the string
  /// associated with the <code>NextToken</code> parameter in your results output,
  /// then run your request again including <code>NextToken</code> with the value
  /// of the copied string. Repeat as needed to view all your results.
  final String? nextToken;

  /// Provides information about the custom vocabulary filters that match the
  /// criteria specified in your request.
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

/// Describes the Amazon S3 location of the media file you want to use in your
/// request.
///
/// For information on supported media formats, refer to the
/// <code>MediaFormat</code> parameter or the <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio">Media
/// formats</a> section in the Amazon S3 Developer Guide.
class Media {
  /// The Amazon S3 location of the media file you want to transcribe. For
  /// example:
  ///
  /// <ul>
  /// <li>
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-media-file.flac</code>
  /// </li>
  /// <li>
  /// <code>s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac</code>
  /// </li>
  /// </ul>
  /// Note that the Amazon S3 bucket that contains your input media must be
  /// located in the same Amazon Web Services Region where you're making your
  /// transcription request.
  final String? mediaFileUri;

  /// The Amazon S3 location of the media file you want to redact. For example:
  ///
  /// <ul>
  /// <li>
  /// <code>s3://DOC-EXAMPLE-BUCKET/my-media-file.flac</code>
  /// </li>
  /// <li>
  /// <code>s3://DOC-EXAMPLE-BUCKET/media-files/my-media-file.flac</code>
  /// </li>
  /// </ul>
  /// Note that the Amazon S3 bucket that contains your input media must be
  /// located in the same Amazon Web Services Region where you're making your
  /// transcription request.
  /// <important>
  /// <code>RedactedMediaFileUri</code> produces a redacted audio file in addition
  /// to a redacted transcript. It is only supported for Call Analytics
  /// (<code>StartCallAnalyticsJob</code>) transcription requests.
  /// </important>
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
  m4a,
}

extension MediaFormatValueExtension on MediaFormat {
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
      case MediaFormat.m4a:
        return 'm4a';
    }
  }
}

extension MediaFormatFromString on String {
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
      case 'm4a':
        return MediaFormat.m4a;
    }
    throw Exception('$this is not known in enum MediaFormat');
  }
}

enum MedicalContentIdentificationType {
  phi,
}

extension MedicalContentIdentificationTypeValueExtension
    on MedicalContentIdentificationType {
  String toValue() {
    switch (this) {
      case MedicalContentIdentificationType.phi:
        return 'PHI';
    }
  }
}

extension MedicalContentIdentificationTypeFromString on String {
  MedicalContentIdentificationType toMedicalContentIdentificationType() {
    switch (this) {
      case 'PHI':
        return MedicalContentIdentificationType.phi;
    }
    throw Exception(
        '$this is not known in enum MedicalContentIdentificationType');
  }
}

/// Indicates which speaker is on which channel. The options are
/// <code>CLINICIAN</code> and <code>PATIENT</code>
class MedicalScribeChannelDefinition {
  /// Specify the audio channel you want to define.
  final int channelId;

  /// Specify the participant that you want to flag. The options are
  /// <code>CLINICIAN</code> and <code>PATIENT</code>
  final MedicalScribeParticipantRole participantRole;

  MedicalScribeChannelDefinition({
    required this.channelId,
    required this.participantRole,
  });

  factory MedicalScribeChannelDefinition.fromJson(Map<String, dynamic> json) {
    return MedicalScribeChannelDefinition(
      channelId: json['ChannelId'] as int,
      participantRole:
          (json['ParticipantRole'] as String).toMedicalScribeParticipantRole(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final participantRole = this.participantRole;
    return {
      'ChannelId': channelId,
      'ParticipantRole': participantRole.toValue(),
    };
  }
}

/// Provides detailed information about a Medical Scribe job.
///
/// To view the status of the specified Medical Scribe job, check the
/// <code>MedicalScribeJobStatus</code> field. If the status is
/// <code>COMPLETED</code>, the job is finished and you can find the results at
/// the locations specified in <code>MedicalScribeOutput</code>. If the status
/// is <code>FAILED</code>, <code>FailureReason</code> provides details on why
/// your Medical Scribe job failed.
class MedicalScribeJob {
  /// Makes it possible to specify which speaker is on which channel. For example,
  /// if the clinician is the first participant to speak, you would set
  /// <code>ChannelId</code> of the first <code>ChannelDefinition</code> in the
  /// list to <code>0</code> (to indicate the first channel) and
  /// <code>ParticipantRole</code> to <code>CLINICIAN</code> (to indicate that
  /// it's the clinician speaking). Then you would set the <code>ChannelId</code>
  /// of the second <code>ChannelDefinition</code> in the list to <code>1</code>
  /// (to indicate the second channel) and <code>ParticipantRole</code> to
  /// <code>PATIENT</code> (to indicate that it's the patient speaking).
  final List<MedicalScribeChannelDefinition>? channelDefinitions;

  /// The date and time the specified Medical Scribe job finished processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// Medical Scribe job that finished processing at 12:32 PM UTC-7 on May 4,
  /// 2022.
  final DateTime? completionTime;

  /// The date and time the specified Medical Scribe job request was made.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to access
  /// the Amazon S3 bucket that contains your input files, write to the output
  /// bucket, and use your KMS key if supplied. If the role that you specify
  /// doesn’t have the appropriate permissions your request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_identifiers.html#identifiers-arns">IAM
  /// ARNs</a>.
  final String? dataAccessRoleArn;

  /// If <code>MedicalScribeJobStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the transcription
  /// job failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The language code used to create your Medical Scribe job. US English
  /// (<code>en-US</code>) is the only supported language for Medical Scribe jobs.
  final MedicalScribeLanguageCode? languageCode;
  final Media? media;

  /// The name of the Medical Scribe job. Job names are case sensitive and must be
  /// unique within an Amazon Web Services account.
  final String? medicalScribeJobName;

  /// Provides the status of the specified Medical Scribe job.
  ///
  /// If the status is <code>COMPLETED</code>, the job is finished and you can
  /// find the results at the location specified in
  /// <code>MedicalScribeOutput</code> If the status is <code>FAILED</code>,
  /// <code>FailureReason</code> provides details on why your Medical Scribe job
  /// failed.
  final MedicalScribeJobStatus? medicalScribeJobStatus;

  /// The location of the output of your Medical Scribe job.
  /// <code>ClinicalDocumentUri</code> holds the Amazon S3 URI for the Clinical
  /// Document and <code>TranscriptFileUri</code> holds the Amazon S3 URI for the
  /// Transcript.
  final MedicalScribeOutput? medicalScribeOutput;

  /// Makes it possible to control how your Medical Scribe job is processed using
  /// a <code>MedicalScribeSettings</code> object. Specify
  /// <code>ChannelIdentification</code> if <code>ChannelDefinitions</code> are
  /// set. Enabled <code>ShowSpeakerLabels</code> if
  /// <code>ChannelIdentification</code> and <code>ChannelDefinitions</code> are
  /// not set. One and only one of <code>ChannelIdentification</code> and
  /// <code>ShowSpeakerLabels</code> must be set. If
  /// <code>ShowSpeakerLabels</code> is set, <code>MaxSpeakerLabels</code> must
  /// also be set. Use <code>Settings</code> to specify a vocabulary or vocabulary
  /// filter or both using <code>VocabularyName</code>,
  /// <code>VocabularyFilterName</code>. <code>VocabularyFilterMethod</code> must
  /// be specified if <code>VocabularyFilterName</code> is set.
  final MedicalScribeSettings? settings;

  /// The date and time your Medical Scribe job began processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a
  /// Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? startTime;

  /// Adds one or more custom tags, each in the form of a key:value pair, to the
  /// Medica Scribe job.
  ///
  /// To learn more about using tags with Amazon Transcribe, refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
  /// resources</a>.
  final List<Tag>? tags;

  MedicalScribeJob({
    this.channelDefinitions,
    this.completionTime,
    this.creationTime,
    this.dataAccessRoleArn,
    this.failureReason,
    this.languageCode,
    this.media,
    this.medicalScribeJobName,
    this.medicalScribeJobStatus,
    this.medicalScribeOutput,
    this.settings,
    this.startTime,
    this.tags,
  });

  factory MedicalScribeJob.fromJson(Map<String, dynamic> json) {
    return MedicalScribeJob(
      channelDefinitions: (json['ChannelDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => MedicalScribeChannelDefinition.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      completionTime: timeStampFromJson(json['CompletionTime']),
      creationTime: timeStampFromJson(json['CreationTime']),
      dataAccessRoleArn: json['DataAccessRoleArn'] as String?,
      failureReason: json['FailureReason'] as String?,
      languageCode:
          (json['LanguageCode'] as String?)?.toMedicalScribeLanguageCode(),
      media: json['Media'] != null
          ? Media.fromJson(json['Media'] as Map<String, dynamic>)
          : null,
      medicalScribeJobName: json['MedicalScribeJobName'] as String?,
      medicalScribeJobStatus: (json['MedicalScribeJobStatus'] as String?)
          ?.toMedicalScribeJobStatus(),
      medicalScribeOutput: json['MedicalScribeOutput'] != null
          ? MedicalScribeOutput.fromJson(
              json['MedicalScribeOutput'] as Map<String, dynamic>)
          : null,
      settings: json['Settings'] != null
          ? MedicalScribeSettings.fromJson(
              json['Settings'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelDefinitions = this.channelDefinitions;
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final media = this.media;
    final medicalScribeJobName = this.medicalScribeJobName;
    final medicalScribeJobStatus = this.medicalScribeJobStatus;
    final medicalScribeOutput = this.medicalScribeOutput;
    final settings = this.settings;
    final startTime = this.startTime;
    final tags = this.tags;
    return {
      if (channelDefinitions != null) 'ChannelDefinitions': channelDefinitions,
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dataAccessRoleArn != null) 'DataAccessRoleArn': dataAccessRoleArn,
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (media != null) 'Media': media,
      if (medicalScribeJobName != null)
        'MedicalScribeJobName': medicalScribeJobName,
      if (medicalScribeJobStatus != null)
        'MedicalScribeJobStatus': medicalScribeJobStatus.toValue(),
      if (medicalScribeOutput != null)
        'MedicalScribeOutput': medicalScribeOutput,
      if (settings != null) 'Settings': settings,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum MedicalScribeJobStatus {
  queued,
  inProgress,
  failed,
  completed,
}

extension MedicalScribeJobStatusValueExtension on MedicalScribeJobStatus {
  String toValue() {
    switch (this) {
      case MedicalScribeJobStatus.queued:
        return 'QUEUED';
      case MedicalScribeJobStatus.inProgress:
        return 'IN_PROGRESS';
      case MedicalScribeJobStatus.failed:
        return 'FAILED';
      case MedicalScribeJobStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension MedicalScribeJobStatusFromString on String {
  MedicalScribeJobStatus toMedicalScribeJobStatus() {
    switch (this) {
      case 'QUEUED':
        return MedicalScribeJobStatus.queued;
      case 'IN_PROGRESS':
        return MedicalScribeJobStatus.inProgress;
      case 'FAILED':
        return MedicalScribeJobStatus.failed;
      case 'COMPLETED':
        return MedicalScribeJobStatus.completed;
    }
    throw Exception('$this is not known in enum MedicalScribeJobStatus');
  }
}

/// Provides detailed information about a specific Medical Scribe job.
class MedicalScribeJobSummary {
  /// The date and time the specified Medical Scribe job finished processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// Medical Scribe job that finished processing at 12:32 PM UTC-7 on May 4,
  /// 2022.
  final DateTime? completionTime;

  /// The date and time the specified Medical Scribe job request was made.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? creationTime;

  /// If <code>MedicalScribeJobStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the transcription
  /// job failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The language code used to create your Medical Scribe job. US English
  /// (<code>en-US</code>) is the only supported language for Medical Scribe jobs.
  final MedicalScribeLanguageCode? languageCode;

  /// The name of the Medical Scribe job. Job names are case sensitive and must be
  /// unique within an Amazon Web Services account.
  final String? medicalScribeJobName;

  /// Provides the status of the specified Medical Scribe job.
  ///
  /// If the status is <code>COMPLETED</code>, the job is finished and you can
  /// find the results at the location specified in
  /// <code>MedicalScribeOutput</code> If the status is <code>FAILED</code>,
  /// <code>FailureReason</code> provides details on why your Medical Scribe job
  /// failed.
  final MedicalScribeJobStatus? medicalScribeJobStatus;

  /// The date and time your Medical Scribe job began processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a
  /// Medical Scribe job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? startTime;

  MedicalScribeJobSummary({
    this.completionTime,
    this.creationTime,
    this.failureReason,
    this.languageCode,
    this.medicalScribeJobName,
    this.medicalScribeJobStatus,
    this.startTime,
  });

  factory MedicalScribeJobSummary.fromJson(Map<String, dynamic> json) {
    return MedicalScribeJobSummary(
      completionTime: timeStampFromJson(json['CompletionTime']),
      creationTime: timeStampFromJson(json['CreationTime']),
      failureReason: json['FailureReason'] as String?,
      languageCode:
          (json['LanguageCode'] as String?)?.toMedicalScribeLanguageCode(),
      medicalScribeJobName: json['MedicalScribeJobName'] as String?,
      medicalScribeJobStatus: (json['MedicalScribeJobStatus'] as String?)
          ?.toMedicalScribeJobStatus(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final completionTime = this.completionTime;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final languageCode = this.languageCode;
    final medicalScribeJobName = this.medicalScribeJobName;
    final medicalScribeJobStatus = this.medicalScribeJobStatus;
    final startTime = this.startTime;
    return {
      if (completionTime != null)
        'CompletionTime': unixTimestampToJson(completionTime),
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (medicalScribeJobName != null)
        'MedicalScribeJobName': medicalScribeJobName,
      if (medicalScribeJobStatus != null)
        'MedicalScribeJobStatus': medicalScribeJobStatus.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

enum MedicalScribeLanguageCode {
  enUs,
}

extension MedicalScribeLanguageCodeValueExtension on MedicalScribeLanguageCode {
  String toValue() {
    switch (this) {
      case MedicalScribeLanguageCode.enUs:
        return 'en-US';
    }
  }
}

extension MedicalScribeLanguageCodeFromString on String {
  MedicalScribeLanguageCode toMedicalScribeLanguageCode() {
    switch (this) {
      case 'en-US':
        return MedicalScribeLanguageCode.enUs;
    }
    throw Exception('$this is not known in enum MedicalScribeLanguageCode');
  }
}

/// The location of the output of your Medical Scribe job.
/// <code>ClinicalDocumentUri</code> holds the Amazon S3 URI for the Clinical
/// Document and <code>TranscriptFileUri</code> holds the Amazon S3 URI for the
/// Transcript.
class MedicalScribeOutput {
  /// Holds the Amazon S3 URI for the Clinical Document.
  final String clinicalDocumentUri;

  /// Holds the Amazon S3 URI for the Transcript.
  final String transcriptFileUri;

  MedicalScribeOutput({
    required this.clinicalDocumentUri,
    required this.transcriptFileUri,
  });

  factory MedicalScribeOutput.fromJson(Map<String, dynamic> json) {
    return MedicalScribeOutput(
      clinicalDocumentUri: json['ClinicalDocumentUri'] as String,
      transcriptFileUri: json['TranscriptFileUri'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final clinicalDocumentUri = this.clinicalDocumentUri;
    final transcriptFileUri = this.transcriptFileUri;
    return {
      'ClinicalDocumentUri': clinicalDocumentUri,
      'TranscriptFileUri': transcriptFileUri,
    };
  }
}

enum MedicalScribeParticipantRole {
  patient,
  clinician,
}

extension MedicalScribeParticipantRoleValueExtension
    on MedicalScribeParticipantRole {
  String toValue() {
    switch (this) {
      case MedicalScribeParticipantRole.patient:
        return 'PATIENT';
      case MedicalScribeParticipantRole.clinician:
        return 'CLINICIAN';
    }
  }
}

extension MedicalScribeParticipantRoleFromString on String {
  MedicalScribeParticipantRole toMedicalScribeParticipantRole() {
    switch (this) {
      case 'PATIENT':
        return MedicalScribeParticipantRole.patient;
      case 'CLINICIAN':
        return MedicalScribeParticipantRole.clinician;
    }
    throw Exception('$this is not known in enum MedicalScribeParticipantRole');
  }
}

/// Makes it possible to control how your Medical Scribe job is processed using
/// a <code>MedicalScribeSettings</code> object. Specify
/// <code>ChannelIdentification</code> if <code>ChannelDefinitions</code> are
/// set. Enabled <code>ShowSpeakerLabels</code> if
/// <code>ChannelIdentification</code> and <code>ChannelDefinitions</code> are
/// not set. One and only one of <code>ChannelIdentification</code> and
/// <code>ShowSpeakerLabels</code> must be set. If
/// <code>ShowSpeakerLabels</code> is set, <code>MaxSpeakerLabels</code> must
/// also be set. Use <code>Settings</code> to specify a vocabulary or vocabulary
/// filter or both using <code>VocabularyName</code>,
/// <code>VocabularyFilterName</code>. <code>VocabularyFilterMethod</code> must
/// be specified if <code>VocabularyFilterName</code> is set.
class MedicalScribeSettings {
  /// Enables channel identification in multi-channel audio.
  ///
  /// Channel identification transcribes the audio on each channel independently,
  /// then appends the output for each channel into one transcript.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html">Transcribing
  /// multi-channel audio</a>.
  final bool? channelIdentification;

  /// Specify the maximum number of speakers you want to partition in your media.
  ///
  /// Note that if your media contains more speakers than the specified number,
  /// multiple speakers are treated as a single speaker.
  ///
  /// If you specify the <code>MaxSpeakerLabels</code> field, you must set the
  /// <code>ShowSpeakerLabels</code> field to true.
  final int? maxSpeakerLabels;

  /// Enables speaker partitioning (diarization) in your Medical Scribe output.
  /// Speaker partitioning labels the speech from individual speakers in your
  /// media file.
  ///
  /// If you enable <code>ShowSpeakerLabels</code> in your request, you must also
  /// include <code>MaxSpeakerLabels</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html">Partitioning
  /// speakers (diarization)</a>.
  final bool? showSpeakerLabels;

  /// Specify how you want your custom vocabulary filter applied to your
  /// transcript.
  ///
  /// To replace words with <code>***</code>, choose <code>mask</code>.
  ///
  /// To delete words, choose <code>remove</code>.
  ///
  /// To flag words without changing them, choose <code>tag</code>.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// The name of the custom vocabulary filter you want to include in your Medical
  /// Scribe request. Custom vocabulary filter names are case sensitive.
  ///
  /// Note that if you include <code>VocabularyFilterName</code> in your request,
  /// you must also include <code>VocabularyFilterMethod</code>.
  final String? vocabularyFilterName;

  /// The name of the custom vocabulary you want to include in your Medical Scribe
  /// request. Custom vocabulary names are case sensitive.
  final String? vocabularyName;

  MedicalScribeSettings({
    this.channelIdentification,
    this.maxSpeakerLabels,
    this.showSpeakerLabels,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyName,
  });

  factory MedicalScribeSettings.fromJson(Map<String, dynamic> json) {
    return MedicalScribeSettings(
      channelIdentification: json['ChannelIdentification'] as bool?,
      maxSpeakerLabels: json['MaxSpeakerLabels'] as int?,
      showSpeakerLabels: json['ShowSpeakerLabels'] as bool?,
      vocabularyFilterMethod: (json['VocabularyFilterMethod'] as String?)
          ?.toVocabularyFilterMethod(),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelIdentification = this.channelIdentification;
    final maxSpeakerLabels = this.maxSpeakerLabels;
    final showSpeakerLabels = this.showSpeakerLabels;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyName = this.vocabularyName;
    return {
      if (channelIdentification != null)
        'ChannelIdentification': channelIdentification,
      if (maxSpeakerLabels != null) 'MaxSpeakerLabels': maxSpeakerLabels,
      if (showSpeakerLabels != null) 'ShowSpeakerLabels': showSpeakerLabels,
      if (vocabularyFilterMethod != null)
        'VocabularyFilterMethod': vocabularyFilterMethod.toValue(),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

/// Provides you with the Amazon S3 URI you can use to access your transcript.
class MedicalTranscript {
  /// The Amazon S3 location of your transcript. You can use this URI to access or
  /// download your transcript.
  ///
  /// Note that this is the Amazon S3 location you specified in your request using
  /// the <code>OutputBucketName</code> parameter.
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

/// Provides detailed information about a medical transcription job.
///
/// To view the status of the specified medical transcription job, check the
/// <code>TranscriptionJobStatus</code> field. If the status is
/// <code>COMPLETED</code>, the job is finished and you can find the results at
/// the location specified in <code>TranscriptFileUri</code>. If the status is
/// <code>FAILED</code>, <code>FailureReason</code> provides details on why your
/// transcription job failed.
class MedicalTranscriptionJob {
  /// The date and time the specified medical transcription job finished
  /// processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a
  /// transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
  final DateTime? completionTime;

  /// Indicates whether content identification was enabled for your transcription
  /// request.
  final MedicalContentIdentificationType? contentIdentificationType;

  /// The date and time the specified medical transcription job request was made.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? creationTime;

  /// If <code>TranscriptionJobStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the transcription
  /// job request failed.
  ///
  /// The <code>FailureReason</code> field contains one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Unsupported media format</code>.
  ///
  /// The media format specified in <code>MediaFormat</code> isn't valid. Refer to
  /// refer to the <code>MediaFormat</code> parameter for a list of supported
  /// formats.
  /// </li>
  /// <li>
  /// <code>The media format provided does not match the detected media
  /// format</code>.
  ///
  /// The media format specified in <code>MediaFormat</code> doesn't match the
  /// format of the input file. Check the media format of your media file and
  /// correct the specified value.
  /// </li>
  /// <li>
  /// <code>Invalid sample rate for audio file</code>.
  ///
  /// The sample rate specified in <code>MediaSampleRateHertz</code> isn't valid.
  /// The sample rate must be between 16,000 and 48,000 hertz.
  /// </li>
  /// <li>
  /// <code>The sample rate provided does not match the detected sample
  /// rate</code>.
  ///
  /// The sample rate specified in <code>MediaSampleRateHertz</code> doesn't match
  /// the sample rate detected in your input media file. Check the sample rate of
  /// your media file and correct the specified value.
  /// </li>
  /// <li>
  /// <code>Invalid file size: file size too large</code>.
  ///
  /// The size of your media file is larger than what Amazon Transcribe can
  /// process. For more information, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe">Service
  /// quotas</a>.
  /// </li>
  /// <li>
  /// <code>Invalid number of channels: number of channels too large</code>.
  ///
  /// Your audio contains more channels than Amazon Transcribe is able to process.
  /// For more information, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe">Service
  /// quotas</a>.
  /// </li>
  /// </ul>
  final String? failureReason;

  /// The language code used to create your medical transcription job. US English
  /// (<code>en-US</code>) is the only supported language for medical
  /// transcriptions.
  final LanguageCode? languageCode;
  final Media? media;

  /// The format of the input media file.
  final MediaFormat? mediaFormat;

  /// The sample rate, in hertz, of the audio track in your input media file.
  final int? mediaSampleRateHertz;

  /// The name of the medical transcription job. Job names are case sensitive and
  /// must be unique within an Amazon Web Services account.
  final String? medicalTranscriptionJobName;

  /// Provides information on any additional settings that were included in your
  /// request. Additional settings include channel identification, alternative
  /// transcriptions, speaker partitioning, custom vocabularies, and custom
  /// vocabulary filters.
  final MedicalTranscriptionSetting? settings;

  /// Describes the medical specialty represented in your media.
  final Specialty? specialty;

  /// The date and time the specified medical transcription job began processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? startTime;

  /// The tags, each in the form of a key:value pair, assigned to the specified
  /// medical transcription job.
  final List<Tag>? tags;

  /// Provides you with the Amazon S3 URI you can use to access your transcript.
  final MedicalTranscript? transcript;

  /// Provides the status of the specified medical transcription job.
  ///
  /// If the status is <code>COMPLETED</code>, the job is finished and you can
  /// find the results at the location specified in
  /// <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>,
  /// <code>FailureReason</code> provides details on why your transcription job
  /// failed.
  final TranscriptionJobStatus? transcriptionJobStatus;

  /// Indicates whether the input media is a dictation or a conversation, as
  /// specified in the <code>StartMedicalTranscriptionJob</code> request.
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

/// Provides detailed information about a specific medical transcription job.
class MedicalTranscriptionJobSummary {
  /// The date and time the specified medical transcription job finished
  /// processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a
  /// transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
  final DateTime? completionTime;

  /// Labels all personal health information (PHI) identified in your transcript.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html">Identifying
  /// personal health information (PHI) in a transcription</a>.
  final MedicalContentIdentificationType? contentIdentificationType;

  /// The date and time the specified medical transcription job request was made.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? creationTime;

  /// If <code>TranscriptionJobStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the transcription
  /// job failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The language code used to create your medical transcription. US English
  /// (<code>en-US</code>) is the only supported language for medical
  /// transcriptions.
  final LanguageCode? languageCode;

  /// The name of the medical transcription job. Job names are case sensitive and
  /// must be unique within an Amazon Web Services account.
  final String? medicalTranscriptionJobName;

  /// Indicates where the specified medical transcription output is stored.
  ///
  /// If the value is <code>CUSTOMER_BUCKET</code>, the location is the Amazon S3
  /// bucket you specified using the <code>OutputBucketName</code> parameter in
  /// your request. If you also included <code>OutputKey</code> in your request,
  /// your output is located in the path you specified in your request.
  ///
  /// If the value is <code>SERVICE_BUCKET</code>, the location is a
  /// service-managed Amazon S3 bucket. To access a transcript stored in a
  /// service-managed bucket, use the URI shown in the
  /// <code>TranscriptFileUri</code> field.
  final OutputLocationType? outputLocationType;

  /// Provides the medical specialty represented in your media.
  final Specialty? specialty;

  /// The date and time your medical transcription job began processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? startTime;

  /// Provides the status of your medical transcription job.
  ///
  /// If the status is <code>COMPLETED</code>, the job is finished and you can
  /// find the results at the location specified in
  /// <code>TranscriptFileUri</code>. If the status is <code>FAILED</code>,
  /// <code>FailureReason</code> provides details on why your transcription job
  /// failed.
  final TranscriptionJobStatus? transcriptionJobStatus;

  /// Indicates whether the input media is a dictation or a conversation, as
  /// specified in the <code>StartMedicalTranscriptionJob</code> request.
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

/// Allows additional optional settings in your request, including channel
/// identification, alternative transcriptions, and speaker partitioning. You
/// can use that to apply custom vocabularies to your medical transcription job.
class MedicalTranscriptionSetting {
  /// Enables channel identification in multi-channel audio.
  ///
  /// Channel identification transcribes the audio on each channel independently,
  /// then appends the output for each channel into one transcript.
  ///
  /// If you have multi-channel audio and do not enable channel identification,
  /// your audio is transcribed in a continuous manner and your transcript does
  /// not separate the speech by channel.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html">Transcribing
  /// multi-channel audio</a>.
  final bool? channelIdentification;

  /// Indicate the maximum number of alternative transcriptions you want Amazon
  /// Transcribe Medical to include in your transcript.
  ///
  /// If you select a number greater than the number of alternative transcriptions
  /// generated by Amazon Transcribe Medical, only the actual number of
  /// alternative transcriptions are included.
  ///
  /// If you include <code>MaxAlternatives</code> in your request, you must also
  /// include <code>ShowAlternatives</code> with a value of <code>true</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html">Alternative
  /// transcriptions</a>.
  final int? maxAlternatives;

  /// Specify the maximum number of speakers you want to partition in your media.
  ///
  /// Note that if your media contains more speakers than the specified number,
  /// multiple speakers are treated as a single speaker.
  ///
  /// If you specify the <code>MaxSpeakerLabels</code> field, you must set the
  /// <code>ShowSpeakerLabels</code> field to true.
  final int? maxSpeakerLabels;

  /// To include alternative transcriptions within your transcription output,
  /// include <code>ShowAlternatives</code> in your transcription request.
  ///
  /// If you include <code>ShowAlternatives</code>, you must also include
  /// <code>MaxAlternatives</code>, which is the maximum number of alternative
  /// transcriptions you want Amazon Transcribe Medical to generate.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html">Alternative
  /// transcriptions</a>.
  final bool? showAlternatives;

  /// Enables speaker partitioning (diarization) in your transcription output.
  /// Speaker partitioning labels the speech from individual speakers in your
  /// media file.
  ///
  /// If you enable <code>ShowSpeakerLabels</code> in your request, you must also
  /// include <code>MaxSpeakerLabels</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html">Partitioning
  /// speakers (diarization)</a>.
  final bool? showSpeakerLabels;

  /// The name of the custom vocabulary you want to use when processing your
  /// medical transcription job. Custom vocabulary names are case sensitive.
  ///
  /// The language of the specified custom vocabulary must match the language code
  /// that you specify in your transcription request. If the languages do not
  /// match, the custom vocabulary isn't applied. There are no errors or warnings
  /// associated with a language mismatch. US English (<code>en-US</code>) is the
  /// only valid language for Amazon Transcribe Medical.
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

/// Provides the name of the custom language model that was included in the
/// specified transcription job.
///
/// Only use <code>ModelSettings</code> with the <code>LanguageModelName</code>
/// sub-parameter if you're <b>not</b> using automatic language identification
/// (<code/>). If using <code>LanguageIdSettings</code> in your request, this
/// parameter contains a <code>LanguageModelName</code> sub-parameter.
class ModelSettings {
  /// The name of the custom language model you want to use when processing your
  /// transcription job. Note that custom language model names are case sensitive.
  ///
  /// The language of the specified custom language model must match the language
  /// code that you specify in your transcription request. If the languages do not
  /// match, the custom language model isn't applied. There are no errors or
  /// warnings associated with a language mismatch.
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

extension ModelStatusValueExtension on ModelStatus {
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

extension ModelStatusFromString on String {
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

/// Flag the presence or absence of periods of silence in your Call Analytics
/// transcription output.
///
/// Rules using <code>NonTalkTimeFilter</code> are designed to match:
///
/// <ul>
/// <li>
/// The presence of silence at specified periods throughout the call
/// </li>
/// <li>
/// The presence of speech at specified periods throughout the call
/// </li>
/// </ul>
/// See <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch">Rule
/// criteria for post-call categories</a> for usage examples.
class NonTalkTimeFilter {
  /// Makes it possible to specify a time range (in milliseconds) in your audio,
  /// during which you want to search for a period of silence. See for more
  /// detail.
  final AbsoluteTimeRange? absoluteTimeRange;

  /// Set to <code>TRUE</code> to flag periods of speech. Set to
  /// <code>FALSE</code> to flag periods of silence
  final bool? negate;

  /// Makes it possible to specify a time range (in percentage) in your media
  /// file, during which you want to search for a period of silence. See for more
  /// detail.
  final RelativeTimeRange? relativeTimeRange;

  /// Specify the duration, in milliseconds, of the period of silence that you
  /// want to flag. For example, you can flag a silent period that lasts 30,000
  /// milliseconds.
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

extension OutputLocationTypeValueExtension on OutputLocationType {
  String toValue() {
    switch (this) {
      case OutputLocationType.customerBucket:
        return 'CUSTOMER_BUCKET';
      case OutputLocationType.serviceBucket:
        return 'SERVICE_BUCKET';
    }
  }
}

extension OutputLocationTypeFromString on String {
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

extension ParticipantRoleValueExtension on ParticipantRole {
  String toValue() {
    switch (this) {
      case ParticipantRole.agent:
        return 'AGENT';
      case ParticipantRole.customer:
        return 'CUSTOMER';
    }
  }
}

extension ParticipantRoleFromString on String {
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

enum PiiEntityType {
  bankAccountNumber,
  bankRouting,
  creditDebitNumber,
  creditDebitCvv,
  creditDebitExpiry,
  pin,
  email,
  address,
  name,
  phone,
  ssn,
  all,
}

extension PiiEntityTypeValueExtension on PiiEntityType {
  String toValue() {
    switch (this) {
      case PiiEntityType.bankAccountNumber:
        return 'BANK_ACCOUNT_NUMBER';
      case PiiEntityType.bankRouting:
        return 'BANK_ROUTING';
      case PiiEntityType.creditDebitNumber:
        return 'CREDIT_DEBIT_NUMBER';
      case PiiEntityType.creditDebitCvv:
        return 'CREDIT_DEBIT_CVV';
      case PiiEntityType.creditDebitExpiry:
        return 'CREDIT_DEBIT_EXPIRY';
      case PiiEntityType.pin:
        return 'PIN';
      case PiiEntityType.email:
        return 'EMAIL';
      case PiiEntityType.address:
        return 'ADDRESS';
      case PiiEntityType.name:
        return 'NAME';
      case PiiEntityType.phone:
        return 'PHONE';
      case PiiEntityType.ssn:
        return 'SSN';
      case PiiEntityType.all:
        return 'ALL';
    }
  }
}

extension PiiEntityTypeFromString on String {
  PiiEntityType toPiiEntityType() {
    switch (this) {
      case 'BANK_ACCOUNT_NUMBER':
        return PiiEntityType.bankAccountNumber;
      case 'BANK_ROUTING':
        return PiiEntityType.bankRouting;
      case 'CREDIT_DEBIT_NUMBER':
        return PiiEntityType.creditDebitNumber;
      case 'CREDIT_DEBIT_CVV':
        return PiiEntityType.creditDebitCvv;
      case 'CREDIT_DEBIT_EXPIRY':
        return PiiEntityType.creditDebitExpiry;
      case 'PIN':
        return PiiEntityType.pin;
      case 'EMAIL':
        return PiiEntityType.email;
      case 'ADDRESS':
        return PiiEntityType.address;
      case 'NAME':
        return PiiEntityType.name;
      case 'PHONE':
        return PiiEntityType.phone;
      case 'SSN':
        return PiiEntityType.ssn;
      case 'ALL':
        return PiiEntityType.all;
    }
    throw Exception('$this is not known in enum PiiEntityType');
  }
}

enum RedactionOutput {
  redacted,
  redactedAndUnredacted,
}

extension RedactionOutputValueExtension on RedactionOutput {
  String toValue() {
    switch (this) {
      case RedactionOutput.redacted:
        return 'redacted';
      case RedactionOutput.redactedAndUnredacted:
        return 'redacted_and_unredacted';
    }
  }
}

extension RedactionOutputFromString on String {
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

extension RedactionTypeValueExtension on RedactionType {
  String toValue() {
    switch (this) {
      case RedactionType.pii:
        return 'PII';
    }
  }
}

extension RedactionTypeFromString on String {
  RedactionType toRedactionType() {
    switch (this) {
      case 'PII':
        return RedactionType.pii;
    }
    throw Exception('$this is not known in enum RedactionType');
  }
}

/// A time range, in percentage, between two points in your media file.
///
/// You can use <code>StartPercentage</code> and <code>EndPercentage</code> to
/// search a custom segment. For example, setting <code>StartPercentage</code>
/// to 10 and <code>EndPercentage</code> to 50 only searches for your specified
/// criteria in the audio contained between the 10 percent mark and the 50
/// percent mark of your media file.
///
/// You can use also <code>First</code> to search from the start of the media
/// file until the time that you specify. Or use <code>Last</code> to search
/// from the time that you specify until the end of the media file. For example,
/// setting <code>First</code> to 10 only searches for your specified criteria
/// in the audio contained in the first 10 percent of the media file.
///
/// If you prefer to use milliseconds instead of percentage, see .
class RelativeTimeRange {
  /// The time, in percentage, when Amazon Transcribe stops searching for the
  /// specified criteria in your media file. If you include
  /// <code>EndPercentage</code> in your request, you must also include
  /// <code>StartPercentage</code>.
  final int? endPercentage;

  /// The time, in percentage, from the start of your media file until the
  /// specified value. Amazon Transcribe searches for your specified criteria in
  /// this time segment.
  final int? first;

  /// The time, in percentage, from the specified value until the end of your
  /// media file. Amazon Transcribe searches for your specified criteria in this
  /// time segment.
  final int? last;

  /// The time, in percentage, when Amazon Transcribe starts searching for the
  /// specified criteria in your media file. If you include
  /// <code>StartPercentage</code> in your request, you must also include
  /// <code>EndPercentage</code>.
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

/// A rule is a set of criteria that you can specify to flag an attribute in
/// your Call Analytics output. Rules define a Call Analytics category.
///
/// Rules can include these parameters: , , , and .
///
/// To learn more about Call Analytics rules and categories, see <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html">Creating
/// categories for post-call transcriptions</a> and <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html">Creating
/// categories for real-time transcriptions</a>.
///
/// To learn more about Call Analytics, see <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html">Analyzing
/// call center audio with Call Analytics</a>.
class Rule {
  /// Flag the presence or absence of interruptions in your Call Analytics
  /// transcription output. Refer to for more detail.
  final InterruptionFilter? interruptionFilter;

  /// Flag the presence or absence of periods of silence in your Call Analytics
  /// transcription output. Refer to for more detail.
  final NonTalkTimeFilter? nonTalkTimeFilter;

  /// Flag the presence or absence of specific sentiments in your Call Analytics
  /// transcription output. Refer to for more detail.
  final SentimentFilter? sentimentFilter;

  /// Flag the presence or absence of specific words or phrases in your Call
  /// Analytics transcription output. Refer to for more detail.
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

/// Flag the presence or absence of specific sentiments detected in your Call
/// Analytics transcription output.
///
/// Rules using <code>SentimentFilter</code> are designed to match:
///
/// <ul>
/// <li>
/// The presence or absence of a positive sentiment felt by the customer, agent,
/// or both at specified points in the call
/// </li>
/// <li>
/// The presence or absence of a negative sentiment felt by the customer, agent,
/// or both at specified points in the call
/// </li>
/// <li>
/// The presence or absence of a neutral sentiment felt by the customer, agent,
/// or both at specified points in the call
/// </li>
/// <li>
/// The presence or absence of a mixed sentiment felt by the customer, the
/// agent, or both at specified points in the call
/// </li>
/// </ul>
/// See <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch">Rule
/// criteria for post-call categories</a> for usage examples.
class SentimentFilter {
  /// Specify the sentiments that you want to flag.
  final List<SentimentValue> sentiments;

  /// Makes it possible to specify a time range (in milliseconds) in your audio,
  /// during which you want to search for the specified sentiments. See for more
  /// detail.
  final AbsoluteTimeRange? absoluteTimeRange;

  /// Set to <code>TRUE</code> to flag the sentiments that you didn't include in
  /// your request. Set to <code>FALSE</code> to flag the sentiments that you
  /// specified in your request.
  final bool? negate;

  /// Specify the participant that you want to flag. Omitting this parameter is
  /// equivalent to specifying both participants.
  final ParticipantRole? participantRole;

  /// Makes it possible to specify a time range (in percentage) in your media
  /// file, during which you want to search for the specified sentiments. See for
  /// more detail.
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

extension SentimentValueValueExtension on SentimentValue {
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

extension SentimentValueFromString on String {
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

/// Allows additional optional settings in your request, including channel
/// identification, alternative transcriptions, and speaker partitioning. You
/// can use that to apply custom vocabularies to your transcription job.
class Settings {
  /// Enables channel identification in multi-channel audio.
  ///
  /// Channel identification transcribes the audio on each channel independently,
  /// then appends the output for each channel into one transcript.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html">Transcribing
  /// multi-channel audio</a>.
  final bool? channelIdentification;

  /// Indicate the maximum number of alternative transcriptions you want Amazon
  /// Transcribe to include in your transcript.
  ///
  /// If you select a number greater than the number of alternative transcriptions
  /// generated by Amazon Transcribe, only the actual number of alternative
  /// transcriptions are included.
  ///
  /// If you include <code>MaxAlternatives</code> in your request, you must also
  /// include <code>ShowAlternatives</code> with a value of <code>true</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html">Alternative
  /// transcriptions</a>.
  final int? maxAlternatives;

  /// Specify the maximum number of speakers you want to partition in your media.
  ///
  /// Note that if your media contains more speakers than the specified number,
  /// multiple speakers are treated as a single speaker.
  ///
  /// If you specify the <code>MaxSpeakerLabels</code> field, you must set the
  /// <code>ShowSpeakerLabels</code> field to true.
  final int? maxSpeakerLabels;

  /// To include alternative transcriptions within your transcription output,
  /// include <code>ShowAlternatives</code> in your transcription request.
  ///
  /// If you have multi-channel audio and do not enable channel identification,
  /// your audio is transcribed in a continuous manner and your transcript does
  /// not separate the speech by channel.
  ///
  /// If you include <code>ShowAlternatives</code>, you must also include
  /// <code>MaxAlternatives</code>, which is the maximum number of alternative
  /// transcriptions you want Amazon Transcribe to generate.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-alternatives.html">Alternative
  /// transcriptions</a>.
  final bool? showAlternatives;

  /// Enables speaker partitioning (diarization) in your transcription output.
  /// Speaker partitioning labels the speech from individual speakers in your
  /// media file.
  ///
  /// If you enable <code>ShowSpeakerLabels</code> in your request, you must also
  /// include <code>MaxSpeakerLabels</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html">Partitioning
  /// speakers (diarization)</a>.
  final bool? showSpeakerLabels;

  /// Specify how you want your custom vocabulary filter applied to your
  /// transcript.
  ///
  /// To replace words with <code>***</code>, choose <code>mask</code>.
  ///
  /// To delete words, choose <code>remove</code>.
  ///
  /// To flag words without changing them, choose <code>tag</code>.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// The name of the custom vocabulary filter you want to use in your
  /// transcription job request. This name is case sensitive, cannot contain
  /// spaces, and must be unique within an Amazon Web Services account.
  ///
  /// Note that if you include <code>VocabularyFilterName</code> in your request,
  /// you must also include <code>VocabularyFilterMethod</code>.
  final String? vocabularyFilterName;

  /// The name of the custom vocabulary you want to use in your transcription job
  /// request. This name is case sensitive, cannot contain spaces, and must be
  /// unique within an Amazon Web Services account.
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

extension SpecialtyValueExtension on Specialty {
  String toValue() {
    switch (this) {
      case Specialty.primarycare:
        return 'PRIMARYCARE';
    }
  }
}

extension SpecialtyFromString on String {
  Specialty toSpecialty() {
    switch (this) {
      case 'PRIMARYCARE':
        return Specialty.primarycare;
    }
    throw Exception('$this is not known in enum Specialty');
  }
}

class StartCallAnalyticsJobResponse {
  /// Provides detailed information about the current Call Analytics job,
  /// including job status and, if applicable, failure reason.
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

class StartMedicalScribeJobResponse {
  /// Provides detailed information about the current Medical Scribe job,
  /// including job status and, if applicable, failure reason.
  final MedicalScribeJob? medicalScribeJob;

  StartMedicalScribeJobResponse({
    this.medicalScribeJob,
  });

  factory StartMedicalScribeJobResponse.fromJson(Map<String, dynamic> json) {
    return StartMedicalScribeJobResponse(
      medicalScribeJob: json['MedicalScribeJob'] != null
          ? MedicalScribeJob.fromJson(
              json['MedicalScribeJob'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final medicalScribeJob = this.medicalScribeJob;
    return {
      if (medicalScribeJob != null) 'MedicalScribeJob': medicalScribeJob,
    };
  }
}

class StartMedicalTranscriptionJobResponse {
  /// Provides detailed information about the current medical transcription job,
  /// including job status and, if applicable, failure reason.
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
  /// Provides detailed information about the current transcription job, including
  /// job status and, if applicable, failure reason.
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

extension SubtitleFormatValueExtension on SubtitleFormat {
  String toValue() {
    switch (this) {
      case SubtitleFormat.vtt:
        return 'vtt';
      case SubtitleFormat.srt:
        return 'srt';
    }
  }
}

extension SubtitleFormatFromString on String {
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

/// Generate subtitles for your media file with your transcription request.
///
/// You can choose a start index of 0 or 1, and you can specify either WebVTT or
/// SubRip (or both) as your output format.
///
/// Note that your subtitle files are placed in the same location as your
/// transcription output.
class Subtitles {
  /// Specify the output format for your subtitle file; if you select both WebVTT
  /// (<code>vtt</code>) and SubRip (<code>srt</code>) formats, two output files
  /// are generated.
  final List<SubtitleFormat>? formats;

  /// Specify the starting value that is assigned to the first subtitle segment.
  ///
  /// The default start index for Amazon Transcribe is <code>0</code>, which
  /// differs from the more widely used standard of <code>1</code>. If you're
  /// uncertain which value to use, we recommend choosing <code>1</code>, as this
  /// may improve compatibility with other services.
  final int? outputStartIndex;

  Subtitles({
    this.formats,
    this.outputStartIndex,
  });

  Map<String, dynamic> toJson() {
    final formats = this.formats;
    final outputStartIndex = this.outputStartIndex;
    return {
      if (formats != null) 'Formats': formats.map((e) => e.toValue()).toList(),
      if (outputStartIndex != null) 'OutputStartIndex': outputStartIndex,
    };
  }
}

/// Provides information about your subtitle file, including format, start
/// index, and Amazon S3 location.
class SubtitlesOutput {
  /// Provides the format of your subtitle files. If your request included both
  /// WebVTT (<code>vtt</code>) and SubRip (<code>srt</code>) formats, both
  /// formats are shown.
  final List<SubtitleFormat>? formats;

  /// Provides the start index value for your subtitle files. If you did not
  /// specify a value in your request, the default value of <code>0</code> is
  /// used.
  final int? outputStartIndex;

  /// The Amazon S3 location of your transcript. You can use this URI to access or
  /// download your subtitle file. Your subtitle file is stored in the same
  /// location as your transcript. If you specified both WebVTT and SubRip
  /// subtitle formats, two URIs are provided.
  ///
  /// If you included <code>OutputBucketName</code> in your transcription job
  /// request, this is the URI of that bucket. If you also included
  /// <code>OutputKey</code> in your request, your output is located in the path
  /// you specified in your request.
  ///
  /// If you didn't include <code>OutputBucketName</code> in your transcription
  /// job request, your subtitle file is stored in a service-managed bucket, and
  /// <code>TranscriptFileUri</code> provides you with a temporary URI you can use
  /// for secure access to your subtitle file.
  /// <note>
  /// Temporary URIs for service-managed Amazon S3 buckets are only valid for 15
  /// minutes. If you get an <code>AccesDenied</code> error, you can get a new
  /// temporary URI by running a <code>GetTranscriptionJob</code> or
  /// <code>ListTranscriptionJob</code> request.
  /// </note>
  final List<String>? subtitleFileUris;

  SubtitlesOutput({
    this.formats,
    this.outputStartIndex,
    this.subtitleFileUris,
  });

  factory SubtitlesOutput.fromJson(Map<String, dynamic> json) {
    return SubtitlesOutput(
      formats: (json['Formats'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSubtitleFormat())
          .toList(),
      outputStartIndex: json['OutputStartIndex'] as int?,
      subtitleFileUris: (json['SubtitleFileUris'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final formats = this.formats;
    final outputStartIndex = this.outputStartIndex;
    final subtitleFileUris = this.subtitleFileUris;
    return {
      if (formats != null) 'Formats': formats.map((e) => e.toValue()).toList(),
      if (outputStartIndex != null) 'OutputStartIndex': outputStartIndex,
      if (subtitleFileUris != null) 'SubtitleFileUris': subtitleFileUris,
    };
  }
}

/// Contains <code>GenerateAbstractiveSummary</code>, which is a required
/// parameter if you want to enable Generative call summarization in your Call
/// Analytics request.
class Summarization {
  /// Enables Generative call summarization in your Call Analytics request
  ///
  /// Generative call summarization provides a summary of the transcript including
  /// important components discussed in the conversation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-enable-summarization.html">Enabling
  /// generative call summarization</a>.
  final bool generateAbstractiveSummary;

  Summarization({
    required this.generateAbstractiveSummary,
  });

  factory Summarization.fromJson(Map<String, dynamic> json) {
    return Summarization(
      generateAbstractiveSummary: json['GenerateAbstractiveSummary'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final generateAbstractiveSummary = this.generateAbstractiveSummary;
    return {
      'GenerateAbstractiveSummary': generateAbstractiveSummary,
    };
  }
}

/// Adds metadata, in the form of a key:value pair, to the specified resource.
///
/// For example, you could add the tag <code>Department:Sales</code> to a
/// resource to indicate that it pertains to your organization's sales
/// department. You can also use tags for tag-based access control.
///
/// To learn more about tagging, see <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tagging.html">Tagging
/// resources</a>.
class Tag {
  /// The first part of a key:value pair that forms a tag associated with a given
  /// resource. For example, in the tag <code>Department:Sales</code>, the key is
  /// 'Department'.
  final String key;

  /// The second part of a key:value pair that forms a tag associated with a given
  /// resource. For example, in the tag <code>Department:Sales</code>, the value
  /// is 'Sales'.
  ///
  /// Note that you can set the value of a tag to an empty string, but you can't
  /// set the value of a tag to null. Omitting the tag value is the same as using
  /// an empty string.
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

enum ToxicityCategory {
  all,
}

extension ToxicityCategoryValueExtension on ToxicityCategory {
  String toValue() {
    switch (this) {
      case ToxicityCategory.all:
        return 'ALL';
    }
  }
}

extension ToxicityCategoryFromString on String {
  ToxicityCategory toToxicityCategory() {
    switch (this) {
      case 'ALL':
        return ToxicityCategory.all;
    }
    throw Exception('$this is not known in enum ToxicityCategory');
  }
}

/// Contains <code>ToxicityCategories</code>, which is a required parameter if
/// you want to enable toxicity detection (<code>ToxicityDetection</code>) in
/// your transcription request.
class ToxicityDetectionSettings {
  /// If you include <code>ToxicityDetection</code> in your transcription request,
  /// you must also include <code>ToxicityCategories</code>. The only accepted
  /// value for this parameter is <code>ALL</code>.
  final List<ToxicityCategory> toxicityCategories;

  ToxicityDetectionSettings({
    required this.toxicityCategories,
  });

  factory ToxicityDetectionSettings.fromJson(Map<String, dynamic> json) {
    return ToxicityDetectionSettings(
      toxicityCategories: (json['ToxicityCategories'] as List)
          .whereNotNull()
          .map((e) => (e as String).toToxicityCategory())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final toxicityCategories = this.toxicityCategories;
    return {
      'ToxicityCategories': toxicityCategories.map((e) => e.toValue()).toList(),
    };
  }
}

/// Provides you with the Amazon S3 URI you can use to access your transcript.
class Transcript {
  /// The Amazon S3 location of your redacted transcript. You can use this URI to
  /// access or download your transcript.
  ///
  /// If you included <code>OutputBucketName</code> in your transcription job
  /// request, this is the URI of that bucket. If you also included
  /// <code>OutputKey</code> in your request, your output is located in the path
  /// you specified in your request.
  ///
  /// If you didn't include <code>OutputBucketName</code> in your transcription
  /// job request, your transcript is stored in a service-managed bucket, and
  /// <code>RedactedTranscriptFileUri</code> provides you with a temporary URI you
  /// can use for secure access to your transcript.
  /// <note>
  /// Temporary URIs for service-managed Amazon S3 buckets are only valid for 15
  /// minutes. If you get an <code>AccesDenied</code> error, you can get a new
  /// temporary URI by running a <code>GetTranscriptionJob</code> or
  /// <code>ListTranscriptionJob</code> request.
  /// </note>
  final String? redactedTranscriptFileUri;

  /// The Amazon S3 location of your transcript. You can use this URI to access or
  /// download your transcript.
  ///
  /// If you included <code>OutputBucketName</code> in your transcription job
  /// request, this is the URI of that bucket. If you also included
  /// <code>OutputKey</code> in your request, your output is located in the path
  /// you specified in your request.
  ///
  /// If you didn't include <code>OutputBucketName</code> in your transcription
  /// job request, your transcript is stored in a service-managed bucket, and
  /// <code>TranscriptFileUri</code> provides you with a temporary URI you can use
  /// for secure access to your transcript.
  /// <note>
  /// Temporary URIs for service-managed Amazon S3 buckets are only valid for 15
  /// minutes. If you get an <code>AccesDenied</code> error, you can get a new
  /// temporary URI by running a <code>GetTranscriptionJob</code> or
  /// <code>ListTranscriptionJob</code> request.
  /// </note>
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

/// Flag the presence or absence of specific words or phrases detected in your
/// Call Analytics transcription output.
///
/// Rules using <code>TranscriptFilter</code> are designed to match:
///
/// <ul>
/// <li>
/// Custom words or phrases spoken by the agent, the customer, or both
/// </li>
/// <li>
/// Custom words or phrases <b>not</b> spoken by the agent, the customer, or
/// either
/// </li>
/// <li>
/// Custom words or phrases that occur at a specific time frame
/// </li>
/// </ul>
/// See <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-batch.html#tca-rules-batch">Rule
/// criteria for post-call categories</a> and <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-categories-stream.html#tca-rules-stream">Rule
/// criteria for streaming categories</a> for usage examples.
class TranscriptFilter {
  /// Specify the phrases that you want to flag.
  final List<String> targets;

  /// Flag the presence or absence of an exact match to the phrases that you
  /// specify. For example, if you specify the phrase "speak to a manager" as your
  /// <code>Targets</code> value, only that exact phrase is flagged.
  ///
  /// Note that semantic matching is not supported. For example, if your customer
  /// says "speak to <i>the</i> manager", instead of "speak to <i>a</i> manager",
  /// your content is not flagged.
  final TranscriptFilterType transcriptFilterType;

  /// Makes it possible to specify a time range (in milliseconds) in your audio,
  /// during which you want to search for the specified key words or phrases. See
  /// for more detail.
  final AbsoluteTimeRange? absoluteTimeRange;

  /// Set to <code>TRUE</code> to flag the absence of the phrase that you
  /// specified in your request. Set to <code>FALSE</code> to flag the presence of
  /// the phrase that you specified in your request.
  final bool? negate;

  /// Specify the participant that you want to flag. Omitting this parameter is
  /// equivalent to specifying both participants.
  final ParticipantRole? participantRole;

  /// Makes it possible to specify a time range (in percentage) in your media
  /// file, during which you want to search for the specified key words or
  /// phrases. See for more detail.
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

extension TranscriptFilterTypeValueExtension on TranscriptFilterType {
  String toValue() {
    switch (this) {
      case TranscriptFilterType.exact:
        return 'EXACT';
    }
  }
}

extension TranscriptFilterTypeFromString on String {
  TranscriptFilterType toTranscriptFilterType() {
    switch (this) {
      case 'EXACT':
        return TranscriptFilterType.exact;
    }
    throw Exception('$this is not known in enum TranscriptFilterType');
  }
}

/// Provides detailed information about a transcription job.
///
/// To view the status of the specified transcription job, check the
/// <code>TranscriptionJobStatus</code> field. If the status is
/// <code>COMPLETED</code>, the job is finished and you can find the results at
/// the location specified in <code>TranscriptFileUri</code>. If the status is
/// <code>FAILED</code>, <code>FailureReason</code> provides details on why your
/// transcription job failed.
///
/// If you enabled content redaction, the redacted transcript can be found at
/// the location specified in <code>RedactedTranscriptFileUri</code>.
class TranscriptionJob {
  /// The date and time the specified transcription job finished processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a
  /// transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
  final DateTime? completionTime;

  /// Indicates whether redaction was enabled in your transcript.
  final ContentRedaction? contentRedaction;

  /// The date and time the specified transcription job request was made.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? creationTime;

  /// If <code>TranscriptionJobStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the transcription
  /// job request failed.
  ///
  /// The <code>FailureReason</code> field contains one of the following values:
  ///
  /// <ul>
  /// <li>
  /// <code>Unsupported media format</code>.
  ///
  /// The media format specified in <code>MediaFormat</code> isn't valid. Refer to
  /// refer to the <code>MediaFormat</code> parameter for a list of supported
  /// formats.
  /// </li>
  /// <li>
  /// <code>The media format provided does not match the detected media
  /// format</code>.
  ///
  /// The media format specified in <code>MediaFormat</code> doesn't match the
  /// format of the input file. Check the media format of your media file and
  /// correct the specified value.
  /// </li>
  /// <li>
  /// <code>Invalid sample rate for audio file</code>.
  ///
  /// The sample rate specified in <code>MediaSampleRateHertz</code> isn't valid.
  /// The sample rate must be between 8,000 and 48,000 hertz.
  /// </li>
  /// <li>
  /// <code>The sample rate provided does not match the detected sample
  /// rate</code>.
  ///
  /// The sample rate specified in <code>MediaSampleRateHertz</code> doesn't match
  /// the sample rate detected in your input media file. Check the sample rate of
  /// your media file and correct the specified value.
  /// </li>
  /// <li>
  /// <code>Invalid file size: file size too large</code>.
  ///
  /// The size of your media file is larger than what Amazon Transcribe can
  /// process. For more information, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe">Service
  /// quotas</a>.
  /// </li>
  /// <li>
  /// <code>Invalid number of channels: number of channels too large</code>.
  ///
  /// Your audio contains more channels than Amazon Transcribe is able to process.
  /// For more information, refer to <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/transcribe.html#limits-amazon-transcribe">Service
  /// quotas</a>.
  /// </li>
  /// </ul>
  final String? failureReason;

  /// The confidence score associated with the language identified in your media
  /// file.
  ///
  /// Confidence scores are values between 0 and 1; a larger value indicates a
  /// higher probability that the identified language correctly matches the
  /// language spoken in your media.
  final double? identifiedLanguageScore;

  /// Indicates whether automatic language identification was enabled
  /// (<code>TRUE</code>) for the specified transcription job.
  final bool? identifyLanguage;

  /// Indicates whether automatic multi-language identification was enabled
  /// (<code>TRUE</code>) for the specified transcription job.
  final bool? identifyMultipleLanguages;

  /// Provides information about how your transcription job was processed. This
  /// parameter shows if your request was queued and what data access role was
  /// used.
  final JobExecutionSettings? jobExecutionSettings;

  /// The language code used to create your transcription job. This parameter is
  /// used with single-language identification. For multi-language identification
  /// requests, refer to the plural version of this parameter,
  /// <code>LanguageCodes</code>.
  final LanguageCode? languageCode;

  /// The language codes used to create your transcription job. This parameter is
  /// used with multi-language identification. For single-language identification
  /// requests, refer to the singular version of this parameter,
  /// <code>LanguageCode</code>.
  final List<LanguageCodeItem>? languageCodes;

  /// Provides the name and language of all custom language models, custom
  /// vocabularies, and custom vocabulary filters that you included in your
  /// request.
  final Map<LanguageCode, LanguageIdSettings>? languageIdSettings;

  /// Provides the language codes you specified in your request.
  final List<LanguageCode>? languageOptions;

  /// Provides the Amazon S3 location of the media file you used in your request.
  final Media? media;

  /// The format of the input media file.
  final MediaFormat? mediaFormat;

  /// The sample rate, in hertz, of the audio track in your input media file.
  final int? mediaSampleRateHertz;

  /// Provides information on the custom language model you included in your
  /// request.
  final ModelSettings? modelSettings;

  /// Provides information on any additional settings that were included in your
  /// request. Additional settings include channel identification, alternative
  /// transcriptions, speaker partitioning, custom vocabularies, and custom
  /// vocabulary filters.
  final Settings? settings;

  /// The date and time the specified transcription job began processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? startTime;

  /// Indicates whether subtitles were generated with your transcription.
  final SubtitlesOutput? subtitles;

  /// The tags, each in the form of a key:value pair, assigned to the specified
  /// transcription job.
  final List<Tag>? tags;

  /// Provides information about the toxicity detection settings applied to your
  /// transcription.
  final List<ToxicityDetectionSettings>? toxicityDetection;

  /// Provides you with the Amazon S3 URI you can use to access your transcript.
  final Transcript? transcript;

  /// The name of the transcription job. Job names are case sensitive and must be
  /// unique within an Amazon Web Services account.
  final String? transcriptionJobName;

  /// Provides the status of the specified transcription job.
  ///
  /// If the status is <code>COMPLETED</code>, the job is finished and you can
  /// find the results at the location specified in <code>TranscriptFileUri</code>
  /// (or <code>RedactedTranscriptFileUri</code>, if you requested transcript
  /// redaction). If the status is <code>FAILED</code>, <code>FailureReason</code>
  /// provides details on why your transcription job failed.
  final TranscriptionJobStatus? transcriptionJobStatus;

  TranscriptionJob({
    this.completionTime,
    this.contentRedaction,
    this.creationTime,
    this.failureReason,
    this.identifiedLanguageScore,
    this.identifyLanguage,
    this.identifyMultipleLanguages,
    this.jobExecutionSettings,
    this.languageCode,
    this.languageCodes,
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
    this.toxicityDetection,
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
      identifyMultipleLanguages: json['IdentifyMultipleLanguages'] as bool?,
      jobExecutionSettings: json['JobExecutionSettings'] != null
          ? JobExecutionSettings.fromJson(
              json['JobExecutionSettings'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      languageCodes: (json['LanguageCodes'] as List?)
          ?.whereNotNull()
          .map((e) => LanguageCodeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
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
      toxicityDetection: (json['ToxicityDetection'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ToxicityDetectionSettings.fromJson(e as Map<String, dynamic>))
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
    final identifyMultipleLanguages = this.identifyMultipleLanguages;
    final jobExecutionSettings = this.jobExecutionSettings;
    final languageCode = this.languageCode;
    final languageCodes = this.languageCodes;
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
    final toxicityDetection = this.toxicityDetection;
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
      if (identifyMultipleLanguages != null)
        'IdentifyMultipleLanguages': identifyMultipleLanguages,
      if (jobExecutionSettings != null)
        'JobExecutionSettings': jobExecutionSettings,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (languageCodes != null) 'LanguageCodes': languageCodes,
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
      if (toxicityDetection != null) 'ToxicityDetection': toxicityDetection,
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

extension TranscriptionJobStatusValueExtension on TranscriptionJobStatus {
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

extension TranscriptionJobStatusFromString on String {
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

/// Provides detailed information about a specific transcription job.
class TranscriptionJobSummary {
  /// The date and time the specified transcription job finished processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:33:13.922000-07:00</code> represents a
  /// transcription job that started processing at 12:33 PM UTC-7 on May 4, 2022.
  final DateTime? completionTime;

  /// The content redaction settings of the transcription job.
  final ContentRedaction? contentRedaction;

  /// The date and time the specified transcription job request was made.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? creationTime;

  /// If <code>TranscriptionJobStatus</code> is <code>FAILED</code>,
  /// <code>FailureReason</code> contains information about why the transcription
  /// job failed. See also: <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/CommonErrors.html">Common
  /// Errors</a>.
  final String? failureReason;

  /// The confidence score associated with the language identified in your media
  /// file.
  ///
  /// Confidence scores are values between 0 and 1; a larger value indicates a
  /// higher probability that the identified language correctly matches the
  /// language spoken in your media.
  final double? identifiedLanguageScore;

  /// Indicates whether automatic language identification was enabled
  /// (<code>TRUE</code>) for the specified transcription job.
  final bool? identifyLanguage;

  /// Indicates whether automatic multi-language identification was enabled
  /// (<code>TRUE</code>) for the specified transcription job.
  final bool? identifyMultipleLanguages;

  /// The language code used to create your transcription.
  final LanguageCode? languageCode;

  /// The language codes used to create your transcription job. This parameter is
  /// used with multi-language identification. For single-language identification,
  /// the singular version of this parameter, <code>LanguageCode</code>, is
  /// present.
  final List<LanguageCodeItem>? languageCodes;
  final ModelSettings? modelSettings;

  /// Indicates where the specified transcription output is stored.
  ///
  /// If the value is <code>CUSTOMER_BUCKET</code>, the location is the Amazon S3
  /// bucket you specified using the <code>OutputBucketName</code> parameter in
  /// your request. If you also included <code>OutputKey</code> in your request,
  /// your output is located in the path you specified in your request.
  ///
  /// If the value is <code>SERVICE_BUCKET</code>, the location is a
  /// service-managed Amazon S3 bucket. To access a transcript stored in a
  /// service-managed bucket, use the URI shown in the
  /// <code>TranscriptFileUri</code> or <code>RedactedTranscriptFileUri</code>
  /// field.
  final OutputLocationType? outputLocationType;

  /// The date and time your transcription job began processing.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.789000-07:00</code> represents a
  /// transcription job that started processing at 12:32 PM UTC-7 on May 4, 2022.
  final DateTime? startTime;

  /// Indicates whether toxicity detection was enabled for the specified
  /// transcription job.
  final List<ToxicityDetectionSettings>? toxicityDetection;

  /// The name of the transcription job. Job names are case sensitive and must be
  /// unique within an Amazon Web Services account.
  final String? transcriptionJobName;

  /// Provides the status of your transcription job.
  ///
  /// If the status is <code>COMPLETED</code>, the job is finished and you can
  /// find the results at the location specified in <code>TranscriptFileUri</code>
  /// (or <code>RedactedTranscriptFileUri</code>, if you requested transcript
  /// redaction). If the status is <code>FAILED</code>, <code>FailureReason</code>
  /// provides details on why your transcription job failed.
  final TranscriptionJobStatus? transcriptionJobStatus;

  TranscriptionJobSummary({
    this.completionTime,
    this.contentRedaction,
    this.creationTime,
    this.failureReason,
    this.identifiedLanguageScore,
    this.identifyLanguage,
    this.identifyMultipleLanguages,
    this.languageCode,
    this.languageCodes,
    this.modelSettings,
    this.outputLocationType,
    this.startTime,
    this.toxicityDetection,
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
      identifyMultipleLanguages: json['IdentifyMultipleLanguages'] as bool?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      languageCodes: (json['LanguageCodes'] as List?)
          ?.whereNotNull()
          .map((e) => LanguageCodeItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      modelSettings: json['ModelSettings'] != null
          ? ModelSettings.fromJson(
              json['ModelSettings'] as Map<String, dynamic>)
          : null,
      outputLocationType:
          (json['OutputLocationType'] as String?)?.toOutputLocationType(),
      startTime: timeStampFromJson(json['StartTime']),
      toxicityDetection: (json['ToxicityDetection'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ToxicityDetectionSettings.fromJson(e as Map<String, dynamic>))
          .toList(),
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
    final identifyMultipleLanguages = this.identifyMultipleLanguages;
    final languageCode = this.languageCode;
    final languageCodes = this.languageCodes;
    final modelSettings = this.modelSettings;
    final outputLocationType = this.outputLocationType;
    final startTime = this.startTime;
    final toxicityDetection = this.toxicityDetection;
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
      if (identifyMultipleLanguages != null)
        'IdentifyMultipleLanguages': identifyMultipleLanguages,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (languageCodes != null) 'LanguageCodes': languageCodes,
      if (modelSettings != null) 'ModelSettings': modelSettings,
      if (outputLocationType != null)
        'OutputLocationType': outputLocationType.toValue(),
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (toxicityDetection != null) 'ToxicityDetection': toxicityDetection,
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

extension TypeValueExtension on Type {
  String toValue() {
    switch (this) {
      case Type.conversation:
        return 'CONVERSATION';
      case Type.dictation:
        return 'DICTATION';
    }
  }
}

extension TypeFromString on String {
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
  /// Provides you with the properties of the Call Analytics category you
  /// specified in your <code>UpdateCallAnalyticsCategory</code> request.
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
  /// The language code you selected for your custom medical vocabulary. US
  /// English (<code>en-US</code>) is the only language supported with Amazon
  /// Transcribe Medical.
  final LanguageCode? languageCode;

  /// The date and time the specified custom medical vocabulary was last updated.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name of the updated custom medical vocabulary.
  final String? vocabularyName;

  /// The processing state of your custom medical vocabulary. If the state is
  /// <code>READY</code>, you can use the custom vocabulary in a
  /// <code>StartMedicalTranscriptionJob</code> request.
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
  /// The language code you selected for your custom vocabulary filter.
  final LanguageCode? languageCode;

  /// The date and time the specified custom vocabulary filter was last updated.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name of the updated custom vocabulary filter.
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
  /// The language code you selected for your custom vocabulary.
  final LanguageCode? languageCode;

  /// The date and time the specified custom vocabulary was last updated.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// The name of the updated custom vocabulary.
  final String? vocabularyName;

  /// The processing state of your custom vocabulary. If the state is
  /// <code>READY</code>, you can use the custom vocabulary in a
  /// <code>StartTranscriptionJob</code> request.
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

/// Provides information about a custom vocabulary filter, including the
/// language of the filter, when it was last modified, and its name.
class VocabularyFilterInfo {
  /// The language code that represents the language of the entries in your
  /// vocabulary filter. Each custom vocabulary filter must contain terms in only
  /// one language.
  ///
  /// A custom vocabulary filter can only be used to transcribe files in the same
  /// language as the filter. For example, if you create a custom vocabulary
  /// filter using US English (<code>en-US</code>), you can only apply this filter
  /// to files that contain English audio.
  ///
  /// For a list of supported languages and their associated language codes, refer
  /// to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  final LanguageCode? languageCode;

  /// The date and time the specified custom vocabulary filter was last modified.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// A unique name, chosen by you, for your custom vocabulary filter. This name
  /// is case sensitive, cannot contain spaces, and must be unique within an
  /// Amazon Web Services account.
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

extension VocabularyFilterMethodValueExtension on VocabularyFilterMethod {
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

extension VocabularyFilterMethodFromString on String {
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

/// Provides information about a custom vocabulary, including the language of
/// the custom vocabulary, when it was last modified, its name, and the
/// processing state.
class VocabularyInfo {
  /// The language code used to create your custom vocabulary. Each custom
  /// vocabulary must contain terms in only one language.
  ///
  /// A custom vocabulary can only be used to transcribe files in the same
  /// language as the custom vocabulary. For example, if you create a custom
  /// vocabulary using US English (<code>en-US</code>), you can only apply this
  /// custom vocabulary to files that contain English audio.
  final LanguageCode? languageCode;

  /// The date and time the specified custom vocabulary was last modified.
  ///
  /// Timestamps are in the format <code>YYYY-MM-DD'T'HH:MM:SS.SSSSSS-UTC</code>.
  /// For example, <code>2022-05-04T12:32:58.761000-07:00</code> represents 12:32
  /// PM UTC-7 on May 4, 2022.
  final DateTime? lastModifiedTime;

  /// A unique name, chosen by you, for your custom vocabulary. This name is case
  /// sensitive, cannot contain spaces, and must be unique within an Amazon Web
  /// Services account.
  final String? vocabularyName;

  /// The processing state of your custom vocabulary. If the state is
  /// <code>READY</code>, you can use the custom vocabulary in a
  /// <code>StartTranscriptionJob</code> request.
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

extension VocabularyStateValueExtension on VocabularyState {
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

extension VocabularyStateFromString on String {
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
