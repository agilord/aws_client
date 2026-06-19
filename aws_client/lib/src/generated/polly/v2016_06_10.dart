// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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
  /// May throw [LexiconSizeExceededException].
  /// May throw [MaxLexemeLengthExceededException].
  /// May throw [MaxLexiconsNumberExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [UnsupportedPlsAlphabetException].
  /// May throw [UnsupportedPlsLanguageException].
  ///
  /// Parameter [content] :
  /// Content of the PLS lexicon as string data.
  ///
  /// Parameter [name] :
  /// Name of the lexicon. The name must follow the regular express format
  /// \[0-9A-Za-z\]{1,20}. That is, the name is a case-sensitive alphanumeric
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

  /// Synthesizes UTF-8 input, plain text, or SSML over a bidirectional
  /// streaming connection. Specify synthesis parameters in HTTP/2 headers, send
  /// text incrementally as events on the input stream, and receive synthesized
  /// audio as it becomes available.
  ///
  /// This operation serves as a bidirectional counterpart to
  /// <code>SynthesizeSpeech</code>:
  ///
  /// <ul>
  /// <li>
  /// <a
  /// href="https://docs.aws.amazon.com/polly/latest/API/API_SynthesizeSpeech.html">SynthesizeSpeech</a>
  /// </li>
  /// </ul>
  ///
  /// May throw [ServiceFailureException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [engine] :
  /// Specifies the engine for Amazon Polly to use when processing input text
  /// for speech synthesis. Currently, only the <code>generative</code> engine
  /// is supported. If you specify a voice that the selected engine doesn't
  /// support, Amazon Polly returns an error.
  ///
  /// Parameter [outputFormat] :
  /// The audio format for the synthesized speech. Currently, Amazon Polly does
  /// not support JSON speech marks.
  ///
  /// Parameter [voiceId] :
  /// The voice to use in synthesis. To get a list of available voice IDs, use
  /// the <a
  /// href="https://docs.aws.amazon.com/polly/latest/API/API_DescribeVoices.html">DescribeVoices</a>
  /// operation.
  ///
  /// Parameter [actionStream] :
  /// The input event stream that contains text events and stream control
  /// events.
  ///
  /// Parameter [languageCode] :
  /// An optional parameter that sets the language code for the speech synthesis
  /// request. Specify this parameter only when using a bilingual voice. If a
  /// bilingual voice is used and no language code is specified, Amazon Polly
  /// uses the default language of the bilingual voice.
  ///
  /// Parameter [lexiconNames] :
  /// The names of one or more pronunciation lexicons for the service to apply
  /// during synthesis. Amazon Polly applies lexicons only when the lexicon
  /// language matches the voice language.
  ///
  /// Parameter [sampleRate] :
  /// The audio frequency, specified in Hz.
  Future<StartSpeechSynthesisStreamOutput> startSpeechSynthesisStream({
    required Engine engine,
    required OutputFormat outputFormat,
    required VoiceId voiceId,
    StartSpeechSynthesisStreamActionStream? actionStream,
    LanguageCode? languageCode,
    List<String>? lexiconNames,
    String? sampleRate,
  }) async {
    final headers = <String, String>{
      'x-amzn-Engine': engine.value,
      'x-amzn-OutputFormat': outputFormat.value,
      'x-amzn-VoiceId': voiceId.value,
      if (languageCode != null) 'x-amzn-LanguageCode': languageCode.value,
      if (lexiconNames != null)
        'x-amzn-LexiconNames': _s.encodeHttpHeaderList(lexiconNames),
      if (sampleRate != null) 'x-amzn-SampleRate': sampleRate.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: actionStream,
      method: 'POST',
      requestUri: '/v1/synthesisStream',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartSpeechSynthesisStreamOutput(
      eventStream: StartSpeechSynthesisStreamEventStream.fromJson($json),
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
  /// May throw [EngineNotSupportedException].
  /// May throw [InvalidS3BucketException].
  /// May throw [InvalidS3KeyException].
  /// May throw [InvalidSampleRateException].
  /// May throw [InvalidSnsTopicArnException].
  /// May throw [InvalidSsmlException].
  /// May throw [LanguageNotSupportedException].
  /// May throw [LexiconNotFoundException].
  /// May throw [MarksNotSupportedForFormatException].
  /// May throw [ServiceFailureException].
  /// May throw [SsmlMarksNotSupportedForTextTypeException].
  /// May throw [TextLengthExceededException].
  ///
  /// Parameter [outputFormat] :
  /// The format in which the returned output will be encoded. For audio stream,
  /// this will be mp3, ogg_vorbis, ogg_opus, mu-law, a-law, or pcm. For speech
  /// marks, this will be json.
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
  /// Valid value for ogg_opus is "48000".
  ///
  /// Valid value for mu-law and a-law is "8000".
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
  /// May throw [EngineNotSupportedException].
  /// May throw [InvalidSampleRateException].
  /// May throw [InvalidSsmlException].
  /// May throw [LanguageNotSupportedException].
  /// May throw [LexiconNotFoundException].
  /// May throw [MarksNotSupportedForFormatException].
  /// May throw [ServiceFailureException].
  /// May throw [SsmlMarksNotSupportedForTextTypeException].
  /// May throw [TextLengthExceededException].
  ///
  /// Parameter [outputFormat] :
  /// The format in which the returned output will be encoded. For audio stream,
  /// this will be mp3, ogg_vorbis, ogg_opus, mu-law, a-law or pcm. For speech
  /// marks, this will be json.
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
  /// The valid values for mp3 and ogg_vorbis are "8000", "16000", "22050",
  /// "24000", "44100" and "48000". The default value for standard voices is
  /// "22050". The default value for neural voices is "24000". The default value
  /// for long-form voices is "24000". The default value for generative voices
  /// is "24000".
  ///
  /// Valid values for pcm are "8000" and "16000" The default value is "16000".
  ///
  /// Valid value for ogg_opus is "48000".
  ///
  /// Valid value for mu-law and a-law is "8000".
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

/// @nodoc
class DeleteLexiconOutput {
  DeleteLexiconOutput();

  factory DeleteLexiconOutput.fromJson(Map<String, dynamic> _) {
    return DeleteLexiconOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An unknown condition has caused a service failure.
///
/// @nodoc
class ServiceFailureException implements _s.AwsException {
  final String? message;

  ServiceFailureException({
    this.message,
  });

  factory ServiceFailureException.fromJson(Map<String, dynamic> json) {
    return ServiceFailureException(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class PutLexiconOutput {
  PutLexiconOutput();

  factory PutLexiconOutput.fromJson(Map<String, dynamic> _) {
    return PutLexiconOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StartSpeechSynthesisStreamOutput {
  /// The output event stream that contains synthesized audio events and stream
  /// status events.
  final StartSpeechSynthesisStreamEventStream? eventStream;

  StartSpeechSynthesisStreamOutput({
    this.eventStream,
  });

  Map<String, dynamic> toJson() {
    final eventStream = this.eventStream;
    return {
      if (eventStream != null) 'EventStream': eventStream,
    };
  }
}

/// The request would cause a service quota to be exceeded.
///
/// @nodoc
class ServiceQuotaExceededException implements _s.AwsException {
  final String? message;

  /// The quota code identifying the specific quota.
  final QuotaCode? quotaCode;

  /// The service code identifying the originating service.
  final ServiceCode? serviceCode;

  ServiceQuotaExceededException({
    this.message,
    this.quotaCode,
    this.serviceCode,
  });

  factory ServiceQuotaExceededException.fromJson(Map<String, dynamic> json) {
    return ServiceQuotaExceededException(
      message: json['message'] as String?,
      quotaCode: (json['quotaCode'] as String?)?.let(QuotaCode.fromString),
      serviceCode:
          (json['serviceCode'] as String?)?.let(ServiceCode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final quotaCode = this.quotaCode;
    final serviceCode = this.serviceCode;
    return {
      if (message != null) 'message': message,
      if (quotaCode != null) 'quotaCode': quotaCode.value,
      if (serviceCode != null) 'serviceCode': serviceCode.value,
    };
  }
}

/// The request was denied because of request throttling.
///
/// @nodoc
class ThrottlingException implements _s.AwsException {
  final String? message;

  /// A list of reasons explaining why the request was throttled.
  final List<ThrottlingReason>? throttlingReasons;

  ThrottlingException({
    this.message,
    this.throttlingReasons,
  });

  factory ThrottlingException.fromJson(Map<String, dynamic> json) {
    return ThrottlingException(
      message: json['message'] as String?,
      throttlingReasons: (json['throttlingReasons'] as List?)
          ?.nonNulls
          .map((e) => ThrottlingReason.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final throttlingReasons = this.throttlingReasons;
    return {
      if (message != null) 'message': message,
      if (throttlingReasons != null) 'throttlingReasons': throttlingReasons,
    };
  }
}

/// The input fails to satisfy the constraints specified by the service.
///
/// @nodoc
class ValidationException implements _s.AwsException {
  /// The fields that caused the validation error.
  final List<ValidationExceptionField>? fields;
  final String? message;

  /// The reason the request failed validation.
  final ValidationExceptionReason? reason;

  ValidationException({
    this.fields,
    this.message,
    this.reason,
  });

  factory ValidationException.fromJson(Map<String, dynamic> json) {
    return ValidationException(
      fields: (json['fields'] as List?)
          ?.nonNulls
          .map((e) =>
              ValidationExceptionField.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      reason: (json['reason'] as String?)
          ?.let(ValidationExceptionReason.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final fields = this.fields;
    final message = this.message;
    final reason = this.reason;
    return {
      if (fields != null) 'fields': fields,
      if (message != null) 'message': message,
      if (reason != null) 'reason': reason.value,
    };
  }
}

/// @nodoc
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

/// @nodoc
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
  /// If you request <code>ogg_opus</code> as the <code>OutputFormat</code>, the
  /// <code>ContentType</code> returned is audio/ogg.
  /// </li>
  /// <li>
  /// If you request <code>pcm</code> as the <code>OutputFormat</code>, the
  /// <code>ContentType</code> returned is audio/pcm in a signed 16-bit, 1 channel
  /// (mono), little-endian format.
  /// </li>
  /// <li>
  /// If you request <code>mu-law</code> as the <code>OutputFormat</code>, the
  /// <code>ContentType</code> returned is audio/mulaw.
  /// </li>
  /// <li>
  /// If you request <code>a-law</code> as the <code>OutputFormat</code>, the
  /// <code>ContentType</code> returned is audio/alaw.
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

/// @nodoc
class Engine {
  static const standard = Engine._('standard');
  static const neural = Engine._('neural');
  static const longForm = Engine._('long-form');
  static const generative = Engine._('generative');

  final String value;

  const Engine._(this.value);

  static const values = [standard, neural, longForm, generative];

  static Engine fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Engine._(value));

  @override
  bool operator ==(other) => other is Engine && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LanguageCode {
  static const arb = LanguageCode._('arb');
  static const cmnCn = LanguageCode._('cmn-CN');
  static const cyGb = LanguageCode._('cy-GB');
  static const daDk = LanguageCode._('da-DK');
  static const deDe = LanguageCode._('de-DE');
  static const enAu = LanguageCode._('en-AU');
  static const enGb = LanguageCode._('en-GB');
  static const enGbWls = LanguageCode._('en-GB-WLS');
  static const enIn = LanguageCode._('en-IN');
  static const enUs = LanguageCode._('en-US');
  static const esEs = LanguageCode._('es-ES');
  static const esMx = LanguageCode._('es-MX');
  static const esUs = LanguageCode._('es-US');
  static const frCa = LanguageCode._('fr-CA');
  static const frFr = LanguageCode._('fr-FR');
  static const isIs = LanguageCode._('is-IS');
  static const itIt = LanguageCode._('it-IT');
  static const jaJp = LanguageCode._('ja-JP');
  static const hiIn = LanguageCode._('hi-IN');
  static const koKr = LanguageCode._('ko-KR');
  static const nbNo = LanguageCode._('nb-NO');
  static const nlNl = LanguageCode._('nl-NL');
  static const plPl = LanguageCode._('pl-PL');
  static const ptBr = LanguageCode._('pt-BR');
  static const ptPt = LanguageCode._('pt-PT');
  static const roRo = LanguageCode._('ro-RO');
  static const ruRu = LanguageCode._('ru-RU');
  static const svSe = LanguageCode._('sv-SE');
  static const trTr = LanguageCode._('tr-TR');
  static const enNz = LanguageCode._('en-NZ');
  static const enZa = LanguageCode._('en-ZA');
  static const caEs = LanguageCode._('ca-ES');
  static const deAt = LanguageCode._('de-AT');
  static const yueCn = LanguageCode._('yue-CN');
  static const arAe = LanguageCode._('ar-AE');
  static const fiFi = LanguageCode._('fi-FI');
  static const enIe = LanguageCode._('en-IE');
  static const nlBe = LanguageCode._('nl-BE');
  static const frBe = LanguageCode._('fr-BE');
  static const csCz = LanguageCode._('cs-CZ');
  static const deCh = LanguageCode._('de-CH');
  static const enSg = LanguageCode._('en-SG');

  final String value;

  const LanguageCode._(this.value);

  static const values = [
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
    csCz,
    deCh,
    enSg
  ];

  static LanguageCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LanguageCode._(value));

  @override
  bool operator ==(other) => other is LanguageCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OutputFormat {
  static const json = OutputFormat._('json');
  static const mp3 = OutputFormat._('mp3');
  static const oggOpus = OutputFormat._('ogg_opus');
  static const oggVorbis = OutputFormat._('ogg_vorbis');
  static const pcm = OutputFormat._('pcm');
  static const mulaw = OutputFormat._('mulaw');
  static const alaw = OutputFormat._('alaw');

  final String value;

  const OutputFormat._(this.value);

  static const values = [json, mp3, oggOpus, oggVorbis, pcm, mulaw, alaw];

  static OutputFormat fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => OutputFormat._(value));

  @override
  bool operator ==(other) => other is OutputFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TextType {
  static const ssml = TextType._('ssml');
  static const text = TextType._('text');

  final String value;

  const TextType._(this.value);

  static const values = [ssml, text];

  static TextType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TextType._(value));

  @override
  bool operator ==(other) => other is TextType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class VoiceId {
  static const aditi = VoiceId._('Aditi');
  static const amy = VoiceId._('Amy');
  static const astrid = VoiceId._('Astrid');
  static const bianca = VoiceId._('Bianca');
  static const brian = VoiceId._('Brian');
  static const camila = VoiceId._('Camila');
  static const carla = VoiceId._('Carla');
  static const carmen = VoiceId._('Carmen');
  static const celine = VoiceId._('Celine');
  static const chantal = VoiceId._('Chantal');
  static const conchita = VoiceId._('Conchita');
  static const cristiano = VoiceId._('Cristiano');
  static const dora = VoiceId._('Dora');
  static const emma = VoiceId._('Emma');
  static const enrique = VoiceId._('Enrique');
  static const ewa = VoiceId._('Ewa');
  static const filiz = VoiceId._('Filiz');
  static const gabrielle = VoiceId._('Gabrielle');
  static const geraint = VoiceId._('Geraint');
  static const giorgio = VoiceId._('Giorgio');
  static const gwyneth = VoiceId._('Gwyneth');
  static const hans = VoiceId._('Hans');
  static const ines = VoiceId._('Ines');
  static const ivy = VoiceId._('Ivy');
  static const jacek = VoiceId._('Jacek');
  static const jan = VoiceId._('Jan');
  static const joanna = VoiceId._('Joanna');
  static const joey = VoiceId._('Joey');
  static const justin = VoiceId._('Justin');
  static const karl = VoiceId._('Karl');
  static const kendra = VoiceId._('Kendra');
  static const kevin = VoiceId._('Kevin');
  static const kimberly = VoiceId._('Kimberly');
  static const lea = VoiceId._('Lea');
  static const liv = VoiceId._('Liv');
  static const lotte = VoiceId._('Lotte');
  static const lucia = VoiceId._('Lucia');
  static const lupe = VoiceId._('Lupe');
  static const mads = VoiceId._('Mads');
  static const maja = VoiceId._('Maja');
  static const marlene = VoiceId._('Marlene');
  static const mathieu = VoiceId._('Mathieu');
  static const matthew = VoiceId._('Matthew');
  static const maxim = VoiceId._('Maxim');
  static const mia = VoiceId._('Mia');
  static const miguel = VoiceId._('Miguel');
  static const mizuki = VoiceId._('Mizuki');
  static const naja = VoiceId._('Naja');
  static const nicole = VoiceId._('Nicole');
  static const olivia = VoiceId._('Olivia');
  static const penelope = VoiceId._('Penelope');
  static const raveena = VoiceId._('Raveena');
  static const ricardo = VoiceId._('Ricardo');
  static const ruben = VoiceId._('Ruben');
  static const russell = VoiceId._('Russell');
  static const salli = VoiceId._('Salli');
  static const seoyeon = VoiceId._('Seoyeon');
  static const takumi = VoiceId._('Takumi');
  static const tatyana = VoiceId._('Tatyana');
  static const vicki = VoiceId._('Vicki');
  static const vitoria = VoiceId._('Vitoria');
  static const zeina = VoiceId._('Zeina');
  static const zhiyu = VoiceId._('Zhiyu');
  static const aria = VoiceId._('Aria');
  static const ayanda = VoiceId._('Ayanda');
  static const arlet = VoiceId._('Arlet');
  static const hannah = VoiceId._('Hannah');
  static const arthur = VoiceId._('Arthur');
  static const daniel = VoiceId._('Daniel');
  static const liam = VoiceId._('Liam');
  static const pedro = VoiceId._('Pedro');
  static const kajal = VoiceId._('Kajal');
  static const hiujin = VoiceId._('Hiujin');
  static const laura = VoiceId._('Laura');
  static const elin = VoiceId._('Elin');
  static const ida = VoiceId._('Ida');
  static const suvi = VoiceId._('Suvi');
  static const ola = VoiceId._('Ola');
  static const hala = VoiceId._('Hala');
  static const andres = VoiceId._('Andres');
  static const sergio = VoiceId._('Sergio');
  static const remi = VoiceId._('Remi');
  static const adriano = VoiceId._('Adriano');
  static const thiago = VoiceId._('Thiago');
  static const ruth = VoiceId._('Ruth');
  static const stephen = VoiceId._('Stephen');
  static const kazuha = VoiceId._('Kazuha');
  static const tomoko = VoiceId._('Tomoko');
  static const niamh = VoiceId._('Niamh');
  static const sofie = VoiceId._('Sofie');
  static const lisa = VoiceId._('Lisa');
  static const isabelle = VoiceId._('Isabelle');
  static const zayd = VoiceId._('Zayd');
  static const danielle = VoiceId._('Danielle');
  static const gregory = VoiceId._('Gregory');
  static const burcu = VoiceId._('Burcu');
  static const jitka = VoiceId._('Jitka');
  static const sabrina = VoiceId._('Sabrina');
  static const jasmine = VoiceId._('Jasmine');
  static const jihye = VoiceId._('Jihye');
  static const ambre = VoiceId._('Ambre');
  static const beatrice = VoiceId._('Beatrice');
  static const florian = VoiceId._('Florian');
  static const lennart = VoiceId._('Lennart');
  static const lorenzo = VoiceId._('Lorenzo');
  static const tiffany = VoiceId._('Tiffany');

  final String value;

  const VoiceId._(this.value);

  static const values = [
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
    jitka,
    sabrina,
    jasmine,
    jihye,
    ambre,
    beatrice,
    florian,
    lennart,
    lorenzo,
    tiffany
  ];

  static VoiceId fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => VoiceId._(value));

  @override
  bool operator ==(other) => other is VoiceId && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class SpeechMarkType {
  static const sentence = SpeechMarkType._('sentence');
  static const ssml = SpeechMarkType._('ssml');
  static const viseme = SpeechMarkType._('viseme');
  static const word = SpeechMarkType._('word');

  final String value;

  const SpeechMarkType._(this.value);

  static const values = [sentence, ssml, viseme, word];

  static SpeechMarkType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SpeechMarkType._(value));

  @override
  bool operator ==(other) => other is SpeechMarkType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// SynthesisTask object that provides information about a speech synthesis
/// task.
///
/// @nodoc
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
  /// this will be mp3, ogg_vorbis, ogg_opus, mu-law, a-law, or pcm. For speech
  /// marks, this will be json.
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
  ///
  /// Valid value for ogg_opus is "48000".
  ///
  /// Valid value for mu-law and a-law is "8000".
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      outputFormat:
          (json['OutputFormat'] as String?)?.let(OutputFormat.fromString),
      outputUri: json['OutputUri'] as String?,
      requestCharacters: json['RequestCharacters'] as int?,
      sampleRate: json['SampleRate'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
      speechMarkTypes: (json['SpeechMarkTypes'] as List?)
          ?.nonNulls
          .map((e) => SpeechMarkType.fromString((e as String)))
          .toList(),
      taskId: json['TaskId'] as String?,
      taskStatus: (json['TaskStatus'] as String?)?.let(TaskStatus.fromString),
      taskStatusReason: json['TaskStatusReason'] as String?,
      textType: (json['TextType'] as String?)?.let(TextType.fromString),
      voiceId: (json['VoiceId'] as String?)?.let(VoiceId.fromString),
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
      if (engine != null) 'Engine': engine.value,
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (lexiconNames != null) 'LexiconNames': lexiconNames,
      if (outputFormat != null) 'OutputFormat': outputFormat.value,
      if (outputUri != null) 'OutputUri': outputUri,
      if (requestCharacters != null) 'RequestCharacters': requestCharacters,
      if (sampleRate != null) 'SampleRate': sampleRate,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (speechMarkTypes != null)
        'SpeechMarkTypes': speechMarkTypes.map((e) => e.value).toList(),
      if (taskId != null) 'TaskId': taskId,
      if (taskStatus != null) 'TaskStatus': taskStatus.value,
      if (taskStatusReason != null) 'TaskStatusReason': taskStatusReason,
      if (textType != null) 'TextType': textType.value,
      if (voiceId != null) 'VoiceId': voiceId.value,
    };
  }
}

/// @nodoc
class TaskStatus {
  static const scheduled = TaskStatus._('scheduled');
  static const inProgress = TaskStatus._('inProgress');
  static const completed = TaskStatus._('completed');
  static const failed = TaskStatus._('failed');

  final String value;

  const TaskStatus._(this.value);

  static const values = [scheduled, inProgress, completed, failed];

  static TaskStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TaskStatus._(value));

  @override
  bool operator ==(other) => other is TaskStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ValidationExceptionReason {
  static const unsupportedOperation =
      ValidationExceptionReason._('unsupportedOperation');
  static const fieldValidationFailed =
      ValidationExceptionReason._('fieldValidationFailed');
  static const other = ValidationExceptionReason._('other');
  static const invalidInboundEvent =
      ValidationExceptionReason._('invalidInboundEvent');

  final String value;

  const ValidationExceptionReason._(this.value);

  static const values = [
    unsupportedOperation,
    fieldValidationFailed,
    other,
    invalidInboundEvent
  ];

  static ValidationExceptionReason fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ValidationExceptionReason._(value));

  @override
  bool operator ==(other) =>
      other is ValidationExceptionReason && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a field that failed validation.
///
/// @nodoc
class ValidationExceptionField {
  /// A message describing why the field failed validation.
  final String message;

  /// The name of the field that failed validation.
  final String name;

  ValidationExceptionField({
    required this.message,
    required this.name,
  });

  factory ValidationExceptionField.fromJson(Map<String, dynamic> json) {
    return ValidationExceptionField(
      message: (json['message'] as String?) ?? '',
      name: (json['name'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final name = this.name;
    return {
      'message': message,
      'name': name,
    };
  }
}

/// Provides information about a specific throttling reason.
///
/// @nodoc
class ThrottlingReason {
  /// The reason code explaining why the request was throttled.
  final String? reason;

  /// The resource that caused the throttling.
  final String? resource;

  ThrottlingReason({
    this.reason,
    this.resource,
  });

  factory ThrottlingReason.fromJson(Map<String, dynamic> json) {
    return ThrottlingReason(
      reason: json['reason'] as String?,
      resource: json['resource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reason = this.reason;
    final resource = this.resource;
    return {
      if (reason != null) 'reason': reason,
      if (resource != null) 'resource': resource,
    };
  }
}

/// @nodoc
class QuotaCode {
  static const inputStreamInboundEventTimeout =
      QuotaCode._('input-stream-inbound-event-timeout');
  static const inputStreamTimeout = QuotaCode._('input-stream-timeout');

  final String value;

  const QuotaCode._(this.value);

  static const values = [inputStreamInboundEventTimeout, inputStreamTimeout];

  static QuotaCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => QuotaCode._(value));

  @override
  bool operator ==(other) => other is QuotaCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ServiceCode {
  static const polly = ServiceCode._('polly');

  final String value;

  const ServiceCode._(this.value);

  static const values = [polly];

  static ServiceCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ServiceCode._(value));

  @override
  bool operator ==(other) => other is ServiceCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Outbound event stream that contains synthesized audio data and stream status
/// events.
///
/// @nodoc
class StartSpeechSynthesisStreamEventStream {
  /// An audio event containing synthesized speech.
  final AudioEvent? audioEvent;
  final ServiceFailureException? serviceFailureException;

  /// An exception indicating a service quota would be exceeded.
  final ServiceQuotaExceededException? serviceQuotaExceededException;

  /// An event, with summary information, indicating the stream has closed.
  final StreamClosedEvent? streamClosedEvent;

  /// An exception indicating the request was throttled.
  final ThrottlingException? throttlingException;

  /// An exception indicating the input failed validation.
  final ValidationException? validationException;

  StartSpeechSynthesisStreamEventStream({
    this.audioEvent,
    this.serviceFailureException,
    this.serviceQuotaExceededException,
    this.streamClosedEvent,
    this.throttlingException,
    this.validationException,
  });

  factory StartSpeechSynthesisStreamEventStream.fromJson(
      Map<String, dynamic> json) {
    return StartSpeechSynthesisStreamEventStream(
      audioEvent: json['AudioEvent'] != null
          ? AudioEvent.fromJson(json['AudioEvent'] as Map<String, dynamic>)
          : null,
      serviceFailureException: json['ServiceFailureException'] != null
          ? ServiceFailureException.fromJson(
              json['ServiceFailureException'] as Map<String, dynamic>)
          : null,
      serviceQuotaExceededException:
          json['ServiceQuotaExceededException'] != null
              ? ServiceQuotaExceededException.fromJson(
                  json['ServiceQuotaExceededException'] as Map<String, dynamic>)
              : null,
      streamClosedEvent: json['StreamClosedEvent'] != null
          ? StreamClosedEvent.fromJson(
              json['StreamClosedEvent'] as Map<String, dynamic>)
          : null,
      throttlingException: json['ThrottlingException'] != null
          ? ThrottlingException.fromJson(
              json['ThrottlingException'] as Map<String, dynamic>)
          : null,
      validationException: json['ValidationException'] != null
          ? ValidationException.fromJson(
              json['ValidationException'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audioEvent = this.audioEvent;
    final serviceFailureException = this.serviceFailureException;
    final serviceQuotaExceededException = this.serviceQuotaExceededException;
    final streamClosedEvent = this.streamClosedEvent;
    final throttlingException = this.throttlingException;
    final validationException = this.validationException;
    return {
      if (audioEvent != null) 'AudioEvent': audioEvent,
      if (serviceFailureException != null)
        'ServiceFailureException': serviceFailureException,
      if (serviceQuotaExceededException != null)
        'ServiceQuotaExceededException': serviceQuotaExceededException,
      if (streamClosedEvent != null) 'StreamClosedEvent': streamClosedEvent,
      if (throttlingException != null)
        'ThrottlingException': throttlingException,
      if (validationException != null)
        'ValidationException': validationException,
    };
  }
}

/// Contains a chunk of synthesized audio data.
///
/// @nodoc
class AudioEvent {
  /// A chunk of synthesized audio data encoded in the format specified by the
  /// <code>OutputFormat</code> parameter.
  final Uint8List? audioChunk;

  AudioEvent({
    this.audioChunk,
  });

  factory AudioEvent.fromJson(Map<String, dynamic> json) {
    return AudioEvent(
      audioChunk: _s.decodeNullableUint8List(json['AudioChunk'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    final audioChunk = this.audioChunk;
    return {
      if (audioChunk != null) 'AudioChunk': base64Encode(audioChunk),
    };
  }
}

/// Indicates that the synthesis stream is closed and provides summary
/// information.
///
/// @nodoc
class StreamClosedEvent {
  /// The total number of characters synthesized during the streaming session.
  final int? requestCharacters;

  StreamClosedEvent({
    this.requestCharacters,
  });

  factory StreamClosedEvent.fromJson(Map<String, dynamic> json) {
    return StreamClosedEvent(
      requestCharacters: json['RequestCharacters'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final requestCharacters = this.requestCharacters;
    return {
      if (requestCharacters != null) 'RequestCharacters': requestCharacters,
    };
  }
}

/// Inbound event stream for sending input and control events to manage
/// bidirectional speech synthesis.
///
/// @nodoc
class StartSpeechSynthesisStreamActionStream {
  /// An event indicating the end of the input stream.
  final CloseStreamEvent? closeStreamEvent;

  /// A text event containing content to be synthesized.
  final TextEvent? textEvent;

  StartSpeechSynthesisStreamActionStream({
    this.closeStreamEvent,
    this.textEvent,
  });

  Map<String, dynamic> toJson() {
    final closeStreamEvent = this.closeStreamEvent;
    final textEvent = this.textEvent;
    return {
      if (closeStreamEvent != null) 'CloseStreamEvent': closeStreamEvent,
      if (textEvent != null) 'TextEvent': textEvent,
    };
  }
}

/// Contains text content to be synthesized into speech.
///
/// @nodoc
class TextEvent {
  /// The text content to synthesize. If you specify <code>ssml</code> as the
  /// <code>TextType</code>, follow the SSML format for the input text.
  final String text;

  /// Configuration for controlling when synthesized audio flushes to the output
  /// stream.
  final FlushStreamConfiguration? flushStreamConfiguration;

  /// Specifies whether the input text is plain text or SSML. Default: plain text.
  final TextType? textType;

  TextEvent({
    required this.text,
    this.flushStreamConfiguration,
    this.textType,
  });

  Map<String, dynamic> toJson() {
    final text = this.text;
    final flushStreamConfiguration = this.flushStreamConfiguration;
    final textType = this.textType;
    return {
      'Text': text,
      if (flushStreamConfiguration != null)
        'FlushStreamConfiguration': flushStreamConfiguration,
      if (textType != null) 'TextType': textType.value,
    };
  }
}

/// Indicates the end of the input stream. After sending this event, the input
/// stream will be closed and all audio will be returned.
///
/// @nodoc
class CloseStreamEvent {
  CloseStreamEvent();

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Configuration that controls when synthesized audio data is sent on the
/// output stream.
///
/// @nodoc
class FlushStreamConfiguration {
  /// Specifies whether to force the synthesis engine to immediately write
  /// buffered audio data to the output stream.
  final bool? force;

  FlushStreamConfiguration({
    this.force,
  });

  Map<String, dynamic> toJson() {
    final force = this.force;
    return {
      if (force != null) 'Force': force,
    };
  }
}

/// Describes the content of the lexicon.
///
/// @nodoc
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

/// Contains metadata describing the lexicon such as the number of lexemes,
/// language code, and so on. For more information, see <a
/// href="https://docs.aws.amazon.com/polly/latest/dg/managing-lexicons.html">Managing
/// Lexicons</a>.
///
/// @nodoc
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

  Map<String, dynamic> toJson() {
    final alphabet = this.alphabet;
    final languageCode = this.languageCode;
    final lastModified = this.lastModified;
    final lexemesCount = this.lexemesCount;
    final lexiconArn = this.lexiconArn;
    final size = this.size;
    return {
      if (alphabet != null) 'Alphabet': alphabet,
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (lastModified != null)
        'LastModified': unixTimestampToJson(lastModified),
      if (lexemesCount != null) 'LexemesCount': lexemesCount,
      if (lexiconArn != null) 'LexiconArn': lexiconArn,
      if (size != null) 'Size': size,
    };
  }
}

/// Provides lexicon name and lexicon content in string format. For more
/// information, see <a
/// href="https://www.w3.org/TR/pronunciation-lexicon/">Pronunciation Lexicon
/// Specification (PLS) Version 1.0</a>.
///
/// @nodoc
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

/// Description of the voice.
///
/// @nodoc
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
          ?.nonNulls
          .map((e) => LanguageCode.fromString((e as String)))
          .toList(),
      gender: (json['Gender'] as String?)?.let(Gender.fromString),
      id: (json['Id'] as String?)?.let(VoiceId.fromString),
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      languageName: json['LanguageName'] as String?,
      name: json['Name'] as String?,
      supportedEngines: (json['SupportedEngines'] as List?)
          ?.nonNulls
          .map((e) => Engine.fromString((e as String)))
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
            additionalLanguageCodes.map((e) => e.value).toList(),
      if (gender != null) 'Gender': gender.value,
      if (id != null) 'Id': id.value,
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (languageName != null) 'LanguageName': languageName,
      if (name != null) 'Name': name,
      if (supportedEngines != null)
        'SupportedEngines': supportedEngines.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class Gender {
  static const female = Gender._('Female');
  static const male = Gender._('Male');

  final String value;

  const Gender._(this.value);

  static const values = [female, male];

  static Gender fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Gender._(value));

  @override
  bool operator ==(other) => other is Gender && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class EngineNotSupportedException extends _s.GenericAwsException {
  EngineNotSupportedException({String? type, String? message})
      : super(
            type: type, code: 'EngineNotSupportedException', message: message);
}

/// @nodoc
class InvalidLexiconException extends _s.GenericAwsException {
  InvalidLexiconException({String? type, String? message})
      : super(type: type, code: 'InvalidLexiconException', message: message);
}

/// @nodoc
class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

/// @nodoc
class InvalidS3BucketException extends _s.GenericAwsException {
  InvalidS3BucketException({String? type, String? message})
      : super(type: type, code: 'InvalidS3BucketException', message: message);
}

/// @nodoc
class InvalidS3KeyException extends _s.GenericAwsException {
  InvalidS3KeyException({String? type, String? message})
      : super(type: type, code: 'InvalidS3KeyException', message: message);
}

/// @nodoc
class InvalidSampleRateException extends _s.GenericAwsException {
  InvalidSampleRateException({String? type, String? message})
      : super(type: type, code: 'InvalidSampleRateException', message: message);
}

/// @nodoc
class InvalidSnsTopicArnException extends _s.GenericAwsException {
  InvalidSnsTopicArnException({String? type, String? message})
      : super(
            type: type, code: 'InvalidSnsTopicArnException', message: message);
}

/// @nodoc
class InvalidSsmlException extends _s.GenericAwsException {
  InvalidSsmlException({String? type, String? message})
      : super(type: type, code: 'InvalidSsmlException', message: message);
}

/// @nodoc
class InvalidTaskIdException extends _s.GenericAwsException {
  InvalidTaskIdException({String? type, String? message})
      : super(type: type, code: 'InvalidTaskIdException', message: message);
}

/// @nodoc
class LanguageNotSupportedException extends _s.GenericAwsException {
  LanguageNotSupportedException({String? type, String? message})
      : super(
            type: type,
            code: 'LanguageNotSupportedException',
            message: message);
}

/// @nodoc
class LexiconNotFoundException extends _s.GenericAwsException {
  LexiconNotFoundException({String? type, String? message})
      : super(type: type, code: 'LexiconNotFoundException', message: message);
}

/// @nodoc
class LexiconSizeExceededException extends _s.GenericAwsException {
  LexiconSizeExceededException({String? type, String? message})
      : super(
            type: type, code: 'LexiconSizeExceededException', message: message);
}

/// @nodoc
class MarksNotSupportedForFormatException extends _s.GenericAwsException {
  MarksNotSupportedForFormatException({String? type, String? message})
      : super(
            type: type,
            code: 'MarksNotSupportedForFormatException',
            message: message);
}

/// @nodoc
class MaxLexemeLengthExceededException extends _s.GenericAwsException {
  MaxLexemeLengthExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxLexemeLengthExceededException',
            message: message);
}

/// @nodoc
class MaxLexiconsNumberExceededException extends _s.GenericAwsException {
  MaxLexiconsNumberExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'MaxLexiconsNumberExceededException',
            message: message);
}

/// @nodoc
class SsmlMarksNotSupportedForTextTypeException extends _s.GenericAwsException {
  SsmlMarksNotSupportedForTextTypeException({String? type, String? message})
      : super(
            type: type,
            code: 'SsmlMarksNotSupportedForTextTypeException',
            message: message);
}

/// @nodoc
class SynthesisTaskNotFoundException extends _s.GenericAwsException {
  SynthesisTaskNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'SynthesisTaskNotFoundException',
            message: message);
}

/// @nodoc
class TextLengthExceededException extends _s.GenericAwsException {
  TextLengthExceededException({String? type, String? message})
      : super(
            type: type, code: 'TextLengthExceededException', message: message);
}

/// @nodoc
class UnsupportedPlsAlphabetException extends _s.GenericAwsException {
  UnsupportedPlsAlphabetException({String? type, String? message})
      : super(
            type: type,
            code: 'UnsupportedPlsAlphabetException',
            message: message);
}

/// @nodoc
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
      ServiceFailureException(message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(message: message),
  'SsmlMarksNotSupportedForTextTypeException': (type, message) =>
      SsmlMarksNotSupportedForTextTypeException(type: type, message: message),
  'SynthesisTaskNotFoundException': (type, message) =>
      SynthesisTaskNotFoundException(type: type, message: message),
  'TextLengthExceededException': (type, message) =>
      TextLengthExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
  'UnsupportedPlsAlphabetException': (type, message) =>
      UnsupportedPlsAlphabetException(type: type, message: message),
  'UnsupportedPlsLanguageException': (type, message) =>
      UnsupportedPlsLanguageException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(message: message),
};
