// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codestar-connections-2019-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return Connection(
    connectionArn: json['ConnectionArn'] as String,
    connectionName: json['ConnectionName'] as String,
    connectionStatus: _$enumDecodeNullable(
        _$ConnectionStatusEnumMap, json['ConnectionStatus']),
    ownerAccountId: json['OwnerAccountId'] as String,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
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
  ConnectionStatus.pending: 'PENDING',
  ConnectionStatus.available: 'AVAILABLE',
  ConnectionStatus.error: 'ERROR',
};

const _$ProviderTypeEnumMap = {
  ProviderType.bitbucket: 'Bitbucket',
};

Map<String, dynamic> _$CreateConnectionInputToJson(
    CreateConnectionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionName', instance.connectionName);
  writeNotNull('ProviderType', _$ProviderTypeEnumMap[instance.providerType]);
  return val;
}

CreateConnectionOutput _$CreateConnectionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateConnectionOutput(
    connectionArn: json['ConnectionArn'] as String,
  );
}

Map<String, dynamic> _$DeleteConnectionInputToJson(
    DeleteConnectionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionArn', instance.connectionArn);
  return val;
}

DeleteConnectionOutput _$DeleteConnectionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteConnectionOutput();
}

Map<String, dynamic> _$GetConnectionInputToJson(GetConnectionInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConnectionArn', instance.connectionArn);
  return val;
}

GetConnectionOutput _$GetConnectionOutputFromJson(Map<String, dynamic> json) {
  return GetConnectionOutput(
    connection: json['Connection'] == null
        ? null
        : Connection.fromJson(json['Connection'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ListConnectionsInputToJson(
    ListConnectionsInput instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull(
      'ProviderTypeFilter', _$ProviderTypeEnumMap[instance.providerTypeFilter]);
  return val;
}

ListConnectionsOutput _$ListConnectionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListConnectionsOutput(
    connections: (json['Connections'] as List)
        ?.map((e) =>
            e == null ? null : Connection.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}
