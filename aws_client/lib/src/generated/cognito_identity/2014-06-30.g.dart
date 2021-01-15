// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2014-06-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CognitoIdentityProvider _$CognitoIdentityProviderFromJson(
    Map<String, dynamic> json) {
  return CognitoIdentityProvider(
    clientId: json['ClientId'] as String,
    providerName: json['ProviderName'] as String,
    serverSideTokenCheck: json['ServerSideTokenCheck'] as bool,
  );
}

Map<String, dynamic> _$CognitoIdentityProviderToJson(
    CognitoIdentityProvider instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ClientId', instance.clientId);
  writeNotNull('ProviderName', instance.providerName);
  writeNotNull('ServerSideTokenCheck', instance.serverSideTokenCheck);
  return val;
}

Credentials _$CredentialsFromJson(Map<String, dynamic> json) {
  return Credentials(
    accessKeyId: json['AccessKeyId'] as String,
    expiration: const UnixDateTimeConverter().fromJson(json['Expiration']),
    secretKey: json['SecretKey'] as String,
    sessionToken: json['SessionToken'] as String,
  );
}

DeleteIdentitiesResponse _$DeleteIdentitiesResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteIdentitiesResponse(
    unprocessedIdentityIds: (json['UnprocessedIdentityIds'] as List)
        ?.map((e) => e == null
            ? null
            : UnprocessedIdentityId.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

GetCredentialsForIdentityResponse _$GetCredentialsForIdentityResponseFromJson(
    Map<String, dynamic> json) {
  return GetCredentialsForIdentityResponse(
    credentials: json['Credentials'] == null
        ? null
        : Credentials.fromJson(json['Credentials'] as Map<String, dynamic>),
    identityId: json['IdentityId'] as String,
  );
}

GetIdResponse _$GetIdResponseFromJson(Map<String, dynamic> json) {
  return GetIdResponse(
    identityId: json['IdentityId'] as String,
  );
}

GetIdentityPoolRolesResponse _$GetIdentityPoolRolesResponseFromJson(
    Map<String, dynamic> json) {
  return GetIdentityPoolRolesResponse(
    identityPoolId: json['IdentityPoolId'] as String,
    roleMappings: (json['RoleMappings'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k,
          e == null ? null : RoleMapping.fromJson(e as Map<String, dynamic>)),
    ),
    roles: (json['Roles'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

GetOpenIdTokenForDeveloperIdentityResponse
    _$GetOpenIdTokenForDeveloperIdentityResponseFromJson(
        Map<String, dynamic> json) {
  return GetOpenIdTokenForDeveloperIdentityResponse(
    identityId: json['IdentityId'] as String,
    token: json['Token'] as String,
  );
}

GetOpenIdTokenResponse _$GetOpenIdTokenResponseFromJson(
    Map<String, dynamic> json) {
  return GetOpenIdTokenResponse(
    identityId: json['IdentityId'] as String,
    token: json['Token'] as String,
  );
}

IdentityDescription _$IdentityDescriptionFromJson(Map<String, dynamic> json) {
  return IdentityDescription(
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    identityId: json['IdentityId'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    logins: (json['Logins'] as List)?.map((e) => e as String)?.toList(),
  );
}

IdentityPool _$IdentityPoolFromJson(Map<String, dynamic> json) {
  return IdentityPool(
    allowUnauthenticatedIdentities:
        json['AllowUnauthenticatedIdentities'] as bool,
    identityPoolId: json['IdentityPoolId'] as String,
    identityPoolName: json['IdentityPoolName'] as String,
    allowClassicFlow: json['AllowClassicFlow'] as bool,
    cognitoIdentityProviders: (json['CognitoIdentityProviders'] as List)
        ?.map((e) => e == null
            ? null
            : CognitoIdentityProvider.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    developerProviderName: json['DeveloperProviderName'] as String,
    identityPoolTags: (json['IdentityPoolTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    openIdConnectProviderARNs: (json['OpenIdConnectProviderARNs'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    samlProviderARNs:
        (json['SamlProviderARNs'] as List)?.map((e) => e as String)?.toList(),
    supportedLoginProviders:
        (json['SupportedLoginProviders'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

IdentityPoolShortDescription _$IdentityPoolShortDescriptionFromJson(
    Map<String, dynamic> json) {
  return IdentityPoolShortDescription(
    identityPoolId: json['IdentityPoolId'] as String,
    identityPoolName: json['IdentityPoolName'] as String,
  );
}

ListIdentitiesResponse _$ListIdentitiesResponseFromJson(
    Map<String, dynamic> json) {
  return ListIdentitiesResponse(
    identities: (json['Identities'] as List)
        ?.map((e) => e == null
            ? null
            : IdentityDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    identityPoolId: json['IdentityPoolId'] as String,
    nextToken: json['NextToken'] as String,
  );
}

ListIdentityPoolsResponse _$ListIdentityPoolsResponseFromJson(
    Map<String, dynamic> json) {
  return ListIdentityPoolsResponse(
    identityPools: (json['IdentityPools'] as List)
        ?.map((e) => e == null
            ? null
            : IdentityPoolShortDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['Tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

LookupDeveloperIdentityResponse _$LookupDeveloperIdentityResponseFromJson(
    Map<String, dynamic> json) {
  return LookupDeveloperIdentityResponse(
    developerUserIdentifierList: (json['DeveloperUserIdentifierList'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    identityId: json['IdentityId'] as String,
    nextToken: json['NextToken'] as String,
  );
}

MappingRule _$MappingRuleFromJson(Map<String, dynamic> json) {
  return MappingRule(
    claim: json['Claim'] as String,
    matchType:
        _$enumDecodeNullable(_$MappingRuleMatchTypeEnumMap, json['MatchType']),
    roleARN: json['RoleARN'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$MappingRuleToJson(MappingRule instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Claim', instance.claim);
  writeNotNull('MatchType', _$MappingRuleMatchTypeEnumMap[instance.matchType]);
  writeNotNull('RoleARN', instance.roleARN);
  writeNotNull('Value', instance.value);
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

const _$MappingRuleMatchTypeEnumMap = {
  MappingRuleMatchType.equals: 'Equals',
  MappingRuleMatchType.contains: 'Contains',
  MappingRuleMatchType.startsWith: 'StartsWith',
  MappingRuleMatchType.notEqual: 'NotEqual',
};

MergeDeveloperIdentitiesResponse _$MergeDeveloperIdentitiesResponseFromJson(
    Map<String, dynamic> json) {
  return MergeDeveloperIdentitiesResponse(
    identityId: json['IdentityId'] as String,
  );
}

RoleMapping _$RoleMappingFromJson(Map<String, dynamic> json) {
  return RoleMapping(
    type: _$enumDecodeNullable(_$RoleMappingTypeEnumMap, json['Type']),
    ambiguousRoleResolution: _$enumDecodeNullable(
        _$AmbiguousRoleResolutionTypeEnumMap, json['AmbiguousRoleResolution']),
    rulesConfiguration: json['RulesConfiguration'] == null
        ? null
        : RulesConfigurationType.fromJson(
            json['RulesConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$RoleMappingToJson(RoleMapping instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$RoleMappingTypeEnumMap[instance.type]);
  writeNotNull('AmbiguousRoleResolution',
      _$AmbiguousRoleResolutionTypeEnumMap[instance.ambiguousRoleResolution]);
  writeNotNull('RulesConfiguration', instance.rulesConfiguration?.toJson());
  return val;
}

const _$RoleMappingTypeEnumMap = {
  RoleMappingType.token: 'Token',
  RoleMappingType.rules: 'Rules',
};

const _$AmbiguousRoleResolutionTypeEnumMap = {
  AmbiguousRoleResolutionType.authenticatedRole: 'AuthenticatedRole',
  AmbiguousRoleResolutionType.deny: 'Deny',
};

RulesConfigurationType _$RulesConfigurationTypeFromJson(
    Map<String, dynamic> json) {
  return RulesConfigurationType(
    rules: (json['Rules'] as List)
        ?.map((e) =>
            e == null ? null : MappingRule.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$RulesConfigurationTypeToJson(
    RulesConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Rules', instance.rules?.map((e) => e?.toJson())?.toList());
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UnprocessedIdentityId _$UnprocessedIdentityIdFromJson(
    Map<String, dynamic> json) {
  return UnprocessedIdentityId(
    errorCode: _$enumDecodeNullable(_$ErrorCodeEnumMap, json['ErrorCode']),
    identityId: json['IdentityId'] as String,
  );
}

const _$ErrorCodeEnumMap = {
  ErrorCode.accessDenied: 'AccessDenied',
  ErrorCode.internalServerError: 'InternalServerError',
};

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
