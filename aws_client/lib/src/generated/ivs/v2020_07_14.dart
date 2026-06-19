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

/// <b>Introduction</b>
///
/// The Amazon Interactive Video Service (IVS) API is REST compatible, using a
/// standard HTTP API and an Amazon Web Services EventBridge event stream for
/// responses. JSON is used for both requests and responses, including errors.
///
/// The API is an Amazon Web Services regional service. For a list of supported
/// regions and Amazon IVS HTTPS service endpoints, see the <a
/// href="https://docs.aws.amazon.com/general/latest/gr/ivs.html">Amazon IVS
/// page</a> in the <i>Amazon Web Services General Reference</i>.
///
/// <i> <b>All API request parameters and URLs are case sensitive. </b> </i>
///
/// For a summary of notable documentation changes in each release, see <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/doc-history.html">
/// Document History</a>.
///
/// <b>Allowed Header Values</b>
///
/// <ul>
/// <li>
/// <code> <b>Accept:</b> </code> application/json
/// </li>
/// <li>
/// <code> <b>Accept-Encoding:</b> </code> gzip, deflate
/// </li>
/// <li>
/// <code> <b>Content-Type:</b> </code>application/json
/// </li>
/// </ul>
/// <b>Key Concepts</b>
///
/// <ul>
/// <li>
/// <b>Channel</b> — Stores configuration data related to your live stream. You
/// first create a channel and then use the channel’s stream key to start your
/// live stream.
/// </li>
/// <li>
/// <b>Stream key</b> — An identifier assigned by Amazon IVS when you create a
/// channel, which is then used to authorize streaming. <i> <b>Treat the stream
/// key like a secret, since it allows anyone to stream to the channel.</b> </i>
/// </li>
/// <li>
/// <b>Playback key pair</b> — Video playback may be restricted using
/// playback-authorization tokens, which use public-key encryption. A playback
/// key pair is the public-private pair of keys used to sign and validate the
/// playback-authorization token.
/// </li>
/// <li>
/// <b>Recording configuration</b> — Stores configuration related to recording a
/// live stream and where to store the recorded content. Multiple channels can
/// reference the same recording configuration.
/// </li>
/// <li>
/// <b>Playback restriction policy</b> — Restricts playback by countries and/or
/// origin sites.
/// </li>
/// </ul>
/// For more information about your IVS live stream, also see <a
/// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/getting-started.html">Getting
/// Started with IVS Low-Latency Streaming</a>.
///
/// <b>Tagging</b>
///
/// A <i>tag</i> is a metadata label that you assign to an Amazon Web Services
/// resource. A tag comprises a <i>key</i> and a <i>value</i>, both set by you.
/// For example, you might set a tag as <code>topic:nature</code> to label a
/// particular video category. See <a
/// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
/// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
/// Tag Editor</i> for details, including restrictions that apply to tags and
/// "Tag naming limits and requirements"; Amazon IVS has no service-specific
/// constraints beyond what is documented there.
///
/// Tags can help you identify and organize your Amazon Web Services resources.
/// For example, you can use the same tag for different resources to indicate
/// that they are related. You can also use tags to manage access (see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">
/// Access Tags</a>).
///
/// The Amazon IVS API has these tag-related operations: <a>TagResource</a>,
/// <a>UntagResource</a>, and <a>ListTagsForResource</a>. The following
/// resources support tagging: Channels, Stream Keys, Playback Key Pairs, and
/// Recording Configurations.
///
/// At most 50 tags can be applied to a resource.
///
/// <b>Authentication versus Authorization</b>
///
/// Note the differences between these concepts:
///
/// <ul>
/// <li>
/// <i>Authentication</i> is about verifying identity. You need to be
/// authenticated to sign Amazon IVS API requests.
/// </li>
/// <li>
/// <i>Authorization</i> is about granting permissions. Your IAM roles need to
/// have permissions for Amazon IVS API requests. In addition, authorization is
/// needed to view <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Amazon
/// IVS private channels</a>. (Private channels are channels that are enabled
/// for "playback authorization.")
/// </li>
/// </ul>
/// <b>Authentication</b>
///
/// All Amazon IVS API requests must be authenticated with a signature. The
/// Amazon Web Services Command-Line Interface (CLI) and Amazon IVS Player SDKs
/// take care of signing the underlying API calls for you. However, if your
/// application calls the Amazon IVS API directly, it’s your responsibility to
/// sign the requests.
///
/// You generate a signature using valid Amazon Web Services credentials that
/// have permission to perform the requested action. For example, you must sign
/// PutMetadata requests with a signature generated from a user account that has
/// the <code>ivs:PutMetadata</code> permission.
///
/// For more information:
///
/// <ul>
/// <li>
/// Authentication and generating signatures — See <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
/// Requests (Amazon Web Services Signature Version 4)</a> in the <i>Amazon Web
/// Services General Reference</i>.
/// </li>
/// <li>
/// Managing Amazon IVS permissions — See <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/security-iam.html">Identity
/// and Access Management</a> on the Security page of the <i>Amazon IVS User
/// Guide</i>.
/// </li>
/// </ul>
/// <b>Amazon Resource Names (ARNs)</b>
///
/// ARNs uniquely identify AWS resources. An ARN is required when you need to
/// specify a resource unambiguously across all of AWS, such as in IAM policies
/// and API calls. For more information, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws-arns-and-namespaces.html">Amazon
/// Resource Names</a> in the <i>AWS General Reference</i>.
class Ivs {
  final _s.RestJsonProtocol _protocol;
  Ivs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ivs',
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

  /// Performs <a>GetChannel</a> on multiple ARNs simultaneously.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ServiceUnavailable].
  /// May throw [ValidationException].
  ///
  /// Parameter [arns] :
  /// Array of ARNs, one per channel.
  Future<BatchGetChannelResponse> batchGetChannel({
    required List<String> arns,
  }) async {
    final $payload = <String, dynamic>{
      'arns': arns,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetChannel',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return BatchGetChannelResponse(
      channels: ($json['channels'] as List?)
          ?.nonNulls
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: ($json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessControlAllowOrigin: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Allow-Origin'),
      accessControlExposeHeaders: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Expose-Headers'),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentSecurityPolicy: _s.extractHeaderStringValue(
          response.headers, 'Content-Security-Policy'),
      strictTransportSecurity: _s.extractHeaderStringValue(
          response.headers, 'Strict-Transport-Security'),
      xContentTypeOptions: _s.extractHeaderStringValue(
          response.headers, 'X-Content-Type-Options'),
      xFrameOptions:
          _s.extractHeaderStringValue(response.headers, 'X-Frame-Options'),
    );
  }

  /// Performs <a>GetStreamKey</a> on multiple ARNs simultaneously.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ServiceUnavailable].
  /// May throw [ValidationException].
  ///
  /// Parameter [arns] :
  /// Array of ARNs, one per stream key.
  Future<BatchGetStreamKeyResponse> batchGetStreamKey({
    required List<String> arns,
  }) async {
    final $payload = <String, dynamic>{
      'arns': arns,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetStreamKey',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return BatchGetStreamKeyResponse(
      errors: ($json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
      streamKeys: ($json['streamKeys'] as List?)
          ?.nonNulls
          .map((e) => StreamKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      accessControlAllowOrigin: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Allow-Origin'),
      accessControlExposeHeaders: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Expose-Headers'),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentSecurityPolicy: _s.extractHeaderStringValue(
          response.headers, 'Content-Security-Policy'),
      strictTransportSecurity: _s.extractHeaderStringValue(
          response.headers, 'Strict-Transport-Security'),
      xContentTypeOptions: _s.extractHeaderStringValue(
          response.headers, 'X-Content-Type-Options'),
      xFrameOptions:
          _s.extractHeaderStringValue(response.headers, 'X-Frame-Options'),
    );
  }

  /// Performs <a>StartViewerSessionRevocation</a> on multiple channel ARN and
  /// viewer ID pairs simultaneously.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [viewerSessions] :
  /// Array of viewer sessions, one per channel-ARN and viewer-ID pair.
  Future<BatchStartViewerSessionRevocationResponse>
      batchStartViewerSessionRevocation({
    required List<BatchStartViewerSessionRevocationViewerSession>
        viewerSessions,
  }) async {
    final $payload = <String, dynamic>{
      'viewerSessions': viewerSessions,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchStartViewerSessionRevocation',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return BatchStartViewerSessionRevocationResponse(
      errors: ($json['errors'] as List?)
          ?.nonNulls
          .map((e) => BatchStartViewerSessionRevocationError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      accessControlAllowOrigin: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Allow-Origin'),
      accessControlExposeHeaders: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Expose-Headers'),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentSecurityPolicy: _s.extractHeaderStringValue(
          response.headers, 'Content-Security-Policy'),
      strictTransportSecurity: _s.extractHeaderStringValue(
          response.headers, 'Strict-Transport-Security'),
      xContentTypeOptions: _s.extractHeaderStringValue(
          response.headers, 'X-Content-Type-Options'),
      xFrameOptions:
          _s.extractHeaderStringValue(response.headers, 'X-Frame-Options'),
    );
  }

  /// Creates a new ad configuration to be used for server-side ad insertion.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [mediaTailorPlaybackConfigurations] :
  /// List of integration configurations with MediaTailor resources. The first
  /// item in the list is the default playback configuration used for the ad
  /// configuration. To select a different configuration per viewing session,
  /// see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/private-channels-generate-tokens.html">Generate
  /// and Sign IVS Playback Tokens</a>.
  ///
  /// Parameter [name] :
  /// Ad configuration name. Defaults to “”.
  ///
  /// Parameter [tags] :
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources
  /// and Tag Editor</i> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no
  /// service-specific constraints beyond what is documented there.
  Future<CreateAdConfigurationResponse> createAdConfiguration({
    required List<MediaTailorPlaybackConfiguration>
        mediaTailorPlaybackConfigurations,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'mediaTailorPlaybackConfigurations': mediaTailorPlaybackConfigurations,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateAdConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAdConfigurationResponse.fromJson(response);
  }

  /// Creates a new channel and an associated stream key to start streaming.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [adConfigurationArn] :
  /// ARN of the ad configuration associated with the channel.
  ///
  /// Parameter [authorized] :
  /// Whether the channel is private (enabled for playback authorization).
  /// Default: <code>false</code>.
  ///
  /// Parameter [containerFormat] :
  /// Indicates which content-packaging format is used (MPEG-TS or fMP4). If
  /// <code>multitrackInputConfiguration</code> is specified and
  /// <code>enabled</code> is <code>true</code>, then
  /// <code>containerFormat</code> is required and must be set to
  /// <code>FRAGMENTED_MP4</code>. Otherwise, <code>containerFormat</code> may
  /// be set to <code>TS</code> or <code>FRAGMENTED_MP4</code>. Default:
  /// <code>TS</code>.
  ///
  /// Parameter [insecureIngest] :
  /// Whether the channel allows insecure RTMP and SRT ingest. Default:
  /// <code>false</code>.
  ///
  /// Parameter [latencyMode] :
  /// Channel latency mode. Use <code>NORMAL</code> to broadcast and deliver
  /// live video up to Full HD. Use <code>LOW</code> for near-real-time
  /// interaction with viewers. Default: <code>LOW</code>.
  ///
  /// Parameter [multitrackInputConfiguration] :
  /// Object specifying multitrack input configuration. Default: no multitrack
  /// input configuration is specified.
  ///
  /// Parameter [name] :
  /// Channel name.
  ///
  /// Parameter [playbackRestrictionPolicyArn] :
  /// Playback-restriction-policy ARN. A valid ARN value here both specifies the
  /// ARN and enables playback restriction. Default: "" (empty string, no
  /// playback restriction policy is applied).
  ///
  /// Parameter [preset] :
  /// Optional transcode preset for the channel. This is selectable only for
  /// <code>ADVANCED_HD</code> and <code>ADVANCED_SD</code> channel types. For
  /// those channel types, the default <code>preset</code> is
  /// <code>HIGHER_BANDWIDTH_DELIVERY</code>. For other channel types
  /// (<code>BASIC</code> and <code>STANDARD</code>), <code>preset</code> is the
  /// empty string (<code>""</code>).
  ///
  /// Parameter [recordingConfigurationArn] :
  /// Recording-configuration ARN. A valid ARN value here both specifies the ARN
  /// and enables recording. Default: "" (empty string, recording is disabled).
  ///
  /// Parameter [tags] :
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources
  /// and Tag Editor</i> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no
  /// service-specific constraints beyond what is documented there.
  ///
  /// Parameter [type] :
  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable input resolution or bitrate, the stream probably
  /// will disconnect immediately.</i> Default: <code>STANDARD</code>. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/channel-types.html">Channel
  /// Types</a>.
  Future<CreateChannelResponse> createChannel({
    String? adConfigurationArn,
    bool? authorized,
    ContainerFormat? containerFormat,
    bool? insecureIngest,
    ChannelLatencyMode? latencyMode,
    MultitrackInputConfiguration? multitrackInputConfiguration,
    String? name,
    String? playbackRestrictionPolicyArn,
    TranscodePreset? preset,
    String? recordingConfigurationArn,
    Map<String, String>? tags,
    ChannelType? type,
  }) async {
    final $payload = <String, dynamic>{
      if (adConfigurationArn != null) 'adConfigurationArn': adConfigurationArn,
      if (authorized != null) 'authorized': authorized,
      if (containerFormat != null) 'containerFormat': containerFormat.value,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (latencyMode != null) 'latencyMode': latencyMode.value,
      if (multitrackInputConfiguration != null)
        'multitrackInputConfiguration': multitrackInputConfiguration,
      if (name != null) 'name': name,
      if (playbackRestrictionPolicyArn != null)
        'playbackRestrictionPolicyArn': playbackRestrictionPolicyArn,
      if (preset != null) 'preset': preset.value,
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateChannel',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelResponse.fromJson(response);
  }

  /// Creates a new playback restriction policy, for constraining playback by
  /// countries and/or origins.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [allowedCountries] :
  /// A list of country codes that control geoblocking restriction. Allowed
  /// values are the officially assigned <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1
  /// alpha-2</a> codes. Default: All countries (an empty array).
  ///
  /// Parameter [allowedOrigins] :
  /// A list of origin sites that control CORS restriction. Allowed values are
  /// the same as valid values of the Origin header defined at <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin">https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin</a>.
  /// Default: All origins (an empty array).
  ///
  /// Parameter [enableStrictOriginEnforcement] :
  /// Whether channel playback is constrained by origin site. Default:
  /// <code>false</code>.
  ///
  /// Parameter [name] :
  /// Playback-restriction-policy name. The value does not need to be unique.
  ///
  /// Parameter [tags] :
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources
  /// and Tag Editor</i> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no
  /// service-specific constraints beyond what is documented there.
  Future<CreatePlaybackRestrictionPolicyResponse>
      createPlaybackRestrictionPolicy({
    List<String>? allowedCountries,
    List<String>? allowedOrigins,
    bool? enableStrictOriginEnforcement,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (allowedCountries != null) 'allowedCountries': allowedCountries,
      if (allowedOrigins != null) 'allowedOrigins': allowedOrigins,
      if (enableStrictOriginEnforcement != null)
        'enableStrictOriginEnforcement': enableStrictOriginEnforcement,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreatePlaybackRestrictionPolicy',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePlaybackRestrictionPolicyResponse.fromJson(response);
  }

  /// Creates a new recording configuration, used to enable recording to Amazon
  /// S3.
  ///
  /// <b>Known issue:</b> In the us-east-1 region, if you use the Amazon Web
  /// Services CLI to create a recording configuration, it returns success even
  /// if the S3 bucket is in a different region. In this case, the
  /// <code>state</code> of the recording configuration is
  /// <code>CREATE_FAILED</code> (instead of <code>ACTIVE</code>). (In other
  /// regions, the CLI correctly returns failure if the bucket is in a different
  /// region.)
  ///
  /// <b>Workaround:</b> Ensure that your S3 bucket is in the same region as the
  /// recording configuration. If you create a recording configuration in a
  /// different region as your S3 bucket, delete that recording configuration
  /// and create a new one with an S3 bucket from the correct region.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PendingVerification].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationConfiguration] :
  /// A complex type that contains a destination configuration for where
  /// recorded video will be stored.
  ///
  /// Parameter [name] :
  /// Recording-configuration name. The value does not need to be unique.
  ///
  /// Parameter [recordingReconnectWindowSeconds] :
  /// If a broadcast disconnects and then reconnects within the specified
  /// interval, the multiple streams will be considered a single broadcast and
  /// merged together. Default: 0.
  ///
  /// Parameter [renditionConfiguration] :
  /// Object that describes which renditions should be recorded for a stream.
  ///
  /// Parameter [tags] :
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources
  /// and Tag Editor</i> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no
  /// service-specific constraints beyond what is documented there.
  ///
  /// Parameter [thumbnailConfiguration] :
  /// A complex type that allows you to enable/disable the recording of
  /// thumbnails for a live session and modify the interval at which thumbnails
  /// are generated for the live session.
  Future<CreateRecordingConfigurationResponse> createRecordingConfiguration({
    required DestinationConfiguration destinationConfiguration,
    String? name,
    int? recordingReconnectWindowSeconds,
    RenditionConfiguration? renditionConfiguration,
    Map<String, String>? tags,
    ThumbnailConfiguration? thumbnailConfiguration,
  }) async {
    _s.validateNumRange(
      'recordingReconnectWindowSeconds',
      recordingReconnectWindowSeconds,
      0,
      300,
    );
    final $payload = <String, dynamic>{
      'destinationConfiguration': destinationConfiguration,
      if (name != null) 'name': name,
      if (recordingReconnectWindowSeconds != null)
        'recordingReconnectWindowSeconds': recordingReconnectWindowSeconds,
      if (renditionConfiguration != null)
        'renditionConfiguration': renditionConfiguration,
      if (tags != null) 'tags': tags,
      if (thumbnailConfiguration != null)
        'thumbnailConfiguration': thumbnailConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateRecordingConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRecordingConfigurationResponse.fromJson(response);
  }

  /// Creates a stream key, used to initiate a stream, for the specified channel
  /// ARN.
  ///
  /// Note that <a>CreateChannel</a> creates a stream key. If you subsequently
  /// use CreateStreamKey on the same channel, it will fail because a stream key
  /// already exists and there is a limit of 1 stream key per channel. To reset
  /// the stream key on a channel, use <a>DeleteStreamKey</a> and then
  /// CreateStreamKey.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel for which to create the stream key.
  ///
  /// Parameter [tags] :
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources
  /// and Tag Editor</i> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no
  /// service-specific constraints beyond what is documented there.
  Future<CreateStreamKeyResponse> createStreamKey({
    required String channelArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateStreamKey',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStreamKeyResponse.fromJson(response);
  }

  /// Deletes the specified ad configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the ad configuration to be deleted.
  Future<void> deleteAdConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteAdConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified channel and its associated stream keys.
  ///
  /// If you try to delete a live channel, you will get an error (409
  /// ConflictException). To delete a channel that is live, call
  /// <a>StopStream</a>, wait for the Amazon EventBridge "Stream End" event (to
  /// verify that the stream's state is no longer Live), then call
  /// DeleteChannel. (See <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/eventbridge.html">
  /// Using EventBridge with Amazon IVS</a>.)
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the channel to be deleted.
  Future<void> deleteChannel({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteChannel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specified authorization key pair. This invalidates future viewer
  /// tokens generated using the key pair’s <code>privateKey</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
  /// Up Private Channels</a> in the <i>Amazon IVS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the key pair to be deleted.
  Future<void> deletePlaybackKeyPair({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeletePlaybackKeyPair',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified playback restriction policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the playback restriction policy to be deleted.
  Future<void> deletePlaybackRestrictionPolicy({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeletePlaybackRestrictionPolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the recording configuration for the specified ARN.
  ///
  /// If you try to delete a recording configuration that is associated with a
  /// channel, you will get an error (409 ConflictException). To avoid this, for
  /// all channels that reference the recording configuration, first use
  /// <a>UpdateChannel</a> to set the <code>recordingConfigurationArn</code>
  /// field to an empty string, then use DeleteRecordingConfiguration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the recording configuration to be deleted.
  Future<void> deleteRecordingConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteRecordingConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the stream key for the specified ARN, so it can no longer be used
  /// to stream.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the stream key to be deleted.
  Future<void> deleteStreamKey({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteStreamKey',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the ad configuration represented by the specified ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the ad configuration to be retrieved.
  Future<GetAdConfigurationResponse> getAdConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetAdConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetAdConfigurationResponse.fromJson(response);
  }

  /// Gets the channel configuration for the specified channel ARN. See also
  /// <a>BatchGetChannel</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the channel for which the configuration is to be retrieved.
  Future<GetChannelResponse> getChannel({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetChannel',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelResponse.fromJson(response);
  }

  /// Gets a specified playback authorization key pair and returns the
  /// <code>arn</code> and <code>fingerprint</code>. The <code>privateKey</code>
  /// held by the caller can be used to generate viewer authorization tokens, to
  /// grant viewers access to private channels. For more information, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
  /// Up Private Channels</a> in the <i>Amazon IVS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the key pair to be returned.
  Future<GetPlaybackKeyPairResponse> getPlaybackKeyPair({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetPlaybackKeyPair',
      exceptionFnMap: _exceptionFns,
    );
    return GetPlaybackKeyPairResponse.fromJson(response);
  }

  /// Gets the specified playback restriction policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the playback restriction policy to be returned.
  Future<GetPlaybackRestrictionPolicyResponse> getPlaybackRestrictionPolicy({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetPlaybackRestrictionPolicy',
      exceptionFnMap: _exceptionFns,
    );
    return GetPlaybackRestrictionPolicyResponse.fromJson(response);
  }

  /// Gets the recording configuration for the specified ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the recording configuration to be retrieved.
  Future<GetRecordingConfigurationResponse> getRecordingConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetRecordingConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetRecordingConfigurationResponse.fromJson(response);
  }

  /// Gets information about the active (live) stream on a specified channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ChannelNotBroadcasting].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// Channel ARN for stream to be accessed.
  Future<GetStreamResponse> getStream({
    required String channelArn,
  }) async {
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetStream',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamResponse.fromJson(response);
  }

  /// Gets stream-key information for a specified ARN.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN for the stream key to be retrieved.
  Future<GetStreamKeyResponse> getStreamKey({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetStreamKey',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamKeyResponse.fromJson(response);
  }

  /// Gets metadata on a specified stream.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel resource
  ///
  /// Parameter [streamId] :
  /// Unique identifier for a live or previously live stream in the specified
  /// channel. If no <code>streamId</code> is provided, this returns the most
  /// recent stream session for the channel, if it exists.
  Future<GetStreamSessionResponse> getStreamSession({
    required String channelArn,
    String? streamId,
  }) async {
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
      if (streamId != null) 'streamId': streamId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetStreamSession',
      exceptionFnMap: _exceptionFns,
    );
    return GetStreamSessionResponse.fromJson(response);
  }

  /// Imports the public portion of a new key pair and returns its
  /// <code>arn</code> and <code>fingerprint</code>. The <code>privateKey</code>
  /// can then be used to generate viewer authorization tokens, to grant viewers
  /// access to private channels. For more information, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
  /// Up Private Channels</a> in the <i>Amazon IVS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [publicKeyMaterial] :
  /// The public portion of a customer-generated key pair.
  ///
  /// Parameter [name] :
  /// Playback-key-pair name. The value does not need to be unique.
  ///
  /// Parameter [tags] :
  /// Any tags provided with the request are added to the playback key pair
  /// tags. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources
  /// and Tag Editor</i> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no
  /// service-specific constraints beyond what is documented there.
  Future<ImportPlaybackKeyPairResponse> importPlaybackKeyPair({
    required String publicKeyMaterial,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'publicKeyMaterial': publicKeyMaterial,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ImportPlaybackKeyPair',
      exceptionFnMap: _exceptionFns,
    );
    return ImportPlaybackKeyPairResponse.fromJson(response);
  }

  /// Inserts an ad marker in the playlist for the specified channel and
  /// duration using the ad configuration associated with the channel.
  ///
  /// <b>Note:</b> AWS Elemental MediaTailor (EMT), the service that handles ad
  /// requests, provides CloudWatch metrics to help you monitor the success or
  /// failure of each InsertAdBreak operation. See <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monitoring-cloudwatch-metrics.html">Monitoring
  /// AWS Elemental MediaTailor with Amazon CloudWatch</a> metrics in the <i>AWS
  /// Elemental MediaTailor User Guide</i> for details on available metrics.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ChannelNotBroadcasting].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel into which the ad break is inserted.
  ///
  /// Parameter [durationSeconds] :
  /// Duration of the ad break, in seconds.
  Future<InsertAdBreakResponse> insertAdBreak({
    required String channelArn,
    required int durationSeconds,
  }) async {
    _s.validateNumRange(
      'durationSeconds',
      durationSeconds,
      1,
      300,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
      'durationSeconds': durationSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/InsertAdBreak',
      exceptionFnMap: _exceptionFns,
    );
    return InsertAdBreakResponse.fromJson(response);
  }

  /// Gets summary information about all ad configurations in your account, in
  /// the AWS region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of ad configurations to return. Default: your service quota
  /// or 100, whichever is smaller.
  ///
  /// Parameter [nextToken] :
  /// The first ad configuration to retrieve. This is used for pagination; see
  /// the <code>nextToken</code> response field.
  Future<ListAdConfigurationsResponse> listAdConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListAdConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListAdConfigurationsResponse.fromJson(response);
  }

  /// Gets summary information about all channels in your account, in the Amazon
  /// Web Services region where the API request is processed. This list can be
  /// filtered to match a specified name or recording-configuration ARN. Filters
  /// are mutually exclusive and cannot be used together. If you try to use both
  /// filters, you will get an error (409 ConflictException).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterByAdConfigurationArn] :
  /// Filters the channel list to match the specified ad configuration ARN.
  ///
  /// Parameter [filterByName] :
  /// Filters the channel list to match the specified name.
  ///
  /// Parameter [filterByPlaybackRestrictionPolicyArn] :
  /// Filters the channel list to match the specified policy.
  ///
  /// Parameter [filterByRecordingConfigurationArn] :
  /// Filters the channel list to match the specified recording-configuration
  /// ARN.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of channels to return. Default: 100.
  ///
  /// Parameter [nextToken] :
  /// The first channel to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListChannelsResponse> listChannels({
    String? filterByAdConfigurationArn,
    String? filterByName,
    String? filterByPlaybackRestrictionPolicyArn,
    String? filterByRecordingConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filterByAdConfigurationArn != null)
        'filterByAdConfigurationArn': filterByAdConfigurationArn,
      if (filterByName != null) 'filterByName': filterByName,
      if (filterByPlaybackRestrictionPolicyArn != null)
        'filterByPlaybackRestrictionPolicyArn':
            filterByPlaybackRestrictionPolicyArn,
      if (filterByRecordingConfigurationArn != null)
        'filterByRecordingConfigurationArn': filterByRecordingConfigurationArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListChannels',
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// Gets summary information about playback key pairs. For more information,
  /// see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
  /// Up Private Channels</a> in the <i>Amazon IVS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of key pairs to return. Default: your service quota or 100,
  /// whichever is smaller.
  ///
  /// Parameter [nextToken] :
  /// The first key pair to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListPlaybackKeyPairsResponse> listPlaybackKeyPairs({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListPlaybackKeyPairs',
      exceptionFnMap: _exceptionFns,
    );
    return ListPlaybackKeyPairsResponse.fromJson(response);
  }

  /// Gets summary information about playback restriction policies.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of policies to return. Default: 1.
  ///
  /// Parameter [nextToken] :
  /// The first policy to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListPlaybackRestrictionPoliciesResponse>
      listPlaybackRestrictionPolicies({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListPlaybackRestrictionPolicies',
      exceptionFnMap: _exceptionFns,
    );
    return ListPlaybackRestrictionPoliciesResponse.fromJson(response);
  }

  /// Gets summary information about all recording configurations in your
  /// account, in the Amazon Web Services region where the API request is
  /// processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of recording configurations to return. Default: your
  /// service quota or 100, whichever is smaller.
  ///
  /// Parameter [nextToken] :
  /// The first recording configuration to retrieve. This is used for
  /// pagination; see the <code>nextToken</code> response field.
  Future<ListRecordingConfigurationsResponse> listRecordingConfigurations({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListRecordingConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListRecordingConfigurationsResponse.fromJson(response);
  }

  /// Gets summary information about stream keys for the specified channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// Channel ARN used to filter the list.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of streamKeys to return. Default: 1.
  ///
  /// Parameter [nextToken] :
  /// The first stream key to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStreamKeysResponse> listStreamKeys({
    required String channelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListStreamKeys',
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamKeysResponse.fromJson(response);
  }

  /// Gets summary information about live streams in your account, in the Amazon
  /// Web Services region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterBy] :
  /// Filters the stream list to match the specified criterion.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of streams to return. Default: 100.
  ///
  /// Parameter [nextToken] :
  /// The first stream to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStreamsResponse> listStreams({
    StreamFilters? filterBy,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (filterBy != null) 'filterBy': filterBy,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListStreams',
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamsResponse.fromJson(response);
  }

  /// Gets a summary of current and previous streams for a specified channel in
  /// your account, in the AWS region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// Channel ARN used to filter the list.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of streams to return. Default: 100.
  ///
  /// Parameter [nextToken] :
  /// The first stream to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStreamSessionsResponse> listStreamSessions({
    required String channelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListStreamSessions',
      exceptionFnMap: _exceptionFns,
    );
    return ListStreamSessionsResponse.fromJson(response);
  }

  /// Gets information about Amazon Web Services tags for the specified ARN.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be retrieved. The ARN must be URL-encoded.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Inserts metadata into the active stream of the specified channel. At most
  /// 5 requests per second per channel are allowed, each with a maximum 1 KB
  /// payload. (If 5 TPS is not sufficient for your needs, we recommend batching
  /// your data into a single PutMetadata call.) At most 155 requests per second
  /// per account are allowed. Also see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/metadata.html">Embedding
  /// Metadata within a Video Stream</a> in the <i>Amazon IVS User Guide</i>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ChannelNotBroadcasting].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel into which metadata is inserted. This channel must have
  /// an active stream.
  ///
  /// Parameter [metadata] :
  /// Metadata to insert into the stream. Maximum: 1 KB per request.
  Future<void> putMetadata({
    required String channelArn,
    required String metadata,
  }) async {
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
      'metadata': metadata,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutMetadata',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts the process of revoking the viewer session associated with a
  /// specified channel ARN and viewer ID. Optionally, you can provide a version
  /// to revoke viewer sessions less than and including that version. For
  /// instructions on associating a viewer ID with a viewer session, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
  /// Up Private Channels</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel associated with the viewer session to revoke.
  ///
  /// Parameter [viewerId] :
  /// The ID of the viewer associated with the viewer session to revoke. Do not
  /// use this field for personally identifying, confidential, or sensitive
  /// information.
  ///
  /// Parameter [viewerSessionVersionsLessThanOrEqualTo] :
  /// An optional filter on which versions of the viewer session to revoke. All
  /// versions less than or equal to the specified version will be revoked.
  /// Default: 0.
  Future<void> startViewerSessionRevocation({
    required String channelArn,
    required String viewerId,
    int? viewerSessionVersionsLessThanOrEqualTo,
  }) async {
    _s.validateNumRange(
      'viewerSessionVersionsLessThanOrEqualTo',
      viewerSessionVersionsLessThanOrEqualTo,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
      'viewerId': viewerId,
      if (viewerSessionVersionsLessThanOrEqualTo != null)
        'viewerSessionVersionsLessThanOrEqualTo':
            viewerSessionVersionsLessThanOrEqualTo,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartViewerSessionRevocation',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disconnects the incoming RTMPS stream for the specified channel. Can be
  /// used in conjunction with <a>DeleteStreamKey</a> to prevent further
  /// streaming to a channel.
  /// <note>
  /// Many streaming client-software libraries automatically reconnect a dropped
  /// RTMPS session, so to stop the stream permanently, you may want to first
  /// revoke the <code>streamKey</code> attached to the channel.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ChannelNotBroadcasting].
  /// May throw [ResourceNotFoundException].
  /// May throw [StreamUnavailable].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel for which the stream is to be stopped.
  Future<void> stopStream({
    required String channelArn,
  }) async {
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopStream',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds or updates tags for the Amazon Web Services resource with the
  /// specified ARN.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags are to be added or updated. The ARN
  /// must be URL-encoded.
  ///
  /// Parameter [tags] :
  /// Array of tags to be added or updated. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources
  /// and Tag Editor</i> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no
  /// service-specific constraints beyond what is documented there.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from the resource with the specified ARN.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags are to be removed. The ARN must be
  /// URL-encoded.
  ///
  /// Parameter [tagKeys] :
  /// Array of tag keys (strings) for the tags to be removed. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources
  /// and Tag Editor</i> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no
  /// service-specific constraints beyond what is documented there.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a specified ad configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the ad configuration to be updated.
  ///
  /// Parameter [mediaTailorPlaybackConfigurations] :
  /// List of integration configurations with MediaTailor resources. The first
  /// item in the list is the default playback configuration used for the ad
  /// configuration. To select a different configuration per viewing session,
  /// see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/private-channels-generate-tokens.html">Generate
  /// and Sign IVS Playback Tokens</a>.
  ///
  /// Parameter [name] :
  /// Ad configuration name. The value does not need to be unique.
  Future<UpdateAdConfigurationResponse> updateAdConfiguration({
    required String arn,
    List<MediaTailorPlaybackConfiguration>? mediaTailorPlaybackConfigurations,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (mediaTailorPlaybackConfigurations != null)
        'mediaTailorPlaybackConfigurations': mediaTailorPlaybackConfigurations,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateAdConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAdConfigurationResponse.fromJson(response);
  }

  /// Updates a channel's configuration. Live channels cannot be updated. You
  /// must stop the ongoing stream, update the channel, and restart the stream
  /// for the changes to take effect.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the channel to be updated.
  ///
  /// Parameter [adConfigurationArn] :
  /// ARN of the ad configuration associated with the channel.
  ///
  /// Parameter [authorized] :
  /// Whether the channel is private (enabled for playback authorization).
  ///
  /// Parameter [containerFormat] :
  /// Indicates which content-packaging format is used (MPEG-TS or fMP4). If
  /// <code>multitrackInputConfiguration</code> is specified and
  /// <code>enabled</code> is <code>true</code>, then
  /// <code>containerFormat</code> is required and must be set to
  /// <code>FRAGMENTED_MP4</code>. Otherwise, <code>containerFormat</code> may
  /// be set to <code>TS</code> or <code>FRAGMENTED_MP4</code>. Default:
  /// <code>TS</code>.
  ///
  /// Parameter [insecureIngest] :
  /// Whether the channel allows insecure RTMP and SRT ingest. Default:
  /// <code>false</code>.
  ///
  /// Parameter [latencyMode] :
  /// Channel latency mode. Use <code>NORMAL</code> to broadcast and deliver
  /// live video up to Full HD. Use <code>LOW</code> for near-real-time
  /// interaction with viewers.
  ///
  /// Parameter [multitrackInputConfiguration] :
  /// Object specifying multitrack input configuration. Default: no multitrack
  /// input configuration is specified.
  ///
  /// Parameter [name] :
  /// Channel name.
  ///
  /// Parameter [playbackRestrictionPolicyArn] :
  /// Playback-restriction-policy ARN. A valid ARN value here both specifies the
  /// ARN and enables playback restriction. If this is set to an empty string,
  /// playback restriction policy is disabled.
  ///
  /// Parameter [preset] :
  /// Optional transcode preset for the channel. This is selectable only for
  /// <code>ADVANCED_HD</code> and <code>ADVANCED_SD</code> channel types. For
  /// those channel types, the default <code>preset</code> is
  /// <code>HIGHER_BANDWIDTH_DELIVERY</code>. For other channel types
  /// (<code>BASIC</code> and <code>STANDARD</code>), <code>preset</code> is the
  /// empty string (<code>""</code>).
  ///
  /// Parameter [recordingConfigurationArn] :
  /// Recording-configuration ARN. A valid ARN value here both specifies the ARN
  /// and enables recording. If this is set to an empty string, recording is
  /// disabled.
  ///
  /// Parameter [type] :
  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable input resolution or bitrate, the stream probably
  /// will disconnect immediately.</i> Default: <code>STANDARD</code>. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/channel-types.html">Channel
  /// Types</a>.
  Future<UpdateChannelResponse> updateChannel({
    required String arn,
    String? adConfigurationArn,
    bool? authorized,
    ContainerFormat? containerFormat,
    bool? insecureIngest,
    ChannelLatencyMode? latencyMode,
    MultitrackInputConfiguration? multitrackInputConfiguration,
    String? name,
    String? playbackRestrictionPolicyArn,
    TranscodePreset? preset,
    String? recordingConfigurationArn,
    ChannelType? type,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (adConfigurationArn != null) 'adConfigurationArn': adConfigurationArn,
      if (authorized != null) 'authorized': authorized,
      if (containerFormat != null) 'containerFormat': containerFormat.value,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (latencyMode != null) 'latencyMode': latencyMode.value,
      if (multitrackInputConfiguration != null)
        'multitrackInputConfiguration': multitrackInputConfiguration,
      if (name != null) 'name': name,
      if (playbackRestrictionPolicyArn != null)
        'playbackRestrictionPolicyArn': playbackRestrictionPolicyArn,
      if (preset != null) 'preset': preset.value,
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (type != null) 'type': type.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateChannel',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelResponse.fromJson(response);
  }

  /// Updates a specified playback restriction policy.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the playback-restriction-policy to be updated.
  ///
  /// Parameter [allowedCountries] :
  /// A list of country codes that control geoblocking restriction. Allowed
  /// values are the officially assigned <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1
  /// alpha-2</a> codes. Default: All countries (an empty array).
  ///
  /// Parameter [allowedOrigins] :
  /// A list of origin sites that control CORS restriction. Allowed values are
  /// the same as valid values of the Origin header defined at <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin">https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin</a>.
  /// Default: All origins (an empty array).
  ///
  /// Parameter [enableStrictOriginEnforcement] :
  /// Whether channel playback is constrained by origin site. Default:
  /// <code>false</code>.
  ///
  /// Parameter [name] :
  /// Playback-restriction-policy name. The value does not need to be unique.
  Future<UpdatePlaybackRestrictionPolicyResponse>
      updatePlaybackRestrictionPolicy({
    required String arn,
    List<String>? allowedCountries,
    List<String>? allowedOrigins,
    bool? enableStrictOriginEnforcement,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (allowedCountries != null) 'allowedCountries': allowedCountries,
      if (allowedOrigins != null) 'allowedOrigins': allowedOrigins,
      if (enableStrictOriginEnforcement != null)
        'enableStrictOriginEnforcement': enableStrictOriginEnforcement,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdatePlaybackRestrictionPolicy',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePlaybackRestrictionPolicyResponse.fromJson(response);
  }
}

/// @nodoc
class BatchGetChannelResponse {
  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin">Access-Control-Allow-Origin</a>
  /// in the MDN Web Docs.
  final String? accessControlAllowOrigin;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Expose-Headers">Access-Control-Expose-Headers</a>
  /// in the MDN Web Docs.
  final String? accessControlExposeHeaders;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control">Cache-Control</a>
  /// in the MDN Web Docs.
  final String? cacheControl;

  /// <p/>
  final List<Channel>? channels;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy">Content-Security-Policy</a>
  /// in the MDN Web Docs.
  final String? contentSecurityPolicy;

  /// Each error object is related to a specific ARN in the request.
  final List<BatchError>? errors;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security">Strict-Transport-Security</a>
  /// in the MDN Web Docs.
  final String? strictTransportSecurity;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Content-Type-Options">X-Content-Type-Options</a>
  /// in the MDN Web Docs.
  final String? xContentTypeOptions;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options">X-Frame-Options</a>
  /// in the MDN Web Docs.
  final String? xFrameOptions;

  BatchGetChannelResponse({
    this.accessControlAllowOrigin,
    this.accessControlExposeHeaders,
    this.cacheControl,
    this.channels,
    this.contentSecurityPolicy,
    this.errors,
    this.strictTransportSecurity,
    this.xContentTypeOptions,
    this.xFrameOptions,
  });

  Map<String, dynamic> toJson() {
    final accessControlAllowOrigin = this.accessControlAllowOrigin;
    final accessControlExposeHeaders = this.accessControlExposeHeaders;
    final cacheControl = this.cacheControl;
    final channels = this.channels;
    final contentSecurityPolicy = this.contentSecurityPolicy;
    final errors = this.errors;
    final strictTransportSecurity = this.strictTransportSecurity;
    final xContentTypeOptions = this.xContentTypeOptions;
    final xFrameOptions = this.xFrameOptions;
    return {
      if (channels != null) 'channels': channels,
      if (errors != null) 'errors': errors,
    };
  }
}

/// @nodoc
class BatchGetStreamKeyResponse {
  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin">Access-Control-Allow-Origin</a>
  /// in the MDN Web Docs.
  final String? accessControlAllowOrigin;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Expose-Headers">Access-Control-Expose-Headers</a>
  /// in the MDN Web Docs.
  final String? accessControlExposeHeaders;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control">Cache-Control</a>
  /// in the MDN Web Docs.
  final String? cacheControl;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy">Content-Security-Policy</a>
  /// in the MDN Web Docs.
  final String? contentSecurityPolicy;

  /// <p/>
  final List<BatchError>? errors;

  /// <p/>
  final List<StreamKey>? streamKeys;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security">Strict-Transport-Security</a>
  /// in the MDN Web Docs.
  final String? strictTransportSecurity;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Content-Type-Options">X-Content-Type-Options</a>
  /// in the MDN Web Docs.
  final String? xContentTypeOptions;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options">X-Frame-Options</a>
  /// in the MDN Web Docs.
  final String? xFrameOptions;

  BatchGetStreamKeyResponse({
    this.accessControlAllowOrigin,
    this.accessControlExposeHeaders,
    this.cacheControl,
    this.contentSecurityPolicy,
    this.errors,
    this.streamKeys,
    this.strictTransportSecurity,
    this.xContentTypeOptions,
    this.xFrameOptions,
  });

  Map<String, dynamic> toJson() {
    final accessControlAllowOrigin = this.accessControlAllowOrigin;
    final accessControlExposeHeaders = this.accessControlExposeHeaders;
    final cacheControl = this.cacheControl;
    final contentSecurityPolicy = this.contentSecurityPolicy;
    final errors = this.errors;
    final streamKeys = this.streamKeys;
    final strictTransportSecurity = this.strictTransportSecurity;
    final xContentTypeOptions = this.xContentTypeOptions;
    final xFrameOptions = this.xFrameOptions;
    return {
      if (errors != null) 'errors': errors,
      if (streamKeys != null) 'streamKeys': streamKeys,
    };
  }
}

/// @nodoc
class BatchStartViewerSessionRevocationResponse {
  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin">Access-Control-Allow-Origin</a>
  /// in the MDN Web Docs.
  final String? accessControlAllowOrigin;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Expose-Headers">Access-Control-Expose-Headers</a>
  /// in the MDN Web Docs.
  final String? accessControlExposeHeaders;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control">Cache-Control</a>
  /// in the MDN Web Docs.
  final String? cacheControl;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy">Content-Security-Policy</a>
  /// in the MDN Web Docs.
  final String? contentSecurityPolicy;

  /// Each error object is related to a specific <code>channelArn</code> and
  /// <code>viewerId</code> pair in the request.
  final List<BatchStartViewerSessionRevocationError>? errors;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security">Strict-Transport-Security</a>
  /// in the MDN Web Docs.
  final String? strictTransportSecurity;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Content-Type-Options">X-Content-Type-Options</a>
  /// in the MDN Web Docs.
  final String? xContentTypeOptions;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options">X-Frame-Options</a>
  /// in the MDN Web Docs.
  final String? xFrameOptions;

  BatchStartViewerSessionRevocationResponse({
    this.accessControlAllowOrigin,
    this.accessControlExposeHeaders,
    this.cacheControl,
    this.contentSecurityPolicy,
    this.errors,
    this.strictTransportSecurity,
    this.xContentTypeOptions,
    this.xFrameOptions,
  });

  Map<String, dynamic> toJson() {
    final accessControlAllowOrigin = this.accessControlAllowOrigin;
    final accessControlExposeHeaders = this.accessControlExposeHeaders;
    final cacheControl = this.cacheControl;
    final contentSecurityPolicy = this.contentSecurityPolicy;
    final errors = this.errors;
    final strictTransportSecurity = this.strictTransportSecurity;
    final xContentTypeOptions = this.xContentTypeOptions;
    final xFrameOptions = this.xFrameOptions;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

/// @nodoc
class CreateAdConfigurationResponse {
  /// <p/>
  final AdConfiguration adConfiguration;

  CreateAdConfigurationResponse({
    required this.adConfiguration,
  });

  factory CreateAdConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return CreateAdConfigurationResponse(
      adConfiguration: AdConfiguration.fromJson(
          (json['adConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final adConfiguration = this.adConfiguration;
    return {
      'adConfiguration': adConfiguration,
    };
  }
}

/// @nodoc
class CreateChannelResponse {
  /// <p/>
  final Channel? channel;

  /// <p/>
  final StreamKey? streamKey;

  CreateChannelResponse({
    this.channel,
    this.streamKey,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
      streamKey: json['streamKey'] != null
          ? StreamKey.fromJson(json['streamKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final streamKey = this.streamKey;
    return {
      if (channel != null) 'channel': channel,
      if (streamKey != null) 'streamKey': streamKey,
    };
  }
}

/// @nodoc
class CreatePlaybackRestrictionPolicyResponse {
  /// <p/>
  final PlaybackRestrictionPolicy? playbackRestrictionPolicy;

  CreatePlaybackRestrictionPolicyResponse({
    this.playbackRestrictionPolicy,
  });

  factory CreatePlaybackRestrictionPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return CreatePlaybackRestrictionPolicyResponse(
      playbackRestrictionPolicy: json['playbackRestrictionPolicy'] != null
          ? PlaybackRestrictionPolicy.fromJson(
              json['playbackRestrictionPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final playbackRestrictionPolicy = this.playbackRestrictionPolicy;
    return {
      if (playbackRestrictionPolicy != null)
        'playbackRestrictionPolicy': playbackRestrictionPolicy,
    };
  }
}

/// @nodoc
class CreateRecordingConfigurationResponse {
  final RecordingConfiguration? recordingConfiguration;

  CreateRecordingConfigurationResponse({
    this.recordingConfiguration,
  });

  factory CreateRecordingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRecordingConfigurationResponse(
      recordingConfiguration: json['recordingConfiguration'] != null
          ? RecordingConfiguration.fromJson(
              json['recordingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordingConfiguration = this.recordingConfiguration;
    return {
      if (recordingConfiguration != null)
        'recordingConfiguration': recordingConfiguration,
    };
  }
}

/// @nodoc
class CreateStreamKeyResponse {
  /// Stream key used to authenticate an RTMPS stream for ingestion.
  final StreamKey? streamKey;

  CreateStreamKeyResponse({
    this.streamKey,
  });

  factory CreateStreamKeyResponse.fromJson(Map<String, dynamic> json) {
    return CreateStreamKeyResponse(
      streamKey: json['streamKey'] != null
          ? StreamKey.fromJson(json['streamKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamKey = this.streamKey;
    return {
      if (streamKey != null) 'streamKey': streamKey,
    };
  }
}

/// @nodoc
class DeletePlaybackKeyPairResponse {
  DeletePlaybackKeyPairResponse();

  factory DeletePlaybackKeyPairResponse.fromJson(Map<String, dynamic> _) {
    return DeletePlaybackKeyPairResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetAdConfigurationResponse {
  /// <p/>
  final AdConfiguration? adConfiguration;

  GetAdConfigurationResponse({
    this.adConfiguration,
  });

  factory GetAdConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetAdConfigurationResponse(
      adConfiguration: json['adConfiguration'] != null
          ? AdConfiguration.fromJson(
              json['adConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adConfiguration = this.adConfiguration;
    return {
      if (adConfiguration != null) 'adConfiguration': adConfiguration,
    };
  }
}

/// @nodoc
class GetChannelResponse {
  /// <p/>
  final Channel? channel;

  GetChannelResponse({
    this.channel,
  });

  factory GetChannelResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelResponse(
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    return {
      if (channel != null) 'channel': channel,
    };
  }
}

/// @nodoc
class GetPlaybackKeyPairResponse {
  final PlaybackKeyPair? keyPair;

  GetPlaybackKeyPairResponse({
    this.keyPair,
  });

  factory GetPlaybackKeyPairResponse.fromJson(Map<String, dynamic> json) {
    return GetPlaybackKeyPairResponse(
      keyPair: json['keyPair'] != null
          ? PlaybackKeyPair.fromJson(json['keyPair'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPair = this.keyPair;
    return {
      if (keyPair != null) 'keyPair': keyPair,
    };
  }
}

/// @nodoc
class GetPlaybackRestrictionPolicyResponse {
  /// <p/>
  final PlaybackRestrictionPolicy? playbackRestrictionPolicy;

  GetPlaybackRestrictionPolicyResponse({
    this.playbackRestrictionPolicy,
  });

  factory GetPlaybackRestrictionPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return GetPlaybackRestrictionPolicyResponse(
      playbackRestrictionPolicy: json['playbackRestrictionPolicy'] != null
          ? PlaybackRestrictionPolicy.fromJson(
              json['playbackRestrictionPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final playbackRestrictionPolicy = this.playbackRestrictionPolicy;
    return {
      if (playbackRestrictionPolicy != null)
        'playbackRestrictionPolicy': playbackRestrictionPolicy,
    };
  }
}

/// @nodoc
class GetRecordingConfigurationResponse {
  final RecordingConfiguration? recordingConfiguration;

  GetRecordingConfigurationResponse({
    this.recordingConfiguration,
  });

  factory GetRecordingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRecordingConfigurationResponse(
      recordingConfiguration: json['recordingConfiguration'] != null
          ? RecordingConfiguration.fromJson(
              json['recordingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final recordingConfiguration = this.recordingConfiguration;
    return {
      if (recordingConfiguration != null)
        'recordingConfiguration': recordingConfiguration,
    };
  }
}

/// @nodoc
class GetStreamResponse {
  /// <p/>
  final Stream? stream;

  GetStreamResponse({
    this.stream,
  });

  factory GetStreamResponse.fromJson(Map<String, dynamic> json) {
    return GetStreamResponse(
      stream: json['stream'] != null
          ? Stream.fromJson(json['stream'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stream = this.stream;
    return {
      if (stream != null) 'stream': stream,
    };
  }
}

/// @nodoc
class GetStreamKeyResponse {
  final StreamKey? streamKey;

  GetStreamKeyResponse({
    this.streamKey,
  });

  factory GetStreamKeyResponse.fromJson(Map<String, dynamic> json) {
    return GetStreamKeyResponse(
      streamKey: json['streamKey'] != null
          ? StreamKey.fromJson(json['streamKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamKey = this.streamKey;
    return {
      if (streamKey != null) 'streamKey': streamKey,
    };
  }
}

/// @nodoc
class GetStreamSessionResponse {
  /// List of stream details.
  final StreamSession? streamSession;

  GetStreamSessionResponse({
    this.streamSession,
  });

  factory GetStreamSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetStreamSessionResponse(
      streamSession: json['streamSession'] != null
          ? StreamSession.fromJson(
              json['streamSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamSession = this.streamSession;
    return {
      if (streamSession != null) 'streamSession': streamSession,
    };
  }
}

/// @nodoc
class ImportPlaybackKeyPairResponse {
  /// <p/>
  final PlaybackKeyPair? keyPair;

  ImportPlaybackKeyPairResponse({
    this.keyPair,
  });

  factory ImportPlaybackKeyPairResponse.fromJson(Map<String, dynamic> json) {
    return ImportPlaybackKeyPairResponse(
      keyPair: json['keyPair'] != null
          ? PlaybackKeyPair.fromJson(json['keyPair'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPair = this.keyPair;
    return {
      if (keyPair != null) 'keyPair': keyPair,
    };
  }
}

/// @nodoc
class InsertAdBreakResponse {
  /// Unique identifier for the ad break that was inserted into the playlist.
  final String? adBreakId;

  InsertAdBreakResponse({
    this.adBreakId,
  });

  factory InsertAdBreakResponse.fromJson(Map<String, dynamic> json) {
    return InsertAdBreakResponse(
      adBreakId: json['adBreakId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adBreakId = this.adBreakId;
    return {
      if (adBreakId != null) 'adBreakId': adBreakId,
    };
  }
}

/// @nodoc
class ListAdConfigurationsResponse {
  /// List of the matching ad configurations.
  final List<AdConfigurationSummary> adConfigurations;

  /// If there are more ad configurations than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListAdConfigurationsResponse({
    required this.adConfigurations,
    this.nextToken,
  });

  factory ListAdConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListAdConfigurationsResponse(
      adConfigurations: ((json['adConfigurations'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => AdConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adConfigurations = this.adConfigurations;
    final nextToken = this.nextToken;
    return {
      'adConfigurations': adConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListChannelsResponse {
  /// List of the matching channels.
  final List<ChannelSummary> channels;

  /// If there are more channels than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListChannelsResponse({
    required this.channels,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      channels: ((json['channels'] as List?) ?? const [])
          .nonNulls
          .map((e) => ChannelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      'channels': channels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPlaybackKeyPairsResponse {
  /// List of key pairs.
  final List<PlaybackKeyPairSummary> keyPairs;

  /// If there are more key pairs than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListPlaybackKeyPairsResponse({
    required this.keyPairs,
    this.nextToken,
  });

  factory ListPlaybackKeyPairsResponse.fromJson(Map<String, dynamic> json) {
    return ListPlaybackKeyPairsResponse(
      keyPairs: ((json['keyPairs'] as List?) ?? const [])
          .nonNulls
          .map(
              (e) => PlaybackKeyPairSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final keyPairs = this.keyPairs;
    final nextToken = this.nextToken;
    return {
      'keyPairs': keyPairs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListPlaybackRestrictionPoliciesResponse {
  /// List of the matching policies.
  final List<PlaybackRestrictionPolicySummary> playbackRestrictionPolicies;

  /// If there are more channels than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListPlaybackRestrictionPoliciesResponse({
    required this.playbackRestrictionPolicies,
    this.nextToken,
  });

  factory ListPlaybackRestrictionPoliciesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPlaybackRestrictionPoliciesResponse(
      playbackRestrictionPolicies:
          ((json['playbackRestrictionPolicies'] as List?) ?? const [])
              .nonNulls
              .map((e) => PlaybackRestrictionPolicySummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final playbackRestrictionPolicies = this.playbackRestrictionPolicies;
    final nextToken = this.nextToken;
    return {
      'playbackRestrictionPolicies': playbackRestrictionPolicies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListRecordingConfigurationsResponse {
  /// List of the matching recording configurations.
  final List<RecordingConfigurationSummary> recordingConfigurations;

  /// If there are more recording configurations than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListRecordingConfigurationsResponse({
    required this.recordingConfigurations,
    this.nextToken,
  });

  factory ListRecordingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRecordingConfigurationsResponse(
      recordingConfigurations: ((json['recordingConfigurations'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              RecordingConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordingConfigurations = this.recordingConfigurations;
    final nextToken = this.nextToken;
    return {
      'recordingConfigurations': recordingConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListStreamKeysResponse {
  /// List of stream keys.
  final List<StreamKeySummary> streamKeys;

  /// If there are more stream keys than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListStreamKeysResponse({
    required this.streamKeys,
    this.nextToken,
  });

  factory ListStreamKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListStreamKeysResponse(
      streamKeys: ((json['streamKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => StreamKeySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamKeys = this.streamKeys;
    final nextToken = this.nextToken;
    return {
      'streamKeys': streamKeys,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListStreamsResponse {
  /// List of streams.
  final List<StreamSummary> streams;

  /// If there are more streams than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListStreamsResponse({
    required this.streams,
    this.nextToken,
  });

  factory ListStreamsResponse.fromJson(Map<String, dynamic> json) {
    return ListStreamsResponse(
      streams: ((json['streams'] as List?) ?? const [])
          .nonNulls
          .map((e) => StreamSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streams = this.streams;
    final nextToken = this.nextToken;
    return {
      'streams': streams,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListStreamSessionsResponse {
  /// List of stream sessions.
  final List<StreamSessionSummary> streamSessions;

  /// If there are more streams than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListStreamSessionsResponse({
    required this.streamSessions,
    this.nextToken,
  });

  factory ListStreamSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListStreamSessionsResponse(
      streamSessions: ((json['streamSessions'] as List?) ?? const [])
          .nonNulls
          .map((e) => StreamSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamSessions = this.streamSessions;
    final nextToken = this.nextToken;
    return {
      'streamSessions': streamSessions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
              .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

/// @nodoc
class StartViewerSessionRevocationResponse {
  StartViewerSessionRevocationResponse();

  factory StartViewerSessionRevocationResponse.fromJson(
      Map<String, dynamic> _) {
    return StartViewerSessionRevocationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StopStreamResponse {
  StopStreamResponse();

  factory StopStreamResponse.fromJson(Map<String, dynamic> _) {
    return StopStreamResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateAdConfigurationResponse {
  /// Object specifying the updated ad configuration.
  final AdConfiguration adConfiguration;

  UpdateAdConfigurationResponse({
    required this.adConfiguration,
  });

  factory UpdateAdConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAdConfigurationResponse(
      adConfiguration: AdConfiguration.fromJson(
          (json['adConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final adConfiguration = this.adConfiguration;
    return {
      'adConfiguration': adConfiguration,
    };
  }
}

/// @nodoc
class UpdateChannelResponse {
  /// Object specifying the updated channel.
  final Channel? channel;

  UpdateChannelResponse({
    this.channel,
  });

  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelResponse(
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    return {
      if (channel != null) 'channel': channel,
    };
  }
}

/// @nodoc
class UpdatePlaybackRestrictionPolicyResponse {
  /// Object specifying the updated policy.
  final PlaybackRestrictionPolicy? playbackRestrictionPolicy;

  UpdatePlaybackRestrictionPolicyResponse({
    this.playbackRestrictionPolicy,
  });

  factory UpdatePlaybackRestrictionPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdatePlaybackRestrictionPolicyResponse(
      playbackRestrictionPolicy: json['playbackRestrictionPolicy'] != null
          ? PlaybackRestrictionPolicy.fromJson(
              json['playbackRestrictionPolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final playbackRestrictionPolicy = this.playbackRestrictionPolicy;
    return {
      if (playbackRestrictionPolicy != null)
        'playbackRestrictionPolicy': playbackRestrictionPolicy,
    };
  }
}

/// An object representing a policy to constrain playback by country and/or
/// origin sites.
///
/// @nodoc
class PlaybackRestrictionPolicy {
  /// A list of country codes that control geoblocking restriction. Allowed values
  /// are the officially assigned <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1
  /// alpha-2</a> codes. Default: All countries (an empty array).
  final List<String> allowedCountries;

  /// A list of origin sites that control CORS restriction. Allowed values are the
  /// same as valid values of the Origin header defined at <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin">https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin</a>.
  /// Default: All origins (an empty array).
  final List<String> allowedOrigins;

  /// Playback-restriction-policy ARN
  final String arn;

  /// Whether channel playback is constrained by origin site. Default:
  /// <code>false</code>.
  final bool? enableStrictOriginEnforcement;

  /// Playback-restriction-policy name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  PlaybackRestrictionPolicy({
    required this.allowedCountries,
    required this.allowedOrigins,
    required this.arn,
    this.enableStrictOriginEnforcement,
    this.name,
    this.tags,
  });

  factory PlaybackRestrictionPolicy.fromJson(Map<String, dynamic> json) {
    return PlaybackRestrictionPolicy(
      allowedCountries: ((json['allowedCountries'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allowedOrigins: ((json['allowedOrigins'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      arn: (json['arn'] as String?) ?? '',
      enableStrictOriginEnforcement:
          json['enableStrictOriginEnforcement'] as bool?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedCountries = this.allowedCountries;
    final allowedOrigins = this.allowedOrigins;
    final arn = this.arn;
    final enableStrictOriginEnforcement = this.enableStrictOriginEnforcement;
    final name = this.name;
    final tags = this.tags;
    return {
      'allowedCountries': allowedCountries,
      'allowedOrigins': allowedOrigins,
      'arn': arn,
      if (enableStrictOriginEnforcement != null)
        'enableStrictOriginEnforcement': enableStrictOriginEnforcement,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Object specifying a channel.
///
/// @nodoc
class Channel {
  /// ARN of the ad configuration associated with the channel.
  final String? adConfigurationArn;

  /// Channel ARN.
  final String? arn;

  /// Whether the channel is private (enabled for playback authorization).
  /// Default: <code>false</code>.
  final bool? authorized;

  /// Indicates which content-packaging format is used (MPEG-TS or fMP4). If
  /// <code>multitrackInputConfiguration</code> is specified and
  /// <code>enabled</code> is <code>true</code>, then <code>containerFormat</code>
  /// is required and must be set to <code>FRAGMENTED_MP4</code>. Otherwise,
  /// <code>containerFormat</code> may be set to <code>TS</code> or
  /// <code>FRAGMENTED_MP4</code>. Default: <code>TS</code>.
  final ContainerFormat? containerFormat;

  /// Channel ingest endpoint, part of the definition of an ingest server, used
  /// when you set up streaming software.
  final String? ingestEndpoint;

  /// Whether the channel allows insecure RTMP ingest. Default:
  /// <code>false</code>.
  final bool? insecureIngest;

  /// Channel latency mode. Use <code>NORMAL</code> to broadcast and deliver live
  /// video up to Full HD. Use <code>LOW</code> for near-real-time interaction
  /// with viewers. Default: <code>LOW</code>.
  final ChannelLatencyMode? latencyMode;

  /// Object specifying multitrack input configuration. Default: no multitrack
  /// input configuration is specified.
  final MultitrackInputConfiguration? multitrackInputConfiguration;

  /// Channel name.
  final String? name;

  /// Playback-restriction-policy ARN. A valid ARN value here both specifies the
  /// ARN and enables playback restriction. Default: "" (empty string, no playback
  /// restriction policy is applied).
  final String? playbackRestrictionPolicyArn;

  /// Channel playback URL.
  final String? playbackUrl;

  /// Optional transcode preset for the channel. This is selectable only for
  /// <code>ADVANCED_HD</code> and <code>ADVANCED_SD</code> channel types. For
  /// those channel types, the default <code>preset</code> is
  /// <code>HIGHER_BANDWIDTH_DELIVERY</code>. For other channel types
  /// (<code>BASIC</code> and <code>STANDARD</code>), <code>preset</code> is the
  /// empty string (<code>""</code>).
  final TranscodePreset? preset;

  /// Recording-configuration ARN. A valid ARN value here both specifies the ARN
  /// and enables recording. Default: "" (empty string, recording is disabled).
  final String? recordingConfigurationArn;

  /// Specifies the endpoint and optional passphrase for streaming with the SRT
  /// protocol.
  final Srt? srt;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable input resolution or bitrate, the stream probably
  /// will disconnect immediately.</i> Default: <code>STANDARD</code>. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/channel-types.html">Channel
  /// Types</a>.
  final ChannelType? type;

  Channel({
    this.adConfigurationArn,
    this.arn,
    this.authorized,
    this.containerFormat,
    this.ingestEndpoint,
    this.insecureIngest,
    this.latencyMode,
    this.multitrackInputConfiguration,
    this.name,
    this.playbackRestrictionPolicyArn,
    this.playbackUrl,
    this.preset,
    this.recordingConfigurationArn,
    this.srt,
    this.tags,
    this.type,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      adConfigurationArn: json['adConfigurationArn'] as String?,
      arn: json['arn'] as String?,
      authorized: json['authorized'] as bool?,
      containerFormat:
          (json['containerFormat'] as String?)?.let(ContainerFormat.fromString),
      ingestEndpoint: json['ingestEndpoint'] as String?,
      insecureIngest: json['insecureIngest'] as bool?,
      latencyMode:
          (json['latencyMode'] as String?)?.let(ChannelLatencyMode.fromString),
      multitrackInputConfiguration: json['multitrackInputConfiguration'] != null
          ? MultitrackInputConfiguration.fromJson(
              json['multitrackInputConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      playbackRestrictionPolicyArn:
          json['playbackRestrictionPolicyArn'] as String?,
      playbackUrl: json['playbackUrl'] as String?,
      preset: (json['preset'] as String?)?.let(TranscodePreset.fromString),
      recordingConfigurationArn: json['recordingConfigurationArn'] as String?,
      srt: json['srt'] != null
          ? Srt.fromJson(json['srt'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.let(ChannelType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final adConfigurationArn = this.adConfigurationArn;
    final arn = this.arn;
    final authorized = this.authorized;
    final containerFormat = this.containerFormat;
    final ingestEndpoint = this.ingestEndpoint;
    final insecureIngest = this.insecureIngest;
    final latencyMode = this.latencyMode;
    final multitrackInputConfiguration = this.multitrackInputConfiguration;
    final name = this.name;
    final playbackRestrictionPolicyArn = this.playbackRestrictionPolicyArn;
    final playbackUrl = this.playbackUrl;
    final preset = this.preset;
    final recordingConfigurationArn = this.recordingConfigurationArn;
    final srt = this.srt;
    final tags = this.tags;
    final type = this.type;
    return {
      if (adConfigurationArn != null) 'adConfigurationArn': adConfigurationArn,
      if (arn != null) 'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (containerFormat != null) 'containerFormat': containerFormat.value,
      if (ingestEndpoint != null) 'ingestEndpoint': ingestEndpoint,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (latencyMode != null) 'latencyMode': latencyMode.value,
      if (multitrackInputConfiguration != null)
        'multitrackInputConfiguration': multitrackInputConfiguration,
      if (name != null) 'name': name,
      if (playbackRestrictionPolicyArn != null)
        'playbackRestrictionPolicyArn': playbackRestrictionPolicyArn,
      if (playbackUrl != null) 'playbackUrl': playbackUrl,
      if (preset != null) 'preset': preset.value,
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (srt != null) 'srt': srt,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
    };
  }
}

/// @nodoc
class ChannelLatencyMode {
  static const normal = ChannelLatencyMode._('NORMAL');
  static const low = ChannelLatencyMode._('LOW');

  final String value;

  const ChannelLatencyMode._(this.value);

  static const values = [normal, low];

  static ChannelLatencyMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChannelLatencyMode._(value));

  @override
  bool operator ==(other) =>
      other is ChannelLatencyMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ChannelType {
  static const basic = ChannelType._('BASIC');
  static const standard = ChannelType._('STANDARD');
  static const advancedSd = ChannelType._('ADVANCED_SD');
  static const advancedHd = ChannelType._('ADVANCED_HD');

  final String value;

  const ChannelType._(this.value);

  static const values = [basic, standard, advancedSd, advancedHd];

  static ChannelType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ChannelType._(value));

  @override
  bool operator ==(other) => other is ChannelType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class TranscodePreset {
  static const higherBandwidthDelivery =
      TranscodePreset._('HIGHER_BANDWIDTH_DELIVERY');
  static const constrainedBandwidthDelivery =
      TranscodePreset._('CONSTRAINED_BANDWIDTH_DELIVERY');

  final String value;

  const TranscodePreset._(this.value);

  static const values = [higherBandwidthDelivery, constrainedBandwidthDelivery];

  static TranscodePreset fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TranscodePreset._(value));

  @override
  bool operator ==(other) => other is TranscodePreset && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Specifies information needed to stream using the SRT protocol.
///
/// @nodoc
class Srt {
  /// The endpoint to be used when streaming with IVS using the SRT protocol.
  final String? endpoint;

  /// Auto-generated passphrase to enable encryption. This field is applicable
  /// only if the end user has <i>not</i> enabled the <code>insecureIngest</code>
  /// option for the channel.
  final String? passphrase;

  Srt({
    this.endpoint,
    this.passphrase,
  });

  factory Srt.fromJson(Map<String, dynamic> json) {
    return Srt(
      endpoint: json['endpoint'] as String?,
      passphrase: json['passphrase'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    final passphrase = this.passphrase;
    return {
      if (endpoint != null) 'endpoint': endpoint,
      if (passphrase != null) 'passphrase': passphrase,
    };
  }
}

/// A complex type that specifies multitrack input configuration.
///
/// @nodoc
class MultitrackInputConfiguration {
  /// Indicates whether multitrack input is enabled. Can be set to
  /// <code>true</code> only if channel type is <code>STANDARD</code>. Setting
  /// <code>enabled</code> to <code>true</code> with any other channel type will
  /// cause an exception. If <code>true</code>, then <code>policy</code>,
  /// <code>maximumResolution</code>, and <code>containerFormat</code> are
  /// required, and <code>containerFormat</code> must be set to
  /// <code>FRAGMENTED_MP4</code>. Default: <code>false</code>.
  final bool? enabled;

  /// Maximum resolution for multitrack input. Required if <code>enabled</code> is
  /// <code>true</code>.
  final MultitrackMaximumResolution? maximumResolution;

  /// Indicates whether multitrack input is allowed or required. Required if
  /// <code>enabled</code> is <code>true</code>.
  final MultitrackPolicy? policy;

  MultitrackInputConfiguration({
    this.enabled,
    this.maximumResolution,
    this.policy,
  });

  factory MultitrackInputConfiguration.fromJson(Map<String, dynamic> json) {
    return MultitrackInputConfiguration(
      enabled: json['enabled'] as bool?,
      maximumResolution: (json['maximumResolution'] as String?)
          ?.let(MultitrackMaximumResolution.fromString),
      policy: (json['policy'] as String?)?.let(MultitrackPolicy.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final maximumResolution = this.maximumResolution;
    final policy = this.policy;
    return {
      if (enabled != null) 'enabled': enabled,
      if (maximumResolution != null)
        'maximumResolution': maximumResolution.value,
      if (policy != null) 'policy': policy.value,
    };
  }
}

/// @nodoc
class ContainerFormat {
  static const ts = ContainerFormat._('TS');
  static const fragmentedMp4 = ContainerFormat._('FRAGMENTED_MP4');

  final String value;

  const ContainerFormat._(this.value);

  static const values = [ts, fragmentedMp4];

  static ContainerFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ContainerFormat._(value));

  @override
  bool operator ==(other) => other is ContainerFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MultitrackPolicy {
  static const allow = MultitrackPolicy._('ALLOW');
  static const require = MultitrackPolicy._('REQUIRE');

  final String value;

  const MultitrackPolicy._(this.value);

  static const values = [allow, require];

  static MultitrackPolicy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MultitrackPolicy._(value));

  @override
  bool operator ==(other) => other is MultitrackPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class MultitrackMaximumResolution {
  static const sd = MultitrackMaximumResolution._('SD');
  static const hd = MultitrackMaximumResolution._('HD');
  static const fullHd = MultitrackMaximumResolution._('FULL_HD');

  final String value;

  const MultitrackMaximumResolution._(this.value);

  static const values = [sd, hd, fullHd];

  static MultitrackMaximumResolution fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MultitrackMaximumResolution._(value));

  @override
  bool operator ==(other) =>
      other is MultitrackMaximumResolution && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object specifying a configuration for a server-side advertising insertion
/// (which can be triggered with the operation).
///
/// @nodoc
class AdConfiguration {
  /// Ad configuration ARN.
  final String arn;

  /// List of integration configurations with MediaTailor resources. The first
  /// item in the list is the default playback configuration used for the ad
  /// configuration. To select a different configuration per viewing session, see
  /// <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/private-channels-generate-tokens.html">Generate
  /// and Sign IVS Playback Tokens</a>.
  final List<MediaTailorPlaybackConfiguration>
      mediaTailorPlaybackConfigurations;

  /// Ad configuration name. Defaults to “”.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  AdConfiguration({
    required this.arn,
    required this.mediaTailorPlaybackConfigurations,
    this.name,
    this.tags,
  });

  factory AdConfiguration.fromJson(Map<String, dynamic> json) {
    return AdConfiguration(
      arn: (json['arn'] as String?) ?? '',
      mediaTailorPlaybackConfigurations:
          ((json['mediaTailorPlaybackConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) => MediaTailorPlaybackConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final mediaTailorPlaybackConfigurations =
        this.mediaTailorPlaybackConfigurations;
    final name = this.name;
    final tags = this.tags;
    return {
      'arn': arn,
      'mediaTailorPlaybackConfigurations': mediaTailorPlaybackConfigurations,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Object specifying a configuration for integration with an AWS Elemental
/// MediaTailor (EMT).
///
/// @nodoc
class MediaTailorPlaybackConfiguration {
  /// ARN of the customer-created EMT PlaybackConfiguration resource in the same
  /// region and account.
  final String? playbackConfigurationArn;

  MediaTailorPlaybackConfiguration({
    this.playbackConfigurationArn,
  });

  factory MediaTailorPlaybackConfiguration.fromJson(Map<String, dynamic> json) {
    return MediaTailorPlaybackConfiguration(
      playbackConfigurationArn: json['playbackConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final playbackConfigurationArn = this.playbackConfigurationArn;
    return {
      if (playbackConfigurationArn != null)
        'playbackConfigurationArn': playbackConfigurationArn,
    };
  }
}

/// Summary information about a stream session.
///
/// @nodoc
class StreamSessionSummary {
  /// Time when the channel went offline. This is an ISO 8601 timestamp; <i>note
  /// that this is returned as a string</i>. For live streams, this is
  /// <code>NULL</code>.
  final DateTime? endTime;

  /// If <code>true</code>, this stream encountered a quota breach or failure.
  final bool? hasErrorEvent;

  /// Time when the channel went live. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? startTime;

  /// Unique identifier for a live or previously live stream in the specified
  /// channel.
  final String? streamId;

  StreamSessionSummary({
    this.endTime,
    this.hasErrorEvent,
    this.startTime,
    this.streamId,
  });

  factory StreamSessionSummary.fromJson(Map<String, dynamic> json) {
    return StreamSessionSummary(
      endTime: timeStampFromJson(json['endTime']),
      hasErrorEvent: json['hasErrorEvent'] as bool?,
      startTime: timeStampFromJson(json['startTime']),
      streamId: json['streamId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final hasErrorEvent = this.hasErrorEvent;
    final startTime = this.startTime;
    final streamId = this.streamId;
    return {
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (hasErrorEvent != null) 'hasErrorEvent': hasErrorEvent,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (streamId != null) 'streamId': streamId,
    };
  }
}

/// Summary information about a stream.
///
/// @nodoc
class StreamSummary {
  /// Channel ARN for the stream.
  final String? channelArn;

  /// The stream’s health.
  final StreamHealth? health;

  /// Time of the stream’s start. This is an ISO 8601 timestamp; <i>note that this
  /// is returned as a string</i>.
  final DateTime? startTime;

  /// The stream’s state. Do not rely on the <code>OFFLINE</code> state, as the
  /// API may not return it; instead, a "NotBroadcasting" error will indicate that
  /// the stream is not live.
  final StreamState? state;

  /// Unique identifier for a live or previously live stream in the specified
  /// channel.
  final String? streamId;

  /// A count of concurrent views of the stream. Typically, a new view appears in
  /// <code>viewerCount</code> within 15 seconds of when video playback starts and
  /// a view is removed from <code>viewerCount</code> within 1 minute of when
  /// video playback ends. A value of -1 indicates that the request timed out; in
  /// this case, retry.
  final int? viewerCount;

  StreamSummary({
    this.channelArn,
    this.health,
    this.startTime,
    this.state,
    this.streamId,
    this.viewerCount,
  });

  factory StreamSummary.fromJson(Map<String, dynamic> json) {
    return StreamSummary(
      channelArn: json['channelArn'] as String?,
      health: (json['health'] as String?)?.let(StreamHealth.fromString),
      startTime: timeStampFromJson(json['startTime']),
      state: (json['state'] as String?)?.let(StreamState.fromString),
      streamId: json['streamId'] as String?,
      viewerCount: json['viewerCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final health = this.health;
    final startTime = this.startTime;
    final state = this.state;
    final streamId = this.streamId;
    final viewerCount = this.viewerCount;
    return {
      if (channelArn != null) 'channelArn': channelArn,
      if (health != null) 'health': health.value,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (state != null) 'state': state.value,
      if (streamId != null) 'streamId': streamId,
      if (viewerCount != null) 'viewerCount': viewerCount,
    };
  }
}

/// @nodoc
class StreamState {
  static const live = StreamState._('LIVE');
  static const offline = StreamState._('OFFLINE');

  final String value;

  const StreamState._(this.value);

  static const values = [live, offline];

  static StreamState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StreamState._(value));

  @override
  bool operator ==(other) => other is StreamState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StreamHealth {
  static const healthy = StreamHealth._('HEALTHY');
  static const starving = StreamHealth._('STARVING');
  static const unknown = StreamHealth._('UNKNOWN');

  final String value;

  const StreamHealth._(this.value);

  static const values = [healthy, starving, unknown];

  static StreamHealth fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StreamHealth._(value));

  @override
  bool operator ==(other) => other is StreamHealth && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object specifying the stream attribute on which to filter.
///
/// @nodoc
class StreamFilters {
  /// The stream’s health.
  final StreamHealth? health;

  StreamFilters({
    this.health,
  });

  Map<String, dynamic> toJson() {
    final health = this.health;
    return {
      if (health != null) 'health': health.value,
    };
  }
}

/// Summary information about a stream key.
///
/// @nodoc
class StreamKeySummary {
  /// Stream-key ARN.
  final String? arn;

  /// Channel ARN for the stream.
  final String? channelArn;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  StreamKeySummary({
    this.arn,
    this.channelArn,
    this.tags,
  });

  factory StreamKeySummary.fromJson(Map<String, dynamic> json) {
    return StreamKeySummary(
      arn: json['arn'] as String?,
      channelArn: json['channelArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelArn = this.channelArn;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (channelArn != null) 'channelArn': channelArn,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary information about a RecordingConfiguration.
///
/// @nodoc
class RecordingConfigurationSummary {
  /// Recording-configuration ARN.
  final String arn;

  /// A complex type that contains information about where recorded video will be
  /// stored.
  final DestinationConfiguration destinationConfiguration;

  /// Indicates the current state of the recording configuration. When the state
  /// is <code>ACTIVE</code>, the configuration is ready for recording a channel
  /// stream.
  final RecordingConfigurationState state;

  /// Recording-configuration name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  RecordingConfigurationSummary({
    required this.arn,
    required this.destinationConfiguration,
    required this.state,
    this.name,
    this.tags,
  });

  factory RecordingConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return RecordingConfigurationSummary(
      arn: (json['arn'] as String?) ?? '',
      destinationConfiguration: DestinationConfiguration.fromJson(
          (json['destinationConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      state: RecordingConfigurationState.fromString(
          (json['state'] as String?) ?? ''),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final destinationConfiguration = this.destinationConfiguration;
    final state = this.state;
    final name = this.name;
    final tags = this.tags;
    return {
      'arn': arn,
      'destinationConfiguration': destinationConfiguration,
      'state': state.value,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A complex type that describes a location where recorded videos will be
/// stored. Each member represents a type of destination configuration. For
/// recording, you define one and only one type of destination configuration.
///
/// @nodoc
class DestinationConfiguration {
  /// An S3 destination configuration where recorded videos will be stored.
  final S3DestinationConfiguration? s3;

  DestinationConfiguration({
    this.s3,
  });

  factory DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationConfiguration(
      s3: json['s3'] != null
          ? S3DestinationConfiguration.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

/// @nodoc
class RecordingConfigurationState {
  static const creating = RecordingConfigurationState._('CREATING');
  static const createFailed = RecordingConfigurationState._('CREATE_FAILED');
  static const active = RecordingConfigurationState._('ACTIVE');

  final String value;

  const RecordingConfigurationState._(this.value);

  static const values = [creating, createFailed, active];

  static RecordingConfigurationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecordingConfigurationState._(value));

  @override
  bool operator ==(other) =>
      other is RecordingConfigurationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A complex type that describes an S3 location where recorded videos will be
/// stored.
///
/// @nodoc
class S3DestinationConfiguration {
  /// Location (S3 bucket name) where recorded videos will be stored.
  final String bucketName;

  S3DestinationConfiguration({
    required this.bucketName,
  });

  factory S3DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DestinationConfiguration(
      bucketName: (json['bucketName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    return {
      'bucketName': bucketName,
    };
  }
}

/// Summary information about a PlaybackRestrictionPolicy.
///
/// @nodoc
class PlaybackRestrictionPolicySummary {
  /// A list of country codes that control geoblocking restriction. Allowed values
  /// are the officially assigned <a
  /// href="https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2">ISO 3166-1
  /// alpha-2</a> codes. Default: All countries (an empty array).
  final List<String> allowedCountries;

  /// A list of origin sites that control CORS restriction. Allowed values are the
  /// same as valid values of the Origin header defined at <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin">https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Origin</a>.
  /// Default: All origins (an empty array).
  final List<String> allowedOrigins;

  /// Playback-restriction-policy ARN
  final String arn;

  /// Whether channel playback is constrained by origin site. Default:
  /// <code>false</code>.
  final bool? enableStrictOriginEnforcement;

  /// Playback-restriction-policy name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  PlaybackRestrictionPolicySummary({
    required this.allowedCountries,
    required this.allowedOrigins,
    required this.arn,
    this.enableStrictOriginEnforcement,
    this.name,
    this.tags,
  });

  factory PlaybackRestrictionPolicySummary.fromJson(Map<String, dynamic> json) {
    return PlaybackRestrictionPolicySummary(
      allowedCountries: ((json['allowedCountries'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      allowedOrigins: ((json['allowedOrigins'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      arn: (json['arn'] as String?) ?? '',
      enableStrictOriginEnforcement:
          json['enableStrictOriginEnforcement'] as bool?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedCountries = this.allowedCountries;
    final allowedOrigins = this.allowedOrigins;
    final arn = this.arn;
    final enableStrictOriginEnforcement = this.enableStrictOriginEnforcement;
    final name = this.name;
    final tags = this.tags;
    return {
      'allowedCountries': allowedCountries,
      'allowedOrigins': allowedOrigins,
      'arn': arn,
      if (enableStrictOriginEnforcement != null)
        'enableStrictOriginEnforcement': enableStrictOriginEnforcement,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary information about a playback key pair.
///
/// @nodoc
class PlaybackKeyPairSummary {
  /// Key-pair ARN.
  final String? arn;

  /// Playback-key-pair name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  PlaybackKeyPairSummary({
    this.arn,
    this.name,
    this.tags,
  });

  factory PlaybackKeyPairSummary.fromJson(Map<String, dynamic> json) {
    return PlaybackKeyPairSummary(
      arn: json['arn'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary information about a channel.
///
/// @nodoc
class ChannelSummary {
  /// ARN of the ad configuration associated with the channel.
  final String? adConfigurationArn;

  /// Channel ARN.
  final String? arn;

  /// Whether the channel is private (enabled for playback authorization).
  /// Default: <code>false</code>.
  final bool? authorized;

  /// Whether the channel allows insecure RTMP ingest. Default:
  /// <code>false</code>.
  final bool? insecureIngest;

  /// Channel latency mode. Use <code>NORMAL</code> to broadcast and deliver live
  /// video up to Full HD. Use <code>LOW</code> for near-real-time interaction
  /// with viewers. Default: <code>LOW</code>.
  final ChannelLatencyMode? latencyMode;

  /// Channel name.
  final String? name;

  /// Playback-restriction-policy ARN. A valid ARN value here both specifies the
  /// ARN and enables playback restriction. Default: "" (empty string, no playback
  /// restriction policy is applied).
  final String? playbackRestrictionPolicyArn;

  /// Optional transcode preset for the channel. This is selectable only for
  /// <code>ADVANCED_HD</code> and <code>ADVANCED_SD</code> channel types. For
  /// those channel types, the default <code>preset</code> is
  /// <code>HIGHER_BANDWIDTH_DELIVERY</code>. For other channel types
  /// (<code>BASIC</code> and <code>STANDARD</code>), <code>preset</code> is the
  /// empty string (<code>""</code>).
  final TranscodePreset? preset;

  /// Recording-configuration ARN. A valid ARN value here both specifies the ARN
  /// and enables recording. Default: "" (empty string, recording is disabled).
  final String? recordingConfigurationArn;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable input resolution or bitrate, the stream probably
  /// will disconnect immediately.</i> Default: <code>STANDARD</code>. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/channel-types.html">Channel
  /// Types</a>.
  final ChannelType? type;

  ChannelSummary({
    this.adConfigurationArn,
    this.arn,
    this.authorized,
    this.insecureIngest,
    this.latencyMode,
    this.name,
    this.playbackRestrictionPolicyArn,
    this.preset,
    this.recordingConfigurationArn,
    this.tags,
    this.type,
  });

  factory ChannelSummary.fromJson(Map<String, dynamic> json) {
    return ChannelSummary(
      adConfigurationArn: json['adConfigurationArn'] as String?,
      arn: json['arn'] as String?,
      authorized: json['authorized'] as bool?,
      insecureIngest: json['insecureIngest'] as bool?,
      latencyMode:
          (json['latencyMode'] as String?)?.let(ChannelLatencyMode.fromString),
      name: json['name'] as String?,
      playbackRestrictionPolicyArn:
          json['playbackRestrictionPolicyArn'] as String?,
      preset: (json['preset'] as String?)?.let(TranscodePreset.fromString),
      recordingConfigurationArn: json['recordingConfigurationArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.let(ChannelType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final adConfigurationArn = this.adConfigurationArn;
    final arn = this.arn;
    final authorized = this.authorized;
    final insecureIngest = this.insecureIngest;
    final latencyMode = this.latencyMode;
    final name = this.name;
    final playbackRestrictionPolicyArn = this.playbackRestrictionPolicyArn;
    final preset = this.preset;
    final recordingConfigurationArn = this.recordingConfigurationArn;
    final tags = this.tags;
    final type = this.type;
    return {
      if (adConfigurationArn != null) 'adConfigurationArn': adConfigurationArn,
      if (arn != null) 'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (latencyMode != null) 'latencyMode': latencyMode.value,
      if (name != null) 'name': name,
      if (playbackRestrictionPolicyArn != null)
        'playbackRestrictionPolicyArn': playbackRestrictionPolicyArn,
      if (preset != null) 'preset': preset.value,
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.value,
    };
  }
}

/// Summary information about an ad configuration.
///
/// @nodoc
class AdConfigurationSummary {
  /// Ad configuration ARN.
  final String arn;

  /// List of integration configurations with MediaTailor resources. The first
  /// item in the list is the default playback configuration used for the ad
  /// configuration. To select a different configuration per viewing session, see
  /// <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyUserGuide/private-channels-generate-tokens.html">Generate
  /// and Sign IVS Playback Tokens</a>.
  final List<MediaTailorPlaybackConfiguration>
      mediaTailorPlaybackConfigurations;

  /// Ad configuration name. Defaults to “”.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  AdConfigurationSummary({
    required this.arn,
    required this.mediaTailorPlaybackConfigurations,
    this.name,
    this.tags,
  });

  factory AdConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return AdConfigurationSummary(
      arn: (json['arn'] as String?) ?? '',
      mediaTailorPlaybackConfigurations:
          ((json['mediaTailorPlaybackConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) => MediaTailorPlaybackConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final mediaTailorPlaybackConfigurations =
        this.mediaTailorPlaybackConfigurations;
    final name = this.name;
    final tags = this.tags;
    return {
      'arn': arn,
      'mediaTailorPlaybackConfigurations': mediaTailorPlaybackConfigurations,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A key pair used to sign and validate a playback authorization token.
///
/// @nodoc
class PlaybackKeyPair {
  /// Key-pair ARN.
  final String? arn;

  /// Key-pair identifier.
  final String? fingerprint;

  /// Playback-key-pair name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  PlaybackKeyPair({
    this.arn,
    this.fingerprint,
    this.name,
    this.tags,
  });

  factory PlaybackKeyPair.fromJson(Map<String, dynamic> json) {
    return PlaybackKeyPair(
      arn: json['arn'] as String?,
      fingerprint: json['fingerprint'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final fingerprint = this.fingerprint;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (fingerprint != null) 'fingerprint': fingerprint,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Object that captures the Amazon IVS configuration that the customer
/// provisioned, the ingest configurations that the broadcaster used, and the
/// most recent Amazon IVS stream events it encountered.
///
/// @nodoc
class StreamSession {
  /// The properties of the channel at the time of going live.
  final Channel? channel;

  /// Time when the channel went offline. This is an ISO 8601 timestamp; <i>note
  /// that this is returned as a string</i>. For live streams, this is
  /// <code>NULL</code>.
  final DateTime? endTime;

  /// The properties of the incoming RTMP stream.
  ///
  /// <b>Note:</b> <code>ingestConfiguration</code> is deprecated in favor of
  /// <code>ingestConfigurations</code> but retained to ensure backward
  /// compatibility. If multitrack is not enabled,
  /// <code>ingestConfiguration</code> and <code>ingestConfigurations</code>
  /// contain the same data, namely information about Track0 (the sole track). If
  /// multitrack is enabled, <code>ingestConfiguration</code> contains data for
  /// only the first track (Track0) and <code>ingestConfigurations</code> contains
  /// data for all tracks.
  final IngestConfiguration? ingestConfiguration;

  /// The properties of the incoming RTMP stream. If multitrack is enabled,
  /// <code>ingestConfigurations</code> contains data for all tracks; otherwise,
  /// it contains data only for Track0 (the sole track).
  final IngestConfigurations? ingestConfigurations;

  /// The properties of recording the live stream.
  final RecordingConfiguration? recordingConfiguration;

  /// Time when the channel went live. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? startTime;

  /// Unique identifier for a live or previously live stream in the specified
  /// channel.
  final String? streamId;

  /// List of Amazon IVS events that the stream encountered. The list is sorted by
  /// most recent events and contains up to 500 events. For Amazon IVS events, see
  /// <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/eventbridge.html">Using
  /// Amazon EventBridge with Amazon IVS</a>.
  final List<StreamEvent>? truncatedEvents;

  StreamSession({
    this.channel,
    this.endTime,
    this.ingestConfiguration,
    this.ingestConfigurations,
    this.recordingConfiguration,
    this.startTime,
    this.streamId,
    this.truncatedEvents,
  });

  factory StreamSession.fromJson(Map<String, dynamic> json) {
    return StreamSession(
      channel: json['channel'] != null
          ? Channel.fromJson(json['channel'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      ingestConfiguration: json['ingestConfiguration'] != null
          ? IngestConfiguration.fromJson(
              json['ingestConfiguration'] as Map<String, dynamic>)
          : null,
      ingestConfigurations: json['ingestConfigurations'] != null
          ? IngestConfigurations.fromJson(
              json['ingestConfigurations'] as Map<String, dynamic>)
          : null,
      recordingConfiguration: json['recordingConfiguration'] != null
          ? RecordingConfiguration.fromJson(
              json['recordingConfiguration'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      streamId: json['streamId'] as String?,
      truncatedEvents: (json['truncatedEvents'] as List?)
          ?.nonNulls
          .map((e) => StreamEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final endTime = this.endTime;
    final ingestConfiguration = this.ingestConfiguration;
    final ingestConfigurations = this.ingestConfigurations;
    final recordingConfiguration = this.recordingConfiguration;
    final startTime = this.startTime;
    final streamId = this.streamId;
    final truncatedEvents = this.truncatedEvents;
    return {
      if (channel != null) 'channel': channel,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (ingestConfiguration != null)
        'ingestConfiguration': ingestConfiguration,
      if (ingestConfigurations != null)
        'ingestConfigurations': ingestConfigurations,
      if (recordingConfiguration != null)
        'recordingConfiguration': recordingConfiguration,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (streamId != null) 'streamId': streamId,
      if (truncatedEvents != null) 'truncatedEvents': truncatedEvents,
    };
  }
}

/// Object specifying the ingest configuration set up by the broadcaster,
/// usually in an encoder.
///
/// <b>Note:</b> IngestConfiguration is deprecated in favor of
/// <a>IngestConfigurations</a> but retained to ensure backward compatibility.
/// If multitrack is not enabled, IngestConfiguration and IngestConfigurations
/// contain the same data, namely information about Track0 (the sole track). If
/// multitrack is enabled, IngestConfiguration contains data for only the first
/// track (Track0) and IngestConfigurations contains data for all tracks.
///
/// @nodoc
class IngestConfiguration {
  /// Encoder settings for audio.
  final AudioConfiguration? audio;

  /// Encoder settings for video.
  final VideoConfiguration? video;

  IngestConfiguration({
    this.audio,
    this.video,
  });

  factory IngestConfiguration.fromJson(Map<String, dynamic> json) {
    return IngestConfiguration(
      audio: json['audio'] != null
          ? AudioConfiguration.fromJson(json['audio'] as Map<String, dynamic>)
          : null,
      video: json['video'] != null
          ? VideoConfiguration.fromJson(json['video'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final video = this.video;
    return {
      if (audio != null) 'audio': audio,
      if (video != null) 'video': video,
    };
  }
}

/// Object specifying the ingest configuration set up by the broadcaster,
/// usually in an encoder.
///
/// <b>Note:</b> Use IngestConfigurations instead of <a>IngestConfiguration</a>
/// (which is deprecated). If multitrack is not enabled, IngestConfiguration and
/// IngestConfigurations contain the same data, namely information about Track0
/// (the sole track). If multitrack is enabled, IngestConfiguration contains
/// data for only the first track (Track0) and IngestConfigurations contains
/// data for all tracks.
///
/// @nodoc
class IngestConfigurations {
  /// Encoder settings for audio.
  final List<AudioConfiguration> audioConfigurations;

  /// Encoder settings for video
  final List<VideoConfiguration> videoConfigurations;

  IngestConfigurations({
    required this.audioConfigurations,
    required this.videoConfigurations,
  });

  factory IngestConfigurations.fromJson(Map<String, dynamic> json) {
    return IngestConfigurations(
      audioConfigurations: ((json['audioConfigurations'] as List?) ?? const [])
          .nonNulls
          .map((e) => AudioConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      videoConfigurations: ((json['videoConfigurations'] as List?) ?? const [])
          .nonNulls
          .map((e) => VideoConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final audioConfigurations = this.audioConfigurations;
    final videoConfigurations = this.videoConfigurations;
    return {
      'audioConfigurations': audioConfigurations,
      'videoConfigurations': videoConfigurations,
    };
  }
}

/// An object representing a configuration to record a channel stream.
///
/// @nodoc
class RecordingConfiguration {
  /// Recording-configuration ARN.
  final String arn;

  /// A complex type that contains information about where recorded video will be
  /// stored.
  final DestinationConfiguration destinationConfiguration;

  /// Indicates the current state of the recording configuration. When the state
  /// is <code>ACTIVE</code>, the configuration is ready for recording a channel
  /// stream.
  final RecordingConfigurationState state;

  /// Recording-configuration name. The value does not need to be unique.
  final String? name;

  /// If a broadcast disconnects and then reconnects within the specified
  /// interval, the multiple streams will be considered a single broadcast and
  /// merged together. Default: 0.
  final int? recordingReconnectWindowSeconds;

  /// Object that describes which renditions should be recorded for a stream.
  final RenditionConfiguration? renditionConfiguration;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  /// A complex type that allows you to enable/disable the recording of thumbnails
  /// for a live session and modify the interval at which thumbnails are generated
  /// for the live session.
  final ThumbnailConfiguration? thumbnailConfiguration;

  RecordingConfiguration({
    required this.arn,
    required this.destinationConfiguration,
    required this.state,
    this.name,
    this.recordingReconnectWindowSeconds,
    this.renditionConfiguration,
    this.tags,
    this.thumbnailConfiguration,
  });

  factory RecordingConfiguration.fromJson(Map<String, dynamic> json) {
    return RecordingConfiguration(
      arn: (json['arn'] as String?) ?? '',
      destinationConfiguration: DestinationConfiguration.fromJson(
          (json['destinationConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      state: RecordingConfigurationState.fromString(
          (json['state'] as String?) ?? ''),
      name: json['name'] as String?,
      recordingReconnectWindowSeconds:
          json['recordingReconnectWindowSeconds'] as int?,
      renditionConfiguration: json['renditionConfiguration'] != null
          ? RenditionConfiguration.fromJson(
              json['renditionConfiguration'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      thumbnailConfiguration: json['thumbnailConfiguration'] != null
          ? ThumbnailConfiguration.fromJson(
              json['thumbnailConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final destinationConfiguration = this.destinationConfiguration;
    final state = this.state;
    final name = this.name;
    final recordingReconnectWindowSeconds =
        this.recordingReconnectWindowSeconds;
    final renditionConfiguration = this.renditionConfiguration;
    final tags = this.tags;
    final thumbnailConfiguration = this.thumbnailConfiguration;
    return {
      'arn': arn,
      'destinationConfiguration': destinationConfiguration,
      'state': state.value,
      if (name != null) 'name': name,
      if (recordingReconnectWindowSeconds != null)
        'recordingReconnectWindowSeconds': recordingReconnectWindowSeconds,
      if (renditionConfiguration != null)
        'renditionConfiguration': renditionConfiguration,
      if (tags != null) 'tags': tags,
      if (thumbnailConfiguration != null)
        'thumbnailConfiguration': thumbnailConfiguration,
    };
  }
}

/// Object specifying a stream’s events. For a list of events, see <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/eventbridge.html">Using
/// Amazon EventBridge with Amazon IVS</a>.
///
/// @nodoc
class StreamEvent {
  /// Provides additional details about the stream event. There are several
  /// values; the long descriptions are provided in the IVS console but not
  /// delivered through the IVS API or EventBridge. Multitrack-related codes are
  /// used only for certain Session Ended events.
  ///
  /// <ul>
  /// <li>
  /// <code>MultitrackInputNotAllowed</code> — The broadcast client attempted to
  /// connect with multitrack input, but multitrack input was not enabled on the
  /// channel. Check your broadcast software settings or set
  /// <code>MultitrackInputConfiguration.Policy</code> to <code>ALLOW</code> or
  /// <code>REQUIRE</code>.
  /// </li>
  /// <li>
  /// <code>MultitrackInputRequired</code> — The broadcast client attempted to
  /// connect with single-track video, but multitrack input is required on this
  /// channel. Enable multitrack video in your broadcast software or configure the
  /// channel’s <code>MultitrackInputConfiguration.Policy</code> to
  /// <code>ALLOW</code>.
  /// </li>
  /// <li>
  /// <code>InvalidGetClientConfigurationStreamKey</code> — The broadcast client
  /// attempted to connect with an invalid, expired, or corrupt stream key.
  /// </li>
  /// <li>
  /// <code>GetClientConfigurationStreamKeyRequired</code> — The broadcast client
  /// attempted to stream multitrack video without providing an authenticated
  /// stream key from GetClientConfiguration.
  /// </li>
  /// <li>
  /// <code>InvalidMultitrackInputTrackCount</code> — The multitrack input stream
  /// contained an invalid number of tracks.
  /// </li>
  /// <li>
  /// <code>InvalidMultitrackInputVideoTrackMediaProperties</code> — The
  /// multitrack input stream contained one or more tracks with an invalid codec,
  /// resolution, bitrate, or framerate.
  /// </li>
  /// <li>
  /// <code>StreamTakeoverMediaMismatch</code> — The broadcast client attempted to
  /// take over with different media properties (e.g., codec, resolution, or video
  /// track type) from the original stream.
  /// </li>
  /// <li>
  /// <code>StreamTakeoverInvalidPriority</code> — The broadcast client attempted
  /// a takeover with either a priority integer value equal to or lower than the
  /// original stream's value or a value outside the allowed range of 1 to
  /// 2,147,483,647.
  ///
  /// <code>StreamTakeoverLimitBreached</code> — The broadcast client reached the
  /// maximum allowed takeover attempts for this stream.
  /// </li>
  /// </ul>
  final String? code;

  /// Time when the event occurred. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? eventTime;

  /// Name that identifies the stream event within a <code>type</code>.
  final String? name;

  /// Logical group for certain events.
  final String? type;

  StreamEvent({
    this.code,
    this.eventTime,
    this.name,
    this.type,
  });

  factory StreamEvent.fromJson(Map<String, dynamic> json) {
    return StreamEvent(
      code: json['code'] as String?,
      eventTime: timeStampFromJson(json['eventTime']),
      name: json['name'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final eventTime = this.eventTime;
    final name = this.name;
    final type = this.type;
    return {
      if (code != null) 'code': code,
      if (eventTime != null) 'eventTime': iso8601ToJson(eventTime),
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    };
  }
}

/// An object representing a configuration of thumbnails for recorded video.
///
/// @nodoc
class ThumbnailConfiguration {
  /// Thumbnail recording mode. Default: <code>INTERVAL</code>.
  final RecordingMode? recordingMode;

  /// Indicates the desired resolution of recorded thumbnails. Thumbnails are
  /// recorded at the selected resolution if the corresponding rendition is
  /// available during the stream; otherwise, they are recorded at source
  /// resolution. For more information about resolution values and their
  /// corresponding height and width dimensions, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/record-to-s3.html">Auto-Record
  /// to Amazon S3</a>. Default: Null (source resolution is returned).
  final ThumbnailConfigurationResolution? resolution;

  /// Indicates the format in which thumbnails are recorded.
  /// <code>SEQUENTIAL</code> records all generated thumbnails in a serial manner,
  /// to the media/thumbnails directory. <code>LATEST</code> saves the latest
  /// thumbnail in media/latest_thumbnail/thumb.jpg and overwrites it at the
  /// interval specified by <code>targetIntervalSeconds</code>. You can enable
  /// both <code>SEQUENTIAL</code> and <code>LATEST</code>. Default:
  /// <code>SEQUENTIAL</code>.
  final List<ThumbnailConfigurationStorage>? storage;

  /// The targeted thumbnail-generation interval in seconds. This is configurable
  /// (and required) only if <code>recordingMode</code> is <code>INTERVAL</code>.
  /// Default: 60.
  ///
  /// <b>Important:</b> For the <code>BASIC</code> channel type, or the
  /// <code>STANDARD</code> channel type with multitrack input, setting a value
  /// for <code>targetIntervalSeconds</code> does not guarantee that thumbnails
  /// are generated at the specified interval. For thumbnails to be generated at
  /// the <code>targetIntervalSeconds</code> interval, the
  /// <code>IDR/Keyframe</code> value for the input video must be less than the
  /// <code>targetIntervalSeconds</code> value. See <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/streaming-config.html">
  /// Amazon IVS Streaming Configuration</a> for information on setting
  /// <code>IDR/Keyframe</code> to the recommended value in video-encoder
  /// settings.
  final int? targetIntervalSeconds;

  ThumbnailConfiguration({
    this.recordingMode,
    this.resolution,
    this.storage,
    this.targetIntervalSeconds,
  });

  factory ThumbnailConfiguration.fromJson(Map<String, dynamic> json) {
    return ThumbnailConfiguration(
      recordingMode:
          (json['recordingMode'] as String?)?.let(RecordingMode.fromString),
      resolution: (json['resolution'] as String?)
          ?.let(ThumbnailConfigurationResolution.fromString),
      storage: (json['storage'] as List?)
          ?.nonNulls
          .map((e) => ThumbnailConfigurationStorage.fromString((e as String)))
          .toList(),
      targetIntervalSeconds: json['targetIntervalSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordingMode = this.recordingMode;
    final resolution = this.resolution;
    final storage = this.storage;
    final targetIntervalSeconds = this.targetIntervalSeconds;
    return {
      if (recordingMode != null) 'recordingMode': recordingMode.value,
      if (resolution != null) 'resolution': resolution.value,
      if (storage != null) 'storage': storage.map((e) => e.value).toList(),
      if (targetIntervalSeconds != null)
        'targetIntervalSeconds': targetIntervalSeconds,
    };
  }
}

/// Object that describes which renditions should be recorded for a stream.
///
/// @nodoc
class RenditionConfiguration {
  /// Indicates which set of renditions are recorded for a stream. For
  /// <code>BASIC</code> channels, the <code>CUSTOM</code> value has no effect. If
  /// <code>CUSTOM</code> is specified, a set of renditions must be specified in
  /// the <code>renditions</code> field. Default: <code>ALL</code>.
  final RenditionConfigurationRenditionSelection? renditionSelection;

  /// Indicates which renditions are recorded for a stream, if
  /// <code>renditionSelection</code> is <code>CUSTOM</code>; otherwise, this
  /// field is irrelevant. The selected renditions are recorded if they are
  /// available during the stream. If a selected rendition is unavailable, the
  /// best available rendition is recorded. For details on the resolution
  /// dimensions of each rendition, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/record-to-s3.html">Auto-Record
  /// to Amazon S3</a>.
  final List<RenditionConfigurationRendition>? renditions;

  RenditionConfiguration({
    this.renditionSelection,
    this.renditions,
  });

  factory RenditionConfiguration.fromJson(Map<String, dynamic> json) {
    return RenditionConfiguration(
      renditionSelection: (json['renditionSelection'] as String?)
          ?.let(RenditionConfigurationRenditionSelection.fromString),
      renditions: (json['renditions'] as List?)
          ?.nonNulls
          .map((e) => RenditionConfigurationRendition.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final renditionSelection = this.renditionSelection;
    final renditions = this.renditions;
    return {
      if (renditionSelection != null)
        'renditionSelection': renditionSelection.value,
      if (renditions != null)
        'renditions': renditions.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class RenditionConfigurationRenditionSelection {
  static const all = RenditionConfigurationRenditionSelection._('ALL');
  static const none = RenditionConfigurationRenditionSelection._('NONE');
  static const custom = RenditionConfigurationRenditionSelection._('CUSTOM');

  final String value;

  const RenditionConfigurationRenditionSelection._(this.value);

  static const values = [all, none, custom];

  static RenditionConfigurationRenditionSelection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RenditionConfigurationRenditionSelection._(value));

  @override
  bool operator ==(other) =>
      other is RenditionConfigurationRenditionSelection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RenditionConfigurationRendition {
  static const sd = RenditionConfigurationRendition._('SD');
  static const hd = RenditionConfigurationRendition._('HD');
  static const fullHd = RenditionConfigurationRendition._('FULL_HD');
  static const lowestResolution =
      RenditionConfigurationRendition._('LOWEST_RESOLUTION');

  final String value;

  const RenditionConfigurationRendition._(this.value);

  static const values = [sd, hd, fullHd, lowestResolution];

  static RenditionConfigurationRendition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RenditionConfigurationRendition._(value));

  @override
  bool operator ==(other) =>
      other is RenditionConfigurationRendition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class RecordingMode {
  static const disabled = RecordingMode._('DISABLED');
  static const interval = RecordingMode._('INTERVAL');

  final String value;

  const RecordingMode._(this.value);

  static const values = [disabled, interval];

  static RecordingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecordingMode._(value));

  @override
  bool operator ==(other) => other is RecordingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ThumbnailConfigurationResolution {
  static const sd = ThumbnailConfigurationResolution._('SD');
  static const hd = ThumbnailConfigurationResolution._('HD');
  static const fullHd = ThumbnailConfigurationResolution._('FULL_HD');
  static const lowestResolution =
      ThumbnailConfigurationResolution._('LOWEST_RESOLUTION');

  final String value;

  const ThumbnailConfigurationResolution._(this.value);

  static const values = [sd, hd, fullHd, lowestResolution];

  static ThumbnailConfigurationResolution fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ThumbnailConfigurationResolution._(value));

  @override
  bool operator ==(other) =>
      other is ThumbnailConfigurationResolution && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ThumbnailConfigurationStorage {
  static const sequential = ThumbnailConfigurationStorage._('SEQUENTIAL');
  static const latest = ThumbnailConfigurationStorage._('LATEST');

  final String value;

  const ThumbnailConfigurationStorage._(this.value);

  static const values = [sequential, latest];

  static ThumbnailConfigurationStorage fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ThumbnailConfigurationStorage._(value));

  @override
  bool operator ==(other) =>
      other is ThumbnailConfigurationStorage && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object specifying a stream’s audio configuration, as set up by the
/// broadcaster (usually in an encoder). This is part of the
/// <a>IngestConfigurations</a> object and the deprecated
/// <a>IngestConfiguration</a> object. It is used for monitoring stream health.
///
/// @nodoc
class AudioConfiguration {
  /// Number of audio channels.
  final int? channels;

  /// Codec used for the audio encoding.
  final String? codec;

  /// Number of audio samples recorded per second.
  final int? sampleRate;

  /// The expected ingest bitrate (bits per second). This is configured in the
  /// encoder.
  final int? targetBitrate;

  /// Name of the audio track (if the stream has an audio track). If multitrack is
  /// not enabled, this is Track0 (the sole track).
  final String? track;

  AudioConfiguration({
    this.channels,
    this.codec,
    this.sampleRate,
    this.targetBitrate,
    this.track,
  });

  factory AudioConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioConfiguration(
      channels: json['channels'] as int?,
      codec: json['codec'] as String?,
      sampleRate: json['sampleRate'] as int?,
      targetBitrate: json['targetBitrate'] as int?,
      track: json['track'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final codec = this.codec;
    final sampleRate = this.sampleRate;
    final targetBitrate = this.targetBitrate;
    final track = this.track;
    return {
      if (channels != null) 'channels': channels,
      if (codec != null) 'codec': codec,
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (targetBitrate != null) 'targetBitrate': targetBitrate,
      if (track != null) 'track': track,
    };
  }
}

/// Object specifying a stream’s video configuration, as set up by the
/// broadcaster (usually in an encoder). This is part of the
/// <a>IngestConfigurations</a> object and the deprecated
/// <a>IngestConfiguration</a> object. It is used for monitoring stream health.
///
/// @nodoc
class VideoConfiguration {
  /// (Deprecated) Indicates the degree of required decoder performance for a
  /// profile. Normally this is set automatically by the encoder. For details, see
  /// the H.264 specification. This is populated only when VideoConfiguration is
  /// part of the deprecated IngestConfiguration; otherwise, this is an empty
  /// string.
  final String? avcLevel;

  /// (Deprecated) Indicates to the decoder the requirements for decoding the
  /// stream. For definitions of the valid values, see the H.264 specification.
  /// This is populated only when VideoConfiguration is part of the deprecated
  /// IngestConfiguration; otherwise, this is an empty string.
  final String? avcProfile;

  /// Codec used for the video encoding.
  final String? codec;

  /// Software or hardware used to encode the video.
  final String? encoder;

  /// Indicates the degree of required decoder performance for a profile. Normally
  /// this is set automatically by the encoder. When an AVC codec is used, this
  /// field has the same value as <code>avcLevel</code>.
  final String? level;

  /// Indicates to the decoder the requirements for decoding the stream. When an
  /// AVC codec is used, this field has the same value as <code>avcProfile</code>.
  final String? profile;

  /// The expected ingest bitrate (bits per second). This is configured in the
  /// encoder.
  final int? targetBitrate;

  /// The expected ingest framerate. This is configured in the encoder.
  final int? targetFramerate;

  /// Name of the video track. If multitrack is not enabled, this is Track0 (the
  /// sole track).
  final String? track;

  /// Video-resolution height in pixels.
  final int? videoHeight;

  /// Video-resolution width in pixels.
  final int? videoWidth;

  VideoConfiguration({
    this.avcLevel,
    this.avcProfile,
    this.codec,
    this.encoder,
    this.level,
    this.profile,
    this.targetBitrate,
    this.targetFramerate,
    this.track,
    this.videoHeight,
    this.videoWidth,
  });

  factory VideoConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoConfiguration(
      avcLevel: json['avcLevel'] as String?,
      avcProfile: json['avcProfile'] as String?,
      codec: json['codec'] as String?,
      encoder: json['encoder'] as String?,
      level: json['level'] as String?,
      profile: json['profile'] as String?,
      targetBitrate: json['targetBitrate'] as int?,
      targetFramerate: json['targetFramerate'] as int?,
      track: json['track'] as String?,
      videoHeight: json['videoHeight'] as int?,
      videoWidth: json['videoWidth'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final avcLevel = this.avcLevel;
    final avcProfile = this.avcProfile;
    final codec = this.codec;
    final encoder = this.encoder;
    final level = this.level;
    final profile = this.profile;
    final targetBitrate = this.targetBitrate;
    final targetFramerate = this.targetFramerate;
    final track = this.track;
    final videoHeight = this.videoHeight;
    final videoWidth = this.videoWidth;
    return {
      if (avcLevel != null) 'avcLevel': avcLevel,
      if (avcProfile != null) 'avcProfile': avcProfile,
      if (codec != null) 'codec': codec,
      if (encoder != null) 'encoder': encoder,
      if (level != null) 'level': level,
      if (profile != null) 'profile': profile,
      if (targetBitrate != null) 'targetBitrate': targetBitrate,
      if (targetFramerate != null) 'targetFramerate': targetFramerate,
      if (track != null) 'track': track,
      if (videoHeight != null) 'videoHeight': videoHeight,
      if (videoWidth != null) 'videoWidth': videoWidth,
    };
  }
}

/// Object specifying a stream key.
///
/// @nodoc
class StreamKey {
  /// Stream-key ARN.
  final String? arn;

  /// Channel ARN for the stream.
  final String? channelArn;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging Amazon Web Services Resources and
  /// Tag Editor</i> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no service-specific
  /// constraints beyond what is documented there.
  final Map<String, String>? tags;

  /// Stream-key value.
  final String? value;

  StreamKey({
    this.arn,
    this.channelArn,
    this.tags,
    this.value,
  });

  factory StreamKey.fromJson(Map<String, dynamic> json) {
    return StreamKey(
      arn: json['arn'] as String?,
      channelArn: json['channelArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelArn = this.channelArn;
    final tags = this.tags;
    final value = this.value;
    return {
      if (arn != null) 'arn': arn,
      if (channelArn != null) 'channelArn': channelArn,
      if (tags != null) 'tags': tags,
      if (value != null) 'value': value,
    };
  }
}

/// Specifies a live video stream that has been ingested and distributed.
///
/// @nodoc
class Stream {
  /// Channel ARN for the stream.
  final String? channelArn;

  /// The stream’s health.
  final StreamHealth? health;

  /// URL of the master playlist, required by the video player to play the HLS
  /// stream.
  final String? playbackUrl;

  /// Time of the stream’s start. This is an ISO 8601 timestamp; <i>note that this
  /// is returned as a string</i>.
  final DateTime? startTime;

  /// The stream’s state. Do not rely on the <code>OFFLINE</code> state, as the
  /// API may not return it; instead, a "NotBroadcasting" error will indicate that
  /// the stream is not live.
  final StreamState? state;

  /// Unique identifier for a live or previously live stream in the specified
  /// channel.
  final String? streamId;

  /// A count of concurrent views of the stream. Typically, a new view appears in
  /// <code>viewerCount</code> within 15 seconds of when video playback starts and
  /// a view is removed from <code>viewerCount</code> within 1 minute of when
  /// video playback ends. A value of -1 indicates that the request timed out; in
  /// this case, retry.
  final int? viewerCount;

  Stream({
    this.channelArn,
    this.health,
    this.playbackUrl,
    this.startTime,
    this.state,
    this.streamId,
    this.viewerCount,
  });

  factory Stream.fromJson(Map<String, dynamic> json) {
    return Stream(
      channelArn: json['channelArn'] as String?,
      health: (json['health'] as String?)?.let(StreamHealth.fromString),
      playbackUrl: json['playbackUrl'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      state: (json['state'] as String?)?.let(StreamState.fromString),
      streamId: json['streamId'] as String?,
      viewerCount: json['viewerCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final health = this.health;
    final playbackUrl = this.playbackUrl;
    final startTime = this.startTime;
    final state = this.state;
    final streamId = this.streamId;
    final viewerCount = this.viewerCount;
    return {
      if (channelArn != null) 'channelArn': channelArn,
      if (health != null) 'health': health.value,
      if (playbackUrl != null) 'playbackUrl': playbackUrl,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (state != null) 'state': state.value,
      if (streamId != null) 'streamId': streamId,
      if (viewerCount != null) 'viewerCount': viewerCount,
    };
  }
}

/// Error for a request in the batch for BatchStartViewerSessionRevocation. Each
/// error is related to a specific channel-ARN and viewer-ID pair.
///
/// @nodoc
class BatchStartViewerSessionRevocationError {
  /// Channel ARN.
  final String channelArn;

  /// The ID of the viewer session to revoke.
  final String viewerId;

  /// Error code.
  final String? code;

  /// Error message, determined by the application.
  final String? message;

  BatchStartViewerSessionRevocationError({
    required this.channelArn,
    required this.viewerId,
    this.code,
    this.message,
  });

  factory BatchStartViewerSessionRevocationError.fromJson(
      Map<String, dynamic> json) {
    return BatchStartViewerSessionRevocationError(
      channelArn: (json['channelArn'] as String?) ?? '',
      viewerId: (json['viewerId'] as String?) ?? '',
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final viewerId = this.viewerId;
    final code = this.code;
    final message = this.message;
    return {
      'channelArn': channelArn,
      'viewerId': viewerId,
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

/// A viewer session to revoke in the call to
/// <a>BatchStartViewerSessionRevocation</a>.
///
/// @nodoc
class BatchStartViewerSessionRevocationViewerSession {
  /// The ARN of the channel associated with the viewer session to revoke.
  final String channelArn;

  /// The ID of the viewer associated with the viewer session to revoke. Do not
  /// use this field for personally identifying, confidential, or sensitive
  /// information.
  final String viewerId;

  /// An optional filter on which versions of the viewer session to revoke. All
  /// versions less than or equal to the specified version will be revoked.
  /// Default: 0.
  final int? viewerSessionVersionsLessThanOrEqualTo;

  BatchStartViewerSessionRevocationViewerSession({
    required this.channelArn,
    required this.viewerId,
    this.viewerSessionVersionsLessThanOrEqualTo,
  });

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final viewerId = this.viewerId;
    final viewerSessionVersionsLessThanOrEqualTo =
        this.viewerSessionVersionsLessThanOrEqualTo;
    return {
      'channelArn': channelArn,
      'viewerId': viewerId,
      if (viewerSessionVersionsLessThanOrEqualTo != null)
        'viewerSessionVersionsLessThanOrEqualTo':
            viewerSessionVersionsLessThanOrEqualTo,
    };
  }
}

/// Error related to a specific channel, specified by its ARN.
///
/// @nodoc
class BatchError {
  /// ARN of an IVS resource; e.g., channel.
  final String? arn;

  /// Error code.
  final String? code;

  /// Error message, determined by the application.
  final String? message;

  BatchError({
    this.arn,
    this.code,
    this.message,
  });

  factory BatchError.fromJson(Map<String, dynamic> json) {
    return BatchError(
      arn: json['arn'] as String?,
      code: json['code'] as String?,
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final code = this.code;
    final message = this.message;
    return {
      if (arn != null) 'arn': arn,
      if (code != null) 'code': code,
      if (message != null) 'message': message,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ChannelNotBroadcasting extends _s.GenericAwsException {
  ChannelNotBroadcasting({String? type, String? message})
      : super(type: type, code: 'ChannelNotBroadcasting', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class PendingVerification extends _s.GenericAwsException {
  PendingVerification({String? type, String? message})
      : super(type: type, code: 'PendingVerification', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ServiceUnavailable extends _s.GenericAwsException {
  ServiceUnavailable({String? type, String? message})
      : super(type: type, code: 'ServiceUnavailable', message: message);
}

/// @nodoc
class StreamUnavailable extends _s.GenericAwsException {
  StreamUnavailable({String? type, String? message})
      : super(type: type, code: 'StreamUnavailable', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ChannelNotBroadcasting': (type, message) =>
      ChannelNotBroadcasting(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'PendingVerification': (type, message) =>
      PendingVerification(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailable': (type, message) =>
      ServiceUnavailable(type: type, message: message),
  'StreamUnavailable': (type, message) =>
      StreamUnavailable(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
