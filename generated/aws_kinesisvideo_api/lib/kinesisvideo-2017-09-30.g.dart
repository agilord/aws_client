// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kinesisvideo-2017-09-30.dart';

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
    creationTime: unixTimestampFromJson(json['CreationTime']),
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

Map<String, dynamic> _$CreateSignalingChannelInputToJson(
    CreateSignalingChannelInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelName', instance.channelName);
  writeNotNull('ChannelType', _$ChannelTypeEnumMap[instance.channelType]);
  writeNotNull('SingleMasterConfiguration',
      instance.singleMasterConfiguration?.toJson());
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

CreateSignalingChannelOutput _$CreateSignalingChannelOutputFromJson(
    Map<String, dynamic> json) {
  return CreateSignalingChannelOutput(
    channelARN: json['ChannelARN'] as String,
  );
}

Map<String, dynamic> _$CreateStreamInputToJson(CreateStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamName', instance.streamName);
  writeNotNull('DataRetentionInHours', instance.dataRetentionInHours);
  writeNotNull('DeviceName', instance.deviceName);
  writeNotNull('KmsKeyId', instance.kmsKeyId);
  writeNotNull('MediaType', instance.mediaType);
  writeNotNull('Tags', instance.tags);
  return val;
}

CreateStreamOutput _$CreateStreamOutputFromJson(Map<String, dynamic> json) {
  return CreateStreamOutput(
    streamARN: json['StreamARN'] as String,
  );
}

Map<String, dynamic> _$DeleteSignalingChannelInputToJson(
    DeleteSignalingChannelInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelARN', instance.channelARN);
  writeNotNull('CurrentVersion', instance.currentVersion);
  return val;
}

DeleteSignalingChannelOutput _$DeleteSignalingChannelOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteSignalingChannelOutput();
}

Map<String, dynamic> _$DeleteStreamInputToJson(DeleteStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('CurrentVersion', instance.currentVersion);
  return val;
}

DeleteStreamOutput _$DeleteStreamOutputFromJson(Map<String, dynamic> json) {
  return DeleteStreamOutput();
}

Map<String, dynamic> _$DescribeSignalingChannelInputToJson(
    DescribeSignalingChannelInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelARN', instance.channelARN);
  writeNotNull('ChannelName', instance.channelName);
  return val;
}

DescribeSignalingChannelOutput _$DescribeSignalingChannelOutputFromJson(
    Map<String, dynamic> json) {
  return DescribeSignalingChannelOutput(
    channelInfo: json['ChannelInfo'] == null
        ? null
        : ChannelInfo.fromJson(json['ChannelInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeStreamInputToJson(DescribeStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

DescribeStreamOutput _$DescribeStreamOutputFromJson(Map<String, dynamic> json) {
  return DescribeStreamOutput(
    streamInfo: json['StreamInfo'] == null
        ? null
        : StreamInfo.fromJson(json['StreamInfo'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$GetDataEndpointInputToJson(
    GetDataEndpointInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('APIName', _$APINameEnumMap[instance.aPIName]);
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

const _$APINameEnumMap = {
  APIName.putMedia: 'PUT_MEDIA',
  APIName.getMedia: 'GET_MEDIA',
  APIName.listFragments: 'LIST_FRAGMENTS',
  APIName.getMediaForFragmentList: 'GET_MEDIA_FOR_FRAGMENT_LIST',
  APIName.getHlsStreamingSessionUrl: 'GET_HLS_STREAMING_SESSION_URL',
  APIName.getDashStreamingSessionUrl: 'GET_DASH_STREAMING_SESSION_URL',
};

GetDataEndpointOutput _$GetDataEndpointOutputFromJson(
    Map<String, dynamic> json) {
  return GetDataEndpointOutput(
    dataEndpoint: json['DataEndpoint'] as String,
  );
}

Map<String, dynamic> _$GetSignalingChannelEndpointInputToJson(
    GetSignalingChannelEndpointInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelARN', instance.channelARN);
  writeNotNull('SingleMasterChannelEndpointConfiguration',
      instance.singleMasterChannelEndpointConfiguration?.toJson());
  return val;
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

Map<String, dynamic> _$ListSignalingChannelsInputToJson(
    ListSignalingChannelsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelNameCondition', instance.channelNameCondition?.toJson());
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListStreamsInputToJson(ListStreamsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StreamNameCondition', instance.streamNameCondition?.toJson());
  return val;
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

Map<String, dynamic> _$ListTagsForResourceInputToJson(
    ListTagsForResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('NextToken', instance.nextToken);
  return val;
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

Map<String, dynamic> _$ListTagsForStreamInputToJson(
    ListTagsForStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
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

  writeNotNull('Protocols', instance.protocols);
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
    creationTime: unixTimestampFromJson(json['CreationTime']),
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

Map<String, dynamic> _$TagResourceInputToJson(TagResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

Map<String, dynamic> _$TagStreamInputToJson(TagStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tags', instance.tags);
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

TagStreamOutput _$TagStreamOutputFromJson(Map<String, dynamic> json) {
  return TagStreamOutput();
}

Map<String, dynamic> _$UntagResourceInputToJson(UntagResourceInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ResourceARN', instance.resourceARN);
  writeNotNull('TagKeyList', instance.tagKeyList);
  return val;
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}

Map<String, dynamic> _$UntagStreamInputToJson(UntagStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TagKeyList', instance.tagKeyList);
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

UntagStreamOutput _$UntagStreamOutputFromJson(Map<String, dynamic> json) {
  return UntagStreamOutput();
}

Map<String, dynamic> _$UpdateDataRetentionInputToJson(
    UpdateDataRetentionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CurrentVersion', instance.currentVersion);
  writeNotNull(
      'DataRetentionChangeInHours', instance.dataRetentionChangeInHours);
  writeNotNull(
      'Operation', _$UpdateDataRetentionOperationEnumMap[instance.operation]);
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

const _$UpdateDataRetentionOperationEnumMap = {
  UpdateDataRetentionOperation.increaseDataRetention: 'INCREASE_DATA_RETENTION',
  UpdateDataRetentionOperation.decreaseDataRetention: 'DECREASE_DATA_RETENTION',
};

UpdateDataRetentionOutput _$UpdateDataRetentionOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateDataRetentionOutput();
}

Map<String, dynamic> _$UpdateSignalingChannelInputToJson(
    UpdateSignalingChannelInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ChannelARN', instance.channelARN);
  writeNotNull('CurrentVersion', instance.currentVersion);
  writeNotNull('SingleMasterConfiguration',
      instance.singleMasterConfiguration?.toJson());
  return val;
}

UpdateSignalingChannelOutput _$UpdateSignalingChannelOutputFromJson(
    Map<String, dynamic> json) {
  return UpdateSignalingChannelOutput();
}

Map<String, dynamic> _$UpdateStreamInputToJson(UpdateStreamInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CurrentVersion', instance.currentVersion);
  writeNotNull('DeviceName', instance.deviceName);
  writeNotNull('MediaType', instance.mediaType);
  writeNotNull('StreamARN', instance.streamARN);
  writeNotNull('StreamName', instance.streamName);
  return val;
}

UpdateStreamOutput _$UpdateStreamOutputFromJson(Map<String, dynamic> json) {
  return UpdateStreamOutput();
}
