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

/// AWS IoT Secure Tunnling enables you to create remote connections to devices
/// deployed in the field.
class IoTSecureTunneling {
  final _s.JsonProtocol _protocol;
  IoTSecureTunneling({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
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
    required String tunnelId,
    bool? delete,
  }) async {
    ArgumentError.checkNotNull(tunnelId, 'tunnelId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'IoTSecuredTunneling.CloseTunnel'
    };
    await _protocol.send(
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
  }

  /// Gets information about a tunnel identified by the unique tunnel id.
  ///
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [tunnelId] :
  /// The tunnel to describe.
  Future<DescribeTunnelResponse> describeTunnel({
    required String tunnelId,
  }) async {
    ArgumentError.checkNotNull(tunnelId, 'tunnelId');
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
    required String resourceArn,
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
    int? maxResults,
    String? nextToken,
    String? thingName,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'thingName',
      thingName,
      1,
      128,
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
    String? description,
    DestinationConfig? destinationConfig,
    List<Tag>? tags,
    TimeoutConfig? timeoutConfig,
  }) async {
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
    required String resourceArn,
    required List<Tag> tags,
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
    await _protocol.send(
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
    required String resourceArn,
    required List<String> tagKeys,
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
    await _protocol.send(
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
  }
}

class CloseTunnelResponse {
  CloseTunnelResponse();

  factory CloseTunnelResponse.fromJson(Map<String, dynamic> _) {
    return CloseTunnelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The state of a connection.
class ConnectionState {
  /// The last time the connection status was updated.
  final DateTime? lastUpdatedAt;

  /// The connection status of the tunnel. Valid values are <code>CONNECTED</code>
  /// and <code>DISCONNECTED</code>.
  final ConnectionStatus? status;

  ConnectionState({
    this.lastUpdatedAt,
    this.status,
  });

  factory ConnectionState.fromJson(Map<String, dynamic> json) {
    return ConnectionState(
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      status: (json['status'] as String?)?.toConnectionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    return {
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ConnectionStatus {
  connected,
  disconnected,
}

extension on ConnectionStatus {
  String toValue() {
    switch (this) {
      case ConnectionStatus.connected:
        return 'CONNECTED';
      case ConnectionStatus.disconnected:
        return 'DISCONNECTED';
    }
  }
}

extension on String {
  ConnectionStatus toConnectionStatus() {
    switch (this) {
      case 'CONNECTED':
        return ConnectionStatus.connected;
      case 'DISCONNECTED':
        return ConnectionStatus.disconnected;
    }
    throw Exception('$this is not known in enum ConnectionStatus');
  }
}

class DescribeTunnelResponse {
  /// The tunnel being described.
  final Tunnel? tunnel;

  DescribeTunnelResponse({
    this.tunnel,
  });

  factory DescribeTunnelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeTunnelResponse(
      tunnel: json['tunnel'] != null
          ? Tunnel.fromJson(json['tunnel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final tunnel = this.tunnel;
    return {
      if (tunnel != null) 'tunnel': tunnel,
    };
  }
}

/// The destination configuration.
class DestinationConfig {
  /// A list of service names that identity the target application. The AWS IoT
  /// client running on the destination device reads this value and uses it to
  /// look up a port or an IP address and a port. The AWS IoT client instantiates
  /// the local proxy which uses this information to connect to the destination
  /// application.
  final List<String> services;

  /// The name of the IoT thing to which you want to connect.
  final String? thingName;

  DestinationConfig({
    required this.services,
    this.thingName,
  });

  factory DestinationConfig.fromJson(Map<String, dynamic> json) {
    return DestinationConfig(
      services: (json['services'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      thingName: json['thingName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final services = this.services;
    final thingName = this.thingName;
    return {
      'services': services,
      if (thingName != null) 'thingName': thingName,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags for the specified resource.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

class ListTunnelsResponse {
  /// A token to used to retrieve the next set of results.
  final String? nextToken;

  /// A short description of the tunnels in an AWS account.
  final List<TunnelSummary>? tunnelSummaries;

  ListTunnelsResponse({
    this.nextToken,
    this.tunnelSummaries,
  });

  factory ListTunnelsResponse.fromJson(Map<String, dynamic> json) {
    return ListTunnelsResponse(
      nextToken: json['nextToken'] as String?,
      tunnelSummaries: (json['tunnelSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => TunnelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tunnelSummaries = this.tunnelSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (tunnelSummaries != null) 'tunnelSummaries': tunnelSummaries,
    };
  }
}

class OpenTunnelResponse {
  /// The access token the destination local proxy uses to connect to AWS IoT
  /// Secure Tunneling.
  final String? destinationAccessToken;

  /// The access token the source local proxy uses to connect to AWS IoT Secure
  /// Tunneling.
  final String? sourceAccessToken;

  /// The Amazon Resource Name for the tunnel. The tunnel ARN format is
  /// <code>arn:aws:tunnel:&lt;region&gt;:&lt;account-id&gt;:tunnel/&lt;tunnel-id&gt;</code>
  final String? tunnelArn;

  /// A unique alpha-numeric tunnel ID.
  final String? tunnelId;

  OpenTunnelResponse({
    this.destinationAccessToken,
    this.sourceAccessToken,
    this.tunnelArn,
    this.tunnelId,
  });

  factory OpenTunnelResponse.fromJson(Map<String, dynamic> json) {
    return OpenTunnelResponse(
      destinationAccessToken: json['destinationAccessToken'] as String?,
      sourceAccessToken: json['sourceAccessToken'] as String?,
      tunnelArn: json['tunnelArn'] as String?,
      tunnelId: json['tunnelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationAccessToken = this.destinationAccessToken;
    final sourceAccessToken = this.sourceAccessToken;
    final tunnelArn = this.tunnelArn;
    final tunnelId = this.tunnelId;
    return {
      if (destinationAccessToken != null)
        'destinationAccessToken': destinationAccessToken,
      if (sourceAccessToken != null) 'sourceAccessToken': sourceAccessToken,
      if (tunnelArn != null) 'tunnelArn': tunnelArn,
      if (tunnelId != null) 'tunnelId': tunnelId,
    };
  }
}

/// An arbitary key/value pair used to add searchable metadata to secure tunnel
/// resources.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String,
      value: json['value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'key': key,
      'value': value,
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

/// Tunnel timeout configuration.
class TimeoutConfig {
  /// The maximum amount of time (in minutes) a tunnel can remain open. If not
  /// specified, maxLifetimeTimeoutMinutes defaults to 720 minutes. Valid values
  /// are from 1 minute to 12 hours (720 minutes)
  final int? maxLifetimeTimeoutMinutes;

  TimeoutConfig({
    this.maxLifetimeTimeoutMinutes,
  });

  factory TimeoutConfig.fromJson(Map<String, dynamic> json) {
    return TimeoutConfig(
      maxLifetimeTimeoutMinutes: json['maxLifetimeTimeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxLifetimeTimeoutMinutes = this.maxLifetimeTimeoutMinutes;
    return {
      if (maxLifetimeTimeoutMinutes != null)
        'maxLifetimeTimeoutMinutes': maxLifetimeTimeoutMinutes,
    };
  }
}

/// A connection between a source computer and a destination device.
class Tunnel {
  /// The time when the tunnel was created.
  final DateTime? createdAt;

  /// A description of the tunnel.
  final String? description;

  /// The destination configuration that specifies the thing name of the
  /// destination device and a service name that the local proxy uses to connect
  /// to the destination application.
  final DestinationConfig? destinationConfig;

  /// The connection state of the destination application.
  final ConnectionState? destinationConnectionState;

  /// The last time the tunnel was updated.
  final DateTime? lastUpdatedAt;

  /// The connection state of the source application.
  final ConnectionState? sourceConnectionState;

  /// The status of a tunnel. Valid values are: Open and Closed.
  final TunnelStatus? status;

  /// A list of tag metadata associated with the secure tunnel.
  final List<Tag>? tags;

  /// Timeout configuration for the tunnel.
  final TimeoutConfig? timeoutConfig;

  /// The Amazon Resource Name (ARN) of a tunnel. The tunnel ARN format is
  /// <code>arn:aws:tunnel:&lt;region&gt;:&lt;account-id&gt;:tunnel/&lt;tunnel-id&gt;</code>
  final String? tunnelArn;

  /// A unique alpha-numeric ID that identifies a tunnel.
  final String? tunnelId;

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

  factory Tunnel.fromJson(Map<String, dynamic> json) {
    return Tunnel(
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      destinationConfig: json['destinationConfig'] != null
          ? DestinationConfig.fromJson(
              json['destinationConfig'] as Map<String, dynamic>)
          : null,
      destinationConnectionState: json['destinationConnectionState'] != null
          ? ConnectionState.fromJson(
              json['destinationConnectionState'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      sourceConnectionState: json['sourceConnectionState'] != null
          ? ConnectionState.fromJson(
              json['sourceConnectionState'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toTunnelStatus(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      timeoutConfig: json['timeoutConfig'] != null
          ? TimeoutConfig.fromJson(
              json['timeoutConfig'] as Map<String, dynamic>)
          : null,
      tunnelArn: json['tunnelArn'] as String?,
      tunnelId: json['tunnelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final destinationConfig = this.destinationConfig;
    final destinationConnectionState = this.destinationConnectionState;
    final lastUpdatedAt = this.lastUpdatedAt;
    final sourceConnectionState = this.sourceConnectionState;
    final status = this.status;
    final tags = this.tags;
    final timeoutConfig = this.timeoutConfig;
    final tunnelArn = this.tunnelArn;
    final tunnelId = this.tunnelId;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (destinationConfig != null) 'destinationConfig': destinationConfig,
      if (destinationConnectionState != null)
        'destinationConnectionState': destinationConnectionState,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (sourceConnectionState != null)
        'sourceConnectionState': sourceConnectionState,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (timeoutConfig != null) 'timeoutConfig': timeoutConfig,
      if (tunnelArn != null) 'tunnelArn': tunnelArn,
      if (tunnelId != null) 'tunnelId': tunnelId,
    };
  }
}

enum TunnelStatus {
  open,
  closed,
}

extension on TunnelStatus {
  String toValue() {
    switch (this) {
      case TunnelStatus.open:
        return 'OPEN';
      case TunnelStatus.closed:
        return 'CLOSED';
    }
  }
}

extension on String {
  TunnelStatus toTunnelStatus() {
    switch (this) {
      case 'OPEN':
        return TunnelStatus.open;
      case 'CLOSED':
        return TunnelStatus.closed;
    }
    throw Exception('$this is not known in enum TunnelStatus');
  }
}

/// Information about the tunnel.
class TunnelSummary {
  /// The time the tunnel was created.
  final DateTime? createdAt;

  /// A description of the tunnel.
  final String? description;

  /// The time the tunnel was last updated.
  final DateTime? lastUpdatedAt;

  /// The status of a tunnel. Valid values are: Open and Closed.
  final TunnelStatus? status;

  /// The Amazon Resource Name of the tunnel. The tunnel ARN format is
  /// <code>arn:aws:tunnel:&lt;region&gt;:&lt;account-id&gt;:tunnel/&lt;tunnel-id&gt;</code>
  final String? tunnelArn;

  /// The unique alpha-numeric identifier for the tunnel.
  final String? tunnelId;

  TunnelSummary({
    this.createdAt,
    this.description,
    this.lastUpdatedAt,
    this.status,
    this.tunnelArn,
    this.tunnelId,
  });

  factory TunnelSummary.fromJson(Map<String, dynamic> json) {
    return TunnelSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      description: json['description'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      status: (json['status'] as String?)?.toTunnelStatus(),
      tunnelArn: json['tunnelArn'] as String?,
      tunnelId: json['tunnelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final description = this.description;
    final lastUpdatedAt = this.lastUpdatedAt;
    final status = this.status;
    final tunnelArn = this.tunnelArn;
    final tunnelId = this.tunnelId;
    return {
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (description != null) 'description': description,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (status != null) 'status': status.toValue(),
      if (tunnelArn != null) 'tunnelArn': tunnelArn,
      if (tunnelId != null) 'tunnelId': tunnelId,
    };
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

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
};
