// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-09-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CancelQuantumTaskResponse _$CancelQuantumTaskResponseFromJson(
    Map<String, dynamic> json) {
  return CancelQuantumTaskResponse(
    cancellationStatus: _$enumDecodeNullable(
        _$CancellationStatusEnumMap, json['cancellationStatus']),
    quantumTaskArn: json['quantumTaskArn'] as String,
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

const _$CancellationStatusEnumMap = {
  CancellationStatus.cancelling: 'CANCELLING',
  CancellationStatus.cancelled: 'CANCELLED',
};

CreateQuantumTaskResponse _$CreateQuantumTaskResponseFromJson(
    Map<String, dynamic> json) {
  return CreateQuantumTaskResponse(
    quantumTaskArn: json['quantumTaskArn'] as String,
  );
}

DeviceSummary _$DeviceSummaryFromJson(Map<String, dynamic> json) {
  return DeviceSummary(
    deviceArn: json['deviceArn'] as String,
    deviceName: json['deviceName'] as String,
    deviceStatus:
        _$enumDecodeNullable(_$DeviceStatusEnumMap, json['deviceStatus']),
    deviceType: _$enumDecodeNullable(_$DeviceTypeEnumMap, json['deviceType']),
    providerName: json['providerName'] as String,
  );
}

const _$DeviceStatusEnumMap = {
  DeviceStatus.online: 'ONLINE',
  DeviceStatus.offline: 'OFFLINE',
};

const _$DeviceTypeEnumMap = {
  DeviceType.qpu: 'QPU',
  DeviceType.simulator: 'SIMULATOR',
};

GetDeviceResponse _$GetDeviceResponseFromJson(Map<String, dynamic> json) {
  return GetDeviceResponse(
    deviceArn: json['deviceArn'] as String,
    deviceCapabilities: json['deviceCapabilities'],
    deviceName: json['deviceName'] as String,
    deviceStatus:
        _$enumDecodeNullable(_$DeviceStatusEnumMap, json['deviceStatus']),
    deviceType: _$enumDecodeNullable(_$DeviceTypeEnumMap, json['deviceType']),
    providerName: json['providerName'] as String,
  );
}

GetQuantumTaskResponse _$GetQuantumTaskResponseFromJson(
    Map<String, dynamic> json) {
  return GetQuantumTaskResponse(
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    deviceArn: json['deviceArn'] as String,
    deviceParameters: json['deviceParameters'],
    outputS3Bucket: json['outputS3Bucket'] as String,
    outputS3Directory: json['outputS3Directory'] as String,
    quantumTaskArn: json['quantumTaskArn'] as String,
    shots: json['shots'] as int,
    status: _$enumDecodeNullable(_$QuantumTaskStatusEnumMap, json['status']),
    endedAt: const IsoDateTimeConverter().fromJson(json['endedAt']),
    failureReason: json['failureReason'] as String,
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

const _$QuantumTaskStatusEnumMap = {
  QuantumTaskStatus.created: 'CREATED',
  QuantumTaskStatus.queued: 'QUEUED',
  QuantumTaskStatus.running: 'RUNNING',
  QuantumTaskStatus.completed: 'COMPLETED',
  QuantumTaskStatus.failed: 'FAILED',
  QuantumTaskStatus.cancelling: 'CANCELLING',
  QuantumTaskStatus.cancelled: 'CANCELLED',
};

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

QuantumTaskSummary _$QuantumTaskSummaryFromJson(Map<String, dynamic> json) {
  return QuantumTaskSummary(
    createdAt: const IsoDateTimeConverter().fromJson(json['createdAt']),
    deviceArn: json['deviceArn'] as String,
    outputS3Bucket: json['outputS3Bucket'] as String,
    outputS3Directory: json['outputS3Directory'] as String,
    quantumTaskArn: json['quantumTaskArn'] as String,
    shots: json['shots'] as int,
    status: _$enumDecodeNullable(_$QuantumTaskStatusEnumMap, json['status']),
    endedAt: const IsoDateTimeConverter().fromJson(json['endedAt']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$SearchDevicesFilterToJson(SearchDevicesFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('values', instance.values);
  return val;
}

SearchDevicesResponse _$SearchDevicesResponseFromJson(
    Map<String, dynamic> json) {
  return SearchDevicesResponse(
    devices: (json['devices'] as List)
        ?.map((e) => e == null
            ? null
            : DeviceSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

Map<String, dynamic> _$SearchQuantumTasksFilterToJson(
    SearchQuantumTasksFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull(
      'operator', _$SearchQuantumTasksFilterOperatorEnumMap[instance.operator]);
  writeNotNull('values', instance.values);
  return val;
}

const _$SearchQuantumTasksFilterOperatorEnumMap = {
  SearchQuantumTasksFilterOperator.lt: 'LT',
  SearchQuantumTasksFilterOperator.lte: 'LTE',
  SearchQuantumTasksFilterOperator.equal: 'EQUAL',
  SearchQuantumTasksFilterOperator.gt: 'GT',
  SearchQuantumTasksFilterOperator.gte: 'GTE',
  SearchQuantumTasksFilterOperator.between: 'BETWEEN',
};

SearchQuantumTasksResponse _$SearchQuantumTasksResponseFromJson(
    Map<String, dynamic> json) {
  return SearchQuantumTasksResponse(
    quantumTasks: (json['quantumTasks'] as List)
        ?.map((e) => e == null
            ? null
            : QuantumTaskSummary.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
