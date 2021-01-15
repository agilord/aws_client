// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-07-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateEndpointResult _$CreateEndpointResultFromJson(Map<String, dynamic> json) {
  return CreateEndpointResult(
    endpointArn: json['EndpointArn'] as String,
  );
}

Endpoint _$EndpointFromJson(Map<String, dynamic> json) {
  return Endpoint(
    cidrBlock: json['CidrBlock'] as String,
    creationTime: const UnixDateTimeConverter().fromJson(json['CreationTime']),
    endpointArn: json['EndpointArn'] as String,
    networkInterfaces: (json['NetworkInterfaces'] as List)
        ?.map((e) => e == null
            ? null
            : NetworkInterface.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    outpostsId: json['OutpostsId'] as String,
    status: _$enumDecodeNullable(_$EndpointStatusEnumMap, json['Status']),
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

const _$EndpointStatusEnumMap = {
  EndpointStatus.pending: 'PENDING',
  EndpointStatus.available: 'AVAILABLE',
};

ListEndpointsResult _$ListEndpointsResultFromJson(Map<String, dynamic> json) {
  return ListEndpointsResult(
    endpoints: (json['Endpoints'] as List)
        ?.map((e) =>
            e == null ? null : Endpoint.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

NetworkInterface _$NetworkInterfaceFromJson(Map<String, dynamic> json) {
  return NetworkInterface(
    networkInterfaceId: json['NetworkInterfaceId'] as String,
  );
}
