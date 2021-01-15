// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-09-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChannelInfo _$ChannelInfoFromJson(Map<String, dynamic> json) {
  return ChannelInfo(
    channelARN: json['ChannelARN'] as String,
    channelName: json['ChannelName'] as String,
    channelStatus: _$enumDecodeNullable(_$StatusEnumMap, json['ChannelStatus']),
    channelType:
        _$enumDecodeNullable(_$ChannelTypeEnumMap, json['ChannelType']),
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    singleMasterConfiguration: json['SingleMasterConfiguration'] == null
        ? null
        : SingleMasterConfiguration.fromJson(
            json['SingleMasterConfiguration'] as Map<String, dynamic>),
    version: json['Version'] as String,
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

const _$StatusEnumMap = {
  Status.creating: 'CREATING',
  Status.active: 'ACTIVE',
  Status.updating: 'UPDATING',
  Status.deleting: 'DELETING',
};

const _$ChannelTypeEnumMap = {
  ChannelType.singleMaster: 'SINGLE_MASTER',
};

Map<String, dynamic> _$ChannelNameConditionToJson(
    ChannelNameCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComparisonOperator',
      _$ComparisonOperatorEnumMap[instance.comparisonOperator]);
  writeNotNull('ComparisonValue', instance.comparisonValue);
  return val;
}

const _$ComparisonOperatorEnumMap = {
  ComparisonOperator.beginsWith: 'BEGINS_WITH',
};

CreateSignalingChannelOutput _$CreateSignalingChannelOutputFromJson(
    Map<String, dynamic> json) {
  return CreateSignalingChannelOutput(
    channelARN: json['ChannelARN'] as String,
  );
}

CreateStreamOutput _$CreateStreamOutputFromJson(Map<String, dynamic> json) {
  return CreateStreamOutput(
    streamARN: json['StreamARN'] as String,
  );
}

DeleteSignalingChannelOutput _$DeleteSignalingChannelOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteSignalingChannelOutput();
}

DeleteStreamOutput _$DeleteStreamOutputFromJson(Map<String, dynamic> json) {
  return DeleteStreamOutput();
}

DescribeSignalingChannelOutput _$DescribeSignalingChannelOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeSignalingChannelOutput(
    channelInfo: json['ChannelInfo'] == null
        ? null
        : ChannelInfo.fromJson(json['ChannelInfo'] as Map<String, dynamic>),
  );
}

DescribeStreamOutput _$DescribeStreamOutputFromJson(Map<String, dynamic> json) {
  return DescribeStreamOutput(
    streamInfo: json['StreamInfo'] == null
        ? null
        : StreamInfo.fromJson(json['StreamInfo'] as Map<String, dynamic>),
  );
}

GetDataEndpointOutput _$GetDataEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return GetDataEndpointOutput(
    dataEndpoint: json['DataEndpoint'] as String,
  );
}

GetSignalingChannelEndpointOutput _$GetSignalingChannelEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return GetSignalingChannelEndpointOutput(
    resourceEndpointList: (json['ResourceEndpointList'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceEndpointListItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListSignalingChannelsOutput _$ListSignalingChannelsOutputFromJson(
    Map<String, dynamic> json) {
  return ListSignalingChannelsOutput(
    channelInfoList: (json['ChannelInfoList'] as List)
        ?.map((e) =>
            e == null ? null : ChannelInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListStreamsOutput _$ListStreamsOutputFromJson(Map<String, dynamic> json) {
  return ListStreamsOutput(
    nextToken: json['NextToken'] as String,
    streamInfoList: (json['StreamInfoList'] as List)
        ?.map((e) =>
            e == null ? null : StreamInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ListTagsForStreamOutput _$ListTagsForStreamOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForStreamOutput(
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ResourceEndpointListItem _$ResourceEndpointListItemFromJson(
    Map<String, dynamic> json) {
  return ResourceEndpointListItem(
    protocol: _$enumDecodeNullable(_$ChannelProtocolEnumMap, json['Protocol']),
    resourceEndpoint: json['ResourceEndpoint'] as String,
  );
}

const _$ChannelProtocolEnumMap = {
  ChannelProtocol.wss: 'WSS',
  ChannelProtocol.https: 'HTTPS',
};

Map<String, dynamic> _$SingleMasterChannelEndpointConfigurationToJson(
    SingleMasterChannelEndpointConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Protocols',
      instance.protocols?.map((e) => _$ChannelProtocolEnumMap[e])?.toList());
  writeNotNull('Role', _$ChannelRoleEnumMap[instance.role]);
  return val;
}

const _$ChannelRoleEnumMap = {
  ChannelRole.master: 'MASTER',
  ChannelRole.viewer: 'VIEWER',
};

SingleMasterConfiguration _$SingleMasterConfigurationFromJson(
    Map<String, dynamic> json) {
  return SingleMasterConfiguration(
    messageTtlSeconds: json['MessageTtlSeconds'] as int,
  );
}

Map<String, dynamic> _$SingleMasterConfigurationToJson(
    SingleMasterConfiguration instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MessageTtlSeconds', instance.messageTtlSeconds);
  return val;
}

StreamInfo _$StreamInfoFromJson(Map<String, dynamic> json) {
  return StreamInfo(
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    dataRetentionInHours: json['DataRetentionInHours'] as int,
    deviceName: json['DeviceName'] as String,
    kmsKeyId: json['KmsKeyId'] as String,
    mediaType: json['MediaType'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['Status']),
    streamARN: json['StreamARN'] as String,
    streamName: json['StreamName'] as String,
    version: json['Version'] as String,
  );
}

Map<String, dynamic> _$StreamNameConditionToJson(StreamNameCondition instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ComparisonOperator',
      _$ComparisonOperatorEnumMap[instance.comparisonOperator]);
  writeNotNull('ComparisonValue', instance.comparisonValue);
  return val;
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

TagStreamOutput _$TagStreamOutputFromJson(Map<String, dynamic> json) {
  return TagStreamOutput();
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}

UntagStreamOutput _$UntagStreamOutputFromJson(Map<String, dynamic> json) {
  return UntagStreamOutput();
}

UpdateDataRetentionOutput _$UpdateDataRetentionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateDataRetentionOutput();
}

UpdateSignalingChannelOutput _$UpdateSignalingChannelOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSignalingChannelOutput();
}

UpdateStreamOutput _$UpdateStreamOutputFromJson(Map<String, dynamic> json) {
  return UpdateStreamOutput();
}
