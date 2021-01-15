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

part '2020-07-14.g.dart';

/// <b>Introduction</b>
///
/// The Amazon Interactive Video Service (IVS) API is REST compatible, using a
/// standard HTTP API and an <a href="http://aws.amazon.com/sns">AWS SNS</a>
/// event stream for responses. JSON is used for both requests and responses,
/// including errors.
///
/// The API is an AWS regional service, currently in these regions: us-west-2,
/// us-east-1, and eu-west-1.
///
/// <i> <b>All API request parameters and URLs are case sensitive. </b> </i>
///
/// For a summary of notable documentation changes in each release, see <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/doc-history.html">
/// Document History</a>.
///
/// <b>Service Endpoints</b>
///
/// The following are the Amazon IVS service endpoints (all HTTPS):
///
/// Region name: US West (Oregon)
///
/// <ul>
/// <li>
/// Region: <code>us-west-2</code>
/// </li>
/// <li>
/// Endpoint: <code>ivs.us-west-2.amazonaws.com</code>
/// </li>
/// </ul>
/// Region name: US East (Virginia)
///
/// <ul>
/// <li>
/// Region: <code>us-east-1</code>
/// </li>
/// <li>
/// Endpoint: <code>ivs.us-east-1.amazonaws.com</code>
/// </li>
/// </ul>
/// Region name: EU West (Dublin)
///
/// <ul>
/// <li>
/// Region: <code>eu-west-1</code>
/// </li>
/// <li>
/// Endpoint: <code>ivs.eu-west-1.amazonaws.com</code>
/// </li>
/// </ul>
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
/// <b>Resources</b>
///
/// The following resources contain information about your IVS live stream (see
/// <a href="https://docs.aws.amazon.com/ivs/latest/userguide/GSIVS.html">
/// Getting Started with Amazon IVS</a>):
///
/// <ul>
/// <li>
/// Channel — Stores configuration data related to your live stream. You first
/// create a channel and then use the channel’s stream key to start your live
/// stream. See the Channel endpoints for more information.
/// </li>
/// <li>
/// Stream key — An identifier assigned by Amazon IVS when you create a channel,
/// which is then used to authorize streaming. See the StreamKey endpoints for
/// more information. <i> <b>Treat the stream key like a secret, since it allows
/// anyone to stream to the channel.</b> </i>
/// </li>
/// <li>
/// Playback key pair — Video playback may be restricted using
/// playback-authorization tokens, which use public-key encryption. A playback
/// key pair is the public-private pair of keys used to sign and validate the
/// playback-authorization token. See the PlaybackKeyPair endpoints for more
/// information.
/// </li>
/// </ul>
/// <b>Tagging</b>
///
/// A <i>tag</i> is a metadata label that you assign to an AWS resource. A tag
/// comprises a <i>key</i> and a <i>value</i>, both set by you. For example, you
/// might set a tag as <code>topic:nature</code> to label a particular video
/// category. See <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// AWS Resources</a> for more information, including restrictions that apply to
/// tags.
///
/// Tags can help you identify and organize your AWS resources. For example, you
/// can use the same tag for different resources to indicate that they are
/// related. You can also use tags to manage access (see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">
/// Access Tags</a>).
///
/// The Amazon IVS API has these tag-related endpoints: <a>TagResource</a>,
/// <a>UntagResource</a>, and <a>ListTagsForResource</a>. The following
/// resources support tagging: Channels, Stream Keys, and Playback Key Pairs.
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
/// ARN (Amazon Resource Name).
/// </li>
/// <li>
/// <a>BatchGetChannel</a> — Performs <a>GetChannel</a> on multiple ARNs
/// simultaneously.
/// </li>
/// <li>
/// <a>ListChannels</a> — Gets summary information about all channels in your
/// account, in the AWS region where the API request is processed. This list can
/// be filtered to match a specified string.
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
/// <b>StreamKey Endpoints</b>
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
/// <b>Stream Endpoints</b>
///
/// <ul>
/// <li>
/// <a>GetStream</a> — Gets information about the active (live) stream on a
/// specified channel.
/// </li>
/// <li>
/// <a>ListStreams</a> — Gets summary information about live streams in your
/// account, in the AWS region where the API request is processed.
/// </li>
/// <li>
/// <a>StopStream</a> — Disconnects the incoming RTMPS stream for the specified
/// channel. Can be used in conjunction with <a>DeleteStreamKey</a> to prevent
/// further streaming to a channel.
/// </li>
/// <li>
/// <a>PutMetadata</a> — Inserts metadata into an RTMPS stream for the specified
/// channel. A maximum of 5 requests per second per channel is allowed, each
/// with a maximum 1KB payload.
/// </li>
/// </ul>
/// <b>PlaybackKeyPair Endpoints</b>
///
/// <ul>
/// <li>
/// <a>ImportPlaybackKeyPair</a> — Imports the public portion of a new key pair
/// and returns its <code>arn</code> and <code>fingerprint</code>. The
/// <code>privateKey</code> can then be used to generate viewer authorization
/// tokens, to grant viewers access to authorized channels.
/// </li>
/// <li>
/// <a>GetPlaybackKeyPair</a> — Gets a specified playback authorization key pair
/// and returns the <code>arn</code> and <code>fingerprint</code>. The
/// <code>privateKey</code> held by the caller can be used to generate viewer
/// authorization tokens, to grant viewers access to authorized channels.
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
/// </ul>
/// <b>AWS Tags Endpoints</b>
///
/// <ul>
/// <li>
/// <a>TagResource</a> — Adds or updates tags for the AWS resource with the
/// specified ARN.
/// </li>
/// <li>
/// <a>UntagResource</a> — Removes tags from the resource with the specified
/// ARN.
/// </li>
/// <li>
/// <a>ListTagsForResource</a> — Gets information about AWS tags for the
/// specified ARN.
/// </li>
/// </ul>
class Ivs {
  final _s.RestJsonProtocol _protocol;
  Ivs({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ivs',
            signingName: 'ivs',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Performs <a>GetChannel</a> on multiple ARNs simultaneously.
  ///
  /// Parameter [arns] :
  /// Array of ARNs, one per channel.
  Future<BatchGetChannelResponse> batchGetChannel({
    @_s.required List<String> arns,
  }) async {
    ArgumentError.checkNotNull(arns, 'arns');
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
  /// Array of ARNs, one per channel.
  Future<BatchGetStreamKeyResponse> batchGetStreamKey({
    @_s.required List<String> arns,
  }) async {
    ArgumentError.checkNotNull(arns, 'arns');
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

  /// Creates a new channel and an associated stream key to start streaming.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [authorized] :
  /// Whether the channel is authorized. Default: <code>false</code>.
  ///
  /// Parameter [latencyMode] :
  /// Channel latency mode. Default: <code>LOW</code>.
  ///
  /// Parameter [name] :
  /// Channel name.
  ///
  /// Parameter [tags] :
  /// See <a>Channel$tags</a>.
  ///
  /// Parameter [type] :
  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable resolution or bitrate, the stream probably will
  /// disconnect immediately.</i> Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>STANDARD</code>: Multiple qualities are generated from the original
  /// input, to automatically give viewers the best experience for their devices
  /// and network conditions. Vertical resolution can be up to 1080 and bitrate
  /// can be up to 8.5 Mbps.
  /// </li>
  /// <li>
  /// <code>BASIC</code>: Amazon IVS delivers the original input to viewers. The
  /// viewer’s video-quality choice is limited to the original input. Vertical
  /// resolution can be up to 480 and bitrate can be up to 1.5 Mbps.
  /// </li>
  /// </ul>
  /// Default: <code>STANDARD</code>.
  Future<CreateChannelResponse> createChannel({
    bool authorized,
    ChannelLatencyMode latencyMode,
    String name,
    Map<String, String> tags,
    ChannelType type,
  }) async {
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9-_]*$''',
    );
    final $payload = <String, dynamic>{
      if (authorized != null) 'authorized': authorized,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
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

  /// Creates a stream key, used to initiate a stream, for the specified channel
  /// ARN.
  ///
  /// Note that <a>CreateChannel</a> creates a stream key. If you subsequently
  /// use CreateStreamKey on the same channel, it will fail because a stream key
  /// already exists and there is a limit of 1 stream key per channel. To reset
  /// the stream key on a channel, use <a>DeleteStreamKey</a> and then
  /// CreateStreamKey.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel for which to create the stream key.
  ///
  /// Parameter [tags] :
  /// See <a>Channel$tags</a>.
  Future<CreateStreamKeyResponse> createStreamKey({
    @_s.required String channelArn,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [arn] :
  /// ARN of the channel to be deleted.
  Future<void> deleteChannel({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
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
  /// tokens generated using the key pair’s <code>privateKey</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [arn] :
  /// ARN of the key pair to be deleted.
  Future<void> deletePlaybackKeyPair({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:playback-key/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeletePlaybackKeyPair',
      exceptionFnMap: _exceptionFns,
    );
    return DeletePlaybackKeyPairResponse.fromJson(response);
  }

  /// Deletes the stream key for the specified ARN, so it can no longer be used
  /// to stream.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [arn] :
  /// ARN of the stream key to be deleted.
  Future<void> deleteStreamKey({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:stream-key/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// ARN of the channel for which the configuration is to be retrieved.
  Future<GetChannelResponse> getChannel({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
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
  /// grant viewers access to authorized channels.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// ARN of the key pair to be returned.
  Future<GetPlaybackKeyPairResponse> getPlaybackKeyPair({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:playback-key/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
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

  /// Gets information about the active (live) stream on a specified channel.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ChannelNotBroadcasting].
  ///
  /// Parameter [channelArn] :
  /// Channel ARN for stream to be accessed.
  Future<GetStreamResponse> getStream({
    @_s.required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// ARN for the stream key to be retrieved.
  Future<GetStreamKeyResponse> getStreamKey({
    @_s.required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:stream-key/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
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

  /// Imports the public portion of a new key pair and returns its
  /// <code>arn</code> and <code>fingerprint</code>. The <code>privateKey</code>
  /// can then be used to generate viewer authorization tokens, to grant viewers
  /// access to authorized channels.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [publicKeyMaterial] :
  /// The public portion of a customer-generated key pair.
  ///
  /// Parameter [name] :
  /// An arbitrary string (a nickname) assigned to a playback key pair that
  /// helps the customer identify that resource. The value does not need to be
  /// unique.
  ///
  /// Parameter [tags] :
  /// Any tags provided with the request are added to the playback key pair
  /// tags.
  Future<ImportPlaybackKeyPairResponse> importPlaybackKeyPair({
    @_s.required String publicKeyMaterial,
    String name,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(publicKeyMaterial, 'publicKeyMaterial');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9-_]*$''',
    );
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

  /// Gets summary information about all channels in your account, in the AWS
  /// region where the API request is processed. This list can be filtered to
  /// match a specified string.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filterByName] :
  /// Filters the channel list to match the specified name.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of channels to return.
  ///
  /// Parameter [nextToken] :
  /// The first channel to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListChannelsResponse> listChannels({
    String filterByName,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'filterByName',
      filterByName,
      0,
      128,
    );
    _s.validateStringPattern(
      'filterByName',
      filterByName,
      r'''^[a-zA-Z0-9-_]*$''',
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      500,
    );
    final $payload = <String, dynamic>{
      if (filterByName != null) 'filterByName': filterByName,
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

  /// Gets summary information about playback key pairs.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The first key pair to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  ///
  /// Parameter [nextToken] :
  /// Maximum number of key pairs to return.
  Future<ListPlaybackKeyPairsResponse> listPlaybackKeyPairs({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      500,
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

  /// Gets summary information about stream keys for the specified channel.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelArn] :
  /// Channel ARN used to filter the list.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of streamKeys to return.
  ///
  /// Parameter [nextToken] :
  /// The first stream key to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStreamKeysResponse> listStreamKeys({
    @_s.required String channelArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      500,
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

  /// Gets summary information about live streams in your account, in the AWS
  /// region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of streams to return.
  ///
  /// Parameter [nextToken] :
  /// The first stream to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStreamsResponse> listStreams({
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      500,
    );
    final $payload = <String, dynamic>{
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

  /// Gets information about AWS tags for the specified ARN.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be retrieved.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of tags to return.
  ///
  /// Parameter [nextToken] :
  /// The first tag to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:[a-z-]/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Inserts metadata into an RTMPS stream for the specified channel. A maximum
  /// of 5 requests per second per channel is allowed, each with a maximum 1KB
  /// payload.
  ///
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ChannelNotBroadcasting].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel into which metadata is inserted. This channel must have
  /// an active stream.
  ///
  /// Parameter [metadata] :
  /// Metadata to insert into the stream. Maximum: 1 KB per request.
  Future<void> putMetadata({
    @_s.required String channelArn,
    @_s.required String metadata,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(metadata, 'metadata');
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
  /// May throw [ChannelNotBroadcasting].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [StreamUnavailable].
  ///
  /// Parameter [channelArn] :
  /// ARN of the channel for which the stream is to be stopped.
  Future<void> stopStream({
    @_s.required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopStream',
      exceptionFnMap: _exceptionFns,
    );
    return StopStreamResponse.fromJson(response);
  }

  /// Adds or updates tags for the AWS resource with the specified ARN.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags are to be added or updated.
  ///
  /// Parameter [tags] :
  /// Array of tags to be added or updated.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:[a-z-]/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
  }

  /// Removes tags from the resource with the specified ARN.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags are to be removed.
  ///
  /// Parameter [tagKeys] :
  /// Array of tags to be removed.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:[a-z-]/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
  }

  /// Updates a channel's configuration. This does not affect an ongoing stream
  /// of this channel. You must stop and restart the stream for the changes to
  /// take effect.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [arn] :
  /// ARN of the channel to be updated.
  ///
  /// Parameter [authorized] :
  /// Whether the channel is authorized. Default: <code>false</code>.
  ///
  /// Parameter [latencyMode] :
  /// Channel latency mode. Default: <code>LOW</code>.
  ///
  /// Parameter [name] :
  /// Channel name.
  ///
  /// Parameter [type] :
  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable resolution or bitrate, the stream probably will
  /// disconnect immediately.</i> Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>STANDARD</code>: Multiple qualities are generated from the original
  /// input, to automatically give viewers the best experience for their devices
  /// and network conditions. Vertical resolution can be up to 1080 and bitrate
  /// can be up to 8.5 Mbps.
  /// </li>
  /// <li>
  /// <code>BASIC</code>: Amazon IVS delivers the original input to viewers. The
  /// viewer’s video-quality choice is limited to the original input. Vertical
  /// resolution can be up to 480 and bitrate can be up to 1.5 Mbps.
  /// </li>
  /// </ul>
  /// Default: <code>STANDARD</code>.
  Future<UpdateChannelResponse> updateChannel({
    @_s.required String arn,
    bool authorized,
    ChannelLatencyMode latencyMode,
    String name,
    ChannelType type,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'arn',
      arn,
      r'''^arn:aws:[is]vs:[a-z0-9-]+:[0-9]+:channel/[a-zA-Z0-9-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^[a-zA-Z0-9-_]*$''',
    );
    final $payload = <String, dynamic>{
      'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
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
}

/// Error related to a specific channel, specified by its ARN.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchError {
  /// Channel ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Error code.
  @_s.JsonKey(name: 'code')
  final String code;

  /// Error message, determined by the application.
  @_s.JsonKey(name: 'message')
  final String message;

  BatchError({
    this.arn,
    this.code,
    this.message,
  });
  factory BatchError.fromJson(Map<String, dynamic> json) =>
      _$BatchErrorFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetChannelResponse {
  @_s.JsonKey(name: 'channels')
  final List<Channel> channels;

  /// Each error object is related to a specific ARN in the request.
  @_s.JsonKey(name: 'errors')
  final List<BatchError> errors;

  BatchGetChannelResponse({
    this.channels,
    this.errors,
  });
  factory BatchGetChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetStreamKeyResponse {
  @_s.JsonKey(name: 'errors')
  final List<BatchError> errors;
  @_s.JsonKey(name: 'streamKeys')
  final List<StreamKey> streamKeys;

  BatchGetStreamKeyResponse({
    this.errors,
    this.streamKeys,
  });
  factory BatchGetStreamKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetStreamKeyResponseFromJson(json);
}

/// Object specifying a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Channel {
  /// Channel ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Whether the channel is authorized.
  @_s.JsonKey(name: 'authorized')
  final bool authorized;

  /// Channel ingest endpoint, part of the definition of an ingest server, used
  /// when you set up streaming software.
  @_s.JsonKey(name: 'ingestEndpoint')
  final String ingestEndpoint;

  /// Channel latency mode. Default: <code>LOW</code>.
  @_s.JsonKey(name: 'latencyMode')
  final ChannelLatencyMode latencyMode;

  /// Channel name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Channel playback URL.
  @_s.JsonKey(name: 'playbackUrl')
  final String playbackUrl;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable resolution or bitrate, the stream probably will
  /// disconnect immediately.</i> Valid values:
  ///
  /// <ul>
  /// <li>
  /// <code>STANDARD</code>: Multiple qualities are generated from the original
  /// input, to automatically give viewers the best experience for their devices
  /// and network conditions. Vertical resolution can be up to 1080 and bitrate
  /// can be up to 8.5 Mbps.
  /// </li>
  /// <li>
  /// <code>BASIC</code>: Amazon IVS delivers the original input to viewers. The
  /// viewer’s video-quality choice is limited to the original input. Vertical
  /// resolution can be up to 480 and bitrate can be up to 1.5 Mbps.
  /// </li>
  /// </ul>
  /// Default: <code>STANDARD</code>.
  @_s.JsonKey(name: 'type')
  final ChannelType type;

  Channel({
    this.arn,
    this.authorized,
    this.ingestEndpoint,
    this.latencyMode,
    this.name,
    this.playbackUrl,
    this.tags,
    this.type,
  });
  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

enum ChannelLatencyMode {
  @_s.JsonValue('NORMAL')
  normal,
  @_s.JsonValue('LOW')
  low,
}

extension on ChannelLatencyMode {
  String toValue() {
    switch (this) {
      case ChannelLatencyMode.normal:
        return 'NORMAL';
      case ChannelLatencyMode.low:
        return 'LOW';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Summary information about a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelSummary {
  /// Channel ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Whether the channel is authorized.
  @_s.JsonKey(name: 'authorized')
  final bool authorized;

  /// Channel latency mode. Default: <code>LOW</code>.
  @_s.JsonKey(name: 'latencyMode')
  final ChannelLatencyMode latencyMode;

  /// Channel name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ChannelSummary({
    this.arn,
    this.authorized,
    this.latencyMode,
    this.name,
    this.tags,
  });
  factory ChannelSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelSummaryFromJson(json);
}

enum ChannelType {
  @_s.JsonValue('BASIC')
  basic,
  @_s.JsonValue('STANDARD')
  standard,
}

extension on ChannelType {
  String toValue() {
    switch (this) {
      case ChannelType.basic:
        return 'BASIC';
      case ChannelType.standard:
        return 'STANDARD';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateChannelResponse {
  @_s.JsonKey(name: 'channel')
  final Channel channel;
  @_s.JsonKey(name: 'streamKey')
  final StreamKey streamKey;

  CreateChannelResponse({
    this.channel,
    this.streamKey,
  });
  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateStreamKeyResponse {
  /// Stream key used to authenticate an RTMPS stream for ingestion.
  @_s.JsonKey(name: 'streamKey')
  final StreamKey streamKey;

  CreateStreamKeyResponse({
    this.streamKey,
  });
  factory CreateStreamKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateStreamKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeletePlaybackKeyPairResponse {
  DeletePlaybackKeyPairResponse();
  factory DeletePlaybackKeyPairResponse.fromJson(Map<String, dynamic> json) =>
      _$DeletePlaybackKeyPairResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetChannelResponse {
  @_s.JsonKey(name: 'channel')
  final Channel channel;

  GetChannelResponse({
    this.channel,
  });
  factory GetChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPlaybackKeyPairResponse {
  @_s.JsonKey(name: 'keyPair')
  final PlaybackKeyPair keyPair;

  GetPlaybackKeyPairResponse({
    this.keyPair,
  });
  factory GetPlaybackKeyPairResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlaybackKeyPairResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStreamKeyResponse {
  @_s.JsonKey(name: 'streamKey')
  final StreamKey streamKey;

  GetStreamKeyResponse({
    this.streamKey,
  });
  factory GetStreamKeyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStreamKeyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetStreamResponse {
  @_s.JsonKey(name: 'stream')
  final Stream stream;

  GetStreamResponse({
    this.stream,
  });
  factory GetStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$GetStreamResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportPlaybackKeyPairResponse {
  @_s.JsonKey(name: 'keyPair')
  final PlaybackKeyPair keyPair;

  ImportPlaybackKeyPairResponse({
    this.keyPair,
  });
  factory ImportPlaybackKeyPairResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportPlaybackKeyPairResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelsResponse {
  /// List of the matching channels.
  @_s.JsonKey(name: 'channels')
  final List<ChannelSummary> channels;

  /// If there are more channels than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListChannelsResponse({
    @_s.required this.channels,
    this.nextToken,
  });
  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPlaybackKeyPairsResponse {
  /// List of key pairs.
  @_s.JsonKey(name: 'keyPairs')
  final List<PlaybackKeyPairSummary> keyPairs;

  /// If there are more key pairs than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListPlaybackKeyPairsResponse({
    @_s.required this.keyPairs,
    this.nextToken,
  });
  factory ListPlaybackKeyPairsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPlaybackKeyPairsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStreamKeysResponse {
  /// List of stream keys.
  @_s.JsonKey(name: 'streamKeys')
  final List<StreamKeySummary> streamKeys;

  /// If there are more stream keys than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListStreamKeysResponse({
    @_s.required this.streamKeys,
    this.nextToken,
  });
  factory ListStreamKeysResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStreamKeysResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListStreamsResponse {
  /// List of streams.
  @_s.JsonKey(name: 'streams')
  final List<StreamSummary> streams;

  /// If there are more streams than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListStreamsResponse({
    @_s.required this.streams,
    this.nextToken,
  });
  factory ListStreamsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListStreamsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// If there are more tags than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListTagsForResourceResponse({
    @_s.required this.tags,
    this.nextToken,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// A key pair used to sign and validate a playback authorization token.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PlaybackKeyPair {
  /// Key-pair ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Key-pair identifier.
  @_s.JsonKey(name: 'fingerprint')
  final String fingerprint;

  /// Key-pair name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  PlaybackKeyPair({
    this.arn,
    this.fingerprint,
    this.name,
    this.tags,
  });
  factory PlaybackKeyPair.fromJson(Map<String, dynamic> json) =>
      _$PlaybackKeyPairFromJson(json);
}

/// Summary information about a playback key pair.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PlaybackKeyPairSummary {
  /// Key-pair ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Key-pair name.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  PlaybackKeyPairSummary({
    this.arn,
    this.name,
    this.tags,
  });
  factory PlaybackKeyPairSummary.fromJson(Map<String, dynamic> json) =>
      _$PlaybackKeyPairSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopStreamResponse {
  StopStreamResponse();
  factory StopStreamResponse.fromJson(Map<String, dynamic> json) =>
      _$StopStreamResponseFromJson(json);
}

/// Specifies a live video stream that has been ingested and distributed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Stream {
  /// Channel ARN for the stream.
  @_s.JsonKey(name: 'channelArn')
  final String channelArn;

  /// The stream’s health.
  @_s.JsonKey(name: 'health')
  final StreamHealth health;

  /// URL of the video master manifest, required by the video player to play the
  /// HLS stream.
  @_s.JsonKey(name: 'playbackUrl')
  final String playbackUrl;

  /// ISO-8601 formatted timestamp of the stream’s start.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The stream’s state.
  @_s.JsonKey(name: 'state')
  final StreamState state;

  /// Number of current viewers of the stream.
  @_s.JsonKey(name: 'viewerCount')
  final int viewerCount;

  Stream({
    this.channelArn,
    this.health,
    this.playbackUrl,
    this.startTime,
    this.state,
    this.viewerCount,
  });
  factory Stream.fromJson(Map<String, dynamic> json) => _$StreamFromJson(json);
}

enum StreamHealth {
  @_s.JsonValue('HEALTHY')
  healthy,
  @_s.JsonValue('STARVING')
  starving,
  @_s.JsonValue('UNKNOWN')
  unknown,
}

/// Object specifying a stream key.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamKey {
  /// Stream-key ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Channel ARN for the stream.
  @_s.JsonKey(name: 'channelArn')
  final String channelArn;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Stream-key value.
  @_s.JsonKey(name: 'value')
  final String value;

  StreamKey({
    this.arn,
    this.channelArn,
    this.tags,
    this.value,
  });
  factory StreamKey.fromJson(Map<String, dynamic> json) =>
      _$StreamKeyFromJson(json);
}

/// Summary information about a stream key.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamKeySummary {
  /// Stream-key ARN.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Channel ARN for the stream.
  @_s.JsonKey(name: 'channelArn')
  final String channelArn;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  StreamKeySummary({
    this.arn,
    this.channelArn,
    this.tags,
  });
  factory StreamKeySummary.fromJson(Map<String, dynamic> json) =>
      _$StreamKeySummaryFromJson(json);
}

enum StreamState {
  @_s.JsonValue('LIVE')
  live,
  @_s.JsonValue('OFFLINE')
  offline,
}

/// Summary information about a stream.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StreamSummary {
  /// Channel ARN for the stream.
  @_s.JsonKey(name: 'channelArn')
  final String channelArn;

  /// The stream’s health.
  @_s.JsonKey(name: 'health')
  final StreamHealth health;

  /// ISO-8601 formatted timestamp of the stream’s start.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The stream’s state.
  @_s.JsonKey(name: 'state')
  final StreamState state;

  /// Number of current viewers of the stream.
  @_s.JsonKey(name: 'viewerCount')
  final int viewerCount;

  StreamSummary({
    this.channelArn,
    this.health,
    this.startTime,
    this.state,
    this.viewerCount,
  });
  factory StreamSummary.fromJson(Map<String, dynamic> json) =>
      _$StreamSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateChannelResponse {
  @_s.JsonKey(name: 'channel')
  final Channel channel;

  UpdateChannelResponse({
    this.channel,
  });
  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelResponseFromJson(json);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ChannelNotBroadcasting extends _s.GenericAwsException {
  ChannelNotBroadcasting({String type, String message})
      : super(type: type, code: 'ChannelNotBroadcasting', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class PendingVerification extends _s.GenericAwsException {
  PendingVerification({String type, String message})
      : super(type: type, code: 'PendingVerification', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class StreamUnavailable extends _s.GenericAwsException {
  StreamUnavailable({String type, String message})
      : super(type: type, code: 'StreamUnavailable', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
