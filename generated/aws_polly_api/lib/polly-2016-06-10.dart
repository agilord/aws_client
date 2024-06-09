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
      if (engine != null) 'Engine': [engine.value],
      if (includeAdditionalLanguageCodes != null)
        'IncludeAdditionalLanguageCodes': [
          includeAdditionalLanguageCodes.toString()
        ],
      if (languageCode != null) 'LanguageCode': [languageCode.value],
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
      if (status != null) 'Status': [status.value],
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
      'OutputFormat': outputFormat.value,
      'OutputS3BucketName': outputS3BucketName,
      'Text': text,
      'VoiceId': voiceId.value,
      if (engine != null) 'Engine': engine.value,
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (lexiconNames != null) 'LexiconNames': lexiconNames,
      if (outputS3KeyPrefix != null) 'OutputS3KeyPrefix': outputS3KeyPrefix,
      if (sampleRate != null) 'SampleRate': sampleRate,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (speechMarkTypes != null)
        'SpeechMarkTypes': speechMarkTypes.map((e) => e.value).toList(),
      if (textType != null) 'TextType': textType.value,
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
      'OutputFormat': outputFormat.value,
      'Text': text,
      'VoiceId': voiceId.value,
      if (engine != null) 'Engine': engine.value,
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (lexiconNames != null) 'LexiconNames': lexiconNames,
      if (sampleRate != null) 'SampleRate': sampleRate,
      if (speechMarkTypes != null)
        'SpeechMarkTypes': speechMarkTypes.map((e) => e.value).toList(),
      if (textType != null) 'TextType': textType.value,
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
}

enum Engine {
  standard('standard'),
  neural('neural'),
  longForm('long-form'),
  generative('generative'),
  ;

  final String value;

  const Engine(this.value);

  static Engine fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Engine'));
}

enum Gender {
  female('Female'),
  male('Male'),
  ;

  final String value;

  const Gender(this.value);

  static Gender fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Gender'));
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
}

enum LanguageCode {
  arb('arb'),
  cmnCn('cmn-CN'),
  cyGb('cy-GB'),
  daDk('da-DK'),
  deDe('de-DE'),
  enAu('en-AU'),
  enGb('en-GB'),
  enGbWls('en-GB-WLS'),
  enIn('en-IN'),
  enUs('en-US'),
  esEs('es-ES'),
  esMx('es-MX'),
  esUs('es-US'),
  frCa('fr-CA'),
  frFr('fr-FR'),
  isIs('is-IS'),
  itIt('it-IT'),
  jaJp('ja-JP'),
  hiIn('hi-IN'),
  koKr('ko-KR'),
  nbNo('nb-NO'),
  nlNl('nl-NL'),
  plPl('pl-PL'),
  ptBr('pt-BR'),
  ptPt('pt-PT'),
  roRo('ro-RO'),
  ruRu('ru-RU'),
  svSe('sv-SE'),
  trTr('tr-TR'),
  enNz('en-NZ'),
  enZa('en-ZA'),
  caEs('ca-ES'),
  deAt('de-AT'),
  yueCn('yue-CN'),
  arAe('ar-AE'),
  fiFi('fi-FI'),
  enIe('en-IE'),
  nlBe('nl-BE'),
  frBe('fr-BE'),
  ;

  final String value;

  const LanguageCode(this.value);

  static LanguageCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum LanguageCode'));
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
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      lastModified: timeStampFromJson(json['LastModified']),
      lexemesCount: json['LexemesCount'] as int?,
      lexiconArn: json['LexiconArn'] as String?,
      size: json['Size'] as int?,
    );
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
}

enum OutputFormat {
  json('json'),
  mp3('mp3'),
  oggVorbis('ogg_vorbis'),
  pcm('pcm'),
  ;

  final String value;

  const OutputFormat(this.value);

  static OutputFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum OutputFormat'));
}

class PutLexiconOutput {
  PutLexiconOutput();

  factory PutLexiconOutput.fromJson(Map<String, dynamic> _) {
    return PutLexiconOutput();
  }
}

enum SpeechMarkType {
  sentence('sentence'),
  ssml('ssml'),
  viseme('viseme'),
  word('word'),
  ;

  final String value;

  const SpeechMarkType(this.value);

  static SpeechMarkType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () =>
              throw Exception('$value is not known in enum SpeechMarkType'));
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
      engine: (json['Engine'] as String?)?.let(Engine.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      lexiconNames: (json['LexiconNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      outputFormat:
          (json['OutputFormat'] as String?)?.let(OutputFormat.fromString),
      outputUri: json['OutputUri'] as String?,
      requestCharacters: json['RequestCharacters'] as int?,
      sampleRate: json['SampleRate'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
      speechMarkTypes: (json['SpeechMarkTypes'] as List?)
          ?.whereNotNull()
          .map((e) => SpeechMarkType.fromString((e as String)))
          .toList(),
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.let(TaskStatus.fromString),
      taskStatusReason: json['TaskStatusReason'] as String?,
      textType: (json['TextType'] as String?)?.let(TextType.fromString),
      voiceId: (json['VoiceId'] as String?)?.let(VoiceId.fromString),
    );
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
}

enum TaskStatus {
  scheduled('scheduled'),
  inProgress('inProgress'),
  completed('completed'),
  failed('failed'),
  ;

  final String value;

  const TaskStatus(this.value);

  static TaskStatus fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum TaskStatus'));
}

enum TextType {
  ssml('ssml'),
  text('text'),
  ;

  final String value;

  const TextType(this.value);

  static TextType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum TextType'));
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
          .map((e) => LanguageCode.fromString((e as String)))
          .toList(),
      gender: (json['Gender'] as String?)?.let(Gender.fromString),
      id: (json['Id'] as String?)?.let(VoiceId.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      languageName: json['LanguageName'] as String?,
      name: json['Name'] as String?,
      supportedEngines: (json['SupportedEngines'] as List?)
          ?.whereNotNull()
          .map((e) => Engine.fromString((e as String)))
          .toList(),
    );
  }
}

enum VoiceId {
  aditi('Aditi'),
  amy('Amy'),
  astrid('Astrid'),
  bianca('Bianca'),
  brian('Brian'),
  camila('Camila'),
  carla('Carla'),
  carmen('Carmen'),
  celine('Celine'),
  chantal('Chantal'),
  conchita('Conchita'),
  cristiano('Cristiano'),
  dora('Dora'),
  emma('Emma'),
  enrique('Enrique'),
  ewa('Ewa'),
  filiz('Filiz'),
  gabrielle('Gabrielle'),
  geraint('Geraint'),
  giorgio('Giorgio'),
  gwyneth('Gwyneth'),
  hans('Hans'),
  ines('Ines'),
  ivy('Ivy'),
  jacek('Jacek'),
  jan('Jan'),
  joanna('Joanna'),
  joey('Joey'),
  justin('Justin'),
  karl('Karl'),
  kendra('Kendra'),
  kevin('Kevin'),
  kimberly('Kimberly'),
  lea('Lea'),
  liv('Liv'),
  lotte('Lotte'),
  lucia('Lucia'),
  lupe('Lupe'),
  mads('Mads'),
  maja('Maja'),
  marlene('Marlene'),
  mathieu('Mathieu'),
  matthew('Matthew'),
  maxim('Maxim'),
  mia('Mia'),
  miguel('Miguel'),
  mizuki('Mizuki'),
  naja('Naja'),
  nicole('Nicole'),
  olivia('Olivia'),
  penelope('Penelope'),
  raveena('Raveena'),
  ricardo('Ricardo'),
  ruben('Ruben'),
  russell('Russell'),
  salli('Salli'),
  seoyeon('Seoyeon'),
  takumi('Takumi'),
  tatyana('Tatyana'),
  vicki('Vicki'),
  vitoria('Vitoria'),
  zeina('Zeina'),
  zhiyu('Zhiyu'),
  aria('Aria'),
  ayanda('Ayanda'),
  arlet('Arlet'),
  hannah('Hannah'),
  arthur('Arthur'),
  daniel('Daniel'),
  liam('Liam'),
  pedro('Pedro'),
  kajal('Kajal'),
  hiujin('Hiujin'),
  laura('Laura'),
  elin('Elin'),
  ida('Ida'),
  suvi('Suvi'),
  ola('Ola'),
  hala('Hala'),
  andres('Andres'),
  sergio('Sergio'),
  remi('Remi'),
  adriano('Adriano'),
  thiago('Thiago'),
  ruth('Ruth'),
  stephen('Stephen'),
  kazuha('Kazuha'),
  tomoko('Tomoko'),
  niamh('Niamh'),
  sofie('Sofie'),
  lisa('Lisa'),
  isabelle('Isabelle'),
  zayd('Zayd'),
  danielle('Danielle'),
  gregory('Gregory'),
  burcu('Burcu'),
  ;

  final String value;

  const VoiceId(this.value);

  static VoiceId fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum VoiceId'));
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
