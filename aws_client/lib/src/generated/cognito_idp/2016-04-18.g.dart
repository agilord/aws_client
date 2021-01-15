// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-04-18.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountRecoverySettingType _$AccountRecoverySettingTypeFromJson(
    Map<String, dynamic> json) {
  return AccountRecoverySettingType(
    recoveryMechanisms: (json['RecoveryMechanisms'] as List)
        ?.map((e) => e == null
            ? null
            : RecoveryOptionType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AccountRecoverySettingTypeToJson(
    AccountRecoverySettingType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RecoveryMechanisms',
      instance.recoveryMechanisms?.map((e) => e?.toJson())?.toList());
  return val;
}

AccountTakeoverActionType _$AccountTakeoverActionTypeFromJson(
    Map<String, dynamic> json) {
  return AccountTakeoverActionType(
    eventAction: _$enumDecodeNullable(
        _$AccountTakeoverEventActionTypeEnumMap, json['EventAction']),
    notify: json['Notify'] as bool,
  );
}

Map<String, dynamic> _$AccountTakeoverActionTypeToJson(
    AccountTakeoverActionType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventAction',
      _$AccountTakeoverEventActionTypeEnumMap[instance.eventAction]);
  writeNotNull('Notify', instance.notify);
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

const _$AccountTakeoverEventActionTypeEnumMap = {
  AccountTakeoverEventActionType.block: 'BLOCK',
  AccountTakeoverEventActionType.mfaIfConfigured: 'MFA_IF_CONFIGURED',
  AccountTakeoverEventActionType.mfaRequired: 'MFA_REQUIRED',
  AccountTakeoverEventActionType.noAction: 'NO_ACTION',
};

AccountTakeoverActionsType _$AccountTakeoverActionsTypeFromJson(
    Map<String, dynamic> json) {
  return AccountTakeoverActionsType(
    highAction: json['HighAction'] == null
        ? null
        : AccountTakeoverActionType.fromJson(
            json['HighAction'] as Map<String, dynamic>),
    lowAction: json['LowAction'] == null
        ? null
        : AccountTakeoverActionType.fromJson(
            json['LowAction'] as Map<String, dynamic>),
    mediumAction: json['MediumAction'] == null
        ? null
        : AccountTakeoverActionType.fromJson(
            json['MediumAction'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountTakeoverActionsTypeToJson(
    AccountTakeoverActionsType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('HighAction', instance.highAction?.toJson());
  writeNotNull('LowAction', instance.lowAction?.toJson());
  writeNotNull('MediumAction', instance.mediumAction?.toJson());
  return val;
}

AccountTakeoverRiskConfigurationType
    _$AccountTakeoverRiskConfigurationTypeFromJson(Map<String, dynamic> json) {
  return AccountTakeoverRiskConfigurationType(
    actions: json['Actions'] == null
        ? null
        : AccountTakeoverActionsType.fromJson(
            json['Actions'] as Map<String, dynamic>),
    notifyConfiguration: json['NotifyConfiguration'] == null
        ? null
        : NotifyConfigurationType.fromJson(
            json['NotifyConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountTakeoverRiskConfigurationTypeToJson(
    AccountTakeoverRiskConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions?.toJson());
  writeNotNull('NotifyConfiguration', instance.notifyConfiguration?.toJson());
  return val;
}

AddCustomAttributesResponse _$AddCustomAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return AddCustomAttributesResponse();
}

AdminConfirmSignUpResponse _$AdminConfirmSignUpResponseFromJson(
    Map<String, dynamic> json) {
  return AdminConfirmSignUpResponse();
}

AdminCreateUserConfigType _$AdminCreateUserConfigTypeFromJson(
    Map<String, dynamic> json) {
  return AdminCreateUserConfigType(
    allowAdminCreateUserOnly: json['AllowAdminCreateUserOnly'] as bool,
    inviteMessageTemplate: json['InviteMessageTemplate'] == null
        ? null
        : MessageTemplateType.fromJson(
            json['InviteMessageTemplate'] as Map<String, dynamic>),
    unusedAccountValidityDays: json['UnusedAccountValidityDays'] as int,
  );
}

Map<String, dynamic> _$AdminCreateUserConfigTypeToJson(
    AdminCreateUserConfigType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllowAdminCreateUserOnly', instance.allowAdminCreateUserOnly);
  writeNotNull(
      'InviteMessageTemplate', instance.inviteMessageTemplate?.toJson());
  writeNotNull('UnusedAccountValidityDays', instance.unusedAccountValidityDays);
  return val;
}

AdminCreateUserResponse _$AdminCreateUserResponseFromJson(
    Map<String, dynamic> json) {
  return AdminCreateUserResponse(
    user: json['User'] == null
        ? null
        : UserType.fromJson(json['User'] as Map<String, dynamic>),
  );
}

AdminDeleteUserAttributesResponse _$AdminDeleteUserAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return AdminDeleteUserAttributesResponse();
}

AdminDisableProviderForUserResponse
    _$AdminDisableProviderForUserResponseFromJson(Map<String, dynamic> json) {
  return AdminDisableProviderForUserResponse();
}

AdminDisableUserResponse _$AdminDisableUserResponseFromJson(
    Map<String, dynamic> json) {
  return AdminDisableUserResponse();
}

AdminEnableUserResponse _$AdminEnableUserResponseFromJson(
    Map<String, dynamic> json) {
  return AdminEnableUserResponse();
}

AdminGetDeviceResponse _$AdminGetDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return AdminGetDeviceResponse(
    device: json['Device'] == null
        ? null
        : DeviceType.fromJson(json['Device'] as Map<String, dynamic>),
  );
}

AdminGetUserResponse _$AdminGetUserResponseFromJson(Map<String, dynamic> json) {
  return AdminGetUserResponse(
    username: json['Username'] as String,
    enabled: json['Enabled'] as bool,
    mFAOptions: (json['MFAOptions'] as List)
        ?.map((e) => e == null
            ? null
            : MFAOptionType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    preferredMfaSetting: json['PreferredMfaSetting'] as String,
    userAttributes: (json['UserAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userCreateDate:
        const UnixDateTimeConverter().fromJson(json['UserCreateDate']),
    userLastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['UserLastModifiedDate']),
    userMFASettingList:
        (json['UserMFASettingList'] as List)?.map((e) => e as String)?.toList(),
    userStatus:
        _$enumDecodeNullable(_$UserStatusTypeEnumMap, json['UserStatus']),
  );
}

const _$UserStatusTypeEnumMap = {
  UserStatusType.unconfirmed: 'UNCONFIRMED',
  UserStatusType.confirmed: 'CONFIRMED',
  UserStatusType.archived: 'ARCHIVED',
  UserStatusType.compromised: 'COMPROMISED',
  UserStatusType.unknown: 'UNKNOWN',
  UserStatusType.resetRequired: 'RESET_REQUIRED',
  UserStatusType.forceChangePassword: 'FORCE_CHANGE_PASSWORD',
};

AdminInitiateAuthResponse _$AdminInitiateAuthResponseFromJson(
    Map<String, dynamic> json) {
  return AdminInitiateAuthResponse(
    authenticationResult: json['AuthenticationResult'] == null
        ? null
        : AuthenticationResultType.fromJson(
            json['AuthenticationResult'] as Map<String, dynamic>),
    challengeName:
        _$enumDecodeNullable(_$ChallengeNameTypeEnumMap, json['ChallengeName']),
    challengeParameters:
        (json['ChallengeParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    session: json['Session'] as String,
  );
}

const _$ChallengeNameTypeEnumMap = {
  ChallengeNameType.smsMfa: 'SMS_MFA',
  ChallengeNameType.softwareTokenMfa: 'SOFTWARE_TOKEN_MFA',
  ChallengeNameType.selectMfaType: 'SELECT_MFA_TYPE',
  ChallengeNameType.mfaSetup: 'MFA_SETUP',
  ChallengeNameType.passwordVerifier: 'PASSWORD_VERIFIER',
  ChallengeNameType.customChallenge: 'CUSTOM_CHALLENGE',
  ChallengeNameType.deviceSrpAuth: 'DEVICE_SRP_AUTH',
  ChallengeNameType.devicePasswordVerifier: 'DEVICE_PASSWORD_VERIFIER',
  ChallengeNameType.adminNoSrpAuth: 'ADMIN_NO_SRP_AUTH',
  ChallengeNameType.newPasswordRequired: 'NEW_PASSWORD_REQUIRED',
};

AdminLinkProviderForUserResponse _$AdminLinkProviderForUserResponseFromJson(
    Map<String, dynamic> json) {
  return AdminLinkProviderForUserResponse();
}

AdminListDevicesResponse _$AdminListDevicesResponseFromJson(
    Map<String, dynamic> json) {
  return AdminListDevicesResponse(
    devices: (json['Devices'] as List)
        ?.map((e) =>
            e == null ? null : DeviceType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    paginationToken: json['PaginationToken'] as String,
  );
}

AdminListGroupsForUserResponse _$AdminListGroupsForUserResponseFromJson(
    Map<String, dynamic> json) {
  return AdminListGroupsForUserResponse(
    groups: (json['Groups'] as List)
        ?.map((e) =>
            e == null ? null : GroupType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

AdminListUserAuthEventsResponse _$AdminListUserAuthEventsResponseFromJson(
    Map<String, dynamic> json) {
  return AdminListUserAuthEventsResponse(
    authEvents: (json['AuthEvents'] as List)
        ?.map((e) => e == null
            ? null
            : AuthEventType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

AdminResetUserPasswordResponse _$AdminResetUserPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return AdminResetUserPasswordResponse();
}

AdminRespondToAuthChallengeResponse
    _$AdminRespondToAuthChallengeResponseFromJson(Map<String, dynamic> json) {
  return AdminRespondToAuthChallengeResponse(
    authenticationResult: json['AuthenticationResult'] == null
        ? null
        : AuthenticationResultType.fromJson(
            json['AuthenticationResult'] as Map<String, dynamic>),
    challengeName:
        _$enumDecodeNullable(_$ChallengeNameTypeEnumMap, json['ChallengeName']),
    challengeParameters:
        (json['ChallengeParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    session: json['Session'] as String,
  );
}

AdminSetUserMFAPreferenceResponse _$AdminSetUserMFAPreferenceResponseFromJson(
    Map<String, dynamic> json) {
  return AdminSetUserMFAPreferenceResponse();
}

AdminSetUserPasswordResponse _$AdminSetUserPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return AdminSetUserPasswordResponse();
}

AdminSetUserSettingsResponse _$AdminSetUserSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return AdminSetUserSettingsResponse();
}

AdminUpdateAuthEventFeedbackResponse
    _$AdminUpdateAuthEventFeedbackResponseFromJson(Map<String, dynamic> json) {
  return AdminUpdateAuthEventFeedbackResponse();
}

AdminUpdateDeviceStatusResponse _$AdminUpdateDeviceStatusResponseFromJson(
    Map<String, dynamic> json) {
  return AdminUpdateDeviceStatusResponse();
}

AdminUpdateUserAttributesResponse _$AdminUpdateUserAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return AdminUpdateUserAttributesResponse();
}

AdminUserGlobalSignOutResponse _$AdminUserGlobalSignOutResponseFromJson(
    Map<String, dynamic> json) {
  return AdminUserGlobalSignOutResponse();
}

AnalyticsConfigurationType _$AnalyticsConfigurationTypeFromJson(
    Map<String, dynamic> json) {
  return AnalyticsConfigurationType(
    applicationArn: json['ApplicationArn'] as String,
    applicationId: json['ApplicationId'] as String,
    externalId: json['ExternalId'] as String,
    roleArn: json['RoleArn'] as String,
    userDataShared: json['UserDataShared'] as bool,
  );
}

Map<String, dynamic> _$AnalyticsConfigurationTypeToJson(
    AnalyticsConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ApplicationArn', instance.applicationArn);
  writeNotNull('ApplicationId', instance.applicationId);
  writeNotNull('ExternalId', instance.externalId);
  writeNotNull('RoleArn', instance.roleArn);
  writeNotNull('UserDataShared', instance.userDataShared);
  return val;
}

Map<String, dynamic> _$AnalyticsMetadataTypeToJson(
    AnalyticsMetadataType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AnalyticsEndpointId', instance.analyticsEndpointId);
  return val;
}

AssociateSoftwareTokenResponse _$AssociateSoftwareTokenResponseFromJson(
    Map<String, dynamic> json) {
  return AssociateSoftwareTokenResponse(
    secretCode: json['SecretCode'] as String,
    session: json['Session'] as String,
  );
}

AttributeType _$AttributeTypeFromJson(Map<String, dynamic> json) {
  return AttributeType(
    name: json['Name'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$AttributeTypeToJson(AttributeType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', instance.name);
  writeNotNull('Value', instance.value);
  return val;
}

AuthEventType _$AuthEventTypeFromJson(Map<String, dynamic> json) {
  return AuthEventType(
    challengeResponses: (json['ChallengeResponses'] as List)
        ?.map((e) => e == null
            ? null
            : ChallengeResponseType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    eventContextData: json['EventContextData'] == null
        ? null
        : EventContextDataType.fromJson(
            json['EventContextData'] as Map<String, dynamic>),
    eventFeedback: json['EventFeedback'] == null
        ? null
        : EventFeedbackType.fromJson(
            json['EventFeedback'] as Map<String, dynamic>),
    eventId: json['EventId'] as String,
    eventResponse:
        _$enumDecodeNullable(_$EventResponseTypeEnumMap, json['EventResponse']),
    eventRisk: json['EventRisk'] == null
        ? null
        : EventRiskType.fromJson(json['EventRisk'] as Map<String, dynamic>),
    eventType: _$enumDecodeNullable(_$EventTypeEnumMap, json['EventType']),
  );
}

const _$EventResponseTypeEnumMap = {
  EventResponseType.success: 'Success',
  EventResponseType.failure: 'Failure',
};

const _$EventTypeEnumMap = {
  EventType.signIn: 'SignIn',
  EventType.signUp: 'SignUp',
  EventType.forgotPassword: 'ForgotPassword',
};

AuthenticationResultType _$AuthenticationResultTypeFromJson(
    Map<String, dynamic> json) {
  return AuthenticationResultType(
    accessToken: json['AccessToken'] as String,
    expiresIn: json['ExpiresIn'] as int,
    idToken: json['IdToken'] as String,
    newDeviceMetadata: json['NewDeviceMetadata'] == null
        ? null
        : NewDeviceMetadataType.fromJson(
            json['NewDeviceMetadata'] as Map<String, dynamic>),
    refreshToken: json['RefreshToken'] as String,
    tokenType: json['TokenType'] as String,
  );
}

ChallengeResponseType _$ChallengeResponseTypeFromJson(
    Map<String, dynamic> json) {
  return ChallengeResponseType(
    challengeName:
        _$enumDecodeNullable(_$ChallengeNameEnumMap, json['ChallengeName']),
    challengeResponse: _$enumDecodeNullable(
        _$ChallengeResponseEnumMap, json['ChallengeResponse']),
  );
}

const _$ChallengeNameEnumMap = {
  ChallengeName.password: 'Password',
  ChallengeName.mfa: 'Mfa',
};

const _$ChallengeResponseEnumMap = {
  ChallengeResponse.success: 'Success',
  ChallengeResponse.failure: 'Failure',
};

ChangePasswordResponse _$ChangePasswordResponseFromJson(
    Map<String, dynamic> json) {
  return ChangePasswordResponse();
}

CodeDeliveryDetailsType _$CodeDeliveryDetailsTypeFromJson(
    Map<String, dynamic> json) {
  return CodeDeliveryDetailsType(
    attributeName: json['AttributeName'] as String,
    deliveryMedium: _$enumDecodeNullable(
        _$DeliveryMediumTypeEnumMap, json['DeliveryMedium']),
    destination: json['Destination'] as String,
  );
}

const _$DeliveryMediumTypeEnumMap = {
  DeliveryMediumType.sms: 'SMS',
  DeliveryMediumType.email: 'EMAIL',
};

CompromisedCredentialsActionsType _$CompromisedCredentialsActionsTypeFromJson(
    Map<String, dynamic> json) {
  return CompromisedCredentialsActionsType(
    eventAction: _$enumDecodeNullable(
        _$CompromisedCredentialsEventActionTypeEnumMap, json['EventAction']),
  );
}

Map<String, dynamic> _$CompromisedCredentialsActionsTypeToJson(
    CompromisedCredentialsActionsType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EventAction',
      _$CompromisedCredentialsEventActionTypeEnumMap[instance.eventAction]);
  return val;
}

const _$CompromisedCredentialsEventActionTypeEnumMap = {
  CompromisedCredentialsEventActionType.block: 'BLOCK',
  CompromisedCredentialsEventActionType.noAction: 'NO_ACTION',
};

CompromisedCredentialsRiskConfigurationType
    _$CompromisedCredentialsRiskConfigurationTypeFromJson(
        Map<String, dynamic> json) {
  return CompromisedCredentialsRiskConfigurationType(
    actions: json['Actions'] == null
        ? null
        : CompromisedCredentialsActionsType.fromJson(
            json['Actions'] as Map<String, dynamic>),
    eventFilter: (json['EventFilter'] as List)
        ?.map((e) => _$enumDecodeNullable(_$EventFilterTypeEnumMap, e))
        ?.toList(),
  );
}

Map<String, dynamic> _$CompromisedCredentialsRiskConfigurationTypeToJson(
    CompromisedCredentialsRiskConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Actions', instance.actions?.toJson());
  writeNotNull('EventFilter',
      instance.eventFilter?.map((e) => _$EventFilterTypeEnumMap[e])?.toList());
  return val;
}

const _$EventFilterTypeEnumMap = {
  EventFilterType.signIn: 'SIGN_IN',
  EventFilterType.passwordChange: 'PASSWORD_CHANGE',
  EventFilterType.signUp: 'SIGN_UP',
};

ConfirmDeviceResponse _$ConfirmDeviceResponseFromJson(
    Map<String, dynamic> json) {
  return ConfirmDeviceResponse(
    userConfirmationNecessary: json['UserConfirmationNecessary'] as bool,
  );
}

ConfirmForgotPasswordResponse _$ConfirmForgotPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return ConfirmForgotPasswordResponse();
}

ConfirmSignUpResponse _$ConfirmSignUpResponseFromJson(
    Map<String, dynamic> json) {
  return ConfirmSignUpResponse();
}

Map<String, dynamic> _$ContextDataTypeToJson(ContextDataType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'HttpHeaders', instance.httpHeaders?.map((e) => e?.toJson())?.toList());
  writeNotNull('IpAddress', instance.ipAddress);
  writeNotNull('ServerName', instance.serverName);
  writeNotNull('ServerPath', instance.serverPath);
  writeNotNull('EncodedData', instance.encodedData);
  return val;
}

CreateGroupResponse _$CreateGroupResponseFromJson(Map<String, dynamic> json) {
  return CreateGroupResponse(
    group: json['Group'] == null
        ? null
        : GroupType.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

CreateIdentityProviderResponse _$CreateIdentityProviderResponseFromJson(
    Map<String, dynamic> json) {
  return CreateIdentityProviderResponse(
    identityProvider: json['IdentityProvider'] == null
        ? null
        : IdentityProviderType.fromJson(
            json['IdentityProvider'] as Map<String, dynamic>),
  );
}

CreateResourceServerResponse _$CreateResourceServerResponseFromJson(
    Map<String, dynamic> json) {
  return CreateResourceServerResponse(
    resourceServer: json['ResourceServer'] == null
        ? null
        : ResourceServerType.fromJson(
            json['ResourceServer'] as Map<String, dynamic>),
  );
}

CreateUserImportJobResponse _$CreateUserImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUserImportJobResponse(
    userImportJob: json['UserImportJob'] == null
        ? null
        : UserImportJobType.fromJson(
            json['UserImportJob'] as Map<String, dynamic>),
  );
}

CreateUserPoolClientResponse _$CreateUserPoolClientResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUserPoolClientResponse(
    userPoolClient: json['UserPoolClient'] == null
        ? null
        : UserPoolClientType.fromJson(
            json['UserPoolClient'] as Map<String, dynamic>),
  );
}

CreateUserPoolDomainResponse _$CreateUserPoolDomainResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUserPoolDomainResponse(
    cloudFrontDomain: json['CloudFrontDomain'] as String,
  );
}

CreateUserPoolResponse _$CreateUserPoolResponseFromJson(
    Map<String, dynamic> json) {
  return CreateUserPoolResponse(
    userPool: json['UserPool'] == null
        ? null
        : UserPoolType.fromJson(json['UserPool'] as Map<String, dynamic>),
  );
}

CustomDomainConfigType _$CustomDomainConfigTypeFromJson(
    Map<String, dynamic> json) {
  return CustomDomainConfigType(
    certificateArn: json['CertificateArn'] as String,
  );
}

Map<String, dynamic> _$CustomDomainConfigTypeToJson(
    CustomDomainConfigType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CertificateArn', instance.certificateArn);
  return val;
}

CustomEmailLambdaVersionConfigType _$CustomEmailLambdaVersionConfigTypeFromJson(
    Map<String, dynamic> json) {
  return CustomEmailLambdaVersionConfigType(
    lambdaArn: json['LambdaArn'] as String,
    lambdaVersion: _$enumDecodeNullable(
        _$CustomEmailSenderLambdaVersionTypeEnumMap, json['LambdaVersion']),
  );
}

Map<String, dynamic> _$CustomEmailLambdaVersionConfigTypeToJson(
    CustomEmailLambdaVersionConfigType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LambdaArn', instance.lambdaArn);
  writeNotNull('LambdaVersion',
      _$CustomEmailSenderLambdaVersionTypeEnumMap[instance.lambdaVersion]);
  return val;
}

const _$CustomEmailSenderLambdaVersionTypeEnumMap = {
  CustomEmailSenderLambdaVersionType.v1_0: 'V1_0',
};

CustomSMSLambdaVersionConfigType _$CustomSMSLambdaVersionConfigTypeFromJson(
    Map<String, dynamic> json) {
  return CustomSMSLambdaVersionConfigType(
    lambdaArn: json['LambdaArn'] as String,
    lambdaVersion: _$enumDecodeNullable(
        _$CustomSMSSenderLambdaVersionTypeEnumMap, json['LambdaVersion']),
  );
}

Map<String, dynamic> _$CustomSMSLambdaVersionConfigTypeToJson(
    CustomSMSLambdaVersionConfigType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('LambdaArn', instance.lambdaArn);
  writeNotNull('LambdaVersion',
      _$CustomSMSSenderLambdaVersionTypeEnumMap[instance.lambdaVersion]);
  return val;
}

const _$CustomSMSSenderLambdaVersionTypeEnumMap = {
  CustomSMSSenderLambdaVersionType.v1_0: 'V1_0',
};

DeleteUserAttributesResponse _$DeleteUserAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteUserAttributesResponse();
}

DeleteUserPoolDomainResponse _$DeleteUserPoolDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteUserPoolDomainResponse();
}

DescribeIdentityProviderResponse _$DescribeIdentityProviderResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeIdentityProviderResponse(
    identityProvider: json['IdentityProvider'] == null
        ? null
        : IdentityProviderType.fromJson(
            json['IdentityProvider'] as Map<String, dynamic>),
  );
}

DescribeResourceServerResponse _$DescribeResourceServerResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeResourceServerResponse(
    resourceServer: json['ResourceServer'] == null
        ? null
        : ResourceServerType.fromJson(
            json['ResourceServer'] as Map<String, dynamic>),
  );
}

DescribeRiskConfigurationResponse _$DescribeRiskConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeRiskConfigurationResponse(
    riskConfiguration: json['RiskConfiguration'] == null
        ? null
        : RiskConfigurationType.fromJson(
            json['RiskConfiguration'] as Map<String, dynamic>),
  );
}

DescribeUserImportJobResponse _$DescribeUserImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUserImportJobResponse(
    userImportJob: json['UserImportJob'] == null
        ? null
        : UserImportJobType.fromJson(
            json['UserImportJob'] as Map<String, dynamic>),
  );
}

DescribeUserPoolClientResponse _$DescribeUserPoolClientResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUserPoolClientResponse(
    userPoolClient: json['UserPoolClient'] == null
        ? null
        : UserPoolClientType.fromJson(
            json['UserPoolClient'] as Map<String, dynamic>),
  );
}

DescribeUserPoolDomainResponse _$DescribeUserPoolDomainResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUserPoolDomainResponse(
    domainDescription: json['DomainDescription'] == null
        ? null
        : DomainDescriptionType.fromJson(
            json['DomainDescription'] as Map<String, dynamic>),
  );
}

DescribeUserPoolResponse _$DescribeUserPoolResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeUserPoolResponse(
    userPool: json['UserPool'] == null
        ? null
        : UserPoolType.fromJson(json['UserPool'] as Map<String, dynamic>),
  );
}

DeviceConfigurationType _$DeviceConfigurationTypeFromJson(
    Map<String, dynamic> json) {
  return DeviceConfigurationType(
    challengeRequiredOnNewDevice: json['ChallengeRequiredOnNewDevice'] as bool,
    deviceOnlyRememberedOnUserPrompt:
        json['DeviceOnlyRememberedOnUserPrompt'] as bool,
  );
}

Map<String, dynamic> _$DeviceConfigurationTypeToJson(
    DeviceConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'ChallengeRequiredOnNewDevice', instance.challengeRequiredOnNewDevice);
  writeNotNull('DeviceOnlyRememberedOnUserPrompt',
      instance.deviceOnlyRememberedOnUserPrompt);
  return val;
}

Map<String, dynamic> _$DeviceSecretVerifierConfigTypeToJson(
    DeviceSecretVerifierConfigType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PasswordVerifier', instance.passwordVerifier);
  writeNotNull('Salt', instance.salt);
  return val;
}

DeviceType _$DeviceTypeFromJson(Map<String, dynamic> json) {
  return DeviceType(
    deviceAttributes: (json['DeviceAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    deviceCreateDate:
        const UnixDateTimeConverter().fromJson(json['DeviceCreateDate']),
    deviceKey: json['DeviceKey'] as String,
    deviceLastAuthenticatedDate: const UnixDateTimeConverter()
        .fromJson(json['DeviceLastAuthenticatedDate']),
    deviceLastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['DeviceLastModifiedDate']),
  );
}

DomainDescriptionType _$DomainDescriptionTypeFromJson(
    Map<String, dynamic> json) {
  return DomainDescriptionType(
    awsAccountId: json['AWSAccountId'] as String,
    cloudFrontDistribution: json['CloudFrontDistribution'] as String,
    customDomainConfig: json['CustomDomainConfig'] == null
        ? null
        : CustomDomainConfigType.fromJson(
            json['CustomDomainConfig'] as Map<String, dynamic>),
    domain: json['Domain'] as String,
    s3Bucket: json['S3Bucket'] as String,
    status: _$enumDecodeNullable(_$DomainStatusTypeEnumMap, json['Status']),
    userPoolId: json['UserPoolId'] as String,
    version: json['Version'] as String,
  );
}

const _$DomainStatusTypeEnumMap = {
  DomainStatusType.creating: 'CREATING',
  DomainStatusType.deleting: 'DELETING',
  DomainStatusType.updating: 'UPDATING',
  DomainStatusType.active: 'ACTIVE',
  DomainStatusType.failed: 'FAILED',
};

EmailConfigurationType _$EmailConfigurationTypeFromJson(
    Map<String, dynamic> json) {
  return EmailConfigurationType(
    configurationSet: json['ConfigurationSet'] as String,
    emailSendingAccount: _$enumDecodeNullable(
        _$EmailSendingAccountTypeEnumMap, json['EmailSendingAccount']),
    from: json['From'] as String,
    replyToEmailAddress: json['ReplyToEmailAddress'] as String,
    sourceArn: json['SourceArn'] as String,
  );
}

Map<String, dynamic> _$EmailConfigurationTypeToJson(
    EmailConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ConfigurationSet', instance.configurationSet);
  writeNotNull('EmailSendingAccount',
      _$EmailSendingAccountTypeEnumMap[instance.emailSendingAccount]);
  writeNotNull('From', instance.from);
  writeNotNull('ReplyToEmailAddress', instance.replyToEmailAddress);
  writeNotNull('SourceArn', instance.sourceArn);
  return val;
}

const _$EmailSendingAccountTypeEnumMap = {
  EmailSendingAccountType.cognitoDefault: 'COGNITO_DEFAULT',
  EmailSendingAccountType.developer: 'DEVELOPER',
};

EventContextDataType _$EventContextDataTypeFromJson(Map<String, dynamic> json) {
  return EventContextDataType(
    city: json['City'] as String,
    country: json['Country'] as String,
    deviceName: json['DeviceName'] as String,
    ipAddress: json['IpAddress'] as String,
    timezone: json['Timezone'] as String,
  );
}

EventFeedbackType _$EventFeedbackTypeFromJson(Map<String, dynamic> json) {
  return EventFeedbackType(
    feedbackValue:
        _$enumDecodeNullable(_$FeedbackValueTypeEnumMap, json['FeedbackValue']),
    provider: json['Provider'] as String,
    feedbackDate: const UnixDateTimeConverter().fromJson(json['FeedbackDate']),
  );
}

const _$FeedbackValueTypeEnumMap = {
  FeedbackValueType.valid: 'Valid',
  FeedbackValueType.invalid: 'Invalid',
};

EventRiskType _$EventRiskTypeFromJson(Map<String, dynamic> json) {
  return EventRiskType(
    compromisedCredentialsDetected:
        json['CompromisedCredentialsDetected'] as bool,
    riskDecision:
        _$enumDecodeNullable(_$RiskDecisionTypeEnumMap, json['RiskDecision']),
    riskLevel: _$enumDecodeNullable(_$RiskLevelTypeEnumMap, json['RiskLevel']),
  );
}

const _$RiskDecisionTypeEnumMap = {
  RiskDecisionType.noRisk: 'NoRisk',
  RiskDecisionType.accountTakeover: 'AccountTakeover',
  RiskDecisionType.block: 'Block',
};

const _$RiskLevelTypeEnumMap = {
  RiskLevelType.low: 'Low',
  RiskLevelType.medium: 'Medium',
  RiskLevelType.high: 'High',
};

ForgotPasswordResponse _$ForgotPasswordResponseFromJson(
    Map<String, dynamic> json) {
  return ForgotPasswordResponse(
    codeDeliveryDetails: json['CodeDeliveryDetails'] == null
        ? null
        : CodeDeliveryDetailsType.fromJson(
            json['CodeDeliveryDetails'] as Map<String, dynamic>),
  );
}

GetCSVHeaderResponse _$GetCSVHeaderResponseFromJson(Map<String, dynamic> json) {
  return GetCSVHeaderResponse(
    cSVHeader: (json['CSVHeader'] as List)?.map((e) => e as String)?.toList(),
    userPoolId: json['UserPoolId'] as String,
  );
}

GetDeviceResponse _$GetDeviceResponseFromJson(Map<String, dynamic> json) {
  return GetDeviceResponse(
    device: json['Device'] == null
        ? null
        : DeviceType.fromJson(json['Device'] as Map<String, dynamic>),
  );
}

GetGroupResponse _$GetGroupResponseFromJson(Map<String, dynamic> json) {
  return GetGroupResponse(
    group: json['Group'] == null
        ? null
        : GroupType.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

GetIdentityProviderByIdentifierResponse
    _$GetIdentityProviderByIdentifierResponseFromJson(
        Map<String, dynamic> json) {
  return GetIdentityProviderByIdentifierResponse(
    identityProvider: json['IdentityProvider'] == null
        ? null
        : IdentityProviderType.fromJson(
            json['IdentityProvider'] as Map<String, dynamic>),
  );
}

GetSigningCertificateResponse _$GetSigningCertificateResponseFromJson(
    Map<String, dynamic> json) {
  return GetSigningCertificateResponse(
    certificate: json['Certificate'] as String,
  );
}

GetUICustomizationResponse _$GetUICustomizationResponseFromJson(
    Map<String, dynamic> json) {
  return GetUICustomizationResponse(
    uICustomization: json['UICustomization'] == null
        ? null
        : UICustomizationType.fromJson(
            json['UICustomization'] as Map<String, dynamic>),
  );
}

GetUserAttributeVerificationCodeResponse
    _$GetUserAttributeVerificationCodeResponseFromJson(
        Map<String, dynamic> json) {
  return GetUserAttributeVerificationCodeResponse(
    codeDeliveryDetails: json['CodeDeliveryDetails'] == null
        ? null
        : CodeDeliveryDetailsType.fromJson(
            json['CodeDeliveryDetails'] as Map<String, dynamic>),
  );
}

GetUserPoolMfaConfigResponse _$GetUserPoolMfaConfigResponseFromJson(
    Map<String, dynamic> json) {
  return GetUserPoolMfaConfigResponse(
    mfaConfiguration: _$enumDecodeNullable(
        _$UserPoolMfaTypeEnumMap, json['MfaConfiguration']),
    smsMfaConfiguration: json['SmsMfaConfiguration'] == null
        ? null
        : SmsMfaConfigType.fromJson(
            json['SmsMfaConfiguration'] as Map<String, dynamic>),
    softwareTokenMfaConfiguration: json['SoftwareTokenMfaConfiguration'] == null
        ? null
        : SoftwareTokenMfaConfigType.fromJson(
            json['SoftwareTokenMfaConfiguration'] as Map<String, dynamic>),
  );
}

const _$UserPoolMfaTypeEnumMap = {
  UserPoolMfaType.off: 'OFF',
  UserPoolMfaType.on: 'ON',
  UserPoolMfaType.optional: 'OPTIONAL',
};

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) {
  return GetUserResponse(
    userAttributes: (json['UserAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    username: json['Username'] as String,
    mFAOptions: (json['MFAOptions'] as List)
        ?.map((e) => e == null
            ? null
            : MFAOptionType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    preferredMfaSetting: json['PreferredMfaSetting'] as String,
    userMFASettingList:
        (json['UserMFASettingList'] as List)?.map((e) => e as String)?.toList(),
  );
}

GlobalSignOutResponse _$GlobalSignOutResponseFromJson(
    Map<String, dynamic> json) {
  return GlobalSignOutResponse();
}

GroupType _$GroupTypeFromJson(Map<String, dynamic> json) {
  return GroupType(
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    description: json['Description'] as String,
    groupName: json['GroupName'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    precedence: json['Precedence'] as int,
    roleArn: json['RoleArn'] as String,
    userPoolId: json['UserPoolId'] as String,
  );
}

Map<String, dynamic> _$HttpHeaderToJson(HttpHeader instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('headerName', instance.headerName);
  writeNotNull('headerValue', instance.headerValue);
  return val;
}

IdentityProviderType _$IdentityProviderTypeFromJson(Map<String, dynamic> json) {
  return IdentityProviderType(
    attributeMapping: (json['AttributeMapping'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    idpIdentifiers:
        (json['IdpIdentifiers'] as List)?.map((e) => e as String)?.toList(),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    providerDetails: (json['ProviderDetails'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    providerName: json['ProviderName'] as String,
    providerType: _$enumDecodeNullable(
        _$IdentityProviderTypeTypeEnumMap, json['ProviderType']),
    userPoolId: json['UserPoolId'] as String,
  );
}

const _$IdentityProviderTypeTypeEnumMap = {
  IdentityProviderTypeType.saml: 'SAML',
  IdentityProviderTypeType.facebook: 'Facebook',
  IdentityProviderTypeType.google: 'Google',
  IdentityProviderTypeType.loginWithAmazon: 'LoginWithAmazon',
  IdentityProviderTypeType.signInWithApple: 'SignInWithApple',
  IdentityProviderTypeType.oidc: 'OIDC',
};

InitiateAuthResponse _$InitiateAuthResponseFromJson(Map<String, dynamic> json) {
  return InitiateAuthResponse(
    authenticationResult: json['AuthenticationResult'] == null
        ? null
        : AuthenticationResultType.fromJson(
            json['AuthenticationResult'] as Map<String, dynamic>),
    challengeName:
        _$enumDecodeNullable(_$ChallengeNameTypeEnumMap, json['ChallengeName']),
    challengeParameters:
        (json['ChallengeParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    session: json['Session'] as String,
  );
}

LambdaConfigType _$LambdaConfigTypeFromJson(Map<String, dynamic> json) {
  return LambdaConfigType(
    createAuthChallenge: json['CreateAuthChallenge'] as String,
    customEmailSender: json['CustomEmailSender'] == null
        ? null
        : CustomEmailLambdaVersionConfigType.fromJson(
            json['CustomEmailSender'] as Map<String, dynamic>),
    customMessage: json['CustomMessage'] as String,
    customSMSSender: json['CustomSMSSender'] == null
        ? null
        : CustomSMSLambdaVersionConfigType.fromJson(
            json['CustomSMSSender'] as Map<String, dynamic>),
    defineAuthChallenge: json['DefineAuthChallenge'] as String,
    kMSKeyID: json['KMSKeyID'] as String,
    postAuthentication: json['PostAuthentication'] as String,
    postConfirmation: json['PostConfirmation'] as String,
    preAuthentication: json['PreAuthentication'] as String,
    preSignUp: json['PreSignUp'] as String,
    preTokenGeneration: json['PreTokenGeneration'] as String,
    userMigration: json['UserMigration'] as String,
    verifyAuthChallengeResponse: json['VerifyAuthChallengeResponse'] as String,
  );
}

Map<String, dynamic> _$LambdaConfigTypeToJson(LambdaConfigType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CreateAuthChallenge', instance.createAuthChallenge);
  writeNotNull('CustomEmailSender', instance.customEmailSender?.toJson());
  writeNotNull('CustomMessage', instance.customMessage);
  writeNotNull('CustomSMSSender', instance.customSMSSender?.toJson());
  writeNotNull('DefineAuthChallenge', instance.defineAuthChallenge);
  writeNotNull('KMSKeyID', instance.kMSKeyID);
  writeNotNull('PostAuthentication', instance.postAuthentication);
  writeNotNull('PostConfirmation', instance.postConfirmation);
  writeNotNull('PreAuthentication', instance.preAuthentication);
  writeNotNull('PreSignUp', instance.preSignUp);
  writeNotNull('PreTokenGeneration', instance.preTokenGeneration);
  writeNotNull('UserMigration', instance.userMigration);
  writeNotNull(
      'VerifyAuthChallengeResponse', instance.verifyAuthChallengeResponse);
  return val;
}

ListDevicesResponse _$ListDevicesResponseFromJson(Map<String, dynamic> json) {
  return ListDevicesResponse(
    devices: (json['Devices'] as List)
        ?.map((e) =>
            e == null ? null : DeviceType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    paginationToken: json['PaginationToken'] as String,
  );
}

ListGroupsResponse _$ListGroupsResponseFromJson(Map<String, dynamic> json) {
  return ListGroupsResponse(
    groups: (json['Groups'] as List)
        ?.map((e) =>
            e == null ? null : GroupType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListIdentityProvidersResponse _$ListIdentityProvidersResponseFromJson(
    Map<String, dynamic> json) {
  return ListIdentityProvidersResponse(
    providers: (json['Providers'] as List)
        ?.map((e) => e == null
            ? null
            : ProviderDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

ListResourceServersResponse _$ListResourceServersResponseFromJson(
    Map<String, dynamic> json) {
  return ListResourceServersResponse(
    resourceServers: (json['ResourceServers'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceServerType.fromJson(e as Map<String, dynamic>))
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

ListUserImportJobsResponse _$ListUserImportJobsResponseFromJson(
    Map<String, dynamic> json) {
  return ListUserImportJobsResponse(
    paginationToken: json['PaginationToken'] as String,
    userImportJobs: (json['UserImportJobs'] as List)
        ?.map((e) => e == null
            ? null
            : UserImportJobType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUserPoolClientsResponse _$ListUserPoolClientsResponseFromJson(
    Map<String, dynamic> json) {
  return ListUserPoolClientsResponse(
    nextToken: json['NextToken'] as String,
    userPoolClients: (json['UserPoolClients'] as List)
        ?.map((e) => e == null
            ? null
            : UserPoolClientDescription.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUserPoolsResponse _$ListUserPoolsResponseFromJson(
    Map<String, dynamic> json) {
  return ListUserPoolsResponse(
    nextToken: json['NextToken'] as String,
    userPools: (json['UserPools'] as List)
        ?.map((e) => e == null
            ? null
            : UserPoolDescriptionType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUsersInGroupResponse _$ListUsersInGroupResponseFromJson(
    Map<String, dynamic> json) {
  return ListUsersInGroupResponse(
    nextToken: json['NextToken'] as String,
    users: (json['Users'] as List)
        ?.map((e) =>
            e == null ? null : UserType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListUsersResponse _$ListUsersResponseFromJson(Map<String, dynamic> json) {
  return ListUsersResponse(
    paginationToken: json['PaginationToken'] as String,
    users: (json['Users'] as List)
        ?.map((e) =>
            e == null ? null : UserType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MFAOptionType _$MFAOptionTypeFromJson(Map<String, dynamic> json) {
  return MFAOptionType(
    attributeName: json['AttributeName'] as String,
    deliveryMedium: _$enumDecodeNullable(
        _$DeliveryMediumTypeEnumMap, json['DeliveryMedium']),
  );
}

Map<String, dynamic> _$MFAOptionTypeToJson(MFAOptionType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull(
      'DeliveryMedium', _$DeliveryMediumTypeEnumMap[instance.deliveryMedium]);
  return val;
}

MessageTemplateType _$MessageTemplateTypeFromJson(Map<String, dynamic> json) {
  return MessageTemplateType(
    emailMessage: json['EmailMessage'] as String,
    emailSubject: json['EmailSubject'] as String,
    sMSMessage: json['SMSMessage'] as String,
  );
}

Map<String, dynamic> _$MessageTemplateTypeToJson(MessageTemplateType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EmailMessage', instance.emailMessage);
  writeNotNull('EmailSubject', instance.emailSubject);
  writeNotNull('SMSMessage', instance.sMSMessage);
  return val;
}

NewDeviceMetadataType _$NewDeviceMetadataTypeFromJson(
    Map<String, dynamic> json) {
  return NewDeviceMetadataType(
    deviceGroupKey: json['DeviceGroupKey'] as String,
    deviceKey: json['DeviceKey'] as String,
  );
}

NotifyConfigurationType _$NotifyConfigurationTypeFromJson(
    Map<String, dynamic> json) {
  return NotifyConfigurationType(
    sourceArn: json['SourceArn'] as String,
    blockEmail: json['BlockEmail'] == null
        ? null
        : NotifyEmailType.fromJson(json['BlockEmail'] as Map<String, dynamic>),
    from: json['From'] as String,
    mfaEmail: json['MfaEmail'] == null
        ? null
        : NotifyEmailType.fromJson(json['MfaEmail'] as Map<String, dynamic>),
    noActionEmail: json['NoActionEmail'] == null
        ? null
        : NotifyEmailType.fromJson(
            json['NoActionEmail'] as Map<String, dynamic>),
    replyTo: json['ReplyTo'] as String,
  );
}

Map<String, dynamic> _$NotifyConfigurationTypeToJson(
    NotifyConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SourceArn', instance.sourceArn);
  writeNotNull('BlockEmail', instance.blockEmail?.toJson());
  writeNotNull('From', instance.from);
  writeNotNull('MfaEmail', instance.mfaEmail?.toJson());
  writeNotNull('NoActionEmail', instance.noActionEmail?.toJson());
  writeNotNull('ReplyTo', instance.replyTo);
  return val;
}

NotifyEmailType _$NotifyEmailTypeFromJson(Map<String, dynamic> json) {
  return NotifyEmailType(
    subject: json['Subject'] as String,
    htmlBody: json['HtmlBody'] as String,
    textBody: json['TextBody'] as String,
  );
}

Map<String, dynamic> _$NotifyEmailTypeToJson(NotifyEmailType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Subject', instance.subject);
  writeNotNull('HtmlBody', instance.htmlBody);
  writeNotNull('TextBody', instance.textBody);
  return val;
}

NumberAttributeConstraintsType _$NumberAttributeConstraintsTypeFromJson(
    Map<String, dynamic> json) {
  return NumberAttributeConstraintsType(
    maxValue: json['MaxValue'] as String,
    minValue: json['MinValue'] as String,
  );
}

Map<String, dynamic> _$NumberAttributeConstraintsTypeToJson(
    NumberAttributeConstraintsType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxValue', instance.maxValue);
  writeNotNull('MinValue', instance.minValue);
  return val;
}

PasswordPolicyType _$PasswordPolicyTypeFromJson(Map<String, dynamic> json) {
  return PasswordPolicyType(
    minimumLength: json['MinimumLength'] as int,
    requireLowercase: json['RequireLowercase'] as bool,
    requireNumbers: json['RequireNumbers'] as bool,
    requireSymbols: json['RequireSymbols'] as bool,
    requireUppercase: json['RequireUppercase'] as bool,
    temporaryPasswordValidityDays: json['TemporaryPasswordValidityDays'] as int,
  );
}

Map<String, dynamic> _$PasswordPolicyTypeToJson(PasswordPolicyType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MinimumLength', instance.minimumLength);
  writeNotNull('RequireLowercase', instance.requireLowercase);
  writeNotNull('RequireNumbers', instance.requireNumbers);
  writeNotNull('RequireSymbols', instance.requireSymbols);
  writeNotNull('RequireUppercase', instance.requireUppercase);
  writeNotNull(
      'TemporaryPasswordValidityDays', instance.temporaryPasswordValidityDays);
  return val;
}

ProviderDescription _$ProviderDescriptionFromJson(Map<String, dynamic> json) {
  return ProviderDescription(
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    providerName: json['ProviderName'] as String,
    providerType: _$enumDecodeNullable(
        _$IdentityProviderTypeTypeEnumMap, json['ProviderType']),
  );
}

Map<String, dynamic> _$ProviderUserIdentifierTypeToJson(
    ProviderUserIdentifierType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProviderAttributeName', instance.providerAttributeName);
  writeNotNull('ProviderAttributeValue', instance.providerAttributeValue);
  writeNotNull('ProviderName', instance.providerName);
  return val;
}

RecoveryOptionType _$RecoveryOptionTypeFromJson(Map<String, dynamic> json) {
  return RecoveryOptionType(
    name: _$enumDecodeNullable(_$RecoveryOptionNameTypeEnumMap, json['Name']),
    priority: json['Priority'] as int,
  );
}

Map<String, dynamic> _$RecoveryOptionTypeToJson(RecoveryOptionType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Name', _$RecoveryOptionNameTypeEnumMap[instance.name]);
  writeNotNull('Priority', instance.priority);
  return val;
}

const _$RecoveryOptionNameTypeEnumMap = {
  RecoveryOptionNameType.verifiedEmail: 'verified_email',
  RecoveryOptionNameType.verifiedPhoneNumber: 'verified_phone_number',
  RecoveryOptionNameType.adminOnly: 'admin_only',
};

ResendConfirmationCodeResponse _$ResendConfirmationCodeResponseFromJson(
    Map<String, dynamic> json) {
  return ResendConfirmationCodeResponse(
    codeDeliveryDetails: json['CodeDeliveryDetails'] == null
        ? null
        : CodeDeliveryDetailsType.fromJson(
            json['CodeDeliveryDetails'] as Map<String, dynamic>),
  );
}

ResourceServerScopeType _$ResourceServerScopeTypeFromJson(
    Map<String, dynamic> json) {
  return ResourceServerScopeType(
    scopeDescription: json['ScopeDescription'] as String,
    scopeName: json['ScopeName'] as String,
  );
}

Map<String, dynamic> _$ResourceServerScopeTypeToJson(
    ResourceServerScopeType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ScopeDescription', instance.scopeDescription);
  writeNotNull('ScopeName', instance.scopeName);
  return val;
}

ResourceServerType _$ResourceServerTypeFromJson(Map<String, dynamic> json) {
  return ResourceServerType(
    identifier: json['Identifier'] as String,
    name: json['Name'] as String,
    scopes: (json['Scopes'] as List)
        ?.map((e) => e == null
            ? null
            : ResourceServerScopeType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userPoolId: json['UserPoolId'] as String,
  );
}

RespondToAuthChallengeResponse _$RespondToAuthChallengeResponseFromJson(
    Map<String, dynamic> json) {
  return RespondToAuthChallengeResponse(
    authenticationResult: json['AuthenticationResult'] == null
        ? null
        : AuthenticationResultType.fromJson(
            json['AuthenticationResult'] as Map<String, dynamic>),
    challengeName:
        _$enumDecodeNullable(_$ChallengeNameTypeEnumMap, json['ChallengeName']),
    challengeParameters:
        (json['ChallengeParameters'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    session: json['Session'] as String,
  );
}

RiskConfigurationType _$RiskConfigurationTypeFromJson(
    Map<String, dynamic> json) {
  return RiskConfigurationType(
    accountTakeoverRiskConfiguration:
        json['AccountTakeoverRiskConfiguration'] == null
            ? null
            : AccountTakeoverRiskConfigurationType.fromJson(
                json['AccountTakeoverRiskConfiguration']
                    as Map<String, dynamic>),
    clientId: json['ClientId'] as String,
    compromisedCredentialsRiskConfiguration:
        json['CompromisedCredentialsRiskConfiguration'] == null
            ? null
            : CompromisedCredentialsRiskConfigurationType.fromJson(
                json['CompromisedCredentialsRiskConfiguration']
                    as Map<String, dynamic>),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    riskExceptionConfiguration: json['RiskExceptionConfiguration'] == null
        ? null
        : RiskExceptionConfigurationType.fromJson(
            json['RiskExceptionConfiguration'] as Map<String, dynamic>),
    userPoolId: json['UserPoolId'] as String,
  );
}

RiskExceptionConfigurationType _$RiskExceptionConfigurationTypeFromJson(
    Map<String, dynamic> json) {
  return RiskExceptionConfigurationType(
    blockedIPRangeList:
        (json['BlockedIPRangeList'] as List)?.map((e) => e as String)?.toList(),
    skippedIPRangeList:
        (json['SkippedIPRangeList'] as List)?.map((e) => e as String)?.toList(),
  );
}

Map<String, dynamic> _$RiskExceptionConfigurationTypeToJson(
    RiskExceptionConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('BlockedIPRangeList', instance.blockedIPRangeList);
  writeNotNull('SkippedIPRangeList', instance.skippedIPRangeList);
  return val;
}

Map<String, dynamic> _$SMSMfaSettingsTypeToJson(SMSMfaSettingsType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('PreferredMfa', instance.preferredMfa);
  return val;
}

SchemaAttributeType _$SchemaAttributeTypeFromJson(Map<String, dynamic> json) {
  return SchemaAttributeType(
    attributeDataType: _$enumDecodeNullable(
        _$AttributeDataTypeEnumMap, json['AttributeDataType']),
    developerOnlyAttribute: json['DeveloperOnlyAttribute'] as bool,
    mutable: json['Mutable'] as bool,
    name: json['Name'] as String,
    numberAttributeConstraints: json['NumberAttributeConstraints'] == null
        ? null
        : NumberAttributeConstraintsType.fromJson(
            json['NumberAttributeConstraints'] as Map<String, dynamic>),
    required: json['Required'] as bool,
    stringAttributeConstraints: json['StringAttributeConstraints'] == null
        ? null
        : StringAttributeConstraintsType.fromJson(
            json['StringAttributeConstraints'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SchemaAttributeTypeToJson(SchemaAttributeType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeDataType',
      _$AttributeDataTypeEnumMap[instance.attributeDataType]);
  writeNotNull('DeveloperOnlyAttribute', instance.developerOnlyAttribute);
  writeNotNull('Mutable', instance.mutable);
  writeNotNull('Name', instance.name);
  writeNotNull('NumberAttributeConstraints',
      instance.numberAttributeConstraints?.toJson());
  writeNotNull('Required', instance.required);
  writeNotNull('StringAttributeConstraints',
      instance.stringAttributeConstraints?.toJson());
  return val;
}

const _$AttributeDataTypeEnumMap = {
  AttributeDataType.string: 'String',
  AttributeDataType.number: 'Number',
  AttributeDataType.dateTime: 'DateTime',
  AttributeDataType.boolean: 'Boolean',
};

SetRiskConfigurationResponse _$SetRiskConfigurationResponseFromJson(
    Map<String, dynamic> json) {
  return SetRiskConfigurationResponse(
    riskConfiguration: json['RiskConfiguration'] == null
        ? null
        : RiskConfigurationType.fromJson(
            json['RiskConfiguration'] as Map<String, dynamic>),
  );
}

SetUICustomizationResponse _$SetUICustomizationResponseFromJson(
    Map<String, dynamic> json) {
  return SetUICustomizationResponse(
    uICustomization: json['UICustomization'] == null
        ? null
        : UICustomizationType.fromJson(
            json['UICustomization'] as Map<String, dynamic>),
  );
}

SetUserMFAPreferenceResponse _$SetUserMFAPreferenceResponseFromJson(
    Map<String, dynamic> json) {
  return SetUserMFAPreferenceResponse();
}

SetUserPoolMfaConfigResponse _$SetUserPoolMfaConfigResponseFromJson(
    Map<String, dynamic> json) {
  return SetUserPoolMfaConfigResponse(
    mfaConfiguration: _$enumDecodeNullable(
        _$UserPoolMfaTypeEnumMap, json['MfaConfiguration']),
    smsMfaConfiguration: json['SmsMfaConfiguration'] == null
        ? null
        : SmsMfaConfigType.fromJson(
            json['SmsMfaConfiguration'] as Map<String, dynamic>),
    softwareTokenMfaConfiguration: json['SoftwareTokenMfaConfiguration'] == null
        ? null
        : SoftwareTokenMfaConfigType.fromJson(
            json['SoftwareTokenMfaConfiguration'] as Map<String, dynamic>),
  );
}

SetUserSettingsResponse _$SetUserSettingsResponseFromJson(
    Map<String, dynamic> json) {
  return SetUserSettingsResponse();
}

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) {
  return SignUpResponse(
    userConfirmed: json['UserConfirmed'] as bool,
    userSub: json['UserSub'] as String,
    codeDeliveryDetails: json['CodeDeliveryDetails'] == null
        ? null
        : CodeDeliveryDetailsType.fromJson(
            json['CodeDeliveryDetails'] as Map<String, dynamic>),
  );
}

SmsConfigurationType _$SmsConfigurationTypeFromJson(Map<String, dynamic> json) {
  return SmsConfigurationType(
    snsCallerArn: json['SnsCallerArn'] as String,
    externalId: json['ExternalId'] as String,
  );
}

Map<String, dynamic> _$SmsConfigurationTypeToJson(
    SmsConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SnsCallerArn', instance.snsCallerArn);
  writeNotNull('ExternalId', instance.externalId);
  return val;
}

SmsMfaConfigType _$SmsMfaConfigTypeFromJson(Map<String, dynamic> json) {
  return SmsMfaConfigType(
    smsAuthenticationMessage: json['SmsAuthenticationMessage'] as String,
    smsConfiguration: json['SmsConfiguration'] == null
        ? null
        : SmsConfigurationType.fromJson(
            json['SmsConfiguration'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SmsMfaConfigTypeToJson(SmsMfaConfigType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('SmsAuthenticationMessage', instance.smsAuthenticationMessage);
  writeNotNull('SmsConfiguration', instance.smsConfiguration?.toJson());
  return val;
}

SoftwareTokenMfaConfigType _$SoftwareTokenMfaConfigTypeFromJson(
    Map<String, dynamic> json) {
  return SoftwareTokenMfaConfigType(
    enabled: json['Enabled'] as bool,
  );
}

Map<String, dynamic> _$SoftwareTokenMfaConfigTypeToJson(
    SoftwareTokenMfaConfigType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  return val;
}

Map<String, dynamic> _$SoftwareTokenMfaSettingsTypeToJson(
    SoftwareTokenMfaSettingsType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Enabled', instance.enabled);
  writeNotNull('PreferredMfa', instance.preferredMfa);
  return val;
}

StartUserImportJobResponse _$StartUserImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return StartUserImportJobResponse(
    userImportJob: json['UserImportJob'] == null
        ? null
        : UserImportJobType.fromJson(
            json['UserImportJob'] as Map<String, dynamic>),
  );
}

StopUserImportJobResponse _$StopUserImportJobResponseFromJson(
    Map<String, dynamic> json) {
  return StopUserImportJobResponse(
    userImportJob: json['UserImportJob'] == null
        ? null
        : UserImportJobType.fromJson(
            json['UserImportJob'] as Map<String, dynamic>),
  );
}

StringAttributeConstraintsType _$StringAttributeConstraintsTypeFromJson(
    Map<String, dynamic> json) {
  return StringAttributeConstraintsType(
    maxLength: json['MaxLength'] as String,
    minLength: json['MinLength'] as String,
  );
}

Map<String, dynamic> _$StringAttributeConstraintsTypeToJson(
    StringAttributeConstraintsType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('MaxLength', instance.maxLength);
  writeNotNull('MinLength', instance.minLength);
  return val;
}

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

TokenValidityUnitsType _$TokenValidityUnitsTypeFromJson(
    Map<String, dynamic> json) {
  return TokenValidityUnitsType(
    accessToken:
        _$enumDecodeNullable(_$TimeUnitsTypeEnumMap, json['AccessToken']),
    idToken: _$enumDecodeNullable(_$TimeUnitsTypeEnumMap, json['IdToken']),
    refreshToken:
        _$enumDecodeNullable(_$TimeUnitsTypeEnumMap, json['RefreshToken']),
  );
}

Map<String, dynamic> _$TokenValidityUnitsTypeToJson(
    TokenValidityUnitsType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AccessToken', _$TimeUnitsTypeEnumMap[instance.accessToken]);
  writeNotNull('IdToken', _$TimeUnitsTypeEnumMap[instance.idToken]);
  writeNotNull('RefreshToken', _$TimeUnitsTypeEnumMap[instance.refreshToken]);
  return val;
}

const _$TimeUnitsTypeEnumMap = {
  TimeUnitsType.seconds: 'seconds',
  TimeUnitsType.minutes: 'minutes',
  TimeUnitsType.hours: 'hours',
  TimeUnitsType.days: 'days',
};

UICustomizationType _$UICustomizationTypeFromJson(Map<String, dynamic> json) {
  return UICustomizationType(
    css: json['CSS'] as String,
    cSSVersion: json['CSSVersion'] as String,
    clientId: json['ClientId'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    imageUrl: json['ImageUrl'] as String,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    userPoolId: json['UserPoolId'] as String,
  );
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}

UpdateAuthEventFeedbackResponse _$UpdateAuthEventFeedbackResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateAuthEventFeedbackResponse();
}

UpdateDeviceStatusResponse _$UpdateDeviceStatusResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateDeviceStatusResponse();
}

UpdateGroupResponse _$UpdateGroupResponseFromJson(Map<String, dynamic> json) {
  return UpdateGroupResponse(
    group: json['Group'] == null
        ? null
        : GroupType.fromJson(json['Group'] as Map<String, dynamic>),
  );
}

UpdateIdentityProviderResponse _$UpdateIdentityProviderResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateIdentityProviderResponse(
    identityProvider: json['IdentityProvider'] == null
        ? null
        : IdentityProviderType.fromJson(
            json['IdentityProvider'] as Map<String, dynamic>),
  );
}

UpdateResourceServerResponse _$UpdateResourceServerResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateResourceServerResponse(
    resourceServer: json['ResourceServer'] == null
        ? null
        : ResourceServerType.fromJson(
            json['ResourceServer'] as Map<String, dynamic>),
  );
}

UpdateUserAttributesResponse _$UpdateUserAttributesResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateUserAttributesResponse(
    codeDeliveryDetailsList: (json['CodeDeliveryDetailsList'] as List)
        ?.map((e) => e == null
            ? null
            : CodeDeliveryDetailsType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

UpdateUserPoolClientResponse _$UpdateUserPoolClientResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateUserPoolClientResponse(
    userPoolClient: json['UserPoolClient'] == null
        ? null
        : UserPoolClientType.fromJson(
            json['UserPoolClient'] as Map<String, dynamic>),
  );
}

UpdateUserPoolDomainResponse _$UpdateUserPoolDomainResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateUserPoolDomainResponse(
    cloudFrontDomain: json['CloudFrontDomain'] as String,
  );
}

UpdateUserPoolResponse _$UpdateUserPoolResponseFromJson(
    Map<String, dynamic> json) {
  return UpdateUserPoolResponse();
}

Map<String, dynamic> _$UserContextDataTypeToJson(UserContextDataType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('EncodedData', instance.encodedData);
  return val;
}

UserImportJobType _$UserImportJobTypeFromJson(Map<String, dynamic> json) {
  return UserImportJobType(
    cloudWatchLogsRoleArn: json['CloudWatchLogsRoleArn'] as String,
    completionDate:
        const UnixDateTimeConverter().fromJson(json['CompletionDate']),
    completionMessage: json['CompletionMessage'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    failedUsers: json['FailedUsers'] as int,
    importedUsers: json['ImportedUsers'] as int,
    jobId: json['JobId'] as String,
    jobName: json['JobName'] as String,
    preSignedUrl: json['PreSignedUrl'] as String,
    skippedUsers: json['SkippedUsers'] as int,
    startDate: const UnixDateTimeConverter().fromJson(json['StartDate']),
    status:
        _$enumDecodeNullable(_$UserImportJobStatusTypeEnumMap, json['Status']),
    userPoolId: json['UserPoolId'] as String,
  );
}

const _$UserImportJobStatusTypeEnumMap = {
  UserImportJobStatusType.created: 'Created',
  UserImportJobStatusType.pending: 'Pending',
  UserImportJobStatusType.inProgress: 'InProgress',
  UserImportJobStatusType.stopping: 'Stopping',
  UserImportJobStatusType.expired: 'Expired',
  UserImportJobStatusType.stopped: 'Stopped',
  UserImportJobStatusType.failed: 'Failed',
  UserImportJobStatusType.succeeded: 'Succeeded',
};

UserPoolAddOnsType _$UserPoolAddOnsTypeFromJson(Map<String, dynamic> json) {
  return UserPoolAddOnsType(
    advancedSecurityMode: _$enumDecodeNullable(
        _$AdvancedSecurityModeTypeEnumMap, json['AdvancedSecurityMode']),
  );
}

Map<String, dynamic> _$UserPoolAddOnsTypeToJson(UserPoolAddOnsType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AdvancedSecurityMode',
      _$AdvancedSecurityModeTypeEnumMap[instance.advancedSecurityMode]);
  return val;
}

const _$AdvancedSecurityModeTypeEnumMap = {
  AdvancedSecurityModeType.off: 'OFF',
  AdvancedSecurityModeType.audit: 'AUDIT',
  AdvancedSecurityModeType.enforced: 'ENFORCED',
};

UserPoolClientDescription _$UserPoolClientDescriptionFromJson(
    Map<String, dynamic> json) {
  return UserPoolClientDescription(
    clientId: json['ClientId'] as String,
    clientName: json['ClientName'] as String,
    userPoolId: json['UserPoolId'] as String,
  );
}

UserPoolClientType _$UserPoolClientTypeFromJson(Map<String, dynamic> json) {
  return UserPoolClientType(
    accessTokenValidity: json['AccessTokenValidity'] as int,
    allowedOAuthFlows: (json['AllowedOAuthFlows'] as List)
        ?.map((e) => _$enumDecodeNullable(_$OAuthFlowTypeEnumMap, e))
        ?.toList(),
    allowedOAuthFlowsUserPoolClient:
        json['AllowedOAuthFlowsUserPoolClient'] as bool,
    allowedOAuthScopes:
        (json['AllowedOAuthScopes'] as List)?.map((e) => e as String)?.toList(),
    analyticsConfiguration: json['AnalyticsConfiguration'] == null
        ? null
        : AnalyticsConfigurationType.fromJson(
            json['AnalyticsConfiguration'] as Map<String, dynamic>),
    callbackURLs:
        (json['CallbackURLs'] as List)?.map((e) => e as String)?.toList(),
    clientId: json['ClientId'] as String,
    clientName: json['ClientName'] as String,
    clientSecret: json['ClientSecret'] as String,
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    defaultRedirectURI: json['DefaultRedirectURI'] as String,
    explicitAuthFlows: (json['ExplicitAuthFlows'] as List)
        ?.map((e) => _$enumDecodeNullable(_$ExplicitAuthFlowsTypeEnumMap, e))
        ?.toList(),
    idTokenValidity: json['IdTokenValidity'] as int,
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    logoutURLs: (json['LogoutURLs'] as List)?.map((e) => e as String)?.toList(),
    preventUserExistenceErrors: _$enumDecodeNullable(
        _$PreventUserExistenceErrorTypesEnumMap,
        json['PreventUserExistenceErrors']),
    readAttributes:
        (json['ReadAttributes'] as List)?.map((e) => e as String)?.toList(),
    refreshTokenValidity: json['RefreshTokenValidity'] as int,
    supportedIdentityProviders: (json['SupportedIdentityProviders'] as List)
        ?.map((e) => e as String)
        ?.toList(),
    tokenValidityUnits: json['TokenValidityUnits'] == null
        ? null
        : TokenValidityUnitsType.fromJson(
            json['TokenValidityUnits'] as Map<String, dynamic>),
    userPoolId: json['UserPoolId'] as String,
    writeAttributes:
        (json['WriteAttributes'] as List)?.map((e) => e as String)?.toList(),
  );
}

const _$OAuthFlowTypeEnumMap = {
  OAuthFlowType.code: 'code',
  OAuthFlowType.implicit: 'implicit',
  OAuthFlowType.clientCredentials: 'client_credentials',
};

const _$ExplicitAuthFlowsTypeEnumMap = {
  ExplicitAuthFlowsType.adminNoSrpAuth: 'ADMIN_NO_SRP_AUTH',
  ExplicitAuthFlowsType.customAuthFlowOnly: 'CUSTOM_AUTH_FLOW_ONLY',
  ExplicitAuthFlowsType.userPasswordAuth: 'USER_PASSWORD_AUTH',
  ExplicitAuthFlowsType.allowAdminUserPasswordAuth:
      'ALLOW_ADMIN_USER_PASSWORD_AUTH',
  ExplicitAuthFlowsType.allowCustomAuth: 'ALLOW_CUSTOM_AUTH',
  ExplicitAuthFlowsType.allowUserPasswordAuth: 'ALLOW_USER_PASSWORD_AUTH',
  ExplicitAuthFlowsType.allowUserSrpAuth: 'ALLOW_USER_SRP_AUTH',
  ExplicitAuthFlowsType.allowRefreshTokenAuth: 'ALLOW_REFRESH_TOKEN_AUTH',
};

const _$PreventUserExistenceErrorTypesEnumMap = {
  PreventUserExistenceErrorTypes.legacy: 'LEGACY',
  PreventUserExistenceErrorTypes.enabled: 'ENABLED',
};

UserPoolDescriptionType _$UserPoolDescriptionTypeFromJson(
    Map<String, dynamic> json) {
  return UserPoolDescriptionType(
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    id: json['Id'] as String,
    lambdaConfig: json['LambdaConfig'] == null
        ? null
        : LambdaConfigType.fromJson(
            json['LambdaConfig'] as Map<String, dynamic>),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    name: json['Name'] as String,
    status: _$enumDecodeNullable(_$StatusTypeEnumMap, json['Status']),
  );
}

const _$StatusTypeEnumMap = {
  StatusType.enabled: 'Enabled',
  StatusType.disabled: 'Disabled',
};

UserPoolPolicyType _$UserPoolPolicyTypeFromJson(Map<String, dynamic> json) {
  return UserPoolPolicyType(
    passwordPolicy: json['PasswordPolicy'] == null
        ? null
        : PasswordPolicyType.fromJson(
            json['PasswordPolicy'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserPoolPolicyTypeToJson(UserPoolPolicyType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('PasswordPolicy', instance.passwordPolicy?.toJson());
  return val;
}

UserPoolType _$UserPoolTypeFromJson(Map<String, dynamic> json) {
  return UserPoolType(
    accountRecoverySetting: json['AccountRecoverySetting'] == null
        ? null
        : AccountRecoverySettingType.fromJson(
            json['AccountRecoverySetting'] as Map<String, dynamic>),
    adminCreateUserConfig: json['AdminCreateUserConfig'] == null
        ? null
        : AdminCreateUserConfigType.fromJson(
            json['AdminCreateUserConfig'] as Map<String, dynamic>),
    aliasAttributes: (json['AliasAttributes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$AliasAttributeTypeEnumMap, e))
        ?.toList(),
    arn: json['Arn'] as String,
    autoVerifiedAttributes: (json['AutoVerifiedAttributes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$VerifiedAttributeTypeEnumMap, e))
        ?.toList(),
    creationDate: const UnixDateTimeConverter().fromJson(json['CreationDate']),
    customDomain: json['CustomDomain'] as String,
    deviceConfiguration: json['DeviceConfiguration'] == null
        ? null
        : DeviceConfigurationType.fromJson(
            json['DeviceConfiguration'] as Map<String, dynamic>),
    domain: json['Domain'] as String,
    emailConfiguration: json['EmailConfiguration'] == null
        ? null
        : EmailConfigurationType.fromJson(
            json['EmailConfiguration'] as Map<String, dynamic>),
    emailConfigurationFailure: json['EmailConfigurationFailure'] as String,
    emailVerificationMessage: json['EmailVerificationMessage'] as String,
    emailVerificationSubject: json['EmailVerificationSubject'] as String,
    estimatedNumberOfUsers: json['EstimatedNumberOfUsers'] as int,
    id: json['Id'] as String,
    lambdaConfig: json['LambdaConfig'] == null
        ? null
        : LambdaConfigType.fromJson(
            json['LambdaConfig'] as Map<String, dynamic>),
    lastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['LastModifiedDate']),
    mfaConfiguration: _$enumDecodeNullable(
        _$UserPoolMfaTypeEnumMap, json['MfaConfiguration']),
    name: json['Name'] as String,
    policies: json['Policies'] == null
        ? null
        : UserPoolPolicyType.fromJson(json['Policies'] as Map<String, dynamic>),
    schemaAttributes: (json['SchemaAttributes'] as List)
        ?.map((e) => e == null
            ? null
            : SchemaAttributeType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    smsAuthenticationMessage: json['SmsAuthenticationMessage'] as String,
    smsConfiguration: json['SmsConfiguration'] == null
        ? null
        : SmsConfigurationType.fromJson(
            json['SmsConfiguration'] as Map<String, dynamic>),
    smsConfigurationFailure: json['SmsConfigurationFailure'] as String,
    smsVerificationMessage: json['SmsVerificationMessage'] as String,
    status: _$enumDecodeNullable(_$StatusTypeEnumMap, json['Status']),
    userPoolAddOns: json['UserPoolAddOns'] == null
        ? null
        : UserPoolAddOnsType.fromJson(
            json['UserPoolAddOns'] as Map<String, dynamic>),
    userPoolTags: (json['UserPoolTags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    usernameAttributes: (json['UsernameAttributes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$UsernameAttributeTypeEnumMap, e))
        ?.toList(),
    usernameConfiguration: json['UsernameConfiguration'] == null
        ? null
        : UsernameConfigurationType.fromJson(
            json['UsernameConfiguration'] as Map<String, dynamic>),
    verificationMessageTemplate: json['VerificationMessageTemplate'] == null
        ? null
        : VerificationMessageTemplateType.fromJson(
            json['VerificationMessageTemplate'] as Map<String, dynamic>),
  );
}

const _$AliasAttributeTypeEnumMap = {
  AliasAttributeType.phoneNumber: 'phone_number',
  AliasAttributeType.email: 'email',
  AliasAttributeType.preferredUsername: 'preferred_username',
};

const _$VerifiedAttributeTypeEnumMap = {
  VerifiedAttributeType.phoneNumber: 'phone_number',
  VerifiedAttributeType.email: 'email',
};

const _$UsernameAttributeTypeEnumMap = {
  UsernameAttributeType.phoneNumber: 'phone_number',
  UsernameAttributeType.email: 'email',
};

UserType _$UserTypeFromJson(Map<String, dynamic> json) {
  return UserType(
    attributes: (json['Attributes'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    enabled: json['Enabled'] as bool,
    mFAOptions: (json['MFAOptions'] as List)
        ?.map((e) => e == null
            ? null
            : MFAOptionType.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    userCreateDate:
        const UnixDateTimeConverter().fromJson(json['UserCreateDate']),
    userLastModifiedDate:
        const UnixDateTimeConverter().fromJson(json['UserLastModifiedDate']),
    userStatus:
        _$enumDecodeNullable(_$UserStatusTypeEnumMap, json['UserStatus']),
    username: json['Username'] as String,
  );
}

UsernameConfigurationType _$UsernameConfigurationTypeFromJson(
    Map<String, dynamic> json) {
  return UsernameConfigurationType(
    caseSensitive: json['CaseSensitive'] as bool,
  );
}

Map<String, dynamic> _$UsernameConfigurationTypeToJson(
    UsernameConfigurationType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CaseSensitive', instance.caseSensitive);
  return val;
}

VerificationMessageTemplateType _$VerificationMessageTemplateTypeFromJson(
    Map<String, dynamic> json) {
  return VerificationMessageTemplateType(
    defaultEmailOption: _$enumDecodeNullable(
        _$DefaultEmailOptionTypeEnumMap, json['DefaultEmailOption']),
    emailMessage: json['EmailMessage'] as String,
    emailMessageByLink: json['EmailMessageByLink'] as String,
    emailSubject: json['EmailSubject'] as String,
    emailSubjectByLink: json['EmailSubjectByLink'] as String,
    smsMessage: json['SmsMessage'] as String,
  );
}

Map<String, dynamic> _$VerificationMessageTemplateTypeToJson(
    VerificationMessageTemplateType instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('DefaultEmailOption',
      _$DefaultEmailOptionTypeEnumMap[instance.defaultEmailOption]);
  writeNotNull('EmailMessage', instance.emailMessage);
  writeNotNull('EmailMessageByLink', instance.emailMessageByLink);
  writeNotNull('EmailSubject', instance.emailSubject);
  writeNotNull('EmailSubjectByLink', instance.emailSubjectByLink);
  writeNotNull('SmsMessage', instance.smsMessage);
  return val;
}

const _$DefaultEmailOptionTypeEnumMap = {
  DefaultEmailOptionType.confirmWithLink: 'CONFIRM_WITH_LINK',
  DefaultEmailOptionType.confirmWithCode: 'CONFIRM_WITH_CODE',
};

VerifySoftwareTokenResponse _$VerifySoftwareTokenResponseFromJson(
    Map<String, dynamic> json) {
  return VerifySoftwareTokenResponse(
    session: json['Session'] as String,
    status: _$enumDecodeNullable(
        _$VerifySoftwareTokenResponseTypeEnumMap, json['Status']),
  );
}

const _$VerifySoftwareTokenResponseTypeEnumMap = {
  VerifySoftwareTokenResponseType.success: 'SUCCESS',
  VerifySoftwareTokenResponseType.error: 'ERROR',
};

VerifyUserAttributeResponse _$VerifyUserAttributeResponseFromJson(
    Map<String, dynamic> json) {
  return VerifyUserAttributeResponse();
}
