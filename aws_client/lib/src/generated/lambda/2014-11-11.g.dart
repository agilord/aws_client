// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-11-11.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventSourceConfiguration _$EventSourceConfigurationFromJson(
    Map<String, dynamic> json) {
  return EventSourceConfiguration(
    batchSize: json['BatchSize'] as int,
    eventSource: json['EventSource'] as String,
    functionName: json['FunctionName'] as String,
    isActive: json['IsActive'] as bool,
    lastModified: const UnixDateTimeConverter().fromJson(json['LastModified']),
    parameters: (json['Parameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    role: json['Role'] as String,
    status: json['Status'] as String,
    uuid: json['UUID'] as String,
  );
}

FunctionCodeLocation _$FunctionCodeLocationFromJson(Map<String, dynamic> json) {
  return FunctionCodeLocation(
    location: json['Location'] as String,
    repositoryType: json['RepositoryType'] as String,
  );
}

FunctionConfiguration _$FunctionConfigurationFromJson(
    Map<String, dynamic> json) {
  return FunctionConfiguration(
    codeSize: json['CodeSize'] as int,
    configurationId: json['ConfigurationId'] as String,
    description: json['Description'] as String,
    functionARN: json['FunctionARN'] as String,
    functionName: json['FunctionName'] as String,
    handler: json['Handler'] as String,
    lastModified: const UnixDateTimeConverter().fromJson(json['LastModified']),
    memorySize: json['MemorySize'] as int,
    mode: _$enumDecodeNullable(_$ModeEnumMap, json['Mode']),
    role: json['Role'] as String,
    runtime: _$enumDecodeNullable(_$RuntimeEnumMap, json['Runtime']),
    timeout: json['Timeout'] as int,
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

const _$ModeEnumMap = {
  Mode.event: 'event',
};

const _$RuntimeEnumMap = {
  Runtime.nodejs: 'nodejs',
};

GetFunctionResponse _$GetFunctionResponseFromJson(Map<String, dynamic> json) {
  return GetFunctionResponse(
    code: json['Code'] == null
        ? null
        : FunctionCodeLocation.fromJson(json['Code'] as Map<String, dynamic>),
    configuration: json['Configuration'] == null
        ? null
        : FunctionConfiguration.fromJson(
            json['Configuration'] as Map<String, dynamic>),
  );
}

InvalidParameterValueException _$InvalidParameterValueExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidParameterValueException(
    type: json['Type'] as String,
    message: json['message'] as String,
  );
}

InvalidRequestContentException _$InvalidRequestContentExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidRequestContentException(
    type: json['Type'] as String,
    message: json['message'] as String,
  );
}

InvokeAsyncResponse _$InvokeAsyncResponseFromJson(Map<String, dynamic> json) {
  return InvokeAsyncResponse(
    status: json['Status'] as int,
  );
}

ListEventSourcesResponse _$ListEventSourcesResponseFromJson(
    Map<String, dynamic> json) {
  return ListEventSourcesResponse(
    eventSources: (json['EventSources'] as List)
        ?.map((e) => e == null
            ? null
            : EventSourceConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ListFunctionsResponse _$ListFunctionsResponseFromJson(
    Map<String, dynamic> json) {
  return ListFunctionsResponse(
    functions: (json['Functions'] as List)
        ?.map((e) => e == null
            ? null
            : FunctionConfiguration.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextMarker: json['NextMarker'] as String,
  );
}

ResourceNotFoundException _$ResourceNotFoundExceptionFromJson(
    Map<String, dynamic> json) {
  return ResourceNotFoundException(
    message: json['Message'] as String,
    type: json['Type'] as String,
  );
}

ServiceException _$ServiceExceptionFromJson(Map<String, dynamic> json) {
  return ServiceException(
    message: json['Message'] as String,
    type: json['Type'] as String,
  );
}
