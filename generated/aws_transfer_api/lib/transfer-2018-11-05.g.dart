// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer-2018-11-05.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateServerResponse _$CreateServerResponseFromJson(Map<String, dynamic> json) {
  return CreateServerResponse(
    serverId: json['ServerId'] as String,
  );
}

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    serverId: json['ServerId'] as String,
    userName: json['UserName'] as String,
  );
}

DescribeSecurityPolicyResponse _$DescribeSecurityPolicyResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSecurityPolicyResponse(
    securityPolicy: DescribedSecurityPolicy.fromJson(
        json['SecurityPolicy'] as Map<String, dynamic>),
  );
}

DescribeServerResponse _$DescribeServerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeServerResponse(
    server: DescribedServer.fromJson(json['Server'] as Map<String, dynamic>),
  );
}

DescribeUserResponse _$DescribeUserResponseFromJson(Map<String, dynamic> json) {
  return DescribeUserResponse(
    serverId: json['ServerId'] as String,
    user: DescribedUser.fromJson(json['User'] as Map<String, dynamic>),
  );
}

DescribedSecurityPolicy _$DescribedSecurityPolicyFromJson(
    Map<String, dynamic> json) {
  return DescribedSecurityPolicy(
    securityPolicyName: json['SecurityPolicyName'] as String,
    fips: json['Fips'] as bool?,
    sshCiphers: (json['SshCiphers'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    sshKexs:
        (json['SshKexs'] as List<dynamic>?)?.map((e) => e as String).toList(),
    sshMacs:
        (json['SshMacs'] as List<dynamic>?)?.map((e) => e as String).toList(),
    tlsCiphers: (json['TlsCiphers'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
  );
}

DescribedServer _$DescribedServerFromJson(Map<String, dynamic> json) {
  return DescribedServer(
    arn: json['Arn'] as String,
    certificate: json['Certificate'] as String?,
    endpointDetails: json['EndpointDetails'] == null
        ? null
        : EndpointDetails.fromJson(
            json['EndpointDetails'] as Map<String, dynamic>),
    endpointType:
        _$enumDecodeNullable(_$EndpointTypeEnumMap, json['EndpointType']),
    hostKeyFingerprint: json['HostKeyFingerprint'] as String?,
    identityProviderDetails: json['IdentityProviderDetails'] == null
        ? null
        : IdentityProviderDetails.fromJson(
            json['IdentityProviderDetails'] as Map<String, dynamic>),
    identityProviderType: _$enumDecodeNullable(
        _$IdentityProviderTypeEnumMap, json['IdentityProviderType']),
    loggingRole: json['LoggingRole'] as String?,
    protocols: (json['Protocols'] as List<dynamic>?)
        ?.map((e) => _$enumDecode(_$ProtocolEnumMap, e))
        .toList(),
    securityPolicyName: json['SecurityPolicyName'] as String?,
    serverId: json['ServerId'] as String?,
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    userCount: json['UserCount'] as int?,
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

const _$EndpointTypeEnumMap = {
  EndpointType.public: 'PUBLIC',
  EndpointType.vpc: 'VPC',
  EndpointType.vpcEndpoint: 'VPC_ENDPOINT',
};

const _$IdentityProviderTypeEnumMap = {
  IdentityProviderType.serviceManaged: 'SERVICE_MANAGED',
  IdentityProviderType.apiGateway: 'API_GATEWAY',
};

const _$ProtocolEnumMap = {
  Protocol.sftp: 'SFTP',
  Protocol.ftp: 'FTP',
  Protocol.ftps: 'FTPS',
};

const _$StateEnumMap = {
  State.offline: 'OFFLINE',
  State.online: 'ONLINE',
  State.starting: 'STARTING',
  State.stopping: 'STOPPING',
  State.startFailed: 'START_FAILED',
  State.stopFailed: 'STOP_FAILED',
};

DescribedUser _$DescribedUserFromJson(Map<String, dynamic> json) {
  return DescribedUser(
    arn: json['Arn'] as String,
    homeDirectory: json['HomeDirectory'] as String?,
    homeDirectoryMappings: (json['HomeDirectoryMappings'] as List<dynamic>?)
        ?.map((e) => HomeDirectoryMapEntry.fromJson(e as Map<String, dynamic>))
        .toList(),
    homeDirectoryType: _$enumDecodeNullable(
        _$HomeDirectoryTypeEnumMap, json['HomeDirectoryType']),
    policy: json['Policy'] as String?,
    role: json['Role'] as String?,
    sshPublicKeys: (json['SshPublicKeys'] as List<dynamic>?)
        ?.map((e) => SshPublicKey.fromJson(e as Map<String, dynamic>))
        .toList(),
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
    userName: json['UserName'] as String?,
  );
}

const _$HomeDirectoryTypeEnumMap = {
  HomeDirectoryType.path: 'PATH',
  HomeDirectoryType.logical: 'LOGICAL',
};

EndpointDetails _$EndpointDetailsFromJson(Map<String, dynamic> json) {
  return EndpointDetails(
    addressAllocationIds: (json['AddressAllocationIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    securityGroupIds: (json['SecurityGroupIds'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    subnetIds:
        (json['SubnetIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
    vpcEndpointId: json['VpcEndpointId'] as String?,
    vpcId: json['VpcId'] as String?,
  );
}

Map<String, dynamic> _$EndpointDetailsToJson(EndpointDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AddressAllocationIds', instance.addressAllocationIds);
  writeNotNull('SecurityGroupIds', instance.securityGroupIds);
  writeNotNull('SubnetIds', instance.subnetIds);
  writeNotNull('VpcEndpointId', instance.vpcEndpointId);
  writeNotNull('VpcId', instance.vpcId);
  return val;
}

HomeDirectoryMapEntry _$HomeDirectoryMapEntryFromJson(
    Map<String, dynamic> json) {
  return HomeDirectoryMapEntry(
    entry: json['Entry'] as String,
    target: json['Target'] as String,
  );
}

Map<String, dynamic> _$HomeDirectoryMapEntryToJson(
        HomeDirectoryMapEntry instance) =>
    <String, dynamic>{
      'Entry': instance.entry,
      'Target': instance.target,
    };

IdentityProviderDetails _$IdentityProviderDetailsFromJson(
    Map<String, dynamic> json) {
  return IdentityProviderDetails(
    invocationRole: json['InvocationRole'] as String?,
    url: json['Url'] as String?,
  );
}

Map<String, dynamic> _$IdentityProviderDetailsToJson(
    IdentityProviderDetails instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('InvocationRole', instance.invocationRole);
  writeNotNull('Url', instance.url);
  return val;
}

ImportSshPublicKeyResponse _$ImportSshPublicKeyResponseFromJson(
    Map<String, dynamic> json) {
  return ImportSshPublicKeyResponse(
    serverId: json['ServerId'] as String,
    sshPublicKeyId: json['SshPublicKeyId'] as String,
    userName: json['UserName'] as String,
  );
}

ListSecurityPoliciesResponse _$ListSecurityPoliciesResponseFromJson(
    Map<String, dynamic> json) {
  return ListSecurityPoliciesResponse(
    securityPolicyNames: (json['SecurityPolicyNames'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListServersResponse _$ListServersResponseFromJson(Map<String, dynamic> json) {
  return ListServersResponse(
    servers: (json['Servers'] as List<dynamic>)
        .map((e) => ListedServer.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    arn: json['Arn'] as String?,
    nextToken: json['NextToken'] as String?,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    serverId: json['ServerId'] as String,
    users: (json['Users'] as List<dynamic>)
        .map((e) => ListedUser.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

ListedServer _$ListedServerFromJson(Map<String, dynamic> json) {
  return ListedServer(
    arn: json['Arn'] as String,
    endpointType:
        _$enumDecodeNullable(_$EndpointTypeEnumMap, json['EndpointType']),
    identityProviderType: _$enumDecodeNullable(
        _$IdentityProviderTypeEnumMap, json['IdentityProviderType']),
    loggingRole: json['LoggingRole'] as String?,
    serverId: json['ServerId'] as String?,
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    userCount: json['UserCount'] as int?,
  );
}

ListedUser _$ListedUserFromJson(Map<String, dynamic> json) {
  return ListedUser(
    arn: json['Arn'] as String,
    homeDirectory: json['HomeDirectory'] as String?,
    homeDirectoryType: _$enumDecodeNullable(
        _$HomeDirectoryTypeEnumMap, json['HomeDirectoryType']),
    role: json['Role'] as String?,
    sshPublicKeyCount: json['SshPublicKeyCount'] as int?,
    userName: json['UserName'] as String?,
  );
}

SshPublicKey _$SshPublicKeyFromJson(Map<String, dynamic> json) {
  return SshPublicKey(
    dateImported: DateTime.parse(json['DateImported'] as String),
    sshPublicKeyBody: json['SshPublicKeyBody'] as String,
    sshPublicKeyId: json['SshPublicKeyId'] as String,
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

TestIdentityProviderResponse _$TestIdentityProviderResponseFromJson(
    Map<String, dynamic> json) {
  return TestIdentityProviderResponse(
    statusCode: json['StatusCode'] as int,
    url: json['Url'] as String,
    message: json['Message'] as String?,
    response: json['Response'] as String?,
  );
}

UpdateServerResponse _$UpdateServerResponseFromJson(Map<String, dynamic> json) {
  return UpdateServerResponse(
    serverId: json['ServerId'] as String,
  );
}

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return UpdateUserResponse(
    serverId: json['ServerId'] as String,
    userName: json['UserName'] as String,
  );
}
