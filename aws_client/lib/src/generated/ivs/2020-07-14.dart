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

/// <b>Introduction</b>
///
/// The Amazon Interactive Video Service (IVS) API is REST compatible, using a
/// standard HTTP API and an AWS EventBridge event stream for responses. JSON is
/// used for both requests and responses, including errors.
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
/// <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/getting-started.html">
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
/// <li>
/// Recording configuration — Stores configuration related to recording a live
/// stream and where to store the recorded content. Multiple channels can
/// reference the same recording configuration. See the Recording Configuration
/// endpoints for more information.
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
/// resources support tagging: Channels, Stream Keys, Playback Key Pairs, and
/// Recording Configurations.
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
/// <i>Authorization</i> is about granting permissions. You need to be
/// authorized to view <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Amazon
/// IVS private channels</a>. (Private channels are channels that are enabled
/// for "playback authorization.")
/// </li>
/// </ul>
/// <b>Authentication</b>
///
/// All Amazon IVS API requests must be authenticated with a signature. The AWS
/// Command-Line Interface (CLI) and Amazon IVS Player SDKs take care of signing
/// the underlying API calls for you. However, if your application calls the
/// Amazon IVS API directly, it’s your responsibility to sign the requests.
///
/// You generate a signature using valid AWS credentials that have permission to
/// perform the requested action. For example, you must sign PutMetadata
/// requests with a signature generated from an IAM user account that has the
/// <code>ivs:PutMetadata</code> permission.
///
/// For more information:
///
/// <ul>
/// <li>
/// Authentication and generating signatures — See <a
/// href="https://docs.aws.amazon.com/AmazonS3/latest/API/sig-v4-authenticating-requests.html">Authenticating
/// Requests (AWS Signature Version 4)</a> in the <i>AWS General Reference</i>.
/// </li>
/// <li>
/// Managing Amazon IVS permissions — See <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/security-iam.html">Identity
/// and Access Management</a> on the Security page of the <i>Amazon IVS User
/// Guide</i>.
/// </li>
/// </ul>
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
/// be filtered to match a specified name or recording-configuration ARN.
/// Filters are mutually exclusive and cannot be used together. If you try to
/// use both filters, you will get an error (409 Conflict Exception).
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
/// <a>PutMetadata</a> — Inserts metadata into the active stream of the
/// specified channel. A maximum of 5 requests per second per channel is
/// allowed, each with a maximum 1 KB payload. (If 5 TPS is not sufficient for
/// your needs, we recommend batching your data into a single PutMetadata call.)
/// </li>
/// </ul>
/// <b>PlaybackKeyPair Endpoints</b>
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
/// </ul>
/// <b>RecordingConfiguration Endpoints</b>
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
/// recording configurations in your account, in the AWS region where the API
/// request is processed.
/// </li>
/// <li>
/// <a>DeleteRecordingConfiguration</a> — Deletes the recording configuration
/// for the specified ARN.
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
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Performs <a>GetChannel</a> on multiple ARNs simultaneously.
  ///
  /// Parameter [arns] :
  /// Array of ARNs, one per channel.
  Future<BatchGetChannelResponse> batchGetChannel({
    required List<String> arns,
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
    required List<String> arns,
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
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [authorized] :
  /// Whether the channel is private (enabled for playback authorization).
  /// Default: <code>false</code>.
  ///
  /// Parameter [latencyMode] :
  /// Channel latency mode. Use <code>NORMAL</code> to broadcast and deliver
  /// live video up to Full HD. Use <code>LOW</code> for near-real-time
  /// interaction with viewers. (Note: In the Amazon IVS console,
  /// <code>LOW</code> and <code>NORMAL</code> correspond to Ultra-low and
  /// Standard, respectively.) Default: <code>LOW</code>.
  ///
  /// Parameter [name] :
  /// Channel name.
  ///
  /// Parameter [recordingConfigurationArn] :
  /// Recording-configuration ARN. Default: "" (empty string, recording is
  /// disabled).
  ///
  /// Parameter [tags] :
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>.
  ///
  /// Parameter [type] :
  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable resolution or bitrate, the stream probably will
  /// disconnect immediately.</i> Default: <code>STANDARD</code>. Valid values:
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
  Future<CreateChannelResponse> createChannel({
    bool? authorized,
    ChannelLatencyMode? latencyMode,
    String? name,
    String? recordingConfigurationArn,
    Map<String, String>? tags,
    ChannelType? type,
  }) async {
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
    );
    _s.validateStringLength(
      'recordingConfigurationArn',
      recordingConfigurationArn,
      0,
      128,
    );
    final $payload = <String, dynamic>{
      if (authorized != null) 'authorized': authorized,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
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

  /// Creates a new recording configuration, used to enable recording to Amazon
  /// S3.
  ///
  /// <b>Known issue:</b> In the us-east-1 region, if you use the AWS CLI to
  /// create a recording configuration, it returns success even if the S3 bucket
  /// is in a different region. In this case, the <code>state</code> of the
  /// recording configuration is <code>CREATE_FAILED</code> (instead of
  /// <code>ACTIVE</code>). (In other regions, the CLI correctly returns failure
  /// if the bucket is in a different region.)
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
  /// An arbitrary string (a nickname) that helps the customer identify that
  /// resource. The value does not need to be unique.
  ///
  /// Parameter [tags] :
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>.
  Future<CreateRecordingConfigurationResponse> createRecordingConfiguration({
    required DestinationConfiguration destinationConfiguration,
    String? name,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(
        destinationConfiguration, 'destinationConfiguration');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
    );
    final $payload = <String, dynamic>{
      'destinationConfiguration': destinationConfiguration,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
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
  /// Array of 1-50 maps, each of the form <code>string:string
  /// (key:value)</code>.
  Future<CreateStreamKeyResponse> createStreamKey({
    required String channelArn,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
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
  /// If you try to delete a live channel, you will get an error (409
  /// ConflictException). To delete a channel that is live, call
  /// <a>StopStream</a>, wait for the Amazon EventBridge "Stream End" event (to
  /// verify that the stream's state was changed from Live to Offline), then
  /// call DeleteChannel. (See <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/eventbridge.html">
  /// Using EventBridge with Amazon IVS</a>.)
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
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
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
  /// tokens generated using the key pair’s <code>privateKey</code>. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
  /// Up Private Channels</a> in the <i>Amazon IVS User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [arn] :
  /// ARN of the key pair to be deleted.
  Future<void> deletePlaybackKeyPair({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
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
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      0,
      128,
      isRequired: true,
    );
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [arn] :
  /// ARN of the stream key to be deleted.
  Future<void> deleteStreamKey({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
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
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
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
  /// grant viewers access to private channels. For more information, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
  /// Up Private Channels</a> in the <i>Amazon IVS User Guide</i>.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [arn] :
  /// ARN of the key pair to be returned.
  Future<GetPlaybackKeyPairResponse> getPlaybackKeyPair({
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
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
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      0,
      128,
      isRequired: true,
    );
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ChannelNotBroadcasting].
  ///
  /// Parameter [channelArn] :
  /// Channel ARN for stream to be accessed.
  Future<GetStreamResponse> getStream({
    required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
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
    required String arn,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
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
  /// access to private channels. For more information, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/private-channels.html">Setting
  /// Up Private Channels</a> in the <i>Amazon IVS User Guide</i>.
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
    required String publicKeyMaterial,
    String? name,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(publicKeyMaterial, 'publicKeyMaterial');
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
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
  /// match a specified name or recording-configuration ARN. Filters are
  /// mutually exclusive and cannot be used together. If you try to use both
  /// filters, you will get an error (409 ConflictException).
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [filterByName] :
  /// Filters the channel list to match the specified name.
  ///
  /// Parameter [filterByRecordingConfigurationArn] :
  /// Filters the channel list to match the specified recording-configuration
  /// ARN.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of channels to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first channel to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListChannelsResponse> listChannels({
    String? filterByName,
    String? filterByRecordingConfigurationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'filterByName',
      filterByName,
      0,
      128,
    );
    _s.validateStringLength(
      'filterByRecordingConfigurationArn',
      filterByRecordingConfigurationArn,
      0,
      128,
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
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The first key pair to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// Maximum number of key pairs to return.
  Future<ListPlaybackKeyPairsResponse> listPlaybackKeyPairs({
    int? maxResults,
    String? nextToken,
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

  /// Gets summary information about all recording configurations in your
  /// account, in the AWS region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of recording configurations to return. Default: 50.
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
      requestUri: '/ListRecordingConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListRecordingConfigurationsResponse.fromJson(response);
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
  /// Maximum number of streamKeys to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first stream key to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStreamKeysResponse> listStreamKeys({
    required String channelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
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
  /// Maximum number of streams to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first stream to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStreamsResponse> listStreams({
    int? maxResults,
    String? nextToken,
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
  /// Maximum number of tags to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first tag to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      128,
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

  /// Inserts metadata into the active stream of the specified channel. A
  /// maximum of 5 requests per second per channel is allowed, each with a
  /// maximum 1 KB payload. (If 5 TPS is not sufficient for your needs, we
  /// recommend batching your data into a single PutMetadata call.) Also see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/userguide/metadata.html">Embedding
  /// Metadata within a Video Stream</a> in the <i>Amazon IVS User Guide</i>.
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
    required String channelArn,
    required String metadata,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(metadata, 'metadata');
    _s.validateStringLength(
      'metadata',
      metadata,
      1,
      1152921504606846976,
      isRequired: true,
    );
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
    required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      1,
      128,
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
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      128,
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
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  /// Whether the channel is private (enabled for playback authorization).
  ///
  /// Parameter [latencyMode] :
  /// Channel latency mode. Use <code>NORMAL</code> to broadcast and deliver
  /// live video up to Full HD. Use <code>LOW</code> for near-real-time
  /// interaction with viewers. (Note: In the Amazon IVS console,
  /// <code>LOW</code> and <code>NORMAL</code> correspond to Ultra-low and
  /// Standard, respectively.)
  ///
  /// Parameter [name] :
  /// Channel name.
  ///
  /// Parameter [recordingConfigurationArn] :
  /// Recording-configuration ARN. If this is set to an empty string, recording
  /// is disabled. A value other than an empty string indicates that recording
  /// is enabled
  ///
  /// Parameter [type] :
  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable resolution or bitrate, the stream probably will
  /// disconnect immediately</i>. Valid values:
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
  Future<UpdateChannelResponse> updateChannel({
    required String arn,
    bool? authorized,
    ChannelLatencyMode? latencyMode,
    String? name,
    String? recordingConfigurationArn,
    ChannelType? type,
  }) async {
    ArgumentError.checkNotNull(arn, 'arn');
    _s.validateStringLength(
      'arn',
      arn,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      128,
    );
    _s.validateStringLength(
      'recordingConfigurationArn',
      recordingConfigurationArn,
      0,
      128,
    );
    final $payload = <String, dynamic>{
      'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
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
}

/// Error related to a specific channel, specified by its ARN.
class BatchError {
  /// Channel ARN.
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
  final List<BatchError>? errors;
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

  /// Channel latency mode. Use <code>NORMAL</code> to broadcast and deliver live
  /// video up to Full HD. Use <code>LOW</code> for near-real-time interaction
  /// with viewers. Default: <code>LOW</code>. (Note: In the Amazon IVS console,
  /// <code>LOW</code> and <code>NORMAL</code> correspond to Ultra-low and
  /// Standard, respectively.)
  final ChannelLatencyMode? latencyMode;

  /// Channel name.
  final String? name;

  /// Channel playback URL.
  final String? playbackUrl;

  /// Recording-configuration ARN. A value other than an empty string indicates
  /// that recording is enabled. Default: "" (empty string, recording is
  /// disabled).
  final String? recordingConfigurationArn;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
  final Map<String, String>? tags;

  /// Channel type, which determines the allowable resolution and bitrate. <i>If
  /// you exceed the allowable resolution or bitrate, the stream probably will
  /// disconnect immediately.</i> Default: <code>STANDARD</code>. Valid values:
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
  final ChannelType? type;

  Channel({
    this.arn,
    this.authorized,
    this.ingestEndpoint,
    this.latencyMode,
    this.name,
    this.playbackUrl,
    this.recordingConfigurationArn,
    this.tags,
    this.type,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      arn: json['arn'] as String?,
      authorized: json['authorized'] as bool?,
      ingestEndpoint: json['ingestEndpoint'] as String?,
      latencyMode: (json['latencyMode'] as String?)?.toChannelLatencyMode(),
      name: json['name'] as String?,
      playbackUrl: json['playbackUrl'] as String?,
      recordingConfigurationArn: json['recordingConfigurationArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toChannelType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorized = this.authorized;
    final ingestEndpoint = this.ingestEndpoint;
    final latencyMode = this.latencyMode;
    final name = this.name;
    final playbackUrl = this.playbackUrl;
    final recordingConfigurationArn = this.recordingConfigurationArn;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (ingestEndpoint != null) 'ingestEndpoint': ingestEndpoint,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
      if (playbackUrl != null) 'playbackUrl': playbackUrl,
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum ChannelLatencyMode {
  normal,
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
  }
}

extension on String {
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

  /// Channel latency mode. Use <code>NORMAL</code> to broadcast and deliver live
  /// video up to Full HD. Use <code>LOW</code> for near-real-time interaction
  /// with viewers. Default: <code>LOW</code>. (Note: In the Amazon IVS console,
  /// <code>LOW</code> and <code>NORMAL</code> correspond to Ultra-low and
  /// Standard, respectively.)
  final ChannelLatencyMode? latencyMode;

  /// Channel name.
  final String? name;

  /// Recording-configuration ARN. A value other than an empty string indicates
  /// that recording is enabled. Default: "" (empty string, recording is
  /// disabled).
  final String? recordingConfigurationArn;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
  final Map<String, String>? tags;

  ChannelSummary({
    this.arn,
    this.authorized,
    this.latencyMode,
    this.name,
    this.recordingConfigurationArn,
    this.tags,
  });

  factory ChannelSummary.fromJson(Map<String, dynamic> json) {
    return ChannelSummary(
      arn: json['arn'] as String?,
      authorized: json['authorized'] as bool?,
      latencyMode: (json['latencyMode'] as String?)?.toChannelLatencyMode(),
      name: json['name'] as String?,
      recordingConfigurationArn: json['recordingConfigurationArn'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final authorized = this.authorized;
    final latencyMode = this.latencyMode;
    final name = this.name;
    final recordingConfigurationArn = this.recordingConfigurationArn;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (authorized != null) 'authorized': authorized,
      if (latencyMode != null) 'latencyMode': latencyMode.toValue(),
      if (name != null) 'name': name,
      if (recordingConfigurationArn != null)
        'recordingConfigurationArn': recordingConfigurationArn,
      if (tags != null) 'tags': tags,
    };
  }
}

enum ChannelType {
  basic,
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
  }
}

extension on String {
  ChannelType toChannelType() {
    switch (this) {
      case 'BASIC':
        return ChannelType.basic;
      case 'STANDARD':
        return ChannelType.standard;
    }
    throw Exception('$this is not known in enum ChannelType');
  }
}

class CreateChannelResponse {
  final Channel? channel;
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

class GetStreamResponse {
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

class ImportPlaybackKeyPairResponse {
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
  final Map<String, String> tags;

  /// If there are more tags than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListTagsForResourceResponse({
    required this.tags,
    this.nextToken,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    final nextToken = this.nextToken;
    return {
      'tags': tags,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A key pair used to sign and validate a playback authorization token.
class PlaybackKeyPair {
  /// Key-pair ARN.
  final String? arn;

  /// Key-pair identifier.
  final String? fingerprint;

  /// An arbitrary string (a nickname) assigned to a playback key pair that helps
  /// the customer identify that resource. The value does not need to be unique.
  final String? name;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
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

  /// An arbitrary string (a nickname) assigned to a playback key pair that helps
  /// the customer identify that resource. The value does not need to be unique.
  final String? name;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
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

  /// An arbitrary string (a nickname) assigned to a recording configuration that
  /// helps the customer identify that resource. The value does not need to be
  /// unique.
  final String? name;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
  final Map<String, String>? tags;

  RecordingConfiguration({
    required this.arn,
    required this.destinationConfiguration,
    required this.state,
    this.name,
    this.tags,
  });

  factory RecordingConfiguration.fromJson(Map<String, dynamic> json) {
    return RecordingConfiguration(
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

enum RecordingConfigurationState {
  creating,
  createFailed,
  active,
}

extension on RecordingConfigurationState {
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

extension on String {
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

  /// An arbitrary string (a nickname) assigned to a recording configuration that
  /// helps the customer identify that resource. The value does not need to be
  /// unique.
  final String? name;

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
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

  /// ISO-8601 formatted timestamp of the stream’s start.
  final DateTime? startTime;

  /// The stream’s state.
  final StreamState? state;

  /// Number of current viewers of the stream. A value of -1 indicates that the
  /// request timed out; in this case, retry.
  final int? viewerCount;

  Stream({
    this.channelArn,
    this.health,
    this.playbackUrl,
    this.startTime,
    this.state,
    this.viewerCount,
  });

  factory Stream.fromJson(Map<String, dynamic> json) {
    return Stream(
      channelArn: json['channelArn'] as String?,
      health: (json['health'] as String?)?.toStreamHealth(),
      playbackUrl: json['playbackUrl'] as String?,
      startTime: timeStampFromJson(json['startTime']),
      state: (json['state'] as String?)?.toStreamState(),
      viewerCount: json['viewerCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final health = this.health;
    final playbackUrl = this.playbackUrl;
    final startTime = this.startTime;
    final state = this.state;
    final viewerCount = this.viewerCount;
    return {
      if (channelArn != null) 'channelArn': channelArn,
      if (health != null) 'health': health.toValue(),
      if (playbackUrl != null) 'playbackUrl': playbackUrl,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (state != null) 'state': state.toValue(),
      if (viewerCount != null) 'viewerCount': viewerCount,
    };
  }
}

enum StreamHealth {
  healthy,
  starving,
  unknown,
}

extension on StreamHealth {
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

extension on String {
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

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
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

  /// Array of 1-50 maps, each of the form <code>string:string (key:value)</code>.
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

enum StreamState {
  live,
  offline,
}

extension on StreamState {
  String toValue() {
    switch (this) {
      case StreamState.live:
        return 'LIVE';
      case StreamState.offline:
        return 'OFFLINE';
    }
  }
}

extension on String {
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

  /// ISO-8601 formatted timestamp of the stream’s start.
  final DateTime? startTime;

  /// The stream’s state.
  final StreamState? state;

  /// Number of current viewers of the stream. A value of -1 indicates that the
  /// request timed out; in this case, retry.
  final int? viewerCount;

  StreamSummary({
    this.channelArn,
    this.health,
    this.startTime,
    this.state,
    this.viewerCount,
  });

  factory StreamSummary.fromJson(Map<String, dynamic> json) {
    return StreamSummary(
      channelArn: json['channelArn'] as String?,
      health: (json['health'] as String?)?.toStreamHealth(),
      startTime: timeStampFromJson(json['startTime']),
      state: (json['state'] as String?)?.toStreamState(),
      viewerCount: json['viewerCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final health = this.health;
    final startTime = this.startTime;
    final state = this.state;
    final viewerCount = this.viewerCount;
    return {
      if (channelArn != null) 'channelArn': channelArn,
      if (health != null) 'health': health.toValue(),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (state != null) 'state': state.toValue(),
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
