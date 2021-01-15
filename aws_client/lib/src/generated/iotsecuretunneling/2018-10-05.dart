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

part '2018-10-05.g.dart';

/// AWS IoT Secure Tunnling enables you to create remote connections to devices
/// deployed in the field.
class IoTSecureTunneling {
  final _s.JsonProtocol _protocol;
  IoTSecureTunneling({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.tunneling.iot',
            signingName: 'IoTSecuredTunneling',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Closes a tunnel identified by the unique tunnel id. When a
  /// <code>CloseTunnel</code> request is received, we close the WebSocket
  /// connections between the client and proxy server so no data can be
  /// transmitted.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tunnelId] :
  /// The ID of the tunnel to close.
  ///
  /// Parameter [delete] :
  /// When set to true, AWS IoT Secure Tunneling deletes the tunnel data
  /// immediately.
  Future<void> closeTunnel({
    @_s.required String tunnelId,
    bool delete,
  }) async {
    ArgumentError.checkNotNull(tunnelId, 'tunnelId');
    _s.validateStringPattern(
      'tunnelId',
      tunnelId,
      r'''[a-zA-Z0-9_\-+=:]{1,128}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IoTSecuredTunneling.CloseTunnel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'tunnelId': tunnelId,
        if (delete != null) 'delete': delete,
      },
    );

    return CloseTunnelResponse.fromJson(jsonResponse.body);
  }

  /// Gets information about a tunnel identified by the unique tunnel id.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tunnelId] :
  /// The tunnel to describe.
  Future<DescribeTunnelResponse> describeTunnel({
    @_s.required String tunnelId,
  }) async {
    ArgumentError.checkNotNull(tunnelId, 'tunnelId');
    _s.validateStringPattern(
      'tunnelId',
      tunnelId,
      r'''[a-zA-Z0-9_\-+=:]{1,128}''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IoTSecuredTunneling.DescribeTunnel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'tunnelId': tunnelId,
      },
    );

    return DescribeTunnelResponse.fromJson(jsonResponse.body);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IoTSecuredTunneling.ListTagsForResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
      },
    );

    return ListTagsForResourceResponse.fromJson(jsonResponse.body);
  }

  /// List all tunnels for an AWS account. Tunnels are listed by creation time
  /// in descending order, newer tunnels will be listed before older tunnels.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return at once.
  ///
  /// Parameter [nextToken] :
  /// A token to retrieve the next set of results.
  ///
  /// Parameter [thingName] :
  /// The name of the IoT thing associated with the destination device.
  Future<ListTunnelsResponse> listTunnels({
    int maxResults,
    String nextToken,
    String thingName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_=-]{1,4096}''',
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
    );
    _s.validateStringPattern(
      'thingName',
      thingName,
      r'''[a-zA-Z0-9:_-]+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IoTSecuredTunneling.ListTunnels'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (thingName != null) 'thingName': thingName,
      },
    );

    return ListTunnelsResponse.fromJson(jsonResponse.body);
  }

  /// Creates a new tunnel, and returns two client access tokens for clients to
  /// use to connect to the AWS IoT Secure Tunneling proxy server.
  ///
  /// May throw [LimitExceededException].
  ///
  /// Parameter [description] :
  /// A short text description of the tunnel.
  ///
  /// Parameter [destinationConfig] :
  /// The destination configuration for the OpenTunnel request.
  ///
  /// Parameter [tags] :
  /// A collection of tag metadata.
  ///
  /// Parameter [timeoutConfig] :
  /// Timeout configuration for a tunnel.
  Future<OpenTunnelResponse> openTunnel({
    String description,
    DestinationConfig destinationConfig,
    List<Tag> tags,
    TimeoutConfig timeoutConfig,
  }) async {
    _s.validateStringPattern(
      'description',
      description,
      r'''[^\p{C}]{1,2048}''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IoTSecuredTunneling.OpenTunnel'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (description != null) 'description': description,
        if (destinationConfig != null) 'destinationConfig': destinationConfig,
        if (tags != null) 'tags': tags,
        if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
      },
    );

    return OpenTunnelResponse.fromJson(jsonResponse.body);
  }

  /// A resource tag.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tags] :
  /// The tags for the resource.
  Future<void> tagResource({
    @_s.required String resourceArn,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IoTSecuredTunneling.TagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tags': tags,
      },
    );

    return TagResourceResponse.fromJson(jsonResponse.body);
  }

  /// Removes a tag from a resource.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove.
  Future<void> untagResource({
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IoTSecuredTunneling.UntagResource'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'resourceArn': resourceArn,
        'tagKeys': tagKeys,
      },
    );

    return UntagResourceResponse.fromJson(jsonResponse.body);
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CloseTunnelResponse {
  CloseTunnelResponse();
  factory CloseTunnelResponse.fromJson(Map<String, dynamic> json) =>
      _$CloseTunnelResponseFromJson(json);
}

/// The state of a connection.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConnectionState {
  /// The last time the connection status was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The connection status of the tunnel. Valid values are <code>CONNECTED</code>
  /// and <code>DISCONNECTED</code>.
  @_s.JsonKey(name: 'status')
  final ConnectionStatus status;

  ConnectionState({
    this.lastUpdatedAt,
    this.status,
  });
  factory ConnectionState.fromJson(Map<String, dynamic> json) =>
      _$ConnectionStateFromJson(json);
}

enum ConnectionStatus {
  @_s.JsonValue('CONNECTED')
  connected,
  @_s.JsonValue('DISCONNECTED')
  disconnected,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeTunnelResponse {
  /// The tunnel being described.
  @_s.JsonKey(name: 'tunnel')
  final Tunnel tunnel;

  DescribeTunnelResponse({
    this.tunnel,
  });
  factory DescribeTunnelResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeTunnelResponseFromJson(json);
}

/// The destination configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DestinationConfig {
  /// A list of service names that identity the target application. The AWS IoT
  /// client running on the destination device reads this value and uses it to
  /// look up a port or an IP address and a port. The AWS IoT client instantiates
  /// the local proxy which uses this information to connect to the destination
  /// application.
  @_s.JsonKey(name: 'services')
  final List<String> services;

  /// The name of the IoT thing to which you want to connect.
  @_s.JsonKey(name: 'thingName')
  final String thingName;

  DestinationConfig({
    @_s.required this.services,
    this.thingName,
  });
  factory DestinationConfig.fromJson(Map<String, dynamic> json) =>
      _$DestinationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DestinationConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The tags for the specified resource.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTunnelsResponse {
  /// A token to used to retrieve the next set of results.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A short description of the tunnels in an AWS account.
  @_s.JsonKey(name: 'tunnelSummaries')
  final List<TunnelSummary> tunnelSummaries;

  ListTunnelsResponse({
    this.nextToken,
    this.tunnelSummaries,
  });
  factory ListTunnelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTunnelsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OpenTunnelResponse {
  /// The access token the destination local proxy uses to connect to AWS IoT
  /// Secure Tunneling.
  @_s.JsonKey(name: 'destinationAccessToken')
  final String destinationAccessToken;

  /// The access token the source local proxy uses to connect to AWS IoT Secure
  /// Tunneling.
  @_s.JsonKey(name: 'sourceAccessToken')
  final String sourceAccessToken;

  /// The Amazon Resource Name for the tunnel. The tunnel ARN format is
  /// <code>arn:aws:tunnel:&lt;region&gt;:&lt;account-id&gt;:tunnel/&lt;tunnel-id&gt;</code>
  @_s.JsonKey(name: 'tunnelArn')
  final String tunnelArn;

  /// A unique alpha-numeric tunnel ID.
  @_s.JsonKey(name: 'tunnelId')
  final String tunnelId;

  OpenTunnelResponse({
    this.destinationAccessToken,
    this.sourceAccessToken,
    this.tunnelArn,
    this.tunnelId,
  });
  factory OpenTunnelResponse.fromJson(Map<String, dynamic> json) =>
      _$OpenTunnelResponseFromJson(json);
}

/// An arbitary key/value pair used to add searchable metadata to secure tunnel
/// resources.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

/// Tunnel timeout configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TimeoutConfig {
  /// The maximum amount of time (in minutes) a tunnel can remain open. If not
  /// specified, maxLifetimeTimeoutMinutes defaults to 720 minutes. Valid values
  /// are from 1 minute to 12 hours (720 minutes)
  @_s.JsonKey(name: 'maxLifetimeTimeoutMinutes')
  final int maxLifetimeTimeoutMinutes;

  TimeoutConfig({
    this.maxLifetimeTimeoutMinutes,
  });
  factory TimeoutConfig.fromJson(Map<String, dynamic> json) =>
      _$TimeoutConfigFromJson(json);

  Map<String, dynamic> toJson() => _$TimeoutConfigToJson(this);
}

/// A connection between a source computer and a destination device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Tunnel {
  /// The time when the tunnel was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A description of the tunnel.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The destination configuration that specifies the thing name of the
  /// destination device and a service name that the local proxy uses to connect
  /// to the destination application.
  @_s.JsonKey(name: 'destinationConfig')
  final DestinationConfig destinationConfig;

  /// The connection state of the destination application.
  @_s.JsonKey(name: 'destinationConnectionState')
  final ConnectionState destinationConnectionState;

  /// The last time the tunnel was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The connection state of the source application.
  @_s.JsonKey(name: 'sourceConnectionState')
  final ConnectionState sourceConnectionState;

  /// The status of a tunnel. Valid values are: Open and Closed.
  @_s.JsonKey(name: 'status')
  final TunnelStatus status;

  /// A list of tag metadata associated with the secure tunnel.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  /// Timeout configuration for the tunnel.
  @_s.JsonKey(name: 'timeoutConfig')
  final TimeoutConfig timeoutConfig;

  /// The Amazon Resource Name (ARN) of a tunnel. The tunnel ARN format is
  /// <code>arn:aws:tunnel:&lt;region&gt;:&lt;account-id&gt;:tunnel/&lt;tunnel-id&gt;</code>
  @_s.JsonKey(name: 'tunnelArn')
  final String tunnelArn;

  /// A unique alpha-numeric ID that identifies a tunnel.
  @_s.JsonKey(name: 'tunnelId')
  final String tunnelId;

  Tunnel({
    this.createdAt,
    this.description,
    this.destinationConfig,
    this.destinationConnectionState,
    this.lastUpdatedAt,
    this.sourceConnectionState,
    this.status,
    this.tags,
    this.timeoutConfig,
    this.tunnelArn,
    this.tunnelId,
  });
  factory Tunnel.fromJson(Map<String, dynamic> json) => _$TunnelFromJson(json);
}

enum TunnelStatus {
  @_s.JsonValue('OPEN')
  open,
  @_s.JsonValue('CLOSED')
  closed,
}

/// Information about the tunnel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TunnelSummary {
  /// The time the tunnel was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A description of the tunnel.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The time the tunnel was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The status of a tunnel. Valid values are: Open and Closed.
  @_s.JsonKey(name: 'status')
  final TunnelStatus status;

  /// The Amazon Resource Name of the tunnel. The tunnel ARN format is
  /// <code>arn:aws:tunnel:&lt;region&gt;:&lt;account-id&gt;:tunnel/&lt;tunnel-id&gt;</code>
  @_s.JsonKey(name: 'tunnelArn')
  final String tunnelArn;

  /// The unique alpha-numeric identifier for the tunnel.
  @_s.JsonKey(name: 'tunnelId')
  final String tunnelId;

  TunnelSummary({
    this.createdAt,
    this.description,
    this.lastUpdatedAt,
    this.status,
    this.tunnelArn,
    this.tunnelId,
  });
  factory TunnelSummary.fromJson(Map<String, dynamic> json) =>
      _$TunnelSummaryFromJson(json);
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

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
