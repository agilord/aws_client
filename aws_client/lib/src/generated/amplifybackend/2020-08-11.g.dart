// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-08-11.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BackendAPIAppSyncAuthSettings _$BackendAPIAppSyncAuthSettingsFromJson(
    Map<String, dynamic> json) {
  return BackendAPIAppSyncAuthSettings(
    cognitoUserPoolId: json['cognitoUserPoolId'] as String,
    description: json['description'] as String,
    expirationTime: (json['expirationTime'] as num)?.toDouble(),
    openIDAuthTTL: json['openIDAuthTTL'] as String,
    openIDClientId: json['openIDClientId'] as String,
    openIDIatTTL: json['openIDIatTTL'] as String,
    openIDIssueURL: json['openIDIssueURL'] as String,
    openIDProviderName: json['openIDProviderName'] as String,
  );
}

Map<String, dynamic> _$BackendAPIAppSyncAuthSettingsToJson(
    BackendAPIAppSyncAuthSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('cognitoUserPoolId', instance.cognitoUserPoolId);
  writeNotNull('description', instance.description);
  writeNotNull('expirationTime', instance.expirationTime);
  writeNotNull('openIDAuthTTL', instance.openIDAuthTTL);
  writeNotNull('openIDClientId', instance.openIDClientId);
  writeNotNull('openIDIatTTL', instance.openIDIatTTL);
  writeNotNull('openIDIssueURL', instance.openIDIssueURL);
  writeNotNull('openIDProviderName', instance.openIDProviderName);
  return val;
}

BackendAPIAuthType _$BackendAPIAuthTypeFromJson(Map<String, dynamic> json) {
  return BackendAPIAuthType(
    mode: _$enumDecodeNullable(_$ModeEnumMap, json['mode']),
    settings: json['settings'] == null
        ? null
        : BackendAPIAppSyncAuthSettings.fromJson(
            json['settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$BackendAPIAuthTypeToJson(BackendAPIAuthType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mode', _$ModeEnumMap[instance.mode]);
  writeNotNull('settings', instance.settings?.toJson());
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

const _$ModeEnumMap = {
  Mode.apiKey: 'API_KEY',
  Mode.awsIam: 'AWS_IAM',
  Mode.amazonCognitoUserPools: 'AMAZON_COGNITO_USER_POOLS',
  Mode.openidConnect: 'OPENID_CONNECT',
};

BackendAPIConflictResolution _$BackendAPIConflictResolutionFromJson(
    Map<String, dynamic> json) {
  return BackendAPIConflictResolution(
    resolutionStrategy: _$enumDecodeNullable(
        _$ResolutionStrategyEnumMap, json['resolutionStrategy']),
  );
}

Map<String, dynamic> _$BackendAPIConflictResolutionToJson(
    BackendAPIConflictResolution instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('resolutionStrategy',
      _$ResolutionStrategyEnumMap[instance.resolutionStrategy]);
  return val;
}

const _$ResolutionStrategyEnumMap = {
  ResolutionStrategy.optimisticConcurrency: 'OPTIMISTIC_CONCURRENCY',
  ResolutionStrategy.lambda: 'LAMBDA',
  ResolutionStrategy.automerge: 'AUTOMERGE',
  ResolutionStrategy.none: 'NONE',
};

BackendAPIResourceConfig _$BackendAPIResourceConfigFromJson(
    Map<String, dynamic> json) {
  return BackendAPIResourceConfig(
    additionalAuthTypes: (json['additionalAuthTypes'] as List)
        ?.map((e) => e == null
            ? null
            : BackendAPIAuthType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    apiName: json['apiName'] as String,
    conflictResolution: json['conflictResolution'] == null
        ? null
        : BackendAPIConflictResolution.fromJson(
            json['conflictResolution'] as Map<String, dynamic>),
    defaultAuthType: json['defaultAuthType'] == null
        ? null
        : BackendAPIAuthType.fromJson(
            json['defaultAuthType'] as Map<String, dynamic>),
    service: json['service'] as String,
    transformSchema: json['transformSchema'] as String,
  );
}

Map<String, dynamic> _$BackendAPIResourceConfigToJson(
    BackendAPIResourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('additionalAuthTypes',
      instance.additionalAuthTypes?.map((e) => e?.toJson())?.toList());
  writeNotNull('apiName', instance.apiName);
  writeNotNull('conflictResolution', instance.conflictResolution?.toJson());
  writeNotNull('defaultAuthType', instance.defaultAuthType?.toJson());
  writeNotNull('service', instance.service);
  writeNotNull('transformSchema', instance.transformSchema);
  return val;
}

BackendAuthSocialProviderConfig _$BackendAuthSocialProviderConfigFromJson(
    Map<String, dynamic> json) {
  return BackendAuthSocialProviderConfig(
    clientId: json['client_id'] as String,
    clientSecret: json['client_secret'] as String,
  );
}

Map<String, dynamic> _$BackendAuthSocialProviderConfigToJson(
    BackendAuthSocialProviderConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('client_id', instance.clientId);
  writeNotNull('client_secret', instance.clientSecret);
  return val;
}

BackendJobRespObj _$BackendJobRespObjFromJson(Map<String, dynamic> json) {
  return BackendJobRespObj(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    createTime: json['createTime'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
    updateTime: json['updateTime'] as String,
  );
}

CloneBackendResponse _$CloneBackendResponseFromJson(Map<String, dynamic> json) {
  return CloneBackendResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

CreateBackendAPIResponse _$CreateBackendAPIResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBackendAPIResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

CreateBackendAuthForgotPasswordConfig
    _$CreateBackendAuthForgotPasswordConfigFromJson(Map<String, dynamic> json) {
  return CreateBackendAuthForgotPasswordConfig(
    deliveryMethod:
        _$enumDecodeNullable(_$DeliveryMethodEnumMap, json['deliveryMethod']),
    emailSettings: json['emailSettings'] == null
        ? null
        : EmailSettings.fromJson(json['emailSettings'] as Map<String, dynamic>),
    smsSettings: json['smsSettings'] == null
        ? null
        : SmsSettings.fromJson(json['smsSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBackendAuthForgotPasswordConfigToJson(
    CreateBackendAuthForgotPasswordConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'deliveryMethod', _$DeliveryMethodEnumMap[instance.deliveryMethod]);
  writeNotNull('emailSettings', instance.emailSettings?.toJson());
  writeNotNull('smsSettings', instance.smsSettings?.toJson());
  return val;
}

const _$DeliveryMethodEnumMap = {
  DeliveryMethod.email: 'EMAIL',
  DeliveryMethod.sms: 'SMS',
};

CreateBackendAuthIdentityPoolConfig
    _$CreateBackendAuthIdentityPoolConfigFromJson(Map<String, dynamic> json) {
  return CreateBackendAuthIdentityPoolConfig(
    identityPoolName: json['identityPoolName'] as String,
    unauthenticatedLogin: json['unauthenticatedLogin'] as bool,
  );
}

Map<String, dynamic> _$CreateBackendAuthIdentityPoolConfigToJson(
    CreateBackendAuthIdentityPoolConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('identityPoolName', instance.identityPoolName);
  writeNotNull('unauthenticatedLogin', instance.unauthenticatedLogin);
  return val;
}

CreateBackendAuthMFAConfig _$CreateBackendAuthMFAConfigFromJson(
    Map<String, dynamic> json) {
  return CreateBackendAuthMFAConfig(
    mFAMode: _$enumDecodeNullable(_$MFAModeEnumMap, json['MFAMode']),
    settings: json['settings'] == null
        ? null
        : Settings.fromJson(json['settings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBackendAuthMFAConfigToJson(
    CreateBackendAuthMFAConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MFAMode', _$MFAModeEnumMap[instance.mFAMode]);
  writeNotNull('settings', instance.settings?.toJson());
  return val;
}

const _$MFAModeEnumMap = {
  MFAMode.on: 'ON',
  MFAMode.off: 'OFF',
  MFAMode.optional: 'OPTIONAL',
};

CreateBackendAuthOAuthConfig _$CreateBackendAuthOAuthConfigFromJson(
    Map<String, dynamic> json) {
  return CreateBackendAuthOAuthConfig(
    oAuthGrantType:
        _$enumDecodeNullable(_$OAuthGrantTypeEnumMap, json['oAuthGrantType']),
    oAuthScopes: (json['oAuthScopes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$OAuthScopesElementEnumMap, e))
        ?.toList(),
    redirectSignInURIs:
        (json['redirectSignInURIs'] as List)?.map((e) => e as String)?.toList(),
    redirectSignOutURIs: (json['redirectSignOutURIs'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    domainPrefix: json['domainPrefix'] as String,
    socialProviderSettings: json['socialProviderSettings'] == null
        ? null
        : SocialProviderSettings.fromJson(
            json['socialProviderSettings'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBackendAuthOAuthConfigToJson(
    CreateBackendAuthOAuthConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'oAuthGrantType', _$OAuthGrantTypeEnumMap[instance.oAuthGrantType]);
  writeNotNull(
      'oAuthScopes',
      instance.oAuthScopes
          ?.map((e) => _$OAuthScopesElementEnumMap[e])
          ?.toList());
  writeNotNull('redirectSignInURIs', instance.redirectSignInURIs);
  writeNotNull('redirectSignOutURIs', instance.redirectSignOutURIs);
  writeNotNull('domainPrefix', instance.domainPrefix);
  writeNotNull(
      'socialProviderSettings', instance.socialProviderSettings?.toJson());
  return val;
}

const _$OAuthGrantTypeEnumMap = {
  OAuthGrantType.code: 'CODE',
  OAuthGrantType.implicit: 'IMPLICIT',
};

const _$OAuthScopesElementEnumMap = {
  OAuthScopesElement.phone: 'PHONE',
  OAuthScopesElement.email: 'EMAIL',
  OAuthScopesElement.openid: 'OPENID',
  OAuthScopesElement.profile: 'PROFILE',
  OAuthScopesElement.awsCognitoSigninUserAdmin: 'AWS_COGNITO_SIGNIN_USER_ADMIN',
};

CreateBackendAuthPasswordPolicyConfig
    _$CreateBackendAuthPasswordPolicyConfigFromJson(Map<String, dynamic> json) {
  return CreateBackendAuthPasswordPolicyConfig(
    minimumLength: (json['minimumLength'] as num)?.toDouble(),
    additionalConstraints: (json['additionalConstraints'] as List)
        ?.map((e) =>
            _$enumDecodeNullable(_$AdditionalConstraintsElementEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$CreateBackendAuthPasswordPolicyConfigToJson(
    CreateBackendAuthPasswordPolicyConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('minimumLength', instance.minimumLength);
  writeNotNull(
      'additionalConstraints',
      instance.additionalConstraints
          ?.map((e) => _$AdditionalConstraintsElementEnumMap[e])
          ?.toList());
  return val;
}

const _$AdditionalConstraintsElementEnumMap = {
  AdditionalConstraintsElement.requireDigit: 'REQUIRE_DIGIT',
  AdditionalConstraintsElement.requireLowercase: 'REQUIRE_LOWERCASE',
  AdditionalConstraintsElement.requireSymbol: 'REQUIRE_SYMBOL',
  AdditionalConstraintsElement.requireUppercase: 'REQUIRE_UPPERCASE',
};

CreateBackendAuthResourceConfig _$CreateBackendAuthResourceConfigFromJson(
    Map<String, dynamic> json) {
  return CreateBackendAuthResourceConfig(
    authResources:
        _$enumDecodeNullable(_$AuthResourcesEnumMap, json['authResources']),
    service: _$enumDecodeNullable(_$ServiceEnumMap, json['service']),
    userPoolConfigs: json['userPoolConfigs'] == null
        ? null
        : CreateBackendAuthUserPoolConfig.fromJson(
            json['userPoolConfigs'] as Map<String, dynamic>),
    identityPoolConfigs: json['identityPoolConfigs'] == null
        ? null
        : CreateBackendAuthIdentityPoolConfig.fromJson(
            json['identityPoolConfigs'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBackendAuthResourceConfigToJson(
    CreateBackendAuthResourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authResources', _$AuthResourcesEnumMap[instance.authResources]);
  writeNotNull('service', _$ServiceEnumMap[instance.service]);
  writeNotNull('userPoolConfigs', instance.userPoolConfigs?.toJson());
  writeNotNull('identityPoolConfigs', instance.identityPoolConfigs?.toJson());
  return val;
}

const _$AuthResourcesEnumMap = {
  AuthResources.userPoolOnly: 'USER_POOL_ONLY',
  AuthResources.identityPoolAndUserPool: 'IDENTITY_POOL_AND_USER_POOL',
};

const _$ServiceEnumMap = {
  Service.cognito: 'COGNITO',
};

CreateBackendAuthResponse _$CreateBackendAuthResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBackendAuthResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

CreateBackendAuthUserPoolConfig _$CreateBackendAuthUserPoolConfigFromJson(
    Map<String, dynamic> json) {
  return CreateBackendAuthUserPoolConfig(
    requiredSignUpAttributes: (json['requiredSignUpAttributes'] as List)
        ?.map((e) =>
            _$enumDecodeNullable(_$RequiredSignUpAttributesElementEnumMap, e))
        ?.toList(),
    signInMethod:
        _$enumDecodeNullable(_$SignInMethodEnumMap, json['signInMethod']),
    userPoolName: json['userPoolName'] as String,
    forgotPassword: json['forgotPassword'] == null
        ? null
        : CreateBackendAuthForgotPasswordConfig.fromJson(
            json['forgotPassword'] as Map<String, dynamic>),
    mfa: json['mfa'] == null
        ? null
        : CreateBackendAuthMFAConfig.fromJson(
            json['mfa'] as Map<String, dynamic>),
    oAuth: json['oAuth'] == null
        ? null
        : CreateBackendAuthOAuthConfig.fromJson(
            json['oAuth'] as Map<String, dynamic>),
    passwordPolicy: json['passwordPolicy'] == null
        ? null
        : CreateBackendAuthPasswordPolicyConfig.fromJson(
            json['passwordPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CreateBackendAuthUserPoolConfigToJson(
    CreateBackendAuthUserPoolConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'requiredSignUpAttributes',
      instance.requiredSignUpAttributes
          ?.map((e) => _$RequiredSignUpAttributesElementEnumMap[e])
          ?.toList());
  writeNotNull('signInMethod', _$SignInMethodEnumMap[instance.signInMethod]);
  writeNotNull('userPoolName', instance.userPoolName);
  writeNotNull('forgotPassword', instance.forgotPassword?.toJson());
  writeNotNull('mfa', instance.mfa?.toJson());
  writeNotNull('oAuth', instance.oAuth?.toJson());
  writeNotNull('passwordPolicy', instance.passwordPolicy?.toJson());
  return val;
}

const _$RequiredSignUpAttributesElementEnumMap = {
  RequiredSignUpAttributesElement.address: 'ADDRESS',
  RequiredSignUpAttributesElement.birthdate: 'BIRTHDATE',
  RequiredSignUpAttributesElement.email: 'EMAIL',
  RequiredSignUpAttributesElement.familyName: 'FAMILY_NAME',
  RequiredSignUpAttributesElement.gender: 'GENDER',
  RequiredSignUpAttributesElement.givenName: 'GIVEN_NAME',
  RequiredSignUpAttributesElement.locale: 'LOCALE',
  RequiredSignUpAttributesElement.middleName: 'MIDDLE_NAME',
  RequiredSignUpAttributesElement.name: 'NAME',
  RequiredSignUpAttributesElement.nickname: 'NICKNAME',
  RequiredSignUpAttributesElement.phoneNumber: 'PHONE_NUMBER',
  RequiredSignUpAttributesElement.picture: 'PICTURE',
  RequiredSignUpAttributesElement.preferredUsername: 'PREFERRED_USERNAME',
  RequiredSignUpAttributesElement.profile: 'PROFILE',
  RequiredSignUpAttributesElement.updatedAt: 'UPDATED_AT',
  RequiredSignUpAttributesElement.website: 'WEBSITE',
  RequiredSignUpAttributesElement.zoneInfo: 'ZONE_INFO',
};

const _$SignInMethodEnumMap = {
  SignInMethod.email: 'EMAIL',
  SignInMethod.emailAndPhoneNumber: 'EMAIL_AND_PHONE_NUMBER',
  SignInMethod.phoneNumber: 'PHONE_NUMBER',
  SignInMethod.username: 'USERNAME',
};

CreateBackendConfigResponse _$CreateBackendConfigResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBackendConfigResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    jobId: json['jobId'] as String,
    status: json['status'] as String,
  );
}

CreateBackendResponse _$CreateBackendResponseFromJson(
    Map<String, dynamic> json) {
  return CreateBackendResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

CreateTokenResponse _$CreateTokenResponseFromJson(Map<String, dynamic> json) {
  return CreateTokenResponse(
    appId: json['appId'] as String,
    challengeCode: json['challengeCode'] as String,
    sessionId: json['sessionId'] as String,
    ttl: json['ttl'] as String,
  );
}

DeleteBackendAPIResponse _$DeleteBackendAPIResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteBackendAPIResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

DeleteBackendAuthResponse _$DeleteBackendAuthResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteBackendAuthResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

DeleteBackendResponse _$DeleteBackendResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteBackendResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

DeleteTokenResponse _$DeleteTokenResponseFromJson(Map<String, dynamic> json) {
  return DeleteTokenResponse(
    isSuccess: json['isSuccess'] as bool,
  );
}

EmailSettings _$EmailSettingsFromJson(Map<String, dynamic> json) {
  return EmailSettings(
    emailMessage: json['emailMessage'] as String,
    emailSubject: json['emailSubject'] as String,
  );
}

Map<String, dynamic> _$EmailSettingsToJson(EmailSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('emailMessage', instance.emailMessage);
  writeNotNull('emailSubject', instance.emailSubject);
  return val;
}

GenerateBackendAPIModelsResponse _$GenerateBackendAPIModelsResponseFromJson(
    Map<String, dynamic> json) {
  return GenerateBackendAPIModelsResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

GetBackendAPIModelsResponse _$GetBackendAPIModelsResponseFromJson(
    Map<String, dynamic> json) {
  return GetBackendAPIModelsResponse(
    models: json['models'] as String,
    status: _$enumDecodeNullable(_$StatusEnumMap, json['status']),
  );
}

const _$StatusEnumMap = {
  Status.latest: 'LATEST',
  Status.stale: 'STALE',
};

GetBackendAPIResponse _$GetBackendAPIResponseFromJson(
    Map<String, dynamic> json) {
  return GetBackendAPIResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    resourceConfig: json['resourceConfig'] == null
        ? null
        : BackendAPIResourceConfig.fromJson(
            json['resourceConfig'] as Map<String, dynamic>),
    resourceName: json['resourceName'] as String,
  );
}

GetBackendAuthResponse _$GetBackendAuthResponseFromJson(
    Map<String, dynamic> json) {
  return GetBackendAuthResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    resourceConfig: json['resourceConfig'] == null
        ? null
        : CreateBackendAuthResourceConfig.fromJson(
            json['resourceConfig'] as Map<String, dynamic>),
    resourceName: json['resourceName'] as String,
  );
}

GetBackendJobResponse _$GetBackendJobResponseFromJson(
    Map<String, dynamic> json) {
  return GetBackendJobResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    createTime: json['createTime'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
    updateTime: json['updateTime'] as String,
  );
}

GetBackendResponse _$GetBackendResponseFromJson(Map<String, dynamic> json) {
  return GetBackendResponse(
    amplifyMetaConfig: json['amplifyMetaConfig'] as String,
    appId: json['appId'] as String,
    appName: json['appName'] as String,
    backendEnvironmentList: (json['backendEnvironmentList'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
  );
}

GetTokenResponse _$GetTokenResponseFromJson(Map<String, dynamic> json) {
  return GetTokenResponse(
    appId: json['appId'] as String,
    challengeCode: json['challengeCode'] as String,
    sessionId: json['sessionId'] as String,
    ttl: json['ttl'] as String,
  );
}

ListBackendJobsResponse _$ListBackendJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListBackendJobsResponse(
    jobs: (json['jobs'] as List)
        ?.map((e) => e == null
            ? null
            : BackendJobRespObj.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['nextToken'] as String,
  );
}

LoginAuthConfigReqObj _$LoginAuthConfigReqObjFromJson(
    Map<String, dynamic> json) {
  return LoginAuthConfigReqObj(
    awsCognitoIdentityPoolId: json['aws_cognito_identity_pool_id'] as String,
    awsCognitoRegion: json['aws_cognito_region'] as String,
    awsUserPoolsId: json['aws_user_pools_id'] as String,
    awsUserPoolsWebClientId: json['aws_user_pools_web_client_id'] as String,
  );
}

Map<String, dynamic> _$LoginAuthConfigReqObjToJson(
    LoginAuthConfigReqObj instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'aws_cognito_identity_pool_id', instance.awsCognitoIdentityPoolId);
  writeNotNull('aws_cognito_region', instance.awsCognitoRegion);
  writeNotNull('aws_user_pools_id', instance.awsUserPoolsId);
  writeNotNull(
      'aws_user_pools_web_client_id', instance.awsUserPoolsWebClientId);
  return val;
}

RemoveAllBackendsResponse _$RemoveAllBackendsResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveAllBackendsResponse(
    appId: json['appId'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

RemoveBackendConfigResponse _$RemoveBackendConfigResponseFromJson(
    Map<String, dynamic> json) {
  return RemoveBackendConfigResponse(
    error: json['error'] as String,
  );
}

Map<String, dynamic> _$ResourceConfigToJson(ResourceConfig instance) =>
    <String, dynamic>{};

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return Settings(
    mfaTypes: (json['mfaTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$MfaTypesElementEnumMap, e))
        ?.toList(),
    smsMessage: json['smsMessage'] as String,
  );
}

Map<String, dynamic> _$SettingsToJson(Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('mfaTypes',
      instance.mfaTypes?.map((e) => _$MfaTypesElementEnumMap[e])?.toList());
  writeNotNull('smsMessage', instance.smsMessage);
  return val;
}

const _$MfaTypesElementEnumMap = {
  MfaTypesElement.sms: 'SMS',
  MfaTypesElement.totp: 'TOTP',
};

SmsSettings _$SmsSettingsFromJson(Map<String, dynamic> json) {
  return SmsSettings(
    smsMessage: json['smsMessage'] as String,
  );
}

Map<String, dynamic> _$SmsSettingsToJson(SmsSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('smsMessage', instance.smsMessage);
  return val;
}

SocialProviderSettings _$SocialProviderSettingsFromJson(
    Map<String, dynamic> json) {
  return SocialProviderSettings(
    facebook: json['Facebook'] == null
        ? null
        : BackendAuthSocialProviderConfig.fromJson(
            json['Facebook'] as Map<String, dynamic>),
    google: json['Google'] == null
        ? null
        : BackendAuthSocialProviderConfig.fromJson(
            json['Google'] as Map<String, dynamic>),
    loginWithAmazon: json['LoginWithAmazon'] == null
        ? null
        : BackendAuthSocialProviderConfig.fromJson(
            json['LoginWithAmazon'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SocialProviderSettingsToJson(
    SocialProviderSettings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Facebook', instance.facebook?.toJson());
  writeNotNull('Google', instance.google?.toJson());
  writeNotNull('LoginWithAmazon', instance.loginWithAmazon?.toJson());
  return val;
}

UpdateBackendAPIResponse _$UpdateBackendAPIResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBackendAPIResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$UpdateBackendAuthForgotPasswordConfigToJson(
    UpdateBackendAuthForgotPasswordConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'deliveryMethod', _$DeliveryMethodEnumMap[instance.deliveryMethod]);
  writeNotNull('emailSettings', instance.emailSettings?.toJson());
  writeNotNull('smsSettings', instance.smsSettings?.toJson());
  return val;
}

Map<String, dynamic> _$UpdateBackendAuthIdentityPoolConfigToJson(
    UpdateBackendAuthIdentityPoolConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('unauthenticatedLogin', instance.unauthenticatedLogin);
  return val;
}

Map<String, dynamic> _$UpdateBackendAuthMFAConfigToJson(
    UpdateBackendAuthMFAConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MFAMode', _$MFAModeEnumMap[instance.mFAMode]);
  writeNotNull('settings', instance.settings?.toJson());
  return val;
}

Map<String, dynamic> _$UpdateBackendAuthOAuthConfigToJson(
    UpdateBackendAuthOAuthConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('domainPrefix', instance.domainPrefix);
  writeNotNull(
      'oAuthGrantType', _$OAuthGrantTypeEnumMap[instance.oAuthGrantType]);
  writeNotNull(
      'oAuthScopes',
      instance.oAuthScopes
          ?.map((e) => _$OAuthScopesElementEnumMap[e])
          ?.toList());
  writeNotNull('redirectSignInURIs', instance.redirectSignInURIs);
  writeNotNull('redirectSignOutURIs', instance.redirectSignOutURIs);
  writeNotNull(
      'socialProviderSettings', instance.socialProviderSettings?.toJson());
  return val;
}

Map<String, dynamic> _$UpdateBackendAuthPasswordPolicyConfigToJson(
    UpdateBackendAuthPasswordPolicyConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'additionalConstraints',
      instance.additionalConstraints
          ?.map((e) => _$AdditionalConstraintsElementEnumMap[e])
          ?.toList());
  writeNotNull('minimumLength', instance.minimumLength);
  return val;
}

Map<String, dynamic> _$UpdateBackendAuthResourceConfigToJson(
    UpdateBackendAuthResourceConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('authResources', _$AuthResourcesEnumMap[instance.authResources]);
  writeNotNull('service', _$ServiceEnumMap[instance.service]);
  writeNotNull('userPoolConfigs', instance.userPoolConfigs?.toJson());
  writeNotNull('identityPoolConfigs', instance.identityPoolConfigs?.toJson());
  return val;
}

UpdateBackendAuthResponse _$UpdateBackendAuthResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBackendAuthResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$UpdateBackendAuthUserPoolConfigToJson(
    UpdateBackendAuthUserPoolConfig instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('forgotPassword', instance.forgotPassword?.toJson());
  writeNotNull('mfa', instance.mfa?.toJson());
  writeNotNull('oAuth', instance.oAuth?.toJson());
  writeNotNull('passwordPolicy', instance.passwordPolicy?.toJson());
  return val;
}

UpdateBackendConfigResponse _$UpdateBackendConfigResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBackendConfigResponse(
    appId: json['appId'] as String,
    backendManagerAppId: json['backendManagerAppId'] as String,
    error: json['error'] as String,
    loginAuthConfig: json['loginAuthConfig'] == null
        ? null
        : LoginAuthConfigReqObj.fromJson(
            json['loginAuthConfig'] as Map<String, dynamic>),
  );
}

UpdateBackendJobResponse _$UpdateBackendJobResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateBackendJobResponse(
    appId: json['appId'] as String,
    backendEnvironmentName: json['backendEnvironmentName'] as String,
    createTime: json['createTime'] as String,
    error: json['error'] as String,
    jobId: json['jobId'] as String,
    operation: json['operation'] as String,
    status: json['status'] as String,
    updateTime: json['updateTime'] as String,
  );
}
