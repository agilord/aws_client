// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2017_10_26.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Amazon Transcribe streaming offers four main types of real-time
/// transcription: <b>Standard</b>, <b>Medical</b>, <b>Call Analytics</b>, and
/// <b>Health Scribe</b>.
///
/// <ul>
/// <li>
/// <b>Standard transcriptions</b> are the most common option. Refer to for
/// details.
/// </li>
/// <li>
/// <b>Medical transcriptions</b> are tailored to medical professionals and
/// incorporate medical terms. A common use case for this service is
/// transcribing doctor-patient dialogue in real time, so doctors can focus on
/// their patient instead of taking notes. Refer to for details.
/// </li>
/// <li>
/// <b>Call Analytics transcriptions</b> are designed for use with call center
/// audio on two different channels; if you're looking for insight into customer
/// service calls, use this option. Refer to for details.
/// </li>
/// <li>
/// <b>HealthScribe transcriptions</b> are designed to automatically create
/// clinical notes from patient-clinician conversations using generative AI.
/// Refer to \[here\] for details.
/// </li>
/// </ul>
class TranscribeStreaming {
  final _s.RestJsonProtocol _protocol;
  factory TranscribeStreaming({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'transcribestreaming',
      signingName: 'transcribe',
    );
    return TranscribeStreaming._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  TranscribeStreaming._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Provides details about the specified Amazon Web Services HealthScribe
  /// streaming session. To view the status of the streaming session, check the
  /// <code>StreamStatus</code> field in the response. To get the details of
  /// post-stream analytics, including its status, check the
  /// <code>PostStreamAnalyticsResult</code> field in the response.
  ///
  /// May throw [BadRequestException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sessionId] :
  /// The identifier of the HealthScribe streaming session you want information
  /// about.
  Future<GetMedicalScribeStreamResponse> getMedicalScribeStream({
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/medical-scribe-stream/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMedicalScribeStreamResponse.fromJson(response);
  }

  /// Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed
  /// to Amazon Transcribe and the transcription results are streamed to your
  /// application. Use this operation for <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/call-analytics.html">Call
  /// Analytics</a> transcriptions.
  ///
  /// The following parameters are required:
  ///
  /// <ul>
  /// <li>
  /// <code>language-code</code> or <code>identify-language</code>
  /// </li>
  /// <li>
  /// <code>media-encoding</code>
  /// </li>
  /// <li>
  /// <code>sample-rate</code>
  /// </li>
  /// </ul>
  /// For more information on streaming with Amazon Transcribe, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html">Transcribing
  /// streaming audio</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [audioStream] :
  /// An encoded stream of audio blobs. Audio streams are encoded as either
  /// HTTP/2 or WebSocket data frames.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html">Transcribing
  /// streaming audio</a>.
  ///
  /// Parameter [mediaEncoding] :
  /// Specify the encoding of your input audio. Supported formats are:
  ///
  /// <ul>
  /// <li>
  /// FLAC
  /// </li>
  /// <li>
  /// OPUS-encoded audio in an Ogg container
  /// </li>
  /// <li>
  /// PCM (only signed 16-bit little-endian audio formats, which does not
  /// include WAV)
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio">Media
  /// formats</a>.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate of the input audio (in hertz). Low-quality audio, such as
  /// telephone audio, is typically around 8,000 Hz. High-quality audio
  /// typically ranges from 16,000 Hz to 48,000 Hz. Note that the sample rate
  /// you specify must match that of your audio.
  ///
  /// Parameter [contentIdentificationType] :
  /// Labels all personally identifiable information (PII) identified in your
  /// transcript.
  ///
  /// Content identification is performed at the segment level; PII specified in
  /// <code>PiiEntityTypes</code> is flagged upon complete transcription of an
  /// audio segment. If you don't include <code>PiiEntityTypes</code> in your
  /// request, all PII is identified.
  ///
  /// You can’t set <code>ContentIdentificationType</code> and
  /// <code>ContentRedactionType</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/pii-redaction.html">Redacting
  /// or identifying personally identifiable information</a>.
  ///
  /// Parameter [contentRedactionType] :
  /// Redacts all personally identifiable information (PII) identified in your
  /// transcript.
  ///
  /// Content redaction is performed at the segment level; PII specified in
  /// <code>PiiEntityTypes</code> is redacted upon complete transcription of an
  /// audio segment. If you don't include <code>PiiEntityTypes</code> in your
  /// request, all PII is redacted.
  ///
  /// You can’t set <code>ContentRedactionType</code> and
  /// <code>ContentIdentificationType</code> in the same request. If you set
  /// both, your request returns a <code>BadRequestException</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/pii-redaction.html">Redacting
  /// or identifying personally identifiable information</a>.
  ///
  /// Parameter [enablePartialResultsStabilization] :
  /// Enables partial result stabilization for your transcription. Partial
  /// result stabilization can reduce latency in your output, but may impact
  /// accuracy. For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#streaming-partial-result-stabilization">Partial-result
  /// stabilization</a>.
  ///
  /// Parameter [identifyLanguage] :
  /// Enables automatic language identification for your Call Analytics
  /// transcription.
  ///
  /// If you include <code>IdentifyLanguage</code>, you must include a list of
  /// language codes, using <code>LanguageOptions</code>, that you think may be
  /// present in your audio stream. You must provide a minimum of two language
  /// selections.
  ///
  /// You can also include a preferred language using
  /// <code>PreferredLanguage</code>. Adding a preferred language can help
  /// Amazon Transcribe identify the language faster than if you omit this
  /// parameter.
  ///
  /// Note that you must include either <code>LanguageCode</code> or
  /// <code>IdentifyLanguage</code> in your request. If you include both
  /// parameters, your transcription job fails.
  ///
  /// Parameter [languageCode] :
  /// Specify the language code that represents the language spoken in your
  /// audio.
  ///
  /// For a list of languages supported with real-time Call Analytics, refer to
  /// the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  ///
  /// Parameter [languageModelName] :
  /// Specify the name of the custom language model that you want to use when
  /// processing your transcription. Note that language model names are case
  /// sensitive.
  ///
  /// The language of the specified language model must match the language code
  /// you specify in your transcription request. If the languages don't match,
  /// the custom language model isn't applied. There are no errors or warnings
  /// associated with a language mismatch.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html">Custom
  /// language models</a>.
  ///
  /// Parameter [languageOptions] :
  /// Specify two or more language codes that represent the languages you think
  /// may be present in your media.
  ///
  /// Including language options can improve the accuracy of language
  /// identification.
  ///
  /// If you include <code>LanguageOptions</code> in your request, you must also
  /// include <code>IdentifyLanguage</code>.
  ///
  /// For a list of languages supported with Call Analytics streaming, refer to
  /// the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  /// <important>
  /// You can only include one language dialect per language per stream. For
  /// example, you cannot include <code>en-US</code> and <code>en-AU</code> in
  /// the same request.
  /// </important>
  ///
  /// Parameter [partialResultsStability] :
  /// Specify the level of stability to use when you enable partial results
  /// stabilization (<code>EnablePartialResultsStabilization</code>).
  ///
  /// Low stability provides the highest accuracy. High stability transcribes
  /// faster, but with slightly lower accuracy.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#streaming-partial-result-stabilization">Partial-result
  /// stabilization</a>.
  ///
  /// Parameter [piiEntityTypes] :
  /// Specify which types of personally identifiable information (PII) you want
  /// to redact in your transcript. You can include as many types as you'd like,
  /// or you can select <code>ALL</code>.
  ///
  /// Values must be comma-separated and can include: <code>ADDRESS</code>,
  /// <code>BANK_ACCOUNT_NUMBER</code>, <code>BANK_ROUTING</code>,
  /// <code>CREDIT_DEBIT_CVV</code>, <code>CREDIT_DEBIT_EXPIRY</code>,
  /// <code>CREDIT_DEBIT_NUMBER</code>, <code>EMAIL</code>, <code>NAME</code>,
  /// <code>PHONE</code>, <code>PIN</code>, <code>SSN</code>, or
  /// <code>ALL</code>.
  ///
  /// Note that if you include <code>PiiEntityTypes</code> in your request, you
  /// must also include <code>ContentIdentificationType</code> or
  /// <code>ContentRedactionType</code>.
  ///
  /// If you include <code>ContentRedactionType</code> or
  /// <code>ContentIdentificationType</code> in your request, but do not include
  /// <code>PiiEntityTypes</code>, all PII is redacted or identified.
  ///
  /// Parameter [preferredLanguage] :
  /// Specify a preferred language from the subset of languages codes you
  /// specified in <code>LanguageOptions</code>.
  ///
  /// You can only use this parameter if you've included
  /// <code>IdentifyLanguage</code> and <code>LanguageOptions</code> in your
  /// request.
  ///
  /// Parameter [sessionId] :
  /// Specify a name for your Call Analytics transcription session. If you don't
  /// include this parameter in your request, Amazon Transcribe generates an ID
  /// and returns it in the response.
  ///
  /// Parameter [vocabularyFilterMethod] :
  /// Specify how you want your vocabulary filter applied to your transcript.
  ///
  /// To replace words with <code>***</code>, choose <code>mask</code>.
  ///
  /// To delete words, choose <code>remove</code>.
  ///
  /// To flag words without changing them, choose <code>tag</code>.
  ///
  /// Parameter [vocabularyFilterName] :
  /// Specify the name of the custom vocabulary filter that you want to use when
  /// processing your transcription. Note that vocabulary filter names are case
  /// sensitive.
  ///
  /// If the language of the specified custom vocabulary filter doesn't match
  /// the language identified in your media, the vocabulary filter is not
  /// applied to your transcription.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html">Using
  /// vocabulary filtering with unwanted words</a>.
  ///
  /// Parameter [vocabularyFilterNames] :
  /// Specify the names of the custom vocabulary filters that you want to use
  /// when processing your Call Analytics transcription. Note that vocabulary
  /// filter names are case sensitive.
  ///
  /// These filters serve to customize the transcript output.
  /// <important>
  /// This parameter is only intended for use <b>with</b> the
  /// <code>IdentifyLanguage</code> parameter. If you're <b>not</b> including
  /// <code>IdentifyLanguage</code> in your request and want to use a custom
  /// vocabulary filter with your transcription, use the
  /// <code>VocabularyFilterName</code> parameter instead.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html">Using
  /// vocabulary filtering with unwanted words</a>.
  ///
  /// Parameter [vocabularyName] :
  /// Specify the name of the custom vocabulary that you want to use when
  /// processing your transcription. Note that vocabulary names are case
  /// sensitive.
  ///
  /// If the language of the specified custom vocabulary doesn't match the
  /// language identified in your media, the custom vocabulary is not applied to
  /// your transcription.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom
  /// vocabularies</a>.
  ///
  /// Parameter [vocabularyNames] :
  /// Specify the names of the custom vocabularies that you want to use when
  /// processing your Call Analytics transcription. Note that vocabulary names
  /// are case sensitive.
  ///
  /// If the custom vocabulary's language doesn't match the identified media
  /// language, it won't be applied to the transcription.
  /// <important>
  /// This parameter is only intended for use <b>with</b> the
  /// <code>IdentifyLanguage</code> parameter. If you're <b>not</b> including
  /// <code>IdentifyLanguage</code> in your request and want to use a custom
  /// vocabulary with your transcription, use the <code>VocabularyName</code>
  /// parameter instead.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom
  /// vocabularies</a>.
  Future<StartCallAnalyticsStreamTranscriptionResponse>
      startCallAnalyticsStreamTranscription({
    required AudioStream audioStream,
    required MediaEncoding mediaEncoding,
    required int mediaSampleRateHertz,
    ContentIdentificationType? contentIdentificationType,
    ContentRedactionType? contentRedactionType,
    bool? enablePartialResultsStabilization,
    bool? identifyLanguage,
    CallAnalyticsLanguageCode? languageCode,
    String? languageModelName,
    String? languageOptions,
    PartialResultsStability? partialResultsStability,
    String? piiEntityTypes,
    CallAnalyticsLanguageCode? preferredLanguage,
    String? sessionId,
    VocabularyFilterMethod? vocabularyFilterMethod,
    String? vocabularyFilterName,
    String? vocabularyFilterNames,
    String? vocabularyName,
    String? vocabularyNames,
  }) async {
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      8000,
      48000,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amzn-transcribe-media-encoding': mediaEncoding.value,
      'x-amzn-transcribe-sample-rate': mediaSampleRateHertz.toString(),
      if (contentIdentificationType != null)
        'x-amzn-transcribe-content-identification-type':
            contentIdentificationType.value,
      if (contentRedactionType != null)
        'x-amzn-transcribe-content-redaction-type': contentRedactionType.value,
      if (enablePartialResultsStabilization != null)
        'x-amzn-transcribe-enable-partial-results-stabilization':
            enablePartialResultsStabilization.toString(),
      if (identifyLanguage != null)
        'x-amzn-transcribe-identify-language': identifyLanguage.toString(),
      if (languageCode != null)
        'x-amzn-transcribe-language-code': languageCode.value,
      if (languageModelName != null)
        'x-amzn-transcribe-language-model-name': languageModelName.toString(),
      if (languageOptions != null)
        'x-amzn-transcribe-language-options': languageOptions.toString(),
      if (partialResultsStability != null)
        'x-amzn-transcribe-partial-results-stability':
            partialResultsStability.value,
      if (piiEntityTypes != null)
        'x-amzn-transcribe-pii-entity-types': piiEntityTypes.toString(),
      if (preferredLanguage != null)
        'x-amzn-transcribe-preferred-language': preferredLanguage.value,
      if (sessionId != null)
        'x-amzn-transcribe-session-id': sessionId.toString(),
      if (vocabularyFilterMethod != null)
        'x-amzn-transcribe-vocabulary-filter-method':
            vocabularyFilterMethod.value,
      if (vocabularyFilterName != null)
        'x-amzn-transcribe-vocabulary-filter-name':
            vocabularyFilterName.toString(),
      if (vocabularyFilterNames != null)
        'x-amzn-transcribe-vocabulary-filter-names':
            vocabularyFilterNames.toString(),
      if (vocabularyName != null)
        'x-amzn-transcribe-vocabulary-name': vocabularyName.toString(),
      if (vocabularyNames != null)
        'x-amzn-transcribe-vocabulary-names': vocabularyNames.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: audioStream,
      method: 'POST',
      requestUri: '/call-analytics-stream-transcription',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartCallAnalyticsStreamTranscriptionResponse(
      callAnalyticsTranscriptResultStream:
          CallAnalyticsTranscriptResultStream.fromJson($json),
      contentIdentificationType: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-content-identification-type')
          ?.let(ContentIdentificationType.fromString),
      contentRedactionType: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-content-redaction-type')
          ?.let(ContentRedactionType.fromString),
      enablePartialResultsStabilization: _s.extractHeaderBoolValue(
          response.headers,
          'x-amzn-transcribe-enable-partial-results-stabilization'),
      identifyLanguage: _s.extractHeaderBoolValue(
          response.headers, 'x-amzn-transcribe-identify-language'),
      languageCode: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-language-code')
          ?.let(CallAnalyticsLanguageCode.fromString),
      languageModelName: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-language-model-name'),
      languageOptions: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-language-options'),
      mediaEncoding: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-media-encoding')
          ?.let(MediaEncoding.fromString),
      mediaSampleRateHertz: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-transcribe-sample-rate'),
      partialResultsStability: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-partial-results-stability')
          ?.let(PartialResultsStability.fromString),
      piiEntityTypes: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-pii-entity-types'),
      preferredLanguage: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-preferred-language')
          ?.let(CallAnalyticsLanguageCode.fromString),
      requestId:
          _s.extractHeaderStringValue(response.headers, 'x-amzn-request-id'),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-session-id'),
      vocabularyFilterMethod: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-vocabulary-filter-method')
          ?.let(VocabularyFilterMethod.fromString),
      vocabularyFilterName: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-filter-name'),
      vocabularyFilterNames: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-filter-names'),
      vocabularyName: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-name'),
      vocabularyNames: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-names'),
    );
  }

  /// Starts a bidirectional HTTP/2 stream, where audio is streamed to Amazon
  /// Web Services HealthScribe and the transcription results are streamed to
  /// your application.
  ///
  /// When you start a stream, you first specify the stream configuration in a
  /// <code>MedicalScribeConfigurationEvent</code>. This event includes channel
  /// definitions, encryption settings, medical scribe context, and post-stream
  /// analytics settings, such as the output configuration for aggregated
  /// transcript and clinical note generation. These are additional streaming
  /// session configurations beyond those provided in your initial start request
  /// headers. Whether you are starting a new session or resuming an existing
  /// session, your first event must be a
  /// <code>MedicalScribeConfigurationEvent</code>.
  ///
  /// After you send a <code>MedicalScribeConfigurationEvent</code>, you start
  /// <code>AudioEvents</code> and Amazon Web Services HealthScribe responds
  /// with real-time transcription results. When you are finished, to start
  /// processing the results with the post-stream analytics, send a
  /// <code>MedicalScribeSessionControlEvent</code> with a <code>Type</code> of
  /// <code>END_OF_SESSION</code> and Amazon Web Services HealthScribe starts
  /// the analytics.
  ///
  /// You can pause or resume streaming. To pause streaming, complete the input
  /// stream without sending the <code>MedicalScribeSessionControlEvent</code>.
  /// To resume streaming, call the <code>StartMedicalScribeStream</code> and
  /// specify the same SessionId you used to start the stream.
  ///
  /// The following parameters are required:
  ///
  /// <ul>
  /// <li>
  /// <code>language-code</code>
  /// </li>
  /// <li>
  /// <code>media-encoding</code>
  /// </li>
  /// <li>
  /// <code>media-sample-rate-hertz</code>
  /// </li>
  /// </ul>
  ///
  ///
  /// For more information on streaming with Amazon Web Services HealthScribe,
  /// see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe-streaming.html">Amazon
  /// Web Services HealthScribe</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [inputStream] :
  /// Specify the input stream where you will send events in real time.
  ///
  /// The first element of the input stream must be a
  /// <code>MedicalScribeConfigurationEvent</code>.
  ///
  /// Parameter [languageCode] :
  /// Specify the language code for your HealthScribe streaming session.
  ///
  /// Parameter [mediaEncoding] :
  /// Specify the encoding used for the input audio.
  ///
  /// Supported formats are:
  ///
  /// <ul>
  /// <li>
  /// FLAC
  /// </li>
  /// <li>
  /// OPUS-encoded audio in an Ogg container
  /// </li>
  /// <li>
  /// PCM (only signed 16-bit little-endian audio formats, which does not
  /// include WAV)
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio">Media
  /// formats</a>.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// Specify the sample rate of the input audio (in hertz). Amazon Web Services
  /// HealthScribe supports a range from 16,000 Hz to 48,000 Hz. The sample rate
  /// you specify must match that of your audio.
  ///
  /// Parameter [sessionId] :
  /// Specify an identifier for your streaming session (in UUID format). If you
  /// don't include a SessionId in your request, Amazon Web Services
  /// HealthScribe generates an ID and returns it in the response.
  Future<StartMedicalScribeStreamResponse> startMedicalScribeStream({
    required MedicalScribeInputStream inputStream,
    required MedicalScribeLanguageCode languageCode,
    required MedicalScribeMediaEncoding mediaEncoding,
    required int mediaSampleRateHertz,
    String? sessionId,
  }) async {
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      16000,
      48000,
      isRequired: true,
    );
    final headers = <String, String>{
      'x-amzn-transcribe-language-code': languageCode.value,
      'x-amzn-transcribe-media-encoding': mediaEncoding.value,
      'x-amzn-transcribe-sample-rate': mediaSampleRateHertz.toString(),
      if (sessionId != null)
        'x-amzn-transcribe-session-id': sessionId.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: inputStream,
      method: 'POST',
      requestUri: '/medical-scribe-stream',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartMedicalScribeStreamResponse(
      resultStream: MedicalScribeResultStream.fromJson($json),
      languageCode: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-language-code')
          ?.let(MedicalScribeLanguageCode.fromString),
      mediaEncoding: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-media-encoding')
          ?.let(MedicalScribeMediaEncoding.fromString),
      mediaSampleRateHertz: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-transcribe-sample-rate'),
      requestId:
          _s.extractHeaderStringValue(response.headers, 'x-amzn-request-id'),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-session-id'),
    );
  }

  /// Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed
  /// to Amazon Transcribe Medical and the transcription results are streamed to
  /// your application.
  ///
  /// The following parameters are required:
  ///
  /// <ul>
  /// <li>
  /// <code>language-code</code>
  /// </li>
  /// <li>
  /// <code>media-encoding</code>
  /// </li>
  /// <li>
  /// <code>sample-rate</code>
  /// </li>
  /// </ul>
  /// For more information on streaming with Amazon Transcribe Medical, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html">Transcribing
  /// streaming audio</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [languageCode] :
  /// Specify the language code that represents the language spoken in your
  /// audio.
  /// <important>
  /// Amazon Transcribe Medical only supports US English (<code>en-US</code>).
  /// </important>
  ///
  /// Parameter [mediaEncoding] :
  /// Specify the encoding used for the input audio. Supported formats are:
  ///
  /// <ul>
  /// <li>
  /// FLAC
  /// </li>
  /// <li>
  /// OPUS-encoded audio in an Ogg container
  /// </li>
  /// <li>
  /// PCM (only signed 16-bit little-endian audio formats, which does not
  /// include WAV)
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio">Media
  /// formats</a>.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate of the input audio (in hertz). Amazon Transcribe Medical
  /// supports a range from 16,000 Hz to 48,000 Hz. Note that the sample rate
  /// you specify must match that of your audio.
  ///
  /// Parameter [specialty] :
  /// Specify the medical specialty contained in your audio.
  ///
  /// Parameter [type] :
  /// Specify the type of input audio. For example, choose
  /// <code>DICTATION</code> for a provider dictating patient notes and
  /// <code>CONVERSATION</code> for a dialogue between a patient and a medical
  /// professional.
  ///
  /// Parameter [contentIdentificationType] :
  /// Labels all personal health information (PHI) identified in your
  /// transcript.
  ///
  /// Content identification is performed at the segment level; PHI is flagged
  /// upon complete transcription of an audio segment.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/phi-id.html">Identifying
  /// personal health information (PHI) in a transcription</a>.
  ///
  /// Parameter [enableChannelIdentification] :
  /// Enables channel identification in multi-channel audio.
  ///
  /// Channel identification transcribes the audio on each channel
  /// independently, then appends the output for each channel into one
  /// transcript.
  ///
  /// If you have multi-channel audio and do not enable channel identification,
  /// your audio is transcribed in a continuous manner and your transcript is
  /// not separated by channel.
  ///
  /// If you include <code>EnableChannelIdentification</code> in your request,
  /// you must also include <code>NumberOfChannels</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html">Transcribing
  /// multi-channel audio</a>.
  ///
  /// Parameter [numberOfChannels] :
  /// Specify the number of channels in your audio stream. This value must be
  /// <code>2</code>, as only two channels are supported. If your audio doesn't
  /// contain multiple channels, do not include this parameter in your request.
  ///
  /// If you include <code>NumberOfChannels</code> in your request, you must
  /// also include <code>EnableChannelIdentification</code>.
  ///
  /// Parameter [sessionId] :
  /// Specify a name for your transcription session. If you don't include this
  /// parameter in your request, Amazon Transcribe Medical generates an ID and
  /// returns it in the response.
  ///
  /// Parameter [showSpeakerLabel] :
  /// Enables speaker partitioning (diarization) in your transcription output.
  /// Speaker partitioning labels the speech from individual speakers in your
  /// media file.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html">Partitioning
  /// speakers (diarization)</a>.
  ///
  /// Parameter [vocabularyName] :
  /// Specify the name of the custom vocabulary that you want to use when
  /// processing your transcription. Note that vocabulary names are case
  /// sensitive.
  Future<StartMedicalStreamTranscriptionResponse>
      startMedicalStreamTranscription({
    required AudioStream audioStream,
    required LanguageCode languageCode,
    required MediaEncoding mediaEncoding,
    required int mediaSampleRateHertz,
    required Specialty specialty,
    required Type type,
    MedicalContentIdentificationType? contentIdentificationType,
    bool? enableChannelIdentification,
    int? numberOfChannels,
    String? sessionId,
    bool? showSpeakerLabel,
    String? vocabularyName,
  }) async {
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      8000,
      48000,
      isRequired: true,
    );
    _s.validateNumRange(
      'numberOfChannels',
      numberOfChannels,
      2,
      1152921504606846976,
    );
    final headers = <String, String>{
      'x-amzn-transcribe-language-code': languageCode.value,
      'x-amzn-transcribe-media-encoding': mediaEncoding.value,
      'x-amzn-transcribe-sample-rate': mediaSampleRateHertz.toString(),
      'x-amzn-transcribe-specialty': specialty.value,
      'x-amzn-transcribe-type': type.value,
      if (contentIdentificationType != null)
        'x-amzn-transcribe-content-identification-type':
            contentIdentificationType.value,
      if (enableChannelIdentification != null)
        'x-amzn-transcribe-enable-channel-identification':
            enableChannelIdentification.toString(),
      if (numberOfChannels != null)
        'x-amzn-transcribe-number-of-channels': numberOfChannels.toString(),
      if (sessionId != null)
        'x-amzn-transcribe-session-id': sessionId.toString(),
      if (showSpeakerLabel != null)
        'x-amzn-transcribe-show-speaker-label': showSpeakerLabel.toString(),
      if (vocabularyName != null)
        'x-amzn-transcribe-vocabulary-name': vocabularyName.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: audioStream,
      method: 'POST',
      requestUri: '/medical-stream-transcription',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartMedicalStreamTranscriptionResponse(
      transcriptResultStream: MedicalTranscriptResultStream.fromJson($json),
      contentIdentificationType: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-content-identification-type')
          ?.let(MedicalContentIdentificationType.fromString),
      enableChannelIdentification: _s.extractHeaderBoolValue(
          response.headers, 'x-amzn-transcribe-enable-channel-identification'),
      languageCode: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-language-code')
          ?.let(LanguageCode.fromString),
      mediaEncoding: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-media-encoding')
          ?.let(MediaEncoding.fromString),
      mediaSampleRateHertz: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-transcribe-sample-rate'),
      numberOfChannels: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-transcribe-number-of-channels'),
      requestId:
          _s.extractHeaderStringValue(response.headers, 'x-amzn-request-id'),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-session-id'),
      showSpeakerLabel: _s.extractHeaderBoolValue(
          response.headers, 'x-amzn-transcribe-show-speaker-label'),
      specialty: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-specialty')
          ?.let(Specialty.fromString),
      type: _s
          .extractHeaderStringValue(response.headers, 'x-amzn-transcribe-type')
          ?.let(Type.fromString),
      vocabularyName: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-name'),
    );
  }

  /// Starts a bidirectional HTTP/2 or WebSocket stream where audio is streamed
  /// to Amazon Transcribe and the transcription results are streamed to your
  /// application.
  ///
  /// The following parameters are required:
  ///
  /// <ul>
  /// <li>
  /// <code>language-code</code> or <code>identify-language</code> or
  /// <code>identify-multiple-language</code>
  /// </li>
  /// <li>
  /// <code>media-encoding</code>
  /// </li>
  /// <li>
  /// <code>sample-rate</code>
  /// </li>
  /// </ul>
  /// For more information on streaming with Amazon Transcribe, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html">Transcribing
  /// streaming audio</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [InternalFailureException].
  /// May throw [LimitExceededException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [audioStream] :
  /// An encoded stream of audio blobs. Audio streams are encoded as either
  /// HTTP/2 or WebSocket data frames.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html">Transcribing
  /// streaming audio</a>.
  ///
  /// Parameter [mediaEncoding] :
  /// Specify the encoding of your input audio. Supported formats are:
  ///
  /// <ul>
  /// <li>
  /// FLAC
  /// </li>
  /// <li>
  /// OPUS-encoded audio in an Ogg container
  /// </li>
  /// <li>
  /// PCM (only signed 16-bit little-endian audio formats, which does not
  /// include WAV)
  /// </li>
  /// </ul>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio">Media
  /// formats</a>.
  ///
  /// Parameter [mediaSampleRateHertz] :
  /// The sample rate of the input audio (in hertz). Low-quality audio, such as
  /// telephone audio, is typically around 8,000 Hz. High-quality audio
  /// typically ranges from 16,000 Hz to 48,000 Hz. Note that the sample rate
  /// you specify must match that of your audio.
  ///
  /// Parameter [contentIdentificationType] :
  /// Labels all personally identifiable information (PII) identified in your
  /// transcript.
  ///
  /// Content identification is performed at the segment level; PII specified in
  /// <code>PiiEntityTypes</code> is flagged upon complete transcription of an
  /// audio segment. If you don't include <code>PiiEntityTypes</code> in your
  /// request, all PII is identified.
  ///
  /// You can’t set <code>ContentIdentificationType</code> and
  /// <code>ContentRedactionType</code> in the same request. If you set both,
  /// your request returns a <code>BadRequestException</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/pii-redaction.html">Redacting
  /// or identifying personally identifiable information</a>.
  ///
  /// Parameter [contentRedactionType] :
  /// Redacts all personally identifiable information (PII) identified in your
  /// transcript.
  ///
  /// Content redaction is performed at the segment level; PII specified in
  /// <code>PiiEntityTypes</code> is redacted upon complete transcription of an
  /// audio segment. If you don't include <code>PiiEntityTypes</code> in your
  /// request, all PII is redacted.
  ///
  /// You can’t set <code>ContentRedactionType</code> and
  /// <code>ContentIdentificationType</code> in the same request. If you set
  /// both, your request returns a <code>BadRequestException</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/pii-redaction.html">Redacting
  /// or identifying personally identifiable information</a>.
  ///
  /// Parameter [enableChannelIdentification] :
  /// Enables channel identification in multi-channel audio.
  ///
  /// Channel identification transcribes the audio on each channel
  /// independently, then appends the output for each channel into one
  /// transcript.
  ///
  /// If you have multi-channel audio and do not enable channel identification,
  /// your audio is transcribed in a continuous manner and your transcript is
  /// not separated by channel.
  ///
  /// If you include <code>EnableChannelIdentification</code> in your request,
  /// you must also include <code>NumberOfChannels</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/channel-id.html">Transcribing
  /// multi-channel audio</a>.
  ///
  /// Parameter [enablePartialResultsStabilization] :
  /// Enables partial result stabilization for your transcription. Partial
  /// result stabilization can reduce latency in your output, but may impact
  /// accuracy. For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#streaming-partial-result-stabilization">Partial-result
  /// stabilization</a>.
  ///
  /// Parameter [identifyLanguage] :
  /// Enables automatic language identification for your transcription.
  ///
  /// If you include <code>IdentifyLanguage</code>, you must include a list of
  /// language codes, using <code>LanguageOptions</code>, that you think may be
  /// present in your audio stream.
  ///
  /// You can also include a preferred language using
  /// <code>PreferredLanguage</code>. Adding a preferred language can help
  /// Amazon Transcribe identify the language faster than if you omit this
  /// parameter.
  ///
  /// If you have multi-channel audio that contains different languages on each
  /// channel, and you've enabled channel identification, automatic language
  /// identification identifies the dominant language on each audio channel.
  ///
  /// Note that you must include either <code>LanguageCode</code> or
  /// <code>IdentifyLanguage</code> or <code>IdentifyMultipleLanguages</code> in
  /// your request. If you include more than one of these parameters, your
  /// transcription job fails.
  ///
  /// Streaming language identification can't be combined with custom language
  /// models or redaction.
  ///
  /// Parameter [identifyMultipleLanguages] :
  /// Enables automatic multi-language identification in your transcription job
  /// request. Use this parameter if your stream contains more than one
  /// language. If your stream contains only one language, use IdentifyLanguage
  /// instead.
  ///
  /// If you include <code>IdentifyMultipleLanguages</code>, you must include a
  /// list of language codes, using <code>LanguageOptions</code>, that you think
  /// may be present in your stream.
  ///
  /// If you want to apply a custom vocabulary or a custom vocabulary filter to
  /// your automatic multiple language identification request, include
  /// <code>VocabularyNames</code> or <code>VocabularyFilterNames</code>.
  ///
  /// Note that you must include one of <code>LanguageCode</code>,
  /// <code>IdentifyLanguage</code>, or <code>IdentifyMultipleLanguages</code>
  /// in your request. If you include more than one of these parameters, your
  /// transcription job fails.
  ///
  /// Parameter [languageCode] :
  /// Specify the language code that represents the language spoken in your
  /// audio.
  ///
  /// If you're unsure of the language spoken in your audio, consider using
  /// <code>IdentifyLanguage</code> to enable automatic language identification.
  ///
  /// For a list of languages supported with Amazon Transcribe streaming, refer
  /// to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  ///
  /// Parameter [languageModelName] :
  /// Specify the name of the custom language model that you want to use when
  /// processing your transcription. Note that language model names are case
  /// sensitive.
  ///
  /// The language of the specified language model must match the language code
  /// you specify in your transcription request. If the languages don't match,
  /// the custom language model isn't applied. There are no errors or warnings
  /// associated with a language mismatch.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html">Custom
  /// language models</a>.
  ///
  /// Parameter [languageOptions] :
  /// Specify two or more language codes that represent the languages you think
  /// may be present in your media; including more than five is not recommended.
  ///
  /// Including language options can improve the accuracy of language
  /// identification.
  ///
  /// If you include <code>LanguageOptions</code> in your request, you must also
  /// include <code>IdentifyLanguage</code> or
  /// <code>IdentifyMultipleLanguages</code>.
  ///
  /// For a list of languages supported with Amazon Transcribe streaming, refer
  /// to the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages</a> table.
  /// <important>
  /// You can only include one language dialect per language per stream. For
  /// example, you cannot include <code>en-US</code> and <code>en-AU</code> in
  /// the same request.
  /// </important>
  ///
  /// Parameter [numberOfChannels] :
  /// Specify the number of channels in your audio stream. This value must be
  /// <code>2</code>, as only two channels are supported. If your audio doesn't
  /// contain multiple channels, do not include this parameter in your request.
  ///
  /// If you include <code>NumberOfChannels</code> in your request, you must
  /// also include <code>EnableChannelIdentification</code>.
  ///
  /// Parameter [partialResultsStability] :
  /// Specify the level of stability to use when you enable partial results
  /// stabilization (<code>EnablePartialResultsStabilization</code>).
  ///
  /// Low stability provides the highest accuracy. High stability transcribes
  /// faster, but with slightly lower accuracy.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#streaming-partial-result-stabilization">Partial-result
  /// stabilization</a>.
  ///
  /// Parameter [piiEntityTypes] :
  /// Specify which types of personally identifiable information (PII) you want
  /// to redact in your transcript. You can include as many types as you'd like,
  /// or you can select <code>ALL</code>.
  ///
  /// Values must be comma-separated and can include: <code>ADDRESS</code>,
  /// <code>BANK_ACCOUNT_NUMBER</code>, <code>BANK_ROUTING</code>,
  /// <code>CREDIT_DEBIT_CVV</code>, <code>CREDIT_DEBIT_EXPIRY</code>,
  /// <code>CREDIT_DEBIT_NUMBER</code>, <code>EMAIL</code>, <code>NAME</code>,
  /// <code>PHONE</code>, <code>PIN</code>, <code>SSN</code>, <code>AGE</code>,
  /// <code>DATE_TIME</code>, <code>LICENSE_PLATE</code>,
  /// <code>PASSPORT_NUMBER</code>, <code>PASSWORD</code>,
  /// <code>USERNAME</code>, <code>VEHICLE_IDENTIFICATION_NUMBER</code>, or
  /// <code>ALL</code>.
  ///
  /// Note that if you include <code>PiiEntityTypes</code> in your request, you
  /// must also include <code>ContentIdentificationType</code> or
  /// <code>ContentRedactionType</code>.
  ///
  /// If you include <code>ContentRedactionType</code> or
  /// <code>ContentIdentificationType</code> in your request, but do not include
  /// <code>PiiEntityTypes</code>, all PII is redacted or identified.
  ///
  /// Parameter [preferredLanguage] :
  /// Specify a preferred language from the subset of languages codes you
  /// specified in <code>LanguageOptions</code>.
  ///
  /// You can only use this parameter if you've included
  /// <code>IdentifyLanguage</code> and <code>LanguageOptions</code> in your
  /// request.
  ///
  /// Parameter [sessionId] :
  /// Specify a name for your transcription session. If you don't include this
  /// parameter in your request, Amazon Transcribe generates an ID and returns
  /// it in the response.
  ///
  /// Parameter [sessionResumeWindow] :
  /// Specify the time window, in minutes, during which your transcription
  /// session can be resumed, measured from the stream start time. This optional
  /// parameter accepts integer values from 1 to 300 (5 hours).
  ///
  /// For example, if your stream starts at 1 PM and you specify a
  /// <code>SessionResumeWindow</code> of 30 minutes, you can reconnect to the
  /// session as many times as you want until 1:30 PM.
  ///
  /// Parameter [showSpeakerLabel] :
  /// Enables speaker partitioning (diarization) in your transcription output.
  /// Speaker partitioning labels the speech from individual speakers in your
  /// media file.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html">Partitioning
  /// speakers (diarization)</a>.
  ///
  /// Parameter [vocabularyFilterMethod] :
  /// Specify how you want your vocabulary filter applied to your transcript.
  ///
  /// To replace words with <code>***</code>, choose <code>mask</code>.
  ///
  /// To delete words, choose <code>remove</code>.
  ///
  /// To flag words without changing them, choose <code>tag</code>.
  ///
  /// Parameter [vocabularyFilterName] :
  /// Specify the name of the custom vocabulary filter that you want to use when
  /// processing your transcription. Note that vocabulary filter names are case
  /// sensitive.
  ///
  /// If the language of the specified custom vocabulary filter doesn't match
  /// the language identified in your media, the vocabulary filter is not
  /// applied to your transcription.
  /// <important>
  /// This parameter is <b>not</b> intended for use with the
  /// <code>IdentifyLanguage</code> parameter. If you're including
  /// <code>IdentifyLanguage</code> in your request and want to use one or more
  /// vocabulary filters with your transcription, use the
  /// <code>VocabularyFilterNames</code> parameter instead.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html">Using
  /// vocabulary filtering with unwanted words</a>.
  ///
  /// Parameter [vocabularyFilterNames] :
  /// Specify the names of the custom vocabulary filters that you want to use
  /// when processing your transcription. Note that vocabulary filter names are
  /// case sensitive.
  ///
  /// If none of the languages of the specified custom vocabulary filters match
  /// the language identified in your media, your job fails.
  /// <important>
  /// This parameter is only intended for use <b>with</b> the
  /// <code>IdentifyLanguage</code> parameter. If you're <b>not</b> including
  /// <code>IdentifyLanguage</code> in your request and want to use a custom
  /// vocabulary filter with your transcription, use the
  /// <code>VocabularyFilterName</code> parameter instead.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html">Using
  /// vocabulary filtering with unwanted words</a>.
  ///
  /// Parameter [vocabularyName] :
  /// Specify the name of the custom vocabulary that you want to use when
  /// processing your transcription. Note that vocabulary names are case
  /// sensitive.
  ///
  /// If the language of the specified custom vocabulary doesn't match the
  /// language identified in your media, the custom vocabulary is not applied to
  /// your transcription.
  /// <important>
  /// This parameter is <b>not</b> intended for use with the
  /// <code>IdentifyLanguage</code> parameter. If you're including
  /// <code>IdentifyLanguage</code> in your request and want to use one or more
  /// custom vocabularies with your transcription, use the
  /// <code>VocabularyNames</code> parameter instead.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom
  /// vocabularies</a>.
  ///
  /// Parameter [vocabularyNames] :
  /// Specify the names of the custom vocabularies that you want to use when
  /// processing your transcription. Note that vocabulary names are case
  /// sensitive.
  ///
  /// If none of the languages of the specified custom vocabularies match the
  /// language identified in your media, your job fails.
  /// <important>
  /// This parameter is only intended for use <b>with</b> the
  /// <code>IdentifyLanguage</code> parameter. If you're <b>not</b> including
  /// <code>IdentifyLanguage</code> in your request and want to use a custom
  /// vocabulary with your transcription, use the <code>VocabularyName</code>
  /// parameter instead.
  /// </important>
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom
  /// vocabularies</a>.
  Future<StartStreamTranscriptionResponse> startStreamTranscription({
    required AudioStream audioStream,
    required MediaEncoding mediaEncoding,
    required int mediaSampleRateHertz,
    ContentIdentificationType? contentIdentificationType,
    ContentRedactionType? contentRedactionType,
    bool? enableChannelIdentification,
    bool? enablePartialResultsStabilization,
    bool? identifyLanguage,
    bool? identifyMultipleLanguages,
    LanguageCode? languageCode,
    String? languageModelName,
    String? languageOptions,
    int? numberOfChannels,
    PartialResultsStability? partialResultsStability,
    String? piiEntityTypes,
    LanguageCode? preferredLanguage,
    String? sessionId,
    int? sessionResumeWindow,
    bool? showSpeakerLabel,
    VocabularyFilterMethod? vocabularyFilterMethod,
    String? vocabularyFilterName,
    String? vocabularyFilterNames,
    String? vocabularyName,
    String? vocabularyNames,
  }) async {
    _s.validateNumRange(
      'mediaSampleRateHertz',
      mediaSampleRateHertz,
      8000,
      48000,
      isRequired: true,
    );
    _s.validateNumRange(
      'numberOfChannels',
      numberOfChannels,
      2,
      1152921504606846976,
    );
    _s.validateNumRange(
      'sessionResumeWindow',
      sessionResumeWindow,
      1,
      300,
    );
    final headers = <String, String>{
      'x-amzn-transcribe-media-encoding': mediaEncoding.value,
      'x-amzn-transcribe-sample-rate': mediaSampleRateHertz.toString(),
      if (contentIdentificationType != null)
        'x-amzn-transcribe-content-identification-type':
            contentIdentificationType.value,
      if (contentRedactionType != null)
        'x-amzn-transcribe-content-redaction-type': contentRedactionType.value,
      if (enableChannelIdentification != null)
        'x-amzn-transcribe-enable-channel-identification':
            enableChannelIdentification.toString(),
      if (enablePartialResultsStabilization != null)
        'x-amzn-transcribe-enable-partial-results-stabilization':
            enablePartialResultsStabilization.toString(),
      if (identifyLanguage != null)
        'x-amzn-transcribe-identify-language': identifyLanguage.toString(),
      if (identifyMultipleLanguages != null)
        'x-amzn-transcribe-identify-multiple-languages':
            identifyMultipleLanguages.toString(),
      if (languageCode != null)
        'x-amzn-transcribe-language-code': languageCode.value,
      if (languageModelName != null)
        'x-amzn-transcribe-language-model-name': languageModelName.toString(),
      if (languageOptions != null)
        'x-amzn-transcribe-language-options': languageOptions.toString(),
      if (numberOfChannels != null)
        'x-amzn-transcribe-number-of-channels': numberOfChannels.toString(),
      if (partialResultsStability != null)
        'x-amzn-transcribe-partial-results-stability':
            partialResultsStability.value,
      if (piiEntityTypes != null)
        'x-amzn-transcribe-pii-entity-types': piiEntityTypes.toString(),
      if (preferredLanguage != null)
        'x-amzn-transcribe-preferred-language': preferredLanguage.value,
      if (sessionId != null)
        'x-amzn-transcribe-session-id': sessionId.toString(),
      if (sessionResumeWindow != null)
        'x-amzn-transcribe-session-resume-window':
            sessionResumeWindow.toString(),
      if (showSpeakerLabel != null)
        'x-amzn-transcribe-show-speaker-label': showSpeakerLabel.toString(),
      if (vocabularyFilterMethod != null)
        'x-amzn-transcribe-vocabulary-filter-method':
            vocabularyFilterMethod.value,
      if (vocabularyFilterName != null)
        'x-amzn-transcribe-vocabulary-filter-name':
            vocabularyFilterName.toString(),
      if (vocabularyFilterNames != null)
        'x-amzn-transcribe-vocabulary-filter-names':
            vocabularyFilterNames.toString(),
      if (vocabularyName != null)
        'x-amzn-transcribe-vocabulary-name': vocabularyName.toString(),
      if (vocabularyNames != null)
        'x-amzn-transcribe-vocabulary-names': vocabularyNames.toString(),
    };
    final response = await _protocol.sendRaw(
      payload: audioStream,
      method: 'POST',
      requestUri: '/stream-transcription',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartStreamTranscriptionResponse(
      transcriptResultStream: TranscriptResultStream.fromJson($json),
      contentIdentificationType: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-content-identification-type')
          ?.let(ContentIdentificationType.fromString),
      contentRedactionType: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-content-redaction-type')
          ?.let(ContentRedactionType.fromString),
      enableChannelIdentification: _s.extractHeaderBoolValue(
          response.headers, 'x-amzn-transcribe-enable-channel-identification'),
      enablePartialResultsStabilization: _s.extractHeaderBoolValue(
          response.headers,
          'x-amzn-transcribe-enable-partial-results-stabilization'),
      identifyLanguage: _s.extractHeaderBoolValue(
          response.headers, 'x-amzn-transcribe-identify-language'),
      identifyMultipleLanguages: _s.extractHeaderBoolValue(
          response.headers, 'x-amzn-transcribe-identify-multiple-languages'),
      languageCode: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-language-code')
          ?.let(LanguageCode.fromString),
      languageModelName: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-language-model-name'),
      languageOptions: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-language-options'),
      mediaEncoding: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-media-encoding')
          ?.let(MediaEncoding.fromString),
      mediaSampleRateHertz: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-transcribe-sample-rate'),
      numberOfChannels: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-transcribe-number-of-channels'),
      partialResultsStability: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-partial-results-stability')
          ?.let(PartialResultsStability.fromString),
      piiEntityTypes: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-pii-entity-types'),
      preferredLanguage: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-preferred-language')
          ?.let(LanguageCode.fromString),
      requestId:
          _s.extractHeaderStringValue(response.headers, 'x-amzn-request-id'),
      sessionId: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-session-id'),
      sessionResumeWindow: _s.extractHeaderIntValue(
          response.headers, 'x-amzn-transcribe-session-resume-window'),
      showSpeakerLabel: _s.extractHeaderBoolValue(
          response.headers, 'x-amzn-transcribe-show-speaker-label'),
      vocabularyFilterMethod: _s
          .extractHeaderStringValue(
              response.headers, 'x-amzn-transcribe-vocabulary-filter-method')
          ?.let(VocabularyFilterMethod.fromString),
      vocabularyFilterName: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-filter-name'),
      vocabularyFilterNames: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-filter-names'),
      vocabularyName: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-name'),
      vocabularyNames: _s.extractHeaderStringValue(
          response.headers, 'x-amzn-transcribe-vocabulary-names'),
    );
  }
}

/// @nodoc
class GetMedicalScribeStreamResponse {
  /// Provides details about a HealthScribe streaming session.
  final MedicalScribeStreamDetails? medicalScribeStreamDetails;

  GetMedicalScribeStreamResponse({
    this.medicalScribeStreamDetails,
  });

  factory GetMedicalScribeStreamResponse.fromJson(Map<String, dynamic> json) {
    return GetMedicalScribeStreamResponse(
      medicalScribeStreamDetails: json['MedicalScribeStreamDetails'] != null
          ? MedicalScribeStreamDetails.fromJson(
              json['MedicalScribeStreamDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final medicalScribeStreamDetails = this.medicalScribeStreamDetails;
    return {
      if (medicalScribeStreamDetails != null)
        'MedicalScribeStreamDetails': medicalScribeStreamDetails,
    };
  }
}

/// One or more arguments to the <code>StartStreamTranscription</code>,
/// <code>StartMedicalStreamTranscription</code>, or
/// <code>StartCallAnalyticsStreamTranscription</code> operation was not valid.
/// For example, <code>MediaEncoding</code> or <code>LanguageCode</code> used
/// unsupported values. Check the specified parameters and try your request
/// again.
///
/// @nodoc
class BadRequestException implements _s.AwsException {
  final String? message;

  BadRequestException({
    this.message,
  });

  factory BadRequestException.fromJson(Map<String, dynamic> json) {
    return BadRequestException(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// A problem occurred while processing the audio. Amazon Transcribe terminated
/// processing.
///
/// @nodoc
class InternalFailureException implements _s.AwsException {
  final String? message;

  InternalFailureException({
    this.message,
  });

  factory InternalFailureException.fromJson(Map<String, dynamic> json) {
    return InternalFailureException(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// Your client has exceeded one of the Amazon Transcribe limits. This is
/// typically the audio length limit. Break your audio stream into smaller
/// chunks and try your request again.
///
/// @nodoc
class LimitExceededException implements _s.AwsException {
  final String? message;

  LimitExceededException({
    this.message,
  });

  factory LimitExceededException.fromJson(Map<String, dynamic> json) {
    return LimitExceededException(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// @nodoc
class StartCallAnalyticsStreamTranscriptionResponse {
  /// Provides detailed information about your real-time Call Analytics session.
  final CallAnalyticsTranscriptResultStream?
      callAnalyticsTranscriptResultStream;

  /// Shows whether content identification was enabled for your Call Analytics
  /// transcription.
  final ContentIdentificationType? contentIdentificationType;

  /// Shows whether content redaction was enabled for your Call Analytics
  /// transcription.
  final ContentRedactionType? contentRedactionType;

  /// Shows whether partial results stabilization was enabled for your Call
  /// Analytics transcription.
  final bool? enablePartialResultsStabilization;

  /// Shows whether automatic language identification was enabled for your Call
  /// Analytics transcription.
  final bool? identifyLanguage;

  /// Provides the language code that you specified in your Call Analytics
  /// request.
  final CallAnalyticsLanguageCode? languageCode;

  /// Provides the name of the custom language model that you specified in your
  /// Call Analytics request.
  final String? languageModelName;

  /// Provides the language codes that you specified in your Call Analytics
  /// request.
  final String? languageOptions;

  /// Provides the media encoding you specified in your Call Analytics request.
  final MediaEncoding? mediaEncoding;

  /// Provides the sample rate that you specified in your Call Analytics request.
  final int? mediaSampleRateHertz;

  /// Provides the stabilization level used for your transcription.
  final PartialResultsStability? partialResultsStability;

  /// Lists the PII entity types you specified in your Call Analytics request.
  final String? piiEntityTypes;

  /// Provides the preferred language that you specified in your Call Analytics
  /// request.
  final CallAnalyticsLanguageCode? preferredLanguage;

  /// Provides the identifier for your real-time Call Analytics request.
  final String? requestId;

  /// Provides the identifier for your Call Analytics transcription session.
  final String? sessionId;

  /// Provides the vocabulary filtering method used in your Call Analytics
  /// transcription.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// Provides the name of the custom vocabulary filter that you specified in your
  /// Call Analytics request.
  final String? vocabularyFilterName;

  /// Provides the names of the custom vocabulary filters that you specified in
  /// your Call Analytics request.
  final String? vocabularyFilterNames;

  /// Provides the name of the custom vocabulary that you specified in your Call
  /// Analytics request.
  final String? vocabularyName;

  /// Provides the names of the custom vocabularies that you specified in your
  /// Call Analytics request.
  final String? vocabularyNames;

  StartCallAnalyticsStreamTranscriptionResponse({
    this.callAnalyticsTranscriptResultStream,
    this.contentIdentificationType,
    this.contentRedactionType,
    this.enablePartialResultsStabilization,
    this.identifyLanguage,
    this.languageCode,
    this.languageModelName,
    this.languageOptions,
    this.mediaEncoding,
    this.mediaSampleRateHertz,
    this.partialResultsStability,
    this.piiEntityTypes,
    this.preferredLanguage,
    this.requestId,
    this.sessionId,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyFilterNames,
    this.vocabularyName,
    this.vocabularyNames,
  });

  Map<String, dynamic> toJson() {
    final callAnalyticsTranscriptResultStream =
        this.callAnalyticsTranscriptResultStream;
    final contentIdentificationType = this.contentIdentificationType;
    final contentRedactionType = this.contentRedactionType;
    final enablePartialResultsStabilization =
        this.enablePartialResultsStabilization;
    final identifyLanguage = this.identifyLanguage;
    final languageCode = this.languageCode;
    final languageModelName = this.languageModelName;
    final languageOptions = this.languageOptions;
    final mediaEncoding = this.mediaEncoding;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final partialResultsStability = this.partialResultsStability;
    final piiEntityTypes = this.piiEntityTypes;
    final preferredLanguage = this.preferredLanguage;
    final requestId = this.requestId;
    final sessionId = this.sessionId;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyFilterNames = this.vocabularyFilterNames;
    final vocabularyName = this.vocabularyName;
    final vocabularyNames = this.vocabularyNames;
    return {
      if (callAnalyticsTranscriptResultStream != null)
        'CallAnalyticsTranscriptResultStream':
            callAnalyticsTranscriptResultStream,
    };
  }
}

/// A new stream started with the same session ID. The current stream has been
/// terminated.
///
/// @nodoc
class ConflictException implements _s.AwsException {
  final String? message;

  ConflictException({
    this.message,
  });

  factory ConflictException.fromJson(Map<String, dynamic> json) {
    return ConflictException(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// The service is currently unavailable. Try your request later.
///
/// @nodoc
class ServiceUnavailableException implements _s.AwsException {
  final String? message;

  ServiceUnavailableException({
    this.message,
  });

  factory ServiceUnavailableException.fromJson(Map<String, dynamic> json) {
    return ServiceUnavailableException(
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'Message': message,
    };
  }
}

/// @nodoc
class StartMedicalScribeStreamResponse {
  /// The Language Code that you specified in your request. Same as provided in
  /// the <code>StartMedicalScribeStreamRequest</code>.
  final MedicalScribeLanguageCode? languageCode;

  /// The Media Encoding you specified in your request. Same as provided in the
  /// <code>StartMedicalScribeStreamRequest</code>
  final MedicalScribeMediaEncoding? mediaEncoding;

  /// The sample rate (in hertz) that you specified in your request. Same as
  /// provided in the <code>StartMedicalScribeStreamRequest</code>
  final int? mediaSampleRateHertz;

  /// The unique identifier for your streaming request.
  final String? requestId;

  /// The result stream where you will receive the output events.
  final MedicalScribeResultStream? resultStream;

  /// The identifier (in UUID format) for your streaming session.
  ///
  /// If you already started streaming, this is same ID as the one you specified
  /// in your initial <code>StartMedicalScribeStreamRequest</code>.
  final String? sessionId;

  StartMedicalScribeStreamResponse({
    this.languageCode,
    this.mediaEncoding,
    this.mediaSampleRateHertz,
    this.requestId,
    this.resultStream,
    this.sessionId,
  });

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final mediaEncoding = this.mediaEncoding;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final requestId = this.requestId;
    final resultStream = this.resultStream;
    final sessionId = this.sessionId;
    return {
      if (resultStream != null) 'ResultStream': resultStream,
    };
  }
}

/// @nodoc
class StartMedicalStreamTranscriptionResponse {
  /// Shows whether content identification was enabled for your transcription.
  final MedicalContentIdentificationType? contentIdentificationType;

  /// Shows whether channel identification was enabled for your transcription.
  final bool? enableChannelIdentification;

  /// Provides the language code that you specified in your request. This must be
  /// <code>en-US</code>.
  final LanguageCode? languageCode;

  /// Provides the media encoding you specified in your request.
  final MediaEncoding? mediaEncoding;

  /// Provides the sample rate that you specified in your request.
  final int? mediaSampleRateHertz;

  /// Provides the number of channels that you specified in your request.
  final int? numberOfChannels;

  /// Provides the identifier for your streaming request.
  final String? requestId;

  /// Provides the identifier for your transcription session.
  final String? sessionId;

  /// Shows whether speaker partitioning was enabled for your transcription.
  final bool? showSpeakerLabel;

  /// Provides the medical specialty that you specified in your request.
  final Specialty? specialty;

  /// Provides detailed information about your streaming session.
  final MedicalTranscriptResultStream? transcriptResultStream;

  /// Provides the type of audio you specified in your request.
  final Type? type;

  /// Provides the name of the custom vocabulary that you specified in your
  /// request.
  final String? vocabularyName;

  StartMedicalStreamTranscriptionResponse({
    this.contentIdentificationType,
    this.enableChannelIdentification,
    this.languageCode,
    this.mediaEncoding,
    this.mediaSampleRateHertz,
    this.numberOfChannels,
    this.requestId,
    this.sessionId,
    this.showSpeakerLabel,
    this.specialty,
    this.transcriptResultStream,
    this.type,
    this.vocabularyName,
  });

  Map<String, dynamic> toJson() {
    final contentIdentificationType = this.contentIdentificationType;
    final enableChannelIdentification = this.enableChannelIdentification;
    final languageCode = this.languageCode;
    final mediaEncoding = this.mediaEncoding;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final numberOfChannels = this.numberOfChannels;
    final requestId = this.requestId;
    final sessionId = this.sessionId;
    final showSpeakerLabel = this.showSpeakerLabel;
    final specialty = this.specialty;
    final transcriptResultStream = this.transcriptResultStream;
    final type = this.type;
    final vocabularyName = this.vocabularyName;
    return {
      if (transcriptResultStream != null)
        'TranscriptResultStream': transcriptResultStream,
    };
  }
}

/// @nodoc
class StartStreamTranscriptionResponse {
  /// Shows whether content identification was enabled for your transcription.
  final ContentIdentificationType? contentIdentificationType;

  /// Shows whether content redaction was enabled for your transcription.
  final ContentRedactionType? contentRedactionType;

  /// Shows whether channel identification was enabled for your transcription.
  final bool? enableChannelIdentification;

  /// Shows whether partial results stabilization was enabled for your
  /// transcription.
  final bool? enablePartialResultsStabilization;

  /// Shows whether automatic language identification was enabled for your
  /// transcription.
  final bool? identifyLanguage;

  /// Shows whether automatic multi-language identification was enabled for your
  /// transcription.
  final bool? identifyMultipleLanguages;

  /// Provides the language code that you specified in your request.
  final LanguageCode? languageCode;

  /// Provides the name of the custom language model that you specified in your
  /// request.
  final String? languageModelName;

  /// Provides the language codes that you specified in your request.
  final String? languageOptions;

  /// Provides the media encoding you specified in your request.
  final MediaEncoding? mediaEncoding;

  /// Provides the sample rate that you specified in your request.
  final int? mediaSampleRateHertz;

  /// Provides the number of channels that you specified in your request.
  final int? numberOfChannels;

  /// Provides the stabilization level used for your transcription.
  final PartialResultsStability? partialResultsStability;

  /// Lists the PII entity types you specified in your request.
  final String? piiEntityTypes;

  /// Provides the preferred language that you specified in your request.
  final LanguageCode? preferredLanguage;

  /// Provides the identifier for your streaming request.
  final String? requestId;

  /// Provides the identifier for your transcription session.
  final String? sessionId;

  /// Provides the session resume window, in minutes, that you specified in your
  /// request.
  final int? sessionResumeWindow;

  /// Shows whether speaker partitioning was enabled for your transcription.
  final bool? showSpeakerLabel;

  /// Provides detailed information about your streaming session.
  final TranscriptResultStream? transcriptResultStream;

  /// Provides the vocabulary filtering method used in your transcription.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// Provides the name of the custom vocabulary filter that you specified in your
  /// request.
  final String? vocabularyFilterName;

  /// Provides the names of the custom vocabulary filters that you specified in
  /// your request.
  final String? vocabularyFilterNames;

  /// Provides the name of the custom vocabulary that you specified in your
  /// request.
  final String? vocabularyName;

  /// Provides the names of the custom vocabularies that you specified in your
  /// request.
  final String? vocabularyNames;

  StartStreamTranscriptionResponse({
    this.contentIdentificationType,
    this.contentRedactionType,
    this.enableChannelIdentification,
    this.enablePartialResultsStabilization,
    this.identifyLanguage,
    this.identifyMultipleLanguages,
    this.languageCode,
    this.languageModelName,
    this.languageOptions,
    this.mediaEncoding,
    this.mediaSampleRateHertz,
    this.numberOfChannels,
    this.partialResultsStability,
    this.piiEntityTypes,
    this.preferredLanguage,
    this.requestId,
    this.sessionId,
    this.sessionResumeWindow,
    this.showSpeakerLabel,
    this.transcriptResultStream,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyFilterNames,
    this.vocabularyName,
    this.vocabularyNames,
  });

  Map<String, dynamic> toJson() {
    final contentIdentificationType = this.contentIdentificationType;
    final contentRedactionType = this.contentRedactionType;
    final enableChannelIdentification = this.enableChannelIdentification;
    final enablePartialResultsStabilization =
        this.enablePartialResultsStabilization;
    final identifyLanguage = this.identifyLanguage;
    final identifyMultipleLanguages = this.identifyMultipleLanguages;
    final languageCode = this.languageCode;
    final languageModelName = this.languageModelName;
    final languageOptions = this.languageOptions;
    final mediaEncoding = this.mediaEncoding;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final numberOfChannels = this.numberOfChannels;
    final partialResultsStability = this.partialResultsStability;
    final piiEntityTypes = this.piiEntityTypes;
    final preferredLanguage = this.preferredLanguage;
    final requestId = this.requestId;
    final sessionId = this.sessionId;
    final sessionResumeWindow = this.sessionResumeWindow;
    final showSpeakerLabel = this.showSpeakerLabel;
    final transcriptResultStream = this.transcriptResultStream;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyFilterNames = this.vocabularyFilterNames;
    final vocabularyName = this.vocabularyName;
    final vocabularyNames = this.vocabularyNames;
    return {
      if (transcriptResultStream != null)
        'TranscriptResultStream': transcriptResultStream,
    };
  }
}

/// @nodoc
class LanguageCode {
  static const enUs = LanguageCode._('en-US');
  static const enGb = LanguageCode._('en-GB');
  static const esUs = LanguageCode._('es-US');
  static const frCa = LanguageCode._('fr-CA');
  static const frFr = LanguageCode._('fr-FR');
  static const enAu = LanguageCode._('en-AU');
  static const itIt = LanguageCode._('it-IT');
  static const deDe = LanguageCode._('de-DE');
  static const ptBr = LanguageCode._('pt-BR');
  static const jaJp = LanguageCode._('ja-JP');
  static const koKr = LanguageCode._('ko-KR');
  static const zhCn = LanguageCode._('zh-CN');
  static const thTh = LanguageCode._('th-TH');
  static const esEs = LanguageCode._('es-ES');
  static const arSa = LanguageCode._('ar-SA');
  static const ptPt = LanguageCode._('pt-PT');
  static const caEs = LanguageCode._('ca-ES');
  static const arAe = LanguageCode._('ar-AE');
  static const hiIn = LanguageCode._('hi-IN');
  static const zhHk = LanguageCode._('zh-HK');
  static const nlNl = LanguageCode._('nl-NL');
  static const noNo = LanguageCode._('no-NO');
  static const svSe = LanguageCode._('sv-SE');
  static const plPl = LanguageCode._('pl-PL');
  static const fiFi = LanguageCode._('fi-FI');
  static const zhTw = LanguageCode._('zh-TW');
  static const enIn = LanguageCode._('en-IN');
  static const enIe = LanguageCode._('en-IE');
  static const enNz = LanguageCode._('en-NZ');
  static const enAb = LanguageCode._('en-AB');
  static const enZa = LanguageCode._('en-ZA');
  static const enWl = LanguageCode._('en-WL');
  static const deCh = LanguageCode._('de-CH');
  static const afZa = LanguageCode._('af-ZA');
  static const euEs = LanguageCode._('eu-ES');
  static const hrHr = LanguageCode._('hr-HR');
  static const csCz = LanguageCode._('cs-CZ');
  static const daDk = LanguageCode._('da-DK');
  static const faIr = LanguageCode._('fa-IR');
  static const glEs = LanguageCode._('gl-ES');
  static const elGr = LanguageCode._('el-GR');
  static const heIl = LanguageCode._('he-IL');
  static const idId = LanguageCode._('id-ID');
  static const lvLv = LanguageCode._('lv-LV');
  static const msMy = LanguageCode._('ms-MY');
  static const roRo = LanguageCode._('ro-RO');
  static const ruRu = LanguageCode._('ru-RU');
  static const srRs = LanguageCode._('sr-RS');
  static const skSk = LanguageCode._('sk-SK');
  static const soSo = LanguageCode._('so-SO');
  static const tlPh = LanguageCode._('tl-PH');
  static const ukUa = LanguageCode._('uk-UA');
  static const viVn = LanguageCode._('vi-VN');
  static const zuZa = LanguageCode._('zu-ZA');
  static const amEt = LanguageCode._('am-ET');
  static const beBy = LanguageCode._('be-BY');
  static const bgBg = LanguageCode._('bg-BG');
  static const bnIn = LanguageCode._('bn-IN');
  static const bsBa = LanguageCode._('bs-BA');
  static const ckbIq = LanguageCode._('ckb-IQ');
  static const ckbIr = LanguageCode._('ckb-IR');
  static const cyWl = LanguageCode._('cy-WL');
  static const esMx = LanguageCode._('es-MX');
  static const etEt = LanguageCode._('et-ET');
  static const faAf = LanguageCode._('fa-AF');
  static const guIn = LanguageCode._('gu-IN');
  static const htHt = LanguageCode._('ht-HT');
  static const huHu = LanguageCode._('hu-HU');
  static const hyAm = LanguageCode._('hy-AM');
  static const isIs = LanguageCode._('is-IS');
  static const jvId = LanguageCode._('jv-ID');
  static const kaGe = LanguageCode._('ka-GE');
  static const kabDz = LanguageCode._('kab-DZ');
  static const kkKz = LanguageCode._('kk-KZ');
  static const kmKh = LanguageCode._('km-KH');
  static const knIn = LanguageCode._('kn-IN');
  static const lgIn = LanguageCode._('lg-IN');
  static const ltLt = LanguageCode._('lt-LT');
  static const mkMk = LanguageCode._('mk-MK');
  static const mlIn = LanguageCode._('ml-IN');
  static const mrIn = LanguageCode._('mr-IN');
  static const myMm = LanguageCode._('my-MM');
  static const neNp = LanguageCode._('ne-NP');
  static const orIn = LanguageCode._('or-IN');
  static const paIn = LanguageCode._('pa-IN');
  static const psAf = LanguageCode._('ps-AF');
  static const siLk = LanguageCode._('si-LK');
  static const slSi = LanguageCode._('sl-SI');
  static const sqAl = LanguageCode._('sq-AL');
  static const suId = LanguageCode._('su-ID');
  static const swBi = LanguageCode._('sw-BI');
  static const swKe = LanguageCode._('sw-KE');
  static const swRw = LanguageCode._('sw-RW');
  static const swTz = LanguageCode._('sw-TZ');
  static const swUg = LanguageCode._('sw-UG');
  static const taIn = LanguageCode._('ta-IN');
  static const teIn = LanguageCode._('te-IN');
  static const trTr = LanguageCode._('tr-TR');
  static const uzUz = LanguageCode._('uz-UZ');

  final String value;

  const LanguageCode._(this.value);

  static const values = [
    enUs,
    enGb,
    esUs,
    frCa,
    frFr,
    enAu,
    itIt,
    deDe,
    ptBr,
    jaJp,
    koKr,
    zhCn,
    thTh,
    esEs,
    arSa,
    ptPt,
    caEs,
    arAe,
    hiIn,
    zhHk,
    nlNl,
    noNo,
    svSe,
    plPl,
    fiFi,
    zhTw,
    enIn,
    enIe,
    enNz,
    enAb,
    enZa,
    enWl,
    deCh,
    afZa,
    euEs,
    hrHr,
    csCz,
    daDk,
    faIr,
    glEs,
    elGr,
    heIl,
    idId,
    lvLv,
    msMy,
    roRo,
    ruRu,
    srRs,
    skSk,
    soSo,
    tlPh,
    ukUa,
    viVn,
    zuZa,
    amEt,
    beBy,
    bgBg,
    bnIn,
    bsBa,
    ckbIq,
    ckbIr,
    cyWl,
    esMx,
    etEt,
    faAf,
    guIn,
    htHt,
    huHu,
    hyAm,
    isIs,
    jvId,
    kaGe,
    kabDz,
    kkKz,
    kmKh,
    knIn,
    lgIn,
    ltLt,
    mkMk,
    mlIn,
    mrIn,
    myMm,
    neNp,
    orIn,
    paIn,
    psAf,
    siLk,
    slSi,
    sqAl,
    suId,
    swBi,
    swKe,
    swRw,
    swTz,
    swUg,
    taIn,
    teIn,
    trTr,
    uzUz
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
class MediaEncoding {
  static const pcm = MediaEncoding._('pcm');
  static const oggOpus = MediaEncoding._('ogg-opus');
  static const flac = MediaEncoding._('flac');

  final String value;

  const MediaEncoding._(this.value);

  static const values = [pcm, oggOpus, flac];

  static MediaEncoding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MediaEncoding._(value));

  @override
  bool operator ==(other) => other is MediaEncoding && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about your streaming session.
///
/// @nodoc
class TranscriptResultStream {
  /// A client error occurred when the stream was created. Check the parameters of
  /// the request and try your request again.
  final BadRequestException? badRequestException;

  /// A new stream started with the same session ID. The current stream has been
  /// terminated.
  final ConflictException? conflictException;

  /// A problem occurred while processing the audio. Amazon Transcribe terminated
  /// processing.
  final InternalFailureException? internalFailureException;

  /// Your client has exceeded one of the Amazon Transcribe limits. This is
  /// typically the audio length limit. Break your audio stream into smaller
  /// chunks and try your request again.
  final LimitExceededException? limitExceededException;

  /// The service is currently unavailable. Try your request later.
  final ServiceUnavailableException? serviceUnavailableException;

  /// Contains <code>Transcript</code>, which contains <code>Results</code>. The
  /// <code></code> object contains a set of transcription results from one or
  /// more audio segments, along with additional information per your request
  /// parameters.
  final TranscriptEvent? transcriptEvent;

  TranscriptResultStream({
    this.badRequestException,
    this.conflictException,
    this.internalFailureException,
    this.limitExceededException,
    this.serviceUnavailableException,
    this.transcriptEvent,
  });

  factory TranscriptResultStream.fromJson(Map<String, dynamic> json) {
    return TranscriptResultStream(
      badRequestException: json['BadRequestException'] != null
          ? BadRequestException.fromJson(
              json['BadRequestException'] as Map<String, dynamic>)
          : null,
      conflictException: json['ConflictException'] != null
          ? ConflictException.fromJson(
              json['ConflictException'] as Map<String, dynamic>)
          : null,
      internalFailureException: json['InternalFailureException'] != null
          ? InternalFailureException.fromJson(
              json['InternalFailureException'] as Map<String, dynamic>)
          : null,
      limitExceededException: json['LimitExceededException'] != null
          ? LimitExceededException.fromJson(
              json['LimitExceededException'] as Map<String, dynamic>)
          : null,
      serviceUnavailableException: json['ServiceUnavailableException'] != null
          ? ServiceUnavailableException.fromJson(
              json['ServiceUnavailableException'] as Map<String, dynamic>)
          : null,
      transcriptEvent: json['TranscriptEvent'] != null
          ? TranscriptEvent.fromJson(
              json['TranscriptEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final badRequestException = this.badRequestException;
    final conflictException = this.conflictException;
    final internalFailureException = this.internalFailureException;
    final limitExceededException = this.limitExceededException;
    final serviceUnavailableException = this.serviceUnavailableException;
    final transcriptEvent = this.transcriptEvent;
    return {
      if (badRequestException != null)
        'BadRequestException': badRequestException,
      if (conflictException != null) 'ConflictException': conflictException,
      if (internalFailureException != null)
        'InternalFailureException': internalFailureException,
      if (limitExceededException != null)
        'LimitExceededException': limitExceededException,
      if (serviceUnavailableException != null)
        'ServiceUnavailableException': serviceUnavailableException,
      if (transcriptEvent != null) 'TranscriptEvent': transcriptEvent,
    };
  }
}

/// @nodoc
class VocabularyFilterMethod {
  static const remove = VocabularyFilterMethod._('remove');
  static const mask = VocabularyFilterMethod._('mask');
  static const tag = VocabularyFilterMethod._('tag');

  final String value;

  const VocabularyFilterMethod._(this.value);

  static const values = [remove, mask, tag];

  static VocabularyFilterMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VocabularyFilterMethod._(value));

  @override
  bool operator ==(other) =>
      other is VocabularyFilterMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class PartialResultsStability {
  static const high = PartialResultsStability._('high');
  static const medium = PartialResultsStability._('medium');
  static const low = PartialResultsStability._('low');

  final String value;

  const PartialResultsStability._(this.value);

  static const values = [high, medium, low];

  static PartialResultsStability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PartialResultsStability._(value));

  @override
  bool operator ==(other) =>
      other is PartialResultsStability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ContentIdentificationType {
  static const pii = ContentIdentificationType._('PII');

  final String value;

  const ContentIdentificationType._(this.value);

  static const values = [pii];

  static ContentIdentificationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentIdentificationType._(value));

  @override
  bool operator ==(other) =>
      other is ContentIdentificationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ContentRedactionType {
  static const pii = ContentRedactionType._('PII');

  final String value;

  const ContentRedactionType._(this.value);

  static const values = [pii];

  static ContentRedactionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentRedactionType._(value));

  @override
  bool operator ==(other) =>
      other is ContentRedactionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The <code>TranscriptEvent</code> associated with a
/// <code>TranscriptResultStream</code>.
///
/// Contains a set of transcription results from one or more audio segments,
/// along with additional information per your request parameters.
///
/// @nodoc
class TranscriptEvent {
  /// Contains <code>Results</code>, which contains a set of transcription results
  /// from one or more audio segments, along with additional information per your
  /// request parameters. This can include information relating to alternative
  /// transcriptions, channel identification, partial result stabilization,
  /// language identification, and other transcription-related data.
  final Transcript? transcript;

  TranscriptEvent({
    this.transcript,
  });

  factory TranscriptEvent.fromJson(Map<String, dynamic> json) {
    return TranscriptEvent(
      transcript: json['Transcript'] != null
          ? Transcript.fromJson(json['Transcript'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transcript = this.transcript;
    return {
      if (transcript != null) 'Transcript': transcript,
    };
  }
}

/// The <code>Transcript</code> associated with a <code></code>.
///
/// <code>Transcript</code> contains <code>Results</code>, which contains a set
/// of transcription results from one or more audio segments, along with
/// additional information per your request parameters.
///
/// @nodoc
class Transcript {
  /// Contains a set of transcription results from one or more audio segments,
  /// along with additional information per your request parameters. This can
  /// include information relating to alternative transcriptions, channel
  /// identification, partial result stabilization, language identification, and
  /// other transcription-related data.
  final List<Result>? results;

  Transcript({
    this.results,
  });

  factory Transcript.fromJson(Map<String, dynamic> json) {
    return Transcript(
      results: (json['Results'] as List?)
          ?.nonNulls
          .map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      if (results != null) 'Results': results,
    };
  }
}

/// The <code>Result</code> associated with a <code></code>.
///
/// Contains a set of transcription results from one or more audio segments,
/// along with additional information per your request parameters. This can
/// include information relating to alternative transcriptions, channel
/// identification, partial result stabilization, language identification, and
/// other transcription-related data.
///
/// @nodoc
class Result {
  /// A list of possible alternative transcriptions for the input audio. Each
  /// alternative may contain one or more of <code>Items</code>,
  /// <code>Entities</code>, or <code>Transcript</code>.
  final List<Alternative>? alternatives;

  /// Indicates which audio channel is associated with the <code>Result</code>.
  final String? channelId;

  /// The end time of the <code>Result</code> in seconds, with millisecond
  /// precision (e.g., 1.056).
  final double? endTime;

  /// Indicates if the segment is complete.
  ///
  /// If <code>IsPartial</code> is <code>true</code>, the segment is not complete.
  /// If <code>IsPartial</code> is <code>false</code>, the segment is complete.
  final bool? isPartial;

  /// The language code that represents the language spoken in your audio stream.
  final LanguageCode? languageCode;

  /// The language code of the dominant language identified in your stream.
  ///
  /// If you enabled channel identification and each channel of your audio
  /// contains a different language, you may have more than one result.
  final List<LanguageWithScore>? languageIdentification;

  /// Provides a unique identifier for the <code>Result</code>.
  final String? resultId;

  /// The start time of the <code>Result</code> in seconds, with millisecond
  /// precision (e.g., 1.056).
  final double? startTime;

  Result({
    this.alternatives,
    this.channelId,
    this.endTime,
    this.isPartial,
    this.languageCode,
    this.languageIdentification,
    this.resultId,
    this.startTime,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      alternatives: (json['Alternatives'] as List?)
          ?.nonNulls
          .map((e) => Alternative.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelId: json['ChannelId'] as String?,
      endTime: json['EndTime'] as double?,
      isPartial: json['IsPartial'] as bool?,
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      languageIdentification: (json['LanguageIdentification'] as List?)
          ?.nonNulls
          .map((e) => LanguageWithScore.fromJson(e as Map<String, dynamic>))
          .toList(),
      resultId: json['ResultId'] as String?,
      startTime: json['StartTime'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final alternatives = this.alternatives;
    final channelId = this.channelId;
    final endTime = this.endTime;
    final isPartial = this.isPartial;
    final languageCode = this.languageCode;
    final languageIdentification = this.languageIdentification;
    final resultId = this.resultId;
    final startTime = this.startTime;
    return {
      if (alternatives != null) 'Alternatives': alternatives,
      if (channelId != null) 'ChannelId': channelId,
      if (endTime != null) 'EndTime': endTime,
      if (isPartial != null) 'IsPartial': isPartial,
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (languageIdentification != null)
        'LanguageIdentification': languageIdentification,
      if (resultId != null) 'ResultId': resultId,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

/// The language code that represents the language identified in your audio,
/// including the associated confidence score. If you enabled channel
/// identification in your request and each channel contained a different
/// language, you will have more than one <code>LanguageWithScore</code> result.
///
/// @nodoc
class LanguageWithScore {
  /// The language code of the identified language.
  final LanguageCode? languageCode;

  /// The confidence score associated with the identified language code.
  /// Confidence scores are values between zero and one; larger values indicate a
  /// higher confidence in the identified language.
  final double? score;

  LanguageWithScore({
    this.languageCode,
    this.score,
  });

  factory LanguageWithScore.fromJson(Map<String, dynamic> json) {
    return LanguageWithScore(
      languageCode:
          (json['LanguageCode'] as String?)?.let(LanguageCode.fromString),
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final score = this.score;
    return {
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (score != null) 'Score': score,
    };
  }
}

/// A list of possible alternative transcriptions for the input audio. Each
/// alternative may contain one or more of <code>Items</code>,
/// <code>Entities</code>, or <code>Transcript</code>.
///
/// @nodoc
class Alternative {
  /// Contains entities identified as personally identifiable information (PII) in
  /// your transcription output.
  final List<Entity>? entities;

  /// Contains words, phrases, or punctuation marks in your transcription output.
  final List<Item>? items;

  /// Contains transcribed text.
  final String? transcript;

  Alternative({
    this.entities,
    this.items,
    this.transcript,
  });

  factory Alternative.fromJson(Map<String, dynamic> json) {
    return Alternative(
      entities: (json['Entities'] as List?)
          ?.nonNulls
          .map((e) => Entity.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => Item.fromJson(e as Map<String, dynamic>))
          .toList(),
      transcript: json['Transcript'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final items = this.items;
    final transcript = this.transcript;
    return {
      if (entities != null) 'Entities': entities,
      if (items != null) 'Items': items,
      if (transcript != null) 'Transcript': transcript,
    };
  }
}

/// Contains entities identified as personally identifiable information (PII) in
/// your transcription output, along with various associated attributes.
/// Examples include category, confidence score, type, stability score, and
/// start and end times.
///
/// @nodoc
class Entity {
  /// The category of information identified. The only category is
  /// <code>PII</code>.
  final String? category;

  /// The confidence score associated with the identified PII entity in your
  /// audio.
  ///
  /// Confidence scores are values between 0 and 1. A larger value indicates a
  /// higher probability that the identified entity correctly matches the entity
  /// spoken in your media.
  final double? confidence;

  /// The word or words identified as PII.
  final String? content;

  /// The end time of the utterance that was identified as PII in seconds, with
  /// millisecond precision (e.g., 1.056)
  final double? endTime;

  /// The start time of the utterance that was identified as PII in seconds, with
  /// millisecond precision (e.g., 1.056)
  final double? startTime;

  /// The type of PII identified. For example, <code>NAME</code> or
  /// <code>CREDIT_DEBIT_NUMBER</code>.
  final String? type;

  Entity({
    this.category,
    this.confidence,
    this.content,
    this.endTime,
    this.startTime,
    this.type,
  });

  factory Entity.fromJson(Map<String, dynamic> json) {
    return Entity(
      category: json['Category'] as String?,
      confidence: json['Confidence'] as double?,
      content: json['Content'] as String?,
      endTime: json['EndTime'] as double?,
      startTime: json['StartTime'] as double?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final confidence = this.confidence;
    final content = this.content;
    final endTime = this.endTime;
    final startTime = this.startTime;
    final type = this.type;
    return {
      if (category != null) 'Category': category,
      if (confidence != null) 'Confidence': confidence,
      if (content != null) 'Content': content,
      if (endTime != null) 'EndTime': endTime,
      if (startTime != null) 'StartTime': startTime,
      if (type != null) 'Type': type,
    };
  }
}

/// A word, phrase, or punctuation mark in your transcription output, along with
/// various associated attributes, such as confidence score, type, and start and
/// end times.
///
/// @nodoc
class Item {
  /// The confidence score associated with a word or phrase in your transcript.
  ///
  /// Confidence scores are values between 0 and 1. A larger value indicates a
  /// higher probability that the identified item correctly matches the item
  /// spoken in your media.
  final double? confidence;

  /// The word or punctuation that was transcribed.
  final String? content;

  /// The end time of the transcribed item in seconds, with millisecond precision
  /// (e.g., 1.056)
  final double? endTime;

  /// If speaker partitioning is enabled, <code>Speaker</code> labels the speaker
  /// of the specified item.
  final String? speaker;

  /// If partial result stabilization is enabled, <code>Stable</code> indicates
  /// whether the specified item is stable (<code>true</code>) or if it may change
  /// when the segment is complete (<code>false</code>).
  final bool? stable;

  /// The start time of the transcribed item in seconds, with millisecond
  /// precision (e.g., 1.056)
  final double? startTime;

  /// The type of item identified. Options are: <code>PRONUNCIATION</code> (spoken
  /// words) and <code>PUNCTUATION</code>.
  final ItemType? type;

  /// Indicates whether the specified item matches a word in the vocabulary filter
  /// included in your request. If <code>true</code>, there is a vocabulary filter
  /// match.
  final bool? vocabularyFilterMatch;

  Item({
    this.confidence,
    this.content,
    this.endTime,
    this.speaker,
    this.stable,
    this.startTime,
    this.type,
    this.vocabularyFilterMatch,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      confidence: json['Confidence'] as double?,
      content: json['Content'] as String?,
      endTime: json['EndTime'] as double?,
      speaker: json['Speaker'] as String?,
      stable: json['Stable'] as bool?,
      startTime: json['StartTime'] as double?,
      type: (json['Type'] as String?)?.let(ItemType.fromString),
      vocabularyFilterMatch: json['VocabularyFilterMatch'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final content = this.content;
    final endTime = this.endTime;
    final speaker = this.speaker;
    final stable = this.stable;
    final startTime = this.startTime;
    final type = this.type;
    final vocabularyFilterMatch = this.vocabularyFilterMatch;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (content != null) 'Content': content,
      if (endTime != null) 'EndTime': endTime,
      if (speaker != null) 'Speaker': speaker,
      if (stable != null) 'Stable': stable,
      if (startTime != null) 'StartTime': startTime,
      if (type != null) 'Type': type.value,
      if (vocabularyFilterMatch != null)
        'VocabularyFilterMatch': vocabularyFilterMatch,
    };
  }
}

/// @nodoc
class ItemType {
  static const pronunciation = ItemType._('pronunciation');
  static const punctuation = ItemType._('punctuation');

  final String value;

  const ItemType._(this.value);

  static const values = [pronunciation, punctuation];

  static ItemType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ItemType._(value));

  @override
  bool operator ==(other) => other is ItemType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An encoded stream of audio blobs. Audio streams are encoded as either HTTP/2
/// or WebSocket data frames.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html">Transcribing
/// streaming audio</a>.
///
/// @nodoc
class AudioStream {
  /// A blob of audio from your application. Your audio stream consists of one or
  /// more audio events.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/event-stream.html">Event
  /// stream encoding</a>.
  final AudioEvent? audioEvent;

  /// Contains audio channel definitions and post-call analytics settings.
  final ConfigurationEvent? configurationEvent;

  AudioStream({
    this.audioEvent,
    this.configurationEvent,
  });

  Map<String, dynamic> toJson() {
    final audioEvent = this.audioEvent;
    final configurationEvent = this.configurationEvent;
    return {
      if (audioEvent != null) 'AudioEvent': audioEvent,
      if (configurationEvent != null) 'ConfigurationEvent': configurationEvent,
    };
  }
}

/// A wrapper for your audio chunks. Your audio stream consists of one or more
/// audio events, which consist of one or more audio chunks.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/event-stream.html">Event
/// stream encoding</a>.
///
/// @nodoc
class AudioEvent {
  /// An audio blob containing the next segment of audio from your application,
  /// with a maximum duration of 1 second. The maximum size in bytes varies based
  /// on audio properties.
  ///
  /// Find recommended size in <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#best-practices">Transcribing
  /// streaming best practices</a>.
  ///
  /// Size calculation: <code>Duration (s) * Sample Rate (Hz) * Number of Channels
  /// * 2 (Bytes per Sample)</code>
  ///
  /// For example, a 1-second chunk of 16 kHz, 2-channel, 16-bit audio would be
  /// <code>1 * 16000 * 2 * 2 = 64000 bytes</code>.
  ///
  /// For 8 kHz, 1-channel, 16-bit audio, a 1-second chunk would be <code>1 * 8000
  /// * 1 * 2 = 16000 bytes</code>.
  final Uint8List? audioChunk;

  AudioEvent({
    this.audioChunk,
  });

  Map<String, dynamic> toJson() {
    final audioChunk = this.audioChunk;
    return {
      if (audioChunk != null) 'AudioChunk': base64Encode(audioChunk),
    };
  }
}

/// Allows you to set audio channel definitions and post-call analytics
/// settings.
///
/// @nodoc
class ConfigurationEvent {
  /// Indicates which speaker is on which audio channel.
  final List<ChannelDefinition>? channelDefinitions;

  /// Provides additional optional settings for your Call Analytics post-call
  /// request, including encryption and output locations for your redacted
  /// transcript.
  ///
  /// <code>PostCallAnalyticsSettings</code> provides you with the same insights
  /// as a Call Analytics post-call transcription. Refer to <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-post-call.html">Post-call
  /// analytics</a> for more information on this feature.
  final PostCallAnalyticsSettings? postCallAnalyticsSettings;

  ConfigurationEvent({
    this.channelDefinitions,
    this.postCallAnalyticsSettings,
  });

  Map<String, dynamic> toJson() {
    final channelDefinitions = this.channelDefinitions;
    final postCallAnalyticsSettings = this.postCallAnalyticsSettings;
    return {
      if (channelDefinitions != null) 'ChannelDefinitions': channelDefinitions,
      if (postCallAnalyticsSettings != null)
        'PostCallAnalyticsSettings': postCallAnalyticsSettings,
    };
  }
}

/// Allows you to specify additional settings for your Call Analytics post-call
/// request, including output locations for your redacted transcript, which IAM
/// role to use, and which encryption key to use.
///
/// <code>DataAccessRoleArn</code> and <code>OutputLocation</code> are required
/// fields.
///
/// <code>PostCallAnalyticsSettings</code> provides you with the same insights
/// as a Call Analytics post-call transcription. Refer to <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-post-call.html">Post-call
/// analytics</a> for more information on this feature.
///
/// @nodoc
class PostCallAnalyticsSettings {
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
  final String dataAccessRoleArn;

  /// The Amazon S3 location where you want your Call Analytics post-call
  /// transcription output stored. You can use any of the following formats to
  /// specify the output location:
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
  final String outputLocation;

  /// Specify whether you want only a redacted transcript or both a redacted and
  /// an unredacted transcript. If you choose redacted and unredacted, two JSON
  /// files are generated and stored in the Amazon S3 output location you specify.
  ///
  /// Note that to include <code>ContentRedactionOutput</code> in your request,
  /// you must enable content redaction (<code>ContentRedactionType</code>).
  final ContentRedactionOutput? contentRedactionOutput;

  /// The KMS key you want to use to encrypt your Call Analytics post-call output.
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
  /// Note that the role making the request must have permission to use the
  /// specified KMS key.
  final String? outputEncryptionKMSKeyId;

  PostCallAnalyticsSettings({
    required this.dataAccessRoleArn,
    required this.outputLocation,
    this.contentRedactionOutput,
    this.outputEncryptionKMSKeyId,
  });

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final outputLocation = this.outputLocation;
    final contentRedactionOutput = this.contentRedactionOutput;
    final outputEncryptionKMSKeyId = this.outputEncryptionKMSKeyId;
    return {
      'DataAccessRoleArn': dataAccessRoleArn,
      'OutputLocation': outputLocation,
      if (contentRedactionOutput != null)
        'ContentRedactionOutput': contentRedactionOutput.value,
      if (outputEncryptionKMSKeyId != null)
        'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
    };
  }
}

/// @nodoc
class ContentRedactionOutput {
  static const redacted = ContentRedactionOutput._('redacted');
  static const redactedAndUnredacted =
      ContentRedactionOutput._('redacted_and_unredacted');

  final String value;

  const ContentRedactionOutput._(this.value);

  static const values = [redacted, redactedAndUnredacted];

  static ContentRedactionOutput fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContentRedactionOutput._(value));

  @override
  bool operator ==(other) =>
      other is ContentRedactionOutput && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Makes it possible to specify which speaker is on which audio channel. For
/// example, if your agent is the first participant to speak, you would set
/// <code>ChannelId</code> to <code>0</code> (to indicate the first channel) and
/// <code>ParticipantRole</code> to <code>AGENT</code> (to indicate that it's
/// the agent speaking).
///
/// @nodoc
class ChannelDefinition {
  /// Specify the audio channel you want to define.
  final int channelId;

  /// Specify the speaker you want to define. Omitting this parameter is
  /// equivalent to specifying both participants.
  final ParticipantRole participantRole;

  ChannelDefinition({
    required this.channelId,
    required this.participantRole,
  });

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final participantRole = this.participantRole;
    return {
      'ChannelId': channelId,
      'ParticipantRole': participantRole.value,
    };
  }
}

/// @nodoc
class ParticipantRole {
  static const agent = ParticipantRole._('AGENT');
  static const customer = ParticipantRole._('CUSTOMER');

  final String value;

  const ParticipantRole._(this.value);

  static const values = [agent, customer];

  static ParticipantRole fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantRole._(value));

  @override
  bool operator ==(other) => other is ParticipantRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Specialty {
  static const primarycare = Specialty._('PRIMARYCARE');
  static const cardiology = Specialty._('CARDIOLOGY');
  static const neurology = Specialty._('NEUROLOGY');
  static const oncology = Specialty._('ONCOLOGY');
  static const radiology = Specialty._('RADIOLOGY');
  static const urology = Specialty._('UROLOGY');

  final String value;

  const Specialty._(this.value);

  static const values = [
    primarycare,
    cardiology,
    neurology,
    oncology,
    radiology,
    urology
  ];

  static Specialty fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Specialty._(value));

  @override
  bool operator ==(other) => other is Specialty && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Type {
  static const conversation = Type._('CONVERSATION');
  static const dictation = Type._('DICTATION');

  final String value;

  const Type._(this.value);

  static const values = [conversation, dictation];

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Type._(value));

  @override
  bool operator ==(other) => other is Type && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about your streaming session.
///
/// @nodoc
class MedicalTranscriptResultStream {
  final BadRequestException? badRequestException;
  final ConflictException? conflictException;
  final InternalFailureException? internalFailureException;
  final LimitExceededException? limitExceededException;
  final ServiceUnavailableException? serviceUnavailableException;

  /// The <code>MedicalTranscriptEvent</code> associated with a
  /// <code>MedicalTranscriptResultStream</code>.
  ///
  /// Contains a set of transcription results from one or more audio segments,
  /// along with additional information per your request parameters. This can
  /// include information relating to alternative transcriptions, channel
  /// identification, partial result stabilization, language identification, and
  /// other transcription-related data.
  final MedicalTranscriptEvent? transcriptEvent;

  MedicalTranscriptResultStream({
    this.badRequestException,
    this.conflictException,
    this.internalFailureException,
    this.limitExceededException,
    this.serviceUnavailableException,
    this.transcriptEvent,
  });

  factory MedicalTranscriptResultStream.fromJson(Map<String, dynamic> json) {
    return MedicalTranscriptResultStream(
      badRequestException: json['BadRequestException'] != null
          ? BadRequestException.fromJson(
              json['BadRequestException'] as Map<String, dynamic>)
          : null,
      conflictException: json['ConflictException'] != null
          ? ConflictException.fromJson(
              json['ConflictException'] as Map<String, dynamic>)
          : null,
      internalFailureException: json['InternalFailureException'] != null
          ? InternalFailureException.fromJson(
              json['InternalFailureException'] as Map<String, dynamic>)
          : null,
      limitExceededException: json['LimitExceededException'] != null
          ? LimitExceededException.fromJson(
              json['LimitExceededException'] as Map<String, dynamic>)
          : null,
      serviceUnavailableException: json['ServiceUnavailableException'] != null
          ? ServiceUnavailableException.fromJson(
              json['ServiceUnavailableException'] as Map<String, dynamic>)
          : null,
      transcriptEvent: json['TranscriptEvent'] != null
          ? MedicalTranscriptEvent.fromJson(
              json['TranscriptEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final badRequestException = this.badRequestException;
    final conflictException = this.conflictException;
    final internalFailureException = this.internalFailureException;
    final limitExceededException = this.limitExceededException;
    final serviceUnavailableException = this.serviceUnavailableException;
    final transcriptEvent = this.transcriptEvent;
    return {
      if (badRequestException != null)
        'BadRequestException': badRequestException,
      if (conflictException != null) 'ConflictException': conflictException,
      if (internalFailureException != null)
        'InternalFailureException': internalFailureException,
      if (limitExceededException != null)
        'LimitExceededException': limitExceededException,
      if (serviceUnavailableException != null)
        'ServiceUnavailableException': serviceUnavailableException,
      if (transcriptEvent != null) 'TranscriptEvent': transcriptEvent,
    };
  }
}

/// @nodoc
class MedicalContentIdentificationType {
  static const phi = MedicalContentIdentificationType._('PHI');

  final String value;

  const MedicalContentIdentificationType._(this.value);

  static const values = [phi];

  static MedicalContentIdentificationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalContentIdentificationType._(value));

  @override
  bool operator ==(other) =>
      other is MedicalContentIdentificationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The <code>MedicalTranscriptEvent</code> associated with a
/// <code>MedicalTranscriptResultStream</code>.
///
/// Contains a set of transcription results from one or more audio segments,
/// along with additional information per your request parameters.
///
/// @nodoc
class MedicalTranscriptEvent {
  /// Contains <code>Results</code>, which contains a set of transcription results
  /// from one or more audio segments, along with additional information per your
  /// request parameters. This can include information relating to alternative
  /// transcriptions, channel identification, partial result stabilization,
  /// language identification, and other transcription-related data.
  final MedicalTranscript? transcript;

  MedicalTranscriptEvent({
    this.transcript,
  });

  factory MedicalTranscriptEvent.fromJson(Map<String, dynamic> json) {
    return MedicalTranscriptEvent(
      transcript: json['Transcript'] != null
          ? MedicalTranscript.fromJson(
              json['Transcript'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transcript = this.transcript;
    return {
      if (transcript != null) 'Transcript': transcript,
    };
  }
}

/// The <code>MedicalTranscript</code> associated with a <code></code>.
///
/// <code>MedicalTranscript</code> contains <code>Results</code>, which contains
/// a set of transcription results from one or more audio segments, along with
/// additional information per your request parameters.
///
/// @nodoc
class MedicalTranscript {
  /// Contains a set of transcription results from one or more audio segments,
  /// along with additional information per your request parameters. This can
  /// include information relating to alternative transcriptions, channel
  /// identification, partial result stabilization, language identification, and
  /// other transcription-related data.
  final List<MedicalResult>? results;

  MedicalTranscript({
    this.results,
  });

  factory MedicalTranscript.fromJson(Map<String, dynamic> json) {
    return MedicalTranscript(
      results: (json['Results'] as List?)
          ?.nonNulls
          .map((e) => MedicalResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    return {
      if (results != null) 'Results': results,
    };
  }
}

/// The <code>Result</code> associated with a <code></code>.
///
/// Contains a set of transcription results from one or more audio segments,
/// along with additional information per your request parameters. This can
/// include information relating to alternative transcriptions, channel
/// identification, partial result stabilization, language identification, and
/// other transcription-related data.
///
/// @nodoc
class MedicalResult {
  /// A list of possible alternative transcriptions for the input audio. Each
  /// alternative may contain one or more of <code>Items</code>,
  /// <code>Entities</code>, or <code>Transcript</code>.
  final List<MedicalAlternative>? alternatives;

  /// Indicates the channel identified for the <code>Result</code>.
  final String? channelId;

  /// The end time, in seconds, of the <code>Result</code>.
  final double? endTime;

  /// Indicates if the segment is complete.
  ///
  /// If <code>IsPartial</code> is <code>true</code>, the segment is not complete.
  /// If <code>IsPartial</code> is <code>false</code>, the segment is complete.
  final bool? isPartial;

  /// Provides a unique identifier for the <code>Result</code>.
  final String? resultId;

  /// The start time, in seconds, of the <code>Result</code>.
  final double? startTime;

  MedicalResult({
    this.alternatives,
    this.channelId,
    this.endTime,
    this.isPartial,
    this.resultId,
    this.startTime,
  });

  factory MedicalResult.fromJson(Map<String, dynamic> json) {
    return MedicalResult(
      alternatives: (json['Alternatives'] as List?)
          ?.nonNulls
          .map((e) => MedicalAlternative.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelId: json['ChannelId'] as String?,
      endTime: json['EndTime'] as double?,
      isPartial: json['IsPartial'] as bool?,
      resultId: json['ResultId'] as String?,
      startTime: json['StartTime'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final alternatives = this.alternatives;
    final channelId = this.channelId;
    final endTime = this.endTime;
    final isPartial = this.isPartial;
    final resultId = this.resultId;
    final startTime = this.startTime;
    return {
      if (alternatives != null) 'Alternatives': alternatives,
      if (channelId != null) 'ChannelId': channelId,
      if (endTime != null) 'EndTime': endTime,
      if (isPartial != null) 'IsPartial': isPartial,
      if (resultId != null) 'ResultId': resultId,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

/// A list of possible alternative transcriptions for the input audio. Each
/// alternative may contain one or more of <code>Items</code>,
/// <code>Entities</code>, or <code>Transcript</code>.
///
/// @nodoc
class MedicalAlternative {
  /// Contains entities identified as personal health information (PHI) in your
  /// transcription output.
  final List<MedicalEntity>? entities;

  /// Contains words, phrases, or punctuation marks in your transcription output.
  final List<MedicalItem>? items;

  /// Contains transcribed text.
  final String? transcript;

  MedicalAlternative({
    this.entities,
    this.items,
    this.transcript,
  });

  factory MedicalAlternative.fromJson(Map<String, dynamic> json) {
    return MedicalAlternative(
      entities: (json['Entities'] as List?)
          ?.nonNulls
          .map((e) => MedicalEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => MedicalItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      transcript: json['Transcript'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final items = this.items;
    final transcript = this.transcript;
    return {
      if (entities != null) 'Entities': entities,
      if (items != null) 'Items': items,
      if (transcript != null) 'Transcript': transcript,
    };
  }
}

/// Contains entities identified as personal health information (PHI) in your
/// transcription output, along with various associated attributes. Examples
/// include category, confidence score, type, stability score, and start and end
/// times.
///
/// @nodoc
class MedicalEntity {
  /// The category of information identified. The only category is
  /// <code>PHI</code>.
  final String? category;

  /// The confidence score associated with the identified PHI entity in your
  /// audio.
  ///
  /// Confidence scores are values between 0 and 1. A larger value indicates a
  /// higher probability that the identified entity correctly matches the entity
  /// spoken in your media.
  final double? confidence;

  /// The word or words identified as PHI.
  final String? content;

  /// The end time, in seconds, of the utterance that was identified as PHI.
  final double? endTime;

  /// The start time, in seconds, of the utterance that was identified as PHI.
  final double? startTime;

  MedicalEntity({
    this.category,
    this.confidence,
    this.content,
    this.endTime,
    this.startTime,
  });

  factory MedicalEntity.fromJson(Map<String, dynamic> json) {
    return MedicalEntity(
      category: json['Category'] as String?,
      confidence: json['Confidence'] as double?,
      content: json['Content'] as String?,
      endTime: json['EndTime'] as double?,
      startTime: json['StartTime'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final category = this.category;
    final confidence = this.confidence;
    final content = this.content;
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (category != null) 'Category': category,
      if (confidence != null) 'Confidence': confidence,
      if (content != null) 'Content': content,
      if (endTime != null) 'EndTime': endTime,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

/// A word, phrase, or punctuation mark in your transcription output, along with
/// various associated attributes, such as confidence score, type, and start and
/// end times.
///
/// @nodoc
class MedicalItem {
  /// The confidence score associated with a word or phrase in your transcript.
  ///
  /// Confidence scores are values between 0 and 1. A larger value indicates a
  /// higher probability that the identified item correctly matches the item
  /// spoken in your media.
  final double? confidence;

  /// The word or punctuation that was transcribed.
  final String? content;

  /// The end time, in seconds, of the transcribed item.
  final double? endTime;

  /// If speaker partitioning is enabled, <code>Speaker</code> labels the speaker
  /// of the specified item.
  final String? speaker;

  /// The start time, in seconds, of the transcribed item.
  final double? startTime;

  /// The type of item identified. Options are: <code>PRONUNCIATION</code> (spoken
  /// words) and <code>PUNCTUATION</code>.
  final ItemType? type;

  MedicalItem({
    this.confidence,
    this.content,
    this.endTime,
    this.speaker,
    this.startTime,
    this.type,
  });

  factory MedicalItem.fromJson(Map<String, dynamic> json) {
    return MedicalItem(
      confidence: json['Confidence'] as double?,
      content: json['Content'] as String?,
      endTime: json['EndTime'] as double?,
      speaker: json['Speaker'] as String?,
      startTime: json['StartTime'] as double?,
      type: (json['Type'] as String?)?.let(ItemType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final content = this.content;
    final endTime = this.endTime;
    final speaker = this.speaker;
    final startTime = this.startTime;
    final type = this.type;
    return {
      if (confidence != null) 'Confidence': confidence,
      if (content != null) 'Content': content,
      if (endTime != null) 'EndTime': endTime,
      if (speaker != null) 'Speaker': speaker,
      if (startTime != null) 'StartTime': startTime,
      if (type != null) 'Type': type.value,
    };
  }
}

/// @nodoc
class MedicalScribeLanguageCode {
  static const enUs = MedicalScribeLanguageCode._('en-US');

  final String value;

  const MedicalScribeLanguageCode._(this.value);

  static const values = [enUs];

  static MedicalScribeLanguageCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeLanguageCode._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeLanguageCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MedicalScribeMediaEncoding {
  static const pcm = MedicalScribeMediaEncoding._('pcm');
  static const oggOpus = MedicalScribeMediaEncoding._('ogg-opus');
  static const flac = MedicalScribeMediaEncoding._('flac');

  final String value;

  const MedicalScribeMediaEncoding._(this.value);

  static const values = [pcm, oggOpus, flac];

  static MedicalScribeMediaEncoding fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeMediaEncoding._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeMediaEncoding && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Result stream where you will receive the output events. The details are
/// provided in the <code>MedicalScribeTranscriptEvent</code> object.
///
/// @nodoc
class MedicalScribeResultStream {
  final BadRequestException? badRequestException;
  final ConflictException? conflictException;
  final InternalFailureException? internalFailureException;
  final LimitExceededException? limitExceededException;
  final ServiceUnavailableException? serviceUnavailableException;

  /// The transcript event that contains real-time transcription results.
  final MedicalScribeTranscriptEvent? transcriptEvent;

  MedicalScribeResultStream({
    this.badRequestException,
    this.conflictException,
    this.internalFailureException,
    this.limitExceededException,
    this.serviceUnavailableException,
    this.transcriptEvent,
  });

  factory MedicalScribeResultStream.fromJson(Map<String, dynamic> json) {
    return MedicalScribeResultStream(
      badRequestException: json['BadRequestException'] != null
          ? BadRequestException.fromJson(
              json['BadRequestException'] as Map<String, dynamic>)
          : null,
      conflictException: json['ConflictException'] != null
          ? ConflictException.fromJson(
              json['ConflictException'] as Map<String, dynamic>)
          : null,
      internalFailureException: json['InternalFailureException'] != null
          ? InternalFailureException.fromJson(
              json['InternalFailureException'] as Map<String, dynamic>)
          : null,
      limitExceededException: json['LimitExceededException'] != null
          ? LimitExceededException.fromJson(
              json['LimitExceededException'] as Map<String, dynamic>)
          : null,
      serviceUnavailableException: json['ServiceUnavailableException'] != null
          ? ServiceUnavailableException.fromJson(
              json['ServiceUnavailableException'] as Map<String, dynamic>)
          : null,
      transcriptEvent: json['TranscriptEvent'] != null
          ? MedicalScribeTranscriptEvent.fromJson(
              json['TranscriptEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final badRequestException = this.badRequestException;
    final conflictException = this.conflictException;
    final internalFailureException = this.internalFailureException;
    final limitExceededException = this.limitExceededException;
    final serviceUnavailableException = this.serviceUnavailableException;
    final transcriptEvent = this.transcriptEvent;
    return {
      if (badRequestException != null)
        'BadRequestException': badRequestException,
      if (conflictException != null) 'ConflictException': conflictException,
      if (internalFailureException != null)
        'InternalFailureException': internalFailureException,
      if (limitExceededException != null)
        'LimitExceededException': limitExceededException,
      if (serviceUnavailableException != null)
        'ServiceUnavailableException': serviceUnavailableException,
      if (transcriptEvent != null) 'TranscriptEvent': transcriptEvent,
    };
  }
}

/// The event associated with <code>MedicalScribeResultStream</code>.
///
/// Contains <code>MedicalScribeTranscriptSegment</code>, which contains segment
/// related information.
///
/// @nodoc
class MedicalScribeTranscriptEvent {
  /// The <code>TranscriptSegment</code> associated with a
  /// <code>MedicalScribeTranscriptEvent</code>.
  final MedicalScribeTranscriptSegment? transcriptSegment;

  MedicalScribeTranscriptEvent({
    this.transcriptSegment,
  });

  factory MedicalScribeTranscriptEvent.fromJson(Map<String, dynamic> json) {
    return MedicalScribeTranscriptEvent(
      transcriptSegment: json['TranscriptSegment'] != null
          ? MedicalScribeTranscriptSegment.fromJson(
              json['TranscriptSegment'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final transcriptSegment = this.transcriptSegment;
    return {
      if (transcriptSegment != null) 'TranscriptSegment': transcriptSegment,
    };
  }
}

/// Contains a set of transcription results, along with additional information
/// of the segment.
///
/// @nodoc
class MedicalScribeTranscriptSegment {
  /// The start time, in milliseconds, of the segment.
  final double? beginAudioTime;

  /// Indicates which audio channel is associated with the
  /// <code>MedicalScribeTranscriptSegment</code>.
  ///
  /// If <code>MedicalScribeChannelDefinition</code> is not provided in the
  /// <code>MedicalScribeConfigurationEvent</code>, then this field will not be
  /// included.
  final String? channelId;

  /// Contains transcribed text of the segment.
  final String? content;

  /// The end time, in milliseconds, of the segment.
  final double? endAudioTime;

  /// Indicates if the segment is complete.
  ///
  /// If <code>IsPartial</code> is <code>true</code>, the segment is not complete.
  /// If <code>IsPartial</code> is <code>false</code>, the segment is complete.
  final bool? isPartial;

  /// Contains words, phrases, or punctuation marks in your segment.
  final List<MedicalScribeTranscriptItem>? items;

  /// The identifier of the segment.
  final String? segmentId;

  MedicalScribeTranscriptSegment({
    this.beginAudioTime,
    this.channelId,
    this.content,
    this.endAudioTime,
    this.isPartial,
    this.items,
    this.segmentId,
  });

  factory MedicalScribeTranscriptSegment.fromJson(Map<String, dynamic> json) {
    return MedicalScribeTranscriptSegment(
      beginAudioTime: json['BeginAudioTime'] as double?,
      channelId: json['ChannelId'] as String?,
      content: json['Content'] as String?,
      endAudioTime: json['EndAudioTime'] as double?,
      isPartial: json['IsPartial'] as bool?,
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) =>
              MedicalScribeTranscriptItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      segmentId: json['SegmentId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginAudioTime = this.beginAudioTime;
    final channelId = this.channelId;
    final content = this.content;
    final endAudioTime = this.endAudioTime;
    final isPartial = this.isPartial;
    final items = this.items;
    final segmentId = this.segmentId;
    return {
      if (beginAudioTime != null) 'BeginAudioTime': beginAudioTime,
      if (channelId != null) 'ChannelId': channelId,
      if (content != null) 'Content': content,
      if (endAudioTime != null) 'EndAudioTime': endAudioTime,
      if (isPartial != null) 'IsPartial': isPartial,
      if (items != null) 'Items': items,
      if (segmentId != null) 'SegmentId': segmentId,
    };
  }
}

/// A word, phrase, or punctuation mark in your transcription output, along with
/// various associated attributes, such as confidence score, type, and start and
/// end times.
///
/// @nodoc
class MedicalScribeTranscriptItem {
  /// The start time, in milliseconds, of the transcribed item.
  final double? beginAudioTime;

  /// The confidence score associated with a word or phrase in your transcript.
  ///
  /// Confidence scores are values between 0 and 1. A larger value indicates a
  /// higher probability that the identified item correctly matches the item
  /// spoken in your media.
  final double? confidence;

  /// The word, phrase or punctuation mark that was transcribed.
  final String? content;

  /// The end time, in milliseconds, of the transcribed item.
  final double? endAudioTime;

  /// The type of item identified. Options are: <code>PRONUNCIATION</code> (spoken
  /// words) and <code>PUNCTUATION</code>.
  final MedicalScribeTranscriptItemType? type;

  /// Indicates whether the specified item matches a word in the vocabulary filter
  /// included in your configuration event. If <code>true</code>, there is a
  /// vocabulary filter match.
  final bool? vocabularyFilterMatch;

  MedicalScribeTranscriptItem({
    this.beginAudioTime,
    this.confidence,
    this.content,
    this.endAudioTime,
    this.type,
    this.vocabularyFilterMatch,
  });

  factory MedicalScribeTranscriptItem.fromJson(Map<String, dynamic> json) {
    return MedicalScribeTranscriptItem(
      beginAudioTime: json['BeginAudioTime'] as double?,
      confidence: json['Confidence'] as double?,
      content: json['Content'] as String?,
      endAudioTime: json['EndAudioTime'] as double?,
      type: (json['Type'] as String?)
          ?.let(MedicalScribeTranscriptItemType.fromString),
      vocabularyFilterMatch: json['VocabularyFilterMatch'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginAudioTime = this.beginAudioTime;
    final confidence = this.confidence;
    final content = this.content;
    final endAudioTime = this.endAudioTime;
    final type = this.type;
    final vocabularyFilterMatch = this.vocabularyFilterMatch;
    return {
      if (beginAudioTime != null) 'BeginAudioTime': beginAudioTime,
      if (confidence != null) 'Confidence': confidence,
      if (content != null) 'Content': content,
      if (endAudioTime != null) 'EndAudioTime': endAudioTime,
      if (type != null) 'Type': type.value,
      if (vocabularyFilterMatch != null)
        'VocabularyFilterMatch': vocabularyFilterMatch,
    };
  }
}

/// @nodoc
class MedicalScribeTranscriptItemType {
  static const pronunciation =
      MedicalScribeTranscriptItemType._('pronunciation');
  static const punctuation = MedicalScribeTranscriptItemType._('punctuation');

  final String value;

  const MedicalScribeTranscriptItemType._(this.value);

  static const values = [pronunciation, punctuation];

  static MedicalScribeTranscriptItemType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeTranscriptItemType._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeTranscriptItemType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An encoded stream of events. The stream is encoded as HTTP/2 data frames.
///
/// An input stream consists of the following types of events. The first element
/// of the input stream must be the <code>MedicalScribeConfigurationEvent</code>
/// event type.
///
/// <ul>
/// <li>
/// <code>MedicalScribeConfigurationEvent</code>
/// </li>
/// <li>
/// <code>MedicalScribeAudioEvent</code>
/// </li>
/// <li>
/// <code>MedicalScribeSessionControlEvent</code>
/// </li>
/// </ul>
///
/// @nodoc
class MedicalScribeInputStream {
  final MedicalScribeAudioEvent? audioEvent;

  /// Specify additional streaming session configurations beyond those provided in
  /// your initial start request headers. For example, specify channel
  /// definitions, encryption settings, and post-stream analytics settings.
  ///
  /// Whether you are starting a new session or resuming an existing session, your
  /// first event must be a <code>MedicalScribeConfigurationEvent</code>.
  final MedicalScribeConfigurationEvent? configurationEvent;

  /// Specify the lifecycle of your streaming session, such as ending the session.
  final MedicalScribeSessionControlEvent? sessionControlEvent;

  MedicalScribeInputStream({
    this.audioEvent,
    this.configurationEvent,
    this.sessionControlEvent,
  });

  Map<String, dynamic> toJson() {
    final audioEvent = this.audioEvent;
    final configurationEvent = this.configurationEvent;
    final sessionControlEvent = this.sessionControlEvent;
    return {
      if (audioEvent != null) 'AudioEvent': audioEvent,
      if (configurationEvent != null) 'ConfigurationEvent': configurationEvent,
      if (sessionControlEvent != null)
        'SessionControlEvent': sessionControlEvent,
    };
  }
}

/// A wrapper for your audio chunks
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/event-stream.html">Event
/// stream encoding</a>.
///
/// @nodoc
class MedicalScribeAudioEvent {
  /// An audio blob containing the next segment of audio from your application,
  /// with a maximum duration of 1 second. The maximum size in bytes varies based
  /// on audio properties.
  ///
  /// Find recommended size in <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#best-practices">Transcribing
  /// streaming best practices</a>.
  ///
  /// Size calculation: <code>Duration (s) * Sample Rate (Hz) * Number of Channels
  /// * 2 (Bytes per Sample)</code>
  ///
  /// For example, a 1-second chunk of 16 kHz, 2-channel, 16-bit audio would be
  /// <code>1 * 16000 * 2 * 2 = 64000 bytes</code>.
  ///
  /// For 8 kHz, 1-channel, 16-bit audio, a 1-second chunk would be <code>1 * 8000
  /// * 1 * 2 = 16000 bytes</code>.
  final Uint8List audioChunk;

  MedicalScribeAudioEvent({
    required this.audioChunk,
  });

  Map<String, dynamic> toJson() {
    final audioChunk = this.audioChunk;
    return {
      'AudioChunk': base64Encode(audioChunk),
    };
  }
}

/// Specify the lifecycle of your streaming session.
///
/// @nodoc
class MedicalScribeSessionControlEvent {
  /// The type of <code>MedicalScribeSessionControlEvent</code>.
  ///
  /// Possible Values:
  ///
  /// <ul>
  /// <li>
  /// <code>END_OF_SESSION</code> - Indicates the audio streaming is complete.
  /// After you send an END_OF_SESSION event, Amazon Web Services HealthScribe
  /// starts the post-stream analytics. The session can't be resumed after this
  /// event is sent. After Amazon Web Services HealthScribe processes the event,
  /// the real-time <code>StreamStatus</code> is <code>COMPLETED</code>. You get
  /// the <code>StreamStatus</code> and other stream details with the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/API_streaming_GetMedicalScribeStream.html">GetMedicalScribeStream</a>
  /// API operation. For more information about different streaming statuses, see
  /// the <code>StreamStatus</code> description in the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/API_streaming_MedicalScribeStreamDetails.html">MedicalScribeStreamDetails</a>.
  /// </li>
  /// </ul>
  final MedicalScribeSessionControlEventType type;

  MedicalScribeSessionControlEvent({
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'Type': type.value,
    };
  }
}

/// Specify details to configure the streaming session, including channel
/// definitions, encryption settings, post-stream analytics settings, resource
/// access role ARN and vocabulary settings.
///
/// Whether you are starting a new session or resuming an existing session, your
/// first event must be a <code>MedicalScribeConfigurationEvent</code>. If you
/// are resuming a session, then this event must have the same configurations
/// that you provided to start the session.
///
/// @nodoc
class MedicalScribeConfigurationEvent {
  /// Specify settings for post-stream analytics.
  final MedicalScribePostStreamAnalyticsSettings postStreamAnalyticsSettings;

  /// The Amazon Resource Name (ARN) of an IAM role that has permissions to access
  /// the Amazon S3 output bucket you specified, and use your KMS key if supplied.
  /// If the role that you specify doesn’t have the appropriate permissions, your
  /// request fails.
  ///
  /// IAM role ARNs have the format
  /// <code>arn:partition:iam::account:role/role-name-with-path</code>. For
  /// example: <code>arn:aws:iam::111122223333:role/Admin</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe-streaming.html">Amazon
  /// Web Services HealthScribe</a>.
  final String resourceAccessRoleArn;

  /// Specify which speaker is on which audio channel.
  final List<MedicalScribeChannelDefinition>? channelDefinitions;

  /// Specify the encryption settings for your streaming session.
  final MedicalScribeEncryptionSettings? encryptionSettings;

  /// The <code>MedicalScribeContext</code> object that contains contextual
  /// information used to generate customized clinical notes.
  final MedicalScribeContext? medicalScribeContext;

  /// Specify how you want your custom vocabulary filter applied to the streaming
  /// session.
  ///
  /// To replace words with <code>***</code>, specify <code>mask</code>.
  ///
  /// To delete words, specify <code>remove</code>.
  ///
  /// To flag words without changing them, specify <code>tag</code>.
  final MedicalScribeVocabularyFilterMethod? vocabularyFilterMethod;

  /// Specify the name of the custom vocabulary filter you want to include in your
  /// streaming session. Custom vocabulary filter names are case-sensitive.
  ///
  /// If you include <code>VocabularyFilterName</code> in the
  /// <code>MedicalScribeConfigurationEvent</code>, you must also include
  /// <code>VocabularyFilterMethod</code>.
  final String? vocabularyFilterName;

  /// Specify the name of the custom vocabulary you want to use for your streaming
  /// session. Custom vocabulary names are case-sensitive.
  final String? vocabularyName;

  MedicalScribeConfigurationEvent({
    required this.postStreamAnalyticsSettings,
    required this.resourceAccessRoleArn,
    this.channelDefinitions,
    this.encryptionSettings,
    this.medicalScribeContext,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyName,
  });

  Map<String, dynamic> toJson() {
    final postStreamAnalyticsSettings = this.postStreamAnalyticsSettings;
    final resourceAccessRoleArn = this.resourceAccessRoleArn;
    final channelDefinitions = this.channelDefinitions;
    final encryptionSettings = this.encryptionSettings;
    final medicalScribeContext = this.medicalScribeContext;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyName = this.vocabularyName;
    return {
      'PostStreamAnalyticsSettings': postStreamAnalyticsSettings,
      'ResourceAccessRoleArn': resourceAccessRoleArn,
      if (channelDefinitions != null) 'ChannelDefinitions': channelDefinitions,
      if (encryptionSettings != null) 'EncryptionSettings': encryptionSettings,
      if (medicalScribeContext != null)
        'MedicalScribeContext': medicalScribeContext,
      if (vocabularyFilterMethod != null)
        'VocabularyFilterMethod': vocabularyFilterMethod.value,
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

/// @nodoc
class MedicalScribeVocabularyFilterMethod {
  static const remove = MedicalScribeVocabularyFilterMethod._('remove');
  static const mask = MedicalScribeVocabularyFilterMethod._('mask');
  static const tag = MedicalScribeVocabularyFilterMethod._('tag');

  final String value;

  const MedicalScribeVocabularyFilterMethod._(this.value);

  static const values = [remove, mask, tag];

  static MedicalScribeVocabularyFilterMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeVocabularyFilterMethod._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeVocabularyFilterMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains encryption related settings to be used for data encryption with Key
/// Management Service, including KmsEncryptionContext and KmsKeyId. The
/// KmsKeyId is required, while KmsEncryptionContext is optional for additional
/// layer of security.
///
/// By default, Amazon Web Services HealthScribe provides encryption at rest to
/// protect sensitive customer data using Amazon S3-managed keys. HealthScribe
/// uses the KMS key you specify as a second layer of encryption.
///
/// Your <code>ResourceAccessRoleArn</code> must permission to use your KMS key.
/// For more information, see <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/health-scribe-encryption.html">Data
/// Encryption at rest for Amazon Web Services HealthScribe</a>.
///
/// @nodoc
class MedicalScribeEncryptionSettings {
  /// The ID of the KMS key you want to use for your streaming session. You can
  /// specify its KMS key ID, key Amazon Resource Name (ARN), alias name, or alias
  /// ARN. When using an alias name, prefix it with <code>"alias/"</code>. To
  /// specify a KMS key in a different Amazon Web Services account, you must use
  /// the key ARN or alias ARN.
  ///
  /// For example:
  ///
  /// <ul>
  /// <li>
  /// Key ID: 1234abcd-12ab-34cd-56ef-1234567890ab
  /// </li>
  /// <li>
  /// Key ARN:
  /// arn:aws:kms:us-east-2:111122223333:key/1234abcd-12ab-34cd-56ef-1234567890ab
  /// </li>
  /// <li>
  /// Alias name: alias/ExampleAlias
  /// </li>
  /// <li>
  /// Alias ARN: arn:aws:kms:us-east-2:111122223333:alias/ExampleAlias
  /// </li>
  /// </ul>
  /// To get the key ID and key ARN for a KMS key, use the <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_ListKeys.html">ListKeys</a>
  /// or <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_DescribeKey.html">DescribeKey</a>
  /// KMS API operations. To get the alias name and alias ARN, use <a
  /// href="https://docs.aws.amazon.com/kms/latest/APIReference/API_ListAliases.html">ListKeys</a>
  /// API operation.
  final String kmsKeyId;

  /// A map of plain text, non-secret key:value pairs, known as encryption context
  /// pairs, that provide an added layer of security for your data. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/key-management.html#kms-context">KMSencryption
  /// context </a> and <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/symmetric-asymmetric.html">Asymmetric
  /// keys in KMS </a>.
  final Map<String, String>? kmsEncryptionContext;

  MedicalScribeEncryptionSettings({
    required this.kmsKeyId,
    this.kmsEncryptionContext,
  });

  factory MedicalScribeEncryptionSettings.fromJson(Map<String, dynamic> json) {
    return MedicalScribeEncryptionSettings(
      kmsKeyId: (json['KmsKeyId'] as String?) ?? '',
      kmsEncryptionContext:
          (json['KmsEncryptionContext'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final kmsKeyId = this.kmsKeyId;
    final kmsEncryptionContext = this.kmsEncryptionContext;
    return {
      'KmsKeyId': kmsKeyId,
      if (kmsEncryptionContext != null)
        'KmsEncryptionContext': kmsEncryptionContext,
    };
  }
}

/// The settings for post-stream analytics.
///
/// @nodoc
class MedicalScribePostStreamAnalyticsSettings {
  /// Specify settings for the post-stream clinical note generation.
  final ClinicalNoteGenerationSettings clinicalNoteGenerationSettings;

  MedicalScribePostStreamAnalyticsSettings({
    required this.clinicalNoteGenerationSettings,
  });

  factory MedicalScribePostStreamAnalyticsSettings.fromJson(
      Map<String, dynamic> json) {
    return MedicalScribePostStreamAnalyticsSettings(
      clinicalNoteGenerationSettings: ClinicalNoteGenerationSettings.fromJson(
          (json['ClinicalNoteGenerationSettings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final clinicalNoteGenerationSettings = this.clinicalNoteGenerationSettings;
    return {
      'ClinicalNoteGenerationSettings': clinicalNoteGenerationSettings,
    };
  }
}

/// The <code>MedicalScribeContext</code> object that contains contextual
/// information which is used during clinical note generation to add relevant
/// context to the note.
///
/// @nodoc
class MedicalScribeContext {
  /// Contains patient-specific information used to customize the clinical note
  /// generation.
  final MedicalScribePatientContext? patientContext;

  MedicalScribeContext({
    this.patientContext,
  });

  Map<String, dynamic> toJson() {
    final patientContext = this.patientContext;
    return {
      if (patientContext != null) 'PatientContext': patientContext,
    };
  }
}

/// Contains patient-specific information.
///
/// @nodoc
class MedicalScribePatientContext {
  /// The patient's preferred pronouns that the user wants to provide as a context
  /// for clinical note generation .
  final Pronouns? pronouns;

  MedicalScribePatientContext({
    this.pronouns,
  });

  Map<String, dynamic> toJson() {
    final pronouns = this.pronouns;
    return {
      if (pronouns != null) 'Pronouns': pronouns.value,
    };
  }
}

/// @nodoc
class Pronouns {
  static const heHim = Pronouns._('HE_HIM');
  static const sheHer = Pronouns._('SHE_HER');
  static const theyThem = Pronouns._('THEY_THEM');

  final String value;

  const Pronouns._(this.value);

  static const values = [heHim, sheHer, theyThem];

  static Pronouns fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Pronouns._(value));

  @override
  bool operator ==(other) => other is Pronouns && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The output configuration for aggregated transcript and clinical note
/// generation.
///
/// @nodoc
class ClinicalNoteGenerationSettings {
  /// The name of the Amazon S3 bucket where you want the output of Amazon Web
  /// Services HealthScribe post-stream analytics stored. Don't include the
  /// <code>S3://</code> prefix of the specified bucket.
  ///
  /// HealthScribe outputs transcript and clinical note files under the prefix:
  /// <code>S3://$output-bucket-name/healthscribe-streaming/session-id/post-stream-analytics/clinical-notes</code>
  ///
  /// The role <code>ResourceAccessRoleArn</code> specified in the
  /// <code>MedicalScribeConfigurationEvent</code> must have permission to use the
  /// specified location. You can change Amazon S3 permissions using the <a
  /// href="https://console.aws.amazon.com/s3"> Amazon Web Services Management
  /// Console </a>. See also <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/security_iam_id-based-policy-examples.html#auth-role-iam-user">Permissions
  /// Required for IAM User Roles </a> .
  final String outputBucketName;

  /// Specify one of the following templates to use for the clinical note summary.
  /// The default is <code>HISTORY_AND_PHYSICAL</code>.
  ///
  /// <ul>
  /// <li>
  /// HISTORY_AND_PHYSICAL: Provides summaries for key sections of the clinical
  /// documentation. Examples of sections include Chief Complaint, History of
  /// Present Illness, Review of Systems, Past Medical History, Assessment, and
  /// Plan.
  /// </li>
  /// <li>
  /// GIRPP: Provides summaries based on the patients progress toward goals.
  /// Examples of sections include Goal, Intervention, Response, Progress, and
  /// Plan.
  /// </li>
  /// <li>
  /// BIRP: Focuses on the patient's behavioral patterns and responses. Examples
  /// of sections include Behavior, Intervention, Response, and Plan.
  /// </li>
  /// <li>
  /// SIRP: Emphasizes the situational context of therapy. Examples of sections
  /// include Situation, Intervention, Response, and Plan.
  /// </li>
  /// <li>
  /// DAP: Provides a simplified format for clinical documentation. Examples of
  /// sections include Data, Assessment, and Plan.
  /// </li>
  /// <li>
  /// BEHAVIORAL_SOAP: Behavioral health focused documentation format. Examples of
  /// sections include Subjective, Objective, Assessment, and Plan.
  /// </li>
  /// <li>
  /// PHYSICAL_SOAP: Physical health focused documentation format. Examples of
  /// sections include Subjective, Objective, Assessment, and Plan.
  /// </li>
  /// </ul>
  final MedicalScribeNoteTemplate? noteTemplate;

  ClinicalNoteGenerationSettings({
    required this.outputBucketName,
    this.noteTemplate,
  });

  factory ClinicalNoteGenerationSettings.fromJson(Map<String, dynamic> json) {
    return ClinicalNoteGenerationSettings(
      outputBucketName: (json['OutputBucketName'] as String?) ?? '',
      noteTemplate: (json['NoteTemplate'] as String?)
          ?.let(MedicalScribeNoteTemplate.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final outputBucketName = this.outputBucketName;
    final noteTemplate = this.noteTemplate;
    return {
      'OutputBucketName': outputBucketName,
      if (noteTemplate != null) 'NoteTemplate': noteTemplate.value,
    };
  }
}

/// @nodoc
class MedicalScribeNoteTemplate {
  static const historyAndPhysical =
      MedicalScribeNoteTemplate._('HISTORY_AND_PHYSICAL');
  static const girpp = MedicalScribeNoteTemplate._('GIRPP');
  static const dap = MedicalScribeNoteTemplate._('DAP');
  static const sirp = MedicalScribeNoteTemplate._('SIRP');
  static const birp = MedicalScribeNoteTemplate._('BIRP');
  static const behavioralSoap = MedicalScribeNoteTemplate._('BEHAVIORAL_SOAP');
  static const physicalSoap = MedicalScribeNoteTemplate._('PHYSICAL_SOAP');

  final String value;

  const MedicalScribeNoteTemplate._(this.value);

  static const values = [
    historyAndPhysical,
    girpp,
    dap,
    sirp,
    birp,
    behavioralSoap,
    physicalSoap
  ];

  static MedicalScribeNoteTemplate fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeNoteTemplate._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeNoteTemplate && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Makes it possible to specify which speaker is on which channel. For example,
/// if the clinician is the first participant to speak, you would set the
/// <code>ChannelId</code> of the first <code>ChannelDefinition</code> in the
/// list to <code>0</code> (to indicate the first channel) and
/// <code>ParticipantRole</code> to <code>CLINICIAN</code> (to indicate that
/// it's the clinician speaking). Then you would set the <code>ChannelId</code>
/// of the second <code>ChannelDefinition</code> in the list to <code>1</code>
/// (to indicate the second channel) and <code>ParticipantRole</code> to
/// <code>PATIENT</code> (to indicate that it's the patient speaking).
///
/// If you don't specify a channel definition, HealthScribe will diarize the
/// transcription and identify speaker roles for each speaker.
///
/// @nodoc
class MedicalScribeChannelDefinition {
  /// Specify the audio channel you want to define.
  final int channelId;

  /// Specify the participant that you want to flag. The allowed options are
  /// <code>CLINICIAN</code> and <code>PATIENT</code>.
  final MedicalScribeParticipantRole participantRole;

  MedicalScribeChannelDefinition({
    required this.channelId,
    required this.participantRole,
  });

  factory MedicalScribeChannelDefinition.fromJson(Map<String, dynamic> json) {
    return MedicalScribeChannelDefinition(
      channelId: (json['ChannelId'] as int?) ?? 0,
      participantRole: MedicalScribeParticipantRole.fromString(
          (json['ParticipantRole'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final participantRole = this.participantRole;
    return {
      'ChannelId': channelId,
      'ParticipantRole': participantRole.value,
    };
  }
}

/// @nodoc
class MedicalScribeParticipantRole {
  static const patient = MedicalScribeParticipantRole._('PATIENT');
  static const clinician = MedicalScribeParticipantRole._('CLINICIAN');

  final String value;

  const MedicalScribeParticipantRole._(this.value);

  static const values = [patient, clinician];

  static MedicalScribeParticipantRole fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeParticipantRole._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeParticipantRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MedicalScribeSessionControlEventType {
  static const endOfSession =
      MedicalScribeSessionControlEventType._('END_OF_SESSION');

  final String value;

  const MedicalScribeSessionControlEventType._(this.value);

  static const values = [endOfSession];

  static MedicalScribeSessionControlEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeSessionControlEventType._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeSessionControlEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CallAnalyticsLanguageCode {
  static const enUs = CallAnalyticsLanguageCode._('en-US');
  static const enGb = CallAnalyticsLanguageCode._('en-GB');
  static const esUs = CallAnalyticsLanguageCode._('es-US');
  static const frCa = CallAnalyticsLanguageCode._('fr-CA');
  static const frFr = CallAnalyticsLanguageCode._('fr-FR');
  static const enAu = CallAnalyticsLanguageCode._('en-AU');
  static const itIt = CallAnalyticsLanguageCode._('it-IT');
  static const deDe = CallAnalyticsLanguageCode._('de-DE');
  static const ptBr = CallAnalyticsLanguageCode._('pt-BR');

  final String value;

  const CallAnalyticsLanguageCode._(this.value);

  static const values = [enUs, enGb, esUs, frCa, frFr, enAu, itIt, deDe, ptBr];

  static CallAnalyticsLanguageCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CallAnalyticsLanguageCode._(value));

  @override
  bool operator ==(other) =>
      other is CallAnalyticsLanguageCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains detailed information about your real-time Call Analytics session.
/// These details are provided in the <code>UtteranceEvent</code> and
/// <code>CategoryEvent</code> objects.
///
/// @nodoc
class CallAnalyticsTranscriptResultStream {
  final BadRequestException? badRequestException;

  /// Provides information on matched categories that were used to generate
  /// real-time supervisor alerts.
  final CategoryEvent? categoryEvent;
  final ConflictException? conflictException;
  final InternalFailureException? internalFailureException;
  final LimitExceededException? limitExceededException;
  final ServiceUnavailableException? serviceUnavailableException;

  /// Contains set of transcription results from one or more audio segments, along
  /// with additional information per your request parameters. This can include
  /// information relating to channel definitions, partial result stabilization,
  /// sentiment, issue detection, and other transcription-related data.
  final UtteranceEvent? utteranceEvent;

  CallAnalyticsTranscriptResultStream({
    this.badRequestException,
    this.categoryEvent,
    this.conflictException,
    this.internalFailureException,
    this.limitExceededException,
    this.serviceUnavailableException,
    this.utteranceEvent,
  });

  factory CallAnalyticsTranscriptResultStream.fromJson(
      Map<String, dynamic> json) {
    return CallAnalyticsTranscriptResultStream(
      badRequestException: json['BadRequestException'] != null
          ? BadRequestException.fromJson(
              json['BadRequestException'] as Map<String, dynamic>)
          : null,
      categoryEvent: json['CategoryEvent'] != null
          ? CategoryEvent.fromJson(
              json['CategoryEvent'] as Map<String, dynamic>)
          : null,
      conflictException: json['ConflictException'] != null
          ? ConflictException.fromJson(
              json['ConflictException'] as Map<String, dynamic>)
          : null,
      internalFailureException: json['InternalFailureException'] != null
          ? InternalFailureException.fromJson(
              json['InternalFailureException'] as Map<String, dynamic>)
          : null,
      limitExceededException: json['LimitExceededException'] != null
          ? LimitExceededException.fromJson(
              json['LimitExceededException'] as Map<String, dynamic>)
          : null,
      serviceUnavailableException: json['ServiceUnavailableException'] != null
          ? ServiceUnavailableException.fromJson(
              json['ServiceUnavailableException'] as Map<String, dynamic>)
          : null,
      utteranceEvent: json['UtteranceEvent'] != null
          ? UtteranceEvent.fromJson(
              json['UtteranceEvent'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final badRequestException = this.badRequestException;
    final categoryEvent = this.categoryEvent;
    final conflictException = this.conflictException;
    final internalFailureException = this.internalFailureException;
    final limitExceededException = this.limitExceededException;
    final serviceUnavailableException = this.serviceUnavailableException;
    final utteranceEvent = this.utteranceEvent;
    return {
      if (badRequestException != null)
        'BadRequestException': badRequestException,
      if (categoryEvent != null) 'CategoryEvent': categoryEvent,
      if (conflictException != null) 'ConflictException': conflictException,
      if (internalFailureException != null)
        'InternalFailureException': internalFailureException,
      if (limitExceededException != null)
        'LimitExceededException': limitExceededException,
      if (serviceUnavailableException != null)
        'ServiceUnavailableException': serviceUnavailableException,
      if (utteranceEvent != null) 'UtteranceEvent': utteranceEvent,
    };
  }
}

/// Contains set of transcription results from one or more audio segments, along
/// with additional information about the parameters included in your request.
/// For example, channel definitions, partial result stabilization, sentiment,
/// and issue detection.
///
/// @nodoc
class UtteranceEvent {
  /// The time, in milliseconds, from the beginning of the audio stream to the
  /// start of the <code>UtteranceEvent</code>.
  final int? beginOffsetMillis;

  /// The time, in milliseconds, from the beginning of the audio stream to the
  /// start of the <code>UtteranceEvent</code>.
  final int? endOffsetMillis;

  /// Contains entities identified as personally identifiable information (PII) in
  /// your transcription output.
  final List<CallAnalyticsEntity>? entities;

  /// Indicates whether the segment in the <code>UtteranceEvent</code> is complete
  /// (<code>FALSE</code>) or partial (<code>TRUE</code>).
  final bool? isPartial;

  /// Provides the issue that was detected in the specified segment.
  final List<IssueDetected>? issuesDetected;

  /// Contains words, phrases, or punctuation marks that are associated with the
  /// specified <code>UtteranceEvent</code>.
  final List<CallAnalyticsItem>? items;

  /// The language code that represents the language spoken in your audio stream.
  final CallAnalyticsLanguageCode? languageCode;

  /// The language code of the dominant language identified in your stream.
  final List<CallAnalyticsLanguageWithScore>? languageIdentification;

  /// Provides the role of the speaker for each audio channel, either
  /// <code>CUSTOMER</code> or <code>AGENT</code>.
  final ParticipantRole? participantRole;

  /// Provides the sentiment that was detected in the specified segment.
  final Sentiment? sentiment;

  /// Contains transcribed text.
  final String? transcript;

  /// The unique identifier that is associated with the specified
  /// <code>UtteranceEvent</code>.
  final String? utteranceId;

  UtteranceEvent({
    this.beginOffsetMillis,
    this.endOffsetMillis,
    this.entities,
    this.isPartial,
    this.issuesDetected,
    this.items,
    this.languageCode,
    this.languageIdentification,
    this.participantRole,
    this.sentiment,
    this.transcript,
    this.utteranceId,
  });

  factory UtteranceEvent.fromJson(Map<String, dynamic> json) {
    return UtteranceEvent(
      beginOffsetMillis: json['BeginOffsetMillis'] as int?,
      endOffsetMillis: json['EndOffsetMillis'] as int?,
      entities: (json['Entities'] as List?)
          ?.nonNulls
          .map((e) => CallAnalyticsEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPartial: json['IsPartial'] as bool?,
      issuesDetected: (json['IssuesDetected'] as List?)
          ?.nonNulls
          .map((e) => IssueDetected.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => CallAnalyticsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      languageCode: (json['LanguageCode'] as String?)
          ?.let(CallAnalyticsLanguageCode.fromString),
      languageIdentification: (json['LanguageIdentification'] as List?)
          ?.nonNulls
          .map((e) => CallAnalyticsLanguageWithScore.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      participantRole:
          (json['ParticipantRole'] as String?)?.let(ParticipantRole.fromString),
      sentiment: (json['Sentiment'] as String?)?.let(Sentiment.fromString),
      transcript: json['Transcript'] as String?,
      utteranceId: json['UtteranceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetMillis = this.beginOffsetMillis;
    final endOffsetMillis = this.endOffsetMillis;
    final entities = this.entities;
    final isPartial = this.isPartial;
    final issuesDetected = this.issuesDetected;
    final items = this.items;
    final languageCode = this.languageCode;
    final languageIdentification = this.languageIdentification;
    final participantRole = this.participantRole;
    final sentiment = this.sentiment;
    final transcript = this.transcript;
    final utteranceId = this.utteranceId;
    return {
      if (beginOffsetMillis != null) 'BeginOffsetMillis': beginOffsetMillis,
      if (endOffsetMillis != null) 'EndOffsetMillis': endOffsetMillis,
      if (entities != null) 'Entities': entities,
      if (isPartial != null) 'IsPartial': isPartial,
      if (issuesDetected != null) 'IssuesDetected': issuesDetected,
      if (items != null) 'Items': items,
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (languageIdentification != null)
        'LanguageIdentification': languageIdentification,
      if (participantRole != null) 'ParticipantRole': participantRole.value,
      if (sentiment != null) 'Sentiment': sentiment.value,
      if (transcript != null) 'Transcript': transcript,
      if (utteranceId != null) 'UtteranceId': utteranceId,
    };
  }
}

/// Provides information on any <code>TranscriptFilterType</code> categories
/// that matched your transcription output. Matches are identified for each
/// segment upon completion of that segment.
///
/// @nodoc
class CategoryEvent {
  /// Lists the categories that were matched in your audio segment.
  final List<String>? matchedCategories;

  /// Contains information about the matched categories, including category names
  /// and timestamps.
  final Map<String, PointsOfInterest>? matchedDetails;

  CategoryEvent({
    this.matchedCategories,
    this.matchedDetails,
  });

  factory CategoryEvent.fromJson(Map<String, dynamic> json) {
    return CategoryEvent(
      matchedCategories: (json['MatchedCategories'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      matchedDetails: (json['MatchedDetails'] as Map<String, dynamic>?)?.map((k,
              e) =>
          MapEntry(k, PointsOfInterest.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final matchedCategories = this.matchedCategories;
    final matchedDetails = this.matchedDetails;
    return {
      if (matchedCategories != null) 'MatchedCategories': matchedCategories,
      if (matchedDetails != null) 'MatchedDetails': matchedDetails,
    };
  }
}

/// Contains the timestamps of matched categories.
///
/// @nodoc
class PointsOfInterest {
  /// Contains the timestamp ranges (start time through end time) of matched
  /// categories and rules.
  final List<TimestampRange>? timestampRanges;

  PointsOfInterest({
    this.timestampRanges,
  });

  factory PointsOfInterest.fromJson(Map<String, dynamic> json) {
    return PointsOfInterest(
      timestampRanges: (json['TimestampRanges'] as List?)
          ?.nonNulls
          .map((e) => TimestampRange.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final timestampRanges = this.timestampRanges;
    return {
      if (timestampRanges != null) 'TimestampRanges': timestampRanges,
    };
  }
}

/// Contains the timestamp range (start time through end time) of a matched
/// category.
///
/// @nodoc
class TimestampRange {
  /// The time, in milliseconds, from the beginning of the audio stream to the
  /// start of the category match.
  final int? beginOffsetMillis;

  /// The time, in milliseconds, from the beginning of the audio stream to the end
  /// of the category match.
  final int? endOffsetMillis;

  TimestampRange({
    this.beginOffsetMillis,
    this.endOffsetMillis,
  });

  factory TimestampRange.fromJson(Map<String, dynamic> json) {
    return TimestampRange(
      beginOffsetMillis: json['BeginOffsetMillis'] as int?,
      endOffsetMillis: json['EndOffsetMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetMillis = this.beginOffsetMillis;
    final endOffsetMillis = this.endOffsetMillis;
    return {
      if (beginOffsetMillis != null) 'BeginOffsetMillis': beginOffsetMillis,
      if (endOffsetMillis != null) 'EndOffsetMillis': endOffsetMillis,
    };
  }
}

/// @nodoc
class Sentiment {
  static const positive = Sentiment._('POSITIVE');
  static const negative = Sentiment._('NEGATIVE');
  static const mixed = Sentiment._('MIXED');
  static const neutral = Sentiment._('NEUTRAL');

  final String value;

  const Sentiment._(this.value);

  static const values = [positive, negative, mixed, neutral];

  static Sentiment fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Sentiment._(value));

  @override
  bool operator ==(other) => other is Sentiment && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The language code that represents the language identified in your audio,
/// including the associated confidence score.
///
/// @nodoc
class CallAnalyticsLanguageWithScore {
  /// The language code of the identified language.
  final CallAnalyticsLanguageCode? languageCode;

  /// The confidence score associated with the identified language code.
  /// Confidence scores are values between zero and one; larger values indicate a
  /// higher confidence in the identified language.
  final double? score;

  CallAnalyticsLanguageWithScore({
    this.languageCode,
    this.score,
  });

  factory CallAnalyticsLanguageWithScore.fromJson(Map<String, dynamic> json) {
    return CallAnalyticsLanguageWithScore(
      languageCode: (json['LanguageCode'] as String?)
          ?.let(CallAnalyticsLanguageCode.fromString),
      score: json['Score'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final score = this.score;
    return {
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (score != null) 'Score': score,
    };
  }
}

/// Lists the issues that were identified in your audio segment.
///
/// @nodoc
class IssueDetected {
  /// Provides the timestamps that identify when in an audio segment the specified
  /// issue occurs.
  final CharacterOffsets? characterOffsets;

  IssueDetected({
    this.characterOffsets,
  });

  factory IssueDetected.fromJson(Map<String, dynamic> json) {
    return IssueDetected(
      characterOffsets: json['CharacterOffsets'] != null
          ? CharacterOffsets.fromJson(
              json['CharacterOffsets'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final characterOffsets = this.characterOffsets;
    return {
      if (characterOffsets != null) 'CharacterOffsets': characterOffsets,
    };
  }
}

/// Provides the location, using character count, in your transcript where a
/// match is identified. For example, the location of an issue or a category
/// match within a segment.
///
/// @nodoc
class CharacterOffsets {
  /// Provides the character count of the first character where a match is
  /// identified. For example, the first character associated with an issue or a
  /// category match in a segment transcript.
  final int? begin;

  /// Provides the character count of the last character where a match is
  /// identified. For example, the last character associated with an issue or a
  /// category match in a segment transcript.
  final int? end;

  CharacterOffsets({
    this.begin,
    this.end,
  });

  factory CharacterOffsets.fromJson(Map<String, dynamic> json) {
    return CharacterOffsets(
      begin: json['Begin'] as int?,
      end: json['End'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final begin = this.begin;
    final end = this.end;
    return {
      if (begin != null) 'Begin': begin,
      if (end != null) 'End': end,
    };
  }
}

/// Contains entities identified as personally identifiable information (PII) in
/// your transcription output, along with various associated attributes.
/// Examples include category, confidence score, content, type, and start and
/// end times.
///
/// @nodoc
class CallAnalyticsEntity {
  /// The time, in milliseconds, from the beginning of the audio stream to the
  /// start of the identified entity.
  final int? beginOffsetMillis;

  /// The category of information identified. For example, <code>PII</code>.
  final String? category;

  /// The confidence score associated with the identification of an entity in your
  /// transcript.
  ///
  /// Confidence scores are values between 0 and 1. A larger value indicates a
  /// higher probability that the identified entity correctly matches the entity
  /// spoken in your media.
  final double? confidence;

  /// The word or words that represent the identified entity.
  final String? content;

  /// The time, in milliseconds, from the beginning of the audio stream to the end
  /// of the identified entity.
  final int? endOffsetMillis;

  /// The type of PII identified. For example, <code>NAME</code> or
  /// <code>CREDIT_DEBIT_NUMBER</code>.
  final String? type;

  CallAnalyticsEntity({
    this.beginOffsetMillis,
    this.category,
    this.confidence,
    this.content,
    this.endOffsetMillis,
    this.type,
  });

  factory CallAnalyticsEntity.fromJson(Map<String, dynamic> json) {
    return CallAnalyticsEntity(
      beginOffsetMillis: json['BeginOffsetMillis'] as int?,
      category: json['Category'] as String?,
      confidence: json['Confidence'] as double?,
      content: json['Content'] as String?,
      endOffsetMillis: json['EndOffsetMillis'] as int?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetMillis = this.beginOffsetMillis;
    final category = this.category;
    final confidence = this.confidence;
    final content = this.content;
    final endOffsetMillis = this.endOffsetMillis;
    final type = this.type;
    return {
      if (beginOffsetMillis != null) 'BeginOffsetMillis': beginOffsetMillis,
      if (category != null) 'Category': category,
      if (confidence != null) 'Confidence': confidence,
      if (content != null) 'Content': content,
      if (endOffsetMillis != null) 'EndOffsetMillis': endOffsetMillis,
      if (type != null) 'Type': type,
    };
  }
}

/// A word, phrase, or punctuation mark in your Call Analytics transcription
/// output, along with various associated attributes, such as confidence score,
/// type, and start and end times.
///
/// @nodoc
class CallAnalyticsItem {
  /// The time, in milliseconds, from the beginning of the audio stream to the
  /// start of the identified item.
  final int? beginOffsetMillis;

  /// The confidence score associated with a word or phrase in your transcript.
  ///
  /// Confidence scores are values between 0 and 1. A larger value indicates a
  /// higher probability that the identified item correctly matches the item
  /// spoken in your media.
  final double? confidence;

  /// The word or punctuation that was transcribed.
  final String? content;

  /// The time, in milliseconds, from the beginning of the audio stream to the end
  /// of the identified item.
  final int? endOffsetMillis;

  /// If partial result stabilization is enabled, <code>Stable</code> indicates
  /// whether the specified item is stable (<code>true</code>) or if it may change
  /// when the segment is complete (<code>false</code>).
  final bool? stable;

  /// The type of item identified. Options are: <code>PRONUNCIATION</code> (spoken
  /// words) and <code>PUNCTUATION</code>.
  final ItemType? type;

  /// Indicates whether the specified item matches a word in the vocabulary filter
  /// included in your Call Analytics request. If <code>true</code>, there is a
  /// vocabulary filter match.
  final bool? vocabularyFilterMatch;

  CallAnalyticsItem({
    this.beginOffsetMillis,
    this.confidence,
    this.content,
    this.endOffsetMillis,
    this.stable,
    this.type,
    this.vocabularyFilterMatch,
  });

  factory CallAnalyticsItem.fromJson(Map<String, dynamic> json) {
    return CallAnalyticsItem(
      beginOffsetMillis: json['BeginOffsetMillis'] as int?,
      confidence: json['Confidence'] as double?,
      content: json['Content'] as String?,
      endOffsetMillis: json['EndOffsetMillis'] as int?,
      stable: json['Stable'] as bool?,
      type: (json['Type'] as String?)?.let(ItemType.fromString),
      vocabularyFilterMatch: json['VocabularyFilterMatch'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final beginOffsetMillis = this.beginOffsetMillis;
    final confidence = this.confidence;
    final content = this.content;
    final endOffsetMillis = this.endOffsetMillis;
    final stable = this.stable;
    final type = this.type;
    final vocabularyFilterMatch = this.vocabularyFilterMatch;
    return {
      if (beginOffsetMillis != null) 'BeginOffsetMillis': beginOffsetMillis,
      if (confidence != null) 'Confidence': confidence,
      if (content != null) 'Content': content,
      if (endOffsetMillis != null) 'EndOffsetMillis': endOffsetMillis,
      if (stable != null) 'Stable': stable,
      if (type != null) 'Type': type.value,
      if (vocabularyFilterMatch != null)
        'VocabularyFilterMatch': vocabularyFilterMatch,
    };
  }
}

/// Contains details about a Amazon Web Services HealthScribe streaming session.
///
/// @nodoc
class MedicalScribeStreamDetails {
  /// The Channel Definitions of the HealthScribe streaming session.
  final List<MedicalScribeChannelDefinition>? channelDefinitions;

  /// The Encryption Settings of the HealthScribe streaming session.
  final MedicalScribeEncryptionSettings? encryptionSettings;

  /// The Language Code of the HealthScribe streaming session.
  final MedicalScribeLanguageCode? languageCode;

  /// The Media Encoding of the HealthScribe streaming session.
  final MedicalScribeMediaEncoding? mediaEncoding;

  /// The sample rate (in hertz) of the HealthScribe streaming session.
  final int? mediaSampleRateHertz;

  /// Indicates whether the <code>MedicalScribeContext</code> object was provided
  /// when the stream was started.
  final bool? medicalScribeContextProvided;

  /// The result of post-stream analytics for the HealthScribe streaming session.
  final MedicalScribePostStreamAnalyticsResult? postStreamAnalyticsResult;

  /// The post-stream analytics settings of the HealthScribe streaming session.
  final MedicalScribePostStreamAnalyticsSettings? postStreamAnalyticsSettings;

  /// The Amazon Resource Name (ARN) of the role used in the HealthScribe
  /// streaming session.
  final String? resourceAccessRoleArn;

  /// The identifier of the HealthScribe streaming session.
  final String? sessionId;

  /// The date and time when the HealthScribe streaming session was created.
  final DateTime? streamCreatedAt;

  /// The date and time when the HealthScribe streaming session was ended.
  final DateTime? streamEndedAt;

  /// The streaming status of the HealthScribe streaming session.
  ///
  /// Possible Values:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code>
  /// </li>
  /// <li>
  /// <code>PAUSED</code>
  /// </li>
  /// <li>
  /// <code>FAILED</code>
  /// </li>
  /// <li>
  /// <code>COMPLETED</code>
  /// </li>
  /// </ul> <note>
  /// This status is specific to real-time streaming. A <code>COMPLETED</code>
  /// status doesn't mean that the post-stream analytics is complete. To get
  /// status of an analytics result, check the <code>Status</code> field for the
  /// analytics result within the
  /// <code>MedicalScribePostStreamAnalyticsResult</code>. For example, you can
  /// view the status of the <code>ClinicalNoteGenerationResult</code>.
  /// </note>
  final MedicalScribeStreamStatus? streamStatus;

  /// The method of the vocabulary filter for the HealthScribe streaming session.
  final MedicalScribeVocabularyFilterMethod? vocabularyFilterMethod;

  /// The name of the vocabulary filter used for the HealthScribe streaming
  /// session .
  final String? vocabularyFilterName;

  /// The vocabulary name of the HealthScribe streaming session.
  final String? vocabularyName;

  MedicalScribeStreamDetails({
    this.channelDefinitions,
    this.encryptionSettings,
    this.languageCode,
    this.mediaEncoding,
    this.mediaSampleRateHertz,
    this.medicalScribeContextProvided,
    this.postStreamAnalyticsResult,
    this.postStreamAnalyticsSettings,
    this.resourceAccessRoleArn,
    this.sessionId,
    this.streamCreatedAt,
    this.streamEndedAt,
    this.streamStatus,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyName,
  });

  factory MedicalScribeStreamDetails.fromJson(Map<String, dynamic> json) {
    return MedicalScribeStreamDetails(
      channelDefinitions: (json['ChannelDefinitions'] as List?)
          ?.nonNulls
          .map((e) => MedicalScribeChannelDefinition.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      encryptionSettings: json['EncryptionSettings'] != null
          ? MedicalScribeEncryptionSettings.fromJson(
              json['EncryptionSettings'] as Map<String, dynamic>)
          : null,
      languageCode: (json['LanguageCode'] as String?)
          ?.let(MedicalScribeLanguageCode.fromString),
      mediaEncoding: (json['MediaEncoding'] as String?)
          ?.let(MedicalScribeMediaEncoding.fromString),
      mediaSampleRateHertz: json['MediaSampleRateHertz'] as int?,
      medicalScribeContextProvided:
          json['MedicalScribeContextProvided'] as bool?,
      postStreamAnalyticsResult: json['PostStreamAnalyticsResult'] != null
          ? MedicalScribePostStreamAnalyticsResult.fromJson(
              json['PostStreamAnalyticsResult'] as Map<String, dynamic>)
          : null,
      postStreamAnalyticsSettings: json['PostStreamAnalyticsSettings'] != null
          ? MedicalScribePostStreamAnalyticsSettings.fromJson(
              json['PostStreamAnalyticsSettings'] as Map<String, dynamic>)
          : null,
      resourceAccessRoleArn: json['ResourceAccessRoleArn'] as String?,
      sessionId: json['SessionId'] as String?,
      streamCreatedAt: timeStampFromJson(json['StreamCreatedAt']),
      streamEndedAt: timeStampFromJson(json['StreamEndedAt']),
      streamStatus: (json['StreamStatus'] as String?)
          ?.let(MedicalScribeStreamStatus.fromString),
      vocabularyFilterMethod: (json['VocabularyFilterMethod'] as String?)
          ?.let(MedicalScribeVocabularyFilterMethod.fromString),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelDefinitions = this.channelDefinitions;
    final encryptionSettings = this.encryptionSettings;
    final languageCode = this.languageCode;
    final mediaEncoding = this.mediaEncoding;
    final mediaSampleRateHertz = this.mediaSampleRateHertz;
    final medicalScribeContextProvided = this.medicalScribeContextProvided;
    final postStreamAnalyticsResult = this.postStreamAnalyticsResult;
    final postStreamAnalyticsSettings = this.postStreamAnalyticsSettings;
    final resourceAccessRoleArn = this.resourceAccessRoleArn;
    final sessionId = this.sessionId;
    final streamCreatedAt = this.streamCreatedAt;
    final streamEndedAt = this.streamEndedAt;
    final streamStatus = this.streamStatus;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyName = this.vocabularyName;
    return {
      if (channelDefinitions != null) 'ChannelDefinitions': channelDefinitions,
      if (encryptionSettings != null) 'EncryptionSettings': encryptionSettings,
      if (languageCode != null) 'LanguageCode': languageCode.value,
      if (mediaEncoding != null) 'MediaEncoding': mediaEncoding.value,
      if (mediaSampleRateHertz != null)
        'MediaSampleRateHertz': mediaSampleRateHertz,
      if (medicalScribeContextProvided != null)
        'MedicalScribeContextProvided': medicalScribeContextProvided,
      if (postStreamAnalyticsResult != null)
        'PostStreamAnalyticsResult': postStreamAnalyticsResult,
      if (postStreamAnalyticsSettings != null)
        'PostStreamAnalyticsSettings': postStreamAnalyticsSettings,
      if (resourceAccessRoleArn != null)
        'ResourceAccessRoleArn': resourceAccessRoleArn,
      if (sessionId != null) 'SessionId': sessionId,
      if (streamCreatedAt != null)
        'StreamCreatedAt': unixTimestampToJson(streamCreatedAt),
      if (streamEndedAt != null)
        'StreamEndedAt': unixTimestampToJson(streamEndedAt),
      if (streamStatus != null) 'StreamStatus': streamStatus.value,
      if (vocabularyFilterMethod != null)
        'VocabularyFilterMethod': vocabularyFilterMethod.value,
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

/// @nodoc
class MedicalScribeStreamStatus {
  static const inProgress = MedicalScribeStreamStatus._('IN_PROGRESS');
  static const paused = MedicalScribeStreamStatus._('PAUSED');
  static const failed = MedicalScribeStreamStatus._('FAILED');
  static const completed = MedicalScribeStreamStatus._('COMPLETED');

  final String value;

  const MedicalScribeStreamStatus._(this.value);

  static const values = [inProgress, paused, failed, completed];

  static MedicalScribeStreamStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MedicalScribeStreamStatus._(value));

  @override
  bool operator ==(other) =>
      other is MedicalScribeStreamStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains details for the result of post-stream analytics.
///
/// @nodoc
class MedicalScribePostStreamAnalyticsResult {
  /// Provides the Clinical Note Generation result for post-stream analytics.
  final ClinicalNoteGenerationResult? clinicalNoteGenerationResult;

  MedicalScribePostStreamAnalyticsResult({
    this.clinicalNoteGenerationResult,
  });

  factory MedicalScribePostStreamAnalyticsResult.fromJson(
      Map<String, dynamic> json) {
    return MedicalScribePostStreamAnalyticsResult(
      clinicalNoteGenerationResult: json['ClinicalNoteGenerationResult'] != null
          ? ClinicalNoteGenerationResult.fromJson(
              json['ClinicalNoteGenerationResult'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clinicalNoteGenerationResult = this.clinicalNoteGenerationResult;
    return {
      if (clinicalNoteGenerationResult != null)
        'ClinicalNoteGenerationResult': clinicalNoteGenerationResult,
    };
  }
}

/// The details for clinical note generation, including status, and output
/// locations for clinical note and aggregated transcript if the analytics
/// completed, or failure reason if the analytics failed.
///
/// @nodoc
class ClinicalNoteGenerationResult {
  /// Holds the Amazon S3 URI for the output Clinical Note.
  final String? clinicalNoteOutputLocation;

  /// If <code>ClinicalNoteGenerationResult</code> is <code>FAILED</code>,
  /// information about why it failed.
  final String? failureReason;

  /// The status of the clinical note generation.
  ///
  /// Possible Values:
  ///
  /// <ul>
  /// <li>
  /// <code>IN_PROGRESS</code>
  /// </li>
  /// <li>
  /// <code>FAILED</code>
  /// </li>
  /// <li>
  /// <code>COMPLETED</code>
  /// </li>
  /// </ul>
  /// After audio streaming finishes, and you send a
  /// <code>MedicalScribeSessionControlEvent</code> event (with END_OF_SESSION as
  /// the Type), the status is set to <code>IN_PROGRESS</code>. If the status is
  /// <code>COMPLETED</code>, the analytics completed successfully, and you can
  /// find the results at the locations specified in
  /// <code>ClinicalNoteOutputLocation</code> and
  /// <code>TranscriptOutputLocation</code>. If the status is <code>FAILED</code>,
  /// <code>FailureReason</code> provides details about the failure.
  final ClinicalNoteGenerationStatus? status;

  /// Holds the Amazon S3 URI for the output Transcript.
  final String? transcriptOutputLocation;

  ClinicalNoteGenerationResult({
    this.clinicalNoteOutputLocation,
    this.failureReason,
    this.status,
    this.transcriptOutputLocation,
  });

  factory ClinicalNoteGenerationResult.fromJson(Map<String, dynamic> json) {
    return ClinicalNoteGenerationResult(
      clinicalNoteOutputLocation: json['ClinicalNoteOutputLocation'] as String?,
      failureReason: json['FailureReason'] as String?,
      status: (json['Status'] as String?)
          ?.let(ClinicalNoteGenerationStatus.fromString),
      transcriptOutputLocation: json['TranscriptOutputLocation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clinicalNoteOutputLocation = this.clinicalNoteOutputLocation;
    final failureReason = this.failureReason;
    final status = this.status;
    final transcriptOutputLocation = this.transcriptOutputLocation;
    return {
      if (clinicalNoteOutputLocation != null)
        'ClinicalNoteOutputLocation': clinicalNoteOutputLocation,
      if (failureReason != null) 'FailureReason': failureReason,
      if (status != null) 'Status': status.value,
      if (transcriptOutputLocation != null)
        'TranscriptOutputLocation': transcriptOutputLocation,
    };
  }
}

/// @nodoc
class ClinicalNoteGenerationStatus {
  static const inProgress = ClinicalNoteGenerationStatus._('IN_PROGRESS');
  static const failed = ClinicalNoteGenerationStatus._('FAILED');
  static const completed = ClinicalNoteGenerationStatus._('COMPLETED');

  final String value;

  const ClinicalNoteGenerationStatus._(this.value);

  static const values = [inProgress, failed, completed];

  static ClinicalNoteGenerationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClinicalNoteGenerationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ClinicalNoteGenerationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(message: message),
  'ConflictException': (type, message) => ConflictException(message: message),
  'InternalFailureException': (type, message) =>
      InternalFailureException(message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(message: message),
};
