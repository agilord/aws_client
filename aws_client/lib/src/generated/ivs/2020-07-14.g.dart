// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-07-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchError _$BatchErrorFromJson(Map<String, dynamic> json) {
  return BatchError(
    arn: json['arn'] as String,
    code: json['code'] as String,
    message: json['message'] as String,
  );
}

BatchGetChannelResponse _$BatchGetChannelResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetChannelResponse(
    channels: (json['channels'] as List)
        ?.map((e) =>
            e == null ? null : Channel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    errors: (json['errors'] as List)
        ?.map((e) =>
            e == null ? null : BatchError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

BatchGetStreamKeyResponse _$BatchGetStreamKeyResponseFromJson(
    Map<String, dynamic> json) {
  return BatchGetStreamKeyResponse(
    errors: (json['errors'] as List)
        ?.map((e) =>
            e == null ? null : BatchError.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    streamKeys: (json['streamKeys'] as List)
        ?.map((e) =>
            e == null ? null : StreamKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Channel _$ChannelFromJson(Map<String, dynamic> json) {
  return Channel(
    arn: json['arn'] as String,
    authorized: json['authorized'] as bool,
    ingestEndpoint: json['ingestEndpoint'] as String,
    latencyMode:
        _$enumDecodeNullable(_$ChannelLatencyModeEnumMap, json['latencyMode']),
    name: json['name'] as String,
    playbackUrl: json['playbackUrl'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    type: _$enumDecodeNullable(_$ChannelTypeEnumMap, json['type']),
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

const _$ChannelLatencyModeEnumMap = {
  ChannelLatencyMode.normal: 'NORMAL',
  ChannelLatencyMode.low: 'LOW',
};

const _$ChannelTypeEnumMap = {
  ChannelType.basic: 'BASIC',
  ChannelType.standard: 'STANDARD',
};

ChannelSummary _$ChannelSummaryFromJson(Map<String, dynamic> json) {
  return ChannelSummary(
    arn: json['arn'] as String,
    authorized: json['authorized'] as bool,
    latencyMode:
        _$enumDecodeNullable(_$ChannelLatencyModeEnumMap, json['latencyMode']),
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

CreateChannelResponse _$CreateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return CreateChannelResponse(
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    streamKey: json['streamKey'] == null
        ? null
        : StreamKey.fromJson(json['streamKey'] as Map<String, dynamic>),
  );
}

CreateStreamKeyResponse _$CreateStreamKeyResponseFromJson(
    Map<String, dynamic> json) {
  return CreateStreamKeyResponse(
    streamKey: json['streamKey'] == null
        ? null
        : StreamKey.fromJson(json['streamKey'] as Map<String, dynamic>),
  );
}

DeletePlaybackKeyPairResponse _$DeletePlaybackKeyPairResponseFromJson(
    Map<String, dynamic> json) {
  return DeletePlaybackKeyPairResponse();
}

GetChannelResponse _$GetChannelResponseFromJson(Map<String, dynamic> json) {
  return GetChannelResponse(
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
  );
}

GetPlaybackKeyPairResponse _$GetPlaybackKeyPairResponseFromJson(
    Map<String, dynamic> json) {
  return GetPlaybackKeyPairResponse(
    keyPair: json['keyPair'] == null
        ? null
        : PlaybackKeyPair.fromJson(json['keyPair'] as Map<String, dynamic>),
  );
}

GetStreamKeyResponse _$GetStreamKeyResponseFromJson(Map<String, dynamic> json) {
  return GetStreamKeyResponse(
    streamKey: json['streamKey'] == null
        ? null
        : StreamKey.fromJson(json['streamKey'] as Map<String, dynamic>),
  );
}

GetStreamResponse _$GetStreamResponseFromJson(Map<String, dynamic> json) {
  return GetStreamResponse(
    stream: json['stream'] == null
        ? null
        : Stream.fromJson(json['stream'] as Map<String, dynamic>),
  );
}

ImportPlaybackKeyPairResponse _$ImportPlaybackKeyPairResponseFromJson(
    Map<String, dynamic> json) {
  return ImportPlaybackKeyPairResponse(
    keyPair: json['keyPair'] == null
        ? null
        : PlaybackKeyPair.fromJson(json['keyPair'] as Map<String, dynamic>),
  );
}

ListChannelsResponse _$ListChannelsResponseFromJson(Map<String, dynamic> json) {
  return ListChannelsResponse(
    channels: (json['channels'] as List)
        ?.map((e) => e == null
            ? null
            : ChannelSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListPlaybackKeyPairsResponse _$ListPlaybackKeyPairsResponseFromJson(
    Map<String, dynamic> json) {
  return ListPlaybackKeyPairsResponse(
    keyPairs: (json['keyPairs'] as List)
        ?.map((e) => e == null
            ? null
            : PlaybackKeyPairSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListStreamKeysResponse _$ListStreamKeysResponseFromJson(
    Map<String, dynamic> json) {
  return ListStreamKeysResponse(
    streamKeys: (json['streamKeys'] as List)
        ?.map((e) => e == null
            ? null
            : StreamKeySummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListStreamsResponse _$ListStreamsResponseFromJson(Map<String, dynamic> json) {
  return ListStreamsResponse(
    streams: (json['streams'] as List)
        ?.map((e) => e == null
            ? null
            : StreamSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    nextToken: json['nextToken'] as String,
  );
}

PlaybackKeyPair _$PlaybackKeyPairFromJson(Map<String, dynamic> json) {
  return PlaybackKeyPair(
    arn: json['arn'] as String,
    fingerprint: json['fingerprint'] as String,
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

PlaybackKeyPairSummary _$PlaybackKeyPairSummaryFromJson(
    Map<String, dynamic> json) {
  return PlaybackKeyPairSummary(
    arn: json['arn'] as String,
    name: json['name'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

StopStreamResponse _$StopStreamResponseFromJson(Map<String, dynamic> json) {
  return StopStreamResponse();
}

Stream _$StreamFromJson(Map<String, dynamic> json) {
  return Stream(
    channelArn: json['channelArn'] as String,
    health: _$enumDecodeNullable(_$StreamHealthEnumMap, json['health']),
    playbackUrl: json['playbackUrl'] as String,
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    state: _$enumDecodeNullable(_$StreamStateEnumMap, json['state']),
    viewerCount: json['viewerCount'] as int,
  );
}

const _$StreamHealthEnumMap = {
  StreamHealth.healthy: 'HEALTHY',
  StreamHealth.starving: 'STARVING',
  StreamHealth.unknown: 'UNKNOWN',
};

const _$StreamStateEnumMap = {
  StreamState.live: 'LIVE',
  StreamState.offline: 'OFFLINE',
};

StreamKey _$StreamKeyFromJson(Map<String, dynamic> json) {
  return StreamKey(
    arn: json['arn'] as String,
    channelArn: json['channelArn'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    value: json['value'] as String,
  );
}

StreamKeySummary _$StreamKeySummaryFromJson(Map<String, dynamic> json) {
  return StreamKeySummary(
    arn: json['arn'] as String,
    channelArn: json['channelArn'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

StreamSummary _$StreamSummaryFromJson(Map<String, dynamic> json) {
  return StreamSummary(
    channelArn: json['channelArn'] as String,
    health: _$enumDecodeNullable(_$StreamHealthEnumMap, json['health']),
    startTime: const UnixDateTimeConverter().fromJson(json['startTime']),
    state: _$enumDecodeNullable(_$StreamStateEnumMap, json['state']),
    viewerCount: json['viewerCount'] as int,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateChannelResponse _$UpdateChannelResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateChannelResponse(
    channel: json['channel'] == null
        ? null
        : Channel.fromJson(json['channel'] as Map<String, dynamic>),
  );
}
