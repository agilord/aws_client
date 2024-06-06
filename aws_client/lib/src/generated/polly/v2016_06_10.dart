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

/// Amazon Polly is a web service that makes it easy to synthesize speech from
/// text.
///
/// The Amazon Polly service provides API operations for synthesizing
/// high-quality speech from plain text and Speech Synthesis Markup Language
/// (SSML), along with managing pronunciations lexicons that enable you to get
/// the best results for your application domain.
class Polly {
  final _s.RestJsonProtocol _protocol;
  Polly({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'polly',
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

  /// Deletes the specified pronunciation lexicon stored in an Amazon Web
  /// Services Region. A lexicon which has been deleted is not available for
  /// speech synthesis, nor is it possible to retrieve it using either the
  /// <code>GetLexicon</code> or <code>ListLexicon</code> APIs.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing
  /// Lexicons</a>.
  ///
  /// May throw [LexiconNotFoundException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the lexicon to delete. Must be an existing lexicon in the
  /// region.
  Future<void> deleteLexicon({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/lexicons/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the list of voices that are available for use when requesting
  /// speech synthesis. Each voice speaks a specified language, is either male
  /// or female, and is identified by an ID, which is the ASCII version of the
  /// voice name.
  ///
  /// When synthesizing speech ( <code>SynthesizeSpeech</code> ), you provide
  /// the voice ID for the voice you want from the list of voices returned by
  /// <code>DescribeVoices</code>.
  ///
  /// For example, you want your news reader application to read news in a
  /// specific language, but giving a user the option to choose the voice. Using
  /// the <code>DescribeVoices</code> operation you can provide the user with a
  /// list of available voices to select from.
  ///
  /// You can optionally specify a language code to filter the available voices.
  /// For example, if you specify <code>en-US</code>, the operation returns a
  /// list of all available US English voices.
  ///
  /// This operation requires permissions to perform the
  /// <code>polly:DescribeVoices</code> action.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [engine] :
  /// Specifies the engine (<code>standard</code>, <code>neural</code>,
  /// <code>long-form</code> or <code>generative</code>) used by Amazon Polly
  /// when processing input text for speech synthesis.
  ///
  /// Parameter [includeAdditionalLanguageCodes] :
  /// Boolean value indicating whether to return any bilingual voices that use
  /// the specified language as an additional language. For instance, if you
  /// request all languages that use US English (es-US), and there is an Italian
  /// voice that speaks both Italian (it-IT) and US English, that voice will be
  /// included if you specify <code>yes</code> but not if you specify
  /// <code>no</code>.
  ///
  /// Parameter [languageCode] :
  /// The language identification tag (ISO 639 code for the language name-ISO
  /// 3166 country code) for filtering the list of voices returned. If you don't
  /// specify this optional parameter, all available voices are returned.
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token returned from the previous
  /// <code>DescribeVoices</code> operation. If present, this indicates where to
  /// continue the listing.
  Future<DescribeVoicesOutput> describeVoices({
    Engine? engine,
    bool? includeAdditionalLanguageCodes,
    LanguageCode? languageCode,
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (engine != null) 'Engine': [engine.toValue()],
      if (includeAdditionalLanguageCodes != null)
        'IncludeAdditionalLanguageCodes': [
          includeAdditionalLanguageCodes.toString()
        ],
      if (languageCode != null) 'LanguageCode': [languageCode.toValue()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/voices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVoicesOutput.fromJson(response);
  }

  /// Returns the content of the specified pronunciation lexicon stored in an
  /// Amazon Web Services Region. For more information, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing
  /// Lexicons</a>.
  ///
  /// May throw [LexiconNotFoundException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// Name of the lexicon.
  Future<GetLexiconOutput> getLexicon({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/lexicons/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLexiconOutput.fromJson(response);
  }

  /// Retrieves a specific SpeechSynthesisTask object based on its TaskID. This
  /// object contains information about the given speech synthesis task,
  /// including the status of the task, and a link to the S3 bucket containing
  /// the output of the task.
  ///
  /// May throw [InvalidTaskIdException].
  /// May throw [ServiceFailureException].
  /// May throw [SynthesisTaskNotFoundException].
  ///
  /// Parameter [taskId] :
  /// The Amazon Polly generated identifier for a speech synthesis task.
  Future<GetSpeechSynthesisTaskOutput> getSpeechSynthesisTask({
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/synthesisTasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSpeechSynthesisTaskOutput.fromJson(response);
  }

  /// Returns a list of pronunciation lexicons stored in an Amazon Web Services
  /// Region. For more information, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing
  /// Lexicons</a>.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [nextToken] :
  /// An opaque pagination token returned from previous
  /// <code>ListLexicons</code> operation. If present, indicates where to
  /// continue the list of lexicons.
  Future<ListLexiconsOutput> listLexicons({
    String? nextToken,
  }) async {
    final $query = <String, List<String>>{
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/lexicons',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLexiconsOutput.fromJson(response);
  }

  /// Returns a list of SpeechSynthesisTask objects ordered by their creation
  /// date. This operation can filter the tasks by their status, for example,
  /// allowing users to list only tasks that are completed.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of speech synthesis tasks returned in a List operation.
  ///
  /// Parameter [nextToken] :
  /// The pagination token to use in the next request to continue the listing of
  /// speech synthesis tasks.
  ///
  /// Parameter [status] :
  /// Status of the speech synthesis tasks returned in a List operation
  Future<ListSpeechSynthesisTasksOutput> listSpeechSynthesisTasks({
    int? maxResults,
    String? nextToken,
    TaskStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
      if (status != null) 'Status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/synthesisTasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSpeechSynthesisTasksOutput.fromJson(response);
  }

  /// Stores a pronunciation lexicon in an Amazon Web Services Region. If a
  /// lexicon with the same name already exists in the region, it is overwritten
  /// by the new lexicon. Lexicon operations have eventual consistency,
  /// therefore, it might take some time before the lexicon is available to the
  /// SynthesizeSpeech operation.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing
  /// Lexicons</a>.
  ///
  /// May throw [InvalidLexiconException].
  /// May throw [UnsupportedPlsAlphabetException].
  /// May throw [UnsupportedPlsLanguageException].
  /// May throw [LexiconSizeExceededException].
  /// May throw [MaxLexemeLengthExceededException].
  /// May throw [MaxLexiconsNumberExceededException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [content] :
  /// Content of the PLS lexicon as string data.
  ///
  /// Parameter [name] :
  /// Name of the lexicon. The name must follow the regular express format
  /// [0-9A-Za-z]{1,20}. That is, the name is a case-sensitive alphanumeric
  /// string up to 20 characters long.
  Future<void> putLexicon({
    required String content,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'Content': content,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/lexicons/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Allows the creation of an asynchronous synthesis task, by starting a new
  /// <code>SpeechSynthesisTask</code>. This operation requires all the standard
  /// information needed for speech synthesis, plus the name of an Amazon S3
  /// bucket for the service to store the output of the synthesis task and two
  /// optional parameters (<code>OutputS3KeyPrefix</code> and
  /// <code>SnsTopicArn</code>). Once the synthesis task is created, this
  /// operation will return a <code>SpeechSynthesisTask</code> object, which
  /// will include an identifier of this task as well as the current status. The
  /// <code>SpeechSynthesisTask</code> object is available for 72 hours after
  /// starting the asynchronous synthesis task.
  ///
  /// May throw [TextLengthExceededException].
  /// May throw [InvalidS3BucketException].
  /// May throw [InvalidS3KeyException].
  /// May throw [InvalidSampleRateException].
  /// May throw [InvalidSnsTopicArnException].
  /// May throw [InvalidSsmlException].
  /// May throw [EngineNotSupportedException].
  /// May throw [LexiconNotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [MarksNotSupportedForFormatException].
  /// May throw [SsmlMarksNotSupportedForTextTypeException].
  /// May throw [LanguageNotSupportedException].
  ///
  /// Parameter [outputFormat] :
  /// The format in which the returned output will be encoded. For audio stream,
  /// this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json.
  ///
  /// Parameter [outputS3BucketName] :
  /// Amazon S3 bucket name to which the output file will be saved.
  ///
  /// Parameter [text] :
  /// The input text to synthesize. If you specify ssml as the TextType, follow
  /// the SSML format for the input text.
  ///
  /// Parameter [voiceId] :
  /// Voice ID to use for the synthesis.
  ///
  /// Parameter [engine] :
  /// Specifies the engine (<code>standard</code>, <code>neural</code>,
  /// <code>long-form</code> or <code>generative</code>) for Amazon Polly to use
  /// when processing input text for speech synthesis. Using a voice that is not
  /// supported for the engine selected will result in an error.
  ///
  /// Parameter [languageCode] :
  /// Optional language code for the Speech Synthesis request. This is only
  /// necessary if using a bilingual voice, such as Aditi, which can be used for
  /// either Indian English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon
  /// Polly uses the default language of the bilingual voice. The default
  /// language for any voice is the one returned by the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a>
  /// operation for the <code>LanguageCode</code> parameter. For example, if no
  /// language code is specified, Aditi will use Indian English rather than
  /// Hindi.
  ///
  /// Parameter [lexiconNames] :
  /// List of one or more pronunciation lexicon names you want the service to
  /// apply during synthesis. Lexicons are applied only if the language of the
  /// lexicon is the same as the language of the voice.
  ///
  /// Parameter [outputS3KeyPrefix] :
  /// The Amazon S3 key prefix for the output speech file.
  ///
  /// Parameter [sampleRate] :
  /// The audio frequency specified in Hz.
  ///
  /// The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and
  /// "24000". The default value for standard voices is "22050". The default
  /// value for neural voices is "24000". The default value for long-form voices
  /// is "24000". The default value for generative voices is "24000".
  ///
  /// Valid values for pcm are "8000" and "16000" The default value is "16000".
  ///
  /// Parameter [snsTopicArn] :
  /// ARN for the SNS topic optionally used for providing status notification
  /// for a speech synthesis task.
  ///
  /// Parameter [speechMarkTypes] :
  /// The type of speech marks returned for the input text.
  ///
  /// Parameter [textType] :
  /// Specifies whether the input text is plain text or SSML. The default value
  /// is plain text.
  Future<StartSpeechSynthesisTaskOutput> startSpeechSynthesisTask({
    required OutputFormat outputFormat,
    required String outputS3BucketName,
    required String text,
    required VoiceId voiceId,
    Engine? engine,
    LanguageCode? languageCode,
    List<String>? lexiconNames,
    String? outputS3KeyPrefix,
    String? sampleRate,
    String? snsTopicArn,
    List<SpeechMarkType>? speechMarkTypes,
    TextType? textType,
  }) async {
    final $payload = <String, dynamic>{
      'OutputFormat': outputFormat.toValue(),
      'OutputS3BucketName': outputS3BucketName,
      'Text': text,
      'VoiceId': voiceId.toValue(),
      if (engine != null) 'Engine': engine.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lexiconNames != null) 'LexiconNames': lexiconNames,
      if (outputS3KeyPrefix != null) 'OutputS3KeyPrefix': outputS3KeyPrefix,
      if (sampleRate != null) 'SampleRate': sampleRate,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (speechMarkTypes != null)
        'SpeechMarkTypes': speechMarkTypes.map((e) => e.toValue()).toList(),
      if (textType != null) 'TextType': textType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/synthesisTasks',
      exceptionFnMap: _exceptionFns,
    );
    return StartSpeechSynthesisTaskOutput.fromJson(response);
  }

  /// Synthesizes UTF-8 input, plain text or SSML, to a stream of bytes. SSML
  /// input must be valid, well-formed SSML. Some alphabets might not be
  /// available with all the voices (for example, Cyrillic might not be read at
  /// all by English voices) unless phoneme mapping is used. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/how-text-to-speech-works.html">How
  /// it Works</a>.
  ///
  /// May throw [TextLengthExceededException].
  /// May throw [InvalidSampleRateException].
  /// May throw [InvalidSsmlException].
  /// May throw [LexiconNotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [MarksNotSupportedForFormatException].
  /// May throw [SsmlMarksNotSupportedForTextTypeException].
  /// May throw [LanguageNotSupportedException].
  /// May throw [EngineNotSupportedException].
  ///
  /// Parameter [outputFormat] :
  /// The format in which the returned output will be encoded. For audio stream,
  /// this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json.
  ///
  /// When pcm is used, the content returned is audio/pcm in a signed 16-bit, 1
  /// channel (mono), little-endian format.
  ///
  /// Parameter [text] :
  /// Input text to synthesize. If you specify <code>ssml</code> as the
  /// <code>TextType</code>, follow the SSML format for the input text.
  ///
  /// Parameter [voiceId] :
  /// Voice ID to use for the synthesis. You can get a list of available voice
  /// IDs by calling the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a>
  /// operation.
  ///
  /// Parameter [engine] :
  /// Specifies the engine (<code>standard</code>, <code>neural</code>,
  /// <code>long-form</code>, or <code>generative</code>) for Amazon Polly to
  /// use when processing input text for speech synthesis. Provide an engine
  /// that is supported by the voice you select. If you don't provide an engine,
  /// the standard engine is selected by default. If a chosen voice isn't
  /// supported by the standard engine, this will result in an error. For
  /// information on Amazon Polly voices and which voices are available for each
  /// engine, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/voicelist.html">Available
  /// Voices</a>.
  ///
  /// Type: String
  ///
  /// Valid Values: <code>standard</code> | <code>neural</code> |
  /// <code>long-form</code> | <code>generative</code>
  ///
  /// Required: Yes
  ///
  /// Parameter [languageCode] :
  /// Optional language code for the Synthesize Speech request. This is only
  /// necessary if using a bilingual voice, such as Aditi, which can be used for
  /// either Indian English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon
  /// Polly uses the default language of the bilingual voice. The default
  /// language for any voice is the one returned by the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a>
  /// operation for the <code>LanguageCode</code> parameter. For example, if no
  /// language code is specified, Aditi will use Indian English rather than
  /// Hindi.
  ///
  /// Parameter [lexiconNames] :
  /// List of one or more pronunciation lexicon names you want the service to
  /// apply during synthesis. Lexicons are applied only if the language of the
  /// lexicon is the same as the language of the voice. For information about
  /// storing lexicons, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/API_PutLexicon.html">PutLexicon</a>.
  ///
  /// Parameter [sampleRate] :
  /// The audio frequency specified in Hz.
  ///
  /// The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and
  /// "24000". The default value for standard voices is "22050". The default
  /// value for neural voices is "24000". The default value for long-form voices
  /// is "24000". The default value for generative voices is "24000".
  ///
  /// Valid values for pcm are "8000" and "16000" The default value is "16000".
  ///
  /// Parameter [speechMarkTypes] :
  /// The type of speech marks returned for the input text.
  ///
  /// Parameter [textType] :
  /// Specifies whether the input text is plain text or SSML. The default value
  /// is plain text. For more information, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/ssml.html">Using
  /// SSML</a>.
  Future<SynthesizeSpeechOutput> synthesizeSpeech({
    required OutputFormat outputFormat,
    required String text,
    required VoiceId voiceId,
    Engine? engine,
    LanguageCode? languageCode,
    List<String>? lexiconNames,
    String? sampleRate,
    List<SpeechMarkType>? speechMarkTypes,
    TextType? textType,
  }) async {
    final $payload = <String, dynamic>{
      'OutputFormat': outputFormat.toValue(),
      'Text': text,
      'VoiceId': voiceId.toValue(),
      if (engine != null) 'Engine': engine.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lexiconNames != null) 'LexiconNames': lexiconNames,
      if (sampleRate != null) 'SampleRate': sampleRate,
      if (speechMarkTypes != null)
        'SpeechMarkTypes': speechMarkTypes.map((e) => e.toValue()).toList(),
      if (textType != null) 'TextType': textType.toValue(),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/speech',
      exceptionFnMap: _exceptionFns,
    );
    return SynthesizeSpeechOutput(
      audioStream: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
      requestCharacters: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-RequestCharacters'),
    );
  }
}

class DeleteLexiconOutput {
  DeleteLexiconOutput();

  factory DeleteLexiconOutput.fromJson(Map<String, dynamic> _) {
    return DeleteLexiconOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeVoicesOutput {
  /// The pagination token to use in the next request to continue the listing of
  /// voices. <code>NextToken</code> is returned only if the response is
  /// truncated.
  final String? nextToken;

  /// A list of voices with their properties.
  final List<Voice>? voices;

  DescribeVoicesOutput({
    this.nextToken,
    this.voices,
  });

  factory DescribeVoicesOutput.fromJson(Map<String, dynamic> json) {
    return DescribeVoicesOutput(
      nextToken: json['NextToken'] as String?,
      voices: (json['Voices'] as List?)
          ?.whereNotNull()
          .map((e) => Voice.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final voices = this.voices;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (voices != null) 'Voices': voices,
    };
  }
}

enum Engine {
  standard,
  neural,
  longForm,
  generative,
}

extension EngineValueExtension on Engine {
  String toValue() {
    switch (this) {
      case Engine.standard:
        return 'standard';
      case Engine.neural:
        return 'neural';
      case Engine.longForm:
        return 'long-form';
      case Engine.generative:
        return 'generative';
    }
  }
}

extension EngineFromString on String {
  Engine toEngine() {
    switch (this) {
      case 'standard':
        return Engine.standard;
      case 'neural':
        return Engine.neural;
      case 'long-form':
        return Engine.longForm;
      case 'generative':
        return Engine.generative;
    }
    throw Exception('$this is not known in enum Engine');
  }
}

enum Gender {
  female,
  male,
}

extension GenderValueExtension on Gender {
  String toValue() {
    switch (this) {
      case Gender.female:
        return 'Female';
      case Gender.male:
        return 'Male';
    }
  }
}

extension GenderFromString on String {
  Gender toGender() {
    switch (this) {
      case 'Female':
        return Gender.female;
      case 'Male':
        return Gender.male;
    }
    throw Exception('$this is not known in enum Gender');
  }
}

class GetLexiconOutput {
  /// Lexicon object that provides name and the string content of the lexicon.
  final Lexicon? lexicon;

  /// Metadata of the lexicon, including phonetic alphabetic used, language code,
  /// lexicon ARN, number of lexemes defined in the lexicon, and size of lexicon
  /// in bytes.
  final LexiconAttributes? lexiconAttributes;

  GetLexiconOutput({
    this.lexicon,
    this.lexiconAttributes,
  });

  factory GetLexiconOutput.fromJson(Map<String, dynamic> json) {
    return GetLexiconOutput(
      lexicon: json['Lexicon'] != null
          ? Lexicon.fromJson(json['Lexicon'] as Map<String, dynamic>)
          : null,
      lexiconAttributes: json['LexiconAttributes'] != null
          ? LexiconAttributes.fromJson(
              json['LexiconAttributes'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lexicon = this.lexicon;
    final lexiconAttributes = this.lexiconAttributes;
    return {
      if (lexicon != null) 'Lexicon': lexicon,
      if (lexiconAttributes != null) 'LexiconAttributes': lexiconAttributes,
    };
  }
}

class GetSpeechSynthesisTaskOutput {
  /// SynthesisTask object that provides information from the requested task,
  /// including output format, creation time, task status, and so on.
  final SynthesisTask? synthesisTask;

  GetSpeechSynthesisTaskOutput({
    this.synthesisTask,
  });

  factory GetSpeechSynthesisTaskOutput.fromJson(Map<String, dynamic> json) {
    return GetSpeechSynthesisTaskOutput(
      synthesisTask: json['SynthesisTask'] != null
          ? SynthesisTask.fromJson(
              json['SynthesisTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final synthesisTask = this.synthesisTask;
    return {
      if (synthesisTask != null) 'SynthesisTask': synthesisTask,
    };
  }
}

enum LanguageCode {
  arb,
  cmnCn,
  cyGb,
  daDk,
  deDe,
  enAu,
  enGb,
  enGbWls,
  enIn,
  enUs,
  esEs,
  esMx,
  esUs,
  frCa,
  frFr,
  isIs,
  itIt,
  jaJp,
  hiIn,
  koKr,
  nbNo,
  nlNl,
  plPl,
  ptBr,
  ptPt,
  roRo,
  ruRu,
  svSe,
  trTr,
  enNz,
  enZa,
  caEs,
  deAt,
  yueCn,
  arAe,
  fiFi,
  enIe,
  nlBe,
  frBe,
}

extension LanguageCodeValueExtension on LanguageCode {
  String toValue() {
    switch (this) {
      case LanguageCode.arb:
        return 'arb';
      case LanguageCode.cmnCn:
        return 'cmn-CN';
      case LanguageCode.cyGb:
        return 'cy-GB';
      case LanguageCode.daDk:
        return 'da-DK';
      case LanguageCode.deDe:
        return 'de-DE';
      case LanguageCode.enAu:
        return 'en-AU';
      case LanguageCode.enGb:
        return 'en-GB';
      case LanguageCode.enGbWls:
        return 'en-GB-WLS';
      case LanguageCode.enIn:
        return 'en-IN';
      case LanguageCode.enUs:
        return 'en-US';
      case LanguageCode.esEs:
        return 'es-ES';
      case LanguageCode.esMx:
        return 'es-MX';
      case LanguageCode.esUs:
        return 'es-US';
      case LanguageCode.frCa:
        return 'fr-CA';
      case LanguageCode.frFr:
        return 'fr-FR';
      case LanguageCode.isIs:
        return 'is-IS';
      case LanguageCode.itIt:
        return 'it-IT';
      case LanguageCode.jaJp:
        return 'ja-JP';
      case LanguageCode.hiIn:
        return 'hi-IN';
      case LanguageCode.koKr:
        return 'ko-KR';
      case LanguageCode.nbNo:
        return 'nb-NO';
      case LanguageCode.nlNl:
        return 'nl-NL';
      case LanguageCode.plPl:
        return 'pl-PL';
      case LanguageCode.ptBr:
        return 'pt-BR';
      case LanguageCode.ptPt:
        return 'pt-PT';
      case LanguageCode.roRo:
        return 'ro-RO';
      case LanguageCode.ruRu:
        return 'ru-RU';
      case LanguageCode.svSe:
        return 'sv-SE';
      case LanguageCode.trTr:
        return 'tr-TR';
      case LanguageCode.enNz:
        return 'en-NZ';
      case LanguageCode.enZa:
        return 'en-ZA';
      case LanguageCode.caEs:
        return 'ca-ES';
      case LanguageCode.deAt:
        return 'de-AT';
      case LanguageCode.yueCn:
        return 'yue-CN';
      case LanguageCode.arAe:
        return 'ar-AE';
      case LanguageCode.fiFi:
        return 'fi-FI';
      case LanguageCode.enIe:
        return 'en-IE';
      case LanguageCode.nlBe:
        return 'nl-BE';
      case LanguageCode.frBe:
        return 'fr-BE';
    }
  }
}

extension LanguageCodeFromString on String {
  LanguageCode toLanguageCode() {
    switch (this) {
      case 'arb':
        return LanguageCode.arb;
      case 'cmn-CN':
        return LanguageCode.cmnCn;
      case 'cy-GB':
        return LanguageCode.cyGb;
      case 'da-DK':
        return LanguageCode.daDk;
      case 'de-DE':
        return LanguageCode.deDe;
      case 'en-AU':
        return LanguageCode.enAu;
      case 'en-GB':
        return LanguageCode.enGb;
      case 'en-GB-WLS':
        return LanguageCode.enGbWls;
      case 'en-IN':
        return LanguageCode.enIn;
      case 'en-US':
        return LanguageCode.enUs;
      case 'es-ES':
        return LanguageCode.esEs;
      case 'es-MX':
        return LanguageCode.esMx;
      case 'es-US':
        return LanguageCode.esUs;
      case 'fr-CA':
        return LanguageCode.frCa;
      case 'fr-FR':
        return LanguageCode.frFr;
      case 'is-IS':
        return LanguageCode.isIs;
      case 'it-IT':
        return LanguageCode.itIt;
      case 'ja-JP':
        return LanguageCode.jaJp;
      case 'hi-IN':
        return LanguageCode.hiIn;
      case 'ko-KR':
        return LanguageCode.koKr;
      case 'nb-NO':
        return LanguageCode.nbNo;
      case 'nl-NL':
        return LanguageCode.nlNl;
      case 'pl-PL':
        return LanguageCode.plPl;
      case 'pt-BR':
        return LanguageCode.ptBr;
      case 'pt-PT':
        return LanguageCode.ptPt;
      case 'ro-RO':
        return LanguageCode.roRo;
      case 'ru-RU':
        return LanguageCode.ruRu;
      case 'sv-SE':
        return LanguageCode.svSe;
      case 'tr-TR':
        return LanguageCode.trTr;
      case 'en-NZ':
        return LanguageCode.enNz;
      case 'en-ZA':
        return LanguageCode.enZa;
      case 'ca-ES':
        return LanguageCode.caEs;
      case 'de-AT':
        return LanguageCode.deAt;
      case 'yue-CN':
        return LanguageCode.yueCn;
      case 'ar-AE':
        return LanguageCode.arAe;
      case 'fi-FI':
        return LanguageCode.fiFi;
      case 'en-IE':
        return LanguageCode.enIe;
      case 'nl-BE':
        return LanguageCode.nlBe;
      case 'fr-BE':
        return LanguageCode.frBe;
    }
    throw Exception('$this is not known in enum LanguageCode');
  }
}

/// Provides lexicon name and lexicon content in string format. For more
/// information, see <a
/// href="https://www.w3.org/TR/pronunciation-lexicon/">Pronunciation Lexicon
/// Specification (PLS) Version 1.0</a>.
class Lexicon {
  /// Lexicon content in string format. The content of a lexicon must be in PLS
  /// format.
  final String? content;

  /// Name of the lexicon.
  final String? name;

  Lexicon({
    this.content,
    this.name,
  });

  factory Lexicon.fromJson(Map<String, dynamic> json) {
    return Lexicon(
      content: json['Content'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final name = this.name;
    return {
      if (content != null) 'Content': content,
      if (name != null) 'Name': name,
    };
  }
}

/// Contains metadata describing the lexicon such as the number of lexemes,
/// language code, and so on. For more information, see <a
/// href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing
/// Lexicons</a>.
class LexiconAttributes {
  /// Phonetic alphabet used in the lexicon. Valid values are <code>ipa</code> and
  /// <code>x-sampa</code>.
  final String? alphabet;

  /// Language code that the lexicon applies to. A lexicon with a language code
  /// such as "en" would be applied to all English languages (en-GB, en-US,
  /// en-AUS, en-WLS, and so on.
  final LanguageCode? languageCode;

  /// Date lexicon was last modified (a timestamp value).
  final DateTime? lastModified;

  /// Number of lexemes in the lexicon.
  final int? lexemesCount;

  /// Amazon Resource Name (ARN) of the lexicon.
  final String? lexiconArn;

  /// Total size of the lexicon, in characters.
  final int? size;

  LexiconAttributes({
    this.alphabet,
    this.languageCode,
    this.lastModified,
    this.lexemesCount,
    this.lexiconArn,
    this.size,
  });

  factory LexiconAttributes.fromJson(Map<String, dynamic> json) {
    return LexiconAttributes(
      alphabet: json['Alphabet'] as String?,
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lastModified: timeStampFromJson(json['LastModified']),
      lexemesCount: json['LexemesCount'] as int?,
      lexiconArn: json['LexiconArn'] as String?,
      size: json['Size'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alphabet = this.alphabet;
    final languageCode = this.languageCode;
    final lastModified = this.lastModified;
    final lexemesCount = this.lexemesCount;
    final lexiconArn = this.lexiconArn;
    final size = this.size;
    return {
      if (alphabet != null) 'Alphabet': alphabet,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (lexemesCount != null) 'LexemesCount': lexemesCount,
      if (lexiconArn != null) 'LexiconArn': lexiconArn,
      if (size != null) 'Size': size,
    };
  }
}

/// Describes the content of the lexicon.
class LexiconDescription {
  /// Provides lexicon metadata.
  final LexiconAttributes? attributes;

  /// Name of the lexicon.
  final String? name;

  LexiconDescription({
    this.attributes,
    this.name,
  });

  factory LexiconDescription.fromJson(Map<String, dynamic> json) {
    return LexiconDescription(
      attributes: json['Attributes'] != null
          ? LexiconAttributes.fromJson(
              json['Attributes'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final name = this.name;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (name != null) 'Name': name,
    };
  }
}

class ListLexiconsOutput {
  /// A list of lexicon names and attributes.
  final List<LexiconDescription>? lexicons;

  /// The pagination token to use in the next request to continue the listing of
  /// lexicons. <code>NextToken</code> is returned only if the response is
  /// truncated.
  final String? nextToken;

  ListLexiconsOutput({
    this.lexicons,
    this.nextToken,
  });

  factory ListLexiconsOutput.fromJson(Map<String, dynamic> json) {
    return ListLexiconsOutput(
      lexicons: (json['Lexicons'] as List?)
          ?.whereNotNull()
          .map((e) => LexiconDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lexicons = this.lexicons;
    final nextToken = this.nextToken;
    return {
      if (lexicons != null) 'Lexicons': lexicons,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSpeechSynthesisTasksOutput {
  /// An opaque pagination token returned from the previous List operation in this
  /// request. If present, this indicates where to continue the listing.
  final String? nextToken;

  /// List of SynthesisTask objects that provides information from the specified
  /// task in the list request, including output format, creation time, task
  /// status, and so on.
  final List<SynthesisTask>? synthesisTasks;

  ListSpeechSynthesisTasksOutput({
    this.nextToken,
    this.synthesisTasks,
  });

  factory ListSpeechSynthesisTasksOutput.fromJson(Map<String, dynamic> json) {
    return ListSpeechSynthesisTasksOutput(
      nextToken: json['NextToken'] as String?,
      synthesisTasks: (json['SynthesisTasks'] as List?)
          ?.whereNotNull()
          .map((e) => SynthesisTask.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final synthesisTasks = this.synthesisTasks;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (synthesisTasks != null) 'SynthesisTasks': synthesisTasks,
    };
  }
}

enum OutputFormat {
  json,
  mp3,
  oggVorbis,
  pcm,
}

extension OutputFormatValueExtension on OutputFormat {
  String toValue() {
    switch (this) {
      case OutputFormat.json:
        return 'json';
      case OutputFormat.mp3:
        return 'mp3';
      case OutputFormat.oggVorbis:
        return 'ogg_vorbis';
      case OutputFormat.pcm:
        return 'pcm';
    }
  }
}

extension OutputFormatFromString on String {
  OutputFormat toOutputFormat() {
    switch (this) {
      case 'json':
        return OutputFormat.json;
      case 'mp3':
        return OutputFormat.mp3;
      case 'ogg_vorbis':
        return OutputFormat.oggVorbis;
      case 'pcm':
        return OutputFormat.pcm;
    }
    throw Exception('$this is not known in enum OutputFormat');
  }
}

class PutLexiconOutput {
  PutLexiconOutput();

  factory PutLexiconOutput.fromJson(Map<String, dynamic> _) {
    return PutLexiconOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum SpeechMarkType {
  sentence,
  ssml,
  viseme,
  word,
}

extension SpeechMarkTypeValueExtension on SpeechMarkType {
  String toValue() {
    switch (this) {
      case SpeechMarkType.sentence:
        return 'sentence';
      case SpeechMarkType.ssml:
        return 'ssml';
      case SpeechMarkType.viseme:
        return 'viseme';
      case SpeechMarkType.word:
        return 'word';
    }
  }
}

extension SpeechMarkTypeFromString on String {
  SpeechMarkType toSpeechMarkType() {
    switch (this) {
      case 'sentence':
        return SpeechMarkType.sentence;
      case 'ssml':
        return SpeechMarkType.ssml;
      case 'viseme':
        return SpeechMarkType.viseme;
      case 'word':
        return SpeechMarkType.word;
    }
    throw Exception('$this is not known in enum SpeechMarkType');
  }
}

class StartSpeechSynthesisTaskOutput {
  /// SynthesisTask object that provides information and attributes about a newly
  /// submitted speech synthesis task.
  final SynthesisTask? synthesisTask;

  StartSpeechSynthesisTaskOutput({
    this.synthesisTask,
  });

  factory StartSpeechSynthesisTaskOutput.fromJson(Map<String, dynamic> json) {
    return StartSpeechSynthesisTaskOutput(
      synthesisTask: json['SynthesisTask'] != null
          ? SynthesisTask.fromJson(
              json['SynthesisTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final synthesisTask = this.synthesisTask;
    return {
      if (synthesisTask != null) 'SynthesisTask': synthesisTask,
    };
  }
}

/// SynthesisTask object that provides information about a speech synthesis
/// task.
class SynthesisTask {
  /// Timestamp for the time the synthesis task was started.
  final DateTime? creationTime;

  /// Specifies the engine (<code>standard</code>, <code>neural</code>,
  /// <code>long-form</code> or <code>generative</code>) for Amazon Polly to use
  /// when processing input text for speech synthesis. Using a voice that is not
  /// supported for the engine selected will result in an error.
  final Engine? engine;

  /// Optional language code for a synthesis task. This is only necessary if using
  /// a bilingual voice, such as Aditi, which can be used for either Indian
  /// English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon Polly
  /// uses the default language of the bilingual voice. The default language for
  /// any voice is the one returned by the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a>
  /// operation for the <code>LanguageCode</code> parameter. For example, if no
  /// language code is specified, Aditi will use Indian English rather than Hindi.
  final LanguageCode? languageCode;

  /// List of one or more pronunciation lexicon names you want the service to
  /// apply during synthesis. Lexicons are applied only if the language of the
  /// lexicon is the same as the language of the voice.
  final List<String>? lexiconNames;

  /// The format in which the returned output will be encoded. For audio stream,
  /// this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json.
  final OutputFormat? outputFormat;

  /// Pathway for the output speech file.
  final String? outputUri;

  /// Number of billable characters synthesized.
  final int? requestCharacters;

  /// The audio frequency specified in Hz.
  ///
  /// The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and
  /// "24000". The default value for standard voices is "22050". The default value
  /// for neural voices is "24000". The default value for long-form voices is
  /// "24000". The default value for generative voices is "24000".
  ///
  /// Valid values for pcm are "8000" and "16000" The default value is "16000".
  final String? sampleRate;

  /// ARN for the SNS topic optionally used for providing status notification for
  /// a speech synthesis task.
  final String? snsTopicArn;

  /// The type of speech marks returned for the input text.
  final List<SpeechMarkType>? speechMarkTypes;

  /// The Amazon Polly generated identifier for a speech synthesis task.
  final String? taskId;

  /// Current status of the individual speech synthesis task.
  final TaskStatus? taskStatus;

  /// Reason for the current status of a specific speech synthesis task, including
  /// errors if the task has failed.
  final String? taskStatusReason;

  /// Specifies whether the input text is plain text or SSML. The default value is
  /// plain text.
  final TextType? textType;

  /// Voice ID to use for the synthesis.
  final VoiceId? voiceId;

  SynthesisTask({
    this.creationTime,
    this.engine,
    this.languageCode,
    this.lexiconNames,
    this.outputFormat,
    this.outputUri,
    this.requestCharacters,
    this.sampleRate,
    this.snsTopicArn,
    this.speechMarkTypes,
    this.taskId,
    this.taskStatus,
    this.taskStatusReason,
    this.textType,
    this.voiceId,
  });

  factory SynthesisTask.fromJson(Map<String, dynamic> json) {
    return SynthesisTask(
      creationTime: timeStampFromJson(json['CreationTime']),
      engine: (json['Engine'] as String?)?.toEngine(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      lexiconNames: (json['LexiconNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      outputFormat: (json['OutputFormat'] as String?)?.toOutputFormat(),
      outputUri: json['OutputUri'] as String?,
      requestCharacters: json['RequestCharacters'] as int?,
      sampleRate: json['SampleRate'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
      speechMarkTypes: (json['SpeechMarkTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toSpeechMarkType())
          .toList(),
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.toTaskStatus(),
      taskStatusReason: json['TaskStatusReason'] as String?,
      textType: (json['TextType'] as String?)?.toTextType(),
      voiceId: (json['VoiceId'] as String?)?.toVoiceId(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final engine = this.engine;
    final languageCode = this.languageCode;
    final lexiconNames = this.lexiconNames;
    final outputFormat = this.outputFormat;
    final outputUri = this.outputUri;
    final requestCharacters = this.requestCharacters;
    final sampleRate = this.sampleRate;
    final snsTopicArn = this.snsTopicArn;
    final speechMarkTypes = this.speechMarkTypes;
    final taskId = this.taskId;
    final taskStatus = this.taskStatus;
    final taskStatusReason = this.taskStatusReason;
    final textType = this.textType;
    final voiceId = this.voiceId;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (engine != null) 'Engine': engine.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lexiconNames != null) 'LexiconNames': lexiconNames,
      if (outputFormat != null) 'OutputFormat': outputFormat.toValue(),
      if (outputUri != null) 'OutputUri': outputUri,
      if (requestCharacters != null) 'RequestCharacters': requestCharacters,
      if (sampleRate != null) 'SampleRate': sampleRate,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (speechMarkTypes != null)
        'SpeechMarkTypes': speechMarkTypes.map((e) => e.toValue()).toList(),
      if (taskId != null) 'TaskId': taskId,
      if (taskStatus != null) 'TaskStatus': taskStatus.toValue(),
      if (taskStatusReason != null) 'TaskStatusReason': taskStatusReason,
      if (textType != null) 'TextType': textType.toValue(),
      if (voiceId != null) 'VoiceId': voiceId.toValue(),
    };
  }
}

class SynthesizeSpeechOutput {
  /// Stream containing the synthesized speech.
  final Uint8List? audioStream;

  /// Specifies the type audio stream. This should reflect the
  /// <code>OutputFormat</code> parameter in your request.
  ///
  /// <ul>
  /// <li>
  /// If you request <code>mp3</code> as the <code>OutputFormat</code>, the
  /// <code>ContentType</code> returned is audio/mpeg.
  /// </li>
  /// <li>
  /// If you request <code>ogg_vorbis</code> as the <code>OutputFormat</code>, the
  /// <code>ContentType</code> returned is audio/ogg.
  /// </li>
  /// <li>
  /// If you request <code>pcm</code> as the <code>OutputFormat</code>, the
  /// <code>ContentType</code> returned is audio/pcm in a signed 16-bit, 1 channel
  /// (mono), little-endian format.
  /// </li>
  /// <li>
  /// If you request <code>json</code> as the <code>OutputFormat</code>, the
  /// <code>ContentType</code> returned is application/x-json-stream.
  /// </li>
  /// </ul>
  ///
  final String? contentType;

  /// Number of characters synthesized.
  final int? requestCharacters;

  SynthesizeSpeechOutput({
    this.audioStream,
    this.contentType,
    this.requestCharacters,
  });

  Map<String, dynamic> toJson() {
    final audioStream = this.audioStream;
    final contentType = this.contentType;
    final requestCharacters = this.requestCharacters;
    return {
      if (audioStream != null) 'AudioStream': base64Encode(audioStream),
    };
  }
}

enum TaskStatus {
  scheduled,
  inProgress,
  completed,
  failed,
}

extension TaskStatusValueExtension on TaskStatus {
  String toValue() {
    switch (this) {
      case TaskStatus.scheduled:
        return 'scheduled';
      case TaskStatus.inProgress:
        return 'inProgress';
      case TaskStatus.completed:
        return 'completed';
      case TaskStatus.failed:
        return 'failed';
    }
  }
}

extension TaskStatusFromString on String {
  TaskStatus toTaskStatus() {
    switch (this) {
      case 'scheduled':
        return TaskStatus.scheduled;
      case 'inProgress':
        return TaskStatus.inProgress;
      case 'completed':
        return TaskStatus.completed;
      case 'failed':
        return TaskStatus.failed;
    }
    throw Exception('$this is not known in enum TaskStatus');
  }
}

enum TextType {
  ssml,
  text,
}

extension TextTypeValueExtension on TextType {
  String toValue() {
    switch (this) {
      case TextType.ssml:
        return 'ssml';
      case TextType.text:
        return 'text';
    }
  }
}

extension TextTypeFromString on String {
  TextType toTextType() {
    switch (this) {
      case 'ssml':
        return TextType.ssml;
      case 'text':
        return TextType.text;
    }
    throw Exception('$this is not known in enum TextType');
  }
}

/// Description of the voice.
class Voice {
  /// Additional codes for languages available for the specified voice in addition
  /// to its default language.
  ///
  /// For example, the default language for Aditi is Indian English (en-IN)
  /// because it was first used for that language. Since Aditi is bilingual and
  /// fluent in both Indian English and Hindi, this parameter would show the code
  /// <code>hi-IN</code>.
  final List<LanguageCode>? additionalLanguageCodes;

  /// Gender of the voice.
  final Gender? gender;

  /// Amazon Polly assigned voice ID. This is the ID that you specify when calling
  /// the <code>SynthesizeSpeech</code> operation.
  final VoiceId? id;

  /// Language code of the voice.
  final LanguageCode? languageCode;

  /// Human readable name of the language in English.
  final String? languageName;

  /// Name of the voice (for example, Salli, Kendra, etc.). This provides a human
  /// readable voice name that you might display in your application.
  final String? name;

  /// Specifies which engines (<code>standard</code>, <code>neural</code>,
  /// <code>long-form</code> or <code>generative</code>) are supported by a given
  /// voice.
  final List<Engine>? supportedEngines;

  Voice({
    this.additionalLanguageCodes,
    this.gender,
    this.id,
    this.languageCode,
    this.languageName,
    this.name,
    this.supportedEngines,
  });

  factory Voice.fromJson(Map<String, dynamic> json) {
    return Voice(
      additionalLanguageCodes: (json['AdditionalLanguageCodes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLanguageCode())
          .toList(),
      gender: (json['Gender'] as String?)?.toGender(),
      id: (json['Id'] as String?)?.toVoiceId(),
      languageCode: (json['LanguageCode'] as String?)?.toLanguageCode(),
      languageName: json['LanguageName'] as String?,
      name: json['Name'] as String?,
      supportedEngines: (json['SupportedEngines'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toEngine())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final additionalLanguageCodes = this.additionalLanguageCodes;
    final gender = this.gender;
    final id = this.id;
    final languageCode = this.languageCode;
    final languageName = this.languageName;
    final name = this.name;
    final supportedEngines = this.supportedEngines;
    return {
      if (additionalLanguageCodes != null)
        'AdditionalLanguageCodes':
            additionalLanguageCodes.map((e) => e.toValue()).toList(),
      if (gender != null) 'Gender': gender.toValue(),
      if (id != null) 'Id': id.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (languageName != null) 'LanguageName': languageName,
      if (name != null) 'Name': name,
      if (supportedEngines != null)
        'SupportedEngines': supportedEngines.map((e) => e.toValue()).toList(),
    };
  }
}

enum VoiceId {
  aditi,
  amy,
  astrid,
  bianca,
  brian,
  camila,
  carla,
  carmen,
  celine,
  chantal,
  conchita,
  cristiano,
  dora,
  emma,
  enrique,
  ewa,
  filiz,
  gabrielle,
  geraint,
  giorgio,
  gwyneth,
  hans,
  ines,
  ivy,
  jacek,
  jan,
  joanna,
  joey,
  justin,
  karl,
  kendra,
  kevin,
  kimberly,
  lea,
  liv,
  lotte,
  lucia,
  lupe,
  mads,
  maja,
  marlene,
  mathieu,
  matthew,
  maxim,
  mia,
  miguel,
  mizuki,
  naja,
  nicole,
  olivia,
  penelope,
  raveena,
  ricardo,
  ruben,
  russell,
  salli,
  seoyeon,
  takumi,
  tatyana,
  vicki,
  vitoria,
  zeina,
  zhiyu,
  aria,
  ayanda,
  arlet,
  hannah,
  arthur,
  daniel,
  liam,
  pedro,
  kajal,
  hiujin,
  laura,
  elin,
  ida,
  suvi,
  ola,
  hala,
  andres,
  sergio,
  remi,
  adriano,
  thiago,
  ruth,
  stephen,
  kazuha,
  tomoko,
  niamh,
  sofie,
  lisa,
  isabelle,
  zayd,
  danielle,
  gregory,
  burcu,
}

extension VoiceIdValueExtension on VoiceId {
  String toValue() {
    switch (this) {
      case VoiceId.aditi:
        return 'Aditi';
      case VoiceId.amy:
        return 'Amy';
      case VoiceId.astrid:
        return 'Astrid';
      case VoiceId.bianca:
        return 'Bianca';
      case VoiceId.brian:
        return 'Brian';
      case VoiceId.camila:
        return 'Camila';
      case VoiceId.carla:
        return 'Carla';
      case VoiceId.carmen:
        return 'Carmen';
      case VoiceId.celine:
        return 'Celine';
      case VoiceId.chantal:
        return 'Chantal';
      case VoiceId.conchita:
        return 'Conchita';
      case VoiceId.cristiano:
        return 'Cristiano';
      case VoiceId.dora:
        return 'Dora';
      case VoiceId.emma:
        return 'Emma';
      case VoiceId.enrique:
        return 'Enrique';
      case VoiceId.ewa:
        return 'Ewa';
      case VoiceId.filiz:
        return 'Filiz';
      case VoiceId.gabrielle:
        return 'Gabrielle';
      case VoiceId.geraint:
        return 'Geraint';
      case VoiceId.giorgio:
        return 'Giorgio';
      case VoiceId.gwyneth:
        return 'Gwyneth';
      case VoiceId.hans:
        return 'Hans';
      case VoiceId.ines:
        return 'Ines';
      case VoiceId.ivy:
        return 'Ivy';
      case VoiceId.jacek:
        return 'Jacek';
      case VoiceId.jan:
        return 'Jan';
      case VoiceId.joanna:
        return 'Joanna';
      case VoiceId.joey:
        return 'Joey';
      case VoiceId.justin:
        return 'Justin';
      case VoiceId.karl:
        return 'Karl';
      case VoiceId.kendra:
        return 'Kendra';
      case VoiceId.kevin:
        return 'Kevin';
      case VoiceId.kimberly:
        return 'Kimberly';
      case VoiceId.lea:
        return 'Lea';
      case VoiceId.liv:
        return 'Liv';
      case VoiceId.lotte:
        return 'Lotte';
      case VoiceId.lucia:
        return 'Lucia';
      case VoiceId.lupe:
        return 'Lupe';
      case VoiceId.mads:
        return 'Mads';
      case VoiceId.maja:
        return 'Maja';
      case VoiceId.marlene:
        return 'Marlene';
      case VoiceId.mathieu:
        return 'Mathieu';
      case VoiceId.matthew:
        return 'Matthew';
      case VoiceId.maxim:
        return 'Maxim';
      case VoiceId.mia:
        return 'Mia';
      case VoiceId.miguel:
        return 'Miguel';
      case VoiceId.mizuki:
        return 'Mizuki';
      case VoiceId.naja:
        return 'Naja';
      case VoiceId.nicole:
        return 'Nicole';
      case VoiceId.olivia:
        return 'Olivia';
      case VoiceId.penelope:
        return 'Penelope';
      case VoiceId.raveena:
        return 'Raveena';
      case VoiceId.ricardo:
        return 'Ricardo';
      case VoiceId.ruben:
        return 'Ruben';
      case VoiceId.russell:
        return 'Russell';
      case VoiceId.salli:
        return 'Salli';
      case VoiceId.seoyeon:
        return 'Seoyeon';
      case VoiceId.takumi:
        return 'Takumi';
      case VoiceId.tatyana:
        return 'Tatyana';
      case VoiceId.vicki:
        return 'Vicki';
      case VoiceId.vitoria:
        return 'Vitoria';
      case VoiceId.zeina:
        return 'Zeina';
      case VoiceId.zhiyu:
        return 'Zhiyu';
      case VoiceId.aria:
        return 'Aria';
      case VoiceId.ayanda:
        return 'Ayanda';
      case VoiceId.arlet:
        return 'Arlet';
      case VoiceId.hannah:
        return 'Hannah';
      case VoiceId.arthur:
        return 'Arthur';
      case VoiceId.daniel:
        return 'Daniel';
      case VoiceId.liam:
        return 'Liam';
      case VoiceId.pedro:
        return 'Pedro';
      case VoiceId.kajal:
        return 'Kajal';
      case VoiceId.hiujin:
        return 'Hiujin';
      case VoiceId.laura:
        return 'Laura';
      case VoiceId.elin:
        return 'Elin';
      case VoiceId.ida:
        return 'Ida';
      case VoiceId.suvi:
        return 'Suvi';
      case VoiceId.ola:
        return 'Ola';
      case VoiceId.hala:
        return 'Hala';
      case VoiceId.andres:
        return 'Andres';
      case VoiceId.sergio:
        return 'Sergio';
      case VoiceId.remi:
        return 'Remi';
      case VoiceId.adriano:
        return 'Adriano';
      case VoiceId.thiago:
        return 'Thiago';
      case VoiceId.ruth:
        return 'Ruth';
      case VoiceId.stephen:
        return 'Stephen';
      case VoiceId.kazuha:
        return 'Kazuha';
      case VoiceId.tomoko:
        return 'Tomoko';
      case VoiceId.niamh:
        return 'Niamh';
      case VoiceId.sofie:
        return 'Sofie';
      case VoiceId.lisa:
        return 'Lisa';
      case VoiceId.isabelle:
        return 'Isabelle';
      case VoiceId.zayd:
        return 'Zayd';
      case VoiceId.danielle:
        return 'Danielle';
      case VoiceId.gregory:
        return 'Gregory';
      case VoiceId.burcu:
        return 'Burcu';
    }
  }
}

extension VoiceIdFromString on String {
  VoiceId toVoiceId() {
    switch (this) {
      case 'Aditi':
        return VoiceId.aditi;
      case 'Amy':
        return VoiceId.amy;
      case 'Astrid':
        return VoiceId.astrid;
      case 'Bianca':
        return VoiceId.bianca;
      case 'Brian':
        return VoiceId.brian;
      case 'Camila':
        return VoiceId.camila;
      case 'Carla':
        return VoiceId.carla;
      case 'Carmen':
        return VoiceId.carmen;
      case 'Celine':
        return VoiceId.celine;
      case 'Chantal':
        return VoiceId.chantal;
      case 'Conchita':
        return VoiceId.conchita;
      case 'Cristiano':
        return VoiceId.cristiano;
      case 'Dora':
        return VoiceId.dora;
      case 'Emma':
        return VoiceId.emma;
      case 'Enrique':
        return VoiceId.enrique;
      case 'Ewa':
        return VoiceId.ewa;
      case 'Filiz':
        return VoiceId.filiz;
      case 'Gabrielle':
        return VoiceId.gabrielle;
      case 'Geraint':
        return VoiceId.geraint;
      case 'Giorgio':
        return VoiceId.giorgio;
      case 'Gwyneth':
        return VoiceId.gwyneth;
      case 'Hans':
        return VoiceId.hans;
      case 'Ines':
        return VoiceId.ines;
      case 'Ivy':
        return VoiceId.ivy;
      case 'Jacek':
        return VoiceId.jacek;
      case 'Jan':
        return VoiceId.jan;
      case 'Joanna':
        return VoiceId.joanna;
      case 'Joey':
        return VoiceId.joey;
      case 'Justin':
        return VoiceId.justin;
      case 'Karl':
        return VoiceId.karl;
      case 'Kendra':
        return VoiceId.kendra;
      case 'Kevin':
        return VoiceId.kevin;
      case 'Kimberly':
        return VoiceId.kimberly;
      case 'Lea':
        return VoiceId.lea;
      case 'Liv':
        return VoiceId.liv;
      case 'Lotte':
        return VoiceId.lotte;
      case 'Lucia':
        return VoiceId.lucia;
      case 'Lupe':
        return VoiceId.lupe;
      case 'Mads':
        return VoiceId.mads;
      case 'Maja':
        return VoiceId.maja;
      case 'Marlene':
        return VoiceId.marlene;
      case 'Mathieu':
        return VoiceId.mathieu;
      case 'Matthew':
        return VoiceId.matthew;
      case 'Maxim':
        return VoiceId.maxim;
      case 'Mia':
        return VoiceId.mia;
      case 'Miguel':
        return VoiceId.miguel;
      case 'Mizuki':
        return VoiceId.mizuki;
      case 'Naja':
        return VoiceId.naja;
      case 'Nicole':
        return VoiceId.nicole;
      case 'Olivia':
        return VoiceId.olivia;
      case 'Penelope':
        return VoiceId.penelope;
      case 'Raveena':
        return VoiceId.raveena;
      case 'Ricardo':
        return VoiceId.ricardo;
      case 'Ruben':
        return VoiceId.ruben;
      case 'Russell':
        return VoiceId.russell;
      case 'Salli':
        return VoiceId.salli;
      case 'Seoyeon':
        return VoiceId.seoyeon;
      case 'Takumi':
        return VoiceId.takumi;
      case 'Tatyana':
        return VoiceId.tatyana;
      case 'Vicki':
        return VoiceId.vicki;
      case 'Vitoria':
        return VoiceId.vitoria;
      case 'Zeina':
        return VoiceId.zeina;
      case 'Zhiyu':
        return VoiceId.zhiyu;
      case 'Aria':
        return VoiceId.aria;
      case 'Ayanda':
        return VoiceId.ayanda;
      case 'Arlet':
        return VoiceId.arlet;
      case 'Hannah':
        return VoiceId.hannah;
      case 'Arthur':
        return VoiceId.arthur;
      case 'Daniel':
        return VoiceId.daniel;
      case 'Liam':
        return VoiceId.liam;
      case 'Pedro':
        return VoiceId.pedro;
      case 'Kajal':
        return VoiceId.kajal;
      case 'Hiujin':
        return VoiceId.hiujin;
      case 'Laura':
        return VoiceId.laura;
      case 'Elin':
        return VoiceId.elin;
      case 'Ida':
        return VoiceId.ida;
      case 'Suvi':
        return VoiceId.suvi;
      case 'Ola':
        return VoiceId.ola;
      case 'Hala':
        return VoiceId.hala;
      case 'Andres':
        return VoiceId.andres;
      case 'Sergio':
        return VoiceId.sergio;
      case 'Remi':
        return VoiceId.remi;
      case 'Adriano':
        return VoiceId.adriano;
      case 'Thiago':
        return VoiceId.thiago;
      case 'Ruth':
        return VoiceId.ruth;
      case 'Stephen':
        return VoiceId.stephen;
      case 'Kazuha':
        return VoiceId.kazuha;
      case 'Tomoko':
        return VoiceId.tomoko;
      case 'Niamh':
        return VoiceId.niamh;
      case 'Sofie':
        return VoiceId.sofie;
      case 'Lisa':
        return VoiceId.lisa;
      case 'Isabelle':
        return VoiceId.isabelle;
      case 'Zayd':
        return VoiceId.zayd;
      case 'Danielle':
        return VoiceId.danielle;
      case 'Gregory':
        return VoiceId.gregory;
      case 'Burcu':
        return VoiceId.burcu;
    }
    throw Exception('$this is not known in enum VoiceId');
  }
}

class EngineNotSupportedException extends _s.GenericAwsException {
  EngineNotSupportedException({String? type, String? message})
      : super(
            type: type, code: 'EngineNotSupportedException', message: message);
}

class InvalidLexiconException extends _s.GenericAwsException {
  InvalidLexiconException({String? type, String? message})
      : super(type: type, code: 'InvalidLexiconException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidS3BucketException extends _s.GenericAwsException {
  InvalidS3BucketException({String? type, String? message})
      : super(type: type, code: 'InvalidS3BucketException', message: message);
}

class InvalidS3KeyException extends _s.GenericAwsException {
  InvalidS3KeyException({String? type, String? message})
      : super(type: type, code: 'InvalidS3KeyException', message: message);
}

class InvalidSampleRateException extends _s.GenericAwsException {
  InvalidSampleRateException({String? type, String? message})
      : super(type: type, code: 'InvalidSampleRateException', message: message);
}

class InvalidSnsTopicArnException extends _s.GenericAwsException {
  InvalidSnsTopicArnException({String? type, String? message})
      : super(
            type: type, code: 'InvalidSnsTopicArnException', message: message);
}

class InvalidSsmlException extends _s.GenericAwsException {
  InvalidSsmlException({String? type, String? message})
      : super(type: type, code: 'InvalidSsmlException', message: message);
}

class InvalidTaskIdException extends _s.GenericAwsException {
  InvalidTaskIdException({String? type, String? message})
      : super(type: type, code: 'InvalidTaskIdException', message: message);
}

class LanguageNotSupportedException extends _s.GenericAwsException {
  LanguageNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'LanguageNotSupportedException',
            message: message);
}

class LexiconNotFoundException extends _s.GenericAwsException {
  LexiconNotFoundException({String? type, String? message})
      : super(type: type, code: 'LexiconNotFoundException', message: message);
}

class LexiconSizeExceededException extends _s.GenericAwsException {
  LexiconSizeExceededException({String? type, String? message})
      : super(
            type: type, code: 'LexiconSizeExceededException', message: message);
}

class MarksNotSupportedForFormatException extends _s.GenericAwsException {
  MarksNotSupportedForFormatException({String? type, String? message})
      : super(
            type: type,
            code: 'MarksNotSupportedForFormatException',
            message: message);
}

class MaxLexemeLengthExceededException extends _s.GenericAwsException {
  MaxLexemeLengthExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxLexemeLengthExceededException',
            message: message);
}

class MaxLexiconsNumberExceededException extends _s.GenericAwsException {
  MaxLexiconsNumberExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxLexiconsNumberExceededException',
            message: message);
}

class ServiceFailureException extends _s.GenericAwsException {
  ServiceFailureException({String? type, String? message})
      : super(type: type, code: 'ServiceFailureException', message: message);
}

class SsmlMarksNotSupportedForTextTypeException extends _s.GenericAwsException {
  SsmlMarksNotSupportedForTextTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'SsmlMarksNotSupportedForTextTypeException',
            message: message);
}

class SynthesisTaskNotFoundException extends _s.GenericAwsException {
  SynthesisTaskNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'SynthesisTaskNotFoundException',
            message: message);
}

class TextLengthExceededException extends _s.GenericAwsException {
  TextLengthExceededException({String? type, String? message})
      : super(
            type: type, code: 'TextLengthExceededException', message: message);
}

class UnsupportedPlsAlphabetException extends _s.GenericAwsException {
  UnsupportedPlsAlphabetException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedPlsAlphabetException',
            message: message);
}

class UnsupportedPlsLanguageException extends _s.GenericAwsException {
  UnsupportedPlsLanguageException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedPlsLanguageException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'EngineNotSupportedException': (type, message) =>
      EngineNotSupportedException(type: type, message: message),
  'InvalidLexiconException': (type, message) =>
      InvalidLexiconException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidS3BucketException': (type, message) =>
      InvalidS3BucketException(type: type, message: message),
  'InvalidS3KeyException': (type, message) =>
      InvalidS3KeyException(type: type, message: message),
  'InvalidSampleRateException': (type, message) =>
      InvalidSampleRateException(type: type, message: message),
  'InvalidSnsTopicArnException': (type, message) =>
      InvalidSnsTopicArnException(type: type, message: message),
  'InvalidSsmlException': (type, message) =>
      InvalidSsmlException(type: type, message: message),
  'InvalidTaskIdException': (type, message) =>
      InvalidTaskIdException(type: type, message: message),
  'LanguageNotSupportedException': (type, message) =>
      LanguageNotSupportedException(type: type, message: message),
  'LexiconNotFoundException': (type, message) =>
      LexiconNotFoundException(type: type, message: message),
  'LexiconSizeExceededException': (type, message) =>
      LexiconSizeExceededException(type: type, message: message),
  'MarksNotSupportedForFormatException': (type, message) =>
      MarksNotSupportedForFormatException(type: type, message: message),
  'MaxLexemeLengthExceededException': (type, message) =>
      MaxLexemeLengthExceededException(type: type, message: message),
  'MaxLexiconsNumberExceededException': (type, message) =>
      MaxLexiconsNumberExceededException(type: type, message: message),
  'ServiceFailureException': (type, message) =>
      ServiceFailureException(type: type, message: message),
  'SsmlMarksNotSupportedForTextTypeException': (type, message) =>
      SsmlMarksNotSupportedForTextTypeException(type: type, message: message),
  'SynthesisTaskNotFoundException': (type, message) =>
      SynthesisTaskNotFoundException(type: type, message: message),
  'TextLengthExceededException': (type, message) =>
      TextLengthExceededException(type: type, message: message),
  'UnsupportedPlsAlphabetException': (type, message) =>
      UnsupportedPlsAlphabetException(type: type, message: message),
  'UnsupportedPlsLanguageException': (type, message) =>
      UnsupportedPlsLanguageException(type: type, message: message),
};
