// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2018-10-05.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CloseTunnelResponse _$CloseTunnelResponseFromJson(Map<String, dynamic> json) {
  return CloseTunnelResponse();
}

ConnectionState _$ConnectionStateFromJson(Map<String, dynamic> json) {
  return ConnectionState(
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    status: _$enumDecodeNullable(_$ConnectionStatusEnumMap, json['status']),
  );
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.connected: 'CONNECTED',
  ConnectionStatus.disconnected: 'DISCONNECTED',
};

DescribeTunnelResponse _$DescribeTunnelResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeTunnelResponse(
    tunnel: json['tunnel'] == null
        ? null
        : Tunnel.fromJson(json['tunnel'] as Map<String, dynamic>),
  );
}

DestinationConfig _$DestinationConfigFromJson(Map<String, dynamic> json) {
  return DestinationConfig(
    services: (json['services'] as List)?.map((e) => e as String)?.toList(),
    thingName: json['thingName'] as String,
  );
}

Map<String, dynamic> _$DestinationConfigToJson(DestinationConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('services', instance.services);
  writeNotNull('thingName', instance.thingName);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTunnelsResponse _$ListTunnelsResponseFromJson(Map<String, dynamic> json) {
  return ListTunnelsResponse(
    nextToken: json['nextToken'] as String,
    tunnelSummaries: (json['tunnelSummaries'] as List)
        ?.map((e) => e == null
            ? null
            : TunnelSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

OpenTunnelResponse _$OpenTunnelResponseFromJson(Map<String, dynamic> json) {
  return OpenTunnelResponse(
    destinationAccessToken: json['destinationAccessToken'] as String,
    sourceAccessToken: json['sourceAccessToken'] as String,
    tunnelArn: json['tunnelArn'] as String,
    tunnelId: json['tunnelId'] as String,
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['key'] as String,
    value: json['value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('key', instance.key);
  writeNotNull('value', instance.value);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TimeoutConfig _$TimeoutConfigFromJson(Map<String, dynamic> json) {
  return TimeoutConfig(
    maxLifetimeTimeoutMinutes: json['maxLifetimeTimeoutMinutes'] as int,
  );
}

Map<String, dynamic> _$TimeoutConfigToJson(TimeoutConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('maxLifetimeTimeoutMinutes', instance.maxLifetimeTimeoutMinutes);
  return val;
}

Tunnel _$TunnelFromJson(Map<String, dynamic> json) {
  return Tunnel(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    destinationConfig: json['destinationConfig'] == null
        ? null
        : DestinationConfig.fromJson(
            json['destinationConfig'] as Map<String, dynamic>),
    destinationConnectionState: json['destinationConnectionState'] == null
        ? null
        : ConnectionState.fromJson(
            json['destinationConnectionState'] as Map<String, dynamic>),
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    sourceConnectionState: json['sourceConnectionState'] == null
        ? null
        : ConnectionState.fromJson(
            json['sourceConnectionState'] as Map<String, dynamic>),
    status: _$enumDecodeNullable(_$TunnelStatusEnumMap, json['status']),
    tags: (json['tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    timeoutConfig: json['timeoutConfig'] == null
        ? null
        : TimeoutConfig.fromJson(json['timeoutConfig'] as Map<String, dynamic>),
    tunnelArn: json['tunnelArn'] as String,
    tunnelId: json['tunnelId'] as String,
  );
}

const _$TunnelStatusEnumMap = {
  TunnelStatus.open: 'OPEN',
  TunnelStatus.closed: 'CLOSED',
};

TunnelSummary _$TunnelSummaryFromJson(Map<String, dynamic> json) {
  return TunnelSummary(
    createdAt: const UnixDateTimeConverter().fromJson(json['createdAt']),
    description: json['description'] as String,
    lastUpdatedAt:
        const UnixDateTimeConverter().fromJson(json['lastUpdatedAt']),
    status: _$enumDecodeNullable(_$TunnelStatusEnumMap, json['status']),
    tunnelArn: json['tunnelArn'] as String,
    tunnelId: json['tunnelId'] as String,
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
