// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'codestar-connections-2019-12-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Connection _$ConnectionFromJson(Map<String, dynamic> json) {
  return Connection(
    connectionArn: json['ConnectionArn'] as String?,
    connectionName: json['ConnectionName'] as String?,
    connectionStatus: _$enumDecodeNullable(
        _$ConnectionStatusEnumMap, json['ConnectionStatus']),
    hostArn: json['HostArn'] as String?,
    ownerAccountId: json['OwnerAccountId'] as String?,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
  );
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.pending: 'PENDING',
  ConnectionStatus.available: 'AVAILABLE',
  ConnectionStatus.error: 'ERROR',
};

const _$ProviderTypeEnumMap = {
  ProviderType.bitbucket: 'Bitbucket',
  ProviderType.gitHub: 'GitHub',
  ProviderType.gitHubEnterpriseServer: 'GitHubEnterpriseServer',
};

CreateConnectionOutput _$CreateConnectionOutputFromJson(
    Map<String, dynamic> json) {
  return CreateConnectionOutput(
    connectionArn: json['ConnectionArn'] as String,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

CreateHostOutput _$CreateHostOutputFromJson(Map<String, dynamic> json) {
  return CreateHostOutput(
    hostArn: json['HostArn'] as String?,
  );
}

DeleteConnectionOutput _$DeleteConnectionOutputFromJson(
    Map<String, dynamic> json) {
  return DeleteConnectionOutput();
}

DeleteHostOutput _$DeleteHostOutputFromJson(Map<String, dynamic> json) {
  return DeleteHostOutput();
}

GetConnectionOutput _$GetConnectionOutputFromJson(Map<String, dynamic> json) {
  return GetConnectionOutput(
    connection: json['Connection'] == null
        ? null
        : Connection.fromJson(json['Connection'] as Map<String, dynamic>),
  );
}

GetHostOutput _$GetHostOutputFromJson(Map<String, dynamic> json) {
  return GetHostOutput(
    name: json['Name'] as String?,
    providerEndpoint: json['ProviderEndpoint'] as String?,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
    status: json['Status'] as String?,
    vpcConfiguration: json['VpcConfiguration'] == null
        ? null
        : VpcConfiguration.fromJson(
            json['VpcConfiguration'] as Map<String, dynamic>),
  );
}

Host _$HostFromJson(Map<String, dynamic> json) {
  return Host(
    hostArn: json['HostArn'] as String?,
    name: json['Name'] as String?,
    providerEndpoint: json['ProviderEndpoint'] as String?,
    providerType:
        _$enumDecodeNullable(_$ProviderTypeEnumMap, json['ProviderType']),
    status: json['Status'] as String?,
    statusMessage: json['StatusMessage'] as String?,
    vpcConfiguration: json['VpcConfiguration'] == null
        ? null
        : VpcConfiguration.fromJson(
            json['VpcConfiguration'] as Map<String, dynamic>),
  );
}

ListConnectionsOutput _$ListConnectionsOutputFromJson(
    Map<String, dynamic> json) {
  return ListConnectionsOutput(
    connections: (json['Connections'] as List<dynamic>?)
        ?.map((e) => Connection.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListHostsOutput _$ListHostsOutputFromJson(Map<String, dynamic> json) {
  return ListHostsOutput(
    hosts: (json['Hosts'] as List<dynamic>?)
        ?.map((e) => Host.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListTagsForResourceOutput _$ListTagsForResourceOutputFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceOutput(
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

TagResourceOutput _$TagResourceOutputFromJson(Map<String, dynamic> json) {
  return TagResourceOutput();
}

UntagResourceOutput _$UntagResourceOutputFromJson(Map<String, dynamic> json) {
  return UntagResourceOutput();
}

UpdateHostOutput _$UpdateHostOutputFromJson(Map<String, dynamic> json) {
  return UpdateHostOutput();
}

VpcConfiguration _$VpcConfigurationFromJson(Map<String, dynamic> json) {
  return VpcConfiguration(
    securityGroupIds: (json['SecurityGroupIds'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    subnetIds:
        (json['SubnetIds'] as List<dynamic>).map((e) => e as String).toList(),
    vpcId: json['VpcId'] as String,
    tlsCertificate: json['TlsCertificate'] as String?,
  );
}

Map<String, dynamic> _$VpcConfigurationToJson(VpcConfiguration instance) {
  final val = <String, dynamic>{
    'SecurityGroupIds': instance.securityGroupIds,
    'SubnetIds': instance.subnetIds,
    'VpcId': instance.vpcId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('TlsCertificate', instance.tlsCertificate);
  return val;
}
