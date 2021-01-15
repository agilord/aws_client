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

part '2016-06-10.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'polly',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Deletes the specified pronunciation lexicon stored in an AWS Region. A
  /// lexicon which has been deleted is not available for speech synthesis, nor
  /// is it possible to retrieve it using either the <code>GetLexicon</code> or
  /// <code>ListLexicon</code> APIs.
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''[0-9A-Za-z]{1,20}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/v1/lexicons/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLexiconOutput.fromJson(response);
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
  /// Specifies the engine (<code>standard</code> or <code>neural</code>) used
  /// by Amazon Polly when processing input text for speech synthesis.
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
    Engine engine,
    bool includeAdditionalLanguageCodes,
    LanguageCode languageCode,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
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
  /// AWS Region. For more information, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing
  /// Lexicons</a>.
  ///
  /// May throw [LexiconNotFoundException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// Name of the lexicon.
  Future<GetLexiconOutput> getLexicon({
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''[0-9A-Za-z]{1,20}''',
      isRequired: true,
    );
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
    @_s.required String taskId,
  }) async {
    ArgumentError.checkNotNull(taskId, 'taskId');
    _s.validateStringPattern(
      'taskId',
      taskId,
      r'''^[a-zA-Z0-9_-]{1,100}$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/v1/synthesisTasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSpeechSynthesisTaskOutput.fromJson(response);
  }

  /// Returns a list of pronunciation lexicons stored in an AWS Region. For more
  /// information, see <a
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
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
    );
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
    int maxResults,
    String nextToken,
    TaskStatus status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      4096,
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

  /// Stores a pronunciation lexicon in an AWS Region. If a lexicon with the
  /// same name already exists in the region, it is overwritten by the new
  /// lexicon. Lexicon operations have eventual consistency, therefore, it might
  /// take some time before the lexicon is available to the SynthesizeSpeech
  /// operation.
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
    @_s.required String content,
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(content, 'content');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringPattern(
      'name',
      name,
      r'''[0-9A-Za-z]{1,20}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Content': content,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/v1/lexicons/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutLexiconOutput.fromJson(response);
  }

  /// Allows the creation of an asynchronous synthesis task, by starting a new
  /// <code>SpeechSynthesisTask</code>. This operation requires all the standard
  /// information needed for speech synthesis, plus the name of an Amazon S3
  /// bucket for the service to store the output of the synthesis task and two
  /// optional parameters (OutputS3KeyPrefix and SnsTopicArn). Once the
  /// synthesis task is created, this operation will return a
  /// SpeechSynthesisTask object, which will include an identifier of this task
  /// as well as the current status.
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
  /// Specifies the engine (<code>standard</code> or <code>neural</code>) for
  /// Amazon Polly to use when processing input text for speech synthesis. Using
  /// a voice that is not supported for the engine selected will result in an
  /// error.
  ///
  /// Parameter [languageCode] :
  /// Optional language code for the Speech Synthesis request. This is only
  /// necessary if using a bilingual voice, such as Aditi, which can be used for
  /// either Indian English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon
  /// Polly will use the default language of the bilingual voice. The default
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
  /// value for neural voices is "24000".
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
    @_s.required OutputFormat outputFormat,
    @_s.required String outputS3BucketName,
    @_s.required String text,
    @_s.required VoiceId voiceId,
    Engine engine,
    LanguageCode languageCode,
    List<String> lexiconNames,
    String outputS3KeyPrefix,
    String sampleRate,
    String snsTopicArn,
    List<SpeechMarkType> speechMarkTypes,
    TextType textType,
  }) async {
    ArgumentError.checkNotNull(outputFormat, 'outputFormat');
    ArgumentError.checkNotNull(outputS3BucketName, 'outputS3BucketName');
    _s.validateStringPattern(
      'outputS3BucketName',
      outputS3BucketName,
      r'''^[a-z0-9][\.\-a-z0-9]{1,61}[a-z0-9]$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(text, 'text');
    ArgumentError.checkNotNull(voiceId, 'voiceId');
    _s.validateStringPattern(
      'outputS3KeyPrefix',
      outputS3KeyPrefix,
      r'''^[0-9a-zA-Z\/\!\-_\.\*\'\(\):;\$@=+\,\?&]{0,800}$''',
    );
    _s.validateStringPattern(
      'snsTopicArn',
      snsTopicArn,
      r'''^arn:aws(-(cn|iso(-b)?|us-gov))?:sns:[a-z0-9_-]{1,50}:\d{12}:[a-zA-Z0-9_-]{1,256}$''',
    );
    final $payload = <String, dynamic>{
      'OutputFormat': outputFormat?.toValue() ?? '',
      'OutputS3BucketName': outputS3BucketName,
      'Text': text,
      'VoiceId': voiceId?.toValue() ?? '',
      if (engine != null) 'Engine': engine.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lexiconNames != null) 'LexiconNames': lexiconNames,
      if (outputS3KeyPrefix != null) 'OutputS3KeyPrefix': outputS3KeyPrefix,
      if (sampleRate != null) 'SampleRate': sampleRate,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (speechMarkTypes != null)
        'SpeechMarkTypes':
            speechMarkTypes.map((e) => e?.toValue() ?? '').toList(),
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
  /// Specifies the engine (<code>standard</code> or <code>neural</code>) for
  /// Amazon Polly to use when processing input text for speech synthesis. For
  /// information on Amazon Polly voices and which voices are available in
  /// standard-only, NTTS-only, and both standard and NTTS formats, see <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/voicelist.html">Available
  /// Voices</a>.
  ///
  /// <b>NTTS-only voices</b>
  ///
  /// When using NTTS-only voices such as Kevin (en-US), this parameter is
  /// required and must be set to <code>neural</code>. If the engine is not
  /// specified, or is set to <code>standard</code>, this will result in an
  /// error.
  ///
  /// Type: String
  ///
  /// Valid Values: <code>standard</code> | <code>neural</code>
  ///
  /// Required: Yes
  ///
  /// <b>Standard voices</b>
  ///
  /// For standard voices, this is not required; the engine parameter defaults
  /// to <code>standard</code>. If the engine is not specified, or is set to
  /// <code>standard</code> and an NTTS-only voice is selected, this will result
  /// in an error.
  ///
  /// Parameter [languageCode] :
  /// Optional language code for the Synthesize Speech request. This is only
  /// necessary if using a bilingual voice, such as Aditi, which can be used for
  /// either Indian English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon
  /// Polly will use the default language of the bilingual voice. The default
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
  /// value for neural voices is "24000".
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
    @_s.required OutputFormat outputFormat,
    @_s.required String text,
    @_s.required VoiceId voiceId,
    Engine engine,
    LanguageCode languageCode,
    List<String> lexiconNames,
    String sampleRate,
    List<SpeechMarkType> speechMarkTypes,
    TextType textType,
  }) async {
    ArgumentError.checkNotNull(outputFormat, 'outputFormat');
    ArgumentError.checkNotNull(text, 'text');
    ArgumentError.checkNotNull(voiceId, 'voiceId');
    final $payload = <String, dynamic>{
      'OutputFormat': outputFormat?.toValue() ?? '',
      'Text': text,
      'VoiceId': voiceId?.toValue() ?? '',
      if (engine != null) 'Engine': engine.toValue(),
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (lexiconNames != null) 'LexiconNames': lexiconNames,
      if (sampleRate != null) 'SampleRate': sampleRate,
      if (speechMarkTypes != null)
        'SpeechMarkTypes':
            speechMarkTypes.map((e) => e?.toValue() ?? '').toList(),
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteLexiconOutput {
  DeleteLexiconOutput();
  factory DeleteLexiconOutput.fromJson(Map<String, dynamic> json) =>
      _$DeleteLexiconOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeVoicesOutput {
  /// The pagination token to use in the next request to continue the listing of
  /// voices. <code>NextToken</code> is returned only if the response is
  /// truncated.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of voices with their properties.
  @_s.JsonKey(name: 'Voices')
  final List<Voice> voices;

  DescribeVoicesOutput({
    this.nextToken,
    this.voices,
  });
  factory DescribeVoicesOutput.fromJson(Map<String, dynamic> json) =>
      _$DescribeVoicesOutputFromJson(json);
}

enum Engine {
  @_s.JsonValue('standard')
  standard,
  @_s.JsonValue('neural')
  neural,
}

extension on Engine {
  String toValue() {
    switch (this) {
      case Engine.standard:
        return 'standard';
      case Engine.neural:
        return 'neural';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum Gender {
  @_s.JsonValue('Female')
  female,
  @_s.JsonValue('Male')
  male,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetLexiconOutput {
  /// Lexicon object that provides name and the string content of the lexicon.
  @_s.JsonKey(name: 'Lexicon')
  final Lexicon lexicon;

  /// Metadata of the lexicon, including phonetic alphabetic used, language code,
  /// lexicon ARN, number of lexemes defined in the lexicon, and size of lexicon
  /// in bytes.
  @_s.JsonKey(name: 'LexiconAttributes')
  final LexiconAttributes lexiconAttributes;

  GetLexiconOutput({
    this.lexicon,
    this.lexiconAttributes,
  });
  factory GetLexiconOutput.fromJson(Map<String, dynamic> json) =>
      _$GetLexiconOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSpeechSynthesisTaskOutput {
  /// SynthesisTask object that provides information from the requested task,
  /// including output format, creation time, task status, and so on.
  @_s.JsonKey(name: 'SynthesisTask')
  final SynthesisTask synthesisTask;

  GetSpeechSynthesisTaskOutput({
    this.synthesisTask,
  });
  factory GetSpeechSynthesisTaskOutput.fromJson(Map<String, dynamic> json) =>
      _$GetSpeechSynthesisTaskOutputFromJson(json);
}

enum LanguageCode {
  @_s.JsonValue('arb')
  arb,
  @_s.JsonValue('cmn-CN')
  cmnCn,
  @_s.JsonValue('cy-GB')
  cyGb,
  @_s.JsonValue('da-DK')
  daDk,
  @_s.JsonValue('de-DE')
  deDe,
  @_s.JsonValue('en-AU')
  enAu,
  @_s.JsonValue('en-GB')
  enGb,
  @_s.JsonValue('en-GB-WLS')
  enGbWls,
  @_s.JsonValue('en-IN')
  enIn,
  @_s.JsonValue('en-US')
  enUs,
  @_s.JsonValue('es-ES')
  esEs,
  @_s.JsonValue('es-MX')
  esMx,
  @_s.JsonValue('es-US')
  esUs,
  @_s.JsonValue('fr-CA')
  frCa,
  @_s.JsonValue('fr-FR')
  frFr,
  @_s.JsonValue('is-IS')
  isIs,
  @_s.JsonValue('it-IT')
  itIt,
  @_s.JsonValue('ja-JP')
  jaJp,
  @_s.JsonValue('hi-IN')
  hiIn,
  @_s.JsonValue('ko-KR')
  koKr,
  @_s.JsonValue('nb-NO')
  nbNo,
  @_s.JsonValue('nl-NL')
  nlNl,
  @_s.JsonValue('pl-PL')
  plPl,
  @_s.JsonValue('pt-BR')
  ptBr,
  @_s.JsonValue('pt-PT')
  ptPt,
  @_s.JsonValue('ro-RO')
  roRo,
  @_s.JsonValue('ru-RU')
  ruRu,
  @_s.JsonValue('sv-SE')
  svSe,
  @_s.JsonValue('tr-TR')
  trTr,
}

extension on LanguageCode {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Provides lexicon name and lexicon content in string format. For more
/// information, see <a
/// href="https://www.w3.org/TR/pronunciation-lexicon/">Pronunciation Lexicon
/// Specification (PLS) Version 1.0</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Lexicon {
  /// Lexicon content in string format. The content of a lexicon must be in PLS
  /// format.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// Name of the lexicon.
  @_s.JsonKey(name: 'Name')
  final String name;

  Lexicon({
    this.content,
    this.name,
  });
  factory Lexicon.fromJson(Map<String, dynamic> json) =>
      _$LexiconFromJson(json);
}

/// Contains metadata describing the lexicon such as the number of lexemes,
/// language code, and so on. For more information, see <a
/// href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing
/// Lexicons</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LexiconAttributes {
  /// Phonetic alphabet used in the lexicon. Valid values are <code>ipa</code> and
  /// <code>x-sampa</code>.
  @_s.JsonKey(name: 'Alphabet')
  final String alphabet;

  /// Language code that the lexicon applies to. A lexicon with a language code
  /// such as "en" would be applied to all English languages (en-GB, en-US,
  /// en-AUS, en-WLS, and so on.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// Date lexicon was last modified (a timestamp value).
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastModified')
  final DateTime lastModified;

  /// Number of lexemes in the lexicon.
  @_s.JsonKey(name: 'LexemesCount')
  final int lexemesCount;

  /// Amazon Resource Name (ARN) of the lexicon.
  @_s.JsonKey(name: 'LexiconArn')
  final String lexiconArn;

  /// Total size of the lexicon, in characters.
  @_s.JsonKey(name: 'Size')
  final int size;

  LexiconAttributes({
    this.alphabet,
    this.languageCode,
    this.lastModified,
    this.lexemesCount,
    this.lexiconArn,
    this.size,
  });
  factory LexiconAttributes.fromJson(Map<String, dynamic> json) =>
      _$LexiconAttributesFromJson(json);
}

/// Describes the content of the lexicon.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LexiconDescription {
  /// Provides lexicon metadata.
  @_s.JsonKey(name: 'Attributes')
  final LexiconAttributes attributes;

  /// Name of the lexicon.
  @_s.JsonKey(name: 'Name')
  final String name;

  LexiconDescription({
    this.attributes,
    this.name,
  });
  factory LexiconDescription.fromJson(Map<String, dynamic> json) =>
      _$LexiconDescriptionFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListLexiconsOutput {
  /// A list of lexicon names and attributes.
  @_s.JsonKey(name: 'Lexicons')
  final List<LexiconDescription> lexicons;

  /// The pagination token to use in the next request to continue the listing of
  /// lexicons. <code>NextToken</code> is returned only if the response is
  /// truncated.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListLexiconsOutput({
    this.lexicons,
    this.nextToken,
  });
  factory ListLexiconsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListLexiconsOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSpeechSynthesisTasksOutput {
  /// An opaque pagination token returned from the previous List operation in this
  /// request. If present, this indicates where to continue the listing.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of SynthesisTask objects that provides information from the specified
  /// task in the list request, including output format, creation time, task
  /// status, and so on.
  @_s.JsonKey(name: 'SynthesisTasks')
  final List<SynthesisTask> synthesisTasks;

  ListSpeechSynthesisTasksOutput({
    this.nextToken,
    this.synthesisTasks,
  });
  factory ListSpeechSynthesisTasksOutput.fromJson(Map<String, dynamic> json) =>
      _$ListSpeechSynthesisTasksOutputFromJson(json);
}

enum OutputFormat {
  @_s.JsonValue('json')
  json,
  @_s.JsonValue('mp3')
  mp3,
  @_s.JsonValue('ogg_vorbis')
  oggVorbis,
  @_s.JsonValue('pcm')
  pcm,
}

extension on OutputFormat {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutLexiconOutput {
  PutLexiconOutput();
  factory PutLexiconOutput.fromJson(Map<String, dynamic> json) =>
      _$PutLexiconOutputFromJson(json);
}

enum SpeechMarkType {
  @_s.JsonValue('sentence')
  sentence,
  @_s.JsonValue('ssml')
  ssml,
  @_s.JsonValue('viseme')
  viseme,
  @_s.JsonValue('word')
  word,
}

extension on SpeechMarkType {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSpeechSynthesisTaskOutput {
  /// SynthesisTask object that provides information and attributes about a newly
  /// submitted speech synthesis task.
  @_s.JsonKey(name: 'SynthesisTask')
  final SynthesisTask synthesisTask;

  StartSpeechSynthesisTaskOutput({
    this.synthesisTask,
  });
  factory StartSpeechSynthesisTaskOutput.fromJson(Map<String, dynamic> json) =>
      _$StartSpeechSynthesisTaskOutputFromJson(json);
}

/// SynthesisTask object that provides information about a speech synthesis
/// task.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SynthesisTask {
  /// Timestamp for the time the synthesis task was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreationTime')
  final DateTime creationTime;

  /// Specifies the engine (<code>standard</code> or <code>neural</code>) for
  /// Amazon Polly to use when processing input text for speech synthesis. Using a
  /// voice that is not supported for the engine selected will result in an error.
  @_s.JsonKey(name: 'Engine')
  final Engine engine;

  /// Optional language code for a synthesis task. This is only necessary if using
  /// a bilingual voice, such as Aditi, which can be used for either Indian
  /// English (en-IN) or Hindi (hi-IN).
  ///
  /// If a bilingual voice is used and no language code is specified, Amazon Polly
  /// will use the default language of the bilingual voice. The default language
  /// for any voice is the one returned by the <a
  /// href="https://docs.aws.amazon.com/polly/latest/dg/API_DescribeVoices.html">DescribeVoices</a>
  /// operation for the <code>LanguageCode</code> parameter. For example, if no
  /// language code is specified, Aditi will use Indian English rather than Hindi.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// List of one or more pronunciation lexicon names you want the service to
  /// apply during synthesis. Lexicons are applied only if the language of the
  /// lexicon is the same as the language of the voice.
  @_s.JsonKey(name: 'LexiconNames')
  final List<String> lexiconNames;

  /// The format in which the returned output will be encoded. For audio stream,
  /// this will be mp3, ogg_vorbis, or pcm. For speech marks, this will be json.
  @_s.JsonKey(name: 'OutputFormat')
  final OutputFormat outputFormat;

  /// Pathway for the output speech file.
  @_s.JsonKey(name: 'OutputUri')
  final String outputUri;

  /// Number of billable characters synthesized.
  @_s.JsonKey(name: 'RequestCharacters')
  final int requestCharacters;

  /// The audio frequency specified in Hz.
  ///
  /// The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050", and
  /// "24000". The default value for standard voices is "22050". The default value
  /// for neural voices is "24000".
  ///
  /// Valid values for pcm are "8000" and "16000" The default value is "16000".
  @_s.JsonKey(name: 'SampleRate')
  final String sampleRate;

  /// ARN for the SNS topic optionally used for providing status notification for
  /// a speech synthesis task.
  @_s.JsonKey(name: 'SnsTopicArn')
  final String snsTopicArn;

  /// The type of speech marks returned for the input text.
  @_s.JsonKey(name: 'SpeechMarkTypes')
  final List<SpeechMarkType> speechMarkTypes;

  /// The Amazon Polly generated identifier for a speech synthesis task.
  @_s.JsonKey(name: 'TaskId')
  final String taskId;

  /// Current status of the individual speech synthesis task.
  @_s.JsonKey(name: 'TaskStatus')
  final TaskStatus taskStatus;

  /// Reason for the current status of a specific speech synthesis task, including
  /// errors if the task has failed.
  @_s.JsonKey(name: 'TaskStatusReason')
  final String taskStatusReason;

  /// Specifies whether the input text is plain text or SSML. The default value is
  /// plain text.
  @_s.JsonKey(name: 'TextType')
  final TextType textType;

  /// Voice ID to use for the synthesis.
  @_s.JsonKey(name: 'VoiceId')
  final VoiceId voiceId;

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
  factory SynthesisTask.fromJson(Map<String, dynamic> json) =>
      _$SynthesisTaskFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SynthesizeSpeechOutput {
  /// Stream containing the synthesized speech.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'AudioStream')
  final Uint8List audioStream;

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
  /// <code>ContentType</code> returned is audio/json.
  /// </li>
  /// </ul>
  ///
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// Number of characters synthesized.
  @_s.JsonKey(name: 'x-amzn-RequestCharacters')
  final int requestCharacters;

  SynthesizeSpeechOutput({
    this.audioStream,
    this.contentType,
    this.requestCharacters,
  });
  factory SynthesizeSpeechOutput.fromJson(Map<String, dynamic> json) =>
      _$SynthesizeSpeechOutputFromJson(json);
}

enum TaskStatus {
  @_s.JsonValue('scheduled')
  scheduled,
  @_s.JsonValue('inProgress')
  inProgress,
  @_s.JsonValue('completed')
  completed,
  @_s.JsonValue('failed')
  failed,
}

extension on TaskStatus {
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
    throw Exception('Unknown enum value: $this');
  }
}

enum TextType {
  @_s.JsonValue('ssml')
  ssml,
  @_s.JsonValue('text')
  text,
}

extension on TextType {
  String toValue() {
    switch (this) {
      case TextType.ssml:
        return 'ssml';
      case TextType.text:
        return 'text';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Description of the voice.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Voice {
  /// Additional codes for languages available for the specified voice in addition
  /// to its default language.
  ///
  /// For example, the default language for Aditi is Indian English (en-IN)
  /// because it was first used for that language. Since Aditi is bilingual and
  /// fluent in both Indian English and Hindi, this parameter would show the code
  /// <code>hi-IN</code>.
  @_s.JsonKey(name: 'AdditionalLanguageCodes')
  final List<LanguageCode> additionalLanguageCodes;

  /// Gender of the voice.
  @_s.JsonKey(name: 'Gender')
  final Gender gender;

  /// Amazon Polly assigned voice ID. This is the ID that you specify when calling
  /// the <code>SynthesizeSpeech</code> operation.
  @_s.JsonKey(name: 'Id')
  final VoiceId id;

  /// Language code of the voice.
  @_s.JsonKey(name: 'LanguageCode')
  final LanguageCode languageCode;

  /// Human readable name of the language in English.
  @_s.JsonKey(name: 'LanguageName')
  final String languageName;

  /// Name of the voice (for example, Salli, Kendra, etc.). This provides a human
  /// readable voice name that you might display in your application.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// Specifies which engines (<code>standard</code> or <code>neural</code>) that
  /// are supported by a given voice.
  @_s.JsonKey(name: 'SupportedEngines')
  final List<Engine> supportedEngines;

  Voice({
    this.additionalLanguageCodes,
    this.gender,
    this.id,
    this.languageCode,
    this.languageName,
    this.name,
    this.supportedEngines,
  });
  factory Voice.fromJson(Map<String, dynamic> json) => _$VoiceFromJson(json);
}

enum VoiceId {
  @_s.JsonValue('Aditi')
  aditi,
  @_s.JsonValue('Amy')
  amy,
  @_s.JsonValue('Astrid')
  astrid,
  @_s.JsonValue('Bianca')
  bianca,
  @_s.JsonValue('Brian')
  brian,
  @_s.JsonValue('Camila')
  camila,
  @_s.JsonValue('Carla')
  carla,
  @_s.JsonValue('Carmen')
  carmen,
  @_s.JsonValue('Celine')
  celine,
  @_s.JsonValue('Chantal')
  chantal,
  @_s.JsonValue('Conchita')
  conchita,
  @_s.JsonValue('Cristiano')
  cristiano,
  @_s.JsonValue('Dora')
  dora,
  @_s.JsonValue('Emma')
  emma,
  @_s.JsonValue('Enrique')
  enrique,
  @_s.JsonValue('Ewa')
  ewa,
  @_s.JsonValue('Filiz')
  filiz,
  @_s.JsonValue('Geraint')
  geraint,
  @_s.JsonValue('Giorgio')
  giorgio,
  @_s.JsonValue('Gwyneth')
  gwyneth,
  @_s.JsonValue('Hans')
  hans,
  @_s.JsonValue('Ines')
  ines,
  @_s.JsonValue('Ivy')
  ivy,
  @_s.JsonValue('Jacek')
  jacek,
  @_s.JsonValue('Jan')
  jan,
  @_s.JsonValue('Joanna')
  joanna,
  @_s.JsonValue('Joey')
  joey,
  @_s.JsonValue('Justin')
  justin,
  @_s.JsonValue('Karl')
  karl,
  @_s.JsonValue('Kendra')
  kendra,
  @_s.JsonValue('Kevin')
  kevin,
  @_s.JsonValue('Kimberly')
  kimberly,
  @_s.JsonValue('Lea')
  lea,
  @_s.JsonValue('Liv')
  liv,
  @_s.JsonValue('Lotte')
  lotte,
  @_s.JsonValue('Lucia')
  lucia,
  @_s.JsonValue('Lupe')
  lupe,
  @_s.JsonValue('Mads')
  mads,
  @_s.JsonValue('Maja')
  maja,
  @_s.JsonValue('Marlene')
  marlene,
  @_s.JsonValue('Mathieu')
  mathieu,
  @_s.JsonValue('Matthew')
  matthew,
  @_s.JsonValue('Maxim')
  maxim,
  @_s.JsonValue('Mia')
  mia,
  @_s.JsonValue('Miguel')
  miguel,
  @_s.JsonValue('Mizuki')
  mizuki,
  @_s.JsonValue('Naja')
  naja,
  @_s.JsonValue('Nicole')
  nicole,
  @_s.JsonValue('Olivia')
  olivia,
  @_s.JsonValue('Penelope')
  penelope,
  @_s.JsonValue('Raveena')
  raveena,
  @_s.JsonValue('Ricardo')
  ricardo,
  @_s.JsonValue('Ruben')
  ruben,
  @_s.JsonValue('Russell')
  russell,
  @_s.JsonValue('Salli')
  salli,
  @_s.JsonValue('Seoyeon')
  seoyeon,
  @_s.JsonValue('Takumi')
  takumi,
  @_s.JsonValue('Tatyana')
  tatyana,
  @_s.JsonValue('Vicki')
  vicki,
  @_s.JsonValue('Vitoria')
  vitoria,
  @_s.JsonValue('Zeina')
  zeina,
  @_s.JsonValue('Zhiyu')
  zhiyu,
}

extension on VoiceId {
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
    }
    throw Exception('Unknown enum value: $this');
  }
}

class EngineNotSupportedException extends _s.GenericAwsException {
  EngineNotSupportedException({String type, String message})
      : super(
            type: type, code: 'EngineNotSupportedException', message: message);
}

class InvalidLexiconException extends _s.GenericAwsException {
  InvalidLexiconException({String type, String message})
      : super(type: type, code: 'InvalidLexiconException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidS3BucketException extends _s.GenericAwsException {
  InvalidS3BucketException({String type, String message})
      : super(type: type, code: 'InvalidS3BucketException', message: message);
}

class InvalidS3KeyException extends _s.GenericAwsException {
  InvalidS3KeyException({String type, String message})
      : super(type: type, code: 'InvalidS3KeyException', message: message);
}

class InvalidSampleRateException extends _s.GenericAwsException {
  InvalidSampleRateException({String type, String message})
      : super(type: type, code: 'InvalidSampleRateException', message: message);
}

class InvalidSnsTopicArnException extends _s.GenericAwsException {
  InvalidSnsTopicArnException({String type, String message})
      : super(
            type: type, code: 'InvalidSnsTopicArnException', message: message);
}

class InvalidSsmlException extends _s.GenericAwsException {
  InvalidSsmlException({String type, String message})
      : super(type: type, code: 'InvalidSsmlException', message: message);
}

class InvalidTaskIdException extends _s.GenericAwsException {
  InvalidTaskIdException({String type, String message})
      : super(type: type, code: 'InvalidTaskIdException', message: message);
}

class LanguageNotSupportedException extends _s.GenericAwsException {
  LanguageNotSupportedException({String type, String message})
      : super(
            type: type,
            code: 'LanguageNotSupportedException',
            message: message);
}

class LexiconNotFoundException extends _s.GenericAwsException {
  LexiconNotFoundException({String type, String message})
      : super(type: type, code: 'LexiconNotFoundException', message: message);
}

class LexiconSizeExceededException extends _s.GenericAwsException {
  LexiconSizeExceededException({String type, String message})
      : super(
            type: type, code: 'LexiconSizeExceededException', message: message);
}

class MarksNotSupportedForFormatException extends _s.GenericAwsException {
  MarksNotSupportedForFormatException({String type, String message})
      : super(
            type: type,
            code: 'MarksNotSupportedForFormatException',
            message: message);
}

class MaxLexemeLengthExceededException extends _s.GenericAwsException {
  MaxLexemeLengthExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaxLexemeLengthExceededException',
            message: message);
}

class MaxLexiconsNumberExceededException extends _s.GenericAwsException {
  MaxLexiconsNumberExceededException({String type, String message})
      : super(
            type: type,
            code: 'MaxLexiconsNumberExceededException',
            message: message);
}

class ServiceFailureException extends _s.GenericAwsException {
  ServiceFailureException({String type, String message})
      : super(type: type, code: 'ServiceFailureException', message: message);
}

class SsmlMarksNotSupportedForTextTypeException extends _s.GenericAwsException {
  SsmlMarksNotSupportedForTextTypeException({String type, String message})
      : super(
            type: type,
            code: 'SsmlMarksNotSupportedForTextTypeException',
            message: message);
}

class SynthesisTaskNotFoundException extends _s.GenericAwsException {
  SynthesisTaskNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'SynthesisTaskNotFoundException',
            message: message);
}

class TextLengthExceededException extends _s.GenericAwsException {
  TextLengthExceededException({String type, String message})
      : super(
            type: type, code: 'TextLengthExceededException', message: message);
}

class UnsupportedPlsAlphabetException extends _s.GenericAwsException {
  UnsupportedPlsAlphabetException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedPlsAlphabetException',
            message: message);
}

class UnsupportedPlsLanguageException extends _s.GenericAwsException {
  UnsupportedPlsLanguageException({String type, String message})
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
