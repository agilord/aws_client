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

/// <p/>
class KinesisVideoArchivedMedia {
  final _s.RestJsonProtocol _protocol;
  KinesisVideoArchivedMedia({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisvideo',
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

  /// Downloads an MP4 file (clip) containing the archived, on-demand media from
  /// the specified video stream over the specified time range.
  ///
  /// Both the StreamName and the StreamARN parameters are optional, but you
  /// must specify either the StreamName or the StreamARN when invoking this API
  /// operation.
  ///
  /// As a prerequisite to using GetCLip API, you must obtain an endpoint using
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
  /// href="https://aws.amazon.com/pricing/"> Amazon Web Services Pricing</a>.
  /// Charges for outgoing Amazon Web Services data apply.
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
    required ClipFragmentSelector clipFragmentSelector,
    String? streamARN,
    String? streamName,
  }) async {
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
  /// Don't share or store this token where an unauthorized entity can access
  /// it. The token provides access to the content of the stream. Safeguard the
  /// token with the same measures that you use with your Amazon Web Services
  /// credentials.
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
  /// For restrictions that apply to MPEG-DASH sessions, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html">Kinesis
  /// Video Streams Limits</a>.
  /// </note>
  /// You can monitor the amount of data that the media player consumes by
  /// monitoring the <code>GetMP4MediaFragment.OutgoingBytes</code> Amazon
  /// CloudWatch metric. For information about using CloudWatch to monitor
  /// Kinesis Video Streams, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html">Monitoring
  /// Kinesis Video Streams</a>. For pricing information, see <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Amazon
  /// Kinesis Video Streams Pricing</a> and <a
  /// href="https://aws.amazon.com/pricing/">Amazon Web Services Pricing</a>.
  /// Charges for both HLS sessions and outgoing Amazon Web Services data apply.
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
  /// to Amazon Web Services the support team can better diagnose the problem if
  /// given the Request Id.
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
  /// is specified in <code>MaxManifestFragmentResults</code>. The manifest must
  /// be retrieved only once for each session. When this type of session is
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
    DASHFragmentSelector? dASHFragmentSelector,
    DASHDisplayFragmentNumber? displayFragmentNumber,
    DASHDisplayFragmentTimestamp? displayFragmentTimestamp,
    int? expires,
    int? maxManifestFragmentResults,
    DASHPlaybackMode? playbackMode,
    String? streamARN,
    String? streamName,
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
      5000,
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
  /// For streaming video, the media must contain H.264 or H.265 encoded video
  /// and, optionally, AAC encoded audio. Specifically, the codec ID of track 1
  /// should be <code>V_MPEG/ISO/AVC</code> (for H.264) or
  /// <code>V_MPEG/ISO/HEVC</code> (for H.265). Optionally, the codec ID of
  /// track 2 should be <code>A_AAC</code>. For audio only streaming, the codec
  /// ID of track 1 should be <code>A_AAC</code>.
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
  /// token with the same measures that you would use with your Amazon Web
  /// Services credentials.
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
  /// For the HLS streaming session, in-track codec private data (CPD) changes
  /// are supported. After the first media fragment is made available in a
  /// streaming session, fragments can contain CPD changes for each track.
  /// Therefore, the fragments in a session can have a different resolution, bit
  /// rate, or other information in the CPD without interrupting playback.
  /// However, any change made in the track number or track codec format can
  /// return an error when those different media fragments are loaded. For
  /// example, streaming will fail if the fragments in the stream change from
  /// having only video to having both audio and video, or if an AAC audio track
  /// is changed to an ALAW audio track. For each streaming session, only 500
  /// CPD changes are allowed.
  /// </note>
  /// Data retrieved with this action is billable. For information, see <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Pricing</a>.
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
  /// </ul> </li> </ol>
  /// A streaming session URL must not be shared between players. The service
  /// might throttle a session if multiple media players are sharing it. For
  /// connection limits, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html">Kinesis
  /// Video Streams Limits</a>.
  ///
  /// You can monitor the amount of data that the media player consumes by
  /// monitoring the <code>GetMP4MediaFragment.OutgoingBytes</code> Amazon
  /// CloudWatch metric. For information about using CloudWatch to monitor
  /// Kinesis Video Streams, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/monitoring.html">Monitoring
  /// Kinesis Video Streams</a>. For pricing information, see <a
  /// href="https://aws.amazon.com/kinesis/video-streams/pricing/">Amazon
  /// Kinesis Video Streams Pricing</a> and <a
  /// href="https://aws.amazon.com/pricing/">Amazon Web Services Pricing</a>.
  /// Charges for both HLS sessions and outgoing Amazon Web Services data apply.
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
  /// to Amazon Web Services, the support team can better diagnose the problem
  /// if given the Request Id.
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
  /// <code>ON_DISCONTINUITY</code>: a discontinuity marker is placed between
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
  /// The maximum value of 5,000 fragments corresponds to more than 80 minutes
  /// of video on streams with 1-second fragments, and more than 13 hours of
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
  /// the same start timestamp, the fragment that has the largest fragment
  /// number (that is, the newest fragment) is included in the HLS media
  /// playlist. The other fragments are not included. Fragments that have
  /// different timestamps but have overlapping durations are still included in
  /// the HLS media playlist. This can lead to unexpected behavior in the media
  /// player.
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
    ContainerFormat? containerFormat,
    HLSDiscontinuityMode? discontinuityMode,
    HLSDisplayFragmentTimestamp? displayFragmentTimestamp,
    int? expires,
    HLSFragmentSelector? hLSFragmentSelector,
    int? maxMediaPlaylistFragmentResults,
    HLSPlaybackMode? playbackMode,
    String? streamARN,
    String? streamName,
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
      5000,
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

  /// Retrieves a list of images corresponding to each timestamp for a given
  /// time range, sampling interval, and image format configuration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [ClientLimitExceededException].
  /// May throw [NotAuthorizedException].
  /// May throw [NoDataRetentionException].
  ///
  /// Parameter [endTimestamp] :
  /// The end timestamp for the range of images to be generated. If the time
  /// range between <code>StartTimestamp</code> and <code>EndTimestamp</code> is
  /// more than 300 seconds above <code>StartTimestamp</code>, you will receive
  /// an <code>IllegalArgumentException</code>.
  ///
  /// Parameter [format] :
  /// The format that will be used to encode the image.
  ///
  /// Parameter [imageSelectorType] :
  /// The origin of the Server or Producer timestamps to use to generate the
  /// images.
  ///
  /// Parameter [startTimestamp] :
  /// The starting point from which the images should be generated. This
  /// <code>StartTimestamp</code> must be within an inclusive range of
  /// timestamps for an image to be returned.
  ///
  /// Parameter [formatConfig] :
  /// The list of a key-value pair structure that contains extra parameters that
  /// can be applied when the image is generated. The <code>FormatConfig</code>
  /// key is the <code>JPEGQuality</code>, which indicates the JPEG quality key
  /// to be used to generate the image. The <code>FormatConfig</code> value
  /// accepts ints from 1 to 100. If the value is 1, the image will be generated
  /// with less quality and the best compression. If the value is 100, the image
  /// will be generated with the best quality and less compression. If no value
  /// is provided, the default value of the <code>JPEGQuality</code> key will be
  /// set to 80.
  ///
  /// Parameter [heightPixels] :
  /// The height of the output image that is used in conjunction with the
  /// <code>WidthPixels</code> parameter. When both <code>HeightPixels</code>
  /// and <code>WidthPixels</code> parameters are provided, the image will be
  /// stretched to fit the specified aspect ratio. If only the
  /// <code>HeightPixels</code> parameter is provided, its original aspect ratio
  /// will be used to calculate the <code>WidthPixels</code> ratio. If neither
  /// parameter is provided, the original image size will be returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of images to be returned by the API.
  /// <note>
  /// The default limit is 25 images per API response. Providing a
  /// <code>MaxResults</code> greater than this value will result in a page size
  /// of 25. Any additional results will be paginated.
  /// </note>
  ///
  /// Parameter [nextToken] :
  /// A token that specifies where to start paginating the next set of Images.
  /// This is the <code>GetImages:NextToken</code> from a previously truncated
  /// response.
  ///
  /// Parameter [samplingInterval] :
  /// The time interval in milliseconds (ms) at which the images need to be
  /// generated from the stream. The minimum value that can be provided is 200
  /// ms (5 images per second). If the timestamp range is less than the sampling
  /// interval, the image from the <code>startTimestamp</code> will be returned
  /// if available.
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream from which to retrieve the
  /// images. You must specify either the <code>StreamName</code> or the
  /// <code>StreamARN</code>.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to retrieve the images. You must specify
  /// either the <code>StreamName</code> or the <code>StreamARN</code>.
  ///
  /// Parameter [widthPixels] :
  /// The width of the output image that is used in conjunction with the
  /// <code>HeightPixels</code> parameter. When both <code>WidthPixels</code>
  /// and <code>HeightPixels</code> parameters are provided, the image will be
  /// stretched to fit the specified aspect ratio. If only the
  /// <code>WidthPixels</code> parameter is provided or if only the
  /// <code>HeightPixels</code> is provided, a <code>ValidationException</code>
  /// will be thrown. If neither parameter is provided, the original image size
  /// from the stream will be returned.
  Future<GetImagesOutput> getImages({
    required DateTime endTimestamp,
    required Format format,
    required ImageSelectorType imageSelectorType,
    required DateTime startTimestamp,
    Map<FormatConfigKey, String>? formatConfig,
    int? heightPixels,
    int? maxResults,
    String? nextToken,
    int? samplingInterval,
    String? streamARN,
    String? streamName,
    int? widthPixels,
  }) async {
    _s.validateNumRange(
      'heightPixels',
      heightPixels,
      1,
      2160,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateNumRange(
      'widthPixels',
      widthPixels,
      1,
      3840,
    );
    final $payload = <String, dynamic>{
      'EndTimestamp': unixTimestampToJson(endTimestamp),
      'Format': format.toValue(),
      'ImageSelectorType': imageSelectorType.toValue(),
      'StartTimestamp': unixTimestampToJson(startTimestamp),
      if (formatConfig != null)
        'FormatConfig': formatConfig.map((k, e) => MapEntry(k.toValue(), e)),
      if (heightPixels != null) 'HeightPixels': heightPixels,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (samplingInterval != null) 'SamplingInterval': samplingInterval,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
      if (widthPixels != null) 'WidthPixels': widthPixels,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getImages',
      exceptionFnMap: _exceptionFns,
    );
    return GetImagesOutput.fromJson(response);
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
  /// For limits, see <a
  /// href="http://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html">Kinesis
  /// Video Streams Limits</a>.
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
  /// to Amazon Web Services, the support team can better diagnose the problem
  /// if given the Request Id.
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
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream from which to retrieve
  /// fragment media. Specify either this parameter or the
  /// <code>StreamName</code> parameter.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to retrieve fragment media. Specify
  /// either this parameter or the <code>StreamARN</code> parameter.
  Future<GetMediaForFragmentListOutput> getMediaForFragmentList({
    required List<String> fragments,
    String? streamARN,
    String? streamName,
  }) async {
    final $payload = <String, dynamic>{
      'Fragments': fragments,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
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
  /// to Amazon Web Services, the support team can better diagnose the problem
  /// if given the Request Id.
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
  /// Parameter [fragmentSelector] :
  /// Describes the timestamp range and timestamp origin for the range of
  /// fragments to return.
  /// <note>
  /// This is only required when the <code>NextToken</code> isn't passed in the
  /// API.
  /// </note>
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
  ///
  /// Parameter [streamARN] :
  /// The Amazon Resource Name (ARN) of the stream from which to retrieve a
  /// fragment list. Specify either this parameter or the
  /// <code>StreamName</code> parameter.
  ///
  /// Parameter [streamName] :
  /// The name of the stream from which to retrieve a fragment list. Specify
  /// either this parameter or the <code>StreamARN</code> parameter.
  Future<ListFragmentsOutput> listFragments({
    FragmentSelector? fragmentSelector,
    int? maxResults,
    String? nextToken,
    String? streamARN,
    String? streamName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (fragmentSelector != null) 'FragmentSelector': fragmentSelector,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (streamARN != null) 'StreamARN': streamARN,
      if (streamName != null) 'StreamName': streamName,
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
class ClipFragmentSelector {
  /// The origin of the timestamps to use (Server or Producer).
  final ClipFragmentSelectorType fragmentSelectorType;

  /// The range of timestamps to return.
  final ClipTimestampRange timestampRange;

  ClipFragmentSelector({
    required this.fragmentSelectorType,
    required this.timestampRange,
  });

  Map<String, dynamic> toJson() {
    final fragmentSelectorType = this.fragmentSelectorType;
    final timestampRange = this.timestampRange;
    return {
      'FragmentSelectorType': fragmentSelectorType.toValue(),
      'TimestampRange': timestampRange,
    };
  }
}

enum ClipFragmentSelectorType {
  producerTimestamp,
  serverTimestamp,
}

extension ClipFragmentSelectorTypeValueExtension on ClipFragmentSelectorType {
  String toValue() {
    switch (this) {
      case ClipFragmentSelectorType.producerTimestamp:
        return 'PRODUCER_TIMESTAMP';
      case ClipFragmentSelectorType.serverTimestamp:
        return 'SERVER_TIMESTAMP';
    }
  }
}

extension ClipFragmentSelectorTypeFromString on String {
  ClipFragmentSelectorType toClipFragmentSelectorType() {
    switch (this) {
      case 'PRODUCER_TIMESTAMP':
        return ClipFragmentSelectorType.producerTimestamp;
      case 'SERVER_TIMESTAMP':
        return ClipFragmentSelectorType.serverTimestamp;
    }
    throw Exception('$this is not known in enum ClipFragmentSelectorType');
  }
}

/// The range of timestamps for which to return fragments.
class ClipTimestampRange {
  /// The end of the timestamp range for the requested media.
  ///
  /// This value must be within 24 hours of the specified
  /// <code>StartTimestamp</code>, and it must be later than the
  /// <code>StartTimestamp</code> value. If <code>FragmentSelectorType</code> for
  /// the request is <code>SERVER_TIMESTAMP</code>, this value must be in the
  /// past.
  ///
  /// This value is inclusive. The <code>EndTimestamp</code> is compared to the
  /// (starting) timestamp of the fragment. Fragments that start before the
  /// <code>EndTimestamp</code> value and continue past it are included in the
  /// session.
  final DateTime endTimestamp;

  /// The starting timestamp in the range of timestamps for which to return
  /// fragments.
  ///
  /// Only fragments that start exactly at or after <code>StartTimestamp</code>
  /// are included in the session. Fragments that start before
  /// <code>StartTimestamp</code> and continue past it aren't included in the
  /// session. If <code>FragmentSelectorType</code> is
  /// <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later
  /// than the stream head.
  final DateTime startTimestamp;

  ClipTimestampRange({
    required this.endTimestamp,
    required this.startTimestamp,
  });

  Map<String, dynamic> toJson() {
    final endTimestamp = this.endTimestamp;
    final startTimestamp = this.startTimestamp;
    return {
      'EndTimestamp': unixTimestampToJson(endTimestamp),
      'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

enum ContainerFormat {
  fragmentedMp4,
  mpegTs,
}

extension ContainerFormatValueExtension on ContainerFormat {
  String toValue() {
    switch (this) {
      case ContainerFormat.fragmentedMp4:
        return 'FRAGMENTED_MP4';
      case ContainerFormat.mpegTs:
        return 'MPEG_TS';
    }
  }
}

extension ContainerFormatFromString on String {
  ContainerFormat toContainerFormat() {
    switch (this) {
      case 'FRAGMENTED_MP4':
        return ContainerFormat.fragmentedMp4;
      case 'MPEG_TS':
        return ContainerFormat.mpegTs;
    }
    throw Exception('$this is not known in enum ContainerFormat');
  }
}

enum DASHDisplayFragmentNumber {
  always,
  never,
}

extension DASHDisplayFragmentNumberValueExtension on DASHDisplayFragmentNumber {
  String toValue() {
    switch (this) {
      case DASHDisplayFragmentNumber.always:
        return 'ALWAYS';
      case DASHDisplayFragmentNumber.never:
        return 'NEVER';
    }
  }
}

extension DASHDisplayFragmentNumberFromString on String {
  DASHDisplayFragmentNumber toDASHDisplayFragmentNumber() {
    switch (this) {
      case 'ALWAYS':
        return DASHDisplayFragmentNumber.always;
      case 'NEVER':
        return DASHDisplayFragmentNumber.never;
    }
    throw Exception('$this is not known in enum DASHDisplayFragmentNumber');
  }
}

enum DASHDisplayFragmentTimestamp {
  always,
  never,
}

extension DASHDisplayFragmentTimestampValueExtension
    on DASHDisplayFragmentTimestamp {
  String toValue() {
    switch (this) {
      case DASHDisplayFragmentTimestamp.always:
        return 'ALWAYS';
      case DASHDisplayFragmentTimestamp.never:
        return 'NEVER';
    }
  }
}

extension DASHDisplayFragmentTimestampFromString on String {
  DASHDisplayFragmentTimestamp toDASHDisplayFragmentTimestamp() {
    switch (this) {
      case 'ALWAYS':
        return DASHDisplayFragmentTimestamp.always;
      case 'NEVER':
        return DASHDisplayFragmentTimestamp.never;
    }
    throw Exception('$this is not known in enum DASHDisplayFragmentTimestamp');
  }
}

/// Contains the range of timestamps for the requested media, and the source of
/// the timestamps.
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
  final DASHFragmentSelectorType? fragmentSelectorType;

  /// The start and end of the timestamp range for the requested media.
  ///
  /// This value should not be present if <code>PlaybackType</code> is
  /// <code>LIVE</code>.
  final DASHTimestampRange? timestampRange;

  DASHFragmentSelector({
    this.fragmentSelectorType,
    this.timestampRange,
  });

  Map<String, dynamic> toJson() {
    final fragmentSelectorType = this.fragmentSelectorType;
    final timestampRange = this.timestampRange;
    return {
      if (fragmentSelectorType != null)
        'FragmentSelectorType': fragmentSelectorType.toValue(),
      if (timestampRange != null) 'TimestampRange': timestampRange,
    };
  }
}

enum DASHFragmentSelectorType {
  producerTimestamp,
  serverTimestamp,
}

extension DASHFragmentSelectorTypeValueExtension on DASHFragmentSelectorType {
  String toValue() {
    switch (this) {
      case DASHFragmentSelectorType.producerTimestamp:
        return 'PRODUCER_TIMESTAMP';
      case DASHFragmentSelectorType.serverTimestamp:
        return 'SERVER_TIMESTAMP';
    }
  }
}

extension DASHFragmentSelectorTypeFromString on String {
  DASHFragmentSelectorType toDASHFragmentSelectorType() {
    switch (this) {
      case 'PRODUCER_TIMESTAMP':
        return DASHFragmentSelectorType.producerTimestamp;
      case 'SERVER_TIMESTAMP':
        return DASHFragmentSelectorType.serverTimestamp;
    }
    throw Exception('$this is not known in enum DASHFragmentSelectorType');
  }
}

enum DASHPlaybackMode {
  live,
  liveReplay,
  onDemand,
}

extension DASHPlaybackModeValueExtension on DASHPlaybackMode {
  String toValue() {
    switch (this) {
      case DASHPlaybackMode.live:
        return 'LIVE';
      case DASHPlaybackMode.liveReplay:
        return 'LIVE_REPLAY';
      case DASHPlaybackMode.onDemand:
        return 'ON_DEMAND';
    }
  }
}

extension DASHPlaybackModeFromString on String {
  DASHPlaybackMode toDASHPlaybackMode() {
    switch (this) {
      case 'LIVE':
        return DASHPlaybackMode.live;
      case 'LIVE_REPLAY':
        return DASHPlaybackMode.liveReplay;
      case 'ON_DEMAND':
        return DASHPlaybackMode.onDemand;
    }
    throw Exception('$this is not known in enum DASHPlaybackMode');
  }
}

/// The start and end of the timestamp range for the requested media.
///
/// This value should not be present if <code>PlaybackType</code> is
/// <code>LIVE</code>.
///
/// The values in <code>DASHimestampRange</code> are inclusive. Fragments that
/// start exactly at or after the start time are included in the session.
/// Fragments that start before the start time and continue past it are not
/// included in the session.
class DASHTimestampRange {
  /// The end of the timestamp range for the requested media. This value must be
  /// within 24 hours of the specified <code>StartTimestamp</code>, and it must be
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
  final DateTime? endTimestamp;

  /// The start of the timestamp range for the requested media.
  ///
  /// If the <code>DASHTimestampRange</code> value is specified, the
  /// <code>StartTimestamp</code> value is required.
  ///
  /// Only fragments that start exactly at or after <code>StartTimestamp</code>
  /// are included in the session. Fragments that start before
  /// <code>StartTimestamp</code> and continue past it aren't included in the
  /// session. If <code>FragmentSelectorType</code> is
  /// <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later
  /// than the stream head.
  final DateTime? startTimestamp;

  DASHTimestampRange({
    this.endTimestamp,
    this.startTimestamp,
  });

  Map<String, dynamic> toJson() {
    final endTimestamp = this.endTimestamp;
    final startTimestamp = this.startTimestamp;
    return {
      if (endTimestamp != null)
        'EndTimestamp': unixTimestampToJson(endTimestamp),
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

enum Format {
  jpeg,
  png,
}

extension FormatValueExtension on Format {
  String toValue() {
    switch (this) {
      case Format.jpeg:
        return 'JPEG';
      case Format.png:
        return 'PNG';
    }
  }
}

extension FormatFromString on String {
  Format toFormat() {
    switch (this) {
      case 'JPEG':
        return Format.jpeg;
      case 'PNG':
        return Format.png;
    }
    throw Exception('$this is not known in enum Format');
  }
}

enum FormatConfigKey {
  jPEGQuality,
}

extension FormatConfigKeyValueExtension on FormatConfigKey {
  String toValue() {
    switch (this) {
      case FormatConfigKey.jPEGQuality:
        return 'JPEGQuality';
    }
  }
}

extension FormatConfigKeyFromString on String {
  FormatConfigKey toFormatConfigKey() {
    switch (this) {
      case 'JPEGQuality':
        return FormatConfigKey.jPEGQuality;
    }
    throw Exception('$this is not known in enum FormatConfigKey');
  }
}

/// Represents a segment of video or other time-delimited data.
class Fragment {
  /// The playback duration or other time value associated with the fragment.
  final int? fragmentLengthInMilliseconds;

  /// The unique identifier of the fragment. This value monotonically increases
  /// based on the ingestion order.
  final String? fragmentNumber;

  /// The total fragment size, including information about the fragment and
  /// contained media data.
  final int? fragmentSizeInBytes;

  /// The timestamp from the producer corresponding to the fragment.
  final DateTime? producerTimestamp;

  /// The timestamp from the Amazon Web Services server corresponding to the
  /// fragment.
  final DateTime? serverTimestamp;

  Fragment({
    this.fragmentLengthInMilliseconds,
    this.fragmentNumber,
    this.fragmentSizeInBytes,
    this.producerTimestamp,
    this.serverTimestamp,
  });

  factory Fragment.fromJson(Map<String, dynamic> json) {
    return Fragment(
      fragmentLengthInMilliseconds:
          json['FragmentLengthInMilliseconds'] as int?,
      fragmentNumber: json['FragmentNumber'] as String?,
      fragmentSizeInBytes: json['FragmentSizeInBytes'] as int?,
      producerTimestamp: timeStampFromJson(json['ProducerTimestamp']),
      serverTimestamp: timeStampFromJson(json['ServerTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final fragmentLengthInMilliseconds = this.fragmentLengthInMilliseconds;
    final fragmentNumber = this.fragmentNumber;
    final fragmentSizeInBytes = this.fragmentSizeInBytes;
    final producerTimestamp = this.producerTimestamp;
    final serverTimestamp = this.serverTimestamp;
    return {
      if (fragmentLengthInMilliseconds != null)
        'FragmentLengthInMilliseconds': fragmentLengthInMilliseconds,
      if (fragmentNumber != null) 'FragmentNumber': fragmentNumber,
      if (fragmentSizeInBytes != null)
        'FragmentSizeInBytes': fragmentSizeInBytes,
      if (producerTimestamp != null)
        'ProducerTimestamp': unixTimestampToJson(producerTimestamp),
      if (serverTimestamp != null)
        'ServerTimestamp': unixTimestampToJson(serverTimestamp),
    };
  }
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
class FragmentSelector {
  /// The origin of the timestamps to use (Server or Producer).
  final FragmentSelectorType fragmentSelectorType;

  /// The range of timestamps to return.
  final TimestampRange timestampRange;

  FragmentSelector({
    required this.fragmentSelectorType,
    required this.timestampRange,
  });

  Map<String, dynamic> toJson() {
    final fragmentSelectorType = this.fragmentSelectorType;
    final timestampRange = this.timestampRange;
    return {
      'FragmentSelectorType': fragmentSelectorType.toValue(),
      'TimestampRange': timestampRange,
    };
  }
}

enum FragmentSelectorType {
  producerTimestamp,
  serverTimestamp,
}

extension FragmentSelectorTypeValueExtension on FragmentSelectorType {
  String toValue() {
    switch (this) {
      case FragmentSelectorType.producerTimestamp:
        return 'PRODUCER_TIMESTAMP';
      case FragmentSelectorType.serverTimestamp:
        return 'SERVER_TIMESTAMP';
    }
  }
}

extension FragmentSelectorTypeFromString on String {
  FragmentSelectorType toFragmentSelectorType() {
    switch (this) {
      case 'PRODUCER_TIMESTAMP':
        return FragmentSelectorType.producerTimestamp;
      case 'SERVER_TIMESTAMP':
        return FragmentSelectorType.serverTimestamp;
    }
    throw Exception('$this is not known in enum FragmentSelectorType');
  }
}

class GetClipOutput {
  /// The content type of the media in the requested clip.
  final String? contentType;

  /// Traditional MP4 file that contains the media clip from the specified video
  /// stream. The output will contain the first 100 MB or the first 200 fragments
  /// from the specified start timestamp. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/limits.html">Kinesis
  /// Video Streams Limits</a>.
  final Uint8List? payload;

  GetClipOutput({
    this.contentType,
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final payload = this.payload;
    return {
      if (payload != null) 'Payload': base64Encode(payload),
    };
  }
}

class GetDASHStreamingSessionURLOutput {
  /// The URL (containing the session token) that a media player can use to
  /// retrieve the MPEG-DASH manifest.
  final String? dASHStreamingSessionURL;

  GetDASHStreamingSessionURLOutput({
    this.dASHStreamingSessionURL,
  });

  factory GetDASHStreamingSessionURLOutput.fromJson(Map<String, dynamic> json) {
    return GetDASHStreamingSessionURLOutput(
      dASHStreamingSessionURL: json['DASHStreamingSessionURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dASHStreamingSessionURL = this.dASHStreamingSessionURL;
    return {
      if (dASHStreamingSessionURL != null)
        'DASHStreamingSessionURL': dASHStreamingSessionURL,
    };
  }
}

class GetHLSStreamingSessionURLOutput {
  /// The URL (containing the session token) that a media player can use to
  /// retrieve the HLS master playlist.
  final String? hLSStreamingSessionURL;

  GetHLSStreamingSessionURLOutput({
    this.hLSStreamingSessionURL,
  });

  factory GetHLSStreamingSessionURLOutput.fromJson(Map<String, dynamic> json) {
    return GetHLSStreamingSessionURLOutput(
      hLSStreamingSessionURL: json['HLSStreamingSessionURL'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hLSStreamingSessionURL = this.hLSStreamingSessionURL;
    return {
      if (hLSStreamingSessionURL != null)
        'HLSStreamingSessionURL': hLSStreamingSessionURL,
    };
  }
}

class GetImagesOutput {
  /// The list of images generated from the video stream. If there is no media
  /// available for the given timestamp, the <code>NO_MEDIA</code> error will be
  /// listed in the output. If an error occurs while the image is being generated,
  /// the <code>MEDIA_ERROR</code> will be listed in the output as the cause of
  /// the missing image.
  final List<Image>? images;

  /// The encrypted token that was used in the request to get more images.
  final String? nextToken;

  GetImagesOutput({
    this.images,
    this.nextToken,
  });

  factory GetImagesOutput.fromJson(Map<String, dynamic> json) {
    return GetImagesOutput(
      images: (json['Images'] as List?)
          ?.whereNotNull()
          .map((e) => Image.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final images = this.images;
    final nextToken = this.nextToken;
    return {
      if (images != null) 'Images': images,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetMediaForFragmentListOutput {
  /// The content type of the requested media.
  final String? contentType;

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
  /// AWS_KINESISVIDEO_EXCEPTION_ERROR_CODE - The integer code of the
  /// </li>
  /// <li>
  /// AWS_KINESISVIDEO_EXCEPTION_MESSAGE - A text description of the exception
  /// </li>
  /// </ul>
  final Uint8List? payload;

  GetMediaForFragmentListOutput({
    this.contentType,
    this.payload,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final payload = this.payload;
    return {
      if (payload != null) 'Payload': base64Encode(payload),
    };
  }
}

enum HLSDiscontinuityMode {
  always,
  never,
  onDiscontinuity,
}

extension HLSDiscontinuityModeValueExtension on HLSDiscontinuityMode {
  String toValue() {
    switch (this) {
      case HLSDiscontinuityMode.always:
        return 'ALWAYS';
      case HLSDiscontinuityMode.never:
        return 'NEVER';
      case HLSDiscontinuityMode.onDiscontinuity:
        return 'ON_DISCONTINUITY';
    }
  }
}

extension HLSDiscontinuityModeFromString on String {
  HLSDiscontinuityMode toHLSDiscontinuityMode() {
    switch (this) {
      case 'ALWAYS':
        return HLSDiscontinuityMode.always;
      case 'NEVER':
        return HLSDiscontinuityMode.never;
      case 'ON_DISCONTINUITY':
        return HLSDiscontinuityMode.onDiscontinuity;
    }
    throw Exception('$this is not known in enum HLSDiscontinuityMode');
  }
}

enum HLSDisplayFragmentTimestamp {
  always,
  never,
}

extension HLSDisplayFragmentTimestampValueExtension
    on HLSDisplayFragmentTimestamp {
  String toValue() {
    switch (this) {
      case HLSDisplayFragmentTimestamp.always:
        return 'ALWAYS';
      case HLSDisplayFragmentTimestamp.never:
        return 'NEVER';
    }
  }
}

extension HLSDisplayFragmentTimestampFromString on String {
  HLSDisplayFragmentTimestamp toHLSDisplayFragmentTimestamp() {
    switch (this) {
      case 'ALWAYS':
        return HLSDisplayFragmentTimestamp.always;
      case 'NEVER':
        return HLSDisplayFragmentTimestamp.never;
    }
    throw Exception('$this is not known in enum HLSDisplayFragmentTimestamp');
  }
}

/// Contains the range of timestamps for the requested media, and the source of
/// the timestamps.
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
  final HLSFragmentSelectorType? fragmentSelectorType;

  /// The start and end of the timestamp range for the requested media.
  ///
  /// This value should not be present if <code>PlaybackType</code> is
  /// <code>LIVE</code>.
  final HLSTimestampRange? timestampRange;

  HLSFragmentSelector({
    this.fragmentSelectorType,
    this.timestampRange,
  });

  Map<String, dynamic> toJson() {
    final fragmentSelectorType = this.fragmentSelectorType;
    final timestampRange = this.timestampRange;
    return {
      if (fragmentSelectorType != null)
        'FragmentSelectorType': fragmentSelectorType.toValue(),
      if (timestampRange != null) 'TimestampRange': timestampRange,
    };
  }
}

enum HLSFragmentSelectorType {
  producerTimestamp,
  serverTimestamp,
}

extension HLSFragmentSelectorTypeValueExtension on HLSFragmentSelectorType {
  String toValue() {
    switch (this) {
      case HLSFragmentSelectorType.producerTimestamp:
        return 'PRODUCER_TIMESTAMP';
      case HLSFragmentSelectorType.serverTimestamp:
        return 'SERVER_TIMESTAMP';
    }
  }
}

extension HLSFragmentSelectorTypeFromString on String {
  HLSFragmentSelectorType toHLSFragmentSelectorType() {
    switch (this) {
      case 'PRODUCER_TIMESTAMP':
        return HLSFragmentSelectorType.producerTimestamp;
      case 'SERVER_TIMESTAMP':
        return HLSFragmentSelectorType.serverTimestamp;
    }
    throw Exception('$this is not known in enum HLSFragmentSelectorType');
  }
}

enum HLSPlaybackMode {
  live,
  liveReplay,
  onDemand,
}

extension HLSPlaybackModeValueExtension on HLSPlaybackMode {
  String toValue() {
    switch (this) {
      case HLSPlaybackMode.live:
        return 'LIVE';
      case HLSPlaybackMode.liveReplay:
        return 'LIVE_REPLAY';
      case HLSPlaybackMode.onDemand:
        return 'ON_DEMAND';
    }
  }
}

extension HLSPlaybackModeFromString on String {
  HLSPlaybackMode toHLSPlaybackMode() {
    switch (this) {
      case 'LIVE':
        return HLSPlaybackMode.live;
      case 'LIVE_REPLAY':
        return HLSPlaybackMode.liveReplay;
      case 'ON_DEMAND':
        return HLSPlaybackMode.onDemand;
    }
    throw Exception('$this is not known in enum HLSPlaybackMode');
  }
}

/// The start and end of the timestamp range for the requested media.
///
/// This value should not be present if <code>PlaybackType</code> is
/// <code>LIVE</code>.
class HLSTimestampRange {
  /// The end of the timestamp range for the requested media. This value must be
  /// within 24 hours of the specified <code>StartTimestamp</code>, and it must be
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
  final DateTime? endTimestamp;

  /// The start of the timestamp range for the requested media.
  ///
  /// If the <code>HLSTimestampRange</code> value is specified, the
  /// <code>StartTimestamp</code> value is required.
  ///
  /// Only fragments that start exactly at or after <code>StartTimestamp</code>
  /// are included in the session. Fragments that start before
  /// <code>StartTimestamp</code> and continue past it aren't included in the
  /// session. If <code>FragmentSelectorType</code> is
  /// <code>SERVER_TIMESTAMP</code>, the <code>StartTimestamp</code> must be later
  /// than the stream head.
  final DateTime? startTimestamp;

  HLSTimestampRange({
    this.endTimestamp,
    this.startTimestamp,
  });

  Map<String, dynamic> toJson() {
    final endTimestamp = this.endTimestamp;
    final startTimestamp = this.startTimestamp;
    return {
      if (endTimestamp != null)
        'EndTimestamp': unixTimestampToJson(endTimestamp),
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

/// A structure that contains the <code>Timestamp</code>, <code>Error</code>,
/// and <code>ImageContent</code>.
class Image {
  /// The error message shown when the image for the provided timestamp was not
  /// extracted due to a non-tryable error. An error will be returned if:
  ///
  /// <ul>
  /// <li>
  /// There is no media that exists for the specified <code>Timestamp</code>.
  /// </li>
  /// </ul>
  /// <ul>
  /// <li>
  /// The media for the specified time does not allow an image to be extracted. In
  /// this case the media is audio only, or the incorrect media has been ingested.
  /// </li>
  /// </ul>
  final ImageError? error;

  /// An attribute of the <code>Image</code> object that is Base64 encoded.
  final String? imageContent;

  /// An attribute of the <code>Image</code> object that is used to extract an
  /// image from the video stream. This field is used to manage gaps on images or
  /// to better understand the pagination window.
  final DateTime? timeStamp;

  Image({
    this.error,
    this.imageContent,
    this.timeStamp,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      error: (json['Error'] as String?)?.toImageError(),
      imageContent: json['ImageContent'] as String?,
      timeStamp: timeStampFromJson(json['TimeStamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final imageContent = this.imageContent;
    final timeStamp = this.timeStamp;
    return {
      if (error != null) 'Error': error.toValue(),
      if (imageContent != null) 'ImageContent': imageContent,
      if (timeStamp != null) 'TimeStamp': unixTimestampToJson(timeStamp),
    };
  }
}

enum ImageError {
  noMedia,
  mediaError,
}

extension ImageErrorValueExtension on ImageError {
  String toValue() {
    switch (this) {
      case ImageError.noMedia:
        return 'NO_MEDIA';
      case ImageError.mediaError:
        return 'MEDIA_ERROR';
    }
  }
}

extension ImageErrorFromString on String {
  ImageError toImageError() {
    switch (this) {
      case 'NO_MEDIA':
        return ImageError.noMedia;
      case 'MEDIA_ERROR':
        return ImageError.mediaError;
    }
    throw Exception('$this is not known in enum ImageError');
  }
}

enum ImageSelectorType {
  producerTimestamp,
  serverTimestamp,
}

extension ImageSelectorTypeValueExtension on ImageSelectorType {
  String toValue() {
    switch (this) {
      case ImageSelectorType.producerTimestamp:
        return 'PRODUCER_TIMESTAMP';
      case ImageSelectorType.serverTimestamp:
        return 'SERVER_TIMESTAMP';
    }
  }
}

extension ImageSelectorTypeFromString on String {
  ImageSelectorType toImageSelectorType() {
    switch (this) {
      case 'PRODUCER_TIMESTAMP':
        return ImageSelectorType.producerTimestamp;
      case 'SERVER_TIMESTAMP':
        return ImageSelectorType.serverTimestamp;
    }
    throw Exception('$this is not known in enum ImageSelectorType');
  }
}

class ListFragmentsOutput {
  /// A list of archived <a>Fragment</a> objects from the stream that meet the
  /// selector criteria. Results are in no specific order, even across pages.
  final List<Fragment>? fragments;

  /// If the returned list is truncated, the operation returns this token to use
  /// to retrieve the next page of results. This value is <code>null</code> when
  /// there are no more results to return.
  final String? nextToken;

  ListFragmentsOutput({
    this.fragments,
    this.nextToken,
  });

  factory ListFragmentsOutput.fromJson(Map<String, dynamic> json) {
    return ListFragmentsOutput(
      fragments: (json['Fragments'] as List?)
          ?.whereNotNull()
          .map((e) => Fragment.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fragments = this.fragments;
    final nextToken = this.nextToken;
    return {
      if (fragments != null) 'Fragments': fragments,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// The range of timestamps for which to return fragments.
class TimestampRange {
  /// The ending timestamp in the range of timestamps for which to return
  /// fragments.
  final DateTime endTimestamp;

  /// The starting timestamp in the range of timestamps for which to return
  /// fragments.
  final DateTime startTimestamp;

  TimestampRange({
    required this.endTimestamp,
    required this.startTimestamp,
  });

  Map<String, dynamic> toJson() {
    final endTimestamp = this.endTimestamp;
    final startTimestamp = this.startTimestamp;
    return {
      'EndTimestamp': unixTimestampToJson(endTimestamp),
      'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

class ClientLimitExceededException extends _s.GenericAwsException {
  ClientLimitExceededException({String? type, String? message})
      : super(
            type: type, code: 'ClientLimitExceededException', message: message);
}

class InvalidArgumentException extends _s.GenericAwsException {
  InvalidArgumentException({String? type, String? message})
      : super(type: type, code: 'InvalidArgumentException', message: message);
}

class InvalidCodecPrivateDataException extends _s.GenericAwsException {
  InvalidCodecPrivateDataException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidCodecPrivateDataException',
            message: message);
}

class InvalidMediaFrameException extends _s.GenericAwsException {
  InvalidMediaFrameException({String? type, String? message})
      : super(type: type, code: 'InvalidMediaFrameException', message: message);
}

class MissingCodecPrivateDataException extends _s.GenericAwsException {
  MissingCodecPrivateDataException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingCodecPrivateDataException',
            message: message);
}

class NoDataRetentionException extends _s.GenericAwsException {
  NoDataRetentionException({String? type, String? message})
      : super(type: type, code: 'NoDataRetentionException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String? type, String? message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class UnsupportedStreamMediaTypeException extends _s.GenericAwsException {
  UnsupportedStreamMediaTypeException({String? type, String? message})
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
