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

part '2019-12-04.g.dart';

/// Kinesis Video Streams Signaling Service is a intermediate service that
/// establishes a communication channel for discovering peers, transmitting
/// offers and answers in order to establish peer-to-peer connection in webRTC
/// technology.
class KinesisVideoSignalingChannels {
  final _s.RestJsonProtocol _protocol;
  KinesisVideoSignalingChannels({
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

  /// Gets the Interactive Connectivity Establishment (ICE) server configuration
  /// information, including URIs, username, and password which can be used to
  /// configure the WebRTC connection. The ICE component uses this configuration
  /// information to setup the WebRTC connection, including authenticating with
  /// the Traversal Using Relays around NAT (TURN) relay server.
  ///
  /// TURN is a protocol that is used to improve the connectivity of
  /// peer-to-peer applications. By providing a cloud-based relay service, TURN
  /// ensures that a connection can be established even when one or more peers
  /// are incapable of a direct peer-to-peer connection. For more information,
  /// see <a
  /// href="https://tools.ietf.org/html/draft-uberti-rtcweb-turn-rest-00">A REST
  /// API For Access To TURN Services</a>.
  ///
  /// You can invoke this API to establish a fallback mechanism in case either
  /// of the peers is unable to establish a direct peer-to-peer connection over
  /// a signaling channel. You must specify either a signaling channel ARN or
  /// the client ID in order to invoke this API.
  ///
  /// May throw [InvalidClientException].
  /// May throw [SessionExpiredException].
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [channelARN] :
  /// The ARN of the signaling channel to be used for the peer-to-peer
  /// connection between configured peers.
  ///
  /// Parameter [clientId] :
  /// Unique identifier for the viewer. Must be unique within the signaling
  /// channel.
  ///
  /// Parameter [service] :
  /// Specifies the desired service. Currently, <code>TURN</code> is the only
  /// valid value.
  ///
  /// Parameter [username] :
  /// An optional user ID to be associated with the credentials.
  Future<GetIceServerConfigResponse> getIceServerConfig({
    @_s.required String channelARN,
    String clientId,
    Service service,
    String username,
  }) async {
    ArgumentError.checkNotNull(channelARN, 'channelARN');
    _s.validateStringLength(
      'channelARN',
      channelARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelARN',
      channelARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    _s.validateStringLength(
      'clientId',
      clientId,
      1,
      256,
    );
    _s.validateStringPattern(
      'clientId',
      clientId,
      r'''[a-zA-Z0-9_.-]+''',
    );
    _s.validateStringLength(
      'username',
      username,
      1,
      256,
    );
    _s.validateStringPattern(
      'username',
      username,
      r'''[a-zA-Z0-9_.-]+''',
    );
    final $payload = <String, dynamic>{
      'ChannelARN': channelARN,
      if (clientId != null) 'ClientId': clientId,
      if (service != null) 'Service': service.toValue(),
      if (username != null) 'Username': username,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/get-ice-server-config',
      exceptionFnMap: _exceptionFns,
    );
    return GetIceServerConfigResponse.fromJson(response);
  }

  /// This API allows you to connect WebRTC-enabled devices with Alexa display
  /// devices. When invoked, it sends the Alexa Session Description Protocol
  /// (SDP) offer to the master peer. The offer is delivered as soon as the
  /// master is connected to the specified signaling channel. This API returns
  /// the SDP answer from the connected master. If the master is not connected
  /// to the signaling channel, redelivery requests are made until the message
  /// expires.
  ///
  /// May throw [ClientLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidArgumentException].
  /// May throw [NotAuthorizedException].
  ///
  /// Parameter [channelARN] :
  /// The ARN of the signaling channel by which Alexa and the master peer
  /// communicate.
  ///
  /// Parameter [messagePayload] :
  /// The base64-encoded SDP offer content.
  ///
  /// Parameter [senderClientId] :
  /// The unique identifier for the sender client.
  Future<SendAlexaOfferToMasterResponse> sendAlexaOfferToMaster({
    @_s.required String channelARN,
    @_s.required String messagePayload,
    @_s.required String senderClientId,
  }) async {
    ArgumentError.checkNotNull(channelARN, 'channelARN');
    _s.validateStringLength(
      'channelARN',
      channelARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelARN',
      channelARN,
      r'''arn:aws:kinesisvideo:[a-z0-9-]+:[0-9]+:[a-z]+/[a-zA-Z0-9_.-]+/[0-9]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(messagePayload, 'messagePayload');
    _s.validateStringLength(
      'messagePayload',
      messagePayload,
      1,
      10000,
      isRequired: true,
    );
    _s.validateStringPattern(
      'messagePayload',
      messagePayload,
      r'''[a-zA-Z0-9+/=]+''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(senderClientId, 'senderClientId');
    _s.validateStringLength(
      'senderClientId',
      senderClientId,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'senderClientId',
      senderClientId,
      r'''[a-zA-Z0-9_.-]+''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ChannelARN': channelARN,
      'MessagePayload': messagePayload,
      'SenderClientId': senderClientId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/send-alexa-offer-to-master',
      exceptionFnMap: _exceptionFns,
    );
    return SendAlexaOfferToMasterResponse.fromJson(response);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetIceServerConfigResponse {
  /// The list of ICE server information objects.
  @_s.JsonKey(name: 'IceServerList')
  final List<IceServer> iceServerList;

  GetIceServerConfigResponse({
    this.iceServerList,
  });
  factory GetIceServerConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$GetIceServerConfigResponseFromJson(json);
}

/// A structure for the ICE server connection data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class IceServer {
  /// A password to login to the ICE server.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The period of time, in seconds, during which the username and password are
  /// valid.
  @_s.JsonKey(name: 'Ttl')
  final int ttl;

  /// An array of URIs, in the form specified in the <a
  /// href="https://tools.ietf.org/html/draft-petithuguenin-behave-turn-uris-03">I-D.petithuguenin-behave-turn-uris</a>
  /// spec. These URIs provide the different addresses and/or protocols that can
  /// be used to reach the TURN server.
  @_s.JsonKey(name: 'Uris')
  final List<String> uris;

  /// A username to login to the ICE server.
  @_s.JsonKey(name: 'Username')
  final String username;

  IceServer({
    this.password,
    this.ttl,
    this.uris,
    this.username,
  });
  factory IceServer.fromJson(Map<String, dynamic> json) =>
      _$IceServerFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendAlexaOfferToMasterResponse {
  /// The base64-encoded SDP answer content.
  @_s.JsonKey(name: 'Answer')
  final String answer;

  SendAlexaOfferToMasterResponse({
    this.answer,
  });
  factory SendAlexaOfferToMasterResponse.fromJson(Map<String, dynamic> json) =>
      _$SendAlexaOfferToMasterResponseFromJson(json);
}

enum Service {
  @_s.JsonValue('TURN')
  turn,
}

extension on Service {
  String toValue() {
    switch (this) {
      case Service.turn:
        return 'TURN';
    }
    throw Exception('Unknown enum value: $this');
  }
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

class InvalidClientException extends _s.GenericAwsException {
  InvalidClientException({String type, String message})
      : super(type: type, code: 'InvalidClientException', message: message);
}

class NotAuthorizedException extends _s.GenericAwsException {
  NotAuthorizedException({String type, String message})
      : super(type: type, code: 'NotAuthorizedException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class SessionExpiredException extends _s.GenericAwsException {
  SessionExpiredException({String type, String message})
      : super(type: type, code: 'SessionExpiredException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ClientLimitExceededException': (type, message) =>
      ClientLimitExceededException(type: type, message: message),
  'InvalidArgumentException': (type, message) =>
      InvalidArgumentException(type: type, message: message),
  'InvalidClientException': (type, message) =>
      InvalidClientException(type: type, message: message),
  'NotAuthorizedException': (type, message) =>
      NotAuthorizedException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'SessionExpiredException': (type, message) =>
      SessionExpiredException(type: type, message: message),
};
