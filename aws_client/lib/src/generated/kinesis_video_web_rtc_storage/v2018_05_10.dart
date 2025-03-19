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

class KinesisVideoWebRtcStorage {
  final _s.RestJsonProtocol _protocol;
  KinesisVideoWebRtcStorage({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'kinesisvideo',
            signingName: 'kinesisvideo',
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

  /// <note>
  /// Before using this API, you must call the
  /// <code>GetSignalingChannelEndpoint</code> API to request the WEBRTC
  /// endpoint. You then specify the endpoint and region in your
  /// <code>JoinStorageSession</code> API request.
  /// </note>
  /// Join the ongoing one way-video and/or multi-way audio WebRTC session as a
  /// video producing device for an input channel. If there’s no existing
  /// session for the channel, a new streaming session needs to be created, and
  /// the Amazon Resource Name (ARN) of the signaling channel must be provided.
  ///
  /// Currently for the <code>SINGLE_MASTER</code> type, a video producing
  /// device is able to ingest both audio and video media into a stream. Only
  /// video producing devices can join the session and record media.
  /// <important>
  /// Both audio and video tracks are currently required for WebRTC ingestion.
  ///
  /// Current requirements:
  ///
  /// <ul>
  /// <li>
  /// Video track: H.264
  /// </li>
  /// <li>
  /// Audio track: Opus
  /// </li>
  /// </ul> </important>
  /// The resulting ingested video in the Kinesis video stream will have the
  /// following parameters: H.264 video and AAC audio.
  ///
  /// Once a master participant has negotiated a connection through WebRTC, the
  /// ingested media session will be stored in the Kinesis video stream.
  /// Multiple viewers are then able to play back real-time media through our
  /// Playback APIs.
  ///
  /// You can also use existing Kinesis Video Streams features like
  /// <code>HLS</code> or <code>DASH</code> playback, image generation via <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/gs-getImages.html">GetImages</a>,
  /// and more with ingested WebRTC media.
  /// <note>
  /// S3 image delivery and notifications are not currently supported.
  /// </note> <note>
  /// Assume that only one video producing device client can be associated with
  /// a session for the channel. If more than one client joins the session of a
  /// specific channel as a video producing device, the most recent client
  /// request takes precedence.
  /// </note>
  /// <b>Additional information</b>
  ///
  /// <ul>
  /// <li>
  /// <b>Idempotent</b> - This API is not idempotent.
  /// </li>
  /// <li>
  /// <b>Retry behavior</b> - This is counted as a new API call.
  /// </li>
  /// <li>
  /// <b>Concurrent calls</b> - Concurrent calls are allowed. An offer is sent
  /// once per each call.
  /// </li>
  /// </ul>
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelArn] :
  /// The Amazon Resource Name (ARN) of the signaling channel.
  Future<void> joinStorageSession({
    required String channelArn,
  }) async {
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/joinStorageSession',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Join the ongoing one way-video and/or multi-way audio WebRTC session as a
  /// viewer for an input channel. If there’s no existing session for the
  /// channel, create a new streaming session and provide the Amazon Resource
  /// Name (ARN) of the signaling channel (<code>channelArn</code>) and client
  /// id (<code>clientId</code>).
  ///
  /// Currently for <code>SINGLE_MASTER</code> type, a video producing device is
  /// able to ingest both audio and video media into a stream, while viewers can
  /// only ingest audio. Both a video producing device and viewers can join a
  /// session first and wait for other participants. While participants are
  /// having peer to peer conversations through WebRTC, the ingested media
  /// session will be stored into the Kinesis Video Stream. Multiple viewers are
  /// able to playback real-time media.
  ///
  /// Customers can also use existing Kinesis Video Streams features like
  /// <code>HLS</code> or <code>DASH</code> playback, Image generation, and more
  /// with ingested WebRTC media. If there’s an existing session with the same
  /// <code>clientId</code> that's found in the join session request, the new
  /// request takes precedence.
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [InvalidArgumentException].
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelArn] :
  /// The Amazon Resource Name (ARN) of the signaling channel.
  ///
  /// Parameter [clientId] :
  /// The unique identifier for the sender client.
  Future<void> joinStorageSessionAsViewer({
    required String channelArn,
    required String clientId,
  }) async {
    final $payload = <String, dynamic>{
      'channelArn': channelArn,
      'clientId': clientId,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/joinStorageSessionAsViewer',
      exceptionFnMap: _exceptionFns,
    );
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ClientLimitExceededException': (type, message) =>
      ClientLimitExceededException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
