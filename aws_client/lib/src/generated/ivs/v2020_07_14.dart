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
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// Amazon Web Services Resources</a> for more information, including
/// restrictions that apply to tags and "Tag naming limits and requirements";
/// Amazon IVS has no service-specific constraints beyond what is documented
/// there.
///
/// Tags can help you identify and organize your Amazon Web Services resources.
/// For example, you can use the same tag for different resources to indicate
/// that they are related. You can also use tags to manage access (see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">
/// Access Tags</a>).
///
/// The Amazon IVS API has these tag-related endpoints: <a>TagResource</a>,
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
///
/// <b>Channel Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreateChannel</a> — Creates a new channel and an associated stream key to
/// start streaming.
/// </li>
/// <li>
/// <a>GetChannel</a> — Gets the channel configuration for the specified channel
/// ARN.
/// </li>
/// <li>
/// <a>BatchGetChannel</a> — Performs <a>GetChannel</a> on multiple ARNs
/// simultaneously.
/// </li>
/// <li>
/// <a>ListChannels</a> — Gets summary information about all channels in your
/// account, in the Amazon Web Services region where the API request is
/// processed. This list can be filtered to match a specified name or
/// recording-configuration ARN. Filters are mutually exclusive and cannot be
/// used together. If you try to use both filters, you will get an error (409
/// Conflict Exception).
/// </li>
/// <li>
/// <a>UpdateChannel</a> — Updates a channel's configuration. This does not
/// affect an ongoing stream of this channel. You must stop and restart the
/// stream for the changes to take effect.
/// </li>
/// <li>
/// <a>DeleteChannel</a> — Deletes the specified channel.
/// </li>
/// </ul>
/// <b>Playback Restriction Policy Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreatePlaybackRestrictionPolicy</a> — Creates a new playback restriction
/// policy, for constraining playback by countries and/or origins.
/// </li>
/// <li>
/// <a>DeletePlaybackRestrictionPolicy</a> — Deletes the specified playback
/// restriction policy
/// </li>
/// <li>
/// <a>GetPlaybackRestrictionPolicy</a> — Gets the specified playback
/// restriction policy.
/// </li>
/// <li>
/// <a>ListPlaybackRestrictionPolicies</a> — Gets summary information about
/// playback restriction policies.
/// </li>
/// <li>
/// <a>UpdatePlaybackRestrictionPolicy</a> — Updates a specified playback
/// restriction policy.
/// </li>
/// </ul>
/// <b>Private Channel Endpoints</b>
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
/// Up Private Channels</a> in the <i>Amazon IVS User Guide</i>.
///
/// <ul>
/// <li>
/// <a>ImportPlaybackKeyPair</a> — Imports the public portion of a new key pair
/// and returns its <code>arn</code> and <code>fingerprint</code>. The
/// <code>privateKey</code> can then be used to generate viewer authorization
/// tokens, to grant viewers access to private channels (channels enabled for
/// playback authorization).
/// </li>
/// <li>
/// <a>GetPlaybackKeyPair</a> — Gets a specified playback authorization key pair
/// and returns the <code>arn</code> and <code>fingerprint</code>. The
/// <code>privateKey</code> held by the caller can be used to generate viewer
/// authorization tokens, to grant viewers access to private channels.
/// </li>
/// <li>
/// <a>ListPlaybackKeyPairs</a> — Gets summary information about playback key
/// pairs.
/// </li>
/// <li>
/// <a>DeletePlaybackKeyPair</a> — Deletes a specified authorization key pair.
/// This invalidates future viewer tokens generated using the key pair’s
/// <code>privateKey</code>.
/// </li>
/// <li>
/// <a>StartViewerSessionRevocation</a> — Starts the process of revoking the
/// viewer session associated with a specified channel ARN and viewer ID.
/// Optionally, you can provide a version to revoke viewer sessions less than
/// and including that version.
/// </li>
/// <li>
/// <a>BatchStartViewerSessionRevocation</a> — Performs
/// <a>StartViewerSessionRevocation</a> on multiple channel ARN and viewer ID
/// pairs simultaneously.
/// </li>
/// </ul>
/// <b>Recording Configuration Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreateRecordingConfiguration</a> — Creates a new recording configuration,
/// used to enable recording to Amazon S3.
/// </li>
/// <li>
/// <a>GetRecordingConfiguration</a> — Gets the recording-configuration metadata
/// for the specified ARN.
/// </li>
/// <li>
/// <a>ListRecordingConfigurations</a> — Gets summary information about all
/// recording configurations in your account, in the Amazon Web Services region
/// where the API request is processed.
/// </li>
/// <li>
/// <a>DeleteRecordingConfiguration</a> — Deletes the recording configuration
/// for the specified ARN.
/// </li>
/// </ul>
/// <b>Stream Endpoints</b>
///
/// <ul>
/// <li>
/// <a>GetStream</a> — Gets information about the active (live) stream on a
/// specified channel.
/// </li>
/// <li>
/// <a>GetStreamSession</a> — Gets metadata on a specified stream.
/// </li>
/// <li>
/// <a>ListStreams</a> — Gets summary information about live streams in your
/// account, in the Amazon Web Services region where the API request is
/// processed.
/// </li>
/// <li>
/// <a>ListStreamSessions</a> — Gets a summary of current and previous streams
/// for a specified channel in your account, in the AWS region where the API
/// request is processed.
/// </li>
/// <li>
/// <a>StopStream</a> — Disconnects the incoming RTMPS stream for the specified
/// channel. Can be used in conjunction with <a>DeleteStreamKey</a> to prevent
/// further streaming to a channel.
/// </li>
/// <li>
/// <a>PutMetadata</a> — Inserts metadata into the active stream of the
/// specified channel. At most 5 requests per second per channel are allowed,
/// each with a maximum 1 KB payload. (If 5 TPS is not sufficient for your
/// needs, we recommend batching your data into a single PutMetadata call.) At
/// most 155 requests per second per account are allowed.
/// </li>
/// </ul>
/// <b>Stream Key Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreateStreamKey</a> — Creates a stream key, used to initiate a stream,
/// for the specified channel ARN.
/// </li>
/// <li>
/// <a>GetStreamKey</a> — Gets stream key information for the specified ARN.
/// </li>
/// <li>
/// <a>BatchGetStreamKey</a> — Performs <a>GetStreamKey</a> on multiple ARNs
/// simultaneously.
/// </li>
/// <li>
/// <a>ListStreamKeys</a> — Gets summary information about stream keys for the
/// specified channel.
/// </li>
/// <li>
/// <a>DeleteStreamKey</a> — Deletes the stream key for the specified ARN, so it
/// can no longer be used to stream.
/// </li>
/// </ul>
/// <b>Amazon Web Services Tags Endpoints</b>
///
/// <ul>
/// <li>
/// <a>TagResource</a> — Adds or updates tags for the Amazon Web Services
/// resource with the specified ARN.
/// </li>
/// <li>
/// <a>UntagResource</a> — Removes tags from the resource with the specified
/// ARN.
/// </li>
/// <li>
/// <a>ListTagsForResource</a> — Gets information about Amazon Web Services tags
/// for the specified ARN.
/// </li>
/// </ul>
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
            signingName: 'ivs',
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
  /// Parameter [arns] :
  /// Array of ARNs, one per channel.
  Future<BatchGetChannelResponse> batchGetChannel({
    required List<String> arns,
  }) async {
    final $payload = <String, dynamic>{
      'arns': arns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetChannel',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetChannelResponse.fromJson(response);
  }

  /// Performs <a>GetStreamKey</a> on multiple ARNs simultaneously.
  ///
  /// Parameter [arns] :
  /// Array of ARNs, one per stream key.
  Future<BatchGetStreamKeyResponse> batchGetStreamKey({
    required List<String> arns,
  }) async {
    final $payload = <String, dynamic>{
      'arns': arns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchGetStreamKey',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetStreamKeyResponse.fromJson(response);
  }

  /// Performs <a>StartViewerSessionRevocation</a> on multiple channel ARN and
  /// viewer ID pairs simultaneously.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ThrottlingException].
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
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BatchStartViewerSessionRevocation',
      exceptionFnMap: _exceptionFns,
    );
    return BatchStartViewerSessionRevocationResponse.fromJson(response);
  }

  /// Creates a new channel and an associated stream key to start streaming.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [authorized] :
  /// Whether the channel is private (enabled for playback authorization).
  /// Default: <code>false</code>.
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
  ///
  /// Parameter [type] :
  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable input resolution or bitrate, the stream probably
  /// will disconnect immediately.</i> Default: <code>STANDARD</code>. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyAPIReference/channel-types.html">Channel
  /// Types</a>.
  Future<CreateChannelResponse> createChannel({
    bool? authorized,
    bool? insecureIngest,
    ChannelLatencyMode? latencyMode,
    String? name,
    String? playbackRestrictionPolicyArn,
    TranscodePreset? preset,
    String? recordingConfigurationArn,
    Map<String, String>? tags,
    ChannelType? type,
  }) async {
    final $payload = <String, dynamic>{
      if (authorized != null) 'authorized': authorized,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
      if (playbackRestrictionPolicyArn != null)
        'playbackRestrictionPolicyArn': playbackRestrictionPolicyArn,
      if (preset != null) 'preset': preset.toValue(),
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
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
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ThrottlingException].
  /// May throw [ServiceQuotaExceededException].
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel for which to create the stream key.
  ///
  /// Parameter [tags] :
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ConflictException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ConflictException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
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

  /// Gets the channel configuration for the specified channel ARN. See also
  /// <a>BatchGetChannel</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ChannelNotBroadcasting].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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

  /// Gets summary information about all channels in your account, in the Amazon
  /// Web Services region where the API request is processed. This list can be
  /// filtered to match a specified name or recording-configuration ARN. Filters
  /// are mutually exclusive and cannot be used together. If you try to use both
  /// filters, you will get an error (409 ConflictException).
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
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
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ConflictException].
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
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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

  /// Gets a summary of current and previous streams for a specified channel in
  /// your account, in the AWS region where the API request is processed.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
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

  /// Gets information about Amazon Web Services tags for the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ChannelNotBroadcasting].
  /// May throw [ThrottlingException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ThrottlingException].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ChannelNotBroadcasting].
  /// May throw [StreamUnavailable].
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags are to be added or updated. The ARN
  /// must be URL-encoded.
  ///
  /// Parameter [tags] :
  /// Array of tags to be added or updated. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags are to be removed. The ARN must be
  /// URL-encoded.
  ///
  /// Parameter [tagKeys] :
  /// Array of tags to be removed. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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

  /// Updates a channel's configuration. Live channels cannot be updated. You
  /// must stop the ongoing stream, update the channel, and restart the stream
  /// for the changes to take effect.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// ARN of the channel to be updated.
  ///
  /// Parameter [authorized] :
  /// Whether the channel is private (enabled for playback authorization).
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
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyAPIReference/channel-types.html">Channel
  /// Types</a>.
  Future<UpdateChannelResponse> updateChannel({
    required String arn,
    bool? authorized,
    bool? insecureIngest,
    ChannelLatencyMode? latencyMode,
    String? name,
    String? playbackRestrictionPolicyArn,
    TranscodePreset? preset,
    String? recordingConfigurationArn,
    ChannelType? type,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
      if (playbackRestrictionPolicyArn != null)
        'playbackRestrictionPolicyArn': playbackRestrictionPolicyArn,
      if (preset != null) 'preset': preset.toValue(),
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (type != null) 'type': type.toValue(),
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
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [PendingVerification].
  /// May throw [ConflictException].
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

/// Object specifying a stream’s audio configuration, as set up by the
/// broadcaster (usually in an encoder). This is part of the
/// <a>IngestConfiguration</a> object and used for monitoring stream health.
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

  AudioConfiguration({
    this.channels,
    this.codec,
    this.sampleRate,
    this.targetBitrate,
  });

  factory AudioConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioConfiguration(
      channels: json['channels'] as int?,
      codec: json['codec'] as String?,
      sampleRate: json['sampleRate'] as int?,
      targetBitrate: json['targetBitrate'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final codec = this.codec;
    final sampleRate = this.sampleRate;
    final targetBitrate = this.targetBitrate;
    return {
      if (channels != null) 'channels': channels,
      if (codec != null) 'codec': codec,
      if (sampleRate != null) 'sampleRate': sampleRate,
      if (targetBitrate != null) 'targetBitrate': targetBitrate,
    };
  }
}

/// Error related to a specific channel, specified by its ARN.
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

class BatchGetChannelResponse {
  /// <p/>
  final List<Channel>? channels;

  /// Each error object is related to a specific ARN in the request.
  final List<BatchError>? errors;

  BatchGetChannelResponse({
    this.channels,
    this.errors,
  });

  factory BatchGetChannelResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetChannelResponse(
      channels: (json['channels'] as List?)
          ?.whereNotNull()
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final errors = this.errors;
    return {
      if (channels != null) 'channels': channels,
      if (errors != null) 'errors': errors,
    };
  }
}

class BatchGetStreamKeyResponse {
  /// <p/>
  final List<BatchError>? errors;

  /// <p/>
  final List<StreamKey>? streamKeys;

  BatchGetStreamKeyResponse({
    this.errors,
    this.streamKeys,
  });

  factory BatchGetStreamKeyResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetStreamKeyResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
      streamKeys: (json['streamKeys'] as List?)
          ?.whereNotNull()
          .map((e) => StreamKey.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final streamKeys = this.streamKeys;
    return {
      if (errors != null) 'errors': errors,
      if (streamKeys != null) 'streamKeys': streamKeys,
    };
  }
}

/// Error for a request in the batch for BatchStartViewerSessionRevocation. Each
/// error is related to a specific channel-ARN and viewer-ID pair.
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
      channelArn: json['channelArn'] as String,
      viewerId: json['viewerId'] as String,
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

class BatchStartViewerSessionRevocationResponse {
  /// Each error object is related to a specific <code>channelArn</code> and
  /// <code>viewerId</code> pair in the request.
  final List<BatchStartViewerSessionRevocationError>? errors;

  BatchStartViewerSessionRevocationResponse({
    this.errors,
  });

  factory BatchStartViewerSessionRevocationResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchStartViewerSessionRevocationResponse(
      errors: (json['errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchStartViewerSessionRevocationError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'errors': errors,
    };
  }
}

/// A viewer session to revoke in the call to
/// <a>BatchStartViewerSessionRevocation</a>.
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

/// Object specifying a channel.
class Channel {
  /// Channel ARN.
  final String? arn;

  /// Whether the channel is private (enabled for playback authorization).
  /// Default: <code>false</code>.
  final bool? authorized;

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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
  final Map<String, String>? tags;

  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable input resolution or bitrate, the stream probably
  /// will disconnect immediately.</i> Default: <code>STANDARD</code>. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyAPIReference/channel-types.html">Channel
  /// Types</a>.
  final ChannelType? type;

  Channel({
    this.arn,
    this.authorized,
    this.ingestEndpoint,
    this.insecureIngest,
    this.latencyMode,
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
      arn: json['arn'] as String?,
      authorized: json['authorized'] as bool?,
      ingestEndpoint: json['ingestEndpoint'] as String?,
      insecureIngest: json['insecureIngest'] as bool?,
      latencyMode: (json['latencyMode'] as String?)?.toChannelLatencyMode(),
      name: json['name'] as String?,
      playbackRestrictionPolicyArn:
          json['playbackRestrictionPolicyArn'] as String?,
      playbackUrl: json['playbackUrl'] as String?,
      preset: (json['preset'] as String?)?.toTranscodePreset(),
      recordingConfigurationArn: json['recordingConfigurationArn'] as String?,
      srt: json['srt'] != null
          ? Srt.fromJson(json['srt'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toChannelType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorized = this.authorized;
    final ingestEndpoint = this.ingestEndpoint;
    final insecureIngest = this.insecureIngest;
    final latencyMode = this.latencyMode;
    final name = this.name;
    final playbackRestrictionPolicyArn = this.playbackRestrictionPolicyArn;
    final playbackUrl = this.playbackUrl;
    final preset = this.preset;
    final recordingConfigurationArn = this.recordingConfigurationArn;
    final srt = this.srt;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (ingestEndpoint != null) 'ingestEndpoint': ingestEndpoint,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
      if (playbackRestrictionPolicyArn != null)
        'playbackRestrictionPolicyArn': playbackRestrictionPolicyArn,
      if (playbackUrl != null) 'playbackUrl': playbackUrl,
      if (preset != null) 'preset': preset.toValue(),
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (srt != null) 'srt': srt,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ChannelLatencyMode {
  normal,
  low,
}

extension ChannelLatencyModeValueExtension on ChannelLatencyMode {
  String toValue() {
    switch (this) {
      case ChannelLatencyMode.normal:
        return 'NORMAL';
      case ChannelLatencyMode.low:
        return 'LOW';
    }
  }
}

extension ChannelLatencyModeFromString on String {
  ChannelLatencyMode toChannelLatencyMode() {
    switch (this) {
      case 'NORMAL':
        return ChannelLatencyMode.normal;
      case 'LOW':
        return ChannelLatencyMode.low;
    }
    throw Exception('$this is not known in enum ChannelLatencyMode');
  }
}

/// Summary information about a channel.
class ChannelSummary {
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
  final Map<String, String>? tags;

  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable input resolution or bitrate, the stream probably
  /// will disconnect immediately.</i> Default: <code>STANDARD</code>. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/LowLatencyAPIReference/channel-types.html">Channel
  /// Types</a>.
  final ChannelType? type;

  ChannelSummary({
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
      arn: json['arn'] as String?,
      authorized: json['authorized'] as bool?,
      insecureIngest: json['insecureIngest'] as bool?,
      latencyMode: (json['latencyMode'] as String?)?.toChannelLatencyMode(),
      name: json['name'] as String?,
      playbackRestrictionPolicyArn:
          json['playbackRestrictionPolicyArn'] as String?,
      preset: (json['preset'] as String?)?.toTranscodePreset(),
      recordingConfigurationArn: json['recordingConfigurationArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toChannelType(),
    );
  }

  Map<String, dynamic> toJson() {
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
      if (arn != null) 'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
      if (playbackRestrictionPolicyArn != null)
        'playbackRestrictionPolicyArn': playbackRestrictionPolicyArn,
      if (preset != null) 'preset': preset.toValue(),
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ChannelType {
  basic,
  standard,
  advancedSd,
  advancedHd,
}

extension ChannelTypeValueExtension on ChannelType {
  String toValue() {
    switch (this) {
      case ChannelType.basic:
        return 'BASIC';
      case ChannelType.standard:
        return 'STANDARD';
      case ChannelType.advancedSd:
        return 'ADVANCED_SD';
      case ChannelType.advancedHd:
        return 'ADVANCED_HD';
    }
  }
}

extension ChannelTypeFromString on String {
  ChannelType toChannelType() {
    switch (this) {
      case 'BASIC':
        return ChannelType.basic;
      case 'STANDARD':
        return ChannelType.standard;
      case 'ADVANCED_SD':
        return ChannelType.advancedSd;
      case 'ADVANCED_HD':
        return ChannelType.advancedHd;
    }
    throw Exception('$this is not known in enum ChannelType');
  }
}

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

class CreateRecordingConfigurationResponse {
  /// <zonbook></zonbook><xhtml></xhtml>
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

class DeletePlaybackKeyPairResponse {
  DeletePlaybackKeyPairResponse();

  factory DeletePlaybackKeyPairResponse.fromJson(Map<String, dynamic> _) {
    return DeletePlaybackKeyPairResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A complex type that describes a location where recorded videos will be
/// stored. Each member represents a type of destination configuration. For
/// recording, you define one and only one type of destination configuration.
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

class GetPlaybackKeyPairResponse {
  /// <zonbook></zonbook><xhtml></xhtml>
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

class GetRecordingConfigurationResponse {
  /// <zonbook></zonbook><xhtml></xhtml>
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

class GetStreamKeyResponse {
  /// <zonbook></zonbook><xhtml></xhtml>
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

/// Object specifying the ingest configuration set up by the broadcaster,
/// usually in an encoder.
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
      channels: (json['channels'] as List)
          .whereNotNull()
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
      keyPairs: (json['keyPairs'] as List)
          .whereNotNull()
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
      playbackRestrictionPolicies: (json['playbackRestrictionPolicies'] as List)
          .whereNotNull()
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
      recordingConfigurations: (json['recordingConfigurations'] as List)
          .whereNotNull()
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
      streamKeys: (json['streamKeys'] as List)
          .whereNotNull()
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
      streamSessions: (json['streamSessions'] as List)
          .whereNotNull()
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
      streams: (json['streams'] as List)
          .whereNotNull()
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

class ListTagsForResourceResponse {
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
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

/// A key pair used to sign and validate a playback authorization token.
class PlaybackKeyPair {
  /// Key-pair ARN.
  final String? arn;

  /// Key-pair identifier.
  final String? fingerprint;

  /// Playback-key-pair name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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

/// Summary information about a playback key pair.
class PlaybackKeyPairSummary {
  /// Key-pair ARN.
  final String? arn;

  /// Playback-key-pair name. The value does not need to be unique.
  final String? name;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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

/// An object representing a policy to constrain playback by country and/or
/// origin sites.
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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
      allowedCountries: (json['allowedCountries'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowedOrigins: (json['allowedOrigins'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      arn: json['arn'] as String,
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

/// Summary information about a PlaybackRestrictionPolicy.
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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
      allowedCountries: (json['allowedCountries'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      allowedOrigins: (json['allowedOrigins'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      arn: json['arn'] as String,
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

/// An object representing a configuration to record a channel stream.
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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
      arn: json['arn'] as String,
      destinationConfiguration: DestinationConfiguration.fromJson(
          json['destinationConfiguration'] as Map<String, dynamic>),
      state: (json['state'] as String).toRecordingConfigurationState(),
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
      'state': state.toValue(),
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

enum RecordingConfigurationState {
  creating,
  createFailed,
  active,
}

extension RecordingConfigurationStateValueExtension
    on RecordingConfigurationState {
  String toValue() {
    switch (this) {
      case RecordingConfigurationState.creating:
        return 'CREATING';
      case RecordingConfigurationState.createFailed:
        return 'CREATE_FAILED';
      case RecordingConfigurationState.active:
        return 'ACTIVE';
    }
  }
}

extension RecordingConfigurationStateFromString on String {
  RecordingConfigurationState toRecordingConfigurationState() {
    switch (this) {
      case 'CREATING':
        return RecordingConfigurationState.creating;
      case 'CREATE_FAILED':
        return RecordingConfigurationState.createFailed;
      case 'ACTIVE':
        return RecordingConfigurationState.active;
    }
    throw Exception('$this is not known in enum RecordingConfigurationState');
  }
}

/// Summary information about a RecordingConfiguration.
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
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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
      arn: json['arn'] as String,
      destinationConfiguration: DestinationConfiguration.fromJson(
          json['destinationConfiguration'] as Map<String, dynamic>),
      state: (json['state'] as String).toRecordingConfigurationState(),
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
      'state': state.toValue(),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

enum RecordingMode {
  disabled,
  interval,
}

extension RecordingModeValueExtension on RecordingMode {
  String toValue() {
    switch (this) {
      case RecordingMode.disabled:
        return 'DISABLED';
      case RecordingMode.interval:
        return 'INTERVAL';
    }
  }
}

extension RecordingModeFromString on String {
  RecordingMode toRecordingMode() {
    switch (this) {
      case 'DISABLED':
        return RecordingMode.disabled;
      case 'INTERVAL':
        return RecordingMode.interval;
    }
    throw Exception('$this is not known in enum RecordingMode');
  }
}

/// Object that describes which renditions should be recorded for a stream.
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
          ?.toRenditionConfigurationRenditionSelection(),
      renditions: (json['renditions'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toRenditionConfigurationRendition())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final renditionSelection = this.renditionSelection;
    final renditions = this.renditions;
    return {
      if (renditionSelection != null)
        'renditionSelection': renditionSelection.toValue(),
      if (renditions != null)
        'renditions': renditions.map((e) => e.toValue()).toList(),
    };
  }
}

enum RenditionConfigurationRendition {
  fullHd,
  hd,
  sd,
  lowestResolution,
}

extension RenditionConfigurationRenditionValueExtension
    on RenditionConfigurationRendition {
  String toValue() {
    switch (this) {
      case RenditionConfigurationRendition.fullHd:
        return 'FULL_HD';
      case RenditionConfigurationRendition.hd:
        return 'HD';
      case RenditionConfigurationRendition.sd:
        return 'SD';
      case RenditionConfigurationRendition.lowestResolution:
        return 'LOWEST_RESOLUTION';
    }
  }
}

extension RenditionConfigurationRenditionFromString on String {
  RenditionConfigurationRendition toRenditionConfigurationRendition() {
    switch (this) {
      case 'FULL_HD':
        return RenditionConfigurationRendition.fullHd;
      case 'HD':
        return RenditionConfigurationRendition.hd;
      case 'SD':
        return RenditionConfigurationRendition.sd;
      case 'LOWEST_RESOLUTION':
        return RenditionConfigurationRendition.lowestResolution;
    }
    throw Exception(
        '$this is not known in enum RenditionConfigurationRendition');
  }
}

enum RenditionConfigurationRenditionSelection {
  all,
  none,
  custom,
}

extension RenditionConfigurationRenditionSelectionValueExtension
    on RenditionConfigurationRenditionSelection {
  String toValue() {
    switch (this) {
      case RenditionConfigurationRenditionSelection.all:
        return 'ALL';
      case RenditionConfigurationRenditionSelection.none:
        return 'NONE';
      case RenditionConfigurationRenditionSelection.custom:
        return 'CUSTOM';
    }
  }
}

extension RenditionConfigurationRenditionSelectionFromString on String {
  RenditionConfigurationRenditionSelection
      toRenditionConfigurationRenditionSelection() {
    switch (this) {
      case 'ALL':
        return RenditionConfigurationRenditionSelection.all;
      case 'NONE':
        return RenditionConfigurationRenditionSelection.none;
      case 'CUSTOM':
        return RenditionConfigurationRenditionSelection.custom;
    }
    throw Exception(
        '$this is not known in enum RenditionConfigurationRenditionSelection');
  }
}

/// A complex type that describes an S3 location where recorded videos will be
/// stored.
class S3DestinationConfiguration {
  /// Location (S3 bucket name) where recorded videos will be stored.
  final String bucketName;

  S3DestinationConfiguration({
    required this.bucketName,
  });

  factory S3DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DestinationConfiguration(
      bucketName: json['bucketName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    return {
      'bucketName': bucketName,
    };
  }
}

/// Specifies information needed to stream using the SRT protocol.
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

class StopStreamResponse {
  StopStreamResponse();

  factory StopStreamResponse.fromJson(Map<String, dynamic> _) {
    return StopStreamResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies a live video stream that has been ingested and distributed.
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
      health: (json['health'] as String?)?.toStreamHealth(),
      playbackUrl: json['playbackUrl'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      state: (json['state'] as String?)?.toStreamState(),
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
      if (health != null) 'health': health.toValue(),
      if (playbackUrl != null) 'playbackUrl': playbackUrl,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (state != null) 'state': state.toValue(),
      if (streamId != null) 'streamId': streamId,
      if (viewerCount != null) 'viewerCount': viewerCount,
    };
  }
}

/// Object specifying a stream’s events. For a list of events, see <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/eventbridge.html">Using
/// Amazon EventBridge with Amazon IVS</a>.
class StreamEvent {
  /// Time when the event occurred. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? eventTime;

  /// Name that identifies the stream event within a <code>type</code>.
  final String? name;

  /// Logical group for certain events.
  final String? type;

  StreamEvent({
    this.eventTime,
    this.name,
    this.type,
  });

  factory StreamEvent.fromJson(Map<String, dynamic> json) {
    return StreamEvent(
      eventTime: timeStampFromJson(json['eventTime']),
      name: json['name'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventTime = this.eventTime;
    final name = this.name;
    final type = this.type;
    return {
      if (eventTime != null) 'eventTime': iso8601ToJson(eventTime),
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    };
  }
}

/// Object specifying the stream attribute on which to filter.
class StreamFilters {
  /// The stream’s health.
  final StreamHealth? health;

  StreamFilters({
    this.health,
  });

  Map<String, dynamic> toJson() {
    final health = this.health;
    return {
      if (health != null) 'health': health.toValue(),
    };
  }
}

enum StreamHealth {
  healthy,
  starving,
  unknown,
}

extension StreamHealthValueExtension on StreamHealth {
  String toValue() {
    switch (this) {
      case StreamHealth.healthy:
        return 'HEALTHY';
      case StreamHealth.starving:
        return 'STARVING';
      case StreamHealth.unknown:
        return 'UNKNOWN';
    }
  }
}

extension StreamHealthFromString on String {
  StreamHealth toStreamHealth() {
    switch (this) {
      case 'HEALTHY':
        return StreamHealth.healthy;
      case 'STARVING':
        return StreamHealth.starving;
      case 'UNKNOWN':
        return StreamHealth.unknown;
    }
    throw Exception('$this is not known in enum StreamHealth');
  }
}

/// Object specifying a stream key.
class StreamKey {
  /// Stream-key ARN.
  final String? arn;

  /// Channel ARN for the stream.
  final String? channelArn;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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

/// Summary information about a stream key.
class StreamKeySummary {
  /// Stream-key ARN.
  final String? arn;

  /// Channel ARN for the stream.
  final String? channelArn;

  /// Tags attached to the resource. Array of 1-50 maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services Resources</a> for more information, including
  /// restrictions that apply to tags and "Tag naming limits and requirements";
  /// Amazon IVS has no service-specific constraints beyond what is documented
  /// there.
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

/// Object that captures the Amazon IVS configuration that the customer
/// provisioned, the ingest configurations that the broadcaster used, and the
/// most recent Amazon IVS stream events it encountered.
class StreamSession {
  /// The properties of the channel at the time of going live.
  final Channel? channel;

  /// Time when the channel went offline. This is an ISO 8601 timestamp; <i>note
  /// that this is returned as a string</i>. For live streams, this is
  /// <code>NULL</code>.
  final DateTime? endTime;

  /// The properties of the incoming RTMP stream for the stream.
  final IngestConfiguration? ingestConfiguration;

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
      recordingConfiguration: json['recordingConfiguration'] != null
          ? RecordingConfiguration.fromJson(
              json['recordingConfiguration'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['startTime']),
      streamId: json['streamId'] as String?,
      truncatedEvents: (json['truncatedEvents'] as List?)
          ?.whereNotNull()
          .map((e) => StreamEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final endTime = this.endTime;
    final ingestConfiguration = this.ingestConfiguration;
    final recordingConfiguration = this.recordingConfiguration;
    final startTime = this.startTime;
    final streamId = this.streamId;
    final truncatedEvents = this.truncatedEvents;
    return {
      if (channel != null) 'channel': channel,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (ingestConfiguration != null)
        'ingestConfiguration': ingestConfiguration,
      if (recordingConfiguration != null)
        'recordingConfiguration': recordingConfiguration,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (streamId != null) 'streamId': streamId,
      if (truncatedEvents != null) 'truncatedEvents': truncatedEvents,
    };
  }
}

/// Summary information about a stream session.
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

enum StreamState {
  live,
  offline,
}

extension StreamStateValueExtension on StreamState {
  String toValue() {
    switch (this) {
      case StreamState.live:
        return 'LIVE';
      case StreamState.offline:
        return 'OFFLINE';
    }
  }
}

extension StreamStateFromString on String {
  StreamState toStreamState() {
    switch (this) {
      case 'LIVE':
        return StreamState.live;
      case 'OFFLINE':
        return StreamState.offline;
    }
    throw Exception('$this is not known in enum StreamState');
  }
}

/// Summary information about a stream.
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
      health: (json['health'] as String?)?.toStreamHealth(),
      startTime: timeStampFromJson(json['startTime']),
      state: (json['state'] as String?)?.toStreamState(),
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
      if (health != null) 'health': health.toValue(),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (state != null) 'state': state.toValue(),
      if (streamId != null) 'streamId': streamId,
      if (viewerCount != null) 'viewerCount': viewerCount,
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

/// An object representing a configuration of thumbnails for recorded video.
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
  /// <b>Important:</b> For the <code>BASIC</code> channel type, setting a value
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
      recordingMode: (json['recordingMode'] as String?)?.toRecordingMode(),
      resolution:
          (json['resolution'] as String?)?.toThumbnailConfigurationResolution(),
      storage: (json['storage'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toThumbnailConfigurationStorage())
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
      if (recordingMode != null) 'recordingMode': recordingMode.toValue(),
      if (resolution != null) 'resolution': resolution.toValue(),
      if (storage != null) 'storage': storage.map((e) => e.toValue()).toList(),
      if (targetIntervalSeconds != null)
        'targetIntervalSeconds': targetIntervalSeconds,
    };
  }
}

enum ThumbnailConfigurationResolution {
  fullHd,
  hd,
  sd,
  lowestResolution,
}

extension ThumbnailConfigurationResolutionValueExtension
    on ThumbnailConfigurationResolution {
  String toValue() {
    switch (this) {
      case ThumbnailConfigurationResolution.fullHd:
        return 'FULL_HD';
      case ThumbnailConfigurationResolution.hd:
        return 'HD';
      case ThumbnailConfigurationResolution.sd:
        return 'SD';
      case ThumbnailConfigurationResolution.lowestResolution:
        return 'LOWEST_RESOLUTION';
    }
  }
}

extension ThumbnailConfigurationResolutionFromString on String {
  ThumbnailConfigurationResolution toThumbnailConfigurationResolution() {
    switch (this) {
      case 'FULL_HD':
        return ThumbnailConfigurationResolution.fullHd;
      case 'HD':
        return ThumbnailConfigurationResolution.hd;
      case 'SD':
        return ThumbnailConfigurationResolution.sd;
      case 'LOWEST_RESOLUTION':
        return ThumbnailConfigurationResolution.lowestResolution;
    }
    throw Exception(
        '$this is not known in enum ThumbnailConfigurationResolution');
  }
}

enum ThumbnailConfigurationStorage {
  sequential,
  latest,
}

extension ThumbnailConfigurationStorageValueExtension
    on ThumbnailConfigurationStorage {
  String toValue() {
    switch (this) {
      case ThumbnailConfigurationStorage.sequential:
        return 'SEQUENTIAL';
      case ThumbnailConfigurationStorage.latest:
        return 'LATEST';
    }
  }
}

extension ThumbnailConfigurationStorageFromString on String {
  ThumbnailConfigurationStorage toThumbnailConfigurationStorage() {
    switch (this) {
      case 'SEQUENTIAL':
        return ThumbnailConfigurationStorage.sequential;
      case 'LATEST':
        return ThumbnailConfigurationStorage.latest;
    }
    throw Exception('$this is not known in enum ThumbnailConfigurationStorage');
  }
}

enum TranscodePreset {
  higherBandwidthDelivery,
  constrainedBandwidthDelivery,
}

extension TranscodePresetValueExtension on TranscodePreset {
  String toValue() {
    switch (this) {
      case TranscodePreset.higherBandwidthDelivery:
        return 'HIGHER_BANDWIDTH_DELIVERY';
      case TranscodePreset.constrainedBandwidthDelivery:
        return 'CONSTRAINED_BANDWIDTH_DELIVERY';
    }
  }
}

extension TranscodePresetFromString on String {
  TranscodePreset toTranscodePreset() {
    switch (this) {
      case 'HIGHER_BANDWIDTH_DELIVERY':
        return TranscodePreset.higherBandwidthDelivery;
      case 'CONSTRAINED_BANDWIDTH_DELIVERY':
        return TranscodePreset.constrainedBandwidthDelivery;
    }
    throw Exception('$this is not known in enum TranscodePreset');
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

/// Object specifying a stream’s video configuration, as set up by the
/// broadcaster (usually in an encoder). This is part of the
/// <a>IngestConfiguration</a> object and used for monitoring stream health.
class VideoConfiguration {
  /// Indicates the degree of required decoder performance for a profile. Normally
  /// this is set automatically by the encoder. For details, see the H.264
  /// specification.
  final String? avcLevel;

  /// Indicates to the decoder the requirements for decoding the stream. For
  /// definitions of the valid values, see the H.264 specification.
  final String? avcProfile;

  /// Codec used for the video encoding.
  final String? codec;

  /// Software or hardware used to encode the video.
  final String? encoder;

  /// The expected ingest bitrate (bits per second). This is configured in the
  /// encoder.
  final int? targetBitrate;

  /// The expected ingest framerate. This is configured in the encoder.
  final int? targetFramerate;

  /// Video-resolution height in pixels.
  final int? videoHeight;

  /// Video-resolution width in pixels.
  final int? videoWidth;

  VideoConfiguration({
    this.avcLevel,
    this.avcProfile,
    this.codec,
    this.encoder,
    this.targetBitrate,
    this.targetFramerate,
    this.videoHeight,
    this.videoWidth,
  });

  factory VideoConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoConfiguration(
      avcLevel: json['avcLevel'] as String?,
      avcProfile: json['avcProfile'] as String?,
      codec: json['codec'] as String?,
      encoder: json['encoder'] as String?,
      targetBitrate: json['targetBitrate'] as int?,
      targetFramerate: json['targetFramerate'] as int?,
      videoHeight: json['videoHeight'] as int?,
      videoWidth: json['videoWidth'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final avcLevel = this.avcLevel;
    final avcProfile = this.avcProfile;
    final codec = this.codec;
    final encoder = this.encoder;
    final targetBitrate = this.targetBitrate;
    final targetFramerate = this.targetFramerate;
    final videoHeight = this.videoHeight;
    final videoWidth = this.videoWidth;
    return {
      if (avcLevel != null) 'avcLevel': avcLevel,
      if (avcProfile != null) 'avcProfile': avcProfile,
      if (codec != null) 'codec': codec,
      if (encoder != null) 'encoder': encoder,
      if (targetBitrate != null) 'targetBitrate': targetBitrate,
      if (targetFramerate != null) 'targetFramerate': targetFramerate,
      if (videoHeight != null) 'videoHeight': videoHeight,
      if (videoWidth != null) 'videoWidth': videoWidth,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ChannelNotBroadcasting extends _s.GenericAwsException {
  ChannelNotBroadcasting({String? type, String? message})
      : super(type: type, code: 'ChannelNotBroadcasting', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class PendingVerification extends _s.GenericAwsException {
  PendingVerification({String? type, String? message})
      : super(type: type, code: 'PendingVerification', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class StreamUnavailable extends _s.GenericAwsException {
  StreamUnavailable({String? type, String? message})
      : super(type: type, code: 'StreamUnavailable', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

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
  'StreamUnavailable': (type, message) =>
      StreamUnavailable(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
