// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer-2018-11-05.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$CreateServerRequestToJson(CreateServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EndpointDetails', instance.endpointDetails?.toJson());
  writeNotNull('EndpointType', _$EndpointTypeEnumMap[instance.endpointType]);
  writeNotNull('HostKey', instance.hostKey);
  writeNotNull(
      'IdentityProviderDetails', instance.identityProviderDetails?.toJson());
  writeNotNull('IdentityProviderType',
      _$IdentityProviderTypeEnumMap[instance.identityProviderType]);
  writeNotNull('LoggingRole', instance.loggingRole);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
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

CreateServerResponse _$CreateServerResponseFromJson(Map<String, dynamic> json) {
  return CreateServerResponse(
    serverId: json['ServerId'] as String,
  );
}

Map<String, dynamic> _$CreateUserRequestToJson(CreateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Role', instance.role);
  writeNotNull('ServerId', instance.serverId);
  writeNotNull('UserName', instance.userName);
  writeNotNull('HomeDirectory', instance.homeDirectory);
  writeNotNull('HomeDirectoryMappings',
      instance.homeDirectoryMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('HomeDirectoryType',
      _$HomeDirectoryTypeEnumMap[instance.homeDirectoryType]);
  writeNotNull('Policy', instance.policy);
  writeNotNull('SshPublicKeyBody', instance.sshPublicKeyBody);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

const _$HomeDirectoryTypeEnumMap = {
  HomeDirectoryType.path: 'PATH',
  HomeDirectoryType.logical: 'LOGICAL',
};

CreateUserResponse _$CreateUserResponseFromJson(Map<String, dynamic> json) {
  return CreateUserResponse(
    serverId: json['ServerId'] as String,
    userName: json['UserName'] as String,
  );
}

Map<String, dynamic> _$DeleteServerRequestToJson(DeleteServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  return val;
}

Map<String, dynamic> _$DeleteSshPublicKeyRequestToJson(
    DeleteSshPublicKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  writeNotNull('SshPublicKeyId', instance.sshPublicKeyId);
  writeNotNull('UserName', instance.userName);
  return val;
}

Map<String, dynamic> _$DeleteUserRequestToJson(DeleteUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  writeNotNull('UserName', instance.userName);
  return val;
}

Map<String, dynamic> _$DescribeServerRequestToJson(
    DescribeServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  return val;
}

DescribeServerResponse _$DescribeServerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeServerResponse(
    server: json['Server'] == null
        ? null
        : DescribedServer.fromJson(json['Server'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$DescribeUserRequestToJson(DescribeUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  writeNotNull('UserName', instance.userName);
  return val;
}

DescribeUserResponse _$DescribeUserResponseFromJson(Map<String, dynamic> json) {
  return DescribeUserResponse(
    serverId: json['ServerId'] as String,
    user: json['User'] == null
        ? null
        : DescribedUser.fromJson(json['User'] as Map<String, dynamic>),
  );
}

DescribedServer _$DescribedServerFromJson(Map<String, dynamic> json) {
  return DescribedServer(
    arn: json['Arn'] as String,
    endpointDetails: json['EndpointDetails'] == null
        ? null
        : EndpointDetails.fromJson(
            json['EndpointDetails'] as Map<String, dynamic>),
    endpointType:
        _$enumDecodeNullable(_$EndpointTypeEnumMap, json['EndpointType']),
    hostKeyFingerprint: json['HostKeyFingerprint'] as String,
    identityProviderDetails: json['IdentityProviderDetails'] == null
        ? null
        : IdentityProviderDetails.fromJson(
            json['IdentityProviderDetails'] as Map<String, dynamic>),
    identityProviderType: _$enumDecodeNullable(
        _$IdentityProviderTypeEnumMap, json['IdentityProviderType']),
    loggingRole: json['LoggingRole'] as String,
    serverId: json['ServerId'] as String,
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userCount: json['UserCount'] as int,
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
    homeDirectory: json['HomeDirectory'] as String,
    homeDirectoryMappings: (json['HomeDirectoryMappings'] as List)
        ?.map((e) => e == null
            ? null
            : HomeDirectoryMapEntry.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    homeDirectoryType: _$enumDecodeNullable(
        _$HomeDirectoryTypeEnumMap, json['HomeDirectoryType']),
    policy: json['Policy'] as String,
    role: json['Role'] as String,
    sshPublicKeys: (json['SshPublicKeys'] as List)
        ?.map((e) =>
            e == null ? null : SshPublicKey.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userName: json['UserName'] as String,
  );
}

EndpointDetails _$EndpointDetailsFromJson(Map<String, dynamic> json) {
  return EndpointDetails(
    addressAllocationIds: (json['AddressAllocationIds'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    subnetIds: (json['SubnetIds'] as List)?.map((e) => e as String)?.toList(),
    vpcEndpointId: json['VpcEndpointId'] as String,
    vpcId: json['VpcId'] as String,
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
    HomeDirectoryMapEntry instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Entry', instance.entry);
  writeNotNull('Target', instance.target);
  return val;
}

IdentityProviderDetails _$IdentityProviderDetailsFromJson(
    Map<String, dynamic> json) {
  return IdentityProviderDetails(
    invocationRole: json['InvocationRole'] as String,
    url: json['Url'] as String,
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

Map<String, dynamic> _$ImportSshPublicKeyRequestToJson(
    ImportSshPublicKeyRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  writeNotNull('SshPublicKeyBody', instance.sshPublicKeyBody);
  writeNotNull('UserName', instance.userName);
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

Map<String, dynamic> _$ListServersRequestToJson(ListServersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListServersResponse _$ListServersResponseFromJson(Map<String, dynamic> json) {
  return ListServersResponse(
    servers: (json['Servers'] as List)
        ?.map((e) =>
            e == null ? null : ListedServer.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$ListTagsForResourceRequestToJson(
    ListTagsForResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    arn: json['Arn'] as String,
    nextToken: json['NextToken'] as String,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ListUsersRequestToJson(ListUsersRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    serverId: json['ServerId'] as String,
    users: (json['Users'] as List)
        ?.map((e) =>
            e == null ? null : ListedUser.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListedServer _$ListedServerFromJson(Map<String, dynamic> json) {
  return ListedServer(
    arn: json['Arn'] as String,
    endpointType:
        _$enumDecodeNullable(_$EndpointTypeEnumMap, json['EndpointType']),
    identityProviderType: _$enumDecodeNullable(
        _$IdentityProviderTypeEnumMap, json['IdentityProviderType']),
    loggingRole: json['LoggingRole'] as String,
    serverId: json['ServerId'] as String,
    state: _$enumDecodeNullable(_$StateEnumMap, json['State']),
    userCount: json['UserCount'] as int,
  );
}

ListedUser _$ListedUserFromJson(Map<String, dynamic> json) {
  return ListedUser(
    arn: json['Arn'] as String,
    homeDirectory: json['HomeDirectory'] as String,
    homeDirectoryType: _$enumDecodeNullable(
        _$HomeDirectoryTypeEnumMap, json['HomeDirectoryType']),
    role: json['Role'] as String,
    sshPublicKeyCount: json['SshPublicKeyCount'] as int,
    userName: json['UserName'] as String,
  );
}

SshPublicKey _$SshPublicKeyFromJson(Map<String, dynamic> json) {
  return SshPublicKey(
    dateImported: unixTimestampFromJson(json['DateImported']),
    sshPublicKeyBody: json['SshPublicKeyBody'] as String,
    sshPublicKeyId: json['SshPublicKeyId'] as String,
  );
}

Map<String, dynamic> _$StartServerRequestToJson(StartServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  return val;
}

Map<String, dynamic> _$StopServerRequestToJson(StopServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  return val;
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
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

Map<String, dynamic> _$TagResourceRequestToJson(TagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

Map<String, dynamic> _$TestIdentityProviderRequestToJson(
    TestIdentityProviderRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  writeNotNull('UserName', instance.userName);
  writeNotNull('UserPassword', instance.userPassword);
  return val;
}

TestIdentityProviderResponse _$TestIdentityProviderResponseFromJson(
    Map<String, dynamic> json) {
  return TestIdentityProviderResponse(
    statusCode: json['StatusCode'] as int,
    url: json['Url'] as String,
    message: json['Message'] as String,
    response: json['Response'] as String,
  );
}

Map<String, dynamic> _$UntagResourceRequestToJson(
    UntagResourceRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Arn', instance.arn);
  writeNotNull('TagKeys', instance.tagKeys);
  return val;
}

Map<String, dynamic> _$UpdateServerRequestToJson(UpdateServerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  writeNotNull('EndpointDetails', instance.endpointDetails?.toJson());
  writeNotNull('EndpointType', _$EndpointTypeEnumMap[instance.endpointType]);
  writeNotNull('HostKey', instance.hostKey);
  writeNotNull(
      'IdentityProviderDetails', instance.identityProviderDetails?.toJson());
  writeNotNull('LoggingRole', instance.loggingRole);
  return val;
}

UpdateServerResponse _$UpdateServerResponseFromJson(Map<String, dynamic> json) {
  return UpdateServerResponse(
    serverId: json['ServerId'] as String,
  );
}

Map<String, dynamic> _$UpdateUserRequestToJson(UpdateUserRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ServerId', instance.serverId);
  writeNotNull('UserName', instance.userName);
  writeNotNull('HomeDirectory', instance.homeDirectory);
  writeNotNull('HomeDirectoryMappings',
      instance.homeDirectoryMappings?.map((e) => e?.toJson())?.toList());
  writeNotNull('HomeDirectoryType',
      _$HomeDirectoryTypeEnumMap[instance.homeDirectoryType]);
  writeNotNull('Policy', instance.policy);
  writeNotNull('Role', instance.role);
  return val;
}

UpdateUserResponse _$UpdateUserResponseFromJson(Map<String, dynamic> json) {
  return UpdateUserResponse(
    serverId: json['ServerId'] as String,
    userName: json['UserName'] as String,
  );
}
