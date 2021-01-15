// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-06-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlreadyStreamedException _$AlreadyStreamedExceptionFromJson(
    Map<String, dynamic> json) {
  return AlreadyStreamedException(
    message: json['message'] as String,
  );
}

BulkPublishResponse _$BulkPublishResponseFromJson(Map<String, dynamic> json) {
  return BulkPublishResponse(
    identityPoolId: json['IdentityPoolId'] as String,
  );
}

CognitoStreams _$CognitoStreamsFromJson(Map<String, dynamic> json) {
  return CognitoStreams(
    roleArn: json['RoleArn'] as String,
    streamName: json['StreamName'] as String,
    streamingStatus:
        _$enumDecodeNullable(_$StreamingStatusEnumMap, json['StreamingStatus']),
  );
}

Map<String, dynamic> _$CognitoStreamsToJson(CognitoStreams instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('StreamName', instance.streamName);
  writeNotNull(
      'StreamingStatus', _$StreamingStatusEnumMap[instance.streamingStatus]);
  return val;
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

const _$StreamingStatusEnumMap = {
  StreamingStatus.enabled: 'ENABLED',
  StreamingStatus.disabled: 'DISABLED',
};

ConcurrentModificationException _$ConcurrentModificationExceptionFromJson(
    Map<String, dynamic> json) {
  return ConcurrentModificationException(
    message: json['message'] as String,
  );
}

Dataset _$DatasetFromJson(Map<String, dynamic> json) {
  return Dataset(
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    dataStorage: json['DataStorage'] as int,
    datasetName: json['DatasetName'] as String,
    identityId: json['IdentityId'] as String,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    numRecords: json['NumRecords'] as int,
  );
}

DeleteDatasetResponse _$DeleteDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteDatasetResponse(
    dataset: json['Dataset'] == null
        ? null
        : Dataset.fromJson(json['Dataset'] as Map<String, dynamic>),
  );
}

DescribeDatasetResponse _$DescribeDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeDatasetResponse(
    dataset: json['Dataset'] == null
        ? null
        : Dataset.fromJson(json['Dataset'] as Map<String, dynamic>),
  );
}

DescribeIdentityPoolUsageResponse _$DescribeIdentityPoolUsageResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeIdentityPoolUsageResponse(
    identityPoolUsage: json['IdentityPoolUsage'] == null
        ? null
        : IdentityPoolUsage.fromJson(
            json['IdentityPoolUsage'] as Map<String, dynamic>),
  );
}

DescribeIdentityUsageResponse _$DescribeIdentityUsageResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeIdentityUsageResponse(
    identityUsage: json['IdentityUsage'] == null
        ? null
        : IdentityUsage.fromJson(json['IdentityUsage'] as Map<String, dynamic>),
  );
}

DuplicateRequestException _$DuplicateRequestExceptionFromJson(
    Map<String, dynamic> json) {
  return DuplicateRequestException(
    message: json['message'] as String,
  );
}

GetBulkPublishDetailsResponse _$GetBulkPublishDetailsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBulkPublishDetailsResponse(
    bulkPublishCompleteTime:
        const UnixDateTimeConverter().fromJson(json['BulkPublishCompleteTime']),
    bulkPublishStartTime:
        const UnixDateTimeConverter().fromJson(json['BulkPublishStartTime']),
    bulkPublishStatus: _$enumDecodeNullable(
        _$BulkPublishStatusEnumMap, json['BulkPublishStatus']),
    failureMessage: json['FailureMessage'] as String,
    identityPoolId: json['IdentityPoolId'] as String,
  );
}

const _$BulkPublishStatusEnumMap = {
  BulkPublishStatus.notStarted: 'NOT_STARTED',
  BulkPublishStatus.inProgress: 'IN_PROGRESS',
  BulkPublishStatus.failed: 'FAILED',
  BulkPublishStatus.succeeded: 'SUCCEEDED',
};

GetCognitoEventsResponse _$GetCognitoEventsResponseFromJson(
    Map<String, dynamic> json) {
  return GetCognitoEventsResponse(
    events: (json['Events'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetIdentityPoolConfigurationResponse
    _$GetIdentityPoolConfigurationResponseFromJson(Map<String, dynamic> json) {
  return GetIdentityPoolConfigurationResponse(
    cognitoStreams: json['CognitoStreams'] == null
        ? null
        : CognitoStreams.fromJson(
            json['CognitoStreams'] as Map<String, dynamic>),
    identityPoolId: json['IdentityPoolId'] as String,
    pushSync: json['PushSync'] == null
        ? null
        : PushSync.fromJson(json['PushSync'] as Map<String, dynamic>),
  );
}

IdentityPoolUsage _$IdentityPoolUsageFromJson(Map<String, dynamic> json) {
  return IdentityPoolUsage(
    dataStorage: json['DataStorage'] as int,
    identityPoolId: json['IdentityPoolId'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    syncSessionsCount: json['SyncSessionsCount'] as int,
  );
}

IdentityUsage _$IdentityUsageFromJson(Map<String, dynamic> json) {
  return IdentityUsage(
    dataStorage: json['DataStorage'] as int,
    datasetCount: json['DatasetCount'] as int,
    identityId: json['IdentityId'] as String,
    identityPoolId: json['IdentityPoolId'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
  );
}

InternalErrorException _$InternalErrorExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalErrorException(
    message: json['message'] as String,
  );
}

InvalidConfigurationException _$InvalidConfigurationExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidConfigurationException(
    message: json['message'] as String,
  );
}

InvalidLambdaFunctionOutputException
    _$InvalidLambdaFunctionOutputExceptionFromJson(Map<String, dynamic> json) {
  return InvalidLambdaFunctionOutputException(
    message: json['message'] as String,
  );
}

InvalidParameterException _$InvalidParameterExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidParameterException(
    message: json['message'] as String,
  );
}

LambdaThrottledException _$LambdaThrottledExceptionFromJson(
    Map<String, dynamic> json) {
  return LambdaThrottledException(
    message: json['message'] as String,
  );
}

LimitExceededException _$LimitExceededExceptionFromJson(
    Map<String, dynamic> json) {
  return LimitExceededException(
    message: json['message'] as String,
  );
}

ListDatasetsResponse _$ListDatasetsResponseFromJson(Map<String, dynamic> json) {
  return ListDatasetsResponse(
    count: json['Count'] as int,
    datasets: (json['Datasets'] as List)
        ?.map((e) =>
            e == null ? null : Dataset.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListIdentityPoolUsageResponse _$ListIdentityPoolUsageResponseFromJson(
    Map<String, dynamic> json) {
  return ListIdentityPoolUsageResponse(
    count: json['Count'] as int,
    identityPoolUsages: (json['IdentityPoolUsages'] as List)
        ?.map((e) => e == null
            ? null
            : IdentityPoolUsage.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    maxResults: json['MaxResults'] as int,
    nextToken: json['NextToken'] as String,
  );
}

ListRecordsResponse _$ListRecordsResponseFromJson(Map<String, dynamic> json) {
  return ListRecordsResponse(
    count: json['Count'] as int,
    datasetDeletedAfterRequestedSyncCount:
        json['DatasetDeletedAfterRequestedSyncCount'] as bool,
    datasetExists: json['DatasetExists'] as bool,
    datasetSyncCount: json['DatasetSyncCount'] as int,
    lastModifiedBy: json['LastModifiedBy'] as String,
    mergedDatasetNames:
        (json['MergedDatasetNames'] as List)?.map((e) => e as String)?.toList(),
    nextToken: json['NextToken'] as String,
    records: (json['Records'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    syncSessionToken: json['SyncSessionToken'] as String,
  );
}

NotAuthorizedException _$NotAuthorizedExceptionFromJson(
    Map<String, dynamic> json) {
  return NotAuthorizedException(
    message: json['message'] as String,
  );
}

PushSync _$PushSyncFromJson(Map<String, dynamic> json) {
  return PushSync(
    applicationArns:
        (json['ApplicationArns'] as List)?.map((e) => e as String)?.toList(),
    roleArn: json['RoleArn'] as String,
  );
}

Map<String, dynamic> _$PushSyncToJson(PushSync instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationArns', instance.applicationArns);
  writeNotNull('RoleArn', instance.roleArn);
  return val;
}

Record _$RecordFromJson(Map<String, dynamic> json) {
  return Record(
    deviceLastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['DeviceLastModifiedDate']),
    key: json['Key'] as String,
    lastModifiedBy: json['LastModifiedBy'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    syncCount: json['SyncCount'] as int,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$RecordPatchToJson(RecordPatch instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Op', _$OperationEnumMap[instance.op]);
  writeNotNull('SyncCount', instance.syncCount);
  writeNotNull('DeviceLastModifiedDate',
      const UnixDateTimeConverter().toJson(instance.deviceLastModifiedDate));
  writeNotNull('Value', instance.value);
  return val;
}

const _$OperationEnumMap = {
  Operation.replace: 'replace',
  Operation.remove: 'remove',
};

RegisterDeviceResponse _$RegisterDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return RegisterDeviceResponse(
    deviceId: json['DeviceId'] as String,
  );
}

ResourceConflictException _$ResourceConflictExceptionFromJson(
    Map<String, dynamic> json) {
  return ResourceConflictException(
    message: json['message'] as String,
  );
}

ResourceNotFoundException _$ResourceNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return ResourceNotFoundException(
    message: json['message'] as String,
  );
}

SetIdentityPoolConfigurationResponse
    _$SetIdentityPoolConfigurationResponseFromJson(Map<String, dynamic> json) {
  return SetIdentityPoolConfigurationResponse(
    cognitoStreams: json['CognitoStreams'] == null
        ? null
        : CognitoStreams.fromJson(
            json['CognitoStreams'] as Map<String, dynamic>),
    identityPoolId: json['IdentityPoolId'] as String,
    pushSync: json['PushSync'] == null
        ? null
        : PushSync.fromJson(json['PushSync'] as Map<String, dynamic>),
  );
}

SubscribeToDatasetResponse _$SubscribeToDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return SubscribeToDatasetResponse();
}

TooManyRequestsException _$TooManyRequestsExceptionFromJson(
    Map<String, dynamic> json) {
  return TooManyRequestsException(
    message: json['message'] as String,
  );
}

UnsubscribeFromDatasetResponse _$UnsubscribeFromDatasetResponseFromJson(
    Map<String, dynamic> json) {
  return UnsubscribeFromDatasetResponse();
}

UpdateRecordsResponse _$UpdateRecordsResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateRecordsResponse(
    records: (json['Records'] as List)
        ?.map((e) =>
            e == null ? null : Record.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
