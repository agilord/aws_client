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

part '2017-09-30.g.dart';

/// <p/>
class KinesisVideoArchivedMedia {
  final _s.RestJsonProtocol _protocol;
  KinesisVideoArchivedMedia({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisvideo',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Downloads an MP4 file (clip) containing the archived, on-demand media from
  /// the specified video stream over the specified time range.
  ///
  /// Both the StreamName and the StreamARN parameters are optional, but you
  /// must specify either the StreamName or the StreamARN when invoking this API
  /// operation.
  ///
  /// As a prerequsite to using GetCLip API, you must obtain an endpoint using
  /// <code>GetDataEndpoint</code>, specifying GET_CLIP for<code/> the
  /// <code>APIName</code> parameter.
  ///
  /// An Amazon Kinesis video stream has the following requirements for
  /// providing data through MP4:
  ///
  /// <ul>
  /// <li>
  /// The media must contain h.264 or h.265 encoded video and, optionally, AAC
  /// or G.711 encoded audio. Specifically, the codec ID of track 1 should be
  /// <code>V_MPEG/ISO/AVC</code> (for h.264) or V_MPEGH/ISO/HEVC (for H.265).
  /// Optionally, the codec ID of track 2 should be <code>A_AAC</code> (for AAC)
  /// or A_MS/ACM (for G.711).
  /// </li>
  /// <li>
  /// Data retention must be greater than 0.
  /// </li>
  /// <li>
  /// The video track of each fragment must contain codec private data in the
  /// Advanced Video Coding (AVC) for H.264 format and HEVC for H.265 format.
  /// For more information, see <a
  /// href="https://www.iso.org/standard/55980.html">MPEG-4 specification
  /// ISO/IEC 14496-15</a>. For information about adapting stream data to a
  /// given format, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/producer-reference-nal.html">NAL
  /// Adaptation Flags</a>.
  /// </li>
  /// <li>
  /// The audio track (if present) of each fragment must contain codec private
  /// data in the AAC format (<a
  /// href="https://www.iso.org/standard/43345.html">AAC specification ISO/IEC
  /// 13818-7</a>) or the <a
  /// href="http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html">MS
  /// Wave format</a>.
  /// </li>
  /// </ul>
  /// You can monitor the amount of outgoing data by monitoring the
  /// <code>GetClip.OutgoingBytes</code> Amazon CloudWatch metric. For
  /// information about using CloudWatch to monitor Kinesis Video Streams, see
  /// <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html">Monitoring
  /// Kinesis Video Streams</a>. For pricing information, see <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Amazon
  /// Kinesis Video Streams Pricing</a> and <a
  /// href="https://aws.amazon.com/pricing/">AWS Pricing</a>. Charges for
  /// outgoing AWS data apply.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [NotAuthorizedException].
  /// May throw [UnsupportedStreamMediaTypeException].
  /// May throw [MissingCodecPrivateDataException].
  /// May throw [InvalidCodecPrivateDataException].
  /// May throw [InvalidMediaFrameException].
  /// May throw [NoDataRetentionException].
  ///
  /// Parameter [clipFragmentSelector] :
  /// The time range of the requested clip and the source of the timestamps.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream for which to retrieve the
  /// media clip.
  ///
  /// You must specify either the StreamName or the StreamARN.
  ///
  /// Parameter [streamName] :
  /// The name of the stream for which to retrieve the media clip.
  ///
  /// You must specify either the StreamName or the StreamARN.
  Future<GetClipOutput> getClip({
    @_s.required ClipFragmentSelector clipFragmentSelector,
    String streamARN,
    String streamName,
  }) async {
    ArgumentError.checkNotNull(clipFragmentSelector, 'clipFragmentSelector');
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      'ClipFragmentSelector': clipFragmentSelector,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/getClip',
      exceptionFnMap: _exceptionFns,
    );
    return GetClipOutput(
      payload: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Retrieves an MPEG Dynamic Adaptive Streaming over HTTP (DASH) URL for the
  /// stream. You can then open the URL in a media player to view the stream
  /// contents.
  ///
  /// Both the <code>StreamName</code> and the <code>StreamARN</code> parameters
  /// are optional, but you must specify either the <code>StreamName</code> or
  /// the <code>StreamARN</code> when invoking this API operation.
  ///
  /// An Amazon Kinesis video stream has the following requirements for
  /// providing data through MPEG-DASH:
  ///
  /// <ul>
  /// <li>
  /// The media must contain h.264 or h.265 encoded video and, optionally, AAC
  /// or G.711 encoded audio. Specifically, the codec ID of track 1 should be
  /// <code>V_MPEG/ISO/AVC</code> (for h.264) or V_MPEGH/ISO/HEVC (for H.265).
  /// Optionally, the codec ID of track 2 should be <code>A_AAC</code> (for AAC)
  /// or A_MS/ACM (for G.711).
  /// </li>
  /// <li>
  /// Data retention must be greater than 0.
  /// </li>
  /// <li>
  /// The video track of each fragment must contain codec private data in the
  /// Advanced Video Coding (AVC) for H.264 format and HEVC for H.265 format.
  /// For more information, see <a
  /// href="https://www.iso.org/standard/55980.html">MPEG-4 specification
  /// ISO/IEC 14496-15</a>. For information about adapting stream data to a
  /// given format, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/producer-reference-nal.html">NAL
  /// Adaptation Flags</a>.
  /// </li>
  /// <li>
  /// The audio track (if present) of each fragment must contain codec private
  /// data in the AAC format (<a
  /// href="https://www.iso.org/standard/43345.html">AAC specification ISO/IEC
  /// 13818-7</a>) or the <a
  /// href="http://www-mmsp.ece.mcgill.ca/Documents/AudioFormats/WAVE/WAVE.html">MS
  /// Wave format</a>.
  /// </li>
  /// </ul>
  /// The following procedure shows how to use MPEG-DASH with Kinesis Video
  /// Streams:
  /// <ol>
  /// <li>
  /// Get an endpoint using <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_GetDataEndpoint.html">GetDataEndpoint</a>,
  /// specifying <code>GET_DASH_STREAMING_SESSION_URL</code> for the
  /// <code>APIName</code> parameter.
  /// </li>
  /// <li>
  /// Retrieve the MPEG-DASH URL using <code>GetDASHStreamingSessionURL</code>.
  /// Kinesis Video Streams creates an MPEG-DASH streaming session to be used
  /// for accessing content in a stream using the MPEG-DASH protocol.
  /// <code>GetDASHStreamingSessionURL</code> returns an authenticated URL (that
  /// includes an encrypted session token) for the session's MPEG-DASH
  /// <i>manifest</i> (the root resource needed for streaming with MPEG-DASH).
  /// <note>
  /// Don't share or store this token where an unauthorized entity could access
  /// it. The token provides access to the content of the stream. Safeguard the
  /// token with the same measures that you would use with your AWS credentials.
  /// </note>
  /// The media that is made available through the manifest consists only of the
  /// requested stream, time range, and format. No other media data (such as
  /// frames outside the requested window or alternate bitrates) is made
  /// available.
  /// </li>
  /// <li>
  /// Provide the URL (containing the encrypted session token) for the MPEG-DASH
  /// manifest to a media player that supports the MPEG-DASH protocol. Kinesis
  /// Video Streams makes the initialization fragment and media fragments
  /// available through the manifest URL. The initialization fragment contains
  /// the codec private data for the stream, and other data needed to set up the
  /// video or audio decoder and renderer. The media fragments contain encoded
  /// video frames or encoded audio samples.
  /// </li>
  /// <li>
  /// The media player receives the authenticated URL and requests stream
  /// metadata and media data normally. When the media player requests data, it
  /// calls the following actions:
  ///
  /// <ul>
  /// <li>
  /// <b>GetDASHManifest:</b> Retrieves an MPEG DASH manifest, which contains
  /// the metadata for the media that you want to playback.
  /// </li>
  /// <li>
  /// <b>GetMP4InitFragment:</b> Retrieves the MP4 initialization fragment. The
  /// media player typically loads the initialization fragment before loading
  /// any media fragments. This fragment contains the "<code>fytp</code>" and
  /// "<code>moov</code>" MP4 atoms, and the child atoms that are needed to
  /// initialize the media player decoder.
  ///
  /// The initialization fragment does not correspond to a fragment in a Kinesis
  /// video stream. It contains only the codec private data for the stream and
  /// respective track, which the media player needs to decode the media frames.
  /// </li>
  /// <li>
  /// <b>GetMP4MediaFragment:</b> Retrieves MP4 media fragments. These fragments
  /// contain the "<code>moof</code>" and "<code>mdat</code>" MP4 atoms and
  /// their child atoms, containing the encoded fragment's media frames and
  /// their timestamps.
  /// <note>
  /// After the first media fragment is made available in a streaming session,
  /// any fragments that don't contain the same codec private data cause an
  /// error to be returned when those different media fragments are loaded.
  /// Therefore, the codec private data should not change between fragments in a
  /// session. This also means that the session fails if the fragments in a
  /// stream change from having only video to having both audio and video.
  /// </note>
  /// Data retrieved with this action is billable. See <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Pricing</a>
  /// for details.
  /// </li>
  /// </ul> </li> </ol> <note>
  /// The following restrictions apply to MPEG-DASH sessions:
  ///
  /// <ul>
  /// <li>
  /// A streaming session URL should not be shared between players. The service
  /// might throttle a session if multiple media players are sharing it. For
  /// connection limits, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html">Kinesis
  /// Video Streams Limits</a>.
  /// </li>
  /// <li>
  /// A Kinesis video stream can have a maximum of ten active MPEG-DASH
  /// streaming sessions. If a new session is created when the maximum number of
  /// sessions is already active, the oldest (earliest created) session is
  /// closed. The number of active <code>GetMedia</code> connections on a
  /// Kinesis video stream does not count against this limit, and the number of
  /// active MPEG-DASH sessions does not count against the active
  /// <code>GetMedia</code> connection limit.
  /// <note>
  /// The maximum limits for active HLS and MPEG-DASH streaming sessions are
  /// independent of each other.
  /// </note> </li>
  /// </ul> </note>
  /// You can monitor the amount of data that the media player consumes by
  /// monitoring the <code>GetMP4MediaFragment.OutgoingBytes</code> Amazon
  /// CloudWatch metric. For information about using CloudWatch to monitor
  /// Kinesis Video Streams, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html">Monitoring
  /// Kinesis Video Streams</a>. For pricing information, see <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Amazon
  /// Kinesis Video Streams Pricing</a> and <a
  /// href="https://aws.amazon.com/pricing/">AWS Pricing</a>. Charges for both
  /// HLS sessions and outgoing AWS data apply.
  ///
  /// For more information about HLS, see <a
  /// href="https://developer.apple.com/streaming/">HTTP Live Streaming</a> on
  /// the <a href="https://developer.apple.com">Apple Developer site</a>.
  /// <important>
  /// If an error is thrown after invoking a Kinesis Video Streams archived
  /// media API, in addition to the HTTP status code and the response body, it
  /// includes the following pieces of information:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-ErrorType</code> HTTP header – contains a more specific error
  /// type in addition to what the HTTP status code provides.
  /// </li>
  /// <li>
  /// <code>x-amz-RequestId</code> HTTP header – if you want to report an issue
  /// to AWS, the support team can better diagnose the problem if given the
  /// Request Id.
  /// </li>
  /// </ul>
  /// Both the HTTP status code and the ErrorType header can be utilized to make
  /// programmatic decisions about whether errors are retry-able and under what
  /// conditions, as well as provide information on what actions the client
  /// programmer might need to take in order to successfully try again.
  ///
  /// For more information, see the <b>Errors</b> section at the bottom of this
  /// topic, as well as <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html">Common
  /// Errors</a>.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [NotAuthorizedException].
  /// May throw [UnsupportedStreamMediaTypeException].
  /// May throw [NoDataRetentionException].
  /// May throw [MissingCodecPrivateDataException].
  /// May throw [InvalidCodecPrivateDataException].
  ///
  /// Parameter [dASHFragmentSelector] :
  /// The time range of the requested fragment and the source of the timestamps.
  ///
  /// This parameter is required if <code>PlaybackMode</code> is
  /// <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>. This parameter is
  /// optional if PlaybackMode is<code/> <code>LIVE</code>. If
  /// <code>PlaybackMode</code> is <code>LIVE</code>, the
  /// <code>FragmentSelectorType</code> can be set, but the
  /// <code>TimestampRange</code> should not be set. If
  /// <code>PlaybackMode</code> is <code>ON_DEMAND</code> or
  /// <code>LIVE_REPLAY</code>, both <code>FragmentSelectorType</code> and
  /// <code>TimestampRange</code> must be set.
  ///
  /// Parameter [displayFragmentNumber] :
  /// Fragments are identified in the manifest file based on their sequence
  /// number in the session. If DisplayFragmentNumber is set to
  /// <code>ALWAYS</code>, the Kinesis Video Streams fragment number is added to
  /// each S element in the manifest file with the attribute name “kvs:fn”.
  /// These fragment numbers can be used for logging or for use with other APIs
  /// (e.g. <code>GetMedia</code> and <code>GetMediaForFragmentList</code>). A
  /// custom MPEG-DASH media player is necessary to leverage these this custom
  /// attribute.
  ///
  /// The default value is <code>NEVER</code>.
  ///
  /// Parameter [displayFragmentTimestamp] :
  /// Per the MPEG-DASH specification, the wall-clock time of fragments in the
  /// manifest file can be derived using attributes in the manifest itself.
  /// However, typically, MPEG-DASH compatible media players do not properly
  /// handle gaps in the media timeline. Kinesis Video Streams adjusts the media
  /// timeline in the manifest file to enable playback of media with
  /// discontinuities. Therefore, the wall-clock time derived from the manifest
  /// file may be inaccurate. If DisplayFragmentTimestamp is set to
  /// <code>ALWAYS</code>, the accurate fragment timestamp is added to each S
  /// element in the manifest file with the attribute name “kvs:ts”. A custom
  /// MPEG-DASH media player is necessary to leverage this custom attribute.
  ///
  /// The default value is <code>NEVER</code>. When <a>DASHFragmentSelector</a>
  /// is <code>SERVER_TIMESTAMP</code>, the timestamps will be the server start
  /// timestamps. Similarly, when <a>DASHFragmentSelector</a> is
  /// <code>PRODUCER_TIMESTAMP</code>, the timestamps will be the producer start
  /// timestamps.
  ///
  /// Parameter [expires] :
  /// The time in seconds until the requested session expires. This value can be
  /// between 300 (5 minutes) and 43200 (12 hours).
  ///
  /// When a session expires, no new calls to <code>GetDashManifest</code>,
  /// <code>GetMP4InitFragment</code>, or <code>GetMP4MediaFragment</code> can
  /// be made for that session.
  ///
  /// The default is 300 (5 minutes).
  ///
  /// Parameter [maxManifestFragmentResults] :
  /// The maximum number of fragments that are returned in the MPEG-DASH
  /// manifest.
  ///
  /// When the <code>PlaybackMode</code> is <code>LIVE</code>, the most recent
  /// fragments are returned up to this value. When the
  /// <code>PlaybackMode</code> is <code>ON_DEMAND</code>, the oldest fragments
  /// are returned, up to this maximum number.
  ///
  /// When there are a higher number of fragments available in a live MPEG-DASH
  /// manifest, video players often buffer content before starting playback.
  /// Increasing the buffer size increases the playback latency, but it
  /// decreases the likelihood that rebuffering will occur during playback. We
  /// recommend that a live MPEG-DASH manifest have a minimum of 3 fragments and
  /// a maximum of 10 fragments.
  ///
  /// The default is 5 fragments if <code>PlaybackMode</code> is
  /// <code>LIVE</code> or <code>LIVE_REPLAY</code>, and 1,000 if
  /// <code>PlaybackMode</code> is <code>ON_DEMAND</code>.
  ///
  /// The maximum value of 1,000 fragments corresponds to more than 16 minutes
  /// of video on streams with 1-second fragments, and more than 2 1/2 hours of
  /// video on streams with 10-second fragments.
  ///
  /// Parameter [playbackMode] :
  /// Whether to retrieve live, live replay, or archived, on-demand data.
  ///
  /// Features of the three types of sessions include the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>LIVE</code> </b>: For sessions of this type, the MPEG-DASH
  /// manifest is continually updated with the latest fragments as they become
  /// available. We recommend that the media player retrieve a new manifest on a
  /// one-second interval. When this type of session is played in a media
  /// player, the user interface typically displays a "live" notification, with
  /// no scrubber control for choosing the position in the playback window to
  /// display.
  /// <note>
  /// In <code>LIVE</code> mode, the newest available fragments are included in
  /// an MPEG-DASH manifest, even if there is a gap between fragments (that is,
  /// if a fragment is missing). A gap like this might cause a media player to
  /// halt or cause a jump in playback. In this mode, fragments are not added to
  /// the MPEG-DASH manifest if they are older than the newest fragment in the
  /// playlist. If the missing fragment becomes available after a subsequent
  /// fragment is added to the manifest, the older fragment is not added, and
  /// the gap is not filled.
  /// </note> </li>
  /// <li>
  /// <b> <code>LIVE_REPLAY</code> </b>: For sessions of this type, the
  /// MPEG-DASH manifest is updated similarly to how it is updated for
  /// <code>LIVE</code> mode except that it starts by including fragments from a
  /// given start time. Instead of fragments being added as they are ingested,
  /// fragments are added as the duration of the next fragment elapses. For
  /// example, if the fragments in the session are two seconds long, then a new
  /// fragment is added to the manifest every two seconds. This mode is useful
  /// to be able to start playback from when an event is detected and continue
  /// live streaming media that has not yet been ingested as of the time of the
  /// session creation. This mode is also useful to stream previously archived
  /// media without being limited by the 1,000 fragment limit in the
  /// <code>ON_DEMAND</code> mode.
  /// </li>
  /// <li>
  /// <b> <code>ON_DEMAND</code> </b>: For sessions of this type, the MPEG-DASH
  /// manifest contains all the fragments for the session, up to the number that
  /// is specified in <code>MaxMediaPlaylistFragmentResults</code>. The manifest
  /// must be retrieved only once for each session. When this type of session is
  /// played in a media player, the user interface typically displays a scrubber
  /// control for choosing the position in the playback window to display.
  /// </li>
  /// </ul>
  /// In all playback modes, if <code>FragmentSelectorType</code> is
  /// <code>PRODUCER_TIMESTAMP</code>, and if there are multiple fragments with
  /// the same start timestamp, the fragment that has the larger fragment number
  /// (that is, the newer fragment) is included in the MPEG-DASH manifest. The
  /// other fragments are not included. Fragments that have different timestamps
  /// but have overlapping durations are still included in the MPEG-DASH
  /// manifest. This can lead to unexpected behavior in the media player.
  ///
  /// The default is <code>LIVE</code>.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream for which to retrieve the
  /// MPEG-DASH manifest URL.
  ///
  /// You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream for which to retrieve the MPEG-DASH manifest URL.
  ///
  /// You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  Future<GetDASHStreamingSessionURLOutput> getDASHStreamingSessionURL({
    DASHFragmentSelector dASHFragmentSelector,
    DASHDisplayFragmentNumber displayFragmentNumber,
    DASHDisplayFragmentTimestamp displayFragmentTimestamp,
    int expires,
    int maxManifestFragmentResults,
    DASHPlaybackMode playbackMode,
    String streamARN,
    String streamName,
  }) async {
    _s.validateNumRange(
      'expires',
      expires,
      300,
      43200,
    );
    _s.validateNumRange(
      'maxManifestFragmentResults',
      maxManifestFragmentResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      if (dASHFragmentSelector != null)
        'DASHFragmentSelector': dASHFragmentSelector,
      if (displayFragmentNumber != null)
        'DisplayFragmentNumber': displayFragmentNumber.toValue(),
      if (displayFragmentTimestamp != null)
        'DisplayFragmentTimestamp': displayFragmentTimestamp.toValue(),
      if (expires != null) 'Expires': expires,
      if (maxManifestFragmentResults != null)
        'MaxManifestFragmentResults': maxManifestFragmentResults,
      if (playbackMode != null) 'PlaybackMode': playbackMode.toValue(),
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getDASHStreamingSessionURL',
      exceptionFnMap: _exceptionFns,
    );
    return GetDASHStreamingSessionURLOutput.fromJson(response);
  }

  /// Retrieves an HTTP Live Streaming (HLS) URL for the stream. You can then
  /// open the URL in a browser or media player to view the stream contents.
  ///
  /// Both the <code>StreamName</code> and the <code>StreamARN</code> parameters
  /// are optional, but you must specify either the <code>StreamName</code> or
  /// the <code>StreamARN</code> when invoking this API operation.
  ///
  /// An Amazon Kinesis video stream has the following requirements for
  /// providing data through HLS:
  ///
  /// <ul>
  /// <li>
  /// The media must contain h.264 or h.265 encoded video and, optionally, AAC
  /// encoded audio. Specifically, the codec ID of track 1 should be
  /// <code>V_MPEG/ISO/AVC</code> (for h.264) or <code>V_MPEG/ISO/HEVC</code>
  /// (for h.265). Optionally, the codec ID of track 2 should be
  /// <code>A_AAC</code>.
  /// </li>
  /// <li>
  /// Data retention must be greater than 0.
  /// </li>
  /// <li>
  /// The video track of each fragment must contain codec private data in the
  /// Advanced Video Coding (AVC) for H.264 format or HEVC for H.265 format (<a
  /// href="https://www.iso.org/standard/55980.html">MPEG-4 specification
  /// ISO/IEC 14496-15</a>). For information about adapting stream data to a
  /// given format, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/producer-reference-nal.html">NAL
  /// Adaptation Flags</a>.
  /// </li>
  /// <li>
  /// The audio track (if present) of each fragment must contain codec private
  /// data in the AAC format (<a
  /// href="https://www.iso.org/standard/43345.html">AAC specification ISO/IEC
  /// 13818-7</a>).
  /// </li>
  /// </ul>
  /// Kinesis Video Streams HLS sessions contain fragments in the fragmented
  /// MPEG-4 form (also called fMP4 or CMAF) or the MPEG-2 form (also called TS
  /// chunks, which the HLS specification also supports). For more information
  /// about HLS fragment types, see the <a
  /// href="https://tools.ietf.org/html/draft-pantos-http-live-streaming-23">HLS
  /// specification</a>.
  ///
  /// The following procedure shows how to use HLS with Kinesis Video Streams:
  /// <ol>
  /// <li>
  /// Get an endpoint using <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_GetDataEndpoint.html">GetDataEndpoint</a>,
  /// specifying <code>GET_HLS_STREAMING_SESSION_URL</code> for the
  /// <code>APIName</code> parameter.
  /// </li>
  /// <li>
  /// Retrieve the HLS URL using <code>GetHLSStreamingSessionURL</code>. Kinesis
  /// Video Streams creates an HLS streaming session to be used for accessing
  /// content in a stream using the HLS protocol.
  /// <code>GetHLSStreamingSessionURL</code> returns an authenticated URL (that
  /// includes an encrypted session token) for the session's HLS <i>master
  /// playlist</i> (the root resource needed for streaming with HLS).
  /// <note>
  /// Don't share or store this token where an unauthorized entity could access
  /// it. The token provides access to the content of the stream. Safeguard the
  /// token with the same measures that you would use with your AWS credentials.
  /// </note>
  /// The media that is made available through the playlist consists only of the
  /// requested stream, time range, and format. No other media data (such as
  /// frames outside the requested window or alternate bitrates) is made
  /// available.
  /// </li>
  /// <li>
  /// Provide the URL (containing the encrypted session token) for the HLS
  /// master playlist to a media player that supports the HLS protocol. Kinesis
  /// Video Streams makes the HLS media playlist, initialization fragment, and
  /// media fragments available through the master playlist URL. The
  /// initialization fragment contains the codec private data for the stream,
  /// and other data needed to set up the video or audio decoder and renderer.
  /// The media fragments contain H.264-encoded video frames or AAC-encoded
  /// audio samples.
  /// </li>
  /// <li>
  /// The media player receives the authenticated URL and requests stream
  /// metadata and media data normally. When the media player requests data, it
  /// calls the following actions:
  ///
  /// <ul>
  /// <li>
  /// <b>GetHLSMasterPlaylist:</b> Retrieves an HLS master playlist, which
  /// contains a URL for the <code>GetHLSMediaPlaylist</code> action for each
  /// track, and additional metadata for the media player, including estimated
  /// bitrate and resolution.
  /// </li>
  /// <li>
  /// <b>GetHLSMediaPlaylist:</b> Retrieves an HLS media playlist, which
  /// contains a URL to access the MP4 initialization fragment with the
  /// <code>GetMP4InitFragment</code> action, and URLs to access the MP4 media
  /// fragments with the <code>GetMP4MediaFragment</code> actions. The HLS media
  /// playlist also contains metadata about the stream that the player needs to
  /// play it, such as whether the <code>PlaybackMode</code> is
  /// <code>LIVE</code> or <code>ON_DEMAND</code>. The HLS media playlist is
  /// typically static for sessions with a <code>PlaybackType</code> of
  /// <code>ON_DEMAND</code>. The HLS media playlist is continually updated with
  /// new fragments for sessions with a <code>PlaybackType</code> of
  /// <code>LIVE</code>. There is a distinct HLS media playlist for the video
  /// track and the audio track (if applicable) that contains MP4 media URLs for
  /// the specific track.
  /// </li>
  /// <li>
  /// <b>GetMP4InitFragment:</b> Retrieves the MP4 initialization fragment. The
  /// media player typically loads the initialization fragment before loading
  /// any media fragments. This fragment contains the "<code>fytp</code>" and
  /// "<code>moov</code>" MP4 atoms, and the child atoms that are needed to
  /// initialize the media player decoder.
  ///
  /// The initialization fragment does not correspond to a fragment in a Kinesis
  /// video stream. It contains only the codec private data for the stream and
  /// respective track, which the media player needs to decode the media frames.
  /// </li>
  /// <li>
  /// <b>GetMP4MediaFragment:</b> Retrieves MP4 media fragments. These fragments
  /// contain the "<code>moof</code>" and "<code>mdat</code>" MP4 atoms and
  /// their child atoms, containing the encoded fragment's media frames and
  /// their timestamps.
  /// <note>
  /// After the first media fragment is made available in a streaming session,
  /// any fragments that don't contain the same codec private data cause an
  /// error to be returned when those different media fragments are loaded.
  /// Therefore, the codec private data should not change between fragments in a
  /// session. This also means that the session fails if the fragments in a
  /// stream change from having only video to having both audio and video.
  /// </note>
  /// Data retrieved with this action is billable. See <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Pricing</a>
  /// for details.
  /// </li>
  /// <li>
  /// <b>GetTSFragment:</b> Retrieves MPEG TS fragments containing both
  /// initialization and media data for all tracks in the stream.
  /// <note>
  /// If the <code>ContainerFormat</code> is <code>MPEG_TS</code>, this API is
  /// used instead of <code>GetMP4InitFragment</code> and
  /// <code>GetMP4MediaFragment</code> to retrieve stream media.
  /// </note>
  /// Data retrieved with this action is billable. For more information, see <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Kinesis Video
  /// Streams pricing</a>.
  /// </li>
  /// </ul> </li> </ol> <note>
  /// The following restrictions apply to HLS sessions:
  ///
  /// <ul>
  /// <li>
  /// A streaming session URL should not be shared between players. The service
  /// might throttle a session if multiple media players are sharing it. For
  /// connection limits, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html">Kinesis
  /// Video Streams Limits</a>.
  /// </li>
  /// <li>
  /// A Kinesis video stream can have a maximum of ten active HLS streaming
  /// sessions. If a new session is created when the maximum number of sessions
  /// is already active, the oldest (earliest created) session is closed. The
  /// number of active <code>GetMedia</code> connections on a Kinesis video
  /// stream does not count against this limit, and the number of active HLS
  /// sessions does not count against the active <code>GetMedia</code>
  /// connection limit.
  /// <note>
  /// The maximum limits for active HLS and MPEG-DASH streaming sessions are
  /// independent of each other.
  /// </note> </li>
  /// </ul> </note>
  /// You can monitor the amount of data that the media player consumes by
  /// monitoring the <code>GetMP4MediaFragment.OutgoingBytes</code> Amazon
  /// CloudWatch metric. For information about using CloudWatch to monitor
  /// Kinesis Video Streams, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html">Monitoring
  /// Kinesis Video Streams</a>. For pricing information, see <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Amazon
  /// Kinesis Video Streams Pricing</a> and <a
  /// href="https://aws.amazon.com/pricing/">AWS Pricing</a>. Charges for both
  /// HLS sessions and outgoing AWS data apply.
  ///
  /// For more information about HLS, see <a
  /// href="https://developer.apple.com/streaming/">HTTP Live Streaming</a> on
  /// the <a href="https://developer.apple.com">Apple Developer site</a>.
  /// <important>
  /// If an error is thrown after invoking a Kinesis Video Streams archived
  /// media API, in addition to the HTTP status code and the response body, it
  /// includes the following pieces of information:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-ErrorType</code> HTTP header – contains a more specific error
  /// type in addition to what the HTTP status code provides.
  /// </li>
  /// <li>
  /// <code>x-amz-RequestId</code> HTTP header – if you want to report an issue
  /// to AWS, the support team can better diagnose the problem if given the
  /// Request Id.
  /// </li>
  /// </ul>
  /// Both the HTTP status code and the ErrorType header can be utilized to make
  /// programmatic decisions about whether errors are retry-able and under what
  /// conditions, as well as provide information on what actions the client
  /// programmer might need to take in order to successfully try again.
  ///
  /// For more information, see the <b>Errors</b> section at the bottom of this
  /// topic, as well as <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html">Common
  /// Errors</a>.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [NotAuthorizedException].
  /// May throw [UnsupportedStreamMediaTypeException].
  /// May throw [NoDataRetentionException].
  /// May throw [MissingCodecPrivateDataException].
  /// May throw [InvalidCodecPrivateDataException].
  ///
  /// Parameter [containerFormat] :
  /// Specifies which format should be used for packaging the media. Specifying
  /// the <code>FRAGMENTED_MP4</code> container format packages the media into
  /// MP4 fragments (fMP4 or CMAF). This is the recommended packaging because
  /// there is minimal packaging overhead. The other container format option is
  /// <code>MPEG_TS</code>. HLS has supported MPEG TS chunks since it was
  /// released and is sometimes the only supported packaging on older HLS
  /// players. MPEG TS typically has a 5-25 percent packaging overhead. This
  /// means MPEG TS typically requires 5-25 percent more bandwidth and cost than
  /// fMP4.
  ///
  /// The default is <code>FRAGMENTED_MP4</code>.
  ///
  /// Parameter [discontinuityMode] :
  /// Specifies when flags marking discontinuities between fragments are added
  /// to the media playlists.
  ///
  /// Media players typically build a timeline of media content to play, based
  /// on the timestamps of each fragment. This means that if there is any
  /// overlap or gap between fragments (as is typical if
  /// <a>HLSFragmentSelector</a> is set to <code>SERVER_TIMESTAMP</code>), the
  /// media player timeline will also have small gaps between fragments in some
  /// places, and will overwrite frames in other places. Gaps in the media
  /// player timeline can cause playback to stall and overlaps can cause
  /// playback to be jittery. When there are discontinuity flags between
  /// fragments, the media player is expected to reset the timeline, resulting
  /// in the next fragment being played immediately after the previous fragment.
  ///
  /// The following modes are supported:
  ///
  /// <ul>
  /// <li>
  /// <code>ALWAYS</code>: a discontinuity marker is placed between every
  /// fragment in the HLS media playlist. It is recommended to use a value of
  /// <code>ALWAYS</code> if the fragment timestamps are not accurate.
  /// </li>
  /// <li>
  /// <code>NEVER</code>: no discontinuity markers are placed anywhere. It is
  /// recommended to use a value of <code>NEVER</code> to ensure the media
  /// player timeline most accurately maps to the producer timestamps.
  /// </li>
  /// <li>
  /// <code>ON_DISCONTIUNITY</code>: a discontinuity marker is placed between
  /// fragments that have a gap or overlap of more than 50 milliseconds. For
  /// most playback scenarios, it is recommended to use a value of
  /// <code>ON_DISCONTINUITY</code> so that the media player timeline is only
  /// reset when there is a significant issue with the media timeline (e.g. a
  /// missing fragment).
  /// </li>
  /// </ul>
  /// The default is <code>ALWAYS</code> when <a>HLSFragmentSelector</a> is set
  /// to <code>SERVER_TIMESTAMP</code>, and <code>NEVER</code> when it is set to
  /// <code>PRODUCER_TIMESTAMP</code>.
  ///
  /// Parameter [displayFragmentTimestamp] :
  /// Specifies when the fragment start timestamps should be included in the HLS
  /// media playlist. Typically, media players report the playhead position as a
  /// time relative to the start of the first fragment in the playback session.
  /// However, when the start timestamps are included in the HLS media playlist,
  /// some media players might report the current playhead as an absolute time
  /// based on the fragment timestamps. This can be useful for creating a
  /// playback experience that shows viewers the wall-clock time of the media.
  ///
  /// The default is <code>NEVER</code>. When <a>HLSFragmentSelector</a> is
  /// <code>SERVER_TIMESTAMP</code>, the timestamps will be the server start
  /// timestamps. Similarly, when <a>HLSFragmentSelector</a> is
  /// <code>PRODUCER_TIMESTAMP</code>, the timestamps will be the producer start
  /// timestamps.
  ///
  /// Parameter [expires] :
  /// The time in seconds until the requested session expires. This value can be
  /// between 300 (5 minutes) and 43200 (12 hours).
  ///
  /// When a session expires, no new calls to <code>GetHLSMasterPlaylist</code>,
  /// <code>GetHLSMediaPlaylist</code>, <code>GetMP4InitFragment</code>,
  /// <code>GetMP4MediaFragment</code>, or <code>GetTSFragment</code> can be
  /// made for that session.
  ///
  /// The default is 300 (5 minutes).
  ///
  /// Parameter [hLSFragmentSelector] :
  /// The time range of the requested fragment and the source of the timestamps.
  ///
  /// This parameter is required if <code>PlaybackMode</code> is
  /// <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>. This parameter is
  /// optional if PlaybackMode is<code/> <code>LIVE</code>. If
  /// <code>PlaybackMode</code> is <code>LIVE</code>, the
  /// <code>FragmentSelectorType</code> can be set, but the
  /// <code>TimestampRange</code> should not be set. If
  /// <code>PlaybackMode</code> is <code>ON_DEMAND</code> or
  /// <code>LIVE_REPLAY</code>, both <code>FragmentSelectorType</code> and
  /// <code>TimestampRange</code> must be set.
  ///
  /// Parameter [maxMediaPlaylistFragmentResults] :
  /// The maximum number of fragments that are returned in the HLS media
  /// playlists.
  ///
  /// When the <code>PlaybackMode</code> is <code>LIVE</code>, the most recent
  /// fragments are returned up to this value. When the
  /// <code>PlaybackMode</code> is <code>ON_DEMAND</code>, the oldest fragments
  /// are returned, up to this maximum number.
  ///
  /// When there are a higher number of fragments available in a live HLS media
  /// playlist, video players often buffer content before starting playback.
  /// Increasing the buffer size increases the playback latency, but it
  /// decreases the likelihood that rebuffering will occur during playback. We
  /// recommend that a live HLS media playlist have a minimum of 3 fragments and
  /// a maximum of 10 fragments.
  ///
  /// The default is 5 fragments if <code>PlaybackMode</code> is
  /// <code>LIVE</code> or <code>LIVE_REPLAY</code>, and 1,000 if
  /// <code>PlaybackMode</code> is <code>ON_DEMAND</code>.
  ///
  /// The maximum value of 1,000 fragments corresponds to more than 16 minutes
  /// of video on streams with 1-second fragments, and more than 2 1/2 hours of
  /// video on streams with 10-second fragments.
  ///
  /// Parameter [playbackMode] :
  /// Whether to retrieve live, live replay, or archived, on-demand data.
  ///
  /// Features of the three types of sessions include the following:
  ///
  /// <ul>
  /// <li>
  /// <b> <code>LIVE</code> </b>: For sessions of this type, the HLS media
  /// playlist is continually updated with the latest fragments as they become
  /// available. We recommend that the media player retrieve a new playlist on a
  /// one-second interval. When this type of session is played in a media
  /// player, the user interface typically displays a "live" notification, with
  /// no scrubber control for choosing the position in the playback window to
  /// display.
  /// <note>
  /// In <code>LIVE</code> mode, the newest available fragments are included in
  /// an HLS media playlist, even if there is a gap between fragments (that is,
  /// if a fragment is missing). A gap like this might cause a media player to
  /// halt or cause a jump in playback. In this mode, fragments are not added to
  /// the HLS media playlist if they are older than the newest fragment in the
  /// playlist. If the missing fragment becomes available after a subsequent
  /// fragment is added to the playlist, the older fragment is not added, and
  /// the gap is not filled.
  /// </note> </li>
  /// <li>
  /// <b> <code>LIVE_REPLAY</code> </b>: For sessions of this type, the HLS
  /// media playlist is updated similarly to how it is updated for
  /// <code>LIVE</code> mode except that it starts by including fragments from a
  /// given start time. Instead of fragments being added as they are ingested,
  /// fragments are added as the duration of the next fragment elapses. For
  /// example, if the fragments in the session are two seconds long, then a new
  /// fragment is added to the media playlist every two seconds. This mode is
  /// useful to be able to start playback from when an event is detected and
  /// continue live streaming media that has not yet been ingested as of the
  /// time of the session creation. This mode is also useful to stream
  /// previously archived media without being limited by the 1,000 fragment
  /// limit in the <code>ON_DEMAND</code> mode.
  /// </li>
  /// <li>
  /// <b> <code>ON_DEMAND</code> </b>: For sessions of this type, the HLS media
  /// playlist contains all the fragments for the session, up to the number that
  /// is specified in <code>MaxMediaPlaylistFragmentResults</code>. The playlist
  /// must be retrieved only once for each session. When this type of session is
  /// played in a media player, the user interface typically displays a scrubber
  /// control for choosing the position in the playback window to display.
  /// </li>
  /// </ul>
  /// In all playback modes, if <code>FragmentSelectorType</code> is
  /// <code>PRODUCER_TIMESTAMP</code>, and if there are multiple fragments with
  /// the same start timestamp, the fragment that has the larger fragment number
  /// (that is, the newer fragment) is included in the HLS media playlist. The
  /// other fragments are not included. Fragments that have different timestamps
  /// but have overlapping durations are still included in the HLS media
  /// playlist. This can lead to unexpected behavior in the media player.
  ///
  /// The default is <code>LIVE</code>.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream for which to retrieve the HLS
  /// master playlist URL.
  ///
  /// You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream for which to retrieve the HLS master playlist URL.
  ///
  /// You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  Future<GetHLSStreamingSessionURLOutput> getHLSStreamingSessionURL({
    ContainerFormat containerFormat,
    HLSDiscontinuityMode discontinuityMode,
    HLSDisplayFragmentTimestamp displayFragmentTimestamp,
    int expires,
    HLSFragmentSelector hLSFragmentSelector,
    int maxMediaPlaylistFragmentResults,
    HLSPlaybackMode playbackMode,
    String streamARN,
    String streamName,
  }) async {
    _s.validateNumRange(
      'expires',
      expires,
      300,
      43200,
    );
    _s.validateNumRange(
      'maxMediaPlaylistFragmentResults',
      maxMediaPlaylistFragmentResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'streamARN',
      streamARN,
      1,
      1024,
    );
    _s.validateStringPattern(
      'streamARN',
      streamARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
    );
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      if (containerFormat != null) 'ContainerFormat': containerFormat.toValue(),
      if (discontinuityMode != null)
        'DiscontinuityMode': discontinuityMode.toValue(),
      if (displayFragmentTimestamp != null)
        'DisplayFragmentTimestamp': displayFragmentTimestamp.toValue(),
      if (expires != null) 'Expires': expires,
      if (hLSFragmentSelector != null)
        'HLSFragmentSelector': hLSFragmentSelector,
      if (maxMediaPlaylistFragmentResults != null)
        'MaxMediaPlaylistFragmentResults': maxMediaPlaylistFragmentResults,
      if (playbackMode != null) 'PlaybackMode': playbackMode.toValue(),
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getHLSStreamingSessionURL',
      exceptionFnMap: _exceptionFns,
    );
    return GetHLSStreamingSessionURLOutput.fromJson(response);
  }

  /// Gets media for a list of fragments (specified by fragment number) from the
  /// archived data in an Amazon Kinesis video stream.
  /// <note>
  /// You must first call the <code>GetDataEndpoint</code> API to get an
  /// endpoint. Then send the <code>GetMediaForFragmentList</code> requests to
  /// this endpoint using the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/">--endpoint-url
  /// parameter</a>.
  /// </note>
  /// The following limits apply when using the
  /// <code>GetMediaForFragmentList</code> API:
  ///
  /// <ul>
  /// <li>
  /// A client can call <code>GetMediaForFragmentList</code> up to five times
  /// per second per stream.
  /// </li>
  /// <li>
  /// Kinesis Video Streams sends media data at a rate of up to 25 megabytes per
  /// second (or 200 megabits per second) during a
  /// <code>GetMediaForFragmentList</code> session.
  /// </li>
  /// </ul> <important>
  /// If an error is thrown after invoking a Kinesis Video Streams archived
  /// media API, in addition to the HTTP status code and the response body, it
  /// includes the following pieces of information:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-ErrorType</code> HTTP header – contains a more specific error
  /// type in addition to what the HTTP status code provides.
  /// </li>
  /// <li>
  /// <code>x-amz-RequestId</code> HTTP header – if you want to report an issue
  /// to AWS, the support team can better diagnose the problem if given the
  /// Request Id.
  /// </li>
  /// </ul>
  /// Both the HTTP status code and the ErrorType header can be utilized to make
  /// programmatic decisions about whether errors are retry-able and under what
  /// conditions, as well as provide information on what actions the client
  /// programmer might need to take in order to successfully try again.
  ///
  /// For more information, see the <b>Errors</b> section at the bottom of this
  /// topic, as well as <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html">Common
  /// Errors</a>.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [fragments] :
  /// A list of the numbers of fragments for which to retrieve media. You
  /// retrieve these values with <a>ListFragments</a>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to retrieve fragment media.
  Future<GetMediaForFragmentListOutput> getMediaForFragmentList({
    @_s.required List<String> fragments,
    @_s.required String streamName,
  }) async {
    ArgumentError.checkNotNull(fragments, 'fragments');
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Fragments': fragments,
      'StreamName': streamName,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/getMediaForFragmentList',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaForFragmentListOutput(
      payload: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
    );
  }

  /// Returns a list of <a>Fragment</a> objects from the specified stream and
  /// timestamp range within the archived data.
  ///
  /// Listing fragments is eventually consistent. This means that even if the
  /// producer receives an acknowledgment that a fragment is persisted, the
  /// result might not be returned immediately from a request to
  /// <code>ListFragments</code>. However, results are typically available in
  /// less than one second.
  /// <note>
  /// You must first call the <code>GetDataEndpoint</code> API to get an
  /// endpoint. Then send the <code>ListFragments</code> requests to this
  /// endpoint using the <a
  /// href="https://docs.aws.amazon.com/cli/latest/reference/">--endpoint-url
  /// parameter</a>.
  /// </note> <important>
  /// If an error is thrown after invoking a Kinesis Video Streams archived
  /// media API, in addition to the HTTP status code and the response body, it
  /// includes the following pieces of information:
  ///
  /// <ul>
  /// <li>
  /// <code>x-amz-ErrorType</code> HTTP header – contains a more specific error
  /// type in addition to what the HTTP status code provides.
  /// </li>
  /// <li>
  /// <code>x-amz-RequestId</code> HTTP header – if you want to report an issue
  /// to AWS, the support team can better diagnose the problem if given the
  /// Request Id.
  /// </li>
  /// </ul>
  /// Both the HTTP status code and the ErrorType header can be utilized to make
  /// programmatic decisions about whether errors are retry-able and under what
  /// conditions, as well as provide information on what actions the client
  /// programmer might need to take in order to successfully try again.
  ///
  /// For more information, see the <b>Errors</b> section at the bottom of this
  /// topic, as well as <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/CommonErrors.html">Common
  /// Errors</a>.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to retrieve a fragment list.
  ///
  /// Parameter [fragmentSelector] :
  /// Describes the timestamp range and timestamp origin for the range of
  /// fragments to return.
  ///
  /// Parameter [maxResults] :
  /// The total number of fragments to return. If the total number of fragments
  /// available is more than the value specified in <code>max-results</code>,
  /// then a <a>ListFragmentsOutput$NextToken</a> is provided in the output that
  /// you can use to resume pagination.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the
  /// <a>ListFragmentsOutput$NextToken</a> from a previously truncated response.
  Future<ListFragmentsOutput> listFragments({
    @_s.required String streamName,
    FragmentSelector fragmentSelector,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(streamName, 'streamName');
    _s.validateStringLength(
      'streamName',
      streamName,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'streamName',
      streamName,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      4096,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9+/]+={0,2}''',
    );
    final $payload = <String, dynamic>{
      'StreamName': streamName,
      if (fragmentSelector != null) 'FragmentSelector': fragmentSelector,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listFragments',
      exceptionFnMap: _exceptionFns,
    );
    return ListFragmentsOutput.fromJson(response);
  }
}

/// Describes the timestamp range and timestamp origin of a range of fragments.
///
/// Fragments that have duplicate producer timestamps are deduplicated. This
/// means that if producers are producing a stream of fragments with producer
/// timestamps that are approximately equal to the true clock time, the clip
/// will contain all of the fragments within the requested timestamp range. If
/// some fragments are ingested within the same time range and very different
/// points in time, only the oldest ingested collection of fragments are
/// returned.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ClipFragmentSelector {
  /// The origin of the timestamps to use (Server or Producer).
  @_s.JsonKey(name: 'FragmentSelectorType')
  final ClipFragmentSelectorType fragmentSelectorType;

  /// The range of timestamps to return.
  @_s.JsonKey(name: 'TimestampRange')
  final ClipTimestampRange timestampRange;

  ClipFragmentSelector({
    @_s.required this.fragmentSelectorType,
    @_s.required this.timestampRange,
  });
  Map<String, dynamic> toJson() => _$ClipFragmentSelectorToJson(this);
}

enum ClipFragmentSelectorType {
  @_s.JsonValue('PRODUCER_TIMESTAMP')
  producerTimestamp,
  @_s.JsonValue('SERVER_TIMESTAMP')
  serverTimestamp,
}

/// The range of timestamps for which to return fragments.
///
/// The values in the ClipTimestampRange are <code>inclusive</code>. Fragments
/// that begin before the start time but continue past it, or fragments that
/// begin before the end time but continue past it, are included in the session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class ClipTimestampRange {
  /// The end of the timestamp range for the requested media.
  ///
  /// This value must be within 3 hours of the specified
  /// <code>StartTimestamp</code>, and it must be later than the
  /// <code>StartTimestamp</code> value. If <code>FragmentSelectorType</code> for
  /// the request is <code>SERVER_TIMESTAMP</code>, this value must be in the
  /// past.
  ///
  /// This value is inclusive. The <code>EndTimestamp</code> is compared to the
  /// (starting) timestamp of the fragment. Fragments that start before the
  /// <code>EndTimestamp</code> value and continue past it are included in the
  /// session.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTimestamp')
  final DateTime endTimestamp;

  /// The starting timestamp in the range of timestamps for which to return
  /// fragments.
  ///
  /// This value is inclusive. Fragments that start before the
  /// <code>StartTimestamp</code> and continue past it are included in the
  /// session. If <code>FragmentSelectorType</code> is
  /// <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later
  /// than the stream head.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTimestamp')
  final DateTime startTimestamp;

  ClipTimestampRange({
    @_s.required this.endTimestamp,
    @_s.required this.startTimestamp,
  });
  Map<String, dynamic> toJson() => _$ClipTimestampRangeToJson(this);
}

enum ContainerFormat {
  @_s.JsonValue('FRAGMENTED_MP4')
  fragmentedMp4,
  @_s.JsonValue('MPEG_TS')
  mpegTs,
}

extension on ContainerFormat {
  String toValue() {
    switch (this) {
      case ContainerFormat.fragmentedMp4:
        return 'FRAGMENTED_MP4';
      case ContainerFormat.mpegTs:
        return 'MPEG_TS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DASHDisplayFragmentNumber {
  @_s.JsonValue('ALWAYS')
  always,
  @_s.JsonValue('NEVER')
  never,
}

extension on DASHDisplayFragmentNumber {
  String toValue() {
    switch (this) {
      case DASHDisplayFragmentNumber.always:
        return 'ALWAYS';
      case DASHDisplayFragmentNumber.never:
        return 'NEVER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum DASHDisplayFragmentTimestamp {
  @_s.JsonValue('ALWAYS')
  always,
  @_s.JsonValue('NEVER')
  never,
}

extension on DASHDisplayFragmentTimestamp {
  String toValue() {
    switch (this) {
      case DASHDisplayFragmentTimestamp.always:
        return 'ALWAYS';
      case DASHDisplayFragmentTimestamp.never:
        return 'NEVER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the range of timestamps for the requested media, and the source of
/// the timestamps.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DASHFragmentSelector {
  /// The source of the timestamps for the requested media.
  ///
  /// When <code>FragmentSelectorType</code> is set to
  /// <code>PRODUCER_TIMESTAMP</code> and
  /// <a>GetDASHStreamingSessionURLInput$PlaybackMode</a> is
  /// <code>ON_DEMAND</code> or <code>LIVE_REPLAY</code>, the first fragment
  /// ingested with a producer timestamp within the specified
  /// <a>FragmentSelector$TimestampRange</a> is included in the media playlist. In
  /// addition, the fragments with producer timestamps within the
  /// <code>TimestampRange</code> ingested immediately following the first
  /// fragment (up to the
  /// <a>GetDASHStreamingSessionURLInput$MaxManifestFragmentResults</a> value) are
  /// included.
  ///
  /// Fragments that have duplicate producer timestamps are deduplicated. This
  /// means that if producers are producing a stream of fragments with producer
  /// timestamps that are approximately equal to the true clock time, the
  /// MPEG-DASH manifest will contain all of the fragments within the requested
  /// timestamp range. If some fragments are ingested within the same time range
  /// and very different points in time, only the oldest ingested collection of
  /// fragments are returned.
  ///
  /// When <code>FragmentSelectorType</code> is set to
  /// <code>PRODUCER_TIMESTAMP</code> and
  /// <a>GetDASHStreamingSessionURLInput$PlaybackMode</a> is <code>LIVE</code>,
  /// the producer timestamps are used in the MP4 fragments and for deduplication.
  /// But the most recently ingested fragments based on server timestamps are
  /// included in the MPEG-DASH manifest. This means that even if fragments
  /// ingested in the past have producer timestamps with values now, they are not
  /// included in the HLS media playlist.
  ///
  /// The default is <code>SERVER_TIMESTAMP</code>.
  @_s.JsonKey(name: 'FragmentSelectorType')
  final DASHFragmentSelectorType fragmentSelectorType;

  /// The start and end of the timestamp range for the requested media.
  ///
  /// This value should not be present if <code>PlaybackType</code> is
  /// <code>LIVE</code>.
  @_s.JsonKey(name: 'TimestampRange')
  final DASHTimestampRange timestampRange;

  DASHFragmentSelector({
    this.fragmentSelectorType,
    this.timestampRange,
  });
  Map<String, dynamic> toJson() => _$DASHFragmentSelectorToJson(this);
}

enum DASHFragmentSelectorType {
  @_s.JsonValue('PRODUCER_TIMESTAMP')
  producerTimestamp,
  @_s.JsonValue('SERVER_TIMESTAMP')
  serverTimestamp,
}

enum DASHPlaybackMode {
  @_s.JsonValue('LIVE')
  live,
  @_s.JsonValue('LIVE_REPLAY')
  liveReplay,
  @_s.JsonValue('ON_DEMAND')
  onDemand,
}

extension on DASHPlaybackMode {
  String toValue() {
    switch (this) {
      case DASHPlaybackMode.live:
        return 'LIVE';
      case DASHPlaybackMode.liveReplay:
        return 'LIVE_REPLAY';
      case DASHPlaybackMode.onDemand:
        return 'ON_DEMAND';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The start and end of the timestamp range for the requested media.
///
/// This value should not be present if <code>PlaybackType</code> is
/// <code>LIVE</code>.
/// <note>
/// The values in the <code>DASHimestampRange</code> are inclusive. Fragments
/// that begin before the start time but continue past it, or fragments that
/// begin before the end time but continue past it, are included in the session.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class DASHTimestampRange {
  /// The end of the timestamp range for the requested media. This value must be
  /// within 3 hours of the specified <code>StartTimestamp</code>, and it must be
  /// later than the <code>StartTimestamp</code> value.
  ///
  /// If <code>FragmentSelectorType</code> for the request is
  /// <code>SERVER_TIMESTAMP</code>, this value must be in the past.
  ///
  /// The <code>EndTimestamp</code> value is required for <code>ON_DEMAND</code>
  /// mode, but optional for <code>LIVE_REPLAY</code> mode. If the
  /// <code>EndTimestamp</code> is not set for <code>LIVE_REPLAY</code> mode then
  /// the session will continue to include newly ingested fragments until the
  /// session expires.
  /// <note>
  /// This value is inclusive. The <code>EndTimestamp</code> is compared to the
  /// (starting) timestamp of the fragment. Fragments that start before the
  /// <code>EndTimestamp</code> value and continue past it are included in the
  /// session.
  /// </note>
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTimestamp')
  final DateTime endTimestamp;

  /// The start of the timestamp range for the requested media.
  ///
  /// If the <code>DASHTimestampRange</code> value is specified, the
  /// <code>StartTimestamp</code> value is required.
  /// <note>
  /// This value is inclusive. Fragments that start before the
  /// <code>StartTimestamp</code> and continue past it are included in the
  /// session. If <code>FragmentSelectorType</code> is
  /// <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later
  /// than the stream head.
  /// </note>
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTimestamp')
  final DateTime startTimestamp;

  DASHTimestampRange({
    this.endTimestamp,
    this.startTimestamp,
  });
  Map<String, dynamic> toJson() => _$DASHTimestampRangeToJson(this);
}

/// Represents a segment of video or other time-delimited data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Fragment {
  /// The playback duration or other time value associated with the fragment.
  @_s.JsonKey(name: 'FragmentLengthInMilliseconds')
  final int fragmentLengthInMilliseconds;

  /// The unique identifier of the fragment. This value monotonically increases
  /// based on the ingestion order.
  @_s.JsonKey(name: 'FragmentNumber')
  final String fragmentNumber;

  /// The total fragment size, including information about the fragment and
  /// contained media data.
  @_s.JsonKey(name: 'FragmentSizeInBytes')
  final int fragmentSizeInBytes;

  /// The timestamp from the producer corresponding to the fragment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ProducerTimestamp')
  final DateTime producerTimestamp;

  /// The timestamp from the AWS server corresponding to the fragment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ServerTimestamp')
  final DateTime serverTimestamp;

  Fragment({
    this.fragmentLengthInMilliseconds,
    this.fragmentNumber,
    this.fragmentSizeInBytes,
    this.producerTimestamp,
    this.serverTimestamp,
  });
  factory Fragment.fromJson(Map<String, dynamic> json) =>
      _$FragmentFromJson(json);
}

/// Describes the timestamp range and timestamp origin of a range of fragments.
///
/// Only fragments with a start timestamp greater than or equal to the given
/// start time and less than or equal to the end time are returned. For example,
/// if a stream contains fragments with the following start timestamps:
///
/// <ul>
/// <li>
/// 00:00:00
/// </li>
/// <li>
/// 00:00:02
/// </li>
/// <li>
/// 00:00:04
/// </li>
/// <li>
/// 00:00:06
/// </li>
/// </ul>
/// A fragment selector range with a start time of 00:00:01 and end time of
/// 00:00:04 would return the fragments with start times of 00:00:02 and
/// 00:00:04.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class FragmentSelector {
  /// The origin of the timestamps to use (Server or Producer).
  @_s.JsonKey(name: 'FragmentSelectorType')
  final FragmentSelectorType fragmentSelectorType;

  /// The range of timestamps to return.
  @_s.JsonKey(name: 'TimestampRange')
  final TimestampRange timestampRange;

  FragmentSelector({
    @_s.required this.fragmentSelectorType,
    @_s.required this.timestampRange,
  });
  Map<String, dynamic> toJson() => _$FragmentSelectorToJson(this);
}

enum FragmentSelectorType {
  @_s.JsonValue('PRODUCER_TIMESTAMP')
  producerTimestamp,
  @_s.JsonValue('SERVER_TIMESTAMP')
  serverTimestamp,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetClipOutput {
  /// The content type of the media in the requested clip.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// Traditional MP4 file that contains the media clip from the specified video
  /// stream. The output will contain the first 100 MB or the first 200 fragments
  /// from the specified start timestamp. For more information, see <a
  /// href="Kinesis Video Streams Limits">Kinesis Video Streams Limits</a>.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Payload')
  final Uint8List payload;

  GetClipOutput({
    this.contentType,
    this.payload,
  });
  factory GetClipOutput.fromJson(Map<String, dynamic> json) =>
      _$GetClipOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetDASHStreamingSessionURLOutput {
  /// The URL (containing the session token) that a media player can use to
  /// retrieve the MPEG-DASH manifest.
  @_s.JsonKey(name: 'DASHStreamingSessionURL')
  final String dASHStreamingSessionURL;

  GetDASHStreamingSessionURLOutput({
    this.dASHStreamingSessionURL,
  });
  factory GetDASHStreamingSessionURLOutput.fromJson(
          Map<String, dynamic> json) =>
      _$GetDASHStreamingSessionURLOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetHLSStreamingSessionURLOutput {
  /// The URL (containing the session token) that a media player can use to
  /// retrieve the HLS master playlist.
  @_s.JsonKey(name: 'HLSStreamingSessionURL')
  final String hLSStreamingSessionURL;

  GetHLSStreamingSessionURLOutput({
    this.hLSStreamingSessionURL,
  });
  factory GetHLSStreamingSessionURLOutput.fromJson(Map<String, dynamic> json) =>
      _$GetHLSStreamingSessionURLOutputFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMediaForFragmentListOutput {
  /// The content type of the requested media.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// The payload that Kinesis Video Streams returns is a sequence of chunks from
  /// the specified stream. For information about the chunks, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_dataplane_PutMedia.html">PutMedia</a>.
  /// The chunks that Kinesis Video Streams returns in the
  /// <code>GetMediaForFragmentList</code> call also include the following
  /// additional Matroska (MKV) tags:
  ///
  /// <ul>
  /// <li>
  /// AWS_KINESISVIDEO_FRAGMENT_NUMBER - Fragment number returned in the chunk.
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_SERVER_SIDE_TIMESTAMP - Server-side timestamp of the
  /// fragment.
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_PRODUCER_SIDE_TIMESTAMP - Producer-side timestamp of the
  /// fragment.
  /// </li>
  /// </ul>
  /// The following tags will be included if an exception occurs:
  ///
  /// <ul>
  /// <li>
  /// AWS_KINESISVIDEO_FRAGMENT_NUMBER - The number of the fragment that threw the
  /// exception
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_EXCEPTION_ERROR_CODE - The integer code of the exception
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_EXCEPTION_MESSAGE - A text description of the exception
  /// </li>
  /// </ul>
  @Uint8ListConverter()
  @_s.JsonKey(name: 'Payload')
  final Uint8List payload;

  GetMediaForFragmentListOutput({
    this.contentType,
    this.payload,
  });
  factory GetMediaForFragmentListOutput.fromJson(Map<String, dynamic> json) =>
      _$GetMediaForFragmentListOutputFromJson(json);
}

enum HLSDiscontinuityMode {
  @_s.JsonValue('ALWAYS')
  always,
  @_s.JsonValue('NEVER')
  never,
  @_s.JsonValue('ON_DISCONTINUITY')
  onDiscontinuity,
}

extension on HLSDiscontinuityMode {
  String toValue() {
    switch (this) {
      case HLSDiscontinuityMode.always:
        return 'ALWAYS';
      case HLSDiscontinuityMode.never:
        return 'NEVER';
      case HLSDiscontinuityMode.onDiscontinuity:
        return 'ON_DISCONTINUITY';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum HLSDisplayFragmentTimestamp {
  @_s.JsonValue('ALWAYS')
  always,
  @_s.JsonValue('NEVER')
  never,
}

extension on HLSDisplayFragmentTimestamp {
  String toValue() {
    switch (this) {
      case HLSDisplayFragmentTimestamp.always:
        return 'ALWAYS';
      case HLSDisplayFragmentTimestamp.never:
        return 'NEVER';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Contains the range of timestamps for the requested media, and the source of
/// the timestamps.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HLSFragmentSelector {
  /// The source of the timestamps for the requested media.
  ///
  /// When <code>FragmentSelectorType</code> is set to
  /// <code>PRODUCER_TIMESTAMP</code> and
  /// <a>GetHLSStreamingSessionURLInput$PlaybackMode</a> is <code>ON_DEMAND</code>
  /// or <code>LIVE_REPLAY</code>, the first fragment ingested with a producer
  /// timestamp within the specified <a>FragmentSelector$TimestampRange</a> is
  /// included in the media playlist. In addition, the fragments with producer
  /// timestamps within the <code>TimestampRange</code> ingested immediately
  /// following the first fragment (up to the
  /// <a>GetHLSStreamingSessionURLInput$MaxMediaPlaylistFragmentResults</a> value)
  /// are included.
  ///
  /// Fragments that have duplicate producer timestamps are deduplicated. This
  /// means that if producers are producing a stream of fragments with producer
  /// timestamps that are approximately equal to the true clock time, the HLS
  /// media playlists will contain all of the fragments within the requested
  /// timestamp range. If some fragments are ingested within the same time range
  /// and very different points in time, only the oldest ingested collection of
  /// fragments are returned.
  ///
  /// When <code>FragmentSelectorType</code> is set to
  /// <code>PRODUCER_TIMESTAMP</code> and
  /// <a>GetHLSStreamingSessionURLInput$PlaybackMode</a> is <code>LIVE</code>, the
  /// producer timestamps are used in the MP4 fragments and for deduplication. But
  /// the most recently ingested fragments based on server timestamps are included
  /// in the HLS media playlist. This means that even if fragments ingested in the
  /// past have producer timestamps with values now, they are not included in the
  /// HLS media playlist.
  ///
  /// The default is <code>SERVER_TIMESTAMP</code>.
  @_s.JsonKey(name: 'FragmentSelectorType')
  final HLSFragmentSelectorType fragmentSelectorType;

  /// The start and end of the timestamp range for the requested media.
  ///
  /// This value should not be present if <code>PlaybackType</code> is
  /// <code>LIVE</code>.
  @_s.JsonKey(name: 'TimestampRange')
  final HLSTimestampRange timestampRange;

  HLSFragmentSelector({
    this.fragmentSelectorType,
    this.timestampRange,
  });
  Map<String, dynamic> toJson() => _$HLSFragmentSelectorToJson(this);
}

enum HLSFragmentSelectorType {
  @_s.JsonValue('PRODUCER_TIMESTAMP')
  producerTimestamp,
  @_s.JsonValue('SERVER_TIMESTAMP')
  serverTimestamp,
}

enum HLSPlaybackMode {
  @_s.JsonValue('LIVE')
  live,
  @_s.JsonValue('LIVE_REPLAY')
  liveReplay,
  @_s.JsonValue('ON_DEMAND')
  onDemand,
}

extension on HLSPlaybackMode {
  String toValue() {
    switch (this) {
      case HLSPlaybackMode.live:
        return 'LIVE';
      case HLSPlaybackMode.liveReplay:
        return 'LIVE_REPLAY';
      case HLSPlaybackMode.onDemand:
        return 'ON_DEMAND';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The start and end of the timestamp range for the requested media.
///
/// This value should not be present if <code>PlaybackType</code> is
/// <code>LIVE</code>.
/// <note>
/// The values in the <code>HLSTimestampRange</code> are inclusive. Fragments
/// that begin before the start time but continue past it, or fragments that
/// begin before the end time but continue past it, are included in the session.
/// </note>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class HLSTimestampRange {
  /// The end of the timestamp range for the requested media. This value must be
  /// within 3 hours of the specified <code>StartTimestamp</code>, and it must be
  /// later than the <code>StartTimestamp</code> value.
  ///
  /// If <code>FragmentSelectorType</code> for the request is
  /// <code>SERVER_TIMESTAMP</code>, this value must be in the past.
  ///
  /// The <code>EndTimestamp</code> value is required for <code>ON_DEMAND</code>
  /// mode, but optional for <code>LIVE_REPLAY</code> mode. If the
  /// <code>EndTimestamp</code> is not set for <code>LIVE_REPLAY</code> mode then
  /// the session will continue to include newly ingested fragments until the
  /// session expires.
  /// <note>
  /// This value is inclusive. The <code>EndTimestamp</code> is compared to the
  /// (starting) timestamp of the fragment. Fragments that start before the
  /// <code>EndTimestamp</code> value and continue past it are included in the
  /// session.
  /// </note>
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTimestamp')
  final DateTime endTimestamp;

  /// The start of the timestamp range for the requested media.
  ///
  /// If the <code>HLSTimestampRange</code> value is specified, the
  /// <code>StartTimestamp</code> value is required.
  /// <note>
  /// This value is inclusive. Fragments that start before the
  /// <code>StartTimestamp</code> and continue past it are included in the
  /// session. If <code>FragmentSelectorType</code> is
  /// <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later
  /// than the stream head.
  /// </note>
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTimestamp')
  final DateTime startTimestamp;

  HLSTimestampRange({
    this.endTimestamp,
    this.startTimestamp,
  });
  Map<String, dynamic> toJson() => _$HLSTimestampRangeToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFragmentsOutput {
  /// A list of archived <a>Fragment</a> objects from the stream that meet the
  /// selector criteria. Results are in no specific order, even across pages.
  @_s.JsonKey(name: 'Fragments')
  final List<Fragment> fragments;

  /// If the returned list is truncated, the operation returns this token to use
  /// to retrieve the next page of results. This value is <code>null</code> when
  /// there are no more results to return.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListFragmentsOutput({
    this.fragments,
    this.nextToken,
  });
  factory ListFragmentsOutput.fromJson(Map<String, dynamic> json) =>
      _$ListFragmentsOutputFromJson(json);
}

/// The range of timestamps for which to return fragments.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TimestampRange {
  /// The ending timestamp in the range of timestamps for which to return
  /// fragments.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTimestamp')
  final DateTime endTimestamp;

  /// The starting timestamp in the range of timestamps for which to return
  /// fragments.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTimestamp')
  final DateTime startTimestamp;

  TimestampRange({
    @_s.required this.endTimestamp,
    @_s.required this.startTimestamp,
  });
  Map<String, dynamic> toJson() => _$TimestampRangeToJson(this);
}

class ClientLimitExceededException extends _s.GenericAwsException {
  ClientLimitExceededException({String type, String message})
      : super(
            type: type, code: 'ClientLimitExceededException', message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String type, String message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidCodecPrivateDataException extends _s.GenericAwsException {
  InvalidCodecPrivateDataException({String type, String message})
      : super(
            type: type,
            code: 'InvalidCodecPrivateDataException',
            message: message);
}

class InvalidMediaFrameException extends _s.GenericAwsException {
  InvalidMediaFrameException({String type, String message})
      : super(type: type, code: 'InvalidMediaFrameException', message: message);
}

class MissingCodecPrivateDataException extends _s.GenericAwsException {
  MissingCodecPrivateDataException({String type, String message})
      : super(
            type: type,
            code: 'MissingCodecPrivateDataException',
            message: message);
}

class NoDataRetentionException extends _s.GenericAwsException {
  NoDataRetentionException({String type, String message})
      : super(type: type, code: 'NoDataRetentionException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String type, String message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class UnsupportedStreamMediaTypeException extends _s.GenericAwsException {
  UnsupportedStreamMediaTypeException({String type, String message})
      : super(
            type: type,
            code: 'UnsupportedStreamMediaTypeException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ClientLimitExceededException': (type, message) =>
      ClientLimitExceededException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidCodecPrivateDataException': (type, message) =>
      InvalidCodecPrivateDataException(type: type, message: message),
  'InvalidMediaFrameException': (type, message) =>
      InvalidMediaFrameException(type: type, message: message),
  'MissingCodecPrivateDataException': (type, message) =>
      MissingCodecPrivateDataException(type: type, message: message),
  'NoDataRetentionException': (type, message) =>
      NoDataRetentionException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'UnsupportedStreamMediaTypeException': (type, message) =>
      UnsupportedStreamMediaTypeException(type: type, message: message),
};
